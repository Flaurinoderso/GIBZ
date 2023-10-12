Import-Module ActiveDirectory

$csvPath = "C:\Temp\Aufgabe_PSScript.csv"
$csvContent = Get-Content -Path $csvPath -Encoding default
$csvData = $csvContent | ConvertFrom-Csv 

foreach ($user in $csvData) {
 $password = ConvertTo-SecureString -Int "Init1234" -AsPlainText -Force
 
 $userParams = @{
        'SamAccountName'         = $user.SamAccountName
        'Name'                   = $user.Name
        'Surname'                = $user.Surname
        'GivenName'              = $user.GivenName
        'AccountPassword'        = $password
        'Enabled'                = $true  
}
 try {
      New-ADUser @userParams
      Write-Host "Benutzer $($user.SamAccountName) wurde erfolgreich erstellt."
   } catch {
      Write-Host "Fehler beim Erstellen des Benutzers $($user.SamAccountName): $_"
   }
} 
