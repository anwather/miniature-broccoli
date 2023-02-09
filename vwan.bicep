param vWanResourceGroupName string = 'vwan'
param privateDnsResourceGroupName string = 'dns'
param location string = 'australiaeast'

targetScope = 'subscription'

resource vwanrg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: vWanResourceGroupName
  location: location
}

module vwan 'vwanConnectivity/vwanConnectivity.bicep' = {
  name: 'vwanDeployment'
  scope: vwanrg
  params: {
    parLocation: location
    parVirtualHubAddressPrefix: '10.100.0.0/23'
    parAzFirewallTier: 'Premium'
    parAzFirewallEnabled: true
    parAzFirewallDnsProxyEnabled: true
    parVirtualHubEnabled: true
    parVpnGatewayEnabled: false
    parExpressRouteGatewayEnabled: false
    parVirtualWanName: 'caf-vwan-aue-001'
    parVirtualWanHubName: 'caf-vhub-aue-001'
    parAzFirewallName: 'caf-fw-aue-001'
    parAzFirewallAvailabilityZones: [
      '1'
    ]
    parAzFirewallPoliciesName: 'caf-fwpolicy-aue-001'
    parDdosEnabled: false
    parPrivateDnsZonesEnabled: false
  }
}

resource dnsrg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: privateDnsResourceGroupName
  location: location
}

module dns 'privateDnsZones/privateDnsZones.bicep' = {
  name: 'dns'
  scope: dnsrg
  params: {
    parLocation: location
    parPrivateDnsZones: [
      'privatelink.australiaeast.azmk8s.io'
      'privatelink.australiaeast.batch.azure.com'
      'privatelink.australiaeast.kusto.windows.net'
      'privatelink.aue.backup.windowsazure.com'
      'privatelink.adf.azure.com'
      'privatelink.afs.azure.net'
      'privatelink.agentsvc.azure-automation.net'
      'privatelink.analysis.windows.net'
      'privatelink.api.azureml.ms'
      'privatelink.azconfig.io'
      'privatelink.azure-api.net'
      'privatelink.azure-automation.net'
      'privatelink.azurecr.io'
      'privatelink.azure-devices.net'
      'privatelink.azure-devices-provisioning.net'
      'privatelink.azurehdinsight.net'
      'privatelink.azurehealthcareapis.com'
      'privatelink.azurestaticapps.net'
      'privatelink.azuresynapse.net'
      'privatelink.azurewebsites.net'
      'privatelink.batch.azure.com'
      'privatelink.blob.core.windows.net'
      'privatelink.cassandra.cosmos.azure.com'
      'privatelink.cognitiveservices.azure.com'
      'privatelink.database.windows.net'
      'privatelink.datafactory.azure.net'
      'privatelink.dev.azuresynapse.net'
      'privatelink.dfs.core.windows.net'
      'privatelink.dicom.azurehealthcareapis.com'
      'privatelink.digitaltwins.azure.net'
      'privatelink.directline.botframework.com'
      'privatelink.documents.azure.com'
      'privatelink.eventgrid.azure.net'
      'privatelink.file.core.windows.net'
      'privatelink.gremlin.cosmos.azure.com'
      'privatelink.guestconfiguration.azure.com'
      'privatelink.his.arc.azure.com'
      'privatelink.kubernetesconfiguration.azure.com'
      'privatelink.managedhsm.azure.net'
      'privatelink.mariadb.database.azure.com'
      'privatelink.media.azure.net'
      'privatelink.mongo.cosmos.azure.com'
      'privatelink.monitor.azure.com'
      'privatelink.mysql.database.azure.com'
      'privatelink.notebooks.azure.net'
      'privatelink.ods.opinsights.azure.com'
      'privatelink.oms.opinsights.azure.com'
      'privatelink.pbidedicated.windows.net'
      'privatelink.postgres.database.azure.com'
      'privatelink.prod.migration.windowsazure.com'
      'privatelink.purview.azure.com'
      'privatelink.purviewstudio.azure.com'
      'privatelink.queue.core.windows.net'
      'privatelink.redis.cache.windows.net'
      'privatelink.redisenterprise.cache.azure.net'
      'privatelink.search.windows.net'
      'privatelink.service.signalr.net'
      'privatelink.servicebus.windows.net'
      'privatelink.siterecovery.windowsazure.com'
      'privatelink.sql.azuresynapse.net'
      'privatelink.table.core.windows.net'
      'privatelink.table.cosmos.azure.com'
      'privatelink.tip1.powerquery.microsoft.com'
      'privatelink.token.botframework.com'
      'privatelink.vaultcore.azure.net'
      'privatelink.web.core.windows.net'
      'privatelink.webpubsub.azure.com'
    ]
  }
}
