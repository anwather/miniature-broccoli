$timeNow = (Get-Date -Format FileDateTime)
New-AzDeployment -Name "vwan-$timeNow" -Location australiaeast -TemplateFile .\vwan.bicep -Verbose