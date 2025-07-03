# Dynamic Hands-On Workshop Application & Framework

This project is a dynamic, user-friendly application and framework for delivering hands-on workshops in Salesforce. It is designed to make technical and business workshops simple, engaging, and easy to follow for all users.

## 📋 Table of Contents

- [🎯 Purpose](#-purpose)
- [🚀 Features](#-features)  
- [👥 Who is this for?](#-who-is-this-for)
- [📚 Workshops](#-workshops)
  - [✨ Extend Agentforce Smarter Sales Agreements](#workshop-extend-agentforce-smarter-sales-agreements)
  - [⚡️ Supercharge Experiences: Connect Telemetry to CRM360](#workshop-supercharge-experiences-connect-telemetry-to-crm360)

---

## 🎯 Purpose

The purpose of this app is to simplify hands-on workshop exercises by:
- Centralizing all workshop content and steps in one place
- Making it easy for users to access, follow, and complete workshop steps
- Tracking each user's progress through each workshop
- Providing a clear, interactive, and visually engaging experience

## 🚀 Features
- **Dynamic Workshop Navigation:** Users can browse available workshops and see their progress at a glance.
- **Step-by-Step Guidance:** Each workshop is broken down into clear, actionable steps, with rich text, images, and instructions.
- **Progress Tracking:** Users can mark steps as complete and see their progress update in real time.
- **Modern Salesforce LWC Architecture:** Built with Lightning Web Components for performance and maintainability.
- **Easy Image and Asset Management:** Workshop images and assets are organized by workshop and step for clarity and reuse.

## 👥 Who is this for?
- Salesforce admins, developers, and business users who want to deliver or participate in hands-on workshops.
- Anyone looking for a scalable, maintainable way to manage technical enablement or training content in Salesforce.

---

## 📚 Workshops

<details>
<summary><strong>✨ Workshop: Extend Agentforce Smarter Sales Agreements</strong></summary>

### Workshop: Extend Agentforce Smarter Sales Agreements

<div><p><span style="font-size: 20px;">✨ </span><strong style="font-size: 20px;">Reimagine What's Possible for Your Business</strong></p><p><em>Picture this:</em> your sales agreement process runs smarter than ever — inventory checks happen automatically, conversations feel truly personalized, and your teams handle requests at lightning speed. This workshop is designed to spark ideas you can take back to your real company and adapt Agentforce for your unique needs.</p><hr></hr></div><div style="float: right; width: 300px;"><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Extend%20Agentforce%20Smarter%20Sales%20Agreements%20Workshop%20Main.png" alt="Extend Agentforce Smarter Sales Agreements" style="max-width: 300px !important; width: 300px !important; height: auto !important;"></img></div><div><p><strong>In this hands-on session, you'll learn how to:</strong></p><p>• Set up and extend <strong>Agentforce</strong> inside <strong>Manufacturing Cloud</strong></p><p>• Work with <strong>Sales Agreements</strong> &amp; <strong>Einstein Generative AI</strong></p><p><span style="background-color: rgb(255, 255, 255);">• Create and customize </span><strong style="background-color: rgb(255, 255, 255);">Agentforce Actions</strong><span style="background-color: rgb(255, 255, 255);"> with </span><strong style="background-color: rgb(255, 255, 255);">Prompt Builder </strong><span style="background-color: rgb(255, 255, 255);">and</span><strong style="background-color: rgb(255, 255, 255);"> Flow</strong></p><p>• Verify product availability automatically — so your key account managers never miss a beat.</p><hr></hr><p><strong>Audience:</strong> Technical • Level: ⭐⭐⭐☆☆ (3/5)</p>
  <hr></hr>
</div>

## Step: Enabling Sales Agreements

Manufacturing Cloud for Sales makes your run-rate business more predictable and enhances transparency and collaboration across sales and operations teams with accurate forecasts.

**To enable Sales Agreements:**

1. From Setup, in the Quick Find box, enter "Manufacturing," and then select Sales Agreements.
2. Turn on Sales Agreements Foundations by switching on the toggle

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Enabling%20Sales%20Agreements/Screenshot%202025-06-20%20at%202.28.24%E2%80%AFPM.png" alt="Enabling Sales Agreements 1" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

## Step: Einstein Setup

Einstein generative AI capabilities, built on the Salesforce platform, bring generative AI technology to your business at scale, helping supercharge productivity and simplify daily tasks. The Einstein Trust Layer safeguards business data and enhances AI accuracy.

**To set up Einstein Generative AI:**

1. **Turn On Einstein Generative AI:**
   - From Setup, enter "Einstein Setup" in the Quick Find box and turn it on. This also implies consent to store generative AI activity logs and feedback data in Data Cloud.

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Einstein%20Setup/Screenshot%202025-06-20%20at%202.26.39%E2%80%AFPM.png" alt="Einstein Setup 1" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

2. **Enable Manufacturing Generative AI:**
   - To configure and use prompt templates for manufacturing, turn on Manufacturing Generative AI in Setup.

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Einstein%20Setup/Screenshot%202025-06-23%20at%205.03.25%E2%80%AFPM.png" alt="Einstein Setup 2" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

## Step: Agents Setup

Agentforce allows you to deploy AI agents that work alongside employees, automating routine tasks and assisting with complex ones.

**To enable Agentforce:**

1. Ensure **Einstein Generative AI** is already turned on.
2. From Setup, in the Quick Find box, enter `Agent`, then select **Agentforce Agents**.
3. Switch on the **Agentforce** toggle.
4. On the same page, turn on the desired **Agent**.

**Example command:**
```
Turn on Agentforce > Turn on specific Agent
```

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Agents%20Setup/Screenshot%202025-06-20%20at%202.28.58%E2%80%AFPM.png" alt="Agents Setup 1" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

## Step: Prompt Templates

### Creating a New Prompt Template for Sales Agreement Inventory check

You will create a custom prompt template to check inventory and determine its status. The "**Flex**" prompt template type is suitable for custom business purposes not covered by other template types.

1. **Create a Flex Prompt Template:** From Setup, search for and select **Prompt Builder**.

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Prompt%20Templates/Screenshot%202025-06-24%20at%208.06.32%E2%80%AFPM.png" alt="Prompt Templates 5" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

   - Click **New Prompt Template**. In the "Prompt Template Type" dropdown, select **Flex**. 
   - Specify a unique "Prompt Template Name" (e.g., "*Sales Agreement Product Inventory Check*"). 
   - Specify Template description (e.g., This prompt that looks for low inventory on products within a sales agreement).
   - **Define sources for this prompt**.

**Template Configuration:**
- Name — *Sales Agreement Product Inventory Check*
- API Name — *Auto Populates*
- Description — *This prompt that looks for low inventory on products within a sales agreement*
- Type — Object
- Object — Sales Agreement

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Prompt%20Templates/Screenshot%202025-06-24%20at%208.02.20%E2%80%AFPM.png" alt="Prompt Templates 4" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

   c. **Click Next**

2. **Write the prompt template** in the "Prompt Template Workspace" to instruct the LLM on how to check inventory and determine its status.

**Copy and Use Example Prompt Text below:**

```
Goal:

You are an assistant to key account managers. You must understand and analyze inventory data related to sales agreement products. You're provided with remaining inventory quantities for products that are part of the sales agreement.
You must create an Inventory Summary that shows the current available inventory quantities for each product, highlighting potential restocking needs or surplus situations.

Data Structure:
The JSON data contains a list of objects, each representing a product's inventory. Each object has the following properties:
1. InventoryName: Stores the unique inventory record identifier.
2. Product: Stores the name of the product.
3. AvailableQuantities: Stores the quantity available for that product.

Inventory Insight Interpretations:
- Low Quantity (below 1000): Might indicate potential stock shortage or the need for restocking.
- High Quantity (above 5000): Might indicate potential overstock that could affect cash flow or warehouse capacity.
- Normal Quantity (1000 - 5000): Indicates stable inventory level.

Output:
Use the Inventory Summary Template to generate the summary.
<table>
<strong>Inventory Summary by Product</strong>
 <tr>
  <td>INV-00008</td>
  <td>Hydraulic Pump H9000</td>
  <td>3,083</td>
  <td><em>Stable inventory level</em></td>
 </tr>
</table>

Formatting Guidelines:
- Generate the table in HTML format with the border property set to 1 for all tables.
- Use <p> for paragraphs.
- Use <strong> for bolded content.
- Use <em> for italicized text.
- Do not use any heading tags.
- Ensure proper semantic elements for tables.
- When generating table rows, include all records from the JSON data in the same order they appear.
- Apply quantity thresholds to generate insights dynamically.

Whitespace Management:
- Do not use any &nbsp; or unnecessary white spaces between HTML elements.
- Keep whitespace inside the table cells and rows minimal and only as needed for proper HTML formatting.
- Ensure the output is clean, with no leading or trailing spaces in the final 

If no JSON data is provided, respond with: "No inventory summary available for this sales agreement."

JSON Data:
```

**JSON Data:** Place the cursor below the JSON data: label. From the insert resource box, Select **Flows -> Prompt Inventory Check**. The prompt should now end with **Flow:Prompt_Inventory_Check**. (Do not type this. Select from the resources area)

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Prompt%20Templates/Screenshot%202025-06-20%20at%202.39.54%E2%80%AFPM.png" alt="Prompt Templates 3" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

3. **Save and Preview:** Choose the *QuantumMesh_SA_2025 Sales agreement*. The response should be a formatted table.

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Prompt%20Templates/Screenshot%202025-06-20%20at%202.41.39%E2%80%AFPM.png" alt="Prompt Templates 2" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

4. Review the Resolved prompt and the Generated Response
5. **Finally:** Once satisfied, activate the prompt template so it can be used across your org.

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Prompt%20Templates/Screenshot%202025-06-20%20at%202.42.06%E2%80%AFPM.png" alt="Prompt Templates 1" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />


## Step: Agentforce for Industries extension

### Adding Prompt Template to Sales Agreement Management Agentforce Topic as an Action

The "Sales Agreement Management" is an out-of-the-box topic available within Manufacturing Agentforce. To integrate your new prompt template, you will extend the default agent action that calls this prompt template and then add it to the existing "Sales Agreement Management" topic.

**Steps: Create an Agent Action**

1. From Setup, search for and select *Agentforce Assets*.
2. On the Actions tab, click *New Agent Action*.
3. From the *"Reference Action Type"* dropdown, select **Prompt Template**.
4. Select your newly created **"Sales Agreement Product Inventory Check"** prompt template.
5. Review the auto-populated *Agent Action Label* and *API Name*, adjusting as needed.
6. Click Next

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Agentforce%20for%20Industries%20extension/Screenshot%202025-06-23%20at%204.22.26%E2%80%AFPM.png" alt="Agentforce for Industries extension 1" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

7. Review and modify the instructions for the custom action and its inputs/outputs:
8. **Loading Text:** Checking Inventory
9. **Inputs:** Id instructions — This is the Sales Agreement Id
10. **Outputs:** Prompt Response Check, Show in conversation
11. **Output Rendering:** Richtext
12. Do nothing with the Citation area.
13. Click *Finish*.

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Agentforce%20for%20Industries%20extension/Screenshot%202025-06-23%20at%204.25.20%E2%80%AFPM.png" alt="Agentforce for Industries extension 2" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### Assign the New Action to the Sales Agreement Management Topic:

1. From the Agentforce Agents Setup page, launch your agent in Agentforce Builder.

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Agentforce%20for%20Industries%20extension/Screenshot%202025-06-20%20at%202.29.25%E2%80%AFPM.png" alt="Agentforce for Industries extension 3" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

2. If your agent is active, deactivate it to make changes.
3. From the left sidebar, select *Topics*.
4. On the Topics panel, click the name of the *Sales Agreement Management* topic.
5. Navigate to the *"This Topic's Actions"* tab and click *add from asset library*.

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Agentforce%20for%20Industries%20extension/Screenshot%202025-06-24%20at%2010.11.26%E2%80%AFPM.png" alt="Agentforce for Industries extension 4" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

6. Select your newly created custom action, **"Check Sales Agreement Product Inventory"**, and click *Finish*.

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Agentforce%20for%20Industries%20extension/Screenshot%202025-06-24%20at%2010.33.43%E2%80%AFPM.png" alt="Agentforce for Industries extension 5" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### Add Instructions:

1. Go to the *Topic Configuration* tab for the Sales Agreement Management topic.
2. In the Instructions field, add guidelines for when the agent should use your new action.
3. **Example:** Use the Check Sales Agreement Product Inventory action when a user asks about available sales agreement product inventory.

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Agentforce%20for%20Industries%20extension/Screenshot%202025-06-24%20at%2010.35.16%E2%80%AFPM.png" alt="Agentforce for Industries extension 6" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**Best practices for Topic Instructions:**
- Create boundaries: Narrow down the actions and data that apply to a use case to keep the agent focused.
- Set context: Help the agent respond appropriately based on the user's role and the conversation flow.
- Define behavior: Give granular control over how the agent uses actions within the topic.
- Start minimal, iterate: Begin with few instructions and test iteratively. Avoid contradictory instructions.
- Use plain language: Avoid jargon. Include examples or sample inputs/outputs.

**Example Instructions for Sales Agreement Management Topic:**
- "Always offer to check inventory status for products associated with a sales agreement when a user asks about product availability or stock levels."
- "If the user asks 'What is the stock status for product X in sales agreement Y?', use the 'Check Sales Agreement Product Inventory' action."
- "Never provide inventory information unless the user explicitly asks for product stock levels."
- "As a first step, when asked about product availability, identify the product name from the user's request and use it as input for the inventory check."

### Add Example Input:

1. **This will help provide a recommended action**
   - "Check product availability from inventory"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Agentforce%20for%20Industries%20extension/Screenshot%202025-06-26%20at%209.03.56%E2%80%AFPM.png" alt="Agentforce for Industries extension 7" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

Save your changes. Reactivate your agent once all changes are made.
## Step: Testing the New Configuration

It is crucial to test your agent in a sandbox environment to avoid impacting production data.

### 1. Test in Agentforce Builder:

- Open your agent in Agentforce Builder from the Agentforce Agents Setup page.
- Use the preview conversation panel to simulate user interactions.
- Click the eye icon in the top corner to set your test context variables:
  - **Page Type:** Record Page
  - **Object:** Sales Agreement
  - Search for the `QuantumMesh_SA_2025` Sales Agreement.
  - Select **Apply**.

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Testing%20the%20New%20Configuration/Screenshot%202025-06-20%20at%202.29.25%E2%80%AFPM.png" alt="Testing the New Configuration 1" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

- Now you are ready to test. Enter sample utterances you configured to trigger your new **"Check Sales Agreement Product Inventory"** action, such as:
  - *"What is the inventory status for the products?"*
  - *"Can you check the availability for products?"*

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Testing%20the%20New%20Configuration/Screenshot%202025-06-27%20at%208.30.28%E2%80%AFAM.png" alt="Testing the New Configuration 2" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

- Observe the agent's response and verify it correctly uses your new action and provides the expected inventory status.
- If the agent chooses the wrong topic or action, review your topic and action instructions for clarity and specificity.

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Testing%20the%20New%20Configuration/Screenshot%202025-06-27%20at%208.30.42%E2%80%AFAM.png" alt="Testing the New Configuration 3" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

- Ensure the agent is **Active** before testing from the Sales Agreement record in Lightning Experience.

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Testing%20the%20New%20Configuration/Screenshot%202025-06-27%20at%208.53.58%E2%80%AFAM.png" alt="Testing the New Configuration 4" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 2. Test with Sales Agreement Records:

- Since the Sales Agreement Management topic is designed to work with sales agreement data, test directly on a Sales Agreement record in Lightning Experience.
- Interact with the agent in the context of a Sales Agreement record (via the Agentforce panel) or by providing the sales agreement context in your query.
- Verify the agent can successfully retrieve and display inventory information related to the products within that specific Sales Agreement.

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Extend%20Agentforce%20Smarter%20Sales%20Agreements/Testing%20the%20New%20Configuration/Screenshot%202025-06-27%20at%208.54.48%E2%80%AFAM.png" alt="Testing the New Configuration 5" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**🎉 Congratulations on all your hard work!**

</details>

<details>
<summary><strong>⚡ Workshop: Supercharge Experiences: Connect Telemetry to CRM360</strong></summary>

### Workshop: Supercharge Experiences: Connect Telemetry to CRM360

<div><p><span style="font-size: 20px;">⚡ </span><strong style="font-size: 20px;">Get hands on with Connected Assets and Vehicles</strong></p><p><em>Picture this:</em> your connected assets stream telemetry data that automatically triggers intelligent actions in Salesforce — alerts are created, work orders are generated, and your service teams respond faster than ever. This comprehensive workshop teaches you to harness the power of Context Service to bring external data, CRM data, and AI together on a single platform.</p><hr></hr></div><div style="float: right; width: 300px;"><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/connected%20Assets%20workshop.png" alt="Supercharge Experiences Connect Telemetry to CRM360" style="max-width: 300px !important; width: 300px !important; height: auto !important;"></img></div><div><p><strong>In this hands-on session, you'll learn how to:</strong></p><p>• Clone and customize <strong>Context Service Definitions</strong> for connected assets</p><p>• Configure <strong>Actionable Event Management</strong> orchestrations</p><p>• Build <strong>Expression Sets</strong> and execution procedures</p><p>• Create automated responses to telemetry thresholds</p><p>• Test end-to-end workflows with real asset data</p><hr></hr><p><strong>Audience:</strong> Technical • Level: ⭐⭐⭐⭐☆ (4/5)</p>
  <hr></hr>
</div>

## Step: Review and Enable Setup Requirements

Before we start building our connected asset solutions, let's verify that all required services are properly configured and enabled in your Salesforce org.

### Step Detail: Verifying Context Service

First, we need to ensure that Context Service is enabled and configured correctly in your org.

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Review%20and%20Enable%20Setup%20Requirements/Screenshot%202025-07-02%20at%2012.13.39%20PM.png" alt="Verifying Context Service" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### Step Detail: Verifying Actionable Event orchestration is Enabled

Next, we need to confirm that Actionable Event orchestration is properly enabled and ready for use.

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Review%20and%20Enable%20Setup%20Requirements/Screenshot%202025-07-02%20at%2012.18.52%20PM.png" alt="Verifying Actionable Event orchestration is Enabled" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**Important:** These setup requirements must be completed before proceeding with the workshop. This ensures all participants have the necessary foundation to successfully complete the hands-on exercises.

## Step: Cloning an existing definition

Get off to a fast start by cloning an Out of the Box context definition.

**Steps:**

### 1. Navigate to Context Definitions
Type "Context service" in setup search and click on "Context Definitions"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image25.png" alt="Navigate to Context Definitions" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 2. Select VehicleFaultEventDetail
In the Standard Definitions tab, find VehicleFaultEventDetail and click the dropdown icon

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image36.png" alt="Select VehicleFaultEventDetail" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 3. Clone the Definition
Click on "Clone" to create a copy

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image50.png" alt="Clone Definition" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 4. Name and Save
Paste "Initials_Asset_Context_Def" into input field and click Save

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Cloning%20an%20existing%20definition/image39.png" alt="Name and Save Definition" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

## Step: Context Service Customization

Configure the new context definition for Assets. Edit the cloned Context Definition to align to connected asset event stream.

### 5. Access Custom Definitions
Click on Custom Definitions, then click the dropdown icon, and select Edit

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image24.png" alt="Access Custom Definitions" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 6. Begin Modifications
Click "Next" to start modifying attributes and adding new nodes

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image12.png" alt="Begin Modifications" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 7. Add Child Node
Click "Add Child Node" to create a new node under signals

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image33.png" alt="Add Child Node" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 8. Create Thresholds Node
In the new child node, type "thresholds" and click Next

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Service%20Customization/image49.png" alt="Create Thresholds Node" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

## Step: Context Definition Attributes

Attributes are fields on a node that can be mapped to sObjects or any input data source. Rename attributes from vehicle-focused to asset-focused.

### 9. Rename Attributes
In the Attribute section, find "vehicleName" and replace with "assetName". Repeat for "vehicleId" and replace with "assetId"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Attributes/image55.png" alt="Rename Attributes" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 10. Add Attributes to Thresholds
Click on thresholds node and click "Add Attributes"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Attributes/image20.png" alt="Add Attributes to Thresholds" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 11. Configure Threshold Attributes
Create "lower" and "upper" attributes with INPUT OUTPUT type and Number data type, then click Next

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Attributes/image44.png" alt="Configure Threshold Attributes" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

## Step: Context Definition Tagging

Tags are used to define the context structure and point to a node or attribute so the consuming application can query data directly from the context definition.

### 12. Add Asset Tags
Click on Events node and add tags for assetId and assetName

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Tagging/image38.png" alt="Add Asset Tags" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 13. Remove Vehicle Tags
Remove the old vehicleId and vehicleName tags by clicking the delete icons

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Tagging/image21.png" alt="Remove Vehicle Tags" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 14. Tag Thresholds Node
Add tags to the thresholds node and its lower and upper attributes, then click Save

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Tagging/image13.png" alt="Tag Thresholds Node" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

## Step: Context Definition Mapping

Context Mapping is the mapping of nodes and attributes to an input data source. Replace Vehicle mappings with Asset object mappings.

### 15-27. Complete Mapping Process
This comprehensive section includes multiple steps to:
- Navigate to Custom Definitions and select your context definition
- Map data sources and edit mappings
- Replace Vehicle object with Asset object
- Configure field mappings for assetId and assetName
- Generate input mappings for all nodes
- Activate the completed definition

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Mapping/image15.png" alt="Context Definition Mapping" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**Key Mapping Steps:**
- Update mappings from Vehicle to Asset
- Configure node and attribute mappings
- Generate all mappings for thresholds
- Activate the definition

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Context%20Definition%20Mapping/image43.png" alt="Activate Definition" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

## Step: Actionable Event Management

Define the actions to be performed for actionable events generated by assets by creating actionable event orchestrations.

### 28. Navigate to Actionable Event Management
Open App Launcher, type "Actionable", and click on Actionable Event Management

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Actionable%20Event%20Management/image61.png" alt="Navigate to Actionable Event Management" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 29. Create New Orchestration
Type "Initials_MYAEO" as the orchestration name

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Actionable%20Event%20Management/image48.png" alt="Create New Orchestration" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 30. Configure Event Types and Settings
Set up Event Type "WorkshopEvent", Subtype "WorkshopSubtype", Usage type as Automotive/Manufacturing, and ExpressionSet-Based execution

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Actionable%20Event%20Management/image30.png" alt="Configure Event Types" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

## Step: Execution Procedures and Expression Sets

Pull variables from the event stream and CRM to define rules and actions. Create list group filters with OR conditions for lower/upper thresholds.

### 31-49. Build Expression Logic
This extensive section covers:
- Creating list group filters with threshold conditions
- Setting up local resources (alertSubject, isActive, effDateTime, validUntilDateTime)
- Configuring Record Actions to create RecordAlert
- Setting execution rank and activating procedures
- Refreshing decision tables

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image62.png" alt="Expression Sets Configuration" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**Key Configuration Steps:**
- Create OR conditions for lower (< 1400) and upper (> 1800) thresholds
- Set up local resources as constants
- Configure RecordAlert creation with field mappings
- Activate procedures and refresh decision tables

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Execution%20Procedures%20and%20Expression%20Sets/image23.png" alt="Save and Activate" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

## Step: Testing with Developer Console

Time to test and see if all the hard work pays off. Navigate to Manufacturing Service Console to get an AssetId and test the complete workflow.

### 50. Access Manufacturing Service Console
Navigate to the Manufacturing Service Console from the App Launcher

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image52.png" alt="Access Service Console" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 51. Select Asset Record
Navigate to Asset entity and select any asset from the list

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image35.png" alt="Select Asset Record" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 52. Copy Asset ID
Copy the AssetId from the browser URL

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image8.png" alt="Copy Asset ID" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 53-56. Execute Test Payload
Use Developer Console to execute the test payload:

```apex
String jsonBody = '{"type": "WorkshopEvent","eventData": "{\"Event\":[{\"assetId\":\"INSERT_ID\",\"id\":\"INSERT_ID\",\"businessObjectType\":\"Asset\",\"signals\":[{\"thresholds\":{\"lower\":\"1500\",\"upper\":\"1880\"}}]}]}"}';
InboundEventService.sendEvent(jsonBody);
```

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image19.png" alt="Execute Test Payload" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### Verify Results
Check that alerts are created successfully on the Asset record

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Testing%20with%20Developer%20Console/image53.png" alt="Verify Results" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**🎉 Congratulations!** You have successfully completed the hands-on workshop on Salesforce Context Service in Automotive and Manufacturing Cloud! You've now acquired valuable skills in cloning, modifying, and testing context services for connected assets.

</details>

---

<details>
<summary><strong>⚡️ Workshop: Supercharge Experiences: Connect Telemetry to CRM360</strong></summary>

### Workshop: Supercharge Experiences: Connect Telemetry to CRM360

<div>
  <p><span style="font-size: 20px;">⚡️</span>
    <strong style="font-size: 20px;">Connect, Orchestrate &amp; Automate — See It All in Real-Time</strong>
  </p>
  <p><em>Imagine this:</em> your IoT devices stream real-time telemetry directly into your CRM — instantly triggering business rules, automating alerts, and orchestrating next steps without missing a beat. This interactive workshop shows you how to bring that vision to life using Salesforce's powerful Actionable Event Orchestration (AEO) framework.</p>
  <hr></hr>
</div>

<div style="float: right; width: 300px;">
  <img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/connected%20Assets%20workshop.png" alt="Supercharge Experiences Connect Telemetry to CRM360" style="max-width: 300px !important; width: 300px !important; height: auto !important;"></img>
</div>

<div>
  <p><strong>In this hands-on session, you'll get to:</strong></p>
  <p>• Extend out-of-the-box <strong>context templates</strong> to fit real device signals</p>
  <p>• Build and test smart <strong>business rules</strong> with the <strong>rules engine</strong> and decision tables</p>
  <p>• Generate <strong>real-time alerts</strong> and automate actions triggered by IoT events</p>
  <p>• Simulate live telemetry and watch your orchestration flow in action — instantly!</p>
  <hr></hr>
  <p><strong>Audience:</strong> Technical • Level: ⭐⭐⭐⭐☆ (4/5)</p><hr></hr>
</div>

</details>
