# Dynamic Hands-On Workshop Application & Framework

This project is a dynamic, user-friendly application and framework for delivering hands-on workshops in Salesforce. It is designed to make technical and business workshops simple, engaging, and easy to follow for all users.

## 📋 Table of Contents

- [🎯 Purpose](#-purpose)
- [🚀 Features](#-features)  
- [👥 Who is this for?](#-who-is-this-for)
- [📚 Workshops](#-workshops)
  - [✨ Extend Agentforce Smarter Sales Agreements](#workshop-extend-agentforce-smarter-sales-agreements)
  - [⚡️ Supercharge Experiences: Connect Telemetry to CRM360](#workshop-supercharge-experiences-connect-telemetry-to-crm360)
  - [🔄 Recall Ready: Building Product Service Campaigns](#workshop-recall-ready-building-product-service-campaigns)

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

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Review%20and%20Enable%20Setup%20Requirements/Screenshot%202025-07-02%20at%2012.13.39%E2%80%AFPM.png" alt="Verifying Context Service" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### Step Detail: Verifying Actionable Event orchestration is Enabled

Next, we need to confirm that Actionable Event orchestration is properly enabled and ready for use.

<img src="https://github.com/not2technical/MFG-Auto-Cloud-Workshops/blob/main/images/Workshop/Supercharge%20Experiences%20Connect%20Telemetry%20to%20CRM360/Review%20and%20Enable%20Setup%20Requirements/Screenshot%202025-07-02%20at%2012.18.52%E2%80%AFPM.png?raw=true" alt="Verifying Actionable Event orchestration is Enabled" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

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

<details>
<summary><strong>🔄 Workshop: Recall Ready: Building Product Service Campaigns</strong></summary>

### Workshop: Recall Ready: Building Product Service Campaigns

<div><p><span style="font-size: 20px;">🛡️ </span><strong style="font-size: 20px;">Protect Your Customers, Protect Your Brand</strong></p><p><em>Picture this:</em> A potential product defect is identified, and within hours your team has automatically segmented impacted assets, launched targeted recall campaigns, and coordinated with field service — all while maintaining customer trust and ensuring safety. This workshop shows you how to transform reactive recalls into proactive, systematic service excellence.</p><hr></hr></div><div style="float: right; width: 300px;"><img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/image73.png" alt="Recall Ready Building Product Service Campaigns" style="max-width: 300px !important; width: 300px !important; height: auto !important;"></img></div><div><p><strong style="font-family: verdana; font-size: 14px;">🚀 Manage Mass Asset Recalls, Services, and Upgrades Efficiently</strong></p><p><span style="font-family: verdana; font-size: 12px;">Design effective, timely product service campaigns to assess and address issues on large numbers of products or services. Specify the impacted product, and the priority, duration, status, and type of a campaign. Track each asset that is the focus of a product service campaign. Create work orders and return orders to capture the services to be performed on impacted products.</span></p><p><br></p><p><strong style="font-family: verdana; font-size: 14px;">🎯 Identify and Segment Assets in Product Service Campaigns Easily</strong></p><p><span style="font-family: verdana; font-size: 12px;">Swiftly curate lists of assets that you want to recall, audit, fix, or upgrade by creating actionable lists for product service campaigns. Specify sophisticated filter conditions or use Data Cloud segments to group assets that you want to include in actionable lists. With a single click, add items from actionable lists to product service campaigns.</span></p><hr></hr><p><br></p><p><strong style="font-family: verdana; font-size: 12px;">In this hands-on session, you'll learn how to:</strong></p><p><span style="font-family: verdana; font-size: 12px;">• Configure </span><strong style="font-family: verdana; font-size: 12px;">Data Processing Engines</strong><span style="font-family: verdana; font-size: 12px;"> for comprehensive asset recall analysis</span></p><p><span style="font-family: verdana; font-size: 12px;">• Create sophisticated </span><strong style="font-family: verdana; font-size: 12px;">Actionable Lists</strong><span style="font-family: verdana; font-size: 12px;"> with advanced filtering for defective assets</span></p><p><span style="font-family: verdana; font-size: 12px;">• Build automated </span><strong style="font-family: verdana; font-size: 12px;">Service Campaigns</strong><span style="font-family: verdana; font-size: 12px;"> prioritizing customer safety</span></p><p><span style="font-family: verdana; font-size: 12px;">• Generate </span><strong style="font-family: verdana; font-size: 12px;">Work Orders</strong><span style="font-family: verdana; font-size: 12px;"> and </span><strong style="font-family: verdana; font-size: 12px;">Return Orders</strong><span style="font-family: verdana; font-size: 12px;"> for systematic service activities</span></p><p><span style="font-family: verdana; font-size: 12px;">• Orchestrate </span><strong style="font-family: verdana; font-size: 12px;">Customer Communications</strong><span style="font-family: verdana; font-size: 12px;"> at scale during critical recalls</span></p><hr></hr><p><br></p><p><strong>Audience:</strong> Technical • Level: ⭐⭐⭐⭐☆ (4/5)</p><p><strong>Duration:</strong> 90 minutes</p><p><strong>Industry Features:</strong> Batch Management, Complaints Management, Timeline, Record Alerts, Audit Trail, Actionable Segmentation, Action Plans, Data Processing Engine</p>
  <hr></hr>
</div>

## Step: Actionable List Configuration Guide

Guided steps to create Actionable lists powered by data processing engine to create Asset or Vehicle data sets.

### 1. Access Setup
Click the Gear and click on Setup to access setup from any page in your org

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Actionable%20List%20Configuration%20Guide/Step_01_1_1_Click_the_Gear_2_Click_on_Setup.png" alt="Access Setup" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 2. Navigate to Actionable Segmentation
In setup quick search, type "Actionable" and click Actionable Segmentation Settings

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Actionable%20List%20Configuration%20Guide/Step_02_2_1_In_setup_quick_search_Type_Actionable_2_C.png" alt="Navigate to Actionable Segmentation" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 3. Create Data Processing Engine Definition
Click on "New Data Processing Engine Definition"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Actionable%20List%20Configuration%20Guide/Step_03_3_1_Click_on_New_Data_Processing_Engine_Definitio.png" alt="Create Data Processing Engine Definition" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**Data processing engine is an industry provided platform data transformation and aggregation component.**

### 4. Configure Engine Definition
Type "WorkshopAssetServiceEOLUpgradeCampaign", pick Asset from the object list, and click Save & Next

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Actionable%20List%20Configuration%20Guide/Step_04_instruction.png" alt="Configure Engine Definition" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 5. Launch Data Processing Engine
Click on "Launch Data Processing Engine"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Actionable%20List%20Configuration%20Guide/Step_05_5_Click_on_Launch_Data_Processing_Engine.png" alt="Launch Data Processing Engine" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

## Step: Data Processing Engine Configuration

Configure the new context definition for Assets. This comprehensive section includes multiple steps to configure data sources, joins, and field mappings.

### 6. Configure Asset Data Source
Click the Asset_DS Data Source and click Configure

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_01_screenshot.png" alt="Configure Asset Data Source" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 7. Select Asset Fields
Click on Selected Fields (2) button to choose fields for asset data processing

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_02_7_1_Click_on_Selected_Fields_2_button.png" alt="Select Asset Fields" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**Here we will choose all the fields for asset that we may want to use for the campaign and other nodes like a join**

### 8. Configure Asset Field Selection
Select the fields from Asset as shown, update the alias names where shown, and click Save

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_03_8_1_Select_the_fields_from_Asset_as_shown_2_Upd.png" alt="Configure Asset Field Selection" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 9. Save Asset Node Configuration
Click Save for the Asset node

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_05_9_1_Click_on_Save_for_the_Asset_node.png" alt="Save Asset Node Configuration" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 10. Create New Node
Click on "New Node" to add additional data sources

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_06_10_Click_on_New_Node.png" alt="Create New Node" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 11. Configure Asset Warranty Data Source
Choose Data Source for Node Type, type "AssetWarranty_DS" in Name field, click API Name field to auto populate, and click Save

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_07_instruction.png" alt="Configure Asset Warranty Data Source" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 12. Select Asset Warranty Entity
Type "Asset Wa" and select Asset Warranty Entity from source object field

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_08_instruction.png" alt="Select Asset Warranty Entity" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 13. Configure Asset Warranty Fields
Click on Select Fields of Asset warranty

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_09_13_Click_on_Select_Fields_of_Asset_warranty.png" alt="Configure Asset Warranty Fields" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**Here we will choose all the fields we may want to use from Asset Warranty entity in the data set.**

### 14. Save Asset Warranty Field Configuration
Select the fields from asset warranty object as shown, update alias names, and click Save

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_14_instruction.png" alt="Save Asset Warranty Field Configuration" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 15. Add Related Object
Click on "Add Related Object" from the Asset Warranty Configuration page

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_11_15_1_Click_on_Add_Related_Object_from_the_Asset.png" alt="Add Related Object" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 16. Configure Related Object
Click on "Related Object"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_12_16_1_Click_on_Related_Object.png" alt="Configure Related Object" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 17. Add Asset Related Object
Click "Add Related Object" button, choose Asset from related object field, and click Select fields button

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_17_instruction.png" alt="Add Asset Related Object" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**Here we chose related fields from asset within Asset Warranty**

### 18. Configure Related Object Fields
Select the field from asset related object as shown, update alias names, and click Save

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_18_instruction.png" alt="Configure Related Object Fields" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 19. Save Asset Warranty Node
Click Save again to save the Asset Warranty Node

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_15_19_Click_on_Save_again_to_save_the_Asset_Warranty.png" alt="Save Asset Warranty Node" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 20. Create Join Node
Click on "New Node" - In the next few steps we will join the two data source nodes together

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_16_20_1_Click_on_New_Node.png" alt="Create Join Node" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 21. Configure Join Node
Choose Join for Node Type, type "Join Asset to Asset Warranty" in Name field, click API Name field to auto populate, and click Save

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_10_instruction.png" alt="Configure Join Node" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 22. Set Join Sources
In the first node choose Asset_DS, in the second node choose Asset Warranty_DS

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_26_instruction.png" alt="Set Join Sources" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**Here we actual perform the join for the two selected objects**

### 23. Configure Asset_DS Fields
Click on "Select Fields" button next to the source node Asset_DS

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_21_25_1_Click_on_Select_Fields_button_next_to_the_As.png" alt="Configure Asset_DS Fields" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 24. Select All Asset_DS Fields
Check "Select All" checkbox and click Save

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_20_24_1_Check_Select_All_checkbox_2_Click_Save.png" alt="Select All Asset_DS Fields" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 25. Configure Asset Warranty_DS Fields
Click on "Select Fields" button next to the Asset Warranty_DS source node

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_19_23_1_Click_on_Select_Fields_button_next_to_the_s.png" alt="Configure Asset Warranty_DS Fields" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 26. Select All Asset Warranty Fields
Check "Select All" checkbox and click Save

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_22_26_1_Check_Select_All_checkbox_2_Click_Save.png" alt="Select All Asset Warranty Fields" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 27. Configure Join Fields
Click on "First Node Field"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_23_27_Click_on_First_Node_Field.png" alt="Configure Join Fields" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 28. Map Join Fields
In the mapped fields section select Asset_DS_id from First Node Field, select AssetId_AW_DS from the Second Node Field, and click Save

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_28_instruction.png" alt="Map Join Fields" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 29. Create Writeback Node
Click on "New Node"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_25_29_1_Click_on_New_Node.png" alt="Create Writeback Node" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 30. Configure Writeback Object
In Node Type select "Writeback Object", in Name type "Asset Warranty EOL Campaign WriteBack", click API Name to auto populate, and click Save

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_30_instruction.png" alt="Configure Writeback Object" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 31. Configure Writeback Settings
In the source node choose "Join Asset to Asset Warranty" join node, select Analytics radio button for Target Type, and type "WorkshopAssetServiceEOLUpgradeCampaign" into Dataset Name field

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_27_instruction.png" alt="Configure Writeback Settings" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 32. Configure Field Mappings
In the Field Mapping section select all the fields adding rows as needed

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_24_instruction.png" alt="Configure Field Mappings" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**🛑 In this sections simply click each field in the drop down and click the add button until all fields are used**

### 33. Complete Field Mappings
At the bottom for Field Mappings choose Folder Name "ActionableSegmentation" and click Save

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_29_33_1_At_the_bottom_for_Field_Mappings_choose_Fol.png" alt="Complete Field Mappings" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 34. Save and Activate Definition
Click "Save" on the top right to save the Data processing engine definition, then click "Activate"

### 35. Run Definition
Click on "Run Definition"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_31_35_1_Click_on_Run_Definition.png" alt="Run Definition" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 36. Complete Wizard
Click Next through the wizard accepting defaults

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Data%20Processing%20Engine%20Configuration/Step_32_36_1_Click_Next_through_the_wizard_accepting_def.png" alt="Complete Wizard" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**This completes the data processing engine portion to build out the dataset**

## Step: Advanced Data Processing Configuration

Navigate back to the Actionable Segmentation Settings and configure the actionable list columns and statuses.

### 37. Return to Actionable Segmentation
Click Setup gear, in setup quick search type "Actionable", and click Actionable Segmentation Settings

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Advanced%20Data%20Processing%20Configuration/Step_02_38_1_Click_on_Refresh_Dataset_Status.png" alt="Navigate Back to Actionable Segmentation" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 38. Refresh Dataset Status
Click on "Refresh Dataset Status"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Advanced%20Data%20Processing%20Configuration/Step_02_38_1_Click_on_Refresh_Dataset_Status.png" alt="Refresh Dataset Status" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 39. Add Columns
In the workshop actionable list, click on "+ Add Columns"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Advanced%20Data%20Processing%20Configuration/Step_03_39_1_In_the_workshop_actionable_list_Click_on.png" alt="Add Columns" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 40. Configure Columns
Click the available field names and move them all to the selected field name box, then click Save

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Advanced%20Data%20Processing%20Configuration/Step_04_instruction.png" alt="Configure Columns" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 41. Add Statuses
Click on "+ Add Statuses"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Advanced%20Data%20Processing%20Configuration/Step_05_41_1_Click_on_Add_Statuses.png" alt="Add Statuses" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 42. Configure Status Items
Click "New Status" button and add the shown status items, then click save

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Advanced%20Data%20Processing%20Configuration/Step_06_42_1_Click_New_Status_button_and_add_the_shown_s.png" alt="Configure Status Items" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**After complete the actionable list, these are the status actions that will be available**

### 43. Activate List
Toggle on to activate

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Advanced%20Data%20Processing%20Configuration/Step_07_instruction.png" alt="Activate List" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 44. Confirm Activation
Click "OK"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Advanced%20Data%20Processing%20Configuration/Step_08_44_1_Click_on_OK.png" alt="Confirm Activation" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 45. Access Actionable Lists
Click the App Launcher icon, search for "Actionable List", and click Actionable List

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Advanced%20Data%20Processing%20Configuration/Step_09_45_1_Click_the_App_Launcher_icon_2_In_search_Ty.png" alt="Access Actionable Lists" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

## Step: Actionable List Creation

Now we'll create the actual actionable list using our configured data processing engine.

### 46. Create New Actionable List
Click "New" to create a new actionable list

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Actionable%20List%20Creation/Step_01_screenshot.png" alt="Create New Actionable List" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 47. Configure List Details
Type "Workshop Upgrade Campaign" in the New Actionable List Name, select the Data processing Engine definition created earlier "WorkshopAssetServiceEOLUpgradeCampaign", and click Next

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Actionable%20List%20Creation/Step_02_instruction.png" alt="Configure List Details" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 48. Apply Filter Criteria
Click the Filter Criteria, choose InstallDate, choose Previous Fiscal Year, and click Apply

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Actionable%20List%20Creation/Step_03_48_1_Click_the_Filter_Criteria_2_Choose_InstallDa.png" alt="Apply Filter Criteria" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 49. Select All Assets
Check "Select All" to select all the filtered assets

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Actionable%20List%20Creation/Step_04_instruction.png" alt="Select All Assets" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 50. Review and Save
Click on "Review & Save (55)"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Actionable%20List%20Creation/Step_05_50_1_Click_on_Review_Save_55.png" alt="Review and Save" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 51. Confirm and Save
Click on "Confirm & Save"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Actionable%20List%20Creation/Step_06_51_1_Click_on_Confirm_Save.png" alt="Confirm and Save" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

## Step: Product Service Campaign Configuration

Now we create a new product service campaign and connect the actionable list to foster integration between data sets and campaigns.

### 52. Create Product Service Campaign
From App Launcher search for "Product Service Campaigns" and click New

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Product%20Service%20Campaign%20Configuration/Step_01_52_1_From_App_Launcher_search_for_Product_Servic.png" alt="Create Product Service Campaign" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 53. Configure Campaign Details
Type "Workshop Upgrade Campaign" for Campaign Name, select "Upgrade" from type picklist, select work type "replace compressor", choose "Today" for Start date, choose "WorkShop Upgrade Campaign" for actionable list, and click Save

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Product%20Service%20Campaign%20Configuration/Step_02_instruction.png" alt="Configure Campaign Details" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**In this section we are connecting the campaign to the actionable list to foster integration between data sets and campaigns.**

### 54. Navigate to Actionable List
Click the actionable list link to take you back to the Workshop Upgrade Campaign actionable list

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Product%20Service%20Campaign%20Configuration/Step_03_instruction.png" alt="Navigate to Actionable List" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 55. Add to Service Campaign
Click the action dropdown and click "Add to Service Campaign"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Product%20Service%20Campaign%20Configuration/Step_04_55_1_Click_the_action_carrot_2_Click_on_Add_to.png" alt="Add to Service Campaign" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**Performing this function will automatically add all the assets to the campaign.**

### 56. Confirm Addition
Click "Confirm"

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Product%20Service%20Campaign%20Configuration/Step_05_56_Click_on_Confirm.png" alt="Confirm Addition" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 57. Success Confirmation
Success - Assets are added

**Note you may get an error here on redirect to the previous product campaign but the items are added as this org is not Generally available. This is related to the demo env itself.**

### 58. Verify Assets Added
Navigate back to the Product Service Campaign from App Launcher, click "Related", and verify the Assets are added

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Product%20Service%20Campaign%20Configuration/Step_06_instruction.png" alt="Verify Assets Added" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

### 59. Create Work Orders
Click the action dropdown and select "create work order for all items", then click confirm button

<img src="https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/Recall%20Ready%20Building%20Product%20Service%20Campaigns/Product%20Service%20Campaign%20Configuration/Step_08_59_1_Click_the_action_carrot_and_Select_create.png" alt="Create Work Orders" style="max-width: 300px !important; width: 300px !important; height: auto !important;" />

**The Final Step is to create work order in mass to support the cross-sell upsell efforts and get techs onsite. The great news is this is done is mass again for all assets added to the campaign**

### 60. Verify Work Orders
Verify created work orders

**Congrats on completing this exercise**

**🎉 Congratulations!** You have successfully completed the hands-on workshop on Product Service Campaigns in Automotive and Manufacturing Cloud! You've acquired valuable skills in building data sets with Data processing engine, Building Actionable Lists, and connecting Product Service Campaigns - crucial for tackling recalls and upgrades in the automotive and manufacturing industry.

Keep experimenting with what you've learned today, and don't hesitate to leverage the additional resources provided for further exploration and mastery.

</details>
