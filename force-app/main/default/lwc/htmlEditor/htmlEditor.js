import { LightningElement, api, track, wire } from 'lwc';
import { getRecord, updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import { loadScript } from 'lightning/platformResourceLoader';

// Monaco Editor from CDN
const MONACO_EDITOR_URL = 'https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.44.0/min/vs/loader.min.js';

export default class HtmlEditor extends LightningElement {
    @api recordId;
    @api objectApiName;
    @api fieldApiName = 'Description__c'; // Default field name
    @api editorHeight = '400px';
    @api showPreview = false;
    @api showCharacterCount = false;

    @track htmlContent = '';
    @track isLoading = false;
    @track isEditorReady = false;
    @track characterCount = 0;
    @track showPreviewPane = true;
    @track editorError = '';

    // Constants
    MAX_CHARACTERS = 32000; // Leave some buffer for HTML formatting
    
    // Editor and record data
    monacoEditor = null;
    wiredRecordResult;

    get recordFields() {
        return [this.objectApiName + '.Id', this.objectApiName + '.' + this.fieldApiName];
    }

    get isOverLimit() {
        return this.characterCount > this.MAX_CHARACTERS;
    }

    get characterCountClass() {
        if (this.characterCount > this.MAX_CHARACTERS) {
            return 'slds-text-color_error';
        } else if (this.characterCount > this.MAX_CHARACTERS * 0.9) {
            return 'slds-text-color_warning';
        }
        return 'slds-text-color_success';
    }

    get progressBarVariant() {
        if (this.characterCount > this.MAX_CHARACTERS) {
            return 'expired';
        } else if (this.characterCount > this.MAX_CHARACTERS * 0.9) {
            return 'warning';
        }
        return 'base';
    }

    get progressPercentage() {
        return Math.min((this.characterCount / this.MAX_CHARACTERS) * 100, 100);
    }

    get isSaveDisabled() {
        return this.isLoading || this.isOverLimit || !this.htmlContent;
    }

    get editorPaneClass() {
        return this.showPreviewPane 
            ? 'slds-col slds-size_1-of-1 slds-medium-size_1-of-2' 
            : 'slds-col slds-size_1-of-1';
    }

    get previewPaneClass() {
        return 'slds-col slds-size_1-of-1 slds-medium-size_1-of-2';
    }

    @wire(getRecord, { recordId: '$recordId', fields: '$recordFields' })
    wiredRecord(result) {
        this.wiredRecordResult = result;
        if (result.data) {
            const fieldValue = result.data.fields[this.fieldApiName]?.value || '';
            this.htmlContent = fieldValue;
            this.updateCharacterCount();
            this.updateEditorContent();
        } else if (result.error) {
            console.error('Error loading record:', result.error);
            this.showErrorToast('Failed to load record data');
        }
    }

    async connectedCallback() {
        await this.loadMonacoEditor();
    }

    async loadMonacoEditor() {
        try {
            this.isLoading = true;
            
            // Load Monaco Editor from CDN
            await loadScript(this, MONACO_EDITOR_URL);
            
            // Configure Monaco
            if (window.require) {
                window.require.config({
                    paths: {
                        vs: 'https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.44.0/min/vs'
                    }
                });

                window.require(['vs/editor/editor.main'], () => {
                    this.initializeEditor();
                });
            }
        } catch (error) {
            console.error('Error loading Monaco Editor:', error);
            this.editorError = 'Failed to load editor. Please refresh the page.';
        } finally {
            this.isLoading = false;
        }
    }

    initializeEditor() {
        try {
            const editorContainer = this.template.querySelector('.monaco-editor-container');
            if (!editorContainer) return;

            this.monacoEditor = monaco.editor.create(editorContainer, {
                value: this.htmlContent,
                language: 'html',
                theme: 'vs-light',
                automaticLayout: true,
                wordWrap: 'on',
                minimap: { enabled: true },
                fontSize: 14,
                lineNumbers: 'on',
                folding: true,
                bracketMatching: 'always',
                autoIndent: 'full',
                formatOnPaste: true,
                formatOnType: true,
                tabSize: 2,
                insertSpaces: true
            });

            // Listen for content changes
            this.monacoEditor.onDidChangeModelContent(() => {
                this.htmlContent = this.monacoEditor.getValue();
                this.updateCharacterCount();
            });

            this.isEditorReady = true;
        } catch (error) {
            console.error('Error initializing Monaco Editor:', error);
            this.editorError = 'Failed to initialize editor';
        }
    }

    updateEditorContent() {
        if (this.monacoEditor && this.isEditorReady) {
            this.monacoEditor.setValue(this.htmlContent || '');
        }
    }

    updateCharacterCount() {
        this.characterCount = this.htmlContent ? this.htmlContent.length : 0;
    }

    handlePreviewToggle() {
        this.showPreviewPane = !this.showPreviewPane;
    }

    handleFormatCode() {
        if (this.monacoEditor) {
            this.monacoEditor.getAction('editor.action.formatDocument').run();
        }
    }

    handleInsertImage() {
        const imageHtml = `<img src="https://example.com/your-image.png" alt="Description" style="max-width: 100%; height: auto;" />`;
        this.insertAtCursor(imageHtml);
    }

    handleInsertLink() {
        const linkHtml = `<a href="https://example.com" target="_blank">Link Text</a>`;
        this.insertAtCursor(linkHtml);
    }

    insertAtCursor(text) {
        if (this.monacoEditor) {
            const selection = this.monacoEditor.getSelection();
            const op = { identifier: 'insert', range: selection, text: text, forceMoveMarkers: true };
            this.monacoEditor.executeEdits('insert', [op]);
            this.monacoEditor.focus();
        }
    }

    async handleSave() {
        if (this.isSaveDisabled) return;

        try {
            this.isLoading = true;

            const fields = {};
            fields.Id = this.recordId;
            fields[this.fieldApiName] = this.htmlContent;

            await updateRecord({ fields });
            
            // Refresh the wired data
            await refreshApex(this.wiredRecordResult);

            this.showSuccessToast('HTML content saved successfully!');
        } catch (error) {
            console.error('Error saving record:', error);
            this.showErrorToast('Failed to save content: ' + (error.body?.message || error.message));
        } finally {
            this.isLoading = false;
        }
    }

    handleReset() {
        if (this.wiredRecordResult?.data) {
            const originalValue = this.wiredRecordResult.data.fields[this.fieldApiName]?.value || '';
            this.htmlContent = originalValue;
            this.updateEditorContent();
            this.updateCharacterCount();
            this.showInfoToast('Content reset to saved version');
        }
    }

    handleClear() {
        this.htmlContent = '';
        this.updateEditorContent();
        this.updateCharacterCount();
    }

    // Utility methods for toast notifications
    showSuccessToast(message) {
        this.dispatchEvent(new ShowToastEvent({
            title: 'Success',
            message: message,
            variant: 'success'
        }));
    }

    showErrorToast(message) {
        this.dispatchEvent(new ShowToastEvent({
            title: 'Error',
            message: message,
            variant: 'error'
        }));
    }

    showInfoToast(message) {
        this.dispatchEvent(new ShowToastEvent({
            title: 'Info',
            message: message,
            variant: 'info'
        }));
    }
} 