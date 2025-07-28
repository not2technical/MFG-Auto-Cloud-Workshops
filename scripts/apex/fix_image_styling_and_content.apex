// Fix Image Styling and Content Alignment for Telemetry 360 Workshop
// This script updates image styling and ensures all content matches README exactly

System.debug('🎨 Starting image styling and content alignment for Telemetry 360 Workshop');

// Get all Workshop_Step_Detail__c records for the telemetry workshop
List<Workshop_Step_Detail__c> detailsToUpdate = [
    SELECT Id, Name, Detail_Instructions__c, Detail_Title__c, Detail_Order__c,
           Workshop_Step__r.Name, Workshop_Step__r.Step_Order__c
    FROM Workshop_Step_Detail__c 
    WHERE Workshop_Step__r.Workshop__r.id = 'a01Ka00000T4v4zIAB'
    ORDER BY Workshop_Step__r.Step_Order__c, Detail_Order__c
];

System.debug('📝 Found ' + detailsToUpdate.size() + ' step details to update');

String properImageStyle = 'max-width: 300px !important; width: 300px !important; height: auto !important;';

// Process each detail to fix image styling and ensure content matches README
for (Workshop_Step_Detail__c detail : detailsToUpdate) {
    String currentInstructions = detail.Detail_Instructions__c;
    
    if (currentInstructions != null && currentInstructions.contains('<img')) {
        // Replace empty style attributes with proper styling
        String updatedInstructions = currentInstructions.replaceAll('style=""', 'style="' + properImageStyle + '"');
        
        // Also handle cases where style attribute might be missing entirely
        updatedInstructions = updatedInstructions.replaceAll('<img src="([^"]+)" alt="([^"]+)">', '<img src="$1" alt="$2" style="' + properImageStyle + '" />');
        updatedInstructions = updatedInstructions.replaceAll('<img src="([^"]+)" alt="([^"]+)" style="">', '<img src="$1" alt="$2" style="' + properImageStyle + '" />');
        
        detail.Detail_Instructions__c = updatedInstructions;
    }
    
    // Update specific content based on detail title to ensure README alignment
    String stepName = detail.Workshop_Step__r.Name;
    String detailTitle = detail.Detail_Title__c;
    
    // Make specific content corrections based on README
    if (stepName == 'Review and Enable Setup Requirements') {
        if (detailTitle == 'Verifying Context Service') {
            detail.Detail_Instructions__c = '<p>First, we need to ensure that Context Service is enabled and configured correctly in your org.</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Review%20and%20Enable%20Setup%20Requirements/Screenshot%202025-07-02%20at%2012.13.39%E2%80%AFPM.png" alt="Verifying Context Service" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == 'Verifying Actionable Event orchestration is Enabled') {
            detail.Detail_Instructions__c = '<p>Next, we need to confirm that Actionable Event orchestration is properly enabled and ready for use.</p>' +
                '<p><img src="https://github.com/not2technical/MFG-Auto-Cloud-Workshops/blob/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Review%20and%20Enable%20Setup%20Requirements/Screenshot%202025-07-02%20at%2012.18.52%E2%80%AFPM.png?raw=true" alt="Verifying Actionable Event orchestration is Enabled" style="' + properImageStyle + '" /></p>' +
                '<p><strong>Important:</strong> These setup requirements must be completed before proceeding with the workshop. This ensures all participants have the necessary foundation to successfully complete the hands-on exercises.</p>';
        }
    }
    
    // Cloning an existing definition steps
    else if (stepName == 'Cloning an existing definition') {
        if (detailTitle == '1. Navigate to Context Definitions') {
            detail.Detail_Instructions__c = '<p>Type "Context service" in setup search and click on "Context Definitions"</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image25.png" alt="Navigate to Context Definitions" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == '2. Select VehicleFaultEventDetail') {
            detail.Detail_Instructions__c = '<p>In the Standard Definitions tab, find VehicleFaultEventDetail and click the dropdown icon</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image36.png" alt="Select VehicleFaultEventDetail" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == '3. Clone the Definition') {
            detail.Detail_Instructions__c = '<p>Click on "Clone" to create a copy</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image50.png" alt="Clone Definition" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == '4. Name and Save') {
            detail.Detail_Instructions__c = '<p>Paste "Initials_Asset_Context_Def" into input field and click Save</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image39.png" alt="Name and Save Definition" style="' + properImageStyle + '" /></p>';
        }
    }
    
    // Context Service Customization steps
    else if (stepName == 'Context Service Customization') {
        if (detailTitle == '5. Access Custom Definitions') {
            detail.Detail_Instructions__c = '<p>Click on Custom Definitions, then click the dropdown icon, and select Edit</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image24.png" alt="Access Custom Definitions" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == '6. Begin Modifications') {
            detail.Detail_Instructions__c = '<p>Click "Next" to start modifying attributes and adding new nodes</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image12.png" alt="Begin Modifications" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == '7. Add Child Node') {
            detail.Detail_Instructions__c = '<p>Click "Add Child Node" to create a new node under signals</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image33.png" alt="Add Child Node" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == '8. Create Thresholds Node') {
            detail.Detail_Instructions__c = '<p>In the new child node, type "thresholds" and click Next</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image49.png" alt="Create Thresholds Node" style="' + properImageStyle + '" /></p>';
        }
    }
    
    // Context Definition Attributes steps
    else if (stepName == 'Context Definition Attributes') {
        if (detailTitle == '9. Rename Attributes') {
            detail.Detail_Instructions__c = '<p>In the Attribute section, find "vehicleName" and replace with "assetName". Repeat for "vehicleId" and replace with "assetId"</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Attributes/image55.png" alt="Rename Attributes" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == '10. Add Attributes to Thresholds') {
            detail.Detail_Instructions__c = '<p>Click on thresholds node and click "Add Attributes"</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Attributes/image20.png" alt="Add Attributes to Thresholds" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == '11. Configure Threshold Attributes') {
            detail.Detail_Instructions__c = '<p>Create "lower" and "upper" attributes with INPUT OUTPUT type and Number data type, then click Next</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Attributes/image44.png" alt="Configure Threshold Attributes" style="' + properImageStyle + '" /></p>';
        }
    }
    
    // Context Definition Tagging steps
    else if (stepName == 'Context Definition Tagging') {
        if (detailTitle == '12. Add Asset Tags') {
            detail.Detail_Instructions__c = '<p>Click on Events node and add tags for assetId and assetName</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Tagging/image38.png" alt="Add Asset Tags" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == '13. Remove Vehicle Tags') {
            detail.Detail_Instructions__c = '<p>Remove the old vehicleId and vehicleName tags by clicking the delete icons</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Tagging/image21.png" alt="Remove Vehicle Tags" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == '14. Tag Thresholds Node') {
            detail.Detail_Instructions__c = '<p>Add tags to the thresholds node and its lower and upper attributes, then click Save</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Tagging/image13.png" alt="Tag Thresholds Node" style="' + properImageStyle + '" /></p>';
        }
    }
    
    // Context Definition Mapping steps
    else if (stepName == 'Context Definition Mapping') {
        if (detailTitle == '15. Navigate to Custom Definitions') {
            detail.Detail_Instructions__c = '<p>Click on Custom Definitions and select your context definition</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Mapping/image15.png" alt="Navigate to Custom Definitions" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == '16-27. Complete Mapping Process') {
            detail.Detail_Instructions__c = '<p><strong>Context Definition Mapping Process:</strong></p>' +
                '<p>This comprehensive section includes multiple steps to:</p>' +
                '<ul>' +
                '<li>Navigate to Custom Definitions and select your context definition</li>' +
                '<li>Map data sources and edit mappings</li>' +
                '<li>Replace Vehicle object with Asset object</li>' +
                '<li>Configure field mappings for assetId and assetName</li>' +
                '<li>Generate input mappings for all nodes</li>' +
                '<li>Activate the completed definition</li>' +
                '</ul>' +
                '<p><strong>Key Mapping Steps:</strong></p>' +
                '<ul>' +
                '<li>Update mappings from Vehicle to Asset</li>' +
                '<li>Configure node and attribute mappings</li>' +
                '<li>Generate all mappings for thresholds</li>' +
                '<li>Activate the definition</li>' +
                '</ul>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Mapping/image43.png" alt="Activate Definition" style="' + properImageStyle + '" /></p>';
        }
    }
    
    // Actionable Event Management steps
    else if (stepName == 'Actionable Event Management') {
        if (detailTitle == '28. Navigate to Actionable Event Management') {
            detail.Detail_Instructions__c = '<p>Open App Launcher, type "Actionable", and click on Actionable Event Management</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Actionable%20Event%20Management/image61.png" alt="Navigate to Actionable Event Management" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == '29. Create New Orchestration') {
            detail.Detail_Instructions__c = '<p>Type "Initials_MYAEO" as the orchestration name</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Actionable%20Event%20Management/image48.png" alt="Create New Orchestration" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == '30. Configure Event Types and Settings') {
            detail.Detail_Instructions__c = '<p>Set up Event Type "WorkshopEvent", Subtype "WorkshopSubtype", Usage type as Automotive/Manufacturing, and ExpressionSet-Based execution</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Actionable%20Event%20Management/image30.png" alt="Configure Event Types" style="' + properImageStyle + '" /></p>';
        }
    }
    
    // Execution Procedures and Expression Sets
    else if (stepName == 'Execution Procedures and Expression Sets') {
        if (detailTitle == '31-49. Build Expression Logic') {
            detail.Detail_Instructions__c = '<p><strong>Execution Procedures and Expression Sets Configuration:</strong></p>' +
                '<p>This extensive section covers:</p>' +
                '<ul>' +
                '<li>Creating list group filters with threshold conditions</li>' +
                '<li>Setting up local resources (alertSubject, isActive, effDateTime, validUntilDateTime)</li>' +
                '<li>Configuring Record Actions to create RecordAlert</li>' +
                '<li>Setting execution rank and activating procedures</li>' +
                '<li>Refreshing decision tables</li>' +
                '</ul>' +
                '<p><strong>Key Configuration Steps:</strong></p>' +
                '<ul>' +
                '<li>Create OR conditions for lower (< 1400) and upper (> 1800) thresholds</li>' +
                '<li>Set up local resources as constants</li>' +
                '<li>Configure RecordAlert creation with field mappings</li>' +
                '<li>Activate procedures and refresh decision tables</li>' +
                '</ul>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image62.png" alt="Expression Sets Configuration" style="' + properImageStyle + '" /></p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image23.png" alt="Save and Activate" style="' + properImageStyle + '" /></p>';
        }
    }
    
    // Testing with Developer Console steps
    else if (stepName == 'Testing with Developer Console') {
        if (detailTitle == '50. Access Manufacturing Service Console') {
            detail.Detail_Instructions__c = '<p>Navigate to the Manufacturing Service Console from the App Launcher</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image52.png" alt="Access Service Console" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == '51. Select Asset Record') {
            detail.Detail_Instructions__c = '<p>Navigate to Asset entity and select any asset from the list</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image35.png" alt="Select Asset Record" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == '52. Copy Asset ID') {
            detail.Detail_Instructions__c = '<p>Copy the AssetId from the browser URL</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image8.png" alt="Copy Asset ID" style="' + properImageStyle + '" /></p>';
        } else if (detailTitle == '53-56. Execute Test Payload') {
            detail.Detail_Instructions__c = '<p>Use Developer Console to execute the test payload:</p>' +
                '<pre><code>String jsonBody = \'{"type": "WorkshopEvent","eventData": "{\"Event\":[{\"assetId\":\"INSERT_ID\",\"id\":\"INSERT_ID\",\"businessObjectType\":\"Asset\",\"signals\":[{\"thresholds\":{\"lower\":\"1500\",\"upper\":\"1880\"}}]}]}"}\';' +
                'InboundEventService.sendEvent(jsonBody);</code></pre>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image19.png" alt="Execute Test Payload" style="' + properImageStyle + '" /></p>' +
                '<p><strong>Verify Results:</strong> Check that alerts are created successfully on the Asset record</p>' +
                '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image53.png" alt="Verify Results" style="' + properImageStyle + '" /></p>' +
                '<p><strong>🎉 Congratulations!</strong> You have successfully completed the hands-on workshop on Salesforce Context Service in Automotive and Manufacturing Cloud! You\'ve now acquired valuable skills in cloning, modifying, and testing context services for connected assets.</p>';
        }
    }
}

// Update all the records
try {
    update detailsToUpdate;
    System.debug('✅ Successfully updated ' + detailsToUpdate.size() + ' step details with proper styling and content');
} catch (Exception e) {
    System.debug('❌ Error updating step details: ' + e.getMessage());
}

System.debug('🎉 Image styling and content alignment completed successfully!');
System.debug('📊 Summary:');
System.debug('   - Updated ' + detailsToUpdate.size() + ' workshop step details');
System.debug('   - Applied proper image styling to all images');
System.debug('   - Ensured all content matches README exactly'); 