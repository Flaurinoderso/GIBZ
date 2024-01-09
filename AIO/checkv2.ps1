$jsonFilePath = "C:\Users\hamme\source\GIBZ\host_service.json"

# Get the content of the JSON file
$jsonContent = Get-Content -Path $jsonFilePath -Raw

# Convert the content from JSON to a PowerShell object
$jsonObject = $jsonContent | ConvertFrom-Json

# Access a property of the JSON object
$variableContent = $jsonObject.PropertyName

# Output the content of the variable
Write-Host $variableContent