(** 
    Config Service client library built on EIO.
    
*)

(** {1:types Types} *)

type nonrec version = string[@@ocaml.doc ""]
type nonrec value = string[@@ocaml.doc ""]
type nonrec error_message = string[@@ocaml.doc ""]
type nonrec validation_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "The requested operation is not valid. You will see this exception if there are missing required fields or if the input value fails the validation.\n\n For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutStoredQuery.html}PutStoredQuery}, one of the following errors:\n \n  {ul\n        {-  There are missing required fields.\n            \n             }\n        {-  The input value fails the validation.\n            \n             }\n        {-  You are trying to create more than 300 queries.\n            \n             }\n        }\n   For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DescribeConfigurationRecorders.html}DescribeConfigurationRecorders} and {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DescribeConfigurationRecorderStatus.html}DescribeConfigurationRecorderStatus}, one of the following errors:\n   \n    {ul\n          {-  You have specified more than one configuration recorder.\n              \n               }\n          {-  You have provided a service principal for service-linked configuration recorder that is not valid.\n              \n               }\n          }\n   For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_AssociateResourceTypes.html}AssociateResourceTypes} and {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DisassociateResourceTypes.html}DisassociateResourceTypes}, one of the following errors:\n   \n    {ul\n          {-  Your configuraiton recorder has a recording strategy that does not allow the association or disassociation of resource types.\n              \n               }\n          {-  One or more of the specified resource types are already associated or disassociated with the configuration recorder.\n              \n               }\n          {-  For service-linked configuration recorders, the configuration recorder does not record one or more of the specified resource types.\n              \n               }\n          }\n  "]
type nonrec amazon_resource_name = string[@@ocaml.doc ""]
type nonrec tag_key = string[@@ocaml.doc ""]
type nonrec tag_key_list = tag_key list[@@ocaml.doc ""]
type nonrec untag_resource_request =
  {
  tag_keys: tag_key_list [@ocaml.doc "The keys of the tags to be removed.\n"];
  resource_arn: amazon_resource_name
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. The following resources are supported:\n\n {ul\n       {-   [ConfigurationRecorder] \n           \n            }\n       {-   [ConfigRule] \n           \n            }\n       {-   [OrganizationConfigRule] \n           \n            }\n       {-   [ConformancePack] \n           \n            }\n       {-   [OrganizationConformancePack] \n           \n            }\n       {-   [ConfigurationAggregator] \n           \n            }\n       {-   [AggregationAuthorization] \n           \n            }\n       {-   [StoredQuery] \n           \n            }\n       }\n  "]}
[@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "You have specified a resource that does not exist.\n"]
type nonrec account_id = string[@@ocaml.doc ""]
type nonrec aws_region = string[@@ocaml.doc ""]
type nonrec resource_id = string[@@ocaml.doc ""]
type nonrec resource_type =
  | TransferProfile [@ocaml.doc ""]
  | SecurityHubStandard [@ocaml.doc ""]
  | SageMakerInferenceExperiment [@ocaml.doc ""]
  | S3ExpressDirectoryBucket [@ocaml.doc ""]
  | S3ExpressBucketPolicy [@ocaml.doc ""]
  | S3StorageLensGroup [@ocaml.doc ""]
  | Route53ProfilesProfile [@ocaml.doc ""]
  | RedshiftEndpointAuthorization [@ocaml.doc ""]
  | OpenSearchServerlessVpcEndpoint [@ocaml.doc ""]
  | OpenSearchServerlessCollection [@ocaml.doc ""]
  | MemoryDBSubnetGroup [@ocaml.doc ""]
  | MediaConnectGateway [@ocaml.doc ""]
  | MSKVpcConnection [@ocaml.doc ""]
  | MSKClusterPolicy [@ocaml.doc ""]
  | InspectorV2Activation [@ocaml.doc ""]
  | IAMOIDCProvider [@ocaml.doc ""]
  | EvidentlySegment [@ocaml.doc ""]
  | EC2VPNConnectionRoute [@ocaml.doc ""]
  | EC2VPCEndpointConnectionNotification [@ocaml.doc ""]
  | EC2VPCBlockPublicAccessOptions [@ocaml.doc ""]
  | EC2VPCBlockPublicAccessExclusion [@ocaml.doc ""]
  | EC2SnapshotBlockPublicAccess [@ocaml.doc ""]
  | EC2InstanceConnectEndpoint [@ocaml.doc ""]
  | EC2IPAMResourceDiscoveryAssociation [@ocaml.doc ""]
  | EC2IPAMResourceDiscovery [@ocaml.doc ""]
  | EC2EIPAssociation [@ocaml.doc ""]
  | EC2ClientVpnTargetNetworkAssociation [@ocaml.doc ""]
  | ConnectUser [@ocaml.doc ""]
  | ConnectRule [@ocaml.doc ""]
  | CognitoIdentityPool [@ocaml.doc ""]
  | BedrockKnowledgeBase [@ocaml.doc ""]
  | BedrockGuardrail [@ocaml.doc ""]
  | AppSyncApiCache [@ocaml.doc ""]
  | AppIntegrationsApplication [@ocaml.doc ""]
  | AppConfigExtensionAssociation [@ocaml.doc ""]
  | SSMDocument [@ocaml.doc ""]
  | Route53ResolverFirewallRuleGroup [@ocaml.doc ""]
  | RedshiftEndpointAccess [@ocaml.doc ""]
  | RDSOptionGroup [@ocaml.doc ""]
  | QuickSightTheme [@ocaml.doc ""]
  | QuickSightTemplate [@ocaml.doc ""]
  | QuickSightDataSource [@ocaml.doc ""]
  | M2Environment [@ocaml.doc ""]
  | KMSAlias [@ocaml.doc ""]
  | ImageBuilderImageRecipe [@ocaml.doc ""]
  | GroundStationDataflowEndpointGroup [@ocaml.doc ""]
  | GrafanaWorkspace [@ocaml.doc ""]
  | EC2NetworkInsightsAnalysis [@ocaml.doc ""]
  | EC2NetworkInsightsAccessScope [@ocaml.doc ""]
  | CognitoUserPoolGroup [@ocaml.doc ""]
  | CognitoUserPoolClient [@ocaml.doc ""]
  | CognitoUserPool [@ocaml.doc ""]
  | AppStreamFleet [@ocaml.doc ""]
  | ResourceExplorer2Index [@ocaml.doc ""]
  | NetworkManagerConnectPeer [@ocaml.doc ""]
  | LambdaCodeSigningConfig [@ocaml.doc ""]
  | KafkaConnectConnector [@ocaml.doc ""]
  | IoTTwinMakerSyncJob [@ocaml.doc ""]
  | IoTCACertificate [@ocaml.doc ""]
  | IAMInstanceProfile [@ocaml.doc ""]
  | ECSCapacityProvider [@ocaml.doc ""]
  | EC2TransitGatewayMulticastDomain [@ocaml.doc ""]
  | EC2TransitGatewayConnect [@ocaml.doc ""]
  | EC2IPAMPool [@ocaml.doc ""]
  | EC2CarrierGateway [@ocaml.doc ""]
  | ConnectQuickConnect [@ocaml.doc ""]
  | ConnectInstance [@ocaml.doc ""]
  | AppMeshMesh [@ocaml.doc ""]
  | AppMeshGatewayRoute [@ocaml.doc ""]
  | ACMPCACertificateAuthorityActivation [@ocaml.doc ""]
  | BatchSchedulingPolicy [@ocaml.doc ""]
  | Route53ResolverResolverQueryLoggingConfig [@ocaml.doc ""]
  | CodeGuruProfilerProfilingGroup [@ocaml.doc ""]
  | APSRuleGroupsNamespace [@ocaml.doc ""]
  | MediaConnectFlowSource [@ocaml.doc ""]
  | TransferCertificate [@ocaml.doc ""]
  | ServiceDiscoveryInstance [@ocaml.doc ""]
  | Route53ResolverResolverQueryLoggingConfigAssociation [@ocaml.doc ""]
  | InspectorV2Filter [@ocaml.doc ""]
  | IoTProvisioningTemplate [@ocaml.doc ""]
  | IoTWirelessFuotaTask [@ocaml.doc ""]
  | IoTJobTemplate [@ocaml.doc ""]
  | AppStreamStack [@ocaml.doc ""]
  | MSKBatchScramSecret [@ocaml.doc ""]
  | SageMakerFeatureGroup [@ocaml.doc ""]
  | CodeBuildReportGroup [@ocaml.doc ""]
  | IoTTwinMakerComponentType [@ocaml.doc ""]
  | PersonalizeDatasetGroup [@ocaml.doc ""]
  | IoTWirelessMulticastGroup [@ocaml.doc ""]
  | NetworkManagerLinkAssociation [@ocaml.doc ""]
  | NetworkManagerCustomerGatewayAssociation [@ocaml.doc ""]
  | S3AccessPoint [@ocaml.doc ""]
  | PinpointEmailChannel [@ocaml.doc ""]
  | LogsDestination [@ocaml.doc ""]
  | KinesisVideoStream [@ocaml.doc ""]
  | KendraIndex [@ocaml.doc ""]
  | EC2ClientVpnEndpoint [@ocaml.doc ""]
  | EC2CapacityReservation [@ocaml.doc ""]
  | DMSEndpoint [@ocaml.doc ""]
  | CustomerProfilesObjectType [@ocaml.doc ""]
  | AppRunnerService [@ocaml.doc ""]
  | AppMeshVirtualRouter [@ocaml.doc ""]
  | AppMeshVirtualGateway [@ocaml.doc ""]
  | AppConfigHostedConfigurationVersion [@ocaml.doc ""]
  | ACMPCACertificateAuthority [@ocaml.doc ""]
  | ResilienceHubApp [@ocaml.doc ""]
  | PinpointEventStream [@ocaml.doc ""]
  | PinpointEmailTemplate [@ocaml.doc ""]
  | PersonalizeSolution [@ocaml.doc ""]
  | PersonalizeSchema [@ocaml.doc ""]
  | PersonalizeDataset [@ocaml.doc ""]
  | MSKConfiguration [@ocaml.doc ""]
  | MediaTailorPlaybackConfiguration [@ocaml.doc ""]
  | MediaConnectFlowVpcInterface [@ocaml.doc ""]
  | MediaConnectFlowEntitlement [@ocaml.doc ""]
  | GroundStationMissionProfile [@ocaml.doc ""]
  | GreengrassV2ComponentVersion [@ocaml.doc ""]
  | ForecastDatasetGroup [@ocaml.doc ""]
  | EvidentlyLaunch [@ocaml.doc ""]
  | EC2IPAMScope [@ocaml.doc ""]
  | AthenaPreparedStatement [@ocaml.doc ""]
  | AppMeshRoute [@ocaml.doc ""]
  | AppIntegrationsEventIntegration [@ocaml.doc ""]
  | AmplifyBranch [@ocaml.doc ""]
  | KinesisFirehoseDeliveryStream [@ocaml.doc ""]
  | TransferConnector [@ocaml.doc ""]
  | TransferAgreement [@ocaml.doc ""]
  | SageMakerDomain [@ocaml.doc ""]
  | PinpointInAppTemplate [@ocaml.doc ""]
  | PinpointCampaign [@ocaml.doc ""]
  | IAMServerCertificate [@ocaml.doc ""]
  | IAMSAMLProvider [@ocaml.doc ""]
  | ForecastDataset [@ocaml.doc ""]
  | EvidentlyProject [@ocaml.doc ""]
  | EC2SpotFleet [@ocaml.doc ""]
  | EC2PrefixList [@ocaml.doc ""]
  | CodeArtifactRepository [@ocaml.doc ""]
  | AppStreamApplication [@ocaml.doc ""]
  | AppRunnerVpcConnector [@ocaml.doc ""]
  | AppMeshVirtualService [@ocaml.doc ""]
  | AppMeshVirtualNode [@ocaml.doc ""]
  | AmplifyApp [@ocaml.doc ""]
  | SignerSigningProfile [@ocaml.doc ""]
  | CassandraKeyspace [@ocaml.doc ""]
  | ECSTaskSet [@ocaml.doc ""]
  | SageMakerImage [@ocaml.doc ""]
  | SageMakerAppImageConfig [@ocaml.doc ""]
  | Route53ResolverFirewallRuleGroupAssociation [@ocaml.doc ""]
  | RedshiftScheduledAction [@ocaml.doc ""]
  | PinpointApp [@ocaml.doc ""]
  | PanoramaPackage [@ocaml.doc ""]
  | NetworkManagerSite [@ocaml.doc ""]
  | NetworkManagerLink [@ocaml.doc ""]
  | NetworkManagerGlobalNetwork [@ocaml.doc ""]
  | NetworkManagerDevice [@ocaml.doc ""]
  | IoTWirelessServiceProfile [@ocaml.doc ""]
  | IoTFleetMetric [@ocaml.doc ""]
  | ImageBuilderImagePipeline [@ocaml.doc ""]
  | GroundStationConfig [@ocaml.doc ""]
  | ECRPullThroughCacheRule [@ocaml.doc ""]
  | EC2SubnetRouteTableAssociation [@ocaml.doc ""]
  | EC2EC2Fleet [@ocaml.doc ""]
  | DeviceFarmProject [@ocaml.doc ""]
  | DeviceFarmInstanceProfile [@ocaml.doc ""]
  | CloudWatchMetricStream [@ocaml.doc ""]
  | AuditManagerAssessment [@ocaml.doc ""]
  | AppFlowFlow [@ocaml.doc ""]
  | AppConfigDeploymentStrategy [@ocaml.doc ""]
  | ConnectPhoneNumber [@ocaml.doc ""]
  | AutoScalingWarmPool [@ocaml.doc ""]
  | CustomerProfilesDomain [@ocaml.doc ""]
  | NetworkManagerTransitGatewayRegistration [@ocaml.doc ""]
  | IoTTwinMakerScene [@ocaml.doc ""]
  | EC2IPAM [@ocaml.doc ""]
  | EC2TrafficMirrorFilter [@ocaml.doc ""]
  | EC2NetworkInsightsPath [@ocaml.doc ""]
  | EC2DHCPOptions [@ocaml.doc ""]
  | EventsRule [@ocaml.doc ""]
  | PinpointApplicationSettings [@ocaml.doc ""]
  | PinpointSegment [@ocaml.doc ""]
  | HealthLakeFHIRDatastore [@ocaml.doc ""]
  | RoboMakerRobotApplication [@ocaml.doc ""]
  | RoboMakerSimulationApplication [@ocaml.doc ""]
  | Route53RecoveryReadinessResourceSet [@ocaml.doc ""]
  | Route53RecoveryControlRoutingControl [@ocaml.doc ""]
  | Route53RecoveryControlControlPanel [@ocaml.doc ""]
  | Route53RecoveryControlSafetyRule [@ocaml.doc ""]
  | Route53RecoveryControlCluster [@ocaml.doc ""]
  | LookoutVisionProject [@ocaml.doc ""]
  | AppStreamDirectoryConfig [@ocaml.doc ""]
  | KinesisVideoSignalingChannel [@ocaml.doc ""]
  | MediaPackagePackagingConfiguration [@ocaml.doc ""]
  | EventSchemasSchema [@ocaml.doc ""]
  | EventsConnection [@ocaml.doc ""]
  | IoTScheduledAudit [@ocaml.doc ""]
  | S3StorageLens [@ocaml.doc ""]
  | EC2TrafficMirrorTarget [@ocaml.doc ""]
  | IoTAccountAuditConfiguration [@ocaml.doc ""]
  | LookoutMetricsAlert [@ocaml.doc ""]
  | LexBotAlias [@ocaml.doc ""]
  | IoTSiteWiseGateway [@ocaml.doc ""]
  | EC2TrafficMirrorSession [@ocaml.doc ""]
  | RoboMakerRobotApplicationVersion [@ocaml.doc ""]
  | Route53ResolverFirewallDomainList [@ocaml.doc ""]
  | IoTCustomMetric [@ocaml.doc ""]
  | CodeGuruReviewerRepositoryAssociation [@ocaml.doc ""]
  | LexBot [@ocaml.doc ""]
  | BudgetsBudgetsAction [@ocaml.doc ""]
  | DeviceFarmTestGridProject [@ocaml.doc ""]
  | S3MultiRegionAccessPoint [@ocaml.doc ""]
  | RDSGlobalCluster [@ocaml.doc ""]
  | KinesisAnalyticsV2Application [@ocaml.doc ""]
  | IVSPlaybackKeyPair [@ocaml.doc ""]
  | IVSRecordingConfiguration [@ocaml.doc ""]
  | IVSChannel [@ocaml.doc ""]
  | IoTSiteWiseAssetModel [@ocaml.doc ""]
  | IoTSiteWisePortal [@ocaml.doc ""]
  | IoTSiteWiseProject [@ocaml.doc ""]
  | IoTSiteWiseDashboard [@ocaml.doc ""]
  | IoTAnalyticsChannel [@ocaml.doc ""]
  | IoTAnalyticsPipeline [@ocaml.doc ""]
  | IoTAnalyticsDataset [@ocaml.doc ""]
  | IoTTwinMakerEntity [@ocaml.doc ""]
  | IoTTwinMakerWorkspace [@ocaml.doc ""]
  | IoTMitigationAction [@ocaml.doc ""]
  | IoTPolicy [@ocaml.doc ""]
  | GlueMLTransform [@ocaml.doc ""]
  | EKSAddon [@ocaml.doc ""]
  | EKSIdentityProviderConfig [@ocaml.doc ""]
  | TransferWorkflow [@ocaml.doc ""]
  | ResilienceHubResiliencyPolicy [@ocaml.doc ""]
  | Route53RecoveryReadinessRecoveryGroup [@ocaml.doc ""]
  | MediaPackagePackagingGroup [@ocaml.doc ""]
  | LightsailStaticIp [@ocaml.doc ""]
  | LightsailBucket [@ocaml.doc ""]
  | IoTAnalyticsDatastore [@ocaml.doc ""]
  | IoTDimension [@ocaml.doc ""]
  | IoTRoleAlias [@ocaml.doc ""]
  | IoTSecurityProfile [@ocaml.doc ""]
  | IoTAuthorizer [@ocaml.doc ""]
  | FraudDetectorOutcome [@ocaml.doc ""]
  | FraudDetectorVariable [@ocaml.doc ""]
  | FraudDetectorEntityType [@ocaml.doc ""]
  | FraudDetectorLabel [@ocaml.doc ""]
  | EventSchemasDiscoverer [@ocaml.doc ""]
  | EventSchemasRegistryPolicy [@ocaml.doc ""]
  | EventSchemasRegistry [@ocaml.doc ""]
  | Cloud9EnvironmentEC2 [@ocaml.doc ""]
  | AppConfigConfigurationProfile [@ocaml.doc ""]
  | AppConfigEnvironment [@ocaml.doc ""]
  | AmazonMQBroker [@ocaml.doc ""]
  | SESTemplate [@ocaml.doc ""]
  | GuardDutyFilter [@ocaml.doc ""]
  | SESReceiptFilter [@ocaml.doc ""]
  | DataSyncLocationFSxWindows [@ocaml.doc ""]
  | FISExperimentTemplate [@ocaml.doc ""]
  | LightsailDisk [@ocaml.doc ""]
  | EventsApiDestination [@ocaml.doc ""]
  | EventsArchive [@ocaml.doc ""]
  | SESReceiptRuleSet [@ocaml.doc ""]
  | EventsEndpoint [@ocaml.doc ""]
  | RUMAppMonitor [@ocaml.doc ""]
  | LightsailCertificate [@ocaml.doc ""]
  | BackupReportPlan [@ocaml.doc ""]
  | ECRRegistryPolicy [@ocaml.doc ""]
  | Route53RecoveryReadinessReadinessCheck [@ocaml.doc ""]
  | Route53RecoveryReadinessCell [@ocaml.doc ""]
  | GlueClassifier [@ocaml.doc ""]
  | DataSyncLocationHDFS [@ocaml.doc ""]
  | DataSyncLocationObjectStorage [@ocaml.doc ""]
  | ImageBuilderInfrastructureConfiguration [@ocaml.doc ""]
  | ImageBuilderDistributionConfiguration [@ocaml.doc ""]
  | ImageBuilderContainerRecipe [@ocaml.doc ""]
  | EventsEventBus [@ocaml.doc ""]
  | ServiceDiscoveryHttpNamespace [@ocaml.doc ""]
  | IoTEventsAlarmModel [@ocaml.doc ""]
  | IoTEventsDetectorModel [@ocaml.doc ""]
  | IoTEventsInput [@ocaml.doc ""]
  | Route53HostedZone [@ocaml.doc ""]
  | SESConfigurationSet [@ocaml.doc ""]
  | SESContactList [@ocaml.doc ""]
  | ServiceDiscoveryPublicDnsNamespace [@ocaml.doc ""]
  | ServiceDiscoveryService [@ocaml.doc ""]
  | SageMakerNotebookInstanceLifecycleConfig [@ocaml.doc ""]
  | SageMakerWorkteam [@ocaml.doc ""]
  | GuardDutyIPSet [@ocaml.doc ""]
  | GuardDutyThreatIntelSet [@ocaml.doc ""]
  | GlueJob [@ocaml.doc ""]
  | EKSFargateProfile [@ocaml.doc ""]
  | NetworkInsightsAccessScopeAnalysis [@ocaml.doc ""]
  | DataSyncLocationNFS [@ocaml.doc ""]
  | DataSyncTask [@ocaml.doc ""]
  | DataSyncLocationEFS [@ocaml.doc ""]
  | DataSyncLocationS3 [@ocaml.doc ""]
  | DataSyncLocationFSxLustre [@ocaml.doc ""]
  | DataSyncLocationSMB [@ocaml.doc ""]
  | AppSyncGraphQLApi [@ocaml.doc ""]
  | AppConfigApplication [@ocaml.doc ""]
  | DMSCertificate [@ocaml.doc ""]
  | TransitGatewayRouteTable [@ocaml.doc ""]
  | TransitGatewayAttachment [@ocaml.doc ""]
  | GlobalAcceleratorListener [@ocaml.doc ""]
  | GlobalAcceleratorEndpointGroup [@ocaml.doc ""]
  | GlobalAcceleratorAccelerator [@ocaml.doc ""]
  | DetectiveGraph [@ocaml.doc ""]
  | AthenaDataCatalog [@ocaml.doc ""]
  | AthenaWorkGroup [@ocaml.doc ""]
  | AccessAnalyzerAnalyzer [@ocaml.doc ""]
  | BatchComputeEnvironment [@ocaml.doc ""]
  | BatchJobQueue [@ocaml.doc ""]
  | StepFunctionsStateMachine [@ocaml.doc ""]
  | ListenerV2 [@ocaml.doc ""]
  | SageMakerModel [@ocaml.doc ""]
  | WorkSpacesConnectionAlias [@ocaml.doc ""]
  | WorkSpacesWorkspace [@ocaml.doc ""]
  | StepFunctionsActivity [@ocaml.doc ""]
  | MSKCluster [@ocaml.doc ""]
  | DMSEventSubscription [@ocaml.doc ""]
  | DMSReplicationSubnetGroup [@ocaml.doc ""]
  | Route53ResolverResolverRuleAssociation [@ocaml.doc ""]
  | Route53ResolverResolverRule [@ocaml.doc ""]
  | Route53ResolverResolverEndpoint [@ocaml.doc ""]
  | SageMakerCodeRepository [@ocaml.doc ""]
  | EMRSecurityConfiguration [@ocaml.doc ""]
  | GuardDutyDetector [@ocaml.doc ""]
  | ECRPublicRepository [@ocaml.doc ""]
  | LaunchTemplate [@ocaml.doc ""]
  | CodeDeployDeploymentGroup [@ocaml.doc ""]
  | CodeDeployDeploymentConfig [@ocaml.doc ""]
  | CodeDeployApplication [@ocaml.doc ""]
  | KinesisStreamConsumer [@ocaml.doc ""]
  | KinesisStream [@ocaml.doc ""]
  | TransitGateway [@ocaml.doc ""]
  | OpenSearchDomain [@ocaml.doc ""]
  | EKSCluster [@ocaml.doc ""]
  | EFSFileSystem [@ocaml.doc ""]
  | EFSAccessPoint [@ocaml.doc ""]
  | ECSTaskDefinition [@ocaml.doc ""]
  | ECSService [@ocaml.doc ""]
  | ECSCluster [@ocaml.doc ""]
  | ECRRepository [@ocaml.doc ""]
  | BackupRecoveryPoint [@ocaml.doc ""]
  | BackupVault [@ocaml.doc ""]
  | BackupSelection [@ocaml.doc ""]
  | BackupPlan [@ocaml.doc ""]
  | FileData [@ocaml.doc ""]
  | Topic [@ocaml.doc ""]
  | Secret [@ocaml.doc ""]
  | QLDBLedger [@ocaml.doc ""]
  | Key [@ocaml.doc ""]
  | Queue [@ocaml.doc ""]
  | Portfolio [@ocaml.doc ""]
  | CloudFormationProduct [@ocaml.doc ""]
  | CloudFormationProvisionedProduct [@ocaml.doc ""]
  | Pipeline [@ocaml.doc ""]
  | Api [@ocaml.doc ""]
  | StageV2 [@ocaml.doc ""]
  | RestApi [@ocaml.doc ""]
  | Stage [@ocaml.doc ""]
  | ResourceCompliance [@ocaml.doc ""]
  | ConformancePackCompliance [@ocaml.doc ""]
  | RegionalProtection [@ocaml.doc ""]
  | Protection [@ocaml.doc ""]
  | PatchCompliance [@ocaml.doc ""]
  | AssociationCompliance [@ocaml.doc ""]
  | EncryptionConfig [@ocaml.doc ""]
  | ManagedRuleSetV2 [@ocaml.doc ""]
  | RegexPatternSetV2 [@ocaml.doc ""]
  | IPSetV2 [@ocaml.doc ""]
  | RuleGroupV2 [@ocaml.doc ""]
  | WebACLV2 [@ocaml.doc ""]
  | Environment [@ocaml.doc ""]
  | ApplicationVersion [@ocaml.doc ""]
  | Application [@ocaml.doc ""]
  | NetworkFirewallRuleGroup [@ocaml.doc ""]
  | NetworkFirewallFirewallPolicy [@ocaml.doc ""]
  | NetworkFirewallFirewall [@ocaml.doc ""]
  | Function [@ocaml.doc ""]
  | StreamingDistribution [@ocaml.doc ""]
  | Distribution [@ocaml.doc ""]
  | RegionalWebACL [@ocaml.doc ""]
  | RegionalRuleGroup [@ocaml.doc ""]
  | RegionalRule [@ocaml.doc ""]
  | RegionalRateBasedRule [@ocaml.doc ""]
  | WebACL [@ocaml.doc ""]
  | RuleGroup [@ocaml.doc ""]
  | Rule [@ocaml.doc ""]
  | RateBasedRule [@ocaml.doc ""]
  | Project [@ocaml.doc ""]
  | Table [@ocaml.doc ""]
  | ScheduledAction [@ocaml.doc ""]
  | ScalingPolicy [@ocaml.doc ""]
  | LaunchConfiguration [@ocaml.doc ""]
  | AutoScalingGroup [@ocaml.doc ""]
  | LoadBalancer [@ocaml.doc ""]
  | Stack [@ocaml.doc ""]
  | Alarm [@ocaml.doc ""]
  | ManagedInstanceInventory [@ocaml.doc ""]
  | RedshiftEventSubscription [@ocaml.doc ""]
  | ClusterSubnetGroup [@ocaml.doc ""]
  | ClusterSecurityGroup [@ocaml.doc ""]
  | ClusterParameterGroup [@ocaml.doc ""]
  | ClusterSnapshot [@ocaml.doc ""]
  | Cluster [@ocaml.doc ""]
  | AccountPublicAccessBlock [@ocaml.doc ""]
  | Bucket [@ocaml.doc ""]
  | EventSubscription [@ocaml.doc ""]
  | DBClusterSnapshot [@ocaml.doc ""]
  | DBCluster [@ocaml.doc ""]
  | DBSnapshot [@ocaml.doc ""]
  | DBSecurityGroup [@ocaml.doc ""]
  | DBSubnetGroup [@ocaml.doc ""]
  | DBInstance [@ocaml.doc ""]
  | Certificate [@ocaml.doc ""]
  | LoadBalancerV2 [@ocaml.doc ""]
  | User [@ocaml.doc ""]
  | Role [@ocaml.doc ""]
  | Policy [@ocaml.doc ""]
  | Group [@ocaml.doc ""]
  | Domain [@ocaml.doc ""]
  | VPCPeeringConnection [@ocaml.doc ""]
  | FlowLog [@ocaml.doc ""]
  | VPCEndpointService [@ocaml.doc ""]
  | VPCEndpoint [@ocaml.doc ""]
  | EgressOnlyInternetGateway [@ocaml.doc ""]
  | NatGateway [@ocaml.doc ""]
  | RegisteredHAInstance [@ocaml.doc ""]
  | VPNGateway [@ocaml.doc ""]
  | VPNConnection [@ocaml.doc ""]
  | VPC [@ocaml.doc ""]
  | Volume [@ocaml.doc ""]
  | Trail [@ocaml.doc ""]
  | Subnet [@ocaml.doc ""]
  | SecurityGroup [@ocaml.doc ""]
  | RouteTable [@ocaml.doc ""]
  | NetworkInterface [@ocaml.doc ""]
  | NetworkAcl [@ocaml.doc ""]
  | InternetGateway [@ocaml.doc ""]
  | Instance [@ocaml.doc ""]
  | Host [@ocaml.doc ""]
  | EIP [@ocaml.doc ""]
  | CustomerGateway [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_name = string[@@ocaml.doc ""]
type nonrec aggregate_resource_identifier =
  {
  resource_name: resource_name option
    [@ocaml.doc "The name of the Amazon Web Services resource.\n"];
  resource_type: resource_type
    [@ocaml.doc "The type of the Amazon Web Services resource.\n"];
  resource_id: resource_id
    [@ocaml.doc "The ID of the Amazon Web Services resource.\n"];
  source_region: aws_region
    [@ocaml.doc "The source region where data is aggregated.\n"];
  source_account_id: account_id
    [@ocaml.doc "The 12-digit account ID of the source account.\n"]}[@@ocaml.doc
                                                                    "The details that identify a resource that is collected by Config aggregator, including the resource type, ID, (if available) the custom resource name, the source account, and source region.\n"]
type nonrec unprocessed_resource_identifier_list =
  aggregate_resource_identifier list[@@ocaml.doc ""]
type nonrec unmodifiable_entity_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "The requested operation is not valid.\n\n For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutConfigurationRecorder.html}PutConfigurationRecorder}, you will see this exception because you cannot use this operation to create a service-linked configuration recorder. Use the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutServiceLinkedConfigurationRecorder.html}PutServiceLinkedConfigurationRecorder} operation to create a service-linked configuration recorder.\n \n  For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DeleteConfigurationRecorder.html}DeleteConfigurationRecorder}, you will see this exception because you cannot use this operation to delete a service-linked configuration recorder. Use the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DeleteServiceLinkedConfigurationRecorder.html}DeleteServiceLinkedConfigurationRecorder} operation to delete a service-linked configuration recorder.\n  \n   For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_StartConfigurationRecorder.html}StartConfigurationRecorder} and {{:https://docs.aws.amazon.com/config/latest/APIReference/API_StopConfigurationRecorder.html}StopConfigurationRecorder}, you will see this exception because these operations do not affect service-linked configuration recorders. Service-linked configuration recorders are always recording. To stop recording, you must delete the service-linked configuration recorder. Use the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DeleteServiceLinkedConfigurationRecorder.html}DeleteServiceLinkedConfigurationRecorder} operation to delete a service-linked configuration recorder.\n   "]
type nonrec too_many_tags_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have reached the limit of the number of tags you can use. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.\n"]
type nonrec date = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec time_window =
  {
  end_time: date option
    [@ocaml.doc
      "The end time of an execution. The end time must be after the start date.\n"];
  start_time: date option [@ocaml.doc "The start time of an execution.\n"]}
[@@ocaml.doc "Filters evaluation results based on start and end times.\n"]
type nonrec ssm_document_name = string[@@ocaml.doc ""]
type nonrec ssm_document_version = string[@@ocaml.doc ""]
type nonrec template_ssm_document_details =
  {
  document_version: ssm_document_version option
    [@ocaml.doc
      "The version of the SSM document to use to create a conformance pack. By default, Config uses the latest version.\n\n  This field is optional.\n  \n   "];
  document_name: ssm_document_name
    [@ocaml.doc
      "The name or Amazon Resource Name (ARN) of the SSM document to use to create a conformance pack. If you use the document name, Config checks only your account and Amazon Web Services Region for the SSM document.\n"]}
[@@ocaml.doc
  "This API allows you to create a conformance pack template with an Amazon Web Services Systems Manager document (SSM document). To deploy a conformance pack using an SSM document, first create an SSM document with conformance pack content, and then provide the [DocumentName] in the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutConformancePack.html}PutConformancePack API}. You can also provide the [DocumentVersion].\n\n The [TemplateSSMDocumentDetails] object contains the name of the SSM document and the version of the SSM document.\n "]
type nonrec template_s3_uri = string[@@ocaml.doc ""]
type nonrec template_body = string[@@ocaml.doc ""]
type nonrec tag_value = string[@@ocaml.doc ""]
type nonrec tag =
  {
  value: tag_value option
    [@ocaml.doc
      "The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key).\n"];
  key: tag_key option
    [@ocaml.doc
      "One part of a key-value pair that make up a tag. A key is a general label that acts like a category for more specific tag values.\n"]}
[@@ocaml.doc
  "The tags for the resource. The metadata that you apply to a resource to help you categorize and organize them. Each tag consists of a key and an optional value, both of which you define. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.\n"]
type nonrec tags_list = tag list[@@ocaml.doc ""]
type nonrec name = string[@@ocaml.doc ""]
type nonrec tags = (name * value) list[@@ocaml.doc ""]
type nonrec tag_list = tag list[@@ocaml.doc ""]
type nonrec tag_resource_request =
  {
  tags: tag_list [@ocaml.doc "An array of tag object.\n"];
  resource_arn: amazon_resource_name
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. The following resources are supported:\n\n {ul\n       {-   [ConfigurationRecorder] \n           \n            }\n       {-   [ConfigRule] \n           \n            }\n       {-   [OrganizationConfigRule] \n           \n            }\n       {-   [ConformancePack] \n           \n            }\n       {-   [OrganizationConformancePack] \n           \n            }\n       {-   [ConfigurationAggregator] \n           \n            }\n       {-   [AggregationAuthorization] \n           \n            }\n       {-   [StoredQuery] \n           \n            }\n       }\n  "]}
[@@ocaml.doc ""]
type nonrec supplementary_configuration_value = string[@@ocaml.doc ""]
type nonrec supplementary_configuration_name = string[@@ocaml.doc ""]
type nonrec supplementary_configuration =
  (supplementary_configuration_name * supplementary_configuration_value) list
[@@ocaml.doc ""]
type nonrec string_with_char_limit768 = string[@@ocaml.doc ""]
type nonrec string_with_char_limit64 = string[@@ocaml.doc ""]
type nonrec string_with_char_limit256_min0 = string[@@ocaml.doc ""]
type nonrec string_with_char_limit256 = string[@@ocaml.doc ""]
type nonrec string_with_char_limit2048 = string[@@ocaml.doc ""]
type nonrec string_with_char_limit128 = string[@@ocaml.doc ""]
type nonrec string_with_char_limit1024 = string[@@ocaml.doc ""]
type nonrec string_ = string[@@ocaml.doc ""]
type nonrec query_id = string[@@ocaml.doc ""]
type nonrec query_arn = string[@@ocaml.doc ""]
type nonrec query_name = string[@@ocaml.doc ""]
type nonrec query_description = string[@@ocaml.doc ""]
type nonrec stored_query_metadata =
  {
  description: query_description option
    [@ocaml.doc "A unique description for the query.\n"];
  query_name: query_name [@ocaml.doc "The name of the query.\n"];
  query_arn: query_arn
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the query. For example, arn:partition:service:region:account-id:resource-type/resource-name/resource-id.\n"];
  query_id: query_id [@ocaml.doc "The ID of the query. \n"]}[@@ocaml.doc
                                                              "Returns details of a specific query. \n"]
type nonrec stored_query_metadata_list = stored_query_metadata list[@@ocaml.doc
                                                                    ""]
type nonrec query_expression = string[@@ocaml.doc ""]
type nonrec stored_query =
  {
  expression: query_expression option
    [@ocaml.doc
      "The expression of the query. For example, [SELECT\n\t\t\tresourceId,\n\t\t\tresourceType,\n\t\t\tsupplementaryConfiguration.BucketVersioningConfiguration.status\n\t\t\tWHERE\n\t\t\tresourceType = 'AWS::S3::Bucket'\n\t\t\tAND supplementaryConfiguration.BucketVersioningConfiguration.status = 'Off'.] \n"];
  description: query_description option
    [@ocaml.doc "A unique description for the query.\n"];
  query_name: query_name [@ocaml.doc "The name of the query.\n"];
  query_arn: query_arn option
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the query. For example, arn:partition:service:region:account-id:resource-type/resource-name/resource-id.\n"];
  query_id: query_id option [@ocaml.doc "The ID of the query.\n"]}[@@ocaml.doc
                                                                    "Provides the details of a stored query.\n"]
type nonrec recorder_name = string[@@ocaml.doc ""]
type nonrec stop_configuration_recorder_request =
  {
  configuration_recorder_name: recorder_name
    [@ocaml.doc
      "The name of the customer managed configuration recorder that you want to stop.\n"]}
[@@ocaml.doc "The input for the [StopConfigurationRecorder] operation.\n"]
type nonrec no_such_configuration_recorder_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have specified a configuration recorder that does not exist.\n"]
type nonrec member_account_rule_status =
  | UPDATE_FAILED [@ocaml.doc ""]
  | UPDATE_IN_PROGRESS [@ocaml.doc ""]
  | UPDATE_SUCCESSFUL [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
  | DELETE_SUCCESSFUL [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_SUCCESSFUL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec status_detail_filters =
  {
  member_account_rule_status: member_account_rule_status option
    [@ocaml.doc
      "Indicates deployment status for Config rule in the member account. When management account calls [PutOrganizationConfigRule] action for the first time, Config rule status is created in the member account. When management account calls [PutOrganizationConfigRule] action for the second time, Config rule status is updated in the member account. Config rule status is deleted when the management account deletes [OrganizationConfigRule] and disables service access for [config-multiaccountsetup.amazonaws.com]. \n\n Config sets the state of the rule to:\n \n  {ul\n        {-   [CREATE_SUCCESSFUL] when Config rule has been created in the member account.\n            \n             }\n        {-   [CREATE_IN_PROGRESS] when Config rule is being created in the member account.\n            \n             }\n        {-   [CREATE_FAILED] when Config rule creation has failed in the member account.\n            \n             }\n        {-   [DELETE_FAILED] when Config rule deletion has failed in the member account.\n            \n             }\n        {-   [DELETE_IN_PROGRESS] when Config rule is being deleted in the member account.\n            \n             }\n        {-   [DELETE_SUCCESSFUL] when Config rule has been deleted in the member account.\n            \n             }\n        {-   [UPDATE_SUCCESSFUL] when Config rule has been updated in the member account.\n            \n             }\n        {-   [UPDATE_IN_PROGRESS] when Config rule is being updated in the member account.\n            \n             }\n        {-   [UPDATE_FAILED] when Config rule deletion has failed in the member account.\n            \n             }\n        }\n  "];
  account_id: account_id option
    [@ocaml.doc
      "The 12-digit account ID of the member account within an organization.\n"]}
[@@ocaml.doc
  "Status filter object to filter results based on specific member account ID or status type for an organization Config rule. \n"]
type nonrec static_parameter_values = string_with_char_limit256 list[@@ocaml.doc
                                                                    ""]
type nonrec static_value =
  {
  values: static_parameter_values
    [@ocaml.doc
      "A list of values. For example, the ARN of the assumed role. \n"]}
[@@ocaml.doc "The static value of the resource.\n"]
type nonrec resource_evaluation_id = string[@@ocaml.doc ""]
type nonrec start_resource_evaluation_response =
  {
  resource_evaluation_id: resource_evaluation_id option
    [@ocaml.doc
      "A unique ResourceEvaluationId that is associated with a single execution.\n"]}
[@@ocaml.doc ""]
type nonrec base_resource_id = string[@@ocaml.doc ""]
type nonrec resource_configuration = string[@@ocaml.doc ""]
type nonrec resource_configuration_schema_type =
  | CFN_RESOURCE_SCHEMA [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_details =
  {
  resource_configuration_schema_type:
    resource_configuration_schema_type option
    [@ocaml.doc
      "The schema type of the resource configuration.\n\n  You can find the {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html}Resource type schema}, or [CFN_RESOURCE_SCHEMA], in \"{i Amazon Web Services public extensions}\" within the CloudFormation registry or with the following CLI commmand: [aws cloudformation describe-type --type-name \"AWS::S3::Bucket\" --type RESOURCE].\n  \n   For more information, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry.html#registry-view}Managing extensions through the CloudFormation registry} and {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services resource and property types reference} in the CloudFormation User Guide.\n   \n    "];
  resource_configuration: resource_configuration
    [@ocaml.doc
      "The resource definition to be evaluated as per the resource configuration schema type.\n"];
  resource_type: string_with_char_limit256
    [@ocaml.doc "The type of resource being evaluated.\n"];
  resource_id: base_resource_id
    [@ocaml.doc "A unique resource ID for an evaluation.\n"]}[@@ocaml.doc
                                                               "Returns information about the resource being evaluated.\n"]
type nonrec evaluation_context_identifier = string[@@ocaml.doc ""]
type nonrec evaluation_context =
  {
  evaluation_context_identifier: evaluation_context_identifier option
    [@ocaml.doc
      "A unique EvaluationContextIdentifier ID for an EvaluationContext.\n"]}
[@@ocaml.doc
  "Use EvaluationContext to group independently initiated proactive resource evaluations. For example, CFN Stack. If you want to check just a resource definition, you do not need to provide evaluation context.\n"]
type nonrec evaluation_mode =
  | PROACTIVE [@ocaml.doc ""]
  | DETECTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec evaluation_timeout = int[@@ocaml.doc ""]
type nonrec client_token = string[@@ocaml.doc ""]
type nonrec start_resource_evaluation_request =
  {
  client_token: client_token option
    [@ocaml.doc
      "A client token is a unique, case-sensitive string of up to 64 ASCII characters. To make an idempotent API request using one of these actions, specify a client token in the request.\n\n  Avoid reusing the same client token for other API requests. If you retry a request that completed successfully using the same client token and the same parameters, the retry succeeds without performing any further actions. If you retry a successful request using the same client token, but one or more of the parameters are different, other than the Region or Availability Zone, the retry fails with an IdempotentParameterMismatch error.\n  \n   "];
  evaluation_timeout: evaluation_timeout option
    [@ocaml.doc
      "The timeout for an evaluation. The default is 900 seconds. You cannot specify a number greater than 3600. If you specify 0, Config uses the default.\n"];
  evaluation_mode: evaluation_mode
    [@ocaml.doc
      "The mode of an evaluation. The valid values for this API are [DETECTIVE] and [PROACTIVE].\n"];
  evaluation_context: evaluation_context option
    [@ocaml.doc "Returns an [EvaluationContext] object.\n"];
  resource_details: resource_details
    [@ocaml.doc "Returns a [ResourceDetails] object.\n"]}[@@ocaml.doc ""]
type nonrec invalid_parameter_value_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "One or more of the specified parameters are not valid. Verify that your parameters are valid and try again.\n"]
type nonrec idempotent_parameter_mismatch =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "Using the same client token with one or more different parameters. Specify a new client token with the parameter changes and try again.\n"]
type nonrec resource_key =
  {
  resource_id: resource_id
    [@ocaml.doc "The ID of the resource (for example., sg-xxxxxx). \n"];
  resource_type: resource_type [@ocaml.doc "The resource type.\n"]}[@@ocaml.doc
                                                                    "The details that identify a resource within Config, including the resource type and resource ID.\n"]
type nonrec resource_keys = resource_key list[@@ocaml.doc ""]
type nonrec start_remediation_execution_response =
  {
  failed_items: resource_keys option
    [@ocaml.doc
      "For resources that have failed to start execution, the API returns a resource key object.\n"];
  failure_message: string_ option
    [@ocaml.doc
      "Returns a failure message. For example, the resource is already compliant.\n"]}
[@@ocaml.doc ""]
type nonrec config_rule_name = string[@@ocaml.doc ""]
type nonrec start_remediation_execution_request =
  {
  resource_keys: resource_keys
    [@ocaml.doc
      "A list of resource keys to be processed with the current request. Each element in the list consists of the resource type and resource ID. \n"];
  config_rule_name: config_rule_name
    [@ocaml.doc
      "The list of names of Config rules that you want to run remediation execution for.\n"]}
[@@ocaml.doc ""]
type nonrec no_such_remediation_configuration_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You specified an Config rule without a remediation configuration.\n"]
type nonrec insufficient_permissions_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "Indicates one of the following errors:\n\n {ul\n       {-  For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutConfigRule.html}PutConfigRule}, the rule cannot be created because the IAM role assigned to Config lacks permissions to perform the config:Put* action.\n           \n            }\n       {-  For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutConfigRule.html}PutConfigRule}, the Lambda function cannot be invoked. Check the function ARN, and check the function's permissions.\n           \n            }\n       {-  For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutOrganizationConfigRule.html}PutOrganizationConfigRule}, organization Config rule cannot be created because you do not have permissions to call IAM [GetRole] action or create a service-linked role.\n           \n            }\n       {-  For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutConformancePack.html}PutConformancePack} and {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutOrganizationConformancePack.html}PutOrganizationConformancePack}, a conformance pack cannot be created because you do not have the following permissions: \n           \n            {ul\n                  {-  You do not have permission to call IAM [GetRole] action or create a service-linked role.\n                      \n                       }\n                  {-  You do not have permission to read Amazon S3 bucket or call SSM:GetDocument.\n                      \n                       }\n                  \n        }\n         }\n       {-  For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutServiceLinkedConfigurationRecorder.html}PutServiceLinkedConfigurationRecorder}, a service-linked configuration recorder cannot be created because you do not have the following permissions: IAM [CreateServiceLinkedRole].\n           \n            }\n       }\n  "]
type nonrec start_configuration_recorder_request =
  {
  configuration_recorder_name: recorder_name
    [@ocaml.doc
      "The name of the customer managed configuration recorder that you want to start.\n"]}
[@@ocaml.doc "The input for the [StartConfigurationRecorder] operation.\n"]
type nonrec no_available_delivery_channel_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "There is no delivery channel available to record configurations.\n"]
type nonrec start_config_rules_evaluation_response = unit[@@ocaml.doc ""]
type nonrec reevaluate_config_rule_names = config_rule_name list[@@ocaml.doc
                                                                  ""]
type nonrec start_config_rules_evaluation_request =
  {
  config_rule_names: reevaluate_config_rule_names option
    [@ocaml.doc
      "The list of names of Config rules that you want to run evaluations for.\n"]}
[@@ocaml.doc "\n"]
type nonrec resource_in_use_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You see this exception in the following cases: \n\n {ul\n       {-  For DeleteConfigRule, Config is deleting this rule. Try your request again later.\n           \n            }\n       {-  For DeleteConfigRule, the rule is deleting your evaluation results. Try your request again later.\n           \n            }\n       {-  For DeleteConfigRule, a remediation action is associated with the rule and Config cannot delete this rule. Delete the remediation action associated with the rule before deleting the rule and try your request again later.\n           \n            }\n       {-  For PutConfigOrganizationRule, organization Config rule deletion is in progress. Try your request again later.\n           \n            }\n       {-  For DeleteOrganizationConfigRule, organization Config rule creation is in progress. Try your request again later.\n           \n            }\n       {-  For PutConformancePack and PutOrganizationConformancePack, a conformance pack creation, update, and deletion is in progress. Try your request again later.\n           \n            }\n       {-  For DeleteConformancePack, a conformance pack creation, update, and deletion is in progress. Try your request again later.\n           \n            }\n       }\n  "]
type nonrec no_such_config_rule_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "The Config rule in the request is not valid. Verify that the rule is an Config Process Check rule, that the rule name is correct, and that valid Amazon Resouce Names (ARNs) are used before trying again.\n"]
type nonrec limit_exceeded_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "For [PutServiceLinkedConfigurationRecorder] API, this exception is thrown if the number of service-linked roles in the account exceeds the limit.\n\n For [StartConfigRulesEvaluation] API, this exception is thrown if an evaluation is in progress or if you call the [StartConfigRulesEvaluation] API more than once per minute.\n \n  For [PutConfigurationAggregator] API, this exception is thrown if the number of accounts and aggregators exceeds the limit.\n  "]
type nonrec invalid_next_token_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "The specified next token is not valid. Specify the [nextToken] string that was returned in the previous response to get the next page of results.\n"]
type nonrec invalid_limit_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The specified limit is outside the allowable range.\n"]
type nonrec invalid_expression_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The syntax of the query is incorrect.\n"]
type nonrec results = string_ list[@@ocaml.doc ""]
type nonrec field_name = string[@@ocaml.doc ""]
type nonrec field_info =
  {
  name: field_name option [@ocaml.doc "Name of the field.\n"]}[@@ocaml.doc
                                                                "Details about the fields such as name of the field.\n"]
type nonrec field_info_list = field_info list[@@ocaml.doc ""]
type nonrec query_info =
  {
  select_fields: field_info_list option
    [@ocaml.doc "Returns a [FieldInfo] object.\n"]}[@@ocaml.doc
                                                     "Details about the query.\n"]
type nonrec next_token = string[@@ocaml.doc ""]
type nonrec select_resource_config_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response. \n"];
  query_info: query_info option
    [@ocaml.doc "Returns the [QueryInfo] object.\n"];
  results: results option
    [@ocaml.doc "Returns the results for the SQL query.\n"]}[@@ocaml.doc ""]
type nonrec expression = string[@@ocaml.doc ""]
type nonrec limit = int[@@ocaml.doc ""]
type nonrec select_resource_config_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response. \n"];
  limit: limit option
    [@ocaml.doc
      "The maximum number of query results returned on each page. \n"];
  expression: expression [@ocaml.doc "The SQL query [SELECT] command.\n"]}
[@@ocaml.doc ""]
type nonrec no_such_configuration_aggregator_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have specified a configuration aggregator that does not exist.\n"]
type nonrec select_aggregate_resource_config_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The nextToken string returned in a previous request that you use to request the next page of results in a paginated response. \n"];
  query_info: query_info option [@ocaml.doc ""];
  results: results option
    [@ocaml.doc "Returns the results for the SQL query.\n"]}[@@ocaml.doc ""]
type nonrec configuration_aggregator_name = string[@@ocaml.doc ""]
type nonrec select_aggregate_resource_config_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The nextToken string returned in a previous request that you use to request the next page of results in a paginated response. \n"];
  max_results: limit option
    [@ocaml.doc
      "The maximum number of query results returned on each page. Config also allows the Limit request parameter.\n"];
  limit: limit option
    [@ocaml.doc
      "The maximum number of query results returned on each page. \n"];
  configuration_aggregator_name: configuration_aggregator_name
    [@ocaml.doc "The name of the configuration aggregator.\n"];
  expression: expression [@ocaml.doc "The SQL query SELECT command. \n"]}
[@@ocaml.doc ""]
type nonrec resource_concurrent_modification_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "Two users are trying to modify the same query at the same time. Wait for a moment and try again.\n"]
type nonrec put_stored_query_response =
  {
  query_arn: query_arn option
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the query. For example, arn:partition:service:region:account-id:resource-type/resource-name/resource-id.\n"]}
[@@ocaml.doc ""]
type nonrec put_stored_query_request =
  {
  tags: tags_list option [@ocaml.doc "A list of [Tags] object.\n"];
  stored_query: stored_query
    [@ocaml.doc
      "A list of [StoredQuery] objects. The mandatory fields are [QueryName] and [Expression].\n\n  When you are creating a query, you must provide a query name and an expression. When you are updating a query, you must provide a query name but updating the description is optional.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec conflict_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutServiceLinkedConfigurationRecorder.html}PutServiceLinkedConfigurationRecorder}, you cannot create a service-linked recorder because a service-linked recorder already exists for the specified service.\n\n For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DeleteServiceLinkedConfigurationRecorder.html}DeleteServiceLinkedConfigurationRecorder}, you cannot delete the service-linked recorder because it is currently in use by the linked Amazon Web Services service.\n \n  For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DeleteDeliveryChannel.html}DeleteDeliveryChannel}, you cannot delete the specified delivery channel because the customer managed configuration recorder is running. Use the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_StopConfigurationRecorder.html}StopConfigurationRecorder} operation to stop the customer managed configuration recorder.\n  \n   For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_AssociateResourceTypes.html}AssociateResourceTypes} and {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DisassociateResourceTypes.html}DisassociateResourceTypes}, one of the following errors:\n   \n    {ul\n          {-  For service-linked configuration recorders, the configuration recorder is not in use by the service. No association or dissociation of resource types is permitted.\n              \n               }\n          {-  For service-linked configuration recorders, your requested change to the configuration recorder has been denied by its linked Amazon Web Services service.\n              \n               }\n          }\n  "]
type nonrec put_service_linked_configuration_recorder_response =
  {
  name: recorder_name option
    [@ocaml.doc
      "The name of the specified configuration recorder.\n\n For service-linked configuration recorders, Config automatically assigns a name that has the prefix \"[AWS]\" to the new service-linked configuration recorder.\n "];
  arn: amazon_resource_name option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the specified configuration recorder.\n"]}
[@@ocaml.doc ""]
type nonrec service_principal = string[@@ocaml.doc ""]
type nonrec put_service_linked_configuration_recorder_request =
  {
  tags: tags_list option
    [@ocaml.doc
      "The tags for a service-linked configuration recorder. Each tag consists of a key and an optional value, both of which you define.\n"];
  service_principal: service_principal
    [@ocaml.doc
      "The service principal of the Amazon Web Services service for the service-linked configuration recorder that you want to create.\n"]}
[@@ocaml.doc ""]
type nonrec max_number_of_retention_configurations_exceeded_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "Failed to add the retention configuration because a retention configuration with that name already exists.\n"]
type nonrec retention_configuration_name = string[@@ocaml.doc ""]
type nonrec retention_period_in_days = int[@@ocaml.doc ""]
type nonrec retention_configuration =
  {
  retention_period_in_days: retention_period_in_days
    [@ocaml.doc
      "Number of days Config stores your historical information.\n\n  Currently, only applicable to the configuration item history.\n  \n   "];
  name: retention_configuration_name
    [@ocaml.doc "The name of the retention configuration object.\n"]}
[@@ocaml.doc
  "An object with the name of the retention configuration and the retention period in days. The object stores the configuration for data retention in Config.\n"]
type nonrec put_retention_configuration_response =
  {
  retention_configuration: retention_configuration option
    [@ocaml.doc "Returns a retention configuration object.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec put_retention_configuration_request =
  {
  retention_period_in_days: retention_period_in_days
    [@ocaml.doc
      "Number of days Config stores your historical information.\n\n  Currently, only applicable to the configuration item history.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec no_running_configuration_recorder_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "There is no configuration recorder running.\n"]
type nonrec max_active_resources_exceeded_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have reached the limit of active custom resource types in your account. There is a limit of 100,000. Delete unused resources using {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DeleteResourceConfig.html}DeleteResourceConfig} .\n"]
type nonrec resource_type_string = string[@@ocaml.doc ""]
type nonrec schema_version_id = string[@@ocaml.doc ""]
type nonrec configuration = string[@@ocaml.doc ""]
type nonrec put_resource_config_request =
  {
  tags: tags option
    [@ocaml.doc
      "Tags associated with the resource.\n\n  This field is not to be confused with the Amazon Web Services-wide tag feature for Amazon Web Services resources. Tags for [PutResourceConfig] are tags that you supply for the configuration items of your custom resources.\n  \n   "];
  configuration: configuration
    [@ocaml.doc
      "The configuration object of the resource in valid JSON format. It must match the schema registered with CloudFormation.\n\n  The configuration JSON must not exceed 64 KB.\n  \n   "];
  resource_name: resource_name option [@ocaml.doc "Name of the resource.\n"];
  resource_id: resource_id
    [@ocaml.doc "Unique identifier of the resource.\n"];
  schema_version_id: schema_version_id
    [@ocaml.doc
      "Version of the schema registered for the ResourceType in CloudFormation.\n"];
  resource_type: resource_type_string
    [@ocaml.doc
      "The type of the resource. The custom resource type must be registered with CloudFormation. \n\n  You cannot use the organization names \226\128\156amzn\226\128\157, \226\128\156amazon\226\128\157, \226\128\156alexa\226\128\157, \226\128\156custom\226\128\157 with custom resource types. It is the first part of the ResourceType up to the first ::.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec remediation_exception =
  {
  expiration_time: date option
    [@ocaml.doc "The time when the remediation exception will be deleted.\n"];
  message: string_with_char_limit1024 option
    [@ocaml.doc "An explanation of an remediation exception.\n"];
  resource_id: string_with_char_limit1024
    [@ocaml.doc "The ID of the resource (for example., sg-xxxxxx).\n"];
  resource_type: string_with_char_limit256
    [@ocaml.doc "The type of a resource.\n"];
  config_rule_name: config_rule_name
    [@ocaml.doc "The name of the Config rule.\n"]}[@@ocaml.doc
                                                    "An object that represents the details about the remediation exception. The details include the rule name, an explanation of an exception, the time when the exception will be deleted, the resource ID, and resource type. \n"]
type nonrec remediation_exceptions = remediation_exception list[@@ocaml.doc
                                                                 ""]
type nonrec failed_remediation_exception_batch =
  {
  failed_items: remediation_exceptions option
    [@ocaml.doc
      "Returns remediation exception resource key object of the failed items.\n"];
  failure_message: string_ option
    [@ocaml.doc
      "Returns a failure message. For example, the auto-remediation has failed.\n"]}
[@@ocaml.doc
  "List of each of the failed remediation exceptions with specific reasons.\n"]
type nonrec failed_remediation_exception_batches =
  failed_remediation_exception_batch list[@@ocaml.doc ""]
type nonrec put_remediation_exceptions_response =
  {
  failed_batches: failed_remediation_exception_batches option
    [@ocaml.doc
      "Returns a list of failed remediation exceptions batch objects. Each object in the batch consists of a list of failed items and failure messages.\n"]}
[@@ocaml.doc ""]
type nonrec remediation_exception_resource_key =
  {
  resource_id: string_with_char_limit1024 option
    [@ocaml.doc "The ID of the resource (for example., sg-xxxxxx).\n"];
  resource_type: string_with_char_limit256 option
    [@ocaml.doc "The type of a resource.\n"]}[@@ocaml.doc
                                               "The details that identify a resource within Config, including the resource type and resource ID. \n"]
type nonrec remediation_exception_resource_keys =
  remediation_exception_resource_key list[@@ocaml.doc ""]
type nonrec put_remediation_exceptions_request =
  {
  expiration_time: date option
    [@ocaml.doc
      "The exception is automatically deleted after the expiration date.\n"];
  message: string_with_char_limit1024 option
    [@ocaml.doc "The message contains an explanation of the exception.\n"];
  resource_keys: remediation_exception_resource_keys
    [@ocaml.doc
      "An exception list of resource exception keys to be processed with the current request. Config adds exception for each resource key. For example, Config adds 3 exceptions for 3 resource keys. \n"];
  config_rule_name: config_rule_name
    [@ocaml.doc
      "The name of the Config rule for which you want to create remediation exception.\n"]}
[@@ocaml.doc ""]
type nonrec remediation_target_type =
  | SSM_DOCUMENT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_value_type =
  | RESOURCE_ID [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_value =
  {
  value: resource_value_type [@ocaml.doc "The value is a resource ID.\n"]}
[@@ocaml.doc "The dynamic value of the resource.\n"]
type nonrec remediation_parameter_value =
  {
  static_value: static_value option
    [@ocaml.doc "The value is static and does not change at run-time.\n"];
  resource_value: resource_value option
    [@ocaml.doc "The value is dynamic and changes at run-time.\n"]}[@@ocaml.doc
                                                                    "The value is either a dynamic (resource) value or a static value. You must select either a dynamic value or a static value.\n"]
type nonrec remediation_parameters =
  (string_with_char_limit256 * remediation_parameter_value) list[@@ocaml.doc
                                                                  ""]
type nonrec boolean_ = bool[@@ocaml.doc ""]
type nonrec percentage = int[@@ocaml.doc ""]
type nonrec ssm_controls =
  {
  error_percentage: percentage option
    [@ocaml.doc
      "The percentage of errors that are allowed before SSM stops running automations on non-compliant resources for that specific rule. You can specify a percentage of errors, for example 10%. If you do not specifiy a percentage, the default is 50%. For example, if you set the ErrorPercentage to 40% for 10 non-compliant resources, then SSM stops running the automations when the fifth error is received. \n"];
  concurrent_execution_rate_percentage: percentage option
    [@ocaml.doc
      "The maximum percentage of remediation actions allowed to run in parallel on the non-compliant resources for that specific rule. You can specify a percentage, such as 10%. The default value is 10. \n"]}
[@@ocaml.doc
  "Amazon Web Services Systems Manager (SSM) specific remediation controls.\n"]
type nonrec execution_controls =
  {
  ssm_controls: ssm_controls option [@ocaml.doc "A SsmControls object.\n"]}
[@@ocaml.doc "The controls that Config uses for executing remediations.\n"]
type nonrec auto_remediation_attempts = int[@@ocaml.doc ""]
type nonrec auto_remediation_attempt_seconds = int[@@ocaml.doc ""]
type nonrec remediation_configuration =
  {
  created_by_service: string_with_char_limit1024 option
    [@ocaml.doc
      "Name of the service that owns the service-linked rule, if applicable.\n"];
  arn: string_with_char_limit1024 option
    [@ocaml.doc "Amazon Resource Name (ARN) of remediation configuration.\n"];
  retry_attempt_seconds: auto_remediation_attempt_seconds option
    [@ocaml.doc
      "Time window to determine whether or not to add a remediation exception to prevent infinite remediation attempts. If [MaximumAutomaticAttempts] remediation attempts have been made under [RetryAttemptSeconds], a remediation exception will be added to the resource. If you do not select a number, the default is 60 seconds. \n\n For example, if you specify [RetryAttemptSeconds] as 50 seconds and [MaximumAutomaticAttempts] as 5, Config will run auto-remediations 5 times within 50 seconds before adding a remediation exception to the resource.\n "];
  maximum_automatic_attempts: auto_remediation_attempts option
    [@ocaml.doc
      "The maximum number of failed attempts for auto-remediation. If you do not select a number, the default is 5.\n\n For example, if you specify MaximumAutomaticAttempts as 5 with RetryAttemptSeconds as 50 seconds, Config will put a RemediationException on your behalf for the failing resource after the 5th failed attempt within 50 seconds.\n "];
  execution_controls: execution_controls option
    [@ocaml.doc "An ExecutionControls object.\n"];
  automatic: boolean_ option
    [@ocaml.doc "The remediation is triggered automatically.\n"];
  resource_type: string_ option [@ocaml.doc "The type of a resource. \n"];
  parameters: remediation_parameters option
    [@ocaml.doc "An object of the RemediationParameterValue.\n"];
  target_version: string_ option
    [@ocaml.doc
      "Version of the target. For example, version of the SSM document.\n\n  If you make backward incompatible changes to the SSM document, you must call PutRemediationConfiguration API again to ensure the remediations can run.\n  \n   "];
  target_id: string_with_char_limit256
    [@ocaml.doc "Target ID is the name of the SSM document.\n"];
  target_type: remediation_target_type
    [@ocaml.doc
      "The type of the target. Target executes remediation. For example, SSM document.\n"];
  config_rule_name: config_rule_name
    [@ocaml.doc "The name of the Config rule.\n"]}[@@ocaml.doc
                                                    "An object that represents the details about the remediation configuration that includes the remediation action, parameters, and data to execute the action.\n"]
type nonrec remediation_configurations = remediation_configuration list
[@@ocaml.doc ""]
type nonrec failed_remediation_batch =
  {
  failed_items: remediation_configurations option
    [@ocaml.doc "Returns remediation configurations of the failed items.\n"];
  failure_message: string_ option
    [@ocaml.doc
      "Returns a failure message. For example, the resource is already compliant.\n"]}
[@@ocaml.doc
  "List of each of the failed remediations with specific reasons.\n"]
type nonrec failed_remediation_batches = failed_remediation_batch list
[@@ocaml.doc ""]
type nonrec put_remediation_configurations_response =
  {
  failed_batches: failed_remediation_batches option
    [@ocaml.doc "Returns a list of failed remediation batch objects.\n"]}
[@@ocaml.doc ""]
type nonrec put_remediation_configurations_request =
  {
  remediation_configurations: remediation_configurations
    [@ocaml.doc "A list of remediation configuration objects.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec organization_conformance_pack_template_validation_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have specified a template that is not valid or supported.\n"]
type nonrec organization_all_features_not_enabled_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "Config resource cannot be created because your organization does not have all features enabled.\n"]
type nonrec organization_access_denied_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "For [PutConfigurationAggregator] API, you can see this exception for the following reasons:\n\n {ul\n       {-  No permission to call [EnableAWSServiceAccess] API\n           \n            }\n       {-  The configuration aggregator cannot be updated because your Amazon Web Services Organization management account or the delegated administrator role changed. Delete this aggregator and create a new one with the current Amazon Web Services Organization.\n           \n            }\n       {-  The configuration aggregator is associated with a previous Amazon Web Services Organization and Config cannot aggregate data with current Amazon Web Services Organization. Delete this aggregator and create a new one with the current Amazon Web Services Organization.\n           \n            }\n       {-  You are not a registered delegated administrator for Config with permissions to call [ListDelegatedAdministrators] API. Ensure that the management account registers delagated administrator for Config service principal name before the delegated administrator creates an aggregator.\n           \n            }\n       }\n   For all [OrganizationConfigRule] and [OrganizationConformancePack] APIs, Config throws an exception if APIs are called from member accounts. All APIs must be called from organization management account.\n   "]
type nonrec no_available_organization_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "Organization is no longer available.\n"]
type nonrec max_number_of_organization_conformance_packs_exceeded_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have reached the limit of the number of organization conformance packs you can create in an account. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.\n"]
type nonrec put_organization_conformance_pack_response =
  {
  organization_conformance_pack_arn: string_with_char_limit256 option
    [@ocaml.doc "ARN of the organization conformance pack.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec organization_conformance_pack_name = string[@@ocaml.doc ""]
type nonrec delivery_s3_bucket = string[@@ocaml.doc ""]
type nonrec delivery_s3_key_prefix = string[@@ocaml.doc ""]
type nonrec parameter_name = string[@@ocaml.doc ""]
type nonrec parameter_value = string[@@ocaml.doc ""]
type nonrec conformance_pack_input_parameter =
  {
  parameter_value: parameter_value
    [@ocaml.doc "Another part of the key-value pair. \n"];
  parameter_name: parameter_name
    [@ocaml.doc "One part of a key-value pair.\n"]}[@@ocaml.doc
                                                     "Input parameters in the form of key-value pairs for the conformance pack, both of which you define. Keys can have a maximum character length of 255 characters, and values can have a maximum length of 4096 characters.\n"]
type nonrec conformance_pack_input_parameters =
  conformance_pack_input_parameter list[@@ocaml.doc ""]
type nonrec excluded_accounts = account_id list[@@ocaml.doc ""]
type nonrec put_organization_conformance_pack_request =
  {
  excluded_accounts: excluded_accounts option
    [@ocaml.doc
      "A list of Amazon Web Services accounts to be excluded from an organization conformance pack while deploying a conformance pack.\n"];
  conformance_pack_input_parameters: conformance_pack_input_parameters option
    [@ocaml.doc "A list of [ConformancePackInputParameter] objects.\n"];
  delivery_s3_key_prefix: delivery_s3_key_prefix option
    [@ocaml.doc
      "The prefix for the Amazon S3 bucket.\n\n  This field is optional.\n  \n   "];
  delivery_s3_bucket: delivery_s3_bucket option
    [@ocaml.doc
      "The name of the Amazon S3 bucket where Config stores conformance pack templates.\n\n  This field is optional. If used, it must be prefixed with [awsconfigconforms].\n  \n   "];
  template_body: template_body option
    [@ocaml.doc
      "A string containing full conformance pack template body. Structure containing the template body with a minimum length of 1 byte and a maximum length of 51,200 bytes.\n"];
  template_s3_uri: template_s3_uri option
    [@ocaml.doc
      "Location of file containing the template body. The uri must point to the conformance pack template (max size: 300 KB).\n\n  You must have access to read Amazon S3 bucket. In addition, in order to ensure a successful deployment, the template object must not be in an {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-class-intro.html}archived storage class} if this parameter is passed.\n  \n   "];
  organization_conformance_pack_name: organization_conformance_pack_name
    [@ocaml.doc
      "Name of the organization conformance pack you want to create.\n"]}
[@@ocaml.doc ""]
type nonrec max_number_of_organization_config_rules_exceeded_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have reached the limit of the number of organization Config rules you can create. For more information, see see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.\n"]
type nonrec put_organization_config_rule_response =
  {
  organization_config_rule_arn: string_with_char_limit256 option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an organization Config rule.\n"]}
[@@ocaml.doc ""]
type nonrec organization_config_rule_name = string[@@ocaml.doc ""]
type nonrec maximum_execution_frequency =
  | TwentyFour_Hours [@ocaml.doc ""]
  | Twelve_Hours [@ocaml.doc ""]
  | Six_Hours [@ocaml.doc ""]
  | Three_Hours [@ocaml.doc ""]
  | One_Hour [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_types_scope = string_with_char_limit256 list[@@ocaml.doc
                                                                   ""]
type nonrec organization_managed_rule_metadata =
  {
  tag_value_scope: string_with_char_limit256 option
    [@ocaml.doc
      "The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key).\n"];
  tag_key_scope: string_with_char_limit128 option
    [@ocaml.doc
      "One part of a key-value pair that make up a tag. A key is a general label that acts like a category for more specific tag values. \n"];
  resource_id_scope: string_with_char_limit768 option
    [@ocaml.doc
      "The ID of the Amazon Web Services resource that was evaluated.\n"];
  resource_types_scope: resource_types_scope option
    [@ocaml.doc
      "The type of the Amazon Web Services resource that was evaluated.\n"];
  maximum_execution_frequency: maximum_execution_frequency option
    [@ocaml.doc
      "The maximum frequency with which Config runs evaluations for a rule. This is for an Config managed rule that is triggered at a periodic frequency.\n\n  By default, rules with a periodic trigger are evaluated every 24 hours. To change the frequency, specify a valid value for the [MaximumExecutionFrequency] parameter.\n  \n   "];
  input_parameters: string_with_char_limit2048 option
    [@ocaml.doc
      "A string, in JSON format, that is passed to your organization Config rule Lambda function.\n"];
  rule_identifier: string_with_char_limit256
    [@ocaml.doc
      "For organization config managed rules, a predefined identifier from a list. For example, [IAM_PASSWORD_POLICY] is a managed rule. To reference a managed rule, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html}Using Config managed rules}.\n"];
  description: string_with_char_limit256_min0 option
    [@ocaml.doc
      "The description that you provide for your organization Config rule.\n"]}
[@@ocaml.doc
  "An object that specifies organization managed rule metadata such as resource type and ID of Amazon Web Services resource along with the rule identifier. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.\n"]
type nonrec organization_config_rule_trigger_type =
  | SCHEDULED_NOTIFICATION [@ocaml.doc ""]
  | OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION [@ocaml.doc ""]
  | CONFIGURATION_ITEM_CHANGE_NOTIFICATION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec organization_config_rule_trigger_types =
  organization_config_rule_trigger_type list[@@ocaml.doc ""]
type nonrec organization_custom_rule_metadata =
  {
  tag_value_scope: string_with_char_limit256 option
    [@ocaml.doc
      "The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key). \n"];
  tag_key_scope: string_with_char_limit128 option
    [@ocaml.doc
      "One part of a key-value pair that make up a tag. A key is a general label that acts like a category for more specific tag values. \n"];
  resource_id_scope: string_with_char_limit768 option
    [@ocaml.doc
      "The ID of the Amazon Web Services resource that was evaluated.\n"];
  resource_types_scope: resource_types_scope option
    [@ocaml.doc
      "The type of the Amazon Web Services resource that was evaluated.\n"];
  maximum_execution_frequency: maximum_execution_frequency option
    [@ocaml.doc
      "The maximum frequency with which Config runs evaluations for a rule. Your custom rule is triggered when Config delivers the configuration snapshot. For more information, see [ConfigSnapshotDeliveryProperties].\n\n  By default, rules with a periodic trigger are evaluated every 24 hours. To change the frequency, specify a valid value for the [MaximumExecutionFrequency] parameter.\n  \n   "];
  input_parameters: string_with_char_limit2048 option
    [@ocaml.doc
      "A string, in JSON format, that is passed to your organization Config rule Lambda function.\n"];
  organization_config_rule_trigger_types:
    organization_config_rule_trigger_types
    [@ocaml.doc
      "The type of notification that triggers Config to run an evaluation for a rule. You can specify the following notification types:\n\n {ul\n       {-   [ConfigurationItemChangeNotification] - Triggers an evaluation when Config delivers a configuration item as a result of a resource change.\n           \n            }\n       {-   [OversizedConfigurationItemChangeNotification] - Triggers an evaluation when Config delivers an oversized configuration item. Config may generate this notification type when a resource changes and the notification exceeds the maximum size allowed by Amazon SNS.\n           \n            }\n       {-   [ScheduledNotification] - Triggers a periodic evaluation at the frequency specified for [MaximumExecutionFrequency].\n           \n            }\n       }\n  "];
  lambda_function_arn: string_with_char_limit256
    [@ocaml.doc "The lambda function ARN.\n"];
  description: string_with_char_limit256_min0 option
    [@ocaml.doc
      "The description that you provide for your organization Config rule.\n"]}
[@@ocaml.doc
  "An object that specifies organization custom rule metadata such as resource type, resource ID of Amazon Web Services resource, Lambda function ARN, and organization trigger types that trigger Config to evaluate your Amazon Web Services resources against a rule. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.\n"]
type nonrec organization_config_rule_trigger_type_no_s_n =
  | OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION [@ocaml.doc ""]
  | CONFIGURATION_ITEM_CHANGE_NOTIFICATION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec organization_config_rule_trigger_type_no_s_ns =
  organization_config_rule_trigger_type_no_s_n list[@@ocaml.doc ""]
type nonrec policy_runtime = string[@@ocaml.doc ""]
type nonrec policy_text = string[@@ocaml.doc ""]
type nonrec debug_log_delivery_accounts = account_id list[@@ocaml.doc ""]
type nonrec organization_custom_policy_rule_metadata =
  {
  debug_log_delivery_accounts: debug_log_delivery_accounts option
    [@ocaml.doc
      "A list of accounts that you can enable debug logging for your organization Config Custom Policy rule. List is null when debug logging is enabled for all accounts.\n"];
  policy_text: policy_text
    [@ocaml.doc
      "The policy definition containing the logic for your organization Config Custom Policy rule.\n"];
  policy_runtime: policy_runtime
    [@ocaml.doc
      "The runtime system for your organization Config Custom Policy rules. Guard is a policy-as-code language that allows you to write policies that are enforced by Config Custom Policy rules. For more information about Guard, see the {{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}.\n"];
  tag_value_scope: string_with_char_limit256 option
    [@ocaml.doc
      "The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key).\n"];
  tag_key_scope: string_with_char_limit128 option
    [@ocaml.doc
      "One part of a key-value pair that make up a tag. A key is a general label that acts like a category for more specific tag values.\n"];
  resource_id_scope: string_with_char_limit768 option
    [@ocaml.doc
      "The ID of the Amazon Web Services resource that was evaluated.\n"];
  resource_types_scope: resource_types_scope option
    [@ocaml.doc
      "The type of the Amazon Web Services resource that was evaluated.\n"];
  maximum_execution_frequency: maximum_execution_frequency option
    [@ocaml.doc
      "The maximum frequency with which Config runs evaluations for a rule. Your Config Custom Policy rule is triggered when Config delivers the configuration snapshot. For more information, see [ConfigSnapshotDeliveryProperties].\n"];
  input_parameters: string_with_char_limit2048 option
    [@ocaml.doc
      "A string, in JSON format, that is passed to your organization Config Custom Policy rule.\n"];
  organization_config_rule_trigger_types:
    organization_config_rule_trigger_type_no_s_ns option
    [@ocaml.doc
      "The type of notification that initiates Config to run an evaluation for a rule. For Config Custom Policy rules, Config supports change-initiated notification types:\n\n {ul\n       {-   [ConfigurationItemChangeNotification] - Initiates an evaluation when Config delivers a configuration item as a result of a resource change.\n           \n            }\n       {-   [OversizedConfigurationItemChangeNotification] - Initiates an evaluation when Config delivers an oversized configuration item. Config may generate this notification type when a resource changes and the notification exceeds the maximum size allowed by Amazon SNS.\n           \n            }\n       }\n  "];
  description: string_with_char_limit256_min0 option
    [@ocaml.doc
      "The description that you provide for your organization Config Custom Policy rule.\n"]}
[@@ocaml.doc
  "An object that specifies metadata for your organization's Config Custom Policy rule. The metadata includes the runtime system in use, which accounts have debug logging enabled, and other custom rule metadata, such as resource type, resource ID of Amazon Web Services resource, and organization trigger types that initiate Config to evaluate Amazon Web Services resources against a rule.\n"]
type nonrec put_organization_config_rule_request =
  {
  organization_custom_policy_rule_metadata:
    organization_custom_policy_rule_metadata option
    [@ocaml.doc
      "An [OrganizationCustomPolicyRuleMetadata] object. This object specifies metadata for your organization's Config Custom Policy rule. The metadata includes the runtime system in use, which accounts have debug logging enabled, and other custom rule metadata, such as resource type, resource ID of Amazon Web Services resource, and organization trigger types that initiate Config to evaluate Amazon Web Services resources against a rule.\n"];
  excluded_accounts: excluded_accounts option
    [@ocaml.doc
      "A comma-separated list of accounts that you want to exclude from an organization Config rule.\n"];
  organization_custom_rule_metadata: organization_custom_rule_metadata option
    [@ocaml.doc
      "An [OrganizationCustomRuleMetadata] object. This object specifies organization custom rule metadata such as resource type, resource ID of Amazon Web Services resource, Lambda function ARN, and organization trigger types that trigger Config to evaluate your Amazon Web Services resources against a rule. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.\n"];
  organization_managed_rule_metadata:
    organization_managed_rule_metadata option
    [@ocaml.doc
      "An [OrganizationManagedRuleMetadata] object. This object specifies organization managed rule metadata such as resource type and ID of Amazon Web Services resource along with the rule identifier. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.\n"];
  organization_config_rule_name: organization_config_rule_name
    [@ocaml.doc "The name that you assign to an organization Config rule.\n"]}
[@@ocaml.doc ""]
type nonrec put_external_evaluation_response = unit[@@ocaml.doc ""]
type nonrec compliance_type =
  | Insufficient_Data [@ocaml.doc ""]
  | Not_Applicable [@ocaml.doc ""]
  | Non_Compliant [@ocaml.doc ""]
  | Compliant [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ordering_timestamp = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc
                                                                  ""]
type nonrec external_evaluation =
  {
  ordering_timestamp: ordering_timestamp
    [@ocaml.doc "The time when the compliance was recorded. \n"];
  annotation: string_with_char_limit256 option
    [@ocaml.doc
      "Supplementary information about the reason of compliance. For example, this task was completed on a specific date.\n"];
  compliance_type: compliance_type
    [@ocaml.doc
      "The compliance of the Amazon Web Services resource. The valid values are [COMPLIANT, NON_COMPLIANT, ] and [NOT_APPLICABLE].\n"];
  compliance_resource_id: base_resource_id
    [@ocaml.doc
      "The evaluated compliance resource ID. Config accepts only Amazon Web Services account ID.\n"];
  compliance_resource_type: string_with_char_limit256
    [@ocaml.doc
      "The evaluated compliance resource type. Config accepts [AWS::::Account] resource type.\n"]}
[@@ocaml.doc
  "Identifies an Amazon Web Services resource and indicates whether it complies with the Config rule that it was evaluated against.\n"]
type nonrec put_external_evaluation_request =
  {
  external_evaluation: external_evaluation
    [@ocaml.doc
      "An [ExternalEvaluation] object that provides details about compliance.\n"];
  config_rule_name: config_rule_name
    [@ocaml.doc "The name of the Config rule.\n"]}[@@ocaml.doc ""]
type nonrec invalid_result_token_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The specified [ResultToken] is not valid.\n"]
type nonrec evaluation =
  {
  ordering_timestamp: ordering_timestamp
    [@ocaml.doc
      "The time of the event in Config that triggered the evaluation. For event-based evaluations, the time indicates when Config created the configuration item that triggered the evaluation. For periodic evaluations, the time indicates when Config triggered the evaluation at the frequency that you specified (for example, every 24 hours).\n"];
  annotation: string_with_char_limit256 option
    [@ocaml.doc
      "Supplementary information about how the evaluation determined the compliance.\n"];
  compliance_type: compliance_type
    [@ocaml.doc
      "Indicates whether the Amazon Web Services resource complies with the Config rule that it was evaluated against.\n\n For the [Evaluation] data type, Config supports only the [COMPLIANT], [NON_COMPLIANT], and [NOT_APPLICABLE] values. Config does not support the [INSUFFICIENT_DATA] value for this data type.\n \n  Similarly, Config does not accept [INSUFFICIENT_DATA] as the value for [ComplianceType] from a [PutEvaluations] request. For example, an Lambda function for a custom Config rule cannot pass an [INSUFFICIENT_DATA] value to Config.\n  "];
  compliance_resource_id: base_resource_id
    [@ocaml.doc
      "The ID of the Amazon Web Services resource that was evaluated.\n"];
  compliance_resource_type: string_with_char_limit256
    [@ocaml.doc
      "The type of Amazon Web Services resource that was evaluated.\n"]}
[@@ocaml.doc
  "Identifies an Amazon Web Services resource and indicates whether it complies with the Config rule that it was evaluated against.\n"]
type nonrec evaluations = evaluation list[@@ocaml.doc ""]
type nonrec put_evaluations_response =
  {
  failed_evaluations: evaluations option
    [@ocaml.doc
      "Requests that failed because of a client or server error.\n"]}
[@@ocaml.doc "\n"]
type nonrec put_evaluations_request =
  {
  test_mode: boolean_ option
    [@ocaml.doc
      "Use this parameter to specify a test run for [PutEvaluations]. You can verify whether your Lambda function will deliver evaluation results to Config. No updates occur to your existing evaluations, and evaluation results are not sent to Config.\n\n  When [TestMode] is [true], [PutEvaluations] doesn't require a valid value for the [ResultToken] parameter, but the value cannot be null.\n  \n   "];
  result_token: string_
    [@ocaml.doc
      "An encrypted token that associates an evaluation with an Config rule. Identifies the rule and the event that triggered the evaluation.\n"];
  evaluations: evaluations option
    [@ocaml.doc
      "The assessments that the Lambda function performs. Each evaluation identifies an Amazon Web Services resource and indicates whether it complies with the Config rule that invokes the Lambda function.\n"]}
[@@ocaml.doc "\n"]
type nonrec no_such_bucket_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The specified Amazon S3 bucket does not exist.\n"]
type nonrec no_available_configuration_recorder_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "There are no customer managed configuration recorders available to record your resources. Use the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutConfigurationRecorder.html}PutConfigurationRecorder} operation to create the customer managed configuration recorder.\n"]
type nonrec max_number_of_delivery_channels_exceeded_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have reached the limit of the number of delivery channels you can create.\n"]
type nonrec invalid_sns_topic_arn_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The specified Amazon SNS topic does not exist.\n"]
type nonrec invalid_s3_kms_key_arn_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The specified Amazon KMS Key ARN is not valid.\n"]
type nonrec invalid_s3_key_prefix_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The specified Amazon S3 key prefix is not valid.\n"]
type nonrec invalid_delivery_channel_name_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The specified delivery channel name is not valid.\n"]
type nonrec insufficient_delivery_policy_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "Your Amazon S3 bucket policy does not allow Config to write to it.\n"]
type nonrec channel_name = string[@@ocaml.doc ""]
type nonrec config_snapshot_delivery_properties =
  {
  delivery_frequency: maximum_execution_frequency option
    [@ocaml.doc
      "The frequency with which Config delivers configuration snapshots.\n"]}
[@@ocaml.doc
  "Provides options for how often Config delivers configuration snapshots to the Amazon S3 bucket in your delivery channel.\n\n The frequency for a rule that triggers evaluations for your resources when Config delivers the configuration snapshot is set by one of two values, depending on which is less frequent:\n \n  {ul\n        {-  The value for the [deliveryFrequency] parameter within the delivery channel configuration, which sets how often Config delivers configuration snapshots. This value also sets how often Config invokes evaluations for Config rules.\n            \n             }\n        {-  The value for the [MaximumExecutionFrequency] parameter, which sets the maximum frequency with which Config invokes evaluations for the rule. For more information, see [ConfigRule].\n            \n             }\n        }\n   If the [deliveryFrequency] value is less frequent than the [MaximumExecutionFrequency] value for a rule, Config invokes the rule only as often as the [deliveryFrequency] value.\n   \n    {ol\n          {-  For example, you want your rule to run evaluations when Config delivers the configuration snapshot.\n              \n               }\n          {-  You specify the [MaximumExecutionFrequency] value for [Six_Hours]. \n              \n               }\n          {-  You then specify the delivery channel [deliveryFrequency] value for [TwentyFour_Hours].\n              \n               }\n          {-  Because the value for [deliveryFrequency] is less frequent than [MaximumExecutionFrequency], Config invokes evaluations for the rule every 24 hours. \n              \n               }\n          }\n   You should set the [MaximumExecutionFrequency] value to be at least as frequent as the [deliveryFrequency] value. You can view the [deliveryFrequency] value by using the [DescribeDeliveryChannnels] action.\n   \n    To update the [deliveryFrequency] with which Config delivers your configuration snapshots, use the [PutDeliveryChannel] action.\n    "]
type nonrec delivery_channel =
  {
  config_snapshot_delivery_properties:
    config_snapshot_delivery_properties option
    [@ocaml.doc
      "The options for how often Config delivers configuration snapshots to the Amazon S3 bucket.\n"];
  sns_topic_ar_n: string_ option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Amazon SNS topic to which Config sends notifications about configuration changes.\n\n If you choose a topic from another account, the topic must have policies that grant access permissions to Config. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/sns-topic-policy.html}Permissions for the Amazon SNS Topic} in the {i Config Developer Guide}.\n "];
  s3_kms_key_arn: string_ option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Key Management Service (KMS ) KMS key (KMS key) used to encrypt objects delivered by Config. Must belong to the same Region as the destination S3 bucket.\n"];
  s3_key_prefix: string_ option
    [@ocaml.doc "The prefix for the specified Amazon S3 bucket.\n"];
  s3_bucket_name: string_ option
    [@ocaml.doc
      "The name of the Amazon S3 bucket to which Config delivers configuration snapshots and configuration history files.\n\n If you specify a bucket that belongs to another Amazon Web Services account, that bucket must have policies that grant access permissions to Config. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-policy.html}Permissions for the Amazon S3 Bucket} in the {i Config Developer Guide}.\n "];
  name: channel_name option
    [@ocaml.doc
      "The name of the delivery channel. By default, Config assigns the name \"default\" when creating the delivery channel. To change the delivery channel name, you must use the DeleteDeliveryChannel action to delete your current delivery channel, and then you must use the PutDeliveryChannel command to create a delivery channel that has the desired name.\n"]}
[@@ocaml.doc
  "The channel through which Config delivers notifications and updated configuration states.\n"]
type nonrec put_delivery_channel_request =
  {
  delivery_channel: delivery_channel
    [@ocaml.doc
      "An object for the delivery channel. A delivery channel sends notifications and updated configuration states. \n"]}
[@@ocaml.doc "The input for the [PutDeliveryChannel] action.\n"]
type nonrec max_number_of_conformance_packs_exceeded_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have reached the limit of the number of conformance packs you can create in an account. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.\n"]
type nonrec conformance_pack_template_validation_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have specified a template that is not valid or supported.\n"]
type nonrec conformance_pack_arn = string[@@ocaml.doc ""]
type nonrec put_conformance_pack_response =
  {
  conformance_pack_arn: conformance_pack_arn option
    [@ocaml.doc "ARN of the conformance pack.\n"]}[@@ocaml.doc ""]
type nonrec conformance_pack_name = string[@@ocaml.doc ""]
type nonrec put_conformance_pack_request =
  {
  template_ssm_document_details: template_ssm_document_details option
    [@ocaml.doc
      "An object of type [TemplateSSMDocumentDetails], which contains the name or the Amazon Resource Name (ARN) of the Amazon Web Services Systems Manager document (SSM document) and the version of the SSM document that is used to create a conformance pack.\n"];
  conformance_pack_input_parameters: conformance_pack_input_parameters option
    [@ocaml.doc "A list of [ConformancePackInputParameter] objects.\n"];
  delivery_s3_key_prefix: delivery_s3_key_prefix option
    [@ocaml.doc
      "The prefix for the Amazon S3 bucket. \n\n  This field is optional.\n  \n   "];
  delivery_s3_bucket: delivery_s3_bucket option
    [@ocaml.doc
      "The name of the Amazon S3 bucket where Config stores conformance pack templates.\n\n  This field is optional.\n  \n   "];
  template_body: template_body option
    [@ocaml.doc
      "A string containing the full conformance pack template body. The structure containing the template body has a minimum length of 1 byte and a maximum length of 51,200 bytes.\n\n  You can use a YAML template with two resource types: Config rule ([AWS::Config::ConfigRule]) and remediation action ([AWS::Config::RemediationConfiguration]).\n  \n   "];
  template_s3_uri: template_s3_uri option
    [@ocaml.doc
      "The location of the file containing the template body ([s3://bucketname/prefix]). The uri must point to a conformance pack template (max size: 300 KB) that is located in an Amazon S3 bucket in the same Region as the conformance pack. \n\n  You must have access to read Amazon S3 bucket. In addition, in order to ensure a successful deployment, the template object must not be in an {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-class-intro.html}archived storage class} if this parameter is passed.\n  \n   "];
  conformance_pack_name: conformance_pack_name
    [@ocaml.doc
      "The unique name of the conformance pack you want to deploy.\n"]}
[@@ocaml.doc ""]
type nonrec max_number_of_configuration_recorders_exceeded_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have reached the limit of the number of configuration recorders you can create.\n"]
type nonrec invalid_role_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have provided a null or empty Amazon Resource Name (ARN) for the IAM role assumed by Config and used by the customer managed configuration recorder.\n"]
type nonrec invalid_recording_group_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "One of the following errors:\n\n {ul\n       {-  You have provided a combination of parameter values that is not valid. For example:\n           \n            {ul\n                  {-  Setting the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true], but providing a non-empty list for the [resourceTypes]field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}.\n                      \n                       }\n                  {-  Setting the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true], but also setting the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [EXCLUSION_BY_RESOURCE_TYPES].\n                      \n                       }\n                  \n        }\n         }\n       {-  Every parameter is either null, false, or empty.\n           \n            }\n       {-  You have reached the limit of the number of resource types you can provide for the recording group.\n           \n            }\n       {-  You have provided resource types or a recording strategy that are not valid.\n           \n            }\n       }\n  "]
type nonrec invalid_configuration_recorder_name_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have provided a name for the customer managed configuration recorder that is not valid.\n"]
type nonrec all_supported = bool[@@ocaml.doc ""]
type nonrec include_global_resource_types = bool[@@ocaml.doc ""]
type nonrec resource_type_list = resource_type list[@@ocaml.doc ""]
type nonrec exclusion_by_resource_types =
  {
  resource_types: resource_type_list option
    [@ocaml.doc
      "A comma-separated list of resource types to exclude from recording by the configuration recorder.\n"]}
[@@ocaml.doc
  "Specifies whether the configuration recorder excludes certain resource types from being recorded. Use the [resourceTypes] field to enter a comma-separated list of resource types you want to exclude from recording.\n\n By default, when Config adds support for a new resource type in the Region where you set up the configuration recorder, including global resource types, Config starts recording resources of that type automatically.\n \n    {b How to use the exclusion recording strategy } \n   \n    To use this option, you must set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [EXCLUSION_BY_RESOURCE_TYPES].\n    \n     Config will then record configuration changes for all supported resource types, except the resource types that you specify to exclude from being recorded.\n     \n       {b Global resource types and the exclusion recording strategy } \n      \n       Unless specifically listed as exclusions, [AWS::RDS::GlobalCluster] will be recorded automatically in all supported Config Regions were the configuration recorder is enabled.\n       \n        IAM users, groups, roles, and customer managed policies will be recorded in the Region where you set up the configuration recorder if that is a Region where Config was available before February 2022. You cannot be record the global IAM resouce types in Regions supported by Config after February 2022. For a list of those Regions, see {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html#select-resources-all}Recording Amazon Web Services Resources | Global Resources}.\n        \n         "]
type nonrec recording_strategy_type =
  | EXCLUSION_BY_RESOURCE_TYPES [@ocaml.doc ""]
  | INCLUSION_BY_RESOURCE_TYPES [@ocaml.doc ""]
  | ALL_SUPPORTED_RESOURCE_TYPES [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec recording_strategy =
  {
  use_only: recording_strategy_type option
    [@ocaml.doc
      "The recording strategy for the configuration recorder.\n\n {ul\n       {-  If you set this option to [ALL_SUPPORTED_RESOURCE_TYPES], Config records configuration changes for all supported resource types, excluding the global IAM resource types. You also must set the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true]. When Config adds support for a new resource type, Config automatically starts recording resources of that type. For a list of supported resource types, see {{:https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources}Supported Resource Types} in the {i Config developer guide}.\n           \n            }\n       {-  If you set this option to [INCLUSION_BY_RESOURCE_TYPES], Config records configuration changes for only the resource types that you specify in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}.\n           \n            }\n       {-  If you set this option to [EXCLUSION_BY_RESOURCE_TYPES], Config records configuration changes for all supported resource types, except the resource types that you specify to exclude from being recorded in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ExclusionByResourceTypes.html}ExclusionByResourceTypes}.\n           \n            }\n       }\n     {b Required and optional fields} \n    \n     The [recordingStrategy] field is optional when you set the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true].\n     \n      The [recordingStrategy] field is optional when you list resource types in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}.\n      \n       The [recordingStrategy] field is required if you list resource types to exclude from recording in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ExclusionByResourceTypes.html}ExclusionByResourceTypes}.\n       \n           {b Overriding fields} \n          \n           If you choose [EXCLUSION_BY_RESOURCE_TYPES] for the recording strategy, the [exclusionByResourceTypes] field will override other properties in the request.\n           \n            For example, even if you set [includeGlobalResourceTypes] to false, global IAM resource types will still be automatically recorded in this option unless those resource types are specifically listed as exclusions in the [resourceTypes] field of [exclusionByResourceTypes].\n            \n                {b Global resource types and the exclusion recording strategy} \n               \n                By default, if you choose the [EXCLUSION_BY_RESOURCE_TYPES] recording strategy, when Config adds support for a new resource type in the Region where you set up the configuration recorder, including global resource types, Config starts recording resources of that type automatically.\n                \n                 Unless specifically listed as exclusions, [AWS::RDS::GlobalCluster] will be recorded automatically in all supported Config Regions were the configuration recorder is enabled.\n                 \n                  IAM users, groups, roles, and customer managed policies will be recorded in the Region where you set up the configuration recorder if that is a Region where Config was available before February 2022. You cannot be record the global IAM resouce types in Regions supported by Config after February 2022. This list where you cannot record the global IAM resource types includes the following Regions:\n                  \n                   {ul\n                         {-  Asia Pacific (Hyderabad)\n                             \n                              }\n                         {-  Asia Pacific (Melbourne)\n                             \n                              }\n                         {-  Canada West (Calgary)\n                             \n                              }\n                         {-  Europe (Spain)\n                             \n                              }\n                         {-  Europe (Zurich)\n                             \n                              }\n                         {-  Israel (Tel Aviv)\n                             \n                              }\n                         {-  Middle East (UAE)\n                             \n                              }\n                         }\n   "]}
[@@ocaml.doc
  "Specifies the recording strategy of the configuration recorder.\n"]
type nonrec recording_group =
  {
  recording_strategy: recording_strategy option
    [@ocaml.doc
      "An object that specifies the recording strategy for the configuration recorder.\n\n {ul\n       {-  If you set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [ALL_SUPPORTED_RESOURCE_TYPES], Config records configuration changes for all supported resource types, excluding the global IAM resource types. You also must set the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true]. When Config adds support for a new resource type, Config automatically starts recording resources of that type.\n           \n            }\n       {-  If you set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [INCLUSION_BY_RESOURCE_TYPES], Config records configuration changes for only the resource types you specify in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}.\n           \n            }\n       {-  If you set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [EXCLUSION_BY_RESOURCE_TYPES], Config records configuration changes for all supported resource types except the resource types that you specify to exclude from being recorded in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ExclusionByResourceTypes.html}ExclusionByResourceTypes}.\n           \n            }\n       }\n     {b Required and optional fields} \n    \n     The [recordingStrategy] field is optional when you set the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true].\n     \n      The [recordingStrategy] field is optional when you list resource types in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}.\n      \n       The [recordingStrategy] field is required if you list resource types to exclude from recording in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ExclusionByResourceTypes.html}ExclusionByResourceTypes}.\n       \n           {b Overriding fields} \n          \n           If you choose [EXCLUSION_BY_RESOURCE_TYPES] for the recording strategy, the [exclusionByResourceTypes] field will override other properties in the request.\n           \n            For example, even if you set [includeGlobalResourceTypes] to false, global IAM resource types will still be automatically recorded in this option unless those resource types are specifically listed as exclusions in the [resourceTypes] field of [exclusionByResourceTypes].\n            \n                {b Global resources types and the resource exclusion recording strategy} \n               \n                By default, if you choose the [EXCLUSION_BY_RESOURCE_TYPES] recording strategy, when Config adds support for a new resource type in the Region where you set up the configuration recorder, including global resource types, Config starts recording resources of that type automatically.\n                \n                 Unless specifically listed as exclusions, [AWS::RDS::GlobalCluster] will be recorded automatically in all supported Config Regions were the configuration recorder is enabled.\n                 \n                  IAM users, groups, roles, and customer managed policies will be recorded in the Region where you set up the configuration recorder if that is a Region where Config was available before February 2022. You cannot be record the global IAM resouce types in Regions supported by Config after February 2022. For a list of those Regions, see {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html#select-resources-all}Recording Amazon Web Services Resources | Global Resources}.\n                  \n                   "];
  exclusion_by_resource_types: exclusion_by_resource_types option
    [@ocaml.doc
      "An object that specifies how Config excludes resource types from being recorded by the configuration recorder.\n\n   {b Required fields} \n  \n   To use this option, you must set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [EXCLUSION_BY_RESOURCE_TYPES].\n   \n    "];
  resource_types: resource_type_list option
    [@ocaml.doc
      "A comma-separated list that specifies which resource types Config records.\n\n For a list of valid [resourceTypes] values, see the {b Resource Type Value} column in {{:https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources}Supported Amazon Web Services resource Types} in the {i Config developer guide}.\n \n    {b Required and optional fields} \n   \n    Optionally, you can set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [INCLUSION_BY_RESOURCE_TYPES].\n    \n     To record all configuration changes, set the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true], and either omit this field or don't specify any resource types in this field. If you set the [allSupported] field to [false] and specify values for [resourceTypes], when Config adds support for a new type of resource, it will not record resources of that type unless you manually add that type to your recording group.\n     \n         {b Region availability} \n        \n         Before specifying a resource type for Config to track, check {{:https://docs.aws.amazon.com/config/latest/developerguide/what-is-resource-config-coverage.html}Resource Coverage by Region Availability} to see if the resource type is supported in the Amazon Web Services Region where you set up Config. If a resource type is supported by Config in at least one Region, you can enable the recording of that resource type in all Regions supported by Config, even if the specified resource type is not supported in the Amazon Web Services Region where you set up Config.\n         \n          "];
  include_global_resource_types: include_global_resource_types option
    [@ocaml.doc
      "This option is a bundle which only applies to the global IAM resource types: IAM users, groups, roles, and customer managed policies. These global IAM resource types can only be recorded by Config in Regions where Config was available before February 2022. You cannot be record the global IAM resouce types in Regions supported by Config after February 2022. For a list of those Regions, see {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html#select-resources-all}Recording Amazon Web Services Resources | Global Resources}.\n\n   {b Aurora global clusters are recorded in all enabled Regions} \n  \n   The [AWS::RDS::GlobalCluster] resource type will be recorded in all supported Config Regions where the configuration recorder is enabled, even if [includeGlobalResourceTypes] is set[false]. The [includeGlobalResourceTypes] option is a bundle which only applies to IAM users, groups, roles, and customer managed policies. \n   \n    If you do not want to record [AWS::RDS::GlobalCluster] in all enabled Regions, use one of the following recording strategies:\n    \n     {ol\n           {-   {b Record all current and future resource types with exclusions} ([EXCLUSION_BY_RESOURCE_TYPES]), or\n               \n                }\n           {-   {b Record specific resource types} ([INCLUSION_BY_RESOURCE_TYPES]).\n               \n                }\n           }\n   For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html#select-resources-all}Selecting Which Resources are Recorded} in the {i Config developer guide}.\n   \n       {b includeGlobalResourceTypes and the exclusion recording strategy} \n      \n       The [includeGlobalResourceTypes] field has no impact on the [EXCLUSION_BY_RESOURCE_TYPES] recording strategy. This means that the global IAM resource types (IAM users, groups, roles, and customer managed policies) will not be automatically added as exclusions for [exclusionByResourceTypes] when [includeGlobalResourceTypes] is set to [false].\n       \n        The [includeGlobalResourceTypes] field should only be used to modify the [AllSupported] field, as the default for the [AllSupported] field is to record configuration changes for all supported resource types excluding the global IAM resource types. To include the global IAM resource types when [AllSupported] is set to [true], make sure to set [includeGlobalResourceTypes] to [true].\n        \n         To exclude the global IAM resource types for the [EXCLUSION_BY_RESOURCE_TYPES] recording strategy, you need to manually add them to the [resourceTypes] field of [exclusionByResourceTypes].\n         \n             {b Required and optional fields} \n            \n             Before you set this field to [true], set the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true]. Optionally, you can set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [ALL_SUPPORTED_RESOURCE_TYPES].\n             \n                 {b Overriding fields} \n                \n                 If you set this field to [false] but list global IAM resource types in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}, Config will still record configuration changes for those specified resource types {i regardless} of if you set the [includeGlobalResourceTypes] field to false.\n                 \n                  If you do not want to record configuration changes to the global IAM resource types (IAM users, groups, roles, and customer managed policies), make sure to not list them in the [resourceTypes] field in addition to setting the [includeGlobalResourceTypes] field to false.\n                  \n                   "];
  all_supported: all_supported option
    [@ocaml.doc
      "Specifies whether Config records configuration changes for all supported resource types, excluding the global IAM resource types.\n\n If you set this field to [true], when Config adds support for a new resource type, Config starts recording resources of that type automatically.\n \n  If you set this field to [true], you cannot enumerate specific resource types to record in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}, or to exclude in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ExclusionByResourceTypes.html}ExclusionByResourceTypes}.\n  \n     {b Region availability} \n    \n     Check {{:https://docs.aws.amazon.com/config/latest/developerguide/what-is-resource-config-coverage.html}Resource Coverage by Region Availability} to see if a resource type is supported in the Amazon Web Services Region where you set up Config.\n     \n      "]}
[@@ocaml.doc
  "Specifies which resource types Config records for configuration changes. By default, Config records configuration changes for all current and future supported resource types in the Amazon Web Services Region where you have enabled Config, excluding the global IAM resource types: IAM users, groups, roles, and customer managed policies.\n\n In the recording group, you specify whether you want to record all supported current and future supported resource types or to include or exclude specific resources types. For a list of supported resource types, see {{:https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources}Supported Resource Types} in the {i Config developer guide}.\n \n  If you don't want Config to record all current and future supported resource types (excluding the global IAM resource types), use one of the following recording strategies:\n  \n   {ol\n         {-   {b Record all current and future resource types with exclusions} ([EXCLUSION_BY_RESOURCE_TYPES]), or\n             \n              }\n         {-   {b Record specific resource types} ([INCLUSION_BY_RESOURCE_TYPES]).\n             \n              }\n         }\n   If you use the recording strategy to {b Record all current and future resource types} ([ALL_SUPPORTED_RESOURCE_TYPES]), you can use the flag [includeGlobalResourceTypes] to include the global IAM resource types in your recording.\n   \n      {b Aurora global clusters are recorded in all enabled Regions} \n     \n      The [AWS::RDS::GlobalCluster] resource type will be recorded in all supported Config Regions where the configuration recorder is enabled.\n      \n       If you do not want to record [AWS::RDS::GlobalCluster] in all enabled Regions, use the [EXCLUSION_BY_RESOURCE_TYPES] or [INCLUSION_BY_RESOURCE_TYPES] recording strategy.\n       \n        "]
type nonrec recording_frequency =
  | DAILY [@ocaml.doc ""]
  | CONTINUOUS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec description = string[@@ocaml.doc ""]
type nonrec recording_mode_resource_types_list = resource_type list[@@ocaml.doc
                                                                    ""]
type nonrec recording_mode_override =
  {
  recording_frequency: recording_frequency
    [@ocaml.doc
      "The recording frequency that will be applied to all the resource types specified in the override.\n\n {ul\n       {-  Continuous recording allows you to record configuration changes continuously whenever a change occurs.\n           \n            }\n       {-  Daily recording allows you to receive a configuration item (CI) representing the most recent state of your resources over the last 24-hour period, only if it\226\128\153s different from the previous CI recorded. \n           \n            }\n       }\n    Firewall Manager depends on continuous recording to monitor your resources. If you are using Firewall Manager, it is recommended that you set the recording frequency to Continuous.\n    \n     "];
  resource_types: recording_mode_resource_types_list
    [@ocaml.doc
      "A comma-separated list that specifies which resource types Config includes in the override.\n\n  Daily recording cannot be specified for the following resource types:\n  \n   {ul\n         {-   [AWS::Config::ResourceCompliance] \n             \n              }\n         {-   [AWS::Config::ConformancePackCompliance] \n             \n              }\n         {-   [AWS::Config::ConfigurationRecorder] \n             \n              }\n         }\n   "];
  description: description option
    [@ocaml.doc "A description that you provide for the override.\n"]}
[@@ocaml.doc
  "An object for you to specify your overrides for the recording mode.\n"]
type nonrec recording_mode_overrides = recording_mode_override list[@@ocaml.doc
                                                                    ""]
type nonrec recording_mode =
  {
  recording_mode_overrides: recording_mode_overrides option
    [@ocaml.doc
      "An array of [recordingModeOverride] objects for you to specify your overrides for the recording mode. The [recordingModeOverride] object in the [recordingModeOverrides] array consists of three fields: a [description], the new [recordingFrequency], and an array of [resourceTypes] to override.\n"];
  recording_frequency: recording_frequency
    [@ocaml.doc
      "The default recording frequency that Config uses to record configuration changes.\n\n  Daily recording cannot be specified for the following resource types:\n  \n   {ul\n         {-   [AWS::Config::ResourceCompliance] \n             \n              }\n         {-   [AWS::Config::ConformancePackCompliance] \n             \n              }\n         {-   [AWS::Config::ConfigurationRecorder] \n             \n              }\n         }\n   For the {b allSupported} ([ALL_SUPPORTED_RESOURCE_TYPES]) recording strategy, these resource types will be set to Continuous recording.\n   \n    "]}
[@@ocaml.doc
  "Specifies the default recording frequency that Config uses to record configuration changes. Config supports {i Continuous recording} and {i Daily recording}.\n\n {ul\n       {-  Continuous recording allows you to record configuration changes continuously whenever a change occurs.\n           \n            }\n       {-  Daily recording allows you to receive a configuration item (CI) representing the most recent state of your resources over the last 24-hour period, only if it\226\128\153s different from the previous CI recorded. \n           \n            }\n       }\n    Firewall Manager depends on continuous recording to monitor your resources. If you are using Firewall Manager, it is recommended that you set the recording frequency to Continuous.\n    \n      You can also override the recording frequency for specific resource types.\n      "]
type nonrec recording_scope =
  | PAID [@ocaml.doc ""]
  | INTERNAL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec configuration_recorder =
  {
  service_principal: service_principal option
    [@ocaml.doc
      "For service-linked configuration recorders, specifies the linked Amazon Web Services service for the configuration recorder.\n"];
  recording_scope: recording_scope option
    [@ocaml.doc
      "Specifies whether the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ConfigurationItem.html}ConfigurationItems} in scope for the specified configuration recorder are recorded for free ([INTERNAL]) or if it impacts the costs to your bill ([PAID]).\n"];
  recording_mode: recording_mode option
    [@ocaml.doc
      "Specifies the default recording frequency for the configuration recorder. Config supports {i Continuous recording} and {i Daily recording}.\n\n {ul\n       {-  Continuous recording allows you to record configuration changes continuously whenever a change occurs.\n           \n            }\n       {-  Daily recording allows you to receive a configuration item (CI) representing the most recent state of your resources over the last 24-hour period, only if it\226\128\153s different from the previous CI recorded. \n           \n            }\n       }\n     {b Some resource types require continuous recording} \n    \n     Firewall Manager depends on continuous recording to monitor your resources. If you are using Firewall Manager, it is recommended that you set the recording frequency to Continuous.\n     \n       You can also override the recording frequency for specific resource types.\n       "];
  recording_group: recording_group option
    [@ocaml.doc
      "Specifies which resource types are in scope for the configuration recorder to record.\n\n   {b  High Number of Config Evaluations} \n  \n   You might notice increased activity in your account during your initial month recording with Config when compared to subsequent months. During the initial bootstrapping process, Config runs evaluations on all the resources in your account that you have selected for Config to record.\n   \n    If you are running ephemeral workloads, you may see increased activity from Config as it records configuration changes associated with creating and deleting these temporary resources. An {i ephemeral workload} is a temporary use of computing resources that are loaded and run when needed. Examples include Amazon Elastic Compute Cloud (Amazon EC2) Spot Instances, Amazon EMR jobs, and Auto Scaling.\n    \n     If you want to avoid the increased activity from running ephemeral workloads, you can set up the configuration recorder to exclude these resource types from being recorded, or run these types of workloads in a separate account with Config turned off to avoid increased configuration recording and rule evaluations.\n     \n      "];
  role_ar_n: string_ option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role assumed by Config and used by the specified configuration recorder.\n\n   {b The server will reject a request without a defined [roleARN] for the configuration recorder} \n  \n   While the API model does not require this field, the server will reject a request without a defined [roleARN] for the configuration recorder.\n   \n     {b Policies and compliance results} \n    \n      {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html}IAM policies} and {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies.html}other policies managed in Organizations} can impact whether Config has permissions to record configuration changes for your resources. Additionally, rules directly evaluate the configuration of a resource and rules don't take into account these policies when running evaluations. Make sure that the policies in effect align with how you intend to use Config.\n     \n       {b Keep Minimum Permisions When Reusing an IAM role} \n      \n       If you use an Amazon Web Services service that uses Config, such as Security Hub or Control Tower, and an IAM role has already been created, make sure that the IAM role that you use when setting up Config keeps the same minimum permissions as the pre-existing IAM role. You must do this to ensure that the other Amazon Web Services service continues to run as expected. \n       \n        For example, if Control Tower has an IAM role that allows Config to read S3 objects, make sure that the same permissions are granted to the IAM role you use when setting up Config. Otherwise, it may interfere with how Control Tower operates.\n        \n          {b The service-linked IAM role for Config must be used for service-linked configuration recorders} \n         \n          For service-linked configuration recorders, you must use the service-linked IAM role for Config: {{:https://docs.aws.amazon.com/config/latest/developerguide/using-service-linked-roles.html}AWSServiceRoleForConfig}.\n          \n           "];
  name: recorder_name option
    [@ocaml.doc
      "The name of the configuration recorder.\n\n For customer managed configuration recorders, Config automatically assigns the name of \"default\" when creating a configuration recorder if you do not specify a name at creation time.\n \n  For service-linked configuration recorders, Config automatically assigns a name that has the prefix \"[AWS]\" to a new service-linked configuration recorder.\n  \n     {b Changing the name of a configuration recorder} \n    \n     To change the name of the customer managed configuration recorder, you must delete it and create a new customer managed configuration recorder with a new name.\n     \n      You cannot change the name of a service-linked configuration recorder.\n      \n       "];
  arn: amazon_resource_name option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the specified configuration recorder.\n"]}
[@@ocaml.doc
  "Records configuration changes to the resource types in scope.\n\n For more information about the configuration recorder, see {{:https://docs.aws.amazon.com/config/latest/developerguide/stop-start-recorder.html} {b Working with the Configuration Recorder} } in the {i Config Developer Guide}.\n "]
type nonrec put_configuration_recorder_request =
  {
  tags: tags_list option
    [@ocaml.doc
      "The tags for the customer managed configuration recorder. Each tag consists of a key and an optional value, both of which you define.\n"];
  configuration_recorder: configuration_recorder
    [@ocaml.doc
      "An object for the configuration recorder. A configuration recorder records configuration changes for the resource types in scope.\n"]}
[@@ocaml.doc "The input for the [PutConfigurationRecorder] action.\n"]
type nonrec configuration_aggregator_arn = string[@@ocaml.doc ""]
type nonrec account_aggregation_source_account_list = account_id list
[@@ocaml.doc ""]
type nonrec aggregator_region_list = string_ list[@@ocaml.doc ""]
type nonrec account_aggregation_source =
  {
  aws_regions: aggregator_region_list option
    [@ocaml.doc "The source regions being aggregated.\n"];
  all_aws_regions: boolean_ option
    [@ocaml.doc
      "If true, aggregate existing Config regions and future regions.\n"];
  account_ids: account_aggregation_source_account_list
    [@ocaml.doc
      "The 12-digit account ID of the account being aggregated. \n"]}
[@@ocaml.doc "A collection of accounts and regions.\n"]
type nonrec account_aggregation_source_list = account_aggregation_source list
[@@ocaml.doc ""]
type nonrec organization_aggregation_source =
  {
  all_aws_regions: boolean_ option
    [@ocaml.doc
      "If true, aggregate existing Config regions and future regions.\n"];
  aws_regions: aggregator_region_list option
    [@ocaml.doc "The source regions being aggregated.\n"];
  role_arn: string_
    [@ocaml.doc
      "ARN of the IAM role used to retrieve Amazon Web Services Organization details associated with the aggregator account.\n"]}
[@@ocaml.doc
  "This object contains regions to set up the aggregator and an IAM role to retrieve organization details.\n"]
type nonrec aggregator_filter_type =
  | INCLUDE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_type_value = string[@@ocaml.doc ""]
type nonrec resource_type_value_list = resource_type_value list[@@ocaml.doc
                                                                 ""]
type nonrec aggregator_filter_resource_type =
  {
  value: resource_type_value_list option
    [@ocaml.doc
      "Comma-separate list of resource types to filter your aggregated configuration recorders.\n"];
  type_: aggregator_filter_type option
    [@ocaml.doc
      "The type of resource type filter to apply. [INCLUDE] specifies that the list of resource types in the [Value] field will be aggregated and no other resource types will be filtered.\n"]}
[@@ocaml.doc
  "An object to filter the configuration recorders based on the resource types in scope for recording.\n"]
type nonrec service_principal_value = string[@@ocaml.doc ""]
type nonrec service_principal_value_list = service_principal_value list
[@@ocaml.doc ""]
type nonrec aggregator_filter_service_principal =
  {
  value: service_principal_value_list option
    [@ocaml.doc
      "Comma-separated list of service principals for the linked Amazon Web Services services to filter your aggregated service-linked configuration recorders.\n"];
  type_: aggregator_filter_type option
    [@ocaml.doc
      "The type of service principal filter to apply. [INCLUDE] specifies that the list of service principals in the [Value] field will be aggregated and no other service principals will be filtered.\n"]}
[@@ocaml.doc
  "An object to filter service-linked configuration recorders in an aggregator based on the linked Amazon Web Services service.\n"]
type nonrec aggregator_filters =
  {
  service_principal: aggregator_filter_service_principal option
    [@ocaml.doc
      "An object to filter service-linked configuration recorders in an aggregator based on the linked Amazon Web Services service.\n"];
  resource_type: aggregator_filter_resource_type option
    [@ocaml.doc
      "An object to filter the configuration recorders based on the resource types in scope for recording.\n"]}
[@@ocaml.doc "An object to filter the data you specify for an aggregator.\n"]
type nonrec configuration_aggregator =
  {
  aggregator_filters: aggregator_filters option
    [@ocaml.doc
      "An object to filter the data you specify for an aggregator.\n"];
  created_by: string_with_char_limit256 option
    [@ocaml.doc
      "Amazon Web Services service that created the configuration aggregator.\n"];
  last_updated_time: date option
    [@ocaml.doc "The time of the last update.\n"];
  creation_time: date option
    [@ocaml.doc
      "The time stamp when the configuration aggregator was created.\n"];
  organization_aggregation_source: organization_aggregation_source option
    [@ocaml.doc
      "Provides an organization and list of regions to be aggregated.\n"];
  account_aggregation_sources: account_aggregation_source_list option
    [@ocaml.doc
      "Provides a list of source accounts and regions to be aggregated.\n"];
  configuration_aggregator_arn: configuration_aggregator_arn option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the aggregator.\n"];
  configuration_aggregator_name: configuration_aggregator_name option
    [@ocaml.doc "The name of the aggregator.\n"]}[@@ocaml.doc
                                                   "The details about the configuration aggregator, including information about source accounts, regions, and metadata of the aggregator. \n"]
type nonrec put_configuration_aggregator_response =
  {
  configuration_aggregator: configuration_aggregator option
    [@ocaml.doc "Returns a ConfigurationAggregator object.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec put_configuration_aggregator_request =
  {
  aggregator_filters: aggregator_filters option
    [@ocaml.doc
      "An object to filter configuration recorders in an aggregator. Either [ResourceType] or [ServicePrincipal] is required.\n"];
  tags: tags_list option [@ocaml.doc "An array of tag object.\n"];
  organization_aggregation_source: organization_aggregation_source option
    [@ocaml.doc "An OrganizationAggregationSource object.\n"];
  account_aggregation_sources: account_aggregation_source_list option
    [@ocaml.doc "A list of AccountAggregationSource object. \n"];
  configuration_aggregator_name: configuration_aggregator_name
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec max_number_of_config_rules_exceeded_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "Failed to add the Config rule because the account already contains the maximum number of 1000 rules. Consider deleting any deactivated rules before you add new rules.\n"]
type nonrec emptiable_string_with_char_limit256 = string[@@ocaml.doc ""]
type nonrec compliance_resource_types = string_with_char_limit256 list
[@@ocaml.doc ""]
type nonrec scope =
  {
  compliance_resource_id: base_resource_id option
    [@ocaml.doc
      "The ID of the only Amazon Web Services resource that you want to trigger an evaluation for the rule. If you specify a resource ID, you must specify one resource type for [ComplianceResourceTypes].\n"];
  tag_value: string_with_char_limit256 option
    [@ocaml.doc
      "The tag value applied to only those Amazon Web Services resources that you want to trigger an evaluation for the rule. If you specify a value for [TagValue], you must also specify a value for [TagKey].\n"];
  tag_key: string_with_char_limit128 option
    [@ocaml.doc
      "The tag key that is applied to only those Amazon Web Services resources that you want to trigger an evaluation for the rule.\n"];
  compliance_resource_types: compliance_resource_types option
    [@ocaml.doc
      "The resource types of only those Amazon Web Services resources that you want to trigger an evaluation for the rule. You can only specify one type if you also specify a resource ID for [ComplianceResourceId].\n"]}
[@@ocaml.doc
  "Defines which resources trigger an evaluation for an Config rule. The scope can include one or more resource types, a combination of a tag key and value, or a combination of one resource type and one resource ID. Specify a scope to constrain which resources trigger an evaluation for a rule. Otherwise, evaluations for the rule are triggered when any resource in your recording group changes in configuration.\n"]
type nonrec owner =
  | Custom_Policy [@ocaml.doc ""]
  | Aws [@ocaml.doc ""]
  | Custom_Lambda [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec event_source =
  | Aws_Config [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec message_type =
  | OversizedConfigurationItemChangeNotification [@ocaml.doc ""]
  | ScheduledNotification [@ocaml.doc ""]
  | ConfigurationSnapshotDeliveryCompleted [@ocaml.doc ""]
  | ConfigurationItemChangeNotification [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec source_detail =
  {
  maximum_execution_frequency: maximum_execution_frequency option
    [@ocaml.doc
      "The frequency at which you want Config to run evaluations for a custom rule with a periodic trigger. If you specify a value for [MaximumExecutionFrequency], then [MessageType] must use the [ScheduledNotification] value.\n\n  By default, rules with a periodic trigger are evaluated every 24 hours. To change the frequency, specify a valid value for the [MaximumExecutionFrequency] parameter.\n  \n   Based on the valid value you choose, Config runs evaluations once for each valid value. For example, if you choose [Three_Hours], Config runs evaluations once every three hours. In this case, [Three_Hours] is the frequency of this rule. \n   \n    "];
  message_type: message_type option
    [@ocaml.doc
      "The type of notification that triggers Config to run an evaluation for a rule. You can specify the following notification types:\n\n {ul\n       {-   [ConfigurationItemChangeNotification] - Triggers an evaluation when Config delivers a configuration item as a result of a resource change.\n           \n            }\n       {-   [OversizedConfigurationItemChangeNotification] - Triggers an evaluation when Config delivers an oversized configuration item. Config may generate this notification type when a resource changes and the notification exceeds the maximum size allowed by Amazon SNS.\n           \n            }\n       {-   [ScheduledNotification] - Triggers a periodic evaluation at the frequency specified for [MaximumExecutionFrequency].\n           \n            }\n       {-   [ConfigurationSnapshotDeliveryCompleted] - Triggers a periodic evaluation when Config delivers a configuration snapshot.\n           \n            }\n       }\n   If you want your custom rule to be triggered by configuration changes, specify two SourceDetail objects, one for [ConfigurationItemChangeNotification] and one for [OversizedConfigurationItemChangeNotification].\n   "];
  event_source: event_source option
    [@ocaml.doc
      "The source of the event, such as an Amazon Web Services service, that triggers Config to evaluate your Amazon Web Services resources.\n"]}
[@@ocaml.doc
  "Provides the source and the message types that trigger Config to evaluate your Amazon Web Services resources against a rule. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic. You can specify the parameter values for [SourceDetail] only for custom rules. \n"]
type nonrec source_details = source_detail list[@@ocaml.doc ""]
type nonrec custom_policy_details =
  {
  enable_debug_log_delivery: boolean_ option
    [@ocaml.doc
      "The boolean expression for enabling debug logging for your Config Custom Policy rule. The default value is [false].\n"];
  policy_text: policy_text
    [@ocaml.doc
      "The policy definition containing the logic for your Config Custom Policy rule.\n"];
  policy_runtime: policy_runtime
    [@ocaml.doc
      "The runtime system for your Config Custom Policy rule. Guard is a policy-as-code language that allows you to write policies that are enforced by Config Custom Policy rules. For more information about Guard, see the {{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}.\n"]}
[@@ocaml.doc
  "Provides the runtime system, policy definition, and whether debug logging enabled. You can specify the following CustomPolicyDetails parameter values only for Config Custom Policy rules.\n"]
type nonrec source =
  {
  custom_policy_details: custom_policy_details option
    [@ocaml.doc
      "Provides the runtime system, policy definition, and whether debug logging is enabled. Required when owner is set to [CUSTOM_POLICY].\n"];
  source_details: source_details option
    [@ocaml.doc
      "Provides the source and the message types that cause Config to evaluate your Amazon Web Services resources against a rule. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.\n\n If the owner is set to [CUSTOM_POLICY], the only acceptable values for the Config rule trigger message type are [ConfigurationItemChangeNotification] and [OversizedConfigurationItemChangeNotification].\n "];
  source_identifier: string_with_char_limit256 option
    [@ocaml.doc
      "For Config Managed rules, a predefined identifier from a list. For example, [IAM_PASSWORD_POLICY] is a managed rule. To reference a managed rule, see {{:https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html}List of Config Managed Rules}.\n\n For Config Custom Lambda rules, the identifier is the Amazon Resource Name (ARN) of the rule's Lambda function, such as [arn:aws:lambda:us-east-2:123456789012:function:custom_rule_name].\n \n  For Config Custom Policy rules, this field will be ignored.\n  "];
  owner: owner
    [@ocaml.doc
      "Indicates whether Amazon Web Services or the customer owns and manages the Config rule.\n\n Config Managed Rules are predefined rules owned by Amazon Web Services. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html}Config Managed Rules} in the {i Config developer guide}.\n \n  Config Custom Rules are rules that you can develop either with Guard ([CUSTOM_POLICY]) or Lambda ([CUSTOM_LAMBDA]). For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_develop-rules.html}Config Custom Rules } in the {i Config developer guide}.\n  "]}
[@@ocaml.doc
  "Provides the CustomPolicyDetails, the rule owner ([Amazon Web Services] for managed rules, [CUSTOM_POLICY] for Custom Policy rules, and [CUSTOM_LAMBDA] for Custom Lambda rules), the rule identifier, and the events that cause the evaluation of your Amazon Web Services resources.\n"]
type nonrec config_rule_state =
  | EVALUATING [@ocaml.doc ""]
  | DELETING_RESULTS [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec evaluation_mode_configuration =
  {
  mode: evaluation_mode option
    [@ocaml.doc
      "The mode of an evaluation. The valid values are Detective or Proactive.\n"]}
[@@ocaml.doc
  "The configuration object for Config rule evaluation mode. The supported valid values are Detective or Proactive.\n"]
type nonrec evaluation_modes = evaluation_mode_configuration list[@@ocaml.doc
                                                                   ""]
type nonrec config_rule =
  {
  evaluation_modes: evaluation_modes option
    [@ocaml.doc
      "The modes the Config rule can be evaluated in. The valid values are distinct objects. By default, the value is Detective evaluation mode only.\n"];
  created_by: string_with_char_limit256 option
    [@ocaml.doc
      "Service principal name of the service that created the rule.\n\n  The field is populated only if the service-linked rule is created by a service. The field is empty if you create your own rule.\n  \n   "];
  config_rule_state: config_rule_state option
    [@ocaml.doc
      "Indicates whether the Config rule is active or is currently being deleted by Config. It can also indicate the evaluation status for the Config rule.\n\n Config sets the state of the rule to [EVALUATING] temporarily after you use the [StartConfigRulesEvaluation] request to evaluate your resources against the Config rule.\n \n  Config sets the state of the rule to [DELETING_RESULTS] temporarily after you use the [DeleteEvaluationResults] request to delete the current evaluation results for the Config rule.\n  \n   Config temporarily sets the state of a rule to [DELETING] after you use the [DeleteConfigRule] request to delete the rule. After Config deletes the rule, the rule and all of its evaluations are erased and are no longer available.\n   "];
  maximum_execution_frequency: maximum_execution_frequency option
    [@ocaml.doc
      "The maximum frequency with which Config runs evaluations for a rule. You can specify a value for [MaximumExecutionFrequency] when:\n\n {ul\n       {-  This is for an Config managed rule that is triggered at a periodic frequency.\n           \n            }\n       {-  Your custom rule is triggered when Config delivers the configuration snapshot. For more information, see [ConfigSnapshotDeliveryProperties].\n           \n            }\n       }\n    By default, rules with a periodic trigger are evaluated every 24 hours. To change the frequency, specify a valid value for the [MaximumExecutionFrequency] parameter.\n    \n     "];
  input_parameters: string_with_char_limit1024 option
    [@ocaml.doc
      "A string, in JSON format, that is passed to the Config rule Lambda function.\n"];
  source: source
    [@ocaml.doc
      "Provides the rule owner ([Amazon Web Services] for managed rules, [CUSTOM_POLICY] for Custom Policy rules, and [CUSTOM_LAMBDA] for Custom Lambda rules), the rule identifier, and the notifications that cause the function to evaluate your Amazon Web Services resources.\n"];
  scope: scope option
    [@ocaml.doc
      "Defines which resources can trigger an evaluation for the rule. The scope can include one or more resource types, a combination of one resource type and one resource ID, or a combination of a tag key and value. Specify a scope to constrain the resources that can trigger an evaluation for the rule. If you do not specify a scope, evaluations are triggered when any resource in the recording group changes.\n\n  The scope can be empty. \n  \n   "];
  description: emptiable_string_with_char_limit256 option
    [@ocaml.doc "The description that you provide for the Config rule.\n"];
  config_rule_id: string_with_char_limit64 option
    [@ocaml.doc "The ID of the Config rule.\n"];
  config_rule_arn: string_with_char_limit256 option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the Config rule.\n"];
  config_rule_name: config_rule_name option
    [@ocaml.doc
      "The name that you assign to the Config rule. The name is required if you are adding a new rule.\n"]}
[@@ocaml.doc
  "Config rules evaluate the configuration settings of your Amazon Web Services resources. A rule can run when Config detects a configuration change to an Amazon Web Services resource or at a periodic frequency that you choose (for example, every 24 hours). There are two types of rules: {i Config Managed Rules} and {i Config Custom Rules}.\n\n Config Managed Rules are predefined, customizable rules created by Config. For a list of managed rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html}List of Config Managed Rules}.\n \n  Config Custom Rules are rules that you create from scratch. There are two ways to create Config custom rules: with Lambda functions ({{:https://docs.aws.amazon.com/config/latest/developerguide/gettingstarted-concepts.html#gettingstarted-concepts-function} Lambda Developer Guide}) and with Guard ({{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}), a policy-as-code language. Config custom rules created with Lambda are called {i Config Custom Lambda Rules} and Config custom rules created with Guard are called {i Config Custom Policy Rules}.\n  \n   For more information about developing and using Config rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html}Evaluating Resource with Config Rules} in the {i Config Developer Guide}.\n   \n     You can use the Amazon Web Services CLI and Amazon Web Services SDKs if you want to create a rule that triggers evaluations for your resources when Config delivers the configuration snapshot. For more information, see [ConfigSnapshotDeliveryProperties].\n     \n      "]
type nonrec put_config_rule_request =
  {
  tags: tags_list option [@ocaml.doc "An array of tag object.\n"];
  config_rule: config_rule
    [@ocaml.doc "The rule that you want to add to your account.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec aggregation_authorization =
  {
  creation_time: date option
    [@ocaml.doc
      "The time stamp when the aggregation authorization was created.\n"];
  authorized_aws_region: aws_region option
    [@ocaml.doc "The region authorized to collect aggregated data.\n"];
  authorized_account_id: account_id option
    [@ocaml.doc
      "The 12-digit account ID of the account authorized to aggregate data.\n"];
  aggregation_authorization_arn: string_ option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the aggregation object.\n"]}
[@@ocaml.doc
  "An object that represents the authorizations granted to aggregator accounts and regions.\n"]
type nonrec put_aggregation_authorization_response =
  {
  aggregation_authorization: aggregation_authorization option
    [@ocaml.doc "Returns an AggregationAuthorization object. \n"]}[@@ocaml.doc
                                                                    ""]
type nonrec put_aggregation_authorization_request =
  {
  tags: tags_list option [@ocaml.doc "An array of tag object.\n"];
  authorized_aws_region: aws_region
    [@ocaml.doc "The region authorized to collect aggregated data.\n"];
  authorized_account_id: account_id
    [@ocaml.doc
      "The 12-digit account ID of the account authorized to aggregate data.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  tags: tag_list option [@ocaml.doc "The tags for the resource.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec list_tags_for_resource_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  limit: limit option
    [@ocaml.doc
      "The maximum number of tags returned on each page. The limit maximum is 50. You cannot specify a number greater than 50. If you specify 0, Config uses the default. \n"];
  resource_arn: amazon_resource_name
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. The following resources are supported:\n\n {ul\n       {-   [ConfigurationRecorder] \n           \n            }\n       {-   [ConfigRule] \n           \n            }\n       {-   [OrganizationConfigRule] \n           \n            }\n       {-   [ConformancePack] \n           \n            }\n       {-   [OrganizationConformancePack] \n           \n            }\n       {-   [ConfigurationAggregator] \n           \n            }\n       {-   [AggregationAuthorization] \n           \n            }\n       {-   [StoredQuery] \n           \n            }\n       }\n  "]}
[@@ocaml.doc ""]
type nonrec list_stored_queries_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "If the previous paginated request didn't return all of the remaining results, the response object's [NextToken] parameter value is set to a token. To retrieve the next set of results, call this operation again and assign that token to the request object's [NextToken] parameter. If there are no remaining results, the previous response object's [NextToken] parameter is set to [null]. \n"];
  stored_query_metadata: stored_query_metadata_list option
    [@ocaml.doc "A list of [StoredQueryMetadata] objects.\n"]}[@@ocaml.doc
                                                                ""]
type nonrec list_stored_queries_request =
  {
  max_results: limit option
    [@ocaml.doc
      "The maximum number of results to be returned with a single call.\n"];
  next_token: string_ option
    [@ocaml.doc
      "The nextToken string returned in a previous request that you use to request the next page of results in a paginated response.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_time_range_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "The specified time range is not valid. The earlier time is not chronologically before the later time.\n"]
type nonrec resource_evaluation =
  {
  evaluation_start_timestamp: date option
    [@ocaml.doc "The starting time of an execution.\n"];
  evaluation_mode: evaluation_mode option
    [@ocaml.doc
      "The mode of an evaluation. The valid values are Detective or Proactive.\n"];
  resource_evaluation_id: resource_evaluation_id option
    [@ocaml.doc "The ResourceEvaluationId of a evaluation.\n"]}[@@ocaml.doc
                                                                 "Returns details of a resource evaluation.\n"]
type nonrec resource_evaluations = resource_evaluation list[@@ocaml.doc ""]
type nonrec list_resource_evaluations_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  resource_evaluations: resource_evaluations option
    [@ocaml.doc "Returns a [ResourceEvaluations] object.\n"]}[@@ocaml.doc ""]
type nonrec resource_evaluation_filters =
  {
  evaluation_context_identifier: evaluation_context_identifier option
    [@ocaml.doc
      "Filters evaluations for a given infrastructure deployment. For example: CFN Stack.\n"];
  time_window: time_window option
    [@ocaml.doc "Returns a [TimeWindow] object.\n"];
  evaluation_mode: evaluation_mode option
    [@ocaml.doc
      "Filters all resource evaluations results based on an evaluation mode.\n\n  Currently, [DECTECTIVE] is not supported as a valid value. Ignore other documentation stating otherwise.\n  \n   "]}
[@@ocaml.doc
  "Returns details of a resource evaluation based on the selected filter.\n"]
type nonrec list_resource_evaluations_page_item_limit = int[@@ocaml.doc ""]
type nonrec list_resource_evaluations_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: list_resource_evaluations_page_item_limit option
    [@ocaml.doc
      "The maximum number of evaluations returned on each page. The default is 10. You cannot specify a number greater than 100. If you specify 0, Config uses the default.\n"];
  filters: resource_evaluation_filters option
    [@ocaml.doc "Returns a [ResourceEvaluationFilters] object.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec resource_deletion_time = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc
                                                                    ""]
type nonrec resource_identifier =
  {
  resource_deletion_time: resource_deletion_time option
    [@ocaml.doc "The time that the resource was deleted.\n"];
  resource_name: resource_name option
    [@ocaml.doc "The custom name of the resource (if available).\n"];
  resource_id: resource_id option
    [@ocaml.doc "The ID of the resource (for example, [sg-xxxxxx]).\n"];
  resource_type: resource_type option [@ocaml.doc "The type of resource.\n"]}
[@@ocaml.doc
  "The details that identify a resource that is discovered by Config, including the resource type, ID, and (if available) the custom resource name.\n"]
type nonrec resource_identifier_list = resource_identifier list[@@ocaml.doc
                                                                 ""]
type nonrec list_discovered_resources_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  resource_identifiers: resource_identifier_list option
    [@ocaml.doc
      "The details that identify a resource that is discovered by Config, including the resource type, ID, and (if available) the custom resource name.\n"]}
[@@ocaml.doc "\n"]
type nonrec resource_id_list = resource_id list[@@ocaml.doc ""]
type nonrec list_discovered_resources_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  include_deleted_resources: boolean_ option
    [@ocaml.doc
      "Specifies whether Config includes deleted resources in the results. By default, deleted resources are not included.\n"];
  limit: limit option
    [@ocaml.doc
      "The maximum number of resource identifiers returned on each page. The default is 100. You cannot specify a number greater than 100. If you specify 0, Config uses the default.\n"];
  resource_name: resource_name option
    [@ocaml.doc
      "The custom name of only those resources that you want Config to list in the response. If you do not specify this parameter, Config lists all resources of the specified type that it has discovered.\n"];
  resource_ids: resource_id_list option
    [@ocaml.doc
      "The IDs of only those resources that you want Config to list in the response. If you do not specify this parameter, Config lists all resources of the specified type that it has discovered. You can list a minimum of 1 resourceID and a maximum of 20 resourceIds.\n"];
  resource_type: resource_type
    [@ocaml.doc
      "The type of resources that you want Config to list in the response.\n"]}
[@@ocaml.doc "\n"]
type nonrec compliance_score = string[@@ocaml.doc ""]
type nonrec last_updated_time = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc
                                                                 ""]
type nonrec conformance_pack_compliance_score =
  {
  last_updated_time: last_updated_time option
    [@ocaml.doc
      "The time that the conformance pack compliance score was last updated.\n"];
  conformance_pack_name: conformance_pack_name option
    [@ocaml.doc "The name of the conformance pack.\n"];
  score: compliance_score option
    [@ocaml.doc
      "Compliance score for the conformance pack. Conformance packs with no evaluation results will have a compliance score of [INSUFFICIENT_DATA].\n"]}
[@@ocaml.doc
  "A compliance score is the percentage of the number of compliant rule-resource combinations in a conformance pack compared to the number of total possible rule-resource combinations in the conformance pack. This metric provides you with a high-level view of the compliance state of your conformance packs. You can use it to identify, investigate, and understand the level of compliance in your conformance packs.\n"]
type nonrec conformance_pack_compliance_scores =
  conformance_pack_compliance_score list[@@ocaml.doc ""]
type nonrec list_conformance_pack_compliance_scores_response =
  {
  conformance_pack_compliance_scores: conformance_pack_compliance_scores
    [@ocaml.doc "A list of [ConformancePackComplianceScore] objects.\n"];
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string that you can use to get the next page of results in a paginated response.\n"]}
[@@ocaml.doc ""]
type nonrec conformance_pack_name_filter = conformance_pack_name list
[@@ocaml.doc ""]
type nonrec conformance_pack_compliance_scores_filters =
  {
  conformance_pack_names: conformance_pack_name_filter
    [@ocaml.doc
      "The names of the conformance packs whose compliance scores you want to include in the conformance pack compliance score result set. You can include up to 25 conformance packs in the [ConformancePackNames] array of strings, each with a character limit of 256 characters for the conformance pack name.\n"]}
[@@ocaml.doc
  "A list of filters to apply to the conformance pack compliance score result set. \n"]
type nonrec sort_order =
  | DESCENDING [@ocaml.doc ""]
  | ASCENDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sort_by =
  | SCORE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec page_size_limit = int[@@ocaml.doc ""]
type nonrec list_conformance_pack_compliance_scores_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string in a prior request that you can use to get the paginated response for the next set of conformance pack compliance scores.\n"];
  limit: page_size_limit option
    [@ocaml.doc
      "The maximum number of conformance pack compliance scores returned on each page.\n"];
  sort_by: sort_by option
    [@ocaml.doc
      "Sorts your conformance pack compliance scores in either ascending or descending order, depending on [SortOrder].\n\n By default, conformance pack compliance scores are sorted in alphabetical order by name of the conformance pack. Enter [SCORE], to sort conformance pack compliance scores by the numerical value of the compliance score.\n "];
  sort_order: sort_order option
    [@ocaml.doc
      "Determines the order in which conformance pack compliance scores are sorted. Either in ascending or descending order.\n\n By default, conformance pack compliance scores are sorted in alphabetical order by name of the conformance pack. Conformance pack compliance scores are sorted in reverse alphabetical order if you enter [DESCENDING].\n \n  You can sort conformance pack compliance scores by the numerical value of the compliance score by entering [SCORE] in the [SortBy] action. When compliance scores are sorted by [SCORE], conformance packs with a compliance score of [INSUFFICIENT_DATA] will be last when sorting by ascending order and first when sorting by descending order.\n  "];
  filters: conformance_pack_compliance_scores_filters option
    [@ocaml.doc
      "Filters the results based on the [ConformancePackComplianceScoresFilters].\n"]}
[@@ocaml.doc ""]
type nonrec configuration_recorder_summary =
  {
  recording_scope: recording_scope
    [@ocaml.doc
      "Indicates whether the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ConfigurationItem.html}ConfigurationItems} in scope for the configuration recorder are recorded for free ([INTERNAL]) or if you are charged a service fee for recording ([PAID]).\n"];
  service_principal: service_principal option
    [@ocaml.doc
      "For service-linked configuration recorders, indicates which Amazon Web Services service the configuration recorder is linked to.\n"];
  name: recorder_name
    [@ocaml.doc "The name of the configuration recorder.\n"];
  arn: amazon_resource_name
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the configuration recorder.\n"]}
[@@ocaml.doc
  "A summary of a configuration recorder, including the [arn], [name], [servicePrincipal], and [recordingScope].\n"]
type nonrec configuration_recorder_summaries =
  configuration_recorder_summary list[@@ocaml.doc ""]
type nonrec list_configuration_recorders_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [NextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  configuration_recorder_summaries: configuration_recorder_summaries
    [@ocaml.doc
      "A list of [ConfigurationRecorderSummary] objects that includes.\n"]}
[@@ocaml.doc ""]
type nonrec configuration_recorder_filter_name =
  | RecordingScope [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec configuration_recorder_filter_value = string[@@ocaml.doc ""]
type nonrec configuration_recorder_filter_values =
  configuration_recorder_filter_value list[@@ocaml.doc ""]
type nonrec configuration_recorder_filter =
  {
  filter_value: configuration_recorder_filter_values option
    [@ocaml.doc
      "The value of the filter. For [recordingScope], valid values include: [INTERNAL] and [PAID].\n\n  [INTERNAL] indicates that the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ConfigurationItem.html}ConfigurationItems} in scope for the configuration recorder are recorded for free.\n \n   [PAID] indicates that the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ConfigurationItem.html}ConfigurationItems} in scope for the configuration recorder impact the costs to your bill.\n  "];
  filter_name: configuration_recorder_filter_name option
    [@ocaml.doc
      "The name of the type of filter. Currently, only [recordingScope] is supported.\n"]}
[@@ocaml.doc "Filters configuration recorders by recording scope.\n"]
type nonrec configuration_recorder_filter_list =
  configuration_recorder_filter list[@@ocaml.doc ""]
type nonrec max_results = int[@@ocaml.doc ""]
type nonrec list_configuration_recorders_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [NextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of results to include in the response.\n"];
  filters: configuration_recorder_filter_list option
    [@ocaml.doc
      "Filters the results based on a list of [ConfigurationRecorderFilter] objects that you specify.\n"]}
[@@ocaml.doc ""]
type nonrec discovered_resource_identifier_list =
  aggregate_resource_identifier list[@@ocaml.doc ""]
type nonrec list_aggregate_discovered_resources_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  resource_identifiers: discovered_resource_identifier_list option
    [@ocaml.doc "Returns a list of [ResourceIdentifiers] objects.\n"]}
[@@ocaml.doc ""]
type nonrec resource_filters =
  {
  region: aws_region option [@ocaml.doc "The source region.\n"];
  resource_name: resource_name option
    [@ocaml.doc "The name of the resource.\n"];
  resource_id: resource_id option [@ocaml.doc "The ID of the resource.\n"];
  account_id: account_id option
    [@ocaml.doc "The 12-digit source account ID.\n"]}[@@ocaml.doc
                                                       "Filters the results by resource account ID, region, resource ID, and resource name.\n"]
type nonrec list_aggregate_discovered_resources_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: limit option
    [@ocaml.doc
      "The maximum number of resource identifiers returned on each page. You cannot specify a number greater than 100. If you specify 0, Config uses the default.\n"];
  filters: resource_filters option
    [@ocaml.doc
      "Filters the results based on the [ResourceFilters] object.\n"];
  resource_type: resource_type
    [@ocaml.doc
      "The type of resources that you want Config to list in the response.\n"];
  configuration_aggregator_name: configuration_aggregator_name
    [@ocaml.doc "The name of the configuration aggregator. \n"]}[@@ocaml.doc
                                                                  ""]
type nonrec get_stored_query_response =
  {
  stored_query: stored_query option
    [@ocaml.doc "Returns a [StoredQuery] object.\n"]}[@@ocaml.doc ""]
type nonrec get_stored_query_request =
  {
  query_name: query_name [@ocaml.doc "The name of the query.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec resource_evaluation_status =
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec evaluation_status =
  {
  failure_reason: string_with_char_limit1024 option
    [@ocaml.doc "An explanation for failed execution status.\n"];
  status: resource_evaluation_status
    [@ocaml.doc
      "The status of an execution. The valid values are In_Progress, Succeeded or Failed. \n"]}
[@@ocaml.doc "Returns status details of an evaluation.\n"]
type nonrec get_resource_evaluation_summary_response =
  {
  resource_details: resource_details option
    [@ocaml.doc "Returns a [ResourceDetails] object.\n"];
  evaluation_context: evaluation_context option
    [@ocaml.doc "Returns an [EvaluationContext] object.\n"];
  compliance: compliance_type option
    [@ocaml.doc
      "The compliance status of the resource evaluation summary.\n"];
  evaluation_start_timestamp: date option
    [@ocaml.doc
      "The start timestamp when Config rule starts evaluating compliance for the provided resource details.\n"];
  evaluation_status: evaluation_status option
    [@ocaml.doc "Returns an [EvaluationStatus] object.\n"];
  evaluation_mode: evaluation_mode option
    [@ocaml.doc
      "Lists results of the mode that you requested to retrieve the resource evaluation summary. The valid values are Detective or Proactive.\n"];
  resource_evaluation_id: resource_evaluation_id option
    [@ocaml.doc
      "The unique [ResourceEvaluationId] of Amazon Web Services resource execution for which you want to retrieve the evaluation summary.\n"]}
[@@ocaml.doc ""]
type nonrec get_resource_evaluation_summary_request =
  {
  resource_evaluation_id: resource_evaluation_id
    [@ocaml.doc
      "The unique [ResourceEvaluationId] of Amazon Web Services resource execution for which you want to retrieve the evaluation summary.\n"]}
[@@ocaml.doc ""]
type nonrec resource_not_discovered_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have specified a resource that is either unknown or has not been discovered.\n"]
type nonrec configuration_item_capture_time = Smaws_Lib.CoreTypes.Timestamp.t
[@@ocaml.doc ""]
type nonrec configuration_item_status =
  | ResourceDeletedNotRecorded [@ocaml.doc ""]
  | ResourceDeleted [@ocaml.doc ""]
  | ResourceNotRecorded [@ocaml.doc ""]
  | ResourceDiscovered [@ocaml.doc ""]
  | OK [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec configuration_state_id = string[@@ocaml.doc ""]
type nonrec configuration_item_md5_hash = string[@@ocaml.doc ""]
type nonrec ar_n = string[@@ocaml.doc ""]
type nonrec availability_zone = string[@@ocaml.doc ""]
type nonrec resource_creation_time = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc
                                                                    ""]
type nonrec related_event = string[@@ocaml.doc ""]
type nonrec related_event_list = related_event list[@@ocaml.doc ""]
type nonrec relationship_name = string[@@ocaml.doc ""]
type nonrec relationship =
  {
  relationship_name: relationship_name option
    [@ocaml.doc "The type of relationship with the related resource.\n"];
  resource_name: resource_name option
    [@ocaml.doc "The custom name of the related resource, if available.\n"];
  resource_id: resource_id option
    [@ocaml.doc
      "The ID of the related resource (for example, [sg-xxxxxx]).\n"];
  resource_type: resource_type option
    [@ocaml.doc "The resource type of the related resource.\n"]}[@@ocaml.doc
                                                                  "The relationship of the related resource to the main resource.\n"]
type nonrec relationship_list = relationship list[@@ocaml.doc ""]
type nonrec configuration_item_delivery_time =
  Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec configuration_item =
  {
  configuration_item_delivery_time: configuration_item_delivery_time option
    [@ocaml.doc
      "The time when configuration changes for the resource were delivered.\n\n  This field is optional and is not guaranteed to be present in a configuration item (CI). If you are using daily recording, this field will be populated. However, if you are using continuous recording, this field will be omitted since the delivery time is instantaneous as the CI is available right away. For more information on daily recording and continuous recording, see {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html#select-resources-recording-frequency}Recording Frequency} in the {i Config Developer Guide}.\n  \n   "];
  recording_frequency: recording_frequency option
    [@ocaml.doc
      "The recording frequency that Config uses to record configuration changes for the resource.\n"];
  supplementary_configuration: supplementary_configuration option
    [@ocaml.doc
      "Configuration attributes that Config returns for certain resource types to supplement the information returned for the [configuration] parameter.\n"];
  configuration: configuration option
    [@ocaml.doc "The description of the resource configuration.\n"];
  relationships: relationship_list option
    [@ocaml.doc "A list of related Amazon Web Services resources.\n"];
  related_events: related_event_list option
    [@ocaml.doc
      "A list of CloudTrail event IDs.\n\n A populated field indicates that the current configuration was initiated by the events recorded in the CloudTrail log. For more information about CloudTrail, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html}What Is CloudTrail}.\n \n  An empty field indicates that the current configuration was not initiated by any event. As of Version 1.3, the relatedEvents field is empty. You can access the {{:https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_LookupEvents.html}LookupEvents API} in the {i CloudTrail API Reference} to retrieve the events for the resource.\n  "];
  tags: tags option
    [@ocaml.doc
      "A mapping of key value tags associated with the resource.\n"];
  resource_creation_time: resource_creation_time option
    [@ocaml.doc "The time stamp when the resource was created.\n"];
  availability_zone: availability_zone option
    [@ocaml.doc "The Availability Zone associated with the resource.\n"];
  aws_region: aws_region option
    [@ocaml.doc "The region where the resource resides.\n"];
  resource_name: resource_name option
    [@ocaml.doc "The custom name of the resource, if available.\n"];
  resource_id: resource_id option
    [@ocaml.doc "The ID of the resource (for example, [sg-xxxxxx]).\n"];
  resource_type: resource_type option
    [@ocaml.doc "The type of Amazon Web Services resource.\n"];
  arn: ar_n option
    [@ocaml.doc "Amazon Resource Name (ARN) associated with the resource.\n"];
  configuration_item_md5_hash: configuration_item_md5_hash option
    [@ocaml.doc
      "Unique MD5 hash that represents the configuration item's state.\n\n You can use MD5 hash to compare the states of two or more configuration items that are associated with the same resource.\n "];
  configuration_state_id: configuration_state_id option
    [@ocaml.doc
      "An identifier that indicates the ordering of the configuration items of a resource.\n"];
  configuration_item_status: configuration_item_status option
    [@ocaml.doc
      "The configuration item status. Valid values include:\n\n {ul\n       {-  OK \226\128\147 The resource configuration has been updated\n           \n            }\n       {-  ResourceDiscovered \226\128\147 The resource was newly discovered\n           \n            }\n       {-  ResourceNotRecorded \226\128\147 The resource was discovered but its configuration was not recorded since the recorder doesn't record resources of this type\n           \n            }\n       {-  ResourceDeleted \226\128\147 The resource was deleted\n           \n            }\n       {-  ResourceDeletedNotRecorded \226\128\147 The resource was deleted but its configuration was not recorded since the recorder doesn't record resources of this type\n           \n            }\n       }\n  "];
  configuration_item_capture_time: configuration_item_capture_time option
    [@ocaml.doc
      "The time when the recording of configuration changes was initiated for the resource.\n"];
  account_id: account_id option
    [@ocaml.doc
      "The 12-digit Amazon Web Services account ID associated with the resource.\n"];
  version: version option
    [@ocaml.doc "The version number of the resource configuration.\n"]}
[@@ocaml.doc
  "A list that contains detailed configurations of a specified resource.\n"]
type nonrec configuration_item_list = configuration_item list[@@ocaml.doc ""]
type nonrec get_resource_config_history_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  configuration_items: configuration_item_list option
    [@ocaml.doc
      "A list that contains the configuration history of one or more resources.\n"]}
[@@ocaml.doc "The output for the [GetResourceConfigHistory] action.\n"]
type nonrec later_time = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec earlier_time = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec chronological_order =
  | Forward [@ocaml.doc ""]
  | Reverse [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_resource_config_history_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: limit option
    [@ocaml.doc
      "The maximum number of configuration items returned on each page. The default is 10. You cannot specify a number greater than 100. If you specify 0, Config uses the default.\n"];
  chronological_order: chronological_order option
    [@ocaml.doc
      "The chronological order for configuration items listed. By default, the results are listed in reverse chronological order.\n"];
  earlier_time: earlier_time option
    [@ocaml.doc
      "The chronologically earliest time in the time range for which the history requested. If not specified, the action returns paginated results that contain configuration items that start when the first configuration item was recorded.\n"];
  later_time: later_time option
    [@ocaml.doc
      "The chronologically latest time in the time range for which the history requested. If not specified, current time is taken.\n"];
  resource_id: resource_id
    [@ocaml.doc "The ID of the resource (for example., [sg-xxxxxx]).\n"];
  resource_type: resource_type [@ocaml.doc "The resource type.\n"]}[@@ocaml.doc
                                                                    "The input for the [GetResourceConfigHistory] action.\n"]
type nonrec no_such_organization_config_rule_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "The Config rule in the request is not valid. Verify that the rule is an organization Config Process Check rule, that the rule name is correct, and that valid Amazon Resouce Names (ARNs) are used before trying again.\n"]
type nonrec get_organization_custom_rule_policy_response =
  {
  policy_text: policy_text option
    [@ocaml.doc
      "The policy definition containing the logic for your organization Config Custom Policy rule.\n"]}
[@@ocaml.doc ""]
type nonrec get_organization_custom_rule_policy_request =
  {
  organization_config_rule_name: organization_config_rule_name
    [@ocaml.doc
      "The name of your organization Config Custom Policy rule. \n"]}
[@@ocaml.doc ""]
type nonrec no_such_organization_conformance_pack_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "Config organization conformance pack that you passed in the filter does not exist.\n\n For DeleteOrganizationConformancePack, you tried to delete an organization conformance pack that does not exist.\n "]
type nonrec organization_resource_detailed_status =
  | UPDATE_FAILED [@ocaml.doc ""]
  | UPDATE_IN_PROGRESS [@ocaml.doc ""]
  | UPDATE_SUCCESSFUL [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
  | DELETE_SUCCESSFUL [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_SUCCESSFUL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec organization_conformance_pack_detailed_status =
  {
  last_update_time: date option
    [@ocaml.doc "The timestamp of the last status update.\n"];
  error_message: string_ option
    [@ocaml.doc
      "An error message indicating that conformance pack account creation or deletion has failed due to an error in the member account. \n"];
  error_code: string_ option
    [@ocaml.doc
      "An error code that is returned when conformance pack creation or deletion failed in the member account. \n"];
  status: organization_resource_detailed_status
    [@ocaml.doc
      "Indicates deployment status for conformance pack in a member account. When management account calls [PutOrganizationConformancePack] action for the first time, conformance pack status is created in the member account. When management account calls [PutOrganizationConformancePack] action for the second time, conformance pack status is updated in the member account. Conformance pack status is deleted when the management account deletes [OrganizationConformancePack] and disables service access for [config-multiaccountsetup.amazonaws.com]. \n\n  Config sets the state of the conformance pack to:\n \n  {ul\n        {-   [CREATE_SUCCESSFUL] when conformance pack has been created in the member account. \n            \n             }\n        {-   [CREATE_IN_PROGRESS] when conformance pack is being created in the member account.\n            \n             }\n        {-   [CREATE_FAILED] when conformance pack creation has failed in the member account.\n            \n             }\n        {-   [DELETE_FAILED] when conformance pack deletion has failed in the member account.\n            \n             }\n        {-   [DELETE_IN_PROGRESS] when conformance pack is being deleted in the member account.\n            \n             }\n        {-   [DELETE_SUCCESSFUL] when conformance pack has been deleted in the member account. \n            \n             }\n        {-   [UPDATE_SUCCESSFUL] when conformance pack has been updated in the member account.\n            \n             }\n        {-   [UPDATE_IN_PROGRESS] when conformance pack is being updated in the member account.\n            \n             }\n        {-   [UPDATE_FAILED] when conformance pack deletion has failed in the member account.\n            \n             }\n        }\n  "];
  conformance_pack_name: string_with_char_limit256
    [@ocaml.doc
      "The name of conformance pack deployed in the member account.\n"];
  account_id: account_id
    [@ocaml.doc "The 12-digit account ID of a member account.\n"]}[@@ocaml.doc
                                                                    "Organization conformance pack creation or deletion status in each member account. This includes the name of the conformance pack, the status, error code and error message when the conformance pack creation or deletion failed. \n"]
type nonrec organization_conformance_pack_detailed_statuses =
  organization_conformance_pack_detailed_status list[@@ocaml.doc ""]
type nonrec get_organization_conformance_pack_detailed_status_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The nextToken string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  organization_conformance_pack_detailed_statuses:
    organization_conformance_pack_detailed_statuses option
    [@ocaml.doc
      "A list of [OrganizationConformancePackDetailedStatus] objects. \n"]}
[@@ocaml.doc ""]
type nonrec organization_resource_detailed_status_filters =
  {
  status: organization_resource_detailed_status option
    [@ocaml.doc
      "Indicates deployment status for conformance pack in a member account. When management account calls [PutOrganizationConformancePack] action for the first time, conformance pack status is created in the member account. When management account calls [PutOrganizationConformancePack] action for the second time, conformance pack status is updated in the member account. Conformance pack status is deleted when the management account deletes [OrganizationConformancePack] and disables service access for [config-multiaccountsetup.amazonaws.com]. \n\n  Config sets the state of the conformance pack to:\n \n  {ul\n        {-   [CREATE_SUCCESSFUL] when conformance pack has been created in the member account. \n            \n             }\n        {-   [CREATE_IN_PROGRESS] when conformance pack is being created in the member account.\n            \n             }\n        {-   [CREATE_FAILED] when conformance pack creation has failed in the member account.\n            \n             }\n        {-   [DELETE_FAILED] when conformance pack deletion has failed in the member account.\n            \n             }\n        {-   [DELETE_IN_PROGRESS] when conformance pack is being deleted in the member account.\n            \n             }\n        {-   [DELETE_SUCCESSFUL] when conformance pack has been deleted in the member account. \n            \n             }\n        {-   [UPDATE_SUCCESSFUL] when conformance pack has been updated in the member account.\n            \n             }\n        {-   [UPDATE_IN_PROGRESS] when conformance pack is being updated in the member account.\n            \n             }\n        {-   [UPDATE_FAILED] when conformance pack deletion has failed in the member account.\n            \n             }\n        }\n  "];
  account_id: account_id option
    [@ocaml.doc
      "The 12-digit account ID of the member account within an organization.\n"]}
[@@ocaml.doc
  "Status filter object to filter results based on specific member account ID or status type for an organization conformance pack.\n"]
type nonrec cosmos_page_limit = int[@@ocaml.doc ""]
type nonrec get_organization_conformance_pack_detailed_status_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "The nextToken string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  limit: cosmos_page_limit option
    [@ocaml.doc
      "The maximum number of [OrganizationConformancePackDetailedStatuses] returned on each page. If you do not specify a number, Config uses the default. The default is 100. \n"];
  filters: organization_resource_detailed_status_filters option
    [@ocaml.doc "An [OrganizationResourceDetailedStatusFilters] object.\n"];
  organization_conformance_pack_name: organization_conformance_pack_name
    [@ocaml.doc
      "The name of organization conformance pack for which you want status details for member accounts.\n"]}
[@@ocaml.doc ""]
type nonrec member_account_status =
  {
  last_update_time: date option
    [@ocaml.doc "The timestamp of the last status update.\n"];
  error_message: string_ option
    [@ocaml.doc
      "An error message indicating that Config rule account creation or deletion has failed due to an error in the member account.\n"];
  error_code: string_ option
    [@ocaml.doc
      "An error code that is returned when Config rule creation or deletion failed in the member account.\n"];
  member_account_rule_status: member_account_rule_status
    [@ocaml.doc
      "Indicates deployment status for Config rule in the member account. When management account calls [PutOrganizationConfigRule] action for the first time, Config rule status is created in the member account. When management account calls [PutOrganizationConfigRule] action for the second time, Config rule status is updated in the member account. Config rule status is deleted when the management account deletes [OrganizationConfigRule] and disables service access for [config-multiaccountsetup.amazonaws.com]. \n\n  Config sets the state of the rule to:\n \n  {ul\n        {-   [CREATE_SUCCESSFUL] when Config rule has been created in the member account. \n            \n             }\n        {-   [CREATE_IN_PROGRESS] when Config rule is being created in the member account.\n            \n             }\n        {-   [CREATE_FAILED] when Config rule creation has failed in the member account.\n            \n             }\n        {-   [DELETE_FAILED] when Config rule deletion has failed in the member account.\n            \n             }\n        {-   [DELETE_IN_PROGRESS] when Config rule is being deleted in the member account.\n            \n             }\n        {-   [DELETE_SUCCESSFUL] when Config rule has been deleted in the member account. \n            \n             }\n        {-   [UPDATE_SUCCESSFUL] when Config rule has been updated in the member account.\n            \n             }\n        {-   [UPDATE_IN_PROGRESS] when Config rule is being updated in the member account.\n            \n             }\n        {-   [UPDATE_FAILED] when Config rule deletion has failed in the member account.\n            \n             }\n        }\n  "];
  config_rule_name: string_with_char_limit64
    [@ocaml.doc "The name of Config rule deployed in the member account.\n"];
  account_id: account_id
    [@ocaml.doc "The 12-digit account ID of a member account.\n"]}[@@ocaml.doc
                                                                    "Organization Config rule creation or deletion status in each member account. This includes the name of the rule, the status, error code and error message when the rule creation or deletion failed.\n"]
type nonrec organization_config_rule_detailed_status =
  member_account_status list[@@ocaml.doc ""]
type nonrec get_organization_config_rule_detailed_status_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  organization_config_rule_detailed_status:
    organization_config_rule_detailed_status option
    [@ocaml.doc "A list of [MemberAccountStatus] objects.\n"]}[@@ocaml.doc
                                                                ""]
type nonrec get_organization_config_rule_detailed_status_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  limit: cosmos_page_limit option
    [@ocaml.doc
      "The maximum number of [OrganizationConfigRuleDetailedStatus] returned on each page. If you do not specify a number, Config uses the default. The default is 100.\n"];
  filters: status_detail_filters option
    [@ocaml.doc "A [StatusDetailFilters] object.\n"];
  organization_config_rule_name: organization_config_rule_name
    [@ocaml.doc
      "The name of your organization Config rule for which you want status details for member accounts.\n"]}
[@@ocaml.doc ""]
type nonrec long = int[@@ocaml.doc ""]
type nonrec resource_count =
  {
  count: long option [@ocaml.doc "The number of resources.\n"];
  resource_type: resource_type option
    [@ocaml.doc
      "The resource type (for example, [\"AWS::EC2::Instance\"]).\n"]}
[@@ocaml.doc
  "An object that contains the resource type and the number of resources.\n"]
type nonrec resource_counts = resource_count list[@@ocaml.doc ""]
type nonrec get_discovered_resource_counts_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  resource_counts: resource_counts option
    [@ocaml.doc
      "The list of [ResourceCount] objects. Each object is listed in descending order by the number of resources.\n"];
  total_discovered_resources: long option
    [@ocaml.doc
      "The total number of resources that Config is recording in the region for your account. If you specify resource types in the request, Config returns only the total number of resources for those resource types.\n\n  {b Example} \n \n  {ol\n        {-  Config is recording three resource types in the US East (Ohio) Region for your account: 25 EC2 instances, 20 IAM users, and 15 S3 buckets, for a total of 60 resources.\n            \n             }\n        {-  You make a call to the [GetDiscoveredResourceCounts] action and specify the resource type, [\"AWS::EC2::Instances\"], in the request.\n            \n             }\n        {-  Config returns 25 for [totalDiscoveredResources].\n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec resource_types = string_with_char_limit256 list[@@ocaml.doc ""]
type nonrec get_discovered_resource_counts_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: limit option
    [@ocaml.doc
      "The maximum number of [ResourceCount] objects returned on each page. The default is 100. You cannot specify a number greater than 100. If you specify 0, Config uses the default.\n"];
  resource_types: resource_types option
    [@ocaml.doc
      "The comma-separated list that specifies the resource types that you want Config to return (for example, [\"AWS::EC2::Instance\"], [\"AWS::IAM::User\"]).\n\n If a value for [resourceTypes] is not specified, Config returns all resource types that Config is recording in the region for your account.\n \n   If the configuration recorder is turned off, Config returns an empty list of [ResourceCount] objects. If the configuration recorder is not recording a specific resource type (for example, S3 buckets), that resource type is not returned in the list of [ResourceCount] objects.\n   \n    "]}
[@@ocaml.doc ""]
type nonrec get_custom_rule_policy_response =
  {
  policy_text: policy_text option
    [@ocaml.doc
      "The policy definition containing the logic for your Config Custom Policy rule.\n"]}
[@@ocaml.doc ""]
type nonrec get_custom_rule_policy_request =
  {
  config_rule_name: config_rule_name option
    [@ocaml.doc "The name of your Config Custom Policy rule.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec no_such_conformance_pack_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You specified one or more conformance packs that do not exist.\n"]
type nonrec conformance_pack_compliance_type =
  | INSUFFICIENT_DATA [@ocaml.doc ""]
  | NON_COMPLIANT [@ocaml.doc ""]
  | COMPLIANT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec conformance_pack_compliance_summary =
  {
  conformance_pack_compliance_status: conformance_pack_compliance_type
    [@ocaml.doc "The status of the conformance pack.\n"];
  conformance_pack_name: conformance_pack_name
    [@ocaml.doc "The name of the conformance pack name.\n"]}[@@ocaml.doc
                                                              "Summary includes the name and status of the conformance pack.\n"]
type nonrec conformance_pack_compliance_summary_list =
  conformance_pack_compliance_summary list[@@ocaml.doc ""]
type nonrec get_conformance_pack_compliance_summary_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The nextToken string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  conformance_pack_compliance_summary_list:
    conformance_pack_compliance_summary_list option
    [@ocaml.doc "A list of [ConformancePackComplianceSummary] objects. \n"]}
[@@ocaml.doc ""]
type nonrec conformance_pack_names_to_summarize_list =
  conformance_pack_name list[@@ocaml.doc ""]
type nonrec get_conformance_pack_compliance_summary_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The nextToken string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: page_size_limit option
    [@ocaml.doc
      "The maximum number of conformance packs returned on each page.\n"];
  conformance_pack_names: conformance_pack_names_to_summarize_list
    [@ocaml.doc "Names of conformance packs.\n"]}[@@ocaml.doc ""]
type nonrec no_such_config_rule_in_conformance_pack_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "Config rule that you passed in the filter does not exist.\n"]
type nonrec evaluation_result_qualifier =
  {
  evaluation_mode: evaluation_mode option
    [@ocaml.doc
      "The mode of an evaluation. The valid values are Detective or Proactive.\n"];
  resource_id: base_resource_id option
    [@ocaml.doc "The ID of the evaluated Amazon Web Services resource.\n"];
  resource_type: string_with_char_limit256 option
    [@ocaml.doc
      "The type of Amazon Web Services resource that was evaluated.\n"];
  config_rule_name: config_rule_name option
    [@ocaml.doc
      "The name of the Config rule that was used in the evaluation.\n"]}
[@@ocaml.doc
  "Identifies an Config rule that evaluated an Amazon Web Services resource, and provides the type and ID of the resource that the rule evaluated.\n"]
type nonrec evaluation_result_identifier =
  {
  resource_evaluation_id: resource_evaluation_id option
    [@ocaml.doc "A Unique ID for an evaluation result.\n"];
  ordering_timestamp: date option
    [@ocaml.doc
      "The time of the event that triggered the evaluation of your Amazon Web Services resources. The time can indicate when Config delivered a configuration item change notification, or it can indicate when Config delivered the configuration snapshot, depending on which event triggered the evaluation.\n"];
  evaluation_result_qualifier: evaluation_result_qualifier option
    [@ocaml.doc
      "Identifies an Config rule used to evaluate an Amazon Web Services resource, and provides the type and ID of the evaluated resource.\n"]}
[@@ocaml.doc "Uniquely identifies an evaluation result.\n"]
type nonrec annotation = string[@@ocaml.doc ""]
type nonrec conformance_pack_evaluation_result =
  {
  annotation: annotation option
    [@ocaml.doc
      "Supplementary information about how the evaluation determined the compliance. \n"];
  result_recorded_time: date
    [@ocaml.doc "The time when Config recorded the evaluation result. \n"];
  config_rule_invoked_time: date
    [@ocaml.doc
      "The time when Config rule evaluated Amazon Web Services resource.\n"];
  evaluation_result_identifier: evaluation_result_identifier [@ocaml.doc ""];
  compliance_type: conformance_pack_compliance_type
    [@ocaml.doc
      "The compliance type. The allowed values are [COMPLIANT] and [NON_COMPLIANT]. [INSUFFICIENT_DATA] is not supported.\n"]}
[@@ocaml.doc
  "The details of a conformance pack evaluation. Provides Config rule and Amazon Web Services resource type that was evaluated, the compliance of the conformance pack, related time stamps, and supplementary information. \n"]
type nonrec conformance_pack_rule_evaluation_results_list =
  conformance_pack_evaluation_result list[@@ocaml.doc ""]
type nonrec get_conformance_pack_compliance_details_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  conformance_pack_rule_evaluation_results:
    conformance_pack_rule_evaluation_results_list option
    [@ocaml.doc
      "Returns a list of [ConformancePackEvaluationResult] objects.\n"];
  conformance_pack_name: conformance_pack_name
    [@ocaml.doc "Name of the conformance pack.\n"]}[@@ocaml.doc ""]
type nonrec conformance_pack_config_rule_names =
  string_with_char_limit64 list[@@ocaml.doc ""]
type nonrec conformance_pack_compliance_resource_ids =
  string_with_char_limit256 list[@@ocaml.doc ""]
type nonrec conformance_pack_evaluation_filters =
  {
  resource_ids: conformance_pack_compliance_resource_ids option
    [@ocaml.doc
      "Filters the results by resource IDs.\n\n  This is valid only when you provide resource type. If there is no resource type, you will see an error.\n  \n   "];
  resource_type: string_with_char_limit256 option
    [@ocaml.doc
      "Filters the results by the resource type (for example, [\"AWS::EC2::Instance\"]). \n"];
  compliance_type: conformance_pack_compliance_type option
    [@ocaml.doc
      "Filters the results by compliance.\n\n The allowed values are [COMPLIANT] and [NON_COMPLIANT]. [INSUFFICIENT_DATA] is not supported.\n "];
  config_rule_names: conformance_pack_config_rule_names option
    [@ocaml.doc "Filters the results by Config rule names.\n"]}[@@ocaml.doc
                                                                 "Filters a conformance pack by Config rule names, compliance types, Amazon Web Services resource types, and resource IDs.\n"]
type nonrec get_conformance_pack_compliance_details_limit = int[@@ocaml.doc
                                                                 ""]
type nonrec get_conformance_pack_compliance_details_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  limit: get_conformance_pack_compliance_details_limit option
    [@ocaml.doc
      "The maximum number of evaluation results returned on each page. If you do no specify a number, Config uses the default. The default is 100.\n"];
  filters: conformance_pack_evaluation_filters option
    [@ocaml.doc "A [ConformancePackEvaluationFilters] object.\n"];
  conformance_pack_name: conformance_pack_name
    [@ocaml.doc "Name of the conformance pack.\n"]}[@@ocaml.doc ""]
type nonrec integer = int[@@ocaml.doc ""]
type nonrec compliance_contributor_count =
  {
  cap_exceeded: boolean_ option
    [@ocaml.doc "Indicates whether the maximum count is reached.\n"];
  capped_count: integer option
    [@ocaml.doc
      "The number of Amazon Web Services resources or Config rules responsible for the current compliance of the item.\n"]}
[@@ocaml.doc
  "The number of Amazon Web Services resources or Config rules responsible for the current compliance of the item, up to a maximum number.\n"]
type nonrec compliance_summary =
  {
  compliance_summary_timestamp: date option
    [@ocaml.doc "The time that Config created the compliance summary.\n"];
  non_compliant_resource_count: compliance_contributor_count option
    [@ocaml.doc
      "The number of Config rules or Amazon Web Services resources that are noncompliant, up to a maximum of 25 for rules and 100 for resources.\n"];
  compliant_resource_count: compliance_contributor_count option
    [@ocaml.doc
      "The number of Config rules or Amazon Web Services resources that are compliant, up to a maximum of 25 for rules and 100 for resources.\n"]}
[@@ocaml.doc
  "The number of Config rules or Amazon Web Services resources that are compliant and noncompliant.\n"]
type nonrec compliance_summary_by_resource_type =
  {
  compliance_summary: compliance_summary option
    [@ocaml.doc
      "The number of Amazon Web Services resources that are compliant or noncompliant, up to a maximum of 100 for each.\n"];
  resource_type: string_with_char_limit256 option
    [@ocaml.doc "The type of Amazon Web Services resource.\n"]}[@@ocaml.doc
                                                                 "The number of Amazon Web Services resources of a specific type that are compliant or noncompliant, up to a maximum of 100 for each.\n"]
type nonrec compliance_summaries_by_resource_type =
  compliance_summary_by_resource_type list[@@ocaml.doc ""]
type nonrec get_compliance_summary_by_resource_type_response =
  {
  compliance_summaries_by_resource_type:
    compliance_summaries_by_resource_type option
    [@ocaml.doc
      "The number of resources that are compliant and the number that are noncompliant. If one or more resource types were provided with the request, the numbers are returned for each resource type. The maximum number returned is 100.\n"]}
[@@ocaml.doc "\n"]
type nonrec get_compliance_summary_by_resource_type_request =
  {
  resource_types: resource_types option
    [@ocaml.doc
      "Specify one or more resource types to get the number of resources that are compliant and the number that are noncompliant for each resource type.\n\n For this request, you can specify an Amazon Web Services resource type such as [AWS::EC2::Instance]. You can specify that the resource type is an Amazon Web Services account by specifying [AWS::::Account].\n "]}
[@@ocaml.doc "\n"]
type nonrec get_compliance_summary_by_config_rule_response =
  {
  compliance_summary: compliance_summary option
    [@ocaml.doc
      "The number of Config rules that are compliant and the number that are noncompliant, up to a maximum of 25 for each.\n"]}
[@@ocaml.doc "\n"]
type nonrec evaluation_result =
  {
  result_token: string_ option
    [@ocaml.doc
      "An encrypted token that associates an evaluation with an Config rule. The token identifies the rule, the Amazon Web Services resource being evaluated, and the event that triggered the evaluation.\n"];
  annotation: string_with_char_limit256 option
    [@ocaml.doc
      "Supplementary information about how the evaluation determined the compliance.\n"];
  config_rule_invoked_time: date option
    [@ocaml.doc
      "The time when the Config rule evaluated the Amazon Web Services resource.\n"];
  result_recorded_time: date option
    [@ocaml.doc "The time when Config recorded the evaluation result.\n"];
  compliance_type: compliance_type option
    [@ocaml.doc
      "Indicates whether the Amazon Web Services resource complies with the Config rule that evaluated it.\n\n For the [EvaluationResult] data type, Config supports only the [COMPLIANT], [NON_COMPLIANT], and [NOT_APPLICABLE] values. Config does not support the [INSUFFICIENT_DATA] value for the [EvaluationResult] data type.\n "];
  evaluation_result_identifier: evaluation_result_identifier option
    [@ocaml.doc "Uniquely identifies the evaluation result.\n"]}[@@ocaml.doc
                                                                  "The details of an Config evaluation. Provides the Amazon Web Services resource that was evaluated, the compliance of the resource, related time stamps, and supplementary information.\n"]
type nonrec evaluation_results = evaluation_result list[@@ocaml.doc ""]
type nonrec get_compliance_details_by_resource_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  evaluation_results: evaluation_results option
    [@ocaml.doc
      "Indicates whether the specified Amazon Web Services resource complies each Config rule.\n"]}
[@@ocaml.doc "\n"]
type nonrec compliance_types = compliance_type list[@@ocaml.doc ""]
type nonrec get_compliance_details_by_resource_request =
  {
  resource_evaluation_id: resource_evaluation_id option
    [@ocaml.doc
      "The unique ID of Amazon Web Services resource execution for which you want to retrieve evaluation results. \n\n  You need to only provide either a [ResourceEvaluationID] or a [ResourceID ]and [ResourceType].\n  \n   "];
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  compliance_types: compliance_types option
    [@ocaml.doc
      "Filters the results by compliance.\n\n  [INSUFFICIENT_DATA] is a valid [ComplianceType] that is returned when an Config rule cannot be evaluated. However, [INSUFFICIENT_DATA] cannot be used as a [ComplianceType] for filtering results.\n "];
  resource_id: base_resource_id option
    [@ocaml.doc
      "The ID of the Amazon Web Services resource for which you want compliance information.\n"];
  resource_type: string_with_char_limit256 option
    [@ocaml.doc
      "The type of the Amazon Web Services resource for which you want compliance information.\n"]}
[@@ocaml.doc "\n"]
type nonrec get_compliance_details_by_config_rule_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  evaluation_results: evaluation_results option
    [@ocaml.doc
      "Indicates whether the Amazon Web Services resource complies with the specified Config rule.\n"]}
[@@ocaml.doc "\n"]
type nonrec get_compliance_details_by_config_rule_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: limit option
    [@ocaml.doc
      "The maximum number of evaluation results returned on each page. The default is 10. You cannot specify a number greater than 100. If you specify 0, Config uses the default.\n"];
  compliance_types: compliance_types option
    [@ocaml.doc
      "Filters the results by compliance.\n\n  [INSUFFICIENT_DATA] is a valid [ComplianceType] that is returned when an Config rule cannot be evaluated. However, [INSUFFICIENT_DATA] cannot be used as a [ComplianceType] for filtering results.\n "];
  config_rule_name: string_with_char_limit64
    [@ocaml.doc
      "The name of the Config rule for which you want compliance information.\n"]}
[@@ocaml.doc "\n"]
type nonrec oversized_configuration_item_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The configuration item size is outside the allowable range.\n"]
type nonrec get_aggregate_resource_config_response =
  {
  configuration_item: configuration_item option
    [@ocaml.doc "Returns a [ConfigurationItem] object.\n"]}[@@ocaml.doc ""]
type nonrec get_aggregate_resource_config_request =
  {
  resource_identifier: aggregate_resource_identifier
    [@ocaml.doc "An object that identifies aggregate resource.\n"];
  configuration_aggregator_name: configuration_aggregator_name
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec grouped_resource_count =
  {
  resource_count: long [@ocaml.doc "The number of resources in the group.\n"];
  group_name: string_with_char_limit256
    [@ocaml.doc
      "The name of the group that can be region, account ID, or resource type. For example, region1, region2 if the region was chosen as [GroupByKey].\n"]}
[@@ocaml.doc "The count of resources that are grouped by the group name.\n"]
type nonrec grouped_resource_count_list = grouped_resource_count list
[@@ocaml.doc ""]
type nonrec get_aggregate_discovered_resource_counts_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  grouped_resource_counts: grouped_resource_count_list option
    [@ocaml.doc "Returns a list of GroupedResourceCount objects.\n"];
  group_by_key: string_with_char_limit256 option
    [@ocaml.doc
      "The key passed into the request object. If [GroupByKey] is not provided, the result will be empty.\n"];
  total_discovered_resources: long
    [@ocaml.doc
      "The total number of resources that are present in an aggregator with the filters that you provide.\n"]}
[@@ocaml.doc ""]
type nonrec resource_count_filters =
  {
  region: aws_region option
    [@ocaml.doc "The region where the account is located.\n"];
  account_id: account_id option
    [@ocaml.doc "The 12-digit ID of the account.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The type of the Amazon Web Services resource.\n"]}[@@ocaml.doc
                                                                    "Filters the resource count based on account ID, region, and resource type.\n"]
type nonrec resource_count_group_key =
  | AWS_REGION [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""]
  | RESOURCE_TYPE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec group_by_api_limit = int[@@ocaml.doc ""]
type nonrec get_aggregate_discovered_resource_counts_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  limit: group_by_api_limit option
    [@ocaml.doc
      "The maximum number of [GroupedResourceCount] objects returned on each page. The default is 1000. You cannot specify a number greater than 1000. If you specify 0, Config uses the default.\n"];
  group_by_key: resource_count_group_key option
    [@ocaml.doc "The key to group the resource counts.\n"];
  filters: resource_count_filters option
    [@ocaml.doc
      "Filters the results based on the [ResourceCountFilters] object.\n"];
  configuration_aggregator_name: configuration_aggregator_name
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec aggregate_conformance_pack_compliance_count =
  {
  non_compliant_conformance_pack_count: integer option
    [@ocaml.doc "Number of noncompliant conformance packs.\n"];
  compliant_conformance_pack_count: integer option
    [@ocaml.doc "Number of compliant conformance packs.\n"]}[@@ocaml.doc
                                                              "The number of conformance packs that are compliant and noncompliant.\n"]
type nonrec aggregate_conformance_pack_compliance_summary =
  {
  group_name: string_with_char_limit256 option
    [@ocaml.doc
      "Groups the result based on Amazon Web Services account ID or Amazon Web Services Region.\n"];
  compliance_summary: aggregate_conformance_pack_compliance_count option
    [@ocaml.doc
      "Returns an [AggregateConformancePackComplianceCount] object. \n"]}
[@@ocaml.doc
  "Provides a summary of compliance based on either account ID or region. \n"]
type nonrec aggregate_conformance_pack_compliance_summary_list =
  aggregate_conformance_pack_compliance_summary list[@@ocaml.doc ""]
type nonrec get_aggregate_conformance_pack_compliance_summary_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  group_by_key: string_with_char_limit256 option
    [@ocaml.doc
      "Groups the result based on Amazon Web Services account ID or Amazon Web Services Region.\n"];
  aggregate_conformance_pack_compliance_summaries:
    aggregate_conformance_pack_compliance_summary_list option
    [@ocaml.doc
      "Returns a list of [AggregateConformancePackComplianceSummary] object.\n"]}
[@@ocaml.doc ""]
type nonrec aggregate_conformance_pack_compliance_summary_filters =
  {
  aws_region: aws_region option
    [@ocaml.doc
      "The source Amazon Web Services Region from where the data is aggregated.\n"];
  account_id: account_id option
    [@ocaml.doc
      "The 12-digit Amazon Web Services account ID of the source account.\n"]}
[@@ocaml.doc "Filters the results based on account ID and region. \n"]
type nonrec aggregate_conformance_pack_compliance_summary_group_key =
  | AWS_REGION [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_aggregate_conformance_pack_compliance_summary_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: limit option
    [@ocaml.doc
      "The maximum number of results returned on each page. The default is maximum. If you specify 0, Config uses the default.\n"];
  group_by_key:
    aggregate_conformance_pack_compliance_summary_group_key option
    [@ocaml.doc
      "Groups the result based on Amazon Web Services account ID or Amazon Web Services Region.\n"];
  filters: aggregate_conformance_pack_compliance_summary_filters option
    [@ocaml.doc
      "Filters the results based on the [AggregateConformancePackComplianceSummaryFilters] object.\n"];
  configuration_aggregator_name: configuration_aggregator_name
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec aggregate_compliance_count =
  {
  compliance_summary: compliance_summary option
    [@ocaml.doc "The number of compliant and noncompliant Config rules.\n"];
  group_name: string_with_char_limit256 option
    [@ocaml.doc
      "The 12-digit account ID or region based on the GroupByKey value.\n"]}
[@@ocaml.doc
  "Returns the number of compliant and noncompliant rules for one or more accounts and regions in an aggregator.\n"]
type nonrec aggregate_compliance_count_list = aggregate_compliance_count list
[@@ocaml.doc ""]
type nonrec get_aggregate_config_rule_compliance_summary_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  aggregate_compliance_counts: aggregate_compliance_count_list option
    [@ocaml.doc "Returns a list of AggregateComplianceCounts object.\n"];
  group_by_key: string_with_char_limit256 option
    [@ocaml.doc "Groups the result based on ACCOUNT_ID or AWS_REGION.\n"]}
[@@ocaml.doc ""]
type nonrec config_rule_compliance_summary_filters =
  {
  aws_region: aws_region option
    [@ocaml.doc "The source region where the data is aggregated.\n"];
  account_id: account_id option
    [@ocaml.doc "The 12-digit account ID of the source account.\n"]}[@@ocaml.doc
                                                                    "Filters the results based on the account IDs and regions.\n"]
type nonrec config_rule_compliance_summary_group_key =
  | AWS_REGION [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_aggregate_config_rule_compliance_summary_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: group_by_api_limit option
    [@ocaml.doc
      "The maximum number of evaluation results returned on each page. The default is 1000. You cannot specify a number greater than 1000. If you specify 0, Config uses the default.\n"];
  group_by_key: config_rule_compliance_summary_group_key option
    [@ocaml.doc "Groups the result based on ACCOUNT_ID or AWS_REGION.\n"];
  filters: config_rule_compliance_summary_filters option
    [@ocaml.doc
      "Filters the results based on the ConfigRuleComplianceSummaryFilters object.\n"];
  configuration_aggregator_name: configuration_aggregator_name
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec aggregate_evaluation_result =
  {
  aws_region: aws_region option
    [@ocaml.doc "The source region from where the data is aggregated.\n"];
  account_id: account_id option
    [@ocaml.doc "The 12-digit account ID of the source account.\n"];
  annotation: string_with_char_limit256 option
    [@ocaml.doc
      "Supplementary information about how the agrregate evaluation determined the compliance.\n"];
  config_rule_invoked_time: date option
    [@ocaml.doc
      "The time when the Config rule evaluated the Amazon Web Services resource.\n"];
  result_recorded_time: date option
    [@ocaml.doc
      "The time when Config recorded the aggregate evaluation result.\n"];
  compliance_type: compliance_type option
    [@ocaml.doc
      "The resource compliance status.\n\n For the [AggregationEvaluationResult] data type, Config supports only the [COMPLIANT] and [NON_COMPLIANT]. Config does not support the [NOT_APPLICABLE] and [INSUFFICIENT_DATA] value.\n "];
  evaluation_result_identifier: evaluation_result_identifier option
    [@ocaml.doc "Uniquely identifies the evaluation result.\n"]}[@@ocaml.doc
                                                                  "The details of an Config evaluation for an account ID and region in an aggregator. Provides the Amazon Web Services resource that was evaluated, the compliance of the resource, related time stamps, and supplementary information. \n"]
type nonrec aggregate_evaluation_result_list =
  aggregate_evaluation_result list[@@ocaml.doc ""]
type nonrec get_aggregate_compliance_details_by_config_rule_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  aggregate_evaluation_results: aggregate_evaluation_result_list option
    [@ocaml.doc "Returns an AggregateEvaluationResults object.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec get_aggregate_compliance_details_by_config_rule_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: limit option
    [@ocaml.doc
      "The maximum number of evaluation results returned on each page. The default is 50. You cannot specify a number greater than 100. If you specify 0, Config uses the default.\n"];
  compliance_type: compliance_type option
    [@ocaml.doc
      "The resource compliance status.\n\n  For the [GetAggregateComplianceDetailsByConfigRuleRequest] data type, Config supports only the [COMPLIANT] and [NON_COMPLIANT]. Config does not support the [NOT_APPLICABLE] and [INSUFFICIENT_DATA] values.\n  \n   "];
  aws_region: aws_region
    [@ocaml.doc "The source region from where the data is aggregated.\n"];
  account_id: account_id
    [@ocaml.doc "The 12-digit account ID of the source account.\n"];
  config_rule_name: config_rule_name
    [@ocaml.doc
      "The name of the Config rule for which you want compliance information.\n"];
  configuration_aggregator_name: configuration_aggregator_name
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec disassociate_resource_types_response =
  {
  configuration_recorder: configuration_recorder [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
type nonrec disassociate_resource_types_request =
  {
  resource_types: resource_type_list
    [@ocaml.doc
      "The list of resource types you want to remove from the recording group of the specified configuration recorder.\n"];
  configuration_recorder_arn: amazon_resource_name
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the specified configuration recorder.\n"]}
[@@ocaml.doc ""]
type nonrec no_such_retention_configuration_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have specified a retention configuration that does not exist.\n"]
type nonrec retention_configuration_list = retention_configuration list
[@@ocaml.doc ""]
type nonrec describe_retention_configurations_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  retention_configurations: retention_configuration_list option
    [@ocaml.doc "Returns a retention configuration object.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec retention_configuration_name_list =
  retention_configuration_name list[@@ocaml.doc ""]
type nonrec describe_retention_configurations_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  retention_configuration_names: retention_configuration_name_list option
    [@ocaml.doc
      "A list of names of retention configurations for which you want details. If you do not specify a name, Config returns details for all the retention configurations for that account.\n\n  Currently, Config supports only one retention configuration per region in your account.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec remediation_execution_state =
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec remediation_execution_step_state =
  | FAILED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec remediation_execution_step =
  {
  stop_time: date option [@ocaml.doc "The time when the step stopped.\n"];
  start_time: date option [@ocaml.doc "The time when the step started.\n"];
  error_message: string_ option
    [@ocaml.doc
      "An error message if the step was interrupted during execution.\n"];
  state: remediation_execution_step_state option
    [@ocaml.doc "The valid status of the step.\n"];
  name: string_ option [@ocaml.doc "The details of the step.\n"]}[@@ocaml.doc
                                                                   "Name of the step from the SSM document.\n"]
type nonrec remediation_execution_steps = remediation_execution_step list
[@@ocaml.doc ""]
type nonrec remediation_execution_status =
  {
  last_updated_time: date option
    [@ocaml.doc
      "The time when the remediation execution was last updated.\n"];
  invocation_time: date option
    [@ocaml.doc "Start time when the remediation was executed.\n"];
  step_details: remediation_execution_steps option
    [@ocaml.doc "Details of every step.\n"];
  state: remediation_execution_state option
    [@ocaml.doc "ENUM of the values.\n"];
  resource_key: resource_key option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "Provides details of the current status of the invoked remediation action for that resource.\n"]
type nonrec remediation_execution_statuses =
  remediation_execution_status list[@@ocaml.doc ""]
type nonrec describe_remediation_execution_status_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  remediation_execution_statuses: remediation_execution_statuses option
    [@ocaml.doc
      "Returns a list of remediation execution statuses objects.\n"]}
[@@ocaml.doc ""]
type nonrec describe_remediation_execution_status_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: limit option
    [@ocaml.doc
      "The maximum number of RemediationExecutionStatuses returned on each page. The default is maximum. If you specify 0, Config uses the default. \n"];
  resource_keys: resource_keys option
    [@ocaml.doc
      "A list of resource keys to be processed with the current request. Each element in the list consists of the resource type and resource ID. \n"];
  config_rule_name: config_rule_name
    [@ocaml.doc "The name of the Config rule.\n"]}[@@ocaml.doc ""]
type nonrec describe_remediation_exceptions_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  remediation_exceptions: remediation_exceptions option
    [@ocaml.doc "Returns a list of remediation exception objects.\n"]}
[@@ocaml.doc ""]
type nonrec describe_remediation_exceptions_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  limit: limit option
    [@ocaml.doc
      "The maximum number of RemediationExceptionResourceKey returned on each page. The default is 25. If you specify 0, Config uses the default.\n"];
  resource_keys: remediation_exception_resource_keys option
    [@ocaml.doc
      "An exception list of resource exception keys to be processed with the current request. Config adds exception for each resource key. For example, Config adds 3 exceptions for 3 resource keys. \n"];
  config_rule_name: config_rule_name
    [@ocaml.doc "The name of the Config rule.\n"]}[@@ocaml.doc ""]
type nonrec describe_remediation_configurations_response =
  {
  remediation_configurations: remediation_configurations option
    [@ocaml.doc "Returns a remediation configuration object.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec config_rule_names = config_rule_name list[@@ocaml.doc ""]
type nonrec describe_remediation_configurations_request =
  {
  config_rule_names: config_rule_names
    [@ocaml.doc
      "A list of Config rule names of remediation configurations for which you want details. \n"]}
[@@ocaml.doc ""]
type nonrec pending_aggregation_request =
  {
  requester_aws_region: aws_region option
    [@ocaml.doc "The region requesting to aggregate data. \n"];
  requester_account_id: account_id option
    [@ocaml.doc
      "The 12-digit account ID of the account requesting to aggregate data.\n"]}
[@@ocaml.doc
  "An object that represents the account ID and region of an aggregator account that is requesting authorization but is not yet authorized.\n"]
type nonrec pending_aggregation_request_list =
  pending_aggregation_request list[@@ocaml.doc ""]
type nonrec describe_pending_aggregation_requests_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  pending_aggregation_requests: pending_aggregation_request_list option
    [@ocaml.doc "Returns a PendingAggregationRequests object.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec describe_pending_aggregation_requests_limit = int[@@ocaml.doc ""]
type nonrec describe_pending_aggregation_requests_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: describe_pending_aggregation_requests_limit option
    [@ocaml.doc
      "The maximum number of evaluation results returned on each page. The default is maximum. If you specify 0, Config uses the default.\n"]}
[@@ocaml.doc ""]
type nonrec organization_resource_status =
  | UPDATE_FAILED [@ocaml.doc ""]
  | UPDATE_IN_PROGRESS [@ocaml.doc ""]
  | UPDATE_SUCCESSFUL [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
  | DELETE_SUCCESSFUL [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_SUCCESSFUL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec organization_conformance_pack_status =
  {
  last_update_time: date option
    [@ocaml.doc "The timestamp of the last update.\n"];
  error_message: string_ option
    [@ocaml.doc
      "An error message indicating that organization conformance pack creation or deletion failed due to an error. \n"];
  error_code: string_ option
    [@ocaml.doc
      "An error code that is returned when organization conformance pack creation or deletion has failed in a member account. \n"];
  status: organization_resource_status
    [@ocaml.doc
      "Indicates deployment status of an organization conformance pack. When management account calls PutOrganizationConformancePack for the first time, conformance pack status is created in all the member accounts. When management account calls PutOrganizationConformancePack for the second time, conformance pack status is updated in all the member accounts. Additionally, conformance pack status is updated when one or more member accounts join or leave an organization. Conformance pack status is deleted when the management account deletes OrganizationConformancePack in all the member accounts and disables service access for [config-multiaccountsetup.amazonaws.com].\n\n Config sets the state of the conformance pack to:\n \n  {ul\n        {-   [CREATE_SUCCESSFUL] when an organization conformance pack has been successfully created in all the member accounts. \n            \n             }\n        {-   [CREATE_IN_PROGRESS] when an organization conformance pack creation is in progress.\n            \n             }\n        {-   [CREATE_FAILED] when an organization conformance pack creation failed in one or more member accounts within that organization.\n            \n             }\n        {-   [DELETE_FAILED] when an organization conformance pack deletion failed in one or more member accounts within that organization.\n            \n             }\n        {-   [DELETE_IN_PROGRESS] when an organization conformance pack deletion is in progress.\n            \n             }\n        {-   [DELETE_SUCCESSFUL] when an organization conformance pack has been successfully deleted from all the member accounts.\n            \n             }\n        {-   [UPDATE_SUCCESSFUL] when an organization conformance pack has been successfully updated in all the member accounts.\n            \n             }\n        {-   [UPDATE_IN_PROGRESS] when an organization conformance pack update is in progress.\n            \n             }\n        {-   [UPDATE_FAILED] when an organization conformance pack update failed in one or more member accounts within that organization.\n            \n             }\n        }\n  "];
  organization_conformance_pack_name: organization_conformance_pack_name
    [@ocaml.doc
      "The name that you assign to organization conformance pack.\n"]}
[@@ocaml.doc
  "Returns the status for an organization conformance pack in an organization.\n"]
type nonrec organization_conformance_pack_statuses =
  organization_conformance_pack_status list[@@ocaml.doc ""]
type nonrec describe_organization_conformance_pack_statuses_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The nextToken string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  organization_conformance_pack_statuses:
    organization_conformance_pack_statuses option
    [@ocaml.doc "A list of [OrganizationConformancePackStatus] objects. \n"]}
[@@ocaml.doc ""]
type nonrec organization_conformance_pack_names =
  organization_conformance_pack_name list[@@ocaml.doc ""]
type nonrec describe_organization_conformance_pack_statuses_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "The nextToken string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  limit: cosmos_page_limit option
    [@ocaml.doc
      "The maximum number of OrganizationConformancePackStatuses returned on each page. If you do no specify a number, Config uses the default. The default is 100. \n"];
  organization_conformance_pack_names:
    organization_conformance_pack_names option
    [@ocaml.doc
      "The names of organization conformance packs for which you want status details. If you do not specify any names, Config returns details for all your organization conformance packs. \n"]}
[@@ocaml.doc ""]
type nonrec organization_conformance_pack =
  {
  last_update_time: date
    [@ocaml.doc
      "Last time when organization conformation pack was updated.\n"];
  excluded_accounts: excluded_accounts option
    [@ocaml.doc
      "A comma-separated list of accounts excluded from organization conformance pack.\n"];
  conformance_pack_input_parameters: conformance_pack_input_parameters option
    [@ocaml.doc "A list of [ConformancePackInputParameter] objects.\n"];
  delivery_s3_key_prefix: delivery_s3_key_prefix option
    [@ocaml.doc
      "Any folder structure you want to add to an Amazon S3 bucket.\n\n  This field is optional.\n  \n   "];
  delivery_s3_bucket: delivery_s3_bucket option
    [@ocaml.doc
      "The name of the Amazon S3 bucket where Config stores conformance pack templates. \n\n  This field is optional.\n  \n   "];
  organization_conformance_pack_arn: string_with_char_limit256
    [@ocaml.doc
      "Amazon Resource Name (ARN) of organization conformance pack.\n"];
  organization_conformance_pack_name: organization_conformance_pack_name
    [@ocaml.doc "The name you assign to an organization conformance pack.\n"]}
[@@ocaml.doc
  "An organization conformance pack that has information about conformance packs that Config creates in member accounts. \n"]
type nonrec organization_conformance_packs =
  organization_conformance_pack list[@@ocaml.doc ""]
type nonrec describe_organization_conformance_packs_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The nextToken string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  organization_conformance_packs: organization_conformance_packs option
    [@ocaml.doc "Returns a list of OrganizationConformancePacks objects.\n"]}
[@@ocaml.doc ""]
type nonrec describe_organization_conformance_packs_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "The nextToken string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: cosmos_page_limit option
    [@ocaml.doc
      "The maximum number of organization config packs returned on each page. If you do no specify a number, Config uses the default. The default is 100.\n"];
  organization_conformance_pack_names:
    organization_conformance_pack_names option
    [@ocaml.doc
      "The name that you assign to an organization conformance pack.\n"]}
[@@ocaml.doc ""]
type nonrec organization_rule_status =
  | UPDATE_FAILED [@ocaml.doc ""]
  | UPDATE_IN_PROGRESS [@ocaml.doc ""]
  | UPDATE_SUCCESSFUL [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
  | DELETE_SUCCESSFUL [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_SUCCESSFUL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec organization_config_rule_status =
  {
  last_update_time: date option
    [@ocaml.doc "The timestamp of the last update.\n"];
  error_message: string_ option
    [@ocaml.doc
      "An error message indicating that organization Config rule creation or deletion failed due to an error.\n"];
  error_code: string_ option
    [@ocaml.doc
      "An error code that is returned when organization Config rule creation or deletion has failed.\n"];
  organization_rule_status: organization_rule_status
    [@ocaml.doc
      "Indicates deployment status of an organization Config rule. When management account calls PutOrganizationConfigRule action for the first time, Config rule status is created in all the member accounts. When management account calls PutOrganizationConfigRule action for the second time, Config rule status is updated in all the member accounts. Additionally, Config rule status is updated when one or more member accounts join or leave an organization. Config rule status is deleted when the management account deletes OrganizationConfigRule in all the member accounts and disables service access for [config-multiaccountsetup.amazonaws.com].\n\n Config sets the state of the rule to:\n \n  {ul\n        {-   [CREATE_SUCCESSFUL] when an organization Config rule has been successfully created in all the member accounts. \n            \n             }\n        {-   [CREATE_IN_PROGRESS] when an organization Config rule creation is in progress.\n            \n             }\n        {-   [CREATE_FAILED] when an organization Config rule creation failed in one or more member accounts within that organization.\n            \n             }\n        {-   [DELETE_FAILED] when an organization Config rule deletion failed in one or more member accounts within that organization.\n            \n             }\n        {-   [DELETE_IN_PROGRESS] when an organization Config rule deletion is in progress.\n            \n             }\n        {-   [DELETE_SUCCESSFUL] when an organization Config rule has been successfully deleted from all the member accounts.\n            \n             }\n        {-   [UPDATE_SUCCESSFUL] when an organization Config rule has been successfully updated in all the member accounts.\n            \n             }\n        {-   [UPDATE_IN_PROGRESS] when an organization Config rule update is in progress.\n            \n             }\n        {-   [UPDATE_FAILED] when an organization Config rule update failed in one or more member accounts within that organization.\n            \n             }\n        }\n  "];
  organization_config_rule_name: organization_config_rule_name
    [@ocaml.doc "The name that you assign to organization Config rule.\n"]}
[@@ocaml.doc
  "Returns the status for an organization Config rule in an organization.\n"]
type nonrec organization_config_rule_statuses =
  organization_config_rule_status list[@@ocaml.doc ""]
type nonrec describe_organization_config_rule_statuses_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  organization_config_rule_statuses: organization_config_rule_statuses option
    [@ocaml.doc "A list of [OrganizationConfigRuleStatus] objects.\n"]}
[@@ocaml.doc ""]
type nonrec organization_config_rule_names = string_with_char_limit64 list
[@@ocaml.doc ""]
type nonrec describe_organization_config_rule_statuses_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  limit: cosmos_page_limit option
    [@ocaml.doc
      "The maximum number of [OrganizationConfigRuleStatuses] returned on each page. If you do no specify a number, Config uses the default. The default is 100.\n"];
  organization_config_rule_names: organization_config_rule_names option
    [@ocaml.doc
      "The names of organization Config rules for which you want status details. If you do not specify any names, Config returns details for all your organization Config rules.\n"]}
[@@ocaml.doc ""]
type nonrec organization_custom_policy_rule_metadata_no_policy =
  {
  debug_log_delivery_accounts: debug_log_delivery_accounts option
    [@ocaml.doc
      "A list of accounts that you can enable debug logging for your organization Config Custom Policy rule. List is null when debug logging is enabled for all accounts.\n"];
  policy_runtime: policy_runtime option
    [@ocaml.doc
      "The runtime system for your organization Config Custom Policy rules. Guard is a policy-as-code language that allows you to write policies that are enforced by Config Custom Policy rules. For more information about Guard, see the {{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}.\n"];
  tag_value_scope: string_with_char_limit256 option
    [@ocaml.doc
      "The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key).\n"];
  tag_key_scope: string_with_char_limit128 option
    [@ocaml.doc
      "One part of a key-value pair that make up a tag. A key is a general label that acts like a category for more specific tag values.\n"];
  resource_id_scope: string_with_char_limit768 option
    [@ocaml.doc
      "The ID of the Amazon Web Services resource that was evaluated.\n"];
  resource_types_scope: resource_types_scope option
    [@ocaml.doc
      "The type of the Amazon Web Services resource that was evaluated.\n"];
  maximum_execution_frequency: maximum_execution_frequency option
    [@ocaml.doc
      "The maximum frequency with which Config runs evaluations for a rule. Your Config Custom Policy rule is triggered when Config delivers the configuration snapshot. For more information, see [ConfigSnapshotDeliveryProperties].\n"];
  input_parameters: string_with_char_limit2048 option
    [@ocaml.doc
      "A string, in JSON format, that is passed to your organization Config Custom Policy rule.\n"];
  organization_config_rule_trigger_types:
    organization_config_rule_trigger_type_no_s_ns option
    [@ocaml.doc
      "The type of notification that triggers Config to run an evaluation for a rule. For Config Custom Policy rules, Config supports change triggered notification types:\n\n {ul\n       {-   [ConfigurationItemChangeNotification] - Triggers an evaluation when Config delivers a configuration item as a result of a resource change.\n           \n            }\n       {-   [OversizedConfigurationItemChangeNotification] - Triggers an evaluation when Config delivers an oversized configuration item. Config may generate this notification type when a resource changes and the notification exceeds the maximum size allowed by Amazon SNS.\n           \n            }\n       }\n  "];
  description: string_with_char_limit256_min0 option
    [@ocaml.doc
      "The description that you provide for your organization Config Custom Policy rule.\n"]}
[@@ocaml.doc
  " metadata for your organization Config Custom Policy rule including the runtime system in use, which accounts have debug logging enabled, and other custom rule metadata such as resource type, resource ID of Amazon Web Services resource, and organization trigger types that trigger Config to evaluate Amazon Web Services resources against a rule.\n"]
type nonrec organization_config_rule =
  {
  organization_custom_policy_rule_metadata:
    organization_custom_policy_rule_metadata_no_policy option
    [@ocaml.doc
      "An object that specifies metadata for your organization's Config Custom Policy rule. The metadata includes the runtime system in use, which accounts have debug logging enabled, and other custom rule metadata, such as resource type, resource ID of Amazon Web Services resource, and organization trigger types that initiate Config to evaluate Amazon Web Services resources against a rule.\n"];
  last_update_time: date option
    [@ocaml.doc "The timestamp of the last update.\n"];
  excluded_accounts: excluded_accounts option
    [@ocaml.doc
      "A comma-separated list of accounts excluded from organization Config rule.\n"];
  organization_custom_rule_metadata: organization_custom_rule_metadata option
    [@ocaml.doc "An [OrganizationCustomRuleMetadata] object.\n"];
  organization_managed_rule_metadata:
    organization_managed_rule_metadata option
    [@ocaml.doc "An [OrganizationManagedRuleMetadata] object.\n"];
  organization_config_rule_arn: string_with_char_limit256
    [@ocaml.doc "Amazon Resource Name (ARN) of organization Config rule.\n"];
  organization_config_rule_name: organization_config_rule_name
    [@ocaml.doc "The name that you assign to organization Config rule.\n"]}
[@@ocaml.doc
  "An organization Config rule that has information about Config rules that Config creates in member accounts.\n"]
type nonrec organization_config_rules = organization_config_rule list
[@@ocaml.doc ""]
type nonrec describe_organization_config_rules_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  organization_config_rules: organization_config_rules option
    [@ocaml.doc "Returns a list of [OrganizationConfigRule] objects.\n"]}
[@@ocaml.doc ""]
type nonrec describe_organization_config_rules_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  limit: cosmos_page_limit option
    [@ocaml.doc
      "The maximum number of organization Config rules returned on each page. If you do no specify a number, Config uses the default. The default is 100.\n"];
  organization_config_rule_names: organization_config_rule_names option
    [@ocaml.doc
      "The names of organization Config rules for which you want details. If you do not specify any names, Config returns details for all your organization Config rules.\n"]}
[@@ocaml.doc ""]
type nonrec no_such_delivery_channel_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "You have specified a delivery channel that does not exist.\n"]
type nonrec delivery_status =
  | Not_Applicable [@ocaml.doc ""]
  | Failure [@ocaml.doc ""]
  | Success [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec config_export_delivery_info =
  {
  next_delivery_time: date option
    [@ocaml.doc "The time that the next delivery occurs.\n"];
  last_successful_time: date option
    [@ocaml.doc "The time of the last successful delivery.\n"];
  last_attempt_time: date option
    [@ocaml.doc "The time of the last attempted delivery.\n"];
  last_error_message: string_ option
    [@ocaml.doc "The error message from the last attempted delivery.\n"];
  last_error_code: string_ option
    [@ocaml.doc "The error code from the last attempted delivery.\n"];
  last_status: delivery_status option
    [@ocaml.doc "Status of the last attempted delivery.\n"]}[@@ocaml.doc
                                                              "Provides status of the delivery of the snapshot or the configuration history to the specified Amazon S3 bucket. Also provides the status of notifications about the Amazon S3 delivery to the specified Amazon SNS topic.\n"]
type nonrec config_stream_delivery_info =
  {
  last_status_change_time: date option
    [@ocaml.doc "The time from the last status change.\n"];
  last_error_message: string_ option
    [@ocaml.doc "The error message from the last attempted delivery.\n"];
  last_error_code: string_ option
    [@ocaml.doc "The error code from the last attempted delivery.\n"];
  last_status: delivery_status option
    [@ocaml.doc
      "Status of the last attempted delivery.\n\n  {b Note} Providing an SNS topic on a {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DeliveryChannel.html}DeliveryChannel} for Config is optional. If the SNS delivery is turned off, the last status will be {b Not_Applicable}.\n "]}
[@@ocaml.doc
  "A list that contains the status of the delivery of the configuration stream notification to the Amazon SNS topic.\n"]
type nonrec delivery_channel_status =
  {
  config_stream_delivery_info: config_stream_delivery_info option
    [@ocaml.doc
      "A list containing the status of the delivery of the configuration stream notification to the specified Amazon SNS topic.\n"];
  config_history_delivery_info: config_export_delivery_info option
    [@ocaml.doc
      "A list that contains the status of the delivery of the configuration history to the specified Amazon S3 bucket.\n"];
  config_snapshot_delivery_info: config_export_delivery_info option
    [@ocaml.doc
      "A list containing the status of the delivery of the snapshot to the specified Amazon S3 bucket.\n"];
  name: string_ option [@ocaml.doc "The name of the delivery channel.\n"]}
[@@ocaml.doc
  "The status of a specified delivery channel.\n\n Valid values: [Success] | [Failure] \n "]
type nonrec delivery_channel_status_list = delivery_channel_status list
[@@ocaml.doc ""]
type nonrec describe_delivery_channel_status_response =
  {
  delivery_channels_status: delivery_channel_status_list option
    [@ocaml.doc
      "A list that contains the status of a specified delivery channel.\n"]}
[@@ocaml.doc "The output for the [DescribeDeliveryChannelStatus] action.\n"]
type nonrec delivery_channel_name_list = channel_name list[@@ocaml.doc ""]
type nonrec describe_delivery_channel_status_request =
  {
  delivery_channel_names: delivery_channel_name_list option
    [@ocaml.doc "A list of delivery channel names.\n"]}[@@ocaml.doc
                                                         "The input for the [DeliveryChannelStatus] action.\n"]
type nonrec delivery_channel_list = delivery_channel list[@@ocaml.doc ""]
type nonrec describe_delivery_channels_response =
  {
  delivery_channels: delivery_channel_list option
    [@ocaml.doc
      "A list that contains the descriptions of the specified delivery channel.\n"]}
[@@ocaml.doc "The output for the [DescribeDeliveryChannels] action.\n"]
type nonrec describe_delivery_channels_request =
  {
  delivery_channel_names: delivery_channel_name_list option
    [@ocaml.doc "A list of delivery channel names.\n"]}[@@ocaml.doc
                                                         "The input for the [DescribeDeliveryChannels] action.\n"]
type nonrec conformance_pack_id = string[@@ocaml.doc ""]
type nonrec conformance_pack_state =
  | DELETE_FAILED [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | CREATE_COMPLETE [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec stack_arn = string[@@ocaml.doc ""]
type nonrec conformance_pack_status_reason = string[@@ocaml.doc ""]
type nonrec conformance_pack_status_detail =
  {
  last_update_completed_time: date option
    [@ocaml.doc
      "Last time when conformation pack creation and update was successful.\n"];
  last_update_requested_time: date
    [@ocaml.doc
      "Last time when conformation pack creation and update was requested.\n"];
  conformance_pack_status_reason: conformance_pack_status_reason option
    [@ocaml.doc "The reason of conformance pack creation failure.\n"];
  stack_arn: stack_arn
    [@ocaml.doc "Amazon Resource Name (ARN) of CloudFormation stack. \n"];
  conformance_pack_state: conformance_pack_state
    [@ocaml.doc
      "Indicates deployment status of conformance pack.\n\n Config sets the state of the conformance pack to:\n \n  {ul\n        {-  CREATE_IN_PROGRESS when a conformance pack creation is in progress for an account.\n            \n             }\n        {-  CREATE_COMPLETE when a conformance pack has been successfully created in your account.\n            \n             }\n        {-  CREATE_FAILED when a conformance pack creation failed in your account.\n            \n             }\n        {-  DELETE_IN_PROGRESS when a conformance pack deletion is in progress. \n            \n             }\n        {-  DELETE_FAILED when a conformance pack deletion failed in your account.\n            \n             }\n        }\n  "];
  conformance_pack_arn: conformance_pack_arn
    [@ocaml.doc "Amazon Resource Name (ARN) of comformance pack.\n"];
  conformance_pack_id: conformance_pack_id
    [@ocaml.doc "ID of the conformance pack.\n"];
  conformance_pack_name: conformance_pack_name
    [@ocaml.doc "Name of the conformance pack.\n"]}[@@ocaml.doc
                                                     "Status details of a conformance pack.\n"]
type nonrec conformance_pack_status_details_list =
  conformance_pack_status_detail list[@@ocaml.doc ""]
type nonrec describe_conformance_pack_status_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  conformance_pack_status_details:
    conformance_pack_status_details_list option
    [@ocaml.doc "A list of [ConformancePackStatusDetail] objects.\n"]}
[@@ocaml.doc ""]
type nonrec conformance_pack_names_list = conformance_pack_name list[@@ocaml.doc
                                                                    ""]
type nonrec describe_conformance_pack_status_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  limit: page_size_limit option
    [@ocaml.doc
      "The maximum number of conformance packs status returned on each page.\n"];
  conformance_pack_names: conformance_pack_names_list option
    [@ocaml.doc "Comma-separated list of conformance pack names.\n"]}
[@@ocaml.doc ""]
type nonrec conformance_pack_detail =
  {
  template_ssm_document_details: template_ssm_document_details option
    [@ocaml.doc
      "An object that contains the name or Amazon Resource Name (ARN) of the Amazon Web Services Systems Manager document (SSM document) and the version of the SSM document that is used to create a conformance pack.\n"];
  created_by: string_with_char_limit256 option
    [@ocaml.doc
      "The Amazon Web Services service that created the conformance pack.\n"];
  last_update_requested_time: date option
    [@ocaml.doc "The last time a conformation pack update was requested. \n"];
  conformance_pack_input_parameters: conformance_pack_input_parameters option
    [@ocaml.doc "A list of [ConformancePackInputParameter] objects.\n"];
  delivery_s3_key_prefix: delivery_s3_key_prefix option
    [@ocaml.doc
      "The prefix for the Amazon S3 bucket.\n\n  This field is optional.\n  \n   "];
  delivery_s3_bucket: delivery_s3_bucket option
    [@ocaml.doc
      "The name of the Amazon S3 bucket where Config stores conformance pack templates. \n\n  This field is optional.\n  \n   "];
  conformance_pack_id: conformance_pack_id
    [@ocaml.doc "ID of the conformance pack.\n"];
  conformance_pack_arn: conformance_pack_arn
    [@ocaml.doc "Amazon Resource Name (ARN) of the conformance pack.\n"];
  conformance_pack_name: conformance_pack_name
    [@ocaml.doc "Name of the conformance pack.\n"]}[@@ocaml.doc
                                                     "Returns details of a conformance pack. A conformance pack is a collection of Config rules and remediation actions that can be easily deployed in an account and a region.\n"]
type nonrec conformance_pack_detail_list = conformance_pack_detail list
[@@ocaml.doc ""]
type nonrec describe_conformance_packs_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  conformance_pack_details: conformance_pack_detail_list option
    [@ocaml.doc "Returns a list of [ConformancePackDetail] objects.\n"]}
[@@ocaml.doc ""]
type nonrec describe_conformance_packs_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  limit: page_size_limit option
    [@ocaml.doc
      "The maximum number of conformance packs returned on each page.\n"];
  conformance_pack_names: conformance_pack_names_list option
    [@ocaml.doc
      "Comma-separated list of conformance pack names for which you want details. If you do not specify any names, Config returns details for all your conformance packs. \n"]}
[@@ocaml.doc ""]
type nonrec controls_list = string_with_char_limit128 list[@@ocaml.doc ""]
type nonrec conformance_pack_rule_compliance =
  {
  controls: controls_list option
    [@ocaml.doc
      "Controls for the conformance pack. A control is a process to prevent or detect problems while meeting objectives. A control can align with a specific compliance regime or map to internal controls defined by an organization.\n"];
  compliance_type: conformance_pack_compliance_type option
    [@ocaml.doc "Compliance of the Config rule.\n"];
  config_rule_name: config_rule_name option
    [@ocaml.doc "Name of the Config rule.\n"]}[@@ocaml.doc
                                                "Compliance information of one or more Config rules within a conformance pack. You can filter using Config rule names and compliance types.\n"]
type nonrec conformance_pack_rule_compliance_list =
  conformance_pack_rule_compliance list[@@ocaml.doc ""]
type nonrec describe_conformance_pack_compliance_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  conformance_pack_rule_compliance_list:
    conformance_pack_rule_compliance_list
    [@ocaml.doc
      "Returns a list of [ConformancePackRuleCompliance] objects.\n"];
  conformance_pack_name: conformance_pack_name
    [@ocaml.doc "Name of the conformance pack.\n"]}[@@ocaml.doc ""]
type nonrec conformance_pack_compliance_filters =
  {
  compliance_type: conformance_pack_compliance_type option
    [@ocaml.doc
      "Filters the results by compliance.\n\n The allowed values are [COMPLIANT] and [NON_COMPLIANT]. [INSUFFICIENT_DATA] is not supported.\n "];
  config_rule_names: conformance_pack_config_rule_names option
    [@ocaml.doc "Filters the results by Config rule names.\n"]}[@@ocaml.doc
                                                                 "Filters the conformance pack by compliance types and Config rule names.\n"]
type nonrec describe_conformance_pack_compliance_limit = int[@@ocaml.doc ""]
type nonrec describe_conformance_pack_compliance_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  limit: describe_conformance_pack_compliance_limit option
    [@ocaml.doc
      "The maximum number of Config rules within a conformance pack are returned on each page.\n"];
  filters: conformance_pack_compliance_filters option
    [@ocaml.doc "A [ConformancePackComplianceFilters] object.\n"];
  conformance_pack_name: conformance_pack_name
    [@ocaml.doc "Name of the conformance pack.\n"]}[@@ocaml.doc ""]
type nonrec recorder_status =
  | NotApplicable [@ocaml.doc ""]
  | Failure [@ocaml.doc ""]
  | Success [@ocaml.doc ""]
  | Pending [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec configuration_recorder_status =
  {
  service_principal: service_principal option
    [@ocaml.doc
      "For service-linked configuration recorders, the service principal of the linked Amazon Web Services service.\n"];
  last_status_change_time: date option
    [@ocaml.doc
      "The time of the latest change in status of an recording event processed by the recorder.\n"];
  last_error_message: string_ option
    [@ocaml.doc
      "The latest error message from when the recorder last failed.\n"];
  last_error_code: string_ option
    [@ocaml.doc
      "The latest error code from when the recorder last failed.\n"];
  last_status: recorder_status option
    [@ocaml.doc
      "The status of the latest recording event processed by the recorder.\n"];
  recording: boolean_ option
    [@ocaml.doc
      "Specifies whether or not the recorder is currently recording.\n"];
  last_stop_time: date option
    [@ocaml.doc "The time the recorder was last stopped.\n"];
  last_start_time: date option
    [@ocaml.doc "The time the recorder was last started.\n"];
  name: string_ option
    [@ocaml.doc "The name of the configuration recorder.\n"];
  arn: amazon_resource_name option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the configuration recorder.\n"]}
[@@ocaml.doc
  "The current status of the configuration recorder.\n\n For a detailed status of recording events over time, add your Config events to CloudWatch metrics and use CloudWatch metrics.\n "]
type nonrec configuration_recorder_status_list =
  configuration_recorder_status list[@@ocaml.doc ""]
type nonrec describe_configuration_recorder_status_response =
  {
  configuration_recorders_status: configuration_recorder_status_list option
    [@ocaml.doc "A list that contains status of the specified recorders.\n"]}
[@@ocaml.doc
  "The output for the [DescribeConfigurationRecorderStatus] action, in JSON format.\n"]
type nonrec configuration_recorder_name_list = recorder_name list[@@ocaml.doc
                                                                   ""]
type nonrec describe_configuration_recorder_status_request =
  {
  arn: amazon_resource_name option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the configuration recorder that you want to specify.\n"];
  service_principal: service_principal option
    [@ocaml.doc
      "For service-linked configuration recorders, you can use the service principal of the linked Amazon Web Services service to specify the configuration recorder.\n"];
  configuration_recorder_names: configuration_recorder_name_list option
    [@ocaml.doc
      "The name of the configuration recorder. If the name is not specified, the opertation returns the status for the customer managed configuration recorder configured for the account, if applicable.\n\n  When making a request to this operation, you can only specify one configuration recorder.\n  \n   "]}
[@@ocaml.doc
  "The input for the [DescribeConfigurationRecorderStatus] action.\n"]
type nonrec configuration_recorder_list = configuration_recorder list
[@@ocaml.doc ""]
type nonrec describe_configuration_recorders_response =
  {
  configuration_recorders: configuration_recorder_list option
    [@ocaml.doc
      "A list that contains the descriptions of the specified configuration recorders.\n"]}
[@@ocaml.doc "The output for the [DescribeConfigurationRecorders] action.\n"]
type nonrec describe_configuration_recorders_request =
  {
  arn: amazon_resource_name option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the configuration recorder that you want to specify.\n"];
  service_principal: service_principal option
    [@ocaml.doc
      "For service-linked configuration recorders, you can use the service principal of the linked Amazon Web Services service to specify the configuration recorder.\n"];
  configuration_recorder_names: configuration_recorder_name_list option
    [@ocaml.doc
      "A list of names of the configuration recorders that you want to specify.\n"]}
[@@ocaml.doc "The input for the [DescribeConfigurationRecorders] action.\n"]
type nonrec aggregated_source_type =
  | ORGANIZATION [@ocaml.doc ""]
  | ACCOUNT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec aggregated_source_status_type =
  | OUTDATED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec aggregated_source_status =
  {
  last_error_message: string_ option
    [@ocaml.doc
      "The message indicating that the source account aggregation failed due to an error.\n"];
  last_error_code: string_ option
    [@ocaml.doc
      "The error code that Config returned when the source account aggregation last failed.\n"];
  last_update_time: date option [@ocaml.doc "The time of the last update.\n"];
  last_update_status: aggregated_source_status_type option
    [@ocaml.doc
      "Filters the last updated status type.\n\n {ul\n       {-  Valid value FAILED indicates errors while moving data.\n           \n            }\n       {-  Valid value SUCCEEDED indicates the data was successfully moved.\n           \n            }\n       {-  Valid value OUTDATED indicates the data is not the most recent.\n           \n            }\n       }\n  "];
  aws_region: aws_region option
    [@ocaml.doc "The region authorized to collect aggregated data.\n"];
  source_type: aggregated_source_type option
    [@ocaml.doc "The source account or an organization.\n"];
  source_id: string_ option
    [@ocaml.doc "The source account ID or an organization.\n"]}[@@ocaml.doc
                                                                 "The current sync status between the source and the aggregator account.\n"]
type nonrec aggregated_source_status_list = aggregated_source_status list
[@@ocaml.doc ""]
type nonrec describe_configuration_aggregator_sources_status_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  aggregated_source_status_list: aggregated_source_status_list option
    [@ocaml.doc "Returns an AggregatedSourceStatus object. \n"]}[@@ocaml.doc
                                                                  ""]
type nonrec aggregated_source_status_type_list =
  aggregated_source_status_type list[@@ocaml.doc ""]
type nonrec describe_configuration_aggregator_sources_status_request =
  {
  limit: limit option
    [@ocaml.doc
      "The maximum number of AggregatorSourceStatus returned on each page. The default is maximum. If you specify 0, Config uses the default.\n"];
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  update_status: aggregated_source_status_type_list option
    [@ocaml.doc
      "Filters the status type.\n\n {ul\n       {-  Valid value FAILED indicates errors while moving data.\n           \n            }\n       {-  Valid value SUCCEEDED indicates the data was successfully moved.\n           \n            }\n       {-  Valid value OUTDATED indicates the data is not the most recent.\n           \n            }\n       }\n  "];
  configuration_aggregator_name: configuration_aggregator_name
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec configuration_aggregator_list = configuration_aggregator list
[@@ocaml.doc ""]
type nonrec describe_configuration_aggregators_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  configuration_aggregators: configuration_aggregator_list option
    [@ocaml.doc "Returns a ConfigurationAggregators object.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec configuration_aggregator_name_list =
  configuration_aggregator_name list[@@ocaml.doc ""]
type nonrec describe_configuration_aggregators_request =
  {
  limit: limit option
    [@ocaml.doc
      "The maximum number of configuration aggregators returned on each page. The default is maximum. If you specify 0, Config uses the default.\n"];
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  configuration_aggregator_names: configuration_aggregator_name_list option
    [@ocaml.doc "The name of the configuration aggregators.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec config_rules = config_rule list[@@ocaml.doc ""]
type nonrec describe_config_rules_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  config_rules: config_rules option
    [@ocaml.doc "The details about your Config rules.\n"]}[@@ocaml.doc "\n"]
type nonrec describe_config_rules_filters =
  {
  evaluation_mode: evaluation_mode option
    [@ocaml.doc
      "The mode of an evaluation. The valid values are Detective or Proactive.\n"]}
[@@ocaml.doc
  "Returns a filtered list of Detective or Proactive Config rules. By default, if the filter is not defined, this API returns an unfiltered list. For more information on Detective or Proactive Config rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config-rules.html} {b Evaluation Mode} } in the {i Config Developer Guide}.\n"]
type nonrec describe_config_rules_request =
  {
  filters: describe_config_rules_filters option
    [@ocaml.doc
      "Returns a list of Detective or Proactive Config rules. By default, this API returns an unfiltered list. For more information on Detective or Proactive Config rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config-rules.html} {b Evaluation Mode} } in the {i Config Developer Guide}.\n"];
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  config_rule_names: config_rule_names option
    [@ocaml.doc
      "The names of the Config rules for which you want details. If you do not specify any names, Config returns details for all your rules.\n"]}
[@@ocaml.doc "\n"]
type nonrec config_rule_evaluation_status =
  {
  last_debug_log_delivery_time: date option
    [@ocaml.doc
      "The time Config last attempted to deliver a debug log for your Config Custom Policy rules.\n"];
  last_debug_log_delivery_status_reason: string_ option
    [@ocaml.doc
      "The reason Config was not able to deliver a debug log. This is for the last failed attempt to retrieve a debug log for your Config Custom Policy rules.\n"];
  last_debug_log_delivery_status: string_ option
    [@ocaml.doc
      "The status of the last attempted delivery of a debug log for your Config Custom Policy rules. Either [Successful] or [Failed].\n"];
  first_evaluation_started: boolean_ option
    [@ocaml.doc
      "Indicates whether Config has evaluated your resources against the rule at least once.\n\n {ul\n       {-   [true] - Config has evaluated your Amazon Web Services resources against the rule at least once.\n           \n            }\n       {-   [false] - Config has not finished evaluating your Amazon Web Services resources against the rule at least once.\n           \n            }\n       }\n  "];
  last_error_message: string_ option
    [@ocaml.doc
      "The error message that Config returned when the rule last failed.\n"];
  last_error_code: string_ option
    [@ocaml.doc
      "The error code that Config returned when the rule last failed.\n"];
  last_deactivated_time: date option
    [@ocaml.doc "The time that you last turned off the Config rule.\n"];
  first_activated_time: date option
    [@ocaml.doc "The time that you first activated the Config rule.\n"];
  last_failed_evaluation_time: date option
    [@ocaml.doc
      "The time that Config last failed to evaluate your Amazon Web Services resources against the rule.\n"];
  last_successful_evaluation_time: date option
    [@ocaml.doc
      "The time that Config last successfully evaluated your Amazon Web Services resources against the rule.\n"];
  last_failed_invocation_time: date option
    [@ocaml.doc
      "The time that Config last failed to invoke the Config rule to evaluate your Amazon Web Services resources.\n"];
  last_successful_invocation_time: date option
    [@ocaml.doc
      "The time that Config last successfully invoked the Config rule to evaluate your Amazon Web Services resources.\n"];
  config_rule_id: string_ option [@ocaml.doc "The ID of the Config rule.\n"];
  config_rule_arn: string_ option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the Config rule.\n"];
  config_rule_name: config_rule_name option
    [@ocaml.doc "The name of the Config rule.\n"]}[@@ocaml.doc
                                                    "Status information for your Config Managed rules and Config Custom Policy rules. The status includes information such as the last time the rule ran, the last time it failed, and the related error for the last failure.\n\n This operation does not return status information about Config Custom Lambda rules.\n "]
type nonrec config_rule_evaluation_status_list =
  config_rule_evaluation_status list[@@ocaml.doc ""]
type nonrec describe_config_rule_evaluation_status_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  config_rules_evaluation_status: config_rule_evaluation_status_list option
    [@ocaml.doc "Status information about your Config managed rules.\n"]}
[@@ocaml.doc "\n"]
type nonrec rule_limit = int[@@ocaml.doc ""]
type nonrec describe_config_rule_evaluation_status_request =
  {
  limit: rule_limit option
    [@ocaml.doc
      "The number of rule evaluation results that you want returned.\n\n This parameter is required if the rule limit for your account is more than the default of 1000 rules.\n \n  For information about requesting a rule limit increase, see {{:http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_config}Config Limits} in the {i Amazon Web Services General Reference Guide}.\n  "];
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  config_rule_names: config_rule_names option
    [@ocaml.doc
      "The name of the Config managed rules for which you want status information. If you do not specify any names, Config returns status information for all Config managed rules that you use.\n"]}
[@@ocaml.doc "\n"]
type nonrec compliance =
  {
  compliance_contributor_count: compliance_contributor_count option
    [@ocaml.doc
      "The number of Amazon Web Services resources or Config rules that cause a result of [NON_COMPLIANT], up to a maximum number.\n"];
  compliance_type: compliance_type option
    [@ocaml.doc
      "Indicates whether an Amazon Web Services resource or Config rule is compliant.\n\n A resource is compliant if it complies with all of the Config rules that evaluate it. A resource is noncompliant if it does not comply with one or more of these rules.\n \n  A rule is compliant if all of the resources that the rule evaluates comply with it. A rule is noncompliant if any of these resources do not comply.\n  \n   Config returns the [INSUFFICIENT_DATA] value when no evaluation results are available for the Amazon Web Services resource or Config rule.\n   \n    For the [Compliance] data type, Config supports only [COMPLIANT], [NON_COMPLIANT], and [INSUFFICIENT_DATA] values. Config does not support the [NOT_APPLICABLE] value for the [Compliance] data type.\n    "]}
[@@ocaml.doc
  "Indicates whether an Amazon Web Services resource or Config rule is compliant and provides the number of contributors that affect the compliance.\n"]
type nonrec compliance_by_resource =
  {
  compliance: compliance option
    [@ocaml.doc
      "Indicates whether the Amazon Web Services resource complies with all of the Config rules that evaluated it.\n"];
  resource_id: base_resource_id option
    [@ocaml.doc
      "The ID of the Amazon Web Services resource that was evaluated.\n"];
  resource_type: string_with_char_limit256 option
    [@ocaml.doc
      "The type of the Amazon Web Services resource that was evaluated.\n"]}
[@@ocaml.doc
  "Indicates whether an Amazon Web Services resource that is evaluated according to one or more Config rules is compliant. A resource is compliant if it complies with all of the rules that evaluate it. A resource is noncompliant if it does not comply with one or more of these rules.\n"]
type nonrec compliance_by_resources = compliance_by_resource list[@@ocaml.doc
                                                                   ""]
type nonrec describe_compliance_by_resource_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  compliance_by_resources: compliance_by_resources option
    [@ocaml.doc
      "Indicates whether the specified Amazon Web Services resource complies with all of the Config rules that evaluate it.\n"]}
[@@ocaml.doc "\n"]
type nonrec describe_compliance_by_resource_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: limit option
    [@ocaml.doc
      "The maximum number of evaluation results returned on each page. The default is 10. You cannot specify a number greater than 100. If you specify 0, Config uses the default.\n"];
  compliance_types: compliance_types option
    [@ocaml.doc "Filters the results by compliance.\n"];
  resource_id: base_resource_id option
    [@ocaml.doc
      "The ID of the Amazon Web Services resource for which you want compliance information. You can specify only one resource ID. If you specify a resource ID, you must also specify a type for [ResourceType].\n"];
  resource_type: string_with_char_limit256 option
    [@ocaml.doc
      "The types of Amazon Web Services resources for which you want compliance information (for example, [AWS::EC2::Instance]). For this operation, you can specify that the resource type is an Amazon Web Services account by specifying [AWS::::Account].\n"]}
[@@ocaml.doc "\n"]
type nonrec compliance_by_config_rule =
  {
  compliance: compliance option
    [@ocaml.doc "Indicates whether the Config rule is compliant.\n"];
  config_rule_name: string_with_char_limit64 option
    [@ocaml.doc "The name of the Config rule.\n"]}[@@ocaml.doc
                                                    "Indicates whether an Config rule is compliant. A rule is compliant if all of the resources that the rule evaluated comply with it. A rule is noncompliant if any of these resources do not comply.\n"]
type nonrec compliance_by_config_rules = compliance_by_config_rule list
[@@ocaml.doc ""]
type nonrec describe_compliance_by_config_rule_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  compliance_by_config_rules: compliance_by_config_rules option
    [@ocaml.doc
      "Indicates whether each of the specified Config rules is compliant.\n"]}
[@@ocaml.doc "\n"]
type nonrec describe_compliance_by_config_rule_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  compliance_types: compliance_types option
    [@ocaml.doc "Filters the results by compliance.\n"];
  config_rule_names: config_rule_names option
    [@ocaml.doc
      "Specify one or more Config rule names to filter the results by rule.\n"]}
[@@ocaml.doc "\n"]
type nonrec aggregation_authorization_list = aggregation_authorization list
[@@ocaml.doc ""]
type nonrec describe_aggregation_authorizations_response =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  aggregation_authorizations: aggregation_authorization_list option
    [@ocaml.doc
      "Returns a list of authorizations granted to various aggregator accounts and regions.\n"]}
[@@ocaml.doc ""]
type nonrec describe_aggregation_authorizations_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: limit option
    [@ocaml.doc
      "The maximum number of AggregationAuthorizations returned on each page. The default is maximum. If you specify 0, Config uses the default.\n"]}
[@@ocaml.doc ""]
type nonrec aggregate_conformance_pack_compliance =
  {
  total_rule_count: integer option
    [@ocaml.doc
      "Total number of compliant rules, noncompliant rules, and the rules that do not have any applicable resources to evaluate upon resulting in insufficient data.\n"];
  non_compliant_rule_count: integer option
    [@ocaml.doc "The number of noncompliant Config Rules.\n"];
  compliant_rule_count: integer option
    [@ocaml.doc "The number of compliant Config Rules.\n"];
  compliance_type: conformance_pack_compliance_type option
    [@ocaml.doc "The compliance status of the conformance pack.\n"]}[@@ocaml.doc
                                                                    "Provides the number of compliant and noncompliant rules within a conformance pack. Also provides the compliance status of the conformance pack and the total rule count which includes compliant rules, noncompliant rules, and rules that cannot be evaluated due to insufficient data.\n\n A conformance pack is compliant if all of the rules in a conformance packs are compliant. It is noncompliant if any of the rules are not compliant. The compliance status of a conformance pack is INSUFFICIENT_DATA only if all rules within a conformance pack cannot be evaluated due to insufficient data. If some of the rules in a conformance pack are compliant but the compliance status of other rules in that same conformance pack is INSUFFICIENT_DATA, the conformance pack shows compliant.\n "]
type nonrec aggregate_compliance_by_conformance_pack =
  {
  aws_region: aws_region option
    [@ocaml.doc
      "The source Amazon Web Services Region from where the data is aggregated.\n"];
  account_id: account_id option
    [@ocaml.doc
      "The 12-digit Amazon Web Services account ID of the source account.\n"];
  compliance: aggregate_conformance_pack_compliance option
    [@ocaml.doc "The compliance status of the conformance pack.\n"];
  conformance_pack_name: conformance_pack_name option
    [@ocaml.doc "The name of the conformance pack.\n"]}[@@ocaml.doc
                                                         "Provides aggregate compliance of the conformance pack. Indicates whether a conformance pack is compliant based on the name of the conformance pack, account ID, and region.\n\n A conformance pack is compliant if all of the rules in a conformance packs are compliant. It is noncompliant if any of the rules are not compliant. The compliance status of a conformance pack is INSUFFICIENT_DATA only if all rules within a conformance pack cannot be evaluated due to insufficient data. If some of the rules in a conformance pack are compliant but the compliance status of other rules in that same conformance pack is INSUFFICIENT_DATA, the conformance pack shows compliant.\n "]
type nonrec aggregate_compliance_by_conformance_pack_list =
  aggregate_compliance_by_conformance_pack list[@@ocaml.doc ""]
type nonrec describe_aggregate_compliance_by_conformance_packs_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  aggregate_compliance_by_conformance_packs:
    aggregate_compliance_by_conformance_pack_list option
    [@ocaml.doc
      "Returns the [AggregateComplianceByConformancePack] object.\n"]}
[@@ocaml.doc ""]
type nonrec aggregate_conformance_pack_compliance_filters =
  {
  aws_region: aws_region option
    [@ocaml.doc
      "The source Amazon Web Services Region from where the data is aggregated.\n"];
  account_id: account_id option
    [@ocaml.doc
      "The 12-digit Amazon Web Services account ID of the source account.\n"];
  compliance_type: conformance_pack_compliance_type option
    [@ocaml.doc "The compliance status of the conformance pack.\n"];
  conformance_pack_name: conformance_pack_name option
    [@ocaml.doc "The name of the conformance pack.\n"]}[@@ocaml.doc
                                                         "Filters the conformance packs based on an account ID, region, compliance type, and the name of the conformance pack.\n"]
type nonrec describe_aggregate_compliance_by_conformance_packs_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: limit option
    [@ocaml.doc
      "The maximum number of conformance packs compliance details returned on each page. The default is maximum. If you specify 0, Config uses the default. \n"];
  filters: aggregate_conformance_pack_compliance_filters option
    [@ocaml.doc
      "Filters the result by [AggregateConformancePackComplianceFilters] object.\n"];
  configuration_aggregator_name: configuration_aggregator_name
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec aggregate_compliance_by_config_rule =
  {
  aws_region: aws_region option
    [@ocaml.doc "The source region from where the data is aggregated.\n"];
  account_id: account_id option
    [@ocaml.doc "The 12-digit account ID of the source account.\n"];
  compliance: compliance option
    [@ocaml.doc
      "Indicates whether an Amazon Web Services resource or Config rule is compliant and provides the number of contributors that affect the compliance.\n"];
  config_rule_name: config_rule_name option
    [@ocaml.doc "The name of the Config rule.\n"]}[@@ocaml.doc
                                                    "Indicates whether an Config rule is compliant based on account ID, region, compliance, and rule name.\n\n A rule is compliant if all of the resources that the rule evaluated comply with it. It is noncompliant if any of these resources do not comply.\n "]
type nonrec aggregate_compliance_by_config_rule_list =
  aggregate_compliance_by_config_rule list[@@ocaml.doc ""]
type nonrec describe_aggregate_compliance_by_config_rules_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  aggregate_compliance_by_config_rules:
    aggregate_compliance_by_config_rule_list option
    [@ocaml.doc
      "Returns a list of AggregateComplianceByConfigRule object.\n"]}
[@@ocaml.doc ""]
type nonrec config_rule_compliance_filters =
  {
  aws_region: aws_region option
    [@ocaml.doc "The source region where the data is aggregated. \n"];
  account_id: account_id option
    [@ocaml.doc "The 12-digit account ID of the source account. \n"];
  compliance_type: compliance_type option
    [@ocaml.doc
      "The rule compliance status.\n\n For the [ConfigRuleComplianceFilters] data type, Config supports only [COMPLIANT] and [NON_COMPLIANT]. Config does not support the [NOT_APPLICABLE] and the [INSUFFICIENT_DATA] values.\n "];
  config_rule_name: config_rule_name option
    [@ocaml.doc "The name of the Config rule.\n"]}[@@ocaml.doc
                                                    "Filters the compliance results based on account ID, region, compliance type, and rule name.\n"]
type nonrec describe_aggregate_compliance_by_config_rules_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: group_by_api_limit option
    [@ocaml.doc
      "The maximum number of evaluation results returned on each page. The default is maximum. If you specify 0, Config uses the default.\n"];
  filters: config_rule_compliance_filters option
    [@ocaml.doc
      "Filters the results by ConfigRuleComplianceFilters object. \n"];
  configuration_aggregator_name: configuration_aggregator_name
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec deliver_config_snapshot_response =
  {
  config_snapshot_id: string_ option
    [@ocaml.doc "The ID of the snapshot that is being created.\n"]}[@@ocaml.doc
                                                                    "The output for the [DeliverConfigSnapshot] action, in JSON format.\n"]
type nonrec deliver_config_snapshot_request =
  {
  delivery_channel_name: channel_name
    [@ocaml.doc
      "The name of the delivery channel through which the snapshot is delivered.\n"]}
[@@ocaml.doc "The input for the [DeliverConfigSnapshot] action.\n"]
type nonrec delete_stored_query_response = unit[@@ocaml.doc ""]
type nonrec delete_stored_query_request =
  {
  query_name: query_name
    [@ocaml.doc "The name of the query that you want to delete.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_service_linked_configuration_recorder_response =
  {
  name: recorder_name
    [@ocaml.doc "The name of the specified configuration recorder.\n"];
  arn: amazon_resource_name
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the specified configuration recorder.\n"]}
[@@ocaml.doc ""]
type nonrec delete_service_linked_configuration_recorder_request =
  {
  service_principal: service_principal
    [@ocaml.doc
      "The service principal of the Amazon Web Services service for the service-linked configuration recorder that you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_retention_configuration_request =
  {
  retention_configuration_name: retention_configuration_name
    [@ocaml.doc "The name of the retention configuration to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_resource_config_request =
  {
  resource_id: resource_id
    [@ocaml.doc "Unique identifier of the resource.\n"];
  resource_type: resource_type_string
    [@ocaml.doc "The type of the resource.\n"]}[@@ocaml.doc ""]
type nonrec no_such_remediation_exception_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You tried to delete a remediation exception that does not exist.\n"]
type nonrec failed_delete_remediation_exceptions_batch =
  {
  failed_items: remediation_exception_resource_keys option
    [@ocaml.doc
      "Returns remediation exception resource key object of the failed items.\n"];
  failure_message: string_ option
    [@ocaml.doc
      "Returns a failure message for delete remediation exception. For example, Config creates an exception due to an internal error.\n"]}
[@@ocaml.doc
  "List of each of the failed delete remediation exceptions with specific reasons.\n"]
type nonrec failed_delete_remediation_exceptions_batches =
  failed_delete_remediation_exceptions_batch list[@@ocaml.doc ""]
type nonrec delete_remediation_exceptions_response =
  {
  failed_batches: failed_delete_remediation_exceptions_batches option
    [@ocaml.doc
      "Returns a list of failed delete remediation exceptions batch objects. Each object in the batch consists of a list of failed items and failure messages.\n"]}
[@@ocaml.doc ""]
type nonrec delete_remediation_exceptions_request =
  {
  resource_keys: remediation_exception_resource_keys
    [@ocaml.doc
      "An exception list of resource exception keys to be processed with the current request. Config adds exception for each resource key. For example, Config adds 3 exceptions for 3 resource keys. \n"];
  config_rule_name: config_rule_name
    [@ocaml.doc
      "The name of the Config rule for which you want to delete remediation exception configuration.\n"]}
[@@ocaml.doc ""]
type nonrec remediation_in_progress_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "Remediation action is in progress. You can either cancel execution in Amazon Web Services Systems Manager or wait and try again later. \n"]
type nonrec delete_remediation_configuration_response = unit[@@ocaml.doc ""]
type nonrec delete_remediation_configuration_request =
  {
  resource_type: string_ option [@ocaml.doc "The type of a resource.\n"];
  config_rule_name: config_rule_name
    [@ocaml.doc
      "The name of the Config rule for which you want to delete remediation configuration.\n"]}
[@@ocaml.doc ""]
type nonrec delete_pending_aggregation_request_request =
  {
  requester_aws_region: aws_region
    [@ocaml.doc "The region requesting to aggregate data.\n"];
  requester_account_id: account_id
    [@ocaml.doc
      "The 12-digit account ID of the account requesting to aggregate data.\n"]}
[@@ocaml.doc ""]
type nonrec delete_organization_conformance_pack_request =
  {
  organization_conformance_pack_name: organization_conformance_pack_name
    [@ocaml.doc
      "The name of organization conformance pack that you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_organization_config_rule_request =
  {
  organization_config_rule_name: organization_config_rule_name
    [@ocaml.doc
      "The name of organization Config rule that you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_evaluation_results_response = unit[@@ocaml.doc ""]
type nonrec delete_evaluation_results_request =
  {
  config_rule_name: string_with_char_limit64
    [@ocaml.doc
      "The name of the Config rule for which you want to delete the evaluation results.\n"]}
[@@ocaml.doc "\n"]
type nonrec last_delivery_channel_delete_failed_exception =
  {
  message: error_message option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You cannot delete the delivery channel you specified because the customer managed configuration recorder is running.\n"]
type nonrec delete_delivery_channel_request =
  {
  delivery_channel_name: channel_name
    [@ocaml.doc
      "The name of the delivery channel that you want to delete.\n"]}
[@@ocaml.doc
  "The input for the [DeleteDeliveryChannel] action. The action accepts the following data, in JSON format. \n"]
type nonrec delete_conformance_pack_request =
  {
  conformance_pack_name: conformance_pack_name
    [@ocaml.doc "Name of the conformance pack you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_configuration_recorder_request =
  {
  configuration_recorder_name: recorder_name
    [@ocaml.doc
      "The name of the customer managed configuration recorder that you want to delete. You can retrieve the name of your configuration recorders by using the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DescribeConfigurationRecorders.html}DescribeConfigurationRecorders} operation.\n"]}
[@@ocaml.doc
  "The request object for the [DeleteConfigurationRecorder] operation.\n"]
type nonrec delete_configuration_aggregator_request =
  {
  configuration_aggregator_name: configuration_aggregator_name
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec delete_config_rule_request =
  {
  config_rule_name: config_rule_name
    [@ocaml.doc "The name of the Config rule that you want to delete.\n"]}
[@@ocaml.doc "\n"]
type nonrec delete_aggregation_authorization_request =
  {
  authorized_aws_region: aws_region
    [@ocaml.doc "The region authorized to collect aggregated data.\n"];
  authorized_account_id: account_id
    [@ocaml.doc
      "The 12-digit account ID of the account authorized to aggregate data.\n"]}
[@@ocaml.doc ""]
type nonrec base_configuration_item =
  {
  configuration_item_delivery_time: configuration_item_delivery_time option
    [@ocaml.doc
      "The time when configuration changes for the resource were delivered.\n\n  This field is optional and is not guaranteed to be present in a configuration item (CI). If you are using daily recording, this field will be populated. However, if you are using continuous recording, this field will be omitted since the delivery time is instantaneous as the CI is available right away. For more information on daily recording and continuous recording, see {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html#select-resources-recording-frequency}Recording Frequency} in the {i Config Developer Guide}.\n  \n   "];
  recording_frequency: recording_frequency option
    [@ocaml.doc
      "The recording frequency that Config uses to record configuration changes for the resource.\n"];
  supplementary_configuration: supplementary_configuration option
    [@ocaml.doc
      "Configuration attributes that Config returns for certain resource types to supplement the information returned for the configuration parameter.\n"];
  configuration: configuration option
    [@ocaml.doc "The description of the resource configuration.\n"];
  resource_creation_time: resource_creation_time option
    [@ocaml.doc "The time stamp when the resource was created.\n"];
  availability_zone: availability_zone option
    [@ocaml.doc "The Availability Zone associated with the resource.\n"];
  aws_region: aws_region option
    [@ocaml.doc "The region where the resource resides.\n"];
  resource_name: resource_name option
    [@ocaml.doc "The custom name of the resource, if available.\n"];
  resource_id: resource_id option
    [@ocaml.doc "The ID of the resource (for example., sg-xxxxxx).\n"];
  resource_type: resource_type option
    [@ocaml.doc "The type of Amazon Web Services resource.\n"];
  arn: ar_n option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"];
  configuration_state_id: configuration_state_id option
    [@ocaml.doc
      "An identifier that indicates the ordering of the configuration items of a resource.\n"];
  configuration_item_status: configuration_item_status option
    [@ocaml.doc
      "The configuration item status. Valid values include:\n\n {ul\n       {-  OK \226\128\147 The resource configuration has been updated.\n           \n            }\n       {-  ResourceDiscovered \226\128\147 The resource was newly discovered.\n           \n            }\n       {-  ResourceNotRecorded \226\128\147 The resource was discovered, but its configuration was not recorded since the recorder doesn't record resources of this type.\n           \n            }\n       {-  ResourceDeleted \226\128\147 The resource was deleted\n           \n            }\n       {-  ResourceDeletedNotRecorded \226\128\147 The resource was deleted, but its configuration was not recorded since the recorder doesn't record resources of this type.\n           \n            }\n       }\n  "];
  configuration_item_capture_time: configuration_item_capture_time option
    [@ocaml.doc
      "The time when the recording of configuration changes was initiated for the resource.\n"];
  account_id: account_id option
    [@ocaml.doc
      "The 12-digit Amazon Web Services account ID associated with the resource.\n"];
  version: version option
    [@ocaml.doc "The version number of the resource configuration.\n"]}
[@@ocaml.doc "The detailed configurations of a specified resource.\n"]
type nonrec base_configuration_items = base_configuration_item list[@@ocaml.doc
                                                                    ""]
type nonrec batch_get_resource_config_response =
  {
  unprocessed_resource_keys: resource_keys option
    [@ocaml.doc
      "A list of resource keys that were not processed with the current response. The unprocessesResourceKeys value is in the same form as ResourceKeys, so the value can be directly provided to a subsequent BatchGetResourceConfig operation. If there are no unprocessed resource keys, the response contains an empty unprocessedResourceKeys list. \n"];
  base_configuration_items: base_configuration_items option
    [@ocaml.doc
      "A list that contains the current configuration of one or more resources.\n"]}
[@@ocaml.doc ""]
type nonrec batch_get_resource_config_request =
  {
  resource_keys: resource_keys
    [@ocaml.doc
      "A list of resource keys to be processed with the current request. Each element in the list consists of the resource type and resource ID.\n"]}
[@@ocaml.doc ""]
type nonrec batch_get_aggregate_resource_config_response =
  {
  unprocessed_resource_identifiers:
    unprocessed_resource_identifier_list option
    [@ocaml.doc
      "A list of resource identifiers that were not processed with current scope. The list is empty if all the resources are processed.\n"];
  base_configuration_items: base_configuration_items option
    [@ocaml.doc
      "A list that contains the current configuration of one or more resources.\n"]}
[@@ocaml.doc ""]
type nonrec resource_identifiers_list = aggregate_resource_identifier list
[@@ocaml.doc ""]
type nonrec batch_get_aggregate_resource_config_request =
  {
  resource_identifiers: resource_identifiers_list
    [@ocaml.doc "A list of aggregate ResourceIdentifiers objects. \n"];
  configuration_aggregator_name: configuration_aggregator_name
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec associate_resource_types_response =
  {
  configuration_recorder: configuration_recorder [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
type nonrec associate_resource_types_request =
  {
  resource_types: resource_type_list
    [@ocaml.doc
      "The list of resource types you want to add to the recording group of the specified configuration recorder.\n"];
  configuration_recorder_arn: amazon_resource_name
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the specified configuration recorder.\n"]}
[@@ocaml.doc ""](** {1:builders Builders} *)

val make_untag_resource_request :
  tag_keys:tag_key_list ->
    resource_arn:amazon_resource_name -> unit -> untag_resource_request
val make_aggregate_resource_identifier :
  ?resource_name:resource_name ->
    resource_type:resource_type ->
      resource_id:resource_id ->
        source_region:aws_region ->
          source_account_id:account_id ->
            unit -> aggregate_resource_identifier
val make_time_window :
  ?end_time:date -> ?start_time:date -> unit -> time_window
val make_template_ssm_document_details :
  ?document_version:ssm_document_version ->
    document_name:ssm_document_name -> unit -> template_ssm_document_details
val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag
val make_tag_resource_request :
  tags:tag_list ->
    resource_arn:amazon_resource_name -> unit -> tag_resource_request
val make_stored_query_metadata :
  ?description:query_description ->
    query_name:query_name ->
      query_arn:query_arn ->
        query_id:query_id -> unit -> stored_query_metadata
val make_stored_query :
  ?expression:query_expression ->
    ?description:query_description ->
      ?query_arn:query_arn ->
        ?query_id:query_id -> query_name:query_name -> unit -> stored_query
val make_stop_configuration_recorder_request :
  configuration_recorder_name:recorder_name ->
    unit -> stop_configuration_recorder_request
val make_status_detail_filters :
  ?member_account_rule_status:member_account_rule_status ->
    ?account_id:account_id -> unit -> status_detail_filters
val make_static_value :
  values:static_parameter_values -> unit -> static_value
val make_start_resource_evaluation_response :
  ?resource_evaluation_id:resource_evaluation_id ->
    unit -> start_resource_evaluation_response
val make_resource_details :
  ?resource_configuration_schema_type:resource_configuration_schema_type ->
    resource_configuration:resource_configuration ->
      resource_type:string_with_char_limit256 ->
        resource_id:base_resource_id -> unit -> resource_details
val make_evaluation_context :
  ?evaluation_context_identifier:evaluation_context_identifier ->
    unit -> evaluation_context
val make_start_resource_evaluation_request :
  ?client_token:client_token ->
    ?evaluation_timeout:evaluation_timeout ->
      ?evaluation_context:evaluation_context ->
        evaluation_mode:evaluation_mode ->
          resource_details:resource_details ->
            unit -> start_resource_evaluation_request
val make_resource_key :
  resource_id:resource_id ->
    resource_type:resource_type -> unit -> resource_key
val make_start_remediation_execution_response :
  ?failed_items:resource_keys ->
    ?failure_message:string_ -> unit -> start_remediation_execution_response
val make_start_remediation_execution_request :
  resource_keys:resource_keys ->
    config_rule_name:config_rule_name ->
      unit -> start_remediation_execution_request
val make_start_configuration_recorder_request :
  configuration_recorder_name:recorder_name ->
    unit -> start_configuration_recorder_request
val make_start_config_rules_evaluation_response : unit -> unit
val make_start_config_rules_evaluation_request :
  ?config_rule_names:reevaluate_config_rule_names ->
    unit -> start_config_rules_evaluation_request
val make_field_info : ?name:field_name -> unit -> field_info
val make_query_info : ?select_fields:field_info_list -> unit -> query_info
val make_select_resource_config_response :
  ?next_token:next_token ->
    ?query_info:query_info ->
      ?results:results -> unit -> select_resource_config_response
val make_select_resource_config_request :
  ?next_token:next_token ->
    ?limit:limit ->
      expression:expression -> unit -> select_resource_config_request
val make_select_aggregate_resource_config_response :
  ?next_token:next_token ->
    ?query_info:query_info ->
      ?results:results -> unit -> select_aggregate_resource_config_response
val make_select_aggregate_resource_config_request :
  ?next_token:next_token ->
    ?max_results:limit ->
      ?limit:limit ->
        configuration_aggregator_name:configuration_aggregator_name ->
          expression:expression ->
            unit -> select_aggregate_resource_config_request
val make_put_stored_query_response :
  ?query_arn:query_arn -> unit -> put_stored_query_response
val make_put_stored_query_request :
  ?tags:tags_list ->
    stored_query:stored_query -> unit -> put_stored_query_request
val make_put_service_linked_configuration_recorder_response :
  ?name:recorder_name ->
    ?arn:amazon_resource_name ->
      unit -> put_service_linked_configuration_recorder_response
val make_put_service_linked_configuration_recorder_request :
  ?tags:tags_list ->
    service_principal:service_principal ->
      unit -> put_service_linked_configuration_recorder_request
val make_retention_configuration :
  retention_period_in_days:retention_period_in_days ->
    name:retention_configuration_name -> unit -> retention_configuration
val make_put_retention_configuration_response :
  ?retention_configuration:retention_configuration ->
    unit -> put_retention_configuration_response
val make_put_retention_configuration_request :
  retention_period_in_days:retention_period_in_days ->
    unit -> put_retention_configuration_request
val make_put_resource_config_request :
  ?tags:tags ->
    ?resource_name:resource_name ->
      configuration:configuration ->
        resource_id:resource_id ->
          schema_version_id:schema_version_id ->
            resource_type:resource_type_string ->
              unit -> put_resource_config_request
val make_remediation_exception :
  ?expiration_time:date ->
    ?message:string_with_char_limit1024 ->
      resource_id:string_with_char_limit1024 ->
        resource_type:string_with_char_limit256 ->
          config_rule_name:config_rule_name -> unit -> remediation_exception
val make_failed_remediation_exception_batch :
  ?failed_items:remediation_exceptions ->
    ?failure_message:string_ -> unit -> failed_remediation_exception_batch
val make_put_remediation_exceptions_response :
  ?failed_batches:failed_remediation_exception_batches ->
    unit -> put_remediation_exceptions_response
val make_remediation_exception_resource_key :
  ?resource_id:string_with_char_limit1024 ->
    ?resource_type:string_with_char_limit256 ->
      unit -> remediation_exception_resource_key
val make_put_remediation_exceptions_request :
  ?expiration_time:date ->
    ?message:string_with_char_limit1024 ->
      resource_keys:remediation_exception_resource_keys ->
        config_rule_name:config_rule_name ->
          unit -> put_remediation_exceptions_request
val make_resource_value : value:resource_value_type -> unit -> resource_value
val make_remediation_parameter_value :
  ?static_value:static_value ->
    ?resource_value:resource_value -> unit -> remediation_parameter_value
val make_ssm_controls :
  ?error_percentage:percentage ->
    ?concurrent_execution_rate_percentage:percentage -> unit -> ssm_controls
val make_execution_controls :
  ?ssm_controls:ssm_controls -> unit -> execution_controls
val make_remediation_configuration :
  ?created_by_service:string_with_char_limit1024 ->
    ?arn:string_with_char_limit1024 ->
      ?retry_attempt_seconds:auto_remediation_attempt_seconds ->
        ?maximum_automatic_attempts:auto_remediation_attempts ->
          ?execution_controls:execution_controls ->
            ?automatic:boolean_ ->
              ?resource_type:string_ ->
                ?parameters:remediation_parameters ->
                  ?target_version:string_ ->
                    target_id:string_with_char_limit256 ->
                      target_type:remediation_target_type ->
                        config_rule_name:config_rule_name ->
                          unit -> remediation_configuration
val make_failed_remediation_batch :
  ?failed_items:remediation_configurations ->
    ?failure_message:string_ -> unit -> failed_remediation_batch
val make_put_remediation_configurations_response :
  ?failed_batches:failed_remediation_batches ->
    unit -> put_remediation_configurations_response
val make_put_remediation_configurations_request :
  remediation_configurations:remediation_configurations ->
    unit -> put_remediation_configurations_request
val make_put_organization_conformance_pack_response :
  ?organization_conformance_pack_arn:string_with_char_limit256 ->
    unit -> put_organization_conformance_pack_response
val make_conformance_pack_input_parameter :
  parameter_value:parameter_value ->
    parameter_name:parameter_name -> unit -> conformance_pack_input_parameter
val make_put_organization_conformance_pack_request :
  ?excluded_accounts:excluded_accounts ->
    ?conformance_pack_input_parameters:conformance_pack_input_parameters ->
      ?delivery_s3_key_prefix:delivery_s3_key_prefix ->
        ?delivery_s3_bucket:delivery_s3_bucket ->
          ?template_body:template_body ->
            ?template_s3_uri:template_s3_uri ->
              organization_conformance_pack_name:organization_conformance_pack_name
                -> unit -> put_organization_conformance_pack_request
val make_put_organization_config_rule_response :
  ?organization_config_rule_arn:string_with_char_limit256 ->
    unit -> put_organization_config_rule_response
val make_organization_managed_rule_metadata :
  ?tag_value_scope:string_with_char_limit256 ->
    ?tag_key_scope:string_with_char_limit128 ->
      ?resource_id_scope:string_with_char_limit768 ->
        ?resource_types_scope:resource_types_scope ->
          ?maximum_execution_frequency:maximum_execution_frequency ->
            ?input_parameters:string_with_char_limit2048 ->
              ?description:string_with_char_limit256_min0 ->
                rule_identifier:string_with_char_limit256 ->
                  unit -> organization_managed_rule_metadata
val make_organization_custom_rule_metadata :
  ?tag_value_scope:string_with_char_limit256 ->
    ?tag_key_scope:string_with_char_limit128 ->
      ?resource_id_scope:string_with_char_limit768 ->
        ?resource_types_scope:resource_types_scope ->
          ?maximum_execution_frequency:maximum_execution_frequency ->
            ?input_parameters:string_with_char_limit2048 ->
              ?description:string_with_char_limit256_min0 ->
                organization_config_rule_trigger_types:organization_config_rule_trigger_types
                  ->
                  lambda_function_arn:string_with_char_limit256 ->
                    unit -> organization_custom_rule_metadata
val make_organization_custom_policy_rule_metadata :
  ?debug_log_delivery_accounts:debug_log_delivery_accounts ->
    ?tag_value_scope:string_with_char_limit256 ->
      ?tag_key_scope:string_with_char_limit128 ->
        ?resource_id_scope:string_with_char_limit768 ->
          ?resource_types_scope:resource_types_scope ->
            ?maximum_execution_frequency:maximum_execution_frequency ->
              ?input_parameters:string_with_char_limit2048 ->
                ?organization_config_rule_trigger_types:organization_config_rule_trigger_type_no_s_ns
                  ->
                  ?description:string_with_char_limit256_min0 ->
                    policy_text:policy_text ->
                      policy_runtime:policy_runtime ->
                        unit -> organization_custom_policy_rule_metadata
val make_put_organization_config_rule_request :
  ?organization_custom_policy_rule_metadata:organization_custom_policy_rule_metadata
    ->
    ?excluded_accounts:excluded_accounts ->
      ?organization_custom_rule_metadata:organization_custom_rule_metadata ->
        ?organization_managed_rule_metadata:organization_managed_rule_metadata
          ->
          organization_config_rule_name:organization_config_rule_name ->
            unit -> put_organization_config_rule_request
val make_put_external_evaluation_response : unit -> unit
val make_external_evaluation :
  ?annotation:string_with_char_limit256 ->
    ordering_timestamp:ordering_timestamp ->
      compliance_type:compliance_type ->
        compliance_resource_id:base_resource_id ->
          compliance_resource_type:string_with_char_limit256 ->
            unit -> external_evaluation
val make_put_external_evaluation_request :
  external_evaluation:external_evaluation ->
    config_rule_name:config_rule_name ->
      unit -> put_external_evaluation_request
val make_evaluation :
  ?annotation:string_with_char_limit256 ->
    ordering_timestamp:ordering_timestamp ->
      compliance_type:compliance_type ->
        compliance_resource_id:base_resource_id ->
          compliance_resource_type:string_with_char_limit256 ->
            unit -> evaluation
val make_put_evaluations_response :
  ?failed_evaluations:evaluations -> unit -> put_evaluations_response
val make_put_evaluations_request :
  ?test_mode:boolean_ ->
    ?evaluations:evaluations ->
      result_token:string_ -> unit -> put_evaluations_request
val make_config_snapshot_delivery_properties :
  ?delivery_frequency:maximum_execution_frequency ->
    unit -> config_snapshot_delivery_properties
val make_delivery_channel :
  ?config_snapshot_delivery_properties:config_snapshot_delivery_properties ->
    ?sns_topic_ar_n:string_ ->
      ?s3_kms_key_arn:string_ ->
        ?s3_key_prefix:string_ ->
          ?s3_bucket_name:string_ ->
            ?name:channel_name -> unit -> delivery_channel
val make_put_delivery_channel_request :
  delivery_channel:delivery_channel -> unit -> put_delivery_channel_request
val make_put_conformance_pack_response :
  ?conformance_pack_arn:conformance_pack_arn ->
    unit -> put_conformance_pack_response
val make_put_conformance_pack_request :
  ?template_ssm_document_details:template_ssm_document_details ->
    ?conformance_pack_input_parameters:conformance_pack_input_parameters ->
      ?delivery_s3_key_prefix:delivery_s3_key_prefix ->
        ?delivery_s3_bucket:delivery_s3_bucket ->
          ?template_body:template_body ->
            ?template_s3_uri:template_s3_uri ->
              conformance_pack_name:conformance_pack_name ->
                unit -> put_conformance_pack_request
val make_exclusion_by_resource_types :
  ?resource_types:resource_type_list -> unit -> exclusion_by_resource_types
val make_recording_strategy :
  ?use_only:recording_strategy_type -> unit -> recording_strategy
val make_recording_group :
  ?recording_strategy:recording_strategy ->
    ?exclusion_by_resource_types:exclusion_by_resource_types ->
      ?resource_types:resource_type_list ->
        ?include_global_resource_types:include_global_resource_types ->
          ?all_supported:all_supported -> unit -> recording_group
val make_recording_mode_override :
  ?description:description ->
    recording_frequency:recording_frequency ->
      resource_types:recording_mode_resource_types_list ->
        unit -> recording_mode_override
val make_recording_mode :
  ?recording_mode_overrides:recording_mode_overrides ->
    recording_frequency:recording_frequency -> unit -> recording_mode
val make_configuration_recorder :
  ?service_principal:service_principal ->
    ?recording_scope:recording_scope ->
      ?recording_mode:recording_mode ->
        ?recording_group:recording_group ->
          ?role_ar_n:string_ ->
            ?name:recorder_name ->
              ?arn:amazon_resource_name -> unit -> configuration_recorder
val make_put_configuration_recorder_request :
  ?tags:tags_list ->
    configuration_recorder:configuration_recorder ->
      unit -> put_configuration_recorder_request
val make_account_aggregation_source :
  ?aws_regions:aggregator_region_list ->
    ?all_aws_regions:boolean_ ->
      account_ids:account_aggregation_source_account_list ->
        unit -> account_aggregation_source
val make_organization_aggregation_source :
  ?all_aws_regions:boolean_ ->
    ?aws_regions:aggregator_region_list ->
      role_arn:string_ -> unit -> organization_aggregation_source
val make_aggregator_filter_resource_type :
  ?value:resource_type_value_list ->
    ?type_:aggregator_filter_type -> unit -> aggregator_filter_resource_type
val make_aggregator_filter_service_principal :
  ?value:service_principal_value_list ->
    ?type_:aggregator_filter_type ->
      unit -> aggregator_filter_service_principal
val make_aggregator_filters :
  ?service_principal:aggregator_filter_service_principal ->
    ?resource_type:aggregator_filter_resource_type ->
      unit -> aggregator_filters
val make_configuration_aggregator :
  ?aggregator_filters:aggregator_filters ->
    ?created_by:string_with_char_limit256 ->
      ?last_updated_time:date ->
        ?creation_time:date ->
          ?organization_aggregation_source:organization_aggregation_source ->
            ?account_aggregation_sources:account_aggregation_source_list ->
              ?configuration_aggregator_arn:configuration_aggregator_arn ->
                ?configuration_aggregator_name:configuration_aggregator_name
                  -> unit -> configuration_aggregator
val make_put_configuration_aggregator_response :
  ?configuration_aggregator:configuration_aggregator ->
    unit -> put_configuration_aggregator_response
val make_put_configuration_aggregator_request :
  ?aggregator_filters:aggregator_filters ->
    ?tags:tags_list ->
      ?organization_aggregation_source:organization_aggregation_source ->
        ?account_aggregation_sources:account_aggregation_source_list ->
          configuration_aggregator_name:configuration_aggregator_name ->
            unit -> put_configuration_aggregator_request
val make_scope :
  ?compliance_resource_id:base_resource_id ->
    ?tag_value:string_with_char_limit256 ->
      ?tag_key:string_with_char_limit128 ->
        ?compliance_resource_types:compliance_resource_types -> unit -> scope
val make_source_detail :
  ?maximum_execution_frequency:maximum_execution_frequency ->
    ?message_type:message_type ->
      ?event_source:event_source -> unit -> source_detail
val make_custom_policy_details :
  ?enable_debug_log_delivery:boolean_ ->
    policy_text:policy_text ->
      policy_runtime:policy_runtime -> unit -> custom_policy_details
val make_source :
  ?custom_policy_details:custom_policy_details ->
    ?source_details:source_details ->
      ?source_identifier:string_with_char_limit256 ->
        owner:owner -> unit -> source
val make_evaluation_mode_configuration :
  ?mode:evaluation_mode -> unit -> evaluation_mode_configuration
val make_config_rule :
  ?evaluation_modes:evaluation_modes ->
    ?created_by:string_with_char_limit256 ->
      ?config_rule_state:config_rule_state ->
        ?maximum_execution_frequency:maximum_execution_frequency ->
          ?input_parameters:string_with_char_limit1024 ->
            ?scope:scope ->
              ?description:emptiable_string_with_char_limit256 ->
                ?config_rule_id:string_with_char_limit64 ->
                  ?config_rule_arn:string_with_char_limit256 ->
                    ?config_rule_name:config_rule_name ->
                      source:source -> unit -> config_rule
val make_put_config_rule_request :
  ?tags:tags_list ->
    config_rule:config_rule -> unit -> put_config_rule_request
val make_aggregation_authorization :
  ?creation_time:date ->
    ?authorized_aws_region:aws_region ->
      ?authorized_account_id:account_id ->
        ?aggregation_authorization_arn:string_ ->
          unit -> aggregation_authorization
val make_put_aggregation_authorization_response :
  ?aggregation_authorization:aggregation_authorization ->
    unit -> put_aggregation_authorization_response
val make_put_aggregation_authorization_request :
  ?tags:tags_list ->
    authorized_aws_region:aws_region ->
      authorized_account_id:account_id ->
        unit -> put_aggregation_authorization_request
val make_list_tags_for_resource_response :
  ?next_token:next_token ->
    ?tags:tag_list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  ?next_token:next_token ->
    ?limit:limit ->
      resource_arn:amazon_resource_name ->
        unit -> list_tags_for_resource_request
val make_list_stored_queries_response :
  ?next_token:string_ ->
    ?stored_query_metadata:stored_query_metadata_list ->
      unit -> list_stored_queries_response
val make_list_stored_queries_request :
  ?max_results:limit ->
    ?next_token:string_ -> unit -> list_stored_queries_request
val make_resource_evaluation :
  ?evaluation_start_timestamp:date ->
    ?evaluation_mode:evaluation_mode ->
      ?resource_evaluation_id:resource_evaluation_id ->
        unit -> resource_evaluation
val make_list_resource_evaluations_response :
  ?next_token:string_ ->
    ?resource_evaluations:resource_evaluations ->
      unit -> list_resource_evaluations_response
val make_resource_evaluation_filters :
  ?evaluation_context_identifier:evaluation_context_identifier ->
    ?time_window:time_window ->
      ?evaluation_mode:evaluation_mode -> unit -> resource_evaluation_filters
val make_list_resource_evaluations_request :
  ?next_token:string_ ->
    ?limit:list_resource_evaluations_page_item_limit ->
      ?filters:resource_evaluation_filters ->
        unit -> list_resource_evaluations_request
val make_resource_identifier :
  ?resource_deletion_time:resource_deletion_time ->
    ?resource_name:resource_name ->
      ?resource_id:resource_id ->
        ?resource_type:resource_type -> unit -> resource_identifier
val make_list_discovered_resources_response :
  ?next_token:next_token ->
    ?resource_identifiers:resource_identifier_list ->
      unit -> list_discovered_resources_response
val make_list_discovered_resources_request :
  ?next_token:next_token ->
    ?include_deleted_resources:boolean_ ->
      ?limit:limit ->
        ?resource_name:resource_name ->
          ?resource_ids:resource_id_list ->
            resource_type:resource_type ->
              unit -> list_discovered_resources_request
val make_conformance_pack_compliance_score :
  ?last_updated_time:last_updated_time ->
    ?conformance_pack_name:conformance_pack_name ->
      ?score:compliance_score -> unit -> conformance_pack_compliance_score
val make_list_conformance_pack_compliance_scores_response :
  ?next_token:next_token ->
    conformance_pack_compliance_scores:conformance_pack_compliance_scores ->
      unit -> list_conformance_pack_compliance_scores_response
val make_conformance_pack_compliance_scores_filters :
  conformance_pack_names:conformance_pack_name_filter ->
    unit -> conformance_pack_compliance_scores_filters
val make_list_conformance_pack_compliance_scores_request :
  ?next_token:next_token ->
    ?limit:page_size_limit ->
      ?sort_by:sort_by ->
        ?sort_order:sort_order ->
          ?filters:conformance_pack_compliance_scores_filters ->
            unit -> list_conformance_pack_compliance_scores_request
val make_configuration_recorder_summary :
  ?service_principal:service_principal ->
    recording_scope:recording_scope ->
      name:recorder_name ->
        arn:amazon_resource_name -> unit -> configuration_recorder_summary
val make_list_configuration_recorders_response :
  ?next_token:next_token ->
    configuration_recorder_summaries:configuration_recorder_summaries ->
      unit -> list_configuration_recorders_response
val make_configuration_recorder_filter :
  ?filter_value:configuration_recorder_filter_values ->
    ?filter_name:configuration_recorder_filter_name ->
      unit -> configuration_recorder_filter
val make_list_configuration_recorders_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?filters:configuration_recorder_filter_list ->
        unit -> list_configuration_recorders_request
val make_list_aggregate_discovered_resources_response :
  ?next_token:next_token ->
    ?resource_identifiers:discovered_resource_identifier_list ->
      unit -> list_aggregate_discovered_resources_response
val make_resource_filters :
  ?region:aws_region ->
    ?resource_name:resource_name ->
      ?resource_id:resource_id ->
        ?account_id:account_id -> unit -> resource_filters
val make_list_aggregate_discovered_resources_request :
  ?next_token:next_token ->
    ?limit:limit ->
      ?filters:resource_filters ->
        resource_type:resource_type ->
          configuration_aggregator_name:configuration_aggregator_name ->
            unit -> list_aggregate_discovered_resources_request
val make_get_stored_query_response :
  ?stored_query:stored_query -> unit -> get_stored_query_response
val make_get_stored_query_request :
  query_name:query_name -> unit -> get_stored_query_request
val make_evaluation_status :
  ?failure_reason:string_with_char_limit1024 ->
    status:resource_evaluation_status -> unit -> evaluation_status
val make_get_resource_evaluation_summary_response :
  ?resource_details:resource_details ->
    ?evaluation_context:evaluation_context ->
      ?compliance:compliance_type ->
        ?evaluation_start_timestamp:date ->
          ?evaluation_status:evaluation_status ->
            ?evaluation_mode:evaluation_mode ->
              ?resource_evaluation_id:resource_evaluation_id ->
                unit -> get_resource_evaluation_summary_response
val make_get_resource_evaluation_summary_request :
  resource_evaluation_id:resource_evaluation_id ->
    unit -> get_resource_evaluation_summary_request
val make_relationship :
  ?relationship_name:relationship_name ->
    ?resource_name:resource_name ->
      ?resource_id:resource_id ->
        ?resource_type:resource_type -> unit -> relationship
val make_configuration_item :
  ?configuration_item_delivery_time:configuration_item_delivery_time ->
    ?recording_frequency:recording_frequency ->
      ?supplementary_configuration:supplementary_configuration ->
        ?configuration:configuration ->
          ?relationships:relationship_list ->
            ?related_events:related_event_list ->
              ?tags:tags ->
                ?resource_creation_time:resource_creation_time ->
                  ?availability_zone:availability_zone ->
                    ?aws_region:aws_region ->
                      ?resource_name:resource_name ->
                        ?resource_id:resource_id ->
                          ?resource_type:resource_type ->
                            ?arn:ar_n ->
                              ?configuration_item_md5_hash:configuration_item_md5_hash
                                ->
                                ?configuration_state_id:configuration_state_id
                                  ->
                                  ?configuration_item_status:configuration_item_status
                                    ->
                                    ?configuration_item_capture_time:configuration_item_capture_time
                                      ->
                                      ?account_id:account_id ->
                                        ?version:version ->
                                          unit -> configuration_item
val make_get_resource_config_history_response :
  ?next_token:next_token ->
    ?configuration_items:configuration_item_list ->
      unit -> get_resource_config_history_response
val make_get_resource_config_history_request :
  ?next_token:next_token ->
    ?limit:limit ->
      ?chronological_order:chronological_order ->
        ?earlier_time:earlier_time ->
          ?later_time:later_time ->
            resource_id:resource_id ->
              resource_type:resource_type ->
                unit -> get_resource_config_history_request
val make_get_organization_custom_rule_policy_response :
  ?policy_text:policy_text ->
    unit -> get_organization_custom_rule_policy_response
val make_get_organization_custom_rule_policy_request :
  organization_config_rule_name:organization_config_rule_name ->
    unit -> get_organization_custom_rule_policy_request
val make_organization_conformance_pack_detailed_status :
  ?last_update_time:date ->
    ?error_message:string_ ->
      ?error_code:string_ ->
        status:organization_resource_detailed_status ->
          conformance_pack_name:string_with_char_limit256 ->
            account_id:account_id ->
              unit -> organization_conformance_pack_detailed_status
val make_get_organization_conformance_pack_detailed_status_response :
  ?next_token:string_ ->
    ?organization_conformance_pack_detailed_statuses:organization_conformance_pack_detailed_statuses
      -> unit -> get_organization_conformance_pack_detailed_status_response
val make_organization_resource_detailed_status_filters :
  ?status:organization_resource_detailed_status ->
    ?account_id:account_id ->
      unit -> organization_resource_detailed_status_filters
val make_get_organization_conformance_pack_detailed_status_request :
  ?next_token:string_ ->
    ?limit:cosmos_page_limit ->
      ?filters:organization_resource_detailed_status_filters ->
        organization_conformance_pack_name:organization_conformance_pack_name
          ->
          unit -> get_organization_conformance_pack_detailed_status_request
val make_member_account_status :
  ?last_update_time:date ->
    ?error_message:string_ ->
      ?error_code:string_ ->
        member_account_rule_status:member_account_rule_status ->
          config_rule_name:string_with_char_limit64 ->
            account_id:account_id -> unit -> member_account_status
val make_get_organization_config_rule_detailed_status_response :
  ?next_token:string_ ->
    ?organization_config_rule_detailed_status:organization_config_rule_detailed_status
      -> unit -> get_organization_config_rule_detailed_status_response
val make_get_organization_config_rule_detailed_status_request :
  ?next_token:string_ ->
    ?limit:cosmos_page_limit ->
      ?filters:status_detail_filters ->
        organization_config_rule_name:organization_config_rule_name ->
          unit -> get_organization_config_rule_detailed_status_request
val make_resource_count :
  ?count:long -> ?resource_type:resource_type -> unit -> resource_count
val make_get_discovered_resource_counts_response :
  ?next_token:next_token ->
    ?resource_counts:resource_counts ->
      ?total_discovered_resources:long ->
        unit -> get_discovered_resource_counts_response
val make_get_discovered_resource_counts_request :
  ?next_token:next_token ->
    ?limit:limit ->
      ?resource_types:resource_types ->
        unit -> get_discovered_resource_counts_request
val make_get_custom_rule_policy_response :
  ?policy_text:policy_text -> unit -> get_custom_rule_policy_response
val make_get_custom_rule_policy_request :
  ?config_rule_name:config_rule_name ->
    unit -> get_custom_rule_policy_request
val make_conformance_pack_compliance_summary :
  conformance_pack_compliance_status:conformance_pack_compliance_type ->
    conformance_pack_name:conformance_pack_name ->
      unit -> conformance_pack_compliance_summary
val make_get_conformance_pack_compliance_summary_response :
  ?next_token:next_token ->
    ?conformance_pack_compliance_summary_list:conformance_pack_compliance_summary_list
      -> unit -> get_conformance_pack_compliance_summary_response
val make_get_conformance_pack_compliance_summary_request :
  ?next_token:next_token ->
    ?limit:page_size_limit ->
      conformance_pack_names:conformance_pack_names_to_summarize_list ->
        unit -> get_conformance_pack_compliance_summary_request
val make_evaluation_result_qualifier :
  ?evaluation_mode:evaluation_mode ->
    ?resource_id:base_resource_id ->
      ?resource_type:string_with_char_limit256 ->
        ?config_rule_name:config_rule_name ->
          unit -> evaluation_result_qualifier
val make_evaluation_result_identifier :
  ?resource_evaluation_id:resource_evaluation_id ->
    ?ordering_timestamp:date ->
      ?evaluation_result_qualifier:evaluation_result_qualifier ->
        unit -> evaluation_result_identifier
val make_get_conformance_pack_compliance_details_response :
  ?next_token:next_token ->
    ?conformance_pack_rule_evaluation_results:conformance_pack_rule_evaluation_results_list
      ->
      conformance_pack_name:conformance_pack_name ->
        unit -> get_conformance_pack_compliance_details_response
val make_conformance_pack_evaluation_filters :
  ?resource_ids:conformance_pack_compliance_resource_ids ->
    ?resource_type:string_with_char_limit256 ->
      ?compliance_type:conformance_pack_compliance_type ->
        ?config_rule_names:conformance_pack_config_rule_names ->
          unit -> conformance_pack_evaluation_filters
val make_get_conformance_pack_compliance_details_request :
  ?next_token:next_token ->
    ?limit:get_conformance_pack_compliance_details_limit ->
      ?filters:conformance_pack_evaluation_filters ->
        conformance_pack_name:conformance_pack_name ->
          unit -> get_conformance_pack_compliance_details_request
val make_compliance_contributor_count :
  ?cap_exceeded:boolean_ ->
    ?capped_count:integer -> unit -> compliance_contributor_count
val make_compliance_summary :
  ?compliance_summary_timestamp:date ->
    ?non_compliant_resource_count:compliance_contributor_count ->
      ?compliant_resource_count:compliance_contributor_count ->
        unit -> compliance_summary
val make_compliance_summary_by_resource_type :
  ?compliance_summary:compliance_summary ->
    ?resource_type:string_with_char_limit256 ->
      unit -> compliance_summary_by_resource_type
val make_get_compliance_summary_by_resource_type_response :
  ?compliance_summaries_by_resource_type:compliance_summaries_by_resource_type
    -> unit -> get_compliance_summary_by_resource_type_response
val make_get_compliance_summary_by_resource_type_request :
  ?resource_types:resource_types ->
    unit -> get_compliance_summary_by_resource_type_request
val make_get_compliance_summary_by_config_rule_response :
  ?compliance_summary:compliance_summary ->
    unit -> get_compliance_summary_by_config_rule_response
val make_get_compliance_details_by_resource_response :
  ?next_token:string_ ->
    ?evaluation_results:evaluation_results ->
      unit -> get_compliance_details_by_resource_response
val make_get_compliance_details_by_resource_request :
  ?resource_evaluation_id:resource_evaluation_id ->
    ?next_token:string_ ->
      ?compliance_types:compliance_types ->
        ?resource_id:base_resource_id ->
          ?resource_type:string_with_char_limit256 ->
            unit -> get_compliance_details_by_resource_request
val make_get_compliance_details_by_config_rule_response :
  ?next_token:next_token ->
    ?evaluation_results:evaluation_results ->
      unit -> get_compliance_details_by_config_rule_response
val make_get_compliance_details_by_config_rule_request :
  ?next_token:next_token ->
    ?limit:limit ->
      ?compliance_types:compliance_types ->
        config_rule_name:string_with_char_limit64 ->
          unit -> get_compliance_details_by_config_rule_request
val make_get_aggregate_resource_config_response :
  ?configuration_item:configuration_item ->
    unit -> get_aggregate_resource_config_response
val make_get_aggregate_resource_config_request :
  resource_identifier:aggregate_resource_identifier ->
    configuration_aggregator_name:configuration_aggregator_name ->
      unit -> get_aggregate_resource_config_request
val make_grouped_resource_count :
  resource_count:long ->
    group_name:string_with_char_limit256 -> unit -> grouped_resource_count
val make_get_aggregate_discovered_resource_counts_response :
  ?next_token:next_token ->
    ?grouped_resource_counts:grouped_resource_count_list ->
      ?group_by_key:string_with_char_limit256 ->
        total_discovered_resources:long ->
          unit -> get_aggregate_discovered_resource_counts_response
val make_resource_count_filters :
  ?region:aws_region ->
    ?account_id:account_id ->
      ?resource_type:resource_type -> unit -> resource_count_filters
val make_get_aggregate_discovered_resource_counts_request :
  ?next_token:next_token ->
    ?limit:group_by_api_limit ->
      ?group_by_key:resource_count_group_key ->
        ?filters:resource_count_filters ->
          configuration_aggregator_name:configuration_aggregator_name ->
            unit -> get_aggregate_discovered_resource_counts_request
val make_aggregate_conformance_pack_compliance_count :
  ?non_compliant_conformance_pack_count:integer ->
    ?compliant_conformance_pack_count:integer ->
      unit -> aggregate_conformance_pack_compliance_count
val make_aggregate_conformance_pack_compliance_summary :
  ?group_name:string_with_char_limit256 ->
    ?compliance_summary:aggregate_conformance_pack_compliance_count ->
      unit -> aggregate_conformance_pack_compliance_summary
val make_get_aggregate_conformance_pack_compliance_summary_response :
  ?next_token:next_token ->
    ?group_by_key:string_with_char_limit256 ->
      ?aggregate_conformance_pack_compliance_summaries:aggregate_conformance_pack_compliance_summary_list
        -> unit -> get_aggregate_conformance_pack_compliance_summary_response
val make_aggregate_conformance_pack_compliance_summary_filters :
  ?aws_region:aws_region ->
    ?account_id:account_id ->
      unit -> aggregate_conformance_pack_compliance_summary_filters
val make_get_aggregate_conformance_pack_compliance_summary_request :
  ?next_token:next_token ->
    ?limit:limit ->
      ?group_by_key:aggregate_conformance_pack_compliance_summary_group_key
        ->
        ?filters:aggregate_conformance_pack_compliance_summary_filters ->
          configuration_aggregator_name:configuration_aggregator_name ->
            unit -> get_aggregate_conformance_pack_compliance_summary_request
val make_aggregate_compliance_count :
  ?compliance_summary:compliance_summary ->
    ?group_name:string_with_char_limit256 ->
      unit -> aggregate_compliance_count
val make_get_aggregate_config_rule_compliance_summary_response :
  ?next_token:next_token ->
    ?aggregate_compliance_counts:aggregate_compliance_count_list ->
      ?group_by_key:string_with_char_limit256 ->
        unit -> get_aggregate_config_rule_compliance_summary_response
val make_config_rule_compliance_summary_filters :
  ?aws_region:aws_region ->
    ?account_id:account_id -> unit -> config_rule_compliance_summary_filters
val make_get_aggregate_config_rule_compliance_summary_request :
  ?next_token:next_token ->
    ?limit:group_by_api_limit ->
      ?group_by_key:config_rule_compliance_summary_group_key ->
        ?filters:config_rule_compliance_summary_filters ->
          configuration_aggregator_name:configuration_aggregator_name ->
            unit -> get_aggregate_config_rule_compliance_summary_request
val make_get_aggregate_compliance_details_by_config_rule_response :
  ?next_token:next_token ->
    ?aggregate_evaluation_results:aggregate_evaluation_result_list ->
      unit -> get_aggregate_compliance_details_by_config_rule_response
val make_get_aggregate_compliance_details_by_config_rule_request :
  ?next_token:next_token ->
    ?limit:limit ->
      ?compliance_type:compliance_type ->
        aws_region:aws_region ->
          account_id:account_id ->
            config_rule_name:config_rule_name ->
              configuration_aggregator_name:configuration_aggregator_name ->
                unit ->
                  get_aggregate_compliance_details_by_config_rule_request
val make_disassociate_resource_types_response :
  configuration_recorder:configuration_recorder ->
    unit -> disassociate_resource_types_response
val make_disassociate_resource_types_request :
  resource_types:resource_type_list ->
    configuration_recorder_arn:amazon_resource_name ->
      unit -> disassociate_resource_types_request
val make_describe_retention_configurations_response :
  ?next_token:next_token ->
    ?retention_configurations:retention_configuration_list ->
      unit -> describe_retention_configurations_response
val make_describe_retention_configurations_request :
  ?next_token:next_token ->
    ?retention_configuration_names:retention_configuration_name_list ->
      unit -> describe_retention_configurations_request
val make_remediation_execution_step :
  ?stop_time:date ->
    ?start_time:date ->
      ?error_message:string_ ->
        ?state:remediation_execution_step_state ->
          ?name:string_ -> unit -> remediation_execution_step
val make_remediation_execution_status :
  ?last_updated_time:date ->
    ?invocation_time:date ->
      ?step_details:remediation_execution_steps ->
        ?state:remediation_execution_state ->
          ?resource_key:resource_key -> unit -> remediation_execution_status
val make_describe_remediation_execution_status_response :
  ?next_token:string_ ->
    ?remediation_execution_statuses:remediation_execution_statuses ->
      unit -> describe_remediation_execution_status_response
val make_describe_remediation_execution_status_request :
  ?next_token:string_ ->
    ?limit:limit ->
      ?resource_keys:resource_keys ->
        config_rule_name:config_rule_name ->
          unit -> describe_remediation_execution_status_request
val make_describe_remediation_exceptions_response :
  ?next_token:string_ ->
    ?remediation_exceptions:remediation_exceptions ->
      unit -> describe_remediation_exceptions_response
val make_describe_remediation_exceptions_request :
  ?next_token:string_ ->
    ?limit:limit ->
      ?resource_keys:remediation_exception_resource_keys ->
        config_rule_name:config_rule_name ->
          unit -> describe_remediation_exceptions_request
val make_describe_remediation_configurations_response :
  ?remediation_configurations:remediation_configurations ->
    unit -> describe_remediation_configurations_response
val make_describe_remediation_configurations_request :
  config_rule_names:config_rule_names ->
    unit -> describe_remediation_configurations_request
val make_pending_aggregation_request :
  ?requester_aws_region:aws_region ->
    ?requester_account_id:account_id -> unit -> pending_aggregation_request
val make_describe_pending_aggregation_requests_response :
  ?next_token:string_ ->
    ?pending_aggregation_requests:pending_aggregation_request_list ->
      unit -> describe_pending_aggregation_requests_response
val make_describe_pending_aggregation_requests_request :
  ?next_token:string_ ->
    ?limit:describe_pending_aggregation_requests_limit ->
      unit -> describe_pending_aggregation_requests_request
val make_organization_conformance_pack_status :
  ?last_update_time:date ->
    ?error_message:string_ ->
      ?error_code:string_ ->
        status:organization_resource_status ->
          organization_conformance_pack_name:organization_conformance_pack_name
            -> unit -> organization_conformance_pack_status
val make_describe_organization_conformance_pack_statuses_response :
  ?next_token:string_ ->
    ?organization_conformance_pack_statuses:organization_conformance_pack_statuses
      -> unit -> describe_organization_conformance_pack_statuses_response
val make_describe_organization_conformance_pack_statuses_request :
  ?next_token:string_ ->
    ?limit:cosmos_page_limit ->
      ?organization_conformance_pack_names:organization_conformance_pack_names
        -> unit -> describe_organization_conformance_pack_statuses_request
val make_organization_conformance_pack :
  ?excluded_accounts:excluded_accounts ->
    ?conformance_pack_input_parameters:conformance_pack_input_parameters ->
      ?delivery_s3_key_prefix:delivery_s3_key_prefix ->
        ?delivery_s3_bucket:delivery_s3_bucket ->
          last_update_time:date ->
            organization_conformance_pack_arn:string_with_char_limit256 ->
              organization_conformance_pack_name:organization_conformance_pack_name
                -> unit -> organization_conformance_pack
val make_describe_organization_conformance_packs_response :
  ?next_token:string_ ->
    ?organization_conformance_packs:organization_conformance_packs ->
      unit -> describe_organization_conformance_packs_response
val make_describe_organization_conformance_packs_request :
  ?next_token:string_ ->
    ?limit:cosmos_page_limit ->
      ?organization_conformance_pack_names:organization_conformance_pack_names
        -> unit -> describe_organization_conformance_packs_request
val make_organization_config_rule_status :
  ?last_update_time:date ->
    ?error_message:string_ ->
      ?error_code:string_ ->
        organization_rule_status:organization_rule_status ->
          organization_config_rule_name:organization_config_rule_name ->
            unit -> organization_config_rule_status
val make_describe_organization_config_rule_statuses_response :
  ?next_token:string_ ->
    ?organization_config_rule_statuses:organization_config_rule_statuses ->
      unit -> describe_organization_config_rule_statuses_response
val make_describe_organization_config_rule_statuses_request :
  ?next_token:string_ ->
    ?limit:cosmos_page_limit ->
      ?organization_config_rule_names:organization_config_rule_names ->
        unit -> describe_organization_config_rule_statuses_request
val make_organization_custom_policy_rule_metadata_no_policy :
  ?debug_log_delivery_accounts:debug_log_delivery_accounts ->
    ?policy_runtime:policy_runtime ->
      ?tag_value_scope:string_with_char_limit256 ->
        ?tag_key_scope:string_with_char_limit128 ->
          ?resource_id_scope:string_with_char_limit768 ->
            ?resource_types_scope:resource_types_scope ->
              ?maximum_execution_frequency:maximum_execution_frequency ->
                ?input_parameters:string_with_char_limit2048 ->
                  ?organization_config_rule_trigger_types:organization_config_rule_trigger_type_no_s_ns
                    ->
                    ?description:string_with_char_limit256_min0 ->
                      unit ->
                        organization_custom_policy_rule_metadata_no_policy
val make_organization_config_rule :
  ?organization_custom_policy_rule_metadata:organization_custom_policy_rule_metadata_no_policy
    ->
    ?last_update_time:date ->
      ?excluded_accounts:excluded_accounts ->
        ?organization_custom_rule_metadata:organization_custom_rule_metadata
          ->
          ?organization_managed_rule_metadata:organization_managed_rule_metadata
            ->
            organization_config_rule_arn:string_with_char_limit256 ->
              organization_config_rule_name:organization_config_rule_name ->
                unit -> organization_config_rule
val make_describe_organization_config_rules_response :
  ?next_token:string_ ->
    ?organization_config_rules:organization_config_rules ->
      unit -> describe_organization_config_rules_response
val make_describe_organization_config_rules_request :
  ?next_token:string_ ->
    ?limit:cosmos_page_limit ->
      ?organization_config_rule_names:organization_config_rule_names ->
        unit -> describe_organization_config_rules_request
val make_config_export_delivery_info :
  ?next_delivery_time:date ->
    ?last_successful_time:date ->
      ?last_attempt_time:date ->
        ?last_error_message:string_ ->
          ?last_error_code:string_ ->
            ?last_status:delivery_status ->
              unit -> config_export_delivery_info
val make_config_stream_delivery_info :
  ?last_status_change_time:date ->
    ?last_error_message:string_ ->
      ?last_error_code:string_ ->
        ?last_status:delivery_status -> unit -> config_stream_delivery_info
val make_delivery_channel_status :
  ?config_stream_delivery_info:config_stream_delivery_info ->
    ?config_history_delivery_info:config_export_delivery_info ->
      ?config_snapshot_delivery_info:config_export_delivery_info ->
        ?name:string_ -> unit -> delivery_channel_status
val make_describe_delivery_channel_status_response :
  ?delivery_channels_status:delivery_channel_status_list ->
    unit -> describe_delivery_channel_status_response
val make_describe_delivery_channel_status_request :
  ?delivery_channel_names:delivery_channel_name_list ->
    unit -> describe_delivery_channel_status_request
val make_describe_delivery_channels_response :
  ?delivery_channels:delivery_channel_list ->
    unit -> describe_delivery_channels_response
val make_describe_delivery_channels_request :
  ?delivery_channel_names:delivery_channel_name_list ->
    unit -> describe_delivery_channels_request
val make_conformance_pack_status_detail :
  ?last_update_completed_time:date ->
    ?conformance_pack_status_reason:conformance_pack_status_reason ->
      last_update_requested_time:date ->
        stack_arn:stack_arn ->
          conformance_pack_state:conformance_pack_state ->
            conformance_pack_arn:conformance_pack_arn ->
              conformance_pack_id:conformance_pack_id ->
                conformance_pack_name:conformance_pack_name ->
                  unit -> conformance_pack_status_detail
val make_describe_conformance_pack_status_response :
  ?next_token:next_token ->
    ?conformance_pack_status_details:conformance_pack_status_details_list ->
      unit -> describe_conformance_pack_status_response
val make_describe_conformance_pack_status_request :
  ?next_token:next_token ->
    ?limit:page_size_limit ->
      ?conformance_pack_names:conformance_pack_names_list ->
        unit -> describe_conformance_pack_status_request
val make_conformance_pack_detail :
  ?template_ssm_document_details:template_ssm_document_details ->
    ?created_by:string_with_char_limit256 ->
      ?last_update_requested_time:date ->
        ?conformance_pack_input_parameters:conformance_pack_input_parameters
          ->
          ?delivery_s3_key_prefix:delivery_s3_key_prefix ->
            ?delivery_s3_bucket:delivery_s3_bucket ->
              conformance_pack_id:conformance_pack_id ->
                conformance_pack_arn:conformance_pack_arn ->
                  conformance_pack_name:conformance_pack_name ->
                    unit -> conformance_pack_detail
val make_describe_conformance_packs_response :
  ?next_token:next_token ->
    ?conformance_pack_details:conformance_pack_detail_list ->
      unit -> describe_conformance_packs_response
val make_describe_conformance_packs_request :
  ?next_token:next_token ->
    ?limit:page_size_limit ->
      ?conformance_pack_names:conformance_pack_names_list ->
        unit -> describe_conformance_packs_request
val make_conformance_pack_rule_compliance :
  ?controls:controls_list ->
    ?compliance_type:conformance_pack_compliance_type ->
      ?config_rule_name:config_rule_name ->
        unit -> conformance_pack_rule_compliance
val make_describe_conformance_pack_compliance_response :
  ?next_token:next_token ->
    conformance_pack_rule_compliance_list:conformance_pack_rule_compliance_list
      ->
      conformance_pack_name:conformance_pack_name ->
        unit -> describe_conformance_pack_compliance_response
val make_conformance_pack_compliance_filters :
  ?compliance_type:conformance_pack_compliance_type ->
    ?config_rule_names:conformance_pack_config_rule_names ->
      unit -> conformance_pack_compliance_filters
val make_describe_conformance_pack_compliance_request :
  ?next_token:next_token ->
    ?limit:describe_conformance_pack_compliance_limit ->
      ?filters:conformance_pack_compliance_filters ->
        conformance_pack_name:conformance_pack_name ->
          unit -> describe_conformance_pack_compliance_request
val make_configuration_recorder_status :
  ?service_principal:service_principal ->
    ?last_status_change_time:date ->
      ?last_error_message:string_ ->
        ?last_error_code:string_ ->
          ?last_status:recorder_status ->
            ?recording:boolean_ ->
              ?last_stop_time:date ->
                ?last_start_time:date ->
                  ?name:string_ ->
                    ?arn:amazon_resource_name ->
                      unit -> configuration_recorder_status
val make_describe_configuration_recorder_status_response :
  ?configuration_recorders_status:configuration_recorder_status_list ->
    unit -> describe_configuration_recorder_status_response
val make_describe_configuration_recorder_status_request :
  ?arn:amazon_resource_name ->
    ?service_principal:service_principal ->
      ?configuration_recorder_names:configuration_recorder_name_list ->
        unit -> describe_configuration_recorder_status_request
val make_describe_configuration_recorders_response :
  ?configuration_recorders:configuration_recorder_list ->
    unit -> describe_configuration_recorders_response
val make_describe_configuration_recorders_request :
  ?arn:amazon_resource_name ->
    ?service_principal:service_principal ->
      ?configuration_recorder_names:configuration_recorder_name_list ->
        unit -> describe_configuration_recorders_request
val make_aggregated_source_status :
  ?last_error_message:string_ ->
    ?last_error_code:string_ ->
      ?last_update_time:date ->
        ?last_update_status:aggregated_source_status_type ->
          ?aws_region:aws_region ->
            ?source_type:aggregated_source_type ->
              ?source_id:string_ -> unit -> aggregated_source_status
val make_describe_configuration_aggregator_sources_status_response :
  ?next_token:string_ ->
    ?aggregated_source_status_list:aggregated_source_status_list ->
      unit -> describe_configuration_aggregator_sources_status_response
val make_describe_configuration_aggregator_sources_status_request :
  ?limit:limit ->
    ?next_token:string_ ->
      ?update_status:aggregated_source_status_type_list ->
        configuration_aggregator_name:configuration_aggregator_name ->
          unit -> describe_configuration_aggregator_sources_status_request
val make_describe_configuration_aggregators_response :
  ?next_token:string_ ->
    ?configuration_aggregators:configuration_aggregator_list ->
      unit -> describe_configuration_aggregators_response
val make_describe_configuration_aggregators_request :
  ?limit:limit ->
    ?next_token:string_ ->
      ?configuration_aggregator_names:configuration_aggregator_name_list ->
        unit -> describe_configuration_aggregators_request
val make_describe_config_rules_response :
  ?next_token:string_ ->
    ?config_rules:config_rules -> unit -> describe_config_rules_response
val make_describe_config_rules_filters :
  ?evaluation_mode:evaluation_mode -> unit -> describe_config_rules_filters
val make_describe_config_rules_request :
  ?filters:describe_config_rules_filters ->
    ?next_token:string_ ->
      ?config_rule_names:config_rule_names ->
        unit -> describe_config_rules_request
val make_config_rule_evaluation_status :
  ?last_debug_log_delivery_time:date ->
    ?last_debug_log_delivery_status_reason:string_ ->
      ?last_debug_log_delivery_status:string_ ->
        ?first_evaluation_started:boolean_ ->
          ?last_error_message:string_ ->
            ?last_error_code:string_ ->
              ?last_deactivated_time:date ->
                ?first_activated_time:date ->
                  ?last_failed_evaluation_time:date ->
                    ?last_successful_evaluation_time:date ->
                      ?last_failed_invocation_time:date ->
                        ?last_successful_invocation_time:date ->
                          ?config_rule_id:string_ ->
                            ?config_rule_arn:string_ ->
                              ?config_rule_name:config_rule_name ->
                                unit -> config_rule_evaluation_status
val make_describe_config_rule_evaluation_status_response :
  ?next_token:string_ ->
    ?config_rules_evaluation_status:config_rule_evaluation_status_list ->
      unit -> describe_config_rule_evaluation_status_response
val make_describe_config_rule_evaluation_status_request :
  ?limit:rule_limit ->
    ?next_token:string_ ->
      ?config_rule_names:config_rule_names ->
        unit -> describe_config_rule_evaluation_status_request
val make_compliance :
  ?compliance_contributor_count:compliance_contributor_count ->
    ?compliance_type:compliance_type -> unit -> compliance
val make_compliance_by_resource :
  ?compliance:compliance ->
    ?resource_id:base_resource_id ->
      ?resource_type:string_with_char_limit256 ->
        unit -> compliance_by_resource
val make_describe_compliance_by_resource_response :
  ?next_token:next_token ->
    ?compliance_by_resources:compliance_by_resources ->
      unit -> describe_compliance_by_resource_response
val make_describe_compliance_by_resource_request :
  ?next_token:next_token ->
    ?limit:limit ->
      ?compliance_types:compliance_types ->
        ?resource_id:base_resource_id ->
          ?resource_type:string_with_char_limit256 ->
            unit -> describe_compliance_by_resource_request
val make_compliance_by_config_rule :
  ?compliance:compliance ->
    ?config_rule_name:string_with_char_limit64 ->
      unit -> compliance_by_config_rule
val make_describe_compliance_by_config_rule_response :
  ?next_token:string_ ->
    ?compliance_by_config_rules:compliance_by_config_rules ->
      unit -> describe_compliance_by_config_rule_response
val make_describe_compliance_by_config_rule_request :
  ?next_token:string_ ->
    ?compliance_types:compliance_types ->
      ?config_rule_names:config_rule_names ->
        unit -> describe_compliance_by_config_rule_request
val make_describe_aggregation_authorizations_response :
  ?next_token:string_ ->
    ?aggregation_authorizations:aggregation_authorization_list ->
      unit -> describe_aggregation_authorizations_response
val make_describe_aggregation_authorizations_request :
  ?next_token:string_ ->
    ?limit:limit -> unit -> describe_aggregation_authorizations_request
val make_aggregate_conformance_pack_compliance :
  ?total_rule_count:integer ->
    ?non_compliant_rule_count:integer ->
      ?compliant_rule_count:integer ->
        ?compliance_type:conformance_pack_compliance_type ->
          unit -> aggregate_conformance_pack_compliance
val make_aggregate_compliance_by_conformance_pack :
  ?aws_region:aws_region ->
    ?account_id:account_id ->
      ?compliance:aggregate_conformance_pack_compliance ->
        ?conformance_pack_name:conformance_pack_name ->
          unit -> aggregate_compliance_by_conformance_pack
val make_describe_aggregate_compliance_by_conformance_packs_response :
  ?next_token:next_token ->
    ?aggregate_compliance_by_conformance_packs:aggregate_compliance_by_conformance_pack_list
      -> unit -> describe_aggregate_compliance_by_conformance_packs_response
val make_aggregate_conformance_pack_compliance_filters :
  ?aws_region:aws_region ->
    ?account_id:account_id ->
      ?compliance_type:conformance_pack_compliance_type ->
        ?conformance_pack_name:conformance_pack_name ->
          unit -> aggregate_conformance_pack_compliance_filters
val make_describe_aggregate_compliance_by_conformance_packs_request :
  ?next_token:next_token ->
    ?limit:limit ->
      ?filters:aggregate_conformance_pack_compliance_filters ->
        configuration_aggregator_name:configuration_aggregator_name ->
          unit -> describe_aggregate_compliance_by_conformance_packs_request
val make_aggregate_compliance_by_config_rule :
  ?aws_region:aws_region ->
    ?account_id:account_id ->
      ?compliance:compliance ->
        ?config_rule_name:config_rule_name ->
          unit -> aggregate_compliance_by_config_rule
val make_describe_aggregate_compliance_by_config_rules_response :
  ?next_token:next_token ->
    ?aggregate_compliance_by_config_rules:aggregate_compliance_by_config_rule_list
      -> unit -> describe_aggregate_compliance_by_config_rules_response
val make_config_rule_compliance_filters :
  ?aws_region:aws_region ->
    ?account_id:account_id ->
      ?compliance_type:compliance_type ->
        ?config_rule_name:config_rule_name ->
          unit -> config_rule_compliance_filters
val make_describe_aggregate_compliance_by_config_rules_request :
  ?next_token:next_token ->
    ?limit:group_by_api_limit ->
      ?filters:config_rule_compliance_filters ->
        configuration_aggregator_name:configuration_aggregator_name ->
          unit -> describe_aggregate_compliance_by_config_rules_request
val make_deliver_config_snapshot_response :
  ?config_snapshot_id:string_ -> unit -> deliver_config_snapshot_response
val make_deliver_config_snapshot_request :
  delivery_channel_name:channel_name ->
    unit -> deliver_config_snapshot_request
val make_delete_stored_query_response : unit -> unit
val make_delete_stored_query_request :
  query_name:query_name -> unit -> delete_stored_query_request
val make_delete_service_linked_configuration_recorder_response :
  name:recorder_name ->
    arn:amazon_resource_name ->
      unit -> delete_service_linked_configuration_recorder_response
val make_delete_service_linked_configuration_recorder_request :
  service_principal:service_principal ->
    unit -> delete_service_linked_configuration_recorder_request
val make_delete_retention_configuration_request :
  retention_configuration_name:retention_configuration_name ->
    unit -> delete_retention_configuration_request
val make_delete_resource_config_request :
  resource_id:resource_id ->
    resource_type:resource_type_string ->
      unit -> delete_resource_config_request
val make_failed_delete_remediation_exceptions_batch :
  ?failed_items:remediation_exception_resource_keys ->
    ?failure_message:string_ ->
      unit -> failed_delete_remediation_exceptions_batch
val make_delete_remediation_exceptions_response :
  ?failed_batches:failed_delete_remediation_exceptions_batches ->
    unit -> delete_remediation_exceptions_response
val make_delete_remediation_exceptions_request :
  resource_keys:remediation_exception_resource_keys ->
    config_rule_name:config_rule_name ->
      unit -> delete_remediation_exceptions_request
val make_delete_remediation_configuration_response : unit -> unit
val make_delete_remediation_configuration_request :
  ?resource_type:string_ ->
    config_rule_name:config_rule_name ->
      unit -> delete_remediation_configuration_request
val make_delete_pending_aggregation_request_request :
  requester_aws_region:aws_region ->
    requester_account_id:account_id ->
      unit -> delete_pending_aggregation_request_request
val make_delete_organization_conformance_pack_request :
  organization_conformance_pack_name:organization_conformance_pack_name ->
    unit -> delete_organization_conformance_pack_request
val make_delete_organization_config_rule_request :
  organization_config_rule_name:organization_config_rule_name ->
    unit -> delete_organization_config_rule_request
val make_delete_evaluation_results_response : unit -> unit
val make_delete_evaluation_results_request :
  config_rule_name:string_with_char_limit64 ->
    unit -> delete_evaluation_results_request
val make_delete_delivery_channel_request :
  delivery_channel_name:channel_name ->
    unit -> delete_delivery_channel_request
val make_delete_conformance_pack_request :
  conformance_pack_name:conformance_pack_name ->
    unit -> delete_conformance_pack_request
val make_delete_configuration_recorder_request :
  configuration_recorder_name:recorder_name ->
    unit -> delete_configuration_recorder_request
val make_delete_configuration_aggregator_request :
  configuration_aggregator_name:configuration_aggregator_name ->
    unit -> delete_configuration_aggregator_request
val make_delete_config_rule_request :
  config_rule_name:config_rule_name -> unit -> delete_config_rule_request
val make_delete_aggregation_authorization_request :
  authorized_aws_region:aws_region ->
    authorized_account_id:account_id ->
      unit -> delete_aggregation_authorization_request
val make_base_configuration_item :
  ?configuration_item_delivery_time:configuration_item_delivery_time ->
    ?recording_frequency:recording_frequency ->
      ?supplementary_configuration:supplementary_configuration ->
        ?configuration:configuration ->
          ?resource_creation_time:resource_creation_time ->
            ?availability_zone:availability_zone ->
              ?aws_region:aws_region ->
                ?resource_name:resource_name ->
                  ?resource_id:resource_id ->
                    ?resource_type:resource_type ->
                      ?arn:ar_n ->
                        ?configuration_state_id:configuration_state_id ->
                          ?configuration_item_status:configuration_item_status
                            ->
                            ?configuration_item_capture_time:configuration_item_capture_time
                              ->
                              ?account_id:account_id ->
                                ?version:version ->
                                  unit -> base_configuration_item
val make_batch_get_resource_config_response :
  ?unprocessed_resource_keys:resource_keys ->
    ?base_configuration_items:base_configuration_items ->
      unit -> batch_get_resource_config_response
val make_batch_get_resource_config_request :
  resource_keys:resource_keys -> unit -> batch_get_resource_config_request
val make_batch_get_aggregate_resource_config_response :
  ?unprocessed_resource_identifiers:unprocessed_resource_identifier_list ->
    ?base_configuration_items:base_configuration_items ->
      unit -> batch_get_aggregate_resource_config_response
val make_batch_get_aggregate_resource_config_request :
  resource_identifiers:resource_identifiers_list ->
    configuration_aggregator_name:configuration_aggregator_name ->
      unit -> batch_get_aggregate_resource_config_request
val make_associate_resource_types_response :
  configuration_recorder:configuration_recorder ->
    unit -> associate_resource_types_response
val make_associate_resource_types_request :
  resource_types:resource_type_list ->
    configuration_recorder_arn:amazon_resource_name ->
      unit -> associate_resource_types_request(** {1:operations Operations} *)

module AssociateResourceTypes :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_resource_types_request ->
        (associate_resource_types_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `NoSuchConfigurationRecorderException of
              no_such_configuration_recorder_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Adds all resource types specified in the [ResourceTypes] list to the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} of specified configuration recorder and includes those resource types when recording.\n\n For this operation, the specified configuration recorder must use a {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} that is either [INCLUSION_BY_RESOURCE_TYPES] or [EXCLUSION_BY_RESOURCE_TYPES].\n "]
module BatchGetAggregateResourceConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_aggregate_resource_config_request ->
        (batch_get_aggregate_resource_config_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchConfigurationAggregatorException of
              no_such_configuration_aggregator_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns the current configuration items for resources that are present in your Config aggregator. The operation also returns a list of resources that are not processed in the current request. If there are no unprocessed resources, the operation returns an empty [unprocessedResourceIdentifiers] list. \n\n  {ul\n        {-  The API does not return results for deleted resources.\n            \n             }\n        {-   The API does not return tags and relationships.\n            \n             }\n        }\n   "]
module BatchGetResourceConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_resource_config_request ->
        (batch_get_resource_config_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoAvailableConfigurationRecorderException of
              no_available_configuration_recorder_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns the [BaseConfigurationItem] for one or more requested resources. The operation also returns a list of resources that are not processed in the current request. If there are no unprocessed resources, the operation returns an empty unprocessedResourceKeys list. \n\n  {ul\n        {-  The API does not return results for deleted resources.\n            \n             }\n        {-   The API does not return any tags for the requested resources. This information is filtered out of the supplementaryConfiguration section of the API response.\n            \n             }\n        }\n   "]
module DeleteAggregationAuthorization :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_aggregation_authorization_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterValueException of
              invalid_parameter_value_exception ])
          result
end[@@ocaml.doc
     "Deletes the authorization granted to the specified configuration aggregator account in a specified region.\n"]
module DeleteConfigRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_config_rule_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchConfigRuleException of no_such_config_rule_exception 
          | `ResourceInUseException of resource_in_use_exception ]) result
end[@@ocaml.doc
     "Deletes the specified Config rule and all of its evaluation results.\n\n Config sets the state of a rule to [DELETING] until the deletion is complete. You cannot update a rule while it is in this state. If you make a [PutConfigRule] or [DeleteConfigRule] request for the rule, you will receive a [ResourceInUseException].\n \n  You can check the state of a rule by using the [DescribeConfigRules] request.\n  \n     {b Recommendation: Stop recording resource compliance before deleting rules} \n    \n     It is highly recommended that you stop recording for the [AWS::Config::ResourceCompliance] resource type before you delete rules in your account. Deleting rules creates CIs for [AWS::Config::ResourceCompliance] and can affect your Config {{:https://docs.aws.amazon.com/config/latest/developerguide/stop-start-recorder.html}configuration recorder} costs. If you are deleting rules which evaluate a large number of resource types, this can lead to a spike in the number of CIs recorded.\n     \n      Best practice:\n      \n       {ol\n             {-  Stop recording [AWS::Config::ResourceCompliance] \n                 \n                  }\n             {-  Delete rule(s)\n                 \n                  }\n             {-  Turn on recording for [AWS::Config::ResourceCompliance] \n                 \n                  }\n             }\n   "]
module DeleteConfigurationAggregator :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_configuration_aggregator_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchConfigurationAggregatorException of
              no_such_configuration_aggregator_exception ])
          result
end[@@ocaml.doc
     "Deletes the specified configuration aggregator and the aggregated data associated with the aggregator.\n"]
module DeleteConfigurationRecorder :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_configuration_recorder_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchConfigurationRecorderException of
              no_such_configuration_recorder_exception 
          | `UnmodifiableEntityException of unmodifiable_entity_exception ])
          result
end[@@ocaml.doc
     "Deletes the customer managed configuration recorder.\n\n This operation does not delete the configuration information that was previously recorded. You will be able to access the previously recorded information by using the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_GetResourceConfigHistory.html}GetResourceConfigHistory} operation, but you will not be able to access this information in the Config console until you have created a new customer managed configuration recorder.\n "]
module DeleteConformancePack :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_conformance_pack_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchConformancePackException of
              no_such_conformance_pack_exception 
          | `ResourceInUseException of resource_in_use_exception ]) result
end[@@ocaml.doc
     "Deletes the specified conformance pack and all the Config rules, remediation actions, and all evaluation results within that conformance pack.\n\n Config sets the conformance pack to [DELETE_IN_PROGRESS] until the deletion is complete. You cannot update a conformance pack while it is in this state.\n "]
module DeleteDeliveryChannel :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_delivery_channel_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LastDeliveryChannelDeleteFailedException of
              last_delivery_channel_delete_failed_exception 
          | `NoSuchDeliveryChannelException of
              no_such_delivery_channel_exception ])
          result
end[@@ocaml.doc
     "Deletes the delivery channel.\n\n Before you can delete the delivery channel, you must stop the customer managed configuration recorder. You can use the [StopConfigurationRecorder] operation to stop the customer managed configuration recorder.\n "]
module DeleteEvaluationResults :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_evaluation_results_request ->
        (delete_evaluation_results_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchConfigRuleException of no_such_config_rule_exception 
          | `ResourceInUseException of resource_in_use_exception ]) result
end[@@ocaml.doc
     "Deletes the evaluation results for the specified Config rule. You can specify one Config rule per request. After you delete the evaluation results, you can call the [StartConfigRulesEvaluation] API to start evaluating your Amazon Web Services resources against the rule.\n"]
module DeleteOrganizationConfigRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_organization_config_rule_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchOrganizationConfigRuleException of
              no_such_organization_config_rule_exception 
          | `OrganizationAccessDeniedException of
              organization_access_denied_exception 
          | `ResourceInUseException of resource_in_use_exception ]) result
end[@@ocaml.doc
     "Deletes the specified organization Config rule and all of its evaluation results from all member accounts in that organization. \n\n Only a management account and a delegated administrator account can delete an organization Config rule. When calling this API with a delegated administrator, you must ensure Organizations [ListDelegatedAdministrator] permissions are added.\n \n  Config sets the state of a rule to DELETE_IN_PROGRESS until the deletion is complete. You cannot update a rule while it is in this state.\n  "]
module DeleteOrganizationConformancePack :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_organization_conformance_pack_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchOrganizationConformancePackException of
              no_such_organization_conformance_pack_exception 
          | `OrganizationAccessDeniedException of
              organization_access_denied_exception 
          | `ResourceInUseException of resource_in_use_exception ]) result
end[@@ocaml.doc
     "Deletes the specified organization conformance pack and all of the Config rules and remediation actions from all member accounts in that organization. \n\n  Only a management account or a delegated administrator account can delete an organization conformance pack. When calling this API with a delegated administrator, you must ensure Organizations [ListDelegatedAdministrator] permissions are added.\n \n  Config sets the state of a conformance pack to DELETE_IN_PROGRESS until the deletion is complete. You cannot update a conformance pack while it is in this state. \n  "]
module DeletePendingAggregationRequest :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_pending_aggregation_request_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterValueException of
              invalid_parameter_value_exception ])
          result
end[@@ocaml.doc
     "Deletes pending authorization requests for a specified aggregator account in a specified region.\n"]
module DeleteRemediationConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_remediation_configuration_request ->
        (delete_remediation_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InsufficientPermissionsException of
              insufficient_permissions_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `NoSuchRemediationConfigurationException of
              no_such_remediation_configuration_exception 
          | `RemediationInProgressException of
              remediation_in_progress_exception ])
          result
end[@@ocaml.doc "Deletes the remediation configuration.\n"]
module DeleteRemediationExceptions :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_remediation_exceptions_request ->
        (delete_remediation_exceptions_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchRemediationExceptionException of
              no_such_remediation_exception_exception ])
          result
end[@@ocaml.doc
     "Deletes one or more remediation exceptions mentioned in the resource keys.\n\n  Config generates a remediation exception when a problem occurs executing a remediation action to a specific resource. Remediation exceptions blocks auto-remediation until the exception is cleared.\n  \n   "]
module DeleteResourceConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_config_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoRunningConfigurationRecorderException of
              no_running_configuration_recorder_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Records the configuration state for a custom resource that has been deleted. This API records a new ConfigurationItem with a ResourceDeleted status. You can retrieve the ConfigurationItems recorded for this resource in your Config History. \n"]
module DeleteRetentionConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_retention_configuration_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `NoSuchRetentionConfigurationException of
              no_such_retention_configuration_exception ])
          result
end[@@ocaml.doc "Deletes the retention configuration.\n"]
module DeleteServiceLinkedConfigurationRecorder :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_service_linked_configuration_recorder_request ->
        (delete_service_linked_configuration_recorder_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `NoSuchConfigurationRecorderException of
              no_such_configuration_recorder_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes an existing service-linked configuration recorder.\n\n This operation does not delete the configuration information that was previously recorded. You will be able to access the previously recorded information by using the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_GetResourceConfigHistory.html}GetResourceConfigHistory} operation, but you will not be able to access this information in the Config console until you have created a new service-linked configuration recorder for the same service.\n \n    {b The recording scope determines if you receive configuration items} \n   \n    The recording scope is set by the service that is linked to the configuration recorder and determines whether you receive configuration items (CIs) in the delivery channel. If the recording scope is internal, you will not receive CIs in the delivery channel.\n    \n     "]
module DeleteStoredQuery :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_stored_query_request ->
        (delete_stored_query_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes the stored query for a single Amazon Web Services account and a single Amazon Web Services Region.\n"]
module DeliverConfigSnapshot :
sig
  val request :
    Smaws_Lib.Context.t ->
      deliver_config_snapshot_request ->
        (deliver_config_snapshot_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoAvailableConfigurationRecorderException of
              no_available_configuration_recorder_exception 
          | `NoRunningConfigurationRecorderException of
              no_running_configuration_recorder_exception 
          | `NoSuchDeliveryChannelException of
              no_such_delivery_channel_exception ])
          result
end[@@ocaml.doc
     "Schedules delivery of a configuration snapshot to the Amazon S3 bucket in the specified delivery channel. After the delivery has started, Config sends the following notifications using an Amazon SNS topic that you have specified.\n\n {ul\n       {-  Notification of the start of the delivery.\n           \n            }\n       {-  Notification of the completion of the delivery, if the delivery was successfully completed.\n           \n            }\n       {-  Notification of delivery failure, if the delivery failed.\n           \n            }\n       }\n  "]
module DescribeAggregateComplianceByConfigRules :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_aggregate_compliance_by_config_rules_request ->
        (describe_aggregate_compliance_by_config_rules_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoSuchConfigurationAggregatorException of
              no_such_configuration_aggregator_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns a list of compliant and noncompliant rules with the number of resources for compliant and noncompliant rules. Does not display rules that do not have compliance results. \n\n  The results can return an empty result page, but if you have a [nextToken], the results are displayed on the next page.\n  \n   "]
module DescribeAggregateComplianceByConformancePacks :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_aggregate_compliance_by_conformance_packs_request ->
        (describe_aggregate_compliance_by_conformance_packs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoSuchConfigurationAggregatorException of
              no_such_configuration_aggregator_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns a list of the existing and deleted conformance packs and their associated compliance status with the count of compliant and noncompliant Config rules within each conformance pack. Also returns the total rule count which includes compliant rules, noncompliant rules, and rules that cannot be evaluated due to insufficient data.\n\n  The results can return an empty result page, but if you have a [nextToken], the results are displayed on the next page.\n  \n   "]
module DescribeAggregationAuthorizations :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_aggregation_authorizations_request ->
        (describe_aggregation_authorizations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception ])
          result
end[@@ocaml.doc
     "Returns a list of authorizations granted to various aggregator accounts and regions.\n"]
module DescribeComplianceByConfigRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_compliance_by_config_rule_request ->
        (describe_compliance_by_config_rule_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `NoSuchConfigRuleException of no_such_config_rule_exception ])
          result
end[@@ocaml.doc
     "Indicates whether the specified Config rules are compliant. If a rule is noncompliant, this operation returns the number of Amazon Web Services resources that do not comply with the rule.\n\n A rule is compliant if all of the evaluated resources comply with it. It is noncompliant if any of these resources do not comply.\n \n  If Config has no current evaluation results for the rule, it returns [INSUFFICIENT_DATA]. This result might indicate one of the following conditions:\n  \n   {ul\n         {-  Config has never invoked an evaluation for the rule. To check whether it has, use the [DescribeConfigRuleEvaluationStatus] action to get the [LastSuccessfulInvocationTime] and [LastFailedInvocationTime].\n             \n              }\n         {-  The rule's Lambda function is failing to send evaluation results to Config. Verify that the role you assigned to your configuration recorder includes the [config:PutEvaluations] permission. If the rule is a custom rule, verify that the Lambda execution role includes the [config:PutEvaluations] permission.\n             \n              }\n         {-  The rule's Lambda function has returned [NOT_APPLICABLE] for all evaluation results. This can occur if the resources were deleted or removed from the rule's scope.\n             \n              }\n         }\n  "]
module DescribeComplianceByResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_compliance_by_resource_request ->
        (describe_compliance_by_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception ])
          result
end[@@ocaml.doc
     "Indicates whether the specified Amazon Web Services resources are compliant. If a resource is noncompliant, this operation returns the number of Config rules that the resource does not comply with.\n\n A resource is compliant if it complies with all the Config rules that evaluate it. It is noncompliant if it does not comply with one or more of these rules.\n \n  If Config has no current evaluation results for the resource, it returns [INSUFFICIENT_DATA]. This result might indicate one of the following conditions about the rules that evaluate the resource:\n  \n   {ul\n         {-  Config has never invoked an evaluation for the rule. To check whether it has, use the [DescribeConfigRuleEvaluationStatus] action to get the [LastSuccessfulInvocationTime] and [LastFailedInvocationTime].\n             \n              }\n         {-  The rule's Lambda function is failing to send evaluation results to Config. Verify that the role that you assigned to your configuration recorder includes the [config:PutEvaluations] permission. If the rule is a custom rule, verify that the Lambda execution role includes the [config:PutEvaluations] permission.\n             \n              }\n         {-  The rule's Lambda function has returned [NOT_APPLICABLE] for all evaluation results. This can occur if the resources were deleted or removed from the rule's scope.\n             \n              }\n         }\n  "]
module DescribeConfigRuleEvaluationStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_config_rule_evaluation_status_request ->
        (describe_config_rule_evaluation_status_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `NoSuchConfigRuleException of no_such_config_rule_exception ])
          result
end[@@ocaml.doc
     "Returns status information for each of your Config managed rules. The status includes information such as the last time Config invoked the rule, the last time Config failed to invoke the rule, and the related error for the last failure.\n"]
module DescribeConfigRules :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_config_rules_request ->
        (describe_config_rules_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `NoSuchConfigRuleException of no_such_config_rule_exception ])
          result
end[@@ocaml.doc "Returns details about your Config rules.\n"]
module DescribeConfigurationAggregators :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_configuration_aggregators_request ->
        (describe_configuration_aggregators_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `NoSuchConfigurationAggregatorException of
              no_such_configuration_aggregator_exception ])
          result
end[@@ocaml.doc
     "Returns the details of one or more configuration aggregators. If the configuration aggregator is not specified, this operation returns the details for all the configuration aggregators associated with the account. \n"]
module DescribeConfigurationAggregatorSourcesStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_configuration_aggregator_sources_status_request ->
        (describe_configuration_aggregator_sources_status_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `NoSuchConfigurationAggregatorException of
              no_such_configuration_aggregator_exception ])
          result
end[@@ocaml.doc
     "Returns status information for sources within an aggregator. The status includes information about the last time Config verified authorization between the source account and an aggregator account. In case of a failure, the status contains the related error code or message. \n"]
module DescribeConfigurationRecorders :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_configuration_recorders_request ->
        (describe_configuration_recorders_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchConfigurationRecorderException of
              no_such_configuration_recorder_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns details for the configuration recorder you specify.\n\n If a configuration recorder is not specified, this operation returns details for the customer managed configuration recorder configured for the account, if applicable.\n \n   When making a request to this operation, you can only specify one configuration recorder.\n   \n    "]
module DescribeConfigurationRecorderStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_configuration_recorder_status_request ->
        (describe_configuration_recorder_status_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchConfigurationRecorderException of
              no_such_configuration_recorder_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns the current status of the configuration recorder you specify as well as the status of the last recording event for the configuration recorders.\n\n For a detailed status of recording events over time, add your Config events to Amazon CloudWatch metrics and use CloudWatch metrics.\n \n  If a configuration recorder is not specified, this operation returns the status for the customer managed configuration recorder configured for the account, if applicable.\n  \n    When making a request to this operation, you can only specify one configuration recorder.\n    \n     "]
module DescribeConformancePackCompliance :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_conformance_pack_compliance_request ->
        (describe_conformance_pack_compliance_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `NoSuchConfigRuleInConformancePackException of
              no_such_config_rule_in_conformance_pack_exception 
          | `NoSuchConformancePackException of
              no_such_conformance_pack_exception ])
          result
end[@@ocaml.doc
     "Returns compliance details for each rule in that conformance pack.\n\n  You must provide exact rule names.\n  \n   "]
module DescribeConformancePacks :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_conformance_packs_request ->
        (describe_conformance_packs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `NoSuchConformancePackException of
              no_such_conformance_pack_exception ])
          result
end[@@ocaml.doc "Returns a list of one or more conformance packs.\n"]
module DescribeConformancePackStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_conformance_pack_status_request ->
        (describe_conformance_pack_status_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception ])
          result
end[@@ocaml.doc
     "Provides one or more conformance packs deployment status.\n\n  If there are no conformance packs then you will see an empty result.\n  \n   "]
module DescribeDeliveryChannels :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_delivery_channels_request ->
        (describe_delivery_channels_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchDeliveryChannelException of
              no_such_delivery_channel_exception ])
          result
end[@@ocaml.doc
     "Returns details about the specified delivery channel. If a delivery channel is not specified, this operation returns the details of all delivery channels associated with the account.\n\n  Currently, you can specify only one delivery channel per region in your account.\n  \n   "]
module DescribeDeliveryChannelStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_delivery_channel_status_request ->
        (describe_delivery_channel_status_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchDeliveryChannelException of
              no_such_delivery_channel_exception ])
          result
end[@@ocaml.doc
     "Returns the current status of the specified delivery channel. If a delivery channel is not specified, this operation returns the current status of all delivery channels associated with the account.\n\n  Currently, you can specify only one delivery channel per region in your account.\n  \n   "]
module DescribeOrganizationConfigRules :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_organization_config_rules_request ->
        (describe_organization_config_rules_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoSuchOrganizationConfigRuleException of
              no_such_organization_config_rule_exception 
          | `OrganizationAccessDeniedException of
              organization_access_denied_exception ])
          result
end[@@ocaml.doc
     "Returns a list of organization Config rules. \n\n  When you specify the limit and the next token, you receive a paginated response.\n  \n   Limit and next token are not applicable if you specify organization Config rule names. It is only applicable, when you request all the organization Config rules.\n   \n     {i For accounts within an organization} \n    \n     If you deploy an organizational rule or conformance pack in an organization administrator account, and then establish a delegated administrator and deploy an organizational rule or conformance pack in the delegated administrator account, you won't be able to see the organizational rule or conformance pack in the organization administrator account from the delegated administrator account or see the organizational rule or conformance pack in the delegated administrator account from organization administrator account. The [DescribeOrganizationConfigRules] and [DescribeOrganizationConformancePacks] APIs can only see and interact with the organization-related resource that were deployed from within the account calling those APIs.\n     \n      "]
module DescribeOrganizationConfigRuleStatuses :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_organization_config_rule_statuses_request ->
        (describe_organization_config_rule_statuses_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoSuchOrganizationConfigRuleException of
              no_such_organization_config_rule_exception 
          | `OrganizationAccessDeniedException of
              organization_access_denied_exception ])
          result
end[@@ocaml.doc
     "Provides organization Config rule deployment status for an organization.\n\n  The status is not considered successful until organization Config rule is successfully deployed in all the member accounts with an exception of excluded accounts.\n  \n   When you specify the limit and the next token, you receive a paginated response. Limit and next token are not applicable if you specify organization Config rule names. It is only applicable, when you request all the organization Config rules.\n   \n    "]
module DescribeOrganizationConformancePacks :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_organization_conformance_packs_request ->
        (describe_organization_conformance_packs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoSuchOrganizationConformancePackException of
              no_such_organization_conformance_pack_exception 
          | `OrganizationAccessDeniedException of
              organization_access_denied_exception ])
          result
end[@@ocaml.doc
     "Returns a list of organization conformance packs. \n\n  When you specify the limit and the next token, you receive a paginated response. \n  \n   Limit and next token are not applicable if you specify organization conformance packs names. They are only applicable, when you request all the organization conformance packs. \n   \n     {i For accounts within an organization} \n    \n     If you deploy an organizational rule or conformance pack in an organization administrator account, and then establish a delegated administrator and deploy an organizational rule or conformance pack in the delegated administrator account, you won't be able to see the organizational rule or conformance pack in the organization administrator account from the delegated administrator account or see the organizational rule or conformance pack in the delegated administrator account from organization administrator account. The [DescribeOrganizationConfigRules] and [DescribeOrganizationConformancePacks] APIs can only see and interact with the organization-related resource that were deployed from within the account calling those APIs.\n     \n      "]
module DescribeOrganizationConformancePackStatuses :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_organization_conformance_pack_statuses_request ->
        (describe_organization_conformance_pack_statuses_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoSuchOrganizationConformancePackException of
              no_such_organization_conformance_pack_exception 
          | `OrganizationAccessDeniedException of
              organization_access_denied_exception ])
          result
end[@@ocaml.doc
     "Provides organization conformance pack deployment status for an organization. \n\n  The status is not considered successful until organization conformance pack is successfully deployed in all the member accounts with an exception of excluded accounts.\n  \n   When you specify the limit and the next token, you receive a paginated response. Limit and next token are not applicable if you specify organization conformance pack names. They are only applicable, when you request all the organization conformance packs.\n   \n    "]
module DescribePendingAggregationRequests :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_pending_aggregation_requests_request ->
        (describe_pending_aggregation_requests_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception ])
          result
end[@@ocaml.doc "Returns a list of all pending aggregation requests.\n"]
module DescribeRemediationConfigurations :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_remediation_configurations_request ->
        (describe_remediation_configurations_response,
          [> Smaws_Lib.Protocols.AwsJson.error]) result
end[@@ocaml.doc
     "Returns the details of one or more remediation configurations.\n"]
module DescribeRemediationExceptions :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_remediation_exceptions_request ->
        (describe_remediation_exceptions_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception ])
          result
end[@@ocaml.doc
     "Returns the details of one or more remediation exceptions. A detailed view of a remediation exception for a set of resources that includes an explanation of an exception and the time when the exception will be deleted. When you specify the limit and the next token, you receive a paginated response. \n\n  Config generates a remediation exception when a problem occurs executing a remediation action to a specific resource. Remediation exceptions blocks auto-remediation until the exception is cleared.\n  \n   When you specify the limit and the next token, you receive a paginated response. \n   \n    Limit and next token are not applicable if you request resources in batch. It is only applicable, when you request all resources.\n    \n     "]
module DescribeRemediationExecutionStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_remediation_execution_status_request ->
        (describe_remediation_execution_status_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `NoSuchRemediationConfigurationException of
              no_such_remediation_configuration_exception ])
          result
end[@@ocaml.doc
     "Provides a detailed view of a Remediation Execution for a set of resources including state, timestamps for when steps for the remediation execution occur, and any error messages for steps that have failed. When you specify the limit and the next token, you receive a paginated response.\n"]
module DescribeRetentionConfigurations :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_retention_configurations_request ->
        (describe_retention_configurations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `NoSuchRetentionConfigurationException of
              no_such_retention_configuration_exception ])
          result
end[@@ocaml.doc
     "Returns the details of one or more retention configurations. If the retention configuration name is not specified, this operation returns the details for all the retention configurations for that account.\n\n  Currently, Config supports only one retention configuration per region in your account.\n  \n   "]
module DisassociateResourceTypes :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_resource_types_request ->
        (disassociate_resource_types_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `NoSuchConfigurationRecorderException of
              no_such_configuration_recorder_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Removes all resource types specified in the [ResourceTypes] list from the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} of configuration recorder and excludes these resource types when recording.\n\n For this operation, the configuration recorder must use a {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} that is either [INCLUSION_BY_RESOURCE_TYPES] or [EXCLUSION_BY_RESOURCE_TYPES].\n "]
module GetAggregateComplianceDetailsByConfigRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_aggregate_compliance_details_by_config_rule_request ->
        (get_aggregate_compliance_details_by_config_rule_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoSuchConfigurationAggregatorException of
              no_such_configuration_aggregator_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns the evaluation results for the specified Config rule for a specific resource in a rule. The results indicate which Amazon Web Services resources were evaluated by the rule, when each resource was last evaluated, and whether each resource complies with the rule. \n\n  The results can return an empty result page. But if you have a [nextToken], the results are displayed on the next page.\n  \n   "]
module GetAggregateConfigRuleComplianceSummary :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_aggregate_config_rule_compliance_summary_request ->
        (get_aggregate_config_rule_compliance_summary_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoSuchConfigurationAggregatorException of
              no_such_configuration_aggregator_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns the number of compliant and noncompliant rules for one or more accounts and regions in an aggregator.\n\n  The results can return an empty result page, but if you have a nextToken, the results are displayed on the next page.\n  \n   "]
module GetAggregateConformancePackComplianceSummary :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_aggregate_conformance_pack_compliance_summary_request ->
        (get_aggregate_conformance_pack_compliance_summary_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoSuchConfigurationAggregatorException of
              no_such_configuration_aggregator_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns the count of compliant and noncompliant conformance packs across all Amazon Web Services accounts and Amazon Web Services Regions in an aggregator. You can filter based on Amazon Web Services account ID or Amazon Web Services Region.\n\n  The results can return an empty result page, but if you have a nextToken, the results are displayed on the next page.\n  \n   "]
module GetAggregateDiscoveredResourceCounts :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_aggregate_discovered_resource_counts_request ->
        (get_aggregate_discovered_resource_counts_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoSuchConfigurationAggregatorException of
              no_such_configuration_aggregator_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns the resource counts across accounts and regions that are present in your Config aggregator. You can request the resource counts by providing filters and GroupByKey.\n\n For example, if the input contains accountID 12345678910 and region us-east-1 in filters, the API returns the count of resources in account ID 12345678910 and region us-east-1. If the input contains ACCOUNT_ID as a GroupByKey, the API returns resource counts for all source accounts that are present in your aggregator.\n "]
module GetAggregateResourceConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_aggregate_resource_config_request ->
        (get_aggregate_resource_config_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchConfigurationAggregatorException of
              no_such_configuration_aggregator_exception 
          | `OversizedConfigurationItemException of
              oversized_configuration_item_exception 
          | `ResourceNotDiscoveredException of
              resource_not_discovered_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns configuration item that is aggregated for your specific resource in a specific source account and region.\n\n  The API does not return results for deleted resources.\n  \n   "]
module GetComplianceDetailsByConfigRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_details_by_config_rule_request ->
        (get_compliance_details_by_config_rule_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `NoSuchConfigRuleException of no_such_config_rule_exception ])
          result
end[@@ocaml.doc
     "Returns the evaluation results for the specified Config rule. The results indicate which Amazon Web Services resources were evaluated by the rule, when each resource was last evaluated, and whether each resource complies with the rule.\n"]
module GetComplianceDetailsByResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_details_by_resource_request ->
        (get_compliance_details_by_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterValueException of
              invalid_parameter_value_exception ])
          result
end[@@ocaml.doc
     "Returns the evaluation results for the specified Amazon Web Services resource. The results indicate which Config rules were used to evaluate the resource, when each rule was last invoked, and whether the resource complies with each rule.\n"]
module GetComplianceSummaryByConfigRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      Smaws_Lib.Smithy_api.unit_ ->
        (get_compliance_summary_by_config_rule_response,
          [> Smaws_Lib.Protocols.AwsJson.error]) result
end[@@ocaml.doc
     "Returns the number of Config rules that are compliant and noncompliant, up to a maximum of 25 for each.\n"]
module GetComplianceSummaryByResourceType :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_summary_by_resource_type_request ->
        (get_compliance_summary_by_resource_type_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterValueException of
              invalid_parameter_value_exception ])
          result
end[@@ocaml.doc
     "Returns the number of resources that are compliant and the number that are noncompliant. You can specify one or more resource types to get these numbers for each resource type. The maximum number returned is 100.\n"]
module GetConformancePackComplianceDetails :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_conformance_pack_compliance_details_request ->
        (get_conformance_pack_compliance_details_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `NoSuchConfigRuleInConformancePackException of
              no_such_config_rule_in_conformance_pack_exception 
          | `NoSuchConformancePackException of
              no_such_conformance_pack_exception ])
          result
end[@@ocaml.doc
     "Returns compliance details of a conformance pack for all Amazon Web Services resources that are monitered by conformance pack.\n"]
module GetConformancePackComplianceSummary :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_conformance_pack_compliance_summary_request ->
        (get_conformance_pack_compliance_summary_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoSuchConformancePackException of
              no_such_conformance_pack_exception ])
          result
end[@@ocaml.doc
     "Returns compliance details for the conformance pack based on the cumulative compliance results of all the rules in that conformance pack.\n"]
module GetCustomRulePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_custom_rule_policy_request ->
        (get_custom_rule_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchConfigRuleException of no_such_config_rule_exception ])
          result
end[@@ocaml.doc
     "Returns the policy definition containing the logic for your Config Custom Policy rule.\n"]
module GetDiscoveredResourceCounts :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_discovered_resource_counts_request ->
        (get_discovered_resource_counts_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns the resource types, the number of each resource type, and the total number of resources that Config is recording in this region for your Amazon Web Services account. \n\n  {b Example} \n \n  {ol\n        {-  Config is recording three resource types in the US East (Ohio) Region for your account: 25 EC2 instances, 20 IAM users, and 15 S3 buckets.\n            \n             }\n        {-  You make a call to the [GetDiscoveredResourceCounts] action and specify that you want all resource types. \n            \n             }\n        {-  Config returns the following:\n            \n             {ul\n                   {-  The resource types (EC2 instances, IAM users, and S3 buckets).\n                       \n                        }\n                   {-  The number of each resource type (25, 20, and 15).\n                       \n                        }\n                   {-  The total number of all resources (60).\n                       \n                        }\n                   \n         }\n          }\n        }\n   The response is paginated. By default, Config lists 100 [ResourceCount] objects on each page. You can customize this number with the [limit] parameter. The response includes a [nextToken] string. To get the next page of results, run the request again and specify the string for the [nextToken] parameter.\n   \n     If you make a call to the [GetDiscoveredResourceCounts] action, you might not immediately receive resource counts in the following situations:\n     \n      {ul\n            {-  You are a new Config customer.\n                \n                 }\n            {-  You just enabled resource recording.\n                \n                 }\n            }\n   It might take a few minutes for Config to record and count your resources. Wait a few minutes and then retry the [GetDiscoveredResourceCounts] action. \n   \n    "]
module GetOrganizationConfigRuleDetailedStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_organization_config_rule_detailed_status_request ->
        (get_organization_config_rule_detailed_status_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoSuchOrganizationConfigRuleException of
              no_such_organization_config_rule_exception 
          | `OrganizationAccessDeniedException of
              organization_access_denied_exception ])
          result
end[@@ocaml.doc
     "Returns detailed status for each member account within an organization for a given organization Config rule.\n"]
module GetOrganizationConformancePackDetailedStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_organization_conformance_pack_detailed_status_request ->
        (get_organization_conformance_pack_detailed_status_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoSuchOrganizationConformancePackException of
              no_such_organization_conformance_pack_exception 
          | `OrganizationAccessDeniedException of
              organization_access_denied_exception ])
          result
end[@@ocaml.doc
     "Returns detailed status for each member account within an organization for a given organization conformance pack.\n"]
module GetOrganizationCustomRulePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_organization_custom_rule_policy_request ->
        (get_organization_custom_rule_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchOrganizationConfigRuleException of
              no_such_organization_config_rule_exception 
          | `OrganizationAccessDeniedException of
              organization_access_denied_exception ])
          result
end[@@ocaml.doc
     "Returns the policy definition containing the logic for your organization Config Custom Policy rule.\n"]
module GetResourceConfigHistory :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_config_history_request ->
        (get_resource_config_history_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidTimeRangeException of invalid_time_range_exception 
          | `NoAvailableConfigurationRecorderException of
              no_available_configuration_recorder_exception 
          | `ResourceNotDiscoveredException of
              resource_not_discovered_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     " For accurate reporting on the compliance status, you must record the [AWS::Config::ResourceCompliance] resource type. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html}Selecting Which Resources Config Records}.\n \n   Returns a list of [ConfigurationItems] for the specified resource. The list contains details about each state of the resource during the specified time interval. If you specified a retention period to retain your [ConfigurationItems] between a minimum of 30 days and a maximum of 7 years (2557 days), Config returns the [ConfigurationItems] for the specified retention period. \n   \n    The response is paginated. By default, Config returns a limit of 10 configuration items per page. You can customize this number with the [limit] parameter. The response includes a [nextToken] string. To get the next page of results, run the request again and specify the string for the [nextToken] parameter.\n    \n      Each call to the API is limited to span a duration of seven days. It is likely that the number of records returned is smaller than the specified [limit]. In such cases, you can make another call, using the [nextToken].\n      \n       "]
module GetResourceEvaluationSummary :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_evaluation_summary_request ->
        (get_resource_evaluation_summary_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns a summary of resource evaluation for the specified resource evaluation ID from the proactive rules that were run. The results indicate which evaluation context was used to evaluate the rules, which resource details were evaluated, the evaluation mode that was run, and whether the resource details comply with the configuration of the proactive rules. \n\n  To see additional information about the evaluation result, such as which rule flagged a resource as NON_COMPLIANT, use the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_GetComplianceDetailsByResource.html}GetComplianceDetailsByResource} API. For more information, see the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_GetResourceEvaluationSummary.html#API_GetResourceEvaluationSummary_Examples}Examples} section.\n  \n   "]
module GetStoredQuery :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_stored_query_request ->
        (get_stored_query_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Returns the details of a specific stored query.\n"]
module ListAggregateDiscoveredResources :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_aggregate_discovered_resources_request ->
        (list_aggregate_discovered_resources_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoSuchConfigurationAggregatorException of
              no_such_configuration_aggregator_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Accepts a resource type and returns a list of resource identifiers that are aggregated for a specific resource type across accounts and regions. A resource identifier includes the resource type, ID, (if available) the custom resource name, source account, and source region. You can narrow the results to include only resources that have specific resource IDs, or a resource name, or source account ID, or source region.\n\n For example, if the input consists of accountID 12345678910 and the region is us-east-1 for resource type [AWS::EC2::Instance] then the API returns all the EC2 instance identifiers of accountID 12345678910 and region us-east-1.\n "]
module ListConfigurationRecorders :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_configuration_recorders_request ->
        (list_configuration_recorders_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns a list of configuration recorders depending on the filters you specify.\n"]
module ListConformancePackComplianceScores :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_conformance_pack_compliance_scores_request ->
        (list_conformance_pack_compliance_scores_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception ])
          result
end[@@ocaml.doc
     "Returns a list of conformance pack compliance scores. A compliance score is the percentage of the number of compliant rule-resource combinations in a conformance pack compared to the number of total possible rule-resource combinations in the conformance pack. This metric provides you with a high-level view of the compliance state of your conformance packs. You can use it to identify, investigate, and understand the level of compliance in your conformance packs.\n\n  Conformance packs with no evaluation results will have a compliance score of [INSUFFICIENT_DATA].\n  \n   "]
module ListDiscoveredResources :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_discovered_resources_request ->
        (list_discovered_resources_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoAvailableConfigurationRecorderException of
              no_available_configuration_recorder_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Accepts a resource type and returns a list of resource identifiers for the resources of that type. A resource identifier includes the resource type, ID, and (if available) the custom resource name. The results consist of resources that Config has discovered, including those that Config is not currently recording. You can narrow the results to include only resources that have specific resource IDs or a resource name.\n\n  You can specify either resource IDs or a resource name, but not both, in the same request.\n  \n    The response is paginated. By default, Config lists 100 resource identifiers on each page. You can customize this number with the [limit] parameter. The response includes a [nextToken] string. To get the next page of results, run the request again and specify the string for the [nextToken] parameter.\n    "]
module ListResourceEvaluations :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_evaluations_request ->
        (list_resource_evaluations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `InvalidTimeRangeException of invalid_time_range_exception ])
          result
end[@@ocaml.doc "Returns a list of proactive resource evaluations.\n"]
module ListStoredQueries :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_stored_queries_request ->
        (list_stored_queries_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists the stored queries for a single Amazon Web Services account and a single Amazon Web Services Region. The default is 100. \n"]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "List the tags for Config resource.\n"]
module PutAggregationAuthorization :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_aggregation_authorization_request ->
        (put_aggregation_authorization_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterValueException of
              invalid_parameter_value_exception ])
          result
end[@@ocaml.doc
     "Authorizes the aggregator account and region to collect data from the source account and region. \n\n   {b Tags are added at creation and cannot be updated with this operation} \n  \n    [PutAggregationAuthorization] is an idempotent API. Subsequent requests won\226\128\153t create a duplicate resource if one was already created. If a following request has different [tags] values, Config will ignore these differences and treat it as an idempotent request of the previous. In this case, [tags] will not be updated, even if they are different.\n   \n    Use {{:https://docs.aws.amazon.com/config/latest/APIReference/API_TagResource.html}TagResource} and {{:https://docs.aws.amazon.com/config/latest/APIReference/API_UntagResource.html}UntagResource} to update tags after creation.\n    \n     "]
module PutConfigRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_config_rule_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InsufficientPermissionsException of
              insufficient_permissions_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `MaxNumberOfConfigRulesExceededException of
              max_number_of_config_rules_exceeded_exception 
          | `NoAvailableConfigurationRecorderException of
              no_available_configuration_recorder_exception 
          | `ResourceInUseException of resource_in_use_exception ]) result
end[@@ocaml.doc
     "Adds or updates an Config rule to evaluate if your Amazon Web Services resources comply with your desired configurations. For information on how many Config rules you can have per account, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.\n\n There are two types of rules: {i Config Managed Rules} and {i Config Custom Rules}. You can use [PutConfigRule] to create both Config Managed Rules and Config Custom Rules.\n \n  Config Managed Rules are predefined, customizable rules created by Config. For a list of managed rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html}List of Config Managed Rules}. If you are adding an Config managed rule, you must specify the rule's identifier for the [SourceIdentifier] key.\n  \n   Config Custom Rules are rules that you create from scratch. There are two ways to create Config custom rules: with Lambda functions ({{:https://docs.aws.amazon.com/config/latest/developerguide/gettingstarted-concepts.html#gettingstarted-concepts-function} Lambda Developer Guide}) and with Guard ({{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}), a policy-as-code language. Config custom rules created with Lambda are called {i Config Custom Lambda Rules} and Config custom rules created with Guard are called {i Config Custom Policy Rules}.\n   \n    If you are adding a new Config Custom Lambda rule, you first need to create an Lambda function that the rule invokes to evaluate your resources. When you use [PutConfigRule] to add a Custom Lambda rule to Config, you must specify the Amazon Resource Name (ARN) that Lambda assigns to the function. You specify the ARN in the [SourceIdentifier] key. This key is part of the [Source] object, which is part of the [ConfigRule] object. \n    \n     For any new Config rule that you add, specify the [ConfigRuleName] in the [ConfigRule] object. Do not specify the [ConfigRuleArn] or the [ConfigRuleId]. These values are generated by Config for new rules.\n     \n      If you are updating a rule that you added previously, you can specify the rule by [ConfigRuleName], [ConfigRuleId], or [ConfigRuleArn] in the [ConfigRule] data type that you use in this request.\n      \n       For more information about developing and using Config rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html}Evaluating Resources with Config Rules} in the {i Config Developer Guide}.\n       \n          {b Tags are added at creation and cannot be updated with this operation} \n         \n           [PutConfigRule] is an idempotent API. Subsequent requests won\226\128\153t create a duplicate resource if one was already created. If a following request has different [tags] values, Config will ignore these differences and treat it as an idempotent request of the previous. In this case, [tags] will not be updated, even if they are different.\n          \n           Use {{:https://docs.aws.amazon.com/config/latest/APIReference/API_TagResource.html}TagResource} and {{:https://docs.aws.amazon.com/config/latest/APIReference/API_UntagResource.html}UntagResource} to update tags after creation.\n           \n            "]
module PutConfigurationAggregator :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_configuration_aggregator_request ->
        (put_configuration_aggregator_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `InvalidRoleException of invalid_role_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NoAvailableOrganizationException of
              no_available_organization_exception 
          | `OrganizationAccessDeniedException of
              organization_access_denied_exception 
          | `OrganizationAllFeaturesNotEnabledException of
              organization_all_features_not_enabled_exception ])
          result
end[@@ocaml.doc
     "Creates and updates the configuration aggregator with the selected source accounts and regions. The source account can be individual account(s) or an organization.\n\n  [accountIds] that are passed will be replaced with existing accounts. If you want to add additional accounts into the aggregator, call [DescribeConfigurationAggregators] to get the previous accounts and then append new ones.\n \n   Config should be enabled in source accounts and regions you want to aggregate.\n   \n    If your source type is an organization, you must be signed in to the management account or a registered delegated administrator and all the features must be enabled in your organization. If the caller is a management account, Config calls [EnableAwsServiceAccess] API to enable integration between Config and Organizations. If the caller is a registered delegated administrator, Config calls [ListDelegatedAdministrators] API to verify whether the caller is a valid delegated administrator.\n    \n     To register a delegated administrator, see {{:https://docs.aws.amazon.com/config/latest/developerguide/set-up-aggregator-cli.html#register-a-delegated-administrator-cli}Register a Delegated Administrator} in the {i Config developer guide}. \n     \n         {b Tags are added at creation and cannot be updated with this operation} \n        \n          [PutConfigurationAggregator] is an idempotent API. Subsequent requests won\226\128\153t create a duplicate resource if one was already created. If a following request has different [tags] values, Config will ignore these differences and treat it as an idempotent request of the previous. In this case, [tags] will not be updated, even if they are different.\n         \n          Use {{:https://docs.aws.amazon.com/config/latest/APIReference/API_TagResource.html}TagResource} and {{:https://docs.aws.amazon.com/config/latest/APIReference/API_UntagResource.html}UntagResource} to update tags after creation.\n          \n           "]
module PutConfigurationRecorder :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_configuration_recorder_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidConfigurationRecorderNameException of
              invalid_configuration_recorder_name_exception 
          | `InvalidRecordingGroupException of
              invalid_recording_group_exception 
          | `InvalidRoleException of invalid_role_exception 
          | `MaxNumberOfConfigurationRecordersExceededException of
              max_number_of_configuration_recorders_exceeded_exception 
          | `UnmodifiableEntityException of unmodifiable_entity_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates or updates the customer managed configuration recorder.\n\n You can use this operation to create a new customer managed configuration recorder or to update the [roleARN] and the [recordingGroup] for an existing customer managed configuration recorder.\n \n  To start the customer managed configuration recorder and begin recording configuration changes for the resource types you specify, use the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_StartConfigurationRecorder.html}StartConfigurationRecorder} operation.\n  \n   For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/stop-start-recorder.html} {b Working with the Configuration Recorder} } in the {i Config Developer Guide}.\n   \n      {b One customer managed configuration recorder per account per Region} \n     \n      You can create only one customer managed configuration recorder for each account for each Amazon Web Services Region.\n      \n        {b Default is to record all supported resource types, excluding the global IAM resource types} \n       \n        If you have not specified values for the [recordingGroup] field, the default for the customer managed configuration recorder is to record all supported resource types, excluding the global IAM resource types: [AWS::IAM::Group], [AWS::IAM::Policy], [AWS::IAM::Role], and [AWS::IAM::User].\n        \n          {b Tags are added at creation and cannot be updated} \n         \n           [PutConfigurationRecorder] is an idempotent API. Subsequent requests won\226\128\153t create a duplicate resource if one was already created. If a following request has different tags values, Config will ignore these differences and treat it as an idempotent request of the previous. In this case, tags will not be updated, even if they are different.\n          \n           Use {{:https://docs.aws.amazon.com/config/latest/APIReference/API_TagResource.html}TagResource} and {{:https://docs.aws.amazon.com/config/latest/APIReference/API_UntagResource.html}UntagResource} to update tags after creation.\n           \n            "]
module PutConformancePack :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_conformance_pack_request ->
        (put_conformance_pack_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConformancePackTemplateValidationException of
              conformance_pack_template_validation_exception 
          | `InsufficientPermissionsException of
              insufficient_permissions_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `MaxNumberOfConformancePacksExceededException of
              max_number_of_conformance_packs_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception ]) result
end[@@ocaml.doc
     "Creates or updates a conformance pack. A conformance pack is a collection of Config rules that can be easily deployed in an account and a region and across an organization. For information on how many conformance packs you can have per account, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.\n\n This API creates a service-linked role [AWSServiceRoleForConfigConforms] in your account. The service-linked role is created only when the role does not exist in your account. \n \n   You must specify only one of the follow parameters: [TemplateS3Uri], [TemplateBody] or [TemplateSSMDocumentDetails].\n   \n    "]
module PutDeliveryChannel :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_delivery_channel_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InsufficientDeliveryPolicyException of
              insufficient_delivery_policy_exception 
          | `InvalidDeliveryChannelNameException of
              invalid_delivery_channel_name_exception 
          | `InvalidS3KeyPrefixException of invalid_s3_key_prefix_exception 
          | `InvalidS3KmsKeyArnException of invalid_s3_kms_key_arn_exception 
          | `InvalidSNSTopicARNException of invalid_sns_topic_arn_exception 
          | `MaxNumberOfDeliveryChannelsExceededException of
              max_number_of_delivery_channels_exceeded_exception 
          | `NoAvailableConfigurationRecorderException of
              no_available_configuration_recorder_exception 
          | `NoSuchBucketException of no_such_bucket_exception ]) result
end[@@ocaml.doc
     "Creates or updates a delivery channel to deliver configuration information and other compliance information.\n\n You can use this operation to create a new delivery channel or to update the Amazon S3 bucket and the Amazon SNS topic of an existing delivery channel.\n \n  For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/manage-delivery-channel.html} {b Working with the Delivery Channel} } in the {i Config Developer Guide.} \n  \n     {b One delivery channel per account per Region} \n    \n     You can have only one delivery channel for each account for each Amazon Web Services Region.\n     \n      "]
module PutEvaluations :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_evaluations_request ->
        (put_evaluations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `InvalidResultTokenException of invalid_result_token_exception 
          | `NoSuchConfigRuleException of no_such_config_rule_exception ])
          result
end[@@ocaml.doc
     "Used by an Lambda function to deliver evaluation results to Config. This operation is required in every Lambda function that is invoked by an Config rule.\n"]
module PutExternalEvaluation :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_external_evaluation_request ->
        (put_external_evaluation_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `NoSuchConfigRuleException of no_such_config_rule_exception ])
          result
end[@@ocaml.doc
     "Add or updates the evaluations for process checks. This API checks if the rule is a process check when the name of the Config rule is provided.\n"]
module PutOrganizationConfigRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_organization_config_rule_request ->
        (put_organization_config_rule_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InsufficientPermissionsException of
              insufficient_permissions_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `MaxNumberOfOrganizationConfigRulesExceededException of
              max_number_of_organization_config_rules_exceeded_exception 
          | `NoAvailableOrganizationException of
              no_available_organization_exception 
          | `OrganizationAccessDeniedException of
              organization_access_denied_exception 
          | `OrganizationAllFeaturesNotEnabledException of
              organization_all_features_not_enabled_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Adds or updates an Config rule for your entire organization to evaluate if your Amazon Web Services resources comply with your desired configurations. For information on how many organization Config rules you can have per account, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.\n\n  Only a management account and a delegated administrator can create or update an organization Config rule. When calling this API with a delegated administrator, you must ensure Organizations [ListDelegatedAdministrator] permissions are added. An organization can have up to 3 delegated administrators.\n \n  This API enables organization service access through the [EnableAWSServiceAccess] action and creates a service-linked role [AWSServiceRoleForConfigMultiAccountSetup] in the management or delegated administrator account of your organization. The service-linked role is created only when the role does not exist in the caller account. Config verifies the existence of role with [GetRole] action.\n  \n   To use this API with delegated administrator, register a delegated administrator by calling Amazon Web Services Organization [register-delegated-administrator] for [config-multiaccountsetup.amazonaws.com]. \n   \n    There are two types of rules: {i Config Managed Rules} and {i Config Custom Rules}. You can use [PutOrganizationConfigRule] to create both Config Managed Rules and Config Custom Rules.\n    \n     Config Managed Rules are predefined, customizable rules created by Config. For a list of managed rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html}List of Config Managed Rules}. If you are adding an Config managed rule, you must specify the rule's identifier for the [RuleIdentifier] key.\n     \n      Config Custom Rules are rules that you create from scratch. There are two ways to create Config custom rules: with Lambda functions ({{:https://docs.aws.amazon.com/config/latest/developerguide/gettingstarted-concepts.html#gettingstarted-concepts-function} Lambda Developer Guide}) and with Guard ({{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}), a policy-as-code language. Config custom rules created with Lambda are called {i Config Custom Lambda Rules} and Config custom rules created with Guard are called {i Config Custom Policy Rules}.\n      \n       If you are adding a new Config Custom Lambda rule, you first need to create an Lambda function in the management account or a delegated administrator that the rule invokes to evaluate your resources. You also need to create an IAM role in the managed account that can be assumed by the Lambda function. When you use [PutOrganizationConfigRule] to add a Custom Lambda rule to Config, you must specify the Amazon Resource Name (ARN) that Lambda assigns to the function.\n       \n         Prerequisite: Ensure you call [EnableAllFeatures] API to enable all features in an organization.\n         \n          Make sure to specify one of either [OrganizationCustomPolicyRuleMetadata] for Custom Policy rules, [OrganizationCustomRuleMetadata] for Custom Lambda rules, or [OrganizationManagedRuleMetadata] for managed rules.\n          \n           "]
module PutOrganizationConformancePack :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_organization_conformance_pack_request ->
        (put_organization_conformance_pack_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InsufficientPermissionsException of
              insufficient_permissions_exception 
          | `MaxNumberOfOrganizationConformancePacksExceededException of
              max_number_of_organization_conformance_packs_exceeded_exception 
          | `NoAvailableOrganizationException of
              no_available_organization_exception 
          | `OrganizationAccessDeniedException of
              organization_access_denied_exception 
          | `OrganizationAllFeaturesNotEnabledException of
              organization_all_features_not_enabled_exception 
          | `OrganizationConformancePackTemplateValidationException of
              organization_conformance_pack_template_validation_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deploys conformance packs across member accounts in an Amazon Web Services Organization. For information on how many organization conformance packs and how many Config rules you can have per account, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.\n\n Only a management account and a delegated administrator can call this API. When calling this API with a delegated administrator, you must ensure Organizations [ListDelegatedAdministrator] permissions are added. An organization can have up to 3 delegated administrators.\n \n  This API enables organization service access for [config-multiaccountsetup.amazonaws.com] through the [EnableAWSServiceAccess] action and creates a service-linked role [AWSServiceRoleForConfigMultiAccountSetup] in the management or delegated administrator account of your organization. The service-linked role is created only when the role does not exist in the caller account. To use this API with delegated administrator, register a delegated administrator by calling Amazon Web Services Organization [register-delegate-admin] for [config-multiaccountsetup.amazonaws.com].\n  \n    Prerequisite: Ensure you call [EnableAllFeatures] API to enable all features in an organization.\n    \n     You must specify either the [TemplateS3Uri] or the [TemplateBody] parameter, but not both. If you provide both Config uses the [TemplateS3Uri] parameter and ignores the [TemplateBody] parameter.\n     \n      Config sets the state of a conformance pack to CREATE_IN_PROGRESS and UPDATE_IN_PROGRESS until the conformance pack is created or updated. You cannot update a conformance pack while it is in this state.\n      \n       "]
module PutRemediationConfigurations :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_remediation_configurations_request ->
        (put_remediation_configurations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InsufficientPermissionsException of
              insufficient_permissions_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception ])
          result
end[@@ocaml.doc
     "Adds or updates the remediation configuration with a specific Config rule with the selected target or action. The API creates the [RemediationConfiguration] object for the Config rule. The Config rule must already exist for you to add a remediation configuration. The target (SSM document) must exist and have permissions to use the target. \n\n   {b Be aware of backward incompatible changes} \n  \n   If you make backward incompatible changes to the SSM document, you must call this again to ensure the remediations can run.\n   \n    This API does not support adding remediation configurations for service-linked Config Rules such as Organization Config rules, the rules deployed by conformance packs, and rules deployed by Amazon Web Services Security Hub.\n    \n        {b Required fields} \n       \n        For manual remediation configuration, you need to provide a value for [automationAssumeRole] or use a value in the [assumeRole]field to remediate your resources. The SSM automation document can use either as long as it maps to a valid parameter.\n        \n         However, for automatic remediation configuration, the only valid [assumeRole] field value is [AutomationAssumeRole] and you need to provide a value for [AutomationAssumeRole] to remediate your resources.\n         \n             {b Auto remediation can be initiated even for compliant resources} \n            \n             If you enable auto remediation for a specific Config rule using the {{:https://docs.aws.amazon.com/config/latest/APIReference/emAPI_PutRemediationConfigurations.html}PutRemediationConfigurations} API or the Config console, it initiates the remediation process for all non-compliant resources for that specific rule. The auto remediation process relies on the compliance data snapshot which is captured on a periodic basis. Any non-compliant resource that is updated between the snapshot schedule will continue to be remediated based on the last known compliance data snapshot.\n             \n              This means that in some cases auto remediation can be initiated even for compliant resources, since the bootstrap processor uses a database that can have stale evaluation results based on the last known compliance data snapshot.\n              \n               "]
module PutRemediationExceptions :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_remediation_exceptions_request ->
        (put_remediation_exceptions_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InsufficientPermissionsException of
              insufficient_permissions_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception ])
          result
end[@@ocaml.doc
     "A remediation exception is when a specified resource is no longer considered for auto-remediation. This API adds a new exception or updates an existing exception for a specified resource with a specified Config rule. \n\n   {b Exceptions block auto remediation} \n  \n   Config generates a remediation exception when a problem occurs running a remediation action for a specified resource. Remediation exceptions blocks auto-remediation until the exception is cleared.\n   \n       {b Manual remediation is recommended when placing an exception} \n      \n       When placing an exception on an Amazon Web Services resource, it is recommended that remediation is set as manual remediation until the given Config rule for the specified resource evaluates the resource as [NON_COMPLIANT]. Once the resource has been evaluated as [NON_COMPLIANT], you can add remediation exceptions and change the remediation type back from Manual to Auto if you want to use auto-remediation. Otherwise, using auto-remediation before a [NON_COMPLIANT] evaluation result can delete resources before the exception is applied.\n       \n           {b Exceptions can only be performed on non-compliant resources} \n          \n           Placing an exception can only be performed on resources that are [NON_COMPLIANT]. If you use this API for [COMPLIANT] resources or resources that are [NOT_APPLICABLE], a remediation exception will not be generated. For more information on the conditions that initiate the possible Config evaluation results, see {{:https://docs.aws.amazon.com/config/latest/developerguide/config-concepts.html#aws-config-rules}Concepts | Config Rules} in the {i Config Developer Guide}.\n           \n               {b Exceptions cannot be placed on service-linked remediation actions} \n              \n               You cannot place an exception on service-linked remediation actions, such as remediation actions put by an organizational conformance pack.\n               \n                   {b Auto remediation can be initiated even for compliant resources} \n                  \n                   If you enable auto remediation for a specific Config rule using the {{:https://docs.aws.amazon.com/config/latest/APIReference/emAPI_PutRemediationConfigurations.html}PutRemediationConfigurations} API or the Config console, it initiates the remediation process for all non-compliant resources for that specific rule. The auto remediation process relies on the compliance data snapshot which is captured on a periodic basis. Any non-compliant resource that is updated between the snapshot schedule will continue to be remediated based on the last known compliance data snapshot.\n                   \n                    This means that in some cases auto remediation can be initiated even for compliant resources, since the bootstrap processor uses a database that can have stale evaluation results based on the last known compliance data snapshot.\n                    \n                     "]
module PutResourceConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_config_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InsufficientPermissionsException of
              insufficient_permissions_exception 
          | `MaxActiveResourcesExceededException of
              max_active_resources_exceeded_exception 
          | `NoRunningConfigurationRecorderException of
              no_running_configuration_recorder_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Records the configuration state for the resource provided in the request. The configuration state of a resource is represented in Config as Configuration Items. Once this API records the configuration item, you can retrieve the list of configuration items for the custom resource type using existing Config APIs. \n\n  The custom resource type must be registered with CloudFormation. This API accepts the configuration item registered with CloudFormation.\n  \n   When you call this API, Config only stores configuration state of the resource provided in the request. This API does not change or remediate the configuration of the resource. \n   \n    Write-only schema properites are not recorded as part of the published configuration item.\n    \n     "]
module PutRetentionConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_retention_configuration_request ->
        (put_retention_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `MaxNumberOfRetentionConfigurationsExceededException of
              max_number_of_retention_configurations_exceeded_exception ])
          result
end[@@ocaml.doc
     "Creates and updates the retention configuration with details about retention period (number of days) that Config stores your historical information. The API creates the [RetentionConfiguration] object and names the object as {b default}. When you have a [RetentionConfiguration] object named {b default}, calling the API modifies the default object. \n\n  Currently, Config supports only one retention configuration per region in your account.\n  \n   "]
module PutServiceLinkedConfigurationRecorder :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_service_linked_configuration_recorder_request ->
        (put_service_linked_configuration_recorder_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InsufficientPermissionsException of
              insufficient_permissions_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a service-linked configuration recorder that is linked to a specific Amazon Web Services service based on the [ServicePrincipal] you specify.\n\n The configuration recorder's [name], [recordingGroup], [recordingMode], and [recordingScope] is set by the service that is linked to the configuration recorder.\n \n  For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/stop-start-recorder.html} {b Working with the Configuration Recorder} } in the {i Config Developer Guide}.\n  \n   This API creates a service-linked role [AWSServiceRoleForConfig] in your account. The service-linked role is created only when the role does not exist in your account.\n   \n      {b The recording scope determines if you receive configuration items} \n     \n      The recording scope is set by the service that is linked to the configuration recorder and determines whether you receive configuration items (CIs) in the delivery channel. If the recording scope is internal, you will not receive CIs in the delivery channel.\n      \n        {b Tags are added at creation and cannot be updated with this operation} \n       \n        Use {{:https://docs.aws.amazon.com/config/latest/APIReference/API_TagResource.html}TagResource} and {{:https://docs.aws.amazon.com/config/latest/APIReference/API_UntagResource.html}UntagResource} to update tags after creation.\n        \n         "]
module PutStoredQuery :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_stored_query_request ->
        (put_stored_query_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceConcurrentModificationException of
              resource_concurrent_modification_exception 
          | `TooManyTagsException of too_many_tags_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Saves a new query or updates an existing saved query. The [QueryName] must be unique for a single Amazon Web Services account and a single Amazon Web Services Region. You can create upto 300 queries in a single Amazon Web Services account and a single Amazon Web Services Region.\n\n   {b Tags are added at creation and cannot be updated} \n  \n    [PutStoredQuery] is an idempotent API. Subsequent requests won\226\128\153t create a duplicate resource if one was already created. If a following request has different [tags] values, Config will ignore these differences and treat it as an idempotent request of the previous. In this case, [tags] will not be updated, even if they are different.\n   \n    "]
module SelectAggregateResourceConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      select_aggregate_resource_config_request ->
        (select_aggregate_resource_config_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidExpressionException of invalid_expression_exception 
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoSuchConfigurationAggregatorException of
              no_such_configuration_aggregator_exception ])
          result
end[@@ocaml.doc
     "Accepts a structured query language (SQL) SELECT command and an aggregator to query configuration state of Amazon Web Services resources across multiple accounts and regions, performs the corresponding search, and returns resource configurations matching the properties.\n\n For more information about query components, see the {{:https://docs.aws.amazon.com/config/latest/developerguide/query-components.html} {b Query Components} } section in the {i Config Developer Guide}.\n \n   If you run an aggregation query (i.e., using [GROUP BY] or using aggregate functions such as [COUNT]; e.g., [SELECT resourceId, COUNT(*) WHERE resourceType = 'AWS::IAM::Role' GROUP BY resourceId]) and do not specify the [MaxResults] or the [Limit] query parameters, the default page size is set to 500.\n   \n    If you run a non-aggregation query (i.e., not using [GROUP BY] or aggregate function; e.g., [SELECT * WHERE resourceType = 'AWS::IAM::Role']) and do not specify the [MaxResults] or the [Limit] query parameters, the default page size is set to 25.\n    \n     "]
module SelectResourceConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      select_resource_config_request ->
        (select_resource_config_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidExpressionException of invalid_expression_exception 
          | `InvalidLimitException of invalid_limit_exception 
          | `InvalidNextTokenException of invalid_next_token_exception ])
          result
end[@@ocaml.doc
     "Accepts a structured query language (SQL) [SELECT] command, performs the corresponding search, and returns resource configurations matching the properties.\n\n For more information about query components, see the {{:https://docs.aws.amazon.com/config/latest/developerguide/query-components.html} {b Query Components} } section in the {i Config Developer Guide}.\n "]
module StartConfigRulesEvaluation :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_config_rules_evaluation_request ->
        (start_config_rules_evaluation_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NoSuchConfigRuleException of no_such_config_rule_exception 
          | `ResourceInUseException of resource_in_use_exception ]) result
end[@@ocaml.doc
     "Runs an on-demand evaluation for the specified Config rules against the last known configuration state of the resources. Use [StartConfigRulesEvaluation] when you want to test that a rule you updated is working as expected. [StartConfigRulesEvaluation] does not re-record the latest configuration state for your resources. It re-runs an evaluation against the last known state of your resources. \n\n You can specify up to 25 Config rules per request. \n \n  An existing [StartConfigRulesEvaluation] call for the specified rules must complete before you can call the API again. If you chose to have Config stream to an Amazon SNS topic, you will receive a [ConfigRuleEvaluationStarted] notification when the evaluation starts.\n  \n    You don't need to call the [StartConfigRulesEvaluation] API to run an evaluation for a new rule. When you create a rule, Config evaluates your resources against the rule automatically. \n    \n      The [StartConfigRulesEvaluation] API is useful if you want to run on-demand evaluations, such as the following example:\n      \n       {ol\n             {-  You have a custom rule that evaluates your IAM resources every 24 hours.\n                 \n                  }\n             {-  You update your Lambda function to add additional conditions to your rule.\n                 \n                  }\n             {-  Instead of waiting for the next periodic evaluation, you call the [StartConfigRulesEvaluation] API.\n                 \n                  }\n             {-  Config invokes your Lambda function and evaluates your IAM resources.\n                 \n                  }\n             {-  Your custom rule will still run periodic evaluations every 24 hours.\n                 \n                  }\n             }\n  "]
module StartConfigurationRecorder :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_configuration_recorder_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoAvailableDeliveryChannelException of
              no_available_delivery_channel_exception 
          | `NoSuchConfigurationRecorderException of
              no_such_configuration_recorder_exception 
          | `UnmodifiableEntityException of unmodifiable_entity_exception ])
          result
end[@@ocaml.doc
     "Starts the customer managed configuration recorder. The customer managed configuration recorder will begin recording configuration changes for the resource types you specify.\n\n You must have created a delivery channel to successfully start the customer managed configuration recorder. You can use the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutDeliveryChannel.html}PutDeliveryChannel} operation to create a delivery channel.\n "]
module StartRemediationExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_remediation_execution_request ->
        (start_remediation_execution_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InsufficientPermissionsException of
              insufficient_permissions_exception 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception 
          | `NoSuchRemediationConfigurationException of
              no_such_remediation_configuration_exception ])
          result
end[@@ocaml.doc
     "Runs an on-demand remediation for the specified Config rules against the last known remediation configuration. It runs an execution against the current state of your resources. Remediation execution is asynchronous.\n\n You can specify up to 100 resource keys per request. An existing StartRemediationExecution call for the specified resource keys must complete before you can call the API again.\n "]
module StartResourceEvaluation :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_resource_evaluation_request ->
        (start_resource_evaluation_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `IdempotentParameterMismatch of idempotent_parameter_mismatch 
          | `InvalidParameterValueException of
              invalid_parameter_value_exception ])
          result
end[@@ocaml.doc
     "Runs an on-demand evaluation for the specified resource to determine whether the resource details will comply with configured Config rules. You can also use it for evaluation purposes. Config recommends using an evaluation context. It runs an execution against the resource details with all of the Config rules in your account that match with the specified proactive mode and resource type.\n\n  Ensure you have the [cloudformation:DescribeType] role setup to validate the resource type schema.\n  \n   You can find the {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html}Resource type schema} in \"{i Amazon Web Services public extensions}\" within the CloudFormation registry or with the following CLI commmand: [aws cloudformation describe-type --type-name \"AWS::S3::Bucket\" --type RESOURCE].\n   \n    For more information, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry.html#registry-view}Managing extensions through the CloudFormation registry} and {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services resource and property types reference} in the CloudFormation User Guide.\n    \n     "]
module StopConfigurationRecorder :
sig
  val request :
    Smaws_Lib.Context.t ->
      stop_configuration_recorder_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `NoSuchConfigurationRecorderException of
              no_such_configuration_recorder_exception 
          | `UnmodifiableEntityException of unmodifiable_entity_exception ])
          result
end[@@ocaml.doc
     "Stops the customer managed configuration recorder. The customer managed configuration recorder will stop recording configuration changes for the resource types you have specified.\n"]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyTagsException of too_many_tags_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Associates the specified tags to a resource with the specified [ResourceArn]. If existing tags on a resource are not specified in the request parameters, they are not changed. If existing tags are specified, however, then their values will be updated. When a resource is deleted, the tags associated with that resource are deleted as well.\n"]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Deletes specified tags from a resource.\n"]