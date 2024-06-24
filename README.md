# Convert-AuditDataLog-from-Microsoft365
This script converts the JSON data information from the Microsoft 365 Purview Audit logs to a more readable CSV, which makes it easy to import into Excel for further investigation.

The Audit Log can be exported from the Microsoft 365 Purview Compliance Portal. It will be exported to a CSV file, where one of the columns with the detailed Audit Data is in JSON format.

Import the CSV file from the Compliance Portal into this script and it will Convert the AuditData JSON objects in an input CSV file to a flattened CSV format.
Make it read to import into Excel afterwards for further analysis and reporting.


# Define the input and output file paths
Before running the script, please update these parameters in the script - to reflect your files:
- $inputCsvPath = ".\download.csv"
- $outputCsvPath = ".\AuditData.csv"

# How to do a Audit Log Search
Use the following information from Microsoft to start an Audit Search from Purview:
- [Search the audit log](https://learn.microsoft.com/en-us/purview/audit-search?tabs=microsoft-purview-portal?WT.mc_id=M365-MVP-4020462)
