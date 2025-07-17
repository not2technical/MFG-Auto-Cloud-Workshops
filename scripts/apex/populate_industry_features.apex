// Script to populate workshop records with industry features for testing
List<Workshop__c> workshops = [SELECT Id, Name, Industry_Features__c FROM Workshop__c];

System.debug('Found ' + workshops.size() + ' workshops');

for (Workshop__c ws : workshops) {
    System.debug('Workshop: ' + ws.Name + ' - Current features: ' + ws.Industry_Features__c);
    
    if (ws.Name.contains('Supercharge Experiences') || ws.Name.contains('Telemetry')) {
        // Add features for telemetry/connected assets workshop
        ws.Industry_Features__c = 'Connected Assets;Context Service;Actionable Event Orchestration;Business Rules Engine;Einstein Summary';
    } else if (ws.Name.contains('Agentforce') || ws.Name.contains('Sales')) {
        // Add features for agentforce/sales workshop  
        ws.Industry_Features__c = 'AI Accelerator;Einstein Summary;Einstein Autofill;Action Plans;Decision Table';
    } else if (ws.Name.contains('Recall') || ws.Name.contains('Product')) {
        // Add features for recall/product workshop
        ws.Industry_Features__c = 'Batch Management;Complaints Management;Timeline;Record Alerts;Audit Trail';
    } else {
        // Default features for other workshops
        ws.Industry_Features__c = 'Action Plans;Timeline;Scoring Framework;Process Compliance Navigator';
    }
    
    System.debug('Updated workshop: ' + ws.Name + ' with features: ' + ws.Industry_Features__c);
}

try {
    update workshops;
    System.debug('✅ Successfully updated ' + workshops.size() + ' workshops with industry features');
} catch (Exception e) {
    System.debug('❌ Error updating workshops: ' + e.getMessage());
}

// Verify the updates
List<Workshop__c> updated = [SELECT Id, Name, Industry_Features__c FROM Workshop__c WHERE Industry_Features__c != null];
System.debug('📊 Workshops with industry features: ' + updated.size());
for (Workshop__c w : updated) {
    System.debug('✅ ' + w.Name + ': ' + w.Industry_Features__c);
} 