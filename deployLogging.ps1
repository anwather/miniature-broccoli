$resourceGroupName = "logging"
$defaultLocation = "australiaeast"

New-AzResourceGroup -Name $resourceGroupName -Location $defaultLocation -Verbose -Force

New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName `
    -TemplateFile .\logging\logging.bicep `
    -TemplateParameterFile .\logging.parameters.all.json `
    -Verbose