# Windows PowerShell-Skript für AD DS-Bereitstellung

# Importieren des AD DS-Bereitstellungsmoduls
Import-Module ADDSDeployment

# Abfrage von Anmeldeinformationen
$credential = Get-Credential

# Überprüfen der Anmeldeinformationen
if ($credential -eq $null) {
    Write-Host "Anmeldung fehlgeschlagen. Das Skript wird beendet."
    exit
}

# Abfrage des Safe Mode Administrator-Passworts
$safeModeAdministratorPassword = Read-Host "Geben Sie das Safe Mode Administrator-Passwort ein" -AsSecureString

# AD DS-Bereitstellung
Install-ADDSDomain `
    -Credential $credential `
    -SafeModeAdministratorPassword $safeModeAdministratorPassword `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode "WinThreshold" `
    -DomainType "ChildDomain" `
    -InstallDns `
    -LogPath "C:\Windows\NTDS" `
    -NewDomainName "Zug" `
    -NewDomainNetbiosName "ZUG" `
    -ParentDomainName "M159.local" `
    -SiteName "Zug" `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force

# Überprüfen, ob die Bereitstellung erfolgreich war
if ($?) {
    Write-Host "AD DS wurde erfolgreich bereitgestellt."
} else {
    Write-Host "Es ist ein Fehler bei der Bereitstellung von AD DS aufgetreten."
}
