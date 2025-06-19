import { LightningElement, track } from 'lwc';
import getAllWorkshops from '@salesforce/apex/WorkshopController.getAllWorkshops';
import getStepsAndProgress from '@salesforce/apex/WorkshopController.getStepsAndProgress';
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
    pageSize = PAGE_SIZE;
    isAdmin = true;

    get totalPages() { return Math.ceil(this.steps.length / this.pageSize); }
    get isFirstPage() { return this.currentPage === 1; }
    get isLastPage() { return this.currentPage === this.totalPages; }

    connectedCallback() {
    getAllWorkshops().then(data => {
        if (!data || !Array.isArray(data) || data.length === 0) {
            this.workshops = [];
            this.workshopOptions = [];
            this.steps = [];
            this.paginatedSteps = [];
            this.showStartButton = true;
            return;
        }

        // ✅ NEW: safely inject StepCount = 0 for each
        this.workshops = data.map(ws => ({
            Id: ws.Id,
            Name: ws.Name,
            StepCount: ws.StepCount,
            displayLabel: `${ws.Name} (${ws.StepCount} Steps)`
        }));
         console.log('✅ Mapped workshops with StepCount:', JSON.stringify(this.workshops));
        this.workshopOptions = this.workshops.map(ws => ({ label: ws.Name, value: ws.Id }));
        this.selectedWorkshopId = this.workshops[0].Id;
        this.loadSteps();
    }).catch(error => {
        console.error('Error loading workshops:', error);
        this.workshops = [];
        this.workshopOptions = [];
        this.steps = [];
        this.paginatedSteps = [];
        this.showStartButton = true;
    });
}


    sortSteps() {
    this.steps = [...this.steps].sort((a, b) => (a.Step_Order__c || 0) - (b.Step_Order__c || 0));
}

   handleWorkshopSelect(event) {
    const workshopId = event.detail.name;
    this.selectedWorkshopId = workshopId;
    this.currentPage = 1;
    this.loadSteps();
}

loadSteps() {
    console.log('Calling loadSteps for workshop:', this.selectedWorkshopId);
    getStepsAndProgress({ workshopId: this.selectedWorkshopId }).then(result => {
        console.log('Raw result:', result);

        const steps = result && Array.isArray(result) ? result : [];
        console.log('Safe steps:', steps);

        this.steps = steps;
        this.sortSteps();
        // ✅ Update the StepCount for this workshop
this.workshops = this.workshops.map(ws => 
    ws.Id === this.selectedWorkshopId 
        ? { ...ws, StepCount: steps.length }
        : ws
);
        this.showStartButton = steps.length === 0;

        if (!this.showStartButton) {
            this.paginate();
            this.refreshProgress();
        } else {
            this.paginatedSteps = [];
        }

    }).catch(error => {
        console.error('Error loading steps:', error);
        this.steps = [];
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
            this.showStartButton = false;
            this.loadSteps();
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

    refreshProgress() {
        const completed = this.steps.filter(s => s.isComplete).length;
        this.progress = Math.floor((completed / this.steps.length) * 100);
    }

    paginate() {
        const start = (this.currentPage - 1) * this.pageSize;
        const end = start + this.pageSize;
        this.paginatedSteps = this.steps.slice(start, end);
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

    // Instead of querySelector for parent, listen for explicit child detail
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
            this.loadSteps();
        })
        .catch(error => {
            console.error('Error saving progress:', error);
        });
}



}