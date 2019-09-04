# Created by Geoff Wilmington @VMware
# This Powershell script is used for cleaning up NSX-T Manager Backups
# Delete all Files in $Path older than $Daysback day(s)

#SFTP backup folder path
$Path = "C:\ftproot\nsxt"

#Number of days to prune files older than
$Daysback = "-30"

#Gets the current date
$CurrentDate = Get-Date

#Adds the number of days to prune and sets delete variable
$DatetoDelete = $CurrentDate.AddDays($Daysback)

#Gets all objects with the file and folder types and recursively removes them
Get-ChildItem $Path -Recurse -include *.json, *.tar, backup* | Where-Object { $_.LastWriteTime -lt $DatetoDelete } | Remove-Item -Recurse
