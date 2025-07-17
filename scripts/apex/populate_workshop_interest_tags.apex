// Populate Workshop with Interest Tags using the new junction object
// This script will assign relevant Interest Tags to the "Extend Agentforce: Smarter Sales Agreements" workshop

// Step 1: Find the workshop
List<Workshop__c> workshops = [
    SELECT Id, Name, Industry_Features__c 
    FROM Workshop__c 
    WHERE Name LIKE '%Extend Agentforce%' 
    OR Name LIKE '%Smarter Sales%'
    LIMIT 1
];

if (workshops.isEmpty()) {
    System.debug('❌ Workshop not found');
} else {
    Workshop__c workshop = workshops[0];
    System.debug('🎯 Found workshop: ' + workshop.Name);
    System.debug('📋 Current Industry Features: ' + workshop.Industry_Features__c);
    
    // Step 2: Define the Interest Tags we want to assign
    List<String> desiredTagNames = new List<String>{
        'Automotive',
        'Manufacturing',
        'AI/ML',
        'Sales',
        'Service',
        'Agentforce',
        'Einstein',
        'CRM',
        'Automation',
        'Integration'
    };
    
    System.debug('🔍 Looking for Interest Tags: ' + desiredTagNames);
    
    // Step 3: Find matching Interest Tag Sync records
    List<Interest_Tag_Sync__c> matchingSyncRecords = [
        SELECT Id, Tag_Name__c, Interest_Tag_Id__c, Tag_Description__c
        FROM Interest_Tag_Sync__c
        WHERE Tag_Name__c IN :desiredTagNames
        ORDER BY Tag_Name__c
    ];
    
    System.debug('📊 Found ' + matchingSyncRecords.size() + ' matching Interest Tag Sync records:');
    for (Interest_Tag_Sync__c syncRecord : matchingSyncRecords) {
        System.debug('  - ' + syncRecord.Tag_Name__c + ' (' + syncRecord.Id + ')');
    }
    
    // Step 4: Get the Interest Tag IDs for the assignment method
    List<String> interestTagIds = new List<String>();
    for (Interest_Tag_Sync__c syncRecord : matchingSyncRecords) {
        interestTagIds.add(syncRecord.Interest_Tag_Id__c);
    }
    
    // Step 5: Assign the Interest Tags to the workshop
    if (!interestTagIds.isEmpty()) {
        System.debug('🔧 Assigning ' + interestTagIds.size() + ' Interest Tags to workshop...');
        String result = WorkshopController.assignInterestTagsToWorkshop(workshop.Id, interestTagIds);
        System.debug('✅ Assignment result: ' + result);
        
        // Step 6: Verify the assignments
        System.debug('🔍 Verifying assignments...');
        List<Map<String, Object>> assignedTags = WorkshopController.getAssignedInterestTags(workshop.Id);
        System.debug('📋 Workshop now has ' + assignedTags.size() + ' assigned Interest Tags:');
        for (Map<String, Object> tag : assignedTags) {
            System.debug('  ✅ ' + tag.get('name') + ' - ' + tag.get('description'));
        }
        
        // Step 7: Show junction records
        System.debug('🔍 Junction records created:');
        List<Workshop_Interest_Tag__c> junctionRecords = [
            SELECT Id, Workshop__r.Name, Interest_Tag_Sync__r.Tag_Name__c
            FROM Workshop_Interest_Tag__c
            WHERE Workshop__c = :workshop.Id
            ORDER BY Interest_Tag_Sync__r.Tag_Name__c
        ];
        
        for (Workshop_Interest_Tag__c junction : junctionRecords) {
            System.debug('  🔗 ' + junction.Workshop__r.Name + ' <-> ' + junction.Interest_Tag_Sync__r.Tag_Name__c);
        }
        
        System.debug('🎉 Successfully populated workshop with Interest Tags!');
        System.debug('💡 The LWC will now show these Interest Tags instead of raw picklist values');
        
    } else {
        System.debug('⚠️ No matching Interest Tags found to assign');
    }
} 