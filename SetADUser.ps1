Connect-AzureAD

$Password = "Password132"
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = $Password

New-AzureADUser -DisplayName "Imma Test" -GivenName "Imma" -Surname "Test" -UserPrincipalName "imma.test@foxnetsolutions.co.uk" -MailNickName "Imma" -PasswordProfile $PasswordProfile -AccountEnabled $true
