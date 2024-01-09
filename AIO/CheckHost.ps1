$jsonFile = Get-Content -Raw .\host_service.json | ConvertFrom-Json
Write-Host $jsonFile.services



