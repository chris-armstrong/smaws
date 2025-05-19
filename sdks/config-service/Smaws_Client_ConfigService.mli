(** 
    Config Service client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

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
  configuration_aggregator_name: string }[@@ocaml.doc ""](** {1:builders Builders} *)

val make_untag_resource_request :
  tag_keys:string list ->
    resource_arn:string -> unit -> untag_resource_request
val make_aggregate_resource_identifier :
  ?resource_name:string ->
    resource_type:resource_type ->
      resource_id:string ->
        source_region:string ->
          source_account_id:string -> unit -> aggregate_resource_identifier
val make_time_window :
  ?end_time:CoreTypes.Timestamp.t ->
    ?start_time:CoreTypes.Timestamp.t -> unit -> time_window
val make_template_ssm_document_details :
  ?document_version:string ->
    document_name:string -> unit -> template_ssm_document_details
val make_tag : ?value:string -> ?key:string -> unit -> tag
val make_tag_resource_request :
  tags:tag list -> resource_arn:string -> unit -> tag_resource_request
val make_stored_query_metadata :
  ?description:string ->
    query_name:string ->
      query_arn:string -> query_id:string -> unit -> stored_query_metadata
val make_stored_query :
  ?expression:string ->
    ?description:string ->
      ?query_arn:string ->
        ?query_id:string -> query_name:string -> unit -> stored_query
val make_stop_configuration_recorder_request :
  configuration_recorder_name:string ->
    unit -> stop_configuration_recorder_request
val make_status_detail_filters :
  ?member_account_rule_status:member_account_rule_status ->
    ?account_id:string -> unit -> status_detail_filters
val make_static_value : values:string list -> unit -> static_value
val make_start_resource_evaluation_response :
  ?resource_evaluation_id:string ->
    unit -> start_resource_evaluation_response
val make_resource_details :
  ?resource_configuration_schema_type:resource_configuration_schema_type ->
    resource_configuration:string ->
      resource_type:string -> resource_id:string -> unit -> resource_details
val make_evaluation_context :
  ?evaluation_context_identifier:string -> unit -> evaluation_context
val make_start_resource_evaluation_request :
  ?client_token:string ->
    ?evaluation_timeout:int ->
      ?evaluation_context:evaluation_context ->
        evaluation_mode:evaluation_mode ->
          resource_details:resource_details ->
            unit -> start_resource_evaluation_request
val make_resource_key :
  resource_id:string -> resource_type:resource_type -> unit -> resource_key
val make_start_remediation_execution_response :
  ?failed_items:resource_key list ->
    ?failure_message:string -> unit -> start_remediation_execution_response
val make_start_remediation_execution_request :
  resource_keys:resource_key list ->
    config_rule_name:string -> unit -> start_remediation_execution_request
val make_start_configuration_recorder_request :
  configuration_recorder_name:string ->
    unit -> start_configuration_recorder_request
val make_start_config_rules_evaluation_response :
  unit -> start_config_rules_evaluation_response
val make_start_config_rules_evaluation_request :
  ?config_rule_names:string list ->
    unit -> start_config_rules_evaluation_request
val make_field_info : ?name:string -> unit -> field_info
val make_query_info : ?select_fields:field_info list -> unit -> query_info
val make_select_resource_config_response :
  ?next_token:string ->
    ?query_info:query_info ->
      ?results:string list -> unit -> select_resource_config_response
val make_select_resource_config_request :
  ?next_token:string ->
    ?limit:int -> expression:string -> unit -> select_resource_config_request
val make_select_aggregate_resource_config_response :
  ?next_token:string ->
    ?query_info:query_info ->
      ?results:string list ->
        unit -> select_aggregate_resource_config_response
val make_select_aggregate_resource_config_request :
  ?next_token:string ->
    ?max_results:int ->
      ?limit:int ->
        configuration_aggregator_name:string ->
          expression:string ->
            unit -> select_aggregate_resource_config_request
val make_put_stored_query_response :
  ?query_arn:string -> unit -> put_stored_query_response
val make_put_stored_query_request :
  ?tags:tag list ->
    stored_query:stored_query -> unit -> put_stored_query_request
val make_retention_configuration :
  retention_period_in_days:int ->
    name:string -> unit -> retention_configuration
val make_put_retention_configuration_response :
  ?retention_configuration:retention_configuration ->
    unit -> put_retention_configuration_response
val make_put_retention_configuration_request :
  retention_period_in_days:int -> unit -> put_retention_configuration_request
val make_put_resource_config_request :
  ?tags:tags ->
    ?resource_name:string ->
      configuration:string ->
        resource_id:string ->
          schema_version_id:string ->
            resource_type:string -> unit -> put_resource_config_request
val make_remediation_exception :
  ?expiration_time:CoreTypes.Timestamp.t ->
    ?message:string ->
      resource_id:string ->
        resource_type:string ->
          config_rule_name:string -> unit -> remediation_exception
val make_failed_remediation_exception_batch :
  ?failed_items:remediation_exception list ->
    ?failure_message:string -> unit -> failed_remediation_exception_batch
val make_put_remediation_exceptions_response :
  ?failed_batches:failed_remediation_exception_batch list ->
    unit -> put_remediation_exceptions_response
val make_remediation_exception_resource_key :
  ?resource_id:string ->
    ?resource_type:string -> unit -> remediation_exception_resource_key
val make_put_remediation_exceptions_request :
  ?expiration_time:CoreTypes.Timestamp.t ->
    ?message:string ->
      resource_keys:remediation_exception_resource_key list ->
        config_rule_name:string -> unit -> put_remediation_exceptions_request
val make_resource_value : value:resource_value_type -> unit -> resource_value
val make_remediation_parameter_value :
  ?static_value:static_value ->
    ?resource_value:resource_value -> unit -> remediation_parameter_value
val make_ssm_controls :
  ?error_percentage:int ->
    ?concurrent_execution_rate_percentage:int -> unit -> ssm_controls
val make_execution_controls :
  ?ssm_controls:ssm_controls -> unit -> execution_controls
val make_remediation_configuration :
  ?created_by_service:string ->
    ?arn:string ->
      ?retry_attempt_seconds:int ->
        ?maximum_automatic_attempts:int ->
          ?execution_controls:execution_controls ->
            ?automatic:bool ->
              ?resource_type:string ->
                ?parameters:remediation_parameters ->
                  ?target_version:string ->
                    target_id:string ->
                      target_type:remediation_target_type ->
                        config_rule_name:string ->
                          unit -> remediation_configuration
val make_failed_remediation_batch :
  ?failed_items:remediation_configuration list ->
    ?failure_message:string -> unit -> failed_remediation_batch
val make_put_remediation_configurations_response :
  ?failed_batches:failed_remediation_batch list ->
    unit -> put_remediation_configurations_response
val make_put_remediation_configurations_request :
  remediation_configurations:remediation_configuration list ->
    unit -> put_remediation_configurations_request
val make_put_organization_conformance_pack_response :
  ?organization_conformance_pack_arn:string ->
    unit -> put_organization_conformance_pack_response
val make_conformance_pack_input_parameter :
  parameter_value:string ->
    parameter_name:string -> unit -> conformance_pack_input_parameter
val make_put_organization_conformance_pack_request :
  ?excluded_accounts:string list ->
    ?conformance_pack_input_parameters:conformance_pack_input_parameter list
      ->
      ?delivery_s3_key_prefix:string ->
        ?delivery_s3_bucket:string ->
          ?template_body:string ->
            ?template_s3_uri:string ->
              organization_conformance_pack_name:string ->
                unit -> put_organization_conformance_pack_request
val make_put_organization_config_rule_response :
  ?organization_config_rule_arn:string ->
    unit -> put_organization_config_rule_response
val make_organization_managed_rule_metadata :
  ?tag_value_scope:string ->
    ?tag_key_scope:string ->
      ?resource_id_scope:string ->
        ?resource_types_scope:string list ->
          ?maximum_execution_frequency:maximum_execution_frequency ->
            ?input_parameters:string ->
              ?description:string ->
                rule_identifier:string ->
                  unit -> organization_managed_rule_metadata
val make_organization_custom_rule_metadata :
  ?tag_value_scope:string ->
    ?tag_key_scope:string ->
      ?resource_id_scope:string ->
        ?resource_types_scope:string list ->
          ?maximum_execution_frequency:maximum_execution_frequency ->
            ?input_parameters:string ->
              ?description:string ->
                organization_config_rule_trigger_types:organization_config_rule_trigger_type
                  list ->
                  lambda_function_arn:string ->
                    unit -> organization_custom_rule_metadata
val make_organization_custom_policy_rule_metadata :
  ?debug_log_delivery_accounts:string list ->
    ?tag_value_scope:string ->
      ?tag_key_scope:string ->
        ?resource_id_scope:string ->
          ?resource_types_scope:string list ->
            ?maximum_execution_frequency:maximum_execution_frequency ->
              ?input_parameters:string ->
                ?organization_config_rule_trigger_types:organization_config_rule_trigger_type_no_s_n
                  list ->
                  ?description:string ->
                    policy_text:string ->
                      policy_runtime:string ->
                        unit -> organization_custom_policy_rule_metadata
val make_put_organization_config_rule_request :
  ?organization_custom_policy_rule_metadata:organization_custom_policy_rule_metadata
    ->
    ?excluded_accounts:string list ->
      ?organization_custom_rule_metadata:organization_custom_rule_metadata ->
        ?organization_managed_rule_metadata:organization_managed_rule_metadata
          ->
          organization_config_rule_name:string ->
            unit -> put_organization_config_rule_request
val make_put_external_evaluation_response :
  unit -> put_external_evaluation_response
val make_external_evaluation :
  ?annotation:string ->
    ordering_timestamp:CoreTypes.Timestamp.t ->
      compliance_type:compliance_type ->
        compliance_resource_id:string ->
          compliance_resource_type:string -> unit -> external_evaluation
val make_put_external_evaluation_request :
  external_evaluation:external_evaluation ->
    config_rule_name:string -> unit -> put_external_evaluation_request
val make_evaluation :
  ?annotation:string ->
    ordering_timestamp:CoreTypes.Timestamp.t ->
      compliance_type:compliance_type ->
        compliance_resource_id:string ->
          compliance_resource_type:string -> unit -> evaluation
val make_put_evaluations_response :
  ?failed_evaluations:evaluation list -> unit -> put_evaluations_response
val make_put_evaluations_request :
  ?test_mode:bool ->
    ?evaluations:evaluation list ->
      result_token:string -> unit -> put_evaluations_request
val make_config_snapshot_delivery_properties :
  ?delivery_frequency:maximum_execution_frequency ->
    unit -> config_snapshot_delivery_properties
val make_delivery_channel :
  ?config_snapshot_delivery_properties:config_snapshot_delivery_properties ->
    ?sns_topic_ar_n:string ->
      ?s3_kms_key_arn:string ->
        ?s3_key_prefix:string ->
          ?s3_bucket_name:string -> ?name:string -> unit -> delivery_channel
val make_put_delivery_channel_request :
  delivery_channel:delivery_channel -> unit -> put_delivery_channel_request
val make_put_conformance_pack_response :
  ?conformance_pack_arn:string -> unit -> put_conformance_pack_response
val make_put_conformance_pack_request :
  ?template_ssm_document_details:template_ssm_document_details ->
    ?conformance_pack_input_parameters:conformance_pack_input_parameter list
      ->
      ?delivery_s3_key_prefix:string ->
        ?delivery_s3_bucket:string ->
          ?template_body:string ->
            ?template_s3_uri:string ->
              conformance_pack_name:string ->
                unit -> put_conformance_pack_request
val make_exclusion_by_resource_types :
  ?resource_types:resource_type list -> unit -> exclusion_by_resource_types
val make_recording_strategy :
  ?use_only:recording_strategy_type -> unit -> recording_strategy
val make_recording_group :
  ?recording_strategy:recording_strategy ->
    ?exclusion_by_resource_types:exclusion_by_resource_types ->
      ?resource_types:resource_type list ->
        ?include_global_resource_types:bool ->
          ?all_supported:bool -> unit -> recording_group
val make_recording_mode_override :
  ?description:string ->
    recording_frequency:recording_frequency ->
      resource_types:resource_type list -> unit -> recording_mode_override
val make_recording_mode :
  ?recording_mode_overrides:recording_mode_override list ->
    recording_frequency:recording_frequency -> unit -> recording_mode
val make_configuration_recorder :
  ?recording_mode:recording_mode ->
    ?recording_group:recording_group ->
      ?role_ar_n:string -> ?name:string -> unit -> configuration_recorder
val make_put_configuration_recorder_request :
  configuration_recorder:configuration_recorder ->
    unit -> put_configuration_recorder_request
val make_account_aggregation_source :
  ?aws_regions:string list ->
    ?all_aws_regions:bool ->
      account_ids:string list -> unit -> account_aggregation_source
val make_organization_aggregation_source :
  ?all_aws_regions:bool ->
    ?aws_regions:string list ->
      role_arn:string -> unit -> organization_aggregation_source
val make_configuration_aggregator :
  ?created_by:string ->
    ?last_updated_time:CoreTypes.Timestamp.t ->
      ?creation_time:CoreTypes.Timestamp.t ->
        ?organization_aggregation_source:organization_aggregation_source ->
          ?account_aggregation_sources:account_aggregation_source list ->
            ?configuration_aggregator_arn:string ->
              ?configuration_aggregator_name:string ->
                unit -> configuration_aggregator
val make_put_configuration_aggregator_response :
  ?configuration_aggregator:configuration_aggregator ->
    unit -> put_configuration_aggregator_response
val make_put_configuration_aggregator_request :
  ?tags:tag list ->
    ?organization_aggregation_source:organization_aggregation_source ->
      ?account_aggregation_sources:account_aggregation_source list ->
        configuration_aggregator_name:string ->
          unit -> put_configuration_aggregator_request
val make_scope :
  ?compliance_resource_id:string ->
    ?tag_value:string ->
      ?tag_key:string ->
        ?compliance_resource_types:string list -> unit -> scope
val make_source_detail :
  ?maximum_execution_frequency:maximum_execution_frequency ->
    ?message_type:message_type ->
      ?event_source:event_source -> unit -> source_detail
val make_custom_policy_details :
  ?enable_debug_log_delivery:bool ->
    policy_text:string ->
      policy_runtime:string -> unit -> custom_policy_details
val make_source :
  ?custom_policy_details:custom_policy_details ->
    ?source_details:source_detail list ->
      ?source_identifier:string -> owner:owner -> unit -> source
val make_evaluation_mode_configuration :
  ?mode:evaluation_mode -> unit -> evaluation_mode_configuration
val make_config_rule :
  ?evaluation_modes:evaluation_mode_configuration list ->
    ?created_by:string ->
      ?config_rule_state:config_rule_state ->
        ?maximum_execution_frequency:maximum_execution_frequency ->
          ?input_parameters:string ->
            ?scope:scope ->
              ?description:string ->
                ?config_rule_id:string ->
                  ?config_rule_arn:string ->
                    ?config_rule_name:string ->
                      source:source -> unit -> config_rule
val make_put_config_rule_request :
  ?tags:tag list ->
    config_rule:config_rule -> unit -> put_config_rule_request
val make_aggregation_authorization :
  ?creation_time:CoreTypes.Timestamp.t ->
    ?authorized_aws_region:string ->
      ?authorized_account_id:string ->
        ?aggregation_authorization_arn:string ->
          unit -> aggregation_authorization
val make_put_aggregation_authorization_response :
  ?aggregation_authorization:aggregation_authorization ->
    unit -> put_aggregation_authorization_response
val make_put_aggregation_authorization_request :
  ?tags:tag list ->
    authorized_aws_region:string ->
      authorized_account_id:string ->
        unit -> put_aggregation_authorization_request
val make_list_tags_for_resource_response :
  ?next_token:string ->
    ?tags:tag list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  ?next_token:string ->
    ?limit:int ->
      resource_arn:string -> unit -> list_tags_for_resource_request
val make_list_stored_queries_response :
  ?next_token:string ->
    ?stored_query_metadata:stored_query_metadata list ->
      unit -> list_stored_queries_response
val make_list_stored_queries_request :
  ?max_results:int ->
    ?next_token:string -> unit -> list_stored_queries_request
val make_resource_evaluation :
  ?evaluation_start_timestamp:CoreTypes.Timestamp.t ->
    ?evaluation_mode:evaluation_mode ->
      ?resource_evaluation_id:string -> unit -> resource_evaluation
val make_list_resource_evaluations_response :
  ?next_token:string ->
    ?resource_evaluations:resource_evaluation list ->
      unit -> list_resource_evaluations_response
val make_resource_evaluation_filters :
  ?evaluation_context_identifier:string ->
    ?time_window:time_window ->
      ?evaluation_mode:evaluation_mode -> unit -> resource_evaluation_filters
val make_list_resource_evaluations_request :
  ?next_token:string ->
    ?limit:int ->
      ?filters:resource_evaluation_filters ->
        unit -> list_resource_evaluations_request
val make_resource_identifier :
  ?resource_deletion_time:CoreTypes.Timestamp.t ->
    ?resource_name:string ->
      ?resource_id:string ->
        ?resource_type:resource_type -> unit -> resource_identifier
val make_list_discovered_resources_response :
  ?next_token:string ->
    ?resource_identifiers:resource_identifier list ->
      unit -> list_discovered_resources_response
val make_list_discovered_resources_request :
  ?next_token:string ->
    ?include_deleted_resources:bool ->
      ?limit:int ->
        ?resource_name:string ->
          ?resource_ids:string list ->
            resource_type:resource_type ->
              unit -> list_discovered_resources_request
val make_conformance_pack_compliance_score :
  ?last_updated_time:CoreTypes.Timestamp.t ->
    ?conformance_pack_name:string ->
      ?score:string -> unit -> conformance_pack_compliance_score
val make_list_conformance_pack_compliance_scores_response :
  ?next_token:string ->
    conformance_pack_compliance_scores:conformance_pack_compliance_score list
      -> unit -> list_conformance_pack_compliance_scores_response
val make_conformance_pack_compliance_scores_filters :
  conformance_pack_names:string list ->
    unit -> conformance_pack_compliance_scores_filters
val make_list_conformance_pack_compliance_scores_request :
  ?next_token:string ->
    ?limit:int ->
      ?sort_by:sort_by ->
        ?sort_order:sort_order ->
          ?filters:conformance_pack_compliance_scores_filters ->
            unit -> list_conformance_pack_compliance_scores_request
val make_list_aggregate_discovered_resources_response :
  ?next_token:string ->
    ?resource_identifiers:aggregate_resource_identifier list ->
      unit -> list_aggregate_discovered_resources_response
val make_resource_filters :
  ?region:string ->
    ?resource_name:string ->
      ?resource_id:string -> ?account_id:string -> unit -> resource_filters
val make_list_aggregate_discovered_resources_request :
  ?next_token:string ->
    ?limit:int ->
      ?filters:resource_filters ->
        resource_type:resource_type ->
          configuration_aggregator_name:string ->
            unit -> list_aggregate_discovered_resources_request
val make_get_stored_query_response :
  ?stored_query:stored_query -> unit -> get_stored_query_response
val make_get_stored_query_request :
  query_name:string -> unit -> get_stored_query_request
val make_evaluation_status :
  ?failure_reason:string ->
    status:resource_evaluation_status -> unit -> evaluation_status
val make_get_resource_evaluation_summary_response :
  ?resource_details:resource_details ->
    ?evaluation_context:evaluation_context ->
      ?compliance:compliance_type ->
        ?evaluation_start_timestamp:CoreTypes.Timestamp.t ->
          ?evaluation_status:evaluation_status ->
            ?evaluation_mode:evaluation_mode ->
              ?resource_evaluation_id:string ->
                unit -> get_resource_evaluation_summary_response
val make_get_resource_evaluation_summary_request :
  resource_evaluation_id:string ->
    unit -> get_resource_evaluation_summary_request
val make_relationship :
  ?relationship_name:string ->
    ?resource_name:string ->
      ?resource_id:string ->
        ?resource_type:resource_type -> unit -> relationship
val make_configuration_item :
  ?configuration_item_delivery_time:CoreTypes.Timestamp.t ->
    ?recording_frequency:recording_frequency ->
      ?supplementary_configuration:supplementary_configuration ->
        ?configuration:string ->
          ?relationships:relationship list ->
            ?related_events:string list ->
              ?tags:tags ->
                ?resource_creation_time:CoreTypes.Timestamp.t ->
                  ?availability_zone:string ->
                    ?aws_region:string ->
                      ?resource_name:string ->
                        ?resource_id:string ->
                          ?resource_type:resource_type ->
                            ?arn:string ->
                              ?configuration_item_md5_hash:string ->
                                ?configuration_state_id:string ->
                                  ?configuration_item_status:configuration_item_status
                                    ->
                                    ?configuration_item_capture_time:CoreTypes.Timestamp.t
                                      ->
                                      ?account_id:string ->
                                        ?version:string ->
                                          unit -> configuration_item
val make_get_resource_config_history_response :
  ?next_token:string ->
    ?configuration_items:configuration_item list ->
      unit -> get_resource_config_history_response
val make_get_resource_config_history_request :
  ?next_token:string ->
    ?limit:int ->
      ?chronological_order:chronological_order ->
        ?earlier_time:CoreTypes.Timestamp.t ->
          ?later_time:CoreTypes.Timestamp.t ->
            resource_id:string ->
              resource_type:resource_type ->
                unit -> get_resource_config_history_request
val make_get_organization_custom_rule_policy_response :
  ?policy_text:string -> unit -> get_organization_custom_rule_policy_response
val make_get_organization_custom_rule_policy_request :
  organization_config_rule_name:string ->
    unit -> get_organization_custom_rule_policy_request
val make_organization_conformance_pack_detailed_status :
  ?last_update_time:CoreTypes.Timestamp.t ->
    ?error_message:string ->
      ?error_code:string ->
        status:organization_resource_detailed_status ->
          conformance_pack_name:string ->
            account_id:string ->
              unit -> organization_conformance_pack_detailed_status
val make_get_organization_conformance_pack_detailed_status_response :
  ?next_token:string ->
    ?organization_conformance_pack_detailed_statuses:organization_conformance_pack_detailed_status
      list ->
      unit -> get_organization_conformance_pack_detailed_status_response
val make_organization_resource_detailed_status_filters :
  ?status:organization_resource_detailed_status ->
    ?account_id:string ->
      unit -> organization_resource_detailed_status_filters
val make_get_organization_conformance_pack_detailed_status_request :
  ?next_token:string ->
    ?limit:int ->
      ?filters:organization_resource_detailed_status_filters ->
        organization_conformance_pack_name:string ->
          unit -> get_organization_conformance_pack_detailed_status_request
val make_member_account_status :
  ?last_update_time:CoreTypes.Timestamp.t ->
    ?error_message:string ->
      ?error_code:string ->
        member_account_rule_status:member_account_rule_status ->
          config_rule_name:string ->
            account_id:string -> unit -> member_account_status
val make_get_organization_config_rule_detailed_status_response :
  ?next_token:string ->
    ?organization_config_rule_detailed_status:member_account_status list ->
      unit -> get_organization_config_rule_detailed_status_response
val make_get_organization_config_rule_detailed_status_request :
  ?next_token:string ->
    ?limit:int ->
      ?filters:status_detail_filters ->
        organization_config_rule_name:string ->
          unit -> get_organization_config_rule_detailed_status_request
val make_resource_count :
  ?count:int -> ?resource_type:resource_type -> unit -> resource_count
val make_get_discovered_resource_counts_response :
  ?next_token:string ->
    ?resource_counts:resource_count list ->
      ?total_discovered_resources:int ->
        unit -> get_discovered_resource_counts_response
val make_get_discovered_resource_counts_request :
  ?next_token:string ->
    ?limit:int ->
      ?resource_types:string list ->
        unit -> get_discovered_resource_counts_request
val make_get_custom_rule_policy_response :
  ?policy_text:string -> unit -> get_custom_rule_policy_response
val make_get_custom_rule_policy_request :
  ?config_rule_name:string -> unit -> get_custom_rule_policy_request
val make_conformance_pack_compliance_summary :
  conformance_pack_compliance_status:conformance_pack_compliance_type ->
    conformance_pack_name:string ->
      unit -> conformance_pack_compliance_summary
val make_get_conformance_pack_compliance_summary_response :
  ?next_token:string ->
    ?conformance_pack_compliance_summary_list:conformance_pack_compliance_summary
      list -> unit -> get_conformance_pack_compliance_summary_response
val make_get_conformance_pack_compliance_summary_request :
  ?next_token:string ->
    ?limit:int ->
      conformance_pack_names:string list ->
        unit -> get_conformance_pack_compliance_summary_request
val make_evaluation_result_qualifier :
  ?evaluation_mode:evaluation_mode ->
    ?resource_id:string ->
      ?resource_type:string ->
        ?config_rule_name:string -> unit -> evaluation_result_qualifier
val make_evaluation_result_identifier :
  ?resource_evaluation_id:string ->
    ?ordering_timestamp:CoreTypes.Timestamp.t ->
      ?evaluation_result_qualifier:evaluation_result_qualifier ->
        unit -> evaluation_result_identifier
val make_get_conformance_pack_compliance_details_response :
  ?next_token:string ->
    ?conformance_pack_rule_evaluation_results:conformance_pack_evaluation_result
      list ->
      conformance_pack_name:string ->
        unit -> get_conformance_pack_compliance_details_response
val make_conformance_pack_evaluation_filters :
  ?resource_ids:string list ->
    ?resource_type:string ->
      ?compliance_type:conformance_pack_compliance_type ->
        ?config_rule_names:string list ->
          unit -> conformance_pack_evaluation_filters
val make_get_conformance_pack_compliance_details_request :
  ?next_token:string ->
    ?limit:int ->
      ?filters:conformance_pack_evaluation_filters ->
        conformance_pack_name:string ->
          unit -> get_conformance_pack_compliance_details_request
val make_compliance_contributor_count :
  ?cap_exceeded:bool ->
    ?capped_count:int -> unit -> compliance_contributor_count
val make_compliance_summary :
  ?compliance_summary_timestamp:CoreTypes.Timestamp.t ->
    ?non_compliant_resource_count:compliance_contributor_count ->
      ?compliant_resource_count:compliance_contributor_count ->
        unit -> compliance_summary
val make_compliance_summary_by_resource_type :
  ?compliance_summary:compliance_summary ->
    ?resource_type:string -> unit -> compliance_summary_by_resource_type
val make_get_compliance_summary_by_resource_type_response :
  ?compliance_summaries_by_resource_type:compliance_summary_by_resource_type
    list -> unit -> get_compliance_summary_by_resource_type_response
val make_get_compliance_summary_by_resource_type_request :
  ?resource_types:string list ->
    unit -> get_compliance_summary_by_resource_type_request
val make_get_compliance_summary_by_config_rule_response :
  ?compliance_summary:compliance_summary ->
    unit -> get_compliance_summary_by_config_rule_response
val make_get_compliance_details_by_resource_response :
  ?next_token:string ->
    ?evaluation_results:evaluation_result list ->
      unit -> get_compliance_details_by_resource_response
val make_get_compliance_details_by_resource_request :
  ?resource_evaluation_id:string ->
    ?next_token:string ->
      ?compliance_types:compliance_type list ->
        ?resource_id:string ->
          ?resource_type:string ->
            unit -> get_compliance_details_by_resource_request
val make_get_compliance_details_by_config_rule_response :
  ?next_token:string ->
    ?evaluation_results:evaluation_result list ->
      unit -> get_compliance_details_by_config_rule_response
val make_get_compliance_details_by_config_rule_request :
  ?next_token:string ->
    ?limit:int ->
      ?compliance_types:compliance_type list ->
        config_rule_name:string ->
          unit -> get_compliance_details_by_config_rule_request
val make_get_aggregate_resource_config_response :
  ?configuration_item:configuration_item ->
    unit -> get_aggregate_resource_config_response
val make_get_aggregate_resource_config_request :
  resource_identifier:aggregate_resource_identifier ->
    configuration_aggregator_name:string ->
      unit -> get_aggregate_resource_config_request
val make_grouped_resource_count :
  resource_count:int -> group_name:string -> unit -> grouped_resource_count
val make_get_aggregate_discovered_resource_counts_response :
  ?next_token:string ->
    ?grouped_resource_counts:grouped_resource_count list ->
      ?group_by_key:string ->
        total_discovered_resources:int ->
          unit -> get_aggregate_discovered_resource_counts_response
val make_resource_count_filters :
  ?region:string ->
    ?account_id:string ->
      ?resource_type:resource_type -> unit -> resource_count_filters
val make_get_aggregate_discovered_resource_counts_request :
  ?next_token:string ->
    ?limit:int ->
      ?group_by_key:resource_count_group_key ->
        ?filters:resource_count_filters ->
          configuration_aggregator_name:string ->
            unit -> get_aggregate_discovered_resource_counts_request
val make_aggregate_conformance_pack_compliance_count :
  ?non_compliant_conformance_pack_count:int ->
    ?compliant_conformance_pack_count:int ->
      unit -> aggregate_conformance_pack_compliance_count
val make_aggregate_conformance_pack_compliance_summary :
  ?group_name:string ->
    ?compliance_summary:aggregate_conformance_pack_compliance_count ->
      unit -> aggregate_conformance_pack_compliance_summary
val make_get_aggregate_conformance_pack_compliance_summary_response :
  ?next_token:string ->
    ?group_by_key:string ->
      ?aggregate_conformance_pack_compliance_summaries:aggregate_conformance_pack_compliance_summary
        list ->
        unit -> get_aggregate_conformance_pack_compliance_summary_response
val make_aggregate_conformance_pack_compliance_summary_filters :
  ?aws_region:string ->
    ?account_id:string ->
      unit -> aggregate_conformance_pack_compliance_summary_filters
val make_get_aggregate_conformance_pack_compliance_summary_request :
  ?next_token:string ->
    ?limit:int ->
      ?group_by_key:aggregate_conformance_pack_compliance_summary_group_key
        ->
        ?filters:aggregate_conformance_pack_compliance_summary_filters ->
          configuration_aggregator_name:string ->
            unit -> get_aggregate_conformance_pack_compliance_summary_request
val make_aggregate_compliance_count :
  ?compliance_summary:compliance_summary ->
    ?group_name:string -> unit -> aggregate_compliance_count
val make_get_aggregate_config_rule_compliance_summary_response :
  ?next_token:string ->
    ?aggregate_compliance_counts:aggregate_compliance_count list ->
      ?group_by_key:string ->
        unit -> get_aggregate_config_rule_compliance_summary_response
val make_config_rule_compliance_summary_filters :
  ?aws_region:string ->
    ?account_id:string -> unit -> config_rule_compliance_summary_filters
val make_get_aggregate_config_rule_compliance_summary_request :
  ?next_token:string ->
    ?limit:int ->
      ?group_by_key:config_rule_compliance_summary_group_key ->
        ?filters:config_rule_compliance_summary_filters ->
          configuration_aggregator_name:string ->
            unit -> get_aggregate_config_rule_compliance_summary_request
val make_get_aggregate_compliance_details_by_config_rule_response :
  ?next_token:string ->
    ?aggregate_evaluation_results:aggregate_evaluation_result list ->
      unit -> get_aggregate_compliance_details_by_config_rule_response
val make_get_aggregate_compliance_details_by_config_rule_request :
  ?next_token:string ->
    ?limit:int ->
      ?compliance_type:compliance_type ->
        aws_region:string ->
          account_id:string ->
            config_rule_name:string ->
              configuration_aggregator_name:string ->
                unit ->
                  get_aggregate_compliance_details_by_config_rule_request
val make_describe_retention_configurations_response :
  ?next_token:string ->
    ?retention_configurations:retention_configuration list ->
      unit -> describe_retention_configurations_response
val make_describe_retention_configurations_request :
  ?next_token:string ->
    ?retention_configuration_names:string list ->
      unit -> describe_retention_configurations_request
val make_remediation_execution_step :
  ?stop_time:CoreTypes.Timestamp.t ->
    ?start_time:CoreTypes.Timestamp.t ->
      ?error_message:string ->
        ?state:remediation_execution_step_state ->
          ?name:string -> unit -> remediation_execution_step
val make_remediation_execution_status :
  ?last_updated_time:CoreTypes.Timestamp.t ->
    ?invocation_time:CoreTypes.Timestamp.t ->
      ?step_details:remediation_execution_step list ->
        ?state:remediation_execution_state ->
          ?resource_key:resource_key -> unit -> remediation_execution_status
val make_describe_remediation_execution_status_response :
  ?next_token:string ->
    ?remediation_execution_statuses:remediation_execution_status list ->
      unit -> describe_remediation_execution_status_response
val make_describe_remediation_execution_status_request :
  ?next_token:string ->
    ?limit:int ->
      ?resource_keys:resource_key list ->
        config_rule_name:string ->
          unit -> describe_remediation_execution_status_request
val make_describe_remediation_exceptions_response :
  ?next_token:string ->
    ?remediation_exceptions:remediation_exception list ->
      unit -> describe_remediation_exceptions_response
val make_describe_remediation_exceptions_request :
  ?next_token:string ->
    ?limit:int ->
      ?resource_keys:remediation_exception_resource_key list ->
        config_rule_name:string ->
          unit -> describe_remediation_exceptions_request
val make_describe_remediation_configurations_response :
  ?remediation_configurations:remediation_configuration list ->
    unit -> describe_remediation_configurations_response
val make_describe_remediation_configurations_request :
  config_rule_names:string list ->
    unit -> describe_remediation_configurations_request
val make_pending_aggregation_request :
  ?requester_aws_region:string ->
    ?requester_account_id:string -> unit -> pending_aggregation_request
val make_describe_pending_aggregation_requests_response :
  ?next_token:string ->
    ?pending_aggregation_requests:pending_aggregation_request list ->
      unit -> describe_pending_aggregation_requests_response
val make_describe_pending_aggregation_requests_request :
  ?next_token:string ->
    ?limit:int -> unit -> describe_pending_aggregation_requests_request
val make_organization_conformance_pack_status :
  ?last_update_time:CoreTypes.Timestamp.t ->
    ?error_message:string ->
      ?error_code:string ->
        status:organization_resource_status ->
          organization_conformance_pack_name:string ->
            unit -> organization_conformance_pack_status
val make_describe_organization_conformance_pack_statuses_response :
  ?next_token:string ->
    ?organization_conformance_pack_statuses:organization_conformance_pack_status
      list ->
      unit -> describe_organization_conformance_pack_statuses_response
val make_describe_organization_conformance_pack_statuses_request :
  ?next_token:string ->
    ?limit:int ->
      ?organization_conformance_pack_names:string list ->
        unit -> describe_organization_conformance_pack_statuses_request
val make_organization_conformance_pack :
  ?excluded_accounts:string list ->
    ?conformance_pack_input_parameters:conformance_pack_input_parameter list
      ->
      ?delivery_s3_key_prefix:string ->
        ?delivery_s3_bucket:string ->
          last_update_time:CoreTypes.Timestamp.t ->
            organization_conformance_pack_arn:string ->
              organization_conformance_pack_name:string ->
                unit -> organization_conformance_pack
val make_describe_organization_conformance_packs_response :
  ?next_token:string ->
    ?organization_conformance_packs:organization_conformance_pack list ->
      unit -> describe_organization_conformance_packs_response
val make_describe_organization_conformance_packs_request :
  ?next_token:string ->
    ?limit:int ->
      ?organization_conformance_pack_names:string list ->
        unit -> describe_organization_conformance_packs_request
val make_organization_config_rule_status :
  ?last_update_time:CoreTypes.Timestamp.t ->
    ?error_message:string ->
      ?error_code:string ->
        organization_rule_status:organization_rule_status ->
          organization_config_rule_name:string ->
            unit -> organization_config_rule_status
val make_describe_organization_config_rule_statuses_response :
  ?next_token:string ->
    ?organization_config_rule_statuses:organization_config_rule_status list
      -> unit -> describe_organization_config_rule_statuses_response
val make_describe_organization_config_rule_statuses_request :
  ?next_token:string ->
    ?limit:int ->
      ?organization_config_rule_names:string list ->
        unit -> describe_organization_config_rule_statuses_request
val make_organization_custom_policy_rule_metadata_no_policy :
  ?debug_log_delivery_accounts:string list ->
    ?policy_runtime:string ->
      ?tag_value_scope:string ->
        ?tag_key_scope:string ->
          ?resource_id_scope:string ->
            ?resource_types_scope:string list ->
              ?maximum_execution_frequency:maximum_execution_frequency ->
                ?input_parameters:string ->
                  ?organization_config_rule_trigger_types:organization_config_rule_trigger_type_no_s_n
                    list ->
                    ?description:string ->
                      unit ->
                        organization_custom_policy_rule_metadata_no_policy
val make_organization_config_rule :
  ?organization_custom_policy_rule_metadata:organization_custom_policy_rule_metadata_no_policy
    ->
    ?last_update_time:CoreTypes.Timestamp.t ->
      ?excluded_accounts:string list ->
        ?organization_custom_rule_metadata:organization_custom_rule_metadata
          ->
          ?organization_managed_rule_metadata:organization_managed_rule_metadata
            ->
            organization_config_rule_arn:string ->
              organization_config_rule_name:string ->
                unit -> organization_config_rule
val make_describe_organization_config_rules_response :
  ?next_token:string ->
    ?organization_config_rules:organization_config_rule list ->
      unit -> describe_organization_config_rules_response
val make_describe_organization_config_rules_request :
  ?next_token:string ->
    ?limit:int ->
      ?organization_config_rule_names:string list ->
        unit -> describe_organization_config_rules_request
val make_config_export_delivery_info :
  ?next_delivery_time:CoreTypes.Timestamp.t ->
    ?last_successful_time:CoreTypes.Timestamp.t ->
      ?last_attempt_time:CoreTypes.Timestamp.t ->
        ?last_error_message:string ->
          ?last_error_code:string ->
            ?last_status:delivery_status ->
              unit -> config_export_delivery_info
val make_config_stream_delivery_info :
  ?last_status_change_time:CoreTypes.Timestamp.t ->
    ?last_error_message:string ->
      ?last_error_code:string ->
        ?last_status:delivery_status -> unit -> config_stream_delivery_info
val make_delivery_channel_status :
  ?config_stream_delivery_info:config_stream_delivery_info ->
    ?config_history_delivery_info:config_export_delivery_info ->
      ?config_snapshot_delivery_info:config_export_delivery_info ->
        ?name:string -> unit -> delivery_channel_status
val make_describe_delivery_channel_status_response :
  ?delivery_channels_status:delivery_channel_status list ->
    unit -> describe_delivery_channel_status_response
val make_describe_delivery_channel_status_request :
  ?delivery_channel_names:string list ->
    unit -> describe_delivery_channel_status_request
val make_describe_delivery_channels_response :
  ?delivery_channels:delivery_channel list ->
    unit -> describe_delivery_channels_response
val make_describe_delivery_channels_request :
  ?delivery_channel_names:string list ->
    unit -> describe_delivery_channels_request
val make_conformance_pack_status_detail :
  ?last_update_completed_time:CoreTypes.Timestamp.t ->
    ?conformance_pack_status_reason:string ->
      last_update_requested_time:CoreTypes.Timestamp.t ->
        stack_arn:string ->
          conformance_pack_state:conformance_pack_state ->
            conformance_pack_arn:string ->
              conformance_pack_id:string ->
                conformance_pack_name:string ->
                  unit -> conformance_pack_status_detail
val make_describe_conformance_pack_status_response :
  ?next_token:string ->
    ?conformance_pack_status_details:conformance_pack_status_detail list ->
      unit -> describe_conformance_pack_status_response
val make_describe_conformance_pack_status_request :
  ?next_token:string ->
    ?limit:int ->
      ?conformance_pack_names:string list ->
        unit -> describe_conformance_pack_status_request
val make_conformance_pack_detail :
  ?template_ssm_document_details:template_ssm_document_details ->
    ?created_by:string ->
      ?last_update_requested_time:CoreTypes.Timestamp.t ->
        ?conformance_pack_input_parameters:conformance_pack_input_parameter
          list ->
          ?delivery_s3_key_prefix:string ->
            ?delivery_s3_bucket:string ->
              conformance_pack_id:string ->
                conformance_pack_arn:string ->
                  conformance_pack_name:string ->
                    unit -> conformance_pack_detail
val make_describe_conformance_packs_response :
  ?next_token:string ->
    ?conformance_pack_details:conformance_pack_detail list ->
      unit -> describe_conformance_packs_response
val make_describe_conformance_packs_request :
  ?next_token:string ->
    ?limit:int ->
      ?conformance_pack_names:string list ->
        unit -> describe_conformance_packs_request
val make_conformance_pack_rule_compliance :
  ?controls:string list ->
    ?compliance_type:conformance_pack_compliance_type ->
      ?config_rule_name:string -> unit -> conformance_pack_rule_compliance
val make_describe_conformance_pack_compliance_response :
  ?next_token:string ->
    conformance_pack_rule_compliance_list:conformance_pack_rule_compliance
      list ->
      conformance_pack_name:string ->
        unit -> describe_conformance_pack_compliance_response
val make_conformance_pack_compliance_filters :
  ?compliance_type:conformance_pack_compliance_type ->
    ?config_rule_names:string list ->
      unit -> conformance_pack_compliance_filters
val make_describe_conformance_pack_compliance_request :
  ?next_token:string ->
    ?limit:int ->
      ?filters:conformance_pack_compliance_filters ->
        conformance_pack_name:string ->
          unit -> describe_conformance_pack_compliance_request
val make_configuration_recorder_status :
  ?last_status_change_time:CoreTypes.Timestamp.t ->
    ?last_error_message:string ->
      ?last_error_code:string ->
        ?last_status:recorder_status ->
          ?recording:bool ->
            ?last_stop_time:CoreTypes.Timestamp.t ->
              ?last_start_time:CoreTypes.Timestamp.t ->
                ?name:string -> unit -> configuration_recorder_status
val make_describe_configuration_recorder_status_response :
  ?configuration_recorders_status:configuration_recorder_status list ->
    unit -> describe_configuration_recorder_status_response
val make_describe_configuration_recorder_status_request :
  ?configuration_recorder_names:string list ->
    unit -> describe_configuration_recorder_status_request
val make_describe_configuration_recorders_response :
  ?configuration_recorders:configuration_recorder list ->
    unit -> describe_configuration_recorders_response
val make_describe_configuration_recorders_request :
  ?configuration_recorder_names:string list ->
    unit -> describe_configuration_recorders_request
val make_aggregated_source_status :
  ?last_error_message:string ->
    ?last_error_code:string ->
      ?last_update_time:CoreTypes.Timestamp.t ->
        ?last_update_status:aggregated_source_status_type ->
          ?aws_region:string ->
            ?source_type:aggregated_source_type ->
              ?source_id:string -> unit -> aggregated_source_status
val make_describe_configuration_aggregator_sources_status_response :
  ?next_token:string ->
    ?aggregated_source_status_list:aggregated_source_status list ->
      unit -> describe_configuration_aggregator_sources_status_response
val make_describe_configuration_aggregator_sources_status_request :
  ?limit:int ->
    ?next_token:string ->
      ?update_status:aggregated_source_status_type list ->
        configuration_aggregator_name:string ->
          unit -> describe_configuration_aggregator_sources_status_request
val make_describe_configuration_aggregators_response :
  ?next_token:string ->
    ?configuration_aggregators:configuration_aggregator list ->
      unit -> describe_configuration_aggregators_response
val make_describe_configuration_aggregators_request :
  ?limit:int ->
    ?next_token:string ->
      ?configuration_aggregator_names:string list ->
        unit -> describe_configuration_aggregators_request
val make_describe_config_rules_response :
  ?next_token:string ->
    ?config_rules:config_rule list -> unit -> describe_config_rules_response
val make_describe_config_rules_filters :
  ?evaluation_mode:evaluation_mode -> unit -> describe_config_rules_filters
val make_describe_config_rules_request :
  ?filters:describe_config_rules_filters ->
    ?next_token:string ->
      ?config_rule_names:string list -> unit -> describe_config_rules_request
val make_config_rule_evaluation_status :
  ?last_debug_log_delivery_time:CoreTypes.Timestamp.t ->
    ?last_debug_log_delivery_status_reason:string ->
      ?last_debug_log_delivery_status:string ->
        ?first_evaluation_started:bool ->
          ?last_error_message:string ->
            ?last_error_code:string ->
              ?last_deactivated_time:CoreTypes.Timestamp.t ->
                ?first_activated_time:CoreTypes.Timestamp.t ->
                  ?last_failed_evaluation_time:CoreTypes.Timestamp.t ->
                    ?last_successful_evaluation_time:CoreTypes.Timestamp.t ->
                      ?last_failed_invocation_time:CoreTypes.Timestamp.t ->
                        ?last_successful_invocation_time:CoreTypes.Timestamp.t
                          ->
                          ?config_rule_id:string ->
                            ?config_rule_arn:string ->
                              ?config_rule_name:string ->
                                unit -> config_rule_evaluation_status
val make_describe_config_rule_evaluation_status_response :
  ?next_token:string ->
    ?config_rules_evaluation_status:config_rule_evaluation_status list ->
      unit -> describe_config_rule_evaluation_status_response
val make_describe_config_rule_evaluation_status_request :
  ?limit:int ->
    ?next_token:string ->
      ?config_rule_names:string list ->
        unit -> describe_config_rule_evaluation_status_request
val make_compliance :
  ?compliance_contributor_count:compliance_contributor_count ->
    ?compliance_type:compliance_type -> unit -> compliance
val make_compliance_by_resource :
  ?compliance:compliance ->
    ?resource_id:string ->
      ?resource_type:string -> unit -> compliance_by_resource
val make_describe_compliance_by_resource_response :
  ?next_token:string ->
    ?compliance_by_resources:compliance_by_resource list ->
      unit -> describe_compliance_by_resource_response
val make_describe_compliance_by_resource_request :
  ?next_token:string ->
    ?limit:int ->
      ?compliance_types:compliance_type list ->
        ?resource_id:string ->
          ?resource_type:string ->
            unit -> describe_compliance_by_resource_request
val make_compliance_by_config_rule :
  ?compliance:compliance ->
    ?config_rule_name:string -> unit -> compliance_by_config_rule
val make_describe_compliance_by_config_rule_response :
  ?next_token:string ->
    ?compliance_by_config_rules:compliance_by_config_rule list ->
      unit -> describe_compliance_by_config_rule_response
val make_describe_compliance_by_config_rule_request :
  ?next_token:string ->
    ?compliance_types:compliance_type list ->
      ?config_rule_names:string list ->
        unit -> describe_compliance_by_config_rule_request
val make_describe_aggregation_authorizations_response :
  ?next_token:string ->
    ?aggregation_authorizations:aggregation_authorization list ->
      unit -> describe_aggregation_authorizations_response
val make_describe_aggregation_authorizations_request :
  ?next_token:string ->
    ?limit:int -> unit -> describe_aggregation_authorizations_request
val make_aggregate_conformance_pack_compliance :
  ?total_rule_count:int ->
    ?non_compliant_rule_count:int ->
      ?compliant_rule_count:int ->
        ?compliance_type:conformance_pack_compliance_type ->
          unit -> aggregate_conformance_pack_compliance
val make_aggregate_compliance_by_conformance_pack :
  ?aws_region:string ->
    ?account_id:string ->
      ?compliance:aggregate_conformance_pack_compliance ->
        ?conformance_pack_name:string ->
          unit -> aggregate_compliance_by_conformance_pack
val make_describe_aggregate_compliance_by_conformance_packs_response :
  ?next_token:string ->
    ?aggregate_compliance_by_conformance_packs:aggregate_compliance_by_conformance_pack
      list ->
      unit -> describe_aggregate_compliance_by_conformance_packs_response
val make_aggregate_conformance_pack_compliance_filters :
  ?aws_region:string ->
    ?account_id:string ->
      ?compliance_type:conformance_pack_compliance_type ->
        ?conformance_pack_name:string ->
          unit -> aggregate_conformance_pack_compliance_filters
val make_describe_aggregate_compliance_by_conformance_packs_request :
  ?next_token:string ->
    ?limit:int ->
      ?filters:aggregate_conformance_pack_compliance_filters ->
        configuration_aggregator_name:string ->
          unit -> describe_aggregate_compliance_by_conformance_packs_request
val make_aggregate_compliance_by_config_rule :
  ?aws_region:string ->
    ?account_id:string ->
      ?compliance:compliance ->
        ?config_rule_name:string ->
          unit -> aggregate_compliance_by_config_rule
val make_describe_aggregate_compliance_by_config_rules_response :
  ?next_token:string ->
    ?aggregate_compliance_by_config_rules:aggregate_compliance_by_config_rule
      list -> unit -> describe_aggregate_compliance_by_config_rules_response
val make_config_rule_compliance_filters :
  ?aws_region:string ->
    ?account_id:string ->
      ?compliance_type:compliance_type ->
        ?config_rule_name:string -> unit -> config_rule_compliance_filters
val make_describe_aggregate_compliance_by_config_rules_request :
  ?next_token:string ->
    ?limit:int ->
      ?filters:config_rule_compliance_filters ->
        configuration_aggregator_name:string ->
          unit -> describe_aggregate_compliance_by_config_rules_request
val make_deliver_config_snapshot_response :
  ?config_snapshot_id:string -> unit -> deliver_config_snapshot_response
val make_deliver_config_snapshot_request :
  delivery_channel_name:string -> unit -> deliver_config_snapshot_request
val make_delete_stored_query_response : unit -> delete_stored_query_response
val make_delete_stored_query_request :
  query_name:string -> unit -> delete_stored_query_request
val make_delete_retention_configuration_request :
  retention_configuration_name:string ->
    unit -> delete_retention_configuration_request
val make_delete_resource_config_request :
  resource_id:string ->
    resource_type:string -> unit -> delete_resource_config_request
val make_failed_delete_remediation_exceptions_batch :
  ?failed_items:remediation_exception_resource_key list ->
    ?failure_message:string ->
      unit -> failed_delete_remediation_exceptions_batch
val make_delete_remediation_exceptions_response :
  ?failed_batches:failed_delete_remediation_exceptions_batch list ->
    unit -> delete_remediation_exceptions_response
val make_delete_remediation_exceptions_request :
  resource_keys:remediation_exception_resource_key list ->
    config_rule_name:string -> unit -> delete_remediation_exceptions_request
val make_delete_remediation_configuration_response :
  unit -> delete_remediation_configuration_response
val make_delete_remediation_configuration_request :
  ?resource_type:string ->
    config_rule_name:string ->
      unit -> delete_remediation_configuration_request
val make_delete_pending_aggregation_request_request :
  requester_aws_region:string ->
    requester_account_id:string ->
      unit -> delete_pending_aggregation_request_request
val make_delete_organization_conformance_pack_request :
  organization_conformance_pack_name:string ->
    unit -> delete_organization_conformance_pack_request
val make_delete_organization_config_rule_request :
  organization_config_rule_name:string ->
    unit -> delete_organization_config_rule_request
val make_delete_evaluation_results_response :
  unit -> delete_evaluation_results_response
val make_delete_evaluation_results_request :
  config_rule_name:string -> unit -> delete_evaluation_results_request
val make_delete_delivery_channel_request :
  delivery_channel_name:string -> unit -> delete_delivery_channel_request
val make_delete_conformance_pack_request :
  conformance_pack_name:string -> unit -> delete_conformance_pack_request
val make_delete_configuration_recorder_request :
  configuration_recorder_name:string ->
    unit -> delete_configuration_recorder_request
val make_delete_configuration_aggregator_request :
  configuration_aggregator_name:string ->
    unit -> delete_configuration_aggregator_request
val make_delete_config_rule_request :
  config_rule_name:string -> unit -> delete_config_rule_request
val make_delete_aggregation_authorization_request :
  authorized_aws_region:string ->
    authorized_account_id:string ->
      unit -> delete_aggregation_authorization_request
val make_base_configuration_item :
  ?configuration_item_delivery_time:CoreTypes.Timestamp.t ->
    ?recording_frequency:recording_frequency ->
      ?supplementary_configuration:supplementary_configuration ->
        ?configuration:string ->
          ?resource_creation_time:CoreTypes.Timestamp.t ->
            ?availability_zone:string ->
              ?aws_region:string ->
                ?resource_name:string ->
                  ?resource_id:string ->
                    ?resource_type:resource_type ->
                      ?arn:string ->
                        ?configuration_state_id:string ->
                          ?configuration_item_status:configuration_item_status
                            ->
                            ?configuration_item_capture_time:CoreTypes.Timestamp.t
                              ->
                              ?account_id:string ->
                                ?version:string ->
                                  unit -> base_configuration_item
val make_batch_get_resource_config_response :
  ?unprocessed_resource_keys:resource_key list ->
    ?base_configuration_items:base_configuration_item list ->
      unit -> batch_get_resource_config_response
val make_batch_get_resource_config_request :
  resource_keys:resource_key list ->
    unit -> batch_get_resource_config_request
val make_batch_get_aggregate_resource_config_response :
  ?unprocessed_resource_identifiers:aggregate_resource_identifier list ->
    ?base_configuration_items:base_configuration_item list ->
      unit -> batch_get_aggregate_resource_config_response
val make_batch_get_aggregate_resource_config_request :
  resource_identifiers:aggregate_resource_identifier list ->
    configuration_aggregator_name:string ->
      unit -> batch_get_aggregate_resource_config_request(** {1:operations Operations} *)

module BatchGetAggregateResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_aggregate_resource_config_request ->
        (batch_get_aggregate_resource_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns the current configuration items for resources that are present in your Config aggregator. The operation also returns a list of resources that are not processed in the current request. If there are no unprocessed resources, the operation returns an empty [unprocessedResourceIdentifiers] list. 

  {ul
        {-  The API does not return results for deleted resources.
            
             }
        {-   The API does not return tags and relationships.
            
             }
        }
    *)

  
end

module BatchGetResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_resource_config_request ->
        (batch_get_resource_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns the [BaseConfigurationItem] for one or more requested resources. The operation also returns a list of resources that are not processed in the current request. If there are no unprocessed resources, the operation returns an empty unprocessedResourceKeys list. 

  {ul
        {-  The API does not return results for deleted resources.
            
             }
        {-   The API does not return any tags for the requested resources. This information is filtered out of the supplementaryConfiguration section of the API response.
            
             }
        }
    *)

  
end

module DeleteAggregationAuthorization : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_aggregation_authorization_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** Deletes the authorization granted to the specified configuration aggregator account in a specified region.
 *)

  
end

module DeleteConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_config_rule_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigRuleException of no_such_config_rule_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** Deletes the specified Config rule and all of its evaluation results.

 Config sets the state of a rule to [DELETING] until the deletion is complete. You cannot update a rule while it is in this state. If you make a [PutConfigRule] or [DeleteConfigRule] request for the rule, you will receive a [ResourceInUseException].
 
  You can check the state of a rule by using the [DescribeConfigRules] request.
   *)

  
end

module DeleteConfigurationAggregator : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_configuration_aggregator_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            
        ]
      ) result
  (** Deletes the specified configuration aggregator and the aggregated data associated with the aggregator.
 *)

  
end

module DeleteConfigurationRecorder : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_configuration_recorder_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
            
        ]
      ) result
  (** Deletes the configuration recorder.

 After the configuration recorder is deleted, Config will not record resource configuration changes until you create a new configuration recorder.
 
  This action does not delete the configuration information that was previously recorded. You will be able to access the previously recorded information by using the [GetResourceConfigHistory] action, but you will not be able to access this information in the Config console until you create a new configuration recorder.
   *)

  
end

module DeleteConformancePack : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_conformance_pack_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConformancePackException of no_such_conformance_pack_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** Deletes the specified conformance pack and all the Config rules, remediation actions, and all evaluation results within that conformance pack.

 Config sets the conformance pack to [DELETE_IN_PROGRESS] until the deletion is complete. You cannot update a conformance pack while it is in this state.
  *)

  
end

module DeleteDeliveryChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_delivery_channel_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LastDeliveryChannelDeleteFailedException of last_delivery_channel_delete_failed_exception
            | `NoSuchDeliveryChannelException of no_such_delivery_channel_exception
            
        ]
      ) result
  (** Deletes the delivery channel.

 Before you can delete the delivery channel, you must stop the configuration recorder by using the [StopConfigurationRecorder] action.
  *)

  
end

module DeleteEvaluationResults : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_evaluation_results_request ->
        (delete_evaluation_results_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigRuleException of no_such_config_rule_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** Deletes the evaluation results for the specified Config rule. You can specify one Config rule per request. After you delete the evaluation results, you can call the [StartConfigRulesEvaluation] API to start evaluating your Amazon Web Services resources against the rule.
 *)

  
end

module DeleteOrganizationConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_organization_config_rule_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchOrganizationConfigRuleException of no_such_organization_config_rule_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** Deletes the specified organization Config rule and all of its evaluation results from all member accounts in that organization. 

 Only a management account and a delegated administrator account can delete an organization Config rule. When calling this API with a delegated administrator, you must ensure Organizations [ListDelegatedAdministrator] permissions are added.
 
  Config sets the state of a rule to DELETE_IN_PROGRESS until the deletion is complete. You cannot update a rule while it is in this state.
   *)

  
end

module DeleteOrganizationConformancePack : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_organization_conformance_pack_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchOrganizationConformancePackException of no_such_organization_conformance_pack_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** Deletes the specified organization conformance pack and all of the Config rules and remediation actions from all member accounts in that organization. 

  Only a management account or a delegated administrator account can delete an organization conformance pack. When calling this API with a delegated administrator, you must ensure Organizations [ListDelegatedAdministrator] permissions are added.
 
  Config sets the state of a conformance pack to DELETE_IN_PROGRESS until the deletion is complete. You cannot update a conformance pack while it is in this state. 
   *)

  
end

module DeletePendingAggregationRequest : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_pending_aggregation_request_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** Deletes pending authorization requests for a specified aggregator account in a specified region.
 *)

  
end

module DeleteRemediationConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_remediation_configuration_request ->
        (delete_remediation_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientPermissionsException of insufficient_permissions_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchRemediationConfigurationException of no_such_remediation_configuration_exception
            | `RemediationInProgressException of remediation_in_progress_exception
            
        ]
      ) result
  (** Deletes the remediation configuration.
 *)

  
end

module DeleteRemediationExceptions : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_remediation_exceptions_request ->
        (delete_remediation_exceptions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchRemediationExceptionException of no_such_remediation_exception_exception
            
        ]
      ) result
  (** Deletes one or more remediation exceptions mentioned in the resource keys.

  Config generates a remediation exception when a problem occurs executing a remediation action to a specific resource. Remediation exceptions blocks auto-remediation until the exception is cleared.
  
    *)

  
end

module DeleteResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_config_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoRunningConfigurationRecorderException of no_running_configuration_recorder_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Records the configuration state for a custom resource that has been deleted. This API records a new ConfigurationItem with a ResourceDeleted status. You can retrieve the ConfigurationItems recorded for this resource in your Config History. 
 *)

  
end

module DeleteRetentionConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_retention_configuration_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchRetentionConfigurationException of no_such_retention_configuration_exception
            
        ]
      ) result
  (** Deletes the retention configuration.
 *)

  
end

module DeleteStoredQuery : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_stored_query_request ->
        (delete_stored_query_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Deletes the stored query for a single Amazon Web Services account and a single Amazon Web Services Region.
 *)

  
end

module DeliverConfigSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      deliver_config_snapshot_request ->
        (deliver_config_snapshot_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
            | `NoRunningConfigurationRecorderException of no_running_configuration_recorder_exception
            | `NoSuchDeliveryChannelException of no_such_delivery_channel_exception
            
        ]
      ) result
  (** Schedules delivery of a configuration snapshot to the Amazon S3 bucket in the specified delivery channel. After the delivery has started, Config sends the following notifications using an Amazon SNS topic that you have specified.

 {ul
       {-  Notification of the start of the delivery.
           
            }
       {-  Notification of the completion of the delivery, if the delivery was successfully completed.
           
            }
       {-  Notification of delivery failure, if the delivery failed.
           
            }
       }
   *)

  
end

module DescribeAggregateComplianceByConfigRules : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_aggregate_compliance_by_config_rules_request ->
        (describe_aggregate_compliance_by_config_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns a list of compliant and noncompliant rules with the number of resources for compliant and noncompliant rules. Does not display rules that do not have compliance results. 

  The results can return an empty result page, but if you have a [nextToken], the results are displayed on the next page.
  
    *)

  
end

module DescribeAggregateComplianceByConformancePacks : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_aggregate_compliance_by_conformance_packs_request ->
        (describe_aggregate_compliance_by_conformance_packs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns a list of the conformance packs and their associated compliance status with the count of compliant and noncompliant Config rules within each conformance pack. Also returns the total rule count which includes compliant rules, noncompliant rules, and rules that cannot be evaluated due to insufficient data.

  The results can return an empty result page, but if you have a [nextToken], the results are displayed on the next page.
  
    *)

  
end

module DescribeAggregationAuthorizations : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_aggregation_authorizations_request ->
        (describe_aggregation_authorizations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** Returns a list of authorizations granted to various aggregator accounts and regions.
 *)

  
end

module DescribeComplianceByConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_compliance_by_config_rule_request ->
        (describe_compliance_by_config_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigRuleException of no_such_config_rule_exception
            
        ]
      ) result
  (** Indicates whether the specified Config rules are compliant. If a rule is noncompliant, this action returns the number of Amazon Web Services resources that do not comply with the rule.

 A rule is compliant if all of the evaluated resources comply with it. It is noncompliant if any of these resources do not comply.
 
  If Config has no current evaluation results for the rule, it returns [INSUFFICIENT_DATA]. This result might indicate one of the following conditions:
  
   {ul
         {-  Config has never invoked an evaluation for the rule. To check whether it has, use the [DescribeConfigRuleEvaluationStatus] action to get the [LastSuccessfulInvocationTime] and [LastFailedInvocationTime].
             
              }
         {-  The rule's Lambda function is failing to send evaluation results to Config. Verify that the role you assigned to your configuration recorder includes the [config:PutEvaluations] permission. If the rule is a custom rule, verify that the Lambda execution role includes the [config:PutEvaluations] permission.
             
              }
         {-  The rule's Lambda function has returned [NOT_APPLICABLE] for all evaluation results. This can occur if the resources were deleted or removed from the rule's scope.
             
              }
         }
   *)

  
end

module DescribeComplianceByResource : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_compliance_by_resource_request ->
        (describe_compliance_by_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** Indicates whether the specified Amazon Web Services resources are compliant. If a resource is noncompliant, this action returns the number of Config rules that the resource does not comply with.

 A resource is compliant if it complies with all the Config rules that evaluate it. It is noncompliant if it does not comply with one or more of these rules.
 
  If Config has no current evaluation results for the resource, it returns [INSUFFICIENT_DATA]. This result might indicate one of the following conditions about the rules that evaluate the resource:
  
   {ul
         {-  Config has never invoked an evaluation for the rule. To check whether it has, use the [DescribeConfigRuleEvaluationStatus] action to get the [LastSuccessfulInvocationTime] and [LastFailedInvocationTime].
             
              }
         {-  The rule's Lambda function is failing to send evaluation results to Config. Verify that the role that you assigned to your configuration recorder includes the [config:PutEvaluations] permission. If the rule is a custom rule, verify that the Lambda execution role includes the [config:PutEvaluations] permission.
             
              }
         {-  The rule's Lambda function has returned [NOT_APPLICABLE] for all evaluation results. This can occur if the resources were deleted or removed from the rule's scope.
             
              }
         }
   *)

  
end

module DescribeConfigRuleEvaluationStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_config_rule_evaluation_status_request ->
        (describe_config_rule_evaluation_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigRuleException of no_such_config_rule_exception
            
        ]
      ) result
  (** Returns status information for each of your Config managed rules. The status includes information such as the last time Config invoked the rule, the last time Config failed to invoke the rule, and the related error for the last failure.
 *)

  
end

module DescribeConfigRules : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_config_rules_request ->
        (describe_config_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigRuleException of no_such_config_rule_exception
            
        ]
      ) result
  (** Returns details about your Config rules.
 *)

  
end

module DescribeConfigurationAggregators : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_configuration_aggregators_request ->
        (describe_configuration_aggregators_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            
        ]
      ) result
  (** Returns the details of one or more configuration aggregators. If the configuration aggregator is not specified, this action returns the details for all the configuration aggregators associated with the account. 
 *)

  
end

module DescribeConfigurationAggregatorSourcesStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_configuration_aggregator_sources_status_request ->
        (describe_configuration_aggregator_sources_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            
        ]
      ) result
  (** Returns status information for sources within an aggregator. The status includes information about the last time Config verified authorization between the source account and an aggregator account. In case of a failure, the status contains the related error code or message. 
 *)

  
end

module DescribeConfigurationRecorders : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_configuration_recorders_request ->
        (describe_configuration_recorders_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
            
        ]
      ) result
  (** Returns the details for the specified configuration recorders. If the configuration recorder is not specified, this action returns the details for all configuration recorders associated with the account.

  You can specify only one configuration recorder for each Amazon Web Services Region for each account.
  
    *)

  
end

module DescribeConfigurationRecorderStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_configuration_recorder_status_request ->
        (describe_configuration_recorder_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
            
        ]
      ) result
  (** Returns the current status of the specified configuration recorder as well as the status of the last recording event for the recorder. If a configuration recorder is not specified, this action returns the status of all configuration recorders associated with the account.

  >You can specify only one configuration recorder for each Amazon Web Services Region for each account. For a detailed status of recording events over time, add your Config events to Amazon CloudWatch metrics and use CloudWatch metrics.
  
    *)

  
end

module DescribeConformancePackCompliance : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_conformance_pack_compliance_request ->
        (describe_conformance_pack_compliance_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigRuleInConformancePackException of no_such_config_rule_in_conformance_pack_exception
            | `NoSuchConformancePackException of no_such_conformance_pack_exception
            
        ]
      ) result
  (** Returns compliance details for each rule in that conformance pack.

  You must provide exact rule names.
  
    *)

  
end

module DescribeConformancePacks : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_conformance_packs_request ->
        (describe_conformance_packs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConformancePackException of no_such_conformance_pack_exception
            
        ]
      ) result
  (** Returns a list of one or more conformance packs.
 *)

  
end

module DescribeConformancePackStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_conformance_pack_status_request ->
        (describe_conformance_pack_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** Provides one or more conformance packs deployment status.

  If there are no conformance packs then you will see an empty result.
  
    *)

  
end

module DescribeDeliveryChannels : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_delivery_channels_request ->
        (describe_delivery_channels_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchDeliveryChannelException of no_such_delivery_channel_exception
            
        ]
      ) result
  (** Returns details about the specified delivery channel. If a delivery channel is not specified, this action returns the details of all delivery channels associated with the account.

  Currently, you can specify only one delivery channel per region in your account.
  
    *)

  
end

module DescribeDeliveryChannelStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_delivery_channel_status_request ->
        (describe_delivery_channel_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchDeliveryChannelException of no_such_delivery_channel_exception
            
        ]
      ) result
  (** Returns the current status of the specified delivery channel. If a delivery channel is not specified, this action returns the current status of all delivery channels associated with the account.

  Currently, you can specify only one delivery channel per region in your account.
  
    *)

  
end

module DescribeOrganizationConfigRules : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_organization_config_rules_request ->
        (describe_organization_config_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchOrganizationConfigRuleException of no_such_organization_config_rule_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            
        ]
      ) result
  (** Returns a list of organization Config rules. 

  When you specify the limit and the next token, you receive a paginated response.
  
   Limit and next token are not applicable if you specify organization Config rule names. It is only applicable, when you request all the organization Config rules.
   
     {i For accounts within an organization} 
    
     If you deploy an organizational rule or conformance pack in an organization administrator account, and then establish a delegated administrator and deploy an organizational rule or conformance pack in the delegated administrator account, you won't be able to see the organizational rule or conformance pack in the organization administrator account from the delegated administrator account or see the organizational rule or conformance pack in the delegated administrator account from organization administrator account. The [DescribeOrganizationConfigRules] and [DescribeOrganizationConformancePacks] APIs can only see and interact with the organization-related resource that were deployed from within the account calling those APIs.
     
       *)

  
end

module DescribeOrganizationConfigRuleStatuses : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_organization_config_rule_statuses_request ->
        (describe_organization_config_rule_statuses_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchOrganizationConfigRuleException of no_such_organization_config_rule_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            
        ]
      ) result
  (** Provides organization Config rule deployment status for an organization.

  The status is not considered successful until organization Config rule is successfully deployed in all the member accounts with an exception of excluded accounts.
  
   When you specify the limit and the next token, you receive a paginated response. Limit and next token are not applicable if you specify organization Config rule names. It is only applicable, when you request all the organization Config rules.
   
     *)

  
end

module DescribeOrganizationConformancePacks : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_organization_conformance_packs_request ->
        (describe_organization_conformance_packs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchOrganizationConformancePackException of no_such_organization_conformance_pack_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            
        ]
      ) result
  (** Returns a list of organization conformance packs. 

  When you specify the limit and the next token, you receive a paginated response. 
  
   Limit and next token are not applicable if you specify organization conformance packs names. They are only applicable, when you request all the organization conformance packs. 
   
     {i For accounts within an organization} 
    
     If you deploy an organizational rule or conformance pack in an organization administrator account, and then establish a delegated administrator and deploy an organizational rule or conformance pack in the delegated administrator account, you won't be able to see the organizational rule or conformance pack in the organization administrator account from the delegated administrator account or see the organizational rule or conformance pack in the delegated administrator account from organization administrator account. The [DescribeOrganizationConfigRules] and [DescribeOrganizationConformancePacks] APIs can only see and interact with the organization-related resource that were deployed from within the account calling those APIs.
     
       *)

  
end

module DescribeOrganizationConformancePackStatuses : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_organization_conformance_pack_statuses_request ->
        (describe_organization_conformance_pack_statuses_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchOrganizationConformancePackException of no_such_organization_conformance_pack_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            
        ]
      ) result
  (** Provides organization conformance pack deployment status for an organization. 

  The status is not considered successful until organization conformance pack is successfully deployed in all the member accounts with an exception of excluded accounts.
  
   When you specify the limit and the next token, you receive a paginated response. Limit and next token are not applicable if you specify organization conformance pack names. They are only applicable, when you request all the organization conformance packs.
   
     *)

  
end

module DescribePendingAggregationRequests : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_pending_aggregation_requests_request ->
        (describe_pending_aggregation_requests_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** Returns a list of all pending aggregation requests.
 *)

  
end

module DescribeRemediationConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_remediation_configurations_request ->
        (describe_remediation_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
  (** Returns the details of one or more remediation configurations.
 *)

  
end

module DescribeRemediationExceptions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_remediation_exceptions_request ->
        (describe_remediation_exceptions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** Returns the details of one or more remediation exceptions. A detailed view of a remediation exception for a set of resources that includes an explanation of an exception and the time when the exception will be deleted. When you specify the limit and the next token, you receive a paginated response. 

  Config generates a remediation exception when a problem occurs executing a remediation action to a specific resource. Remediation exceptions blocks auto-remediation until the exception is cleared.
  
   When you specify the limit and the next token, you receive a paginated response. 
   
    Limit and next token are not applicable if you request resources in batch. It is only applicable, when you request all resources.
    
      *)

  
end

module DescribeRemediationExecutionStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_remediation_execution_status_request ->
        (describe_remediation_execution_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchRemediationConfigurationException of no_such_remediation_configuration_exception
            
        ]
      ) result
  (** Provides a detailed view of a Remediation Execution for a set of resources including state, timestamps for when steps for the remediation execution occur, and any error messages for steps that have failed. When you specify the limit and the next token, you receive a paginated response.
 *)

  
end

module DescribeRetentionConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_retention_configurations_request ->
        (describe_retention_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchRetentionConfigurationException of no_such_retention_configuration_exception
            
        ]
      ) result
  (** Returns the details of one or more retention configurations. If the retention configuration name is not specified, this action returns the details for all the retention configurations for that account.

  Currently, Config supports only one retention configuration per region in your account.
  
    *)

  
end

module GetAggregateComplianceDetailsByConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
      get_aggregate_compliance_details_by_config_rule_request ->
        (get_aggregate_compliance_details_by_config_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns the evaluation results for the specified Config rule for a specific resource in a rule. The results indicate which Amazon Web Services resources were evaluated by the rule, when each resource was last evaluated, and whether each resource complies with the rule. 

  The results can return an empty result page. But if you have a [nextToken], the results are displayed on the next page.
  
    *)

  
end

module GetAggregateConfigRuleComplianceSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_aggregate_config_rule_compliance_summary_request ->
        (get_aggregate_config_rule_compliance_summary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns the number of compliant and noncompliant rules for one or more accounts and regions in an aggregator.

  The results can return an empty result page, but if you have a nextToken, the results are displayed on the next page.
  
    *)

  
end

module GetAggregateConformancePackComplianceSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_aggregate_conformance_pack_compliance_summary_request ->
        (get_aggregate_conformance_pack_compliance_summary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns the count of compliant and noncompliant conformance packs across all Amazon Web Services accounts and Amazon Web Services Regions in an aggregator. You can filter based on Amazon Web Services account ID or Amazon Web Services Region.

  The results can return an empty result page, but if you have a nextToken, the results are displayed on the next page.
  
    *)

  
end

module GetAggregateDiscoveredResourceCounts : sig
  val request :
    Smaws_Lib.Context.t ->
      get_aggregate_discovered_resource_counts_request ->
        (get_aggregate_discovered_resource_counts_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns the resource counts across accounts and regions that are present in your Config aggregator. You can request the resource counts by providing filters and GroupByKey.

 For example, if the input contains accountID 12345678910 and region us-east-1 in filters, the API returns the count of resources in account ID 12345678910 and region us-east-1. If the input contains ACCOUNT_ID as a GroupByKey, the API returns resource counts for all source accounts that are present in your aggregator.
  *)

  
end

module GetAggregateResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      get_aggregate_resource_config_request ->
        (get_aggregate_resource_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `OversizedConfigurationItemException of oversized_configuration_item_exception
            | `ResourceNotDiscoveredException of resource_not_discovered_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns configuration item that is aggregated for your specific resource in a specific source account and region.
 *)

  
end

module GetComplianceDetailsByConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_details_by_config_rule_request ->
        (get_compliance_details_by_config_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigRuleException of no_such_config_rule_exception
            
        ]
      ) result
  (** Returns the evaluation results for the specified Config rule. The results indicate which Amazon Web Services resources were evaluated by the rule, when each resource was last evaluated, and whether each resource complies with the rule.
 *)

  
end

module GetComplianceDetailsByResource : sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_details_by_resource_request ->
        (get_compliance_details_by_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** Returns the evaluation results for the specified Amazon Web Services resource. The results indicate which Config rules were used to evaluate the resource, when each rule was last invoked, and whether the resource complies with each rule.
 *)

  
end

module GetComplianceSummaryByConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (get_compliance_summary_by_config_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
  (** Returns the number of Config rules that are compliant and noncompliant, up to a maximum of 25 for each.
 *)

  
end

module GetComplianceSummaryByResourceType : sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_summary_by_resource_type_request ->
        (get_compliance_summary_by_resource_type_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** Returns the number of resources that are compliant and the number that are noncompliant. You can specify one or more resource types to get these numbers for each resource type. The maximum number returned is 100.
 *)

  
end

module GetConformancePackComplianceDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      get_conformance_pack_compliance_details_request ->
        (get_conformance_pack_compliance_details_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigRuleInConformancePackException of no_such_config_rule_in_conformance_pack_exception
            | `NoSuchConformancePackException of no_such_conformance_pack_exception
            
        ]
      ) result
  (** Returns compliance details of a conformance pack for all Amazon Web Services resources that are monitered by conformance pack.
 *)

  
end

module GetConformancePackComplianceSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_conformance_pack_compliance_summary_request ->
        (get_conformance_pack_compliance_summary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConformancePackException of no_such_conformance_pack_exception
            
        ]
      ) result
  (** Returns compliance details for the conformance pack based on the cumulative compliance results of all the rules in that conformance pack.
 *)

  
end

module GetCustomRulePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_custom_rule_policy_request ->
        (get_custom_rule_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigRuleException of no_such_config_rule_exception
            
        ]
      ) result
  (** Returns the policy definition containing the logic for your Config Custom Policy rule.
 *)

  
end

module GetDiscoveredResourceCounts : sig
  val request :
    Smaws_Lib.Context.t ->
      get_discovered_resource_counts_request ->
        (get_discovered_resource_counts_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns the resource types, the number of each resource type, and the total number of resources that Config is recording in this region for your Amazon Web Services account. 

  {b Example} 
 
  {ol
        {-  Config is recording three resource types in the US East (Ohio) Region for your account: 25 EC2 instances, 20 IAM users, and 15 S3 buckets.
            
             }
        {-  You make a call to the [GetDiscoveredResourceCounts] action and specify that you want all resource types. 
            
             }
        {-  Config returns the following:
            
             {ul
                   {-  The resource types (EC2 instances, IAM users, and S3 buckets).
                       
                        }
                   {-  The number of each resource type (25, 20, and 15).
                       
                        }
                   {-  The total number of all resources (60).
                       
                        }
                   
         }
          }
        }
   The response is paginated. By default, Config lists 100 [ResourceCount] objects on each page. You can customize this number with the [limit] parameter. The response includes a [nextToken] string. To get the next page of results, run the request again and specify the string for the [nextToken] parameter.
   
     If you make a call to the [GetDiscoveredResourceCounts] action, you might not immediately receive resource counts in the following situations:
     
      {ul
            {-  You are a new Config customer.
                
                 }
            {-  You just enabled resource recording.
                
                 }
            }
   It might take a few minutes for Config to record and count your resources. Wait a few minutes and then retry the [GetDiscoveredResourceCounts] action. 
   
     *)

  
end

module GetOrganizationConfigRuleDetailedStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_organization_config_rule_detailed_status_request ->
        (get_organization_config_rule_detailed_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchOrganizationConfigRuleException of no_such_organization_config_rule_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            
        ]
      ) result
  (** Returns detailed status for each member account within an organization for a given organization Config rule.
 *)

  
end

module GetOrganizationConformancePackDetailedStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_organization_conformance_pack_detailed_status_request ->
        (get_organization_conformance_pack_detailed_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchOrganizationConformancePackException of no_such_organization_conformance_pack_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            
        ]
      ) result
  (** Returns detailed status for each member account within an organization for a given organization conformance pack.
 *)

  
end

module GetOrganizationCustomRulePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_organization_custom_rule_policy_request ->
        (get_organization_custom_rule_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchOrganizationConfigRuleException of no_such_organization_config_rule_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            
        ]
      ) result
  (** Returns the policy definition containing the logic for your organization Config Custom Policy rule.
 *)

  
end

module GetResourceConfigHistory : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_config_history_request ->
        (get_resource_config_history_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidTimeRangeException of invalid_time_range_exception
            | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
            | `ResourceNotDiscoveredException of resource_not_discovered_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (**  For accurate reporting on the compliance status, you must record the [AWS::Config::ResourceCompliance] resource type. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html}Selecting Which Resources Config Records}.
 
   Returns a list of [ConfigurationItems] for the specified resource. The list contains details about each state of the resource during the specified time interval. If you specified a retention period to retain your [ConfigurationItems] between a minimum of 30 days and a maximum of 7 years (2557 days), Config returns the [ConfigurationItems] for the specified retention period. 
   
    The response is paginated. By default, Config returns a limit of 10 configuration items per page. You can customize this number with the [limit] parameter. The response includes a [nextToken] string. To get the next page of results, run the request again and specify the string for the [nextToken] parameter.
    
      Each call to the API is limited to span a duration of seven days. It is likely that the number of records returned is smaller than the specified [limit]. In such cases, you can make another call, using the [nextToken].
      
        *)

  
end

module GetResourceEvaluationSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_evaluation_summary_request ->
        (get_resource_evaluation_summary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns a summary of resource evaluation for the specified resource evaluation ID from the proactive rules that were run. The results indicate which evaluation context was used to evaluate the rules, which resource details were evaluated, the evaluation mode that was run, and whether the resource details comply with the configuration of the proactive rules. 

  To see additional information about the evaluation result, such as which rule flagged a resource as NON_COMPLIANT, use the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_GetComplianceDetailsByResource.html}GetComplianceDetailsByResource} API. For more information, see the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_GetResourceEvaluationSummary.html#API_GetResourceEvaluationSummary_Examples}Examples} section.
  
    *)

  
end

module GetStoredQuery : sig
  val request :
    Smaws_Lib.Context.t ->
      get_stored_query_request ->
        (get_stored_query_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns the details of a specific stored query.
 *)

  
end

module ListAggregateDiscoveredResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_aggregate_discovered_resources_request ->
        (list_aggregate_discovered_resources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Accepts a resource type and returns a list of resource identifiers that are aggregated for a specific resource type across accounts and regions. A resource identifier includes the resource type, ID, (if available) the custom resource name, source account, and source region. You can narrow the results to include only resources that have specific resource IDs, or a resource name, or source account ID, or source region.

 For example, if the input consists of accountID 12345678910 and the region is us-east-1 for resource type [AWS::EC2::Instance] then the API returns all the EC2 instance identifiers of accountID 12345678910 and region us-east-1.
  *)

  
end

module ListConformancePackComplianceScores : sig
  val request :
    Smaws_Lib.Context.t ->
      list_conformance_pack_compliance_scores_request ->
        (list_conformance_pack_compliance_scores_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** Returns a list of conformance pack compliance scores. A compliance score is the percentage of the number of compliant rule-resource combinations in a conformance pack compared to the number of total possible rule-resource combinations in the conformance pack. This metric provides you with a high-level view of the compliance state of your conformance packs. You can use it to identify, investigate, and understand the level of compliance in your conformance packs.

  Conformance packs with no evaluation results will have a compliance score of [INSUFFICIENT_DATA].
  
    *)

  
end

module ListDiscoveredResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_discovered_resources_request ->
        (list_discovered_resources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Accepts a resource type and returns a list of resource identifiers for the resources of that type. A resource identifier includes the resource type, ID, and (if available) the custom resource name. The results consist of resources that Config has discovered, including those that Config is not currently recording. You can narrow the results to include only resources that have specific resource IDs or a resource name.

  You can specify either resource IDs or a resource name, but not both, in the same request.
  
    The response is paginated. By default, Config lists 100 resource identifiers on each page. You can customize this number with the [limit] parameter. The response includes a [nextToken] string. To get the next page of results, run the request again and specify the string for the [nextToken] parameter.
     *)

  
end

module ListResourceEvaluations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_evaluations_request ->
        (list_resource_evaluations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `InvalidTimeRangeException of invalid_time_range_exception
            
        ]
      ) result
  (** Returns a list of proactive resource evaluations.
 *)

  
end

module ListStoredQueries : sig
  val request :
    Smaws_Lib.Context.t ->
      list_stored_queries_request ->
        (list_stored_queries_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Lists the stored queries for a single Amazon Web Services account and a single Amazon Web Services Region. The default is 100. 
 *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** List the tags for Config resource.
 *)

  
end

module PutAggregationAuthorization : sig
  val request :
    Smaws_Lib.Context.t ->
      put_aggregation_authorization_request ->
        (put_aggregation_authorization_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** Authorizes the aggregator account and region to collect data from the source account and region. 

   [PutAggregationAuthorization] is an idempotent API. Subsequent requests won’t create a duplicate resource if one was already created. If a following request has different [tags] values, Config will ignore these differences and treat it as an idempotent request of the previous. In this case, [tags] will not be updated, even if they are different.
  
    *)

  
end

module PutConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
      put_config_rule_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientPermissionsException of insufficient_permissions_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `MaxNumberOfConfigRulesExceededException of max_number_of_config_rules_exceeded_exception
            | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** Adds or updates an Config rule to evaluate if your Amazon Web Services resources comply with your desired configurations. For information on how many Config rules you can have per account, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.

 There are two types of rules: {i Config Managed Rules} and {i Config Custom Rules}. You can use [PutConfigRule] to create both Config Managed Rules and Config Custom Rules.
 
  Config Managed Rules are predefined, customizable rules created by Config. For a list of managed rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html}List of Config Managed Rules}. If you are adding an Config managed rule, you must specify the rule's identifier for the [SourceIdentifier] key.
  
   Config Custom Rules are rules that you create from scratch. There are two ways to create Config custom rules: with Lambda functions ({{:https://docs.aws.amazon.com/config/latest/developerguide/gettingstarted-concepts.html#gettingstarted-concepts-function} Lambda Developer Guide}) and with Guard ({{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}), a policy-as-code language. Config custom rules created with Lambda are called {i Config Custom Lambda Rules} and Config custom rules created with Guard are called {i Config Custom Policy Rules}.
   
    If you are adding a new Config Custom Lambda rule, you first need to create an Lambda function that the rule invokes to evaluate your resources. When you use [PutConfigRule] to add a Custom Lambda rule to Config, you must specify the Amazon Resource Name (ARN) that Lambda assigns to the function. You specify the ARN in the [SourceIdentifier] key. This key is part of the [Source] object, which is part of the [ConfigRule] object. 
    
     For any new Config rule that you add, specify the [ConfigRuleName] in the [ConfigRule] object. Do not specify the [ConfigRuleArn] or the [ConfigRuleId]. These values are generated by Config for new rules.
     
      If you are updating a rule that you added previously, you can specify the rule by [ConfigRuleName], [ConfigRuleId], or [ConfigRuleArn] in the [ConfigRule] data type that you use in this request.
      
       For more information about developing and using Config rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html}Evaluating Resources with Config Rules} in the {i Config Developer Guide}.
       
          [PutConfigRule] is an idempotent API. Subsequent requests won’t create a duplicate resource if one was already created. If a following request has different [tags] values, Config will ignore these differences and treat it as an idempotent request of the previous. In this case, [tags] will not be updated, even if they are different.
         
           *)

  
end

module PutConfigurationAggregator : sig
  val request :
    Smaws_Lib.Context.t ->
      put_configuration_aggregator_request ->
        (put_configuration_aggregator_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            | `InvalidRoleException of invalid_role_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NoAvailableOrganizationException of no_available_organization_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            | `OrganizationAllFeaturesNotEnabledException of organization_all_features_not_enabled_exception
            
        ]
      ) result
  (** Creates and updates the configuration aggregator with the selected source accounts and regions. The source account can be individual account(s) or an organization.

  [accountIds] that are passed will be replaced with existing accounts. If you want to add additional accounts into the aggregator, call [DescribeConfigurationAggregators] to get the previous accounts and then append new ones.
 
   Config should be enabled in source accounts and regions you want to aggregate.
   
    If your source type is an organization, you must be signed in to the management account or a registered delegated administrator and all the features must be enabled in your organization. If the caller is a management account, Config calls [EnableAwsServiceAccess] API to enable integration between Config and Organizations. If the caller is a registered delegated administrator, Config calls [ListDelegatedAdministrators] API to verify whether the caller is a valid delegated administrator.
    
     To register a delegated administrator, see {{:https://docs.aws.amazon.com/config/latest/developerguide/set-up-aggregator-cli.html#register-a-delegated-administrator-cli}Register a Delegated Administrator} in the {i Config developer guide}. 
     
         [PutConfigurationAggregator] is an idempotent API. Subsequent requests won’t create a duplicate resource if one was already created. If a following request has different [tags] values, Config will ignore these differences and treat it as an idempotent request of the previous. In this case, [tags] will not be updated, even if they are different.
        
          *)

  
end

module PutConfigurationRecorder : sig
  val request :
    Smaws_Lib.Context.t ->
      put_configuration_recorder_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidConfigurationRecorderNameException of invalid_configuration_recorder_name_exception
            | `InvalidRecordingGroupException of invalid_recording_group_exception
            | `InvalidRoleException of invalid_role_exception
            | `MaxNumberOfConfigurationRecordersExceededException of max_number_of_configuration_recorders_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Creates a new configuration recorder to record configuration changes for specified resource types.

 You can also use this action to change the [roleARN] or the [recordingGroup] of an existing recorder. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/stop-start-recorder.html} {b Managing the Configuration Recorder} } in the {i Config Developer Guide}.
 
   You can specify only one configuration recorder for each Amazon Web Services Region for each account.
   
    If the configuration recorder does not have the [recordingGroup] field specified, the default is to record all supported resource types.
    
      *)

  
end

module PutConformancePack : sig
  val request :
    Smaws_Lib.Context.t ->
      put_conformance_pack_request ->
        (put_conformance_pack_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConformancePackTemplateValidationException of conformance_pack_template_validation_exception
            | `InsufficientPermissionsException of insufficient_permissions_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `MaxNumberOfConformancePacksExceededException of max_number_of_conformance_packs_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** Creates or updates a conformance pack. A conformance pack is a collection of Config rules that can be easily deployed in an account and a region and across an organization. For information on how many conformance packs you can have per account, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.

 This API creates a service-linked role [AWSServiceRoleForConfigConforms] in your account. The service-linked role is created only when the role does not exist in your account. 
 
   You must specify only one of the follow parameters: [TemplateS3Uri], [TemplateBody] or [TemplateSSMDocumentDetails].
   
     *)

  
end

module PutDeliveryChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      put_delivery_channel_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientDeliveryPolicyException of insufficient_delivery_policy_exception
            | `InvalidDeliveryChannelNameException of invalid_delivery_channel_name_exception
            | `InvalidS3KeyPrefixException of invalid_s3_key_prefix_exception
            | `InvalidS3KmsKeyArnException of invalid_s3_kms_key_arn_exception
            | `InvalidSNSTopicARNException of invalid_sns_topic_arn_exception
            | `MaxNumberOfDeliveryChannelsExceededException of max_number_of_delivery_channels_exceeded_exception
            | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
            | `NoSuchBucketException of no_such_bucket_exception
            
        ]
      ) result
  (** Creates a delivery channel object to deliver configuration information and other compliance information to an Amazon S3 bucket and Amazon SNS topic. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/notifications-for-AWS-Config.html}Notifications that Config Sends to an Amazon SNS topic}.

 Before you can create a delivery channel, you must create a configuration recorder.
 
  You can use this action to change the Amazon S3 bucket or an Amazon SNS topic of the existing delivery channel. To change the Amazon S3 bucket or an Amazon SNS topic, call this action and specify the changed values for the S3 bucket and the SNS topic. If you specify a different value for either the S3 bucket or the SNS topic, this action will keep the existing value for the parameter that is not changed.
  
    You can have only one delivery channel per region in your account.
    
      *)

  
end

module PutEvaluations : sig
  val request :
    Smaws_Lib.Context.t ->
      put_evaluations_request ->
        (put_evaluations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            | `InvalidResultTokenException of invalid_result_token_exception
            | `NoSuchConfigRuleException of no_such_config_rule_exception
            
        ]
      ) result
  (** Used by an Lambda function to deliver evaluation results to Config. This action is required in every Lambda function that is invoked by an Config rule.
 *)

  
end

module PutExternalEvaluation : sig
  val request :
    Smaws_Lib.Context.t ->
      put_external_evaluation_request ->
        (put_external_evaluation_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigRuleException of no_such_config_rule_exception
            
        ]
      ) result
  (** Add or updates the evaluations for process checks. This API checks if the rule is a process check when the name of the Config rule is provided.
 *)

  
end

module PutOrganizationConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
      put_organization_config_rule_request ->
        (put_organization_config_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientPermissionsException of insufficient_permissions_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `MaxNumberOfOrganizationConfigRulesExceededException of max_number_of_organization_config_rules_exceeded_exception
            | `NoAvailableOrganizationException of no_available_organization_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            | `OrganizationAllFeaturesNotEnabledException of organization_all_features_not_enabled_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Adds or updates an Config rule for your entire organization to evaluate if your Amazon Web Services resources comply with your desired configurations. For information on how many organization Config rules you can have per account, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.

  Only a management account and a delegated administrator can create or update an organization Config rule. When calling this API with a delegated administrator, you must ensure Organizations [ListDelegatedAdministrator] permissions are added. An organization can have up to 3 delegated administrators.
 
  This API enables organization service access through the [EnableAWSServiceAccess] action and creates a service-linked role [AWSServiceRoleForConfigMultiAccountSetup] in the management or delegated administrator account of your organization. The service-linked role is created only when the role does not exist in the caller account. Config verifies the existence of role with [GetRole] action.
  
   To use this API with delegated administrator, register a delegated administrator by calling Amazon Web Services Organization [register-delegated-administrator] for [config-multiaccountsetup.amazonaws.com]. 
   
    There are two types of rules: {i Config Managed Rules} and {i Config Custom Rules}. You can use [PutOrganizationConfigRule] to create both Config Managed Rules and Config Custom Rules.
    
     Config Managed Rules are predefined, customizable rules created by Config. For a list of managed rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html}List of Config Managed Rules}. If you are adding an Config managed rule, you must specify the rule's identifier for the [RuleIdentifier] key.
     
      Config Custom Rules are rules that you create from scratch. There are two ways to create Config custom rules: with Lambda functions ({{:https://docs.aws.amazon.com/config/latest/developerguide/gettingstarted-concepts.html#gettingstarted-concepts-function} Lambda Developer Guide}) and with Guard ({{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}), a policy-as-code language. Config custom rules created with Lambda are called {i Config Custom Lambda Rules} and Config custom rules created with Guard are called {i Config Custom Policy Rules}.
      
       If you are adding a new Config Custom Lambda rule, you first need to create an Lambda function in the management account or a delegated administrator that the rule invokes to evaluate your resources. You also need to create an IAM role in the managed account that can be assumed by the Lambda function. When you use [PutOrganizationConfigRule] to add a Custom Lambda rule to Config, you must specify the Amazon Resource Name (ARN) that Lambda assigns to the function.
       
         Prerequisite: Ensure you call [EnableAllFeatures] API to enable all features in an organization.
         
          Make sure to specify one of either [OrganizationCustomPolicyRuleMetadata] for Custom Policy rules, [OrganizationCustomRuleMetadata] for Custom Lambda rules, or [OrganizationManagedRuleMetadata] for managed rules.
          
            *)

  
end

module PutOrganizationConformancePack : sig
  val request :
    Smaws_Lib.Context.t ->
      put_organization_conformance_pack_request ->
        (put_organization_conformance_pack_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientPermissionsException of insufficient_permissions_exception
            | `MaxNumberOfOrganizationConformancePacksExceededException of max_number_of_organization_conformance_packs_exceeded_exception
            | `NoAvailableOrganizationException of no_available_organization_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            | `OrganizationAllFeaturesNotEnabledException of organization_all_features_not_enabled_exception
            | `OrganizationConformancePackTemplateValidationException of organization_conformance_pack_template_validation_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Deploys conformance packs across member accounts in an Amazon Web Services Organization. For information on how many organization conformance packs and how many Config rules you can have per account, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service Limits} } in the {i Config Developer Guide}.

 Only a management account and a delegated administrator can call this API. When calling this API with a delegated administrator, you must ensure Organizations [ListDelegatedAdministrator] permissions are added. An organization can have up to 3 delegated administrators.
 
  This API enables organization service access for [config-multiaccountsetup.amazonaws.com] through the [EnableAWSServiceAccess] action and creates a service-linked role [AWSServiceRoleForConfigMultiAccountSetup] in the management or delegated administrator account of your organization. The service-linked role is created only when the role does not exist in the caller account. To use this API with delegated administrator, register a delegated administrator by calling Amazon Web Services Organization [register-delegate-admin] for [config-multiaccountsetup.amazonaws.com].
  
    Prerequisite: Ensure you call [EnableAllFeatures] API to enable all features in an organization.
    
     You must specify either the [TemplateS3Uri] or the [TemplateBody] parameter, but not both. If you provide both Config uses the [TemplateS3Uri] parameter and ignores the [TemplateBody] parameter.
     
      Config sets the state of a conformance pack to CREATE_IN_PROGRESS and UPDATE_IN_PROGRESS until the conformance pack is created or updated. You cannot update a conformance pack while it is in this state.
      
        *)

  
end

module PutRemediationConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      put_remediation_configurations_request ->
        (put_remediation_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientPermissionsException of insufficient_permissions_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** Adds or updates the remediation configuration with a specific Config rule with the selected target or action. The API creates the [RemediationConfiguration] object for the Config rule. The Config rule must already exist for you to add a remediation configuration. The target (SSM document) must exist and have permissions to use the target. 

   {b Be aware of backward incompatible changes} 
  
   If you make backward incompatible changes to the SSM document, you must call this again to ensure the remediations can run.
   
    This API does not support adding remediation configurations for service-linked Config Rules such as Organization Config rules, the rules deployed by conformance packs, and rules deployed by Amazon Web Services Security Hub.
    
        {b Required fields} 
       
        For manual remediation configuration, you need to provide a value for [automationAssumeRole] or use a value in the [assumeRole]field to remediate your resources. The SSM automation document can use either as long as it maps to a valid parameter.
        
         However, for automatic remediation configuration, the only valid [assumeRole] field value is [AutomationAssumeRole] and you need to provide a value for [AutomationAssumeRole] to remediate your resources.
         
             {b Auto remediation can be initiated even for compliant resources} 
            
             If you enable auto remediation for a specific Config rule using the {{:https://docs.aws.amazon.com/config/latest/APIReference/emAPI_PutRemediationConfigurations.html}PutRemediationConfigurations} API or the Config console, it initiates the remediation process for all non-compliant resources for that specific rule. The auto remediation process relies on the compliance data snapshot which is captured on a periodic basis. Any non-compliant resource that is updated between the snapshot schedule will continue to be remediated based on the last known compliance data snapshot.
             
              This means that in some cases auto remediation can be initiated even for compliant resources, since the bootstrap processor uses a database that can have stale evaluation results based on the last known compliance data snapshot.
              
                *)

  
end

module PutRemediationExceptions : sig
  val request :
    Smaws_Lib.Context.t ->
      put_remediation_exceptions_request ->
        (put_remediation_exceptions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientPermissionsException of insufficient_permissions_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** A remediation exception is when a specified resource is no longer considered for auto-remediation. This API adds a new exception or updates an existing exception for a specified resource with a specified Config rule. 

   {b Exceptions block auto remediation} 
  
   Config generates a remediation exception when a problem occurs running a remediation action for a specified resource. Remediation exceptions blocks auto-remediation until the exception is cleared.
   
       {b Manual remediation is recommended when placing an exception} 
      
       When placing an exception on an Amazon Web Services resource, it is recommended that remediation is set as manual remediation until the given Config rule for the specified resource evaluates the resource as [NON_COMPLIANT]. Once the resource has been evaluated as [NON_COMPLIANT], you can add remediation exceptions and change the remediation type back from Manual to Auto if you want to use auto-remediation. Otherwise, using auto-remediation before a [NON_COMPLIANT] evaluation result can delete resources before the exception is applied.
       
           {b Exceptions can only be performed on non-compliant resources} 
          
           Placing an exception can only be performed on resources that are [NON_COMPLIANT]. If you use this API for [COMPLIANT] resources or resources that are [NOT_APPLICABLE], a remediation exception will not be generated. For more information on the conditions that initiate the possible Config evaluation results, see {{:https://docs.aws.amazon.com/config/latest/developerguide/config-concepts.html#aws-config-rules}Concepts | Config Rules} in the {i Config Developer Guide}.
           
               {b Auto remediation can be initiated even for compliant resources} 
              
               If you enable auto remediation for a specific Config rule using the {{:https://docs.aws.amazon.com/config/latest/APIReference/emAPI_PutRemediationConfigurations.html}PutRemediationConfigurations} API or the Config console, it initiates the remediation process for all non-compliant resources for that specific rule. The auto remediation process relies on the compliance data snapshot which is captured on a periodic basis. Any non-compliant resource that is updated between the snapshot schedule will continue to be remediated based on the last known compliance data snapshot.
               
                This means that in some cases auto remediation can be initiated even for compliant resources, since the bootstrap processor uses a database that can have stale evaluation results based on the last known compliance data snapshot.
                
                  *)

  
end

module PutResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_config_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientPermissionsException of insufficient_permissions_exception
            | `MaxActiveResourcesExceededException of max_active_resources_exceeded_exception
            | `NoRunningConfigurationRecorderException of no_running_configuration_recorder_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Records the configuration state for the resource provided in the request. The configuration state of a resource is represented in Config as Configuration Items. Once this API records the configuration item, you can retrieve the list of configuration items for the custom resource type using existing Config APIs. 

  The custom resource type must be registered with CloudFormation. This API accepts the configuration item registered with CloudFormation.
  
   When you call this API, Config only stores configuration state of the resource provided in the request. This API does not change or remediate the configuration of the resource. 
   
    Write-only schema properites are not recorded as part of the published configuration item.
    
      *)

  
end

module PutRetentionConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      put_retention_configuration_request ->
        (put_retention_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            | `MaxNumberOfRetentionConfigurationsExceededException of max_number_of_retention_configurations_exceeded_exception
            
        ]
      ) result
  (** Creates and updates the retention configuration with details about retention period (number of days) that Config stores your historical information. The API creates the [RetentionConfiguration] object and names the object as {b default}. When you have a [RetentionConfiguration] object named {b default}, calling the API modifies the default object. 

  Currently, Config supports only one retention configuration per region in your account.
  
    *)

  
end

module PutStoredQuery : sig
  val request :
    Smaws_Lib.Context.t ->
      put_stored_query_request ->
        (put_stored_query_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceConcurrentModificationException of resource_concurrent_modification_exception
            | `TooManyTagsException of too_many_tags_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Saves a new query or updates an existing saved query. The [QueryName] must be unique for a single Amazon Web Services account and a single Amazon Web Services Region. You can create upto 300 queries in a single Amazon Web Services account and a single Amazon Web Services Region.

   [PutStoredQuery] is an idempotent API. Subsequent requests won’t create a duplicate resource if one was already created. If a following request has different [tags] values, Config will ignore these differences and treat it as an idempotent request of the previous. In this case, [tags] will not be updated, even if they are different.
  
    *)

  
end

module SelectAggregateResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      select_aggregate_resource_config_request ->
        (select_aggregate_resource_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidExpressionException of invalid_expression_exception
            | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            
        ]
      ) result
  [@@ocaml.doc {| Accepts a structured query language (SQL) SELECT command and an aggregator to query configuration state of Amazon Web Services resources across multiple accounts and regions, performs the corresponding search, and returns resource configurations matching the properties.

 For more information about query components, see the {{:https://docs.aws.amazon.com/config/latest/developerguide/query-components.html} {b Query Components} } section in the {i Config Developer Guide}.
 
   If you run an aggregation query (i.e., using [GROUP BY] or using aggregate functions such as [COUNT]; e.g., [SELECT resourceId, COUNT(*) WHERE resourceType = 'AWS::IAM::Role' GROUP BY resourceId]) and do not specify the [MaxResults] or the [Limit] query parameters, the default page size is set to 500.
   
    If you run a non-aggregation query (i.e., not using [GROUP BY] or aggregate function; e.g., [SELECT * WHERE resourceType = 'AWS::IAM::Role']) and do not specify the [MaxResults] or the [Limit] query parameters, the default page size is set to 25.
    
      |}]

  
end

module SelectResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      select_resource_config_request ->
        (select_resource_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidExpressionException of invalid_expression_exception
            | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            
        ]
      ) result
  (** Accepts a structured query language (SQL) [SELECT] command, performs the corresponding search, and returns resource configurations matching the properties.

 For more information about query components, see the {{:https://docs.aws.amazon.com/config/latest/developerguide/query-components.html} {b Query Components} } section in the {i Config Developer Guide}.
  *)

  
end

module StartConfigRulesEvaluation : sig
  val request :
    Smaws_Lib.Context.t ->
      start_config_rules_evaluation_request ->
        (start_config_rules_evaluation_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NoSuchConfigRuleException of no_such_config_rule_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** Runs an on-demand evaluation for the specified Config rules against the last known configuration state of the resources. Use [StartConfigRulesEvaluation] when you want to test that a rule you updated is working as expected. [StartConfigRulesEvaluation] does not re-record the latest configuration state for your resources. It re-runs an evaluation against the last known state of your resources. 

 You can specify up to 25 Config rules per request. 
 
  An existing [StartConfigRulesEvaluation] call for the specified rules must complete before you can call the API again. If you chose to have Config stream to an Amazon SNS topic, you will receive a [ConfigRuleEvaluationStarted] notification when the evaluation starts.
  
    You don't need to call the [StartConfigRulesEvaluation] API to run an evaluation for a new rule. When you create a rule, Config evaluates your resources against the rule automatically. 
    
      The [StartConfigRulesEvaluation] API is useful if you want to run on-demand evaluations, such as the following example:
      
       {ol
             {-  You have a custom rule that evaluates your IAM resources every 24 hours.
                 
                  }
             {-  You update your Lambda function to add additional conditions to your rule.
                 
                  }
             {-  Instead of waiting for the next periodic evaluation, you call the [StartConfigRulesEvaluation] API.
                 
                  }
             {-  Config invokes your Lambda function and evaluates your IAM resources.
                 
                  }
             {-  Your custom rule will still run periodic evaluations every 24 hours.
                 
                  }
             }
   *)

  
end

module StartConfigurationRecorder : sig
  val request :
    Smaws_Lib.Context.t ->
      start_configuration_recorder_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoAvailableDeliveryChannelException of no_available_delivery_channel_exception
            | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
            
        ]
      ) result
  (** Starts recording configurations of the Amazon Web Services resources you have selected to record in your Amazon Web Services account.

 You must have created at least one delivery channel to successfully start the configuration recorder.
  *)

  
end

module StartRemediationExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      start_remediation_execution_request ->
        (start_remediation_execution_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientPermissionsException of insufficient_permissions_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchRemediationConfigurationException of no_such_remediation_configuration_exception
            
        ]
      ) result
  (** Runs an on-demand remediation for the specified Config rules against the last known remediation configuration. It runs an execution against the current state of your resources. Remediation execution is asynchronous.

 You can specify up to 100 resource keys per request. An existing StartRemediationExecution call for the specified resource keys must complete before you can call the API again.
  *)

  
end

module StartResourceEvaluation : sig
  val request :
    Smaws_Lib.Context.t ->
      start_resource_evaluation_request ->
        (start_resource_evaluation_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `IdempotentParameterMismatch of idempotent_parameter_mismatch
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  [@@ocaml.doc {| Runs an on-demand evaluation for the specified resource to determine whether the resource details will comply with configured Config rules. You can also use it for evaluation purposes. Config recommends using an evaluation context. It runs an execution against the resource details with all of the Config rules in your account that match with the specified proactive mode and resource type.

  Ensure you have the [cloudformation:DescribeType] role setup to validate the resource type schema.
  
   You can find the {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html}Resource type schema} in "{i Amazon Web Services public extensions}" within the CloudFormation registry or with the following CLI commmand: [aws cloudformation describe-type --type-name "AWS::S3::Bucket" --type RESOURCE].
   
    For more information, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry.html#registry-view}Managing extensions through the CloudFormation registry} and {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services resource and property types reference} in the CloudFormation User Guide.
    
      |}]

  
end

module StopConfigurationRecorder : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_configuration_recorder_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
            
        ]
      ) result
  (** Stops recording configurations of the Amazon Web Services resources you have selected to record in your Amazon Web Services account.
 *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyTagsException of too_many_tags_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Associates the specified tags to a resource with the specified resourceArn. If existing tags on a resource are not specified in the request parameters, they are not changed. If existing tags are specified, however, then their values will be updated. When a resource is deleted, the tags associated with that resource are deleted as well.
 *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Deletes specified tags from a resource.
 *)

  
end

