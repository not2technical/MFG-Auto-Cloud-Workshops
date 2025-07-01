// Complete Comprehensive Update of ALL Workshop Step Instructions for "Supercharge Experiences: Connect Telemetry to CRM360"
// Workshop ID: a01Ka00000T4v4zIAB

List<Workshop_Step__c> stepsToUpdate = [SELECT Id, Name, Step_Order__c FROM Workshop_Step__c WHERE Workshop__c = 'a01Ka00000T4v4zIAB' ORDER BY Step_Order__c];

for(Workshop_Step__c step : stepsToUpdate) {
    if(step.Step_Order__c == 1) {
        // Step 1: Context Service Configuration Guide (Steps 1-7)
        step.Instructions__c = '<p><strong>Context Service Configuration Guide</strong></p>' +
            '<p>The context service enables you to enhance customer experiences by providing contextual information to agents and automated systems. This section will guide you through configuring the context service to connect telemetry data to your CRM.</p>' +
            '<p><strong>Step 1: Navigate to Setup</strong></p>' +
            '<p>From the App Launcher, search for and select "Context Service Configuration"</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Configuration%20Guide/image1.png" alt="Navigate to Setup"></img></p>' +
            '<p><strong>Step 2: Access Context Service Setup</strong></p>' +
            '<p>Click on "Context Service Setup" to begin configuration</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Configuration%20Guide/image17.png" alt="Access Context Service Setup"></img></p>' +
            '<p><strong>Step 3: Configure Context Definition</strong></p>' +
            '<p>Set up the context definition that will handle incoming telemetry data</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Configuration%20Guide/image18.png" alt="Configure Context Definition"></img></p>' +
            '<p><strong>Step 4: Enable Context Service</strong></p>' +
            '<p>Turn on the Context Service functionality for your organization</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Configuration%20Guide/image26.png" alt="Enable Context Service"></img></p>' +
            '<p><strong>Step 5: Configure Permissions</strong></p>' +
            '<p>Set up the necessary permissions for context service access</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Configuration%20Guide/image46.png" alt="Configure Permissions"></img></p>' +
            '<p><strong>Step 6: Review Configuration</strong></p>' +
            '<p>Verify all settings are properly configured before proceeding</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Configuration%20Guide/image47.png" alt="Review Configuration"></img></p>' +
            '<p><strong>Step 7: Save Configuration</strong></p>' +
            '<p>Complete the context service setup by saving your configuration</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Configuration%20Guide/image56.png" alt="Save Configuration"></img></p>';
    }
    else if(step.Step_Order__c == 2) {
        // Step 2: Cloning an existing definition (Steps 8-11)
        step.Instructions__c = '<p><strong>Cloning an Existing Definition</strong></p>' +
            '<p>To speed up the configuration process, we will clone an existing context definition and modify it for our telemetry use case.</p>' +
            '<p><strong>Step 8: Locate Existing Definition</strong></p>' +
            '<p>Navigate to the existing context definitions and find a suitable template to clone</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image25.png" alt="Locate Existing Definition"></img></p>' +
            '<p><strong>Step 9: Select Clone Option</strong></p>' +
            '<p>Click on the clone button to create a copy of the existing definition</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image36.png" alt="Select Clone Option"></img></p>' +
            '<p><strong>Step 10: Modify Clone Settings</strong></p>' +
            '<p>Update the cloned definition with your specific requirements and naming conventions</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image39.png" alt="Modify Clone Settings"></img></p>' +
            '<p><strong>Step 11: Save Cloned Definition</strong></p>' +
            '<p>Complete the cloning process by saving the new definition</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image50.png" alt="Save Cloned Definition"></img></p>';
    }
    else if(step.Step_Order__c == 3) {
        // Step 3: Context Service Customization (Steps 12-15)
        step.Instructions__c = '<p><strong>Context Service Customization</strong></p>' +
            '<p>Customize the context service to meet your specific business requirements and integrate with your telemetry data sources.</p>' +
            '<p><strong>Step 12: Access Customization Settings</strong></p>' +
            '<p>Navigate to the context service customization interface</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image12.png" alt="Access Customization Settings"></img></p>' +
            '<p><strong>Step 13: Configure Data Sources</strong></p>' +
            '<p>Set up the telemetry data sources that will feed into the context service</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image24.png" alt="Configure Data Sources"></img></p>' +
            '<p><strong>Step 14: Set Up Data Processing Rules</strong></p>' +
            '<p>Define how incoming telemetry data should be processed and filtered</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image33.png" alt="Set Up Data Processing Rules"></img></p>' +
            '<p><strong>Step 15: Validate Customization</strong></p>' +
            '<p>Test and validate your customization settings before proceeding</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image49.png" alt="Validate Customization"></img></p>';
    }
    else if(step.Step_Order__c == 4) {
        // Step 4: Context Definition Attributes (Steps 16-18)
        step.Instructions__c = '<p><strong>Context Definition Attributes</strong></p>' +
            '<p>Configure the attributes that will be used to define the context for your telemetry data integration.</p>' +
            '<p><strong>Step 16: Define Attribute Structure</strong></p>' +
            '<p>Set up the attribute structure that will be used to categorize and process telemetry data</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Attributes/image20.png" alt="Define Attribute Structure"></img></p>' +
            '<p><strong>Step 17: Configure Attribute Properties</strong></p>' +
            '<p>Set the properties and validation rules for each attribute</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Attributes/image44.png" alt="Configure Attribute Properties"></img></p>' +
            '<p><strong>Step 18: Save Attribute Configuration</strong></p>' +
            '<p>Complete the attribute setup by saving your configuration</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Attributes/image55.png" alt="Save Attribute Configuration"></img></p>';
    }
    else if(step.Step_Order__c == 5) {
        // Step 5: Context Definition Tagging (Steps 19-21)
        step.Instructions__c = '<p><strong>Context Definition Tagging</strong></p>' +
            '<p>Implement tagging strategies to organize and categorize your context definitions for better management and retrieval.</p>' +
            '<p><strong>Step 19: Create Tag Categories</strong></p>' +
            '<p>Set up tag categories that will help organize your context definitions</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Tagging/image13.png" alt="Create Tag Categories"></img></p>' +
            '<p><strong>Step 20: Apply Tags to Definitions</strong></p>' +
            '<p>Apply appropriate tags to your context definitions for better organization</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Tagging/image21.png" alt="Apply Tags to Definitions"></img></p>' +
            '<p><strong>Step 21: Manage Tag Hierarchy</strong></p>' +
            '<p>Organize tags in a hierarchical structure for efficient management</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Tagging/image38.png" alt="Manage Tag Hierarchy"></img></p>';
    }
    else if(step.Step_Order__c == 6) {
        // Step 6: Context Definition Mapping (Steps 22-27)
        step.Instructions__c = '<p><strong>Context Definition Mapping</strong></p>' +
            '<p>Map your telemetry data fields to Salesforce objects and fields to ensure seamless data integration and processing.</p>' +
            '<p><strong>Step 22: Access Mapping Interface</strong></p>' +
            '<p>Navigate to the context definition mapping interface to begin field mapping</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Mapping/image15.png" alt="Access Mapping Interface"></img></p>' +
            '<p><strong>Step 23: Define Source Fields</strong></p>' +
            '<p>Identify and configure the source fields from your telemetry data</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Mapping/image2.png" alt="Define Source Fields"></img></p>' +
            '<p><strong>Step 24: Map to Target Objects</strong></p>' +
            '<p>Map source fields to appropriate Salesforce objects and fields</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Mapping/image27.png" alt="Map to Target Objects"></img></p>' +
            '<p><strong>Step 25: Configure Data Transformation</strong></p>' +
            '<p>Set up any necessary data transformations between source and target fields</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Mapping/image29.png" alt="Configure Data Transformation"></img></p>' +
            '<p><strong>Step 26: Validate Mapping Rules</strong></p>' +
            '<p>Test and validate your mapping rules to ensure data flows correctly</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Mapping/image31.png" alt="Validate Mapping Rules"></img></p>' +
            '<p><strong>Step 27: Save Mapping Configuration</strong></p>' +
            '<p>Complete the mapping setup by saving your configuration</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Mapping/image32.png" alt="Save Mapping Configuration"></img></p>';
    }
    else if(step.Step_Order__c == 7) {
        // Step 7: Actionable Event Management (Steps 28-30)
        step.Instructions__c = '<p><strong>Actionable Event Management</strong></p>' +
            '<p>Define the actions to be performed for actionable events generated by assets by creating actionable event orchestrations. Create qualification and evaluation rules for different types of actionable events that are generated in assets. Design an orchestration process that detects fault codes that an external system sends, and perform actions based on preset conditions. For example, create and update work orders, milestones, and cases for sensor fault events that assets or vehicles send to Salesforce.</p>' +
            '<p><strong>Step 28: Navigate to Actionable Event Management</strong></p>' +
            '<ol><li>Click on App Launcher</li><li>Type "Actionable"</li><li>Click on Actionable Event Management</li><li>Navigate to Actionable Event Orchestration and Click New</li></ol>' +
            '<p><em>Time to start the fun of creating a new Actionable event orchestration. Note: You may need to navigate Actionable Event Orchestration from home on the navigation bar.</em></p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Actionable%20Event%20Management/image61.png" alt="Navigate to Actionable Event Management"></img></p>' +
            '<p><strong>Step 29: Create New Orchestration</strong></p>' +
            '<p>Type "Initials_MYAEO"</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Actionable%20Event%20Management/image48.png" alt="Create New Orchestration"></img></p>' +
            '<p><strong>Step 30: Configure Event Types and Settings</strong></p>' +
            '<ol><li>Type "Initials_MYAEO" Example "AK_MYAEO"</li><li>Click Event Type, + New Actionable Event Type, Type WorkshopEvent, Click Save</li><li>Click Event Subtype, + New Actionable Event Subtype, Type WorkshopSubtype, Select Event Type WorkshopEvent, Click Save</li></ol>' +
            '<p><em>In the first 3 steps we name the actionable event, Create the Event and Subtype, Relate the event and subtype</em></p>' +
            '<ol start="4"><li>Click Usage type and choose Automotive or Manufacturing</li><li>Choose ExpressionSet-Based for Execution type</li><li>Click Context definition and select the definition from the previous section</li><li>Click Context Mapping and choose AssetFaultEventDetailMapping</li><li>Click Save</li></ol>' +
            '<p><em>In these steps we assign the ExpressionSet, Usage Type, Context definition and Mapping, and Save</em></p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Actionable%20Event%20Management/image30.png" alt="Configure Event Types"></img></p>';
    }
    else if(step.Step_Order__c == 8) {
        // Step 8: Execution Procedures and Expression Sets (Steps 31-49)
        step.Instructions__c = '<p><strong>🦾 Execution Procedures and Expression Sets</strong></p>' +
            '<p>This section we get to start pulling variables from the event stream and local and direct from CRM in practice. For time we will just use local and events variables.</p>' +
            '<p><strong>Step 31: Access Execution Procedure</strong></p>' +
            '<p>Click on Initials_MYAEO</p>' +
            '<p><em>After saving from the previous set a new execution procedure was created. This is where access to the expression set is connected to define the rules and actions from the event stream.</em></p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image10.png" alt="Access Execution Procedure"></img></p>' +
            '<p><strong>Step 32: Open Procedure Version</strong></p>' +
            '<p>Click on Initials_MYAEO V1</p>' +
            '<p><em>The procedure is the junction between definitions and expressions</em></p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image64.png" alt="Open Procedure Version"></img></p>' +
            '<p><strong>Step 33: Add New Element</strong></p>' +
            '<p>Click on + Symbol</p>' +
            '<p><em>This is a wide array of different elements to choose from.</em></p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image60.png" alt="Add New Element"></img></p>' +
            '<p><strong>Step 34: Select List Group</strong></p>' +
            '<p>Click on List Group</p>' +
            '<p><em>We use the list group element to in this case to do a simple filter</em></p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image16.png" alt="Select List Group"></img></p>' +
            '<p><strong>Step 35: Configure Filter Conditions</strong></p>' +
            '<ol><li>In Filter conditions choose OR</li><li>In Resource Type lower, click the event variable, Operator choose Less than, Value Type 1400</li><li>In Resource Type upper, click the event variable, Operator choose Greater than, Value Type 1800</li></ol>' +
            '<p><em>In the list filter we choose to evaluate two conditions lower or upper from the event stream. If either of these evaluate to true, we move to the next step. Please note a decision matrix could be used here</em></p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image62.png" alt="Configure Filter Conditions"></img></p>' +
            '<p><strong>Step 36: Create Local Resources</strong></p>' +
            '<ol><li>Select Resource manager</li><li>Click Add Resource</li><li>Create the four variables below - alertSubject, isActive, effDateTime, validUntilDateTime</li></ol>' +
            '<p><em>In this step we will create the variables to hold the data from CRM. We will create constants for the purpose of this workshop but ideally these would be passed out of a flow</em></p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image72.png" alt="Create Local Resources"></img></p>' +
            '<p><strong>ℹ️ Details to create the Local Resources that will be used for this exercise</strong></p>' +
            '<table border="1" style="border-collapse: collapse; width: 100%;"><tr><th style="border: 1px solid black; padding: 8px;">Name</th><th style="border: 1px solid black; padding: 8px;">Resource Name</th><th style="border: 1px solid black; padding: 8px;">Resource Type</th><th style="border: 1px solid black; padding: 8px;">Data Type</th><th style="border: 1px solid black; padding: 8px;">Default Value</th></tr>' +
            '<tr><td style="border: 1px solid black; padding: 8px;">AlertSubject</td><td style="border: 1px solid black; padding: 8px;">AlertSubject</td><td style="border: 1px solid black; padding: 8px;">Constant</td><td style="border: 1px solid black; padding: 8px;">Text</td><td style="border: 1px solid black; padding: 8px;">Tested Alert</td></tr>' +
            '<tr><td style="border: 1px solid black; padding: 8px;">effDateTime</td><td style="border: 1px solid black; padding: 8px;">effDateTime</td><td style="border: 1px solid black; padding: 8px;">Constant</td><td style="border: 1px solid black; padding: 8px;">DateTime</td><td style="border: 1px solid black; padding: 8px;">Sep 1, 2023 &amp; Current Time</td></tr>' +
            '<tr><td style="border: 1px solid black; padding: 8px;">isActive</td><td style="border: 1px solid black; padding: 8px;">isActive</td><td style="border: 1px solid black; padding: 8px;">Constant</td><td style="border: 1px solid black; padding: 8px;">Boolean</td><td style="border: 1px solid black; padding: 8px;">true</td></tr>' +
            '<tr><td style="border: 1px solid black; padding: 8px;">validUntilDateTime</td><td style="border: 1px solid black; padding: 8px;">validUntilDateTime</td><td style="border: 1px solid black; padding: 8px;">Constant</td><td style="border: 1px solid black; padding: 8px;">DateTime</td><td style="border: 1px solid black; padding: 8px;">Sep 1, 2025 &amp; Current Time</td></tr></table>' +
            '<p><strong>Step 37: Add Record Action</strong></p>' +
            '<p>Click the + symbol and select the Action element called Record Action...</p>' +
            '<p><em>Adding actions are a powerful step post filter qualifications. They allow easy create and update of records hydrated by the context service, connected with CRM data to drive actions in real time</em></p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image14.png" alt="Add Record Action"></img></p>' +
            '<p><strong>Step 38: Configure Record Action</strong></p>' +
            '<ol><li>Choose Create</li><li>Type "record"</li><li>Select the Entity RecordAlert</li></ol>' +
            '<p><em>Be patient on this step as the object lookup field loads all the objects to choose from.</em></p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image28.png" alt="Configure Record Action"></img></p>' +
            '<p><strong>Step 39: Assign Field Mappings</strong></p>' +
            '<ol><li>EffectiveDate assign effDateTime</li><li>isActive assign isActive</li><li>ValidUntilDate assign validUntilDateTime</li><li>WhatId assign assetId</li><li>Subject assign AlertSubject</li></ol>' +
            '<p><em>Assign the variables to the record alert fields. Note that the assetId variable is from the event steam so just type assetId in the WhatId</em></p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image51.png" alt="Assign Field Mappings"></img></p>' +
            '<p><strong>Steps 40-49: Complete Configuration and Testing</strong></p>' +
            '<p><strong>Step 40:</strong> Choose the gear icon and set Rank to 1</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image4.png" alt="Set Rank"></img></p>' +
            '<p><strong>Step 41:</strong> With Record actions selected, choose Business element Icon and check Include in Output</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image5.png" alt="Include in Output"></img></p>' +
            '<p><strong>Step 42:</strong> Remove output Parameter by clicking trash icon</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image41.png" alt="Remove Output Parameter"></img></p>' +
            '<p><strong>Step 43:</strong> Click Save, then Activate</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image23.png" alt="Save and Activate"></img></p>' +
            '<p><strong>Steps 44-49:</strong> Navigate back to Event Orchestration, activate it, access Setup, navigate to Decision Tables, Filter and Match, Refresh, and verify refresh date</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image37.png" alt="Final Steps"></img></p>';
    }
    else if(step.Step_Order__c == 9) {
        // Step 9: Testing with Developer Console (Steps 50-56)
        step.Instructions__c = '<p><strong>Testing with Developer Console</strong></p>' +
            '<p>Use the Developer Console to test your context service configuration and verify that telemetry data is being processed correctly.</p>' +
            '<p><strong>Step 50: Open Developer Console</strong></p>' +
            '<p>Access the Developer Console from the Setup menu to begin testing</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image19.png" alt="Open Developer Console"></img></p>' +
            '<p><strong>Step 51: Create Test Script</strong></p>' +
            '<p>Write a test script to simulate telemetry data input</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image35.png" alt="Create Test Script"></img></p>' +
            '<p><strong>Step 52: Execute Test Data</strong></p>' +
            '<p>Run your test script to send sample data through the context service</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image42.png" alt="Execute Test Data"></img></p>' +
            '<p><strong>Step 53: Monitor Processing</strong></p>' +
            '<p>Monitor the data processing to ensure everything is working correctly</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image52.png" alt="Monitor Processing"></img></p>' +
            '<p><strong>Step 54: Review Results</strong></p>' +
            '<p>Examine the test results to verify data accuracy and completeness</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image53.png" alt="Review Results"></img></p>' +
            '<p><strong>Step 55: Debug Issues</strong></p>' +
            '<p>Identify and resolve any issues found during testing</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image57.png" alt="Debug Issues"></img></p>' +
            '<p><strong>Step 56: Validate Configuration</strong></p>' +
            '<p>Perform final validation to ensure the entire setup is working as expected</p>' +
            '<p><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image8.png" alt="Validate Configuration"></img></p>';
    }
}

// Update all steps
update stepsToUpdate;

System.debug('Successfully updated comprehensive instructions for all workshop steps'); 