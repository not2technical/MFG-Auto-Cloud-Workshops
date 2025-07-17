// Test script to sync Industry_Features__c picklist with Interest Tags
// Execute this in Developer Console or VS Code Apex Execute

System.debug('=== Testing Industry Features Picklist Sync ===');

// First, let's see what Interest Tags exist
List<InterestTag> tags = [SELECT Id, TagName, TagType FROM InterestTag WHERE TagType = 'Public' ORDER BY TagName];
System.debug('📊 Found ' + tags.size() + ' Interest Tags:');
for (InterestTag tag : tags) {
    System.debug('   - ' + tag.TagName);
}

// Now let's test the sync
String result = WorkshopController.syncIndustryFeaturesPicklist();
System.debug('🔄 Sync Result: ' + result);

// Test getting assigned tags for a workshop
List<Workshop__c> workshops = [SELECT Id, Name, Industry_Features__c FROM Workshop__c LIMIT 3];
System.debug('📋 Testing with ' + workshops.size() + ' workshops:');

for (Workshop__c workshop : workshops) {
    System.debug('🔍 Workshop: ' + workshop.Name);
    System.debug('   Industry Features: ' + workshop.Industry_Features__c);
    
    List<Map<String, Object>> assignedTags = WorkshopController.getAssignedInterestTags(workshop.Id);
    System.debug('   Assigned Tags: ' + assignedTags.size());
    for (Map<String, Object> tag : assignedTags) {
        System.debug('      - ' + tag.get('name'));
    }
}

System.debug('=== Test Complete ==='); 