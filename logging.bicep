param loggingResourceGroupName string = 'logging'
param location string = 'australiaeast'

targetScope = 'subscription'

resource logrg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: loggingResourceGroupName
  location: location
}

module logging 'logging/logging.bicep' = {
  name: loggingResourceGroupName
  scope: logrg
  params: {
    parLogAnalyticsWorkspaceName: 'caf-la-aue-001'
    parLogAnalyticsWorkspaceLocation: location
    parLogAnalyticsWorkspaceSkuName: 'PerGB2018'
    parLogAnalyticsWorkspaceLogRetentionInDays: 90
    parLogAnalyticsWorkspaceSolutions: [
      'AgentHealthAssessment'
      'AntiMalware'
      'ChangeTracking'
      'Security'
      'ServiceMap'
      'SQLAdvancedThreatProtection'
      'SQLVulnerabilityAssessment'
      'SQLAssessment'
      'Updates'
      'VMInsights'
    ]
    parAutomationAccountName: 'caf-auto-aue-001'
    parAutomationAccountLocation: location
    parAutomationAccountUseManagedIdentity: true
  }
}
