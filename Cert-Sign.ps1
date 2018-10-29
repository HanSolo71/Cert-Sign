#Get Cert From Cert Store, Requires Cert Already Be Imported
$cert = (dir Cert:\CurrentUser\TrustedPublisher -CodeSigningCert) 
#Asks user where scripts to sign are located
$ScriptToSign = (Get-ChildItem -Path (Read-Host -Prompt 'Get path') -Filter '*.ps1' | Select Fullname).Fullname
Set-AuthenticodeSignature $ScriptToSign -Certificate $Cert
