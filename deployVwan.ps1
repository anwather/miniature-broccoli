$timeNow = (Get-Date -Format FileDateTime)
New-AzSubscriptionDeployment -Name "vwan-$timeNow" -Location australiaeast -TemplateFile .\vwan.bicep -Verbose