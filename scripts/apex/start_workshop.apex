// Start the Supercharge Experiences workshop
WorkshopController.startWorkshop('a01Ka00000T4v4zIAB');
System.debug('Workshop started successfully!');

// Verify User_Progress__c records were created
List<User_Progress__c> progress = [
    SELECT Id, Workshop_Step__c, IsCompleted__c, Workshop_Step__r.Name 
    FROM User_Progress__c 
    WHERE Workshop_Step__r.Workshop__c = 'a01Ka00000T4v4zIAB'
];

System.debug('Created ' + progress.size() + ' User_Progress__c records:');
for(User_Progress__c p : progress) {
    System.debug('- ' + p.Workshop_Step__r.Name + ' (Complete: ' + p.IsCompleted__c + ')');
} 