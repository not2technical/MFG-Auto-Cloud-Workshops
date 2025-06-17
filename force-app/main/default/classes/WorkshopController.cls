public with sharing class WorkshopController {
@AuraEnabled(cacheable=true)
public static List<Map<String, Object>> getStepsAndProgress(Id workshopId) {
    List<Workshop_Step__c> steps = [
        SELECT Id, Name, Step_Group__c, Step_Order__c, Instructions__c, Image_URL__c
        FROM Workshop_Step__c
        WHERE Workshop__c = :workshopId
        ORDER BY Step_Group__c, Step_Order__c
    ];

    Map<Id, Boolean> progressMap = new Map<Id, Boolean>();
    for (User_Progress__c up : [
        SELECT Workshop_Step__c, IsCompleted__c 
        FROM User_Progress__c 
        WHERE Workshop_Step__c IN :steps AND User__c = :UserInfo.getUserId()
    ]) {
        progressMap.put(up.Workshop_Step__c, up.IsCompleted__c);
    }

    // ✅ Use JSON.serialize to avoid illegal field errors entirely
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
    @AuraEnabled(cacheable=true)
public static List<Workshop__c> getAllWorkshops() {
    return [SELECT Id, Name FROM Workshop__c ORDER BY CreatedDate DESC];
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