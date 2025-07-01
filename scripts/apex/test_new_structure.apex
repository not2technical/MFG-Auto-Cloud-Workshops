// Test the updated WorkshopController with step details
List<Map<String, Object>> result = WorkshopController.getStepsAndProgress('a01Ka00000T4v4zIAB');

System.debug('Total workshop steps returned: ' + result.size());

for(Map<String, Object> step : result) {
    String stepName = (String)step.get('Name');
    List<Object> stepDetails = (List<Object>)step.get('stepDetails');
    Integer detailCount = stepDetails != null ? stepDetails.size() : 0;
    
    System.debug('Step: ' + stepName + ' - Details: ' + detailCount);
    
    if(detailCount > 0) {
        for(Object detailObj : stepDetails) {
            Map<String, Object> detail = (Map<String, Object>)detailObj;
            String detailTitle = (String)detail.get('Detail_Title__c');
            System.debug('  - Detail: ' + detailTitle);
        }
    }
}

System.debug('Test completed successfully!'); 