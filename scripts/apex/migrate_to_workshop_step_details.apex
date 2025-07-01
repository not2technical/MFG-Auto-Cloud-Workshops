// Data Migration Script: Move detailed content from Workshop_Step__c to Workshop_Step_Detail__c
// Workshop: "Supercharge Experiences: Connect Telemetry to CRM360"

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
    
    // Extract overview and detailed sections based on step content
    if(step.Step_Order__c == 1) {
        // Context Service Configuration Guide
        overviewContent = '<p><strong>Context Service Configuration Guide</strong></p>' +
            '<p>Guided steps to create and extend a context service definition for connected vehicles or Assets. This foundational section introduces the workshop objectives and provides overview of the hands-on Connected Assets and Asset Centric Service experience.</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Configuration%20Guide/image26.png" alt="Context Service Configuration Guide Header"></img></p>';
        
        detailSections.add('<p><strong>Step 1: Navigate to Setup</strong></p>' +
            '<p>From the App Launcher, search for and select "Context Service Configuration"</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Configuration%20Guide/image1.png" alt="Navigate to Setup"></img></p>');
        
        detailSections.add('<p><strong>Step 2-7: Complete Configuration</strong></p>' +
            '<p>Follow the guided setup process to enable Context Service, configure permissions, and save your configuration.</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Configuration%20Guide/image73.png" alt="Connected Assets Overview"></img></p>');
            
    } else if(step.Step_Order__c == 2) {
        // Cloning an existing definition
        overviewContent = '<p><strong>Cloning an Existing Definition</strong></p>' +
            '<p>Get off to a fast start by cloning an Out of the Box context definition.</p>';
        
        // Split the existing detailed content into multiple detail records
        detailSections.add('<p><strong>Navigate to Context Definitions</strong></p>' +
            '<p>Type "Context service" in setup search and click on "Context Definitions"</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image25.png" alt="Navigate to Context Definitions"></img></p>');
            
        detailSections.add('<p><strong>Select and Clone VehicleFaultEventDetail</strong></p>' +
            '<p>In the Standard Definitions tab, find VehicleFaultEventDetail, click the dropdown icon, and select "Clone"</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image36.png" alt="Select VehicleFaultEventDetail"></img></p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image50.png" alt="Clone Definition"></img></p>');
            
        detailSections.add('<p><strong>Name and Save the Cloned Definition</strong></p>' +
            '<p>Paste "Initials_Asset_Context_Def" into input field and click Save</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image39.png" alt="Name and Save Definition"></img></p>');
            
    } else if(step.Step_Order__c == 3) {
        // Context Service Customization
        overviewContent = '<p><strong>Context Service Customization</strong></p>' +
            '<p>Configure the new context definition for Assets. Edit the cloned Context Definition to align to connected asset event stream.</p>';
            
        detailSections.add('<p><strong>Access Custom Definitions</strong></p>' +
            '<p>Click on Custom Definitions, then click the dropdown icon, and select Edit</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image24.png" alt="Access Custom Definitions"></img></p>');
            
        detailSections.add('<p><strong>Begin Modifications and Add Child Node</strong></p>' +
            '<p>Click "Next" to start modifying attributes and adding new nodes. Click "Add Child Node" to create a new node under signals</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image12.png" alt="Begin Modifications"></img></p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image33.png" alt="Add Child Node"></img></p>');
            
        detailSections.add('<p><strong>Create Thresholds Node</strong></p>' +
            '<p>In the new child node, type "thresholds" and click Next</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image49.png" alt="Create Thresholds Node"></img></p>');
            
    } else if(step.Step_Order__c == 4) {
        // Context Definition Attributes
        overviewContent = '<p><strong>Context Definition Attributes</strong></p>' +
            '<p>Attributes are fields on a node that can be mapped to sObjects or any input data source. Rename attributes from vehicle-focused to asset-focused.</p>';
            
        detailSections.add('<p><strong>Rename Vehicle Attributes to Asset</strong></p>' +
            '<p>In the Attribute section, find "vehicleName" and replace with "assetName". Repeat for "vehicleId" and replace with "assetId"</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Attributes/image55.png" alt="Rename Attributes"></img></p>');
            
        detailSections.add('<p><strong>Configure Thresholds Attributes</strong></p>' +
            '<p>Click on thresholds node and click "Add Attributes". Create "lower" and "upper" attributes with INPUT OUTPUT type and Number data type, then click Next</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Attributes/image20.png" alt="Add Attributes to Thresholds"></img></p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Attributes/image44.png" alt="Configure Threshold Attributes"></img></p>');
            
    } else if(step.Step_Order__c == 5) {
        // Context Definition Tagging
        overviewContent = '<p><strong>Context Definition Tagging</strong></p>' +
            '<p>Tags are used to define the context structure and point to a node or attribute so the consuming application can query data directly from the context definition.</p>';
            
        detailSections.add('<p><strong>Update Asset Tags</strong></p>' +
            '<p>Click on Events node and add tags for assetId and assetName. Remove the old vehicleId and vehicleName tags by clicking the delete icons</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Tagging/image38.png" alt="Add Asset Tags"></img></p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Tagging/image21.png" alt="Remove Vehicle Tags"></img></p>');
            
        detailSections.add('<p><strong>Tag Thresholds Node</strong></p>' +
            '<p>Add tags to the thresholds node and its lower and upper attributes, then click Save</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Tagging/image13.png" alt="Tag Thresholds Node"></img></p>');
            
    } else if(step.Step_Order__c == 6) {
        // Context Definition Mapping
        overviewContent = '<p><strong>Context Definition Mapping</strong></p>' +
            '<p>Context Mapping is the mapping of nodes and attributes to an input data source. Replace Vehicle mappings with Asset object mappings.</p>';
            
        detailSections.add('<p><strong>Access Mapping Interface</strong></p>' +
            '<p>Click on Custom Definitions and select your context definition. Click on Map Data, click the dropdown, and click Edit</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Mapping/image15.png" alt="Navigate to Context Definition"></img></p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Mapping/image29.png" alt="Access Map Data"></img></p>');
            
        detailSections.add('<p><strong>Configure Asset Mappings</strong></p>' +
            '<p>Remove current Vehicle mappings and add Asset object. Map Event node to Asset object, configure assetId and assetName field mappings. Generate all mappings for thresholds node and activate the definition</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Mapping/image43.png" alt="Activate Definition"></img></p>');
    } else {
        // For other steps, keep existing content as overview and create minimal details
        overviewContent = content.length() > 1000 ? content.substring(0, 1000) + '...' : content;
        detailSections.add('<p><strong>Detailed Instructions</strong></p>' + 
            (content.length() > 1000 ? content.substring(1000) : '<p>Follow the step-by-step instructions to complete this section.</p>'));
    }
    
    // Update the workshop step with overview content
    step.Instructions__c = overviewContent;
    stepsToUpdate.add(step);
    
    // Create detail records
    Integer detailOrder = 1;
    for(String detailContent : detailSections) {
        Workshop_Step_Detail__c detail = new Workshop_Step_Detail__c();
        detail.Workshop_Step__c = step.Id;
        detail.Detail_Order__c = detailOrder;
        detail.Detail_Title__c = 'Section ' + detailOrder;
        detail.Detail_Instructions__c = detailContent;
        detailsToInsert.add(detail);
        detailOrder++;
    }
}

// Execute the migration
try {
    // Insert detail records
    insert detailsToInsert;
    System.debug('Successfully inserted ' + detailsToInsert.size() + ' Workshop_Step_Detail__c records');
    
    // Update workshop steps with overview content
    update stepsToUpdate;
    System.debug('Successfully updated ' + stepsToUpdate.size() + ' Workshop_Step__c records with overview content');
    
    System.debug('Migration completed successfully!');
    
} catch(Exception e) {
    System.debug('Migration failed: ' + e.getMessage());
    System.debug('Stack trace: ' + e.getStackTraceString());
} 