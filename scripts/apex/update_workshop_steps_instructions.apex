// Update Workshop Step Instructions for "Supercharge Experiences: Connect Telemetry to CRM360"
// Workshop ID: a01Ka00000T4v4zIAB

List<Workshop_Step__c> stepsToUpdate = [SELECT Id, Name, Step_Order__c FROM Workshop_Step__c WHERE Workshop__c = 'a01Ka00000T4v4zIAB' ORDER BY Step_Order__c];

for(Workshop_Step__c step : stepsToUpdate) {
    if(step.Step_Order__c == 1) {
        // Step 1: Context Service Configuration Guide
        step.Instructions__c = '<p><strong>Context Service Configuration Guide</strong></p>' +
            '<p>Guided steps to create and extend a context service definition for connected vehicles or Assets. This foundational section introduces the workshop objectives and provides overview of the hands-on Connected Assets and Asset Centric Service experience.</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Configuration%20Guide/image26.png" alt="Context Service Configuration Guide Header"></img></p>' +
            '<p><strong>Workshop Overview:</strong></p>' +
            '<p>This comprehensive guide will take you through the complete process of setting up connected assets and implementing actionable event management using Salesforce\'s powerful Context Service capabilities.</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Configuration%20Guide/image73.png" alt="Connected Assets Overview"></img></p>';
    }
    else if(step.Step_Order__c == 2) {
        // Step 2: Cloning an existing definition
        step.Instructions__c = '<p><strong>Cloning an existing definition</strong></p>' +
            '<p>Get off to a fast start by cloning an Out of the Box context definition.</p>' +
            '<ol><li><strong>Navigate to Context Definitions:</strong> Type "Context service" in setup search and click on "Context Definitions"<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image25.png" alt="Navigate to Context Definitions"></img></li>' +
            '<li><strong>Select VehicleFaultEventDetail:</strong> In the Standard Definitions tab, find VehicleFaultEventDetail and click the dropdown icon<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image36.png" alt="Select VehicleFaultEventDetail"></img></li>' +
            '<li><strong>Clone the Definition:</strong> Click on "Clone" to create a copy<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image50.png" alt="Clone Definition"></img></li>' +
            '<li><strong>Name and Save:</strong> Paste "Initials_Asset_Context_Def" into input field and click Save<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image39.png" alt="Name and Save Definition"></img></li></ol>';
    }
    else if(step.Step_Order__c == 3) {
        // Step 3: Context Service Customization
        step.Instructions__c = '<p><strong>Context Service Customization</strong></p>' +
            '<p>Configure the new context definition for Assets. Edit the cloned Context Definition to align to connected asset event stream.</p>' +
            '<ol><li><strong>Access Custom Definitions:</strong> Click on Custom Definitions, then click the dropdown icon, and select Edit<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image24.png" alt="Access Custom Definitions"></img></li>' +
            '<li><strong>Begin Modifications:</strong> Click "Next" to start modifying attributes and adding new nodes<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image12.png" alt="Begin Modifications"></img></li>' +
            '<li><strong>Add Child Node:</strong> Click "Add Child Node" to create a new node under signals<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image33.png" alt="Add Child Node"></img></li>' +
            '<li><strong>Create Thresholds Node:</strong> In the new child node, type "thresholds" and click Next<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image49.png" alt="Create Thresholds Node"></img></li></ol>';
    }
    else if(step.Step_Order__c == 4) {
        // Step 4: Context Definition Attributes
        step.Instructions__c = '<p><strong>Context Definition Attributes</strong></p>' +
            '<p>Attributes are fields on a node that can be mapped to sObjects or any input data source. Rename attributes from vehicle-focused to asset-focused.</p>' +
            '<ol><li><strong>Rename Attributes:</strong> In the Attribute section, find "vehicleName" and replace with "assetName". Repeat for "vehicleId" and replace with "assetId"<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Attributes/image55.png" alt="Rename Attributes"></img></li>' +
            '<li><strong>Add Attributes to Thresholds:</strong> Click on thresholds node and click "Add Attributes"<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Attributes/image20.png" alt="Add Attributes to Thresholds"></img></li>' +
            '<li><strong>Configure Threshold Attributes:</strong> Create "lower" and "upper" attributes with INPUT OUTPUT type and Number data type, then click Next<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Attributes/image44.png" alt="Configure Threshold Attributes"></img></li></ol>';
    }
    else if(step.Step_Order__c == 5) {
        // Step 5: Context Definition Tagging
        step.Instructions__c = '<p><strong>Context Definition Tagging</strong></p>' +
            '<p>Tags are used to define the context structure and point to a node or attribute so the consuming application can query data directly from the context definition.</p>' +
            '<ol><li><strong>Add Asset Tags:</strong> Click on Events node and add tags for assetId and assetName<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Tagging/image38.png" alt="Add Asset Tags"></img></li>' +
            '<li><strong>Remove Vehicle Tags:</strong> Remove the old vehicleId and vehicleName tags by clicking the delete icons<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Tagging/image21.png" alt="Remove Vehicle Tags"></img></li>' +
            '<li><strong>Tag Thresholds Node:</strong> Add tags to the thresholds node and its lower and upper attributes, then click Save<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Tagging/image13.png" alt="Tag Thresholds Node"></img></li></ol>';
    }
    else if(step.Step_Order__c == 6) {
        // Step 6: Context Definition Mapping
        step.Instructions__c = '<p><strong>Context Definition Mapping</strong></p>' +
            '<p>Context Mapping is the mapping of nodes and attributes to an input data source. Replace Vehicle mappings with Asset object mappings.</p>' +
            '<ol><li><strong>Navigate to Context Definition:</strong> Click on Custom Definitions and select your context definition<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Mapping/image15.png" alt="Navigate to Context Definition"></img></li>' +
            '<li><strong>Access Map Data:</strong> Click on Map Data, click the dropdown, and click Edit<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Mapping/image29.png" alt="Access Map Data"></img></li>' +
            '<li><strong>Replace Vehicle with Asset:</strong> Remove current Vehicle mappings and add Asset object</li>' +
            '<li><strong>Configure Mappings:</strong> Map Event node to Asset object, configure assetId and assetName field mappings</li>' +
            '<li><strong>Generate Mappings:</strong> Generate all mappings for thresholds node and activate the definition<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Mapping/image43.png" alt="Activate Definition"></img></li></ol>';
    }
    else if(step.Step_Order__c == 7) {
        // Step 7: Actionable Event Management
        step.Instructions__c = '<p><strong>Actionable Event Management</strong></p>' +
            '<p>Define the actions to be performed for actionable events generated by assets by creating actionable event orchestrations.</p>' +
            '<ol><li><strong>Navigate to Actionable Event Management:</strong> Open App Launcher, type "Actionable", and click on Actionable Event Management<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Actionable%20Event%20Management/image61.png" alt="Navigate to Actionable Event Management"></img></li>' +
            '<li><strong>Create New Orchestration:</strong> Type "Initials_MYAEO" as the orchestration name<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Actionable%20Event%20Management/image48.png" alt="Create New Orchestration"></img></li>' +
            '<li><strong>Configure Event Types:</strong> Set up Event Type "WorkshopEvent", Subtype "WorkshopSubtype", Usage type as Automotive/Manufacturing, and ExpressionSet-Based execution<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Actionable%20Event%20Management/image30.png" alt="Configure Event Types"></img></li></ol>';
    }
    else if(step.Step_Order__c == 8) {
        // Step 8: Execution Procedures and Expression Sets
        step.Instructions__c = '<p><strong>Execution Procedures and Expression Sets</strong></p>' +
            '<p>Pull variables from the event stream and CRM to define rules and actions. Create list group filters with OR conditions for lower/upper thresholds.</p>' +
            '<ol><li><strong>Create List Group Filter:</strong> Add filter with OR conditions for lower (&lt; 1400) and upper (&gt; 1800) thresholds<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image62.png" alt="Expression Sets Configuration"></img></li>' +
            '<li><strong>Set Up Local Resources:</strong> Create variables: alertSubject, isActive, effDateTime, validUntilDateTime<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image72.png" alt="Local Resources"></img></li>' +
            '<li><strong>Configure Record Action:</strong> Set up RecordAlert creation with field mappings</li>' +
            '<li><strong>Activate Procedure:</strong> Save and activate the execution procedure<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image23.png" alt="Save and Activate"></img></li>' +
            '<li><strong>Refresh Decision Tables:</strong> Update decision tables to reflect changes</li></ol>';
    }
    else if(step.Step_Order__c == 9) {
        // Step 9: Testing with Developer Console
        step.Instructions__c = '<p><strong>Testing with Developer Console</strong></p>' +
            '<p>Time to test and see if all the hard work pays off. Navigate to Manufacturing Service Console to get an AssetId and test the complete workflow.</p>' +
            '<ol><li><strong>Access Manufacturing Service Console:</strong> Navigate to the Manufacturing Service Console from the App Launcher<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image52.png" alt="Access Service Console"></img></li>' +
            '<li><strong>Select Asset Record:</strong> Navigate to Asset entity and select any asset from the list<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image35.png" alt="Select Asset Record"></img></li>' +
            '<li><strong>Copy Asset ID:</strong> Copy the AssetId from the browser URL<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image8.png" alt="Copy Asset ID"></img></li>' +
            '<li><strong>Execute Test Payload:</strong> Use Developer Console to execute the test payload:<br/>' +
            '<pre>String jsonBody = \'{"type": "WorkshopEvent","eventData": "{\\"Event\\":[{\\"assetId\\":\\"INSERT_ID\\",\\"id\\":\\"INSERT_ID\\",\\"businessObjectType\\":\\"Asset\\",\\"signals\\":[{\\"thresholds\\":{\\"lower\\":\\"1500\\",\\"upper\\":\\"1880\\"}}]}]}"}\';\nInboundEventService.sendEvent(jsonBody);</pre>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image19.png" alt="Execute Test Payload"></img></li>' +
            '<li><strong>Verify Results:</strong> Check that alerts are created successfully on the Asset record<br/>' +
            '<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image53.png" alt="Verify Results"></img></li></ol>' +
            '<p><strong>🎉 Congratulations!</strong> You have successfully completed the hands-on workshop on Salesforce Context Service in Automotive and Manufacturing Cloud!</p>';
    }
}

// Update all steps
update stepsToUpdate;

System.debug('Successfully updated ' + stepsToUpdate.size() + ' workshop step instructions for Supercharge Experiences: Connect Telemetry to CRM360'); 