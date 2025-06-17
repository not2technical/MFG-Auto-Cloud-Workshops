import { LightningElement, api } from 'lwc';

export default class StepList extends LightningElement {
    @api steps = [];
    @api isAdmin;

    get groupedSteps() {
        const groups = {};
        this.steps.forEach(step => {
            const group = step.Step_Group__c || 'Ungrouped';
            if (!groups[group]) groups[group] = [];
            groups[group].push(step);
        });
        return Object.keys(groups).map(name => ({ groupName: name, steps: groups[name] }));
    }

    handleStepComplete(event) {
        // forward the child event up unchanged
        this.dispatchEvent(new CustomEvent('stepcomplete', { detail: event.detail }));
    }
}