# Convert-AuditDataLog-from-Microsoft365
This script converts the JSON data information from the Microsoft 365 Purview Audit logs to a more readable CSV, which makes it easy to import into Excel for further investigation.

The Audit Log can be exported from the Microsoft 365 Purview Compliance Portal. It will be exported to a CSV file, where one of the columns with the detailed Audit Data is in JSON format.

Import the CSV file from the Compliance Portal into this script and it will Convert the AuditData JSON objects in an input CSV file to a flattened CSV format.
Make it read to import into Excel afterwards for further analysis and reporting.

Before running the script, please update these parameters in the script - to reflect your files:
# Define the input and output file paths
- $inputCsvPath = ".\download.csv"
- $outputCsvPath = ".\AuditData.csv"
