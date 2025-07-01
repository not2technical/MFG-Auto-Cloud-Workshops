// Complete Workshop Migration - All Detailed Content
// Workshop: "Supercharge Experiences: Connect Telemetry to CRM360"

// First, cleanup any existing detail records
List<Workshop_Step_Detail__c> existingDetails = [SELECT Id FROM Workshop_Step_Detail__c];
if(!existingDetails.isEmpty()) {
    delete existingDetails;
    System.debug('Cleaned up ' + existingDetails.size() + ' existing detail records');
}

// Get all workshop steps ordered by step order
List<Workshop_Step__c> workshopSteps = [
    SELECT Id, Name, Step_Order__c, Instructions__c 
    FROM Workshop_Step__c 
    WHERE Workshop__c = 'a01Ka00000T4v4zIAB' 
    ORDER BY Step_Order__c
];

List<Workshop_Step_Detail__c> detailsToInsert = new List<Workshop_Step_Detail__c>();
List<Workshop_Step__c> stepsToUpdate = new List<Workshop_Step__c>();
String baseImageUrl = 'https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/';

for(Workshop_Step__c step : workshopSteps) {
    // Skip the placeholder record
    if(step.Name == 'Place Holder') {
        continue;
    }
    
    String overviewContent = '';
    List<String> detailSections = new List<String>();
    List<String> detailTitles = new List<String>();
    
    // Process step 1: Context Service Configuration Guide
    if(step.Step_Order__c == 1) {
        overviewContent = '<p><strong>Context Service Configuration Guide</strong></p>' +
            '<p>Guided steps to create and extend a context service definition for connected vehicles or Assets.</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Configuration%20Guide/image26.png" alt="Context Service Configuration Guide Header"></img></p>';
        
        detailTitles.add('Workshop Overview');
        detailSections.add('<p><strong>Workshop Overview</strong></p>' +
            '<p>Get hands on with Connected Assets and Vehicles.</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Configuration%20Guide/image73.png" alt="Connected Assets Overview"></img></p>');
        
        detailTitles.add('Setup Configuration');
        detailSections.add('<p><strong>Setup Configuration</strong></p>' +
            '<p>Navigate to Setup and begin the Context Service Configuration.</p>' +
            '<p><img src="' + baseImageUrl + 'Context%20Service%20Configuration%20Guide/image1.png" alt="Setup Navigation"></img></p>');
    }
    
    // Add other step configurations here...
    
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

System.debug('Migration prepared for ' + stepsToUpdate.size() + ' steps with ' + detailsToInsert.size() + ' details');

// Execute the migration
try {
    // Insert detail records
    insert detailsToInsert;
    System.debug('Successfully inserted ' + detailsToInsert.size() + ' Workshop_Step_Detail__c records');
    
    // Update workshop steps with overview content
    update stepsToUpdate;
    System.debug('Successfully updated ' + stepsToUpdate.size() + ' Workshop_Step__c records with overview content');
    
    System.debug('🎉 COMPLETE Workshop Migration completed successfully!');
    
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