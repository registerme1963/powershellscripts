## You need to login with your global admin credentials to execute this feature
## This script creates users and assign o365 license to them in bulk
## The user list is imported from a csv file

##### install the following modules if not done earlier ########
#Install-Module -Name AzureAD
#Install-Module -Name MSOnline

$cred = Get-Credential

Import-Module AzureADPreview
Import-Module MSOnline
Connect-MsolService -Credential $cred
Connect-AzureAD -Credential $cred

# Add one user with license assignment (for students STANDARDWOFFPACK_STUDENT, for faculty: STANDARDWOFFPACK_FACULTY)
# you can add other licenses in a similar way
# use appropriate suffix

#MA/MSC/students (see 's' suffix)
New-MsolUser -DisplayName "Student Full Name" -FirstName "StudentFirstName" -LastName "StudentLastName" -UserPrincipalName "mail.sche@pondiuni.edu.in" -Password "PUMail@123" -UsageLocation "IN" -LicenseAssignment "pondiunieduin:STANDARDWOFFPACK_STUDENT"

#research students (see 'r' suffix)
New-MsolUser -DisplayName "Student Full Name" -FirstName "StudentFirstName" -LastName "StudentLastName" -UserPrincipalName "mail.rche@pondiuni.edu.in" -Password "PUMail@123" -UsageLocation "IN" -LicenseAssignment "pondiunieduin:STANDARDWOFFPACK_STUDENT"

#for non teaching staff (common 'stf' suffix)
New-MsolUser -DisplayName "Student Full Name" -FirstName "StudentFirstName" -LastName "StudentLastName" -UserPrincipalName "mail.stf@pondiuni.edu.in" -Password "PUMail@123" -UsageLocation "IN" -LicenseAssignment "pondiunieduin:STANDARDWOFFPACK_STUDENT"

#check the user
Get-AzureADUser -ObjectId "testUpn@tenant.com"
