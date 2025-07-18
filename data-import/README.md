# Workshop Data Import - Recall Ready: Building Product Service Campaigns

This directory contains CSV files for importing the **"Recall Ready: Building Product Service Campaigns"** workshop data into your Salesforce org. This workshop focuses on building targeted product service campaigns using actionable lists and data processing engines.

## Workshop Overview

**Recall Ready: Building Product Service Campaigns** is a comprehensive 90-minute technical workshop that teaches you how to:
- Configure and deploy data processing engines for asset analysis
- Create dynamic actionable lists with advanced filtering criteria  
- Build automated product service campaigns with targeted messaging
- Implement end-to-end recall management workflows
- Monitor campaign performance and adjust targeting strategies

## CSV Files Overview

### Import Summary

This data import creates:
- **1 Workshop**: Recall Ready: Building Product Service Campaigns (90 minutes, Technical Level 4)
- **8 Interest Tags**: Core industry features including Batch Management, Data Processing Engine, Actionable Segmentation, etc.
- **5 Workshop Steps**: Main sections covering configuration, implementation, and execution
- **60 Workshop Step Details**: Detailed instructions with 60 specific steps
- **8 Interest Tag Associations**: Linking the workshop to relevant industry features

## 📋 Import Order

**Important:** Import these files in the specified order to maintain proper data relationships:

### 1. Interest_Tag_Sync.csv
- **Object:** `Interest_Tag_Sync__c`
- **Purpose:** Creates interest tags for categorizing workshops by industry features
- **Dependencies:** None (import first)

### 2. Workshops.csv
- **Object:** `Workshop__c`
- **Purpose:** Creates the main workshop records
- **Dependencies:** None (can import after Interest Tags)

### 3. Workshop_Steps.csv
- **Object:** `Workshop_Step__c`
- **Purpose:** Creates the main steps for each workshop
- **Dependencies:** Workshop__c records must exist first

### 4. Workshop_Step_Details.csv
- **Object:** `Workshop_Step_Detail__c`
- **Purpose:** Creates detailed sub-steps for each workshop step
- **Dependencies:** Workshop_Step__c records must exist first

### 5. Workshop_Interest_Tags.csv
- **Object:** `Workshop_Interest_Tag__c`
- **Purpose:** Links workshops to their relevant interest tags (junction object)
- **Dependencies:** Both Workshop__c and Interest_Tag_Sync__c records must exist first

## 🛠️ Import Instructions

### Option 1: Data Import Wizard (Recommended for smaller datasets)
1. Go to Setup → Data Import Wizard
2. Choose "Launch Wizard"
3. Select "Custom Objects" 
4. Choose the target object for each CSV file
5. Upload the CSV file and map the fields
6. Review and start the import

### Option 2: Data Loader (Recommended for larger datasets)
1. Download and install Salesforce Data Loader
2. Log in to your org through Data Loader
3. Choose "Insert" operation
4. Select the target object for each CSV file
5. Upload the CSV file and map the fields
6. Review mapping and execute the import

### Option 3: External Data Import Tools
- **Workbench:** https://workbench.developerforce.com/
- **SalesforceXyTools:** Browser extension for data manipulation
- **Third-party tools:** Various ETL tools that support Salesforce

## 📄 Field Mappings

### Workshop__c Fields
- `Name` → Workshop Name (auto-generated)
- `Description__c` → Rich HTML description 
- `Audience__c` → Picklist (Technical, Business, General)
- `Technical_Rating__c` → Picklist (1-5)
- `Duration__c` → Text field
- `Industry_Features__c` → Multi-select picklist (semicolon-separated)
- `workshop_image__c` → URL field

### Workshop_Step__c Fields
- `Name` → Step Name
- `Workshop__c` → Lookup to Workshop (use Workshop Name for matching)
- `Step_Order__c` → Number field
- `Step_Group__c` → Text categorization field
- `Instructions__c` → Rich HTML instructions
- `Image_URL__c` → URL field
- `isCompleted__c` → Checkbox (defaults to false)

### Workshop_Step_Detail__c Fields
- `Detail_Title__c` → Text field
- `Detail_Instructions__c` → Rich HTML field
- `Detail_Order__c` → Number field
- `Workshop_Step__c` → Lookup to Workshop Step (use Step Name for matching)

### Interest_Tag_Sync__c Fields
- `Name` → Interest Tag Name
- `Tag_Description__c` → Text description
- `Interest_Tag_Id__c` → Unique identifier
- `Is_Synced_to_Picklist__c` → Checkbox

### Workshop_Interest_Tag__c Fields (Junction Object)
- `Workshop__c` → Lookup to Workshop (use Workshop Name for matching)
- `Interest_Tag_Sync__c` → Lookup to Interest Tag (use Name for matching)

## 🔧 Pre-Import Checklist

### Required Custom Objects
Ensure these custom objects exist in your org:
- [ ] `Workshop__c`
- [ ] `Workshop_Step__c` 
- [ ] `Workshop_Step_Detail__c`
- [ ] `Interest_Tag_Sync__c`
- [ ] `Workshop_Interest_Tag__c`

### Required Fields
Verify all custom fields exist on the objects. If any are missing, create them according to the field metadata in the `force-app/main/default/objects/` directory.

### Required Picklist Values
Ensure these picklist values exist:

**Audience__c on Workshop__c:**
- Technical
- Business  
- General

**Technical_Rating__c on Workshop__c:**
- 1
- 2
- 3
- 4
- 5

**Industry_Features__c on Workshop__c:**
All values from the Interest_Tag_Sync CSV should be available as picklist options.

## 🌐 Image URL References

All image URLs in the CSV files reference the GitHub repository:
```
https://raw.githubusercontent.com/not2technical/MFG-Auto-Cloud-Workshops/refs/heads/main/images/Workshop/...
```

These URLs are properly formatted and ready to use. The images are organized by workshop and step for easy maintenance.

## 🧪 Post-Import Verification

After importing all files, verify:

1. **Workshop Records:** Check that all 3 workshops are created
2. **Workshop Steps:** Verify steps are properly ordered and linked to workshops
3. **Step Details:** Confirm all detailed instructions are properly formatted
4. **Interest Tags:** Ensure all industry feature tags are created
5. **Junction Records:** Verify workshops are properly linked to their interest tags
6. **Images:** Test that image URLs load correctly in the Lightning Experience

## 🔍 Troubleshooting

### Common Import Issues

**Lookup Field Matching:**
- Use exact names for lookup field matching
- Ensure parent records exist before importing child records
- Check for special characters or extra spaces in names

**HTML Content:**
- Rich text fields should preserve HTML formatting
- Test that images and styling display correctly
- Verify that quotes are properly escaped

**Field Length Issues:**
- Check field length limits if you encounter truncation
- Long text fields should accommodate full content
- URL fields have specific length restrictions

**Picklist Value Errors:**
- Ensure all picklist values exist before import
- Check for case sensitivity in picklist values
- Verify multi-select picklist separator (semicolon)

### Support Resources

- **Salesforce Documentation:** [Data Import Wizard Guide](https://help.salesforce.com/s/articleView?id=sf.data_import_wizard.htm)
- **Data Loader Documentation:** [Data Loader Guide](https://help.salesforce.com/s/articleView?id=sf.data_loader.htm)
- **Trailhead Module:** [Data Management](https://trailhead.salesforce.com/content/learn/modules/lex_implementation_data_management)

## 📝 Notes

- All CSV files use comma separation with quoted text fields
- HTML content is properly escaped for CSV format
- Image URLs are tested and verified as accessible
- Workshop content matches the documentation in the main README.md file
- Field mappings align with the custom object metadata in the project 