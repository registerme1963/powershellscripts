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

#create csv file with following columns. You can add remove as per your attributes requirement
#useraccountname, jobtitle, office, Department, manager, employeeid
#user01,Title01,office1,department1,manager1,12345

$users = Import-Csv "C:\Temp\users.csv"
foreach ($user in $users) {
    $props = @{
        identity   = $user.useraccountname
        title     = if($user.JobTitle ){$user.JobTitle }else{$null}
        Office     = if($user.Office   ){$user.Office   }else{$null}
        department = if($user.Department ){$user.Department }else{$null}
        manager   = if($user.manager   ){$user.manager   }else{$null}
        EmployeeID = if($user.employeeid ){$user.employeeid }else{$null}
    }
    set-aduser @props
}
