#First, Connect to Azure/365
Connect-AzureAD

#Set a Password
$Password = "plaintextpassword"
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = $Password

#Fill out to Add User
New-AzureADUser -DisplayName "Full Name" -GivenName "First Name" -Surname "Lastname" -UserPrincipalName "First.Last@foxnetsolutions.co.uk" -MailNickName "FirstName" -PasswordProfile $PasswordProfile -AccountEnabled $true