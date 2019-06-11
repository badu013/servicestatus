$testcomputers = Get-Content -Path 'C:\Temp\Scripts\computers.txt'
$service = Get-Content -Path 'C:\Temp\Scripts\services.txt'
Clear-Content 'C:\Temp\Scripts\services.txt'
$results = @()
foreach ($computer in $testcomputers)
{
    foreach ($servicename in $service)
    {
        $results += Get-WmiObject -Query "select * from win32_service where name='$servicename'" -ComputerName $computer | select PSComputerName, Name, State 
        $results | Export-Csv -path "C:\Temp\scripts\services.csv" -NoTypeInformation -Force
    } 
}
