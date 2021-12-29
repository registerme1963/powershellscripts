## You need to login with your global admin credentials to execute this feature
## This script creates users and assign o365 license to them in bulk
## The user list is imported from a csv file

##### install the following modules if not done earlier ########
#Install-Module -Name AzureAD
#Install-Module -Name MSOnline

$cred = Get-Credential

Import-Module AzureADPreview
Connect-AzureAD -Credential $cred
#Import-Module MSOnline
#Connect-MsolService -Credential $cred

#update user Manager (hod, dean, research supervisor, AR, DR etc) (it is the name
Get-ADUser -Identity "UserName" | Set-ADUser -Manager "HOD Physics"
