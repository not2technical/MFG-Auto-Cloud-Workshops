// Test script for the new junction-based Interest Tag assignment
// Execute this in Developer Console or VS Code Apex Execute

System.debug('=== Testing Junction-Based Interest Tag Assignment ===');

// Get a workshop to test with
List<Workshop__c> workshops = [SELECT Id, Name FROM Workshop__c WHERE Name LIKE '%Agentforce%' LIMIT 1];
if (workshops.isEmpty()) {
    workshops = [SELECT Id, Name FROM Workshop__c LIMIT 1];
}

if (workshops.isEmpty()) {
    System.debug('❌ No workshops found for testing');
    return;
}

Workshop__c testWorkshop = workshops[0];
System.debug('🎯 Testing with workshop: ' + testWorkshop.Name + ' (' + testWorkshop.Id + ')');

// Assign specific Interest Tags to this workshop
List<String> tagsToAssign = new List<String>{
    'Agentforce for Automotive',
    'Agentforce for Manufacturing', 
    'Sales Agreements',
    'Visit Management'
};

System.debug('📋 Assigning Interest Tags: ' + tagsToAssign);

// Test assignment by tag names
String result = WorkshopController.assignInterestTagsByName(testWorkshop.Id, tagsToAssign);
System.debug('🔄 Assignment Result: ' + result);

// Check the assignments
List<Interest_Tag_Sync__c> assignments = [
    SELECT Id, Tag_Name__c, Tag_Description__c, Workshops__c, Interest_Tag_Id__c, Is_Synced_to_Picklist__c
    FROM Interest_Tag_Sync__c 
    WHERE Workshops__c = :testWorkshop.Id
    ORDER BY Tag_Name__c
];

System.debug('📊 Found ' + assignments.size() + ' assignments for this workshop:');
for (Interest_Tag_Sync__c assignment : assignments) {
    System.debug('   - ' + assignment.Tag_Name__c + ' (Synced: ' + assignment.Is_Synced_to_Picklist__c + ')');
}

// Test the new getAssignedInterestTags method
List<Map<String, Object>> assignedTags = WorkshopController.getAssignedInterestTags(testWorkshop.Id);
System.debug('🎯 getAssignedInterestTags returned ' + assignedTags.size() + ' tags:');
for (Map<String, Object> tag : assignedTags) {
    System.debug('   - ' + tag.get('name') + ' (ID: ' + tag.get('tagId') + ')');
}

// Test duplicate assignment (should skip existing)
System.debug('🔄 Testing duplicate assignment...');
String duplicateResult = WorkshopController.assignInterestTagsByName(testWorkshop.Id, tagsToAssign);
System.debug('🔄 Duplicate Assignment Result: ' + duplicateResult);

System.debug('=== Test Complete ===');
System.debug('');
System.debug('✅ Benefits of Junction Approach:');
System.debug('   1. Direct relationship - no text matching needed');
System.debug('   2. Can assign multiple tags to multiple workshops');
System.debug('   3. Proper database normalization');
System.debug('   4. Easy to query and report on');
System.debug('   5. Fallback to legacy text matching if no direct assignments');
System.debug('');
System.debug('📋 Your Workshop LWC will now show Interest Tags assigned via this junction table!'); 