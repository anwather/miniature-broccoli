$timeNow = Get-Date -Format FileDateTime

New-AzDeployment -Name "logging-$timeNow" -Location australiaeast -TemplateFile .\logging.bicep -Verbose