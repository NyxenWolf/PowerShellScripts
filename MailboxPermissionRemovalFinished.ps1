#Remove and log Mailbox Permissions

$acctName="First.Last@OrganisationName" # Admin account email.

$credential = Get-Credential -UserName $acctName -Message "Fill out the password. Newbie!"

Connect-AzureAD -Credential $credential # Connect to Azure AD.
Connect-MsolService # Connect to Microsoft Online.

Get-Mailbox -ResultSize Unlimited -RecipientTypeDetails usermailbox | Export-CSV D:\CSV\UserMailboxes.csv # Export CSV File of all user mailboxes.

 $users = Import-CSV D:\CSV\UserMailboxes.csv # Import User Mailboxes from CSV.

 ForEach ($user in $users) { # ForEach loop through each usermailbox to get permissions.


Get-MailboxPermission $user.UserPrincipalName | Export-CSV -Append -Path D:\CSV\UserMailboxPermissions.csv # Export CSV of user mailboxes before changes.

$userswithpermission = Import-Csv D:\CSV\UserMailboxPermissions.csv # Import CSV to re-loop through to remove all permissions from the mailboxes.

ForEach ($userwithpermission in $userswithpermission) {


Remove-MailboxPermission -Identity $user.userprincipalname -User $userswithpermission.userprincipalname # Remove mailbox permissions.
$auditlogdata = "I have removed $($userswithpermission.userprincipalname) 's permission from $($user.userprincipalname) 's mailbox!" # Create audit-log to out-put.

Add-Content -Value $auditlogdata -Path D:\CSV\RemoveMailboxAuditlog.log # Write the audit-log to file.
 

}
}
 



