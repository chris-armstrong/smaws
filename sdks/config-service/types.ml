open Smaws_Lib
type nonrec validation_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "The requested operation is not valid. You will see this exception if there are missing required fields or if the input value fails the validation.\n\n For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutStoredQuery.html}PutStoredQuery}, one of the following errors:\n \n  {ul\n        {-  There are missing required fields.\n            \n             }\n        {-  The input value fails the validation.\n            \n             }\n        {-  You are trying to create more than 300 queries.\n            \n             }\n        }\n   For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DescribeConfigurationRecorders.html}DescribeConfigurationRecorders} and {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DescribeConfigurationRecorderStatus.html}DescribeConfigurationRecorderStatus}, one of the following errors:\n   \n    {ul\n          {-  You have specified more than one configuration recorder.\n              \n               }\n          {-  You have provided a service principal for service-linked configuration recorder that is not valid.\n              \n               }\n          }\n   For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_AssociateResourceTypes.html}AssociateResourceTypes} and {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DisassociateResourceTypes.html}DisassociateResourceTypes}, one of the following errors:\n   \n    {ul\n          {-  Your configuraiton recorder has a recording strategy that does not allow the association or disassociation of resource types.\n              \n               }\n          {-  One or more of the specified resource types are already associated or disassociated with the configuration recorder.\n              \n               }\n          {-  For service-linked configuration recorders, the configuration recorder does not record one or more of the specified resource types.\n              \n               }\n          }\n  "]
type nonrec untag_resource_request =
  {
  tag_keys: string list [@ocaml.doc "The keys of the tags to be removed.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. The following resources are supported:\n\n {ul\n       {-   [ConfigurationRecorder] \n           \n            }\n       {-   [ConfigRule] \n           \n            }\n       {-   [OrganizationConfigRule] \n           \n            }\n       {-   [ConformancePack] \n           \n            }\n       {-   [OrganizationConformancePack] \n           \n            }\n       {-   [ConfigurationAggregator] \n           \n            }\n       {-   [AggregationAuthorization] \n           \n            }\n       {-   [StoredQuery] \n           \n            }\n       }\n  "]}
[@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "You have specified a resource that does not exist.\n"]
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
type nonrec aggregate_resource_identifier =
  {
  resource_name: string option
    [@ocaml.doc "The name of the Amazon Web Services resource.\n"];
  resource_type: resource_type
    [@ocaml.doc "The type of the Amazon Web Services resource.\n"];
  resource_id: string
    [@ocaml.doc "The ID of the Amazon Web Services resource.\n"];
  source_region: string
    [@ocaml.doc "The source region where data is aggregated.\n"];
  source_account_id: string
    [@ocaml.doc "The 12-digit account ID of the source account.\n"]}[@@ocaml.doc
                                                                    "The details that identify a resource that is collected by Config aggregator, including the resource type, ID, (if available) the custom resource name, the source account, and source region.\n"]
type nonrec unmodifiable_entity_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "The requested operation is not valid.\n\n For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutConfigurationRecorder.html}PutConfigurationRecorder}, you will see this exception because you cannot use this operation to create a service-linked configuration recorder. Use the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutServiceLinkedConfigurationRecorder.html}PutServiceLinkedConfigurationRecorder} operation to create a service-linked configuration recorder.\n \n  For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DeleteConfigurationRecorder.html}DeleteConfigurationRecorder}, you will see this exception because you cannot use this operation to delete a service-linked configuration recorder. Use the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DeleteServiceLinkedConfigurationRecorder.html}DeleteServiceLinkedConfigurationRecorder} operation to delete a service-linked configuration recorder.\n  \n   For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_StartConfigurationRecorder.html}StartConfigurationRecorder} and {{:https://docs.aws.amazon.com/config/latest/APIReference/API_StopConfigurationRecorder.html}StopConfigurationRecorder}, you will see this exception because these operations do not affect service-linked configuration recorders. Service-linked configuration recorders are always recording. To stop recording, you must delete the service-linked configuration recorder. Use the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DeleteServiceLinkedConfigurationRecorder.html}DeleteServiceLinkedConfigurationRecorder} operation to delete a service-linked configuration recorder.\n   "]
type nonrec too_many_tags_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have reached the limit of the number of tags you can use. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.\n"]
type nonrec time_window =
  {
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The end time of an execution. The end time must be after the start date.\n"];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The start time of an execution.\n"]}[@@ocaml.doc
                                                       "Filters evaluation results based on start and end times.\n"]
type nonrec template_ssm_document_details =
  {
  document_version: string option
    [@ocaml.doc
      "The version of the SSM document to use to create a conformance pack. By default, Config uses the latest version.\n\n  This field is optional.\n  \n   "];
  document_name: string
    [@ocaml.doc
      "The name or Amazon Resource Name (ARN) of the SSM document to use to create a conformance pack. If you use the document name, Config checks only your account and Amazon Web Services Region for the SSM document.\n"]}
[@@ocaml.doc
  "This API allows you to create a conformance pack template with an Amazon Web Services Systems Manager document (SSM document). To deploy a conformance pack using an SSM document, first create an SSM document with conformance pack content, and then provide the [DocumentName] in the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutConformancePack.html}PutConformancePack API}. You can also provide the [DocumentVersion].\n\n The [TemplateSSMDocumentDetails] object contains the name of the SSM document and the version of the SSM document.\n "]
type nonrec tag =
  {
  value: string option
    [@ocaml.doc
      "The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key).\n"];
  key: string option
    [@ocaml.doc
      "One part of a key-value pair that make up a tag. A key is a general label that acts like a category for more specific tag values.\n"]}
[@@ocaml.doc
  "The tags for the resource. The metadata that you apply to a resource to help you categorize and organize them. Each tag consists of a key and an optional value, both of which you define. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.\n"]
type nonrec tags = (string * string) list[@@ocaml.doc ""]
type nonrec tag_resource_request =
  {
  tags: tag list [@ocaml.doc "An array of tag object.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. The following resources are supported:\n\n {ul\n       {-   [ConfigurationRecorder] \n           \n            }\n       {-   [ConfigRule] \n           \n            }\n       {-   [OrganizationConfigRule] \n           \n            }\n       {-   [ConformancePack] \n           \n            }\n       {-   [OrganizationConformancePack] \n           \n            }\n       {-   [ConfigurationAggregator] \n           \n            }\n       {-   [AggregationAuthorization] \n           \n            }\n       {-   [StoredQuery] \n           \n            }\n       }\n  "]}
[@@ocaml.doc ""]
type nonrec supplementary_configuration = (string * string) list[@@ocaml.doc
                                                                  ""]
type nonrec stored_query_metadata =
  {
  description: string option
    [@ocaml.doc "A unique description for the query.\n"];
  query_name: string [@ocaml.doc "The name of the query.\n"];
  query_arn: string
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the query. For example, arn:partition:service:region:account-id:resource-type/resource-name/resource-id.\n"];
  query_id: string [@ocaml.doc "The ID of the query. \n"]}[@@ocaml.doc
                                                            "Returns details of a specific query. \n"]
type nonrec stored_query =
  {
  expression: string option
    [@ocaml.doc
      "The expression of the query. For example, [SELECT\n\t\t\tresourceId,\n\t\t\tresourceType,\n\t\t\tsupplementaryConfiguration.BucketVersioningConfiguration.status\n\t\t\tWHERE\n\t\t\tresourceType = 'AWS::S3::Bucket'\n\t\t\tAND supplementaryConfiguration.BucketVersioningConfiguration.status = 'Off'.] \n"];
  description: string option
    [@ocaml.doc "A unique description for the query.\n"];
  query_name: string [@ocaml.doc "The name of the query.\n"];
  query_arn: string option
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the query. For example, arn:partition:service:region:account-id:resource-type/resource-name/resource-id.\n"];
  query_id: string option [@ocaml.doc "The ID of the query.\n"]}[@@ocaml.doc
                                                                  "Provides the details of a stored query.\n"]
type nonrec stop_configuration_recorder_request =
  {
  configuration_recorder_name: string
    [@ocaml.doc
      "The name of the customer managed configuration recorder that you want to stop.\n"]}
[@@ocaml.doc "The input for the [StopConfigurationRecorder] operation.\n"]
type nonrec no_such_configuration_recorder_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
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
  account_id: string option
    [@ocaml.doc
      "The 12-digit account ID of the member account within an organization.\n"]}
[@@ocaml.doc
  "Status filter object to filter results based on specific member account ID or status type for an organization Config rule. \n"]
type nonrec static_value =
  {
  values: string list
    [@ocaml.doc
      "A list of values. For example, the ARN of the assumed role. \n"]}
[@@ocaml.doc "The static value of the resource.\n"]
type nonrec start_resource_evaluation_response =
  {
  resource_evaluation_id: string option
    [@ocaml.doc
      "A unique ResourceEvaluationId that is associated with a single execution.\n"]}
[@@ocaml.doc ""]
type nonrec resource_configuration_schema_type =
  | CFN_RESOURCE_SCHEMA [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_details =
  {
  resource_configuration_schema_type:
    resource_configuration_schema_type option
    [@ocaml.doc
      "The schema type of the resource configuration.\n\n  You can find the {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html}Resource type schema}, or [CFN_RESOURCE_SCHEMA], in \"{i Amazon Web Services public extensions}\" within the CloudFormation registry or with the following CLI commmand: [aws cloudformation describe-type --type-name \"AWS::S3::Bucket\" --type RESOURCE].\n  \n   For more information, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry.html#registry-view}Managing extensions through the CloudFormation registry} and {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services resource and property types reference} in the CloudFormation User Guide.\n   \n    "];
  resource_configuration: string
    [@ocaml.doc
      "The resource definition to be evaluated as per the resource configuration schema type.\n"];
  resource_type: string
    [@ocaml.doc "The type of resource being evaluated.\n"];
  resource_id: string
    [@ocaml.doc "A unique resource ID for an evaluation.\n"]}[@@ocaml.doc
                                                               "Returns information about the resource being evaluated.\n"]
type nonrec evaluation_context =
  {
  evaluation_context_identifier: string option
    [@ocaml.doc
      "A unique EvaluationContextIdentifier ID for an EvaluationContext.\n"]}
[@@ocaml.doc
  "Use EvaluationContext to group independently initiated proactive resource evaluations. For example, CFN Stack. If you want to check just a resource definition, you do not need to provide evaluation context.\n"]
type nonrec evaluation_mode =
  | PROACTIVE [@ocaml.doc ""]
  | DETECTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec start_resource_evaluation_request =
  {
  client_token: string option
    [@ocaml.doc
      "A client token is a unique, case-sensitive string of up to 64 ASCII characters. To make an idempotent API request using one of these actions, specify a client token in the request.\n\n  Avoid reusing the same client token for other API requests. If you retry a request that completed successfully using the same client token and the same parameters, the retry succeeds without performing any further actions. If you retry a successful request using the same client token, but one or more of the parameters are different, other than the Region or Availability Zone, the retry fails with an IdempotentParameterMismatch error.\n  \n   "];
  evaluation_timeout: int option
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
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "One or more of the specified parameters are not valid. Verify that your parameters are valid and try again.\n"]
type nonrec idempotent_parameter_mismatch =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Using the same client token with one or more different parameters. Specify a new client token with the parameter changes and try again.\n"]
type nonrec resource_key =
  {
  resource_id: string
    [@ocaml.doc "The ID of the resource (for example., sg-xxxxxx). \n"];
  resource_type: resource_type [@ocaml.doc "The resource type.\n"]}[@@ocaml.doc
                                                                    "The details that identify a resource within Config, including the resource type and resource ID.\n"]
type nonrec start_remediation_execution_response =
  {
  failed_items: resource_key list option
    [@ocaml.doc
      "For resources that have failed to start execution, the API returns a resource key object.\n"];
  failure_message: string option
    [@ocaml.doc
      "Returns a failure message. For example, the resource is already compliant.\n"]}
[@@ocaml.doc ""]
type nonrec start_remediation_execution_request =
  {
  resource_keys: resource_key list
    [@ocaml.doc
      "A list of resource keys to be processed with the current request. Each element in the list consists of the resource type and resource ID. \n"];
  config_rule_name: string
    [@ocaml.doc
      "The list of names of Config rules that you want to run remediation execution for.\n"]}
[@@ocaml.doc ""]
type nonrec no_such_remediation_configuration_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You specified an Config rule without a remediation configuration.\n"]
type nonrec insufficient_permissions_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "Indicates one of the following errors:\n\n {ul\n       {-  For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutConfigRule.html}PutConfigRule}, the rule cannot be created because the IAM role assigned to Config lacks permissions to perform the config:Put* action.\n           \n            }\n       {-  For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutConfigRule.html}PutConfigRule}, the Lambda function cannot be invoked. Check the function ARN, and check the function's permissions.\n           \n            }\n       {-  For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutOrganizationConfigRule.html}PutOrganizationConfigRule}, organization Config rule cannot be created because you do not have permissions to call IAM [GetRole] action or create a service-linked role.\n           \n            }\n       {-  For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutConformancePack.html}PutConformancePack} and {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutOrganizationConformancePack.html}PutOrganizationConformancePack}, a conformance pack cannot be created because you do not have the following permissions: \n           \n            {ul\n                  {-  You do not have permission to call IAM [GetRole] action or create a service-linked role.\n                      \n                       }\n                  {-  You do not have permission to read Amazon S3 bucket or call SSM:GetDocument.\n                      \n                       }\n                  \n        }\n         }\n       {-  For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutServiceLinkedConfigurationRecorder.html}PutServiceLinkedConfigurationRecorder}, a service-linked configuration recorder cannot be created because you do not have the following permissions: IAM [CreateServiceLinkedRole].\n           \n            }\n       }\n  "]
type nonrec start_configuration_recorder_request =
  {
  configuration_recorder_name: string
    [@ocaml.doc
      "The name of the customer managed configuration recorder that you want to start.\n"]}
[@@ocaml.doc "The input for the [StartConfigurationRecorder] operation.\n"]
type nonrec no_available_delivery_channel_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "There is no delivery channel available to record configurations.\n"]
type nonrec start_config_rules_evaluation_request =
  {
  config_rule_names: string list option
    [@ocaml.doc
      "The list of names of Config rules that you want to run evaluations for.\n"]}
[@@ocaml.doc "\n"]
type nonrec resource_in_use_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You see this exception in the following cases: \n\n {ul\n       {-  For DeleteConfigRule, Config is deleting this rule. Try your request again later.\n           \n            }\n       {-  For DeleteConfigRule, the rule is deleting your evaluation results. Try your request again later.\n           \n            }\n       {-  For DeleteConfigRule, a remediation action is associated with the rule and Config cannot delete this rule. Delete the remediation action associated with the rule before deleting the rule and try your request again later.\n           \n            }\n       {-  For PutConfigOrganizationRule, organization Config rule deletion is in progress. Try your request again later.\n           \n            }\n       {-  For DeleteOrganizationConfigRule, organization Config rule creation is in progress. Try your request again later.\n           \n            }\n       {-  For PutConformancePack and PutOrganizationConformancePack, a conformance pack creation, update, and deletion is in progress. Try your request again later.\n           \n            }\n       {-  For DeleteConformancePack, a conformance pack creation, update, and deletion is in progress. Try your request again later.\n           \n            }\n       }\n  "]
type nonrec no_such_config_rule_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "The Config rule in the request is not valid. Verify that the rule is an Config Process Check rule, that the rule name is correct, and that valid Amazon Resouce Names (ARNs) are used before trying again.\n"]
type nonrec limit_exceeded_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "For [PutServiceLinkedConfigurationRecorder] API, this exception is thrown if the number of service-linked roles in the account exceeds the limit.\n\n For [StartConfigRulesEvaluation] API, this exception is thrown if an evaluation is in progress or if you call the [StartConfigRulesEvaluation] API more than once per minute.\n \n  For [PutConfigurationAggregator] API, this exception is thrown if the number of accounts and aggregators exceeds the limit.\n  "]
type nonrec invalid_next_token_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "The specified next token is not valid. Specify the [nextToken] string that was returned in the previous response to get the next page of results.\n"]
type nonrec invalid_limit_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The specified limit is outside the allowable range.\n"]
type nonrec invalid_expression_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The syntax of the query is incorrect.\n"]
type nonrec field_info =
  {
  name: string option [@ocaml.doc "Name of the field.\n"]}[@@ocaml.doc
                                                            "Details about the fields such as name of the field.\n"]
type nonrec query_info =
  {
  select_fields: field_info list option
    [@ocaml.doc "Returns a [FieldInfo] object.\n"]}[@@ocaml.doc
                                                     "Details about the query.\n"]
type nonrec select_resource_config_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response. \n"];
  query_info: query_info option
    [@ocaml.doc "Returns the [QueryInfo] object.\n"];
  results: string list option
    [@ocaml.doc "Returns the results for the SQL query.\n"]}[@@ocaml.doc ""]
type nonrec select_resource_config_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response. \n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of query results returned on each page. \n"];
  expression: string [@ocaml.doc "The SQL query [SELECT] command.\n"]}
[@@ocaml.doc ""]
type nonrec no_such_configuration_aggregator_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have specified a configuration aggregator that does not exist.\n"]
type nonrec select_aggregate_resource_config_response =
  {
  next_token: string option
    [@ocaml.doc
      "The nextToken string returned in a previous request that you use to request the next page of results in a paginated response. \n"];
  query_info: query_info option [@ocaml.doc ""];
  results: string list option
    [@ocaml.doc "Returns the results for the SQL query.\n"]}[@@ocaml.doc ""]
type nonrec select_aggregate_resource_config_request =
  {
  next_token: string option
    [@ocaml.doc
      "The nextToken string returned in a previous request that you use to request the next page of results in a paginated response. \n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of query results returned on each page. Config also allows the Limit request parameter.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of query results returned on each page. \n"];
  configuration_aggregator_name: string
    [@ocaml.doc "The name of the configuration aggregator.\n"];
  expression: string [@ocaml.doc "The SQL query SELECT command. \n"]}
[@@ocaml.doc ""]
type nonrec resource_concurrent_modification_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Two users are trying to modify the same query at the same time. Wait for a moment and try again.\n"]
type nonrec put_stored_query_response =
  {
  query_arn: string option
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the query. For example, arn:partition:service:region:account-id:resource-type/resource-name/resource-id.\n"]}
[@@ocaml.doc ""]
type nonrec put_stored_query_request =
  {
  tags: tag list option [@ocaml.doc "A list of [Tags] object.\n"];
  stored_query: stored_query
    [@ocaml.doc
      "A list of [StoredQuery] objects. The mandatory fields are [QueryName] and [Expression].\n\n  When you are creating a query, you must provide a query name and an expression. When you are updating a query, you must provide a query name but updating the description is optional.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec conflict_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutServiceLinkedConfigurationRecorder.html}PutServiceLinkedConfigurationRecorder}, you cannot create a service-linked recorder because a service-linked recorder already exists for the specified service.\n\n For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DeleteServiceLinkedConfigurationRecorder.html}DeleteServiceLinkedConfigurationRecorder}, you cannot delete the service-linked recorder because it is currently in use by the linked Amazon Web Services service.\n \n  For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DeleteDeliveryChannel.html}DeleteDeliveryChannel}, you cannot delete the specified delivery channel because the customer managed configuration recorder is running. Use the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_StopConfigurationRecorder.html}StopConfigurationRecorder} operation to stop the customer managed configuration recorder.\n  \n   For {{:https://docs.aws.amazon.com/config/latest/APIReference/API_AssociateResourceTypes.html}AssociateResourceTypes} and {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DisassociateResourceTypes.html}DisassociateResourceTypes}, one of the following errors:\n   \n    {ul\n          {-  For service-linked configuration recorders, the configuration recorder is not in use by the service. No association or dissociation of resource types is permitted.\n              \n               }\n          {-  For service-linked configuration recorders, your requested change to the configuration recorder has been denied by its linked Amazon Web Services service.\n              \n               }\n          }\n  "]
type nonrec put_service_linked_configuration_recorder_response =
  {
  name: string option
    [@ocaml.doc
      "The name of the specified configuration recorder.\n\n For service-linked configuration recorders, Config automatically assigns a name that has the prefix \"[AWS]\" to the new service-linked configuration recorder.\n "];
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the specified configuration recorder.\n"]}
[@@ocaml.doc ""]
type nonrec put_service_linked_configuration_recorder_request =
  {
  tags: tag list option
    [@ocaml.doc
      "The tags for a service-linked configuration recorder. Each tag consists of a key and an optional value, both of which you define.\n"];
  service_principal: string
    [@ocaml.doc
      "The service principal of the Amazon Web Services service for the service-linked configuration recorder that you want to create.\n"]}
[@@ocaml.doc ""]
type nonrec max_number_of_retention_configurations_exceeded_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "Failed to add the retention configuration because a retention configuration with that name already exists.\n"]
type nonrec retention_configuration =
  {
  retention_period_in_days: int
    [@ocaml.doc
      "Number of days Config stores your historical information.\n\n  Currently, only applicable to the configuration item history.\n  \n   "];
  name: string
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
  retention_period_in_days: int
    [@ocaml.doc
      "Number of days Config stores your historical information.\n\n  Currently, only applicable to the configuration item history.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec no_running_configuration_recorder_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "There is no configuration recorder running.\n"]
type nonrec max_active_resources_exceeded_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have reached the limit of active custom resource types in your account. There is a limit of 100,000. Delete unused resources using {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DeleteResourceConfig.html}DeleteResourceConfig} .\n"]
type nonrec put_resource_config_request =
  {
  tags: tags option
    [@ocaml.doc
      "Tags associated with the resource.\n\n  This field is not to be confused with the Amazon Web Services-wide tag feature for Amazon Web Services resources. Tags for [PutResourceConfig] are tags that you supply for the configuration items of your custom resources.\n  \n   "];
  configuration: string
    [@ocaml.doc
      "The configuration object of the resource in valid JSON format. It must match the schema registered with CloudFormation.\n\n  The configuration JSON must not exceed 64 KB.\n  \n   "];
  resource_name: string option [@ocaml.doc "Name of the resource.\n"];
  resource_id: string [@ocaml.doc "Unique identifier of the resource.\n"];
  schema_version_id: string
    [@ocaml.doc
      "Version of the schema registered for the ResourceType in CloudFormation.\n"];
  resource_type: string
    [@ocaml.doc
      "The type of the resource. The custom resource type must be registered with CloudFormation. \n\n  You cannot use the organization names \226\128\156amzn\226\128\157, \226\128\156amazon\226\128\157, \226\128\156alexa\226\128\157, \226\128\156custom\226\128\157 with custom resource types. It is the first part of the ResourceType up to the first ::.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec remediation_exception =
  {
  expiration_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time when the remediation exception will be deleted.\n"];
  message: string option
    [@ocaml.doc "An explanation of an remediation exception.\n"];
  resource_id: string
    [@ocaml.doc "The ID of the resource (for example., sg-xxxxxx).\n"];
  resource_type: string [@ocaml.doc "The type of a resource.\n"];
  config_rule_name: string [@ocaml.doc "The name of the Config rule.\n"]}
[@@ocaml.doc
  "An object that represents the details about the remediation exception. The details include the rule name, an explanation of an exception, the time when the exception will be deleted, the resource ID, and resource type. \n"]
type nonrec failed_remediation_exception_batch =
  {
  failed_items: remediation_exception list option
    [@ocaml.doc
      "Returns remediation exception resource key object of the failed items.\n"];
  failure_message: string option
    [@ocaml.doc
      "Returns a failure message. For example, the auto-remediation has failed.\n"]}
[@@ocaml.doc
  "List of each of the failed remediation exceptions with specific reasons.\n"]
type nonrec put_remediation_exceptions_response =
  {
  failed_batches: failed_remediation_exception_batch list option
    [@ocaml.doc
      "Returns a list of failed remediation exceptions batch objects. Each object in the batch consists of a list of failed items and failure messages.\n"]}
[@@ocaml.doc ""]
type nonrec remediation_exception_resource_key =
  {
  resource_id: string option
    [@ocaml.doc "The ID of the resource (for example., sg-xxxxxx).\n"];
  resource_type: string option [@ocaml.doc "The type of a resource.\n"]}
[@@ocaml.doc
  "The details that identify a resource within Config, including the resource type and resource ID. \n"]
type nonrec put_remediation_exceptions_request =
  {
  expiration_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The exception is automatically deleted after the expiration date.\n"];
  message: string option
    [@ocaml.doc "The message contains an explanation of the exception.\n"];
  resource_keys: remediation_exception_resource_key list
    [@ocaml.doc
      "An exception list of resource exception keys to be processed with the current request. Config adds exception for each resource key. For example, Config adds 3 exceptions for 3 resource keys. \n"];
  config_rule_name: string
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
  (string * remediation_parameter_value) list[@@ocaml.doc ""]
type nonrec ssm_controls =
  {
  error_percentage: int option
    [@ocaml.doc
      "The percentage of errors that are allowed before SSM stops running automations on non-compliant resources for that specific rule. You can specify a percentage of errors, for example 10%. If you do not specifiy a percentage, the default is 50%. For example, if you set the ErrorPercentage to 40% for 10 non-compliant resources, then SSM stops running the automations when the fifth error is received. \n"];
  concurrent_execution_rate_percentage: int option
    [@ocaml.doc
      "The maximum percentage of remediation actions allowed to run in parallel on the non-compliant resources for that specific rule. You can specify a percentage, such as 10%. The default value is 10. \n"]}
[@@ocaml.doc
  "Amazon Web Services Systems Manager (SSM) specific remediation controls.\n"]
type nonrec execution_controls =
  {
  ssm_controls: ssm_controls option [@ocaml.doc "A SsmControls object.\n"]}
[@@ocaml.doc "The controls that Config uses for executing remediations.\n"]
type nonrec remediation_configuration =
  {
  created_by_service: string option
    [@ocaml.doc
      "Name of the service that owns the service-linked rule, if applicable.\n"];
  arn: string option
    [@ocaml.doc "Amazon Resource Name (ARN) of remediation configuration.\n"];
  retry_attempt_seconds: int option
    [@ocaml.doc
      "Time window to determine whether or not to add a remediation exception to prevent infinite remediation attempts. If [MaximumAutomaticAttempts] remediation attempts have been made under [RetryAttemptSeconds], a remediation exception will be added to the resource. If you do not select a number, the default is 60 seconds. \n\n For example, if you specify [RetryAttemptSeconds] as 50 seconds and [MaximumAutomaticAttempts] as 5, Config will run auto-remediations 5 times within 50 seconds before adding a remediation exception to the resource.\n "];
  maximum_automatic_attempts: int option
    [@ocaml.doc
      "The maximum number of failed attempts for auto-remediation. If you do not select a number, the default is 5.\n\n For example, if you specify MaximumAutomaticAttempts as 5 with RetryAttemptSeconds as 50 seconds, Config will put a RemediationException on your behalf for the failing resource after the 5th failed attempt within 50 seconds.\n "];
  execution_controls: execution_controls option
    [@ocaml.doc "An ExecutionControls object.\n"];
  automatic: bool option
    [@ocaml.doc "The remediation is triggered automatically.\n"];
  resource_type: string option [@ocaml.doc "The type of a resource. \n"];
  parameters: remediation_parameters option
    [@ocaml.doc "An object of the RemediationParameterValue.\n"];
  target_version: string option
    [@ocaml.doc
      "Version of the target. For example, version of the SSM document.\n\n  If you make backward incompatible changes to the SSM document, you must call PutRemediationConfiguration API again to ensure the remediations can run.\n  \n   "];
  target_id: string
    [@ocaml.doc "Target ID is the name of the SSM document.\n"];
  target_type: remediation_target_type
    [@ocaml.doc
      "The type of the target. Target executes remediation. For example, SSM document.\n"];
  config_rule_name: string [@ocaml.doc "The name of the Config rule.\n"]}
[@@ocaml.doc
  "An object that represents the details about the remediation configuration that includes the remediation action, parameters, and data to execute the action.\n"]
type nonrec failed_remediation_batch =
  {
  failed_items: remediation_configuration list option
    [@ocaml.doc "Returns remediation configurations of the failed items.\n"];
  failure_message: string option
    [@ocaml.doc
      "Returns a failure message. For example, the resource is already compliant.\n"]}
[@@ocaml.doc
  "List of each of the failed remediations with specific reasons.\n"]
type nonrec put_remediation_configurations_response =
  {
  failed_batches: failed_remediation_batch list option
    [@ocaml.doc "Returns a list of failed remediation batch objects.\n"]}
[@@ocaml.doc ""]
type nonrec put_remediation_configurations_request =
  {
  remediation_configurations: remediation_configuration list
    [@ocaml.doc "A list of remediation configuration objects.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec organization_conformance_pack_template_validation_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have specified a template that is not valid or supported.\n"]
type nonrec organization_all_features_not_enabled_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "Config resource cannot be created because your organization does not have all features enabled.\n"]
type nonrec organization_access_denied_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "For [PutConfigurationAggregator] API, you can see this exception for the following reasons:\n\n {ul\n       {-  No permission to call [EnableAWSServiceAccess] API\n           \n            }\n       {-  The configuration aggregator cannot be updated because your Amazon Web Services Organization management account or the delegated administrator role changed. Delete this aggregator and create a new one with the current Amazon Web Services Organization.\n           \n            }\n       {-  The configuration aggregator is associated with a previous Amazon Web Services Organization and Config cannot aggregate data with current Amazon Web Services Organization. Delete this aggregator and create a new one with the current Amazon Web Services Organization.\n           \n            }\n       {-  You are not a registered delegated administrator for Config with permissions to call [ListDelegatedAdministrators] API. Ensure that the management account registers delagated administrator for Config service principal name before the delegated administrator creates an aggregator.\n           \n            }\n       }\n   For all [OrganizationConfigRule] and [OrganizationConformancePack] APIs, Config throws an exception if APIs are called from member accounts. All APIs must be called from organization management account.\n   "]
type nonrec no_available_organization_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "Organization is no longer available.\n"]
type nonrec max_number_of_organization_conformance_packs_exceeded_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have reached the limit of the number of organization conformance packs you can create in an account. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.\n"]
type nonrec put_organization_conformance_pack_response =
  {
  organization_conformance_pack_arn: string option
    [@ocaml.doc "ARN of the organization conformance pack.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec conformance_pack_input_parameter =
  {
  parameter_value: string
    [@ocaml.doc "Another part of the key-value pair. \n"];
  parameter_name: string [@ocaml.doc "One part of a key-value pair.\n"]}
[@@ocaml.doc
  "Input parameters in the form of key-value pairs for the conformance pack, both of which you define. Keys can have a maximum character length of 255 characters, and values can have a maximum length of 4096 characters.\n"]
type nonrec put_organization_conformance_pack_request =
  {
  excluded_accounts: string list option
    [@ocaml.doc
      "A list of Amazon Web Services accounts to be excluded from an organization conformance pack while deploying a conformance pack.\n"];
  conformance_pack_input_parameters:
    conformance_pack_input_parameter list option
    [@ocaml.doc "A list of [ConformancePackInputParameter] objects.\n"];
  delivery_s3_key_prefix: string option
    [@ocaml.doc
      "The prefix for the Amazon S3 bucket.\n\n  This field is optional.\n  \n   "];
  delivery_s3_bucket: string option
    [@ocaml.doc
      "The name of the Amazon S3 bucket where Config stores conformance pack templates.\n\n  This field is optional. If used, it must be prefixed with [awsconfigconforms].\n  \n   "];
  template_body: string option
    [@ocaml.doc
      "A string containing full conformance pack template body. Structure containing the template body with a minimum length of 1 byte and a maximum length of 51,200 bytes.\n"];
  template_s3_uri: string option
    [@ocaml.doc
      "Location of file containing the template body. The uri must point to the conformance pack template (max size: 300 KB).\n\n  You must have access to read Amazon S3 bucket. In addition, in order to ensure a successful deployment, the template object must not be in an {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-class-intro.html}archived storage class} if this parameter is passed.\n  \n   "];
  organization_conformance_pack_name: string
    [@ocaml.doc
      "Name of the organization conformance pack you want to create.\n"]}
[@@ocaml.doc ""]
type nonrec max_number_of_organization_config_rules_exceeded_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have reached the limit of the number of organization Config rules you can create. For more information, see see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.\n"]
type nonrec put_organization_config_rule_response =
  {
  organization_config_rule_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an organization Config rule.\n"]}
[@@ocaml.doc ""]
type nonrec maximum_execution_frequency =
  | TwentyFour_Hours [@ocaml.doc ""]
  | Twelve_Hours [@ocaml.doc ""]
  | Six_Hours [@ocaml.doc ""]
  | Three_Hours [@ocaml.doc ""]
  | One_Hour [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec organization_managed_rule_metadata =
  {
  tag_value_scope: string option
    [@ocaml.doc
      "The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key).\n"];
  tag_key_scope: string option
    [@ocaml.doc
      "One part of a key-value pair that make up a tag. A key is a general label that acts like a category for more specific tag values. \n"];
  resource_id_scope: string option
    [@ocaml.doc
      "The ID of the Amazon Web Services resource that was evaluated.\n"];
  resource_types_scope: string list option
    [@ocaml.doc
      "The type of the Amazon Web Services resource that was evaluated.\n"];
  maximum_execution_frequency: maximum_execution_frequency option
    [@ocaml.doc
      "The maximum frequency with which Config runs evaluations for a rule. This is for an Config managed rule that is triggered at a periodic frequency.\n\n  By default, rules with a periodic trigger are evaluated every 24 hours. To change the frequency, specify a valid value for the [MaximumExecutionFrequency] parameter.\n  \n   "];
  input_parameters: string option
    [@ocaml.doc
      "A string, in JSON format, that is passed to your organization Config rule Lambda function.\n"];
  rule_identifier: string
    [@ocaml.doc
      "For organization config managed rules, a predefined identifier from a list. For example, [IAM_PASSWORD_POLICY] is a managed rule. To reference a managed rule, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html}Using Config managed rules}.\n"];
  description: string option
    [@ocaml.doc
      "The description that you provide for your organization Config rule.\n"]}
[@@ocaml.doc
  "An object that specifies organization managed rule metadata such as resource type and ID of Amazon Web Services resource along with the rule identifier. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.\n"]
type nonrec organization_config_rule_trigger_type =
  | SCHEDULED_NOTIFICATION [@ocaml.doc ""]
  | OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION [@ocaml.doc ""]
  | CONFIGURATION_ITEM_CHANGE_NOTIFICATION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec organization_custom_rule_metadata =
  {
  tag_value_scope: string option
    [@ocaml.doc
      "The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key). \n"];
  tag_key_scope: string option
    [@ocaml.doc
      "One part of a key-value pair that make up a tag. A key is a general label that acts like a category for more specific tag values. \n"];
  resource_id_scope: string option
    [@ocaml.doc
      "The ID of the Amazon Web Services resource that was evaluated.\n"];
  resource_types_scope: string list option
    [@ocaml.doc
      "The type of the Amazon Web Services resource that was evaluated.\n"];
  maximum_execution_frequency: maximum_execution_frequency option
    [@ocaml.doc
      "The maximum frequency with which Config runs evaluations for a rule. Your custom rule is triggered when Config delivers the configuration snapshot. For more information, see [ConfigSnapshotDeliveryProperties].\n\n  By default, rules with a periodic trigger are evaluated every 24 hours. To change the frequency, specify a valid value for the [MaximumExecutionFrequency] parameter.\n  \n   "];
  input_parameters: string option
    [@ocaml.doc
      "A string, in JSON format, that is passed to your organization Config rule Lambda function.\n"];
  organization_config_rule_trigger_types:
    organization_config_rule_trigger_type list
    [@ocaml.doc
      "The type of notification that triggers Config to run an evaluation for a rule. You can specify the following notification types:\n\n {ul\n       {-   [ConfigurationItemChangeNotification] - Triggers an evaluation when Config delivers a configuration item as a result of a resource change.\n           \n            }\n       {-   [OversizedConfigurationItemChangeNotification] - Triggers an evaluation when Config delivers an oversized configuration item. Config may generate this notification type when a resource changes and the notification exceeds the maximum size allowed by Amazon SNS.\n           \n            }\n       {-   [ScheduledNotification] - Triggers a periodic evaluation at the frequency specified for [MaximumExecutionFrequency].\n           \n            }\n       }\n  "];
  lambda_function_arn: string [@ocaml.doc "The lambda function ARN.\n"];
  description: string option
    [@ocaml.doc
      "The description that you provide for your organization Config rule.\n"]}
[@@ocaml.doc
  "An object that specifies organization custom rule metadata such as resource type, resource ID of Amazon Web Services resource, Lambda function ARN, and organization trigger types that trigger Config to evaluate your Amazon Web Services resources against a rule. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.\n"]
type nonrec organization_config_rule_trigger_type_no_s_n =
  | OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION [@ocaml.doc ""]
  | CONFIGURATION_ITEM_CHANGE_NOTIFICATION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec organization_custom_policy_rule_metadata =
  {
  debug_log_delivery_accounts: string list option
    [@ocaml.doc
      "A list of accounts that you can enable debug logging for your organization Config Custom Policy rule. List is null when debug logging is enabled for all accounts.\n"];
  policy_text: string
    [@ocaml.doc
      "The policy definition containing the logic for your organization Config Custom Policy rule.\n"];
  policy_runtime: string
    [@ocaml.doc
      "The runtime system for your organization Config Custom Policy rules. Guard is a policy-as-code language that allows you to write policies that are enforced by Config Custom Policy rules. For more information about Guard, see the {{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}.\n"];
  tag_value_scope: string option
    [@ocaml.doc
      "The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key).\n"];
  tag_key_scope: string option
    [@ocaml.doc
      "One part of a key-value pair that make up a tag. A key is a general label that acts like a category for more specific tag values.\n"];
  resource_id_scope: string option
    [@ocaml.doc
      "The ID of the Amazon Web Services resource that was evaluated.\n"];
  resource_types_scope: string list option
    [@ocaml.doc
      "The type of the Amazon Web Services resource that was evaluated.\n"];
  maximum_execution_frequency: maximum_execution_frequency option
    [@ocaml.doc
      "The maximum frequency with which Config runs evaluations for a rule. Your Config Custom Policy rule is triggered when Config delivers the configuration snapshot. For more information, see [ConfigSnapshotDeliveryProperties].\n"];
  input_parameters: string option
    [@ocaml.doc
      "A string, in JSON format, that is passed to your organization Config Custom Policy rule.\n"];
  organization_config_rule_trigger_types:
    organization_config_rule_trigger_type_no_s_n list option
    [@ocaml.doc
      "The type of notification that initiates Config to run an evaluation for a rule. For Config Custom Policy rules, Config supports change-initiated notification types:\n\n {ul\n       {-   [ConfigurationItemChangeNotification] - Initiates an evaluation when Config delivers a configuration item as a result of a resource change.\n           \n            }\n       {-   [OversizedConfigurationItemChangeNotification] - Initiates an evaluation when Config delivers an oversized configuration item. Config may generate this notification type when a resource changes and the notification exceeds the maximum size allowed by Amazon SNS.\n           \n            }\n       }\n  "];
  description: string option
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
  excluded_accounts: string list option
    [@ocaml.doc
      "A comma-separated list of accounts that you want to exclude from an organization Config rule.\n"];
  organization_custom_rule_metadata: organization_custom_rule_metadata option
    [@ocaml.doc
      "An [OrganizationCustomRuleMetadata] object. This object specifies organization custom rule metadata such as resource type, resource ID of Amazon Web Services resource, Lambda function ARN, and organization trigger types that trigger Config to evaluate your Amazon Web Services resources against a rule. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.\n"];
  organization_managed_rule_metadata:
    organization_managed_rule_metadata option
    [@ocaml.doc
      "An [OrganizationManagedRuleMetadata] object. This object specifies organization managed rule metadata such as resource type and ID of Amazon Web Services resource along with the rule identifier. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.\n"];
  organization_config_rule_name: string
    [@ocaml.doc "The name that you assign to an organization Config rule.\n"]}
[@@ocaml.doc ""]
type nonrec compliance_type =
  | Insufficient_Data [@ocaml.doc ""]
  | Not_Applicable [@ocaml.doc ""]
  | Non_Compliant [@ocaml.doc ""]
  | Compliant [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec external_evaluation =
  {
  ordering_timestamp: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the compliance was recorded. \n"];
  annotation: string option
    [@ocaml.doc
      "Supplementary information about the reason of compliance. For example, this task was completed on a specific date.\n"];
  compliance_type: compliance_type
    [@ocaml.doc
      "The compliance of the Amazon Web Services resource. The valid values are [COMPLIANT, NON_COMPLIANT, ] and [NOT_APPLICABLE].\n"];
  compliance_resource_id: string
    [@ocaml.doc
      "The evaluated compliance resource ID. Config accepts only Amazon Web Services account ID.\n"];
  compliance_resource_type: string
    [@ocaml.doc
      "The evaluated compliance resource type. Config accepts [AWS::::Account] resource type.\n"]}
[@@ocaml.doc
  "Identifies an Amazon Web Services resource and indicates whether it complies with the Config rule that it was evaluated against.\n"]
type nonrec put_external_evaluation_request =
  {
  external_evaluation: external_evaluation
    [@ocaml.doc
      "An [ExternalEvaluation] object that provides details about compliance.\n"];
  config_rule_name: string [@ocaml.doc "The name of the Config rule.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_result_token_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The specified [ResultToken] is not valid.\n"]
type nonrec evaluation =
  {
  ordering_timestamp: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time of the event in Config that triggered the evaluation. For event-based evaluations, the time indicates when Config created the configuration item that triggered the evaluation. For periodic evaluations, the time indicates when Config triggered the evaluation at the frequency that you specified (for example, every 24 hours).\n"];
  annotation: string option
    [@ocaml.doc
      "Supplementary information about how the evaluation determined the compliance.\n"];
  compliance_type: compliance_type
    [@ocaml.doc
      "Indicates whether the Amazon Web Services resource complies with the Config rule that it was evaluated against.\n\n For the [Evaluation] data type, Config supports only the [COMPLIANT], [NON_COMPLIANT], and [NOT_APPLICABLE] values. Config does not support the [INSUFFICIENT_DATA] value for this data type.\n \n  Similarly, Config does not accept [INSUFFICIENT_DATA] as the value for [ComplianceType] from a [PutEvaluations] request. For example, an Lambda function for a custom Config rule cannot pass an [INSUFFICIENT_DATA] value to Config.\n  "];
  compliance_resource_id: string
    [@ocaml.doc
      "The ID of the Amazon Web Services resource that was evaluated.\n"];
  compliance_resource_type: string
    [@ocaml.doc
      "The type of Amazon Web Services resource that was evaluated.\n"]}
[@@ocaml.doc
  "Identifies an Amazon Web Services resource and indicates whether it complies with the Config rule that it was evaluated against.\n"]
type nonrec put_evaluations_response =
  {
  failed_evaluations: evaluation list option
    [@ocaml.doc
      "Requests that failed because of a client or server error.\n"]}
[@@ocaml.doc "\n"]
type nonrec put_evaluations_request =
  {
  test_mode: bool option
    [@ocaml.doc
      "Use this parameter to specify a test run for [PutEvaluations]. You can verify whether your Lambda function will deliver evaluation results to Config. No updates occur to your existing evaluations, and evaluation results are not sent to Config.\n\n  When [TestMode] is [true], [PutEvaluations] doesn't require a valid value for the [ResultToken] parameter, but the value cannot be null.\n  \n   "];
  result_token: string
    [@ocaml.doc
      "An encrypted token that associates an evaluation with an Config rule. Identifies the rule and the event that triggered the evaluation.\n"];
  evaluations: evaluation list option
    [@ocaml.doc
      "The assessments that the Lambda function performs. Each evaluation identifies an Amazon Web Services resource and indicates whether it complies with the Config rule that invokes the Lambda function.\n"]}
[@@ocaml.doc "\n"]
type nonrec no_such_bucket_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The specified Amazon S3 bucket does not exist.\n"]
type nonrec no_available_configuration_recorder_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "There are no customer managed configuration recorders available to record your resources. Use the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutConfigurationRecorder.html}PutConfigurationRecorder} operation to create the customer managed configuration recorder.\n"]
type nonrec max_number_of_delivery_channels_exceeded_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have reached the limit of the number of delivery channels you can create.\n"]
type nonrec invalid_sns_topic_arn_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The specified Amazon SNS topic does not exist.\n"]
type nonrec invalid_s3_kms_key_arn_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The specified Amazon KMS Key ARN is not valid.\n"]
type nonrec invalid_s3_key_prefix_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The specified Amazon S3 key prefix is not valid.\n"]
type nonrec invalid_delivery_channel_name_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The specified delivery channel name is not valid.\n"]
type nonrec insufficient_delivery_policy_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "Your Amazon S3 bucket policy does not allow Config to write to it.\n"]
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
  sns_topic_ar_n: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Amazon SNS topic to which Config sends notifications about configuration changes.\n\n If you choose a topic from another account, the topic must have policies that grant access permissions to Config. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/sns-topic-policy.html}Permissions for the Amazon SNS Topic} in the {i Config Developer Guide}.\n "];
  s3_kms_key_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Key Management Service (KMS ) KMS key (KMS key) used to encrypt objects delivered by Config. Must belong to the same Region as the destination S3 bucket.\n"];
  s3_key_prefix: string option
    [@ocaml.doc "The prefix for the specified Amazon S3 bucket.\n"];
  s3_bucket_name: string option
    [@ocaml.doc
      "The name of the Amazon S3 bucket to which Config delivers configuration snapshots and configuration history files.\n\n If you specify a bucket that belongs to another Amazon Web Services account, that bucket must have policies that grant access permissions to Config. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-policy.html}Permissions for the Amazon S3 Bucket} in the {i Config Developer Guide}.\n "];
  name: string option
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
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have reached the limit of the number of conformance packs you can create in an account. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.\n"]
type nonrec conformance_pack_template_validation_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have specified a template that is not valid or supported.\n"]
type nonrec put_conformance_pack_response =
  {
  conformance_pack_arn: string option
    [@ocaml.doc "ARN of the conformance pack.\n"]}[@@ocaml.doc ""]
type nonrec put_conformance_pack_request =
  {
  template_ssm_document_details: template_ssm_document_details option
    [@ocaml.doc
      "An object of type [TemplateSSMDocumentDetails], which contains the name or the Amazon Resource Name (ARN) of the Amazon Web Services Systems Manager document (SSM document) and the version of the SSM document that is used to create a conformance pack.\n"];
  conformance_pack_input_parameters:
    conformance_pack_input_parameter list option
    [@ocaml.doc "A list of [ConformancePackInputParameter] objects.\n"];
  delivery_s3_key_prefix: string option
    [@ocaml.doc
      "The prefix for the Amazon S3 bucket. \n\n  This field is optional.\n  \n   "];
  delivery_s3_bucket: string option
    [@ocaml.doc
      "The name of the Amazon S3 bucket where Config stores conformance pack templates.\n\n  This field is optional.\n  \n   "];
  template_body: string option
    [@ocaml.doc
      "A string containing the full conformance pack template body. The structure containing the template body has a minimum length of 1 byte and a maximum length of 51,200 bytes.\n\n  You can use a YAML template with two resource types: Config rule ([AWS::Config::ConfigRule]) and remediation action ([AWS::Config::RemediationConfiguration]).\n  \n   "];
  template_s3_uri: string option
    [@ocaml.doc
      "The location of the file containing the template body ([s3://bucketname/prefix]). The uri must point to a conformance pack template (max size: 300 KB) that is located in an Amazon S3 bucket in the same Region as the conformance pack. \n\n  You must have access to read Amazon S3 bucket. In addition, in order to ensure a successful deployment, the template object must not be in an {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-class-intro.html}archived storage class} if this parameter is passed.\n  \n   "];
  conformance_pack_name: string
    [@ocaml.doc
      "The unique name of the conformance pack you want to deploy.\n"]}
[@@ocaml.doc ""]
type nonrec max_number_of_configuration_recorders_exceeded_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have reached the limit of the number of configuration recorders you can create.\n"]
type nonrec invalid_role_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have provided a null or empty Amazon Resource Name (ARN) for the IAM role assumed by Config and used by the customer managed configuration recorder.\n"]
type nonrec invalid_recording_group_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "One of the following errors:\n\n {ul\n       {-  You have provided a combination of parameter values that is not valid. For example:\n           \n            {ul\n                  {-  Setting the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true], but providing a non-empty list for the [resourceTypes]field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}.\n                      \n                       }\n                  {-  Setting the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true], but also setting the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [EXCLUSION_BY_RESOURCE_TYPES].\n                      \n                       }\n                  \n        }\n         }\n       {-  Every parameter is either null, false, or empty.\n           \n            }\n       {-  You have reached the limit of the number of resource types you can provide for the recording group.\n           \n            }\n       {-  You have provided resource types or a recording strategy that are not valid.\n           \n            }\n       }\n  "]
type nonrec invalid_configuration_recorder_name_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have provided a name for the customer managed configuration recorder that is not valid.\n"]
type nonrec exclusion_by_resource_types =
  {
  resource_types: resource_type list option
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
  resource_types: resource_type list option
    [@ocaml.doc
      "A comma-separated list that specifies which resource types Config records.\n\n For a list of valid [resourceTypes] values, see the {b Resource Type Value} column in {{:https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources}Supported Amazon Web Services resource Types} in the {i Config developer guide}.\n \n    {b Required and optional fields} \n   \n    Optionally, you can set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [INCLUSION_BY_RESOURCE_TYPES].\n    \n     To record all configuration changes, set the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true], and either omit this field or don't specify any resource types in this field. If you set the [allSupported] field to [false] and specify values for [resourceTypes], when Config adds support for a new type of resource, it will not record resources of that type unless you manually add that type to your recording group.\n     \n         {b Region availability} \n        \n         Before specifying a resource type for Config to track, check {{:https://docs.aws.amazon.com/config/latest/developerguide/what-is-resource-config-coverage.html}Resource Coverage by Region Availability} to see if the resource type is supported in the Amazon Web Services Region where you set up Config. If a resource type is supported by Config in at least one Region, you can enable the recording of that resource type in all Regions supported by Config, even if the specified resource type is not supported in the Amazon Web Services Region where you set up Config.\n         \n          "];
  include_global_resource_types: bool option
    [@ocaml.doc
      "This option is a bundle which only applies to the global IAM resource types: IAM users, groups, roles, and customer managed policies. These global IAM resource types can only be recorded by Config in Regions where Config was available before February 2022. You cannot be record the global IAM resouce types in Regions supported by Config after February 2022. For a list of those Regions, see {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html#select-resources-all}Recording Amazon Web Services Resources | Global Resources}.\n\n   {b Aurora global clusters are recorded in all enabled Regions} \n  \n   The [AWS::RDS::GlobalCluster] resource type will be recorded in all supported Config Regions where the configuration recorder is enabled, even if [includeGlobalResourceTypes] is set[false]. The [includeGlobalResourceTypes] option is a bundle which only applies to IAM users, groups, roles, and customer managed policies. \n   \n    If you do not want to record [AWS::RDS::GlobalCluster] in all enabled Regions, use one of the following recording strategies:\n    \n     {ol\n           {-   {b Record all current and future resource types with exclusions} ([EXCLUSION_BY_RESOURCE_TYPES]), or\n               \n                }\n           {-   {b Record specific resource types} ([INCLUSION_BY_RESOURCE_TYPES]).\n               \n                }\n           }\n   For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html#select-resources-all}Selecting Which Resources are Recorded} in the {i Config developer guide}.\n   \n       {b includeGlobalResourceTypes and the exclusion recording strategy} \n      \n       The [includeGlobalResourceTypes] field has no impact on the [EXCLUSION_BY_RESOURCE_TYPES] recording strategy. This means that the global IAM resource types (IAM users, groups, roles, and customer managed policies) will not be automatically added as exclusions for [exclusionByResourceTypes] when [includeGlobalResourceTypes] is set to [false].\n       \n        The [includeGlobalResourceTypes] field should only be used to modify the [AllSupported] field, as the default for the [AllSupported] field is to record configuration changes for all supported resource types excluding the global IAM resource types. To include the global IAM resource types when [AllSupported] is set to [true], make sure to set [includeGlobalResourceTypes] to [true].\n        \n         To exclude the global IAM resource types for the [EXCLUSION_BY_RESOURCE_TYPES] recording strategy, you need to manually add them to the [resourceTypes] field of [exclusionByResourceTypes].\n         \n             {b Required and optional fields} \n            \n             Before you set this field to [true], set the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true]. Optionally, you can set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [ALL_SUPPORTED_RESOURCE_TYPES].\n             \n                 {b Overriding fields} \n                \n                 If you set this field to [false] but list global IAM resource types in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}, Config will still record configuration changes for those specified resource types {i regardless} of if you set the [includeGlobalResourceTypes] field to false.\n                 \n                  If you do not want to record configuration changes to the global IAM resource types (IAM users, groups, roles, and customer managed policies), make sure to not list them in the [resourceTypes] field in addition to setting the [includeGlobalResourceTypes] field to false.\n                  \n                   "];
  all_supported: bool option
    [@ocaml.doc
      "Specifies whether Config records configuration changes for all supported resource types, excluding the global IAM resource types.\n\n If you set this field to [true], when Config adds support for a new resource type, Config starts recording resources of that type automatically.\n \n  If you set this field to [true], you cannot enumerate specific resource types to record in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}, or to exclude in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ExclusionByResourceTypes.html}ExclusionByResourceTypes}.\n  \n     {b Region availability} \n    \n     Check {{:https://docs.aws.amazon.com/config/latest/developerguide/what-is-resource-config-coverage.html}Resource Coverage by Region Availability} to see if a resource type is supported in the Amazon Web Services Region where you set up Config.\n     \n      "]}
[@@ocaml.doc
  "Specifies which resource types Config records for configuration changes. By default, Config records configuration changes for all current and future supported resource types in the Amazon Web Services Region where you have enabled Config, excluding the global IAM resource types: IAM users, groups, roles, and customer managed policies.\n\n In the recording group, you specify whether you want to record all supported current and future supported resource types or to include or exclude specific resources types. For a list of supported resource types, see {{:https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources}Supported Resource Types} in the {i Config developer guide}.\n \n  If you don't want Config to record all current and future supported resource types (excluding the global IAM resource types), use one of the following recording strategies:\n  \n   {ol\n         {-   {b Record all current and future resource types with exclusions} ([EXCLUSION_BY_RESOURCE_TYPES]), or\n             \n              }\n         {-   {b Record specific resource types} ([INCLUSION_BY_RESOURCE_TYPES]).\n             \n              }\n         }\n   If you use the recording strategy to {b Record all current and future resource types} ([ALL_SUPPORTED_RESOURCE_TYPES]), you can use the flag [includeGlobalResourceTypes] to include the global IAM resource types in your recording.\n   \n      {b Aurora global clusters are recorded in all enabled Regions} \n     \n      The [AWS::RDS::GlobalCluster] resource type will be recorded in all supported Config Regions where the configuration recorder is enabled.\n      \n       If you do not want to record [AWS::RDS::GlobalCluster] in all enabled Regions, use the [EXCLUSION_BY_RESOURCE_TYPES] or [INCLUSION_BY_RESOURCE_TYPES] recording strategy.\n       \n        "]
type nonrec recording_frequency =
  | DAILY [@ocaml.doc ""]
  | CONTINUOUS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec recording_mode_override =
  {
  recording_frequency: recording_frequency
    [@ocaml.doc
      "The recording frequency that will be applied to all the resource types specified in the override.\n\n {ul\n       {-  Continuous recording allows you to record configuration changes continuously whenever a change occurs.\n           \n            }\n       {-  Daily recording allows you to receive a configuration item (CI) representing the most recent state of your resources over the last 24-hour period, only if it\226\128\153s different from the previous CI recorded. \n           \n            }\n       }\n    Firewall Manager depends on continuous recording to monitor your resources. If you are using Firewall Manager, it is recommended that you set the recording frequency to Continuous.\n    \n     "];
  resource_types: resource_type list
    [@ocaml.doc
      "A comma-separated list that specifies which resource types Config includes in the override.\n\n  Daily recording cannot be specified for the following resource types:\n  \n   {ul\n         {-   [AWS::Config::ResourceCompliance] \n             \n              }\n         {-   [AWS::Config::ConformancePackCompliance] \n             \n              }\n         {-   [AWS::Config::ConfigurationRecorder] \n             \n              }\n         }\n   "];
  description: string option
    [@ocaml.doc "A description that you provide for the override.\n"]}
[@@ocaml.doc
  "An object for you to specify your overrides for the recording mode.\n"]
type nonrec recording_mode =
  {
  recording_mode_overrides: recording_mode_override list option
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
  service_principal: string option
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
  role_ar_n: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role assumed by Config and used by the specified configuration recorder.\n\n   {b The server will reject a request without a defined [roleARN] for the configuration recorder} \n  \n   While the API model does not require this field, the server will reject a request without a defined [roleARN] for the configuration recorder.\n   \n     {b Policies and compliance results} \n    \n      {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html}IAM policies} and {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies.html}other policies managed in Organizations} can impact whether Config has permissions to record configuration changes for your resources. Additionally, rules directly evaluate the configuration of a resource and rules don't take into account these policies when running evaluations. Make sure that the policies in effect align with how you intend to use Config.\n     \n       {b Keep Minimum Permisions When Reusing an IAM role} \n      \n       If you use an Amazon Web Services service that uses Config, such as Security Hub or Control Tower, and an IAM role has already been created, make sure that the IAM role that you use when setting up Config keeps the same minimum permissions as the pre-existing IAM role. You must do this to ensure that the other Amazon Web Services service continues to run as expected. \n       \n        For example, if Control Tower has an IAM role that allows Config to read S3 objects, make sure that the same permissions are granted to the IAM role you use when setting up Config. Otherwise, it may interfere with how Control Tower operates.\n        \n          {b The service-linked IAM role for Config must be used for service-linked configuration recorders} \n         \n          For service-linked configuration recorders, you must use the service-linked IAM role for Config: {{:https://docs.aws.amazon.com/config/latest/developerguide/using-service-linked-roles.html}AWSServiceRoleForConfig}.\n          \n           "];
  name: string option
    [@ocaml.doc
      "The name of the configuration recorder.\n\n For customer managed configuration recorders, Config automatically assigns the name of \"default\" when creating a configuration recorder if you do not specify a name at creation time.\n \n  For service-linked configuration recorders, Config automatically assigns a name that has the prefix \"[AWS]\" to a new service-linked configuration recorder.\n  \n     {b Changing the name of a configuration recorder} \n    \n     To change the name of the customer managed configuration recorder, you must delete it and create a new customer managed configuration recorder with a new name.\n     \n      You cannot change the name of a service-linked configuration recorder.\n      \n       "];
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the specified configuration recorder.\n"]}
[@@ocaml.doc
  "Records configuration changes to the resource types in scope.\n\n For more information about the configuration recorder, see {{:https://docs.aws.amazon.com/config/latest/developerguide/stop-start-recorder.html} {b Working with the Configuration Recorder} } in the {i Config Developer Guide}.\n "]
type nonrec put_configuration_recorder_request =
  {
  tags: tag list option
    [@ocaml.doc
      "The tags for the customer managed configuration recorder. Each tag consists of a key and an optional value, both of which you define.\n"];
  configuration_recorder: configuration_recorder
    [@ocaml.doc
      "An object for the configuration recorder. A configuration recorder records configuration changes for the resource types in scope.\n"]}
[@@ocaml.doc "The input for the [PutConfigurationRecorder] action.\n"]
type nonrec account_aggregation_source =
  {
  aws_regions: string list option
    [@ocaml.doc "The source regions being aggregated.\n"];
  all_aws_regions: bool option
    [@ocaml.doc
      "If true, aggregate existing Config regions and future regions.\n"];
  account_ids: string list
    [@ocaml.doc
      "The 12-digit account ID of the account being aggregated. \n"]}
[@@ocaml.doc "A collection of accounts and regions.\n"]
type nonrec organization_aggregation_source =
  {
  all_aws_regions: bool option
    [@ocaml.doc
      "If true, aggregate existing Config regions and future regions.\n"];
  aws_regions: string list option
    [@ocaml.doc "The source regions being aggregated.\n"];
  role_arn: string
    [@ocaml.doc
      "ARN of the IAM role used to retrieve Amazon Web Services Organization details associated with the aggregator account.\n"]}
[@@ocaml.doc
  "This object contains regions to set up the aggregator and an IAM role to retrieve organization details.\n"]
type nonrec aggregator_filter_type =
  | INCLUDE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec aggregator_filter_resource_type =
  {
  value: string list option
    [@ocaml.doc
      "Comma-separate list of resource types to filter your aggregated configuration recorders.\n"];
  type_: aggregator_filter_type option
    [@ocaml.doc
      "The type of resource type filter to apply. [INCLUDE] specifies that the list of resource types in the [Value] field will be aggregated and no other resource types will be filtered.\n"]}
[@@ocaml.doc
  "An object to filter the configuration recorders based on the resource types in scope for recording.\n"]
type nonrec aggregator_filter_service_principal =
  {
  value: string list option
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
  created_by: string option
    [@ocaml.doc
      "Amazon Web Services service that created the configuration aggregator.\n"];
  last_updated_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time of the last update.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time stamp when the configuration aggregator was created.\n"];
  organization_aggregation_source: organization_aggregation_source option
    [@ocaml.doc
      "Provides an organization and list of regions to be aggregated.\n"];
  account_aggregation_sources: account_aggregation_source list option
    [@ocaml.doc
      "Provides a list of source accounts and regions to be aggregated.\n"];
  configuration_aggregator_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the aggregator.\n"];
  configuration_aggregator_name: string option
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
  tags: tag list option [@ocaml.doc "An array of tag object.\n"];
  organization_aggregation_source: organization_aggregation_source option
    [@ocaml.doc "An OrganizationAggregationSource object.\n"];
  account_aggregation_sources: account_aggregation_source list option
    [@ocaml.doc "A list of AccountAggregationSource object. \n"];
  configuration_aggregator_name: string
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec max_number_of_config_rules_exceeded_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "Failed to add the Config rule because the account already contains the maximum number of 1000 rules. Consider deleting any deactivated rules before you add new rules.\n"]
type nonrec scope =
  {
  compliance_resource_id: string option
    [@ocaml.doc
      "The ID of the only Amazon Web Services resource that you want to trigger an evaluation for the rule. If you specify a resource ID, you must specify one resource type for [ComplianceResourceTypes].\n"];
  tag_value: string option
    [@ocaml.doc
      "The tag value applied to only those Amazon Web Services resources that you want to trigger an evaluation for the rule. If you specify a value for [TagValue], you must also specify a value for [TagKey].\n"];
  tag_key: string option
    [@ocaml.doc
      "The tag key that is applied to only those Amazon Web Services resources that you want to trigger an evaluation for the rule.\n"];
  compliance_resource_types: string list option
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
type nonrec custom_policy_details =
  {
  enable_debug_log_delivery: bool option
    [@ocaml.doc
      "The boolean expression for enabling debug logging for your Config Custom Policy rule. The default value is [false].\n"];
  policy_text: string
    [@ocaml.doc
      "The policy definition containing the logic for your Config Custom Policy rule.\n"];
  policy_runtime: string
    [@ocaml.doc
      "The runtime system for your Config Custom Policy rule. Guard is a policy-as-code language that allows you to write policies that are enforced by Config Custom Policy rules. For more information about Guard, see the {{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}.\n"]}
[@@ocaml.doc
  "Provides the runtime system, policy definition, and whether debug logging enabled. You can specify the following CustomPolicyDetails parameter values only for Config Custom Policy rules.\n"]
type nonrec source =
  {
  custom_policy_details: custom_policy_details option
    [@ocaml.doc
      "Provides the runtime system, policy definition, and whether debug logging is enabled. Required when owner is set to [CUSTOM_POLICY].\n"];
  source_details: source_detail list option
    [@ocaml.doc
      "Provides the source and the message types that cause Config to evaluate your Amazon Web Services resources against a rule. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.\n\n If the owner is set to [CUSTOM_POLICY], the only acceptable values for the Config rule trigger message type are [ConfigurationItemChangeNotification] and [OversizedConfigurationItemChangeNotification].\n "];
  source_identifier: string option
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
type nonrec config_rule =
  {
  evaluation_modes: evaluation_mode_configuration list option
    [@ocaml.doc
      "The modes the Config rule can be evaluated in. The valid values are distinct objects. By default, the value is Detective evaluation mode only.\n"];
  created_by: string option
    [@ocaml.doc
      "Service principal name of the service that created the rule.\n\n  The field is populated only if the service-linked rule is created by a service. The field is empty if you create your own rule.\n  \n   "];
  config_rule_state: config_rule_state option
    [@ocaml.doc
      "Indicates whether the Config rule is active or is currently being deleted by Config. It can also indicate the evaluation status for the Config rule.\n\n Config sets the state of the rule to [EVALUATING] temporarily after you use the [StartConfigRulesEvaluation] request to evaluate your resources against the Config rule.\n \n  Config sets the state of the rule to [DELETING_RESULTS] temporarily after you use the [DeleteEvaluationResults] request to delete the current evaluation results for the Config rule.\n  \n   Config temporarily sets the state of a rule to [DELETING] after you use the [DeleteConfigRule] request to delete the rule. After Config deletes the rule, the rule and all of its evaluations are erased and are no longer available.\n   "];
  maximum_execution_frequency: maximum_execution_frequency option
    [@ocaml.doc
      "The maximum frequency with which Config runs evaluations for a rule. You can specify a value for [MaximumExecutionFrequency] when:\n\n {ul\n       {-  This is for an Config managed rule that is triggered at a periodic frequency.\n           \n            }\n       {-  Your custom rule is triggered when Config delivers the configuration snapshot. For more information, see [ConfigSnapshotDeliveryProperties].\n           \n            }\n       }\n    By default, rules with a periodic trigger are evaluated every 24 hours. To change the frequency, specify a valid value for the [MaximumExecutionFrequency] parameter.\n    \n     "];
  input_parameters: string option
    [@ocaml.doc
      "A string, in JSON format, that is passed to the Config rule Lambda function.\n"];
  source: source
    [@ocaml.doc
      "Provides the rule owner ([Amazon Web Services] for managed rules, [CUSTOM_POLICY] for Custom Policy rules, and [CUSTOM_LAMBDA] for Custom Lambda rules), the rule identifier, and the notifications that cause the function to evaluate your Amazon Web Services resources.\n"];
  scope: scope option
    [@ocaml.doc
      "Defines which resources can trigger an evaluation for the rule. The scope can include one or more resource types, a combination of one resource type and one resource ID, or a combination of a tag key and value. Specify a scope to constrain the resources that can trigger an evaluation for the rule. If you do not specify a scope, evaluations are triggered when any resource in the recording group changes.\n\n  The scope can be empty. \n  \n   "];
  description: string option
    [@ocaml.doc "The description that you provide for the Config rule.\n"];
  config_rule_id: string option [@ocaml.doc "The ID of the Config rule.\n"];
  config_rule_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the Config rule.\n"];
  config_rule_name: string option
    [@ocaml.doc
      "The name that you assign to the Config rule. The name is required if you are adding a new rule.\n"]}
[@@ocaml.doc
  "Config rules evaluate the configuration settings of your Amazon Web Services resources. A rule can run when Config detects a configuration change to an Amazon Web Services resource or at a periodic frequency that you choose (for example, every 24 hours). There are two types of rules: {i Config Managed Rules} and {i Config Custom Rules}.\n\n Config Managed Rules are predefined, customizable rules created by Config. For a list of managed rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html}List of Config Managed Rules}.\n \n  Config Custom Rules are rules that you create from scratch. There are two ways to create Config custom rules: with Lambda functions ({{:https://docs.aws.amazon.com/config/latest/developerguide/gettingstarted-concepts.html#gettingstarted-concepts-function} Lambda Developer Guide}) and with Guard ({{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}), a policy-as-code language. Config custom rules created with Lambda are called {i Config Custom Lambda Rules} and Config custom rules created with Guard are called {i Config Custom Policy Rules}.\n  \n   For more information about developing and using Config rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html}Evaluating Resource with Config Rules} in the {i Config Developer Guide}.\n   \n     You can use the Amazon Web Services CLI and Amazon Web Services SDKs if you want to create a rule that triggers evaluations for your resources when Config delivers the configuration snapshot. For more information, see [ConfigSnapshotDeliveryProperties].\n     \n      "]
type nonrec put_config_rule_request =
  {
  tags: tag list option [@ocaml.doc "An array of tag object.\n"];
  config_rule: config_rule
    [@ocaml.doc "The rule that you want to add to your account.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec aggregation_authorization =
  {
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time stamp when the aggregation authorization was created.\n"];
  authorized_aws_region: string option
    [@ocaml.doc "The region authorized to collect aggregated data.\n"];
  authorized_account_id: string option
    [@ocaml.doc
      "The 12-digit account ID of the account authorized to aggregate data.\n"];
  aggregation_authorization_arn: string option
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
  tags: tag list option [@ocaml.doc "An array of tag object.\n"];
  authorized_aws_region: string
    [@ocaml.doc "The region authorized to collect aggregated data.\n"];
  authorized_account_id: string
    [@ocaml.doc
      "The 12-digit account ID of the account authorized to aggregate data.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  tags: tag list option [@ocaml.doc "The tags for the resource.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec list_tags_for_resource_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of tags returned on each page. The limit maximum is 50. You cannot specify a number greater than 50. If you specify 0, Config uses the default. \n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. The following resources are supported:\n\n {ul\n       {-   [ConfigurationRecorder] \n           \n            }\n       {-   [ConfigRule] \n           \n            }\n       {-   [OrganizationConfigRule] \n           \n            }\n       {-   [ConformancePack] \n           \n            }\n       {-   [OrganizationConformancePack] \n           \n            }\n       {-   [ConfigurationAggregator] \n           \n            }\n       {-   [AggregationAuthorization] \n           \n            }\n       {-   [StoredQuery] \n           \n            }\n       }\n  "]}
[@@ocaml.doc ""]
type nonrec list_stored_queries_response =
  {
  next_token: string option
    [@ocaml.doc
      "If the previous paginated request didn't return all of the remaining results, the response object's [NextToken] parameter value is set to a token. To retrieve the next set of results, call this operation again and assign that token to the request object's [NextToken] parameter. If there are no remaining results, the previous response object's [NextToken] parameter is set to [null]. \n"];
  stored_query_metadata: stored_query_metadata list option
    [@ocaml.doc "A list of [StoredQueryMetadata] objects.\n"]}[@@ocaml.doc
                                                                ""]
type nonrec list_stored_queries_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to be returned with a single call.\n"];
  next_token: string option
    [@ocaml.doc
      "The nextToken string returned in a previous request that you use to request the next page of results in a paginated response.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_time_range_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "The specified time range is not valid. The earlier time is not chronologically before the later time.\n"]
type nonrec resource_evaluation =
  {
  evaluation_start_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc "The starting time of an execution.\n"];
  evaluation_mode: evaluation_mode option
    [@ocaml.doc
      "The mode of an evaluation. The valid values are Detective or Proactive.\n"];
  resource_evaluation_id: string option
    [@ocaml.doc "The ResourceEvaluationId of a evaluation.\n"]}[@@ocaml.doc
                                                                 "Returns details of a resource evaluation.\n"]
type nonrec list_resource_evaluations_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  resource_evaluations: resource_evaluation list option
    [@ocaml.doc "Returns a [ResourceEvaluations] object.\n"]}[@@ocaml.doc ""]
type nonrec resource_evaluation_filters =
  {
  evaluation_context_identifier: string option
    [@ocaml.doc
      "Filters evaluations for a given infrastructure deployment. For example: CFN Stack.\n"];
  time_window: time_window option
    [@ocaml.doc "Returns a [TimeWindow] object.\n"];
  evaluation_mode: evaluation_mode option
    [@ocaml.doc
      "Filters all resource evaluations results based on an evaluation mode.\n\n  Currently, [DECTECTIVE] is not supported as a valid value. Ignore other documentation stating otherwise.\n  \n   "]}
[@@ocaml.doc
  "Returns details of a resource evaluation based on the selected filter.\n"]
type nonrec list_resource_evaluations_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of evaluations returned on each page. The default is 10. You cannot specify a number greater than 100. If you specify 0, Config uses the default.\n"];
  filters: resource_evaluation_filters option
    [@ocaml.doc "Returns a [ResourceEvaluationFilters] object.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec resource_identifier =
  {
  resource_deletion_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time that the resource was deleted.\n"];
  resource_name: string option
    [@ocaml.doc "The custom name of the resource (if available).\n"];
  resource_id: string option
    [@ocaml.doc "The ID of the resource (for example, [sg-xxxxxx]).\n"];
  resource_type: resource_type option [@ocaml.doc "The type of resource.\n"]}
[@@ocaml.doc
  "The details that identify a resource that is discovered by Config, including the resource type, ID, and (if available) the custom resource name.\n"]
type nonrec list_discovered_resources_response =
  {
  next_token: string option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  resource_identifiers: resource_identifier list option
    [@ocaml.doc
      "The details that identify a resource that is discovered by Config, including the resource type, ID, and (if available) the custom resource name.\n"]}
[@@ocaml.doc "\n"]
type nonrec list_discovered_resources_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  include_deleted_resources: bool option
    [@ocaml.doc
      "Specifies whether Config includes deleted resources in the results. By default, deleted resources are not included.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of resource identifiers returned on each page. The default is 100. You cannot specify a number greater than 100. If you specify 0, Config uses the default.\n"];
  resource_name: string option
    [@ocaml.doc
      "The custom name of only those resources that you want Config to list in the response. If you do not specify this parameter, Config lists all resources of the specified type that it has discovered.\n"];
  resource_ids: string list option
    [@ocaml.doc
      "The IDs of only those resources that you want Config to list in the response. If you do not specify this parameter, Config lists all resources of the specified type that it has discovered. You can list a minimum of 1 resourceID and a maximum of 20 resourceIds.\n"];
  resource_type: resource_type
    [@ocaml.doc
      "The type of resources that you want Config to list in the response.\n"]}
[@@ocaml.doc "\n"]
type nonrec conformance_pack_compliance_score =
  {
  last_updated_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time that the conformance pack compliance score was last updated.\n"];
  conformance_pack_name: string option
    [@ocaml.doc "The name of the conformance pack.\n"];
  score: string option
    [@ocaml.doc
      "Compliance score for the conformance pack. Conformance packs with no evaluation results will have a compliance score of [INSUFFICIENT_DATA].\n"]}
[@@ocaml.doc
  "A compliance score is the percentage of the number of compliant rule-resource combinations in a conformance pack compared to the number of total possible rule-resource combinations in the conformance pack. This metric provides you with a high-level view of the compliance state of your conformance packs. You can use it to identify, investigate, and understand the level of compliance in your conformance packs.\n"]
type nonrec list_conformance_pack_compliance_scores_response =
  {
  conformance_pack_compliance_scores: conformance_pack_compliance_score list
    [@ocaml.doc "A list of [ConformancePackComplianceScore] objects.\n"];
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string that you can use to get the next page of results in a paginated response.\n"]}
[@@ocaml.doc ""]
type nonrec conformance_pack_compliance_scores_filters =
  {
  conformance_pack_names: string list
    [@ocaml.doc
      "The names of the conformance packs whose compliance scores you want to include in the conformance pack compliance score result set. You can include up to 25 conformance packs in the [ConformancePackNames] array of strings, each with a character limit of 256 characters for the conformance pack name.\n"]}
[@@ocaml.doc
  "A list of filters to apply to the conformance pack compliance score result set. \n"]
type nonrec sort_order =
  | DESCENDING [@ocaml.doc ""]
  | ASCENDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sort_by =
  | SCORE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec list_conformance_pack_compliance_scores_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string in a prior request that you can use to get the paginated response for the next set of conformance pack compliance scores.\n"];
  limit: int option
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
  service_principal: string option
    [@ocaml.doc
      "For service-linked configuration recorders, indicates which Amazon Web Services service the configuration recorder is linked to.\n"];
  name: string [@ocaml.doc "The name of the configuration recorder.\n"];
  arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the configuration recorder.\n"]}
[@@ocaml.doc
  "A summary of a configuration recorder, including the [arn], [name], [servicePrincipal], and [recordingScope].\n"]
type nonrec list_configuration_recorders_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [NextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  configuration_recorder_summaries: configuration_recorder_summary list
    [@ocaml.doc
      "A list of [ConfigurationRecorderSummary] objects that includes.\n"]}
[@@ocaml.doc ""]
type nonrec configuration_recorder_filter_name =
  | RecordingScope [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec configuration_recorder_filter =
  {
  filter_value: string list option
    [@ocaml.doc
      "The value of the filter. For [recordingScope], valid values include: [INTERNAL] and [PAID].\n\n  [INTERNAL] indicates that the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ConfigurationItem.html}ConfigurationItems} in scope for the configuration recorder are recorded for free.\n \n   [PAID] indicates that the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ConfigurationItem.html}ConfigurationItems} in scope for the configuration recorder impact the costs to your bill.\n  "];
  filter_name: configuration_recorder_filter_name option
    [@ocaml.doc
      "The name of the type of filter. Currently, only [recordingScope] is supported.\n"]}
[@@ocaml.doc "Filters configuration recorders by recording scope.\n"]
type nonrec list_configuration_recorders_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [NextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to include in the response.\n"];
  filters: configuration_recorder_filter list option
    [@ocaml.doc
      "Filters the results based on a list of [ConfigurationRecorderFilter] objects that you specify.\n"]}
[@@ocaml.doc ""]
type nonrec list_aggregate_discovered_resources_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  resource_identifiers: aggregate_resource_identifier list option
    [@ocaml.doc "Returns a list of [ResourceIdentifiers] objects.\n"]}
[@@ocaml.doc ""]
type nonrec resource_filters =
  {
  region: string option [@ocaml.doc "The source region.\n"];
  resource_name: string option [@ocaml.doc "The name of the resource.\n"];
  resource_id: string option [@ocaml.doc "The ID of the resource.\n"];
  account_id: string option [@ocaml.doc "The 12-digit source account ID.\n"]}
[@@ocaml.doc
  "Filters the results by resource account ID, region, resource ID, and resource name.\n"]
type nonrec list_aggregate_discovered_resources_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of resource identifiers returned on each page. You cannot specify a number greater than 100. If you specify 0, Config uses the default.\n"];
  filters: resource_filters option
    [@ocaml.doc
      "Filters the results based on the [ResourceFilters] object.\n"];
  resource_type: resource_type
    [@ocaml.doc
      "The type of resources that you want Config to list in the response.\n"];
  configuration_aggregator_name: string
    [@ocaml.doc "The name of the configuration aggregator. \n"]}[@@ocaml.doc
                                                                  ""]
type nonrec get_stored_query_response =
  {
  stored_query: stored_query option
    [@ocaml.doc "Returns a [StoredQuery] object.\n"]}[@@ocaml.doc ""]
type nonrec get_stored_query_request =
  {
  query_name: string [@ocaml.doc "The name of the query.\n"]}[@@ocaml.doc ""]
type nonrec resource_evaluation_status =
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec evaluation_status =
  {
  failure_reason: string option
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
  evaluation_start_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The start timestamp when Config rule starts evaluating compliance for the provided resource details.\n"];
  evaluation_status: evaluation_status option
    [@ocaml.doc "Returns an [EvaluationStatus] object.\n"];
  evaluation_mode: evaluation_mode option
    [@ocaml.doc
      "Lists results of the mode that you requested to retrieve the resource evaluation summary. The valid values are Detective or Proactive.\n"];
  resource_evaluation_id: string option
    [@ocaml.doc
      "The unique [ResourceEvaluationId] of Amazon Web Services resource execution for which you want to retrieve the evaluation summary.\n"]}
[@@ocaml.doc ""]
type nonrec get_resource_evaluation_summary_request =
  {
  resource_evaluation_id: string
    [@ocaml.doc
      "The unique [ResourceEvaluationId] of Amazon Web Services resource execution for which you want to retrieve the evaluation summary.\n"]}
[@@ocaml.doc ""]
type nonrec resource_not_discovered_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have specified a resource that is either unknown or has not been discovered.\n"]
type nonrec configuration_item_status =
  | ResourceDeletedNotRecorded [@ocaml.doc ""]
  | ResourceDeleted [@ocaml.doc ""]
  | ResourceNotRecorded [@ocaml.doc ""]
  | ResourceDiscovered [@ocaml.doc ""]
  | OK [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec relationship =
  {
  relationship_name: string option
    [@ocaml.doc "The type of relationship with the related resource.\n"];
  resource_name: string option
    [@ocaml.doc "The custom name of the related resource, if available.\n"];
  resource_id: string option
    [@ocaml.doc
      "The ID of the related resource (for example, [sg-xxxxxx]).\n"];
  resource_type: resource_type option
    [@ocaml.doc "The resource type of the related resource.\n"]}[@@ocaml.doc
                                                                  "The relationship of the related resource to the main resource.\n"]
type nonrec configuration_item =
  {
  configuration_item_delivery_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when configuration changes for the resource were delivered.\n\n  This field is optional and is not guaranteed to be present in a configuration item (CI). If you are using daily recording, this field will be populated. However, if you are using continuous recording, this field will be omitted since the delivery time is instantaneous as the CI is available right away. For more information on daily recording and continuous recording, see {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html#select-resources-recording-frequency}Recording Frequency} in the {i Config Developer Guide}.\n  \n   "];
  recording_frequency: recording_frequency option
    [@ocaml.doc
      "The recording frequency that Config uses to record configuration changes for the resource.\n"];
  supplementary_configuration: supplementary_configuration option
    [@ocaml.doc
      "Configuration attributes that Config returns for certain resource types to supplement the information returned for the [configuration] parameter.\n"];
  configuration: string option
    [@ocaml.doc "The description of the resource configuration.\n"];
  relationships: relationship list option
    [@ocaml.doc "A list of related Amazon Web Services resources.\n"];
  related_events: string list option
    [@ocaml.doc
      "A list of CloudTrail event IDs.\n\n A populated field indicates that the current configuration was initiated by the events recorded in the CloudTrail log. For more information about CloudTrail, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html}What Is CloudTrail}.\n \n  An empty field indicates that the current configuration was not initiated by any event. As of Version 1.3, the relatedEvents field is empty. You can access the {{:https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_LookupEvents.html}LookupEvents API} in the {i CloudTrail API Reference} to retrieve the events for the resource.\n  "];
  tags: tags option
    [@ocaml.doc
      "A mapping of key value tags associated with the resource.\n"];
  resource_creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time stamp when the resource was created.\n"];
  availability_zone: string option
    [@ocaml.doc "The Availability Zone associated with the resource.\n"];
  aws_region: string option
    [@ocaml.doc "The region where the resource resides.\n"];
  resource_name: string option
    [@ocaml.doc "The custom name of the resource, if available.\n"];
  resource_id: string option
    [@ocaml.doc "The ID of the resource (for example, [sg-xxxxxx]).\n"];
  resource_type: resource_type option
    [@ocaml.doc "The type of Amazon Web Services resource.\n"];
  arn: string option
    [@ocaml.doc "Amazon Resource Name (ARN) associated with the resource.\n"];
  configuration_item_md5_hash: string option
    [@ocaml.doc
      "Unique MD5 hash that represents the configuration item's state.\n\n You can use MD5 hash to compare the states of two or more configuration items that are associated with the same resource.\n "];
  configuration_state_id: string option
    [@ocaml.doc
      "An identifier that indicates the ordering of the configuration items of a resource.\n"];
  configuration_item_status: configuration_item_status option
    [@ocaml.doc
      "The configuration item status. Valid values include:\n\n {ul\n       {-  OK \226\128\147 The resource configuration has been updated\n           \n            }\n       {-  ResourceDiscovered \226\128\147 The resource was newly discovered\n           \n            }\n       {-  ResourceNotRecorded \226\128\147 The resource was discovered but its configuration was not recorded since the recorder doesn't record resources of this type\n           \n            }\n       {-  ResourceDeleted \226\128\147 The resource was deleted\n           \n            }\n       {-  ResourceDeletedNotRecorded \226\128\147 The resource was deleted but its configuration was not recorded since the recorder doesn't record resources of this type\n           \n            }\n       }\n  "];
  configuration_item_capture_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the recording of configuration changes was initiated for the resource.\n"];
  account_id: string option
    [@ocaml.doc
      "The 12-digit Amazon Web Services account ID associated with the resource.\n"];
  version: string option
    [@ocaml.doc "The version number of the resource configuration.\n"]}
[@@ocaml.doc
  "A list that contains detailed configurations of a specified resource.\n"]
type nonrec get_resource_config_history_response =
  {
  next_token: string option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  configuration_items: configuration_item list option
    [@ocaml.doc
      "A list that contains the configuration history of one or more resources.\n"]}
[@@ocaml.doc "The output for the [GetResourceConfigHistory] action.\n"]
type nonrec chronological_order =
  | Forward [@ocaml.doc ""]
  | Reverse [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_resource_config_history_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of configuration items returned on each page. The default is 10. You cannot specify a number greater than 100. If you specify 0, Config uses the default.\n"];
  chronological_order: chronological_order option
    [@ocaml.doc
      "The chronological order for configuration items listed. By default, the results are listed in reverse chronological order.\n"];
  earlier_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The chronologically earliest time in the time range for which the history requested. If not specified, the action returns paginated results that contain configuration items that start when the first configuration item was recorded.\n"];
  later_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The chronologically latest time in the time range for which the history requested. If not specified, current time is taken.\n"];
  resource_id: string
    [@ocaml.doc "The ID of the resource (for example., [sg-xxxxxx]).\n"];
  resource_type: resource_type [@ocaml.doc "The resource type.\n"]}[@@ocaml.doc
                                                                    "The input for the [GetResourceConfigHistory] action.\n"]
type nonrec no_such_organization_config_rule_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "The Config rule in the request is not valid. Verify that the rule is an organization Config Process Check rule, that the rule name is correct, and that valid Amazon Resouce Names (ARNs) are used before trying again.\n"]
type nonrec get_organization_custom_rule_policy_response =
  {
  policy_text: string option
    [@ocaml.doc
      "The policy definition containing the logic for your organization Config Custom Policy rule.\n"]}
[@@ocaml.doc ""]
type nonrec get_organization_custom_rule_policy_request =
  {
  organization_config_rule_name: string
    [@ocaml.doc
      "The name of your organization Config Custom Policy rule. \n"]}
[@@ocaml.doc ""]
type nonrec no_such_organization_conformance_pack_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
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
  last_update_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp of the last status update.\n"];
  error_message: string option
    [@ocaml.doc
      "An error message indicating that conformance pack account creation or deletion has failed due to an error in the member account. \n"];
  error_code: string option
    [@ocaml.doc
      "An error code that is returned when conformance pack creation or deletion failed in the member account. \n"];
  status: organization_resource_detailed_status
    [@ocaml.doc
      "Indicates deployment status for conformance pack in a member account. When management account calls [PutOrganizationConformancePack] action for the first time, conformance pack status is created in the member account. When management account calls [PutOrganizationConformancePack] action for the second time, conformance pack status is updated in the member account. Conformance pack status is deleted when the management account deletes [OrganizationConformancePack] and disables service access for [config-multiaccountsetup.amazonaws.com]. \n\n  Config sets the state of the conformance pack to:\n \n  {ul\n        {-   [CREATE_SUCCESSFUL] when conformance pack has been created in the member account. \n            \n             }\n        {-   [CREATE_IN_PROGRESS] when conformance pack is being created in the member account.\n            \n             }\n        {-   [CREATE_FAILED] when conformance pack creation has failed in the member account.\n            \n             }\n        {-   [DELETE_FAILED] when conformance pack deletion has failed in the member account.\n            \n             }\n        {-   [DELETE_IN_PROGRESS] when conformance pack is being deleted in the member account.\n            \n             }\n        {-   [DELETE_SUCCESSFUL] when conformance pack has been deleted in the member account. \n            \n             }\n        {-   [UPDATE_SUCCESSFUL] when conformance pack has been updated in the member account.\n            \n             }\n        {-   [UPDATE_IN_PROGRESS] when conformance pack is being updated in the member account.\n            \n             }\n        {-   [UPDATE_FAILED] when conformance pack deletion has failed in the member account.\n            \n             }\n        }\n  "];
  conformance_pack_name: string
    [@ocaml.doc
      "The name of conformance pack deployed in the member account.\n"];
  account_id: string
    [@ocaml.doc "The 12-digit account ID of a member account.\n"]}[@@ocaml.doc
                                                                    "Organization conformance pack creation or deletion status in each member account. This includes the name of the conformance pack, the status, error code and error message when the conformance pack creation or deletion failed. \n"]
type nonrec get_organization_conformance_pack_detailed_status_response =
  {
  next_token: string option
    [@ocaml.doc
      "The nextToken string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  organization_conformance_pack_detailed_statuses:
    organization_conformance_pack_detailed_status list option
    [@ocaml.doc
      "A list of [OrganizationConformancePackDetailedStatus] objects. \n"]}
[@@ocaml.doc ""]
type nonrec organization_resource_detailed_status_filters =
  {
  status: organization_resource_detailed_status option
    [@ocaml.doc
      "Indicates deployment status for conformance pack in a member account. When management account calls [PutOrganizationConformancePack] action for the first time, conformance pack status is created in the member account. When management account calls [PutOrganizationConformancePack] action for the second time, conformance pack status is updated in the member account. Conformance pack status is deleted when the management account deletes [OrganizationConformancePack] and disables service access for [config-multiaccountsetup.amazonaws.com]. \n\n  Config sets the state of the conformance pack to:\n \n  {ul\n        {-   [CREATE_SUCCESSFUL] when conformance pack has been created in the member account. \n            \n             }\n        {-   [CREATE_IN_PROGRESS] when conformance pack is being created in the member account.\n            \n             }\n        {-   [CREATE_FAILED] when conformance pack creation has failed in the member account.\n            \n             }\n        {-   [DELETE_FAILED] when conformance pack deletion has failed in the member account.\n            \n             }\n        {-   [DELETE_IN_PROGRESS] when conformance pack is being deleted in the member account.\n            \n             }\n        {-   [DELETE_SUCCESSFUL] when conformance pack has been deleted in the member account. \n            \n             }\n        {-   [UPDATE_SUCCESSFUL] when conformance pack has been updated in the member account.\n            \n             }\n        {-   [UPDATE_IN_PROGRESS] when conformance pack is being updated in the member account.\n            \n             }\n        {-   [UPDATE_FAILED] when conformance pack deletion has failed in the member account.\n            \n             }\n        }\n  "];
  account_id: string option
    [@ocaml.doc
      "The 12-digit account ID of the member account within an organization.\n"]}
[@@ocaml.doc
  "Status filter object to filter results based on specific member account ID or status type for an organization conformance pack.\n"]
type nonrec get_organization_conformance_pack_detailed_status_request =
  {
  next_token: string option
    [@ocaml.doc
      "The nextToken string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of [OrganizationConformancePackDetailedStatuses] returned on each page. If you do not specify a number, Config uses the default. The default is 100. \n"];
  filters: organization_resource_detailed_status_filters option
    [@ocaml.doc "An [OrganizationResourceDetailedStatusFilters] object.\n"];
  organization_conformance_pack_name: string
    [@ocaml.doc
      "The name of organization conformance pack for which you want status details for member accounts.\n"]}
[@@ocaml.doc ""]
type nonrec member_account_status =
  {
  last_update_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp of the last status update.\n"];
  error_message: string option
    [@ocaml.doc
      "An error message indicating that Config rule account creation or deletion has failed due to an error in the member account.\n"];
  error_code: string option
    [@ocaml.doc
      "An error code that is returned when Config rule creation or deletion failed in the member account.\n"];
  member_account_rule_status: member_account_rule_status
    [@ocaml.doc
      "Indicates deployment status for Config rule in the member account. When management account calls [PutOrganizationConfigRule] action for the first time, Config rule status is created in the member account. When management account calls [PutOrganizationConfigRule] action for the second time, Config rule status is updated in the member account. Config rule status is deleted when the management account deletes [OrganizationConfigRule] and disables service access for [config-multiaccountsetup.amazonaws.com]. \n\n  Config sets the state of the rule to:\n \n  {ul\n        {-   [CREATE_SUCCESSFUL] when Config rule has been created in the member account. \n            \n             }\n        {-   [CREATE_IN_PROGRESS] when Config rule is being created in the member account.\n            \n             }\n        {-   [CREATE_FAILED] when Config rule creation has failed in the member account.\n            \n             }\n        {-   [DELETE_FAILED] when Config rule deletion has failed in the member account.\n            \n             }\n        {-   [DELETE_IN_PROGRESS] when Config rule is being deleted in the member account.\n            \n             }\n        {-   [DELETE_SUCCESSFUL] when Config rule has been deleted in the member account. \n            \n             }\n        {-   [UPDATE_SUCCESSFUL] when Config rule has been updated in the member account.\n            \n             }\n        {-   [UPDATE_IN_PROGRESS] when Config rule is being updated in the member account.\n            \n             }\n        {-   [UPDATE_FAILED] when Config rule deletion has failed in the member account.\n            \n             }\n        }\n  "];
  config_rule_name: string
    [@ocaml.doc "The name of Config rule deployed in the member account.\n"];
  account_id: string
    [@ocaml.doc "The 12-digit account ID of a member account.\n"]}[@@ocaml.doc
                                                                    "Organization Config rule creation or deletion status in each member account. This includes the name of the rule, the status, error code and error message when the rule creation or deletion failed.\n"]
type nonrec get_organization_config_rule_detailed_status_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  organization_config_rule_detailed_status: member_account_status list option
    [@ocaml.doc "A list of [MemberAccountStatus] objects.\n"]}[@@ocaml.doc
                                                                ""]
type nonrec get_organization_config_rule_detailed_status_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of [OrganizationConfigRuleDetailedStatus] returned on each page. If you do not specify a number, Config uses the default. The default is 100.\n"];
  filters: status_detail_filters option
    [@ocaml.doc "A [StatusDetailFilters] object.\n"];
  organization_config_rule_name: string
    [@ocaml.doc
      "The name of your organization Config rule for which you want status details for member accounts.\n"]}
[@@ocaml.doc ""]
type nonrec resource_count =
  {
  count: int option [@ocaml.doc "The number of resources.\n"];
  resource_type: resource_type option
    [@ocaml.doc
      "The resource type (for example, [\"AWS::EC2::Instance\"]).\n"]}
[@@ocaml.doc
  "An object that contains the resource type and the number of resources.\n"]
type nonrec get_discovered_resource_counts_response =
  {
  next_token: string option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  resource_counts: resource_count list option
    [@ocaml.doc
      "The list of [ResourceCount] objects. Each object is listed in descending order by the number of resources.\n"];
  total_discovered_resources: int option
    [@ocaml.doc
      "The total number of resources that Config is recording in the region for your account. If you specify resource types in the request, Config returns only the total number of resources for those resource types.\n\n  {b Example} \n \n  {ol\n        {-  Config is recording three resource types in the US East (Ohio) Region for your account: 25 EC2 instances, 20 IAM users, and 15 S3 buckets, for a total of 60 resources.\n            \n             }\n        {-  You make a call to the [GetDiscoveredResourceCounts] action and specify the resource type, [\"AWS::EC2::Instances\"], in the request.\n            \n             }\n        {-  Config returns 25 for [totalDiscoveredResources].\n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec get_discovered_resource_counts_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of [ResourceCount] objects returned on each page. The default is 100. You cannot specify a number greater than 100. If you specify 0, Config uses the default.\n"];
  resource_types: string list option
    [@ocaml.doc
      "The comma-separated list that specifies the resource types that you want Config to return (for example, [\"AWS::EC2::Instance\"], [\"AWS::IAM::User\"]).\n\n If a value for [resourceTypes] is not specified, Config returns all resource types that Config is recording in the region for your account.\n \n   If the configuration recorder is turned off, Config returns an empty list of [ResourceCount] objects. If the configuration recorder is not recording a specific resource type (for example, S3 buckets), that resource type is not returned in the list of [ResourceCount] objects.\n   \n    "]}
[@@ocaml.doc ""]
type nonrec get_custom_rule_policy_response =
  {
  policy_text: string option
    [@ocaml.doc
      "The policy definition containing the logic for your Config Custom Policy rule.\n"]}
[@@ocaml.doc ""]
type nonrec get_custom_rule_policy_request =
  {
  config_rule_name: string option
    [@ocaml.doc "The name of your Config Custom Policy rule.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec no_such_conformance_pack_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
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
  conformance_pack_name: string
    [@ocaml.doc "The name of the conformance pack name.\n"]}[@@ocaml.doc
                                                              "Summary includes the name and status of the conformance pack.\n"]
type nonrec get_conformance_pack_compliance_summary_response =
  {
  next_token: string option
    [@ocaml.doc
      "The nextToken string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  conformance_pack_compliance_summary_list:
    conformance_pack_compliance_summary list option
    [@ocaml.doc "A list of [ConformancePackComplianceSummary] objects. \n"]}
[@@ocaml.doc ""]
type nonrec get_conformance_pack_compliance_summary_request =
  {
  next_token: string option
    [@ocaml.doc
      "The nextToken string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of conformance packs returned on each page.\n"];
  conformance_pack_names: string list
    [@ocaml.doc "Names of conformance packs.\n"]}[@@ocaml.doc ""]
type nonrec no_such_config_rule_in_conformance_pack_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "Config rule that you passed in the filter does not exist.\n"]
type nonrec evaluation_result_qualifier =
  {
  evaluation_mode: evaluation_mode option
    [@ocaml.doc
      "The mode of an evaluation. The valid values are Detective or Proactive.\n"];
  resource_id: string option
    [@ocaml.doc "The ID of the evaluated Amazon Web Services resource.\n"];
  resource_type: string option
    [@ocaml.doc
      "The type of Amazon Web Services resource that was evaluated.\n"];
  config_rule_name: string option
    [@ocaml.doc
      "The name of the Config rule that was used in the evaluation.\n"]}
[@@ocaml.doc
  "Identifies an Config rule that evaluated an Amazon Web Services resource, and provides the type and ID of the resource that the rule evaluated.\n"]
type nonrec evaluation_result_identifier =
  {
  resource_evaluation_id: string option
    [@ocaml.doc "A Unique ID for an evaluation result.\n"];
  ordering_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time of the event that triggered the evaluation of your Amazon Web Services resources. The time can indicate when Config delivered a configuration item change notification, or it can indicate when Config delivered the configuration snapshot, depending on which event triggered the evaluation.\n"];
  evaluation_result_qualifier: evaluation_result_qualifier option
    [@ocaml.doc
      "Identifies an Config rule used to evaluate an Amazon Web Services resource, and provides the type and ID of the evaluated resource.\n"]}
[@@ocaml.doc "Uniquely identifies an evaluation result.\n"]
type nonrec conformance_pack_evaluation_result =
  {
  annotation: string option
    [@ocaml.doc
      "Supplementary information about how the evaluation determined the compliance. \n"];
  result_recorded_time: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when Config recorded the evaluation result. \n"];
  config_rule_invoked_time: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when Config rule evaluated Amazon Web Services resource.\n"];
  evaluation_result_identifier: evaluation_result_identifier [@ocaml.doc ""];
  compliance_type: conformance_pack_compliance_type
    [@ocaml.doc
      "The compliance type. The allowed values are [COMPLIANT] and [NON_COMPLIANT]. [INSUFFICIENT_DATA] is not supported.\n"]}
[@@ocaml.doc
  "The details of a conformance pack evaluation. Provides Config rule and Amazon Web Services resource type that was evaluated, the compliance of the conformance pack, related time stamps, and supplementary information. \n"]
type nonrec get_conformance_pack_compliance_details_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  conformance_pack_rule_evaluation_results:
    conformance_pack_evaluation_result list option
    [@ocaml.doc
      "Returns a list of [ConformancePackEvaluationResult] objects.\n"];
  conformance_pack_name: string
    [@ocaml.doc "Name of the conformance pack.\n"]}[@@ocaml.doc ""]
type nonrec conformance_pack_evaluation_filters =
  {
  resource_ids: string list option
    [@ocaml.doc
      "Filters the results by resource IDs.\n\n  This is valid only when you provide resource type. If there is no resource type, you will see an error.\n  \n   "];
  resource_type: string option
    [@ocaml.doc
      "Filters the results by the resource type (for example, [\"AWS::EC2::Instance\"]). \n"];
  compliance_type: conformance_pack_compliance_type option
    [@ocaml.doc
      "Filters the results by compliance.\n\n The allowed values are [COMPLIANT] and [NON_COMPLIANT]. [INSUFFICIENT_DATA] is not supported.\n "];
  config_rule_names: string list option
    [@ocaml.doc "Filters the results by Config rule names.\n"]}[@@ocaml.doc
                                                                 "Filters a conformance pack by Config rule names, compliance types, Amazon Web Services resource types, and resource IDs.\n"]
type nonrec get_conformance_pack_compliance_details_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of evaluation results returned on each page. If you do no specify a number, Config uses the default. The default is 100.\n"];
  filters: conformance_pack_evaluation_filters option
    [@ocaml.doc "A [ConformancePackEvaluationFilters] object.\n"];
  conformance_pack_name: string
    [@ocaml.doc "Name of the conformance pack.\n"]}[@@ocaml.doc ""]
type nonrec compliance_contributor_count =
  {
  cap_exceeded: bool option
    [@ocaml.doc "Indicates whether the maximum count is reached.\n"];
  capped_count: int option
    [@ocaml.doc
      "The number of Amazon Web Services resources or Config rules responsible for the current compliance of the item.\n"]}
[@@ocaml.doc
  "The number of Amazon Web Services resources or Config rules responsible for the current compliance of the item, up to a maximum number.\n"]
type nonrec compliance_summary =
  {
  compliance_summary_timestamp: CoreTypes.Timestamp.t option
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
  resource_type: string option
    [@ocaml.doc "The type of Amazon Web Services resource.\n"]}[@@ocaml.doc
                                                                 "The number of Amazon Web Services resources of a specific type that are compliant or noncompliant, up to a maximum of 100 for each.\n"]
type nonrec get_compliance_summary_by_resource_type_response =
  {
  compliance_summaries_by_resource_type:
    compliance_summary_by_resource_type list option
    [@ocaml.doc
      "The number of resources that are compliant and the number that are noncompliant. If one or more resource types were provided with the request, the numbers are returned for each resource type. The maximum number returned is 100.\n"]}
[@@ocaml.doc "\n"]
type nonrec get_compliance_summary_by_resource_type_request =
  {
  resource_types: string list option
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
  result_token: string option
    [@ocaml.doc
      "An encrypted token that associates an evaluation with an Config rule. The token identifies the rule, the Amazon Web Services resource being evaluated, and the event that triggered the evaluation.\n"];
  annotation: string option
    [@ocaml.doc
      "Supplementary information about how the evaluation determined the compliance.\n"];
  config_rule_invoked_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the Config rule evaluated the Amazon Web Services resource.\n"];
  result_recorded_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time when Config recorded the evaluation result.\n"];
  compliance_type: compliance_type option
    [@ocaml.doc
      "Indicates whether the Amazon Web Services resource complies with the Config rule that evaluated it.\n\n For the [EvaluationResult] data type, Config supports only the [COMPLIANT], [NON_COMPLIANT], and [NOT_APPLICABLE] values. Config does not support the [INSUFFICIENT_DATA] value for the [EvaluationResult] data type.\n "];
  evaluation_result_identifier: evaluation_result_identifier option
    [@ocaml.doc "Uniquely identifies the evaluation result.\n"]}[@@ocaml.doc
                                                                  "The details of an Config evaluation. Provides the Amazon Web Services resource that was evaluated, the compliance of the resource, related time stamps, and supplementary information.\n"]
type nonrec get_compliance_details_by_resource_response =
  {
  next_token: string option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  evaluation_results: evaluation_result list option
    [@ocaml.doc
      "Indicates whether the specified Amazon Web Services resource complies each Config rule.\n"]}
[@@ocaml.doc "\n"]
type nonrec get_compliance_details_by_resource_request =
  {
  resource_evaluation_id: string option
    [@ocaml.doc
      "The unique ID of Amazon Web Services resource execution for which you want to retrieve evaluation results. \n\n  You need to only provide either a [ResourceEvaluationID] or a [ResourceID ]and [ResourceType].\n  \n   "];
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  compliance_types: compliance_type list option
    [@ocaml.doc
      "Filters the results by compliance.\n\n  [INSUFFICIENT_DATA] is a valid [ComplianceType] that is returned when an Config rule cannot be evaluated. However, [INSUFFICIENT_DATA] cannot be used as a [ComplianceType] for filtering results.\n "];
  resource_id: string option
    [@ocaml.doc
      "The ID of the Amazon Web Services resource for which you want compliance information.\n"];
  resource_type: string option
    [@ocaml.doc
      "The type of the Amazon Web Services resource for which you want compliance information.\n"]}
[@@ocaml.doc "\n"]
type nonrec get_compliance_details_by_config_rule_response =
  {
  next_token: string option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  evaluation_results: evaluation_result list option
    [@ocaml.doc
      "Indicates whether the Amazon Web Services resource complies with the specified Config rule.\n"]}
[@@ocaml.doc "\n"]
type nonrec get_compliance_details_by_config_rule_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of evaluation results returned on each page. The default is 10. You cannot specify a number greater than 100. If you specify 0, Config uses the default.\n"];
  compliance_types: compliance_type list option
    [@ocaml.doc
      "Filters the results by compliance.\n\n  [INSUFFICIENT_DATA] is a valid [ComplianceType] that is returned when an Config rule cannot be evaluated. However, [INSUFFICIENT_DATA] cannot be used as a [ComplianceType] for filtering results.\n "];
  config_rule_name: string
    [@ocaml.doc
      "The name of the Config rule for which you want compliance information.\n"]}
[@@ocaml.doc "\n"]
type nonrec oversized_configuration_item_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "The configuration item size is outside the allowable range.\n"]
type nonrec get_aggregate_resource_config_response =
  {
  configuration_item: configuration_item option
    [@ocaml.doc "Returns a [ConfigurationItem] object.\n"]}[@@ocaml.doc ""]
type nonrec get_aggregate_resource_config_request =
  {
  resource_identifier: aggregate_resource_identifier
    [@ocaml.doc "An object that identifies aggregate resource.\n"];
  configuration_aggregator_name: string
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec grouped_resource_count =
  {
  resource_count: int [@ocaml.doc "The number of resources in the group.\n"];
  group_name: string
    [@ocaml.doc
      "The name of the group that can be region, account ID, or resource type. For example, region1, region2 if the region was chosen as [GroupByKey].\n"]}
[@@ocaml.doc "The count of resources that are grouped by the group name.\n"]
type nonrec get_aggregate_discovered_resource_counts_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  grouped_resource_counts: grouped_resource_count list option
    [@ocaml.doc "Returns a list of GroupedResourceCount objects.\n"];
  group_by_key: string option
    [@ocaml.doc
      "The key passed into the request object. If [GroupByKey] is not provided, the result will be empty.\n"];
  total_discovered_resources: int
    [@ocaml.doc
      "The total number of resources that are present in an aggregator with the filters that you provide.\n"]}
[@@ocaml.doc ""]
type nonrec resource_count_filters =
  {
  region: string option
    [@ocaml.doc "The region where the account is located.\n"];
  account_id: string option [@ocaml.doc "The 12-digit ID of the account.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The type of the Amazon Web Services resource.\n"]}[@@ocaml.doc
                                                                    "Filters the resource count based on account ID, region, and resource type.\n"]
type nonrec resource_count_group_key =
  | AWS_REGION [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""]
  | RESOURCE_TYPE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_aggregate_discovered_resource_counts_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of [GroupedResourceCount] objects returned on each page. The default is 1000. You cannot specify a number greater than 1000. If you specify 0, Config uses the default.\n"];
  group_by_key: resource_count_group_key option
    [@ocaml.doc "The key to group the resource counts.\n"];
  filters: resource_count_filters option
    [@ocaml.doc
      "Filters the results based on the [ResourceCountFilters] object.\n"];
  configuration_aggregator_name: string
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec aggregate_conformance_pack_compliance_count =
  {
  non_compliant_conformance_pack_count: int option
    [@ocaml.doc "Number of noncompliant conformance packs.\n"];
  compliant_conformance_pack_count: int option
    [@ocaml.doc "Number of compliant conformance packs.\n"]}[@@ocaml.doc
                                                              "The number of conformance packs that are compliant and noncompliant.\n"]
type nonrec aggregate_conformance_pack_compliance_summary =
  {
  group_name: string option
    [@ocaml.doc
      "Groups the result based on Amazon Web Services account ID or Amazon Web Services Region.\n"];
  compliance_summary: aggregate_conformance_pack_compliance_count option
    [@ocaml.doc
      "Returns an [AggregateConformancePackComplianceCount] object. \n"]}
[@@ocaml.doc
  "Provides a summary of compliance based on either account ID or region. \n"]
type nonrec get_aggregate_conformance_pack_compliance_summary_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  group_by_key: string option
    [@ocaml.doc
      "Groups the result based on Amazon Web Services account ID or Amazon Web Services Region.\n"];
  aggregate_conformance_pack_compliance_summaries:
    aggregate_conformance_pack_compliance_summary list option
    [@ocaml.doc
      "Returns a list of [AggregateConformancePackComplianceSummary] object.\n"]}
[@@ocaml.doc ""]
type nonrec aggregate_conformance_pack_compliance_summary_filters =
  {
  aws_region: string option
    [@ocaml.doc
      "The source Amazon Web Services Region from where the data is aggregated.\n"];
  account_id: string option
    [@ocaml.doc
      "The 12-digit Amazon Web Services account ID of the source account.\n"]}
[@@ocaml.doc "Filters the results based on account ID and region. \n"]
type nonrec aggregate_conformance_pack_compliance_summary_group_key =
  | AWS_REGION [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_aggregate_conformance_pack_compliance_summary_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of results returned on each page. The default is maximum. If you specify 0, Config uses the default.\n"];
  group_by_key:
    aggregate_conformance_pack_compliance_summary_group_key option
    [@ocaml.doc
      "Groups the result based on Amazon Web Services account ID or Amazon Web Services Region.\n"];
  filters: aggregate_conformance_pack_compliance_summary_filters option
    [@ocaml.doc
      "Filters the results based on the [AggregateConformancePackComplianceSummaryFilters] object.\n"];
  configuration_aggregator_name: string
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec aggregate_compliance_count =
  {
  compliance_summary: compliance_summary option
    [@ocaml.doc "The number of compliant and noncompliant Config rules.\n"];
  group_name: string option
    [@ocaml.doc
      "The 12-digit account ID or region based on the GroupByKey value.\n"]}
[@@ocaml.doc
  "Returns the number of compliant and noncompliant rules for one or more accounts and regions in an aggregator.\n"]
type nonrec get_aggregate_config_rule_compliance_summary_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  aggregate_compliance_counts: aggregate_compliance_count list option
    [@ocaml.doc "Returns a list of AggregateComplianceCounts object.\n"];
  group_by_key: string option
    [@ocaml.doc "Groups the result based on ACCOUNT_ID or AWS_REGION.\n"]}
[@@ocaml.doc ""]
type nonrec config_rule_compliance_summary_filters =
  {
  aws_region: string option
    [@ocaml.doc "The source region where the data is aggregated.\n"];
  account_id: string option
    [@ocaml.doc "The 12-digit account ID of the source account.\n"]}[@@ocaml.doc
                                                                    "Filters the results based on the account IDs and regions.\n"]
type nonrec config_rule_compliance_summary_group_key =
  | AWS_REGION [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_aggregate_config_rule_compliance_summary_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of evaluation results returned on each page. The default is 1000. You cannot specify a number greater than 1000. If you specify 0, Config uses the default.\n"];
  group_by_key: config_rule_compliance_summary_group_key option
    [@ocaml.doc "Groups the result based on ACCOUNT_ID or AWS_REGION.\n"];
  filters: config_rule_compliance_summary_filters option
    [@ocaml.doc
      "Filters the results based on the ConfigRuleComplianceSummaryFilters object.\n"];
  configuration_aggregator_name: string
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec aggregate_evaluation_result =
  {
  aws_region: string option
    [@ocaml.doc "The source region from where the data is aggregated.\n"];
  account_id: string option
    [@ocaml.doc "The 12-digit account ID of the source account.\n"];
  annotation: string option
    [@ocaml.doc
      "Supplementary information about how the agrregate evaluation determined the compliance.\n"];
  config_rule_invoked_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the Config rule evaluated the Amazon Web Services resource.\n"];
  result_recorded_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when Config recorded the aggregate evaluation result.\n"];
  compliance_type: compliance_type option
    [@ocaml.doc
      "The resource compliance status.\n\n For the [AggregationEvaluationResult] data type, Config supports only the [COMPLIANT] and [NON_COMPLIANT]. Config does not support the [NOT_APPLICABLE] and [INSUFFICIENT_DATA] value.\n "];
  evaluation_result_identifier: evaluation_result_identifier option
    [@ocaml.doc "Uniquely identifies the evaluation result.\n"]}[@@ocaml.doc
                                                                  "The details of an Config evaluation for an account ID and region in an aggregator. Provides the Amazon Web Services resource that was evaluated, the compliance of the resource, related time stamps, and supplementary information. \n"]
type nonrec get_aggregate_compliance_details_by_config_rule_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  aggregate_evaluation_results: aggregate_evaluation_result list option
    [@ocaml.doc "Returns an AggregateEvaluationResults object.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec get_aggregate_compliance_details_by_config_rule_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of evaluation results returned on each page. The default is 50. You cannot specify a number greater than 100. If you specify 0, Config uses the default.\n"];
  compliance_type: compliance_type option
    [@ocaml.doc
      "The resource compliance status.\n\n  For the [GetAggregateComplianceDetailsByConfigRuleRequest] data type, Config supports only the [COMPLIANT] and [NON_COMPLIANT]. Config does not support the [NOT_APPLICABLE] and [INSUFFICIENT_DATA] values.\n  \n   "];
  aws_region: string
    [@ocaml.doc "The source region from where the data is aggregated.\n"];
  account_id: string
    [@ocaml.doc "The 12-digit account ID of the source account.\n"];
  config_rule_name: string
    [@ocaml.doc
      "The name of the Config rule for which you want compliance information.\n"];
  configuration_aggregator_name: string
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec disassociate_resource_types_response =
  {
  configuration_recorder: configuration_recorder [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
type nonrec disassociate_resource_types_request =
  {
  resource_types: resource_type list
    [@ocaml.doc
      "The list of resource types you want to remove from the recording group of the specified configuration recorder.\n"];
  configuration_recorder_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the specified configuration recorder.\n"]}
[@@ocaml.doc ""]
type nonrec no_such_retention_configuration_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You have specified a retention configuration that does not exist.\n"]
type nonrec describe_retention_configurations_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  retention_configurations: retention_configuration list option
    [@ocaml.doc "Returns a retention configuration object.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec describe_retention_configurations_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  retention_configuration_names: string list option
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
  stop_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time when the step stopped.\n"];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time when the step started.\n"];
  error_message: string option
    [@ocaml.doc
      "An error message if the step was interrupted during execution.\n"];
  state: remediation_execution_step_state option
    [@ocaml.doc "The valid status of the step.\n"];
  name: string option [@ocaml.doc "The details of the step.\n"]}[@@ocaml.doc
                                                                  "Name of the step from the SSM document.\n"]
type nonrec remediation_execution_status =
  {
  last_updated_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the remediation execution was last updated.\n"];
  invocation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "Start time when the remediation was executed.\n"];
  step_details: remediation_execution_step list option
    [@ocaml.doc "Details of every step.\n"];
  state: remediation_execution_state option
    [@ocaml.doc "ENUM of the values.\n"];
  resource_key: resource_key option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "Provides details of the current status of the invoked remediation action for that resource.\n"]
type nonrec describe_remediation_execution_status_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  remediation_execution_statuses: remediation_execution_status list option
    [@ocaml.doc
      "Returns a list of remediation execution statuses objects.\n"]}
[@@ocaml.doc ""]
type nonrec describe_remediation_execution_status_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of RemediationExecutionStatuses returned on each page. The default is maximum. If you specify 0, Config uses the default. \n"];
  resource_keys: resource_key list option
    [@ocaml.doc
      "A list of resource keys to be processed with the current request. Each element in the list consists of the resource type and resource ID. \n"];
  config_rule_name: string [@ocaml.doc "The name of the Config rule.\n"]}
[@@ocaml.doc ""]
type nonrec describe_remediation_exceptions_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  remediation_exceptions: remediation_exception list option
    [@ocaml.doc "Returns a list of remediation exception objects.\n"]}
[@@ocaml.doc ""]
type nonrec describe_remediation_exceptions_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of RemediationExceptionResourceKey returned on each page. The default is 25. If you specify 0, Config uses the default.\n"];
  resource_keys: remediation_exception_resource_key list option
    [@ocaml.doc
      "An exception list of resource exception keys to be processed with the current request. Config adds exception for each resource key. For example, Config adds 3 exceptions for 3 resource keys. \n"];
  config_rule_name: string [@ocaml.doc "The name of the Config rule.\n"]}
[@@ocaml.doc ""]
type nonrec describe_remediation_configurations_response =
  {
  remediation_configurations: remediation_configuration list option
    [@ocaml.doc "Returns a remediation configuration object.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec describe_remediation_configurations_request =
  {
  config_rule_names: string list
    [@ocaml.doc
      "A list of Config rule names of remediation configurations for which you want details. \n"]}
[@@ocaml.doc ""]
type nonrec pending_aggregation_request =
  {
  requester_aws_region: string option
    [@ocaml.doc "The region requesting to aggregate data. \n"];
  requester_account_id: string option
    [@ocaml.doc
      "The 12-digit account ID of the account requesting to aggregate data.\n"]}
[@@ocaml.doc
  "An object that represents the account ID and region of an aggregator account that is requesting authorization but is not yet authorized.\n"]
type nonrec describe_pending_aggregation_requests_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  pending_aggregation_requests: pending_aggregation_request list option
    [@ocaml.doc "Returns a PendingAggregationRequests object.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec describe_pending_aggregation_requests_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: int option
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
  last_update_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp of the last update.\n"];
  error_message: string option
    [@ocaml.doc
      "An error message indicating that organization conformance pack creation or deletion failed due to an error. \n"];
  error_code: string option
    [@ocaml.doc
      "An error code that is returned when organization conformance pack creation or deletion has failed in a member account. \n"];
  status: organization_resource_status
    [@ocaml.doc
      "Indicates deployment status of an organization conformance pack. When management account calls PutOrganizationConformancePack for the first time, conformance pack status is created in all the member accounts. When management account calls PutOrganizationConformancePack for the second time, conformance pack status is updated in all the member accounts. Additionally, conformance pack status is updated when one or more member accounts join or leave an organization. Conformance pack status is deleted when the management account deletes OrganizationConformancePack in all the member accounts and disables service access for [config-multiaccountsetup.amazonaws.com].\n\n Config sets the state of the conformance pack to:\n \n  {ul\n        {-   [CREATE_SUCCESSFUL] when an organization conformance pack has been successfully created in all the member accounts. \n            \n             }\n        {-   [CREATE_IN_PROGRESS] when an organization conformance pack creation is in progress.\n            \n             }\n        {-   [CREATE_FAILED] when an organization conformance pack creation failed in one or more member accounts within that organization.\n            \n             }\n        {-   [DELETE_FAILED] when an organization conformance pack deletion failed in one or more member accounts within that organization.\n            \n             }\n        {-   [DELETE_IN_PROGRESS] when an organization conformance pack deletion is in progress.\n            \n             }\n        {-   [DELETE_SUCCESSFUL] when an organization conformance pack has been successfully deleted from all the member accounts.\n            \n             }\n        {-   [UPDATE_SUCCESSFUL] when an organization conformance pack has been successfully updated in all the member accounts.\n            \n             }\n        {-   [UPDATE_IN_PROGRESS] when an organization conformance pack update is in progress.\n            \n             }\n        {-   [UPDATE_FAILED] when an organization conformance pack update failed in one or more member accounts within that organization.\n            \n             }\n        }\n  "];
  organization_conformance_pack_name: string
    [@ocaml.doc
      "The name that you assign to organization conformance pack.\n"]}
[@@ocaml.doc
  "Returns the status for an organization conformance pack in an organization.\n"]
type nonrec describe_organization_conformance_pack_statuses_response =
  {
  next_token: string option
    [@ocaml.doc
      "The nextToken string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  organization_conformance_pack_statuses:
    organization_conformance_pack_status list option
    [@ocaml.doc "A list of [OrganizationConformancePackStatus] objects. \n"]}
[@@ocaml.doc ""]
type nonrec describe_organization_conformance_pack_statuses_request =
  {
  next_token: string option
    [@ocaml.doc
      "The nextToken string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of OrganizationConformancePackStatuses returned on each page. If you do no specify a number, Config uses the default. The default is 100. \n"];
  organization_conformance_pack_names: string list option
    [@ocaml.doc
      "The names of organization conformance packs for which you want status details. If you do not specify any names, Config returns details for all your organization conformance packs. \n"]}
[@@ocaml.doc ""]
type nonrec organization_conformance_pack =
  {
  last_update_time: CoreTypes.Timestamp.t
    [@ocaml.doc
      "Last time when organization conformation pack was updated.\n"];
  excluded_accounts: string list option
    [@ocaml.doc
      "A comma-separated list of accounts excluded from organization conformance pack.\n"];
  conformance_pack_input_parameters:
    conformance_pack_input_parameter list option
    [@ocaml.doc "A list of [ConformancePackInputParameter] objects.\n"];
  delivery_s3_key_prefix: string option
    [@ocaml.doc
      "Any folder structure you want to add to an Amazon S3 bucket.\n\n  This field is optional.\n  \n   "];
  delivery_s3_bucket: string option
    [@ocaml.doc
      "The name of the Amazon S3 bucket where Config stores conformance pack templates. \n\n  This field is optional.\n  \n   "];
  organization_conformance_pack_arn: string
    [@ocaml.doc
      "Amazon Resource Name (ARN) of organization conformance pack.\n"];
  organization_conformance_pack_name: string
    [@ocaml.doc "The name you assign to an organization conformance pack.\n"]}
[@@ocaml.doc
  "An organization conformance pack that has information about conformance packs that Config creates in member accounts. \n"]
type nonrec describe_organization_conformance_packs_response =
  {
  next_token: string option
    [@ocaml.doc
      "The nextToken string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  organization_conformance_packs: organization_conformance_pack list option
    [@ocaml.doc "Returns a list of OrganizationConformancePacks objects.\n"]}
[@@ocaml.doc ""]
type nonrec describe_organization_conformance_packs_request =
  {
  next_token: string option
    [@ocaml.doc
      "The nextToken string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of organization config packs returned on each page. If you do no specify a number, Config uses the default. The default is 100.\n"];
  organization_conformance_pack_names: string list option
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
  last_update_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp of the last update.\n"];
  error_message: string option
    [@ocaml.doc
      "An error message indicating that organization Config rule creation or deletion failed due to an error.\n"];
  error_code: string option
    [@ocaml.doc
      "An error code that is returned when organization Config rule creation or deletion has failed.\n"];
  organization_rule_status: organization_rule_status
    [@ocaml.doc
      "Indicates deployment status of an organization Config rule. When management account calls PutOrganizationConfigRule action for the first time, Config rule status is created in all the member accounts. When management account calls PutOrganizationConfigRule action for the second time, Config rule status is updated in all the member accounts. Additionally, Config rule status is updated when one or more member accounts join or leave an organization. Config rule status is deleted when the management account deletes OrganizationConfigRule in all the member accounts and disables service access for [config-multiaccountsetup.amazonaws.com].\n\n Config sets the state of the rule to:\n \n  {ul\n        {-   [CREATE_SUCCESSFUL] when an organization Config rule has been successfully created in all the member accounts. \n            \n             }\n        {-   [CREATE_IN_PROGRESS] when an organization Config rule creation is in progress.\n            \n             }\n        {-   [CREATE_FAILED] when an organization Config rule creation failed in one or more member accounts within that organization.\n            \n             }\n        {-   [DELETE_FAILED] when an organization Config rule deletion failed in one or more member accounts within that organization.\n            \n             }\n        {-   [DELETE_IN_PROGRESS] when an organization Config rule deletion is in progress.\n            \n             }\n        {-   [DELETE_SUCCESSFUL] when an organization Config rule has been successfully deleted from all the member accounts.\n            \n             }\n        {-   [UPDATE_SUCCESSFUL] when an organization Config rule has been successfully updated in all the member accounts.\n            \n             }\n        {-   [UPDATE_IN_PROGRESS] when an organization Config rule update is in progress.\n            \n             }\n        {-   [UPDATE_FAILED] when an organization Config rule update failed in one or more member accounts within that organization.\n            \n             }\n        }\n  "];
  organization_config_rule_name: string
    [@ocaml.doc "The name that you assign to organization Config rule.\n"]}
[@@ocaml.doc
  "Returns the status for an organization Config rule in an organization.\n"]
type nonrec describe_organization_config_rule_statuses_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  organization_config_rule_statuses:
    organization_config_rule_status list option
    [@ocaml.doc "A list of [OrganizationConfigRuleStatus] objects.\n"]}
[@@ocaml.doc ""]
type nonrec describe_organization_config_rule_statuses_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of [OrganizationConfigRuleStatuses] returned on each page. If you do no specify a number, Config uses the default. The default is 100.\n"];
  organization_config_rule_names: string list option
    [@ocaml.doc
      "The names of organization Config rules for which you want status details. If you do not specify any names, Config returns details for all your organization Config rules.\n"]}
[@@ocaml.doc ""]
type nonrec organization_custom_policy_rule_metadata_no_policy =
  {
  debug_log_delivery_accounts: string list option
    [@ocaml.doc
      "A list of accounts that you can enable debug logging for your organization Config Custom Policy rule. List is null when debug logging is enabled for all accounts.\n"];
  policy_runtime: string option
    [@ocaml.doc
      "The runtime system for your organization Config Custom Policy rules. Guard is a policy-as-code language that allows you to write policies that are enforced by Config Custom Policy rules. For more information about Guard, see the {{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}.\n"];
  tag_value_scope: string option
    [@ocaml.doc
      "The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key).\n"];
  tag_key_scope: string option
    [@ocaml.doc
      "One part of a key-value pair that make up a tag. A key is a general label that acts like a category for more specific tag values.\n"];
  resource_id_scope: string option
    [@ocaml.doc
      "The ID of the Amazon Web Services resource that was evaluated.\n"];
  resource_types_scope: string list option
    [@ocaml.doc
      "The type of the Amazon Web Services resource that was evaluated.\n"];
  maximum_execution_frequency: maximum_execution_frequency option
    [@ocaml.doc
      "The maximum frequency with which Config runs evaluations for a rule. Your Config Custom Policy rule is triggered when Config delivers the configuration snapshot. For more information, see [ConfigSnapshotDeliveryProperties].\n"];
  input_parameters: string option
    [@ocaml.doc
      "A string, in JSON format, that is passed to your organization Config Custom Policy rule.\n"];
  organization_config_rule_trigger_types:
    organization_config_rule_trigger_type_no_s_n list option
    [@ocaml.doc
      "The type of notification that triggers Config to run an evaluation for a rule. For Config Custom Policy rules, Config supports change triggered notification types:\n\n {ul\n       {-   [ConfigurationItemChangeNotification] - Triggers an evaluation when Config delivers a configuration item as a result of a resource change.\n           \n            }\n       {-   [OversizedConfigurationItemChangeNotification] - Triggers an evaluation when Config delivers an oversized configuration item. Config may generate this notification type when a resource changes and the notification exceeds the maximum size allowed by Amazon SNS.\n           \n            }\n       }\n  "];
  description: string option
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
  last_update_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp of the last update.\n"];
  excluded_accounts: string list option
    [@ocaml.doc
      "A comma-separated list of accounts excluded from organization Config rule.\n"];
  organization_custom_rule_metadata: organization_custom_rule_metadata option
    [@ocaml.doc "An [OrganizationCustomRuleMetadata] object.\n"];
  organization_managed_rule_metadata:
    organization_managed_rule_metadata option
    [@ocaml.doc "An [OrganizationManagedRuleMetadata] object.\n"];
  organization_config_rule_arn: string
    [@ocaml.doc "Amazon Resource Name (ARN) of organization Config rule.\n"];
  organization_config_rule_name: string
    [@ocaml.doc "The name that you assign to organization Config rule.\n"]}
[@@ocaml.doc
  "An organization Config rule that has information about Config rules that Config creates in member accounts.\n"]
type nonrec describe_organization_config_rules_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  organization_config_rules: organization_config_rule list option
    [@ocaml.doc "Returns a list of [OrganizationConfigRule] objects.\n"]}
[@@ocaml.doc ""]
type nonrec describe_organization_config_rules_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response. \n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of organization Config rules returned on each page. If you do no specify a number, Config uses the default. The default is 100.\n"];
  organization_config_rule_names: string list option
    [@ocaml.doc
      "The names of organization Config rules for which you want details. If you do not specify any names, Config returns details for all your organization Config rules.\n"]}
[@@ocaml.doc ""]
type nonrec no_such_delivery_channel_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc "You have specified a delivery channel that does not exist.\n"]
type nonrec delivery_status =
  | Not_Applicable [@ocaml.doc ""]
  | Failure [@ocaml.doc ""]
  | Success [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec config_export_delivery_info =
  {
  next_delivery_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time that the next delivery occurs.\n"];
  last_successful_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time of the last successful delivery.\n"];
  last_attempt_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time of the last attempted delivery.\n"];
  last_error_message: string option
    [@ocaml.doc "The error message from the last attempted delivery.\n"];
  last_error_code: string option
    [@ocaml.doc "The error code from the last attempted delivery.\n"];
  last_status: delivery_status option
    [@ocaml.doc "Status of the last attempted delivery.\n"]}[@@ocaml.doc
                                                              "Provides status of the delivery of the snapshot or the configuration history to the specified Amazon S3 bucket. Also provides the status of notifications about the Amazon S3 delivery to the specified Amazon SNS topic.\n"]
type nonrec config_stream_delivery_info =
  {
  last_status_change_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time from the last status change.\n"];
  last_error_message: string option
    [@ocaml.doc "The error message from the last attempted delivery.\n"];
  last_error_code: string option
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
  name: string option [@ocaml.doc "The name of the delivery channel.\n"]}
[@@ocaml.doc
  "The status of a specified delivery channel.\n\n Valid values: [Success] | [Failure] \n "]
type nonrec describe_delivery_channel_status_response =
  {
  delivery_channels_status: delivery_channel_status list option
    [@ocaml.doc
      "A list that contains the status of a specified delivery channel.\n"]}
[@@ocaml.doc "The output for the [DescribeDeliveryChannelStatus] action.\n"]
type nonrec describe_delivery_channel_status_request =
  {
  delivery_channel_names: string list option
    [@ocaml.doc "A list of delivery channel names.\n"]}[@@ocaml.doc
                                                         "The input for the [DeliveryChannelStatus] action.\n"]
type nonrec describe_delivery_channels_response =
  {
  delivery_channels: delivery_channel list option
    [@ocaml.doc
      "A list that contains the descriptions of the specified delivery channel.\n"]}
[@@ocaml.doc "The output for the [DescribeDeliveryChannels] action.\n"]
type nonrec describe_delivery_channels_request =
  {
  delivery_channel_names: string list option
    [@ocaml.doc "A list of delivery channel names.\n"]}[@@ocaml.doc
                                                         "The input for the [DescribeDeliveryChannels] action.\n"]
type nonrec conformance_pack_state =
  | DELETE_FAILED [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | CREATE_COMPLETE [@ocaml.doc ""]
  | CREATE_IN_PROGRESS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec conformance_pack_status_detail =
  {
  last_update_completed_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Last time when conformation pack creation and update was successful.\n"];
  last_update_requested_time: CoreTypes.Timestamp.t
    [@ocaml.doc
      "Last time when conformation pack creation and update was requested.\n"];
  conformance_pack_status_reason: string option
    [@ocaml.doc "The reason of conformance pack creation failure.\n"];
  stack_arn: string
    [@ocaml.doc "Amazon Resource Name (ARN) of CloudFormation stack. \n"];
  conformance_pack_state: conformance_pack_state
    [@ocaml.doc
      "Indicates deployment status of conformance pack.\n\n Config sets the state of the conformance pack to:\n \n  {ul\n        {-  CREATE_IN_PROGRESS when a conformance pack creation is in progress for an account.\n            \n             }\n        {-  CREATE_COMPLETE when a conformance pack has been successfully created in your account.\n            \n             }\n        {-  CREATE_FAILED when a conformance pack creation failed in your account.\n            \n             }\n        {-  DELETE_IN_PROGRESS when a conformance pack deletion is in progress. \n            \n             }\n        {-  DELETE_FAILED when a conformance pack deletion failed in your account.\n            \n             }\n        }\n  "];
  conformance_pack_arn: string
    [@ocaml.doc "Amazon Resource Name (ARN) of comformance pack.\n"];
  conformance_pack_id: string [@ocaml.doc "ID of the conformance pack.\n"];
  conformance_pack_name: string
    [@ocaml.doc "Name of the conformance pack.\n"]}[@@ocaml.doc
                                                     "Status details of a conformance pack.\n"]
type nonrec describe_conformance_pack_status_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  conformance_pack_status_details: conformance_pack_status_detail list option
    [@ocaml.doc "A list of [ConformancePackStatusDetail] objects.\n"]}
[@@ocaml.doc ""]
type nonrec describe_conformance_pack_status_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of conformance packs status returned on each page.\n"];
  conformance_pack_names: string list option
    [@ocaml.doc "Comma-separated list of conformance pack names.\n"]}
[@@ocaml.doc ""]
type nonrec conformance_pack_detail =
  {
  template_ssm_document_details: template_ssm_document_details option
    [@ocaml.doc
      "An object that contains the name or Amazon Resource Name (ARN) of the Amazon Web Services Systems Manager document (SSM document) and the version of the SSM document that is used to create a conformance pack.\n"];
  created_by: string option
    [@ocaml.doc
      "The Amazon Web Services service that created the conformance pack.\n"];
  last_update_requested_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The last time a conformation pack update was requested. \n"];
  conformance_pack_input_parameters:
    conformance_pack_input_parameter list option
    [@ocaml.doc "A list of [ConformancePackInputParameter] objects.\n"];
  delivery_s3_key_prefix: string option
    [@ocaml.doc
      "The prefix for the Amazon S3 bucket.\n\n  This field is optional.\n  \n   "];
  delivery_s3_bucket: string option
    [@ocaml.doc
      "The name of the Amazon S3 bucket where Config stores conformance pack templates. \n\n  This field is optional.\n  \n   "];
  conformance_pack_id: string [@ocaml.doc "ID of the conformance pack.\n"];
  conformance_pack_arn: string
    [@ocaml.doc "Amazon Resource Name (ARN) of the conformance pack.\n"];
  conformance_pack_name: string
    [@ocaml.doc "Name of the conformance pack.\n"]}[@@ocaml.doc
                                                     "Returns details of a conformance pack. A conformance pack is a collection of Config rules and remediation actions that can be easily deployed in an account and a region.\n"]
type nonrec describe_conformance_packs_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  conformance_pack_details: conformance_pack_detail list option
    [@ocaml.doc "Returns a list of [ConformancePackDetail] objects.\n"]}
[@@ocaml.doc ""]
type nonrec describe_conformance_packs_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of conformance packs returned on each page.\n"];
  conformance_pack_names: string list option
    [@ocaml.doc
      "Comma-separated list of conformance pack names for which you want details. If you do not specify any names, Config returns details for all your conformance packs. \n"]}
[@@ocaml.doc ""]
type nonrec conformance_pack_rule_compliance =
  {
  controls: string list option
    [@ocaml.doc
      "Controls for the conformance pack. A control is a process to prevent or detect problems while meeting objectives. A control can align with a specific compliance regime or map to internal controls defined by an organization.\n"];
  compliance_type: conformance_pack_compliance_type option
    [@ocaml.doc "Compliance of the Config rule.\n"];
  config_rule_name: string option [@ocaml.doc "Name of the Config rule.\n"]}
[@@ocaml.doc
  "Compliance information of one or more Config rules within a conformance pack. You can filter using Config rule names and compliance types.\n"]
type nonrec describe_conformance_pack_compliance_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  conformance_pack_rule_compliance_list:
    conformance_pack_rule_compliance list
    [@ocaml.doc
      "Returns a list of [ConformancePackRuleCompliance] objects.\n"];
  conformance_pack_name: string
    [@ocaml.doc "Name of the conformance pack.\n"]}[@@ocaml.doc ""]
type nonrec conformance_pack_compliance_filters =
  {
  compliance_type: conformance_pack_compliance_type option
    [@ocaml.doc
      "Filters the results by compliance.\n\n The allowed values are [COMPLIANT] and [NON_COMPLIANT]. [INSUFFICIENT_DATA] is not supported.\n "];
  config_rule_names: string list option
    [@ocaml.doc "Filters the results by Config rule names.\n"]}[@@ocaml.doc
                                                                 "Filters the conformance pack by compliance types and Config rule names.\n"]
type nonrec describe_conformance_pack_compliance_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of Config rules within a conformance pack are returned on each page.\n"];
  filters: conformance_pack_compliance_filters option
    [@ocaml.doc "A [ConformancePackComplianceFilters] object.\n"];
  conformance_pack_name: string
    [@ocaml.doc "Name of the conformance pack.\n"]}[@@ocaml.doc ""]
type nonrec recorder_status =
  | NotApplicable [@ocaml.doc ""]
  | Failure [@ocaml.doc ""]
  | Success [@ocaml.doc ""]
  | Pending [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec configuration_recorder_status =
  {
  service_principal: string option
    [@ocaml.doc
      "For service-linked configuration recorders, the service principal of the linked Amazon Web Services service.\n"];
  last_status_change_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time of the latest change in status of an recording event processed by the recorder.\n"];
  last_error_message: string option
    [@ocaml.doc
      "The latest error message from when the recorder last failed.\n"];
  last_error_code: string option
    [@ocaml.doc
      "The latest error code from when the recorder last failed.\n"];
  last_status: recorder_status option
    [@ocaml.doc
      "The status of the latest recording event processed by the recorder.\n"];
  recording: bool option
    [@ocaml.doc
      "Specifies whether or not the recorder is currently recording.\n"];
  last_stop_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time the recorder was last stopped.\n"];
  last_start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time the recorder was last started.\n"];
  name: string option
    [@ocaml.doc "The name of the configuration recorder.\n"];
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the configuration recorder.\n"]}
[@@ocaml.doc
  "The current status of the configuration recorder.\n\n For a detailed status of recording events over time, add your Config events to CloudWatch metrics and use CloudWatch metrics.\n "]
type nonrec describe_configuration_recorder_status_response =
  {
  configuration_recorders_status: configuration_recorder_status list option
    [@ocaml.doc "A list that contains status of the specified recorders.\n"]}
[@@ocaml.doc
  "The output for the [DescribeConfigurationRecorderStatus] action, in JSON format.\n"]
type nonrec describe_configuration_recorder_status_request =
  {
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the configuration recorder that you want to specify.\n"];
  service_principal: string option
    [@ocaml.doc
      "For service-linked configuration recorders, you can use the service principal of the linked Amazon Web Services service to specify the configuration recorder.\n"];
  configuration_recorder_names: string list option
    [@ocaml.doc
      "The name of the configuration recorder. If the name is not specified, the opertation returns the status for the customer managed configuration recorder configured for the account, if applicable.\n\n  When making a request to this operation, you can only specify one configuration recorder.\n  \n   "]}
[@@ocaml.doc
  "The input for the [DescribeConfigurationRecorderStatus] action.\n"]
type nonrec describe_configuration_recorders_response =
  {
  configuration_recorders: configuration_recorder list option
    [@ocaml.doc
      "A list that contains the descriptions of the specified configuration recorders.\n"]}
[@@ocaml.doc "The output for the [DescribeConfigurationRecorders] action.\n"]
type nonrec describe_configuration_recorders_request =
  {
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the configuration recorder that you want to specify.\n"];
  service_principal: string option
    [@ocaml.doc
      "For service-linked configuration recorders, you can use the service principal of the linked Amazon Web Services service to specify the configuration recorder.\n"];
  configuration_recorder_names: string list option
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
  last_error_message: string option
    [@ocaml.doc
      "The message indicating that the source account aggregation failed due to an error.\n"];
  last_error_code: string option
    [@ocaml.doc
      "The error code that Config returned when the source account aggregation last failed.\n"];
  last_update_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time of the last update.\n"];
  last_update_status: aggregated_source_status_type option
    [@ocaml.doc
      "Filters the last updated status type.\n\n {ul\n       {-  Valid value FAILED indicates errors while moving data.\n           \n            }\n       {-  Valid value SUCCEEDED indicates the data was successfully moved.\n           \n            }\n       {-  Valid value OUTDATED indicates the data is not the most recent.\n           \n            }\n       }\n  "];
  aws_region: string option
    [@ocaml.doc "The region authorized to collect aggregated data.\n"];
  source_type: aggregated_source_type option
    [@ocaml.doc "The source account or an organization.\n"];
  source_id: string option
    [@ocaml.doc "The source account ID or an organization.\n"]}[@@ocaml.doc
                                                                 "The current sync status between the source and the aggregator account.\n"]
type nonrec describe_configuration_aggregator_sources_status_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  aggregated_source_status_list: aggregated_source_status list option
    [@ocaml.doc "Returns an AggregatedSourceStatus object. \n"]}[@@ocaml.doc
                                                                  ""]
type nonrec describe_configuration_aggregator_sources_status_request =
  {
  limit: int option
    [@ocaml.doc
      "The maximum number of AggregatorSourceStatus returned on each page. The default is maximum. If you specify 0, Config uses the default.\n"];
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  update_status: aggregated_source_status_type list option
    [@ocaml.doc
      "Filters the status type.\n\n {ul\n       {-  Valid value FAILED indicates errors while moving data.\n           \n            }\n       {-  Valid value SUCCEEDED indicates the data was successfully moved.\n           \n            }\n       {-  Valid value OUTDATED indicates the data is not the most recent.\n           \n            }\n       }\n  "];
  configuration_aggregator_name: string
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec describe_configuration_aggregators_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  configuration_aggregators: configuration_aggregator list option
    [@ocaml.doc "Returns a ConfigurationAggregators object.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec describe_configuration_aggregators_request =
  {
  limit: int option
    [@ocaml.doc
      "The maximum number of configuration aggregators returned on each page. The default is maximum. If you specify 0, Config uses the default.\n"];
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  configuration_aggregator_names: string list option
    [@ocaml.doc "The name of the configuration aggregators.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec describe_config_rules_response =
  {
  next_token: string option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  config_rules: config_rule list option
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
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  config_rule_names: string list option
    [@ocaml.doc
      "The names of the Config rules for which you want details. If you do not specify any names, Config returns details for all your rules.\n"]}
[@@ocaml.doc "\n"]
type nonrec config_rule_evaluation_status =
  {
  last_debug_log_delivery_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time Config last attempted to deliver a debug log for your Config Custom Policy rules.\n"];
  last_debug_log_delivery_status_reason: string option
    [@ocaml.doc
      "The reason Config was not able to deliver a debug log. This is for the last failed attempt to retrieve a debug log for your Config Custom Policy rules.\n"];
  last_debug_log_delivery_status: string option
    [@ocaml.doc
      "The status of the last attempted delivery of a debug log for your Config Custom Policy rules. Either [Successful] or [Failed].\n"];
  first_evaluation_started: bool option
    [@ocaml.doc
      "Indicates whether Config has evaluated your resources against the rule at least once.\n\n {ul\n       {-   [true] - Config has evaluated your Amazon Web Services resources against the rule at least once.\n           \n            }\n       {-   [false] - Config has not finished evaluating your Amazon Web Services resources against the rule at least once.\n           \n            }\n       }\n  "];
  last_error_message: string option
    [@ocaml.doc
      "The error message that Config returned when the rule last failed.\n"];
  last_error_code: string option
    [@ocaml.doc
      "The error code that Config returned when the rule last failed.\n"];
  last_deactivated_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time that you last turned off the Config rule.\n"];
  first_activated_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time that you first activated the Config rule.\n"];
  last_failed_evaluation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time that Config last failed to evaluate your Amazon Web Services resources against the rule.\n"];
  last_successful_evaluation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time that Config last successfully evaluated your Amazon Web Services resources against the rule.\n"];
  last_failed_invocation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time that Config last failed to invoke the Config rule to evaluate your Amazon Web Services resources.\n"];
  last_successful_invocation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time that Config last successfully invoked the Config rule to evaluate your Amazon Web Services resources.\n"];
  config_rule_id: string option [@ocaml.doc "The ID of the Config rule.\n"];
  config_rule_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the Config rule.\n"];
  config_rule_name: string option
    [@ocaml.doc "The name of the Config rule.\n"]}[@@ocaml.doc
                                                    "Status information for your Config Managed rules and Config Custom Policy rules. The status includes information such as the last time the rule ran, the last time it failed, and the related error for the last failure.\n\n This operation does not return status information about Config Custom Lambda rules.\n "]
type nonrec describe_config_rule_evaluation_status_response =
  {
  next_token: string option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  config_rules_evaluation_status: config_rule_evaluation_status list option
    [@ocaml.doc "Status information about your Config managed rules.\n"]}
[@@ocaml.doc "\n"]
type nonrec describe_config_rule_evaluation_status_request =
  {
  limit: int option
    [@ocaml.doc
      "The number of rule evaluation results that you want returned.\n\n This parameter is required if the rule limit for your account is more than the default of 1000 rules.\n \n  For information about requesting a rule limit increase, see {{:http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_config}Config Limits} in the {i Amazon Web Services General Reference Guide}.\n  "];
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  config_rule_names: string list option
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
  resource_id: string option
    [@ocaml.doc
      "The ID of the Amazon Web Services resource that was evaluated.\n"];
  resource_type: string option
    [@ocaml.doc
      "The type of the Amazon Web Services resource that was evaluated.\n"]}
[@@ocaml.doc
  "Indicates whether an Amazon Web Services resource that is evaluated according to one or more Config rules is compliant. A resource is compliant if it complies with all of the rules that evaluate it. A resource is noncompliant if it does not comply with one or more of these rules.\n"]
type nonrec describe_compliance_by_resource_response =
  {
  next_token: string option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  compliance_by_resources: compliance_by_resource list option
    [@ocaml.doc
      "Indicates whether the specified Amazon Web Services resource complies with all of the Config rules that evaluate it.\n"]}
[@@ocaml.doc "\n"]
type nonrec describe_compliance_by_resource_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of evaluation results returned on each page. The default is 10. You cannot specify a number greater than 100. If you specify 0, Config uses the default.\n"];
  compliance_types: compliance_type list option
    [@ocaml.doc "Filters the results by compliance.\n"];
  resource_id: string option
    [@ocaml.doc
      "The ID of the Amazon Web Services resource for which you want compliance information. You can specify only one resource ID. If you specify a resource ID, you must also specify a type for [ResourceType].\n"];
  resource_type: string option
    [@ocaml.doc
      "The types of Amazon Web Services resources for which you want compliance information (for example, [AWS::EC2::Instance]). For this operation, you can specify that the resource type is an Amazon Web Services account by specifying [AWS::::Account].\n"]}
[@@ocaml.doc "\n"]
type nonrec compliance_by_config_rule =
  {
  compliance: compliance option
    [@ocaml.doc "Indicates whether the Config rule is compliant.\n"];
  config_rule_name: string option
    [@ocaml.doc "The name of the Config rule.\n"]}[@@ocaml.doc
                                                    "Indicates whether an Config rule is compliant. A rule is compliant if all of the resources that the rule evaluated comply with it. A rule is noncompliant if any of these resources do not comply.\n"]
type nonrec describe_compliance_by_config_rule_response =
  {
  next_token: string option
    [@ocaml.doc
      "The string that you use in a subsequent request to get the next page of results in a paginated response.\n"];
  compliance_by_config_rules: compliance_by_config_rule list option
    [@ocaml.doc
      "Indicates whether each of the specified Config rules is compliant.\n"]}
[@@ocaml.doc "\n"]
type nonrec describe_compliance_by_config_rule_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  compliance_types: compliance_type list option
    [@ocaml.doc "Filters the results by compliance.\n"];
  config_rule_names: string list option
    [@ocaml.doc
      "Specify one or more Config rule names to filter the results by rule.\n"]}
[@@ocaml.doc "\n"]
type nonrec describe_aggregation_authorizations_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  aggregation_authorizations: aggregation_authorization list option
    [@ocaml.doc
      "Returns a list of authorizations granted to various aggregator accounts and regions.\n"]}
[@@ocaml.doc ""]
type nonrec describe_aggregation_authorizations_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of AggregationAuthorizations returned on each page. The default is maximum. If you specify 0, Config uses the default.\n"]}
[@@ocaml.doc ""]
type nonrec aggregate_conformance_pack_compliance =
  {
  total_rule_count: int option
    [@ocaml.doc
      "Total number of compliant rules, noncompliant rules, and the rules that do not have any applicable resources to evaluate upon resulting in insufficient data.\n"];
  non_compliant_rule_count: int option
    [@ocaml.doc "The number of noncompliant Config Rules.\n"];
  compliant_rule_count: int option
    [@ocaml.doc "The number of compliant Config Rules.\n"];
  compliance_type: conformance_pack_compliance_type option
    [@ocaml.doc "The compliance status of the conformance pack.\n"]}[@@ocaml.doc
                                                                    "Provides the number of compliant and noncompliant rules within a conformance pack. Also provides the compliance status of the conformance pack and the total rule count which includes compliant rules, noncompliant rules, and rules that cannot be evaluated due to insufficient data.\n\n A conformance pack is compliant if all of the rules in a conformance packs are compliant. It is noncompliant if any of the rules are not compliant. The compliance status of a conformance pack is INSUFFICIENT_DATA only if all rules within a conformance pack cannot be evaluated due to insufficient data. If some of the rules in a conformance pack are compliant but the compliance status of other rules in that same conformance pack is INSUFFICIENT_DATA, the conformance pack shows compliant.\n "]
type nonrec aggregate_compliance_by_conformance_pack =
  {
  aws_region: string option
    [@ocaml.doc
      "The source Amazon Web Services Region from where the data is aggregated.\n"];
  account_id: string option
    [@ocaml.doc
      "The 12-digit Amazon Web Services account ID of the source account.\n"];
  compliance: aggregate_conformance_pack_compliance option
    [@ocaml.doc "The compliance status of the conformance pack.\n"];
  conformance_pack_name: string option
    [@ocaml.doc "The name of the conformance pack.\n"]}[@@ocaml.doc
                                                         "Provides aggregate compliance of the conformance pack. Indicates whether a conformance pack is compliant based on the name of the conformance pack, account ID, and region.\n\n A conformance pack is compliant if all of the rules in a conformance packs are compliant. It is noncompliant if any of the rules are not compliant. The compliance status of a conformance pack is INSUFFICIENT_DATA only if all rules within a conformance pack cannot be evaluated due to insufficient data. If some of the rules in a conformance pack are compliant but the compliance status of other rules in that same conformance pack is INSUFFICIENT_DATA, the conformance pack shows compliant.\n "]
type nonrec describe_aggregate_compliance_by_conformance_packs_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  aggregate_compliance_by_conformance_packs:
    aggregate_compliance_by_conformance_pack list option
    [@ocaml.doc
      "Returns the [AggregateComplianceByConformancePack] object.\n"]}
[@@ocaml.doc ""]
type nonrec aggregate_conformance_pack_compliance_filters =
  {
  aws_region: string option
    [@ocaml.doc
      "The source Amazon Web Services Region from where the data is aggregated.\n"];
  account_id: string option
    [@ocaml.doc
      "The 12-digit Amazon Web Services account ID of the source account.\n"];
  compliance_type: conformance_pack_compliance_type option
    [@ocaml.doc "The compliance status of the conformance pack.\n"];
  conformance_pack_name: string option
    [@ocaml.doc "The name of the conformance pack.\n"]}[@@ocaml.doc
                                                         "Filters the conformance packs based on an account ID, region, compliance type, and the name of the conformance pack.\n"]
type nonrec describe_aggregate_compliance_by_conformance_packs_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of conformance packs compliance details returned on each page. The default is maximum. If you specify 0, Config uses the default. \n"];
  filters: aggregate_conformance_pack_compliance_filters option
    [@ocaml.doc
      "Filters the result by [AggregateConformancePackComplianceFilters] object.\n"];
  configuration_aggregator_name: string
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec aggregate_compliance_by_config_rule =
  {
  aws_region: string option
    [@ocaml.doc "The source region from where the data is aggregated.\n"];
  account_id: string option
    [@ocaml.doc "The 12-digit account ID of the source account.\n"];
  compliance: compliance option
    [@ocaml.doc
      "Indicates whether an Amazon Web Services resource or Config rule is compliant and provides the number of contributors that affect the compliance.\n"];
  config_rule_name: string option
    [@ocaml.doc "The name of the Config rule.\n"]}[@@ocaml.doc
                                                    "Indicates whether an Config rule is compliant based on account ID, region, compliance, and rule name.\n\n A rule is compliant if all of the resources that the rule evaluated comply with it. It is noncompliant if any of these resources do not comply.\n "]
type nonrec describe_aggregate_compliance_by_config_rules_response =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  aggregate_compliance_by_config_rules:
    aggregate_compliance_by_config_rule list option
    [@ocaml.doc
      "Returns a list of AggregateComplianceByConfigRule object.\n"]}
[@@ocaml.doc ""]
type nonrec config_rule_compliance_filters =
  {
  aws_region: string option
    [@ocaml.doc "The source region where the data is aggregated. \n"];
  account_id: string option
    [@ocaml.doc "The 12-digit account ID of the source account. \n"];
  compliance_type: compliance_type option
    [@ocaml.doc
      "The rule compliance status.\n\n For the [ConfigRuleComplianceFilters] data type, Config supports only [COMPLIANT] and [NON_COMPLIANT]. Config does not support the [NOT_APPLICABLE] and the [INSUFFICIENT_DATA] values.\n "];
  config_rule_name: string option
    [@ocaml.doc "The name of the Config rule.\n"]}[@@ocaml.doc
                                                    "Filters the compliance results based on account ID, region, compliance type, and rule name.\n"]
type nonrec describe_aggregate_compliance_by_config_rules_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of evaluation results returned on each page. The default is maximum. If you specify 0, Config uses the default.\n"];
  filters: config_rule_compliance_filters option
    [@ocaml.doc
      "Filters the results by ConfigRuleComplianceFilters object. \n"];
  configuration_aggregator_name: string
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec deliver_config_snapshot_response =
  {
  config_snapshot_id: string option
    [@ocaml.doc "The ID of the snapshot that is being created.\n"]}[@@ocaml.doc
                                                                    "The output for the [DeliverConfigSnapshot] action, in JSON format.\n"]
type nonrec deliver_config_snapshot_request =
  {
  delivery_channel_name: string
    [@ocaml.doc
      "The name of the delivery channel through which the snapshot is delivered.\n"]}
[@@ocaml.doc "The input for the [DeliverConfigSnapshot] action.\n"]
type nonrec delete_stored_query_request =
  {
  query_name: string
    [@ocaml.doc "The name of the query that you want to delete.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_service_linked_configuration_recorder_response =
  {
  name: string
    [@ocaml.doc "The name of the specified configuration recorder.\n"];
  arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the specified configuration recorder.\n"]}
[@@ocaml.doc ""]
type nonrec delete_service_linked_configuration_recorder_request =
  {
  service_principal: string
    [@ocaml.doc
      "The service principal of the Amazon Web Services service for the service-linked configuration recorder that you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_retention_configuration_request =
  {
  retention_configuration_name: string
    [@ocaml.doc "The name of the retention configuration to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_resource_config_request =
  {
  resource_id: string [@ocaml.doc "Unique identifier of the resource.\n"];
  resource_type: string [@ocaml.doc "The type of the resource.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec no_such_remediation_exception_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You tried to delete a remediation exception that does not exist.\n"]
type nonrec failed_delete_remediation_exceptions_batch =
  {
  failed_items: remediation_exception_resource_key list option
    [@ocaml.doc
      "Returns remediation exception resource key object of the failed items.\n"];
  failure_message: string option
    [@ocaml.doc
      "Returns a failure message for delete remediation exception. For example, Config creates an exception due to an internal error.\n"]}
[@@ocaml.doc
  "List of each of the failed delete remediation exceptions with specific reasons.\n"]
type nonrec delete_remediation_exceptions_response =
  {
  failed_batches: failed_delete_remediation_exceptions_batch list option
    [@ocaml.doc
      "Returns a list of failed delete remediation exceptions batch objects. Each object in the batch consists of a list of failed items and failure messages.\n"]}
[@@ocaml.doc ""]
type nonrec delete_remediation_exceptions_request =
  {
  resource_keys: remediation_exception_resource_key list
    [@ocaml.doc
      "An exception list of resource exception keys to be processed with the current request. Config adds exception for each resource key. For example, Config adds 3 exceptions for 3 resource keys. \n"];
  config_rule_name: string
    [@ocaml.doc
      "The name of the Config rule for which you want to delete remediation exception configuration.\n"]}
[@@ocaml.doc ""]
type nonrec remediation_in_progress_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "Remediation action is in progress. You can either cancel execution in Amazon Web Services Systems Manager or wait and try again later. \n"]
type nonrec delete_remediation_configuration_request =
  {
  resource_type: string option [@ocaml.doc "The type of a resource.\n"];
  config_rule_name: string
    [@ocaml.doc
      "The name of the Config rule for which you want to delete remediation configuration.\n"]}
[@@ocaml.doc ""]
type nonrec delete_pending_aggregation_request_request =
  {
  requester_aws_region: string
    [@ocaml.doc "The region requesting to aggregate data.\n"];
  requester_account_id: string
    [@ocaml.doc
      "The 12-digit account ID of the account requesting to aggregate data.\n"]}
[@@ocaml.doc ""]
type nonrec delete_organization_conformance_pack_request =
  {
  organization_conformance_pack_name: string
    [@ocaml.doc
      "The name of organization conformance pack that you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_organization_config_rule_request =
  {
  organization_config_rule_name: string
    [@ocaml.doc
      "The name of organization Config rule that you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_evaluation_results_request =
  {
  config_rule_name: string
    [@ocaml.doc
      "The name of the Config rule for which you want to delete the evaluation results.\n"]}
[@@ocaml.doc "\n"]
type nonrec last_delivery_channel_delete_failed_exception =
  {
  message: string option [@ocaml.doc "Error executing the command\n"]}
[@@ocaml.doc
  "You cannot delete the delivery channel you specified because the customer managed configuration recorder is running.\n"]
type nonrec delete_delivery_channel_request =
  {
  delivery_channel_name: string
    [@ocaml.doc
      "The name of the delivery channel that you want to delete.\n"]}
[@@ocaml.doc
  "The input for the [DeleteDeliveryChannel] action. The action accepts the following data, in JSON format. \n"]
type nonrec delete_conformance_pack_request =
  {
  conformance_pack_name: string
    [@ocaml.doc "Name of the conformance pack you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_configuration_recorder_request =
  {
  configuration_recorder_name: string
    [@ocaml.doc
      "The name of the customer managed configuration recorder that you want to delete. You can retrieve the name of your configuration recorders by using the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DescribeConfigurationRecorders.html}DescribeConfigurationRecorders} operation.\n"]}
[@@ocaml.doc
  "The request object for the [DeleteConfigurationRecorder] operation.\n"]
type nonrec delete_configuration_aggregator_request =
  {
  configuration_aggregator_name: string
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec delete_config_rule_request =
  {
  config_rule_name: string
    [@ocaml.doc "The name of the Config rule that you want to delete.\n"]}
[@@ocaml.doc "\n"]
type nonrec delete_aggregation_authorization_request =
  {
  authorized_aws_region: string
    [@ocaml.doc "The region authorized to collect aggregated data.\n"];
  authorized_account_id: string
    [@ocaml.doc
      "The 12-digit account ID of the account authorized to aggregate data.\n"]}
[@@ocaml.doc ""]
type nonrec base_configuration_item =
  {
  configuration_item_delivery_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when configuration changes for the resource were delivered.\n\n  This field is optional and is not guaranteed to be present in a configuration item (CI). If you are using daily recording, this field will be populated. However, if you are using continuous recording, this field will be omitted since the delivery time is instantaneous as the CI is available right away. For more information on daily recording and continuous recording, see {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html#select-resources-recording-frequency}Recording Frequency} in the {i Config Developer Guide}.\n  \n   "];
  recording_frequency: recording_frequency option
    [@ocaml.doc
      "The recording frequency that Config uses to record configuration changes for the resource.\n"];
  supplementary_configuration: supplementary_configuration option
    [@ocaml.doc
      "Configuration attributes that Config returns for certain resource types to supplement the information returned for the configuration parameter.\n"];
  configuration: string option
    [@ocaml.doc "The description of the resource configuration.\n"];
  resource_creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time stamp when the resource was created.\n"];
  availability_zone: string option
    [@ocaml.doc "The Availability Zone associated with the resource.\n"];
  aws_region: string option
    [@ocaml.doc "The region where the resource resides.\n"];
  resource_name: string option
    [@ocaml.doc "The custom name of the resource, if available.\n"];
  resource_id: string option
    [@ocaml.doc "The ID of the resource (for example., sg-xxxxxx).\n"];
  resource_type: resource_type option
    [@ocaml.doc "The type of Amazon Web Services resource.\n"];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"];
  configuration_state_id: string option
    [@ocaml.doc
      "An identifier that indicates the ordering of the configuration items of a resource.\n"];
  configuration_item_status: configuration_item_status option
    [@ocaml.doc
      "The configuration item status. Valid values include:\n\n {ul\n       {-  OK \226\128\147 The resource configuration has been updated.\n           \n            }\n       {-  ResourceDiscovered \226\128\147 The resource was newly discovered.\n           \n            }\n       {-  ResourceNotRecorded \226\128\147 The resource was discovered, but its configuration was not recorded since the recorder doesn't record resources of this type.\n           \n            }\n       {-  ResourceDeleted \226\128\147 The resource was deleted\n           \n            }\n       {-  ResourceDeletedNotRecorded \226\128\147 The resource was deleted, but its configuration was not recorded since the recorder doesn't record resources of this type.\n           \n            }\n       }\n  "];
  configuration_item_capture_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the recording of configuration changes was initiated for the resource.\n"];
  account_id: string option
    [@ocaml.doc
      "The 12-digit Amazon Web Services account ID associated with the resource.\n"];
  version: string option
    [@ocaml.doc "The version number of the resource configuration.\n"]}
[@@ocaml.doc "The detailed configurations of a specified resource.\n"]
type nonrec batch_get_resource_config_response =
  {
  unprocessed_resource_keys: resource_key list option
    [@ocaml.doc
      "A list of resource keys that were not processed with the current response. The unprocessesResourceKeys value is in the same form as ResourceKeys, so the value can be directly provided to a subsequent BatchGetResourceConfig operation. If there are no unprocessed resource keys, the response contains an empty unprocessedResourceKeys list. \n"];
  base_configuration_items: base_configuration_item list option
    [@ocaml.doc
      "A list that contains the current configuration of one or more resources.\n"]}
[@@ocaml.doc ""]
type nonrec batch_get_resource_config_request =
  {
  resource_keys: resource_key list
    [@ocaml.doc
      "A list of resource keys to be processed with the current request. Each element in the list consists of the resource type and resource ID.\n"]}
[@@ocaml.doc ""]
type nonrec batch_get_aggregate_resource_config_response =
  {
  unprocessed_resource_identifiers: aggregate_resource_identifier list option
    [@ocaml.doc
      "A list of resource identifiers that were not processed with current scope. The list is empty if all the resources are processed.\n"];
  base_configuration_items: base_configuration_item list option
    [@ocaml.doc
      "A list that contains the current configuration of one or more resources.\n"]}
[@@ocaml.doc ""]
type nonrec batch_get_aggregate_resource_config_request =
  {
  resource_identifiers: aggregate_resource_identifier list
    [@ocaml.doc "A list of aggregate ResourceIdentifiers objects. \n"];
  configuration_aggregator_name: string
    [@ocaml.doc "The name of the configuration aggregator.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec associate_resource_types_response =
  {
  configuration_recorder: configuration_recorder [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
type nonrec associate_resource_types_request =
  {
  resource_types: resource_type list
    [@ocaml.doc
      "The list of resource types you want to add to the recording group of the specified configuration recorder.\n"];
  configuration_recorder_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the specified configuration recorder.\n"]}
[@@ocaml.doc ""]