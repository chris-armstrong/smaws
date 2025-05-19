open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec validation_exception = {
  message: string option }[@@ocaml.doc
                            "The requested action is not valid.\n\n For PutStoredQuery, you will see this exception if there are missing required fields or if the input value fails the validation, or if you are trying to create more than 300 queries.\n \n  For GetStoredQuery, ListStoredQuery, and DeleteStoredQuery you will see this exception if there are missing required fields or if the input value fails the validation.\n  "]
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "You have specified a resource that does not exist.\n"]
type nonrec resource_type =
  | SSMDocument 
  | Route53ResolverFirewallRuleGroup 
  | RedshiftEndpointAccess 
  | RDSOptionGroup 
  | QuickSightTheme 
  | QuickSightTemplate 
  | QuickSightDataSource 
  | M2Environment 
  | KMSAlias 
  | ImageBuilderImageRecipe 
  | GroundStationDataflowEndpointGroup 
  | GrafanaWorkspace 
  | EC2NetworkInsightsAnalysis 
  | EC2NetworkInsightsAccessScope 
  | CognitoUserPoolGroup 
  | CognitoUserPoolClient 
  | CognitoUserPool 
  | AppStreamFleet 
  | ResourceExplorer2Index 
  | NetworkManagerConnectPeer 
  | LambdaCodeSigningConfig 
  | KafkaConnectConnector 
  | IoTTwinMakerSyncJob 
  | IoTCACertificate 
  | IAMInstanceProfile 
  | ECSCapacityProvider 
  | EC2TransitGatewayMulticastDomain 
  | EC2TransitGatewayConnect 
  | EC2IPAMPool 
  | EC2CarrierGateway 
  | ConnectQuickConnect 
  | ConnectInstance 
  | AppMeshMesh 
  | AppMeshGatewayRoute 
  | ACMPCACertificateAuthorityActivation 
  | BatchSchedulingPolicy 
  | Route53ResolverResolverQueryLoggingConfig 
  | CodeGuruProfilerProfilingGroup 
  | APSRuleGroupsNamespace 
  | MediaConnectFlowSource 
  | TransferCertificate 
  | ServiceDiscoveryInstance 
  | Route53ResolverResolverQueryLoggingConfigAssociation 
  | InspectorV2Filter 
  | IoTProvisioningTemplate 
  | IoTWirelessFuotaTask 
  | IoTJobTemplate 
  | AppStreamStack 
  | MSKBatchScramSecret 
  | SageMakerFeatureGroup 
  | CodeBuildReportGroup 
  | IoTTwinMakerComponentType 
  | PersonalizeDatasetGroup 
  | IoTWirelessMulticastGroup 
  | NetworkManagerLinkAssociation 
  | NetworkManagerCustomerGatewayAssociation 
  | S3AccessPoint 
  | PinpointEmailChannel 
  | LogsDestination 
  | KinesisVideoStream 
  | KendraIndex 
  | EC2ClientVpnEndpoint 
  | EC2CapacityReservation 
  | DMSEndpoint 
  | CustomerProfilesObjectType 
  | AppRunnerService 
  | AppMeshVirtualRouter 
  | AppMeshVirtualGateway 
  | AppConfigHostedConfigurationVersion 
  | ACMPCACertificateAuthority 
  | ResilienceHubApp 
  | PinpointEventStream 
  | PinpointEmailTemplate 
  | PersonalizeSolution 
  | PersonalizeSchema 
  | PersonalizeDataset 
  | MSKConfiguration 
  | MediaTailorPlaybackConfiguration 
  | MediaConnectFlowVpcInterface 
  | MediaConnectFlowEntitlement 
  | GroundStationMissionProfile 
  | GreengrassV2ComponentVersion 
  | ForecastDatasetGroup 
  | EvidentlyLaunch 
  | EC2IPAMScope 
  | AthenaPreparedStatement 
  | AppMeshRoute 
  | AppIntegrationsEventIntegration 
  | AmplifyBranch 
  | KinesisFirehoseDeliveryStream 
  | TransferConnector 
  | TransferAgreement 
  | SageMakerDomain 
  | PinpointInAppTemplate 
  | PinpointCampaign 
  | IAMServerCertificate 
  | IAMSAMLProvider 
  | ForecastDataset 
  | EvidentlyProject 
  | EC2SpotFleet 
  | EC2PrefixList 
  | CodeArtifactRepository 
  | AppStreamApplication 
  | AppRunnerVpcConnector 
  | AppMeshVirtualService 
  | AppMeshVirtualNode 
  | AmplifyApp 
  | SignerSigningProfile 
  | CassandraKeyspace 
  | ECSTaskSet 
  | SageMakerImage 
  | SageMakerAppImageConfig 
  | Route53ResolverFirewallRuleGroupAssociation 
  | RedshiftScheduledAction 
  | PinpointApp 
  | PanoramaPackage 
  | NetworkManagerSite 
  | NetworkManagerLink 
  | NetworkManagerGlobalNetwork 
  | NetworkManagerDevice 
  | IoTWirelessServiceProfile 
  | IoTFleetMetric 
  | ImageBuilderImagePipeline 
  | GroundStationConfig 
  | ECRPullThroughCacheRule 
  | EC2SubnetRouteTableAssociation 
  | EC2EC2Fleet 
  | DeviceFarmProject 
  | DeviceFarmInstanceProfile 
  | CloudWatchMetricStream 
  | AuditManagerAssessment 
  | AppFlowFlow 
  | AppConfigDeploymentStrategy 
  | ConnectPhoneNumber 
  | AutoScalingWarmPool 
  | CustomerProfilesDomain 
  | NetworkManagerTransitGatewayRegistration 
  | IoTTwinMakerScene 
  | EC2IPAM 
  | EC2TrafficMirrorFilter 
  | EC2NetworkInsightsPath 
  | EC2DHCPOptions 
  | EventsRule 
  | PinpointApplicationSettings 
  | PinpointSegment 
  | HealthLakeFHIRDatastore 
  | RoboMakerRobotApplication 
  | RoboMakerSimulationApplication 
  | Route53RecoveryReadinessResourceSet 
  | Route53RecoveryControlRoutingControl 
  | Route53RecoveryControlControlPanel 
  | Route53RecoveryControlSafetyRule 
  | Route53RecoveryControlCluster 
  | LookoutVisionProject 
  | AppStreamDirectoryConfig 
  | KinesisVideoSignalingChannel 
  | MediaPackagePackagingConfiguration 
  | EventSchemasSchema 
  | EventsConnection 
  | IoTScheduledAudit 
  | S3StorageLens 
  | EC2TrafficMirrorTarget 
  | IoTAccountAuditConfiguration 
  | LookoutMetricsAlert 
  | LexBotAlias 
  | IoTSiteWiseGateway 
  | EC2TrafficMirrorSession 
  | RoboMakerRobotApplicationVersion 
  | Route53ResolverFirewallDomainList 
  | IoTCustomMetric 
  | CodeGuruReviewerRepositoryAssociation 
  | LexBot 
  | BudgetsBudgetsAction 
  | DeviceFarmTestGridProject 
  | S3MultiRegionAccessPoint 
  | RDSGlobalCluster 
  | KinesisAnalyticsV2Application 
  | IVSPlaybackKeyPair 
  | IVSRecordingConfiguration 
  | IVSChannel 
  | IoTSiteWiseAssetModel 
  | IoTSiteWisePortal 
  | IoTSiteWiseProject 
  | IoTSiteWiseDashboard 
  | IoTAnalyticsChannel 
  | IoTAnalyticsPipeline 
  | IoTAnalyticsDataset 
  | IoTTwinMakerEntity 
  | IoTTwinMakerWorkspace 
  | IoTMitigationAction 
  | IoTPolicy 
  | GlueMLTransform 
  | EKSAddon 
  | EKSIdentityProviderConfig 
  | TransferWorkflow 
  | ResilienceHubResiliencyPolicy 
  | Route53RecoveryReadinessRecoveryGroup 
  | MediaPackagePackagingGroup 
  | LightsailStaticIp 
  | LightsailBucket 
  | IoTAnalyticsDatastore 
  | IoTDimension 
  | IoTRoleAlias 
  | IoTSecurityProfile 
  | IoTAuthorizer 
  | FraudDetectorOutcome 
  | FraudDetectorVariable 
  | FraudDetectorEntityType 
  | FraudDetectorLabel 
  | EventSchemasDiscoverer 
  | EventSchemasRegistryPolicy 
  | EventSchemasRegistry 
  | Cloud9EnvironmentEC2 
  | AppConfigConfigurationProfile 
  | AppConfigEnvironment 
  | AmazonMQBroker 
  | SESTemplate 
  | GuardDutyFilter 
  | SESReceiptFilter 
  | DataSyncLocationFSxWindows 
  | FISExperimentTemplate 
  | LightsailDisk 
  | EventsApiDestination 
  | EventsArchive 
  | SESReceiptRuleSet 
  | EventsEndpoint 
  | RUMAppMonitor 
  | LightsailCertificate 
  | BackupReportPlan 
  | ECRRegistryPolicy 
  | Route53RecoveryReadinessReadinessCheck 
  | Route53RecoveryReadinessCell 
  | GlueClassifier 
  | DataSyncLocationHDFS 
  | DataSyncLocationObjectStorage 
  | ImageBuilderInfrastructureConfiguration 
  | ImageBuilderDistributionConfiguration 
  | ImageBuilderContainerRecipe 
  | EventsEventBus 
  | ServiceDiscoveryHttpNamespace 
  | IoTEventsAlarmModel 
  | IoTEventsDetectorModel 
  | IoTEventsInput 
  | Route53HostedZone 
  | SESConfigurationSet 
  | SESContactList 
  | ServiceDiscoveryPublicDnsNamespace 
  | ServiceDiscoveryService 
  | SageMakerNotebookInstanceLifecycleConfig 
  | SageMakerWorkteam 
  | GuardDutyIPSet 
  | GuardDutyThreatIntelSet 
  | GlueJob 
  | EKSFargateProfile 
  | NetworkInsightsAccessScopeAnalysis 
  | DataSyncLocationNFS 
  | DataSyncTask 
  | DataSyncLocationEFS 
  | DataSyncLocationS3 
  | DataSyncLocationFSxLustre 
  | DataSyncLocationSMB 
  | AppSyncGraphQLApi 
  | AppConfigApplication 
  | DMSCertificate 
  | TransitGatewayRouteTable 
  | TransitGatewayAttachment 
  | GlobalAcceleratorListener 
  | GlobalAcceleratorEndpointGroup 
  | GlobalAcceleratorAccelerator 
  | DetectiveGraph 
  | AthenaDataCatalog 
  | AthenaWorkGroup 
  | AccessAnalyzerAnalyzer 
  | BatchComputeEnvironment 
  | BatchJobQueue 
  | StepFunctionsStateMachine 
  | ListenerV2 
  | SageMakerModel 
  | WorkSpacesConnectionAlias 
  | WorkSpacesWorkspace 
  | StepFunctionsActivity 
  | MSKCluster 
  | DMSEventSubscription 
  | DMSReplicationSubnetGroup 
  | Route53ResolverResolverRuleAssociation 
  | Route53ResolverResolverRule 
  | Route53ResolverResolverEndpoint 
  | SageMakerCodeRepository 
  | EMRSecurityConfiguration 
  | GuardDutyDetector 
  | ECRPublicRepository 
  | LaunchTemplate 
  | CodeDeployDeploymentGroup 
  | CodeDeployDeploymentConfig 
  | CodeDeployApplication 
  | KinesisStreamConsumer 
  | KinesisStream 
  | TransitGateway 
  | OpenSearchDomain 
  | EKSCluster 
  | EFSFileSystem 
  | EFSAccessPoint 
  | ECSTaskDefinition 
  | ECSService 
  | ECSCluster 
  | ECRRepository 
  | BackupRecoveryPoint 
  | BackupVault 
  | BackupSelection 
  | BackupPlan 
  | FileData 
  | Topic 
  | Secret 
  | QLDBLedger 
  | Key 
  | Queue 
  | Portfolio 
  | CloudFormationProduct 
  | CloudFormationProvisionedProduct 
  | Pipeline 
  | Api 
  | StageV2 
  | RestApi 
  | Stage 
  | ResourceCompliance 
  | ConformancePackCompliance 
  | RegionalProtection 
  | Protection 
  | PatchCompliance 
  | AssociationCompliance 
  | EncryptionConfig 
  | ManagedRuleSetV2 
  | RegexPatternSetV2 
  | IPSetV2 
  | RuleGroupV2 
  | WebACLV2 
  | Environment 
  | ApplicationVersion 
  | Application 
  | NetworkFirewallRuleGroup 
  | NetworkFirewallFirewallPolicy 
  | NetworkFirewallFirewall 
  | Function 
  | StreamingDistribution 
  | Distribution 
  | RegionalWebACL 
  | RegionalRuleGroup 
  | RegionalRule 
  | RegionalRateBasedRule 
  | WebACL 
  | RuleGroup 
  | Rule 
  | RateBasedRule 
  | Project 
  | Table 
  | ScheduledAction 
  | ScalingPolicy 
  | LaunchConfiguration 
  | AutoScalingGroup 
  | LoadBalancer 
  | Stack 
  | Alarm 
  | ManagedInstanceInventory 
  | RedshiftEventSubscription 
  | ClusterSubnetGroup 
  | ClusterSecurityGroup 
  | ClusterParameterGroup 
  | ClusterSnapshot 
  | Cluster 
  | AccountPublicAccessBlock 
  | Bucket 
  | EventSubscription 
  | DBClusterSnapshot 
  | DBCluster 
  | DBSnapshot 
  | DBSecurityGroup 
  | DBSubnetGroup 
  | DBInstance 
  | Certificate 
  | LoadBalancerV2 
  | User 
  | Role 
  | Policy 
  | Group 
  | Domain 
  | VPCPeeringConnection 
  | FlowLog 
  | VPCEndpointService 
  | VPCEndpoint 
  | EgressOnlyInternetGateway 
  | NatGateway 
  | RegisteredHAInstance 
  | VPNGateway 
  | VPNConnection 
  | VPC 
  | Volume 
  | Trail 
  | Subnet 
  | SecurityGroup 
  | RouteTable 
  | NetworkInterface 
  | NetworkAcl 
  | InternetGateway 
  | Instance 
  | Host 
  | EIP 
  | CustomerGateway [@@ocaml.doc ""]
type nonrec aggregate_resource_identifier =
  {
  resource_name: string option ;
  resource_type: resource_type ;
  resource_id: string ;
  source_region: string ;
  source_account_id: string }[@@ocaml.doc
                               "The details that identify a resource that is collected by Config aggregator, including the resource type, ID, (if available) the custom resource name, the source account, and source region.\n"]
type nonrec too_many_tags_exception = {
  message: string option }[@@ocaml.doc
                            "You have reached the limit of the number of tags you can use. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.\n"]
type nonrec time_window =
  {
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                              "Filters evaluation results based on start and end times.\n"]
type nonrec template_ssm_document_details =
  {
  document_version: string option ;
  document_name: string }[@@ocaml.doc
                           "This API allows you to create a conformance pack template with an Amazon Web Services Systems Manager document (SSM document). To deploy a conformance pack using an SSM document, first create an SSM document with conformance pack content, and then provide the [DocumentName] in the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutConformancePack.html}PutConformancePack API}. You can also provide the [DocumentVersion].\n\n The [TemplateSSMDocumentDetails] object contains the name of the SSM document and the version of the SSM document.\n "]
type nonrec tag = {
  value: string option ;
  key: string option }[@@ocaml.doc
                        "The tags for the resource. The metadata that you apply to a resource to help you categorize and organize them. Each tag consists of a key and an optional value, both of which you define. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.\n"]
type nonrec tags = (string * string) list[@@ocaml.doc ""]
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec supplementary_configuration = (string * string) list[@@ocaml.doc
                                                                  ""]
type nonrec stored_query_metadata =
  {
  description: string option ;
  query_name: string ;
  query_arn: string ;
  query_id: string }[@@ocaml.doc "Returns details of a specific query. \n"]
type nonrec stored_query =
  {
  expression: string option ;
  description: string option ;
  query_name: string ;
  query_arn: string option ;
  query_id: string option }[@@ocaml.doc
                             "Provides the details of a stored query.\n"]
type nonrec stop_configuration_recorder_request =
  {
  configuration_recorder_name: string }[@@ocaml.doc
                                         "The input for the [StopConfigurationRecorder] action.\n"]
type nonrec no_such_configuration_recorder_exception =
  {
  message: string option }[@@ocaml.doc
                            "You have specified a configuration recorder that does not exist.\n"]
type nonrec member_account_rule_status =
  | UPDATE_FAILED 
  | UPDATE_IN_PROGRESS 
  | UPDATE_SUCCESSFUL 
  | DELETE_IN_PROGRESS 
  | DELETE_FAILED 
  | DELETE_SUCCESSFUL 
  | CREATE_FAILED 
  | CREATE_IN_PROGRESS 
  | CREATE_SUCCESSFUL [@@ocaml.doc ""]
type nonrec status_detail_filters =
  {
  member_account_rule_status: member_account_rule_status option ;
  account_id: string option }[@@ocaml.doc
                               "Status filter object to filter results based on specific member account ID or status type for an organization Config rule. \n"]
type nonrec static_value = {
  values: string list }[@@ocaml.doc "The static value of the resource.\n"]
type nonrec start_resource_evaluation_response =
  {
  resource_evaluation_id: string option }[@@ocaml.doc ""]
type nonrec resource_configuration_schema_type =
  | CFN_RESOURCE_SCHEMA [@@ocaml.doc ""]
type nonrec resource_details =
  {
  resource_configuration_schema_type:
    resource_configuration_schema_type option ;
  resource_configuration: string ;
  resource_type: string ;
  resource_id: string }[@@ocaml.doc
                         "Returns information about the resource being evaluated.\n"]
type nonrec evaluation_context =
  {
  evaluation_context_identifier: string option }[@@ocaml.doc
                                                  "Use EvaluationContext to group independently initiated proactive resource evaluations. For example, CFN Stack. If you want to check just a resource definition, you do not need to provide evaluation context.\n"]
type nonrec evaluation_mode =
  | PROACTIVE 
  | DETECTIVE [@@ocaml.doc ""]
type nonrec start_resource_evaluation_request =
  {
  client_token: string option ;
  evaluation_timeout: int option ;
  evaluation_mode: evaluation_mode ;
  evaluation_context: evaluation_context option ;
  resource_details: resource_details }[@@ocaml.doc ""]
type nonrec invalid_parameter_value_exception = {
  message: string option }[@@ocaml.doc
                            "One or more of the specified parameters are not valid. Verify that your parameters are valid and try again.\n"]
type nonrec idempotent_parameter_mismatch = {
  message: string option }[@@ocaml.doc
                            "Using the same client token with one or more different parameters. Specify a new client token with the parameter changes and try again.\n"]
type nonrec resource_key =
  {
  resource_id: string ;
  resource_type: resource_type }[@@ocaml.doc
                                  "The details that identify a resource within Config, including the resource type and resource ID.\n"]
type nonrec start_remediation_execution_response =
  {
  failed_items: resource_key list option ;
  failure_message: string option }[@@ocaml.doc ""]
type nonrec start_remediation_execution_request =
  {
  resource_keys: resource_key list ;
  config_rule_name: string }[@@ocaml.doc ""]
type nonrec no_such_remediation_configuration_exception =
  {
  message: string option }[@@ocaml.doc
                            "You specified an Config rule without a remediation configuration.\n"]
type nonrec insufficient_permissions_exception = {
  message: string option }[@@ocaml.doc
                            "Indicates one of the following errors:\n\n {ul\n       {-  For PutConfigRule, the rule cannot be created because the IAM role assigned to Config lacks permissions to perform the config:Put* action.\n           \n            }\n       {-  For PutConfigRule, the Lambda function cannot be invoked. Check the function ARN, and check the function's permissions.\n           \n            }\n       {-  For PutOrganizationConfigRule, organization Config rule cannot be created because you do not have permissions to call IAM [GetRole] action or create a service-linked role.\n           \n            }\n       {-  For PutConformancePack and PutOrganizationConformancePack, a conformance pack cannot be created because you do not have the following permissions: \n           \n            {ul\n                  {-  You do not have permission to call IAM [GetRole] action or create a service-linked role.\n                      \n                       }\n                  {-  You do not have permission to read Amazon S3 bucket or call SSM:GetDocument.\n                      \n                       }\n                  \n        }\n         }\n       }\n  "]
type nonrec start_configuration_recorder_request =
  {
  configuration_recorder_name: string }[@@ocaml.doc
                                         "The input for the [StartConfigurationRecorder] action.\n"]
type nonrec no_available_delivery_channel_exception =
  {
  message: string option }[@@ocaml.doc
                            "There is no delivery channel available to record configurations.\n"]
type nonrec start_config_rules_evaluation_response = unit
type nonrec start_config_rules_evaluation_request =
  {
  config_rule_names: string list option }[@@ocaml.doc "\n"]
type nonrec resource_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "You see this exception in the following cases: \n\n {ul\n       {-  For DeleteConfigRule, Config is deleting this rule. Try your request again later.\n           \n            }\n       {-  For DeleteConfigRule, the rule is deleting your evaluation results. Try your request again later.\n           \n            }\n       {-  For DeleteConfigRule, a remediation action is associated with the rule and Config cannot delete this rule. Delete the remediation action associated with the rule before deleting the rule and try your request again later.\n           \n            }\n       {-  For PutConfigOrganizationRule, organization Config rule deletion is in progress. Try your request again later.\n           \n            }\n       {-  For DeleteOrganizationConfigRule, organization Config rule creation is in progress. Try your request again later.\n           \n            }\n       {-  For PutConformancePack and PutOrganizationConformancePack, a conformance pack creation, update, and deletion is in progress. Try your request again later.\n           \n            }\n       {-  For DeleteConformancePack, a conformance pack creation, update, and deletion is in progress. Try your request again later.\n           \n            }\n       }\n  "]
type nonrec no_such_config_rule_exception = {
  message: string option }[@@ocaml.doc
                            "The Config rule in the request is not valid. Verify that the rule is an Config Process Check rule, that the rule name is correct, and that valid Amazon Resouce Names (ARNs) are used before trying again.\n"]
type nonrec limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "For [StartConfigRulesEvaluation] API, this exception is thrown if an evaluation is in progress or if you call the [StartConfigRulesEvaluation] API more than once per minute.\n\n For [PutConfigurationAggregator] API, this exception is thrown if the number of accounts and aggregators exceeds the limit.\n "]
type nonrec invalid_next_token_exception = {
  message: string option }[@@ocaml.doc
                            "The specified next token is not valid. Specify the [nextToken] string that was returned in the previous response to get the next page of results.\n"]
type nonrec invalid_limit_exception = {
  message: string option }[@@ocaml.doc
                            "The specified limit is outside the allowable range.\n"]
type nonrec invalid_expression_exception = {
  message: string option }[@@ocaml.doc
                            "The syntax of the query is incorrect.\n"]
type nonrec field_info = {
  name: string option }[@@ocaml.doc
                         "Details about the fields such as name of the field.\n"]
type nonrec query_info = {
  select_fields: field_info list option }[@@ocaml.doc
                                           "Details about the query.\n"]
type nonrec select_resource_config_response =
  {
  next_token: string option ;
  query_info: query_info option ;
  results: string list option }[@@ocaml.doc ""]
type nonrec select_resource_config_request =
  {
  next_token: string option ;
  limit: int option ;
  expression: string }[@@ocaml.doc ""]
type nonrec no_such_configuration_aggregator_exception =
  {
  message: string option }[@@ocaml.doc
                            "You have specified a configuration aggregator that does not exist.\n"]
type nonrec select_aggregate_resource_config_response =
  {
  next_token: string option ;
  query_info: query_info option ;
  results: string list option }[@@ocaml.doc ""]
type nonrec select_aggregate_resource_config_request =
  {
  next_token: string option ;
  max_results: int option ;
  limit: int option ;
  configuration_aggregator_name: string ;
  expression: string }[@@ocaml.doc ""]
type nonrec resource_concurrent_modification_exception =
  {
  message: string option }[@@ocaml.doc
                            "Two users are trying to modify the same query at the same time. Wait for a moment and try again.\n"]
type nonrec put_stored_query_response = {
  query_arn: string option }[@@ocaml.doc ""]
type nonrec put_stored_query_request =
  {
  tags: tag list option ;
  stored_query: stored_query }[@@ocaml.doc ""]
type nonrec max_number_of_retention_configurations_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "Failed to add the retention configuration because a retention configuration with that name already exists.\n"]
type nonrec retention_configuration =
  {
  retention_period_in_days: int ;
  name: string }[@@ocaml.doc
                  "An object with the name of the retention configuration and the retention period in days. The object stores the configuration for data retention in Config.\n"]
type nonrec put_retention_configuration_response =
  {
  retention_configuration: retention_configuration option }[@@ocaml.doc ""]
type nonrec put_retention_configuration_request =
  {
  retention_period_in_days: int }[@@ocaml.doc ""]
type nonrec no_running_configuration_recorder_exception =
  {
  message: string option }[@@ocaml.doc
                            "There is no configuration recorder running.\n"]
type nonrec max_active_resources_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "You have reached the limit of active custom resource types in your account. There is a limit of 100,000. Delete unused resources using {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DeleteResourceConfig.html}DeleteResourceConfig} .\n"]
type nonrec put_resource_config_request =
  {
  tags: tags option ;
  configuration: string ;
  resource_name: string option ;
  resource_id: string ;
  schema_version_id: string ;
  resource_type: string }[@@ocaml.doc ""]
type nonrec remediation_exception =
  {
  expiration_time: CoreTypes.Timestamp.t option ;
  message: string option ;
  resource_id: string ;
  resource_type: string ;
  config_rule_name: string }[@@ocaml.doc
                              "An object that represents the details about the remediation exception. The details include the rule name, an explanation of an exception, the time when the exception will be deleted, the resource ID, and resource type. \n"]
type nonrec failed_remediation_exception_batch =
  {
  failed_items: remediation_exception list option ;
  failure_message: string option }[@@ocaml.doc
                                    "List of each of the failed remediation exceptions with specific reasons.\n"]
type nonrec put_remediation_exceptions_response =
  {
  failed_batches: failed_remediation_exception_batch list option }[@@ocaml.doc
                                                                    ""]
type nonrec remediation_exception_resource_key =
  {
  resource_id: string option ;
  resource_type: string option }[@@ocaml.doc
                                  "The details that identify a resource within Config, including the resource type and resource ID. \n"]
type nonrec put_remediation_exceptions_request =
  {
  expiration_time: CoreTypes.Timestamp.t option ;
  message: string option ;
  resource_keys: remediation_exception_resource_key list ;
  config_rule_name: string }[@@ocaml.doc ""]
type nonrec remediation_target_type =
  | SSM_DOCUMENT [@@ocaml.doc ""]
type nonrec resource_value_type =
  | RESOURCE_ID [@@ocaml.doc ""]
type nonrec resource_value = {
  value: resource_value_type }[@@ocaml.doc
                                "The dynamic value of the resource.\n"]
type nonrec remediation_parameter_value =
  {
  static_value: static_value option ;
  resource_value: resource_value option }[@@ocaml.doc
                                           "The value is either a dynamic (resource) value or a static value. You must select either a dynamic value or a static value.\n"]
type nonrec remediation_parameters =
  (string * remediation_parameter_value) list[@@ocaml.doc ""]
type nonrec ssm_controls =
  {
  error_percentage: int option ;
  concurrent_execution_rate_percentage: int option }[@@ocaml.doc
                                                      "Amazon Web Services Systems Manager (SSM) specific remediation controls.\n"]
type nonrec execution_controls = {
  ssm_controls: ssm_controls option }[@@ocaml.doc
                                       "The controls that Config uses for executing remediations.\n"]
type nonrec remediation_configuration =
  {
  created_by_service: string option ;
  arn: string option ;
  retry_attempt_seconds: int option ;
  maximum_automatic_attempts: int option ;
  execution_controls: execution_controls option ;
  automatic: bool option ;
  resource_type: string option ;
  parameters: remediation_parameters option ;
  target_version: string option ;
  target_id: string ;
  target_type: remediation_target_type ;
  config_rule_name: string }[@@ocaml.doc
                              "An object that represents the details about the remediation configuration that includes the remediation action, parameters, and data to execute the action.\n"]
type nonrec failed_remediation_batch =
  {
  failed_items: remediation_configuration list option ;
  failure_message: string option }[@@ocaml.doc
                                    "List of each of the failed remediations with specific reasons.\n"]
type nonrec put_remediation_configurations_response =
  {
  failed_batches: failed_remediation_batch list option }[@@ocaml.doc ""]
type nonrec put_remediation_configurations_request =
  {
  remediation_configurations: remediation_configuration list }[@@ocaml.doc
                                                                ""]
type nonrec organization_conformance_pack_template_validation_exception =
  {
  message: string option }[@@ocaml.doc
                            "You have specified a template that is not valid or supported.\n"]
type nonrec organization_all_features_not_enabled_exception =
  {
  message: string option }[@@ocaml.doc
                            "Config resource cannot be created because your organization does not have all features enabled.\n"]
type nonrec organization_access_denied_exception = {
  message: string option }[@@ocaml.doc
                            "For [PutConfigurationAggregator] API, you can see this exception for the following reasons:\n\n {ul\n       {-  No permission to call [EnableAWSServiceAccess] API\n           \n            }\n       {-  The configuration aggregator cannot be updated because your Amazon Web Services Organization management account or the delegated administrator role changed. Delete this aggregator and create a new one with the current Amazon Web Services Organization.\n           \n            }\n       {-  The configuration aggregator is associated with a previous Amazon Web Services Organization and Config cannot aggregate data with current Amazon Web Services Organization. Delete this aggregator and create a new one with the current Amazon Web Services Organization.\n           \n            }\n       {-  You are not a registered delegated administrator for Config with permissions to call [ListDelegatedAdministrators] API. Ensure that the management account registers delagated administrator for Config service principle name before the delegated administrator creates an aggregator.\n           \n            }\n       }\n   For all [OrganizationConfigRule] and [OrganizationConformancePack] APIs, Config throws an exception if APIs are called from member accounts. All APIs must be called from organization management account.\n   "]
type nonrec no_available_organization_exception = {
  message: string option }[@@ocaml.doc
                            "Organization is no longer available.\n"]
type nonrec max_number_of_organization_conformance_packs_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "You have reached the limit of the number of organization conformance packs you can create in an account. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.\n"]
type nonrec put_organization_conformance_pack_response =
  {
  organization_conformance_pack_arn: string option }[@@ocaml.doc ""]
type nonrec conformance_pack_input_parameter =
  {
  parameter_value: string ;
  parameter_name: string }[@@ocaml.doc
                            "Input parameters in the form of key-value pairs for the conformance pack, both of which you define. Keys can have a maximum character length of 255 characters, and values can have a maximum length of 4096 characters.\n"]
type nonrec put_organization_conformance_pack_request =
  {
  excluded_accounts: string list option ;
  conformance_pack_input_parameters:
    conformance_pack_input_parameter list option ;
  delivery_s3_key_prefix: string option ;
  delivery_s3_bucket: string option ;
  template_body: string option ;
  template_s3_uri: string option ;
  organization_conformance_pack_name: string }[@@ocaml.doc ""]
type nonrec max_number_of_organization_config_rules_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "You have reached the limit of the number of organization Config rules you can create. For more information, see see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.\n"]
type nonrec put_organization_config_rule_response =
  {
  organization_config_rule_arn: string option }[@@ocaml.doc ""]
type nonrec maximum_execution_frequency =
  | TwentyFour_Hours 
  | Twelve_Hours 
  | Six_Hours 
  | Three_Hours 
  | One_Hour [@@ocaml.doc ""]
type nonrec organization_managed_rule_metadata =
  {
  tag_value_scope: string option ;
  tag_key_scope: string option ;
  resource_id_scope: string option ;
  resource_types_scope: string list option ;
  maximum_execution_frequency: maximum_execution_frequency option ;
  input_parameters: string option ;
  rule_identifier: string ;
  description: string option }[@@ocaml.doc
                                "An object that specifies organization managed rule metadata such as resource type and ID of Amazon Web Services resource along with the rule identifier. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.\n"]
type nonrec organization_config_rule_trigger_type =
  | SCHEDULED_NOTIFICATION 
  | OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION 
  | CONFIGURATION_ITEM_CHANGE_NOTIFICATION [@@ocaml.doc ""]
type nonrec organization_custom_rule_metadata =
  {
  tag_value_scope: string option ;
  tag_key_scope: string option ;
  resource_id_scope: string option ;
  resource_types_scope: string list option ;
  maximum_execution_frequency: maximum_execution_frequency option ;
  input_parameters: string option ;
  organization_config_rule_trigger_types:
    organization_config_rule_trigger_type list ;
  lambda_function_arn: string ;
  description: string option }[@@ocaml.doc
                                "An object that specifies organization custom rule metadata such as resource type, resource ID of Amazon Web Services resource, Lambda function ARN, and organization trigger types that trigger Config to evaluate your Amazon Web Services resources against a rule. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.\n"]
type nonrec organization_config_rule_trigger_type_no_s_n =
  | OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION 
  | CONFIGURATION_ITEM_CHANGE_NOTIFICATION [@@ocaml.doc ""]
type nonrec organization_custom_policy_rule_metadata =
  {
  debug_log_delivery_accounts: string list option ;
  policy_text: string ;
  policy_runtime: string ;
  tag_value_scope: string option ;
  tag_key_scope: string option ;
  resource_id_scope: string option ;
  resource_types_scope: string list option ;
  maximum_execution_frequency: maximum_execution_frequency option ;
  input_parameters: string option ;
  organization_config_rule_trigger_types:
    organization_config_rule_trigger_type_no_s_n list option ;
  description: string option }[@@ocaml.doc
                                "An object that specifies metadata for your organization's Config Custom Policy rule. The metadata includes the runtime system in use, which accounts have debug logging enabled, and other custom rule metadata, such as resource type, resource ID of Amazon Web Services resource, and organization trigger types that initiate Config to evaluate Amazon Web Services resources against a rule.\n"]
type nonrec put_organization_config_rule_request =
  {
  organization_custom_policy_rule_metadata:
    organization_custom_policy_rule_metadata option ;
  excluded_accounts: string list option ;
  organization_custom_rule_metadata: organization_custom_rule_metadata option ;
  organization_managed_rule_metadata:
    organization_managed_rule_metadata option ;
  organization_config_rule_name: string }[@@ocaml.doc ""]
type nonrec put_external_evaluation_response = unit
type nonrec compliance_type =
  | Insufficient_Data 
  | Not_Applicable 
  | Non_Compliant 
  | Compliant [@@ocaml.doc ""]
type nonrec external_evaluation =
  {
  ordering_timestamp: CoreTypes.Timestamp.t ;
  annotation: string option ;
  compliance_type: compliance_type ;
  compliance_resource_id: string ;
  compliance_resource_type: string }[@@ocaml.doc
                                      "Identifies an Amazon Web Services resource and indicates whether it complies with the Config rule that it was evaluated against.\n"]
type nonrec put_external_evaluation_request =
  {
  external_evaluation: external_evaluation ;
  config_rule_name: string }[@@ocaml.doc ""]
type nonrec invalid_result_token_exception = {
  message: string option }[@@ocaml.doc
                            "The specified [ResultToken] is not valid.\n"]
type nonrec evaluation =
  {
  ordering_timestamp: CoreTypes.Timestamp.t ;
  annotation: string option ;
  compliance_type: compliance_type ;
  compliance_resource_id: string ;
  compliance_resource_type: string }[@@ocaml.doc
                                      "Identifies an Amazon Web Services resource and indicates whether it complies with the Config rule that it was evaluated against.\n"]
type nonrec put_evaluations_response =
  {
  failed_evaluations: evaluation list option }[@@ocaml.doc "\n"]
type nonrec put_evaluations_request =
  {
  test_mode: bool option ;
  result_token: string ;
  evaluations: evaluation list option }[@@ocaml.doc "\n"]
type nonrec no_such_bucket_exception = {
  message: string option }[@@ocaml.doc
                            "The specified Amazon S3 bucket does not exist.\n"]
type nonrec no_available_configuration_recorder_exception =
  {
  message: string option }[@@ocaml.doc
                            "There are no configuration recorders available to provide the role needed to describe your resources. Create a configuration recorder.\n"]
type nonrec max_number_of_delivery_channels_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "You have reached the limit of the number of delivery channels you can create.\n"]
type nonrec invalid_sns_topic_arn_exception = {
  message: string option }[@@ocaml.doc
                            "The specified Amazon SNS topic does not exist.\n"]
type nonrec invalid_s3_kms_key_arn_exception = {
  message: string option }[@@ocaml.doc
                            "The specified Amazon KMS Key ARN is not valid.\n"]
type nonrec invalid_s3_key_prefix_exception = {
  message: string option }[@@ocaml.doc
                            "The specified Amazon S3 key prefix is not valid.\n"]
type nonrec invalid_delivery_channel_name_exception =
  {
  message: string option }[@@ocaml.doc
                            "The specified delivery channel name is not valid.\n"]
type nonrec insufficient_delivery_policy_exception =
  {
  message: string option }[@@ocaml.doc
                            "Your Amazon S3 bucket policy does not permit Config to write to it.\n"]
type nonrec config_snapshot_delivery_properties =
  {
  delivery_frequency: maximum_execution_frequency option }[@@ocaml.doc
                                                            "Provides options for how often Config delivers configuration snapshots to the Amazon S3 bucket in your delivery channel.\n\n The frequency for a rule that triggers evaluations for your resources when Config delivers the configuration snapshot is set by one of two values, depending on which is less frequent:\n \n  {ul\n        {-  The value for the [deliveryFrequency] parameter within the delivery channel configuration, which sets how often Config delivers configuration snapshots. This value also sets how often Config invokes evaluations for Config rules.\n            \n             }\n        {-  The value for the [MaximumExecutionFrequency] parameter, which sets the maximum frequency with which Config invokes evaluations for the rule. For more information, see [ConfigRule].\n            \n             }\n        }\n   If the [deliveryFrequency] value is less frequent than the [MaximumExecutionFrequency] value for a rule, Config invokes the rule only as often as the [deliveryFrequency] value.\n   \n    {ol\n          {-  For example, you want your rule to run evaluations when Config delivers the configuration snapshot.\n              \n               }\n          {-  You specify the [MaximumExecutionFrequency] value for [Six_Hours]. \n              \n               }\n          {-  You then specify the delivery channel [deliveryFrequency] value for [TwentyFour_Hours].\n              \n               }\n          {-  Because the value for [deliveryFrequency] is less frequent than [MaximumExecutionFrequency], Config invokes evaluations for the rule every 24 hours. \n              \n               }\n          }\n   You should set the [MaximumExecutionFrequency] value to be at least as frequent as the [deliveryFrequency] value. You can view the [deliveryFrequency] value by using the [DescribeDeliveryChannnels] action.\n   \n    To update the [deliveryFrequency] with which Config delivers your configuration snapshots, use the [PutDeliveryChannel] action.\n    "]
type nonrec delivery_channel =
  {
  config_snapshot_delivery_properties:
    config_snapshot_delivery_properties option ;
  sns_topic_ar_n: string option ;
  s3_kms_key_arn: string option ;
  s3_key_prefix: string option ;
  s3_bucket_name: string option ;
  name: string option }[@@ocaml.doc
                         "The channel through which Config delivers notifications and updated configuration states.\n"]
type nonrec put_delivery_channel_request =
  {
  delivery_channel: delivery_channel }[@@ocaml.doc
                                        "The input for the [PutDeliveryChannel] action.\n"]
type nonrec max_number_of_conformance_packs_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "You have reached the limit of the number of conformance packs you can create in an account. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.\n"]
type nonrec conformance_pack_template_validation_exception =
  {
  message: string option }[@@ocaml.doc
                            "You have specified a template that is not valid or supported.\n"]
type nonrec put_conformance_pack_response =
  {
  conformance_pack_arn: string option }[@@ocaml.doc ""]
type nonrec put_conformance_pack_request =
  {
  template_ssm_document_details: template_ssm_document_details option ;
  conformance_pack_input_parameters:
    conformance_pack_input_parameter list option ;
  delivery_s3_key_prefix: string option ;
  delivery_s3_bucket: string option ;
  template_body: string option ;
  template_s3_uri: string option ;
  conformance_pack_name: string }[@@ocaml.doc ""]
type nonrec max_number_of_configuration_recorders_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "You have reached the limit of the number of configuration recorders you can create.\n"]
type nonrec invalid_role_exception = {
  message: string option }[@@ocaml.doc
                            "You have provided a null or empty Amazon Resource Name (ARN) for the IAM role assumed by Config and used by the configuration recorder.\n"]
type nonrec invalid_recording_group_exception = {
  message: string option }[@@ocaml.doc
                            "Indicates one of the following errors:\n\n {ul\n       {-  You have provided a combination of parameter values that is not valid. For example:\n           \n            {ul\n                  {-  Setting the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true], but providing a non-empty list for the [resourceTypes]field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}.\n                      \n                       }\n                  {-  Setting the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true], but also setting the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [EXCLUSION_BY_RESOURCE_TYPES].\n                      \n                       }\n                  \n        }\n         }\n       {-  Every parameter is either null, false, or empty.\n           \n            }\n       {-  You have reached the limit of the number of resource types you can provide for the recording group.\n           \n            }\n       {-  You have provided resource types or a recording strategy that are not valid.\n           \n            }\n       }\n  "]
type nonrec invalid_configuration_recorder_name_exception =
  {
  message: string option }[@@ocaml.doc
                            "You have provided a name for the configuration recorder that is not valid.\n"]
type nonrec exclusion_by_resource_types =
  {
  resource_types: resource_type list option }[@@ocaml.doc
                                               "Specifies whether the configuration recorder excludes certain resource types from being recorded. Use the [resourceTypes] field to enter a comma-separated list of resource types you want to exclude from recording.\n\n By default, when Config adds support for a new resource type in the Region where you set up the configuration recorder, including global resource types, Config starts recording resources of that type automatically.\n \n    {b How to use the exclusion recording strategy } \n   \n    To use this option, you must set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [EXCLUSION_BY_RESOURCE_TYPES].\n    \n     Config will then record configuration changes for all supported resource types, except the resource types that you specify to exclude from being recorded.\n     \n       {b Global resource types and the exclusion recording strategy } \n      \n       Unless specifically listed as exclusions, [AWS::RDS::GlobalCluster] will be recorded automatically in all supported Config Regions were the configuration recorder is enabled.\n       \n        IAM users, groups, roles, and customer managed policies will be recorded in the Region where you set up the configuration recorder if that is a Region where Config was available before February 2022. You cannot be record the global IAM resouce types in Regions supported by Config after February 2022. This list where you cannot record the global IAM resource types includes the following Regions:\n        \n         {ul\n               {-  Asia Pacific (Hyderabad)\n                   \n                    }\n               {-  Asia Pacific (Melbourne)\n                   \n                    }\n               {-  Canada West (Calgary)\n                   \n                    }\n               {-  Europe (Spain)\n                   \n                    }\n               {-  Europe (Zurich)\n                   \n                    }\n               {-  Israel (Tel Aviv)\n                   \n                    }\n               {-  Middle East (UAE)\n                   \n                    }\n               }\n   "]
type nonrec recording_strategy_type =
  | EXCLUSION_BY_RESOURCE_TYPES 
  | INCLUSION_BY_RESOURCE_TYPES 
  | ALL_SUPPORTED_RESOURCE_TYPES [@@ocaml.doc ""]
type nonrec recording_strategy = {
  use_only: recording_strategy_type option }[@@ocaml.doc
                                              "Specifies the recording strategy of the configuration recorder.\n"]
type nonrec recording_group =
  {
  recording_strategy: recording_strategy option ;
  exclusion_by_resource_types: exclusion_by_resource_types option ;
  resource_types: resource_type list option ;
  include_global_resource_types: bool option ;
  all_supported: bool option }[@@ocaml.doc
                                "Specifies which resource types Config records for configuration changes. By default, Config records configuration changes for all current and future supported resource types in the Amazon Web Services Region where you have enabled Config, excluding the global IAM resource types: IAM users, groups, roles, and customer managed policies.\n\n In the recording group, you specify whether you want to record all supported current and future supported resource types or to include or exclude specific resources types. For a list of supported resource types, see {{:https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources}Supported Resource Types} in the {i Config developer guide}.\n \n  If you don't want Config to record all current and future supported resource types (excluding the global IAM resource types), use one of the following recording strategies:\n  \n   {ol\n         {-   {b Record all current and future resource types with exclusions} ([EXCLUSION_BY_RESOURCE_TYPES]), or\n             \n              }\n         {-   {b Record specific resource types} ([INCLUSION_BY_RESOURCE_TYPES]).\n             \n              }\n         }\n   If you use the recording strategy to {b Record all current and future resource types} ([ALL_SUPPORTED_RESOURCE_TYPES]), you can use the flag [includeGlobalResourceTypes] to include the global IAM resource types in your recording.\n   \n      {b Aurora global clusters are recorded in all enabled Regions} \n     \n      The [AWS::RDS::GlobalCluster] resource type will be recorded in all supported Config Regions where the configuration recorder is enabled.\n      \n       If you do not want to record [AWS::RDS::GlobalCluster] in all enabled Regions, use the [EXCLUSION_BY_RESOURCE_TYPES] or [INCLUSION_BY_RESOURCE_TYPES] recording strategy.\n       \n        "]
type nonrec recording_frequency =
  | DAILY 
  | CONTINUOUS [@@ocaml.doc ""]
type nonrec recording_mode_override =
  {
  recording_frequency: recording_frequency ;
  resource_types: resource_type list ;
  description: string option }[@@ocaml.doc
                                "An object for you to specify your overrides for the recording mode.\n"]
type nonrec recording_mode =
  {
  recording_mode_overrides: recording_mode_override list option ;
  recording_frequency: recording_frequency }[@@ocaml.doc
                                              "Specifies the default recording frequency that Config uses to record configuration changes. Config supports {i Continuous recording} and {i Daily recording}.\n\n {ul\n       {-  Continuous recording allows you to record configuration changes continuously whenever a change occurs.\n           \n            }\n       {-  Daily recording allows you to receive a configuration item (CI) representing the most recent state of your resources over the last 24-hour period, only if it\226\128\153s different from the previous CI recorded. \n           \n            }\n       }\n    Firewall Manager depends on continuous recording to monitor your resources. If you are using Firewall Manager, it is recommended that you set the recording frequency to Continuous.\n    \n      You can also override the recording frequency for specific resource types.\n      "]
type nonrec configuration_recorder =
  {
  recording_mode: recording_mode option ;
  recording_group: recording_group option ;
  role_ar_n: string option ;
  name: string option }[@@ocaml.doc
                         "Records configuration changes to your specified resource types. For more information about the configuration recorder, see {{:https://docs.aws.amazon.com/config/latest/developerguide/stop-start-recorder.html} {b Managing the Configuration Recorder} } in the {i Config Developer Guide}.\n"]
type nonrec put_configuration_recorder_request =
  {
  configuration_recorder: configuration_recorder }[@@ocaml.doc
                                                    "The input for the [PutConfigurationRecorder] action.\n"]
type nonrec account_aggregation_source =
  {
  aws_regions: string list option ;
  all_aws_regions: bool option ;
  account_ids: string list }[@@ocaml.doc
                              "A collection of accounts and regions.\n"]
type nonrec organization_aggregation_source =
  {
  all_aws_regions: bool option ;
  aws_regions: string list option ;
  role_arn: string }[@@ocaml.doc
                      "This object contains regions to set up the aggregator and an IAM role to retrieve organization details.\n"]
type nonrec configuration_aggregator =
  {
  created_by: string option ;
  last_updated_time: CoreTypes.Timestamp.t option ;
  creation_time: CoreTypes.Timestamp.t option ;
  organization_aggregation_source: organization_aggregation_source option ;
  account_aggregation_sources: account_aggregation_source list option ;
  configuration_aggregator_arn: string option ;
  configuration_aggregator_name: string option }[@@ocaml.doc
                                                  "The details about the configuration aggregator, including information about source accounts, regions, and metadata of the aggregator. \n"]
type nonrec put_configuration_aggregator_response =
  {
  configuration_aggregator: configuration_aggregator option }[@@ocaml.doc ""]
type nonrec put_configuration_aggregator_request =
  {
  tags: tag list option ;
  organization_aggregation_source: organization_aggregation_source option ;
  account_aggregation_sources: account_aggregation_source list option ;
  configuration_aggregator_name: string }[@@ocaml.doc ""]
type nonrec max_number_of_config_rules_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "Failed to add the Config rule because the account already contains the maximum number of 1000 rules. Consider deleting any deactivated rules before you add new rules.\n"]
type nonrec scope =
  {
  compliance_resource_id: string option ;
  tag_value: string option ;
  tag_key: string option ;
  compliance_resource_types: string list option }[@@ocaml.doc
                                                   "Defines which resources trigger an evaluation for an Config rule. The scope can include one or more resource types, a combination of a tag key and value, or a combination of one resource type and one resource ID. Specify a scope to constrain which resources trigger an evaluation for a rule. Otherwise, evaluations for the rule are triggered when any resource in your recording group changes in configuration.\n"]
type nonrec owner =
  | Custom_Policy 
  | Aws 
  | Custom_Lambda [@@ocaml.doc ""]
type nonrec event_source =
  | Aws_Config [@@ocaml.doc ""]
type nonrec message_type =
  | OversizedConfigurationItemChangeNotification 
  | ScheduledNotification 
  | ConfigurationSnapshotDeliveryCompleted 
  | ConfigurationItemChangeNotification [@@ocaml.doc ""]
type nonrec source_detail =
  {
  maximum_execution_frequency: maximum_execution_frequency option ;
  message_type: message_type option ;
  event_source: event_source option }[@@ocaml.doc
                                       "Provides the source and the message types that trigger Config to evaluate your Amazon Web Services resources against a rule. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic. You can specify the parameter values for [SourceDetail] only for custom rules. \n"]
type nonrec custom_policy_details =
  {
  enable_debug_log_delivery: bool option ;
  policy_text: string ;
  policy_runtime: string }[@@ocaml.doc
                            "Provides the runtime system, policy definition, and whether debug logging enabled. You can specify the following CustomPolicyDetails parameter values only for Config Custom Policy rules.\n"]
type nonrec source =
  {
  custom_policy_details: custom_policy_details option ;
  source_details: source_detail list option ;
  source_identifier: string option ;
  owner: owner }[@@ocaml.doc
                  "Provides the CustomPolicyDetails, the rule owner ([Amazon Web Services] for managed rules, [CUSTOM_POLICY] for Custom Policy rules, and [CUSTOM_LAMBDA] for Custom Lambda rules), the rule identifier, and the events that cause the evaluation of your Amazon Web Services resources.\n"]
type nonrec config_rule_state =
  | EVALUATING 
  | DELETING_RESULTS 
  | DELETING 
  | ACTIVE [@@ocaml.doc ""]
type nonrec evaluation_mode_configuration = {
  mode: evaluation_mode option }[@@ocaml.doc
                                  "The configuration object for Config rule evaluation mode. The supported valid values are Detective or Proactive.\n"]
type nonrec config_rule =
  {
  evaluation_modes: evaluation_mode_configuration list option ;
  created_by: string option ;
  config_rule_state: config_rule_state option ;
  maximum_execution_frequency: maximum_execution_frequency option ;
  input_parameters: string option ;
  source: source ;
  scope: scope option ;
  description: string option ;
  config_rule_id: string option ;
  config_rule_arn: string option ;
  config_rule_name: string option }[@@ocaml.doc
                                     "Config rules evaluate the configuration settings of your Amazon Web Services resources. A rule can run when Config detects a configuration change to an Amazon Web Services resource or at a periodic frequency that you choose (for example, every 24 hours). There are two types of rules: {i Config Managed Rules} and {i Config Custom Rules}.\n\n Config Managed Rules are predefined, customizable rules created by Config. For a list of managed rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html}List of Config Managed Rules}.\n \n  Config Custom Rules are rules that you create from scratch. There are two ways to create Config custom rules: with Lambda functions ({{:https://docs.aws.amazon.com/config/latest/developerguide/gettingstarted-concepts.html#gettingstarted-concepts-function} Lambda Developer Guide}) and with Guard ({{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}), a policy-as-code language. Config custom rules created with Lambda are called {i Config Custom Lambda Rules} and Config custom rules created with Guard are called {i Config Custom Policy Rules}.\n  \n   For more information about developing and using Config rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html}Evaluating Resource with Config Rules} in the {i Config Developer Guide}.\n   \n     You can use the Amazon Web Services CLI and Amazon Web Services SDKs if you want to create a rule that triggers evaluations for your resources when Config delivers the configuration snapshot. For more information, see [ConfigSnapshotDeliveryProperties].\n     \n      "]
type nonrec put_config_rule_request =
  {
  tags: tag list option ;
  config_rule: config_rule }[@@ocaml.doc ""]
type nonrec aggregation_authorization =
  {
  creation_time: CoreTypes.Timestamp.t option ;
  authorized_aws_region: string option ;
  authorized_account_id: string option ;
  aggregation_authorization_arn: string option }[@@ocaml.doc
                                                  "An object that represents the authorizations granted to aggregator accounts and regions.\n"]
type nonrec put_aggregation_authorization_response =
  {
  aggregation_authorization: aggregation_authorization option }[@@ocaml.doc
                                                                 ""]
type nonrec put_aggregation_authorization_request =
  {
  tags: tag list option ;
  authorized_aws_region: string ;
  authorized_account_id: string }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response =
  {
  next_token: string option ;
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  next_token: string option ;
  limit: int option ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec list_stored_queries_response =
  {
  next_token: string option ;
  stored_query_metadata: stored_query_metadata list option }[@@ocaml.doc ""]
type nonrec list_stored_queries_request =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec invalid_time_range_exception = {
  message: string option }[@@ocaml.doc
                            "The specified time range is not valid. The earlier time is not chronologically before the later time.\n"]
type nonrec resource_evaluation =
  {
  evaluation_start_timestamp: CoreTypes.Timestamp.t option ;
  evaluation_mode: evaluation_mode option ;
  resource_evaluation_id: string option }[@@ocaml.doc
                                           "Returns details of a resource evaluation.\n"]
type nonrec list_resource_evaluations_response =
  {
  next_token: string option ;
  resource_evaluations: resource_evaluation list option }[@@ocaml.doc ""]
type nonrec resource_evaluation_filters =
  {
  evaluation_context_identifier: string option ;
  time_window: time_window option ;
  evaluation_mode: evaluation_mode option }[@@ocaml.doc
                                             "Returns details of a resource evaluation based on the selected filter.\n"]
type nonrec list_resource_evaluations_request =
  {
  next_token: string option ;
  limit: int option ;
  filters: resource_evaluation_filters option }[@@ocaml.doc ""]
type nonrec resource_identifier =
  {
  resource_deletion_time: CoreTypes.Timestamp.t option ;
  resource_name: string option ;
  resource_id: string option ;
  resource_type: resource_type option }[@@ocaml.doc
                                         "The details that identify a resource that is discovered by Config, including the resource type, ID, and (if available) the custom resource name.\n"]
type nonrec list_discovered_resources_response =
  {
  next_token: string option ;
  resource_identifiers: resource_identifier list option }[@@ocaml.doc "\n"]
type nonrec list_discovered_resources_request =
  {
  next_token: string option ;
  include_deleted_resources: bool option ;
  limit: int option ;
  resource_name: string option ;
  resource_ids: string list option ;
  resource_type: resource_type }[@@ocaml.doc "\n"]
type nonrec conformance_pack_compliance_score =
  {
  last_updated_time: CoreTypes.Timestamp.t option ;
  conformance_pack_name: string option ;
  score: string option }[@@ocaml.doc
                          "A compliance score is the percentage of the number of compliant rule-resource combinations in a conformance pack compared to the number of total possible rule-resource combinations in the conformance pack. This metric provides you with a high-level view of the compliance state of your conformance packs. You can use it to identify, investigate, and understand the level of compliance in your conformance packs.\n"]
type nonrec list_conformance_pack_compliance_scores_response =
  {
  conformance_pack_compliance_scores: conformance_pack_compliance_score list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec conformance_pack_compliance_scores_filters =
  {
  conformance_pack_names: string list }[@@ocaml.doc
                                         "A list of filters to apply to the conformance pack compliance score result set. \n"]
type nonrec sort_order =
  | DESCENDING 
  | ASCENDING [@@ocaml.doc ""]
type nonrec sort_by =
  | SCORE [@@ocaml.doc ""]
type nonrec list_conformance_pack_compliance_scores_request =
  {
  next_token: string option ;
  limit: int option ;
  sort_by: sort_by option ;
  sort_order: sort_order option ;
  filters: conformance_pack_compliance_scores_filters option }[@@ocaml.doc
                                                                ""]
type nonrec list_aggregate_discovered_resources_response =
  {
  next_token: string option ;
  resource_identifiers: aggregate_resource_identifier list option }[@@ocaml.doc
                                                                    ""]
type nonrec resource_filters =
  {
  region: string option ;
  resource_name: string option ;
  resource_id: string option ;
  account_id: string option }[@@ocaml.doc
                               "Filters the results by resource account ID, region, resource ID, and resource name.\n"]
type nonrec list_aggregate_discovered_resources_request =
  {
  next_token: string option ;
  limit: int option ;
  filters: resource_filters option ;
  resource_type: resource_type ;
  configuration_aggregator_name: string }[@@ocaml.doc ""]
type nonrec get_stored_query_response = {
  stored_query: stored_query option }[@@ocaml.doc ""]
type nonrec get_stored_query_request = {
  query_name: string }[@@ocaml.doc ""]
type nonrec resource_evaluation_status =
  | SUCCEEDED 
  | FAILED 
  | IN_PROGRESS [@@ocaml.doc ""]
type nonrec evaluation_status =
  {
  failure_reason: string option ;
  status: resource_evaluation_status }[@@ocaml.doc
                                        "Returns status details of an evaluation.\n"]
type nonrec get_resource_evaluation_summary_response =
  {
  resource_details: resource_details option ;
  evaluation_context: evaluation_context option ;
  compliance: compliance_type option ;
  evaluation_start_timestamp: CoreTypes.Timestamp.t option ;
  evaluation_status: evaluation_status option ;
  evaluation_mode: evaluation_mode option ;
  resource_evaluation_id: string option }[@@ocaml.doc ""]
type nonrec get_resource_evaluation_summary_request =
  {
  resource_evaluation_id: string }[@@ocaml.doc ""]
type nonrec resource_not_discovered_exception = {
  message: string option }[@@ocaml.doc
                            "You have specified a resource that is either unknown or has not been discovered.\n"]
type nonrec configuration_item_status =
  | ResourceDeletedNotRecorded 
  | ResourceDeleted 
  | ResourceNotRecorded 
  | ResourceDiscovered 
  | OK [@@ocaml.doc ""]
type nonrec relationship =
  {
  relationship_name: string option ;
  resource_name: string option ;
  resource_id: string option ;
  resource_type: resource_type option }[@@ocaml.doc
                                         "The relationship of the related resource to the main resource.\n"]
type nonrec configuration_item =
  {
  configuration_item_delivery_time: CoreTypes.Timestamp.t option ;
  recording_frequency: recording_frequency option ;
  supplementary_configuration: supplementary_configuration option ;
  configuration: string option ;
  relationships: relationship list option ;
  related_events: string list option ;
  tags: tags option ;
  resource_creation_time: CoreTypes.Timestamp.t option ;
  availability_zone: string option ;
  aws_region: string option ;
  resource_name: string option ;
  resource_id: string option ;
  resource_type: resource_type option ;
  arn: string option ;
  configuration_item_md5_hash: string option ;
  configuration_state_id: string option ;
  configuration_item_status: configuration_item_status option ;
  configuration_item_capture_time: CoreTypes.Timestamp.t option ;
  account_id: string option ;
  version: string option }[@@ocaml.doc
                            "A list that contains detailed configurations of a specified resource.\n"]
type nonrec get_resource_config_history_response =
  {
  next_token: string option ;
  configuration_items: configuration_item list option }[@@ocaml.doc
                                                         "The output for the [GetResourceConfigHistory] action.\n"]
type nonrec chronological_order =
  | Forward 
  | Reverse [@@ocaml.doc ""]
type nonrec get_resource_config_history_request =
  {
  next_token: string option ;
  limit: int option ;
  chronological_order: chronological_order option ;
  earlier_time: CoreTypes.Timestamp.t option ;
  later_time: CoreTypes.Timestamp.t option ;
  resource_id: string ;
  resource_type: resource_type }[@@ocaml.doc
                                  "The input for the [GetResourceConfigHistory] action.\n"]
type nonrec no_such_organization_config_rule_exception =
  {
  message: string option }[@@ocaml.doc
                            "The Config rule in the request is not valid. Verify that the rule is an organization Config Process Check rule, that the rule name is correct, and that valid Amazon Resouce Names (ARNs) are used before trying again.\n"]
type nonrec get_organization_custom_rule_policy_response =
  {
  policy_text: string option }[@@ocaml.doc ""]
type nonrec get_organization_custom_rule_policy_request =
  {
  organization_config_rule_name: string }[@@ocaml.doc ""]
type nonrec no_such_organization_conformance_pack_exception =
  {
  message: string option }[@@ocaml.doc
                            "Config organization conformance pack that you passed in the filter does not exist.\n\n For DeleteOrganizationConformancePack, you tried to delete an organization conformance pack that does not exist.\n "]
type nonrec organization_resource_detailed_status =
  | UPDATE_FAILED 
  | UPDATE_IN_PROGRESS 
  | UPDATE_SUCCESSFUL 
  | DELETE_IN_PROGRESS 
  | DELETE_FAILED 
  | DELETE_SUCCESSFUL 
  | CREATE_FAILED 
  | CREATE_IN_PROGRESS 
  | CREATE_SUCCESSFUL [@@ocaml.doc ""]
type nonrec organization_conformance_pack_detailed_status =
  {
  last_update_time: CoreTypes.Timestamp.t option ;
  error_message: string option ;
  error_code: string option ;
  status: organization_resource_detailed_status ;
  conformance_pack_name: string ;
  account_id: string }[@@ocaml.doc
                        "Organization conformance pack creation or deletion status in each member account. This includes the name of the conformance pack, the status, error code and error message when the conformance pack creation or deletion failed. \n"]
type nonrec get_organization_conformance_pack_detailed_status_response =
  {
  next_token: string option ;
  organization_conformance_pack_detailed_statuses:
    organization_conformance_pack_detailed_status list option }[@@ocaml.doc
                                                                 ""]
type nonrec organization_resource_detailed_status_filters =
  {
  status: organization_resource_detailed_status option ;
  account_id: string option }[@@ocaml.doc
                               "Status filter object to filter results based on specific member account ID or status type for an organization conformance pack.\n"]
type nonrec get_organization_conformance_pack_detailed_status_request =
  {
  next_token: string option ;
  limit: int option ;
  filters: organization_resource_detailed_status_filters option ;
  organization_conformance_pack_name: string }[@@ocaml.doc ""]
type nonrec member_account_status =
  {
  last_update_time: CoreTypes.Timestamp.t option ;
  error_message: string option ;
  error_code: string option ;
  member_account_rule_status: member_account_rule_status ;
  config_rule_name: string ;
  account_id: string }[@@ocaml.doc
                        "Organization Config rule creation or deletion status in each member account. This includes the name of the rule, the status, error code and error message when the rule creation or deletion failed.\n"]
type nonrec get_organization_config_rule_detailed_status_response =
  {
  next_token: string option ;
  organization_config_rule_detailed_status: member_account_status list option }
[@@ocaml.doc ""]
type nonrec get_organization_config_rule_detailed_status_request =
  {
  next_token: string option ;
  limit: int option ;
  filters: status_detail_filters option ;
  organization_config_rule_name: string }[@@ocaml.doc ""]
type nonrec resource_count =
  {
  count: int option ;
  resource_type: resource_type option }[@@ocaml.doc
                                         "An object that contains the resource type and the number of resources.\n"]
type nonrec get_discovered_resource_counts_response =
  {
  next_token: string option ;
  resource_counts: resource_count list option ;
  total_discovered_resources: int option }[@@ocaml.doc ""]
type nonrec get_discovered_resource_counts_request =
  {
  next_token: string option ;
  limit: int option ;
  resource_types: string list option }[@@ocaml.doc ""]
type nonrec get_custom_rule_policy_response = {
  policy_text: string option }[@@ocaml.doc ""]
type nonrec get_custom_rule_policy_request =
  {
  config_rule_name: string option }[@@ocaml.doc ""]
type nonrec no_such_conformance_pack_exception = {
  message: string option }[@@ocaml.doc
                            "You specified one or more conformance packs that do not exist.\n"]
type nonrec conformance_pack_compliance_type =
  | INSUFFICIENT_DATA 
  | NON_COMPLIANT 
  | COMPLIANT [@@ocaml.doc ""]
type nonrec conformance_pack_compliance_summary =
  {
  conformance_pack_compliance_status: conformance_pack_compliance_type ;
  conformance_pack_name: string }[@@ocaml.doc
                                   "Summary includes the name and status of the conformance pack.\n"]
type nonrec get_conformance_pack_compliance_summary_response =
  {
  next_token: string option ;
  conformance_pack_compliance_summary_list:
    conformance_pack_compliance_summary list option }[@@ocaml.doc ""]
type nonrec get_conformance_pack_compliance_summary_request =
  {
  next_token: string option ;
  limit: int option ;
  conformance_pack_names: string list }[@@ocaml.doc ""]
type nonrec no_such_config_rule_in_conformance_pack_exception =
  {
  message: string option }[@@ocaml.doc
                            "Config rule that you passed in the filter does not exist.\n"]
type nonrec evaluation_result_qualifier =
  {
  evaluation_mode: evaluation_mode option ;
  resource_id: string option ;
  resource_type: string option ;
  config_rule_name: string option }[@@ocaml.doc
                                     "Identifies an Config rule that evaluated an Amazon Web Services resource, and provides the type and ID of the resource that the rule evaluated.\n"]
type nonrec evaluation_result_identifier =
  {
  resource_evaluation_id: string option ;
  ordering_timestamp: CoreTypes.Timestamp.t option ;
  evaluation_result_qualifier: evaluation_result_qualifier option }[@@ocaml.doc
                                                                    "Uniquely identifies an evaluation result.\n"]
type nonrec conformance_pack_evaluation_result =
  {
  annotation: string option ;
  result_recorded_time: CoreTypes.Timestamp.t ;
  config_rule_invoked_time: CoreTypes.Timestamp.t ;
  evaluation_result_identifier: evaluation_result_identifier ;
  compliance_type: conformance_pack_compliance_type }[@@ocaml.doc
                                                       "The details of a conformance pack evaluation. Provides Config rule and Amazon Web Services resource type that was evaluated, the compliance of the conformance pack, related time stamps, and supplementary information. \n"]
type nonrec get_conformance_pack_compliance_details_response =
  {
  next_token: string option ;
  conformance_pack_rule_evaluation_results:
    conformance_pack_evaluation_result list option ;
  conformance_pack_name: string }[@@ocaml.doc ""]
type nonrec conformance_pack_evaluation_filters =
  {
  resource_ids: string list option ;
  resource_type: string option ;
  compliance_type: conformance_pack_compliance_type option ;
  config_rule_names: string list option }[@@ocaml.doc
                                           "Filters a conformance pack by Config rule names, compliance types, Amazon Web Services resource types, and resource IDs.\n"]
type nonrec get_conformance_pack_compliance_details_request =
  {
  next_token: string option ;
  limit: int option ;
  filters: conformance_pack_evaluation_filters option ;
  conformance_pack_name: string }[@@ocaml.doc ""]
type nonrec compliance_contributor_count =
  {
  cap_exceeded: bool option ;
  capped_count: int option }[@@ocaml.doc
                              "The number of Amazon Web Services resources or Config rules responsible for the current compliance of the item, up to a maximum number.\n"]
type nonrec compliance_summary =
  {
  compliance_summary_timestamp: CoreTypes.Timestamp.t option ;
  non_compliant_resource_count: compliance_contributor_count option ;
  compliant_resource_count: compliance_contributor_count option }[@@ocaml.doc
                                                                   "The number of Config rules or Amazon Web Services resources that are compliant and noncompliant.\n"]
type nonrec compliance_summary_by_resource_type =
  {
  compliance_summary: compliance_summary option ;
  resource_type: string option }[@@ocaml.doc
                                  "The number of Amazon Web Services resources of a specific type that are compliant or noncompliant, up to a maximum of 100 for each.\n"]
type nonrec get_compliance_summary_by_resource_type_response =
  {
  compliance_summaries_by_resource_type:
    compliance_summary_by_resource_type list option }[@@ocaml.doc "\n"]
type nonrec get_compliance_summary_by_resource_type_request =
  {
  resource_types: string list option }[@@ocaml.doc "\n"]
type nonrec get_compliance_summary_by_config_rule_response =
  {
  compliance_summary: compliance_summary option }[@@ocaml.doc "\n"]
type nonrec evaluation_result =
  {
  result_token: string option ;
  annotation: string option ;
  config_rule_invoked_time: CoreTypes.Timestamp.t option ;
  result_recorded_time: CoreTypes.Timestamp.t option ;
  compliance_type: compliance_type option ;
  evaluation_result_identifier: evaluation_result_identifier option }
[@@ocaml.doc
  "The details of an Config evaluation. Provides the Amazon Web Services resource that was evaluated, the compliance of the resource, related time stamps, and supplementary information.\n"]
type nonrec get_compliance_details_by_resource_response =
  {
  next_token: string option ;
  evaluation_results: evaluation_result list option }[@@ocaml.doc "\n"]
type nonrec get_compliance_details_by_resource_request =
  {
  resource_evaluation_id: string option ;
  next_token: string option ;
  compliance_types: compliance_type list option ;
  resource_id: string option ;
  resource_type: string option }[@@ocaml.doc "\n"]
type nonrec get_compliance_details_by_config_rule_response =
  {
  next_token: string option ;
  evaluation_results: evaluation_result list option }[@@ocaml.doc "\n"]
type nonrec get_compliance_details_by_config_rule_request =
  {
  next_token: string option ;
  limit: int option ;
  compliance_types: compliance_type list option ;
  config_rule_name: string }[@@ocaml.doc "\n"]
type nonrec oversized_configuration_item_exception =
  {
  message: string option }[@@ocaml.doc
                            "The configuration item size is outside the allowable range.\n"]
type nonrec get_aggregate_resource_config_response =
  {
  configuration_item: configuration_item option }[@@ocaml.doc ""]
type nonrec get_aggregate_resource_config_request =
  {
  resource_identifier: aggregate_resource_identifier ;
  configuration_aggregator_name: string }[@@ocaml.doc ""]
type nonrec grouped_resource_count =
  {
  resource_count: int ;
  group_name: string }[@@ocaml.doc
                        "The count of resources that are grouped by the group name.\n"]
type nonrec get_aggregate_discovered_resource_counts_response =
  {
  next_token: string option ;
  grouped_resource_counts: grouped_resource_count list option ;
  group_by_key: string option ;
  total_discovered_resources: int }[@@ocaml.doc ""]
type nonrec resource_count_filters =
  {
  region: string option ;
  account_id: string option ;
  resource_type: resource_type option }[@@ocaml.doc
                                         "Filters the resource count based on account ID, region, and resource type.\n"]
type nonrec resource_count_group_key =
  | AWS_REGION 
  | ACCOUNT_ID 
  | RESOURCE_TYPE [@@ocaml.doc ""]
type nonrec get_aggregate_discovered_resource_counts_request =
  {
  next_token: string option ;
  limit: int option ;
  group_by_key: resource_count_group_key option ;
  filters: resource_count_filters option ;
  configuration_aggregator_name: string }[@@ocaml.doc ""]
type nonrec aggregate_conformance_pack_compliance_count =
  {
  non_compliant_conformance_pack_count: int option ;
  compliant_conformance_pack_count: int option }[@@ocaml.doc
                                                  "The number of conformance packs that are compliant and noncompliant.\n"]
type nonrec aggregate_conformance_pack_compliance_summary =
  {
  group_name: string option ;
  compliance_summary: aggregate_conformance_pack_compliance_count option }
[@@ocaml.doc
  "Provides a summary of compliance based on either account ID or region. \n"]
type nonrec get_aggregate_conformance_pack_compliance_summary_response =
  {
  next_token: string option ;
  group_by_key: string option ;
  aggregate_conformance_pack_compliance_summaries:
    aggregate_conformance_pack_compliance_summary list option }[@@ocaml.doc
                                                                 ""]
type nonrec aggregate_conformance_pack_compliance_summary_filters =
  {
  aws_region: string option ;
  account_id: string option }[@@ocaml.doc
                               "Filters the results based on account ID and region. \n"]
type nonrec aggregate_conformance_pack_compliance_summary_group_key =
  | AWS_REGION 
  | ACCOUNT_ID [@@ocaml.doc ""]
type nonrec get_aggregate_conformance_pack_compliance_summary_request =
  {
  next_token: string option ;
  limit: int option ;
  group_by_key:
    aggregate_conformance_pack_compliance_summary_group_key option ;
  filters: aggregate_conformance_pack_compliance_summary_filters option ;
  configuration_aggregator_name: string }[@@ocaml.doc ""]
type nonrec aggregate_compliance_count =
  {
  compliance_summary: compliance_summary option ;
  group_name: string option }[@@ocaml.doc
                               "Returns the number of compliant and noncompliant rules for one or more accounts and regions in an aggregator.\n"]
type nonrec get_aggregate_config_rule_compliance_summary_response =
  {
  next_token: string option ;
  aggregate_compliance_counts: aggregate_compliance_count list option ;
  group_by_key: string option }[@@ocaml.doc ""]
type nonrec config_rule_compliance_summary_filters =
  {
  aws_region: string option ;
  account_id: string option }[@@ocaml.doc
                               "Filters the results based on the account IDs and regions.\n"]
type nonrec config_rule_compliance_summary_group_key =
  | AWS_REGION 
  | ACCOUNT_ID [@@ocaml.doc ""]
type nonrec get_aggregate_config_rule_compliance_summary_request =
  {
  next_token: string option ;
  limit: int option ;
  group_by_key: config_rule_compliance_summary_group_key option ;
  filters: config_rule_compliance_summary_filters option ;
  configuration_aggregator_name: string }[@@ocaml.doc ""]
type nonrec aggregate_evaluation_result =
  {
  aws_region: string option ;
  account_id: string option ;
  annotation: string option ;
  config_rule_invoked_time: CoreTypes.Timestamp.t option ;
  result_recorded_time: CoreTypes.Timestamp.t option ;
  compliance_type: compliance_type option ;
  evaluation_result_identifier: evaluation_result_identifier option }
[@@ocaml.doc
  "The details of an Config evaluation for an account ID and region in an aggregator. Provides the Amazon Web Services resource that was evaluated, the compliance of the resource, related time stamps, and supplementary information. \n"]
type nonrec get_aggregate_compliance_details_by_config_rule_response =
  {
  next_token: string option ;
  aggregate_evaluation_results: aggregate_evaluation_result list option }
[@@ocaml.doc ""]
type nonrec get_aggregate_compliance_details_by_config_rule_request =
  {
  next_token: string option ;
  limit: int option ;
  compliance_type: compliance_type option ;
  aws_region: string ;
  account_id: string ;
  config_rule_name: string ;
  configuration_aggregator_name: string }[@@ocaml.doc ""]
type nonrec no_such_retention_configuration_exception =
  {
  message: string option }[@@ocaml.doc
                            "You have specified a retention configuration that does not exist.\n"]
type nonrec describe_retention_configurations_response =
  {
  next_token: string option ;
  retention_configurations: retention_configuration list option }[@@ocaml.doc
                                                                   ""]
type nonrec describe_retention_configurations_request =
  {
  next_token: string option ;
  retention_configuration_names: string list option }[@@ocaml.doc ""]
type nonrec remediation_execution_state =
  | FAILED 
  | SUCCEEDED 
  | IN_PROGRESS 
  | QUEUED [@@ocaml.doc ""]
type nonrec remediation_execution_step_state =
  | FAILED 
  | PENDING 
  | SUCCEEDED [@@ocaml.doc ""]
type nonrec remediation_execution_step =
  {
  stop_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  error_message: string option ;
  state: remediation_execution_step_state option ;
  name: string option }[@@ocaml.doc
                         "Name of the step from the SSM document.\n"]
type nonrec remediation_execution_status =
  {
  last_updated_time: CoreTypes.Timestamp.t option ;
  invocation_time: CoreTypes.Timestamp.t option ;
  step_details: remediation_execution_step list option ;
  state: remediation_execution_state option ;
  resource_key: resource_key option }[@@ocaml.doc
                                       "Provides details of the current status of the invoked remediation action for that resource.\n"]
type nonrec describe_remediation_execution_status_response =
  {
  next_token: string option ;
  remediation_execution_statuses: remediation_execution_status list option }
[@@ocaml.doc ""]
type nonrec describe_remediation_execution_status_request =
  {
  next_token: string option ;
  limit: int option ;
  resource_keys: resource_key list option ;
  config_rule_name: string }[@@ocaml.doc ""]
type nonrec describe_remediation_exceptions_response =
  {
  next_token: string option ;
  remediation_exceptions: remediation_exception list option }[@@ocaml.doc ""]
type nonrec describe_remediation_exceptions_request =
  {
  next_token: string option ;
  limit: int option ;
  resource_keys: remediation_exception_resource_key list option ;
  config_rule_name: string }[@@ocaml.doc ""]
type nonrec describe_remediation_configurations_response =
  {
  remediation_configurations: remediation_configuration list option }
[@@ocaml.doc ""]
type nonrec describe_remediation_configurations_request =
  {
  config_rule_names: string list }[@@ocaml.doc ""]
type nonrec pending_aggregation_request =
  {
  requester_aws_region: string option ;
  requester_account_id: string option }[@@ocaml.doc
                                         "An object that represents the account ID and region of an aggregator account that is requesting authorization but is not yet authorized.\n"]
type nonrec describe_pending_aggregation_requests_response =
  {
  next_token: string option ;
  pending_aggregation_requests: pending_aggregation_request list option }
[@@ocaml.doc ""]
type nonrec describe_pending_aggregation_requests_request =
  {
  next_token: string option ;
  limit: int option }[@@ocaml.doc ""]
type nonrec organization_resource_status =
  | UPDATE_FAILED 
  | UPDATE_IN_PROGRESS 
  | UPDATE_SUCCESSFUL 
  | DELETE_IN_PROGRESS 
  | DELETE_FAILED 
  | DELETE_SUCCESSFUL 
  | CREATE_FAILED 
  | CREATE_IN_PROGRESS 
  | CREATE_SUCCESSFUL [@@ocaml.doc ""]
type nonrec organization_conformance_pack_status =
  {
  last_update_time: CoreTypes.Timestamp.t option ;
  error_message: string option ;
  error_code: string option ;
  status: organization_resource_status ;
  organization_conformance_pack_name: string }[@@ocaml.doc
                                                "Returns the status for an organization conformance pack in an organization.\n"]
type nonrec describe_organization_conformance_pack_statuses_response =
  {
  next_token: string option ;
  organization_conformance_pack_statuses:
    organization_conformance_pack_status list option }[@@ocaml.doc ""]
type nonrec describe_organization_conformance_pack_statuses_request =
  {
  next_token: string option ;
  limit: int option ;
  organization_conformance_pack_names: string list option }[@@ocaml.doc ""]
type nonrec organization_conformance_pack =
  {
  last_update_time: CoreTypes.Timestamp.t ;
  excluded_accounts: string list option ;
  conformance_pack_input_parameters:
    conformance_pack_input_parameter list option ;
  delivery_s3_key_prefix: string option ;
  delivery_s3_bucket: string option ;
  organization_conformance_pack_arn: string ;
  organization_conformance_pack_name: string }[@@ocaml.doc
                                                "An organization conformance pack that has information about conformance packs that Config creates in member accounts. \n"]
type nonrec describe_organization_conformance_packs_response =
  {
  next_token: string option ;
  organization_conformance_packs: organization_conformance_pack list option }
[@@ocaml.doc ""]
type nonrec describe_organization_conformance_packs_request =
  {
  next_token: string option ;
  limit: int option ;
  organization_conformance_pack_names: string list option }[@@ocaml.doc ""]
type nonrec organization_rule_status =
  | UPDATE_FAILED 
  | UPDATE_IN_PROGRESS 
  | UPDATE_SUCCESSFUL 
  | DELETE_IN_PROGRESS 
  | DELETE_FAILED 
  | DELETE_SUCCESSFUL 
  | CREATE_FAILED 
  | CREATE_IN_PROGRESS 
  | CREATE_SUCCESSFUL [@@ocaml.doc ""]
type nonrec organization_config_rule_status =
  {
  last_update_time: CoreTypes.Timestamp.t option ;
  error_message: string option ;
  error_code: string option ;
  organization_rule_status: organization_rule_status ;
  organization_config_rule_name: string }[@@ocaml.doc
                                           "Returns the status for an organization Config rule in an organization.\n"]
type nonrec describe_organization_config_rule_statuses_response =
  {
  next_token: string option ;
  organization_config_rule_statuses:
    organization_config_rule_status list option }[@@ocaml.doc ""]
type nonrec describe_organization_config_rule_statuses_request =
  {
  next_token: string option ;
  limit: int option ;
  organization_config_rule_names: string list option }[@@ocaml.doc ""]
type nonrec organization_custom_policy_rule_metadata_no_policy =
  {
  debug_log_delivery_accounts: string list option ;
  policy_runtime: string option ;
  tag_value_scope: string option ;
  tag_key_scope: string option ;
  resource_id_scope: string option ;
  resource_types_scope: string list option ;
  maximum_execution_frequency: maximum_execution_frequency option ;
  input_parameters: string option ;
  organization_config_rule_trigger_types:
    organization_config_rule_trigger_type_no_s_n list option ;
  description: string option }[@@ocaml.doc
                                " metadata for your organization Config Custom Policy rule including the runtime system in use, which accounts have debug logging enabled, and other custom rule metadata such as resource type, resource ID of Amazon Web Services resource, and organization trigger types that trigger Config to evaluate Amazon Web Services resources against a rule.\n"]
type nonrec organization_config_rule =
  {
  organization_custom_policy_rule_metadata:
    organization_custom_policy_rule_metadata_no_policy option ;
  last_update_time: CoreTypes.Timestamp.t option ;
  excluded_accounts: string list option ;
  organization_custom_rule_metadata: organization_custom_rule_metadata option ;
  organization_managed_rule_metadata:
    organization_managed_rule_metadata option ;
  organization_config_rule_arn: string ;
  organization_config_rule_name: string }[@@ocaml.doc
                                           "An organization Config rule that has information about Config rules that Config creates in member accounts.\n"]
type nonrec describe_organization_config_rules_response =
  {
  next_token: string option ;
  organization_config_rules: organization_config_rule list option }[@@ocaml.doc
                                                                    ""]
type nonrec describe_organization_config_rules_request =
  {
  next_token: string option ;
  limit: int option ;
  organization_config_rule_names: string list option }[@@ocaml.doc ""]
type nonrec no_such_delivery_channel_exception = {
  message: string option }[@@ocaml.doc
                            "You have specified a delivery channel that does not exist.\n"]
type nonrec delivery_status =
  | Not_Applicable 
  | Failure 
  | Success [@@ocaml.doc ""]
type nonrec config_export_delivery_info =
  {
  next_delivery_time: CoreTypes.Timestamp.t option ;
  last_successful_time: CoreTypes.Timestamp.t option ;
  last_attempt_time: CoreTypes.Timestamp.t option ;
  last_error_message: string option ;
  last_error_code: string option ;
  last_status: delivery_status option }[@@ocaml.doc
                                         "Provides status of the delivery of the snapshot or the configuration history to the specified Amazon S3 bucket. Also provides the status of notifications about the Amazon S3 delivery to the specified Amazon SNS topic.\n"]
type nonrec config_stream_delivery_info =
  {
  last_status_change_time: CoreTypes.Timestamp.t option ;
  last_error_message: string option ;
  last_error_code: string option ;
  last_status: delivery_status option }[@@ocaml.doc
                                         "A list that contains the status of the delivery of the configuration stream notification to the Amazon SNS topic.\n"]
type nonrec delivery_channel_status =
  {
  config_stream_delivery_info: config_stream_delivery_info option ;
  config_history_delivery_info: config_export_delivery_info option ;
  config_snapshot_delivery_info: config_export_delivery_info option ;
  name: string option }[@@ocaml.doc
                         "The status of a specified delivery channel.\n\n Valid values: [Success] | [Failure] \n "]
type nonrec describe_delivery_channel_status_response =
  {
  delivery_channels_status: delivery_channel_status list option }[@@ocaml.doc
                                                                   "The output for the [DescribeDeliveryChannelStatus] action.\n"]
type nonrec describe_delivery_channel_status_request =
  {
  delivery_channel_names: string list option }[@@ocaml.doc
                                                "The input for the [DeliveryChannelStatus] action.\n"]
type nonrec describe_delivery_channels_response =
  {
  delivery_channels: delivery_channel list option }[@@ocaml.doc
                                                     "The output for the [DescribeDeliveryChannels] action.\n"]
type nonrec describe_delivery_channels_request =
  {
  delivery_channel_names: string list option }[@@ocaml.doc
                                                "The input for the [DescribeDeliveryChannels] action.\n"]
type nonrec conformance_pack_state =
  | DELETE_FAILED 
  | DELETE_IN_PROGRESS 
  | CREATE_FAILED 
  | CREATE_COMPLETE 
  | CREATE_IN_PROGRESS [@@ocaml.doc ""]
type nonrec conformance_pack_status_detail =
  {
  last_update_completed_time: CoreTypes.Timestamp.t option ;
  last_update_requested_time: CoreTypes.Timestamp.t ;
  conformance_pack_status_reason: string option ;
  stack_arn: string ;
  conformance_pack_state: conformance_pack_state ;
  conformance_pack_arn: string ;
  conformance_pack_id: string ;
  conformance_pack_name: string }[@@ocaml.doc
                                   "Status details of a conformance pack.\n"]
type nonrec describe_conformance_pack_status_response =
  {
  next_token: string option ;
  conformance_pack_status_details: conformance_pack_status_detail list option }
[@@ocaml.doc ""]
type nonrec describe_conformance_pack_status_request =
  {
  next_token: string option ;
  limit: int option ;
  conformance_pack_names: string list option }[@@ocaml.doc ""]
type nonrec conformance_pack_detail =
  {
  template_ssm_document_details: template_ssm_document_details option ;
  created_by: string option ;
  last_update_requested_time: CoreTypes.Timestamp.t option ;
  conformance_pack_input_parameters:
    conformance_pack_input_parameter list option ;
  delivery_s3_key_prefix: string option ;
  delivery_s3_bucket: string option ;
  conformance_pack_id: string ;
  conformance_pack_arn: string ;
  conformance_pack_name: string }[@@ocaml.doc
                                   "Returns details of a conformance pack. A conformance pack is a collection of Config rules and remediation actions that can be easily deployed in an account and a region.\n"]
type nonrec describe_conformance_packs_response =
  {
  next_token: string option ;
  conformance_pack_details: conformance_pack_detail list option }[@@ocaml.doc
                                                                   ""]
type nonrec describe_conformance_packs_request =
  {
  next_token: string option ;
  limit: int option ;
  conformance_pack_names: string list option }[@@ocaml.doc ""]
type nonrec conformance_pack_rule_compliance =
  {
  controls: string list option ;
  compliance_type: conformance_pack_compliance_type option ;
  config_rule_name: string option }[@@ocaml.doc
                                     "Compliance information of one or more Config rules within a conformance pack. You can filter using Config rule names and compliance types.\n"]
type nonrec describe_conformance_pack_compliance_response =
  {
  next_token: string option ;
  conformance_pack_rule_compliance_list:
    conformance_pack_rule_compliance list ;
  conformance_pack_name: string }[@@ocaml.doc ""]
type nonrec conformance_pack_compliance_filters =
  {
  compliance_type: conformance_pack_compliance_type option ;
  config_rule_names: string list option }[@@ocaml.doc
                                           "Filters the conformance pack by compliance types and Config rule names.\n"]
type nonrec describe_conformance_pack_compliance_request =
  {
  next_token: string option ;
  limit: int option ;
  filters: conformance_pack_compliance_filters option ;
  conformance_pack_name: string }[@@ocaml.doc ""]
type nonrec recorder_status =
  | Failure 
  | Success 
  | Pending [@@ocaml.doc ""]
type nonrec configuration_recorder_status =
  {
  last_status_change_time: CoreTypes.Timestamp.t option ;
  last_error_message: string option ;
  last_error_code: string option ;
  last_status: recorder_status option ;
  recording: bool option ;
  last_stop_time: CoreTypes.Timestamp.t option ;
  last_start_time: CoreTypes.Timestamp.t option ;
  name: string option }[@@ocaml.doc
                         "The current status of the configuration recorder.\n\n  For a detailed status of recording events over time, add your Config events to CloudWatch metrics and use CloudWatch metrics.\n  \n   "]
type nonrec describe_configuration_recorder_status_response =
  {
  configuration_recorders_status: configuration_recorder_status list option }
[@@ocaml.doc
  "The output for the [DescribeConfigurationRecorderStatus] action, in JSON format.\n"]
type nonrec describe_configuration_recorder_status_request =
  {
  configuration_recorder_names: string list option }[@@ocaml.doc
                                                      "The input for the [DescribeConfigurationRecorderStatus] action.\n"]
type nonrec describe_configuration_recorders_response =
  {
  configuration_recorders: configuration_recorder list option }[@@ocaml.doc
                                                                 "The output for the [DescribeConfigurationRecorders] action.\n"]
type nonrec describe_configuration_recorders_request =
  {
  configuration_recorder_names: string list option }[@@ocaml.doc
                                                      "The input for the [DescribeConfigurationRecorders] action.\n"]
type nonrec aggregated_source_type =
  | ORGANIZATION 
  | ACCOUNT [@@ocaml.doc ""]
type nonrec aggregated_source_status_type =
  | OUTDATED 
  | SUCCEEDED 
  | FAILED [@@ocaml.doc ""]
type nonrec aggregated_source_status =
  {
  last_error_message: string option ;
  last_error_code: string option ;
  last_update_time: CoreTypes.Timestamp.t option ;
  last_update_status: aggregated_source_status_type option ;
  aws_region: string option ;
  source_type: aggregated_source_type option ;
  source_id: string option }[@@ocaml.doc
                              "The current sync status between the source and the aggregator account.\n"]
type nonrec describe_configuration_aggregator_sources_status_response =
  {
  next_token: string option ;
  aggregated_source_status_list: aggregated_source_status list option }
[@@ocaml.doc ""]
type nonrec describe_configuration_aggregator_sources_status_request =
  {
  limit: int option ;
  next_token: string option ;
  update_status: aggregated_source_status_type list option ;
  configuration_aggregator_name: string }[@@ocaml.doc ""]
type nonrec describe_configuration_aggregators_response =
  {
  next_token: string option ;
  configuration_aggregators: configuration_aggregator list option }[@@ocaml.doc
                                                                    ""]
type nonrec describe_configuration_aggregators_request =
  {
  limit: int option ;
  next_token: string option ;
  configuration_aggregator_names: string list option }[@@ocaml.doc ""]
type nonrec describe_config_rules_response =
  {
  next_token: string option ;
  config_rules: config_rule list option }[@@ocaml.doc "\n"]
type nonrec describe_config_rules_filters =
  {
  evaluation_mode: evaluation_mode option }[@@ocaml.doc
                                             "Returns a filtered list of Detective or Proactive Config rules. By default, if the filter is not defined, this API returns an unfiltered list. For more information on Detective or Proactive Config rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config-rules.html} {b Evaluation Mode} } in the {i Config Developer Guide}.\n"]
type nonrec describe_config_rules_request =
  {
  filters: describe_config_rules_filters option ;
  next_token: string option ;
  config_rule_names: string list option }[@@ocaml.doc "\n"]
type nonrec config_rule_evaluation_status =
  {
  last_debug_log_delivery_time: CoreTypes.Timestamp.t option ;
  last_debug_log_delivery_status_reason: string option ;
  last_debug_log_delivery_status: string option ;
  first_evaluation_started: bool option ;
  last_error_message: string option ;
  last_error_code: string option ;
  last_deactivated_time: CoreTypes.Timestamp.t option ;
  first_activated_time: CoreTypes.Timestamp.t option ;
  last_failed_evaluation_time: CoreTypes.Timestamp.t option ;
  last_successful_evaluation_time: CoreTypes.Timestamp.t option ;
  last_failed_invocation_time: CoreTypes.Timestamp.t option ;
  last_successful_invocation_time: CoreTypes.Timestamp.t option ;
  config_rule_id: string option ;
  config_rule_arn: string option ;
  config_rule_name: string option }[@@ocaml.doc
                                     "Status information for your Config Managed rules and Config Custom Policy rules. The status includes information such as the last time the rule ran, the last time it failed, and the related error for the last failure.\n\n This action does not return status information about Config Custom Lambda rules.\n "]
type nonrec describe_config_rule_evaluation_status_response =
  {
  next_token: string option ;
  config_rules_evaluation_status: config_rule_evaluation_status list option }
[@@ocaml.doc "\n"]
type nonrec describe_config_rule_evaluation_status_request =
  {
  limit: int option ;
  next_token: string option ;
  config_rule_names: string list option }[@@ocaml.doc "\n"]
type nonrec compliance =
  {
  compliance_contributor_count: compliance_contributor_count option ;
  compliance_type: compliance_type option }[@@ocaml.doc
                                             "Indicates whether an Amazon Web Services resource or Config rule is compliant and provides the number of contributors that affect the compliance.\n"]
type nonrec compliance_by_resource =
  {
  compliance: compliance option ;
  resource_id: string option ;
  resource_type: string option }[@@ocaml.doc
                                  "Indicates whether an Amazon Web Services resource that is evaluated according to one or more Config rules is compliant. A resource is compliant if it complies with all of the rules that evaluate it. A resource is noncompliant if it does not comply with one or more of these rules.\n"]
type nonrec describe_compliance_by_resource_response =
  {
  next_token: string option ;
  compliance_by_resources: compliance_by_resource list option }[@@ocaml.doc
                                                                 "\n"]
type nonrec describe_compliance_by_resource_request =
  {
  next_token: string option ;
  limit: int option ;
  compliance_types: compliance_type list option ;
  resource_id: string option ;
  resource_type: string option }[@@ocaml.doc "\n"]
type nonrec compliance_by_config_rule =
  {
  compliance: compliance option ;
  config_rule_name: string option }[@@ocaml.doc
                                     "Indicates whether an Config rule is compliant. A rule is compliant if all of the resources that the rule evaluated comply with it. A rule is noncompliant if any of these resources do not comply.\n"]
type nonrec describe_compliance_by_config_rule_response =
  {
  next_token: string option ;
  compliance_by_config_rules: compliance_by_config_rule list option }
[@@ocaml.doc "\n"]
type nonrec describe_compliance_by_config_rule_request =
  {
  next_token: string option ;
  compliance_types: compliance_type list option ;
  config_rule_names: string list option }[@@ocaml.doc "\n"]
type nonrec describe_aggregation_authorizations_response =
  {
  next_token: string option ;
  aggregation_authorizations: aggregation_authorization list option }
[@@ocaml.doc ""]
type nonrec describe_aggregation_authorizations_request =
  {
  next_token: string option ;
  limit: int option }[@@ocaml.doc ""]
type nonrec aggregate_conformance_pack_compliance =
  {
  total_rule_count: int option ;
  non_compliant_rule_count: int option ;
  compliant_rule_count: int option ;
  compliance_type: conformance_pack_compliance_type option }[@@ocaml.doc
                                                              "Provides the number of compliant and noncompliant rules within a conformance pack. Also provides the compliance status of the conformance pack and the total rule count which includes compliant rules, noncompliant rules, and rules that cannot be evaluated due to insufficient data.\n\n A conformance pack is compliant if all of the rules in a conformance packs are compliant. It is noncompliant if any of the rules are not compliant. The compliance status of a conformance pack is INSUFFICIENT_DATA only if all rules within a conformance pack cannot be evaluated due to insufficient data. If some of the rules in a conformance pack are compliant but the compliance status of other rules in that same conformance pack is INSUFFICIENT_DATA, the conformance pack shows compliant.\n "]
type nonrec aggregate_compliance_by_conformance_pack =
  {
  aws_region: string option ;
  account_id: string option ;
  compliance: aggregate_conformance_pack_compliance option ;
  conformance_pack_name: string option }[@@ocaml.doc
                                          "Provides aggregate compliance of the conformance pack. Indicates whether a conformance pack is compliant based on the name of the conformance pack, account ID, and region.\n\n A conformance pack is compliant if all of the rules in a conformance packs are compliant. It is noncompliant if any of the rules are not compliant. The compliance status of a conformance pack is INSUFFICIENT_DATA only if all rules within a conformance pack cannot be evaluated due to insufficient data. If some of the rules in a conformance pack are compliant but the compliance status of other rules in that same conformance pack is INSUFFICIENT_DATA, the conformance pack shows compliant.\n "]
type nonrec describe_aggregate_compliance_by_conformance_packs_response =
  {
  next_token: string option ;
  aggregate_compliance_by_conformance_packs:
    aggregate_compliance_by_conformance_pack list option }[@@ocaml.doc ""]
type nonrec aggregate_conformance_pack_compliance_filters =
  {
  aws_region: string option ;
  account_id: string option ;
  compliance_type: conformance_pack_compliance_type option ;
  conformance_pack_name: string option }[@@ocaml.doc
                                          "Filters the conformance packs based on an account ID, region, compliance type, and the name of the conformance pack.\n"]
type nonrec describe_aggregate_compliance_by_conformance_packs_request =
  {
  next_token: string option ;
  limit: int option ;
  filters: aggregate_conformance_pack_compliance_filters option ;
  configuration_aggregator_name: string }[@@ocaml.doc ""]
type nonrec aggregate_compliance_by_config_rule =
  {
  aws_region: string option ;
  account_id: string option ;
  compliance: compliance option ;
  config_rule_name: string option }[@@ocaml.doc
                                     "Indicates whether an Config rule is compliant based on account ID, region, compliance, and rule name.\n\n A rule is compliant if all of the resources that the rule evaluated comply with it. It is noncompliant if any of these resources do not comply.\n "]
type nonrec describe_aggregate_compliance_by_config_rules_response =
  {
  next_token: string option ;
  aggregate_compliance_by_config_rules:
    aggregate_compliance_by_config_rule list option }[@@ocaml.doc ""]
type nonrec config_rule_compliance_filters =
  {
  aws_region: string option ;
  account_id: string option ;
  compliance_type: compliance_type option ;
  config_rule_name: string option }[@@ocaml.doc
                                     "Filters the compliance results based on account ID, region, compliance type, and rule name.\n"]
type nonrec describe_aggregate_compliance_by_config_rules_request =
  {
  next_token: string option ;
  limit: int option ;
  filters: config_rule_compliance_filters option ;
  configuration_aggregator_name: string }[@@ocaml.doc ""]
type nonrec deliver_config_snapshot_response =
  {
  config_snapshot_id: string option }[@@ocaml.doc
                                       "The output for the [DeliverConfigSnapshot] action, in JSON format.\n"]
type nonrec deliver_config_snapshot_request =
  {
  delivery_channel_name: string }[@@ocaml.doc
                                   "The input for the [DeliverConfigSnapshot] action.\n"]
type nonrec delete_stored_query_response = unit
type nonrec delete_stored_query_request = {
  query_name: string }[@@ocaml.doc ""]
type nonrec delete_retention_configuration_request =
  {
  retention_configuration_name: string }[@@ocaml.doc ""]
type nonrec delete_resource_config_request =
  {
  resource_id: string ;
  resource_type: string }[@@ocaml.doc ""]
type nonrec no_such_remediation_exception_exception =
  {
  message: string option }[@@ocaml.doc
                            "You tried to delete a remediation exception that does not exist.\n"]
type nonrec failed_delete_remediation_exceptions_batch =
  {
  failed_items: remediation_exception_resource_key list option ;
  failure_message: string option }[@@ocaml.doc
                                    "List of each of the failed delete remediation exceptions with specific reasons.\n"]
type nonrec delete_remediation_exceptions_response =
  {
  failed_batches: failed_delete_remediation_exceptions_batch list option }
[@@ocaml.doc ""]
type nonrec delete_remediation_exceptions_request =
  {
  resource_keys: remediation_exception_resource_key list ;
  config_rule_name: string }[@@ocaml.doc ""]
type nonrec remediation_in_progress_exception = {
  message: string option }[@@ocaml.doc
                            "Remediation action is in progress. You can either cancel execution in Amazon Web Services Systems Manager or wait and try again later. \n"]
type nonrec delete_remediation_configuration_response = unit
type nonrec delete_remediation_configuration_request =
  {
  resource_type: string option ;
  config_rule_name: string }[@@ocaml.doc ""]
type nonrec delete_pending_aggregation_request_request =
  {
  requester_aws_region: string ;
  requester_account_id: string }[@@ocaml.doc ""]
type nonrec delete_organization_conformance_pack_request =
  {
  organization_conformance_pack_name: string }[@@ocaml.doc ""]
type nonrec delete_organization_config_rule_request =
  {
  organization_config_rule_name: string }[@@ocaml.doc ""]
type nonrec delete_evaluation_results_response = unit
type nonrec delete_evaluation_results_request = {
  config_rule_name: string }[@@ocaml.doc "\n"]
type nonrec last_delivery_channel_delete_failed_exception =
  {
  message: string option }[@@ocaml.doc
                            "You cannot delete the delivery channel you specified because the configuration recorder is running.\n"]
type nonrec delete_delivery_channel_request =
  {
  delivery_channel_name: string }[@@ocaml.doc
                                   "The input for the [DeleteDeliveryChannel] action. The action accepts the following data, in JSON format. \n"]
type nonrec delete_conformance_pack_request =
  {
  conformance_pack_name: string }[@@ocaml.doc ""]
type nonrec delete_configuration_recorder_request =
  {
  configuration_recorder_name: string }[@@ocaml.doc
                                         "The request object for the [DeleteConfigurationRecorder] action.\n"]
type nonrec delete_configuration_aggregator_request =
  {
  configuration_aggregator_name: string }[@@ocaml.doc ""]
type nonrec delete_config_rule_request = {
  config_rule_name: string }[@@ocaml.doc "\n"]
type nonrec delete_aggregation_authorization_request =
  {
  authorized_aws_region: string ;
  authorized_account_id: string }[@@ocaml.doc ""]
type nonrec base_configuration_item =
  {
  configuration_item_delivery_time: CoreTypes.Timestamp.t option ;
  recording_frequency: recording_frequency option ;
  supplementary_configuration: supplementary_configuration option ;
  configuration: string option ;
  resource_creation_time: CoreTypes.Timestamp.t option ;
  availability_zone: string option ;
  aws_region: string option ;
  resource_name: string option ;
  resource_id: string option ;
  resource_type: resource_type option ;
  arn: string option ;
  configuration_state_id: string option ;
  configuration_item_status: configuration_item_status option ;
  configuration_item_capture_time: CoreTypes.Timestamp.t option ;
  account_id: string option ;
  version: string option }[@@ocaml.doc
                            "The detailed configurations of a specified resource.\n"]
type nonrec batch_get_resource_config_response =
  {
  unprocessed_resource_keys: resource_key list option ;
  base_configuration_items: base_configuration_item list option }[@@ocaml.doc
                                                                   ""]
type nonrec batch_get_resource_config_request =
  {
  resource_keys: resource_key list }[@@ocaml.doc ""]
type nonrec batch_get_aggregate_resource_config_response =
  {
  unprocessed_resource_identifiers: aggregate_resource_identifier list option ;
  base_configuration_items: base_configuration_item list option }[@@ocaml.doc
                                                                   ""]
type nonrec batch_get_aggregate_resource_config_request =
  {
  resource_identifiers: aggregate_resource_identifier list ;
  configuration_aggregator_name: string }[@@ocaml.doc ""]