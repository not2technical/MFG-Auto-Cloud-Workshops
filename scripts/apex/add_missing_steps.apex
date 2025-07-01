// Add Missing Workshop Steps - Complete All 55+ Detailed Steps
// This script adds all the missing individual step records from the workshop document

System.debug('🎯 Adding missing detailed workshop steps...');

// Get step IDs
Map<Integer, Id> stepOrderToId = new Map<Integer, Id>();
for(Workshop_Step__c step : [SELECT Id, Step_Order__c FROM Workshop_Step__c WHERE Workshop__c = 'a01Ka00000T4v4zIAB']) {
    stepOrderToId.put((Integer)step.Step_Order__c, step.Id);
}

List<Workshop_Step_Detail__c> missingDetails = new List<Workshop_Step_Detail__c>();
String baseUrl = 'https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/';

// Context Service Customization (Step 3) - Add missing steps 5-8
if(stepOrderToId.containsKey(3)) {
    Workshop_Step_Detail__c step5 = new Workshop_Step_Detail__c();
    step5.Workshop_Step__c = stepOrderToId.get(3);
    step5.Detail_Order__c = 2;
    step5.Detail_Title__c = 'Step 5: Edit Custom Definition';
    step5.Detail_Instructions__c = '<p><strong>Step 5: Edit Custom Definition</strong></p>' +
        '<p>1. Click on Custom Definitions</p>' +
        '<p>2. Click on the Carrot icon</p>' +
        '<p>3. Click Edit</p>' +
        '<p>Here we will start editing the cloned Context Definition to align to connected asset event stream</p>' +
        '<p><img src="' + baseUrl + 'Context%20Service%20Customization/image24.png" alt="Edit Custom Definition"></img></p>';
    missingDetails.add(step5);
    
    Workshop_Step_Detail__c step678 = new Workshop_Step_Detail__c();
    step678.Workshop_Step__c = stepOrderToId.get(3);
    step678.Detail_Order__c = 3;
    step678.Detail_Title__c = 'Steps 6-8: Add Child Node and Configure';
    step678.Detail_Instructions__c = '<p><strong>Steps 6-8: Add Child Node and Configure</strong></p>' +
        '<p><strong>Step 6:</strong> Click on Next - Time to start modifying attributes and adding new nodes</p>' +
        '<p><img src="' + baseUrl + 'Context%20Service%20Customization/image12.png" alt="Click Next"></img></p>' +
        '<p><strong>Step 7:</strong> Click on Add Child Node - Creating a new child node under the signals node</p>' +
        '<p><img src="' + baseUrl + 'Context%20Service%20Customization/image33.png" alt="Add Child Node"></img></p>' +
        '<p><strong>Step 8:</strong> Type "thresholds" and Click Next - Naming the new child node</p>' +
        '<p><img src="' + baseUrl + 'Context%20Service%20Customization/image49.png" alt="Name Child Node"></img></p>';
    missingDetails.add(step678);
}

// Context Definition Attributes (Step 4) - Add missing steps 9-11
if(stepOrderToId.containsKey(4)) {
    Workshop_Step_Detail__c step9 = new Workshop_Step_Detail__c();
    step9.Workshop_Step__c = stepOrderToId.get(4);
    step9.Detail_Order__c = 2;
    step9.Detail_Title__c = 'Step 9: Rename Vehicle to Asset Attributes';
    step9.Detail_Instructions__c = '<p><strong>Step 9: Rename Vehicle to Asset Attributes</strong></p>' +
        '<p>Renaming attributes to align with asset instead of vehicle</p>' +
        '<p>1. In the Attribute section find "vehicleName" and replace with "assetName"</p>' +
        '<p>2. Repeat for "vehicleId" and replace with "assetId"</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Attributes/image55.png" alt="Rename Attributes"></img></p>';
    missingDetails.add(step9);
    
    Workshop_Step_Detail__c step1011 = new Workshop_Step_Detail__c();
    step1011.Workshop_Step__c = stepOrderToId.get(4);
    step1011.Detail_Order__c = 3;
    step1011.Detail_Title__c = 'Steps 10-11: Add Threshold Attributes';
    step1011.Detail_Instructions__c = '<p><strong>Steps 10-11: Add Threshold Attributes</strong></p>' +
        '<p><strong>Step 10:</strong> Click on thresholds node, then Click on Add Attributes</p>' +
        '<p>Let\'s start adding attributes to the new signals child node → thresholds</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Attributes/image20.png" alt="Add Attributes"></img></p>' +
        '<p><strong>Step 11:</strong> Create lower and upper threshold attributes</p>' +
        '<p>1. Attribute Name: "lower", Type: "INPUT OUTPUT", Data Type: "Number"</p>' +
        '<p>2. Repeat for "upper" threshold attribute</p>' +
        '<p>3. Click Next</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Attributes/image44.png" alt="Create Attributes"></img></p>';
    missingDetails.add(step1011);
}

// Context Definition Tagging (Step 5) - Add missing steps 12-14
if(stepOrderToId.containsKey(5)) {
    Workshop_Step_Detail__c step1213 = new Workshop_Step_Detail__c();
    step1213.Workshop_Step__c = stepOrderToId.get(5);
    step1213.Detail_Order__c = 2;
    step1213.Detail_Title__c = 'Steps 12-13: Tag Asset Attributes';
    step1213.Detail_Instructions__c = '<p><strong>Steps 12-13: Tag Asset Attributes</strong></p>' +
        '<p><strong>Step 12:</strong> Tag the Event attributes so applications can query the data</p>' +
        '<p>1. Click on Events node</p>' +
        '<p>2. Add tag "assetId" and select done</p>' +
        '<p>3. Add tag "assetName" and select done</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Tagging/image38.png" alt="Add Asset Tags"></img></p>' +
        '<p><strong>Step 13:</strong> Remove old vehicle tags for cleanup</p>' +
        '<p>1. Click delete icon next to vehicleId tag</p>' +
        '<p>2. Repeat for vehicleName</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Tagging/image21.png" alt="Remove Vehicle Tags"></img></p>';
    missingDetails.add(step1213);
    
    Workshop_Step_Detail__c step14 = new Workshop_Step_Detail__c();
    step14.Workshop_Step__c = stepOrderToId.get(5);
    step14.Detail_Order__c = 3;
    step14.Detail_Title__c = 'Step 14: Add Threshold Tags';
    step14.Detail_Instructions__c = '<p><strong>Step 14: Add Threshold Tags</strong></p>' +
        '<p>Add tags to the new thresholds node and its attributes</p>' +
        '<p>1. Click on the thresholds node</p>' +
        '<p>2. Click +Add Tags, type "thresholds" and click done</p>' +
        '<p>3. Repeat for lower and upper attributes</p>' +
        '<p>4. Click Save</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Tagging/image13.png" alt="Add Threshold Tags"></img></p>';
    missingDetails.add(step14);
}

// Context Definition Mapping (Step 6) - Add missing steps 15-17
if(stepOrderToId.containsKey(6)) {
    Workshop_Step_Detail__c step1517 = new Workshop_Step_Detail__c();
    step1517.Workshop_Step__c = stepOrderToId.get(6);
    step1517.Detail_Order__c = 2;
    step1517.Detail_Title__c = 'Steps 15-17: Start Data Mapping';
    step1517.Detail_Instructions__c = '<p><strong>Steps 15-17: Start Data Mapping</strong></p>' +
        '<p><strong>Step 15:</strong> Navigate to Custom Definitions → Initials_Asset_Context_Def</p>' +
        '<p>Time to start mapping input sources</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image15.png" alt="Navigate to Definitions"></img></p>' +
        '<p><strong>Step 16:</strong> Access Map Data</p>' +
        '<p>1. Click on Map Data</p>' +
        '<p>2. Click the Carrot</p>' +
        '<p>3. Click on Edit</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image29.png" alt="Map Data"></img></p>' +
        '<p><strong>Step 17:</strong> Update mapping name and proceed</p>' +
        '<p>1. Update the name from Vehicle to Asset</p>' +
        '<p>2. Click on Map</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image40.png" alt="Update Name"></img></p>';
    missingDetails.add(step1517);
    
    Workshop_Step_Detail__c step2327 = new Workshop_Step_Detail__c();
    step2327.Workshop_Step__c = stepOrderToId.get(6);
    step2327.Detail_Order__c = 6;
    step2327.Detail_Title__c = 'Steps 23-27: Input Mapping and Activation';
    step2327.Detail_Instructions__c = '<p><strong>Steps 23-27: Input Mapping and Activation</strong></p>' +
        '<p><strong>Step 23:</strong> Click on Back</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image69.png" alt="Go Back"></img></p>' +
        '<p><strong>Step 24:</strong> Click on Input Mapping</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image32.png" alt="Input Mapping"></img></p>' +
        '<p><strong>Step 25:</strong> Update Event Node mappings</p>' +
        '<p>1. Click Event Node</p>' +
        '<p>2. Change vehicleId to assetId</p>' +
        '<p>3. Change vehicleName to assetName</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image27.png" alt="Update Mappings"></img></p>' +
        '<p><strong>Step 26:</strong> Generate thresholds mappings</p>' +
        '<p>1. Click on thresholds</p>' +
        '<p>2. Click Generate All Mappings</p>' +
        '<p>3. Click Save</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image59.png" alt="Generate Mappings"></img></p>' +
        '<p><strong>Step 27:</strong> Activate the definition</p>' +
        '<p>Congratulations! Context Definition complete</p>' +
        '<p><img src="' + baseUrl + 'Context%20Definition%20Mapping/image43.png" alt="Activate"></img></p>';
    missingDetails.add(step2327);
}

// Execution Procedures and Expression Sets (Step 8) - Add missing steps 31-35
if(stepOrderToId.containsKey(8)) {
    Workshop_Step_Detail__c step3135 = new Workshop_Step_Detail__c();
    step3135.Workshop_Step__c = stepOrderToId.get(8);
    step3135.Detail_Order__c = 2;
    step3135.Detail_Title__c = 'Steps 31-35: Setup Execution Procedure';
    step3135.Detail_Instructions__c = '<p><strong>Steps 31-35: Setup Execution Procedure</strong></p>' +
        '<p><strong>Step 31:</strong> Click on Initials_MYAEO</p>' +
        '<p>Access the execution procedure created from the previous orchestration</p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image10.png" alt="Click Orchestration"></img></p>' +
        '<p><strong>Step 32:</strong> Click on Initials_MYAEO V1</p>' +
        '<p>The procedure connects definitions and expressions</p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image64.png" alt="Select Version"></img></p>' +
        '<p><strong>Step 33:</strong> Click + Symbol to add elements</p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image60.png" alt="Add Element"></img></p>' +
        '<p><strong>Step 34:</strong> Click on List Group</p>' +
        '<p>Use list group element for filtering</p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image16.png" alt="List Group"></img></p>' +
        '<p><strong>Step 35:</strong> Configure filter conditions</p>' +
        '<p>1. Filter conditions: OR</p>' +
        '<p>2. Lower variable < 1400</p>' +
        '<p>3. Upper variable > 1800</p>' +
        '<p><img src="' + baseUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image62.png" alt="Filter Conditions"></img></p>';
    missingDetails.add(step3135);
}

// Testing with Developer Console (Step 9) - Add missing steps 50-55
if(stepOrderToId.containsKey(9)) {
    Workshop_Step_Detail__c step5052 = new Workshop_Step_Detail__c();
    step5052.Workshop_Step__c = stepOrderToId.get(9);
    step5052.Detail_Order__c = 2;
    step5052.Detail_Title__c = 'Steps 50-52: Get Asset ID';
    step5052.Detail_Instructions__c = '<p><strong>Steps 50-52: Get Asset ID</strong></p>' +
        '<p><strong>Step 50:</strong> Navigate to Manufacturing Service Console</p>' +
        '<p>1. Click the apps icon</p>' +
        '<p>2. Search for "console"</p>' +
        '<p>3. Click Service Console for Manufacturing</p>' +
        '<p><img src="' + baseUrl + 'Testing%20with%20Developer%20Console/image52.png" alt="Service Console"></img></p>' +
        '<p><strong>Step 51:</strong> Select an Asset</p>' +
        '<p>1. Navigate to Asset entity</p>' +
        '<p>2. Select any asset in the list</p>' +
        '<p><img src="' + baseUrl + 'Testing%20with%20Developer%20Console/image35.png" alt="Select Asset"></img></p>' +
        '<p><strong>Step 52:</strong> Copy the AssetId from URL</p>' +
        '<p><img src="' + baseUrl + 'Testing%20with%20Developer%20Console/image8.png" alt="Copy Asset ID"></img></p>';
    missingDetails.add(step5052);
    
    Workshop_Step_Detail__c step5355 = new Workshop_Step_Detail__c();
    step5355.Workshop_Step__c = stepOrderToId.get(9);
    step5355.Detail_Order__c = 3;
    step5355.Detail_Title__c = 'Steps 53-55: Execute Test';
    step5355.Detail_Instructions__c = '<p><strong>Steps 53-55: Execute Test</strong></p>' +
        '<p><strong>Step 53:</strong> Open Developer Console</p>' +
        '<p>Click gear → Developer Console</p>' +
        '<p><img src="' + baseUrl + 'Testing%20with%20Developer%20Console/image42.png" alt="Developer Console"></img></p>' +
        '<p><strong>Step 54:</strong> Open Execute Anonymous Window</p>' +
        '<p>Click Debug → Open Execute Anonymous Window</p>' +
        '<p><img src="' + baseUrl + 'Testing%20with%20Developer%20Console/image57.png" alt="Execute Anonymous"></img></p>' +
        '<p><strong>Step 55:</strong> Execute Test Payload</p>' +
        '<p>1. Paste the sample payload</p>' +
        '<p>2. Replace INSERT_ID with your AssetId</p>' +
        '<p>3. Click Execute</p>' +
        '<p><strong>Sample Payload:</strong></p>' +
        '<p><code>String jsonBody = \'{"type": "WorkshopEvent","eventData": "{\\\"Event\\\":[{\\\"assetId\\\":\\\"INSERT_ID\\\",\\\"id\\\":\\\"INSERT_ID\\\",\\\"businessObjectType\\\":\\\"Asset\\\",\\\"signals\\\":[{\\\"thresholds\\\":{\\\"lower\\\":\\\"1500\\\",\\\"upper\\\":\\\"1880\\\"}}]}]}"}\'; InboundEventService.sendEvent(jsonBody);</code></p>' +
        '<p><img src="' + baseUrl + 'Testing%20with%20Developer%20Console/image19.png" alt="Execute Test"></img></p>';
    missingDetails.add(step5355);
}

// Insert all missing detail records
if(!missingDetails.isEmpty()) {
    insert missingDetails;
    System.debug('✅ Added ' + missingDetails.size() + ' missing detail records');
} else {
    System.debug('ℹ️ No missing details to add');
}

// Final count
Integer finalCount = [SELECT COUNT() FROM Workshop_Step_Detail__c];
System.debug('🎉 Complete! Total detail records: ' + finalCount);
System.debug('📋 All detailed workshop steps now included');

// Show the complete structure
List<Workshop_Step_Detail__c> allDetails = [
    SELECT Workshop_Step__r.Name, Workshop_Step__r.Step_Order__c, Detail_Title__c
    FROM Workshop_Step_Detail__c 
    ORDER BY Workshop_Step__r.Step_Order__c, Detail_Order__c
];

Map<String, List<String>> stepToDetails = new Map<String, List<String>>();
for(Workshop_Step_Detail__c detail : allDetails) {
    String stepName = detail.Workshop_Step__r.Name;
    if(!stepToDetails.containsKey(stepName)) {
        stepToDetails.put(stepName, new List<String>());
    }
    stepToDetails.get(stepName).add(detail.Detail_Title__c);
}

System.debug('📚 COMPLETE WORKSHOP STRUCTURE:');
for(String stepName : stepToDetails.keySet()) {
    System.debug('🔸 ' + stepName + ' (' + stepToDetails.get(stepName).size() + ' details)');
    for(String detailTitle : stepToDetails.get(stepName)) {
        System.debug('  → ' + detailTitle);
    }
} 