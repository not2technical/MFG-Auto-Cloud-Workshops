// Simple test for the Interest Tags API approach
// This tests the direct API call to get assigned Interest Tags

// Step 1: Get a workshop to test with
List<Workshop__c> workshops = [
    SELECT Id, Name, Industry_Features__c 
    FROM Workshop__c 
    WHERE Name LIKE '%Extend Agentforce%' 
    OR Name LIKE '%Smarter Sales%'
    LIMIT 1
];

if (workshops.isEmpty()) {
    System.debug('❌ No workshop found');
} else {
    Workshop__c workshop = workshops[0];
    System.debug('🎯 Testing with workshop: ' + workshop.Name + ' (' + workshop.Id + ')');
    
    // Step 2: Test the API call directly
    System.debug('🔧 Testing getAssignedInterestTagsFromAPI...');
    Map<String, Object> apiResult = WorkshopController.getAssignedInterestTagsFromAPI(workshop.Id);
    
    System.debug('📊 API Result Success: ' + apiResult.get('success'));
    if (apiResult.get('success') == true) {
        System.debug('✅ API call succeeded');
        System.debug('📄 API Response: ' + JSON.serializePretty(apiResult.get('data')));
    } else {
        System.debug('❌ API call failed');
        System.debug('📄 Error: ' + apiResult.get('error'));
    }
    
    // Step 3: Test the main method
    System.debug('🔍 Testing getAssignedInterestTags...');
    List<Map<String, Object>> assignedTags = WorkshopController.getAssignedInterestTags(workshop.Id);
    
    System.debug('📋 Found ' + assignedTags.size() + ' assigned Interest Tags:');
    for (Map<String, Object> tag : assignedTags) {
        System.debug('  ✅ ' + tag.get('name') + ' (' + tag.get('tagId') + ')');
        System.debug('     Description: ' + tag.get('description'));
    }
    
    System.debug('🎉 Test complete!');
} 