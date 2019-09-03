# This Powershell script is used for cleaning up NSX-T Manager Backups
# Delete all Files in C:\temp older than $Daysback day(s)
$Path = "C:\ftproot\nsxt"
$Daysback = "-30"
 
$CurrentDate = Get-Date
$DatetoDelete = $CurrentDate.AddDays($Daysback)
Get-ChildItem $Path -Recurse -include *.json, *.tar, backup* | Where-Object { $_.LastWriteTime -lt $DatetoDelete } | Remove-Item -Recurse
