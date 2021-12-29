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


#get user license details
Get-AzureADUserLicenseDetail -ObjectId "mail.che@pondiuni.edu.in"

#get users with filter {HODs)
Get-AzureADUser -SearchString "head"

#get details of single user
Get-AzureADUser -ObjectId "testUpn@tenant.com"

#more info at https://docs.microsoft.com/en-us/powershell/module/azuread/?view=azureadps-2.0#users
