// Update WSD-0000003 and WSD-0000004 with new Review and Enable Setup Requirements content
// This script updates the step details for the renamed step

// Base image URL for the new step
String baseImageUrl = 'https://github.com/not2technical/MFG-Auto-Cloud-Workshops/blob/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Review%20and%20Enable%20Setup%20Requirements/';

// Query existing records
List<Workshop_Step_Detail__c> existingDetails = [
    SELECT Id, Name, Detail_Title__c, Detail_Instructions__c 
    FROM Workshop_Step_Detail__c 
    WHERE Name IN ('WSD-0000003', 'WSD-0000004')
];

System.debug('Found ' + existingDetails.size() + ' existing step details');

List<Workshop_Step_Detail__c> detailsToUpdate = new List<Workshop_Step_Detail__c>();

for (Workshop_Step_Detail__c detail : existingDetails) {
    if (detail.Name == 'WSD-0000003') {
        // Update WSD-0000003 - Verifying Context Service
        detail.Detail_Title__c = 'Verifying Context Service';
        detail.Detail_Instructions__c = '<p>First, we need to ensure that Context Service is enabled and configured correctly in your org.</p>' +
            '<p><img src="' + baseImageUrl + 'Screenshot%202025-07-02%20at%2012.13.39%E2%80%AFPM.png?raw=true" alt="Verifying Context Service" style="max-width: 300px !important; width: 300px !important; height: auto !important;" /></p>' +
            '<p><strong>Key Points to Verify:</strong></p>' +
            '<ul>' +
            '<li>Context Service is enabled in your org</li>' +
            '<li>Proper permissions are assigned</li>' +
            '<li>Context definitions are accessible</li>' +
            '</ul>';
        detailsToUpdate.add(detail);
    } else if (detail.Name == 'WSD-0000004') {
        // Update WSD-0000004 - Verifying Actionable Event orchestration is Enabled
        detail.Detail_Title__c = 'Verifying Actionable Event orchestration is Enabled';
        detail.Detail_Instructions__c = '<p>Next, we need to confirm that Actionable Event orchestration is properly enabled and ready for use.</p>' +
            '<p><img src="' + baseImageUrl + 'Screenshot%202025-07-02%20at%2012.18.52%E2%80%AFPM.png?raw=true" alt="Verifying Actionable Event orchestration is Enabled" style="max-width: 300px !important; width: 300px !important; height: auto !important;" /></p>' +
            '<p><strong>Key Points to Verify:</strong></p>' +
            '<ul>' +
            '<li>Actionable Event Management is enabled</li>' +
            '<li>Event orchestration permissions are configured</li>' +
            '<li>Event types and subtypes are available</li>' +
            '</ul>';
        detailsToUpdate.add(detail);
    }
}

// Update the records
try {
    update detailsToUpdate;
    System.debug('Successfully updated ' + detailsToUpdate.size() + ' step details');
    
    // Query to verify the updates
    List<Workshop_Step_Detail__c> updatedDetails = [
        SELECT Id, Name, Detail_Title__c, Detail_Instructions__c 
        FROM Workshop_Step_Detail__c 
        WHERE Name IN ('WSD-0000003', 'WSD-0000004')
        ORDER BY Name
    ];
    
    System.debug('Updated Step Details:');
    for (Workshop_Step_Detail__c detail : updatedDetails) {
        System.debug('Name: ' + detail.Name + ', Title: ' + detail.Detail_Title__c);
        System.debug('Instructions length: ' + detail.Detail_Instructions__c.length());
    }
    
} catch (Exception e) {
    System.debug('Error updating step details: ' + e.getMessage());
} 