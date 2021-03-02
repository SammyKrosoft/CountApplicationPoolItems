Import-Module WebAdministration

$list = @()

$applications = Get-WebApplication | Sort-Object -Property applicationpool

foreach ($application in $applications)
{
    #$application
    $count = (Get-WebRequest -AppPool $($application.applicationpool)).count
    #$count

    if ($count -ne 0)
    {

        $AppInput = [PSCustomObject]@{
            ApplicationPool = $($application.applicationpool)
            ApplicationPath = $($application.path)
            Count = $count
            }
            
 	   $list += $AppInput

    }
}

$list | Sort-Object -Property Count -Descending
