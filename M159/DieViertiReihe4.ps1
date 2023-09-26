Import-Csv "C:\Temp\DieViertiReihe.csv" -Delimiter ';' |

ForEach-Object {
New-ADUser `
-Name $_.NameV `
-Surname $_.Firstname`
-GivenName $_.Name `
-Path $_."OU" `
-SamAccountName $_.samAccountName `
-UserPrincipalName ($_.samAccountName + '@' + $env:userdnsdomain) `
-AccountPassword (ConvertTo-SecureString "Init.12345" -AsPlainText -Force) `
-EmailAddress $_."E-Mail" `
-Description $_.Description `
-Enabled $true `
-ChangePasswordAtLogon $true
}