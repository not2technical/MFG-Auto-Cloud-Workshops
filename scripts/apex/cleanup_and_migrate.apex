// Cleanup test records and run complete migration
// Workshop: "Supercharge Experiences: Connect Telemetry to CRM360"
// COMPREHENSIVE MIGRATION - ALL 55+ DETAILED STEPS

// First, cleanup any existing test records
List<Workshop_Step_Detail__c> existingDetails = [SELECT Id FROM Workshop_Step_Detail__c];
if(!existingDetails.isEmpty()) {
    delete existingDetails;
    System.debug('Cleaned up ' + existingDetails.size() + ' existing detail records');
}

// Now run the complete migration
List<Workshop_Step__c> workshopSteps = [
    SELECT Id, Name, Step_Order__c, Instructions__c 
    FROM Workshop_Step__c 
    WHERE Workshop__c = 'a01Ka00000T4v4zIAB' 
    ORDER BY Step_Order__c
];

List<Workshop_Step_Detail__c> detailsToInsert = new List<Workshop_Step_Detail__c>();
List<Workshop_Step__c> stepsToUpdate = new List<Workshop_Step__c>();

for(Workshop_Step__c step : workshopSteps) {
    // Skip the placeholder record
    if(step.Name == 'Place Holder') {
        continue;
    }
    
    String content = step.Instructions__c != null ? step.Instructions__c : '';
    String overviewContent = '';
    List<String> detailSections = new List<String>();
    List<String> detailTitles = new List<String>();
    String baseImageUrl = 'https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/';
    
    // Extract overview and detailed sections based on step content
    if(step.Step_Order__c == 1) {
        // Context Service Configuration Guide - COMPLETE
        overviewContent = '<p><strong>Context Service Configuration Guide</strong></p>' +
            '<p>Guided steps to create and extend a context service definition for connected vehicles or Assets. This foundational section introduces the workshop objectives and provides overview of the hands-on Connected Assets and Asset Centric Service experience.</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Configuration%20Guide/image26.png" alt="Context Service Configuration Guide Header"></img></p>';
        
        detailTitles.add('Workshop Overview and Introduction');
        detailSections.add('<p><strong>Workshop Overview and Introduction</strong></p>' +
            '<p>Get hands on with Connected Assets and Vehicles. This comprehensive workshop covers the complete configuration of Context Service for connected assets.</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Configuration%20Guide/image73.png" alt="Connected Assets Overview"></img></p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Configuration%20Guide/image17.png" alt="Workshop Guide"></img></p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Configuration%20Guide/image7.png" alt="Attendee Guide"></img></p>');
        
        detailTitles.add('Setup and Initial Configuration');
        detailSections.add('<p><strong>Setup and Initial Configuration</strong></p>' +
            '<p>Navigate to Setup and begin the Context Service Configuration process.</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Configuration%20Guide/image1.png" alt="Setup Navigation"></img></p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Configuration%20Guide/image46.png" alt="Configuration Steps"></img></p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Configuration%20Guide/image47.png" alt="Configuration Process"></img></p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Configuration%20Guide/image56.png" alt="Configuration Complete"></img></p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Configuration%20Guide/image6.png" alt="Final Setup"></img></p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Configuration%20Guide/image18.png" alt="Setup Complete"></img></p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Configuration%20Guide/image74.png" alt="Configuration Finalized"></img></p>');
            
    } else if(step.Step_Order__c == 2) {
        // Cloning an existing definition - COMPLETE ALL 4 STEPS
        overviewContent = '<p><strong>Cloning an Existing Definition</strong></p>' +
            '<p>Get off to a fast start by cloning an Out of the Box context definition.</p>';
        
        detailTitles.add('Step 1: Navigate to Context Definitions');
        detailSections.add('<p><strong>Step 1: Navigate to Context Definitions</strong></p>' +
            '<p>1. Type "Context service" in setup search</p>' +
            '<p>2. Click on "Context Definitions"</p>' +
            '<p><img src="' + baseImageUrl + 'Cloning%20an%20existing%20definition/image25.png" alt="Navigate to Context Definitions"></img></p>');
            
        detailTitles.add('Step 2-3: Select and Clone VehicleFaultEventDetail');
        detailSections.add('<p><strong>Step 2-3: Select and Clone VehicleFaultEventDetail</strong></p>' +
            '<p><strong>Step 2:</strong> In the Standard Definitions tab → VehicleFaultEventDetail, Click the Carrot icon</p>' +
            '<p><img src="' + baseImageUrl + 'Cloning%20an%20existing%20definition/image36.png" alt="Select VehicleFaultEventDetail"></img></p>' +
            '<p><strong>Step 3:</strong> Click on Clone</p>' +
            '<p><img src="' + baseImageUrl + 'Cloning%20an%20existing%20definition/image50.png" alt="Clone Definition"></img></p>');
            
        detailTitles.add('Step 4: Name and Save the Cloned Definition');
        detailSections.add('<p><strong>Step 4: Name and Save the Cloned Definition</strong></p>' +
            '<p>1. Paste "Initials_Asset_Context_Def" into input field</p>' +
            '<p>2. Click on Save</p>' +
            '<p><img src="' + baseImageUrl + 'Cloning%20an%20existing%20definition/image39.png" alt="Name and Save Definition"></img></p>');
            
    } else if(step.Step_Order__c == 3) {
        // Context Service Customization - COMPLETE STEPS 5-8
        overviewContent = '<p><strong>Context Service Customization</strong></p>' +
            '<p>Configure the new context definition for Assets. Here we will start editing the cloned Context Definition to align to connected asset event stream.</p>';
            
        detailTitles.add('Step 5: Edit Custom Definition');
        detailSections.add('<p><strong>Step 5: Edit Custom Definition</strong></p>' +
            '<p>1. Click on Custom Definitions</p>' +
            '<p>2. Click on the Carrot icon</p>' +
            '<p>3. Click Edit</p>' +
            '<p>Here we will start editing the cloned Context Definition to align to connected asset event stream</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Customization/image24.png" alt="Edit Custom Definition"></img></p>');
            
        detailTitles.add('Step 6-8: Modify Nodes and Attributes');
        detailSections.add('<p><strong>Step 6-8: Modify Nodes and Attributes</strong></p>' +
            '<p><strong>Step 6:</strong> Click on Next. Time to start modifying attributes and adding new nodes</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Customization/image12.png" alt="Click Next"></img></p>' +
            '<p><strong>Step 7:</strong> Click on Add Child Node. Creating a new child node under the signals node</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Customization/image33.png" alt="Add Child Node"></img></p>' +
            '<p><strong>Step 8:</strong> In the new child node Type "thresholds" and Click Next. Naming a new child node within signals node and completing the main structure</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Customization/image49.png" alt="Name Child Node"></img></p>');
            
    } else if(step.Step_Order__c == 4) {
        // Context Definition Attributes - COMPLETE STEPS 9-11
        overviewContent = '<p><strong>Context Definition Attributes</strong></p>' +
            '<p>Attributes are fields on a node that can be mapped to sObjects or any input data source.</p>';
            
        detailTitles.add('Step 9: Rename Vehicle Attributes to Asset');
        detailSections.add('<p><strong>Step 9: Rename Vehicle Attributes to Asset</strong></p>' +
            '<p>Renaming attributes to align with asset instead of vehicle</p>' +
            '<p>1. In the Attribute section find "vehicleName" and replace with "assetName"</p>' +
            '<p>2. Repeat for "vehicleId" and replace with "assetId"</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Attributes/image55.png" alt="Rename Attributes"></img></p>');
            
        detailTitles.add('Step 10-11: Add Threshold Attributes');
        detailSections.add('<p><strong>Step 10-11: Add Threshold Attributes</strong></p>' +
            '<p><strong>Step 10:</strong> Click on thresholds node, then Click on Add Attributes</p>' +
            '<p>Let\'s start adding attributes to the new signals child node → thresholds</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Attributes/image20.png" alt="Add Attributes"></img></p>' +
            '<p><strong>Step 11:</strong> Adding new upper and lower attributes to the thresholds node</p>' +
            '<p>1. In the new Attribute, Attribute Name type "lower"</p>' +
            '<p>2. In the Attribute Type field select "INPUT OUTPUT"</p>' +
            '<p>3. In the Attribute Data Type field select "Number"</p>' +
            '<p>4. Repeat Steps to create the "upper" threshold attribute</p>' +
            '<p>5. Click Next</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Attributes/image44.png" alt="Create Threshold Attributes"></img></p>');
            
    } else if(step.Step_Order__c == 5) {
        // Context Definition Tagging - COMPLETE STEPS 12-14
        overviewContent = '<p><strong>Context Definition Tagging</strong></p>' +
            '<p>Tags are used to define the context structure and point to a node or attribute so the consuming application can query data directly from the context definition.</p>';
            
        detailTitles.add('Step 12-13: Update Asset Tags');
        detailSections.add('<p><strong>Step 12-13: Update Asset Tags</strong></p>' +
            '<p><strong>Step 12:</strong> Let\'s tag the Event attributes so applications can query the data from the definition</p>' +
            '<p>1. Click on Events node</p>' +
            '<p>2. Add a tag to assetId by Typing "assetId" and select done</p>' +
            '<p>3. Repeat for assetName tag by Typing "assetName" and select done</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Tagging/image38.png" alt="Add Asset Tags"></img></p>' +
            '<p><strong>Step 13:</strong> Time to remove the old vehicle tags for cleanup</p>' +
            '<p>1. Click on the blank space ,if missing delete icon, next to the vehicleId tag to remove it</p>' +
            '<p>2. Repeat for vehicleName</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Tagging/image21.png" alt="Remove Vehicle Tags"></img></p>');
            
        detailTitles.add('Step 14: Add Threshold Tags');
        detailSections.add('<p><strong>Step 14: Add Threshold Tags</strong></p>' +
            '<p>Here we add the tags to the new thresholds node and its attributes</p>' +
            '<p>1. Click on the thresholds node</p>' +
            '<p>2. Click +Add Tags in thresholds, Type the tag name "thresholds" and click done</p>' +
            '<p>3. Repeat for the lower and upper attributes</p>' +
            '<p>4. Click Save</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Tagging/image13.png" alt="Add Threshold Tags"></img></p>');
            
    } else if(step.Step_Order__c == 6) {
        // Context Definition Mapping - COMPLETE STEPS 15-27
        overviewContent = '<p><strong>Context Definition Mapping</strong></p>' +
            '<p>Context Mapping is the mapping of nodes and attributes to an input data source. The mapping is used to feed data into your context definition. This data is then used to complete your application\'s processes.</p>';
            
        detailTitles.add('Steps 15-17: Start Data Mapping');
        detailSections.add('<p><strong>Steps 15-17: Start Data Mapping</strong></p>' +
            '<p><strong>Step 15:</strong> Click on Custom Definitions →Initials_Asset_Context_Def</p>' +
            '<p>Time to start mapping input sources</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Mapping/image15.png" alt="Custom Definitions"></img></p>' +
            '<p><strong>Step 16:</strong> Click on Map Data, Click the Carrot, Click on Edit</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Mapping/image29.png" alt="Map Data"></img></p>' +
            '<p><strong>Step 17:</strong> Update the name from Vehicle to Asset, Click on Map</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Mapping/image40.png" alt="Update Name"></img></p>');
            
        detailTitles.add('Steps 18-22: Configure Asset Object Mapping');
        detailSections.add('<p><strong>Steps 18-22: Configure Asset Object Mapping</strong></p>' +
            '<p><strong>Step 18:</strong> Remove the current Vehicle mappings by clicking on the trash can icons</p>' +
            '<p>Here we will remove the mappings between the definition structure and the connected object vehicle</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Mapping/image2.png" alt="Remove Vehicle Mappings"></img></p>' +
            '<p><strong>Step 19:</strong> Click on the plus(+) symbol to add the asset object</p>' +
            '<p>Here the asset object will get added</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Mapping/image3.png" alt="Add Asset Object"></img></p>' +
            '<p><strong>Step 20:</strong> Search for the Salesforce Object Asset, Click on Asset</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Mapping/image9.png" alt="Search Asset"></img></p>' +
            '<p><strong>Step 21:</strong> Select the Checkbox on Asset, Deselect the Checkbox on Vehicle to remove it, Click Done</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Mapping/image34.png" alt="Select Asset"></img></p>' +
            '<p><strong>Step 22:</strong> Click the Event node and Click the Asset Node, Repeat for assetId and assetName respectively, Click on Save</p>' +
            '<p>Now it\'s time to map the node to the object along with the attributes to fields</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Mapping/image31.png" alt="Map Node to Object"></img></p>');
            
        detailTitles.add('Steps 23-27: Input Mapping and Activation');
        detailSections.add('<p><strong>Steps 23-27: Input Mapping and Activation</strong></p>' +
            '<p><strong>Step 23:</strong> Click on Back</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Mapping/image69.png" alt="Click Back"></img></p>' +
            '<p><strong>Step 24:</strong> Click on Input Mapping</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Mapping/image32.png" alt="Input Mapping"></img></p>' +
            '<p><strong>Step 25:</strong> Here we modify the old mappings change them to the inputs needed</p>' +
            '<p>1. Click on the Event Node</p>' +
            '<p>2. Click on the pencil icon next to vehicleId and type "assetId"</p>' +
            '<p>3. Repeat for vehicleName and type "assetName"</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Mapping/image27.png" alt="Modify Mappings"></img></p>' +
            '<p><strong>Step 26:</strong> Complete the mapping configuration</p>' +
            '<p>1. Click on thresholds</p>' +
            '<p>2. Click on Generate All Mappings(Retain&Generate)</p>' +
            '<p>3. Click Save</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Mapping/image59.png" alt="Generate Mappings"></img></p>' +
            '<p><strong>Step 27:</strong> Asset Context Definition Completed</p>' +
            '<p>Congratulations on completing part 1 of the connected asset and vehicle experience. Next up we start to configure the Actionable Event Management application</p>' +
            '<p>1. Active the saved definition</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Definition%20Mapping/image43.png" alt="Activate Definition"></img></p>');
            
    } else if(step.Step_Order__c == 7) {
        // Actionable Event Management - COMPLETE STEPS 28-30
        overviewContent = '<p><strong>Actionable Event Management</strong></p>' +
            '<p>Define the actions to be performed for actionable events generated by assets by creating actionable event orchestrations. Create qualification and evaluation rules for different types of actionable events that are generated in assets. Design an orchestration process that detects fault codes that an external system sends, and perform actions based on preset conditions.</p>';
            
        detailTitles.add('Step 28: Navigate to Actionable Event Management');
        detailSections.add('<p><strong>Step 28: Navigate to Actionable Event Management</strong></p>' +
            '<p>Time to start the fun of creating a new Actionable event orchestration. Note: You may need to navigate Actionable Event Orchestration from home on the navigation bar.</p>' +
            '<p>1. Click on App Launcher</p>' +
            '<p>2. Type "Actionable"</p>' +
            '<p>3. Click on Actionable Event Management</p>' +
            '<p>4. Navigate to Actionable Event Orchestration and Click New</p>' +
            '<p><img src="' + baseImageUrl + 'Actionable%20Event%20Management/image61.png" alt="Navigate to Actionable Event Management"></img></p>');
            
        detailTitles.add('Steps 29-30: Create and Configure Orchestration');
        detailSections.add('<p><strong>Steps 29-30: Create and Configure Orchestration</strong></p>' +
            '<p><strong>Step 29:</strong> Type "Initials_MYAEO"</p>' +
            '<p><img src="' + baseImageUrl + 'Actionable%20Event%20Management/image48.png" alt="Create New Orchestration"></img></p>' +
            '<p><strong>Step 30:</strong> Configure the complete orchestration</p>' +
            '<p>In the first 3 steps we name the actionable event, Create the Event and Subtype, Relate the event and subtype</p>' +
            '<p>1. Type "Initials_MYAEO" Example "AK_MYAEO"</p>' +
            '<p>2. Click Event Type, + New Actionable Event Type, Type WorkshopEvent, Click Save</p>' +
            '<p>3. Click Event Subtype, + New Actionable Event Subtype, Type WorkshopSubtype, Select Event Type WorkshopEvent, Click Save</p>' +
            '<p>4. Click Usage type and choose Automotive or Manufacturing</p>' +
            '<p>5. Choose ExpressionSet-Based for Execution type</p>' +
            '<p>6. Click Context definition and select the definition from the previous section</p>' +
            '<p>7. Click Context Mapping and choose AssetFaultEventDetailMapping</p>' +
            '<p>8. Click Save</p>' +
            '<p>In these steps we assign the ExpressionSet, Usage Type, Context definition and Mapping, and Save</p>' +
            '<p><img src="' + baseImageUrl + 'Actionable%20Event%20Management/image30.png" alt="Configure Event Types"></img></p>');
            
    } else if(step.Step_Order__c == 8) {
        // Execution Procedures and Expression Sets - COMPLETE STEPS 31-49
        overviewContent = '<p><strong>Execution Procedures and Expression Sets</strong></p>' +
            '<p>This section we get to start pulling variables from the event stream and local and direct from CRM in practice. For time we will just use local and events variables.</p>';
            
        detailTitles.add('Steps 31-35: Setup Execution Procedure and Filters');
        detailSections.add('<p><strong>Steps 31-35: Setup Execution Procedure and Filters</strong></p>' +
            '<p><strong>Step 31:</strong> Click on Initials_MYAEO</p>' +
            '<p>After saving from the previous set a new execution procedure was created. This is where access to the expression set is connected to define the rules and actions from the event stream.</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image10.png" alt="Click Orchestration"></img></p>' +
            '<p><strong>Step 32:</strong> Click on Initials_MYAEO V1</p>' +
            '<p>The procedure is the junction between definitions and expressions</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image64.png" alt="Click Version"></img></p>' +
            '<p><strong>Step 33:</strong> Click on + Symbol</p>' +
            '<p>This is a wide array of different elements to choose from.</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image60.png" alt="Add Element"></img></p>' +
            '<p><strong>Step 34:</strong> Click on List Group</p>' +
            '<p>We use the list group element to in this case to do a simple filter</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image16.png" alt="List Group"></img></p>' +
            '<p><strong>Step 35:</strong> Configure filter conditions</p>' +
            '<p>In the list filter we choose to evaluate two conditions lower or upper from the event stream. If either of these evaluate to true, we move to the next step. Please note a decision matrix could be used here</p>' +
            '<p>1. In Filter conditions choose OR</p>' +
            '<p>2. In Resource Type lower, click the event variable, Operator choose Less than, Value Type 1400</p>' +
            '<p>3. In Resource Type upper, click the event variable, Operator choose Greater than, Value Type 1800</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image62.png" alt="Filter Conditions"></img></p>');
            
        detailTitles.add('Steps 36-39: Create Resources and Record Actions');
        detailSections.add('<p><strong>Steps 36-39: Create Resources and Record Actions</strong></p>' +
            '<p><strong>Step 36:</strong> Create local variables for the workshop</p>' +
            '<p>In this step we will create the variables to hold the data from CRM. We will create constants for the purpose of this workshop but ideally these would be passed out of a flow</p>' +
            '<p>1. Select Resource manager</p>' +
            '<p>2. Click Add Resource</p>' +
            '<p>3. Create the four variables below - alertSubject, isActive, effDateTime, validUntilDateTime</p>' +
            '<p>Details: AlertSubject (Constant, Text, "Tested Alert"), effDateTime (Constant, DateTime, Sep 1 2023), isActive (Constant, Boolean, true), validUntilDateTime (Constant, DateTime, Sep 1 2025)</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image72.png" alt="Resource Manager"></img></p>' +
            '<p><strong>Step 37:</strong> Click the + symbol and select the Action element called Record Action</p>' +
            '<p>Adding actions are a powerful step post filter qualifications. They allow easy create and update of records hydrated by the context service, connected with CRM data to drive actions in real time</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image14.png" alt="Record Action"></img></p>' +
            '<p><strong>Step 38:</strong> Configure the Record Action</p>' +
            '<p>Be patient on this step as the object lookup field loads all the objects to choose from.</p>' +
            '<p>1. Choose Create</p>' +
            '<p>2. Type "record"</p>' +
            '<p>3. Select the Entity RecordAlert</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image28.png" alt="Configure Record Action"></img></p>' +
            '<p><strong>Step 39:</strong> Assign variables to record alert fields</p>' +
            '<p>Assign the variables to the record alert fields. Note that the assetId variable is from the event steam so just type assetId in the WhatId</p>' +
            '<p>1. EffectiveDate assign effDateTime</p>' +
            '<p>2. isActive assign isActive</p>' +
            '<p>3. ValidUntilDate assign validUntilDateTime</p>' +
            '<p>4. WhatId assign assetId</p>' +
            '<p>5. Subject assign AlertSubject</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image51.png" alt="Assign Variables"></img></p>');
            
        detailTitles.add('Steps 40-44: Configure Output and Activation');
        detailSections.add('<p><strong>Steps 40-44: Configure Output and Activation</strong></p>' +
            '<p><strong>Step 40:</strong> Choose the gear icon, Set Rank to 1</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image4.png" alt="Set Rank"></img></p>' +
            '<p><strong>Step 41:</strong> With the Record actions selected choose the Business element Icon, Check the Include in Output</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image5.png" alt="Include in Output"></img></p>' +
            '<p><strong>Step 42:</strong> Remove the output Parameter by clicking the trash icon</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image41.png" alt="Remove Output Parameter"></img></p>' +
            '<p><strong>Step 43:</strong> Click on Save, Click Activate</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image23.png" alt="Save and Activate"></img></p>' +
            '<p><strong>Step 44:</strong> Navigate back to the Event Orchestration Initials_MYAEO, Check the active check box, Click Save</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image37.png" alt="Activate Orchestration"></img></p>');
            
        detailTitles.add('Steps 45-49: Refresh Decision Tables');
        detailSections.add('<p><strong>Steps 45-49: Refresh Decision Tables</strong></p>' +
            '<p>Now that the Actionable Event Orchestration is active, let\'s refresh the decision table to reflect the changes.</p>' +
            '<p><strong>Step 45:</strong> Click on gear..., Click Setup</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image54.png" alt="Setup"></img></p>' +
            '<p><strong>Step 46:</strong> In setup → quick search type "decision", Click on Decision Tables</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image58.png" alt="Decision Tables"></img></p>' +
            '<p><strong>Step 47:</strong> Click on Filter and Match Actionable Event Orchestrations</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image45.png" alt="Filter Orchestrations"></img></p>' +
            '<p><strong>Step 48:</strong> Click on Refresh</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image11.png" alt="Refresh"></img></p>' +
            '<p><strong>Step 49:</strong> Refresh the page and verify the last refresh date is close to current time</p>' +
            '<p><img src="' + baseImageUrl + 'Execution%20Procedures%20and%20Expression%20Sets/image70.png" alt="Verify Refresh"></img></p>');
            
    } else if(step.Step_Order__c == 9) {
        // Testing with Developer Console - COMPLETE STEPS 50-55
        overviewContent = '<p><strong>Testing with Developer Console</strong></p>' +
            '<p>We have made it to the final phase. Time to test and see if all the hard work pays off. Before we get right to testing a few items are needed: Get an AssetId to use with the test payload and put the AssetId into this payload.</p>';
            
        detailTitles.add('Steps 50-52: Get Asset ID from Service Console');
        detailSections.add('<p><strong>Steps 50-52: Get Asset ID from Service Console</strong></p>' +
            '<p><strong>Step 50:</strong> Navigate to the Manufacturing Service Console</p>' +
            '<p>Let\'s grab an AssetId out of the browser URL</p>' +
            '<p>1. Navigate to the Manufacturing Service Console by clicking the apps icon</p>' +
            '<p>2. Search for "console"</p>' +
            '<p>3. Click Service Console for Manufacturing</p>' +
            '<p><img src="' + baseImageUrl + 'Testing%20with%20Developer%20Console/image52.png" alt="Service Console"></img></p>' +
            '<p><strong>Step 51:</strong> Navigate to Asset entity, Select any asset in the list</p>' +
            '<p><img src="' + baseImageUrl + 'Testing%20with%20Developer%20Console/image35.png" alt="Select Asset"></img></p>' +
            '<p><strong>Step 52:</strong> Copy the AssetId from the URL</p>' +
            '<p><img src="' + baseImageUrl + 'Testing%20with%20Developer%20Console/image8.png" alt="Copy Asset ID"></img></p>');
            
        detailTitles.add('Steps 53-55: Execute Test in Developer Console');
        detailSections.add('<p><strong>Steps 53-55: Execute Test in Developer Console</strong></p>' +
            '<p><strong>Step 53:</strong> Click gear, Click on Developer Console</p>' +
            '<p><img src="' + baseImageUrl + 'Testing%20with%20Developer%20Console/image42.png" alt="Developer Console"></img></p>' +
            '<p><strong>Step 54:</strong> Click Debug, Click on Open Execute Anonymous Window</p>' +
            '<p><img src="' + baseImageUrl + 'Testing%20with%20Developer%20Console/image57.png" alt="Execute Anonymous"></img></p>' +
            '<p><strong>Step 55:</strong> Paste the Sample Payload and Execute</p>' +
            '<p>1. Paste the Sample Payload text into text area</p>' +
            '<p>2. Click Execute</p>' +
            '<p><strong>Sample Payload:</strong></p>' +
            '<p><code>String jsonBody = \'{"type": "WorkshopEvent","eventData": "{\\\"Event\\\":[{\\\"assetId\\\":\\\"INSERT_ID\\\",\\\"id\\\":\\\"INSERT_ID\\\",\\\"businessObjectType\\\":\\\"Asset\\\",\\\"signals\\\":[{\\\"thresholds\\\":{\\\"lower\\\":\\\"1500\\\",\\\"upper\\\":\\\"1880\\\"}}]}]}"}\'; InboundEventService.sendEvent(jsonBody);</code></p>' +
            '<p>Replace INSERT_ID with the actual AssetId you copied from the URL</p>' +
            '<p><img src="' + baseImageUrl + 'Testing%20with%20Developer%20Console/image19.png" alt="Execute Test"></img></p>');
    } else {
        // For other steps, create basic overview and minimal details
        String stepTitle = step.Name;
        overviewContent = '<p><strong>' + stepTitle + '</strong></p>' +
            '<p>' + (content.length() > 500 ? content.substring(0, 500) + '...' : content) + '</p>';
        
        detailTitles.add('Detailed Instructions');
        detailSections.add('<p><strong>Detailed Instructions for ' + stepTitle + '</strong></p>' + 
            (content.length() > 500 ? content.substring(500) : '<p>Follow the step-by-step instructions to complete this section.</p>'));
    }
    
    // Update the workshop step with overview content
    step.Instructions__c = overviewContent;
    stepsToUpdate.add(step);
    
    // Create detail records
    Integer detailOrder = 1;
    for(Integer i = 0; i < detailSections.size(); i++) {
        Workshop_Step_Detail__c detail = new Workshop_Step_Detail__c();
        detail.Workshop_Step__c = step.Id;
        detail.Detail_Order__c = detailOrder;
        detail.Detail_Title__c = i < detailTitles.size() ? detailTitles[i] : 'Section ' + detailOrder;
        detail.Detail_Instructions__c = detailSections[i];
        detailsToInsert.add(detail);
        detailOrder++;
    }
}

// Execute the migration
try {
    // Insert detail records
    insert detailsToInsert;
    System.debug('✅ Successfully inserted ' + detailsToInsert.size() + ' Workshop_Step_Detail__c records');
    
    // Update workshop steps with overview content
    update stepsToUpdate;
    System.debug('✅ Successfully updated ' + stepsToUpdate.size() + ' Workshop_Step__c records with overview content');
    
    System.debug('🎉 COMPLETE Workshop Migration completed successfully!');
    System.debug('📋 Total Steps: ' + stepsToUpdate.size());
    System.debug('📋 Total Detail Records: ' + detailsToInsert.size());
    
    // Query back to verify
    List<Workshop_Step_Detail__c> verifyDetails = [
        SELECT Id, Name, Detail_Title__c, Detail_Order__c, Workshop_Step__c, Workshop_Step__r.Name
        FROM Workshop_Step_Detail__c 
        ORDER BY Workshop_Step__c, Detail_Order__c
    ];
    
    System.debug('✅ Verification: Found ' + verifyDetails.size() + ' detail records across ' + stepsToUpdate.size() + ' workshop steps');
    
    for(Workshop_Step_Detail__c detail : verifyDetails) {
        System.debug('📋 ' + detail.Workshop_Step__r.Name + ' → ' + detail.Detail_Title__c);
    }
    
} catch(Exception e) {
    System.debug('❌ Migration failed: ' + e.getMessage());
    System.debug('Stack trace: ' + e.getStackTraceString());
} 