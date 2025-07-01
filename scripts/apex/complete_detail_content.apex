// Complete Detail Content Migration - Focused Approach
// Add comprehensive content to existing Workshop_Step_Detail__c records

System.debug('🎯 Starting focused detail content migration...');

// Query existing detail records
List<Workshop_Step_Detail__c> existingDetails = [
    SELECT Id, Detail_Title__c, Detail_Instructions__c, Workshop_Step__r.Name, Workshop_Step__r.Step_Order__c
    FROM Workshop_Step_Detail__c 
    ORDER BY Workshop_Step__c, Detail_Order__c
];

System.debug('📋 Found ' + existingDetails.size() + ' existing detail records to enhance');

// Create comprehensive content for key steps
List<Workshop_Step_Detail__c> additionalDetails = new List<Workshop_Step_Detail__c>();
String baseUrl = 'https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/';

// Get step IDs for additional content
Map<Integer, Id> stepOrderToId = new Map<Integer, Id>();
for(Workshop_Step__c step : [SELECT Id, Step_Order__c FROM Workshop_Step__c WHERE Workshop__c = 'a01Ka00000T4v4zIAB']) {
    stepOrderToId.put((Integer)step.Step_Order__c, step.Id);
}

// Add comprehensive content for Context Definition Mapping (Step 6)
// This step needs the most detailed content with steps 15-27
if(stepOrderToId.containsKey(6)) {
    // Additional detailed mapping steps
    Workshop_Step_Detail__c mappingDetail1 = new Workshop_Step_Detail__c();
    mappingDetail1.Workshop_Step__c = stepOrderToId.get(6);
    mappingDetail1.Detail_Order__c = 4;
    mappingDetail1.Detail_Title__c = 'Steps 18-21: Asset Object Configuration';
    mappingDetail1.Detail_Instructions__c = '<p><strong>Steps 18-21: Asset Object Configuration</strong></p>' +
        '<p><strong>Step 18:</strong> Remove Vehicle mappings - Click trash icons to remove old vehicle mappings</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image2.png" alt="Remove Mappings"></img></p>' +
        '<p><strong>Step 19:</strong> Add Asset Object - Click plus(+) symbol</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image3.png" alt="Add Asset"></img></p>' +
        '<p><strong>Step 20:</strong> Search and Select Asset</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image9.png" alt="Search Asset"></img></p>' +
        '<p><strong>Step 21:</strong> Configure Asset Selection - Select Asset, Deselect Vehicle, Click Done</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image34.png" alt="Select Asset"></img></p>';
    additionalDetails.add(mappingDetail1);
    
    Workshop_Step_Detail__c mappingDetail2 = new Workshop_Step_Detail__c();
    mappingDetail2.Workshop_Step__c = stepOrderToId.get(6);
    mappingDetail2.Detail_Order__c = 5;
    mappingDetail2.Detail_Title__c = 'Steps 22-27: Final Mapping and Activation';
    mappingDetail2.Detail_Instructions__c = '<p><strong>Steps 22-27: Final Mapping and Activation</strong></p>' +
        '<p><strong>Step 22:</strong> Map Event node to Asset Node, including assetId and assetName</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image31.png" alt="Map Nodes"></img></p>' +
        '<p><strong>Step 23:</strong> Navigate back</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image69.png" alt="Go Back"></img></p>' +
        '<p><strong>Step 24:</strong> Access Input Mapping</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image32.png" alt="Input Mapping"></img></p>' +
        '<p><strong>Step 25:</strong> Update Event Node mappings - vehicleId to assetId, vehicleName to assetName</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image27.png" alt="Update Mappings"></img></p>' +
        '<p><strong>Step 26:</strong> Generate thresholds mappings and Save</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image59.png" alt="Generate Mappings"></img></p>' +
        '<p><strong>Step 27:</strong> Activate the definition - Congratulations! Part 1 complete</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image43.png" alt="Activate"></img></p>';
    additionalDetails.add(mappingDetail2);
}

// Add comprehensive content for Execution Procedures (Step 8)
// This step has the most complex content with steps 31-49
if(stepOrderToId.containsKey(8)) {
    Workshop_Step_Detail__c execDetail1 = new Workshop_Step_Detail__c();
    execDetail1.Workshop_Step__c = stepOrderToId.get(8);
    execDetail1.Detail_Order__c = 4;
    execDetail1.Detail_Title__c = 'Steps 36-39: Resource Variables and Actions';
    execDetail1.Detail_Instructions__c = '<p><strong>Steps 36-39: Resource Variables and Actions</strong></p>' +
        '<p><strong>Step 36:</strong> Create local resources - alertSubject, isActive, effDateTime, validUntilDateTime</p>' +
        '<p>Resource Details: AlertSubject (Text: "Tested Alert"), isActive (Boolean: true), effDateTime (DateTime: Sep 1 2023), validUntilDateTime (DateTime: Sep 1 2025)</p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image72.png" alt="Resources"></img></p>' +
        '<p><strong>Step 37:</strong> Add Record Action element</p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image14.png" alt="Record Action"></img></p>' +
        '<p><strong>Step 38:</strong> Configure Record Action - Choose Create, type "record", select RecordAlert entity</p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image28.png" alt="Configure Action"></img></p>' +
        '<p><strong>Step 39:</strong> Assign variables to RecordAlert fields</p>' +
        '<p>Field Assignments: EffectiveDate→effDateTime, isActive→isActive, ValidUntilDate→validUntilDateTime, WhatId→assetId, Subject→AlertSubject</p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image51.png" alt="Assign Variables"></img></p>';
    additionalDetails.add(execDetail1);
    
    Workshop_Step_Detail__c execDetail2 = new Workshop_Step_Detail__c();
    execDetail2.Workshop_Step__c = stepOrderToId.get(8);
    execDetail2.Detail_Order__c = 5;
    execDetail2.Detail_Title__c = 'Steps 40-49: Output Configuration and Activation';
    execDetail2.Detail_Instructions__c = '<p><strong>Steps 40-49: Output Configuration and Activation</strong></p>' +
        '<p><strong>Steps 40-43:</strong> Configure output settings</p>' +
        '<p>Set Rank to 1, Include in Output, Remove output parameters, Save and Activate</p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image4.png" alt="Set Rank"></img></p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image23.png" alt="Save Activate"></img></p>' +
        '<p><strong>Step 44:</strong> Activate Event Orchestration</p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image37.png" alt="Activate Orchestration"></img></p>' +
        '<p><strong>Steps 45-49:</strong> Refresh Decision Tables</p>' +
        '<p>Navigate to Setup → Decision Tables → Filter and Match → Refresh to update decision table with new orchestration</p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image54.png" alt="Setup"></img></p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image58.png" alt="Decision Tables"></img></p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image45.png" alt="Filter"></img></p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image11.png" alt="Refresh"></img></p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image70.png" alt="Verify"></img></p>';
    additionalDetails.add(execDetail2);
}

// Insert additional detail records
if(!additionalDetails.isEmpty()) {
    insert additionalDetails;
    System.debug('✅ Added ' + additionalDetails.size() + ' additional detail records');
}

// Final summary
Integer finalCount = [SELECT COUNT() FROM Workshop_Step_Detail__c];
System.debug('🎉 Migration complete! Total detail records: ' + finalCount);
System.debug('📋 Workshop now contains comprehensive step-by-step instructions');
System.debug('🚀 Ready for production use with scalable architecture!'); 