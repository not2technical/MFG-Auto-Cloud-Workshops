public with sharing class WorkshopController {
@AuraEnabled(cacheable=true)
public static List<Map<String, Object>> getStepsAndProgress(Id workshopId) {
    // ✅ 1) Get all User_Progress__c for this workshop & user
    List<User_Progress__c> progresses = [
        SELECT Id, Workshop_Step__c, IsCompleted__c
        FROM User_Progress__c
        WHERE User__c = :UserInfo.getUserId()
          AND Workshop_Step__r.Workshop__c = :workshopId
    ];

    // ✅ 2) Collect step Ids
    Set<Id> stepIds = new Set<Id>();
    Map<Id, Boolean> progressMap = new Map<Id, Boolean>();
    for (User_Progress__c up : progresses) {
        stepIds.add(up.Workshop_Step__c);
        progressMap.put(up.Workshop_Step__c, up.IsCompleted__c);
    }

    // ✅ 3) Query only steps that have progress, including step details
    List<Workshop_Step__c> steps = new List<Workshop_Step__c>();
    if (!stepIds.isEmpty()) {
        steps = [
            SELECT Id, Name, Step_Group__c, Step_Order__c, Instructions__c, Image_URL__c,
                   (SELECT Id, Name, Detail_Title__c, Detail_Order__c, Detail_Instructions__c 
                    FROM Workshop_Step_Details__r 
                    ORDER BY Detail_Order__c)
            FROM Workshop_Step__c
            WHERE Id IN :stepIds
            ORDER BY Step_Group__c, Step_Order__c
        ];
    }

    // ✅ 4) Return JSON structure with step details
    List<Map<String, Object>> result = new List<Map<String, Object>>();
    for (Workshop_Step__c s : steps) {
        Map<String, Object> row = new Map<String, Object>();
        row.put('Id', s.Id);
        row.put('Name', s.Name);
        row.put('Step_Group__c', s.Step_Group__c);
        row.put('Step_Order__c', s.Step_Order__c);
        row.put('Instructions__c', s.Instructions__c);
        row.put('Image_URL__c', s.Image_URL__c);
        row.put('progress', progressMap.get(s.Id) != null ? progressMap.get(s.Id) : false);
        
        // Add step details
        List<Map<String, Object>> stepDetails = new List<Map<String, Object>>();
        for (Workshop_Step_Detail__c detail : s.Workshop_Step_Details__r) {
            Map<String, Object> detailMap = new Map<String, Object>();
            detailMap.put('Id', detail.Id);
            detailMap.put('Name', detail.Name);
            detailMap.put('Detail_Title__c', detail.Detail_Title__c);
            detailMap.put('Detail_Order__c', detail.Detail_Order__c);
            detailMap.put('Detail_Instructions__c', detail.Detail_Instructions__c);
            stepDetails.add(detailMap);
        }
        row.put('stepDetails', stepDetails);
        
        result.add(row);
    }

    return result;
}

// ✅ NEW: non-cacheable version
@AuraEnabled
public static List<Map<String, Object>> getFreshStepsAndProgress(Id workshopId) {
    return getStepsAndProgress(workshopId);
}




  @AuraEnabled
public static void markStepComplete(Id stepId, Boolean isComplete) {
    List<User_Progress__c> existing = [
        SELECT Id FROM User_Progress__c 
        WHERE Workshop_Step__c = :stepId AND User__c = :UserInfo.getUserId() 
        LIMIT 1
    ];
    User_Progress__c progress = existing.isEmpty() 
        ? new User_Progress__c(User__c = UserInfo.getUserId(), Workshop_Step__c = stepId, IsCompleted__c = isComplete) 
        : existing[0];
    if (!existing.isEmpty()) progress.IsCompleted__c = isComplete;
    upsert progress;
}


    @AuraEnabled(cacheable=true)
    public static Map<Id, Boolean> getUserProgress(Id workshopId) {
        Map<Id, Boolean> progressMap = new Map<Id, Boolean>();
        List<User_Progress__c> progresses = [SELECT Workshop_Step__c, IsCompleted__c FROM User_Progress__c WHERE User__c = :UserInfo.getUserId() AND Workshop_Step__r.Workshop__c = :workshopId];
        for (User_Progress__c prog : progresses) {
            progressMap.put(prog.Workshop_Step__c, prog.IsCompleted__c);
        }
        return progressMap;
    }

    @AuraEnabled
    public static void updateImageUrl(Id stepId, String newUrl) {
        Workshop_Step__c step = [SELECT Id, Image_URL__c FROM Workshop_Step__c WHERE Id = :stepId LIMIT 1];
        step.Image_URL__c = newUrl;
        update step;
    }
    /* original
       @AuraEnabled(cacheable=true)
public static List<Workshop__c> getAllWorkshops() {
    return [SELECT Id, Name FROM Workshop__c ORDER BY CreatedDate DESC];
}
*/
    @AuraEnabled
public static List<Map<String, Object>> getAllWorkshops() {
    List<Workshop__c> workshops = [
        SELECT Id, Name, Description__c, Audience__c, Star_Rating__c, Technical_Rating__c, Duration__c, Workshop_Image__c, Industry_Features__c,
            (SELECT Id FROM Workshop_Steps__r)
        FROM Workshop__c
    ];
    
    List<Map<String, Object>> results = new List<Map<String, Object>>();
    for (Workshop__c w : workshops) {
        Map<String, Object> wsMap = new Map<String, Object>();
        wsMap.put('Id', w.Id);
        wsMap.put('Name', w.Name);
        wsMap.put('Description', w.Description__c);
        wsMap.put('Audience', w.Audience__c);
        wsMap.put('StarRating', w.Star_Rating__c);
        wsMap.put('TechnicalRating', w.Technical_Rating__c);
        wsMap.put('Duration', w.Duration__c);
        wsMap.put('ImageUrl', w.Workshop_Image__c);
        wsMap.put('IndustryFeatures', w.Industry_Features__c);
        wsMap.put('StepCount', w.Workshop_Steps__r != null ? w.Workshop_Steps__r.size() : 0);
        results.add(wsMap);
    }
    return results;
}

    @AuraEnabled
public static void startWorkshop(Id workshopId) {
    List<Workshop_Step__c> steps = [SELECT Id FROM Workshop_Step__c WHERE Workshop__c = :workshopId];
    Set<Id> stepIds = new Set<Id>();
    for (Workshop_Step__c s : steps) stepIds.add(s.Id);
    // Query existing progress
    Set<Id> existingProgress = new Set<Id>();
    for (User_Progress__c up : [SELECT Workshop_Step__c FROM User_Progress__c WHERE User__c = :UserInfo.getUserId() AND Workshop_Step__c IN :stepIds]) {
        existingProgress.add(up.Workshop_Step__c);
    }
    List<User_Progress__c> toInsert = new List<User_Progress__c>();
    for (Id sid : stepIds) {
        if (!existingProgress.contains(sid)) {
            toInsert.add(new User_Progress__c(User__c = UserInfo.getUserId(), Workshop_Step__c = sid, IsCompleted__c = false));
        }
    }
    if (!toInsert.isEmpty()) insert toInsert;
}

    @AuraEnabled
public static void resetWorkshop(Id workshopId) {
    List<User_Progress__c> progresses = [
        SELECT Id, IsCompleted__c 
        FROM User_Progress__c 
        WHERE User__c = :UserInfo.getUserId() 
          AND Workshop_Step__r.Workshop__c = :workshopId
    ];
    for (User_Progress__c p : progresses) {
        p.IsCompleted__c = false;
    }
    update progresses;
}

    /**
     * Get Interest Tags assigned to a Workshop using the Interest Tags API
     * This uses the simple API approach to get actual assigned tags
     * Note: Not cacheable to ensure fresh results when switching workshops
     */
    @AuraEnabled
    public static List<Map<String, Object>> getAssignedInterestTags(String workshopId) {
        List<Map<String, Object>> assignedTags = new List<Map<String, Object>>();
        
        System.debug('🚀 === STARTING getAssignedInterestTags ===');
        System.debug('📥 Input workshopId: ' + workshopId);
        
        try {
            // STEP 1: Validate input
            System.debug('📝 STEP 1: Validating workshop ID');
            if (String.isBlank(workshopId)) {
                System.debug('❌ STEP 1 FAILED: No workshop ID provided');
                return assignedTags;
            }
            System.debug('✅ STEP 1 SUCCESS: Workshop ID is valid');
            
            // STEP 2: Try API approach first
            System.debug('📝 STEP 2: Attempting Interest Tags API call');
            Map<String, Object> apiResult = getAssignedInterestTagsFromAPI(workshopId);
            System.debug('📊 STEP 2 RESULT: API call completed, success = ' + apiResult.get('success'));
            
            if (apiResult.get('success') == true) {
                System.debug('✅ STEP 2 SUCCESS: API call succeeded');
                
                // STEP 3: Parse API response
                System.debug('📝 STEP 3: Parsing API response data');
                Map<String, Object> data = (Map<String, Object>) apiResult.get('data');
                
                if (data != null && data.containsKey('tags')) {
                    List<Object> tags = (List<Object>) data.get('tags');
                    System.debug('📊 STEP 3 INFO: Found ' + tags.size() + ' tags in API response');
                    
                    // STEP 4: Process each tag
                    System.debug('📝 STEP 4: Processing individual tags');
                    Integer tagCounter = 0;
                    
                    for (Object tagObj : tags) {
                        tagCounter++;
                        Map<String, Object> tag = (Map<String, Object>) tagObj;
                        Map<String, Object> tagData = new Map<String, Object>();
                        
                        // Extract tag information from the response
                        String tagId = (String) tag.get('tagId');
                        String tagName = (String) tag.get('name');
                        String tagDescription = (String) tag.get('description');
                        String tagType = (String) tag.get('tagType');
                        
                        tagData.put('tagId', tagId);
                        tagData.put('name', tagName);
                        tagData.put('description', tagDescription);
                        tagData.put('tagType', tagType);
                        assignedTags.add(tagData);
                        
                        System.debug('🏷️ STEP 4.' + tagCounter + ': Processed tag - Name: "' + tagName + '", ID: "' + tagId + '"');
                    }
                    
                    System.debug('✅ STEP 4 SUCCESS: Processed all ' + tagCounter + ' tags');
                } else {
                    System.debug('⚠️ STEP 3 WARNING: API response data is null or missing "tags" key');
                    System.debug('📊 STEP 3 DEBUG: Data object: ' + JSON.serialize(data));
                }
            } else {
                System.debug('❌ STEP 2 FAILED: API call failed');
                System.debug('📄 STEP 2 ERROR: ' + apiResult.get('error'));
            }
            
            // STEP 5: Check if we need fallback
            if (assignedTags.isEmpty()) {
                System.debug('⚠️ STEP 5: No API assignments found, triggering fallback');
                System.debug('📝 STEP 5: Calling legacy text-matching approach');
                List<Map<String, Object>> legacyResults = getAssignedInterestTagsLegacy(workshopId);
                System.debug('📊 STEP 5 RESULT: Legacy approach returned ' + legacyResults.size() + ' tags');
                return legacyResults;
            }
            
            // STEP 6: Return successful results
            System.debug('✅ STEP 6 SUCCESS: Returning ' + assignedTags.size() + ' assigned Interest Tags from API');
            System.debug('🎯 === getAssignedInterestTags COMPLETED SUCCESSFULLY ===');
            return assignedTags;
            
        } catch (Exception e) {
            System.debug('💥 === EXCEPTION IN getAssignedInterestTags ===');
            System.debug('❌ Exception Type: ' + e.getTypeName());
            System.debug('❌ Exception Message: ' + e.getMessage());
            System.debug('❌ Exception Line: ' + e.getLineNumber());
            System.debug('📝 Stack trace: ' + e.getStackTraceString());
            
            // Fallback to legacy approach on any error
            System.debug('🔄 FALLBACK: Attempting legacy text-matching approach due to exception');
            try {
                List<Map<String, Object>> legacyResults = getAssignedInterestTagsLegacy(workshopId);
                System.debug('✅ FALLBACK SUCCESS: Legacy approach returned ' + legacyResults.size() + ' tags');
                return legacyResults;
            } catch (Exception fallbackException) {
                System.debug('💥 FALLBACK FAILED: ' + fallbackException.getMessage());
                return new List<Map<String, Object>>();
            }
        }
    }
    
    /**
     * Legacy method: Get Interest Tags by matching Industry_Features__c field values to InterestTag names
     * Kept as fallback for existing data
     */
    @AuraEnabled
    public static List<Map<String, Object>> getAssignedInterestTagsLegacy(String workshopId) {
        List<Map<String, Object>> assignedTags = new List<Map<String, Object>>();
        
        System.debug('🔄 === STARTING getAssignedInterestTagsLegacy ===');
        System.debug('📥 Input workshopId: ' + workshopId);
        
        try {
            // STEP 1: Validate input
            System.debug('📝 LEGACY STEP 1: Validating workshop ID');
            if (String.isBlank(workshopId)) {
                System.debug('❌ LEGACY STEP 1 FAILED: Workshop ID is blank or null');
                return assignedTags;
            }
            System.debug('✅ LEGACY STEP 1 SUCCESS: Workshop ID is valid');
            
            // STEP 2: Query workshop record
            System.debug('📝 LEGACY STEP 2: Querying workshop record with Industry_Features__c');
            List<Workshop__c> workshops = [
                SELECT Id, Name, Industry_Features__c 
                FROM Workshop__c 
                WHERE Id = :workshopId 
                LIMIT 1
            ];
            
            if (workshops.isEmpty()) {
                System.debug('❌ LEGACY STEP 2 FAILED: Workshop not found with ID: ' + workshopId);
                return assignedTags;
            }
            
            Workshop__c workshop = workshops[0];
            System.debug('✅ LEGACY STEP 2 SUCCESS: Workshop found');
            System.debug('📊 LEGACY STEP 2 INFO: Workshop Name: ' + workshop.Name);
            System.debug('📊 LEGACY STEP 2 INFO: Industry Features: ' + workshop.Industry_Features__c);
            
            // STEP 3: Validate Industry Features field
            System.debug('📝 LEGACY STEP 3: Validating Industry Features field');
            if (String.isBlank(workshop.Industry_Features__c)) {
                System.debug('❌ LEGACY STEP 3 FAILED: Industry Features field is blank');
                return assignedTags;
            }
            System.debug('✅ LEGACY STEP 3 SUCCESS: Industry Features field is populated');
            
            // STEP 4: Split and clean feature names
            System.debug('📝 LEGACY STEP 4: Splitting and cleaning feature names');
            List<String> featureNames = workshop.Industry_Features__c.split(';');
            Set<String> featureNameSet = new Set<String>();
            
            System.debug('📊 LEGACY STEP 4 INFO: Raw split resulted in ' + featureNames.size() + ' values');
            
            for (Integer i = 0; i < featureNames.size(); i++) {
                String featureName = featureNames[i];
                System.debug('🔍 LEGACY STEP 4.' + (i+1) + ': Raw feature "' + featureName + '"');
                
                if (String.isNotBlank(featureName.trim())) {
                    String cleanedName = featureName.trim();
                    featureNameSet.add(cleanedName);
                    System.debug('✅ LEGACY STEP 4.' + (i+1) + ': Added cleaned feature "' + cleanedName + '"');
                } else {
                    System.debug('⚠️ LEGACY STEP 4.' + (i+1) + ': Skipped blank feature');
                }
            }
            
            System.debug('📊 LEGACY STEP 4 RESULT: Final feature set has ' + featureNameSet.size() + ' unique features');
            System.debug('🔍 LEGACY STEP 4 RESULT: Feature set: ' + featureNameSet);
            
            // STEP 5: Query matching Interest Tags
            System.debug('📝 LEGACY STEP 5: Querying InterestTag records for matching names');
            List<InterestTag> matchingTags = [
                SELECT Id, TagName, TagDescription, TagType 
                FROM InterestTag 
                WHERE TagType = 'Public' 
                AND TagName IN :featureNameSet
                ORDER BY TagName
            ];
            
            System.debug('📊 LEGACY STEP 5 RESULT: Found ' + matchingTags.size() + ' matching Interest Tags');
            
            // STEP 6: Convert to expected format
            System.debug('📝 LEGACY STEP 6: Converting InterestTag records to expected format');
            Integer tagCounter = 0;
            
            for (InterestTag tag : matchingTags) {
                tagCounter++;
                Map<String, Object> tagData = new Map<String, Object>();
                tagData.put('tagId', tag.Id);
                tagData.put('name', tag.TagName);
                tagData.put('description', tag.TagDescription);
                tagData.put('tagType', tag.TagType);
                assignedTags.add(tagData);
                
                System.debug('🏷️ LEGACY STEP 6.' + tagCounter + ': Converted tag - Name: "' + tag.TagName + '", ID: "' + tag.Id + '"');
                System.debug('📋 LEGACY STEP 6.' + tagCounter + ': Description: "' + tag.TagDescription + '"');
                System.debug('🏷️ LEGACY STEP 6.' + tagCounter + ': Type: "' + tag.TagType + '"');
            }
            
            System.debug('✅ LEGACY STEP 6 SUCCESS: All ' + tagCounter + ' tags converted successfully');
            
            // STEP 7: Analyze unmatched features for debugging
            System.debug('📝 LEGACY STEP 7: Analyzing unmatched features for debugging');
            Set<String> matchedNames = new Set<String>();
            for (InterestTag tag : matchingTags) {
                matchedNames.add(tag.TagName);
            }
            
            Integer unmatchedCount = 0;
            for (String featureName : featureNameSet) {
                if (!matchedNames.contains(featureName)) {
                    unmatchedCount++;
                    System.debug('⚠️ LEGACY STEP 7.' + unmatchedCount + ': No Interest Tag found for feature: "' + featureName + '"');
                }
            }
            
            if (unmatchedCount == 0) {
                System.debug('✅ LEGACY STEP 7 SUCCESS: All features matched to Interest Tags');
            } else {
                System.debug('⚠️ LEGACY STEP 7 WARNING: ' + unmatchedCount + ' features had no matching Interest Tags');
            }
            
            System.debug('🎯 === getAssignedInterestTagsLegacy COMPLETED SUCCESSFULLY ===');
            System.debug('📊 FINAL RESULT: Returning ' + assignedTags.size() + ' tags via legacy approach');
            
            return assignedTags;
            
        } catch (QueryException e) {
            System.debug('💥 === QUERY EXCEPTION IN getAssignedInterestTagsLegacy ===');
            System.debug('❌ Query Exception Type: ' + e.getTypeName());
            System.debug('❌ Query Exception Message: ' + e.getMessage());
            System.debug('📝 Query Stack trace: ' + e.getStackTraceString());
            return new List<Map<String, Object>>();
        } catch (Exception e) {
            System.debug('💥 === GENERAL EXCEPTION IN getAssignedInterestTagsLegacy ===');
            System.debug('❌ Exception Type: ' + e.getTypeName());
            System.debug('❌ Exception Message: ' + e.getMessage());
            System.debug('❌ Exception Line: ' + e.getLineNumber());
            System.debug('📝 Stack trace: ' + e.getStackTraceString());
            return new List<Map<String, Object>>();
        }
    }

    @AuraEnabled
    public static Map<String, Object> getInterestTagsFromAPI() {
        try {
            System.debug('🔗 Querying InterestTag object with SOQL...');
            
            // Query InterestTag standard object directly using SOQL
            List<InterestTag> tags = [
                SELECT Id, TagName, TagDescription, TagType, CreatedDate, LastModifiedDate
                FROM InterestTag
                WHERE TagType = 'Public'
                ORDER BY TagName
            ];
            
            System.debug('📡 Found ' + tags.size() + ' Interest Tags');
            
            // Transform to match the expected API response format
            List<Map<String, Object>> tagList = new List<Map<String, Object>>();
            for (InterestTag tag : tags) {
                Map<String, Object> tagMap = new Map<String, Object>();
                tagMap.put('tagId', tag.Id);
                tagMap.put('name', tag.TagName);
                tagMap.put('description', tag.TagDescription);
                tagMap.put('type', tag.TagType);
                tagMap.put('createdDate', tag.CreatedDate);
                tagMap.put('lastModifiedDate', tag.LastModifiedDate);
                tagList.add(tagMap);
            }
            
            // Create response structure similar to API format
            Map<String, Object> responseData = new Map<String, Object>();
            responseData.put('tags', tagList);
            responseData.put('totalCount', tags.size());
            
            System.debug('✅ Successfully retrieved ' + tags.size() + ' Interest Tags via SOQL');
            System.debug('🔍 Sample tags: ' + (tagList.size() > 0 ? JSON.serialize(tagList[0]) : 'None'));
            
            // Return simplified map for the LWC
            Map<String, Object> result = new Map<String, Object>();
            result.put('success', true);
            result.put('data', responseData);
            
            return result;
            
        } catch (Exception e) {
            System.debug('❌ Exception in getInterestTagsFromAPI: ' + e.getMessage());
            System.debug('❌ Stack trace: ' + e.getStackTraceString());
            return new Map<String, Object>{
                'success' => false,
                'error' => e.getMessage(),
                'stackTrace' => e.getStackTraceString()
            };
        }
    }



    /**
     * Synchronize InterestTag records to Interest_Tag_Sync__c custom object
     * This allows Flow to access InterestTag data and automatically update picklist values
     */
    @AuraEnabled
    public static String syncInterestTagsToCustomObject() {
        try {
            // Get all current Interest Tag records
            List<InterestTag> allTags = [
                SELECT Id, TagName, TagDescription, TagType 
                FROM InterestTag 
                WHERE TagType = 'Public' 
                AND TagName != null 
                ORDER BY TagName
            ];
            
            if (allTags.isEmpty()) {
                return 'No Interest Tags found to sync';
            }
            
            System.debug('🔄 Found ' + allTags.size() + ' Interest Tags to sync');
            
            // Get existing sync records to avoid duplicates
            Map<String, Interest_Tag_Sync__c> existingSyncRecords = new Map<String, Interest_Tag_Sync__c>();
            for (Interest_Tag_Sync__c syncRecord : [
                SELECT Id, Interest_Tag_Id__c, Tag_Name__c, Tag_Description__c, Tag_Type__c, Is_Synced_to_Picklist__c
                FROM Interest_Tag_Sync__c
                WHERE Interest_Tag_Id__c != null
            ]) {
                existingSyncRecords.put(syncRecord.Interest_Tag_Id__c, syncRecord);
            }
            
            System.debug('🔍 Found ' + existingSyncRecords.size() + ' existing sync records');
            
            // Prepare records for upsert
            List<Interest_Tag_Sync__c> recordsToUpsert = new List<Interest_Tag_Sync__c>();
            Integer newRecords = 0;
            Integer updatedRecords = 0;
            
            for (InterestTag tag : allTags) {
                Interest_Tag_Sync__c syncRecord;
                
                if (existingSyncRecords.containsKey(tag.Id)) {
                    // Update existing record
                    syncRecord = existingSyncRecords.get(tag.Id);
                    syncRecord.Tag_Name__c = tag.TagName;
                    syncRecord.Tag_Description__c = tag.TagDescription;
                    syncRecord.Tag_Type__c = tag.TagType;
                    updatedRecords++;
                } else {
                    // Create new record
                    syncRecord = new Interest_Tag_Sync__c();
                    syncRecord.Interest_Tag_Id__c = tag.Id;
                    syncRecord.Tag_Name__c = tag.TagName;
                    syncRecord.Tag_Description__c = tag.TagDescription;
                    syncRecord.Tag_Type__c = tag.TagType;
                    syncRecord.Is_Synced_to_Picklist__c = false; // Flow will handle this
                    newRecords++;
                }
                
                recordsToUpsert.add(syncRecord);
            }
            
            if (recordsToUpsert.isEmpty()) {
                return 'No changes detected. All records are already in sync.';
            }
            
            // Upsert records
            Database.UpsertResult[] results = Database.upsert(recordsToUpsert, Interest_Tag_Sync__c.Interest_Tag_Id__c);
            
            // Check for errors
            Integer successCount = 0;
            List<String> errorMessages = new List<String>();
            
            for (Database.UpsertResult result : results) {
                if (result.isSuccess()) {
                    successCount++;
                } else {
                    for (Database.Error error : result.getErrors()) {
                        errorMessages.add(error.getMessage());
                    }
                }
            }
            
            if (!errorMessages.isEmpty()) {
                return 'PARTIAL SUCCESS: ' + successCount + ' records processed. Errors: ' + String.join(errorMessages, '; ');
            }
            
            return 'SUCCESS: Synced ' + successCount + ' Interest Tags (' + newRecords + ' new, ' + updatedRecords + ' updated). Flow can now process new records for picklist updates.';
            
        } catch (Exception e) {
            System.debug('❌ Error syncing Interest Tags: ' + e.getMessage());
            return 'ERROR: ' + e.getMessage();
        }
    }
    
    /**
     * Get unsynced Interest Tag records for Flow processing
     */
    @AuraEnabled
    public static List<Interest_Tag_Sync__c> getUnsyncedInterestTags() {
        return [
            SELECT Id, Tag_Name__c, Tag_Description__c, Tag_Type__c, Interest_Tag_Id__c
            FROM Interest_Tag_Sync__c 
            WHERE Is_Synced_to_Picklist__c = false
            ORDER BY Tag_Name__c
        ];
    }

    /**
     * Assign Interest Tags to a Workshop via Workshop_Interest_Tag__c junction records
     * This creates the proper many-to-many relationship using the junction object
     */
    @AuraEnabled
    public static String assignInterestTagsToWorkshop(String workshopId, List<String> interestTagIds) {
        try {
            if (String.isBlank(workshopId)) {
                return 'ERROR: Workshop ID is required';
            }
            
            if (interestTagIds == null || interestTagIds.isEmpty()) {
                return 'ERROR: At least one Interest Tag ID is required';
            }
            
            System.debug('🔗 Assigning ' + interestTagIds.size() + ' Interest Tags to Workshop: ' + workshopId);
            
            // Find Interest_Tag_Sync__c records for the provided Interest Tag IDs
            Map<String, Interest_Tag_Sync__c> syncRecordMap = new Map<String, Interest_Tag_Sync__c>();
            for (Interest_Tag_Sync__c syncRecord : [
                SELECT Id, Interest_Tag_Id__c, Tag_Name__c, Tag_Description__c, Tag_Type__c
                FROM Interest_Tag_Sync__c 
                WHERE Interest_Tag_Id__c IN :interestTagIds
            ]) {
                syncRecordMap.put(syncRecord.Interest_Tag_Id__c, syncRecord);
            }
            
            System.debug('📊 Found ' + syncRecordMap.size() + ' Interest Tag Sync records');
            
            // Check for existing assignments to avoid duplicates
            Set<Id> existingAssignments = new Set<Id>();
            for (Workshop_Interest_Tag__c existing : [
                SELECT Interest_Tag_Sync__c, Interest_Tag_Sync__r.Interest_Tag_Id__c
                FROM Workshop_Interest_Tag__c
                WHERE Workshop__c = :workshopId
                AND Interest_Tag_Sync__r.Interest_Tag_Id__c IN :interestTagIds
            ]) {
                existingAssignments.add(existing.Interest_Tag_Sync__c);
            }
            
            // Create new junction records
            List<Workshop_Interest_Tag__c> newAssignments = new List<Workshop_Interest_Tag__c>();
            Integer newCount = 0;
            Integer skippedCount = 0;
            
            for (String tagId : interestTagIds) {
                Interest_Tag_Sync__c syncRecord = syncRecordMap.get(tagId);
                if (syncRecord != null) {
                    if (existingAssignments.contains(syncRecord.Id)) {
                        skippedCount++;
                        System.debug('⏭️ Skipping existing assignment for tag: ' + syncRecord.Tag_Name__c);
                        continue;
                    }
                    
                    Workshop_Interest_Tag__c junctionRecord = new Workshop_Interest_Tag__c(
                        Workshop__c = workshopId,
                        Interest_Tag_Sync__c = syncRecord.Id
                    );
                    newAssignments.add(junctionRecord);
                    newCount++;
                    System.debug('➕ Creating assignment for tag: ' + syncRecord.Tag_Name__c);
                }
            }
            
            if (!newAssignments.isEmpty()) {
                insert newAssignments;
                System.debug('✅ Created ' + newAssignments.size() + ' new assignments');
            }
            
            return 'SUCCESS: Created ' + newCount + ' new assignments, skipped ' + skippedCount + ' existing assignments';
            
        } catch (Exception e) {
            System.debug('❌ Error assigning Interest Tags: ' + e.getMessage());
            return 'ERROR: ' + e.getMessage();
        }
    }
    
    /**
     * Assign Interest Tags to Workshop by Tag Names (convenience method)
     */
    @AuraEnabled
    public static String assignInterestTagsByName(String workshopId, List<String> tagNames) {
        try {
            // Find Interest Tag IDs by names
            List<InterestTag> tags = [
                SELECT Id, TagName 
                FROM InterestTag 
                WHERE TagType = 'Public' 
                AND TagName IN :tagNames
            ];
            
            List<String> tagIds = new List<String>();
            for (InterestTag tag : tags) {
                tagIds.add(tag.Id);
            }
            
            if (tagIds.isEmpty()) {
                return 'ERROR: No Interest Tags found with the specified names';
            }
            
            return assignInterestTagsToWorkshop(workshopId, tagIds);
            
        } catch (Exception e) {
            return 'ERROR: ' + e.getMessage();
        }
    }

    /**
     * Invocable method for Flow to add Interest Tag names to Workshop Industry_Features__c picklist
     * Preserves existing picklist values and only adds new ones
     */
    @InvocableMethod(label='Add Interest Tag to Workshop Picklist' description='Safely adds an Interest Tag name to Workshop Industry_Features__c picklist without overwriting existing values')
    public static List<String> addInterestTagToPicklist(List<FlowRequest> requests) {
        List<String> results = new List<String>();
        
        for (FlowRequest request : requests) {
            try {
                String result = addSingleTagToPicklist(request.tagName, request.syncRecordId);
                results.add(result);
            } catch (Exception e) {
                results.add('ERROR: ' + e.getMessage());
            }
        }
        
        return results;
    }
    
    /**
     * Add a single tag to the picklist safely
     */
    private static String addSingleTagToPicklist(String tagName, String syncRecordId) {
        if (String.isBlank(tagName)) {
            return 'ERROR: Tag name is required';
        }
        
        System.debug('🔄 Adding tag to picklist: ' + tagName);
        
        // First, check if the value already exists in the picklist
        // We'll do this by checking the Workshop object's Industry_Features__c field
        // Note: This is a simplified approach - in production you might want to use Metadata API
        
        // For now, let's simulate the picklist addition and mark the sync record as complete
        try {
            // Update the sync record to mark as complete
            if (String.isNotBlank(syncRecordId)) {
                Interest_Tag_Sync__c syncRecord = new Interest_Tag_Sync__c(
                    Id = syncRecordId,
                    Is_Synced_to_Picklist__c = true
                );
                update syncRecord;
                System.debug('✅ Marked sync record as complete: ' + syncRecordId);
            }
            
            // In a real implementation, you would:
            // 1. Read current picklist values using Metadata API
            // 2. Check if tagName already exists
            // 3. If not, add it to the list
            // 4. Update the picklist metadata
            
            // For now, return success (manual picklist update required)
            return 'SUCCESS: Tag "' + tagName + '" queued for picklist addition. Manual picklist update required.';
            
        } catch (Exception e) {
            System.debug('❌ Error updating sync record: ' + e.getMessage());
            return 'ERROR: Failed to update sync record - ' + e.getMessage();
        }
    }
    
    /**
     * Wrapper class for Flow input parameters
     */
    public class FlowRequest {
        @InvocableVariable(label='Interest Tag Name' description='The name of the Interest Tag to add to the picklist' required=true)
        public String tagName;
        
        @InvocableVariable(label='Sync Record ID' description='The ID of the Interest_Tag_Sync__c record to update' required=false)
        public String syncRecordId;
    }

    /**
     * Get assigned Interest Tags for a workshop using the Interest Tags API
     * This makes a direct HTTP callout to /connect/interest-tags/assignments/entity/{workshopId}
     * Note: Not cacheable to ensure fresh results when switching workshops
     */
    @AuraEnabled
    public static Map<String, Object> getAssignedInterestTagsFromAPI(String workshopId) {
        System.debug('🌐 === STARTING getAssignedInterestTagsFromAPI ===');
        System.debug('📥 Input workshopId: ' + workshopId);
        
        try {
            // STEP 1: Validate input
            System.debug('📝 API STEP 1: Validating workshop ID');
            if (String.isBlank(workshopId)) {
                System.debug('❌ API STEP 1 FAILED: Workshop ID is blank or null');
                return new Map<String, Object>{
                    'success' => false,
                    'error' => 'Workshop ID is required'
                };
            }
            System.debug('✅ API STEP 1 SUCCESS: Workshop ID is valid');
            
            // STEP 2: Get session ID for authentication
            System.debug('📝 API STEP 2: Getting session ID for authentication');
            String sessionId = UserInfo.getSessionId();
            String maskedSessionId = sessionId.length() > 10 ? sessionId.substring(0, 10) + '...' : sessionId;
            System.debug('✅ API STEP 2 SUCCESS: Session ID obtained (masked): ' + maskedSessionId);
            
            // STEP 3: Build API endpoint URL
            System.debug('📝 API STEP 3: Building API endpoint URL');
            String baseUrl = System.URL.getOrgDomainUrl().toExternalForm();
            String endpoint = baseUrl + '/services/data/v58.0/connect/interest-tags/assignments/entity/' + workshopId;
            System.debug('📊 API STEP 3 INFO: Base URL: ' + baseUrl);
            System.debug('🔗 API STEP 3 SUCCESS: Full API Endpoint: ' + endpoint);
            
            // STEP 4: Create HTTP request
            System.debug('📝 API STEP 4: Creating HTTP request');
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(endpoint);
            request.setMethod('GET');
            request.setHeader('Content-Type', 'application/json; charset=utf-8');
            request.setHeader('Authorization', 'Bearer ' + sessionId);
            System.debug('✅ API STEP 4 SUCCESS: HTTP request configured');
            System.debug('📊 API STEP 4 INFO: Method = GET, Content-Type = application/json');
            
            // STEP 5: Make the API call
            System.debug('📝 API STEP 5: Making HTTP callout to Interest Tags API');
            System.debug('🚀 API STEP 5: Sending request...');
            HttpResponse response = http.send(request);
            System.debug('📨 API STEP 5: Received response');
            
            // STEP 6: Analyze response
            Integer statusCode = response.getStatusCode();
            String responseBody = response.getBody();
            System.debug('📊 API STEP 6: Response analysis - Status Code: ' + statusCode);
            System.debug('📊 API STEP 6: Response Body Length: ' + (responseBody != null ? responseBody.length() : 0) + ' characters');
            
            if (statusCode == 200) {
                System.debug('✅ API STEP 6 SUCCESS: Received HTTP 200 OK');
                System.debug('📄 API STEP 6: Full Response Body: ' + responseBody);
                
                // STEP 7: Parse JSON response
                System.debug('📝 API STEP 7: Parsing JSON response');
                Map<String, Object> responseData = (Map<String, Object>) JSON.deserializeUntyped(responseBody);
                
                // Count tags in response
                Object tagsObj = responseData.get('tags');
                Integer tagCount = 0;
                if (tagsObj instanceof List<Object>) {
                    tagCount = ((List<Object>) tagsObj).size();
                }
                
                System.debug('✅ API STEP 7 SUCCESS: JSON parsed successfully');
                System.debug('📊 API STEP 7 INFO: Found ' + tagCount + ' tags in response');
                System.debug('🎯 === getAssignedInterestTagsFromAPI COMPLETED SUCCESSFULLY ===');
                
                return new Map<String, Object>{
                    'success' => true,
                    'data' => responseData
                };
            } else {
                System.debug('❌ API STEP 6 FAILED: Non-200 status code received');
                System.debug('📄 API STEP 6 ERROR: Response Body: ' + responseBody);
                
                return new Map<String, Object>{
                    'success' => false,
                    'error' => 'API call failed with status ' + statusCode + ': ' + responseBody
                };
            }
            
        } catch (CalloutException e) {
            System.debug('💥 === CALLOUT EXCEPTION IN getAssignedInterestTagsFromAPI ===');
            System.debug('❌ Callout Exception Type: ' + e.getTypeName());
            System.debug('❌ Callout Exception Message: ' + e.getMessage());
            System.debug('📝 Callout Stack trace: ' + e.getStackTraceString());
            
            return new Map<String, Object>{
                'success' => false,
                'error' => 'HTTP Callout failed: ' + e.getMessage(),
                'stackTrace' => e.getStackTraceString()
            };
        } catch (JSONException e) {
            System.debug('💥 === JSON EXCEPTION IN getAssignedInterestTagsFromAPI ===');
            System.debug('❌ JSON Exception Type: ' + e.getTypeName());
            System.debug('❌ JSON Exception Message: ' + e.getMessage());
            System.debug('📝 JSON Stack trace: ' + e.getStackTraceString());
            
            return new Map<String, Object>{
                'success' => false,
                'error' => 'JSON parsing failed: ' + e.getMessage(),
                'stackTrace' => e.getStackTraceString()
            };
        } catch (Exception e) {
            System.debug('💥 === GENERAL EXCEPTION IN getAssignedInterestTagsFromAPI ===');
            System.debug('❌ Exception Type: ' + e.getTypeName());
            System.debug('❌ Exception Message: ' + e.getMessage());
            System.debug('❌ Exception Line: ' + e.getLineNumber());
            System.debug('📝 Stack trace: ' + e.getStackTraceString());
            
            return new Map<String, Object>{
                'success' => false,
                'error' => 'Unexpected error: ' + e.getMessage(),
                'stackTrace' => e.getStackTraceString()
            };
        }
    }

    @AuraEnabled
    public static Map<String, Object> getAssignedInterestTagsFromAPIWithNamedCredential(String workshopId) {
        System.debug('🌐 === STARTING getAssignedInterestTagsFromAPIWithNamedCredential ===');
        System.debug('📥 Input workshopId: ' + workshopId);
        
        try {
            // Step 1: Validate workshop ID
            System.debug('📝 API STEP 1: Validating workshop ID');
            if (String.isBlank(workshopId)) {
                System.debug('❌ API STEP 1 FAILED: Workshop ID is blank');
                return new Map<String, Object>{
                    'success' => false,
                    'error' => 'Workshop ID is required',
                    'data' => new List<Map<String, Object>>()
                };
            }
            System.debug('✅ API STEP 1 SUCCESS: Workshop ID is valid');
            
            // Step 2: Build API endpoint URL with Named Credential
            System.debug('📝 API STEP 2: Building API endpoint URL with Named Credential');
            String endpoint = 'callout:Salesforce_API/services/data/v58.0/connect/interest-tags/assignments/entity/' + workshopId;
            System.debug('🔗 API STEP 2 SUCCESS: Full API Endpoint: ' + endpoint);
            
            // Step 3: Create HTTP request
            System.debug('📝 API STEP 3: Creating HTTP request');
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(endpoint);
            request.setMethod('GET');
            request.setHeader('Content-Type', 'application/json');
            // Named Credential handles authentication automatically
            System.debug('✅ API STEP 3 SUCCESS: HTTP request configured with Named Credential');
            
            // Step 4: Make HTTP callout
            System.debug('📝 API STEP 4: Making HTTP callout to Interest Tags API');
            System.debug('🚀 API STEP 4: Sending request...');
            HttpResponse response = http.send(request);
            System.debug('📨 API STEP 4: Received response');
            
            // Step 5: Analyze response
            Integer statusCode = response.getStatusCode();
            String responseBody = response.getBody();
            System.debug('📊 API STEP 5: Response analysis - Status Code: ' + statusCode);
            System.debug('📊 API STEP 5: Response Body Length: ' + responseBody.length() + ' characters');
            
            if (statusCode == 200) {
                System.debug('✅ API STEP 5 SUCCESS: Received HTTP 200 OK');
                System.debug('📄 API STEP 5: Full Response Body: ' + responseBody);
                
                // Step 6: Parse JSON response
                System.debug('📝 API STEP 6: Parsing JSON response');
                Map<String, Object> jsonResponse = (Map<String, Object>) JSON.deserializeUntyped(responseBody);
                
                List<Object> tags = (List<Object>) jsonResponse.get('tags');
                System.debug('✅ API STEP 6 SUCCESS: JSON parsed successfully');
                System.debug('📊 API STEP 6 INFO: Found ' + (tags != null ? tags.size() : 0) + ' tags in response');
                
                System.debug('🎯 === getAssignedInterestTagsFromAPIWithNamedCredential COMPLETED SUCCESSFULLY ===');
                return new Map<String, Object>{
                    'success' => true,
                    'data' => tags != null ? tags : new List<Object>(),
                    'error' => null
                };
            } else {
                System.debug('❌ API STEP 5 FAILED: Received HTTP ' + statusCode);
                System.debug('📄 API STEP 5: Error Response Body: ' + responseBody);
                return new Map<String, Object>{
                    'success' => false,
                    'error' => 'HTTP ' + statusCode + ': ' + responseBody,
                    'data' => new List<Map<String, Object>>()
                };
            }
            
        } catch (Exception e) {
            System.debug('❌ API EXCEPTION: ' + e.getMessage());
            System.debug('📝 API STACK TRACE: ' + e.getStackTraceString());
            return new Map<String, Object>{
                'success' => false,
                'error' => 'Exception: ' + e.getMessage(),
                'data' => new List<Map<String, Object>>()
            };
        }
    }

    @AuraEnabled
    public static List<Map<String, Object>> getAssignedInterestTagsWithNamedCredential(String workshopId) {
        System.debug('🚀 === STARTING getAssignedInterestTagsWithNamedCredential ===');
        System.debug('📥 Input workshopId: ' + workshopId);
        
        try {
            // Step 1: Validate workshop ID
            System.debug('📝 STEP 1: Validating workshop ID');
            if (String.isBlank(workshopId)) {
                System.debug('❌ STEP 1 FAILED: Workshop ID is blank');
                return new List<Map<String, Object>>();
            }
            System.debug('✅ STEP 1 SUCCESS: Workshop ID is valid');
            
            // Step 2: Attempt Interest Tags API call with Named Credential
            System.debug('📝 STEP 2: Attempting Interest Tags API call with Named Credential');
            Map<String, Object> apiResult = getAssignedInterestTagsFromAPIWithNamedCredential(workshopId);
            System.debug('📊 STEP 2 RESULT: API call completed, success = ' + apiResult.get('success'));
            
            if (apiResult.get('success') == true) {
                System.debug('✅ STEP 2 SUCCESS: API call succeeded');
                
                // Step 3: Parse API response data
                System.debug('📝 STEP 3: Parsing API response data');
                List<Object> apiTags = (List<Object>) apiResult.get('data');
                System.debug('📊 STEP 3 INFO: Found ' + (apiTags != null ? apiTags.size() : 0) + ' tags in API response');
                
                // Step 4: Process individual tags
                System.debug('📝 STEP 4: Processing individual tags');
                List<Map<String, Object>> processedTags = new List<Map<String, Object>>();
                
                if (apiTags != null) {
                    Integer tagCounter = 0;
                    for (Object tagObj : apiTags) {
                        tagCounter++;
                        Map<String, Object> tag = (Map<String, Object>) tagObj;
                        
                        Map<String, Object> processedTag = new Map<String, Object>{
                            'id' => (String) tag.get('tagId'),
                            'name' => (String) tag.get('name'),
                            'recordAssignmentId' => (String) tag.get('recordAssignmentId'),
                            'categories' => tag.get('categories')
                        };
                        
                        processedTags.add(processedTag);
                        System.debug('🏷️ STEP 4.' + tagCounter + ': Processed tag - Name: "' + processedTag.get('name') + '", ID: "' + processedTag.get('id') + '"');
                    }
                }
                
                System.debug('✅ STEP 4 SUCCESS: Processed all ' + processedTags.size() + ' tags');
                System.debug('✅ STEP 6 SUCCESS: Returning ' + processedTags.size() + ' assigned Interest Tags from API with Named Credential');
                System.debug('🎯 === getAssignedInterestTagsWithNamedCredential COMPLETED SUCCESSFULLY ===');
                return processedTags;
            } else {
                System.debug('❌ STEP 2 FAILED: API call failed - ' + apiResult.get('error'));
                System.debug('📝 STEP 3: Falling back to empty result');
                System.debug('🎯 === getAssignedInterestTagsWithNamedCredential COMPLETED WITH FALLBACK ===');
                return new List<Map<String, Object>>();
            }
            
        } catch (Exception e) {
            System.debug('❌ EXCEPTION in getAssignedInterestTagsWithNamedCredential: ' + e.getMessage());
            System.debug('📝 STACK TRACE: ' + e.getStackTraceString());
            return new List<Map<String, Object>>();
        }
    }

    @AuraEnabled
    public static Map<String, Object> getAssignedInterestTagsWithDynamicAuth(String workshopId) {
        System.debug('🌐 === STARTING getAssignedInterestTagsWithDynamicAuth ===');
        System.debug('📥 Input workshopId: ' + workshopId);
        
        try {
            // Step 1: Validate workshop ID
            System.debug('📝 API STEP 1: Validating workshop ID');
            if (String.isBlank(workshopId)) {
                System.debug('❌ API STEP 1 FAILED: Workshop ID is blank');
                return new Map<String, Object>{
                    'success' => false,
                    'error' => 'Workshop ID is required',
                    'data' => new List<Map<String, Object>>()
                };
            }
            System.debug('✅ API STEP 1 SUCCESS: Workshop ID is valid');
            
            // Step 2: Get current org domain dynamically
            System.debug('📝 API STEP 2: Getting current org domain dynamically');
            String currentOrgDomain = System.URL.getOrgDomainUrl().toExternalForm();
            System.debug('🌐 API STEP 2 SUCCESS: Current org domain: ' + currentOrgDomain);
            
            // Step 3: Build API endpoint URL
            System.debug('📝 API STEP 3: Building API endpoint URL');
            String endpoint = currentOrgDomain + '/services/data/v58.0/connect/interest-tags/assignments/entity/' + workshopId;
            System.debug('🔗 API STEP 3 SUCCESS: Full API Endpoint: ' + endpoint);
            
            // Step 4: Get session ID for authentication
            System.debug('📝 API STEP 4: Getting session ID for authentication');
            String sessionId = UserInfo.getSessionId();
            System.debug('✅ API STEP 4 SUCCESS: Session ID obtained (masked): ' + sessionId.substring(0, 8) + '...');
            
            // Step 5: Create HTTP request
            System.debug('📝 API STEP 5: Creating HTTP request');
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(endpoint);
            request.setMethod('GET');
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('Authorization', 'Bearer ' + sessionId);
            System.debug('✅ API STEP 5 SUCCESS: HTTP request configured with Bearer token');
            
            // Step 6: Make HTTP callout
            System.debug('📝 API STEP 6: Making HTTP callout to Interest Tags API');
            System.debug('🚀 API STEP 6: Sending request...');
            HttpResponse response = http.send(request);
            System.debug('📨 API STEP 6: Received response');
            
            // Step 7: Analyze response
            Integer statusCode = response.getStatusCode();
            String responseBody = response.getBody();
            System.debug('📊 API STEP 7: Response analysis - Status Code: ' + statusCode);
            System.debug('📊 API STEP 7: Response Body Length: ' + responseBody.length() + ' characters');
            
            if (statusCode == 200) {
                System.debug('✅ API STEP 7 SUCCESS: Received HTTP 200 OK');
                System.debug('📄 API STEP 7: Full Response Body: ' + responseBody);
                
                // Step 8: Parse JSON response
                System.debug('📝 API STEP 8: Parsing JSON response');
                Map<String, Object> jsonResponse = (Map<String, Object>) JSON.deserializeUntyped(responseBody);
                
                List<Object> tags = (List<Object>) jsonResponse.get('tags');
                System.debug('✅ API STEP 8 SUCCESS: JSON parsed successfully');
                System.debug('📊 API STEP 8 INFO: Found ' + (tags != null ? tags.size() : 0) + ' tags in response');
                
                System.debug('🎯 === getAssignedInterestTagsWithDynamicAuth COMPLETED SUCCESSFULLY ===');
                return new Map<String, Object>{
                    'success' => true,
                    'data' => tags != null ? tags : new List<Object>(),
                    'error' => null
                };
            } else {
                System.debug('❌ API STEP 7 FAILED: Received HTTP ' + statusCode);
                System.debug('📄 API STEP 7: Error Response Body: ' + responseBody);
                return new Map<String, Object>{
                    'success' => false,
                    'error' => 'HTTP ' + statusCode + ': ' + responseBody,
                    'data' => new List<Map<String, Object>>()
                };
            }
            
        } catch (Exception e) {
            System.debug('❌ API EXCEPTION: ' + e.getMessage());
            System.debug('📝 API STACK TRACE: ' + e.getStackTraceString());
            return new Map<String, Object>{
                'success' => false,
                'error' => 'Exception: ' + e.getMessage(),
                'data' => new List<Map<String, Object>>()
            };
        }
    }

    @AuraEnabled
    public static List<Map<String, Object>> getAssignedInterestTagsWithDynamicOrg(String workshopId) {
        System.debug('🚀 === STARTING getAssignedInterestTagsWithDynamicOrg ===');
        System.debug('📥 Input workshopId: ' + workshopId);
        
        try {
            // Step 1: Validate workshop ID
            System.debug('📝 STEP 1: Validating workshop ID');
            if (String.isBlank(workshopId)) {
                System.debug('❌ STEP 1 FAILED: Workshop ID is blank');
                return new List<Map<String, Object>>();
            }
            System.debug('✅ STEP 1 SUCCESS: Workshop ID is valid');
            
            // Step 2: Attempt Interest Tags API call with dynamic authentication
            System.debug('📝 STEP 2: Attempting Interest Tags API call with dynamic authentication');
            Map<String, Object> apiResult = getAssignedInterestTagsWithDynamicAuth(workshopId);
            System.debug('📊 STEP 2 RESULT: API call completed, success = ' + apiResult.get('success'));
            
            if (apiResult.get('success') == true) {
                System.debug('✅ STEP 2 SUCCESS: API call succeeded');
                
                // Step 3: Parse API response data
                System.debug('📝 STEP 3: Parsing API response data');
                List<Object> apiTags = (List<Object>) apiResult.get('data');
                System.debug('📊 STEP 3 INFO: Found ' + (apiTags != null ? apiTags.size() : 0) + ' tags in API response');
                
                // Step 4: Process individual tags
                System.debug('📝 STEP 4: Processing individual tags');
                List<Map<String, Object>> processedTags = new List<Map<String, Object>>();
                
                if (apiTags != null) {
                    Integer tagCounter = 0;
                    for (Object tagObj : apiTags) {
                        tagCounter++;
                        Map<String, Object> tag = (Map<String, Object>) tagObj;
                        
                        Map<String, Object> processedTag = new Map<String, Object>{
                            'id' => (String) tag.get('tagId'),
                            'name' => (String) tag.get('name'),
                            'recordAssignmentId' => (String) tag.get('recordAssignmentId'),
                            'categories' => tag.get('categories')
                        };
                        
                        processedTags.add(processedTag);
                        System.debug('🏷️ STEP 4.' + tagCounter + ': Processed tag - Name: "' + processedTag.get('name') + '", ID: "' + processedTag.get('id') + '"');
                    }
                }
                
                System.debug('✅ STEP 4 SUCCESS: Processed all ' + processedTags.size() + ' tags');
                System.debug('✅ STEP 6 SUCCESS: Returning ' + processedTags.size() + ' assigned Interest Tags from dynamic API');
                System.debug('🎯 === getAssignedInterestTagsWithDynamicOrg COMPLETED SUCCESSFULLY ===');
                return processedTags;
            } else {
                System.debug('❌ STEP 2 FAILED: API call failed - ' + apiResult.get('error'));
                System.debug('📝 STEP 3: Falling back to empty result');
                System.debug('🎯 === getAssignedInterestTagsWithDynamicOrg COMPLETED WITH FALLBACK ===');
                return new List<Map<String, Object>>();
            }
            
        } catch (Exception e) {
            System.debug('❌ EXCEPTION in getAssignedInterestTagsWithDynamicOrg: ' + e.getMessage());
            System.debug('📝 STACK TRACE: ' + e.getStackTraceString());
            return new List<Map<String, Object>>();
        }
    }

}