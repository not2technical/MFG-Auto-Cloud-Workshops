import { LightningElement, api, track } from 'lwc';
import markStepComplete from '@salesforce/apex/WorkshopController.markStepComplete';
import updateImageUrl from '@salesforce/apex/WorkshopController.updateImageUrl';

export default class StepDetail extends LightningElement {
    @api step;
    @api isAdmin;
   
    @track showModal = false;
    @track newImageUrl;
    @track isModalOpen = false;
    @track zoomedImgSrc = '';

    get isComplete() {
        const value = this.step?.progress === true;
        console.log(`isComplete getter for step ${this.step?.Id}:`, value);
        return value;
    }

    handleCheckboxChange(event) {
        const stepId = this.step.Id;
        const isChecked = event.target.checked;
        console.log('Checkbox toggled:', stepId, isChecked);
        this.dispatchEvent(new CustomEvent('stepcomplete', {
            detail: { stepId, isChecked },
            bubbles: true,
            composed: true
        }));
    }

    handleEditImageClick() {
        this.newImageUrl = this.step.Image_URL__c;
        this.showModal = true;
    }

    handleUrlChange(event) {
        this.newImageUrl = event.target.value;
    }

    handleModalCancel() {
        this.showModal = false;
    }

    handleModalSave() {
        updateImageUrl({ stepId: this.step.Id, newUrl: this.newImageUrl })
            .then(() => {
                this.step.Image_URL__c = this.newImageUrl;
                this.showModal = false;
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }

    handleRichTextClick(event) {
        console.log('Rich text clicked:', event.target);
        if (event.target.tagName === 'IMG') {
            console.log('Image clicked. Classes:', event.target.className);
        }
        if (event.target.tagName === 'IMG' && event.target.classList.contains('zoomable')) {
            console.log('Zoomable image clicked. Dispatching zoomimage event for src:', event.target.src);
            this.dispatchEvent(new CustomEvent('zoomimage', {
                detail: { src: event.target.src },
                bubbles: true,
                composed: true
            }));
        }
    }

    closeModal() {
        this.isModalOpen = false;
        this.zoomedImgSrc = '';
    }

    renderedCallback() {
        const instructionsDiv = this.template.querySelector('.instructions-container');
        if (instructionsDiv && this.step?.Instructions__c) {
            instructionsDiv.innerHTML = this.step.Instructions__c;
        }
    }
}