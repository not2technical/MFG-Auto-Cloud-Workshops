import { LightningElement, track } from 'lwc';
import getAllWorkshops from '@salesforce/apex/WorkshopController.getAllWorkshops';
import getAllWorkshopsWithProgress from '@salesforce/apex/WorkshopController.getAllWorkshopsWithProgress';
import getStepsAndProgress from '@salesforce/apex/WorkshopController.getStepsAndProgress';
import getFreshStepsAndProgress from '@salesforce/apex/WorkshopController.getFreshStepsAndProgress';
import startWorkshop from '@salesforce/apex/WorkshopController.startWorkshop';
import resetWorkshop from '@salesforce/apex/WorkshopController.resetWorkshop';
import markStepComplete from '@salesforce/apex/WorkshopController.markStepComplete';
import deleteWorkshopProgress from '@salesforce/apex/WorkshopController.deleteWorkshopProgress';
import getAssignedInterestTags from '@salesforce/apex/WorkshopController.getAssignedInterestTags';
import getAssignedInterestTagsWithNamedCredential from '@salesforce/apex/WorkshopController.getAssignedInterestTagsWithNamedCredential';
import getAssignedInterestTagsWithDynamicOrg from '@salesforce/apex/WorkshopController.getAssignedInterestTagsWithDynamicOrg';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
import { refreshApex } from '@salesforce/apex';

const PAGE_SIZE = 10;

export default class WorkshopApp extends NavigationMixin(LightningElement) {
    @track workshops = [];
    @track workshopOptions = [];
    @track selectedWorkshopId = '';
    @track steps = [];
    @track progress = 0;
    @track paginatedSteps = [];
    @track currentPage = 1;
    @track showStartButton = true;
    @track showRestartModal = false;
    @track savedSteps = [];
    @track openSections = [];
    @track isModalOpen = false;
    @track zoomedImgSrc = '';
    @track assignedInterestTags = [];
    @track isLoading = false;
    @track isDescriptionExpanded = false;

    pageSize = PAGE_SIZE;
    isAdmin = true;

    // Cache references for refreshApex
    _workshopsResult;
    _stepsResult;
    _interestTagsResult;

    get totalPages() { return Math.ceil(this.steps.length / this.pageSize); }
    get isFirstPage() { return this.currentPage === 1; }
    get isLastPage() { return this.currentPage === this.totalPages; }

    get selectedWorkshopDescription() {
        const selected = this.workshops.find(ws => ws.Id === this.selectedWorkshopId);
        return selected ? selected.Description : '';
    }

    get selectedWorkshopAudience() {
        const selected = this.workshops.find(ws => ws.Id === this.selectedWorkshopId);
        return selected ? selected.Audience : '';
    }

    get selectedWorkshopStarRating() {
        const selected = this.workshops.find(ws => ws.Id === this.selectedWorkshopId);
        return selected ? selected.StarRating : '';
    }

    get selectedWorkshopTechnicalRating() {
        const selected = this.workshops.find(ws => ws.Id === this.selectedWorkshopId);
        return selected ? selected.TechnicalRating : '';
    }

    get selectedWorkshopDuration() {
        const selected = this.workshops.find(ws => ws.Id === this.selectedWorkshopId);
        return selected ? selected.Duration : '';
    }

    get selectedWorkshopImageUrl() {
        const selected = this.workshops.find(ws => ws.Id === this.selectedWorkshopId);
        return selected ? selected.ImageUrl : '';
    }

    get selectedWorkshopIndustryFeatures() {
        console.log('🔍 Getting assigned Interest Tags for selected workshop');
        console.log('🔍 Selected Workshop ID:', this.selectedWorkshopId);
        console.log('🔍 Assigned tags:', this.assignedInterestTags);
        console.log('🔍 Assigned tags length:', this.assignedInterestTags.length);
        
        // If we have assigned Interest Tags, return them
        if (this.assignedInterestTags && this.assignedInterestTags.length > 0) {
            console.log('✅ Returning assigned Interest Tags');
            
            // Debug: log each tag to see its structure
            this.assignedInterestTags.forEach((tag, index) => {
                console.log(`🏷️ Tag ${index + 1}:`, JSON.stringify(tag, null, 2));
            });
            
            const tagNames = this.assignedInterestTags.map(tag => tag.name).filter(name => name);
            console.log('🔍 Tag names being returned:', tagNames);
            console.log('🔍 Tag names array length:', tagNames.length);
            
            // Force reactivity by breaking proxy chain
            const reactiveTagNames = [...tagNames];
            console.log('🔄 Reactive tag names:', reactiveTagNames);
            
            return reactiveTagNames;
        }
        
        // Fallback: return empty array (don't show raw field values)
        console.log('⚠️ No assigned Interest Tags found, returning empty array');
        return [];
    }

    /**
     * Dynamic CSS class for description container
     */
    get workshopDescriptionContainerClass() {
        return `workshop-description-container ${this.isDescriptionExpanded ? 'expanded' : 'collapsed'}`;
    }

    /**
     * Dynamic label for read more/less button
     */
    get readMoreButtonLabel() {
        return this.isDescriptionExpanded ? 'Read Less' : 'Read More';
    }

    /**
     * Dynamic icon for read more/less button
     */
    get readMoreIconName() {
        return this.isDescriptionExpanded ? 'utility:chevronup' : 'utility:chevrondown';
    }

    async connectedCallback() {
        await this.forceRefreshAllData();
    }

    /**
     * Force complete refresh of all data from server (clears all caches)
     */
    async forceRefreshAllData() {
        console.log('🔄 Force refreshing all workshop data from server...');
        this.isLoading = true;
        
        try {
            // Clear existing cache references
            this._workshopsResult = null;
            this._stepsResult = null;
            this._interestTagsResult = null;
            
            // Reset all local state
            this.workshops = [];
            this.workshopOptions = [];
            this.steps = [];
            this.savedSteps = [];
            this.paginatedSteps = [];
            this.assignedInterestTags = [];
            this.progress = 0;
            this.currentPage = 1;
            this.openSections = [];
            this.isDescriptionExpanded = false; // Reset description expansion state
            
            // Force fresh workshop data from server with accurate badge counts
            await this.loadWorkshopsWithProgressFromServer();
            
        } catch (error) {
            console.error('❌ Error during force refresh:', error);
            this.showErrorToast('Failed to refresh workshop data. Please reload the page.');
        } finally {
            this.isLoading = false;
        }
    }

    /**
     * Load workshops with progress counts from server (most efficient method)
     */
    async loadWorkshopsWithProgressFromServer() {
        try {
            console.log('🔄 Loading workshops with progress from server...');
            
            // Get fresh workshop data with accurate progress counts
            const data = await getAllWorkshopsWithProgress();
            console.log('🔍 Raw workshop data with progress from server:', JSON.stringify(data, null, 2));
            
            if (!data || !Array.isArray(data) || data.length === 0) {
                console.warn('⚠️ No workshops found');
                this.workshops = [];
                this.workshopOptions = [];
                this.selectedWorkshopId = '';
                this.showStartButton = true;
                return;
            }

            // Map workshops with accurate progress counts
            this.workshops = data.map(ws => ({
                Id: ws.Id,
                Name: ws.Name,
                StepCount: ws.StepCount,
                Description: ws.Description,
                Audience: ws.Audience,
                StarRating: ws.StarRating,
                TechnicalRating: ws.TechnicalRating,
                Duration: ws.Duration,
                ImageUrl: ws.ImageUrl,
                IndustryFeatures: ws.IndustryFeatures,
                displayLabel: `${ws.Name} (${ws.StepCount} Steps)`,
                UserProgressCount: ws.UserProgressCount || 0 // This now comes from server!
            }));

            console.log('✅ Mapped workshops with progress:', JSON.stringify(this.workshops, null, 2));

            this.workshopOptions = this.workshops.map(ws => ({ 
                label: ws.Name, 
                value: ws.Id 
            }));

            // Select first workshop if available
            const first = this.workshops[0];
            if (first && first.Id) {
                this.selectedWorkshopId = first.Id;
                await this.loadStepsFromServer();
                await this.loadAssignedInterestTagsFromServer();
            } else {
                console.warn('⚠️ First workshop is missing Id');
                this.selectedWorkshopId = '';
                this.showStartButton = true;
            }

        } catch (error) {
            console.error('❌ Error loading workshops with progress from server:', error);
            this.workshops = [];
            this.workshopOptions = [];
            this.selectedWorkshopId = '';
            this.showStartButton = true;
            throw error;
        }
    }

    /**
     * Refresh badge counts for all workshops (called after progress changes)
     */
    async refreshAllWorkshopBadges() {
        try {
            console.log('🔄 Refreshing badge counts for all workshops...');
            
            // Get fresh progress data for all workshops
            const freshWorkshopData = await getAllWorkshopsWithProgress();
            
            // Update only the UserProgressCount for each workshop
            this.workshops = this.workshops.map(existingWs => {
                const freshWs = freshWorkshopData.find(fw => fw.Id === existingWs.Id);
                return {
                    ...existingWs,
                    UserProgressCount: freshWs ? (freshWs.UserProgressCount || 0) : 0
                };
            });
            
            console.log('✅ Badge counts refreshed for all workshops');
            
        } catch (error) {
            console.error('❌ Error refreshing workshop badges:', error);
        }
    }

    /**
     * Load workshops with forced server refresh (legacy method - now uses new method)
     */
    async loadWorkshopsFromServer() {
        return this.loadWorkshopsWithProgressFromServer();
    }

    /**
     * Load steps with forced server refresh  
     */
    async loadStepsFromServer() {
        if (!this.selectedWorkshopId) {
            console.warn('⏭️ Skipping loadStepsFromServer because selectedWorkshopId is empty.');
            return;
        }

        try {
            console.log('🔄 Loading steps from server (bypassing cache) for workshop:', this.selectedWorkshopId);
            
            // Use non-cached method to get fresh data
            const result = await getFreshStepsAndProgress({ workshopId: this.selectedWorkshopId });
            const steps = Array.isArray(result) ? result : [];
            console.log('✅ Fresh steps loaded from server:', steps);

            // Calculate progress counts
            const selectedWs = this.workshops.find(ws => ws.Id === this.selectedWorkshopId);
            const totalSteps = selectedWs ? selectedWs.StepCount : 0;
            const userProgressSteps = steps.filter(s => s.progress).length;

            console.log(`🧮 Total steps: ${totalSteps}, UserProgressCount: ${userProgressSteps}`);

            // Update step data
            this.steps = steps;
            this.sortSteps();
            this.savedSteps = JSON.parse(JSON.stringify(this.steps));

            // Update badge count for selected workshop only
            this.workshops = this.workshops.map(ws =>
                ws.Id === this.selectedWorkshopId
                    ? { ...ws, UserProgressCount: userProgressSteps }
                    : ws
            );

            // Set start button visibility based on progress
            const hasProgress = steps.some(s => s.progress !== undefined);
            this.showStartButton = !hasProgress;

            if (!this.showStartButton) {
                this.paginate();
                this.refreshProgress();
            } else {
                this.paginatedSteps = [];
            }

        } catch (error) {
            console.error('❌ Error loading steps from server:', error);
            this.steps = [];
            this.savedSteps = [];
            this.paginatedSteps = [];
            this.showStartButton = true;
            throw error;
        }
    }

    /**
     * Load assigned interest tags with forced server refresh
     */
    async loadAssignedInterestTagsFromServer() {
        if (!this.selectedWorkshopId) {
            console.warn('⚠️ No workshop selected, skipping assigned tags loading');
            this.assignedInterestTags = [];
            return;
        }

        try {
            console.log('📊 Loading assigned Interest Tags from server for workshop:', this.selectedWorkshopId);
            
            // Try multiple methods to get fresh data
            let assignedTags = null;
            
            // Method 1: Original method
            try {
                assignedTags = await getAssignedInterestTags({ workshopId: this.selectedWorkshopId });
                if (assignedTags && assignedTags.length > 0) {
                    console.log('✅ Got tags from original method');
                    this.assignedInterestTags = [...assignedTags];
                    return;
                }
            } catch (error) {
                console.log('⚠️ Original method failed, trying alternatives...');
            }
            
            // Method 2: Dynamic method
            try {
                assignedTags = await getAssignedInterestTagsWithDynamicOrg({ workshopId: this.selectedWorkshopId });
                if (assignedTags && assignedTags.length > 0) {
                    console.log('✅ Got tags from Dynamic method');
                    this.assignedInterestTags = [...assignedTags];
                    return;
                }
            } catch (error) {
                console.log('⚠️ Dynamic method failed, trying final alternative...');
            }
            
            // Method 3: Named Credential method
            try {
                assignedTags = await getAssignedInterestTagsWithNamedCredential({ workshopId: this.selectedWorkshopId });
                if (assignedTags && assignedTags.length > 0) {
                    console.log('✅ Got tags from Named Credential method');
                    this.assignedInterestTags = [...assignedTags];
                    return;
                }
            } catch (error) {
                console.log('⚠️ All methods failed');
            }
            
            // All methods failed
            console.log('⚠️ All methods returned empty - no tags found');
            this.assignedInterestTags = [];
            
        } catch (error) {
            console.error('❌ Error loading assigned Interest Tags from server:', error);
            this.assignedInterestTags = [];
        }
    }

    sortSteps() {
        this.steps = [...this.steps].sort((a, b) => (a.Step_Order__c || 0) - (b.Step_Order__c || 0));
    }

    async handleWorkshopSelect(event) {
        const workshopId = event.detail.name;
        this.selectedWorkshopId = workshopId;
        this.currentPage = 1;
        
        // Reset description expansion state when switching workshops
        this.isDescriptionExpanded = false;
        
        // Force refresh for selected workshop
        await this.loadStepsFromServer();
        await this.loadAssignedInterestTagsFromServer();
    }

    // Legacy method - now calls server version
    loadSteps() {
        return this.loadStepsFromServer();
    }

    // Legacy method - now calls server version  
    loadAssignedInterestTags() {
        return this.loadAssignedInterestTagsFromServer();
    }

    /**
     * Toggle workshop description expansion state
     */
    handleToggleDescription() {
        this.isDescriptionExpanded = !this.isDescriptionExpanded;
    }

    async handleStartWorkshop() {
        if (this.steps && this.steps.some(s => s.isComplete !== undefined)) {
            this.showRestartModal = true;
            return;
        }

        try {
            this.isLoading = true;
            console.log('🚀 Starting workshop...');
            
            await startWorkshop({ workshopId: this.selectedWorkshopId });
            console.log('✅ Workshop started, forcing complete data refresh...');

            // Force complete refresh from server after starting
            await this.forceRefreshWorkshopData();
            
            // Also refresh all badges to keep them in sync
            await this.refreshAllWorkshopBadges();
            
            this.showSuccessToast('Workshop Started', 'Your workshop has been started successfully!');
            
        } catch (error) {
            console.error('❌ Error starting workshop:', error);
            this.showErrorToast('Failed to start workshop. Please try again.');
        } finally {
            this.isLoading = false;
        }
    }

    async handleRestartConfirm() {
        try {
            this.isLoading = true;
            console.log('🔄 Restarting workshop...');
            
            await resetWorkshop({ workshopId: this.selectedWorkshopId });
            console.log('✅ Workshop reset, forcing complete data refresh...');
            
            // Force complete refresh from server after reset
            await this.forceRefreshWorkshopData();
            
            // Also refresh all badges to keep them in sync
            await this.refreshAllWorkshopBadges();
            
            this.showRestartModal = false;
            this.showSuccessToast('Workshop Restarted', 'Your workshop has been restarted successfully!');
            
        } catch (error) {
            console.error('❌ Error restarting workshop:', error);
            this.showErrorToast('Failed to restart workshop. Please try again.');
        } finally {
            this.isLoading = false;
        }
    }

    handleRestartCancel() {
        this.showRestartModal = false;
    }

    /**
     * Force refresh workshop-specific data (steps and tags)
     */
    async forceRefreshWorkshopData() {
        console.log('🔄 Force refreshing workshop-specific data...');
        
        // Clear workshop-specific cache references
        this._stepsResult = null;
        this._interestTagsResult = null;
        
        // Reset workshop-specific state
        this.steps = [];
        this.savedSteps = [];
        this.paginatedSteps = [];
        this.assignedInterestTags = [];
        this.progress = 0;
        this.currentPage = 1;
        this.openSections = [];
        this.showStartButton = true;
        
        // Load fresh data from server
        await this.loadStepsFromServer();
        await this.loadAssignedInterestTagsFromServer();
    }

    // compute first incomplete step index + 1 (path steps are 1-based)
    get currentPathStep() {
        if (this.savedSteps.length > 0 && this.savedSteps.every(s => s.progress === true || s.isComplete === true)) {
            return this.steps.length - 1; // last step index
        }
        const completed = this.savedSteps.filter(s => s.progress === true || s.isComplete === true).length;
        return completed;
    }

    get allStepsComplete() {
        return this.savedSteps.length > 0 && this.savedSteps.every(s => s.progress === true || s.isComplete === true);
    }

    refreshProgress() {
        const completed = this.steps.filter(s => s.progress).length;
        this.progress = Math.floor((completed / this.steps.length) * 100);
    }

    paginate() {
        const start = (this.currentPage - 1) * this.pageSize;
        const end = start + this.pageSize;
        this.paginatedSteps = this.steps.slice(start, end);
    }

    handlePrev() { 
        if (this.currentPage > 1) { 
            this.currentPage--; 
            this.paginate(); 
        } 
    }
    
    handleNext() { 
        if (this.currentPage < this.totalPages) { 
            this.currentPage++; 
            this.paginate(); 
        } 
    }

    handleStepComplete(event) {
        const { stepId, isChecked } = event.detail;
        console.log(`handleStepComplete fired: step ${stepId}, checked ${isChecked}`);
        // Directly update local steps
        this.steps = this.steps.map(s =>
            s.Id === stepId ? { ...s, progress: isChecked } : s
        );
    }

    async handleSaveProgress() {
        try {
            this.isLoading = true;
            console.log('💾 Saving progress...');
            
            const promises = this.steps.map(s => 
                markStepComplete({ stepId: s.Id, isComplete: s.progress === true })
            );

            await Promise.all(promises);
            console.log('✅ Progress saved, forcing data refresh...');

            // Force refresh from server after save
            await this.forceRefreshWorkshopData();
            
            // CRITICAL: Refresh ALL workshop badges to prevent reset on tab navigation
            await this.refreshAllWorkshopBadges();

            this.showSuccessToast('Progress Saved', 'Your progress has been saved successfully!');
            
        } catch (error) {
            console.error('❌ Error saving progress:', error);
            this.showErrorToast('Failed to save progress. Please try again.');
        } finally {
            this.isLoading = false;
        }
    }

    async handleDeleteProgress() {
        if (!this.selectedWorkshopId) {
            console.warn('⚠️ No workshop selected, skipping delete progress.');
            return;
        }

        try {
            this.isLoading = true;
            console.log('🗑️ Deleting workshop progress...');
            
            await deleteWorkshopProgress({ workshopId: this.selectedWorkshopId });
            console.log('✅ Progress deleted, forcing complete data refresh...');
            
            // Force complete refresh from server after delete
            await this.forceRefreshWorkshopData();
            
            // CRITICAL: Refresh ALL workshop badges to prevent reset on tab navigation
            await this.refreshAllWorkshopBadges();
            
            this.showSuccessToast('Progress Deleted', 'Your workshop progress has been deleted. You can now start fresh.');
            
        } catch (error) {
            console.error('❌ Error deleting progress:', error);
            this.showErrorToast('Failed to delete workshop progress. Please try again.');
        } finally {
            this.isLoading = false;
        }
    }

    handleExpandAll() {
        this.openSections = this.paginatedSteps.map(step => step.Id);
    }
    
    handleCollapseAll() {
        this.openSections = [];
    }

    handleZoomImage(event) {
        this.zoomedImgSrc = event.detail.src;
        this.isModalOpen = true;
    }
    
    closeModal() {
        this.isModalOpen = false;
        this.zoomedImgSrc = '';
    }

    handleTagClick(event) {
        const tagName = event.target.textContent;
        
        console.log('🔗 Tag clicked:', tagName);
        console.log('🔗 Looking for tagId in assigned tags...');
        console.log('🔗 Available assigned tags:', this.assignedInterestTags);
        
        // Find the tag in assignedInterestTags by name
        const foundTag = this.assignedInterestTags.find(tag => tag.name === tagName);
        const tagId = foundTag ? foundTag.tagId : null;
        
        console.log('🔗 Found tag:', foundTag);
        console.log('🔗 Tag ID:', tagId);
        
        if (tagId) {
            console.log('✅ Found matching Interest Tag ID:', tagId);
            
            // Navigate to the Interest Tag record view
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: tagId,
                    objectApiName: 'InterestTag',
                    actionName: 'view'
                }
            }).then(() => {
                console.log('✅ Successfully navigated to InterestTag:', tagId);
            }).catch(error => {
                console.error('❌ Navigation error:', error);
                // Fallback: try direct URL navigation
                const baseUrl = window.location.origin;
                const interestTagUrl = `${baseUrl}/lightning/r/InterestTag/${tagId}/view`;
                console.log('🔗 Trying fallback URL:', interestTagUrl);
                window.open(interestTagUrl, '_blank');
            });
            
            // Show success toast
            this.showSuccessToast('Opening Interest Tag', `"${tagName}" - ID: ${tagId}`);
        } else {
            console.warn('❌ No matching Interest Tag ID found for:', tagName);
            this.showWarningToast('Interest Tag Not Found', `"${tagName}" - No matching Interest Tag ID found in assigned tags`);
        }
    }

    // Utility methods for toast notifications following SLDS2 standards
    showSuccessToast(title, message) {
        this.dispatchEvent(new ShowToastEvent({
            title: title,
            message: message,
            variant: 'success'
        }));
    }

    showErrorToast(message, title = 'Error') {
        this.dispatchEvent(new ShowToastEvent({
            title: title,
            message: message,
            variant: 'error'
        }));
    }

    showWarningToast(title, message) {
        this.dispatchEvent(new ShowToastEvent({
            title: title,
            message: message,
            variant: 'warning'
        }));
    }
}