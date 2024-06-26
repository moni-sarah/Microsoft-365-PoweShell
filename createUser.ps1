
# Create users
Get-Help New-MgUser -Online

$PasswordProfile = @{
    Password = 'DemoPassword1234567!'
}

$Params = @{
    UserPrincipalName = "Hedda.Hansen@edudev365.onmicrosoft.com"
    DisplayName       = "Hedda Hansen"
    GivenName         = "Hedda"
    Surname           = "Hansen"
    MailNickname      = "hedda.hansen"
    AccountEnabled    = $true
    PasswordProfile   = $PasswordProfile
    Department        = "Support"
    CompanyName       = "Demo Company"
    Country           = "Norway"
    City              = "Trondheim"
    JobTitle          = "Support Specialist"
}

New-MgUser @Params



$users = Import-CSV -Path  '/Users/sarah_monica/Desktop/TISIP-2024/Microsoft-365-PoweShell/Microsoft-365-PoweShell/03-02-Users.csv' -Delimiter ","

$PasswordProfile = @{
    Password = 'DemoPassword12345!'
}
foreach ($user in $users) {
    $Params = @{
        UserPrincipalName = $user.givenName + "." + $user.surName + "@minundervisning.onmicrosoft.com"
        DisplayName       = $user.givenName + " " + $user.surname
        GivenName         = $user.GivenName
        Surname           = $user.Surname
        MailNickname      = $user.givenName + "." + $user.surname
        AccountEnabled    = $true
        PasswordProfile   = $PasswordProfile
        Department        = $user.Department
        CompanyName       = $user.CompanyName
        Country           = $user.Country
        City              = $user.City
    }
    
    
    $Params
    New-MgUser @Params
}



$group = Get-MgGroup -Filter "displayName eq 'HR Team'"
(Get-MgGroupMember -GroupID $Group.Id).AdditionalProperties.userPrincipalName