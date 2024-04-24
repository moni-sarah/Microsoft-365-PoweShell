# Create Groups
Get-Help New-MgGroup -Online
$departement = @("HR", "IT", "SALES", "Marketing")
foreach ($departement in $departement) {
    $membershiprule = "user.department -eq `"$departement`""

    # Create M365 Group 
    $Params = @{
        DisplayName                   = $departement
        Description                   = "Group for alle $departement"
        MailEnable                    = $true
        MailNickname                  = $departement
        SecurityEnabled               = $true
        GroupType                     = @("Unified", "DynamicMembership")
        MembershipRule                = $membershiprule
        MembershipRuleProcessingState = "on"


    }
    New-MgGroup @Params
}


$Params = @{
    DisplayName                   = "IT team"
    Description                   = "IT team for all employe "
    MailEnable                    = $true
    MailNickname                  = "Teach-teame"
    SecurityEnabled               = $true
    GroupType                     = @("Unified", "DynamicMembership")
    MembershipRule                = 'user.departement eg "IT"'
    MembershipRuleProcessingState = "on"


}


