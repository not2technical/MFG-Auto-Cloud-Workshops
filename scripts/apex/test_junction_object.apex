// Test script for Workshop_Interest_Tag__c junction object
// This script tests the new many-to-many relationship between Workshop and Interest Tags

// Step 1: Get a workshop to test with
List<Workshop__c> workshops = [SELECT Id, Name, Industry_Features__c FROM Workshop__c LIMIT 1];
if (workshops.isEmpty()) {
    System.debug('❌ No workshops found');
} else {
    Workshop__c workshop = workshops[0];
    System.debug('🎯 Testing with workshop: ' + workshop.Name + ' (' + workshop.Id + ')');
    
    // Step 2: Get some Interest Tag Sync records
    List<Interest_Tag_Sync__c> syncRecords = [
        SELECT Id, Tag_Name__c, Interest_Tag_Id__c 
        FROM Interest_Tag_Sync__c 
        WHERE Tag_Name__c != null 
        ORDER BY Tag_Name__c 
        LIMIT 3
    ];
    
    System.debug('📊 Found ' + syncRecords.size() + ' Interest Tag Sync records');
    for (Interest_Tag_Sync__c syncRecord : syncRecords) {
        System.debug('  - ' + syncRecord.Tag_Name__c + ' (' + syncRecord.Id + ')');
    }
    
    // Step 3: Test the assignInterestTagsToWorkshop method
    if (!syncRecords.isEmpty()) {
        List<String> interestTagIds = new List<String>();
        for (Interest_Tag_Sync__c syncRecord : syncRecords) {
            interestTagIds.add(syncRecord.Interest_Tag_Id__c);
        }
        
        System.debug('🔧 Testing assignInterestTagsToWorkshop method...');
        String result = WorkshopController.assignInterestTagsToWorkshop(workshop.Id, interestTagIds);
        System.debug('✅ Assignment result: ' + result);
        
        // Step 4: Test the getAssignedInterestTags method
        System.debug('🔍 Testing getAssignedInterestTags method...');
        List<Map<String, Object>> assignedTags = WorkshopController.getAssignedInterestTags(workshop.Id);
        System.debug('📋 Found ' + assignedTags.size() + ' assigned tags:');
        for (Map<String, Object> tag : assignedTags) {
            System.debug('  - ' + tag.get('name') + ' (' + tag.get('tagId') + ')');
        }
        
        // Step 5: Check junction records directly
        System.debug('🔍 Checking junction records directly...');
        List<Workshop_Interest_Tag__c> junctionRecords = [
            SELECT Id, Workshop__c, Interest_Tag_Sync__c,
                   Interest_Tag_Sync__r.Tag_Name__c,
                   Workshop__r.Name
            FROM Workshop_Interest_Tag__c
            WHERE Workshop__c = :workshop.Id
        ];
        
        System.debug('📊 Found ' + junctionRecords.size() + ' junction records:');
        for (Workshop_Interest_Tag__c junction : junctionRecords) {
            System.debug('  - Workshop: ' + junction.Workshop__r.Name + 
                        ', Tag: ' + junction.Interest_Tag_Sync__r.Tag_Name__c);
        }
    }
} 