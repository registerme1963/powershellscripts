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

# Add bulk user from csv file along with license (for students STANDARDWOFFPACK_STUDENT, for faculty: STANDARDWOFFPACK_FACULTY)
# you can add other licenses in a similar way
# use appropriate suffix in the mail id

#csv must have the following columns
#DisplayName, FirstName, LastName, Department, UserPrincipalName, Password, UsageLocation, SKU
Import-Csv -Path “D:\userlist.csv” | ForEach {New-MsolUser -DisplayName $_.DisplayName -FirstName $_.FirstName -LastName $_.LastName -Department $_.Department -UserPrincipalName $_.UserPrincipalName -Password $_.Password -UsageLocation $_.UsageLocation -LicenseAssignment $_.SKU} | Export-Csv -Path “C:\result.csv”
