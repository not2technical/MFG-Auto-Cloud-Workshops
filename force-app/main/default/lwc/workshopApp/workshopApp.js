import { LightningElement, track } from 'lwc';
import getAllWorkshops from '@salesforce/apex/WorkshopController.getAllWorkshops';
import getStepsAndProgress from '@salesforce/apex/WorkshopController.getStepsAndProgress';
import getFreshStepsAndProgress from '@salesforce/apex/WorkshopController.getFreshStepsAndProgress';
import startWorkshop from '@salesforce/apex/WorkshopController.startWorkshop';
import resetWorkshop from '@salesforce/apex/WorkshopController.resetWorkshop';
import markStepComplete from '@salesforce/apex/WorkshopController.markStepComplete';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


const PAGE_SIZE = 5;

export default class WorkshopApp extends LightningElement {
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
    @track isNavCollapsed = false;

    pageSize = PAGE_SIZE;
    isAdmin = true;

    get totalPages() { return Math.ceil(this.steps.length / this.pageSize); }
    get isFirstPage() { return this.currentPage === 1; }
    get isLastPage() { return this.currentPage === this.totalPages; }
    get rightPanelClass() {
        return `slds-p-around_medium slds-box slds-theme_default ${this.isNavCollapsed ? 'slds-size_1-of-1' : 'slds-size_3-of-4'}`;
    }

   connectedCallback() {
    getAllWorkshops().then(data => {
        if (!data || !Array.isArray(data) || data.length === 0) {
            // No workshops found — clear everything safely
            this.workshops = [];
            this.workshopOptions = [];
            this.steps = [];
            this.paginatedSteps = [];
            this.selectedWorkshopId = '';
            this.selectedWorkshopDescription = '';
            this.showStartButton = true;
            return;
        }

        // ✅ Map workshops safely
        this.workshops = data.map(ws => ({
            Id: ws.Id,
            Name: ws.Name,
            StepCount: ws.StepCount,
            Description: ws.Description,
            displayLabel: `${ws.Name} (${ws.StepCount} Steps)`,
            UserProgressCount: 0
        }));

        console.log('✅ Mapped workshops:', JSON.stringify(this.workshops));

        this.workshopOptions = this.workshops.map(ws => ({ label: ws.Name, value: ws.Id }));

        // ✅ Pick first workshop ONLY IF valid
        const first = this.workshops[0];
        if (first && first.Id) {
            this.selectedWorkshopId = first.Id;
            this.selectedWorkshopDescription = first.Description;
            this.loadSteps();
        } else {
            console.warn('⚠️ First workshop is missing Id — skipping loadSteps.');
            this.selectedWorkshopId = '';
            this.selectedWorkshopDescription = '';
            this.showStartButton = true;
        }

    }).catch(error => {
        console.error('❌ Error loading workshops:', error);
        this.workshops = [];
        this.workshopOptions = [];
        this.steps = [];
        this.paginatedSteps = [];
        this.selectedWorkshopId = '';
        this.selectedWorkshopDescription = '';
        this.showStartButton = true;
    });
}



    sortSteps() {
    this.steps = [...this.steps].sort((a, b) => (a.Step_Order__c || 0) - (b.Step_Order__c || 0));
}

   handleWorkshopSelect(event) {
    const workshopId = event.detail.name;
    this.selectedWorkshopId = workshopId;
     const selected = this.workshops.find(ws => ws.Id === workshopId);
    this.selectedWorkshopDescription = selected ? selected.Description : '';
    this.currentPage = 1;
    this.loadSteps();
}

loadSteps() {
    console.log('🔄 Calling loadSteps for workshop:', this.selectedWorkshopId);
  if (!this.selectedWorkshopId) {
        console.warn('⏭️ Skipping loadSteps because selectedWorkshopId is empty.');
        return; // 🚫 Prevent Apex call with bad Id
    }
    getStepsAndProgress({ workshopId: this.selectedWorkshopId })
        .then(result => {
            const steps = Array.isArray(result) ? result : [];
            console.log('✅ Steps loaded:', steps);

            // Total steps is static
            const selectedWs = this.workshops.find(ws => ws.Id === this.selectedWorkshopId);
            const totalSteps = selectedWs ? selectedWs.StepCount : 0;

            // User progress steps (progress rows)
            const userProgressSteps = steps.filter(s => s.progress).length;

            console.log(`🧮 Total steps: ${totalSteps}, UserProgressCount: ${userProgressSteps}`);

            // Store fresh steps
            this.steps = steps;
            this.sortSteps();
            this.savedSteps = JSON.parse(JSON.stringify(this.steps));

            // ✅ Update workshop nav bar counts for this workshop
            this.workshops = this.workshops.map(ws =>
                ws.Id === this.selectedWorkshopId
                    ? { ...ws, UserProgressCount: userProgressSteps }
                    : ws
            );

            // ✅ Set Start button based on actual user progress count
             const hasProgress = steps.some(s => s.progress !== undefined);
        this.showStartButton = !hasProgress;

            if (!this.showStartButton) {
                this.paginate();
                this.refreshProgress();
            } else {
                this.paginatedSteps = [];
            }
        })
        .catch(error => {
            console.error('❌ Error loading steps:', error);
            this.steps = [];
            this.savedSteps = [];
            this.paginatedSteps = [];
            this.showStartButton = true;
        });
}



    handleStartWorkshop() {
    if (this.steps && this.steps.some(s => s.isComplete !== undefined)) {
        this.showRestartModal = true;
        return;
    }

    startWorkshop({ workshopId: this.selectedWorkshopId }).then(() => {
        console.log('✅ Workshop started, now force re-load from server');

        // Use NON-CACHE version
        getFreshStepsAndProgress({ workshopId: this.selectedWorkshopId }).then(result => {
            this.steps = result;
            this.sortSteps();
            this.savedSteps = JSON.parse(JSON.stringify(this.steps));
            this.showStartButton = false;

            // Refresh nav counts too
            this.workshops = this.workshops.map(ws =>
                ws.Id === this.selectedWorkshopId
                    ? { ...ws, UserProgressCount: 0 }
                    : ws
            );

            this.paginate();
            this.refreshProgress();
        });

    }).catch(error => {
        console.error('Error starting workshop:', error);
    });
}


    handleRestartConfirm() {
        resetWorkshop({ workshopId: this.selectedWorkshopId }).then(() => {
            this.steps = this.steps.map(s => ({ ...s, isComplete: false }));
            this.showRestartModal = false;
            this.showStartButton = false;
            this.paginate();
            this.refreshProgress();
        });
    }

    handleRestartCancel() {
        this.showRestartModal = false;
    }
// compute first incomplete step index + 1 (path steps are 1-based)
get currentPathStep() {
  const completed = this.savedSteps.filter(s => s.progress).length;
    return completed;
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

    toggleNav() {
        this.isNavCollapsed = !this.isNavCollapsed;
    }

    handlePrev() { if (this.currentPage > 1) { this.currentPage--; this.paginate(); } }
    handleNext() { if (this.currentPage < this.totalPages) { this.currentPage++; this.paginate(); } }

 handleStepComplete(event) {
    const { stepId, isChecked } = event.detail;
    console.log(`handleStepComplete fired: step ${stepId}, checked ${isChecked}`);
    // Directly update local steps
    this.steps = this.steps.map(s =>
        s.Id === stepId ? { ...s, progress: isChecked } : s
    );
}
handleSaveProgress() {
    const promises = [];

    this.steps.forEach(s => {
        console.log(`Preparing to save step ${s.Id} with progress ${s.progress}`);
        promises.push(markStepComplete({ stepId: s.Id, isComplete: s.progress === true }));
    });

    Promise.all(promises)
        .then(() => {
            console.log('All steps saved');
            this.dispatchEvent(new ShowToastEvent({
                title: 'Success',
                message: 'Your progress has been saved.',
                variant: 'success'
            }));
            // Safe reload to re-pull server truth
            this.savedSteps = JSON.parse(JSON.stringify(this.steps));

            // Also refresh progress using savedSteps for Path:
            this.refreshProgress();
        })
        .catch(error => {
            console.error('Error saving progress:', error);
        });
}



}