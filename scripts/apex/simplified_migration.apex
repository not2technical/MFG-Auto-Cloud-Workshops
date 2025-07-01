// Simplified Migration Script: Test basic Workshop_Step_Detail__c structure
// Workshop: "Supercharge Experiences: Connect Telemetry to CRM360"

List<Workshop_Step__c> workshopSteps = [
    SELECT Id, Name, Step_Order__c, Instructions__c 
    FROM Workshop_Step__c 
    WHERE Workshop__c = 'a01Ka00000T4v4zIAB' 
    AND Name != 'Place Holder'
    ORDER BY Step_Order__c
    LIMIT 3
];

List<Workshop_Step_Detail__c> detailsToInsert = new List<Workshop_Step_Detail__c>();

for(Workshop_Step__c step : workshopSteps) {
    // Create a simple test detail record for each step
    Workshop_Step_Detail__c detail = new Workshop_Step_Detail__c();
    detail.Workshop_Step__c = step.Id;
    detail.Detail_Order__c = 1;
    // Only using confirmed working fields
    detailsToInsert.add(detail);
}

try {
    insert detailsToInsert;
    System.debug('Successfully inserted ' + detailsToInsert.size() + ' test Workshop_Step_Detail__c records');
    
    // Query back to confirm
    List<Workshop_Step_Detail__c> insertedDetails = [
        SELECT Id, Name, Workshop_Step__c, Detail_Order__c 
        FROM Workshop_Step_Detail__c 
        WHERE Workshop_Step__c IN :workshopSteps
    ];
    
    System.debug('Found ' + insertedDetails.size() + ' detail records after insert');
    for(Workshop_Step_Detail__c detail : insertedDetails) {
        System.debug('Detail: ' + detail.Name + ', Order: ' + detail.Detail_Order__c + ', Step: ' + detail.Workshop_Step__c);
    }
    
} catch(Exception e) {
    System.debug('Migration failed: ' + e.getMessage());
    System.debug('Stack trace: ' + e.getStackTraceString());
} 