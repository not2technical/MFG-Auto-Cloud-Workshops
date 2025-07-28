// Cleanup Telemetry 360 Workshop Step Detail Duplicates
// This script removes 11 exact duplicate records to eliminate redundancy

System.debug('🎯 Starting cleanup of duplicate Workshop_Step_Detail__c records');

List<Id> duplicateIds = new List<Id>{
    'a04Ka00000H3LjzIAF',  // WSD-0000031 - Step 5: Edit Custom Definition (duplicate)
    'a04Ka00000H3LjQIAV',  // WSD-0000021 - Steps 6-8: Add Child Node and Configure (duplicate)
    'a04Ka00000H3LjRIAV',  // WSD-0000022 - Step 9: Rename Vehicle to Asset Attributes (duplicate)
    'a04Ka00000H3LjSIAV',  // WSD-0000023 - Steps 10-11: Add Threshold Attributes (duplicate)
    'a04Ka00000H3LjTIAV',  // WSD-0000024 - Steps 12-13: Tag Asset Attributes (duplicate)
    'a04Ka00000H3LjUIAV',  // WSD-0000025 - Step 14: Add Threshold Tags (duplicate)
    'a04Ka00000H3Lk5IAF',  // WSD-0000037 - Steps 15-17: Start Data Mapping (duplicate)
    'a04Ka00000H3Lk6IAF',  // WSD-0000038 - Steps 23-27: Input Mapping and Activation (duplicate)
    'a04Ka00000H3Lk7IAF',  // WSD-0000039 - Steps 31-35: Setup Execution Procedure (duplicate)
    'a04Ka00000H3Lk8IAF',  // WSD-0000040 - Steps 50-52: Get Asset ID (duplicate)
    'a04Ka00000H3LjZIAV'   // WSD-0000030 - Steps 53-55: Execute Test (duplicate)
};

// Query the duplicate records before deletion for verification
List<Workshop_Step_Detail__c> duplicatesToDelete = [
    SELECT Id, Name, Detail_Title__c, Workshop_Step__r.Name
    FROM Workshop_Step_Detail__c 
    WHERE Id IN :duplicateIds
];

System.debug('📋 Found ' + duplicatesToDelete.size() + ' duplicate records to delete:');
for (Workshop_Step_Detail__c duplicate : duplicatesToDelete) {
    System.debug('  • ' + duplicate.Name + ' - ' + duplicate.Detail_Title__c + ' (Step: ' + duplicate.Workshop_Step__r.Name + ')');
}

// Perform the deletion
if (!duplicatesToDelete.isEmpty()) {
    try {
        delete duplicatesToDelete;
        System.debug('✅ Successfully deleted ' + duplicatesToDelete.size() + ' duplicate records');
        
        // Verify the cleanup
        Integer remainingCount = [SELECT COUNT() FROM Workshop_Step_Detail__c WHERE Workshop_Step__r.Workshop__r.id = 'a01Ka00000T4v4zIAB'];
        System.debug('📊 Remaining Workshop_Step_Detail__c records: ' + remainingCount);
        System.debug('🎉 Cleanup completed successfully!');
        
    } catch (Exception e) {
        System.debug('❌ Error during deletion: ' + e.getMessage());
        System.debug('Stack trace: ' + e.getStackTraceString());
    }
} else {
    System.debug('ℹ️ No duplicate records found to delete');
}

System.debug('🏁 Cleanup process complete!'); 