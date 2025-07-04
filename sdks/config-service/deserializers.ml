open Smaws_Lib.Json.DeserializeHelpers
open Types
let version_of_yojson = string_of_yojson
let value_of_yojson = string_of_yojson
let error_message_of_yojson = string_of_yojson
let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : validation_exception)
let amazon_resource_name_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path =
  list_of_yojson tag_key_of_yojson tree path
let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = (value_for_key tag_key_list_of_yojson "TagKeys" _list path);
     resource_arn =
       (value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path)
   } : untag_resource_request)
let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : resource_not_found_exception)
let base_unit_of_yojson = unit_of_yojson
let account_id_of_yojson = string_of_yojson
let aws_region_of_yojson = string_of_yojson
let resource_id_of_yojson = string_of_yojson
let resource_type_of_yojson (tree : t) path =
  (match tree with
   | `String "SSMDocument" -> SSMDocument
   | `String "Route53ResolverFirewallRuleGroup" ->
       Route53ResolverFirewallRuleGroup
   | `String "RedshiftEndpointAccess" -> RedshiftEndpointAccess
   | `String "RDSOptionGroup" -> RDSOptionGroup
   | `String "QuickSightTheme" -> QuickSightTheme
   | `String "QuickSightTemplate" -> QuickSightTemplate
   | `String "QuickSightDataSource" -> QuickSightDataSource
   | `String "M2Environment" -> M2Environment
   | `String "KMSAlias" -> KMSAlias
   | `String "ImageBuilderImageRecipe" -> ImageBuilderImageRecipe
   | `String "GroundStationDataflowEndpointGroup" ->
       GroundStationDataflowEndpointGroup
   | `String "GrafanaWorkspace" -> GrafanaWorkspace
   | `String "EC2NetworkInsightsAnalysis" -> EC2NetworkInsightsAnalysis
   | `String "EC2NetworkInsightsAccessScope" -> EC2NetworkInsightsAccessScope
   | `String "CognitoUserPoolGroup" -> CognitoUserPoolGroup
   | `String "CognitoUserPoolClient" -> CognitoUserPoolClient
   | `String "CognitoUserPool" -> CognitoUserPool
   | `String "AppStreamFleet" -> AppStreamFleet
   | `String "ResourceExplorer2Index" -> ResourceExplorer2Index
   | `String "NetworkManagerConnectPeer" -> NetworkManagerConnectPeer
   | `String "LambdaCodeSigningConfig" -> LambdaCodeSigningConfig
   | `String "KafkaConnectConnector" -> KafkaConnectConnector
   | `String "IoTTwinMakerSyncJob" -> IoTTwinMakerSyncJob
   | `String "IoTCACertificate" -> IoTCACertificate
   | `String "IAMInstanceProfile" -> IAMInstanceProfile
   | `String "ECSCapacityProvider" -> ECSCapacityProvider
   | `String "EC2TransitGatewayMulticastDomain" ->
       EC2TransitGatewayMulticastDomain
   | `String "EC2TransitGatewayConnect" -> EC2TransitGatewayConnect
   | `String "EC2IPAMPool" -> EC2IPAMPool
   | `String "EC2CarrierGateway" -> EC2CarrierGateway
   | `String "ConnectQuickConnect" -> ConnectQuickConnect
   | `String "ConnectInstance" -> ConnectInstance
   | `String "AppMeshMesh" -> AppMeshMesh
   | `String "AppMeshGatewayRoute" -> AppMeshGatewayRoute
   | `String "ACMPCACertificateAuthorityActivation" ->
       ACMPCACertificateAuthorityActivation
   | `String "BatchSchedulingPolicy" -> BatchSchedulingPolicy
   | `String "Route53ResolverResolverQueryLoggingConfig" ->
       Route53ResolverResolverQueryLoggingConfig
   | `String "CodeGuruProfilerProfilingGroup" ->
       CodeGuruProfilerProfilingGroup
   | `String "APSRuleGroupsNamespace" -> APSRuleGroupsNamespace
   | `String "MediaConnectFlowSource" -> MediaConnectFlowSource
   | `String "TransferCertificate" -> TransferCertificate
   | `String "ServiceDiscoveryInstance" -> ServiceDiscoveryInstance
   | `String "Route53ResolverResolverQueryLoggingConfigAssociation" ->
       Route53ResolverResolverQueryLoggingConfigAssociation
   | `String "InspectorV2Filter" -> InspectorV2Filter
   | `String "IoTProvisioningTemplate" -> IoTProvisioningTemplate
   | `String "IoTWirelessFuotaTask" -> IoTWirelessFuotaTask
   | `String "IoTJobTemplate" -> IoTJobTemplate
   | `String "AppStreamStack" -> AppStreamStack
   | `String "MSKBatchScramSecret" -> MSKBatchScramSecret
   | `String "SageMakerFeatureGroup" -> SageMakerFeatureGroup
   | `String "CodeBuildReportGroup" -> CodeBuildReportGroup
   | `String "IoTTwinMakerComponentType" -> IoTTwinMakerComponentType
   | `String "PersonalizeDatasetGroup" -> PersonalizeDatasetGroup
   | `String "IoTWirelessMulticastGroup" -> IoTWirelessMulticastGroup
   | `String "NetworkManagerLinkAssociation" -> NetworkManagerLinkAssociation
   | `String "NetworkManagerCustomerGatewayAssociation" ->
       NetworkManagerCustomerGatewayAssociation
   | `String "S3AccessPoint" -> S3AccessPoint
   | `String "PinpointEmailChannel" -> PinpointEmailChannel
   | `String "LogsDestination" -> LogsDestination
   | `String "KinesisVideoStream" -> KinesisVideoStream
   | `String "KendraIndex" -> KendraIndex
   | `String "EC2ClientVpnEndpoint" -> EC2ClientVpnEndpoint
   | `String "EC2CapacityReservation" -> EC2CapacityReservation
   | `String "DMSEndpoint" -> DMSEndpoint
   | `String "CustomerProfilesObjectType" -> CustomerProfilesObjectType
   | `String "AppRunnerService" -> AppRunnerService
   | `String "AppMeshVirtualRouter" -> AppMeshVirtualRouter
   | `String "AppMeshVirtualGateway" -> AppMeshVirtualGateway
   | `String "AppConfigHostedConfigurationVersion" ->
       AppConfigHostedConfigurationVersion
   | `String "ACMPCACertificateAuthority" -> ACMPCACertificateAuthority
   | `String "ResilienceHubApp" -> ResilienceHubApp
   | `String "PinpointEventStream" -> PinpointEventStream
   | `String "PinpointEmailTemplate" -> PinpointEmailTemplate
   | `String "PersonalizeSolution" -> PersonalizeSolution
   | `String "PersonalizeSchema" -> PersonalizeSchema
   | `String "PersonalizeDataset" -> PersonalizeDataset
   | `String "MSKConfiguration" -> MSKConfiguration
   | `String "MediaTailorPlaybackConfiguration" ->
       MediaTailorPlaybackConfiguration
   | `String "MediaConnectFlowVpcInterface" -> MediaConnectFlowVpcInterface
   | `String "MediaConnectFlowEntitlement" -> MediaConnectFlowEntitlement
   | `String "GroundStationMissionProfile" -> GroundStationMissionProfile
   | `String "GreengrassV2ComponentVersion" -> GreengrassV2ComponentVersion
   | `String "ForecastDatasetGroup" -> ForecastDatasetGroup
   | `String "EvidentlyLaunch" -> EvidentlyLaunch
   | `String "EC2IPAMScope" -> EC2IPAMScope
   | `String "AthenaPreparedStatement" -> AthenaPreparedStatement
   | `String "AppMeshRoute" -> AppMeshRoute
   | `String "AppIntegrationsEventIntegration" ->
       AppIntegrationsEventIntegration
   | `String "AmplifyBranch" -> AmplifyBranch
   | `String "KinesisFirehoseDeliveryStream" -> KinesisFirehoseDeliveryStream
   | `String "TransferConnector" -> TransferConnector
   | `String "TransferAgreement" -> TransferAgreement
   | `String "SageMakerDomain" -> SageMakerDomain
   | `String "PinpointInAppTemplate" -> PinpointInAppTemplate
   | `String "PinpointCampaign" -> PinpointCampaign
   | `String "IAMServerCertificate" -> IAMServerCertificate
   | `String "IAMSAMLProvider" -> IAMSAMLProvider
   | `String "ForecastDataset" -> ForecastDataset
   | `String "EvidentlyProject" -> EvidentlyProject
   | `String "EC2SpotFleet" -> EC2SpotFleet
   | `String "EC2PrefixList" -> EC2PrefixList
   | `String "CodeArtifactRepository" -> CodeArtifactRepository
   | `String "AppStreamApplication" -> AppStreamApplication
   | `String "AppRunnerVpcConnector" -> AppRunnerVpcConnector
   | `String "AppMeshVirtualService" -> AppMeshVirtualService
   | `String "AppMeshVirtualNode" -> AppMeshVirtualNode
   | `String "AmplifyApp" -> AmplifyApp
   | `String "SignerSigningProfile" -> SignerSigningProfile
   | `String "CassandraKeyspace" -> CassandraKeyspace
   | `String "ECSTaskSet" -> ECSTaskSet
   | `String "SageMakerImage" -> SageMakerImage
   | `String "SageMakerAppImageConfig" -> SageMakerAppImageConfig
   | `String "Route53ResolverFirewallRuleGroupAssociation" ->
       Route53ResolverFirewallRuleGroupAssociation
   | `String "RedshiftScheduledAction" -> RedshiftScheduledAction
   | `String "PinpointApp" -> PinpointApp
   | `String "PanoramaPackage" -> PanoramaPackage
   | `String "NetworkManagerSite" -> NetworkManagerSite
   | `String "NetworkManagerLink" -> NetworkManagerLink
   | `String "NetworkManagerGlobalNetwork" -> NetworkManagerGlobalNetwork
   | `String "NetworkManagerDevice" -> NetworkManagerDevice
   | `String "IoTWirelessServiceProfile" -> IoTWirelessServiceProfile
   | `String "IoTFleetMetric" -> IoTFleetMetric
   | `String "ImageBuilderImagePipeline" -> ImageBuilderImagePipeline
   | `String "GroundStationConfig" -> GroundStationConfig
   | `String "ECRPullThroughCacheRule" -> ECRPullThroughCacheRule
   | `String "EC2SubnetRouteTableAssociation" ->
       EC2SubnetRouteTableAssociation
   | `String "EC2EC2Fleet" -> EC2EC2Fleet
   | `String "DeviceFarmProject" -> DeviceFarmProject
   | `String "DeviceFarmInstanceProfile" -> DeviceFarmInstanceProfile
   | `String "CloudWatchMetricStream" -> CloudWatchMetricStream
   | `String "AuditManagerAssessment" -> AuditManagerAssessment
   | `String "AppFlowFlow" -> AppFlowFlow
   | `String "AppConfigDeploymentStrategy" -> AppConfigDeploymentStrategy
   | `String "ConnectPhoneNumber" -> ConnectPhoneNumber
   | `String "AutoScalingWarmPool" -> AutoScalingWarmPool
   | `String "CustomerProfilesDomain" -> CustomerProfilesDomain
   | `String "NetworkManagerTransitGatewayRegistration" ->
       NetworkManagerTransitGatewayRegistration
   | `String "IoTTwinMakerScene" -> IoTTwinMakerScene
   | `String "EC2IPAM" -> EC2IPAM
   | `String "EC2TrafficMirrorFilter" -> EC2TrafficMirrorFilter
   | `String "EC2NetworkInsightsPath" -> EC2NetworkInsightsPath
   | `String "EC2DHCPOptions" -> EC2DHCPOptions
   | `String "EventsRule" -> EventsRule
   | `String "PinpointApplicationSettings" -> PinpointApplicationSettings
   | `String "PinpointSegment" -> PinpointSegment
   | `String "HealthLakeFHIRDatastore" -> HealthLakeFHIRDatastore
   | `String "RoboMakerRobotApplication" -> RoboMakerRobotApplication
   | `String "RoboMakerSimulationApplication" ->
       RoboMakerSimulationApplication
   | `String "Route53RecoveryReadinessResourceSet" ->
       Route53RecoveryReadinessResourceSet
   | `String "Route53RecoveryControlRoutingControl" ->
       Route53RecoveryControlRoutingControl
   | `String "Route53RecoveryControlControlPanel" ->
       Route53RecoveryControlControlPanel
   | `String "Route53RecoveryControlSafetyRule" ->
       Route53RecoveryControlSafetyRule
   | `String "Route53RecoveryControlCluster" -> Route53RecoveryControlCluster
   | `String "LookoutVisionProject" -> LookoutVisionProject
   | `String "AppStreamDirectoryConfig" -> AppStreamDirectoryConfig
   | `String "KinesisVideoSignalingChannel" -> KinesisVideoSignalingChannel
   | `String "MediaPackagePackagingConfiguration" ->
       MediaPackagePackagingConfiguration
   | `String "EventSchemasSchema" -> EventSchemasSchema
   | `String "EventsConnection" -> EventsConnection
   | `String "IoTScheduledAudit" -> IoTScheduledAudit
   | `String "S3StorageLens" -> S3StorageLens
   | `String "EC2TrafficMirrorTarget" -> EC2TrafficMirrorTarget
   | `String "IoTAccountAuditConfiguration" -> IoTAccountAuditConfiguration
   | `String "LookoutMetricsAlert" -> LookoutMetricsAlert
   | `String "LexBotAlias" -> LexBotAlias
   | `String "IoTSiteWiseGateway" -> IoTSiteWiseGateway
   | `String "EC2TrafficMirrorSession" -> EC2TrafficMirrorSession
   | `String "RoboMakerRobotApplicationVersion" ->
       RoboMakerRobotApplicationVersion
   | `String "Route53ResolverFirewallDomainList" ->
       Route53ResolverFirewallDomainList
   | `String "IoTCustomMetric" -> IoTCustomMetric
   | `String "CodeGuruReviewerRepositoryAssociation" ->
       CodeGuruReviewerRepositoryAssociation
   | `String "LexBot" -> LexBot
   | `String "BudgetsBudgetsAction" -> BudgetsBudgetsAction
   | `String "DeviceFarmTestGridProject" -> DeviceFarmTestGridProject
   | `String "S3MultiRegionAccessPoint" -> S3MultiRegionAccessPoint
   | `String "RDSGlobalCluster" -> RDSGlobalCluster
   | `String "KinesisAnalyticsV2Application" -> KinesisAnalyticsV2Application
   | `String "IVSPlaybackKeyPair" -> IVSPlaybackKeyPair
   | `String "IVSRecordingConfiguration" -> IVSRecordingConfiguration
   | `String "IVSChannel" -> IVSChannel
   | `String "IoTSiteWiseAssetModel" -> IoTSiteWiseAssetModel
   | `String "IoTSiteWisePortal" -> IoTSiteWisePortal
   | `String "IoTSiteWiseProject" -> IoTSiteWiseProject
   | `String "IoTSiteWiseDashboard" -> IoTSiteWiseDashboard
   | `String "IoTAnalyticsChannel" -> IoTAnalyticsChannel
   | `String "IoTAnalyticsPipeline" -> IoTAnalyticsPipeline
   | `String "IoTAnalyticsDataset" -> IoTAnalyticsDataset
   | `String "IoTTwinMakerEntity" -> IoTTwinMakerEntity
   | `String "IoTTwinMakerWorkspace" -> IoTTwinMakerWorkspace
   | `String "IoTMitigationAction" -> IoTMitigationAction
   | `String "IoTPolicy" -> IoTPolicy
   | `String "GlueMLTransform" -> GlueMLTransform
   | `String "EKSAddon" -> EKSAddon
   | `String "EKSIdentityProviderConfig" -> EKSIdentityProviderConfig
   | `String "TransferWorkflow" -> TransferWorkflow
   | `String "ResilienceHubResiliencyPolicy" -> ResilienceHubResiliencyPolicy
   | `String "Route53RecoveryReadinessRecoveryGroup" ->
       Route53RecoveryReadinessRecoveryGroup
   | `String "MediaPackagePackagingGroup" -> MediaPackagePackagingGroup
   | `String "LightsailStaticIp" -> LightsailStaticIp
   | `String "LightsailBucket" -> LightsailBucket
   | `String "IoTAnalyticsDatastore" -> IoTAnalyticsDatastore
   | `String "IoTDimension" -> IoTDimension
   | `String "IoTRoleAlias" -> IoTRoleAlias
   | `String "IoTSecurityProfile" -> IoTSecurityProfile
   | `String "IoTAuthorizer" -> IoTAuthorizer
   | `String "FraudDetectorOutcome" -> FraudDetectorOutcome
   | `String "FraudDetectorVariable" -> FraudDetectorVariable
   | `String "FraudDetectorEntityType" -> FraudDetectorEntityType
   | `String "FraudDetectorLabel" -> FraudDetectorLabel
   | `String "EventSchemasDiscoverer" -> EventSchemasDiscoverer
   | `String "EventSchemasRegistryPolicy" -> EventSchemasRegistryPolicy
   | `String "EventSchemasRegistry" -> EventSchemasRegistry
   | `String "Cloud9EnvironmentEC2" -> Cloud9EnvironmentEC2
   | `String "AppConfigConfigurationProfile" -> AppConfigConfigurationProfile
   | `String "AppConfigEnvironment" -> AppConfigEnvironment
   | `String "AmazonMQBroker" -> AmazonMQBroker
   | `String "SESTemplate" -> SESTemplate
   | `String "GuardDutyFilter" -> GuardDutyFilter
   | `String "SESReceiptFilter" -> SESReceiptFilter
   | `String "DataSyncLocationFSxWindows" -> DataSyncLocationFSxWindows
   | `String "FISExperimentTemplate" -> FISExperimentTemplate
   | `String "LightsailDisk" -> LightsailDisk
   | `String "EventsApiDestination" -> EventsApiDestination
   | `String "EventsArchive" -> EventsArchive
   | `String "SESReceiptRuleSet" -> SESReceiptRuleSet
   | `String "EventsEndpoint" -> EventsEndpoint
   | `String "RUMAppMonitor" -> RUMAppMonitor
   | `String "LightsailCertificate" -> LightsailCertificate
   | `String "BackupReportPlan" -> BackupReportPlan
   | `String "ECRRegistryPolicy" -> ECRRegistryPolicy
   | `String "Route53RecoveryReadinessReadinessCheck" ->
       Route53RecoveryReadinessReadinessCheck
   | `String "Route53RecoveryReadinessCell" -> Route53RecoveryReadinessCell
   | `String "GlueClassifier" -> GlueClassifier
   | `String "DataSyncLocationHDFS" -> DataSyncLocationHDFS
   | `String "DataSyncLocationObjectStorage" -> DataSyncLocationObjectStorage
   | `String "ImageBuilderInfrastructureConfiguration" ->
       ImageBuilderInfrastructureConfiguration
   | `String "ImageBuilderDistributionConfiguration" ->
       ImageBuilderDistributionConfiguration
   | `String "ImageBuilderContainerRecipe" -> ImageBuilderContainerRecipe
   | `String "EventsEventBus" -> EventsEventBus
   | `String "ServiceDiscoveryHttpNamespace" -> ServiceDiscoveryHttpNamespace
   | `String "IoTEventsAlarmModel" -> IoTEventsAlarmModel
   | `String "IoTEventsDetectorModel" -> IoTEventsDetectorModel
   | `String "IoTEventsInput" -> IoTEventsInput
   | `String "Route53HostedZone" -> Route53HostedZone
   | `String "SESConfigurationSet" -> SESConfigurationSet
   | `String "SESContactList" -> SESContactList
   | `String "ServiceDiscoveryPublicDnsNamespace" ->
       ServiceDiscoveryPublicDnsNamespace
   | `String "ServiceDiscoveryService" -> ServiceDiscoveryService
   | `String "SageMakerNotebookInstanceLifecycleConfig" ->
       SageMakerNotebookInstanceLifecycleConfig
   | `String "SageMakerWorkteam" -> SageMakerWorkteam
   | `String "GuardDutyIPSet" -> GuardDutyIPSet
   | `String "GuardDutyThreatIntelSet" -> GuardDutyThreatIntelSet
   | `String "GlueJob" -> GlueJob
   | `String "EKSFargateProfile" -> EKSFargateProfile
   | `String "NetworkInsightsAccessScopeAnalysis" ->
       NetworkInsightsAccessScopeAnalysis
   | `String "DataSyncLocationNFS" -> DataSyncLocationNFS
   | `String "DataSyncTask" -> DataSyncTask
   | `String "DataSyncLocationEFS" -> DataSyncLocationEFS
   | `String "DataSyncLocationS3" -> DataSyncLocationS3
   | `String "DataSyncLocationFSxLustre" -> DataSyncLocationFSxLustre
   | `String "DataSyncLocationSMB" -> DataSyncLocationSMB
   | `String "AppSyncGraphQLApi" -> AppSyncGraphQLApi
   | `String "AppConfigApplication" -> AppConfigApplication
   | `String "DMSCertificate" -> DMSCertificate
   | `String "TransitGatewayRouteTable" -> TransitGatewayRouteTable
   | `String "TransitGatewayAttachment" -> TransitGatewayAttachment
   | `String "GlobalAcceleratorListener" -> GlobalAcceleratorListener
   | `String "GlobalAcceleratorEndpointGroup" ->
       GlobalAcceleratorEndpointGroup
   | `String "GlobalAcceleratorAccelerator" -> GlobalAcceleratorAccelerator
   | `String "DetectiveGraph" -> DetectiveGraph
   | `String "AthenaDataCatalog" -> AthenaDataCatalog
   | `String "AthenaWorkGroup" -> AthenaWorkGroup
   | `String "AccessAnalyzerAnalyzer" -> AccessAnalyzerAnalyzer
   | `String "BatchComputeEnvironment" -> BatchComputeEnvironment
   | `String "BatchJobQueue" -> BatchJobQueue
   | `String "StepFunctionsStateMachine" -> StepFunctionsStateMachine
   | `String "ListenerV2" -> ListenerV2
   | `String "SageMakerModel" -> SageMakerModel
   | `String "WorkSpacesConnectionAlias" -> WorkSpacesConnectionAlias
   | `String "WorkSpacesWorkspace" -> WorkSpacesWorkspace
   | `String "StepFunctionsActivity" -> StepFunctionsActivity
   | `String "MSKCluster" -> MSKCluster
   | `String "DMSEventSubscription" -> DMSEventSubscription
   | `String "DMSReplicationSubnetGroup" -> DMSReplicationSubnetGroup
   | `String "Route53ResolverResolverRuleAssociation" ->
       Route53ResolverResolverRuleAssociation
   | `String "Route53ResolverResolverRule" -> Route53ResolverResolverRule
   | `String "Route53ResolverResolverEndpoint" ->
       Route53ResolverResolverEndpoint
   | `String "SageMakerCodeRepository" -> SageMakerCodeRepository
   | `String "EMRSecurityConfiguration" -> EMRSecurityConfiguration
   | `String "GuardDutyDetector" -> GuardDutyDetector
   | `String "ECRPublicRepository" -> ECRPublicRepository
   | `String "LaunchTemplate" -> LaunchTemplate
   | `String "CodeDeployDeploymentGroup" -> CodeDeployDeploymentGroup
   | `String "CodeDeployDeploymentConfig" -> CodeDeployDeploymentConfig
   | `String "CodeDeployApplication" -> CodeDeployApplication
   | `String "KinesisStreamConsumer" -> KinesisStreamConsumer
   | `String "KinesisStream" -> KinesisStream
   | `String "TransitGateway" -> TransitGateway
   | `String "OpenSearchDomain" -> OpenSearchDomain
   | `String "EKSCluster" -> EKSCluster
   | `String "EFSFileSystem" -> EFSFileSystem
   | `String "EFSAccessPoint" -> EFSAccessPoint
   | `String "ECSTaskDefinition" -> ECSTaskDefinition
   | `String "ECSService" -> ECSService
   | `String "ECSCluster" -> ECSCluster
   | `String "ECRRepository" -> ECRRepository
   | `String "BackupRecoveryPoint" -> BackupRecoveryPoint
   | `String "BackupVault" -> BackupVault
   | `String "BackupSelection" -> BackupSelection
   | `String "BackupPlan" -> BackupPlan
   | `String "FileData" -> FileData
   | `String "Topic" -> Topic
   | `String "Secret" -> Secret
   | `String "QLDBLedger" -> QLDBLedger
   | `String "Key" -> Key
   | `String "Queue" -> Queue
   | `String "Portfolio" -> Portfolio
   | `String "CloudFormationProduct" -> CloudFormationProduct
   | `String "CloudFormationProvisionedProduct" ->
       CloudFormationProvisionedProduct
   | `String "Pipeline" -> Pipeline
   | `String "Api" -> Api
   | `String "StageV2" -> StageV2
   | `String "RestApi" -> RestApi
   | `String "Stage" -> Stage
   | `String "ResourceCompliance" -> ResourceCompliance
   | `String "ConformancePackCompliance" -> ConformancePackCompliance
   | `String "RegionalProtection" -> RegionalProtection
   | `String "Protection" -> Protection
   | `String "PatchCompliance" -> PatchCompliance
   | `String "AssociationCompliance" -> AssociationCompliance
   | `String "EncryptionConfig" -> EncryptionConfig
   | `String "ManagedRuleSetV2" -> ManagedRuleSetV2
   | `String "RegexPatternSetV2" -> RegexPatternSetV2
   | `String "IPSetV2" -> IPSetV2
   | `String "RuleGroupV2" -> RuleGroupV2
   | `String "WebACLV2" -> WebACLV2
   | `String "Environment" -> Environment
   | `String "ApplicationVersion" -> ApplicationVersion
   | `String "Application" -> Application
   | `String "NetworkFirewallRuleGroup" -> NetworkFirewallRuleGroup
   | `String "NetworkFirewallFirewallPolicy" -> NetworkFirewallFirewallPolicy
   | `String "NetworkFirewallFirewall" -> NetworkFirewallFirewall
   | `String "Function" -> Function
   | `String "StreamingDistribution" -> StreamingDistribution
   | `String "Distribution" -> Distribution
   | `String "RegionalWebACL" -> RegionalWebACL
   | `String "RegionalRuleGroup" -> RegionalRuleGroup
   | `String "RegionalRule" -> RegionalRule
   | `String "RegionalRateBasedRule" -> RegionalRateBasedRule
   | `String "WebACL" -> WebACL
   | `String "RuleGroup" -> RuleGroup
   | `String "Rule" -> Rule
   | `String "RateBasedRule" -> RateBasedRule
   | `String "Project" -> Project
   | `String "Table" -> Table
   | `String "ScheduledAction" -> ScheduledAction
   | `String "ScalingPolicy" -> ScalingPolicy
   | `String "LaunchConfiguration" -> LaunchConfiguration
   | `String "AutoScalingGroup" -> AutoScalingGroup
   | `String "LoadBalancer" -> LoadBalancer
   | `String "Stack" -> Stack
   | `String "Alarm" -> Alarm
   | `String "ManagedInstanceInventory" -> ManagedInstanceInventory
   | `String "RedshiftEventSubscription" -> RedshiftEventSubscription
   | `String "ClusterSubnetGroup" -> ClusterSubnetGroup
   | `String "ClusterSecurityGroup" -> ClusterSecurityGroup
   | `String "ClusterParameterGroup" -> ClusterParameterGroup
   | `String "ClusterSnapshot" -> ClusterSnapshot
   | `String "Cluster" -> Cluster
   | `String "AccountPublicAccessBlock" -> AccountPublicAccessBlock
   | `String "Bucket" -> Bucket
   | `String "EventSubscription" -> EventSubscription
   | `String "DBClusterSnapshot" -> DBClusterSnapshot
   | `String "DBCluster" -> DBCluster
   | `String "DBSnapshot" -> DBSnapshot
   | `String "DBSecurityGroup" -> DBSecurityGroup
   | `String "DBSubnetGroup" -> DBSubnetGroup
   | `String "DBInstance" -> DBInstance
   | `String "Certificate" -> Certificate
   | `String "LoadBalancerV2" -> LoadBalancerV2
   | `String "User" -> User
   | `String "Role" -> Role
   | `String "Policy" -> Policy
   | `String "Group" -> Group
   | `String "Domain" -> Domain
   | `String "VPCPeeringConnection" -> VPCPeeringConnection
   | `String "FlowLog" -> FlowLog
   | `String "VPCEndpointService" -> VPCEndpointService
   | `String "VPCEndpoint" -> VPCEndpoint
   | `String "EgressOnlyInternetGateway" -> EgressOnlyInternetGateway
   | `String "NatGateway" -> NatGateway
   | `String "RegisteredHAInstance" -> RegisteredHAInstance
   | `String "VPNGateway" -> VPNGateway
   | `String "VPNConnection" -> VPNConnection
   | `String "VPC" -> VPC
   | `String "Volume" -> Volume
   | `String "Trail" -> Trail
   | `String "Subnet" -> Subnet
   | `String "SecurityGroup" -> SecurityGroup
   | `String "RouteTable" -> RouteTable
   | `String "NetworkInterface" -> NetworkInterface
   | `String "NetworkAcl" -> NetworkAcl
   | `String "InternetGateway" -> InternetGateway
   | `String "Instance" -> Instance
   | `String "Host" -> Host
   | `String "EIP" -> EIP
   | `String "CustomerGateway" -> CustomerGateway
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "ResourceType" value)
   | _ -> raise (deserialize_wrong_type_error path "ResourceType") : 
  resource_type)
let resource_name_of_yojson = string_of_yojson
let aggregate_resource_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name =
       (option_of_yojson
          (value_for_key resource_name_of_yojson "ResourceName") _list path);
     resource_type =
       (value_for_key resource_type_of_yojson "ResourceType" _list path);
     resource_id =
       (value_for_key resource_id_of_yojson "ResourceId" _list path);
     source_region =
       (value_for_key aws_region_of_yojson "SourceRegion" _list path);
     source_account_id =
       (value_for_key account_id_of_yojson "SourceAccountId" _list path)
   } : aggregate_resource_identifier)
let unprocessed_resource_identifier_list_of_yojson tree path =
  list_of_yojson aggregate_resource_identifier_of_yojson tree path
let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : too_many_tags_exception)
let date_of_yojson = timestamp_epoch_seconds_of_yojson
let time_window_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time =
       (option_of_yojson (value_for_key date_of_yojson "EndTime") _list path);
     start_time =
       (option_of_yojson (value_for_key date_of_yojson "StartTime") _list
          path)
   } : time_window)
let ssm_document_name_of_yojson = string_of_yojson
let ssm_document_version_of_yojson = string_of_yojson
let template_ssm_document_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_version =
       (option_of_yojson
          (value_for_key ssm_document_version_of_yojson "DocumentVersion")
          _list path);
     document_name =
       (value_for_key ssm_document_name_of_yojson "DocumentName" _list path)
   } : template_ssm_document_details)
let template_s3_uri_of_yojson = string_of_yojson
let template_body_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson
let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       (option_of_yojson (value_for_key tag_value_of_yojson "Value") _list
          path);
     key =
       (option_of_yojson (value_for_key tag_key_of_yojson "Key") _list path)
   } : tag)
let tags_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let name_of_yojson = string_of_yojson
let tags_of_yojson tree path =
  map_of_yojson name_of_yojson value_of_yojson tree path
let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = (value_for_key tag_list_of_yojson "Tags" _list path);
     resource_arn =
       (value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path)
   } : tag_resource_request)
let supplementary_configuration_value_of_yojson = string_of_yojson
let supplementary_configuration_name_of_yojson = string_of_yojson
let supplementary_configuration_of_yojson tree path =
  map_of_yojson supplementary_configuration_name_of_yojson
    supplementary_configuration_value_of_yojson tree path
let string_with_char_limit768_of_yojson = string_of_yojson
let string_with_char_limit64_of_yojson = string_of_yojson
let string_with_char_limit256_min0_of_yojson = string_of_yojson
let string_with_char_limit256_of_yojson = string_of_yojson
let string_with_char_limit2048_of_yojson = string_of_yojson
let string_with_char_limit128_of_yojson = string_of_yojson
let string_with_char_limit1024_of_yojson = string_of_yojson
let string__of_yojson = string_of_yojson
let query_id_of_yojson = string_of_yojson
let query_arn_of_yojson = string_of_yojson
let query_name_of_yojson = string_of_yojson
let query_description_of_yojson = string_of_yojson
let stored_query_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       (option_of_yojson
          (value_for_key query_description_of_yojson "Description") _list
          path);
     query_name = (value_for_key query_name_of_yojson "QueryName" _list path);
     query_arn = (value_for_key query_arn_of_yojson "QueryArn" _list path);
     query_id = (value_for_key query_id_of_yojson "QueryId" _list path)
   } : stored_query_metadata)
let stored_query_metadata_list_of_yojson tree path =
  list_of_yojson stored_query_metadata_of_yojson tree path
let query_expression_of_yojson = string_of_yojson
let stored_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expression =
       (option_of_yojson
          (value_for_key query_expression_of_yojson "Expression") _list path);
     description =
       (option_of_yojson
          (value_for_key query_description_of_yojson "Description") _list
          path);
     query_name = (value_for_key query_name_of_yojson "QueryName" _list path);
     query_arn =
       (option_of_yojson (value_for_key query_arn_of_yojson "QueryArn") _list
          path);
     query_id =
       (option_of_yojson (value_for_key query_id_of_yojson "QueryId") _list
          path)
   } : stored_query)
let recorder_name_of_yojson = string_of_yojson
let stop_configuration_recorder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder_name =
       (value_for_key recorder_name_of_yojson "ConfigurationRecorderName"
          _list path)
   } : stop_configuration_recorder_request)
let no_such_configuration_recorder_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : no_such_configuration_recorder_exception)
let member_account_rule_status_of_yojson (tree : t) path =
  (match tree with
   | `String "UPDATE_FAILED" -> UPDATE_FAILED
   | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
   | `String "UPDATE_SUCCESSFUL" -> UPDATE_SUCCESSFUL
   | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
   | `String "DELETE_FAILED" -> DELETE_FAILED
   | `String "DELETE_SUCCESSFUL" -> DELETE_SUCCESSFUL
   | `String "CREATE_FAILED" -> CREATE_FAILED
   | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
   | `String "CREATE_SUCCESSFUL" -> CREATE_SUCCESSFUL
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "MemberAccountRuleStatus"
            value)
   | _ -> raise (deserialize_wrong_type_error path "MemberAccountRuleStatus") : 
  member_account_rule_status)
let status_detail_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     member_account_rule_status =
       (option_of_yojson
          (value_for_key member_account_rule_status_of_yojson
             "MemberAccountRuleStatus") _list path);
     account_id =
       (option_of_yojson (value_for_key account_id_of_yojson "AccountId")
          _list path)
   } : status_detail_filters)
let static_parameter_values_of_yojson tree path =
  list_of_yojson string_with_char_limit256_of_yojson tree path
let static_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values =
       (value_for_key static_parameter_values_of_yojson "Values" _list path)
   } : static_value)
let resource_evaluation_id_of_yojson = string_of_yojson
let start_resource_evaluation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_evaluation_id =
       (option_of_yojson
          (value_for_key resource_evaluation_id_of_yojson
             "ResourceEvaluationId") _list path)
   } : start_resource_evaluation_response)
let base_resource_id_of_yojson = string_of_yojson
let resource_configuration_of_yojson = string_of_yojson
let resource_configuration_schema_type_of_yojson (tree : t) path =
  (match tree with
   | `String "CFN_RESOURCE_SCHEMA" -> CFN_RESOURCE_SCHEMA
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "ResourceConfigurationSchemaType" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path "ResourceConfigurationSchemaType") : 
  resource_configuration_schema_type)
let resource_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_configuration_schema_type =
       (option_of_yojson
          (value_for_key resource_configuration_schema_type_of_yojson
             "ResourceConfigurationSchemaType") _list path);
     resource_configuration =
       (value_for_key resource_configuration_of_yojson
          "ResourceConfiguration" _list path);
     resource_type =
       (value_for_key string_with_char_limit256_of_yojson "ResourceType"
          _list path);
     resource_id =
       (value_for_key base_resource_id_of_yojson "ResourceId" _list path)
   } : resource_details)
let evaluation_context_identifier_of_yojson = string_of_yojson
let evaluation_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_context_identifier =
       (option_of_yojson
          (value_for_key evaluation_context_identifier_of_yojson
             "EvaluationContextIdentifier") _list path)
   } : evaluation_context)
let evaluation_mode_of_yojson (tree : t) path =
  (match tree with
   | `String "PROACTIVE" -> PROACTIVE
   | `String "DETECTIVE" -> DETECTIVE
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "EvaluationMode" value)
   | _ -> raise (deserialize_wrong_type_error path "EvaluationMode") : 
  evaluation_mode)
let evaluation_timeout_of_yojson = int_of_yojson
let client_token_of_yojson = string_of_yojson
let start_resource_evaluation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       (option_of_yojson (value_for_key client_token_of_yojson "ClientToken")
          _list path);
     evaluation_timeout =
       (option_of_yojson
          (value_for_key evaluation_timeout_of_yojson "EvaluationTimeout")
          _list path);
     evaluation_mode =
       (value_for_key evaluation_mode_of_yojson "EvaluationMode" _list path);
     evaluation_context =
       (option_of_yojson
          (value_for_key evaluation_context_of_yojson "EvaluationContext")
          _list path);
     resource_details =
       (value_for_key resource_details_of_yojson "ResourceDetails" _list path)
   } : start_resource_evaluation_request)
let invalid_parameter_value_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_parameter_value_exception)
let idempotent_parameter_mismatch_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "message") _list
          path)
   } : idempotent_parameter_mismatch)
let resource_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id =
       (value_for_key resource_id_of_yojson "resourceId" _list path);
     resource_type =
       (value_for_key resource_type_of_yojson "resourceType" _list path)
   } : resource_key)
let resource_keys_of_yojson tree path =
  list_of_yojson resource_key_of_yojson tree path
let start_remediation_execution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_items =
       (option_of_yojson
          (value_for_key resource_keys_of_yojson "FailedItems") _list path);
     failure_message =
       (option_of_yojson (value_for_key string__of_yojson "FailureMessage")
          _list path)
   } : start_remediation_execution_response)
let config_rule_name_of_yojson = string_of_yojson
let start_remediation_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_keys =
       (value_for_key resource_keys_of_yojson "ResourceKeys" _list path);
     config_rule_name =
       (value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path)
   } : start_remediation_execution_request)
let no_such_remediation_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : no_such_remediation_configuration_exception)
let insufficient_permissions_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : insufficient_permissions_exception)
let start_configuration_recorder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder_name =
       (value_for_key recorder_name_of_yojson "ConfigurationRecorderName"
          _list path)
   } : start_configuration_recorder_request)
let no_available_delivery_channel_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : no_available_delivery_channel_exception)
let start_config_rules_evaluation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let reevaluate_config_rule_names_of_yojson tree path =
  list_of_yojson config_rule_name_of_yojson tree path
let start_config_rules_evaluation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_names =
       (option_of_yojson
          (value_for_key reevaluate_config_rule_names_of_yojson
             "ConfigRuleNames") _list path)
   } : start_config_rules_evaluation_request)
let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : resource_in_use_exception)
let no_such_config_rule_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : no_such_config_rule_exception)
let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : limit_exceeded_exception)
let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_next_token_exception)
let invalid_limit_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_limit_exception)
let invalid_expression_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_expression_exception)
let results_of_yojson tree path = list_of_yojson string__of_yojson tree path
let field_name_of_yojson = string_of_yojson
let field_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       (option_of_yojson (value_for_key field_name_of_yojson "Name") _list
          path)
   } : field_info)
let field_info_list_of_yojson tree path =
  list_of_yojson field_info_of_yojson tree path
let query_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     select_fields =
       (option_of_yojson
          (value_for_key field_info_list_of_yojson "SelectFields") _list path)
   } : query_info)
let next_token_of_yojson = string_of_yojson
let select_resource_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     query_info =
       (option_of_yojson (value_for_key query_info_of_yojson "QueryInfo")
          _list path);
     results =
       (option_of_yojson (value_for_key results_of_yojson "Results") _list
          path)
   } : select_resource_config_response)
let expression_of_yojson = string_of_yojson
let limit_of_yojson = int_of_yojson
let select_resource_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     expression =
       (value_for_key expression_of_yojson "Expression" _list path)
   } : select_resource_config_request)
let no_such_configuration_aggregator_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : no_such_configuration_aggregator_exception)
let select_aggregate_resource_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     query_info =
       (option_of_yojson (value_for_key query_info_of_yojson "QueryInfo")
          _list path);
     results =
       (option_of_yojson (value_for_key results_of_yojson "Results") _list
          path)
   } : select_aggregate_resource_config_response)
let configuration_aggregator_name_of_yojson = string_of_yojson
let select_aggregate_resource_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     max_results =
       (option_of_yojson (value_for_key limit_of_yojson "MaxResults") _list
          path);
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     configuration_aggregator_name =
       (value_for_key configuration_aggregator_name_of_yojson
          "ConfigurationAggregatorName" _list path);
     expression =
       (value_for_key expression_of_yojson "Expression" _list path)
   } : select_aggregate_resource_config_request)
let resource_concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : resource_concurrent_modification_exception)
let put_stored_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_arn =
       (option_of_yojson (value_for_key query_arn_of_yojson "QueryArn") _list
          path)
   } : put_stored_query_response)
let put_stored_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list
          path);
     stored_query =
       (value_for_key stored_query_of_yojson "StoredQuery" _list path)
   } : put_stored_query_request)
let max_number_of_retention_configurations_exceeded_exception_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : max_number_of_retention_configurations_exceeded_exception)
let retention_configuration_name_of_yojson = string_of_yojson
let retention_period_in_days_of_yojson = int_of_yojson
let retention_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retention_period_in_days =
       (value_for_key retention_period_in_days_of_yojson
          "RetentionPeriodInDays" _list path);
     name =
       (value_for_key retention_configuration_name_of_yojson "Name" _list
          path)
   } : retention_configuration)
let put_retention_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retention_configuration =
       (option_of_yojson
          (value_for_key retention_configuration_of_yojson
             "RetentionConfiguration") _list path)
   } : put_retention_configuration_response)
let put_retention_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retention_period_in_days =
       (value_for_key retention_period_in_days_of_yojson
          "RetentionPeriodInDays" _list path)
   } : put_retention_configuration_request)
let no_running_configuration_recorder_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : no_running_configuration_recorder_exception)
let max_active_resources_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : max_active_resources_exceeded_exception)
let resource_type_string_of_yojson = string_of_yojson
let schema_version_id_of_yojson = string_of_yojson
let configuration_of_yojson = string_of_yojson
let put_resource_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tags_of_yojson "Tags") _list path);
     configuration =
       (value_for_key configuration_of_yojson "Configuration" _list path);
     resource_name =
       (option_of_yojson
          (value_for_key resource_name_of_yojson "ResourceName") _list path);
     resource_id =
       (value_for_key resource_id_of_yojson "ResourceId" _list path);
     schema_version_id =
       (value_for_key schema_version_id_of_yojson "SchemaVersionId" _list
          path);
     resource_type =
       (value_for_key resource_type_string_of_yojson "ResourceType" _list
          path)
   } : put_resource_config_request)
let remediation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expiration_time =
       (option_of_yojson (value_for_key date_of_yojson "ExpirationTime")
          _list path);
     message =
       (option_of_yojson
          (value_for_key string_with_char_limit1024_of_yojson "Message")
          _list path);
     resource_id =
       (value_for_key string_with_char_limit1024_of_yojson "ResourceId" _list
          path);
     resource_type =
       (value_for_key string_with_char_limit256_of_yojson "ResourceType"
          _list path);
     config_rule_name =
       (value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path)
   } : remediation_exception)
let remediation_exceptions_of_yojson tree path =
  list_of_yojson remediation_exception_of_yojson tree path
let failed_remediation_exception_batch_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_items =
       (option_of_yojson
          (value_for_key remediation_exceptions_of_yojson "FailedItems")
          _list path);
     failure_message =
       (option_of_yojson (value_for_key string__of_yojson "FailureMessage")
          _list path)
   } : failed_remediation_exception_batch)
let failed_remediation_exception_batches_of_yojson tree path =
  list_of_yojson failed_remediation_exception_batch_of_yojson tree path
let put_remediation_exceptions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_batches =
       (option_of_yojson
          (value_for_key failed_remediation_exception_batches_of_yojson
             "FailedBatches") _list path)
   } : put_remediation_exceptions_response)
let remediation_exception_resource_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id =
       (option_of_yojson
          (value_for_key string_with_char_limit1024_of_yojson "ResourceId")
          _list path);
     resource_type =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "ResourceType")
          _list path)
   } : remediation_exception_resource_key)
let remediation_exception_resource_keys_of_yojson tree path =
  list_of_yojson remediation_exception_resource_key_of_yojson tree path
let put_remediation_exceptions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expiration_time =
       (option_of_yojson (value_for_key date_of_yojson "ExpirationTime")
          _list path);
     message =
       (option_of_yojson
          (value_for_key string_with_char_limit1024_of_yojson "Message")
          _list path);
     resource_keys =
       (value_for_key remediation_exception_resource_keys_of_yojson
          "ResourceKeys" _list path);
     config_rule_name =
       (value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path)
   } : put_remediation_exceptions_request)
let remediation_target_type_of_yojson (tree : t) path =
  (match tree with
   | `String "SSM_DOCUMENT" -> SSM_DOCUMENT
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "RemediationTargetType"
            value)
   | _ -> raise (deserialize_wrong_type_error path "RemediationTargetType") : 
  remediation_target_type)
let resource_value_type_of_yojson (tree : t) path =
  (match tree with
   | `String "RESOURCE_ID" -> RESOURCE_ID
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ResourceValueType" value)
   | _ -> raise (deserialize_wrong_type_error path "ResourceValueType") : 
  resource_value_type)
let resource_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ value = (value_for_key resource_value_type_of_yojson "Value" _list path)
   } : resource_value)
let remediation_parameter_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     static_value =
       (option_of_yojson (value_for_key static_value_of_yojson "StaticValue")
          _list path);
     resource_value =
       (option_of_yojson
          (value_for_key resource_value_of_yojson "ResourceValue") _list path)
   } : remediation_parameter_value)
let remediation_parameters_of_yojson tree path =
  map_of_yojson string_with_char_limit256_of_yojson
    remediation_parameter_value_of_yojson tree path
let boolean__of_yojson = bool_of_yojson
let percentage_of_yojson = int_of_yojson
let ssm_controls_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_percentage =
       (option_of_yojson
          (value_for_key percentage_of_yojson "ErrorPercentage") _list path);
     concurrent_execution_rate_percentage =
       (option_of_yojson
          (value_for_key percentage_of_yojson
             "ConcurrentExecutionRatePercentage") _list path)
   } : ssm_controls)
let execution_controls_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ssm_controls =
       (option_of_yojson (value_for_key ssm_controls_of_yojson "SsmControls")
          _list path)
   } : execution_controls)
let auto_remediation_attempts_of_yojson = int_of_yojson
let auto_remediation_attempt_seconds_of_yojson = long_of_yojson
let remediation_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_by_service =
       (option_of_yojson
          (value_for_key string_with_char_limit1024_of_yojson
             "CreatedByService") _list path);
     arn =
       (option_of_yojson
          (value_for_key string_with_char_limit1024_of_yojson "Arn") _list
          path);
     retry_attempt_seconds =
       (option_of_yojson
          (value_for_key auto_remediation_attempt_seconds_of_yojson
             "RetryAttemptSeconds") _list path);
     maximum_automatic_attempts =
       (option_of_yojson
          (value_for_key auto_remediation_attempts_of_yojson
             "MaximumAutomaticAttempts") _list path);
     execution_controls =
       (option_of_yojson
          (value_for_key execution_controls_of_yojson "ExecutionControls")
          _list path);
     automatic =
       (option_of_yojson (value_for_key boolean__of_yojson "Automatic") _list
          path);
     resource_type =
       (option_of_yojson (value_for_key string__of_yojson "ResourceType")
          _list path);
     parameters =
       (option_of_yojson
          (value_for_key remediation_parameters_of_yojson "Parameters") _list
          path);
     target_version =
       (option_of_yojson (value_for_key string__of_yojson "TargetVersion")
          _list path);
     target_id =
       (value_for_key string_with_char_limit256_of_yojson "TargetId" _list
          path);
     target_type =
       (value_for_key remediation_target_type_of_yojson "TargetType" _list
          path);
     config_rule_name =
       (value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path)
   } : remediation_configuration)
let remediation_configurations_of_yojson tree path =
  list_of_yojson remediation_configuration_of_yojson tree path
let failed_remediation_batch_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_items =
       (option_of_yojson
          (value_for_key remediation_configurations_of_yojson "FailedItems")
          _list path);
     failure_message =
       (option_of_yojson (value_for_key string__of_yojson "FailureMessage")
          _list path)
   } : failed_remediation_batch)
let failed_remediation_batches_of_yojson tree path =
  list_of_yojson failed_remediation_batch_of_yojson tree path
let put_remediation_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_batches =
       (option_of_yojson
          (value_for_key failed_remediation_batches_of_yojson "FailedBatches")
          _list path)
   } : put_remediation_configurations_response)
let put_remediation_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remediation_configurations =
       (value_for_key remediation_configurations_of_yojson
          "RemediationConfigurations" _list path)
   } : put_remediation_configurations_request)
let organization_conformance_pack_template_validation_exception_of_yojson
  tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : organization_conformance_pack_template_validation_exception)
let organization_all_features_not_enabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : organization_all_features_not_enabled_exception)
let organization_access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : organization_access_denied_exception)
let no_available_organization_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : no_available_organization_exception)
let max_number_of_organization_conformance_packs_exceeded_exception_of_yojson
  tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : max_number_of_organization_conformance_packs_exceeded_exception)
let put_organization_conformance_pack_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_conformance_pack_arn =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson
             "OrganizationConformancePackArn") _list path)
   } : put_organization_conformance_pack_response)
let organization_conformance_pack_name_of_yojson = string_of_yojson
let delivery_s3_bucket_of_yojson = string_of_yojson
let delivery_s3_key_prefix_of_yojson = string_of_yojson
let parameter_name_of_yojson = string_of_yojson
let parameter_value_of_yojson = string_of_yojson
let conformance_pack_input_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_value =
       (value_for_key parameter_value_of_yojson "ParameterValue" _list path);
     parameter_name =
       (value_for_key parameter_name_of_yojson "ParameterName" _list path)
   } : conformance_pack_input_parameter)
let conformance_pack_input_parameters_of_yojson tree path =
  list_of_yojson conformance_pack_input_parameter_of_yojson tree path
let excluded_accounts_of_yojson tree path =
  list_of_yojson account_id_of_yojson tree path
let put_organization_conformance_pack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     excluded_accounts =
       (option_of_yojson
          (value_for_key excluded_accounts_of_yojson "ExcludedAccounts")
          _list path);
     conformance_pack_input_parameters =
       (option_of_yojson
          (value_for_key conformance_pack_input_parameters_of_yojson
             "ConformancePackInputParameters") _list path);
     delivery_s3_key_prefix =
       (option_of_yojson
          (value_for_key delivery_s3_key_prefix_of_yojson
             "DeliveryS3KeyPrefix") _list path);
     delivery_s3_bucket =
       (option_of_yojson
          (value_for_key delivery_s3_bucket_of_yojson "DeliveryS3Bucket")
          _list path);
     template_body =
       (option_of_yojson
          (value_for_key template_body_of_yojson "TemplateBody") _list path);
     template_s3_uri =
       (option_of_yojson
          (value_for_key template_s3_uri_of_yojson "TemplateS3Uri") _list
          path);
     organization_conformance_pack_name =
       (value_for_key organization_conformance_pack_name_of_yojson
          "OrganizationConformancePackName" _list path)
   } : put_organization_conformance_pack_request)
let max_number_of_organization_config_rules_exceeded_exception_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : max_number_of_organization_config_rules_exceeded_exception)
let put_organization_config_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_config_rule_arn =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson
             "OrganizationConfigRuleArn") _list path)
   } : put_organization_config_rule_response)
let organization_config_rule_name_of_yojson = string_of_yojson
let maximum_execution_frequency_of_yojson (tree : t) path =
  (match tree with
   | `String "TwentyFour_Hours" -> TwentyFour_Hours
   | `String "Twelve_Hours" -> Twelve_Hours
   | `String "Six_Hours" -> Six_Hours
   | `String "Three_Hours" -> Three_Hours
   | `String "One_Hour" -> One_Hour
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "MaximumExecutionFrequency" value)
   | _ ->
       raise (deserialize_wrong_type_error path "MaximumExecutionFrequency") : 
  maximum_execution_frequency)
let resource_types_scope_of_yojson tree path =
  list_of_yojson string_with_char_limit256_of_yojson tree path
let organization_managed_rule_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_value_scope =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "TagValueScope")
          _list path);
     tag_key_scope =
       (option_of_yojson
          (value_for_key string_with_char_limit128_of_yojson "TagKeyScope")
          _list path);
     resource_id_scope =
       (option_of_yojson
          (value_for_key string_with_char_limit768_of_yojson
             "ResourceIdScope") _list path);
     resource_types_scope =
       (option_of_yojson
          (value_for_key resource_types_scope_of_yojson "ResourceTypesScope")
          _list path);
     maximum_execution_frequency =
       (option_of_yojson
          (value_for_key maximum_execution_frequency_of_yojson
             "MaximumExecutionFrequency") _list path);
     input_parameters =
       (option_of_yojson
          (value_for_key string_with_char_limit2048_of_yojson
             "InputParameters") _list path);
     rule_identifier =
       (value_for_key string_with_char_limit256_of_yojson "RuleIdentifier"
          _list path);
     description =
       (option_of_yojson
          (value_for_key string_with_char_limit256_min0_of_yojson
             "Description") _list path)
   } : organization_managed_rule_metadata)
let organization_config_rule_trigger_type_of_yojson (tree : t) path =
  (match tree with
   | `String "SCHEDULED_NOTIFICATION" -> SCHEDULED_NOTIFICATION
   | `String "OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION" ->
       OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION
   | `String "CONFIGURATION_ITEM_CHANGE_NOTIFICATION" ->
       CONFIGURATION_ITEM_CHANGE_NOTIFICATION
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "OrganizationConfigRuleTriggerType" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path
            "OrganizationConfigRuleTriggerType") : organization_config_rule_trigger_type)
let organization_config_rule_trigger_types_of_yojson tree path =
  list_of_yojson organization_config_rule_trigger_type_of_yojson tree path
let organization_custom_rule_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_value_scope =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "TagValueScope")
          _list path);
     tag_key_scope =
       (option_of_yojson
          (value_for_key string_with_char_limit128_of_yojson "TagKeyScope")
          _list path);
     resource_id_scope =
       (option_of_yojson
          (value_for_key string_with_char_limit768_of_yojson
             "ResourceIdScope") _list path);
     resource_types_scope =
       (option_of_yojson
          (value_for_key resource_types_scope_of_yojson "ResourceTypesScope")
          _list path);
     maximum_execution_frequency =
       (option_of_yojson
          (value_for_key maximum_execution_frequency_of_yojson
             "MaximumExecutionFrequency") _list path);
     input_parameters =
       (option_of_yojson
          (value_for_key string_with_char_limit2048_of_yojson
             "InputParameters") _list path);
     organization_config_rule_trigger_types =
       (value_for_key organization_config_rule_trigger_types_of_yojson
          "OrganizationConfigRuleTriggerTypes" _list path);
     lambda_function_arn =
       (value_for_key string_with_char_limit256_of_yojson "LambdaFunctionArn"
          _list path);
     description =
       (option_of_yojson
          (value_for_key string_with_char_limit256_min0_of_yojson
             "Description") _list path)
   } : organization_custom_rule_metadata)
let organization_config_rule_trigger_type_no_s_n_of_yojson (tree : t) path =
  (match tree with
   | `String "OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION" ->
       OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION
   | `String "CONFIGURATION_ITEM_CHANGE_NOTIFICATION" ->
       CONFIGURATION_ITEM_CHANGE_NOTIFICATION
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "OrganizationConfigRuleTriggerTypeNoSN" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path
            "OrganizationConfigRuleTriggerTypeNoSN") : organization_config_rule_trigger_type_no_s_n)
let organization_config_rule_trigger_type_no_s_ns_of_yojson tree path =
  list_of_yojson organization_config_rule_trigger_type_no_s_n_of_yojson tree
    path
let policy_runtime_of_yojson = string_of_yojson
let policy_text_of_yojson = string_of_yojson
let debug_log_delivery_accounts_of_yojson tree path =
  list_of_yojson account_id_of_yojson tree path
let organization_custom_policy_rule_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     debug_log_delivery_accounts =
       (option_of_yojson
          (value_for_key debug_log_delivery_accounts_of_yojson
             "DebugLogDeliveryAccounts") _list path);
     policy_text =
       (value_for_key policy_text_of_yojson "PolicyText" _list path);
     policy_runtime =
       (value_for_key policy_runtime_of_yojson "PolicyRuntime" _list path);
     tag_value_scope =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "TagValueScope")
          _list path);
     tag_key_scope =
       (option_of_yojson
          (value_for_key string_with_char_limit128_of_yojson "TagKeyScope")
          _list path);
     resource_id_scope =
       (option_of_yojson
          (value_for_key string_with_char_limit768_of_yojson
             "ResourceIdScope") _list path);
     resource_types_scope =
       (option_of_yojson
          (value_for_key resource_types_scope_of_yojson "ResourceTypesScope")
          _list path);
     maximum_execution_frequency =
       (option_of_yojson
          (value_for_key maximum_execution_frequency_of_yojson
             "MaximumExecutionFrequency") _list path);
     input_parameters =
       (option_of_yojson
          (value_for_key string_with_char_limit2048_of_yojson
             "InputParameters") _list path);
     organization_config_rule_trigger_types =
       (option_of_yojson
          (value_for_key
             organization_config_rule_trigger_type_no_s_ns_of_yojson
             "OrganizationConfigRuleTriggerTypes") _list path);
     description =
       (option_of_yojson
          (value_for_key string_with_char_limit256_min0_of_yojson
             "Description") _list path)
   } : organization_custom_policy_rule_metadata)
let put_organization_config_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_custom_policy_rule_metadata =
       (option_of_yojson
          (value_for_key organization_custom_policy_rule_metadata_of_yojson
             "OrganizationCustomPolicyRuleMetadata") _list path);
     excluded_accounts =
       (option_of_yojson
          (value_for_key excluded_accounts_of_yojson "ExcludedAccounts")
          _list path);
     organization_custom_rule_metadata =
       (option_of_yojson
          (value_for_key organization_custom_rule_metadata_of_yojson
             "OrganizationCustomRuleMetadata") _list path);
     organization_managed_rule_metadata =
       (option_of_yojson
          (value_for_key organization_managed_rule_metadata_of_yojson
             "OrganizationManagedRuleMetadata") _list path);
     organization_config_rule_name =
       (value_for_key organization_config_rule_name_of_yojson
          "OrganizationConfigRuleName" _list path)
   } : put_organization_config_rule_request)
let put_external_evaluation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let compliance_type_of_yojson (tree : t) path =
  (match tree with
   | `String "Insufficient_Data" -> Insufficient_Data
   | `String "Not_Applicable" -> Not_Applicable
   | `String "Non_Compliant" -> Non_Compliant
   | `String "Compliant" -> Compliant
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ComplianceType" value)
   | _ -> raise (deserialize_wrong_type_error path "ComplianceType") : 
  compliance_type)
let ordering_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let external_evaluation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ordering_timestamp =
       (value_for_key ordering_timestamp_of_yojson "OrderingTimestamp" _list
          path);
     annotation =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "Annotation")
          _list path);
     compliance_type =
       (value_for_key compliance_type_of_yojson "ComplianceType" _list path);
     compliance_resource_id =
       (value_for_key base_resource_id_of_yojson "ComplianceResourceId" _list
          path);
     compliance_resource_type =
       (value_for_key string_with_char_limit256_of_yojson
          "ComplianceResourceType" _list path)
   } : external_evaluation)
let put_external_evaluation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_evaluation =
       (value_for_key external_evaluation_of_yojson "ExternalEvaluation"
          _list path);
     config_rule_name =
       (value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path)
   } : put_external_evaluation_request)
let invalid_result_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_result_token_exception)
let evaluation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ordering_timestamp =
       (value_for_key ordering_timestamp_of_yojson "OrderingTimestamp" _list
          path);
     annotation =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "Annotation")
          _list path);
     compliance_type =
       (value_for_key compliance_type_of_yojson "ComplianceType" _list path);
     compliance_resource_id =
       (value_for_key base_resource_id_of_yojson "ComplianceResourceId" _list
          path);
     compliance_resource_type =
       (value_for_key string_with_char_limit256_of_yojson
          "ComplianceResourceType" _list path)
   } : evaluation)
let evaluations_of_yojson tree path =
  list_of_yojson evaluation_of_yojson tree path
let put_evaluations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_evaluations =
       (option_of_yojson
          (value_for_key evaluations_of_yojson "FailedEvaluations") _list
          path)
   } : put_evaluations_response)
let put_evaluations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     test_mode =
       (option_of_yojson (value_for_key boolean__of_yojson "TestMode") _list
          path);
     result_token =
       (value_for_key string__of_yojson "ResultToken" _list path);
     evaluations =
       (option_of_yojson (value_for_key evaluations_of_yojson "Evaluations")
          _list path)
   } : put_evaluations_request)
let no_such_bucket_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : no_such_bucket_exception)
let no_available_configuration_recorder_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : no_available_configuration_recorder_exception)
let max_number_of_delivery_channels_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : max_number_of_delivery_channels_exceeded_exception)
let invalid_sns_topic_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_sns_topic_arn_exception)
let invalid_s3_kms_key_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_s3_kms_key_arn_exception)
let invalid_s3_key_prefix_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_s3_key_prefix_exception)
let invalid_delivery_channel_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_delivery_channel_name_exception)
let insufficient_delivery_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : insufficient_delivery_policy_exception)
let channel_name_of_yojson = string_of_yojson
let config_snapshot_delivery_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_frequency =
       (option_of_yojson
          (value_for_key maximum_execution_frequency_of_yojson
             "deliveryFrequency") _list path)
   } : config_snapshot_delivery_properties)
let delivery_channel_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_snapshot_delivery_properties =
       (option_of_yojson
          (value_for_key config_snapshot_delivery_properties_of_yojson
             "configSnapshotDeliveryProperties") _list path);
     sns_topic_ar_n =
       (option_of_yojson (value_for_key string__of_yojson "snsTopicARN")
          _list path);
     s3_kms_key_arn =
       (option_of_yojson (value_for_key string__of_yojson "s3KmsKeyArn")
          _list path);
     s3_key_prefix =
       (option_of_yojson (value_for_key string__of_yojson "s3KeyPrefix")
          _list path);
     s3_bucket_name =
       (option_of_yojson (value_for_key string__of_yojson "s3BucketName")
          _list path);
     name =
       (option_of_yojson (value_for_key channel_name_of_yojson "name") _list
          path)
   } : delivery_channel)
let put_delivery_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_channel =
       (value_for_key delivery_channel_of_yojson "DeliveryChannel" _list path)
   } : put_delivery_channel_request)
let max_number_of_conformance_packs_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : max_number_of_conformance_packs_exceeded_exception)
let conformance_pack_template_validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : conformance_pack_template_validation_exception)
let conformance_pack_arn_of_yojson = string_of_yojson
let put_conformance_pack_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_arn =
       (option_of_yojson
          (value_for_key conformance_pack_arn_of_yojson "ConformancePackArn")
          _list path)
   } : put_conformance_pack_response)
let conformance_pack_name_of_yojson = string_of_yojson
let put_conformance_pack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_ssm_document_details =
       (option_of_yojson
          (value_for_key template_ssm_document_details_of_yojson
             "TemplateSSMDocumentDetails") _list path);
     conformance_pack_input_parameters =
       (option_of_yojson
          (value_for_key conformance_pack_input_parameters_of_yojson
             "ConformancePackInputParameters") _list path);
     delivery_s3_key_prefix =
       (option_of_yojson
          (value_for_key delivery_s3_key_prefix_of_yojson
             "DeliveryS3KeyPrefix") _list path);
     delivery_s3_bucket =
       (option_of_yojson
          (value_for_key delivery_s3_bucket_of_yojson "DeliveryS3Bucket")
          _list path);
     template_body =
       (option_of_yojson
          (value_for_key template_body_of_yojson "TemplateBody") _list path);
     template_s3_uri =
       (option_of_yojson
          (value_for_key template_s3_uri_of_yojson "TemplateS3Uri") _list
          path);
     conformance_pack_name =
       (value_for_key conformance_pack_name_of_yojson "ConformancePackName"
          _list path)
   } : put_conformance_pack_request)
let max_number_of_configuration_recorders_exceeded_exception_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : max_number_of_configuration_recorders_exceeded_exception)
let invalid_role_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_role_exception)
let invalid_recording_group_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_recording_group_exception)
let invalid_configuration_recorder_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_configuration_recorder_name_exception)
let all_supported_of_yojson = bool_of_yojson
let include_global_resource_types_of_yojson = bool_of_yojson
let resource_type_list_of_yojson tree path =
  list_of_yojson resource_type_of_yojson tree path
let exclusion_by_resource_types_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_types =
       (option_of_yojson
          (value_for_key resource_type_list_of_yojson "resourceTypes") _list
          path)
   } : exclusion_by_resource_types)
let recording_strategy_type_of_yojson (tree : t) path =
  (match tree with
   | `String "EXCLUSION_BY_RESOURCE_TYPES" -> EXCLUSION_BY_RESOURCE_TYPES
   | `String "INCLUSION_BY_RESOURCE_TYPES" -> INCLUSION_BY_RESOURCE_TYPES
   | `String "ALL_SUPPORTED_RESOURCE_TYPES" -> ALL_SUPPORTED_RESOURCE_TYPES
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "RecordingStrategyType"
            value)
   | _ -> raise (deserialize_wrong_type_error path "RecordingStrategyType") : 
  recording_strategy_type)
let recording_strategy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     use_only =
       (option_of_yojson
          (value_for_key recording_strategy_type_of_yojson "useOnly") _list
          path)
   } : recording_strategy)
let recording_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recording_strategy =
       (option_of_yojson
          (value_for_key recording_strategy_of_yojson "recordingStrategy")
          _list path);
     exclusion_by_resource_types =
       (option_of_yojson
          (value_for_key exclusion_by_resource_types_of_yojson
             "exclusionByResourceTypes") _list path);
     resource_types =
       (option_of_yojson
          (value_for_key resource_type_list_of_yojson "resourceTypes") _list
          path);
     include_global_resource_types =
       (option_of_yojson
          (value_for_key include_global_resource_types_of_yojson
             "includeGlobalResourceTypes") _list path);
     all_supported =
       (option_of_yojson
          (value_for_key all_supported_of_yojson "allSupported") _list path)
   } : recording_group)
let recording_frequency_of_yojson (tree : t) path =
  (match tree with
   | `String "DAILY" -> DAILY
   | `String "CONTINUOUS" -> CONTINUOUS
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "RecordingFrequency"
            value)
   | _ -> raise (deserialize_wrong_type_error path "RecordingFrequency") : 
  recording_frequency)
let description_of_yojson = string_of_yojson
let recording_mode_resource_types_list_of_yojson tree path =
  list_of_yojson resource_type_of_yojson tree path
let recording_mode_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recording_frequency =
       (value_for_key recording_frequency_of_yojson "recordingFrequency"
          _list path);
     resource_types =
       (value_for_key recording_mode_resource_types_list_of_yojson
          "resourceTypes" _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "description")
          _list path)
   } : recording_mode_override)
let recording_mode_overrides_of_yojson tree path =
  list_of_yojson recording_mode_override_of_yojson tree path
let recording_mode_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recording_mode_overrides =
       (option_of_yojson
          (value_for_key recording_mode_overrides_of_yojson
             "recordingModeOverrides") _list path);
     recording_frequency =
       (value_for_key recording_frequency_of_yojson "recordingFrequency"
          _list path)
   } : recording_mode)
let configuration_recorder_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recording_mode =
       (option_of_yojson
          (value_for_key recording_mode_of_yojson "recordingMode") _list path);
     recording_group =
       (option_of_yojson
          (value_for_key recording_group_of_yojson "recordingGroup") _list
          path);
     role_ar_n =
       (option_of_yojson (value_for_key string__of_yojson "roleARN") _list
          path);
     name =
       (option_of_yojson (value_for_key recorder_name_of_yojson "name") _list
          path)
   } : configuration_recorder)
let put_configuration_recorder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder =
       (value_for_key configuration_recorder_of_yojson
          "ConfigurationRecorder" _list path)
   } : put_configuration_recorder_request)
let configuration_aggregator_arn_of_yojson = string_of_yojson
let account_aggregation_source_account_list_of_yojson tree path =
  list_of_yojson account_id_of_yojson tree path
let aggregator_region_list_of_yojson tree path =
  list_of_yojson string__of_yojson tree path
let account_aggregation_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_regions =
       (option_of_yojson
          (value_for_key aggregator_region_list_of_yojson "AwsRegions") _list
          path);
     all_aws_regions =
       (option_of_yojson (value_for_key boolean__of_yojson "AllAwsRegions")
          _list path);
     account_ids =
       (value_for_key account_aggregation_source_account_list_of_yojson
          "AccountIds" _list path)
   } : account_aggregation_source)
let account_aggregation_source_list_of_yojson tree path =
  list_of_yojson account_aggregation_source_of_yojson tree path
let organization_aggregation_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     all_aws_regions =
       (option_of_yojson (value_for_key boolean__of_yojson "AllAwsRegions")
          _list path);
     aws_regions =
       (option_of_yojson
          (value_for_key aggregator_region_list_of_yojson "AwsRegions") _list
          path);
     role_arn = (value_for_key string__of_yojson "RoleArn" _list path)
   } : organization_aggregation_source)
let configuration_aggregator_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_by =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "CreatedBy")
          _list path);
     last_updated_time =
       (option_of_yojson (value_for_key date_of_yojson "LastUpdatedTime")
          _list path);
     creation_time =
       (option_of_yojson (value_for_key date_of_yojson "CreationTime") _list
          path);
     organization_aggregation_source =
       (option_of_yojson
          (value_for_key organization_aggregation_source_of_yojson
             "OrganizationAggregationSource") _list path);
     account_aggregation_sources =
       (option_of_yojson
          (value_for_key account_aggregation_source_list_of_yojson
             "AccountAggregationSources") _list path);
     configuration_aggregator_arn =
       (option_of_yojson
          (value_for_key configuration_aggregator_arn_of_yojson
             "ConfigurationAggregatorArn") _list path);
     configuration_aggregator_name =
       (option_of_yojson
          (value_for_key configuration_aggregator_name_of_yojson
             "ConfigurationAggregatorName") _list path)
   } : configuration_aggregator)
let put_configuration_aggregator_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator =
       (option_of_yojson
          (value_for_key configuration_aggregator_of_yojson
             "ConfigurationAggregator") _list path)
   } : put_configuration_aggregator_response)
let put_configuration_aggregator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list
          path);
     organization_aggregation_source =
       (option_of_yojson
          (value_for_key organization_aggregation_source_of_yojson
             "OrganizationAggregationSource") _list path);
     account_aggregation_sources =
       (option_of_yojson
          (value_for_key account_aggregation_source_list_of_yojson
             "AccountAggregationSources") _list path);
     configuration_aggregator_name =
       (value_for_key configuration_aggregator_name_of_yojson
          "ConfigurationAggregatorName" _list path)
   } : put_configuration_aggregator_request)
let max_number_of_config_rules_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : max_number_of_config_rules_exceeded_exception)
let emptiable_string_with_char_limit256_of_yojson = string_of_yojson
let compliance_resource_types_of_yojson tree path =
  list_of_yojson string_with_char_limit256_of_yojson tree path
let scope_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_resource_id =
       (option_of_yojson
          (value_for_key base_resource_id_of_yojson "ComplianceResourceId")
          _list path);
     tag_value =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "TagValue")
          _list path);
     tag_key =
       (option_of_yojson
          (value_for_key string_with_char_limit128_of_yojson "TagKey") _list
          path);
     compliance_resource_types =
       (option_of_yojson
          (value_for_key compliance_resource_types_of_yojson
             "ComplianceResourceTypes") _list path)
   } : scope)
let owner_of_yojson (tree : t) path =
  (match tree with
   | `String "Custom_Policy" -> Custom_Policy
   | `String "Aws" -> Aws
   | `String "Custom_Lambda" -> Custom_Lambda
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "Owner" value)
   | _ -> raise (deserialize_wrong_type_error path "Owner") : owner)
let event_source_of_yojson (tree : t) path =
  (match tree with
   | `String "Aws_Config" -> Aws_Config
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "EventSource" value)
   | _ -> raise (deserialize_wrong_type_error path "EventSource") : event_source)
let message_type_of_yojson (tree : t) path =
  (match tree with
   | `String "OversizedConfigurationItemChangeNotification" ->
       OversizedConfigurationItemChangeNotification
   | `String "ScheduledNotification" -> ScheduledNotification
   | `String "ConfigurationSnapshotDeliveryCompleted" ->
       ConfigurationSnapshotDeliveryCompleted
   | `String "ConfigurationItemChangeNotification" ->
       ConfigurationItemChangeNotification
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "MessageType" value)
   | _ -> raise (deserialize_wrong_type_error path "MessageType") : message_type)
let source_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     maximum_execution_frequency =
       (option_of_yojson
          (value_for_key maximum_execution_frequency_of_yojson
             "MaximumExecutionFrequency") _list path);
     message_type =
       (option_of_yojson (value_for_key message_type_of_yojson "MessageType")
          _list path);
     event_source =
       (option_of_yojson (value_for_key event_source_of_yojson "EventSource")
          _list path)
   } : source_detail)
let source_details_of_yojson tree path =
  list_of_yojson source_detail_of_yojson tree path
let custom_policy_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_debug_log_delivery =
       (option_of_yojson
          (value_for_key boolean__of_yojson "EnableDebugLogDelivery") _list
          path);
     policy_text =
       (value_for_key policy_text_of_yojson "PolicyText" _list path);
     policy_runtime =
       (value_for_key policy_runtime_of_yojson "PolicyRuntime" _list path)
   } : custom_policy_details)
let source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_policy_details =
       (option_of_yojson
          (value_for_key custom_policy_details_of_yojson
             "CustomPolicyDetails") _list path);
     source_details =
       (option_of_yojson
          (value_for_key source_details_of_yojson "SourceDetails") _list path);
     source_identifier =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson
             "SourceIdentifier") _list path);
     owner = (value_for_key owner_of_yojson "Owner" _list path)
   } : source)
let config_rule_state_of_yojson (tree : t) path =
  (match tree with
   | `String "EVALUATING" -> EVALUATING
   | `String "DELETING_RESULTS" -> DELETING_RESULTS
   | `String "DELETING" -> DELETING
   | `String "ACTIVE" -> ACTIVE
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ConfigRuleState" value)
   | _ -> raise (deserialize_wrong_type_error path "ConfigRuleState") : 
  config_rule_state)
let evaluation_mode_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mode =
       (option_of_yojson (value_for_key evaluation_mode_of_yojson "Mode")
          _list path)
   } : evaluation_mode_configuration)
let evaluation_modes_of_yojson tree path =
  list_of_yojson evaluation_mode_configuration_of_yojson tree path
let config_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_modes =
       (option_of_yojson
          (value_for_key evaluation_modes_of_yojson "EvaluationModes") _list
          path);
     created_by =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "CreatedBy")
          _list path);
     config_rule_state =
       (option_of_yojson
          (value_for_key config_rule_state_of_yojson "ConfigRuleState") _list
          path);
     maximum_execution_frequency =
       (option_of_yojson
          (value_for_key maximum_execution_frequency_of_yojson
             "MaximumExecutionFrequency") _list path);
     input_parameters =
       (option_of_yojson
          (value_for_key string_with_char_limit1024_of_yojson
             "InputParameters") _list path);
     source = (value_for_key source_of_yojson "Source" _list path);
     scope =
       (option_of_yojson (value_for_key scope_of_yojson "Scope") _list path);
     description =
       (option_of_yojson
          (value_for_key emptiable_string_with_char_limit256_of_yojson
             "Description") _list path);
     config_rule_id =
       (option_of_yojson
          (value_for_key string_with_char_limit64_of_yojson "ConfigRuleId")
          _list path);
     config_rule_arn =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "ConfigRuleArn")
          _list path);
     config_rule_name =
       (option_of_yojson
          (value_for_key config_rule_name_of_yojson "ConfigRuleName") _list
          path)
   } : config_rule)
let put_config_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list
          path);
     config_rule =
       (value_for_key config_rule_of_yojson "ConfigRule" _list path)
   } : put_config_rule_request)
let aggregation_authorization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time =
       (option_of_yojson (value_for_key date_of_yojson "CreationTime") _list
          path);
     authorized_aws_region =
       (option_of_yojson
          (value_for_key aws_region_of_yojson "AuthorizedAwsRegion") _list
          path);
     authorized_account_id =
       (option_of_yojson
          (value_for_key account_id_of_yojson "AuthorizedAccountId") _list
          path);
     aggregation_authorization_arn =
       (option_of_yojson
          (value_for_key string__of_yojson "AggregationAuthorizationArn")
          _list path)
   } : aggregation_authorization)
let put_aggregation_authorization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregation_authorization =
       (option_of_yojson
          (value_for_key aggregation_authorization_of_yojson
             "AggregationAuthorization") _list path)
   } : put_aggregation_authorization_response)
let put_aggregation_authorization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list
          path);
     authorized_aws_region =
       (value_for_key aws_region_of_yojson "AuthorizedAwsRegion" _list path);
     authorized_account_id =
       (value_for_key account_id_of_yojson "AuthorizedAccountId" _list path)
   } : put_aggregation_authorization_request)
let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path)
   } : list_tags_for_resource_response)
let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     resource_arn =
       (value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path)
   } : list_tags_for_resource_request)
let list_stored_queries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     stored_query_metadata =
       (option_of_yojson
          (value_for_key stored_query_metadata_list_of_yojson
             "StoredQueryMetadata") _list path)
   } : list_stored_queries_response)
let list_stored_queries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key limit_of_yojson "MaxResults") _list
          path);
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path)
   } : list_stored_queries_request)
let invalid_time_range_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_time_range_exception)
let resource_evaluation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_start_timestamp =
       (option_of_yojson
          (value_for_key date_of_yojson "EvaluationStartTimestamp") _list
          path);
     evaluation_mode =
       (option_of_yojson
          (value_for_key evaluation_mode_of_yojson "EvaluationMode") _list
          path);
     resource_evaluation_id =
       (option_of_yojson
          (value_for_key resource_evaluation_id_of_yojson
             "ResourceEvaluationId") _list path)
   } : resource_evaluation)
let resource_evaluations_of_yojson tree path =
  list_of_yojson resource_evaluation_of_yojson tree path
let list_resource_evaluations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     resource_evaluations =
       (option_of_yojson
          (value_for_key resource_evaluations_of_yojson "ResourceEvaluations")
          _list path)
   } : list_resource_evaluations_response)
let resource_evaluation_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_context_identifier =
       (option_of_yojson
          (value_for_key evaluation_context_identifier_of_yojson
             "EvaluationContextIdentifier") _list path);
     time_window =
       (option_of_yojson (value_for_key time_window_of_yojson "TimeWindow")
          _list path);
     evaluation_mode =
       (option_of_yojson
          (value_for_key evaluation_mode_of_yojson "EvaluationMode") _list
          path)
   } : resource_evaluation_filters)
let list_resource_evaluations_page_item_limit_of_yojson = int_of_yojson
let list_resource_evaluations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     limit =
       (option_of_yojson
          (value_for_key list_resource_evaluations_page_item_limit_of_yojson
             "Limit") _list path);
     filters =
       (option_of_yojson
          (value_for_key resource_evaluation_filters_of_yojson "Filters")
          _list path)
   } : list_resource_evaluations_request)
let resource_deletion_time_of_yojson = timestamp_epoch_seconds_of_yojson
let resource_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_deletion_time =
       (option_of_yojson
          (value_for_key resource_deletion_time_of_yojson
             "resourceDeletionTime") _list path);
     resource_name =
       (option_of_yojson
          (value_for_key resource_name_of_yojson "resourceName") _list path);
     resource_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "resourceId")
          _list path);
     resource_type =
       (option_of_yojson
          (value_for_key resource_type_of_yojson "resourceType") _list path)
   } : resource_identifier)
let resource_identifier_list_of_yojson tree path =
  list_of_yojson resource_identifier_of_yojson tree path
let list_discovered_resources_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "nextToken")
          _list path);
     resource_identifiers =
       (option_of_yojson
          (value_for_key resource_identifier_list_of_yojson
             "resourceIdentifiers") _list path)
   } : list_discovered_resources_response)
let resource_id_list_of_yojson tree path =
  list_of_yojson resource_id_of_yojson tree path
let list_discovered_resources_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "nextToken")
          _list path);
     include_deleted_resources =
       (option_of_yojson
          (value_for_key boolean__of_yojson "includeDeletedResources") _list
          path);
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "limit") _list path);
     resource_name =
       (option_of_yojson
          (value_for_key resource_name_of_yojson "resourceName") _list path);
     resource_ids =
       (option_of_yojson
          (value_for_key resource_id_list_of_yojson "resourceIds") _list path);
     resource_type =
       (value_for_key resource_type_of_yojson "resourceType" _list path)
   } : list_discovered_resources_request)
let compliance_score_of_yojson = string_of_yojson
let last_updated_time_of_yojson = timestamp_epoch_seconds_of_yojson
let conformance_pack_compliance_score_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       (option_of_yojson
          (value_for_key last_updated_time_of_yojson "LastUpdatedTime") _list
          path);
     conformance_pack_name =
       (option_of_yojson
          (value_for_key conformance_pack_name_of_yojson
             "ConformancePackName") _list path);
     score =
       (option_of_yojson (value_for_key compliance_score_of_yojson "Score")
          _list path)
   } : conformance_pack_compliance_score)
let conformance_pack_compliance_scores_of_yojson tree path =
  list_of_yojson conformance_pack_compliance_score_of_yojson tree path
let list_conformance_pack_compliance_scores_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_compliance_scores =
       (value_for_key conformance_pack_compliance_scores_of_yojson
          "ConformancePackComplianceScores" _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path)
   } : list_conformance_pack_compliance_scores_response)
let conformance_pack_name_filter_of_yojson tree path =
  list_of_yojson conformance_pack_name_of_yojson tree path
let conformance_pack_compliance_scores_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_names =
       (value_for_key conformance_pack_name_filter_of_yojson
          "ConformancePackNames" _list path)
   } : conformance_pack_compliance_scores_filters)
let sort_order_of_yojson (tree : t) path =
  (match tree with
   | `String "DESCENDING" -> DESCENDING
   | `String "ASCENDING" -> ASCENDING
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "SortOrder" value)
   | _ -> raise (deserialize_wrong_type_error path "SortOrder") : sort_order)
let sort_by_of_yojson (tree : t) path =
  (match tree with
   | `String "SCORE" -> SCORE
   | `String value ->
       raise (deserialize_unknown_enum_value_error path "SortBy" value)
   | _ -> raise (deserialize_wrong_type_error path "SortBy") : sort_by)
let page_size_limit_of_yojson = int_of_yojson
let list_conformance_pack_compliance_scores_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key page_size_limit_of_yojson "Limit")
          _list path);
     sort_by =
       (option_of_yojson (value_for_key sort_by_of_yojson "SortBy") _list
          path);
     sort_order =
       (option_of_yojson (value_for_key sort_order_of_yojson "SortOrder")
          _list path);
     filters =
       (option_of_yojson
          (value_for_key conformance_pack_compliance_scores_filters_of_yojson
             "Filters") _list path)
   } : list_conformance_pack_compliance_scores_request)
let discovered_resource_identifier_list_of_yojson tree path =
  list_of_yojson aggregate_resource_identifier_of_yojson tree path
let list_aggregate_discovered_resources_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     resource_identifiers =
       (option_of_yojson
          (value_for_key discovered_resource_identifier_list_of_yojson
             "ResourceIdentifiers") _list path)
   } : list_aggregate_discovered_resources_response)
let resource_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region =
       (option_of_yojson (value_for_key aws_region_of_yojson "Region") _list
          path);
     resource_name =
       (option_of_yojson
          (value_for_key resource_name_of_yojson "ResourceName") _list path);
     resource_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "ResourceId")
          _list path);
     account_id =
       (option_of_yojson (value_for_key account_id_of_yojson "AccountId")
          _list path)
   } : resource_filters)
let list_aggregate_discovered_resources_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     filters =
       (option_of_yojson (value_for_key resource_filters_of_yojson "Filters")
          _list path);
     resource_type =
       (value_for_key resource_type_of_yojson "ResourceType" _list path);
     configuration_aggregator_name =
       (value_for_key configuration_aggregator_name_of_yojson
          "ConfigurationAggregatorName" _list path)
   } : list_aggregate_discovered_resources_request)
let get_stored_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stored_query =
       (option_of_yojson (value_for_key stored_query_of_yojson "StoredQuery")
          _list path)
   } : get_stored_query_response)
let get_stored_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ query_name = (value_for_key query_name_of_yojson "QueryName" _list path)
   } : get_stored_query_request)
let resource_evaluation_status_of_yojson (tree : t) path =
  (match tree with
   | `String "SUCCEEDED" -> SUCCEEDED
   | `String "FAILED" -> FAILED
   | `String "IN_PROGRESS" -> IN_PROGRESS
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "ResourceEvaluationStatus" value)
   | _ ->
       raise (deserialize_wrong_type_error path "ResourceEvaluationStatus") : 
  resource_evaluation_status)
let evaluation_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_reason =
       (option_of_yojson
          (value_for_key string_with_char_limit1024_of_yojson "FailureReason")
          _list path);
     status =
       (value_for_key resource_evaluation_status_of_yojson "Status" _list
          path)
   } : evaluation_status)
let get_resource_evaluation_summary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_details =
       (option_of_yojson
          (value_for_key resource_details_of_yojson "ResourceDetails") _list
          path);
     evaluation_context =
       (option_of_yojson
          (value_for_key evaluation_context_of_yojson "EvaluationContext")
          _list path);
     compliance =
       (option_of_yojson
          (value_for_key compliance_type_of_yojson "Compliance") _list path);
     evaluation_start_timestamp =
       (option_of_yojson
          (value_for_key date_of_yojson "EvaluationStartTimestamp") _list
          path);
     evaluation_status =
       (option_of_yojson
          (value_for_key evaluation_status_of_yojson "EvaluationStatus")
          _list path);
     evaluation_mode =
       (option_of_yojson
          (value_for_key evaluation_mode_of_yojson "EvaluationMode") _list
          path);
     resource_evaluation_id =
       (option_of_yojson
          (value_for_key resource_evaluation_id_of_yojson
             "ResourceEvaluationId") _list path)
   } : get_resource_evaluation_summary_response)
let get_resource_evaluation_summary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_evaluation_id =
       (value_for_key resource_evaluation_id_of_yojson "ResourceEvaluationId"
          _list path)
   } : get_resource_evaluation_summary_request)
let resource_not_discovered_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : resource_not_discovered_exception)
let configuration_item_capture_time_of_yojson =
  timestamp_epoch_seconds_of_yojson
let configuration_item_status_of_yojson (tree : t) path =
  (match tree with
   | `String "ResourceDeletedNotRecorded" -> ResourceDeletedNotRecorded
   | `String "ResourceDeleted" -> ResourceDeleted
   | `String "ResourceNotRecorded" -> ResourceNotRecorded
   | `String "ResourceDiscovered" -> ResourceDiscovered
   | `String "OK" -> OK
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ConfigurationItemStatus"
            value)
   | _ -> raise (deserialize_wrong_type_error path "ConfigurationItemStatus") : 
  configuration_item_status)
let configuration_state_id_of_yojson = string_of_yojson
let configuration_item_md5_hash_of_yojson = string_of_yojson
let ar_n_of_yojson = string_of_yojson
let availability_zone_of_yojson = string_of_yojson
let resource_creation_time_of_yojson = timestamp_epoch_seconds_of_yojson
let related_event_of_yojson = string_of_yojson
let related_event_list_of_yojson tree path =
  list_of_yojson related_event_of_yojson tree path
let relationship_name_of_yojson = string_of_yojson
let relationship_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relationship_name =
       (option_of_yojson
          (value_for_key relationship_name_of_yojson "relationshipName")
          _list path);
     resource_name =
       (option_of_yojson
          (value_for_key resource_name_of_yojson "resourceName") _list path);
     resource_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "resourceId")
          _list path);
     resource_type =
       (option_of_yojson
          (value_for_key resource_type_of_yojson "resourceType") _list path)
   } : relationship)
let relationship_list_of_yojson tree path =
  list_of_yojson relationship_of_yojson tree path
let configuration_item_delivery_time_of_yojson =
  timestamp_epoch_seconds_of_yojson
let configuration_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_item_delivery_time =
       (option_of_yojson
          (value_for_key configuration_item_delivery_time_of_yojson
             "configurationItemDeliveryTime") _list path);
     recording_frequency =
       (option_of_yojson
          (value_for_key recording_frequency_of_yojson "recordingFrequency")
          _list path);
     supplementary_configuration =
       (option_of_yojson
          (value_for_key supplementary_configuration_of_yojson
             "supplementaryConfiguration") _list path);
     configuration =
       (option_of_yojson
          (value_for_key configuration_of_yojson "configuration") _list path);
     relationships =
       (option_of_yojson
          (value_for_key relationship_list_of_yojson "relationships") _list
          path);
     related_events =
       (option_of_yojson
          (value_for_key related_event_list_of_yojson "relatedEvents") _list
          path);
     tags =
       (option_of_yojson (value_for_key tags_of_yojson "tags") _list path);
     resource_creation_time =
       (option_of_yojson
          (value_for_key resource_creation_time_of_yojson
             "resourceCreationTime") _list path);
     availability_zone =
       (option_of_yojson
          (value_for_key availability_zone_of_yojson "availabilityZone")
          _list path);
     aws_region =
       (option_of_yojson (value_for_key aws_region_of_yojson "awsRegion")
          _list path);
     resource_name =
       (option_of_yojson
          (value_for_key resource_name_of_yojson "resourceName") _list path);
     resource_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "resourceId")
          _list path);
     resource_type =
       (option_of_yojson
          (value_for_key resource_type_of_yojson "resourceType") _list path);
     arn = (option_of_yojson (value_for_key ar_n_of_yojson "arn") _list path);
     configuration_item_md5_hash =
       (option_of_yojson
          (value_for_key configuration_item_md5_hash_of_yojson
             "configurationItemMD5Hash") _list path);
     configuration_state_id =
       (option_of_yojson
          (value_for_key configuration_state_id_of_yojson
             "configurationStateId") _list path);
     configuration_item_status =
       (option_of_yojson
          (value_for_key configuration_item_status_of_yojson
             "configurationItemStatus") _list path);
     configuration_item_capture_time =
       (option_of_yojson
          (value_for_key configuration_item_capture_time_of_yojson
             "configurationItemCaptureTime") _list path);
     account_id =
       (option_of_yojson (value_for_key account_id_of_yojson "accountId")
          _list path);
     version =
       (option_of_yojson (value_for_key version_of_yojson "version") _list
          path)
   } : configuration_item)
let configuration_item_list_of_yojson tree path =
  list_of_yojson configuration_item_of_yojson tree path
let get_resource_config_history_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "nextToken")
          _list path);
     configuration_items =
       (option_of_yojson
          (value_for_key configuration_item_list_of_yojson
             "configurationItems") _list path)
   } : get_resource_config_history_response)
let later_time_of_yojson = timestamp_epoch_seconds_of_yojson
let earlier_time_of_yojson = timestamp_epoch_seconds_of_yojson
let chronological_order_of_yojson (tree : t) path =
  (match tree with
   | `String "Forward" -> Forward
   | `String "Reverse" -> Reverse
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ChronologicalOrder"
            value)
   | _ -> raise (deserialize_wrong_type_error path "ChronologicalOrder") : 
  chronological_order)
let get_resource_config_history_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "nextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "limit") _list path);
     chronological_order =
       (option_of_yojson
          (value_for_key chronological_order_of_yojson "chronologicalOrder")
          _list path);
     earlier_time =
       (option_of_yojson (value_for_key earlier_time_of_yojson "earlierTime")
          _list path);
     later_time =
       (option_of_yojson (value_for_key later_time_of_yojson "laterTime")
          _list path);
     resource_id =
       (value_for_key resource_id_of_yojson "resourceId" _list path);
     resource_type =
       (value_for_key resource_type_of_yojson "resourceType" _list path)
   } : get_resource_config_history_request)
let no_such_organization_config_rule_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : no_such_organization_config_rule_exception)
let get_organization_custom_rule_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_text =
       (option_of_yojson (value_for_key policy_text_of_yojson "PolicyText")
          _list path)
   } : get_organization_custom_rule_policy_response)
let get_organization_custom_rule_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_config_rule_name =
       (value_for_key organization_config_rule_name_of_yojson
          "OrganizationConfigRuleName" _list path)
   } : get_organization_custom_rule_policy_request)
let no_such_organization_conformance_pack_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : no_such_organization_conformance_pack_exception)
let organization_resource_detailed_status_of_yojson (tree : t) path =
  (match tree with
   | `String "UPDATE_FAILED" -> UPDATE_FAILED
   | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
   | `String "UPDATE_SUCCESSFUL" -> UPDATE_SUCCESSFUL
   | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
   | `String "DELETE_FAILED" -> DELETE_FAILED
   | `String "DELETE_SUCCESSFUL" -> DELETE_SUCCESSFUL
   | `String "CREATE_FAILED" -> CREATE_FAILED
   | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
   | `String "CREATE_SUCCESSFUL" -> CREATE_SUCCESSFUL
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "OrganizationResourceDetailedStatus" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path
            "OrganizationResourceDetailedStatus") : organization_resource_detailed_status)
let organization_conformance_pack_detailed_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_update_time =
       (option_of_yojson (value_for_key date_of_yojson "LastUpdateTime")
          _list path);
     error_message =
       (option_of_yojson (value_for_key string__of_yojson "ErrorMessage")
          _list path);
     error_code =
       (option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list
          path);
     status =
       (value_for_key organization_resource_detailed_status_of_yojson
          "Status" _list path);
     conformance_pack_name =
       (value_for_key string_with_char_limit256_of_yojson
          "ConformancePackName" _list path);
     account_id = (value_for_key account_id_of_yojson "AccountId" _list path)
   } : organization_conformance_pack_detailed_status)
let organization_conformance_pack_detailed_statuses_of_yojson tree path =
  list_of_yojson organization_conformance_pack_detailed_status_of_yojson tree
    path
let get_organization_conformance_pack_detailed_status_response_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     organization_conformance_pack_detailed_statuses =
       (option_of_yojson
          (value_for_key
             organization_conformance_pack_detailed_statuses_of_yojson
             "OrganizationConformancePackDetailedStatuses") _list path)
   } : get_organization_conformance_pack_detailed_status_response)
let organization_resource_detailed_status_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       (option_of_yojson
          (value_for_key organization_resource_detailed_status_of_yojson
             "Status") _list path);
     account_id =
       (option_of_yojson (value_for_key account_id_of_yojson "AccountId")
          _list path)
   } : organization_resource_detailed_status_filters)
let cosmos_page_limit_of_yojson = int_of_yojson
let get_organization_conformance_pack_detailed_status_request_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     limit =
       (option_of_yojson (value_for_key cosmos_page_limit_of_yojson "Limit")
          _list path);
     filters =
       (option_of_yojson
          (value_for_key
             organization_resource_detailed_status_filters_of_yojson
             "Filters") _list path);
     organization_conformance_pack_name =
       (value_for_key organization_conformance_pack_name_of_yojson
          "OrganizationConformancePackName" _list path)
   } : get_organization_conformance_pack_detailed_status_request)
let member_account_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_update_time =
       (option_of_yojson (value_for_key date_of_yojson "LastUpdateTime")
          _list path);
     error_message =
       (option_of_yojson (value_for_key string__of_yojson "ErrorMessage")
          _list path);
     error_code =
       (option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list
          path);
     member_account_rule_status =
       (value_for_key member_account_rule_status_of_yojson
          "MemberAccountRuleStatus" _list path);
     config_rule_name =
       (value_for_key string_with_char_limit64_of_yojson "ConfigRuleName"
          _list path);
     account_id = (value_for_key account_id_of_yojson "AccountId" _list path)
   } : member_account_status)
let organization_config_rule_detailed_status_of_yojson tree path =
  list_of_yojson member_account_status_of_yojson tree path
let get_organization_config_rule_detailed_status_response_of_yojson tree path
  =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     organization_config_rule_detailed_status =
       (option_of_yojson
          (value_for_key organization_config_rule_detailed_status_of_yojson
             "OrganizationConfigRuleDetailedStatus") _list path)
   } : get_organization_config_rule_detailed_status_response)
let get_organization_config_rule_detailed_status_request_of_yojson tree path
  =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     limit =
       (option_of_yojson (value_for_key cosmos_page_limit_of_yojson "Limit")
          _list path);
     filters =
       (option_of_yojson
          (value_for_key status_detail_filters_of_yojson "Filters") _list
          path);
     organization_config_rule_name =
       (value_for_key organization_config_rule_name_of_yojson
          "OrganizationConfigRuleName" _list path)
   } : get_organization_config_rule_detailed_status_request)
let long_of_yojson = long_of_yojson
let resource_count_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     count =
       (option_of_yojson (value_for_key long_of_yojson "count") _list path);
     resource_type =
       (option_of_yojson
          (value_for_key resource_type_of_yojson "resourceType") _list path)
   } : resource_count)
let resource_counts_of_yojson tree path =
  list_of_yojson resource_count_of_yojson tree path
let get_discovered_resource_counts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "nextToken")
          _list path);
     resource_counts =
       (option_of_yojson
          (value_for_key resource_counts_of_yojson "resourceCounts") _list
          path);
     total_discovered_resources =
       (option_of_yojson
          (value_for_key long_of_yojson "totalDiscoveredResources") _list
          path)
   } : get_discovered_resource_counts_response)
let resource_types_of_yojson tree path =
  list_of_yojson string_with_char_limit256_of_yojson tree path
let get_discovered_resource_counts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "nextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "limit") _list path);
     resource_types =
       (option_of_yojson
          (value_for_key resource_types_of_yojson "resourceTypes") _list path)
   } : get_discovered_resource_counts_request)
let get_custom_rule_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_text =
       (option_of_yojson (value_for_key policy_text_of_yojson "PolicyText")
          _list path)
   } : get_custom_rule_policy_response)
let get_custom_rule_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name =
       (option_of_yojson
          (value_for_key config_rule_name_of_yojson "ConfigRuleName") _list
          path)
   } : get_custom_rule_policy_request)
let no_such_conformance_pack_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : no_such_conformance_pack_exception)
let conformance_pack_compliance_type_of_yojson (tree : t) path =
  (match tree with
   | `String "INSUFFICIENT_DATA" -> INSUFFICIENT_DATA
   | `String "NON_COMPLIANT" -> NON_COMPLIANT
   | `String "COMPLIANT" -> COMPLIANT
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "ConformancePackComplianceType" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path "ConformancePackComplianceType") : 
  conformance_pack_compliance_type)
let conformance_pack_compliance_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_compliance_status =
       (value_for_key conformance_pack_compliance_type_of_yojson
          "ConformancePackComplianceStatus" _list path);
     conformance_pack_name =
       (value_for_key conformance_pack_name_of_yojson "ConformancePackName"
          _list path)
   } : conformance_pack_compliance_summary)
let conformance_pack_compliance_summary_list_of_yojson tree path =
  list_of_yojson conformance_pack_compliance_summary_of_yojson tree path
let get_conformance_pack_compliance_summary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     conformance_pack_compliance_summary_list =
       (option_of_yojson
          (value_for_key conformance_pack_compliance_summary_list_of_yojson
             "ConformancePackComplianceSummaryList") _list path)
   } : get_conformance_pack_compliance_summary_response)
let conformance_pack_names_to_summarize_list_of_yojson tree path =
  list_of_yojson conformance_pack_name_of_yojson tree path
let get_conformance_pack_compliance_summary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key page_size_limit_of_yojson "Limit")
          _list path);
     conformance_pack_names =
       (value_for_key conformance_pack_names_to_summarize_list_of_yojson
          "ConformancePackNames" _list path)
   } : get_conformance_pack_compliance_summary_request)
let no_such_config_rule_in_conformance_pack_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : no_such_config_rule_in_conformance_pack_exception)
let evaluation_result_qualifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_mode =
       (option_of_yojson
          (value_for_key evaluation_mode_of_yojson "EvaluationMode") _list
          path);
     resource_id =
       (option_of_yojson
          (value_for_key base_resource_id_of_yojson "ResourceId") _list path);
     resource_type =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "ResourceType")
          _list path);
     config_rule_name =
       (option_of_yojson
          (value_for_key config_rule_name_of_yojson "ConfigRuleName") _list
          path)
   } : evaluation_result_qualifier)
let evaluation_result_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_evaluation_id =
       (option_of_yojson
          (value_for_key resource_evaluation_id_of_yojson
             "ResourceEvaluationId") _list path);
     ordering_timestamp =
       (option_of_yojson (value_for_key date_of_yojson "OrderingTimestamp")
          _list path);
     evaluation_result_qualifier =
       (option_of_yojson
          (value_for_key evaluation_result_qualifier_of_yojson
             "EvaluationResultQualifier") _list path)
   } : evaluation_result_identifier)
let annotation_of_yojson = string_of_yojson
let conformance_pack_evaluation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     annotation =
       (option_of_yojson (value_for_key annotation_of_yojson "Annotation")
          _list path);
     result_recorded_time =
       (value_for_key date_of_yojson "ResultRecordedTime" _list path);
     config_rule_invoked_time =
       (value_for_key date_of_yojson "ConfigRuleInvokedTime" _list path);
     evaluation_result_identifier =
       (value_for_key evaluation_result_identifier_of_yojson
          "EvaluationResultIdentifier" _list path);
     compliance_type =
       (value_for_key conformance_pack_compliance_type_of_yojson
          "ComplianceType" _list path)
   } : conformance_pack_evaluation_result)
let conformance_pack_rule_evaluation_results_list_of_yojson tree path =
  list_of_yojson conformance_pack_evaluation_result_of_yojson tree path
let get_conformance_pack_compliance_details_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     conformance_pack_rule_evaluation_results =
       (option_of_yojson
          (value_for_key
             conformance_pack_rule_evaluation_results_list_of_yojson
             "ConformancePackRuleEvaluationResults") _list path);
     conformance_pack_name =
       (value_for_key conformance_pack_name_of_yojson "ConformancePackName"
          _list path)
   } : get_conformance_pack_compliance_details_response)
let conformance_pack_config_rule_names_of_yojson tree path =
  list_of_yojson string_with_char_limit64_of_yojson tree path
let conformance_pack_compliance_resource_ids_of_yojson tree path =
  list_of_yojson string_with_char_limit256_of_yojson tree path
let conformance_pack_evaluation_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ids =
       (option_of_yojson
          (value_for_key conformance_pack_compliance_resource_ids_of_yojson
             "ResourceIds") _list path);
     resource_type =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "ResourceType")
          _list path);
     compliance_type =
       (option_of_yojson
          (value_for_key conformance_pack_compliance_type_of_yojson
             "ComplianceType") _list path);
     config_rule_names =
       (option_of_yojson
          (value_for_key conformance_pack_config_rule_names_of_yojson
             "ConfigRuleNames") _list path)
   } : conformance_pack_evaluation_filters)
let get_conformance_pack_compliance_details_limit_of_yojson = int_of_yojson
let get_conformance_pack_compliance_details_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson
          (value_for_key
             get_conformance_pack_compliance_details_limit_of_yojson "Limit")
          _list path);
     filters =
       (option_of_yojson
          (value_for_key conformance_pack_evaluation_filters_of_yojson
             "Filters") _list path);
     conformance_pack_name =
       (value_for_key conformance_pack_name_of_yojson "ConformancePackName"
          _list path)
   } : get_conformance_pack_compliance_details_request)
let integer__of_yojson = int_of_yojson
let compliance_contributor_count_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cap_exceeded =
       (option_of_yojson (value_for_key boolean__of_yojson "CapExceeded")
          _list path);
     capped_count =
       (option_of_yojson (value_for_key integer__of_yojson "CappedCount")
          _list path)
   } : compliance_contributor_count)
let compliance_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_summary_timestamp =
       (option_of_yojson
          (value_for_key date_of_yojson "ComplianceSummaryTimestamp") _list
          path);
     non_compliant_resource_count =
       (option_of_yojson
          (value_for_key compliance_contributor_count_of_yojson
             "NonCompliantResourceCount") _list path);
     compliant_resource_count =
       (option_of_yojson
          (value_for_key compliance_contributor_count_of_yojson
             "CompliantResourceCount") _list path)
   } : compliance_summary)
let compliance_summary_by_resource_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_summary =
       (option_of_yojson
          (value_for_key compliance_summary_of_yojson "ComplianceSummary")
          _list path);
     resource_type =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "ResourceType")
          _list path)
   } : compliance_summary_by_resource_type)
let compliance_summaries_by_resource_type_of_yojson tree path =
  list_of_yojson compliance_summary_by_resource_type_of_yojson tree path
let get_compliance_summary_by_resource_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_summaries_by_resource_type =
       (option_of_yojson
          (value_for_key compliance_summaries_by_resource_type_of_yojson
             "ComplianceSummariesByResourceType") _list path)
   } : get_compliance_summary_by_resource_type_response)
let get_compliance_summary_by_resource_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_types =
       (option_of_yojson
          (value_for_key resource_types_of_yojson "ResourceTypes") _list path)
   } : get_compliance_summary_by_resource_type_request)
let get_compliance_summary_by_config_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_summary =
       (option_of_yojson
          (value_for_key compliance_summary_of_yojson "ComplianceSummary")
          _list path)
   } : get_compliance_summary_by_config_rule_response)
let evaluation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_token =
       (option_of_yojson (value_for_key string__of_yojson "ResultToken")
          _list path);
     annotation =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "Annotation")
          _list path);
     config_rule_invoked_time =
       (option_of_yojson
          (value_for_key date_of_yojson "ConfigRuleInvokedTime") _list path);
     result_recorded_time =
       (option_of_yojson (value_for_key date_of_yojson "ResultRecordedTime")
          _list path);
     compliance_type =
       (option_of_yojson
          (value_for_key compliance_type_of_yojson "ComplianceType") _list
          path);
     evaluation_result_identifier =
       (option_of_yojson
          (value_for_key evaluation_result_identifier_of_yojson
             "EvaluationResultIdentifier") _list path)
   } : evaluation_result)
let evaluation_results_of_yojson tree path =
  list_of_yojson evaluation_result_of_yojson tree path
let get_compliance_details_by_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     evaluation_results =
       (option_of_yojson
          (value_for_key evaluation_results_of_yojson "EvaluationResults")
          _list path)
   } : get_compliance_details_by_resource_response)
let compliance_types_of_yojson tree path =
  list_of_yojson compliance_type_of_yojson tree path
let get_compliance_details_by_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_evaluation_id =
       (option_of_yojson
          (value_for_key resource_evaluation_id_of_yojson
             "ResourceEvaluationId") _list path);
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     compliance_types =
       (option_of_yojson
          (value_for_key compliance_types_of_yojson "ComplianceTypes") _list
          path);
     resource_id =
       (option_of_yojson
          (value_for_key base_resource_id_of_yojson "ResourceId") _list path);
     resource_type =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "ResourceType")
          _list path)
   } : get_compliance_details_by_resource_request)
let get_compliance_details_by_config_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     evaluation_results =
       (option_of_yojson
          (value_for_key evaluation_results_of_yojson "EvaluationResults")
          _list path)
   } : get_compliance_details_by_config_rule_response)
let get_compliance_details_by_config_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     compliance_types =
       (option_of_yojson
          (value_for_key compliance_types_of_yojson "ComplianceTypes") _list
          path);
     config_rule_name =
       (value_for_key string_with_char_limit64_of_yojson "ConfigRuleName"
          _list path)
   } : get_compliance_details_by_config_rule_request)
let oversized_configuration_item_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : oversized_configuration_item_exception)
let get_aggregate_resource_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_item =
       (option_of_yojson
          (value_for_key configuration_item_of_yojson "ConfigurationItem")
          _list path)
   } : get_aggregate_resource_config_response)
let get_aggregate_resource_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_identifier =
       (value_for_key aggregate_resource_identifier_of_yojson
          "ResourceIdentifier" _list path);
     configuration_aggregator_name =
       (value_for_key configuration_aggregator_name_of_yojson
          "ConfigurationAggregatorName" _list path)
   } : get_aggregate_resource_config_request)
let grouped_resource_count_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_count =
       (value_for_key long_of_yojson "ResourceCount" _list path);
     group_name =
       (value_for_key string_with_char_limit256_of_yojson "GroupName" _list
          path)
   } : grouped_resource_count)
let grouped_resource_count_list_of_yojson tree path =
  list_of_yojson grouped_resource_count_of_yojson tree path
let get_aggregate_discovered_resource_counts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     grouped_resource_counts =
       (option_of_yojson
          (value_for_key grouped_resource_count_list_of_yojson
             "GroupedResourceCounts") _list path);
     group_by_key =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "GroupByKey")
          _list path);
     total_discovered_resources =
       (value_for_key long_of_yojson "TotalDiscoveredResources" _list path)
   } : get_aggregate_discovered_resource_counts_response)
let resource_count_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region =
       (option_of_yojson (value_for_key aws_region_of_yojson "Region") _list
          path);
     account_id =
       (option_of_yojson (value_for_key account_id_of_yojson "AccountId")
          _list path);
     resource_type =
       (option_of_yojson
          (value_for_key resource_type_of_yojson "ResourceType") _list path)
   } : resource_count_filters)
let resource_count_group_key_of_yojson (tree : t) path =
  (match tree with
   | `String "AWS_REGION" -> AWS_REGION
   | `String "ACCOUNT_ID" -> ACCOUNT_ID
   | `String "RESOURCE_TYPE" -> RESOURCE_TYPE
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ResourceCountGroupKey"
            value)
   | _ -> raise (deserialize_wrong_type_error path "ResourceCountGroupKey") : 
  resource_count_group_key)
let group_by_api_limit_of_yojson = int_of_yojson
let get_aggregate_discovered_resource_counts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key group_by_api_limit_of_yojson "Limit")
          _list path);
     group_by_key =
       (option_of_yojson
          (value_for_key resource_count_group_key_of_yojson "GroupByKey")
          _list path);
     filters =
       (option_of_yojson
          (value_for_key resource_count_filters_of_yojson "Filters") _list
          path);
     configuration_aggregator_name =
       (value_for_key configuration_aggregator_name_of_yojson
          "ConfigurationAggregatorName" _list path)
   } : get_aggregate_discovered_resource_counts_request)
let aggregate_conformance_pack_compliance_count_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     non_compliant_conformance_pack_count =
       (option_of_yojson
          (value_for_key integer__of_yojson
             "NonCompliantConformancePackCount") _list path);
     compliant_conformance_pack_count =
       (option_of_yojson
          (value_for_key integer__of_yojson "CompliantConformancePackCount")
          _list path)
   } : aggregate_conformance_pack_compliance_count)
let aggregate_conformance_pack_compliance_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_name =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "GroupName")
          _list path);
     compliance_summary =
       (option_of_yojson
          (value_for_key
             aggregate_conformance_pack_compliance_count_of_yojson
             "ComplianceSummary") _list path)
   } : aggregate_conformance_pack_compliance_summary)
let aggregate_conformance_pack_compliance_summary_list_of_yojson tree path =
  list_of_yojson aggregate_conformance_pack_compliance_summary_of_yojson tree
    path
let get_aggregate_conformance_pack_compliance_summary_response_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     group_by_key =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "GroupByKey")
          _list path);
     aggregate_conformance_pack_compliance_summaries =
       (option_of_yojson
          (value_for_key
             aggregate_conformance_pack_compliance_summary_list_of_yojson
             "AggregateConformancePackComplianceSummaries") _list path)
   } : get_aggregate_conformance_pack_compliance_summary_response)
let aggregate_conformance_pack_compliance_summary_filters_of_yojson tree path
  =
  let _list = assoc_of_yojson tree path in
  ({
     aws_region =
       (option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion")
          _list path);
     account_id =
       (option_of_yojson (value_for_key account_id_of_yojson "AccountId")
          _list path)
   } : aggregate_conformance_pack_compliance_summary_filters)
let aggregate_conformance_pack_compliance_summary_group_key_of_yojson
  (tree : t) path =
  (match tree with
   | `String "AWS_REGION" -> AWS_REGION
   | `String "ACCOUNT_ID" -> ACCOUNT_ID
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "AggregateConformancePackComplianceSummaryGroupKey" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path
            "AggregateConformancePackComplianceSummaryGroupKey") : aggregate_conformance_pack_compliance_summary_group_key)
let get_aggregate_conformance_pack_compliance_summary_request_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     group_by_key =
       (option_of_yojson
          (value_for_key
             aggregate_conformance_pack_compliance_summary_group_key_of_yojson
             "GroupByKey") _list path);
     filters =
       (option_of_yojson
          (value_for_key
             aggregate_conformance_pack_compliance_summary_filters_of_yojson
             "Filters") _list path);
     configuration_aggregator_name =
       (value_for_key configuration_aggregator_name_of_yojson
          "ConfigurationAggregatorName" _list path)
   } : get_aggregate_conformance_pack_compliance_summary_request)
let aggregate_compliance_count_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_summary =
       (option_of_yojson
          (value_for_key compliance_summary_of_yojson "ComplianceSummary")
          _list path);
     group_name =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "GroupName")
          _list path)
   } : aggregate_compliance_count)
let aggregate_compliance_count_list_of_yojson tree path =
  list_of_yojson aggregate_compliance_count_of_yojson tree path
let get_aggregate_config_rule_compliance_summary_response_of_yojson tree path
  =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     aggregate_compliance_counts =
       (option_of_yojson
          (value_for_key aggregate_compliance_count_list_of_yojson
             "AggregateComplianceCounts") _list path);
     group_by_key =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "GroupByKey")
          _list path)
   } : get_aggregate_config_rule_compliance_summary_response)
let config_rule_compliance_summary_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_region =
       (option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion")
          _list path);
     account_id =
       (option_of_yojson (value_for_key account_id_of_yojson "AccountId")
          _list path)
   } : config_rule_compliance_summary_filters)
let config_rule_compliance_summary_group_key_of_yojson (tree : t) path =
  (match tree with
   | `String "AWS_REGION" -> AWS_REGION
   | `String "ACCOUNT_ID" -> ACCOUNT_ID
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "ConfigRuleComplianceSummaryGroupKey" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path
            "ConfigRuleComplianceSummaryGroupKey") : config_rule_compliance_summary_group_key)
let get_aggregate_config_rule_compliance_summary_request_of_yojson tree path
  =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key group_by_api_limit_of_yojson "Limit")
          _list path);
     group_by_key =
       (option_of_yojson
          (value_for_key config_rule_compliance_summary_group_key_of_yojson
             "GroupByKey") _list path);
     filters =
       (option_of_yojson
          (value_for_key config_rule_compliance_summary_filters_of_yojson
             "Filters") _list path);
     configuration_aggregator_name =
       (value_for_key configuration_aggregator_name_of_yojson
          "ConfigurationAggregatorName" _list path)
   } : get_aggregate_config_rule_compliance_summary_request)
let aggregate_evaluation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_region =
       (option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion")
          _list path);
     account_id =
       (option_of_yojson (value_for_key account_id_of_yojson "AccountId")
          _list path);
     annotation =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "Annotation")
          _list path);
     config_rule_invoked_time =
       (option_of_yojson
          (value_for_key date_of_yojson "ConfigRuleInvokedTime") _list path);
     result_recorded_time =
       (option_of_yojson (value_for_key date_of_yojson "ResultRecordedTime")
          _list path);
     compliance_type =
       (option_of_yojson
          (value_for_key compliance_type_of_yojson "ComplianceType") _list
          path);
     evaluation_result_identifier =
       (option_of_yojson
          (value_for_key evaluation_result_identifier_of_yojson
             "EvaluationResultIdentifier") _list path)
   } : aggregate_evaluation_result)
let aggregate_evaluation_result_list_of_yojson tree path =
  list_of_yojson aggregate_evaluation_result_of_yojson tree path
let get_aggregate_compliance_details_by_config_rule_response_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     aggregate_evaluation_results =
       (option_of_yojson
          (value_for_key aggregate_evaluation_result_list_of_yojson
             "AggregateEvaluationResults") _list path)
   } : get_aggregate_compliance_details_by_config_rule_response)
let get_aggregate_compliance_details_by_config_rule_request_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     compliance_type =
       (option_of_yojson
          (value_for_key compliance_type_of_yojson "ComplianceType") _list
          path);
     aws_region = (value_for_key aws_region_of_yojson "AwsRegion" _list path);
     account_id = (value_for_key account_id_of_yojson "AccountId" _list path);
     config_rule_name =
       (value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path);
     configuration_aggregator_name =
       (value_for_key configuration_aggregator_name_of_yojson
          "ConfigurationAggregatorName" _list path)
   } : get_aggregate_compliance_details_by_config_rule_request)
let no_such_retention_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : no_such_retention_configuration_exception)
let retention_configuration_list_of_yojson tree path =
  list_of_yojson retention_configuration_of_yojson tree path
let describe_retention_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     retention_configurations =
       (option_of_yojson
          (value_for_key retention_configuration_list_of_yojson
             "RetentionConfigurations") _list path)
   } : describe_retention_configurations_response)
let retention_configuration_name_list_of_yojson tree path =
  list_of_yojson retention_configuration_name_of_yojson tree path
let describe_retention_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     retention_configuration_names =
       (option_of_yojson
          (value_for_key retention_configuration_name_list_of_yojson
             "RetentionConfigurationNames") _list path)
   } : describe_retention_configurations_request)
let remediation_execution_state_of_yojson (tree : t) path =
  (match tree with
   | `String "FAILED" -> FAILED
   | `String "SUCCEEDED" -> SUCCEEDED
   | `String "IN_PROGRESS" -> IN_PROGRESS
   | `String "QUEUED" -> QUEUED
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "RemediationExecutionState" value)
   | _ ->
       raise (deserialize_wrong_type_error path "RemediationExecutionState") : 
  remediation_execution_state)
let remediation_execution_step_state_of_yojson (tree : t) path =
  (match tree with
   | `String "FAILED" -> FAILED
   | `String "PENDING" -> PENDING
   | `String "SUCCEEDED" -> SUCCEEDED
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "RemediationExecutionStepState" value)
   | _ ->
       raise
         (deserialize_wrong_type_error path "RemediationExecutionStepState") : 
  remediation_execution_step_state)
let remediation_execution_step_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stop_time =
       (option_of_yojson (value_for_key date_of_yojson "StopTime") _list path);
     start_time =
       (option_of_yojson (value_for_key date_of_yojson "StartTime") _list
          path);
     error_message =
       (option_of_yojson (value_for_key string__of_yojson "ErrorMessage")
          _list path);
     state =
       (option_of_yojson
          (value_for_key remediation_execution_step_state_of_yojson "State")
          _list path);
     name =
       (option_of_yojson (value_for_key string__of_yojson "Name") _list path)
   } : remediation_execution_step)
let remediation_execution_steps_of_yojson tree path =
  list_of_yojson remediation_execution_step_of_yojson tree path
let remediation_execution_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       (option_of_yojson (value_for_key date_of_yojson "LastUpdatedTime")
          _list path);
     invocation_time =
       (option_of_yojson (value_for_key date_of_yojson "InvocationTime")
          _list path);
     step_details =
       (option_of_yojson
          (value_for_key remediation_execution_steps_of_yojson "StepDetails")
          _list path);
     state =
       (option_of_yojson
          (value_for_key remediation_execution_state_of_yojson "State") _list
          path);
     resource_key =
       (option_of_yojson (value_for_key resource_key_of_yojson "ResourceKey")
          _list path)
   } : remediation_execution_status)
let remediation_execution_statuses_of_yojson tree path =
  list_of_yojson remediation_execution_status_of_yojson tree path
let describe_remediation_execution_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     remediation_execution_statuses =
       (option_of_yojson
          (value_for_key remediation_execution_statuses_of_yojson
             "RemediationExecutionStatuses") _list path)
   } : describe_remediation_execution_status_response)
let describe_remediation_execution_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     resource_keys =
       (option_of_yojson
          (value_for_key resource_keys_of_yojson "ResourceKeys") _list path);
     config_rule_name =
       (value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path)
   } : describe_remediation_execution_status_request)
let describe_remediation_exceptions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     remediation_exceptions =
       (option_of_yojson
          (value_for_key remediation_exceptions_of_yojson
             "RemediationExceptions") _list path)
   } : describe_remediation_exceptions_response)
let describe_remediation_exceptions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     resource_keys =
       (option_of_yojson
          (value_for_key remediation_exception_resource_keys_of_yojson
             "ResourceKeys") _list path);
     config_rule_name =
       (value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path)
   } : describe_remediation_exceptions_request)
let describe_remediation_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remediation_configurations =
       (option_of_yojson
          (value_for_key remediation_configurations_of_yojson
             "RemediationConfigurations") _list path)
   } : describe_remediation_configurations_response)
let config_rule_names_of_yojson tree path =
  list_of_yojson config_rule_name_of_yojson tree path
let describe_remediation_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_names =
       (value_for_key config_rule_names_of_yojson "ConfigRuleNames" _list
          path)
   } : describe_remediation_configurations_request)
let pending_aggregation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requester_aws_region =
       (option_of_yojson
          (value_for_key aws_region_of_yojson "RequesterAwsRegion") _list
          path);
     requester_account_id =
       (option_of_yojson
          (value_for_key account_id_of_yojson "RequesterAccountId") _list
          path)
   } : pending_aggregation_request)
let pending_aggregation_request_list_of_yojson tree path =
  list_of_yojson pending_aggregation_request_of_yojson tree path
let describe_pending_aggregation_requests_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     pending_aggregation_requests =
       (option_of_yojson
          (value_for_key pending_aggregation_request_list_of_yojson
             "PendingAggregationRequests") _list path)
   } : describe_pending_aggregation_requests_response)
let describe_pending_aggregation_requests_limit_of_yojson = int_of_yojson
let describe_pending_aggregation_requests_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     limit =
       (option_of_yojson
          (value_for_key
             describe_pending_aggregation_requests_limit_of_yojson "Limit")
          _list path)
   } : describe_pending_aggregation_requests_request)
let organization_resource_status_of_yojson (tree : t) path =
  (match tree with
   | `String "UPDATE_FAILED" -> UPDATE_FAILED
   | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
   | `String "UPDATE_SUCCESSFUL" -> UPDATE_SUCCESSFUL
   | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
   | `String "DELETE_FAILED" -> DELETE_FAILED
   | `String "DELETE_SUCCESSFUL" -> DELETE_SUCCESSFUL
   | `String "CREATE_FAILED" -> CREATE_FAILED
   | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
   | `String "CREATE_SUCCESSFUL" -> CREATE_SUCCESSFUL
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "OrganizationResourceStatus" value)
   | _ ->
       raise (deserialize_wrong_type_error path "OrganizationResourceStatus") : 
  organization_resource_status)
let organization_conformance_pack_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_update_time =
       (option_of_yojson (value_for_key date_of_yojson "LastUpdateTime")
          _list path);
     error_message =
       (option_of_yojson (value_for_key string__of_yojson "ErrorMessage")
          _list path);
     error_code =
       (option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list
          path);
     status =
       (value_for_key organization_resource_status_of_yojson "Status" _list
          path);
     organization_conformance_pack_name =
       (value_for_key organization_conformance_pack_name_of_yojson
          "OrganizationConformancePackName" _list path)
   } : organization_conformance_pack_status)
let organization_conformance_pack_statuses_of_yojson tree path =
  list_of_yojson organization_conformance_pack_status_of_yojson tree path
let describe_organization_conformance_pack_statuses_response_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     organization_conformance_pack_statuses =
       (option_of_yojson
          (value_for_key organization_conformance_pack_statuses_of_yojson
             "OrganizationConformancePackStatuses") _list path)
   } : describe_organization_conformance_pack_statuses_response)
let organization_conformance_pack_names_of_yojson tree path =
  list_of_yojson organization_conformance_pack_name_of_yojson tree path
let describe_organization_conformance_pack_statuses_request_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     limit =
       (option_of_yojson (value_for_key cosmos_page_limit_of_yojson "Limit")
          _list path);
     organization_conformance_pack_names =
       (option_of_yojson
          (value_for_key organization_conformance_pack_names_of_yojson
             "OrganizationConformancePackNames") _list path)
   } : describe_organization_conformance_pack_statuses_request)
let organization_conformance_pack_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_update_time =
       (value_for_key date_of_yojson "LastUpdateTime" _list path);
     excluded_accounts =
       (option_of_yojson
          (value_for_key excluded_accounts_of_yojson "ExcludedAccounts")
          _list path);
     conformance_pack_input_parameters =
       (option_of_yojson
          (value_for_key conformance_pack_input_parameters_of_yojson
             "ConformancePackInputParameters") _list path);
     delivery_s3_key_prefix =
       (option_of_yojson
          (value_for_key delivery_s3_key_prefix_of_yojson
             "DeliveryS3KeyPrefix") _list path);
     delivery_s3_bucket =
       (option_of_yojson
          (value_for_key delivery_s3_bucket_of_yojson "DeliveryS3Bucket")
          _list path);
     organization_conformance_pack_arn =
       (value_for_key string_with_char_limit256_of_yojson
          "OrganizationConformancePackArn" _list path);
     organization_conformance_pack_name =
       (value_for_key organization_conformance_pack_name_of_yojson
          "OrganizationConformancePackName" _list path)
   } : organization_conformance_pack)
let organization_conformance_packs_of_yojson tree path =
  list_of_yojson organization_conformance_pack_of_yojson tree path
let describe_organization_conformance_packs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     organization_conformance_packs =
       (option_of_yojson
          (value_for_key organization_conformance_packs_of_yojson
             "OrganizationConformancePacks") _list path)
   } : describe_organization_conformance_packs_response)
let describe_organization_conformance_packs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     limit =
       (option_of_yojson (value_for_key cosmos_page_limit_of_yojson "Limit")
          _list path);
     organization_conformance_pack_names =
       (option_of_yojson
          (value_for_key organization_conformance_pack_names_of_yojson
             "OrganizationConformancePackNames") _list path)
   } : describe_organization_conformance_packs_request)
let organization_rule_status_of_yojson (tree : t) path =
  (match tree with
   | `String "UPDATE_FAILED" -> UPDATE_FAILED
   | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
   | `String "UPDATE_SUCCESSFUL" -> UPDATE_SUCCESSFUL
   | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
   | `String "DELETE_FAILED" -> DELETE_FAILED
   | `String "DELETE_SUCCESSFUL" -> DELETE_SUCCESSFUL
   | `String "CREATE_FAILED" -> CREATE_FAILED
   | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
   | `String "CREATE_SUCCESSFUL" -> CREATE_SUCCESSFUL
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "OrganizationRuleStatus"
            value)
   | _ -> raise (deserialize_wrong_type_error path "OrganizationRuleStatus") : 
  organization_rule_status)
let organization_config_rule_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_update_time =
       (option_of_yojson (value_for_key date_of_yojson "LastUpdateTime")
          _list path);
     error_message =
       (option_of_yojson (value_for_key string__of_yojson "ErrorMessage")
          _list path);
     error_code =
       (option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list
          path);
     organization_rule_status =
       (value_for_key organization_rule_status_of_yojson
          "OrganizationRuleStatus" _list path);
     organization_config_rule_name =
       (value_for_key organization_config_rule_name_of_yojson
          "OrganizationConfigRuleName" _list path)
   } : organization_config_rule_status)
let organization_config_rule_statuses_of_yojson tree path =
  list_of_yojson organization_config_rule_status_of_yojson tree path
let describe_organization_config_rule_statuses_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     organization_config_rule_statuses =
       (option_of_yojson
          (value_for_key organization_config_rule_statuses_of_yojson
             "OrganizationConfigRuleStatuses") _list path)
   } : describe_organization_config_rule_statuses_response)
let organization_config_rule_names_of_yojson tree path =
  list_of_yojson string_with_char_limit64_of_yojson tree path
let describe_organization_config_rule_statuses_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     limit =
       (option_of_yojson (value_for_key cosmos_page_limit_of_yojson "Limit")
          _list path);
     organization_config_rule_names =
       (option_of_yojson
          (value_for_key organization_config_rule_names_of_yojson
             "OrganizationConfigRuleNames") _list path)
   } : describe_organization_config_rule_statuses_request)
let organization_custom_policy_rule_metadata_no_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     debug_log_delivery_accounts =
       (option_of_yojson
          (value_for_key debug_log_delivery_accounts_of_yojson
             "DebugLogDeliveryAccounts") _list path);
     policy_runtime =
       (option_of_yojson
          (value_for_key policy_runtime_of_yojson "PolicyRuntime") _list path);
     tag_value_scope =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "TagValueScope")
          _list path);
     tag_key_scope =
       (option_of_yojson
          (value_for_key string_with_char_limit128_of_yojson "TagKeyScope")
          _list path);
     resource_id_scope =
       (option_of_yojson
          (value_for_key string_with_char_limit768_of_yojson
             "ResourceIdScope") _list path);
     resource_types_scope =
       (option_of_yojson
          (value_for_key resource_types_scope_of_yojson "ResourceTypesScope")
          _list path);
     maximum_execution_frequency =
       (option_of_yojson
          (value_for_key maximum_execution_frequency_of_yojson
             "MaximumExecutionFrequency") _list path);
     input_parameters =
       (option_of_yojson
          (value_for_key string_with_char_limit2048_of_yojson
             "InputParameters") _list path);
     organization_config_rule_trigger_types =
       (option_of_yojson
          (value_for_key
             organization_config_rule_trigger_type_no_s_ns_of_yojson
             "OrganizationConfigRuleTriggerTypes") _list path);
     description =
       (option_of_yojson
          (value_for_key string_with_char_limit256_min0_of_yojson
             "Description") _list path)
   } : organization_custom_policy_rule_metadata_no_policy)
let organization_config_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_custom_policy_rule_metadata =
       (option_of_yojson
          (value_for_key
             organization_custom_policy_rule_metadata_no_policy_of_yojson
             "OrganizationCustomPolicyRuleMetadata") _list path);
     last_update_time =
       (option_of_yojson (value_for_key date_of_yojson "LastUpdateTime")
          _list path);
     excluded_accounts =
       (option_of_yojson
          (value_for_key excluded_accounts_of_yojson "ExcludedAccounts")
          _list path);
     organization_custom_rule_metadata =
       (option_of_yojson
          (value_for_key organization_custom_rule_metadata_of_yojson
             "OrganizationCustomRuleMetadata") _list path);
     organization_managed_rule_metadata =
       (option_of_yojson
          (value_for_key organization_managed_rule_metadata_of_yojson
             "OrganizationManagedRuleMetadata") _list path);
     organization_config_rule_arn =
       (value_for_key string_with_char_limit256_of_yojson
          "OrganizationConfigRuleArn" _list path);
     organization_config_rule_name =
       (value_for_key organization_config_rule_name_of_yojson
          "OrganizationConfigRuleName" _list path)
   } : organization_config_rule)
let organization_config_rules_of_yojson tree path =
  list_of_yojson organization_config_rule_of_yojson tree path
let describe_organization_config_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     organization_config_rules =
       (option_of_yojson
          (value_for_key organization_config_rules_of_yojson
             "OrganizationConfigRules") _list path)
   } : describe_organization_config_rules_response)
let describe_organization_config_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     limit =
       (option_of_yojson (value_for_key cosmos_page_limit_of_yojson "Limit")
          _list path);
     organization_config_rule_names =
       (option_of_yojson
          (value_for_key organization_config_rule_names_of_yojson
             "OrganizationConfigRuleNames") _list path)
   } : describe_organization_config_rules_request)
let no_such_delivery_channel_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : no_such_delivery_channel_exception)
let delivery_status_of_yojson (tree : t) path =
  (match tree with
   | `String "Not_Applicable" -> Not_Applicable
   | `String "Failure" -> Failure
   | `String "Success" -> Success
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "DeliveryStatus" value)
   | _ -> raise (deserialize_wrong_type_error path "DeliveryStatus") : 
  delivery_status)
let config_export_delivery_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_delivery_time =
       (option_of_yojson (value_for_key date_of_yojson "nextDeliveryTime")
          _list path);
     last_successful_time =
       (option_of_yojson (value_for_key date_of_yojson "lastSuccessfulTime")
          _list path);
     last_attempt_time =
       (option_of_yojson (value_for_key date_of_yojson "lastAttemptTime")
          _list path);
     last_error_message =
       (option_of_yojson (value_for_key string__of_yojson "lastErrorMessage")
          _list path);
     last_error_code =
       (option_of_yojson (value_for_key string__of_yojson "lastErrorCode")
          _list path);
     last_status =
       (option_of_yojson
          (value_for_key delivery_status_of_yojson "lastStatus") _list path)
   } : config_export_delivery_info)
let config_stream_delivery_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_status_change_time =
       (option_of_yojson
          (value_for_key date_of_yojson "lastStatusChangeTime") _list path);
     last_error_message =
       (option_of_yojson (value_for_key string__of_yojson "lastErrorMessage")
          _list path);
     last_error_code =
       (option_of_yojson (value_for_key string__of_yojson "lastErrorCode")
          _list path);
     last_status =
       (option_of_yojson
          (value_for_key delivery_status_of_yojson "lastStatus") _list path)
   } : config_stream_delivery_info)
let delivery_channel_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_stream_delivery_info =
       (option_of_yojson
          (value_for_key config_stream_delivery_info_of_yojson
             "configStreamDeliveryInfo") _list path);
     config_history_delivery_info =
       (option_of_yojson
          (value_for_key config_export_delivery_info_of_yojson
             "configHistoryDeliveryInfo") _list path);
     config_snapshot_delivery_info =
       (option_of_yojson
          (value_for_key config_export_delivery_info_of_yojson
             "configSnapshotDeliveryInfo") _list path);
     name =
       (option_of_yojson (value_for_key string__of_yojson "name") _list path)
   } : delivery_channel_status)
let delivery_channel_status_list_of_yojson tree path =
  list_of_yojson delivery_channel_status_of_yojson tree path
let describe_delivery_channel_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_channels_status =
       (option_of_yojson
          (value_for_key delivery_channel_status_list_of_yojson
             "DeliveryChannelsStatus") _list path)
   } : describe_delivery_channel_status_response)
let delivery_channel_name_list_of_yojson tree path =
  list_of_yojson channel_name_of_yojson tree path
let describe_delivery_channel_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_channel_names =
       (option_of_yojson
          (value_for_key delivery_channel_name_list_of_yojson
             "DeliveryChannelNames") _list path)
   } : describe_delivery_channel_status_request)
let delivery_channel_list_of_yojson tree path =
  list_of_yojson delivery_channel_of_yojson tree path
let describe_delivery_channels_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_channels =
       (option_of_yojson
          (value_for_key delivery_channel_list_of_yojson "DeliveryChannels")
          _list path)
   } : describe_delivery_channels_response)
let describe_delivery_channels_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_channel_names =
       (option_of_yojson
          (value_for_key delivery_channel_name_list_of_yojson
             "DeliveryChannelNames") _list path)
   } : describe_delivery_channels_request)
let conformance_pack_id_of_yojson = string_of_yojson
let conformance_pack_state_of_yojson (tree : t) path =
  (match tree with
   | `String "DELETE_FAILED" -> DELETE_FAILED
   | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
   | `String "CREATE_FAILED" -> CREATE_FAILED
   | `String "CREATE_COMPLETE" -> CREATE_COMPLETE
   | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ConformancePackState"
            value)
   | _ -> raise (deserialize_wrong_type_error path "ConformancePackState") : 
  conformance_pack_state)
let stack_arn_of_yojson = string_of_yojson
let conformance_pack_status_reason_of_yojson = string_of_yojson
let conformance_pack_status_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_update_completed_time =
       (option_of_yojson
          (value_for_key date_of_yojson "LastUpdateCompletedTime") _list path);
     last_update_requested_time =
       (value_for_key date_of_yojson "LastUpdateRequestedTime" _list path);
     conformance_pack_status_reason =
       (option_of_yojson
          (value_for_key conformance_pack_status_reason_of_yojson
             "ConformancePackStatusReason") _list path);
     stack_arn = (value_for_key stack_arn_of_yojson "StackArn" _list path);
     conformance_pack_state =
       (value_for_key conformance_pack_state_of_yojson "ConformancePackState"
          _list path);
     conformance_pack_arn =
       (value_for_key conformance_pack_arn_of_yojson "ConformancePackArn"
          _list path);
     conformance_pack_id =
       (value_for_key conformance_pack_id_of_yojson "ConformancePackId" _list
          path);
     conformance_pack_name =
       (value_for_key conformance_pack_name_of_yojson "ConformancePackName"
          _list path)
   } : conformance_pack_status_detail)
let conformance_pack_status_details_list_of_yojson tree path =
  list_of_yojson conformance_pack_status_detail_of_yojson tree path
let describe_conformance_pack_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     conformance_pack_status_details =
       (option_of_yojson
          (value_for_key conformance_pack_status_details_list_of_yojson
             "ConformancePackStatusDetails") _list path)
   } : describe_conformance_pack_status_response)
let conformance_pack_names_list_of_yojson tree path =
  list_of_yojson conformance_pack_name_of_yojson tree path
let describe_conformance_pack_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key page_size_limit_of_yojson "Limit")
          _list path);
     conformance_pack_names =
       (option_of_yojson
          (value_for_key conformance_pack_names_list_of_yojson
             "ConformancePackNames") _list path)
   } : describe_conformance_pack_status_request)
let conformance_pack_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_ssm_document_details =
       (option_of_yojson
          (value_for_key template_ssm_document_details_of_yojson
             "TemplateSSMDocumentDetails") _list path);
     created_by =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "CreatedBy")
          _list path);
     last_update_requested_time =
       (option_of_yojson
          (value_for_key date_of_yojson "LastUpdateRequestedTime") _list path);
     conformance_pack_input_parameters =
       (option_of_yojson
          (value_for_key conformance_pack_input_parameters_of_yojson
             "ConformancePackInputParameters") _list path);
     delivery_s3_key_prefix =
       (option_of_yojson
          (value_for_key delivery_s3_key_prefix_of_yojson
             "DeliveryS3KeyPrefix") _list path);
     delivery_s3_bucket =
       (option_of_yojson
          (value_for_key delivery_s3_bucket_of_yojson "DeliveryS3Bucket")
          _list path);
     conformance_pack_id =
       (value_for_key conformance_pack_id_of_yojson "ConformancePackId" _list
          path);
     conformance_pack_arn =
       (value_for_key conformance_pack_arn_of_yojson "ConformancePackArn"
          _list path);
     conformance_pack_name =
       (value_for_key conformance_pack_name_of_yojson "ConformancePackName"
          _list path)
   } : conformance_pack_detail)
let conformance_pack_detail_list_of_yojson tree path =
  list_of_yojson conformance_pack_detail_of_yojson tree path
let describe_conformance_packs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     conformance_pack_details =
       (option_of_yojson
          (value_for_key conformance_pack_detail_list_of_yojson
             "ConformancePackDetails") _list path)
   } : describe_conformance_packs_response)
let describe_conformance_packs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key page_size_limit_of_yojson "Limit")
          _list path);
     conformance_pack_names =
       (option_of_yojson
          (value_for_key conformance_pack_names_list_of_yojson
             "ConformancePackNames") _list path)
   } : describe_conformance_packs_request)
let controls_list_of_yojson tree path =
  list_of_yojson string_with_char_limit128_of_yojson tree path
let conformance_pack_rule_compliance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     controls =
       (option_of_yojson (value_for_key controls_list_of_yojson "Controls")
          _list path);
     compliance_type =
       (option_of_yojson
          (value_for_key conformance_pack_compliance_type_of_yojson
             "ComplianceType") _list path);
     config_rule_name =
       (option_of_yojson
          (value_for_key config_rule_name_of_yojson "ConfigRuleName") _list
          path)
   } : conformance_pack_rule_compliance)
let conformance_pack_rule_compliance_list_of_yojson tree path =
  list_of_yojson conformance_pack_rule_compliance_of_yojson tree path
let describe_conformance_pack_compliance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     conformance_pack_rule_compliance_list =
       (value_for_key conformance_pack_rule_compliance_list_of_yojson
          "ConformancePackRuleComplianceList" _list path);
     conformance_pack_name =
       (value_for_key conformance_pack_name_of_yojson "ConformancePackName"
          _list path)
   } : describe_conformance_pack_compliance_response)
let conformance_pack_compliance_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_type =
       (option_of_yojson
          (value_for_key conformance_pack_compliance_type_of_yojson
             "ComplianceType") _list path);
     config_rule_names =
       (option_of_yojson
          (value_for_key conformance_pack_config_rule_names_of_yojson
             "ConfigRuleNames") _list path)
   } : conformance_pack_compliance_filters)
let describe_conformance_pack_compliance_limit_of_yojson = int_of_yojson
let describe_conformance_pack_compliance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson
          (value_for_key describe_conformance_pack_compliance_limit_of_yojson
             "Limit") _list path);
     filters =
       (option_of_yojson
          (value_for_key conformance_pack_compliance_filters_of_yojson
             "Filters") _list path);
     conformance_pack_name =
       (value_for_key conformance_pack_name_of_yojson "ConformancePackName"
          _list path)
   } : describe_conformance_pack_compliance_request)
let recorder_status_of_yojson (tree : t) path =
  (match tree with
   | `String "Failure" -> Failure
   | `String "Success" -> Success
   | `String "Pending" -> Pending
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "RecorderStatus" value)
   | _ -> raise (deserialize_wrong_type_error path "RecorderStatus") : 
  recorder_status)
let configuration_recorder_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_status_change_time =
       (option_of_yojson
          (value_for_key date_of_yojson "lastStatusChangeTime") _list path);
     last_error_message =
       (option_of_yojson (value_for_key string__of_yojson "lastErrorMessage")
          _list path);
     last_error_code =
       (option_of_yojson (value_for_key string__of_yojson "lastErrorCode")
          _list path);
     last_status =
       (option_of_yojson
          (value_for_key recorder_status_of_yojson "lastStatus") _list path);
     recording =
       (option_of_yojson (value_for_key boolean__of_yojson "recording") _list
          path);
     last_stop_time =
       (option_of_yojson (value_for_key date_of_yojson "lastStopTime") _list
          path);
     last_start_time =
       (option_of_yojson (value_for_key date_of_yojson "lastStartTime") _list
          path);
     name =
       (option_of_yojson (value_for_key string__of_yojson "name") _list path)
   } : configuration_recorder_status)
let configuration_recorder_status_list_of_yojson tree path =
  list_of_yojson configuration_recorder_status_of_yojson tree path
let describe_configuration_recorder_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorders_status =
       (option_of_yojson
          (value_for_key configuration_recorder_status_list_of_yojson
             "ConfigurationRecordersStatus") _list path)
   } : describe_configuration_recorder_status_response)
let configuration_recorder_name_list_of_yojson tree path =
  list_of_yojson recorder_name_of_yojson tree path
let describe_configuration_recorder_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder_names =
       (option_of_yojson
          (value_for_key configuration_recorder_name_list_of_yojson
             "ConfigurationRecorderNames") _list path)
   } : describe_configuration_recorder_status_request)
let configuration_recorder_list_of_yojson tree path =
  list_of_yojson configuration_recorder_of_yojson tree path
let describe_configuration_recorders_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorders =
       (option_of_yojson
          (value_for_key configuration_recorder_list_of_yojson
             "ConfigurationRecorders") _list path)
   } : describe_configuration_recorders_response)
let describe_configuration_recorders_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder_names =
       (option_of_yojson
          (value_for_key configuration_recorder_name_list_of_yojson
             "ConfigurationRecorderNames") _list path)
   } : describe_configuration_recorders_request)
let aggregated_source_type_of_yojson (tree : t) path =
  (match tree with
   | `String "ORGANIZATION" -> ORGANIZATION
   | `String "ACCOUNT" -> ACCOUNT
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "AggregatedSourceType"
            value)
   | _ -> raise (deserialize_wrong_type_error path "AggregatedSourceType") : 
  aggregated_source_type)
let aggregated_source_status_type_of_yojson (tree : t) path =
  (match tree with
   | `String "OUTDATED" -> OUTDATED
   | `String "SUCCEEDED" -> SUCCEEDED
   | `String "FAILED" -> FAILED
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path
            "AggregatedSourceStatusType" value)
   | _ ->
       raise (deserialize_wrong_type_error path "AggregatedSourceStatusType") : 
  aggregated_source_status_type)
let aggregated_source_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_error_message =
       (option_of_yojson (value_for_key string__of_yojson "LastErrorMessage")
          _list path);
     last_error_code =
       (option_of_yojson (value_for_key string__of_yojson "LastErrorCode")
          _list path);
     last_update_time =
       (option_of_yojson (value_for_key date_of_yojson "LastUpdateTime")
          _list path);
     last_update_status =
       (option_of_yojson
          (value_for_key aggregated_source_status_type_of_yojson
             "LastUpdateStatus") _list path);
     aws_region =
       (option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion")
          _list path);
     source_type =
       (option_of_yojson
          (value_for_key aggregated_source_type_of_yojson "SourceType") _list
          path);
     source_id =
       (option_of_yojson (value_for_key string__of_yojson "SourceId") _list
          path)
   } : aggregated_source_status)
let aggregated_source_status_list_of_yojson tree path =
  list_of_yojson aggregated_source_status_of_yojson tree path
let describe_configuration_aggregator_sources_status_response_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     aggregated_source_status_list =
       (option_of_yojson
          (value_for_key aggregated_source_status_list_of_yojson
             "AggregatedSourceStatusList") _list path)
   } : describe_configuration_aggregator_sources_status_response)
let aggregated_source_status_type_list_of_yojson tree path =
  list_of_yojson aggregated_source_status_type_of_yojson tree path
let describe_configuration_aggregator_sources_status_request_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     update_status =
       (option_of_yojson
          (value_for_key aggregated_source_status_type_list_of_yojson
             "UpdateStatus") _list path);
     configuration_aggregator_name =
       (value_for_key configuration_aggregator_name_of_yojson
          "ConfigurationAggregatorName" _list path)
   } : describe_configuration_aggregator_sources_status_request)
let configuration_aggregator_list_of_yojson tree path =
  list_of_yojson configuration_aggregator_of_yojson tree path
let describe_configuration_aggregators_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     configuration_aggregators =
       (option_of_yojson
          (value_for_key configuration_aggregator_list_of_yojson
             "ConfigurationAggregators") _list path)
   } : describe_configuration_aggregators_response)
let configuration_aggregator_name_list_of_yojson tree path =
  list_of_yojson configuration_aggregator_name_of_yojson tree path
let describe_configuration_aggregators_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     configuration_aggregator_names =
       (option_of_yojson
          (value_for_key configuration_aggregator_name_list_of_yojson
             "ConfigurationAggregatorNames") _list path)
   } : describe_configuration_aggregators_request)
let config_rules_of_yojson tree path =
  list_of_yojson config_rule_of_yojson tree path
let describe_config_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     config_rules =
       (option_of_yojson (value_for_key config_rules_of_yojson "ConfigRules")
          _list path)
   } : describe_config_rules_response)
let describe_config_rules_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_mode =
       (option_of_yojson
          (value_for_key evaluation_mode_of_yojson "EvaluationMode") _list
          path)
   } : describe_config_rules_filters)
let describe_config_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       (option_of_yojson
          (value_for_key describe_config_rules_filters_of_yojson "Filters")
          _list path);
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     config_rule_names =
       (option_of_yojson
          (value_for_key config_rule_names_of_yojson "ConfigRuleNames") _list
          path)
   } : describe_config_rules_request)
let config_rule_evaluation_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_debug_log_delivery_time =
       (option_of_yojson
          (value_for_key date_of_yojson "LastDebugLogDeliveryTime") _list
          path);
     last_debug_log_delivery_status_reason =
       (option_of_yojson
          (value_for_key string__of_yojson "LastDebugLogDeliveryStatusReason")
          _list path);
     last_debug_log_delivery_status =
       (option_of_yojson
          (value_for_key string__of_yojson "LastDebugLogDeliveryStatus")
          _list path);
     first_evaluation_started =
       (option_of_yojson
          (value_for_key boolean__of_yojson "FirstEvaluationStarted") _list
          path);
     last_error_message =
       (option_of_yojson (value_for_key string__of_yojson "LastErrorMessage")
          _list path);
     last_error_code =
       (option_of_yojson (value_for_key string__of_yojson "LastErrorCode")
          _list path);
     last_deactivated_time =
       (option_of_yojson (value_for_key date_of_yojson "LastDeactivatedTime")
          _list path);
     first_activated_time =
       (option_of_yojson (value_for_key date_of_yojson "FirstActivatedTime")
          _list path);
     last_failed_evaluation_time =
       (option_of_yojson
          (value_for_key date_of_yojson "LastFailedEvaluationTime") _list
          path);
     last_successful_evaluation_time =
       (option_of_yojson
          (value_for_key date_of_yojson "LastSuccessfulEvaluationTime") _list
          path);
     last_failed_invocation_time =
       (option_of_yojson
          (value_for_key date_of_yojson "LastFailedInvocationTime") _list
          path);
     last_successful_invocation_time =
       (option_of_yojson
          (value_for_key date_of_yojson "LastSuccessfulInvocationTime") _list
          path);
     config_rule_id =
       (option_of_yojson (value_for_key string__of_yojson "ConfigRuleId")
          _list path);
     config_rule_arn =
       (option_of_yojson (value_for_key string__of_yojson "ConfigRuleArn")
          _list path);
     config_rule_name =
       (option_of_yojson
          (value_for_key config_rule_name_of_yojson "ConfigRuleName") _list
          path)
   } : config_rule_evaluation_status)
let config_rule_evaluation_status_list_of_yojson tree path =
  list_of_yojson config_rule_evaluation_status_of_yojson tree path
let describe_config_rule_evaluation_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     config_rules_evaluation_status =
       (option_of_yojson
          (value_for_key config_rule_evaluation_status_list_of_yojson
             "ConfigRulesEvaluationStatus") _list path)
   } : describe_config_rule_evaluation_status_response)
let rule_limit_of_yojson = int_of_yojson
let describe_config_rule_evaluation_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       (option_of_yojson (value_for_key rule_limit_of_yojson "Limit") _list
          path);
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     config_rule_names =
       (option_of_yojson
          (value_for_key config_rule_names_of_yojson "ConfigRuleNames") _list
          path)
   } : describe_config_rule_evaluation_status_request)
let compliance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_contributor_count =
       (option_of_yojson
          (value_for_key compliance_contributor_count_of_yojson
             "ComplianceContributorCount") _list path);
     compliance_type =
       (option_of_yojson
          (value_for_key compliance_type_of_yojson "ComplianceType") _list
          path)
   } : compliance)
let compliance_by_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance =
       (option_of_yojson (value_for_key compliance_of_yojson "Compliance")
          _list path);
     resource_id =
       (option_of_yojson
          (value_for_key base_resource_id_of_yojson "ResourceId") _list path);
     resource_type =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "ResourceType")
          _list path)
   } : compliance_by_resource)
let compliance_by_resources_of_yojson tree path =
  list_of_yojson compliance_by_resource_of_yojson tree path
let describe_compliance_by_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     compliance_by_resources =
       (option_of_yojson
          (value_for_key compliance_by_resources_of_yojson
             "ComplianceByResources") _list path)
   } : describe_compliance_by_resource_response)
let describe_compliance_by_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     compliance_types =
       (option_of_yojson
          (value_for_key compliance_types_of_yojson "ComplianceTypes") _list
          path);
     resource_id =
       (option_of_yojson
          (value_for_key base_resource_id_of_yojson "ResourceId") _list path);
     resource_type =
       (option_of_yojson
          (value_for_key string_with_char_limit256_of_yojson "ResourceType")
          _list path)
   } : describe_compliance_by_resource_request)
let compliance_by_config_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance =
       (option_of_yojson (value_for_key compliance_of_yojson "Compliance")
          _list path);
     config_rule_name =
       (option_of_yojson
          (value_for_key string_with_char_limit64_of_yojson "ConfigRuleName")
          _list path)
   } : compliance_by_config_rule)
let compliance_by_config_rules_of_yojson tree path =
  list_of_yojson compliance_by_config_rule_of_yojson tree path
let describe_compliance_by_config_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     compliance_by_config_rules =
       (option_of_yojson
          (value_for_key compliance_by_config_rules_of_yojson
             "ComplianceByConfigRules") _list path)
   } : describe_compliance_by_config_rule_response)
let describe_compliance_by_config_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     compliance_types =
       (option_of_yojson
          (value_for_key compliance_types_of_yojson "ComplianceTypes") _list
          path);
     config_rule_names =
       (option_of_yojson
          (value_for_key config_rule_names_of_yojson "ConfigRuleNames") _list
          path)
   } : describe_compliance_by_config_rule_request)
let aggregation_authorization_list_of_yojson tree path =
  list_of_yojson aggregation_authorization_of_yojson tree path
let describe_aggregation_authorizations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     aggregation_authorizations =
       (option_of_yojson
          (value_for_key aggregation_authorization_list_of_yojson
             "AggregationAuthorizations") _list path)
   } : describe_aggregation_authorizations_response)
let describe_aggregation_authorizations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key string__of_yojson "NextToken") _list
          path);
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path)
   } : describe_aggregation_authorizations_request)
let aggregate_conformance_pack_compliance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_rule_count =
       (option_of_yojson (value_for_key integer__of_yojson "TotalRuleCount")
          _list path);
     non_compliant_rule_count =
       (option_of_yojson
          (value_for_key integer__of_yojson "NonCompliantRuleCount") _list
          path);
     compliant_rule_count =
       (option_of_yojson
          (value_for_key integer__of_yojson "CompliantRuleCount") _list path);
     compliance_type =
       (option_of_yojson
          (value_for_key conformance_pack_compliance_type_of_yojson
             "ComplianceType") _list path)
   } : aggregate_conformance_pack_compliance)
let aggregate_compliance_by_conformance_pack_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_region =
       (option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion")
          _list path);
     account_id =
       (option_of_yojson (value_for_key account_id_of_yojson "AccountId")
          _list path);
     compliance =
       (option_of_yojson
          (value_for_key aggregate_conformance_pack_compliance_of_yojson
             "Compliance") _list path);
     conformance_pack_name =
       (option_of_yojson
          (value_for_key conformance_pack_name_of_yojson
             "ConformancePackName") _list path)
   } : aggregate_compliance_by_conformance_pack)
let aggregate_compliance_by_conformance_pack_list_of_yojson tree path =
  list_of_yojson aggregate_compliance_by_conformance_pack_of_yojson tree path
let describe_aggregate_compliance_by_conformance_packs_response_of_yojson
  tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     aggregate_compliance_by_conformance_packs =
       (option_of_yojson
          (value_for_key
             aggregate_compliance_by_conformance_pack_list_of_yojson
             "AggregateComplianceByConformancePacks") _list path)
   } : describe_aggregate_compliance_by_conformance_packs_response)
let aggregate_conformance_pack_compliance_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_region =
       (option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion")
          _list path);
     account_id =
       (option_of_yojson (value_for_key account_id_of_yojson "AccountId")
          _list path);
     compliance_type =
       (option_of_yojson
          (value_for_key conformance_pack_compliance_type_of_yojson
             "ComplianceType") _list path);
     conformance_pack_name =
       (option_of_yojson
          (value_for_key conformance_pack_name_of_yojson
             "ConformancePackName") _list path)
   } : aggregate_conformance_pack_compliance_filters)
let describe_aggregate_compliance_by_conformance_packs_request_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     filters =
       (option_of_yojson
          (value_for_key
             aggregate_conformance_pack_compliance_filters_of_yojson
             "Filters") _list path);
     configuration_aggregator_name =
       (value_for_key configuration_aggregator_name_of_yojson
          "ConfigurationAggregatorName" _list path)
   } : describe_aggregate_compliance_by_conformance_packs_request)
let aggregate_compliance_by_config_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_region =
       (option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion")
          _list path);
     account_id =
       (option_of_yojson (value_for_key account_id_of_yojson "AccountId")
          _list path);
     compliance =
       (option_of_yojson (value_for_key compliance_of_yojson "Compliance")
          _list path);
     config_rule_name =
       (option_of_yojson
          (value_for_key config_rule_name_of_yojson "ConfigRuleName") _list
          path)
   } : aggregate_compliance_by_config_rule)
let aggregate_compliance_by_config_rule_list_of_yojson tree path =
  list_of_yojson aggregate_compliance_by_config_rule_of_yojson tree path
let describe_aggregate_compliance_by_config_rules_response_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     aggregate_compliance_by_config_rules =
       (option_of_yojson
          (value_for_key aggregate_compliance_by_config_rule_list_of_yojson
             "AggregateComplianceByConfigRules") _list path)
   } : describe_aggregate_compliance_by_config_rules_response)
let config_rule_compliance_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_region =
       (option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion")
          _list path);
     account_id =
       (option_of_yojson (value_for_key account_id_of_yojson "AccountId")
          _list path);
     compliance_type =
       (option_of_yojson
          (value_for_key compliance_type_of_yojson "ComplianceType") _list
          path);
     config_rule_name =
       (option_of_yojson
          (value_for_key config_rule_name_of_yojson "ConfigRuleName") _list
          path)
   } : config_rule_compliance_filters)
let describe_aggregate_compliance_by_config_rules_request_of_yojson tree path
  =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     limit =
       (option_of_yojson (value_for_key group_by_api_limit_of_yojson "Limit")
          _list path);
     filters =
       (option_of_yojson
          (value_for_key config_rule_compliance_filters_of_yojson "Filters")
          _list path);
     configuration_aggregator_name =
       (value_for_key configuration_aggregator_name_of_yojson
          "ConfigurationAggregatorName" _list path)
   } : describe_aggregate_compliance_by_config_rules_request)
let deliver_config_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_snapshot_id =
       (option_of_yojson (value_for_key string__of_yojson "configSnapshotId")
          _list path)
   } : deliver_config_snapshot_response)
let deliver_config_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_channel_name =
       (value_for_key channel_name_of_yojson "deliveryChannelName" _list path)
   } : deliver_config_snapshot_request)
let delete_stored_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_stored_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ query_name = (value_for_key query_name_of_yojson "QueryName" _list path)
   } : delete_stored_query_request)
let delete_retention_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retention_configuration_name =
       (value_for_key retention_configuration_name_of_yojson
          "RetentionConfigurationName" _list path)
   } : delete_retention_configuration_request)
let delete_resource_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id =
       (value_for_key resource_id_of_yojson "ResourceId" _list path);
     resource_type =
       (value_for_key resource_type_string_of_yojson "ResourceType" _list
          path)
   } : delete_resource_config_request)
let no_such_remediation_exception_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : no_such_remediation_exception_exception)
let failed_delete_remediation_exceptions_batch_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_items =
       (option_of_yojson
          (value_for_key remediation_exception_resource_keys_of_yojson
             "FailedItems") _list path);
     failure_message =
       (option_of_yojson (value_for_key string__of_yojson "FailureMessage")
          _list path)
   } : failed_delete_remediation_exceptions_batch)
let failed_delete_remediation_exceptions_batches_of_yojson tree path =
  list_of_yojson failed_delete_remediation_exceptions_batch_of_yojson tree
    path
let delete_remediation_exceptions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_batches =
       (option_of_yojson
          (value_for_key
             failed_delete_remediation_exceptions_batches_of_yojson
             "FailedBatches") _list path)
   } : delete_remediation_exceptions_response)
let delete_remediation_exceptions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_keys =
       (value_for_key remediation_exception_resource_keys_of_yojson
          "ResourceKeys" _list path);
     config_rule_name =
       (value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path)
   } : delete_remediation_exceptions_request)
let remediation_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : remediation_in_progress_exception)
let delete_remediation_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_remediation_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       (option_of_yojson (value_for_key string__of_yojson "ResourceType")
          _list path);
     config_rule_name =
       (value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path)
   } : delete_remediation_configuration_request)
let delete_pending_aggregation_request_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requester_aws_region =
       (value_for_key aws_region_of_yojson "RequesterAwsRegion" _list path);
     requester_account_id =
       (value_for_key account_id_of_yojson "RequesterAccountId" _list path)
   } : delete_pending_aggregation_request_request)
let delete_organization_conformance_pack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_conformance_pack_name =
       (value_for_key organization_conformance_pack_name_of_yojson
          "OrganizationConformancePackName" _list path)
   } : delete_organization_conformance_pack_request)
let delete_organization_config_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_config_rule_name =
       (value_for_key organization_config_rule_name_of_yojson
          "OrganizationConfigRuleName" _list path)
   } : delete_organization_config_rule_request)
let delete_evaluation_results_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_evaluation_results_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name =
       (value_for_key string_with_char_limit64_of_yojson "ConfigRuleName"
          _list path)
   } : delete_evaluation_results_request)
let last_delivery_channel_delete_failed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : last_delivery_channel_delete_failed_exception)
let delete_delivery_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_channel_name =
       (value_for_key channel_name_of_yojson "DeliveryChannelName" _list path)
   } : delete_delivery_channel_request)
let delete_conformance_pack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_name =
       (value_for_key conformance_pack_name_of_yojson "ConformancePackName"
          _list path)
   } : delete_conformance_pack_request)
let delete_configuration_recorder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder_name =
       (value_for_key recorder_name_of_yojson "ConfigurationRecorderName"
          _list path)
   } : delete_configuration_recorder_request)
let delete_configuration_aggregator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator_name =
       (value_for_key configuration_aggregator_name_of_yojson
          "ConfigurationAggregatorName" _list path)
   } : delete_configuration_aggregator_request)
let delete_config_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name =
       (value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path)
   } : delete_config_rule_request)
let delete_aggregation_authorization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authorized_aws_region =
       (value_for_key aws_region_of_yojson "AuthorizedAwsRegion" _list path);
     authorized_account_id =
       (value_for_key account_id_of_yojson "AuthorizedAccountId" _list path)
   } : delete_aggregation_authorization_request)
let base_configuration_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_item_delivery_time =
       (option_of_yojson
          (value_for_key configuration_item_delivery_time_of_yojson
             "configurationItemDeliveryTime") _list path);
     recording_frequency =
       (option_of_yojson
          (value_for_key recording_frequency_of_yojson "recordingFrequency")
          _list path);
     supplementary_configuration =
       (option_of_yojson
          (value_for_key supplementary_configuration_of_yojson
             "supplementaryConfiguration") _list path);
     configuration =
       (option_of_yojson
          (value_for_key configuration_of_yojson "configuration") _list path);
     resource_creation_time =
       (option_of_yojson
          (value_for_key resource_creation_time_of_yojson
             "resourceCreationTime") _list path);
     availability_zone =
       (option_of_yojson
          (value_for_key availability_zone_of_yojson "availabilityZone")
          _list path);
     aws_region =
       (option_of_yojson (value_for_key aws_region_of_yojson "awsRegion")
          _list path);
     resource_name =
       (option_of_yojson
          (value_for_key resource_name_of_yojson "resourceName") _list path);
     resource_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "resourceId")
          _list path);
     resource_type =
       (option_of_yojson
          (value_for_key resource_type_of_yojson "resourceType") _list path);
     arn = (option_of_yojson (value_for_key ar_n_of_yojson "arn") _list path);
     configuration_state_id =
       (option_of_yojson
          (value_for_key configuration_state_id_of_yojson
             "configurationStateId") _list path);
     configuration_item_status =
       (option_of_yojson
          (value_for_key configuration_item_status_of_yojson
             "configurationItemStatus") _list path);
     configuration_item_capture_time =
       (option_of_yojson
          (value_for_key configuration_item_capture_time_of_yojson
             "configurationItemCaptureTime") _list path);
     account_id =
       (option_of_yojson (value_for_key account_id_of_yojson "accountId")
          _list path);
     version =
       (option_of_yojson (value_for_key version_of_yojson "version") _list
          path)
   } : base_configuration_item)
let base_configuration_items_of_yojson tree path =
  list_of_yojson base_configuration_item_of_yojson tree path
let batch_get_resource_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unprocessed_resource_keys =
       (option_of_yojson
          (value_for_key resource_keys_of_yojson "unprocessedResourceKeys")
          _list path);
     base_configuration_items =
       (option_of_yojson
          (value_for_key base_configuration_items_of_yojson
             "baseConfigurationItems") _list path)
   } : batch_get_resource_config_response)
let batch_get_resource_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_keys =
       (value_for_key resource_keys_of_yojson "resourceKeys" _list path)
   } : batch_get_resource_config_request)
let batch_get_aggregate_resource_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unprocessed_resource_identifiers =
       (option_of_yojson
          (value_for_key unprocessed_resource_identifier_list_of_yojson
             "UnprocessedResourceIdentifiers") _list path);
     base_configuration_items =
       (option_of_yojson
          (value_for_key base_configuration_items_of_yojson
             "BaseConfigurationItems") _list path)
   } : batch_get_aggregate_resource_config_response)
let resource_identifiers_list_of_yojson tree path =
  list_of_yojson aggregate_resource_identifier_of_yojson tree path
let batch_get_aggregate_resource_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_identifiers =
       (value_for_key resource_identifiers_list_of_yojson
          "ResourceIdentifiers" _list path);
     configuration_aggregator_name =
       (value_for_key configuration_aggregator_name_of_yojson
          "ConfigurationAggregatorName" _list path)
   } : batch_get_aggregate_resource_config_request)
let base_string_of_yojson = string_of_yojson
let base_boolean_of_yojson = bool_of_yojson
let base_integer_of_yojson = int_of_yojson
let base_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let base_long_of_yojson = long_of_yojson
let base_document_of_yojson = json_of_yojson