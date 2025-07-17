// Test the specific workshop that should have 2 Interest Tags
// Workshop ID: a01Ka00000T4wetIAB

System.debug('🎯 Testing specific workshop: a01Ka00000T4wetIAB');

// Get workshop details
List<Workshop__c> workshops = [
    SELECT Id, Name, Industry_Features__c 
    FROM Workshop__c 
    WHERE Id = 'a01Ka00000T4wetIAB'
    LIMIT 1
];

if (workshops.isEmpty()) {
    System.debug('❌ Workshop not found');
} else {
    Workshop__c workshop = workshops[0];
    System.debug('✅ Found workshop: ' + workshop.Name);
    System.debug('📋 Industry Features: ' + workshop.Industry_Features__c);
    
    // Test the API call
    System.debug('🔧 Testing API call...');
    Map<String, Object> apiResult = WorkshopController.getAssignedInterestTagsFromAPI(workshop.Id);
    System.debug('📊 API Success: ' + apiResult.get('success'));
    
    if (apiResult.get('success') == true) {
        System.debug('📄 API Response: ' + JSON.serializePretty(apiResult.get('data')));
    } else {
        System.debug('❌ API Error: ' + apiResult.get('error'));
    }
    
    // Test the main method
    System.debug('🔧 Testing main method...');
    List<Map<String, Object>> assignedTags = WorkshopController.getAssignedInterestTags(workshop.Id);
    System.debug('📊 Found ' + assignedTags.size() + ' assigned tags');
    
    for (Map<String, Object> tag : assignedTags) {
        System.debug('🏷️ Tag: ' + tag.get('name') + ' (ID: ' + tag.get('tagId') + ')');
    }
}

System.debug('🎉 Test complete!'); 