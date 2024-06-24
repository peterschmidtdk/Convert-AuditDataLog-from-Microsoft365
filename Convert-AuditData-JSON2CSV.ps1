# Define the input and output file paths
$inputCsvPath = ".\download.csv"
$outputCsvPath = ".\AuditData.csv"

# Read the input CSV file
$inputData = Import-Csv $inputCsvPath

# Initialize an array to hold the output data
$outputData = @()

# Function to recursively flatten the JSON data
function Flatten-JsonData {
    param (
        [string]$prefix,
        [PSCustomObject]$obj,
        [hashtable]$result
    )

    foreach ($property in $obj.PSObject.Properties) {
        $name = if ($prefix) { "$prefix.$($property.Name)" } else { $property.Name }
        if ($property.Value -is [PSCustomObject]) {
            Flatten-JsonData -prefix $name -obj $property.Value -result $result
        } elseif ($property.Value -is [Array]) {
            for ($i = 0; $i -lt $property.Value.Count; $i++) {
                Flatten-JsonData -prefix "$name[$i]" -obj $property.Value[$i] -result $result
            }
        } else {
            $result[$name] = $property.Value
        }
    }
}

# Process each row in the input CSV data
foreach ($row in $inputData) {
    # Parse the JSON data from the "AuditData" column
    $jsonObject = $row.AuditData | ConvertFrom-Json

    # Create a hashtable to store the flattened data
    $flattenedData = @{}
    
    # Flatten the JSON object
    Flatten-JsonData -prefix "" -obj $jsonObject -result $flattenedData

    # Add the flattened data to the output array
    $outputData += [PSCustomObject]$flattenedData
}

# Export the output data to a new CSV file
$outputData | Export-Csv -Path $outputCsvPath -NoTypeInformation
