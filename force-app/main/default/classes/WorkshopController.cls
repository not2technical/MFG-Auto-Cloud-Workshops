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

    // ✅ 3) Query only steps that have progress
    List<Workshop_Step__c> steps = new List<Workshop_Step__c>();
    if (!stepIds.isEmpty()) {
        steps = [
            SELECT Id, Name, Step_Group__c, Step_Order__c, Instructions__c, Image_URL__c
            FROM Workshop_Step__c
            WHERE Id IN :stepIds
            ORDER BY Step_Group__c, Step_Order__c
        ];
    }

    // ✅ 4) Return same JSON structure
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
        SELECT Id, Name, Description__c, Audience__c, Star_Rating__c, Technical_Rating__c, Duration__c, Workshop_Image__c,
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


}