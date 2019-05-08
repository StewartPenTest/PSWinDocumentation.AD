function Get-WinADRootDSE {
    [CmdletBinding()]
    param(
        [string] $Domain = ($Env:USERDNSDOMAIN).ToLower()
    )
    #  $Time = Start-TimeLog
    try {
        if ($Domain -ne '') {
            #Write-Verbose "Getting domain information - $Domain DomainRootDSE"
            Get-ADRootDSE -Properties * -Server $Domain
        } else {
            # Write-Verbose 'Getting forest information - RootDSE'
            Get-ADRootDSE -Properties *  #| Select-Object -Property * -ExcludeProperty PropertyNames, AddedProperties, RemovedProperties, ModifiedProperties, PropertyCount
        }
    } catch {
        Write-Warning "Getting forest/domain information - $Domain RootDSE Error: $($_.Error)"
    }
    # $EndTime = Stop-TimeLog -Time $Time -Option OneLiner

    if ($Domain -ne '') {
        #Write-Verbose "Getting domain information - $Domain DomainRootDSE Time: $EndTime"
    } else {
        #Write-Verbose "Getting forest information - RootDSE Time: $EndTime"
    }
}