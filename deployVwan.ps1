$resourceGroupName = "vwan"
$defaultLocation = "australiaeast"

New-AzResourceGroup -Name $resourceGroupName -Location $defaultLocation -Verbose -Force

New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName `
    -TemplateFile .\vwanConnectivity\vwanConnectivity.bicep `
    -TemplateParameterFile .\vwanConnectivity.parameters.all.json `
    -Verbose