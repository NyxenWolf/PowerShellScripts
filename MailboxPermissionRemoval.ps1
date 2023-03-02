#Remove and log Mailbox Permissions
$orgName="OrganisationName"
$acctName="First.Last@OrganisationName"
$credential = Get-Credential -UserName $acctName -Message "Fill out the password. Newbie!"
Connect-AzureAD -Credential $credential
Connect-MsolService
Get-Mailbox -ResultSize Unlimited -RecipientTypeDetails usermailbox | Export-CSV D:\CSV\UserMailboxes.csv
 
 $users = Import-CSV D:\CSV\UserMailboxes.csv 
 ForEach ($user in $users) { 

 Get-MailboxPermission $user.UserPrincipalName | Export-CSV -Append -Path D:\CSV\UserMailboxPermissions.csv


 }
Remove-MailboxPermission -Identity "Insert Identity" -User "$users" -AccessRights FullAccess -InheritanceType All | Export-Csv D:\CSV\RemoveMailboxAuditLog.csv

