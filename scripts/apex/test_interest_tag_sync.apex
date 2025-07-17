// Test script to sync Interest Tags to custom object
// Execute this in Developer Console or VS Code Apex Execute

System.debug('=== Testing Interest Tag Sync to Custom Object ===');

// First, let's see what Interest Tags exist
List<InterestTag> tags = [SELECT Id, TagName, TagType FROM InterestTag WHERE TagType = 'Public' ORDER BY TagName];
System.debug('📊 Found ' + tags.size() + ' Interest Tags:');
for (InterestTag tag : tags) {
    System.debug('   - ' + tag.TagName + ' (' + tag.Id + ')');
}

// Check existing sync records
List<Interest_Tag_Sync__c> existingSyncRecords = [
    SELECT Id, Tag_Name__c, Tag_Type__c, Interest_Tag_Id__c, Is_Synced_to_Picklist__c
    FROM Interest_Tag_Sync__c
    ORDER BY Tag_Name__c
];
System.debug('📋 Found ' + existingSyncRecords.size() + ' existing sync records:');
for (Interest_Tag_Sync__c syncRecord : existingSyncRecords) {
    System.debug('   - ' + syncRecord.Tag_Name__c + ' (Synced: ' + syncRecord.Is_Synced_to_Picklist__c + ')');
}

// Now let's test the sync
String result = WorkshopController.syncInterestTagsToCustomObject();
System.debug('🔄 Sync Result: ' + result);

// Check sync records after sync
List<Interest_Tag_Sync__c> afterSyncRecords = [
    SELECT Id, Tag_Name__c, Tag_Type__c, Interest_Tag_Id__c, Is_Synced_to_Picklist__c
    FROM Interest_Tag_Sync__c
    ORDER BY Tag_Name__c
];
System.debug('📋 Found ' + afterSyncRecords.size() + ' sync records after sync:');
for (Interest_Tag_Sync__c syncRecord : afterSyncRecords) {
    System.debug('   - ' + syncRecord.Tag_Name__c + ' (Synced: ' + syncRecord.Is_Synced_to_Picklist__c + ')');
}

// Check unsynced records (what Flow will process)
List<Interest_Tag_Sync__c> unsyncedRecords = WorkshopController.getUnsyncedInterestTags();
System.debug('⏳ Found ' + unsyncedRecords.size() + ' unsynced records for Flow processing:');
for (Interest_Tag_Sync__c unsyncedRecord : unsyncedRecords) {
    System.debug('   - ' + unsyncedRecord.Tag_Name__c);
}

System.debug('=== Test Complete ===');
System.debug('Next Steps:');
System.debug('1. Deploy the custom object and Apex changes');
System.debug('2. Create a Flow triggered on Interest_Tag_Sync__c record creation');
System.debug('3. Flow should add Tag_Name__c to Workshop__c.Industry_Features__c picklist');
System.debug('4. Flow should update Is_Synced_to_Picklist__c = true when complete'); 