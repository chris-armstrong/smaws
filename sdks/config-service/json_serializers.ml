open Smaws_Lib.Json.SerializeHelpers
open Types

let ar_n_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson
let aggregator_region_list_to_yojson tree = list_to_yojson string__to_yojson tree
let boolean__to_yojson = bool_to_yojson
let account_id_to_yojson = string_to_yojson

let account_aggregation_source_account_list_to_yojson tree =
  list_to_yojson account_id_to_yojson tree

let account_aggregation_source_to_yojson (x : account_aggregation_source) =
  assoc_to_yojson
    [
      ("AccountIds", Some (account_aggregation_source_account_list_to_yojson x.account_ids));
      ("AllAwsRegions", option_to_yojson boolean__to_yojson x.all_aws_regions);
      ("AwsRegions", option_to_yojson aggregator_region_list_to_yojson x.aws_regions);
    ]

let account_aggregation_source_list_to_yojson tree =
  list_to_yojson account_aggregation_source_to_yojson tree

let aws_region_to_yojson = string_to_yojson
let integer_to_yojson = int_to_yojson

let compliance_contributor_count_to_yojson (x : compliance_contributor_count) =
  assoc_to_yojson
    [
      ("CappedCount", option_to_yojson integer_to_yojson x.capped_count);
      ("CapExceeded", option_to_yojson boolean__to_yojson x.cap_exceeded);
    ]

let compliance_type_to_yojson (x : compliance_type) =
  match x with
  | Compliant -> `String "COMPLIANT"
  | Non_Compliant -> `String "NON_COMPLIANT"
  | Not_Applicable -> `String "NOT_APPLICABLE"
  | Insufficient_Data -> `String "INSUFFICIENT_DATA"

let compliance_to_yojson (x : compliance) =
  assoc_to_yojson
    [
      ("ComplianceType", option_to_yojson compliance_type_to_yojson x.compliance_type);
      ( "ComplianceContributorCount",
        option_to_yojson compliance_contributor_count_to_yojson x.compliance_contributor_count );
    ]

let config_rule_name_to_yojson = string_to_yojson

let aggregate_compliance_by_config_rule_to_yojson (x : aggregate_compliance_by_config_rule) =
  assoc_to_yojson
    [
      ("ConfigRuleName", option_to_yojson config_rule_name_to_yojson x.config_rule_name);
      ("Compliance", option_to_yojson compliance_to_yojson x.compliance);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("AwsRegion", option_to_yojson aws_region_to_yojson x.aws_region);
    ]

let aggregate_compliance_by_config_rule_list_to_yojson tree =
  list_to_yojson aggregate_compliance_by_config_rule_to_yojson tree

let conformance_pack_compliance_type_to_yojson (x : conformance_pack_compliance_type) =
  match x with
  | COMPLIANT -> `String "COMPLIANT"
  | NON_COMPLIANT -> `String "NON_COMPLIANT"
  | INSUFFICIENT_DATA -> `String "INSUFFICIENT_DATA"

let aggregate_conformance_pack_compliance_to_yojson (x : aggregate_conformance_pack_compliance) =
  assoc_to_yojson
    [
      ( "ComplianceType",
        option_to_yojson conformance_pack_compliance_type_to_yojson x.compliance_type );
      ("CompliantRuleCount", option_to_yojson integer_to_yojson x.compliant_rule_count);
      ("NonCompliantRuleCount", option_to_yojson integer_to_yojson x.non_compliant_rule_count);
      ("TotalRuleCount", option_to_yojson integer_to_yojson x.total_rule_count);
    ]

let conformance_pack_name_to_yojson = string_to_yojson

let aggregate_compliance_by_conformance_pack_to_yojson
    (x : aggregate_compliance_by_conformance_pack) =
  assoc_to_yojson
    [
      ( "ConformancePackName",
        option_to_yojson conformance_pack_name_to_yojson x.conformance_pack_name );
      ("Compliance", option_to_yojson aggregate_conformance_pack_compliance_to_yojson x.compliance);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("AwsRegion", option_to_yojson aws_region_to_yojson x.aws_region);
    ]

let aggregate_compliance_by_conformance_pack_list_to_yojson tree =
  list_to_yojson aggregate_compliance_by_conformance_pack_to_yojson tree

let date_to_yojson = timestamp_epoch_seconds_to_yojson

let compliance_summary_to_yojson (x : compliance_summary) =
  assoc_to_yojson
    [
      ( "CompliantResourceCount",
        option_to_yojson compliance_contributor_count_to_yojson x.compliant_resource_count );
      ( "NonCompliantResourceCount",
        option_to_yojson compliance_contributor_count_to_yojson x.non_compliant_resource_count );
      ("ComplianceSummaryTimestamp", option_to_yojson date_to_yojson x.compliance_summary_timestamp);
    ]

let string_with_char_limit256_to_yojson = string_to_yojson

let aggregate_compliance_count_to_yojson (x : aggregate_compliance_count) =
  assoc_to_yojson
    [
      ("GroupName", option_to_yojson string_with_char_limit256_to_yojson x.group_name);
      ("ComplianceSummary", option_to_yojson compliance_summary_to_yojson x.compliance_summary);
    ]

let aggregate_compliance_count_list_to_yojson tree =
  list_to_yojson aggregate_compliance_count_to_yojson tree

let aggregate_conformance_pack_compliance_count_to_yojson
    (x : aggregate_conformance_pack_compliance_count) =
  assoc_to_yojson
    [
      ( "CompliantConformancePackCount",
        option_to_yojson integer_to_yojson x.compliant_conformance_pack_count );
      ( "NonCompliantConformancePackCount",
        option_to_yojson integer_to_yojson x.non_compliant_conformance_pack_count );
    ]

let aggregate_conformance_pack_compliance_filters_to_yojson
    (x : aggregate_conformance_pack_compliance_filters) =
  assoc_to_yojson
    [
      ( "ConformancePackName",
        option_to_yojson conformance_pack_name_to_yojson x.conformance_pack_name );
      ( "ComplianceType",
        option_to_yojson conformance_pack_compliance_type_to_yojson x.compliance_type );
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("AwsRegion", option_to_yojson aws_region_to_yojson x.aws_region);
    ]

let aggregate_conformance_pack_compliance_summary_to_yojson
    (x : aggregate_conformance_pack_compliance_summary) =
  assoc_to_yojson
    [
      ( "ComplianceSummary",
        option_to_yojson aggregate_conformance_pack_compliance_count_to_yojson x.compliance_summary
      );
      ("GroupName", option_to_yojson string_with_char_limit256_to_yojson x.group_name);
    ]

let aggregate_conformance_pack_compliance_summary_filters_to_yojson
    (x : aggregate_conformance_pack_compliance_summary_filters) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("AwsRegion", option_to_yojson aws_region_to_yojson x.aws_region);
    ]

let aggregate_conformance_pack_compliance_summary_group_key_to_yojson
    (x : aggregate_conformance_pack_compliance_summary_group_key) =
  match x with ACCOUNT_ID -> `String "ACCOUNT_ID" | AWS_REGION -> `String "AWS_REGION"

let aggregate_conformance_pack_compliance_summary_list_to_yojson tree =
  list_to_yojson aggregate_conformance_pack_compliance_summary_to_yojson tree

let resource_evaluation_id_to_yojson = string_to_yojson

let evaluation_mode_to_yojson (x : evaluation_mode) =
  match x with DETECTIVE -> `String "DETECTIVE" | PROACTIVE -> `String "PROACTIVE"

let base_resource_id_to_yojson = string_to_yojson

let evaluation_result_qualifier_to_yojson (x : evaluation_result_qualifier) =
  assoc_to_yojson
    [
      ("ConfigRuleName", option_to_yojson config_rule_name_to_yojson x.config_rule_name);
      ("ResourceType", option_to_yojson string_with_char_limit256_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson base_resource_id_to_yojson x.resource_id);
      ("EvaluationMode", option_to_yojson evaluation_mode_to_yojson x.evaluation_mode);
    ]

let evaluation_result_identifier_to_yojson (x : evaluation_result_identifier) =
  assoc_to_yojson
    [
      ( "EvaluationResultQualifier",
        option_to_yojson evaluation_result_qualifier_to_yojson x.evaluation_result_qualifier );
      ("OrderingTimestamp", option_to_yojson date_to_yojson x.ordering_timestamp);
      ( "ResourceEvaluationId",
        option_to_yojson resource_evaluation_id_to_yojson x.resource_evaluation_id );
    ]

let aggregate_evaluation_result_to_yojson (x : aggregate_evaluation_result) =
  assoc_to_yojson
    [
      ( "EvaluationResultIdentifier",
        option_to_yojson evaluation_result_identifier_to_yojson x.evaluation_result_identifier );
      ("ComplianceType", option_to_yojson compliance_type_to_yojson x.compliance_type);
      ("ResultRecordedTime", option_to_yojson date_to_yojson x.result_recorded_time);
      ("ConfigRuleInvokedTime", option_to_yojson date_to_yojson x.config_rule_invoked_time);
      ("Annotation", option_to_yojson string_with_char_limit256_to_yojson x.annotation);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("AwsRegion", option_to_yojson aws_region_to_yojson x.aws_region);
    ]

let aggregate_evaluation_result_list_to_yojson tree =
  list_to_yojson aggregate_evaluation_result_to_yojson tree

let resource_name_to_yojson = string_to_yojson

let resource_type_to_yojson (x : resource_type) =
  match x with
  | CustomerGateway -> `String "AWS::EC2::CustomerGateway"
  | EIP -> `String "AWS::EC2::EIP"
  | Host -> `String "AWS::EC2::Host"
  | Instance -> `String "AWS::EC2::Instance"
  | InternetGateway -> `String "AWS::EC2::InternetGateway"
  | NetworkAcl -> `String "AWS::EC2::NetworkAcl"
  | NetworkInterface -> `String "AWS::EC2::NetworkInterface"
  | RouteTable -> `String "AWS::EC2::RouteTable"
  | SecurityGroup -> `String "AWS::EC2::SecurityGroup"
  | Subnet -> `String "AWS::EC2::Subnet"
  | Trail -> `String "AWS::CloudTrail::Trail"
  | Volume -> `String "AWS::EC2::Volume"
  | VPC -> `String "AWS::EC2::VPC"
  | VPNConnection -> `String "AWS::EC2::VPNConnection"
  | VPNGateway -> `String "AWS::EC2::VPNGateway"
  | RegisteredHAInstance -> `String "AWS::EC2::RegisteredHAInstance"
  | NatGateway -> `String "AWS::EC2::NatGateway"
  | EgressOnlyInternetGateway -> `String "AWS::EC2::EgressOnlyInternetGateway"
  | VPCEndpoint -> `String "AWS::EC2::VPCEndpoint"
  | VPCEndpointService -> `String "AWS::EC2::VPCEndpointService"
  | FlowLog -> `String "AWS::EC2::FlowLog"
  | VPCPeeringConnection -> `String "AWS::EC2::VPCPeeringConnection"
  | Domain -> `String "AWS::Elasticsearch::Domain"
  | Group -> `String "AWS::IAM::Group"
  | Policy -> `String "AWS::IAM::Policy"
  | Role -> `String "AWS::IAM::Role"
  | User -> `String "AWS::IAM::User"
  | LoadBalancerV2 -> `String "AWS::ElasticLoadBalancingV2::LoadBalancer"
  | Certificate -> `String "AWS::ACM::Certificate"
  | DBInstance -> `String "AWS::RDS::DBInstance"
  | DBSubnetGroup -> `String "AWS::RDS::DBSubnetGroup"
  | DBSecurityGroup -> `String "AWS::RDS::DBSecurityGroup"
  | DBSnapshot -> `String "AWS::RDS::DBSnapshot"
  | DBCluster -> `String "AWS::RDS::DBCluster"
  | DBClusterSnapshot -> `String "AWS::RDS::DBClusterSnapshot"
  | EventSubscription -> `String "AWS::RDS::EventSubscription"
  | Bucket -> `String "AWS::S3::Bucket"
  | AccountPublicAccessBlock -> `String "AWS::S3::AccountPublicAccessBlock"
  | Cluster -> `String "AWS::Redshift::Cluster"
  | ClusterSnapshot -> `String "AWS::Redshift::ClusterSnapshot"
  | ClusterParameterGroup -> `String "AWS::Redshift::ClusterParameterGroup"
  | ClusterSecurityGroup -> `String "AWS::Redshift::ClusterSecurityGroup"
  | ClusterSubnetGroup -> `String "AWS::Redshift::ClusterSubnetGroup"
  | RedshiftEventSubscription -> `String "AWS::Redshift::EventSubscription"
  | ManagedInstanceInventory -> `String "AWS::SSM::ManagedInstanceInventory"
  | Alarm -> `String "AWS::CloudWatch::Alarm"
  | Stack -> `String "AWS::CloudFormation::Stack"
  | LoadBalancer -> `String "AWS::ElasticLoadBalancing::LoadBalancer"
  | AutoScalingGroup -> `String "AWS::AutoScaling::AutoScalingGroup"
  | LaunchConfiguration -> `String "AWS::AutoScaling::LaunchConfiguration"
  | ScalingPolicy -> `String "AWS::AutoScaling::ScalingPolicy"
  | ScheduledAction -> `String "AWS::AutoScaling::ScheduledAction"
  | Table -> `String "AWS::DynamoDB::Table"
  | Project -> `String "AWS::CodeBuild::Project"
  | RateBasedRule -> `String "AWS::WAF::RateBasedRule"
  | Rule -> `String "AWS::WAF::Rule"
  | RuleGroup -> `String "AWS::WAF::RuleGroup"
  | WebACL -> `String "AWS::WAF::WebACL"
  | RegionalRateBasedRule -> `String "AWS::WAFRegional::RateBasedRule"
  | RegionalRule -> `String "AWS::WAFRegional::Rule"
  | RegionalRuleGroup -> `String "AWS::WAFRegional::RuleGroup"
  | RegionalWebACL -> `String "AWS::WAFRegional::WebACL"
  | Distribution -> `String "AWS::CloudFront::Distribution"
  | StreamingDistribution -> `String "AWS::CloudFront::StreamingDistribution"
  | Function -> `String "AWS::Lambda::Function"
  | NetworkFirewallFirewall -> `String "AWS::NetworkFirewall::Firewall"
  | NetworkFirewallFirewallPolicy -> `String "AWS::NetworkFirewall::FirewallPolicy"
  | NetworkFirewallRuleGroup -> `String "AWS::NetworkFirewall::RuleGroup"
  | Application -> `String "AWS::ElasticBeanstalk::Application"
  | ApplicationVersion -> `String "AWS::ElasticBeanstalk::ApplicationVersion"
  | Environment -> `String "AWS::ElasticBeanstalk::Environment"
  | WebACLV2 -> `String "AWS::WAFv2::WebACL"
  | RuleGroupV2 -> `String "AWS::WAFv2::RuleGroup"
  | IPSetV2 -> `String "AWS::WAFv2::IPSet"
  | RegexPatternSetV2 -> `String "AWS::WAFv2::RegexPatternSet"
  | ManagedRuleSetV2 -> `String "AWS::WAFv2::ManagedRuleSet"
  | EncryptionConfig -> `String "AWS::XRay::EncryptionConfig"
  | AssociationCompliance -> `String "AWS::SSM::AssociationCompliance"
  | PatchCompliance -> `String "AWS::SSM::PatchCompliance"
  | Protection -> `String "AWS::Shield::Protection"
  | RegionalProtection -> `String "AWS::ShieldRegional::Protection"
  | ConformancePackCompliance -> `String "AWS::Config::ConformancePackCompliance"
  | ResourceCompliance -> `String "AWS::Config::ResourceCompliance"
  | Stage -> `String "AWS::ApiGateway::Stage"
  | RestApi -> `String "AWS::ApiGateway::RestApi"
  | StageV2 -> `String "AWS::ApiGatewayV2::Stage"
  | Api -> `String "AWS::ApiGatewayV2::Api"
  | Pipeline -> `String "AWS::CodePipeline::Pipeline"
  | CloudFormationProvisionedProduct ->
      `String "AWS::ServiceCatalog::CloudFormationProvisionedProduct"
  | CloudFormationProduct -> `String "AWS::ServiceCatalog::CloudFormationProduct"
  | Portfolio -> `String "AWS::ServiceCatalog::Portfolio"
  | Queue -> `String "AWS::SQS::Queue"
  | Key -> `String "AWS::KMS::Key"
  | QLDBLedger -> `String "AWS::QLDB::Ledger"
  | Secret -> `String "AWS::SecretsManager::Secret"
  | Topic -> `String "AWS::SNS::Topic"
  | FileData -> `String "AWS::SSM::FileData"
  | BackupPlan -> `String "AWS::Backup::BackupPlan"
  | BackupSelection -> `String "AWS::Backup::BackupSelection"
  | BackupVault -> `String "AWS::Backup::BackupVault"
  | BackupRecoveryPoint -> `String "AWS::Backup::RecoveryPoint"
  | ECRRepository -> `String "AWS::ECR::Repository"
  | ECSCluster -> `String "AWS::ECS::Cluster"
  | ECSService -> `String "AWS::ECS::Service"
  | ECSTaskDefinition -> `String "AWS::ECS::TaskDefinition"
  | EFSAccessPoint -> `String "AWS::EFS::AccessPoint"
  | EFSFileSystem -> `String "AWS::EFS::FileSystem"
  | EKSCluster -> `String "AWS::EKS::Cluster"
  | OpenSearchDomain -> `String "AWS::OpenSearch::Domain"
  | TransitGateway -> `String "AWS::EC2::TransitGateway"
  | KinesisStream -> `String "AWS::Kinesis::Stream"
  | KinesisStreamConsumer -> `String "AWS::Kinesis::StreamConsumer"
  | CodeDeployApplication -> `String "AWS::CodeDeploy::Application"
  | CodeDeployDeploymentConfig -> `String "AWS::CodeDeploy::DeploymentConfig"
  | CodeDeployDeploymentGroup -> `String "AWS::CodeDeploy::DeploymentGroup"
  | LaunchTemplate -> `String "AWS::EC2::LaunchTemplate"
  | ECRPublicRepository -> `String "AWS::ECR::PublicRepository"
  | GuardDutyDetector -> `String "AWS::GuardDuty::Detector"
  | EMRSecurityConfiguration -> `String "AWS::EMR::SecurityConfiguration"
  | SageMakerCodeRepository -> `String "AWS::SageMaker::CodeRepository"
  | Route53ResolverResolverEndpoint -> `String "AWS::Route53Resolver::ResolverEndpoint"
  | Route53ResolverResolverRule -> `String "AWS::Route53Resolver::ResolverRule"
  | Route53ResolverResolverRuleAssociation ->
      `String "AWS::Route53Resolver::ResolverRuleAssociation"
  | DMSReplicationSubnetGroup -> `String "AWS::DMS::ReplicationSubnetGroup"
  | DMSEventSubscription -> `String "AWS::DMS::EventSubscription"
  | MSKCluster -> `String "AWS::MSK::Cluster"
  | StepFunctionsActivity -> `String "AWS::StepFunctions::Activity"
  | WorkSpacesWorkspace -> `String "AWS::WorkSpaces::Workspace"
  | WorkSpacesConnectionAlias -> `String "AWS::WorkSpaces::ConnectionAlias"
  | SageMakerModel -> `String "AWS::SageMaker::Model"
  | ListenerV2 -> `String "AWS::ElasticLoadBalancingV2::Listener"
  | StepFunctionsStateMachine -> `String "AWS::StepFunctions::StateMachine"
  | BatchJobQueue -> `String "AWS::Batch::JobQueue"
  | BatchComputeEnvironment -> `String "AWS::Batch::ComputeEnvironment"
  | AccessAnalyzerAnalyzer -> `String "AWS::AccessAnalyzer::Analyzer"
  | AthenaWorkGroup -> `String "AWS::Athena::WorkGroup"
  | AthenaDataCatalog -> `String "AWS::Athena::DataCatalog"
  | DetectiveGraph -> `String "AWS::Detective::Graph"
  | GlobalAcceleratorAccelerator -> `String "AWS::GlobalAccelerator::Accelerator"
  | GlobalAcceleratorEndpointGroup -> `String "AWS::GlobalAccelerator::EndpointGroup"
  | GlobalAcceleratorListener -> `String "AWS::GlobalAccelerator::Listener"
  | TransitGatewayAttachment -> `String "AWS::EC2::TransitGatewayAttachment"
  | TransitGatewayRouteTable -> `String "AWS::EC2::TransitGatewayRouteTable"
  | DMSCertificate -> `String "AWS::DMS::Certificate"
  | AppConfigApplication -> `String "AWS::AppConfig::Application"
  | AppSyncGraphQLApi -> `String "AWS::AppSync::GraphQLApi"
  | DataSyncLocationSMB -> `String "AWS::DataSync::LocationSMB"
  | DataSyncLocationFSxLustre -> `String "AWS::DataSync::LocationFSxLustre"
  | DataSyncLocationS3 -> `String "AWS::DataSync::LocationS3"
  | DataSyncLocationEFS -> `String "AWS::DataSync::LocationEFS"
  | DataSyncTask -> `String "AWS::DataSync::Task"
  | DataSyncLocationNFS -> `String "AWS::DataSync::LocationNFS"
  | NetworkInsightsAccessScopeAnalysis -> `String "AWS::EC2::NetworkInsightsAccessScopeAnalysis"
  | EKSFargateProfile -> `String "AWS::EKS::FargateProfile"
  | GlueJob -> `String "AWS::Glue::Job"
  | GuardDutyThreatIntelSet -> `String "AWS::GuardDuty::ThreatIntelSet"
  | GuardDutyIPSet -> `String "AWS::GuardDuty::IPSet"
  | SageMakerWorkteam -> `String "AWS::SageMaker::Workteam"
  | SageMakerNotebookInstanceLifecycleConfig ->
      `String "AWS::SageMaker::NotebookInstanceLifecycleConfig"
  | ServiceDiscoveryService -> `String "AWS::ServiceDiscovery::Service"
  | ServiceDiscoveryPublicDnsNamespace -> `String "AWS::ServiceDiscovery::PublicDnsNamespace"
  | SESContactList -> `String "AWS::SES::ContactList"
  | SESConfigurationSet -> `String "AWS::SES::ConfigurationSet"
  | Route53HostedZone -> `String "AWS::Route53::HostedZone"
  | IoTEventsInput -> `String "AWS::IoTEvents::Input"
  | IoTEventsDetectorModel -> `String "AWS::IoTEvents::DetectorModel"
  | IoTEventsAlarmModel -> `String "AWS::IoTEvents::AlarmModel"
  | ServiceDiscoveryHttpNamespace -> `String "AWS::ServiceDiscovery::HttpNamespace"
  | EventsEventBus -> `String "AWS::Events::EventBus"
  | ImageBuilderContainerRecipe -> `String "AWS::ImageBuilder::ContainerRecipe"
  | ImageBuilderDistributionConfiguration -> `String "AWS::ImageBuilder::DistributionConfiguration"
  | ImageBuilderInfrastructureConfiguration ->
      `String "AWS::ImageBuilder::InfrastructureConfiguration"
  | DataSyncLocationObjectStorage -> `String "AWS::DataSync::LocationObjectStorage"
  | DataSyncLocationHDFS -> `String "AWS::DataSync::LocationHDFS"
  | GlueClassifier -> `String "AWS::Glue::Classifier"
  | Route53RecoveryReadinessCell -> `String "AWS::Route53RecoveryReadiness::Cell"
  | Route53RecoveryReadinessReadinessCheck ->
      `String "AWS::Route53RecoveryReadiness::ReadinessCheck"
  | ECRRegistryPolicy -> `String "AWS::ECR::RegistryPolicy"
  | BackupReportPlan -> `String "AWS::Backup::ReportPlan"
  | LightsailCertificate -> `String "AWS::Lightsail::Certificate"
  | RUMAppMonitor -> `String "AWS::RUM::AppMonitor"
  | EventsEndpoint -> `String "AWS::Events::Endpoint"
  | SESReceiptRuleSet -> `String "AWS::SES::ReceiptRuleSet"
  | EventsArchive -> `String "AWS::Events::Archive"
  | EventsApiDestination -> `String "AWS::Events::ApiDestination"
  | LightsailDisk -> `String "AWS::Lightsail::Disk"
  | FISExperimentTemplate -> `String "AWS::FIS::ExperimentTemplate"
  | DataSyncLocationFSxWindows -> `String "AWS::DataSync::LocationFSxWindows"
  | SESReceiptFilter -> `String "AWS::SES::ReceiptFilter"
  | GuardDutyFilter -> `String "AWS::GuardDuty::Filter"
  | SESTemplate -> `String "AWS::SES::Template"
  | AmazonMQBroker -> `String "AWS::AmazonMQ::Broker"
  | AppConfigEnvironment -> `String "AWS::AppConfig::Environment"
  | AppConfigConfigurationProfile -> `String "AWS::AppConfig::ConfigurationProfile"
  | Cloud9EnvironmentEC2 -> `String "AWS::Cloud9::EnvironmentEC2"
  | EventSchemasRegistry -> `String "AWS::EventSchemas::Registry"
  | EventSchemasRegistryPolicy -> `String "AWS::EventSchemas::RegistryPolicy"
  | EventSchemasDiscoverer -> `String "AWS::EventSchemas::Discoverer"
  | FraudDetectorLabel -> `String "AWS::FraudDetector::Label"
  | FraudDetectorEntityType -> `String "AWS::FraudDetector::EntityType"
  | FraudDetectorVariable -> `String "AWS::FraudDetector::Variable"
  | FraudDetectorOutcome -> `String "AWS::FraudDetector::Outcome"
  | IoTAuthorizer -> `String "AWS::IoT::Authorizer"
  | IoTSecurityProfile -> `String "AWS::IoT::SecurityProfile"
  | IoTRoleAlias -> `String "AWS::IoT::RoleAlias"
  | IoTDimension -> `String "AWS::IoT::Dimension"
  | IoTAnalyticsDatastore -> `String "AWS::IoTAnalytics::Datastore"
  | LightsailBucket -> `String "AWS::Lightsail::Bucket"
  | LightsailStaticIp -> `String "AWS::Lightsail::StaticIp"
  | MediaPackagePackagingGroup -> `String "AWS::MediaPackage::PackagingGroup"
  | Route53RecoveryReadinessRecoveryGroup -> `String "AWS::Route53RecoveryReadiness::RecoveryGroup"
  | ResilienceHubResiliencyPolicy -> `String "AWS::ResilienceHub::ResiliencyPolicy"
  | TransferWorkflow -> `String "AWS::Transfer::Workflow"
  | EKSIdentityProviderConfig -> `String "AWS::EKS::IdentityProviderConfig"
  | EKSAddon -> `String "AWS::EKS::Addon"
  | GlueMLTransform -> `String "AWS::Glue::MLTransform"
  | IoTPolicy -> `String "AWS::IoT::Policy"
  | IoTMitigationAction -> `String "AWS::IoT::MitigationAction"
  | IoTTwinMakerWorkspace -> `String "AWS::IoTTwinMaker::Workspace"
  | IoTTwinMakerEntity -> `String "AWS::IoTTwinMaker::Entity"
  | IoTAnalyticsDataset -> `String "AWS::IoTAnalytics::Dataset"
  | IoTAnalyticsPipeline -> `String "AWS::IoTAnalytics::Pipeline"
  | IoTAnalyticsChannel -> `String "AWS::IoTAnalytics::Channel"
  | IoTSiteWiseDashboard -> `String "AWS::IoTSiteWise::Dashboard"
  | IoTSiteWiseProject -> `String "AWS::IoTSiteWise::Project"
  | IoTSiteWisePortal -> `String "AWS::IoTSiteWise::Portal"
  | IoTSiteWiseAssetModel -> `String "AWS::IoTSiteWise::AssetModel"
  | IVSChannel -> `String "AWS::IVS::Channel"
  | IVSRecordingConfiguration -> `String "AWS::IVS::RecordingConfiguration"
  | IVSPlaybackKeyPair -> `String "AWS::IVS::PlaybackKeyPair"
  | KinesisAnalyticsV2Application -> `String "AWS::KinesisAnalyticsV2::Application"
  | RDSGlobalCluster -> `String "AWS::RDS::GlobalCluster"
  | S3MultiRegionAccessPoint -> `String "AWS::S3::MultiRegionAccessPoint"
  | DeviceFarmTestGridProject -> `String "AWS::DeviceFarm::TestGridProject"
  | BudgetsBudgetsAction -> `String "AWS::Budgets::BudgetsAction"
  | LexBot -> `String "AWS::Lex::Bot"
  | CodeGuruReviewerRepositoryAssociation -> `String "AWS::CodeGuruReviewer::RepositoryAssociation"
  | IoTCustomMetric -> `String "AWS::IoT::CustomMetric"
  | Route53ResolverFirewallDomainList -> `String "AWS::Route53Resolver::FirewallDomainList"
  | RoboMakerRobotApplicationVersion -> `String "AWS::RoboMaker::RobotApplicationVersion"
  | EC2TrafficMirrorSession -> `String "AWS::EC2::TrafficMirrorSession"
  | IoTSiteWiseGateway -> `String "AWS::IoTSiteWise::Gateway"
  | LexBotAlias -> `String "AWS::Lex::BotAlias"
  | LookoutMetricsAlert -> `String "AWS::LookoutMetrics::Alert"
  | IoTAccountAuditConfiguration -> `String "AWS::IoT::AccountAuditConfiguration"
  | EC2TrafficMirrorTarget -> `String "AWS::EC2::TrafficMirrorTarget"
  | S3StorageLens -> `String "AWS::S3::StorageLens"
  | IoTScheduledAudit -> `String "AWS::IoT::ScheduledAudit"
  | EventsConnection -> `String "AWS::Events::Connection"
  | EventSchemasSchema -> `String "AWS::EventSchemas::Schema"
  | MediaPackagePackagingConfiguration -> `String "AWS::MediaPackage::PackagingConfiguration"
  | KinesisVideoSignalingChannel -> `String "AWS::KinesisVideo::SignalingChannel"
  | AppStreamDirectoryConfig -> `String "AWS::AppStream::DirectoryConfig"
  | LookoutVisionProject -> `String "AWS::LookoutVision::Project"
  | Route53RecoveryControlCluster -> `String "AWS::Route53RecoveryControl::Cluster"
  | Route53RecoveryControlSafetyRule -> `String "AWS::Route53RecoveryControl::SafetyRule"
  | Route53RecoveryControlControlPanel -> `String "AWS::Route53RecoveryControl::ControlPanel"
  | Route53RecoveryControlRoutingControl -> `String "AWS::Route53RecoveryControl::RoutingControl"
  | Route53RecoveryReadinessResourceSet -> `String "AWS::Route53RecoveryReadiness::ResourceSet"
  | RoboMakerSimulationApplication -> `String "AWS::RoboMaker::SimulationApplication"
  | RoboMakerRobotApplication -> `String "AWS::RoboMaker::RobotApplication"
  | HealthLakeFHIRDatastore -> `String "AWS::HealthLake::FHIRDatastore"
  | PinpointSegment -> `String "AWS::Pinpoint::Segment"
  | PinpointApplicationSettings -> `String "AWS::Pinpoint::ApplicationSettings"
  | EventsRule -> `String "AWS::Events::Rule"
  | EC2DHCPOptions -> `String "AWS::EC2::DHCPOptions"
  | EC2NetworkInsightsPath -> `String "AWS::EC2::NetworkInsightsPath"
  | EC2TrafficMirrorFilter -> `String "AWS::EC2::TrafficMirrorFilter"
  | EC2IPAM -> `String "AWS::EC2::IPAM"
  | IoTTwinMakerScene -> `String "AWS::IoTTwinMaker::Scene"
  | NetworkManagerTransitGatewayRegistration ->
      `String "AWS::NetworkManager::TransitGatewayRegistration"
  | CustomerProfilesDomain -> `String "AWS::CustomerProfiles::Domain"
  | AutoScalingWarmPool -> `String "AWS::AutoScaling::WarmPool"
  | ConnectPhoneNumber -> `String "AWS::Connect::PhoneNumber"
  | AppConfigDeploymentStrategy -> `String "AWS::AppConfig::DeploymentStrategy"
  | AppFlowFlow -> `String "AWS::AppFlow::Flow"
  | AuditManagerAssessment -> `String "AWS::AuditManager::Assessment"
  | CloudWatchMetricStream -> `String "AWS::CloudWatch::MetricStream"
  | DeviceFarmInstanceProfile -> `String "AWS::DeviceFarm::InstanceProfile"
  | DeviceFarmProject -> `String "AWS::DeviceFarm::Project"
  | EC2EC2Fleet -> `String "AWS::EC2::EC2Fleet"
  | EC2SubnetRouteTableAssociation -> `String "AWS::EC2::SubnetRouteTableAssociation"
  | ECRPullThroughCacheRule -> `String "AWS::ECR::PullThroughCacheRule"
  | GroundStationConfig -> `String "AWS::GroundStation::Config"
  | ImageBuilderImagePipeline -> `String "AWS::ImageBuilder::ImagePipeline"
  | IoTFleetMetric -> `String "AWS::IoT::FleetMetric"
  | IoTWirelessServiceProfile -> `String "AWS::IoTWireless::ServiceProfile"
  | NetworkManagerDevice -> `String "AWS::NetworkManager::Device"
  | NetworkManagerGlobalNetwork -> `String "AWS::NetworkManager::GlobalNetwork"
  | NetworkManagerLink -> `String "AWS::NetworkManager::Link"
  | NetworkManagerSite -> `String "AWS::NetworkManager::Site"
  | PanoramaPackage -> `String "AWS::Panorama::Package"
  | PinpointApp -> `String "AWS::Pinpoint::App"
  | RedshiftScheduledAction -> `String "AWS::Redshift::ScheduledAction"
  | Route53ResolverFirewallRuleGroupAssociation ->
      `String "AWS::Route53Resolver::FirewallRuleGroupAssociation"
  | SageMakerAppImageConfig -> `String "AWS::SageMaker::AppImageConfig"
  | SageMakerImage -> `String "AWS::SageMaker::Image"
  | ECSTaskSet -> `String "AWS::ECS::TaskSet"
  | CassandraKeyspace -> `String "AWS::Cassandra::Keyspace"
  | SignerSigningProfile -> `String "AWS::Signer::SigningProfile"
  | AmplifyApp -> `String "AWS::Amplify::App"
  | AppMeshVirtualNode -> `String "AWS::AppMesh::VirtualNode"
  | AppMeshVirtualService -> `String "AWS::AppMesh::VirtualService"
  | AppRunnerVpcConnector -> `String "AWS::AppRunner::VpcConnector"
  | AppStreamApplication -> `String "AWS::AppStream::Application"
  | CodeArtifactRepository -> `String "AWS::CodeArtifact::Repository"
  | EC2PrefixList -> `String "AWS::EC2::PrefixList"
  | EC2SpotFleet -> `String "AWS::EC2::SpotFleet"
  | EvidentlyProject -> `String "AWS::Evidently::Project"
  | ForecastDataset -> `String "AWS::Forecast::Dataset"
  | IAMSAMLProvider -> `String "AWS::IAM::SAMLProvider"
  | IAMServerCertificate -> `String "AWS::IAM::ServerCertificate"
  | PinpointCampaign -> `String "AWS::Pinpoint::Campaign"
  | PinpointInAppTemplate -> `String "AWS::Pinpoint::InAppTemplate"
  | SageMakerDomain -> `String "AWS::SageMaker::Domain"
  | TransferAgreement -> `String "AWS::Transfer::Agreement"
  | TransferConnector -> `String "AWS::Transfer::Connector"
  | KinesisFirehoseDeliveryStream -> `String "AWS::KinesisFirehose::DeliveryStream"
  | AmplifyBranch -> `String "AWS::Amplify::Branch"
  | AppIntegrationsEventIntegration -> `String "AWS::AppIntegrations::EventIntegration"
  | AppMeshRoute -> `String "AWS::AppMesh::Route"
  | AthenaPreparedStatement -> `String "AWS::Athena::PreparedStatement"
  | EC2IPAMScope -> `String "AWS::EC2::IPAMScope"
  | EvidentlyLaunch -> `String "AWS::Evidently::Launch"
  | ForecastDatasetGroup -> `String "AWS::Forecast::DatasetGroup"
  | GreengrassV2ComponentVersion -> `String "AWS::GreengrassV2::ComponentVersion"
  | GroundStationMissionProfile -> `String "AWS::GroundStation::MissionProfile"
  | MediaConnectFlowEntitlement -> `String "AWS::MediaConnect::FlowEntitlement"
  | MediaConnectFlowVpcInterface -> `String "AWS::MediaConnect::FlowVpcInterface"
  | MediaTailorPlaybackConfiguration -> `String "AWS::MediaTailor::PlaybackConfiguration"
  | MSKConfiguration -> `String "AWS::MSK::Configuration"
  | PersonalizeDataset -> `String "AWS::Personalize::Dataset"
  | PersonalizeSchema -> `String "AWS::Personalize::Schema"
  | PersonalizeSolution -> `String "AWS::Personalize::Solution"
  | PinpointEmailTemplate -> `String "AWS::Pinpoint::EmailTemplate"
  | PinpointEventStream -> `String "AWS::Pinpoint::EventStream"
  | ResilienceHubApp -> `String "AWS::ResilienceHub::App"
  | ACMPCACertificateAuthority -> `String "AWS::ACMPCA::CertificateAuthority"
  | AppConfigHostedConfigurationVersion -> `String "AWS::AppConfig::HostedConfigurationVersion"
  | AppMeshVirtualGateway -> `String "AWS::AppMesh::VirtualGateway"
  | AppMeshVirtualRouter -> `String "AWS::AppMesh::VirtualRouter"
  | AppRunnerService -> `String "AWS::AppRunner::Service"
  | CustomerProfilesObjectType -> `String "AWS::CustomerProfiles::ObjectType"
  | DMSEndpoint -> `String "AWS::DMS::Endpoint"
  | EC2CapacityReservation -> `String "AWS::EC2::CapacityReservation"
  | EC2ClientVpnEndpoint -> `String "AWS::EC2::ClientVpnEndpoint"
  | KendraIndex -> `String "AWS::Kendra::Index"
  | KinesisVideoStream -> `String "AWS::KinesisVideo::Stream"
  | LogsDestination -> `String "AWS::Logs::Destination"
  | PinpointEmailChannel -> `String "AWS::Pinpoint::EmailChannel"
  | S3AccessPoint -> `String "AWS::S3::AccessPoint"
  | NetworkManagerCustomerGatewayAssociation ->
      `String "AWS::NetworkManager::CustomerGatewayAssociation"
  | NetworkManagerLinkAssociation -> `String "AWS::NetworkManager::LinkAssociation"
  | IoTWirelessMulticastGroup -> `String "AWS::IoTWireless::MulticastGroup"
  | PersonalizeDatasetGroup -> `String "AWS::Personalize::DatasetGroup"
  | IoTTwinMakerComponentType -> `String "AWS::IoTTwinMaker::ComponentType"
  | CodeBuildReportGroup -> `String "AWS::CodeBuild::ReportGroup"
  | SageMakerFeatureGroup -> `String "AWS::SageMaker::FeatureGroup"
  | MSKBatchScramSecret -> `String "AWS::MSK::BatchScramSecret"
  | AppStreamStack -> `String "AWS::AppStream::Stack"
  | IoTJobTemplate -> `String "AWS::IoT::JobTemplate"
  | IoTWirelessFuotaTask -> `String "AWS::IoTWireless::FuotaTask"
  | IoTProvisioningTemplate -> `String "AWS::IoT::ProvisioningTemplate"
  | InspectorV2Filter -> `String "AWS::InspectorV2::Filter"
  | Route53ResolverResolverQueryLoggingConfigAssociation ->
      `String "AWS::Route53Resolver::ResolverQueryLoggingConfigAssociation"
  | ServiceDiscoveryInstance -> `String "AWS::ServiceDiscovery::Instance"
  | TransferCertificate -> `String "AWS::Transfer::Certificate"
  | MediaConnectFlowSource -> `String "AWS::MediaConnect::FlowSource"
  | APSRuleGroupsNamespace -> `String "AWS::APS::RuleGroupsNamespace"
  | CodeGuruProfilerProfilingGroup -> `String "AWS::CodeGuruProfiler::ProfilingGroup"
  | Route53ResolverResolverQueryLoggingConfig ->
      `String "AWS::Route53Resolver::ResolverQueryLoggingConfig"
  | BatchSchedulingPolicy -> `String "AWS::Batch::SchedulingPolicy"
  | ACMPCACertificateAuthorityActivation -> `String "AWS::ACMPCA::CertificateAuthorityActivation"
  | AppMeshGatewayRoute -> `String "AWS::AppMesh::GatewayRoute"
  | AppMeshMesh -> `String "AWS::AppMesh::Mesh"
  | ConnectInstance -> `String "AWS::Connect::Instance"
  | ConnectQuickConnect -> `String "AWS::Connect::QuickConnect"
  | EC2CarrierGateway -> `String "AWS::EC2::CarrierGateway"
  | EC2IPAMPool -> `String "AWS::EC2::IPAMPool"
  | EC2TransitGatewayConnect -> `String "AWS::EC2::TransitGatewayConnect"
  | EC2TransitGatewayMulticastDomain -> `String "AWS::EC2::TransitGatewayMulticastDomain"
  | ECSCapacityProvider -> `String "AWS::ECS::CapacityProvider"
  | IAMInstanceProfile -> `String "AWS::IAM::InstanceProfile"
  | IoTCACertificate -> `String "AWS::IoT::CACertificate"
  | IoTTwinMakerSyncJob -> `String "AWS::IoTTwinMaker::SyncJob"
  | KafkaConnectConnector -> `String "AWS::KafkaConnect::Connector"
  | LambdaCodeSigningConfig -> `String "AWS::Lambda::CodeSigningConfig"
  | NetworkManagerConnectPeer -> `String "AWS::NetworkManager::ConnectPeer"
  | ResourceExplorer2Index -> `String "AWS::ResourceExplorer2::Index"
  | AppStreamFleet -> `String "AWS::AppStream::Fleet"
  | CognitoUserPool -> `String "AWS::Cognito::UserPool"
  | CognitoUserPoolClient -> `String "AWS::Cognito::UserPoolClient"
  | CognitoUserPoolGroup -> `String "AWS::Cognito::UserPoolGroup"
  | EC2NetworkInsightsAccessScope -> `String "AWS::EC2::NetworkInsightsAccessScope"
  | EC2NetworkInsightsAnalysis -> `String "AWS::EC2::NetworkInsightsAnalysis"
  | GrafanaWorkspace -> `String "AWS::Grafana::Workspace"
  | GroundStationDataflowEndpointGroup -> `String "AWS::GroundStation::DataflowEndpointGroup"
  | ImageBuilderImageRecipe -> `String "AWS::ImageBuilder::ImageRecipe"
  | KMSAlias -> `String "AWS::KMS::Alias"
  | M2Environment -> `String "AWS::M2::Environment"
  | QuickSightDataSource -> `String "AWS::QuickSight::DataSource"
  | QuickSightTemplate -> `String "AWS::QuickSight::Template"
  | QuickSightTheme -> `String "AWS::QuickSight::Theme"
  | RDSOptionGroup -> `String "AWS::RDS::OptionGroup"
  | RedshiftEndpointAccess -> `String "AWS::Redshift::EndpointAccess"
  | Route53ResolverFirewallRuleGroup -> `String "AWS::Route53Resolver::FirewallRuleGroup"
  | SSMDocument -> `String "AWS::SSM::Document"
  | AppConfigExtensionAssociation -> `String "AWS::AppConfig::ExtensionAssociation"
  | AppIntegrationsApplication -> `String "AWS::AppIntegrations::Application"
  | AppSyncApiCache -> `String "AWS::AppSync::ApiCache"
  | BedrockGuardrail -> `String "AWS::Bedrock::Guardrail"
  | BedrockKnowledgeBase -> `String "AWS::Bedrock::KnowledgeBase"
  | CognitoIdentityPool -> `String "AWS::Cognito::IdentityPool"
  | ConnectRule -> `String "AWS::Connect::Rule"
  | ConnectUser -> `String "AWS::Connect::User"
  | EC2ClientVpnTargetNetworkAssociation -> `String "AWS::EC2::ClientVpnTargetNetworkAssociation"
  | EC2EIPAssociation -> `String "AWS::EC2::EIPAssociation"
  | EC2IPAMResourceDiscovery -> `String "AWS::EC2::IPAMResourceDiscovery"
  | EC2IPAMResourceDiscoveryAssociation -> `String "AWS::EC2::IPAMResourceDiscoveryAssociation"
  | EC2InstanceConnectEndpoint -> `String "AWS::EC2::InstanceConnectEndpoint"
  | EC2SnapshotBlockPublicAccess -> `String "AWS::EC2::SnapshotBlockPublicAccess"
  | EC2VPCBlockPublicAccessExclusion -> `String "AWS::EC2::VPCBlockPublicAccessExclusion"
  | EC2VPCBlockPublicAccessOptions -> `String "AWS::EC2::VPCBlockPublicAccessOptions"
  | EC2VPCEndpointConnectionNotification -> `String "AWS::EC2::VPCEndpointConnectionNotification"
  | EC2VPNConnectionRoute -> `String "AWS::EC2::VPNConnectionRoute"
  | EvidentlySegment -> `String "AWS::Evidently::Segment"
  | IAMOIDCProvider -> `String "AWS::IAM::OIDCProvider"
  | InspectorV2Activation -> `String "AWS::InspectorV2::Activation"
  | MSKClusterPolicy -> `String "AWS::MSK::ClusterPolicy"
  | MSKVpcConnection -> `String "AWS::MSK::VpcConnection"
  | MediaConnectGateway -> `String "AWS::MediaConnect::Gateway"
  | MemoryDBSubnetGroup -> `String "AWS::MemoryDB::SubnetGroup"
  | OpenSearchServerlessCollection -> `String "AWS::OpenSearchServerless::Collection"
  | OpenSearchServerlessVpcEndpoint -> `String "AWS::OpenSearchServerless::VpcEndpoint"
  | RedshiftEndpointAuthorization -> `String "AWS::Redshift::EndpointAuthorization"
  | Route53ProfilesProfile -> `String "AWS::Route53Profiles::Profile"
  | S3StorageLensGroup -> `String "AWS::S3::StorageLensGroup"
  | S3ExpressBucketPolicy -> `String "AWS::S3Express::BucketPolicy"
  | S3ExpressDirectoryBucket -> `String "AWS::S3Express::DirectoryBucket"
  | SageMakerInferenceExperiment -> `String "AWS::SageMaker::InferenceExperiment"
  | SecurityHubStandard -> `String "AWS::SecurityHub::Standard"
  | TransferProfile -> `String "AWS::Transfer::Profile"
  | CloudFormationStackSet -> `String "AWS::CloudFormation::StackSet"
  | MediaPackageV2Channel -> `String "AWS::MediaPackageV2::Channel"
  | S3AccessGrantsLocation -> `String "AWS::S3::AccessGrantsLocation"
  | S3AccessGrant -> `String "AWS::S3::AccessGrant"
  | S3AccessGrantsInstance -> `String "AWS::S3::AccessGrantsInstance"
  | EMRServerlessApplication -> `String "AWS::EMRServerless::Application"
  | ConfigAggregationAuthorization -> `String "AWS::Config::AggregationAuthorization"
  | BedrockApplicationInferenceProfile -> `String "AWS::Bedrock::ApplicationInferenceProfile"
  | ApiGatewayV2Integration -> `String "AWS::ApiGatewayV2::Integration"
  | SageMakerMlflowTrackingServer -> `String "AWS::SageMaker::MlflowTrackingServer"
  | SageMakerModelBiasJobDefinition -> `String "AWS::SageMaker::ModelBiasJobDefinition"
  | SecretsManagerRotationSchedule -> `String "AWS::SecretsManager::RotationSchedule"
  | DeadlineQueueFleetAssociation -> `String "AWS::Deadline::QueueFleetAssociation"
  | ECRRepositoryCreationTemplate -> `String "AWS::ECR::RepositoryCreationTemplate"
  | CloudFormationLambdaHook -> `String "AWS::CloudFormation::LambdaHook"
  | EC2SubnetNetworkAclAssociation -> `String "AWS::EC2::SubnetNetworkAclAssociation"
  | ApiGatewayUsagePlan -> `String "AWS::ApiGateway::UsagePlan"
  | AppConfigExtension -> `String "AWS::AppConfig::Extension"
  | DeadlineFleet -> `String "AWS::Deadline::Fleet"
  | EMRStudio -> `String "AWS::EMR::Studio"
  | S3TablesTableBucket -> `String "AWS::S3Tables::TableBucket"
  | CloudFrontRealtimeLogConfig -> `String "AWS::CloudFront::RealtimeLogConfig"
  | BackupGatewayHypervisor -> `String "AWS::BackupGateway::Hypervisor"
  | BCMDataExportsExport -> `String "AWS::BCMDataExports::Export"
  | CloudFormationGuardHook -> `String "AWS::CloudFormation::GuardHook"
  | CloudFrontPublicKey -> `String "AWS::CloudFront::PublicKey"
  | CloudTrailEventDataStore -> `String "AWS::CloudTrail::EventDataStore"
  | EntityResolutionIdMappingWorkflow -> `String "AWS::EntityResolution::IdMappingWorkflow"
  | EntityResolutionSchemaMapping -> `String "AWS::EntityResolution::SchemaMapping"
  | IoTDomainConfiguration -> `String "AWS::IoT::DomainConfiguration"
  | PCAConnectorADDirectoryRegistration -> `String "AWS::PCAConnectorAD::DirectoryRegistration"
  | RDSIntegration -> `String "AWS::RDS::Integration"
  | ConfigConformancePack -> `String "AWS::Config::ConformancePack"
  | RolesAnywhereProfile -> `String "AWS::RolesAnywhere::Profile"
  | CodeArtifactDomain -> `String "AWS::CodeArtifact::Domain"
  | BackupRestoreTestingPlan -> `String "AWS::Backup::RestoreTestingPlan"
  | ConfigStoredQuery -> `String "AWS::Config::StoredQuery"
  | SageMakerDataQualityJobDefinition -> `String "AWS::SageMaker::DataQualityJobDefinition"
  | SageMakerModelExplainabilityJobDefinition ->
      `String "AWS::SageMaker::ModelExplainabilityJobDefinition"
  | SageMakerModelQualityJobDefinition -> `String "AWS::SageMaker::ModelQualityJobDefinition"
  | SageMakerStudioLifecycleConfig -> `String "AWS::SageMaker::StudioLifecycleConfig"
  | SESDedicatedIpPool -> `String "AWS::SES::DedicatedIpPool"
  | SESMailManagerTrafficPolicy -> `String "AWS::SES::MailManagerTrafficPolicy"
  | SSMResourceDataSync -> `String "AWS::SSM::ResourceDataSync"
  | BedrockAgentCoreRuntime -> `String "AWS::BedrockAgentCore::Runtime"
  | BedrockAgentCoreBrowserCustom -> `String "AWS::BedrockAgentCore::BrowserCustom"
  | ElasticLoadBalancingV2TargetGroup -> `String "AWS::ElasticLoadBalancingV2::TargetGroup"
  | EMRContainersVirtualCluster -> `String "AWS::EMRContainers::VirtualCluster"
  | EntityResolutionMatchingWorkflow -> `String "AWS::EntityResolution::MatchingWorkflow"
  | IoTCoreDeviceAdvisorSuiteDefinition -> `String "AWS::IoTCoreDeviceAdvisor::SuiteDefinition"
  | EC2SecurityGroupVpcAssociation -> `String "AWS::EC2::SecurityGroupVpcAssociation"
  | EC2VerifiedAccessInstance -> `String "AWS::EC2::VerifiedAccessInstance"
  | KafkaConnectCustomPlugin -> `String "AWS::KafkaConnect::CustomPlugin"
  | NetworkManagerTransitGatewayPeering -> `String "AWS::NetworkManager::TransitGatewayPeering"
  | OpenSearchServerlessSecurityConfig -> `String "AWS::OpenSearchServerless::SecurityConfig"
  | RedshiftIntegration -> `String "AWS::Redshift::Integration"
  | RolesAnywhereTrustAnchor -> `String "AWS::RolesAnywhere::TrustAnchor"
  | Route53ProfilesProfileAssociation -> `String "AWS::Route53Profiles::ProfileAssociation"
  | SSMIncidentsResponsePlan -> `String "AWS::SSMIncidents::ResponsePlan"
  | TransferServer -> `String "AWS::Transfer::Server"
  | GlueDatabase -> `String "AWS::Glue::Database"
  | OrganizationsOrganizationalUnit -> `String "AWS::Organizations::OrganizationalUnit"
  | EC2IPAMPoolCidr -> `String "AWS::EC2::IPAMPoolCidr"
  | EC2VPCGatewayAttachment -> `String "AWS::EC2::VPCGatewayAttachment"
  | BedrockPrompt -> `String "AWS::Bedrock::Prompt"
  | ComprehendFlywheel -> `String "AWS::Comprehend::Flywheel"
  | DataSyncAgent -> `String "AWS::DataSync::Agent"
  | MediaTailorLiveSource -> `String "AWS::MediaTailor::LiveSource"
  | MSKServerlessCluster -> `String "AWS::MSK::ServerlessCluster"
  | IoTSiteWiseAsset -> `String "AWS::IoTSiteWise::Asset"
  | B2BICapability -> `String "AWS::B2BI::Capability"
  | CloudFrontKeyValueStore -> `String "AWS::CloudFront::KeyValueStore"
  | DeadlineMonitor -> `String "AWS::Deadline::Monitor"
  | GuardDutyMalwareProtectionPlan -> `String "AWS::GuardDuty::MalwareProtectionPlan"
  | LocationAPIKey -> `String "AWS::Location::APIKey"
  | MediaPackageV2OriginEndpoint -> `String "AWS::MediaPackageV2::OriginEndpoint"
  | PCAConnectorADConnector -> `String "AWS::PCAConnectorAD::Connector"
  | S3TablesTableBucketPolicy -> `String "AWS::S3Tables::TableBucketPolicy"
  | SecretsManagerResourcePolicy -> `String "AWS::SecretsManager::ResourcePolicy"
  | SSMContactsContact -> `String "AWS::SSMContacts::Contact"
  | IoTThingGroup -> `String "AWS::IoT::ThingGroup"
  | ImageBuilderLifecyclePolicy -> `String "AWS::ImageBuilder::LifecyclePolicy"
  | GameLiftBuild -> `String "AWS::GameLift::Build"
  | ECRReplicationConfiguration -> `String "AWS::ECR::ReplicationConfiguration"
  | EC2SubnetCidrBlock -> `String "AWS::EC2::SubnetCidrBlock"
  | ConnectSecurityProfile -> `String "AWS::Connect::SecurityProfile"
  | CleanRoomsMLTrainingDataset -> `String "AWS::CleanRoomsML::TrainingDataset"
  | AppStreamAppBlockBuilder -> `String "AWS::AppStream::AppBlockBuilder"
  | Route53DNSSEC -> `String "AWS::Route53::DNSSEC"
  | SageMakerUserProfile -> `String "AWS::SageMaker::UserProfile"
  | ApiGatewayMethod -> `String "AWS::ApiGateway::Method"

let resource_id_to_yojson = string_to_yojson

let aggregate_resource_identifier_to_yojson (x : aggregate_resource_identifier) =
  assoc_to_yojson
    [
      ("SourceAccountId", Some (account_id_to_yojson x.source_account_id));
      ("SourceRegion", Some (aws_region_to_yojson x.source_region));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("ResourceType", Some (resource_type_to_yojson x.resource_type));
      ("ResourceName", option_to_yojson resource_name_to_yojson x.resource_name);
    ]

let aggregated_source_status_type_to_yojson (x : aggregated_source_status_type) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | OUTDATED -> `String "OUTDATED"

let aggregated_source_type_to_yojson (x : aggregated_source_type) =
  match x with ACCOUNT -> `String "ACCOUNT" | ORGANIZATION -> `String "ORGANIZATION"

let aggregated_source_status_to_yojson (x : aggregated_source_status) =
  assoc_to_yojson
    [
      ("SourceId", option_to_yojson string__to_yojson x.source_id);
      ("SourceType", option_to_yojson aggregated_source_type_to_yojson x.source_type);
      ("AwsRegion", option_to_yojson aws_region_to_yojson x.aws_region);
      ( "LastUpdateStatus",
        option_to_yojson aggregated_source_status_type_to_yojson x.last_update_status );
      ("LastUpdateTime", option_to_yojson date_to_yojson x.last_update_time);
      ("LastErrorCode", option_to_yojson string__to_yojson x.last_error_code);
      ("LastErrorMessage", option_to_yojson string__to_yojson x.last_error_message);
    ]

let aggregated_source_status_list_to_yojson tree =
  list_to_yojson aggregated_source_status_to_yojson tree

let aggregated_source_status_type_list_to_yojson tree =
  list_to_yojson aggregated_source_status_type_to_yojson tree

let aggregation_authorization_to_yojson (x : aggregation_authorization) =
  assoc_to_yojson
    [
      ( "AggregationAuthorizationArn",
        option_to_yojson string__to_yojson x.aggregation_authorization_arn );
      ("AuthorizedAccountId", option_to_yojson account_id_to_yojson x.authorized_account_id);
      ("AuthorizedAwsRegion", option_to_yojson aws_region_to_yojson x.authorized_aws_region);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
    ]

let aggregation_authorization_list_to_yojson tree =
  list_to_yojson aggregation_authorization_to_yojson tree

let resource_type_value_to_yojson = string_to_yojson
let resource_type_value_list_to_yojson tree = list_to_yojson resource_type_value_to_yojson tree

let aggregator_filter_type_to_yojson (x : aggregator_filter_type) =
  match x with INCLUDE -> `String "INCLUDE"

let aggregator_filter_resource_type_to_yojson (x : aggregator_filter_resource_type) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson aggregator_filter_type_to_yojson x.type_);
      ("Value", option_to_yojson resource_type_value_list_to_yojson x.value);
    ]

let service_principal_value_to_yojson = string_to_yojson

let service_principal_value_list_to_yojson tree =
  list_to_yojson service_principal_value_to_yojson tree

let aggregator_filter_service_principal_to_yojson (x : aggregator_filter_service_principal) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson aggregator_filter_type_to_yojson x.type_);
      ("Value", option_to_yojson service_principal_value_list_to_yojson x.value);
    ]

let aggregator_filters_to_yojson (x : aggregator_filters) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson aggregator_filter_resource_type_to_yojson x.resource_type);
      ( "ServicePrincipal",
        option_to_yojson aggregator_filter_service_principal_to_yojson x.service_principal );
    ]

let all_supported_to_yojson = bool_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let annotation_to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let no_such_configuration_recorder_exception_to_yojson
    (x : no_such_configuration_recorder_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let service_principal_to_yojson = string_to_yojson

let recording_scope_to_yojson (x : recording_scope) =
  match x with INTERNAL -> `String "INTERNAL" | PAID -> `String "PAID"

let recording_frequency_to_yojson (x : recording_frequency) =
  match x with CONTINUOUS -> `String "CONTINUOUS" | DAILY -> `String "DAILY"

let recording_mode_resource_types_list_to_yojson tree = list_to_yojson resource_type_to_yojson tree
let description_to_yojson = string_to_yojson

let recording_mode_override_to_yojson (x : recording_mode_override) =
  assoc_to_yojson
    [
      ("description", option_to_yojson description_to_yojson x.description);
      ("resourceTypes", Some (recording_mode_resource_types_list_to_yojson x.resource_types));
      ("recordingFrequency", Some (recording_frequency_to_yojson x.recording_frequency));
    ]

let recording_mode_overrides_to_yojson tree = list_to_yojson recording_mode_override_to_yojson tree

let recording_mode_to_yojson (x : recording_mode) =
  assoc_to_yojson
    [
      ("recordingFrequency", Some (recording_frequency_to_yojson x.recording_frequency));
      ( "recordingModeOverrides",
        option_to_yojson recording_mode_overrides_to_yojson x.recording_mode_overrides );
    ]

let recording_strategy_type_to_yojson (x : recording_strategy_type) =
  match x with
  | ALL_SUPPORTED_RESOURCE_TYPES -> `String "ALL_SUPPORTED_RESOURCE_TYPES"
  | INCLUSION_BY_RESOURCE_TYPES -> `String "INCLUSION_BY_RESOURCE_TYPES"
  | EXCLUSION_BY_RESOURCE_TYPES -> `String "EXCLUSION_BY_RESOURCE_TYPES"

let recording_strategy_to_yojson (x : recording_strategy) =
  assoc_to_yojson [ ("useOnly", option_to_yojson recording_strategy_type_to_yojson x.use_only) ]

let resource_type_list_to_yojson tree = list_to_yojson resource_type_to_yojson tree

let exclusion_by_resource_types_to_yojson (x : exclusion_by_resource_types) =
  assoc_to_yojson
    [ ("resourceTypes", option_to_yojson resource_type_list_to_yojson x.resource_types) ]

let include_global_resource_types_to_yojson = bool_to_yojson

let recording_group_to_yojson (x : recording_group) =
  assoc_to_yojson
    [
      ("allSupported", option_to_yojson all_supported_to_yojson x.all_supported);
      ( "includeGlobalResourceTypes",
        option_to_yojson include_global_resource_types_to_yojson x.include_global_resource_types );
      ("resourceTypes", option_to_yojson resource_type_list_to_yojson x.resource_types);
      ( "exclusionByResourceTypes",
        option_to_yojson exclusion_by_resource_types_to_yojson x.exclusion_by_resource_types );
      ("recordingStrategy", option_to_yojson recording_strategy_to_yojson x.recording_strategy);
    ]

let recorder_name_to_yojson = string_to_yojson

let configuration_recorder_to_yojson (x : configuration_recorder) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("name", option_to_yojson recorder_name_to_yojson x.name);
      ("roleARN", option_to_yojson string__to_yojson x.role_ar_n);
      ("recordingGroup", option_to_yojson recording_group_to_yojson x.recording_group);
      ("recordingMode", option_to_yojson recording_mode_to_yojson x.recording_mode);
      ("recordingScope", option_to_yojson recording_scope_to_yojson x.recording_scope);
      ("servicePrincipal", option_to_yojson service_principal_to_yojson x.service_principal);
    ]

let associate_resource_types_response_to_yojson (x : associate_resource_types_response) =
  assoc_to_yojson
    [ ("ConfigurationRecorder", Some (configuration_recorder_to_yojson x.configuration_recorder)) ]

let associate_resource_types_request_to_yojson (x : associate_resource_types_request) =
  assoc_to_yojson
    [
      ( "ConfigurationRecorderArn",
        Some (amazon_resource_name_to_yojson x.configuration_recorder_arn) );
      ("ResourceTypes", Some (resource_type_list_to_yojson x.resource_types));
    ]

let auto_remediation_attempt_seconds_to_yojson = long_to_yojson
let auto_remediation_attempts_to_yojson = int_to_yojson
let availability_zone_to_yojson = string_to_yojson
let configuration_item_delivery_time_to_yojson = timestamp_epoch_seconds_to_yojson
let supplementary_configuration_value_to_yojson = string_to_yojson
let supplementary_configuration_name_to_yojson = string_to_yojson

let supplementary_configuration_to_yojson tree =
  map_to_yojson supplementary_configuration_name_to_yojson
    supplementary_configuration_value_to_yojson tree

let configuration_to_yojson = string_to_yojson
let resource_creation_time_to_yojson = timestamp_epoch_seconds_to_yojson
let configuration_state_id_to_yojson = string_to_yojson

let configuration_item_status_to_yojson (x : configuration_item_status) =
  match x with
  | OK -> `String "OK"
  | ResourceDiscovered -> `String "ResourceDiscovered"
  | ResourceNotRecorded -> `String "ResourceNotRecorded"
  | ResourceDeleted -> `String "ResourceDeleted"
  | ResourceDeletedNotRecorded -> `String "ResourceDeletedNotRecorded"

let configuration_item_capture_time_to_yojson = timestamp_epoch_seconds_to_yojson
let version_to_yojson = string_to_yojson

let base_configuration_item_to_yojson (x : base_configuration_item) =
  assoc_to_yojson
    [
      ("version", option_to_yojson version_to_yojson x.version);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "configurationItemCaptureTime",
        option_to_yojson configuration_item_capture_time_to_yojson x.configuration_item_capture_time
      );
      ( "configurationItemStatus",
        option_to_yojson configuration_item_status_to_yojson x.configuration_item_status );
      ( "configurationStateId",
        option_to_yojson configuration_state_id_to_yojson x.configuration_state_id );
      ("arn", option_to_yojson ar_n_to_yojson x.arn);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("resourceName", option_to_yojson resource_name_to_yojson x.resource_name);
      ("awsRegion", option_to_yojson aws_region_to_yojson x.aws_region);
      ("availabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ( "resourceCreationTime",
        option_to_yojson resource_creation_time_to_yojson x.resource_creation_time );
      ("configuration", option_to_yojson configuration_to_yojson x.configuration);
      ( "supplementaryConfiguration",
        option_to_yojson supplementary_configuration_to_yojson x.supplementary_configuration );
      ("recordingFrequency", option_to_yojson recording_frequency_to_yojson x.recording_frequency);
      ( "configurationItemDeliveryTime",
        option_to_yojson configuration_item_delivery_time_to_yojson
          x.configuration_item_delivery_time );
    ]

let base_configuration_items_to_yojson tree = list_to_yojson base_configuration_item_to_yojson tree

let no_such_configuration_aggregator_exception_to_yojson
    (x : no_such_configuration_aggregator_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let unprocessed_resource_identifier_list_to_yojson tree =
  list_to_yojson aggregate_resource_identifier_to_yojson tree

let batch_get_aggregate_resource_config_response_to_yojson
    (x : batch_get_aggregate_resource_config_response) =
  assoc_to_yojson
    [
      ( "BaseConfigurationItems",
        option_to_yojson base_configuration_items_to_yojson x.base_configuration_items );
      ( "UnprocessedResourceIdentifiers",
        option_to_yojson unprocessed_resource_identifier_list_to_yojson
          x.unprocessed_resource_identifiers );
    ]

let resource_identifiers_list_to_yojson tree =
  list_to_yojson aggregate_resource_identifier_to_yojson tree

let configuration_aggregator_name_to_yojson = string_to_yojson

let batch_get_aggregate_resource_config_request_to_yojson
    (x : batch_get_aggregate_resource_config_request) =
  assoc_to_yojson
    [
      ( "ConfigurationAggregatorName",
        Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name) );
      ("ResourceIdentifiers", Some (resource_identifiers_list_to_yojson x.resource_identifiers));
    ]

let no_available_configuration_recorder_exception_to_yojson
    (x : no_available_configuration_recorder_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let resource_key_to_yojson (x : resource_key) =
  assoc_to_yojson
    [
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
      ("resourceId", Some (resource_id_to_yojson x.resource_id));
    ]

let resource_keys_to_yojson tree = list_to_yojson resource_key_to_yojson tree

let batch_get_resource_config_response_to_yojson (x : batch_get_resource_config_response) =
  assoc_to_yojson
    [
      ( "baseConfigurationItems",
        option_to_yojson base_configuration_items_to_yojson x.base_configuration_items );
      ( "unprocessedResourceKeys",
        option_to_yojson resource_keys_to_yojson x.unprocessed_resource_keys );
    ]

let batch_get_resource_config_request_to_yojson (x : batch_get_resource_config_request) =
  assoc_to_yojson [ ("resourceKeys", Some (resource_keys_to_yojson x.resource_keys)) ]

let channel_name_to_yojson = string_to_yojson

let chronological_order_to_yojson (x : chronological_order) =
  match x with Reverse -> `String "Reverse" | Forward -> `String "Forward"

let client_token_to_yojson = string_to_yojson
let string_with_char_limit64_to_yojson = string_to_yojson

let compliance_by_config_rule_to_yojson (x : compliance_by_config_rule) =
  assoc_to_yojson
    [
      ("ConfigRuleName", option_to_yojson string_with_char_limit64_to_yojson x.config_rule_name);
      ("Compliance", option_to_yojson compliance_to_yojson x.compliance);
    ]

let compliance_by_config_rules_to_yojson tree =
  list_to_yojson compliance_by_config_rule_to_yojson tree

let compliance_by_resource_to_yojson (x : compliance_by_resource) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson string_with_char_limit256_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson base_resource_id_to_yojson x.resource_id);
      ("Compliance", option_to_yojson compliance_to_yojson x.compliance);
    ]

let compliance_by_resources_to_yojson tree = list_to_yojson compliance_by_resource_to_yojson tree

let compliance_resource_types_to_yojson tree =
  list_to_yojson string_with_char_limit256_to_yojson tree

let compliance_score_to_yojson = string_to_yojson

let compliance_summary_by_resource_type_to_yojson (x : compliance_summary_by_resource_type) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson string_with_char_limit256_to_yojson x.resource_type);
      ("ComplianceSummary", option_to_yojson compliance_summary_to_yojson x.compliance_summary);
    ]

let compliance_summaries_by_resource_type_to_yojson tree =
  list_to_yojson compliance_summary_by_resource_type_to_yojson tree

let compliance_types_to_yojson tree = list_to_yojson compliance_type_to_yojson tree

let delivery_status_to_yojson (x : delivery_status) =
  match x with
  | Success -> `String "Success"
  | Failure -> `String "Failure"
  | Not_Applicable -> `String "Not_Applicable"

let config_export_delivery_info_to_yojson (x : config_export_delivery_info) =
  assoc_to_yojson
    [
      ("lastStatus", option_to_yojson delivery_status_to_yojson x.last_status);
      ("lastErrorCode", option_to_yojson string__to_yojson x.last_error_code);
      ("lastErrorMessage", option_to_yojson string__to_yojson x.last_error_message);
      ("lastAttemptTime", option_to_yojson date_to_yojson x.last_attempt_time);
      ("lastSuccessfulTime", option_to_yojson date_to_yojson x.last_successful_time);
      ("nextDeliveryTime", option_to_yojson date_to_yojson x.next_delivery_time);
    ]

let rule_evaluation_visibility_to_yojson (x : rule_evaluation_visibility) =
  match x with EXTERNAL -> `String "EXTERNAL" | INTERNAL -> `String "INTERNAL"

let evaluation_mode_configuration_to_yojson (x : evaluation_mode_configuration) =
  assoc_to_yojson [ ("Mode", option_to_yojson evaluation_mode_to_yojson x.mode) ]

let evaluation_modes_to_yojson tree = list_to_yojson evaluation_mode_configuration_to_yojson tree

let config_rule_state_to_yojson (x : config_rule_state) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | DELETING_RESULTS -> `String "DELETING_RESULTS"
  | EVALUATING -> `String "EVALUATING"

let maximum_execution_frequency_to_yojson (x : maximum_execution_frequency) =
  match x with
  | One_Hour -> `String "One_Hour"
  | Three_Hours -> `String "Three_Hours"
  | Six_Hours -> `String "Six_Hours"
  | Twelve_Hours -> `String "Twelve_Hours"
  | TwentyFour_Hours -> `String "TwentyFour_Hours"

let string_with_char_limit1024_to_yojson = string_to_yojson
let policy_text_to_yojson = string_to_yojson
let policy_runtime_to_yojson = string_to_yojson

let custom_policy_details_to_yojson (x : custom_policy_details) =
  assoc_to_yojson
    [
      ("PolicyRuntime", Some (policy_runtime_to_yojson x.policy_runtime));
      ("PolicyText", Some (policy_text_to_yojson x.policy_text));
      ("EnableDebugLogDelivery", option_to_yojson boolean__to_yojson x.enable_debug_log_delivery);
    ]

let message_type_to_yojson (x : message_type) =
  match x with
  | ConfigurationItemChangeNotification -> `String "ConfigurationItemChangeNotification"
  | ConfigurationSnapshotDeliveryCompleted -> `String "ConfigurationSnapshotDeliveryCompleted"
  | ScheduledNotification -> `String "ScheduledNotification"
  | OversizedConfigurationItemChangeNotification ->
      `String "OversizedConfigurationItemChangeNotification"

let event_source_to_yojson (x : event_source) = match x with Aws_Config -> `String "aws.config"

let source_detail_to_yojson (x : source_detail) =
  assoc_to_yojson
    [
      ("EventSource", option_to_yojson event_source_to_yojson x.event_source);
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ( "MaximumExecutionFrequency",
        option_to_yojson maximum_execution_frequency_to_yojson x.maximum_execution_frequency );
    ]

let source_details_to_yojson tree = list_to_yojson source_detail_to_yojson tree

let owner_to_yojson (x : owner) =
  match x with
  | Custom_Lambda -> `String "CUSTOM_LAMBDA"
  | Aws -> `String "AWS"
  | Custom_Policy -> `String "CUSTOM_POLICY"

let source_to_yojson (x : source) =
  assoc_to_yojson
    [
      ("Owner", Some (owner_to_yojson x.owner));
      ("SourceIdentifier", option_to_yojson string_with_char_limit256_to_yojson x.source_identifier);
      ("SourceDetails", option_to_yojson source_details_to_yojson x.source_details);
      ( "CustomPolicyDetails",
        option_to_yojson custom_policy_details_to_yojson x.custom_policy_details );
    ]

let string_with_char_limit128_to_yojson = string_to_yojson
let service_principals_to_yojson tree = list_to_yojson string_with_char_limit128_to_yojson tree

let scope_to_yojson (x : scope) =
  assoc_to_yojson
    [
      ( "ComplianceResourceTypes",
        option_to_yojson compliance_resource_types_to_yojson x.compliance_resource_types );
      ("TagKey", option_to_yojson string_with_char_limit128_to_yojson x.tag_key);
      ("TagValue", option_to_yojson string_with_char_limit256_to_yojson x.tag_value);
      ("ComplianceResourceId", option_to_yojson base_resource_id_to_yojson x.compliance_resource_id);
      ("ServicePrincipals", option_to_yojson service_principals_to_yojson x.service_principals);
    ]

let emptiable_string_with_char_limit256_to_yojson = string_to_yojson

let config_rule_to_yojson (x : config_rule) =
  assoc_to_yojson
    [
      ("ConfigRuleName", option_to_yojson config_rule_name_to_yojson x.config_rule_name);
      ("ConfigRuleArn", option_to_yojson string_with_char_limit256_to_yojson x.config_rule_arn);
      ("ConfigRuleId", option_to_yojson string_with_char_limit64_to_yojson x.config_rule_id);
      ("Description", option_to_yojson emptiable_string_with_char_limit256_to_yojson x.description);
      ("Scope", option_to_yojson scope_to_yojson x.scope);
      ("Source", Some (source_to_yojson x.source));
      ("InputParameters", option_to_yojson string_with_char_limit1024_to_yojson x.input_parameters);
      ( "MaximumExecutionFrequency",
        option_to_yojson maximum_execution_frequency_to_yojson x.maximum_execution_frequency );
      ("ConfigRuleState", option_to_yojson config_rule_state_to_yojson x.config_rule_state);
      ("CreatedBy", option_to_yojson string_with_char_limit256_to_yojson x.created_by);
      ("EvaluationModes", option_to_yojson evaluation_modes_to_yojson x.evaluation_modes);
      ( "RuleEvaluationVisibility",
        option_to_yojson rule_evaluation_visibility_to_yojson x.rule_evaluation_visibility );
    ]

let config_rule_compliance_filters_to_yojson (x : config_rule_compliance_filters) =
  assoc_to_yojson
    [
      ("ConfigRuleName", option_to_yojson config_rule_name_to_yojson x.config_rule_name);
      ("ComplianceType", option_to_yojson compliance_type_to_yojson x.compliance_type);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("AwsRegion", option_to_yojson aws_region_to_yojson x.aws_region);
    ]

let config_rule_compliance_summary_filters_to_yojson (x : config_rule_compliance_summary_filters) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("AwsRegion", option_to_yojson aws_region_to_yojson x.aws_region);
    ]

let config_rule_compliance_summary_group_key_to_yojson
    (x : config_rule_compliance_summary_group_key) =
  match x with ACCOUNT_ID -> `String "ACCOUNT_ID" | AWS_REGION -> `String "AWS_REGION"

let config_rule_evaluation_status_to_yojson (x : config_rule_evaluation_status) =
  assoc_to_yojson
    [
      ("ConfigRuleName", option_to_yojson config_rule_name_to_yojson x.config_rule_name);
      ("ConfigRuleArn", option_to_yojson string__to_yojson x.config_rule_arn);
      ("ConfigRuleId", option_to_yojson string__to_yojson x.config_rule_id);
      ( "LastSuccessfulInvocationTime",
        option_to_yojson date_to_yojson x.last_successful_invocation_time );
      ("LastFailedInvocationTime", option_to_yojson date_to_yojson x.last_failed_invocation_time);
      ( "LastSuccessfulEvaluationTime",
        option_to_yojson date_to_yojson x.last_successful_evaluation_time );
      ("LastFailedEvaluationTime", option_to_yojson date_to_yojson x.last_failed_evaluation_time);
      ("FirstActivatedTime", option_to_yojson date_to_yojson x.first_activated_time);
      ("LastDeactivatedTime", option_to_yojson date_to_yojson x.last_deactivated_time);
      ("LastErrorCode", option_to_yojson string__to_yojson x.last_error_code);
      ("LastErrorMessage", option_to_yojson string__to_yojson x.last_error_message);
      ("FirstEvaluationStarted", option_to_yojson boolean__to_yojson x.first_evaluation_started);
      ( "LastDebugLogDeliveryStatus",
        option_to_yojson string__to_yojson x.last_debug_log_delivery_status );
      ( "LastDebugLogDeliveryStatusReason",
        option_to_yojson string__to_yojson x.last_debug_log_delivery_status_reason );
      ("LastDebugLogDeliveryTime", option_to_yojson date_to_yojson x.last_debug_log_delivery_time);
    ]

let config_rule_evaluation_status_list_to_yojson tree =
  list_to_yojson config_rule_evaluation_status_to_yojson tree

let config_rule_names_to_yojson tree = list_to_yojson config_rule_name_to_yojson tree
let config_rules_to_yojson tree = list_to_yojson config_rule_to_yojson tree

let config_snapshot_delivery_properties_to_yojson (x : config_snapshot_delivery_properties) =
  assoc_to_yojson
    [
      ( "deliveryFrequency",
        option_to_yojson maximum_execution_frequency_to_yojson x.delivery_frequency );
    ]

let config_stream_delivery_info_to_yojson (x : config_stream_delivery_info) =
  assoc_to_yojson
    [
      ("lastStatus", option_to_yojson delivery_status_to_yojson x.last_status);
      ("lastErrorCode", option_to_yojson string__to_yojson x.last_error_code);
      ("lastErrorMessage", option_to_yojson string__to_yojson x.last_error_message);
      ("lastStatusChangeTime", option_to_yojson date_to_yojson x.last_status_change_time);
    ]

let organization_aggregation_source_to_yojson (x : organization_aggregation_source) =
  assoc_to_yojson
    [
      ("RoleArn", Some (string__to_yojson x.role_arn));
      ("AwsRegions", option_to_yojson aggregator_region_list_to_yojson x.aws_regions);
      ("AllAwsRegions", option_to_yojson boolean__to_yojson x.all_aws_regions);
    ]

let configuration_aggregator_arn_to_yojson = string_to_yojson

let configuration_aggregator_to_yojson (x : configuration_aggregator) =
  assoc_to_yojson
    [
      ( "ConfigurationAggregatorName",
        option_to_yojson configuration_aggregator_name_to_yojson x.configuration_aggregator_name );
      ( "ConfigurationAggregatorArn",
        option_to_yojson configuration_aggregator_arn_to_yojson x.configuration_aggregator_arn );
      ( "AccountAggregationSources",
        option_to_yojson account_aggregation_source_list_to_yojson x.account_aggregation_sources );
      ( "OrganizationAggregationSource",
        option_to_yojson organization_aggregation_source_to_yojson x.organization_aggregation_source
      );
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("LastUpdatedTime", option_to_yojson date_to_yojson x.last_updated_time);
      ("CreatedBy", option_to_yojson string_with_char_limit256_to_yojson x.created_by);
      ("AggregatorFilters", option_to_yojson aggregator_filters_to_yojson x.aggregator_filters);
    ]

let configuration_aggregator_list_to_yojson tree =
  list_to_yojson configuration_aggregator_to_yojson tree

let configuration_aggregator_name_list_to_yojson tree =
  list_to_yojson configuration_aggregator_name_to_yojson tree

let relationship_name_to_yojson = string_to_yojson

let relationship_to_yojson (x : relationship) =
  assoc_to_yojson
    [
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("resourceName", option_to_yojson resource_name_to_yojson x.resource_name);
      ("relationshipName", option_to_yojson relationship_name_to_yojson x.relationship_name);
    ]

let relationship_list_to_yojson tree = list_to_yojson relationship_to_yojson tree
let related_event_to_yojson = string_to_yojson
let related_event_list_to_yojson tree = list_to_yojson related_event_to_yojson tree
let value_to_yojson = string_to_yojson
let name_to_yojson = string_to_yojson
let tags_to_yojson tree = map_to_yojson name_to_yojson value_to_yojson tree
let configuration_item_md5_hash_to_yojson = string_to_yojson

let configuration_item_to_yojson (x : configuration_item) =
  assoc_to_yojson
    [
      ("version", option_to_yojson version_to_yojson x.version);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "configurationItemCaptureTime",
        option_to_yojson configuration_item_capture_time_to_yojson x.configuration_item_capture_time
      );
      ( "configurationItemStatus",
        option_to_yojson configuration_item_status_to_yojson x.configuration_item_status );
      ( "configurationStateId",
        option_to_yojson configuration_state_id_to_yojson x.configuration_state_id );
      ( "configurationItemMD5Hash",
        option_to_yojson configuration_item_md5_hash_to_yojson x.configuration_item_md5_hash );
      ("arn", option_to_yojson ar_n_to_yojson x.arn);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("resourceName", option_to_yojson resource_name_to_yojson x.resource_name);
      ("awsRegion", option_to_yojson aws_region_to_yojson x.aws_region);
      ("availabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ( "resourceCreationTime",
        option_to_yojson resource_creation_time_to_yojson x.resource_creation_time );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("relatedEvents", option_to_yojson related_event_list_to_yojson x.related_events);
      ("relationships", option_to_yojson relationship_list_to_yojson x.relationships);
      ("configuration", option_to_yojson configuration_to_yojson x.configuration);
      ( "supplementaryConfiguration",
        option_to_yojson supplementary_configuration_to_yojson x.supplementary_configuration );
      ("recordingFrequency", option_to_yojson recording_frequency_to_yojson x.recording_frequency);
      ( "configurationItemDeliveryTime",
        option_to_yojson configuration_item_delivery_time_to_yojson
          x.configuration_item_delivery_time );
    ]

let configuration_item_list_to_yojson tree = list_to_yojson configuration_item_to_yojson tree
let configuration_recorder_filter_value_to_yojson = string_to_yojson

let configuration_recorder_filter_values_to_yojson tree =
  list_to_yojson configuration_recorder_filter_value_to_yojson tree

let configuration_recorder_filter_name_to_yojson (x : configuration_recorder_filter_name) =
  match x with RecordingScope -> `String "recordingScope"

let configuration_recorder_filter_to_yojson (x : configuration_recorder_filter) =
  assoc_to_yojson
    [
      ("filterName", option_to_yojson configuration_recorder_filter_name_to_yojson x.filter_name);
      ("filterValue", option_to_yojson configuration_recorder_filter_values_to_yojson x.filter_value);
    ]

let configuration_recorder_filter_list_to_yojson tree =
  list_to_yojson configuration_recorder_filter_to_yojson tree

let configuration_recorder_list_to_yojson tree =
  list_to_yojson configuration_recorder_to_yojson tree

let configuration_recorder_name_list_to_yojson tree = list_to_yojson recorder_name_to_yojson tree

let recorder_status_to_yojson (x : recorder_status) =
  match x with
  | Pending -> `String "Pending"
  | Success -> `String "Success"
  | Failure -> `String "Failure"
  | NotApplicable -> `String "NotApplicable"

let configuration_recorder_status_to_yojson (x : configuration_recorder_status) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("name", option_to_yojson string__to_yojson x.name);
      ("lastStartTime", option_to_yojson date_to_yojson x.last_start_time);
      ("lastStopTime", option_to_yojson date_to_yojson x.last_stop_time);
      ("recording", option_to_yojson boolean__to_yojson x.recording);
      ("lastStatus", option_to_yojson recorder_status_to_yojson x.last_status);
      ("lastErrorCode", option_to_yojson string__to_yojson x.last_error_code);
      ("lastErrorMessage", option_to_yojson string__to_yojson x.last_error_message);
      ("lastStatusChangeTime", option_to_yojson date_to_yojson x.last_status_change_time);
      ("servicePrincipal", option_to_yojson service_principal_to_yojson x.service_principal);
    ]

let configuration_recorder_status_list_to_yojson tree =
  list_to_yojson configuration_recorder_status_to_yojson tree

let configuration_recorder_summary_to_yojson (x : configuration_recorder_summary) =
  assoc_to_yojson
    [
      ("arn", Some (amazon_resource_name_to_yojson x.arn));
      ("name", Some (recorder_name_to_yojson x.name));
      ("servicePrincipal", option_to_yojson service_principal_to_yojson x.service_principal);
      ("recordingScope", Some (recording_scope_to_yojson x.recording_scope));
    ]

let configuration_recorder_summaries_to_yojson tree =
  list_to_yojson configuration_recorder_summary_to_yojson tree

let conformance_pack_arn_to_yojson = string_to_yojson

let conformance_pack_config_rule_names_to_yojson tree =
  list_to_yojson string_with_char_limit64_to_yojson tree

let conformance_pack_compliance_filters_to_yojson (x : conformance_pack_compliance_filters) =
  assoc_to_yojson
    [
      ( "ConfigRuleNames",
        option_to_yojson conformance_pack_config_rule_names_to_yojson x.config_rule_names );
      ( "ComplianceType",
        option_to_yojson conformance_pack_compliance_type_to_yojson x.compliance_type );
    ]

let conformance_pack_compliance_resource_ids_to_yojson tree =
  list_to_yojson string_with_char_limit256_to_yojson tree

let last_updated_time_to_yojson = timestamp_epoch_seconds_to_yojson

let conformance_pack_compliance_score_to_yojson (x : conformance_pack_compliance_score) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson compliance_score_to_yojson x.score);
      ( "ConformancePackName",
        option_to_yojson conformance_pack_name_to_yojson x.conformance_pack_name );
      ("LastUpdatedTime", option_to_yojson last_updated_time_to_yojson x.last_updated_time);
    ]

let conformance_pack_compliance_scores_to_yojson tree =
  list_to_yojson conformance_pack_compliance_score_to_yojson tree

let conformance_pack_name_filter_to_yojson tree =
  list_to_yojson conformance_pack_name_to_yojson tree

let conformance_pack_compliance_scores_filters_to_yojson
    (x : conformance_pack_compliance_scores_filters) =
  assoc_to_yojson
    [
      ( "ConformancePackNames",
        Some (conformance_pack_name_filter_to_yojson x.conformance_pack_names) );
    ]

let conformance_pack_compliance_summary_to_yojson (x : conformance_pack_compliance_summary) =
  assoc_to_yojson
    [
      ("ConformancePackName", Some (conformance_pack_name_to_yojson x.conformance_pack_name));
      ( "ConformancePackComplianceStatus",
        Some (conformance_pack_compliance_type_to_yojson x.conformance_pack_compliance_status) );
    ]

let conformance_pack_compliance_summary_list_to_yojson tree =
  list_to_yojson conformance_pack_compliance_summary_to_yojson tree

let ssm_document_version_to_yojson = string_to_yojson
let ssm_document_name_to_yojson = string_to_yojson

let template_ssm_document_details_to_yojson (x : template_ssm_document_details) =
  assoc_to_yojson
    [
      ("DocumentName", Some (ssm_document_name_to_yojson x.document_name));
      ("DocumentVersion", option_to_yojson ssm_document_version_to_yojson x.document_version);
    ]

let parameter_value_to_yojson = string_to_yojson
let parameter_name_to_yojson = string_to_yojson

let conformance_pack_input_parameter_to_yojson (x : conformance_pack_input_parameter) =
  assoc_to_yojson
    [
      ("ParameterName", Some (parameter_name_to_yojson x.parameter_name));
      ("ParameterValue", Some (parameter_value_to_yojson x.parameter_value));
    ]

let conformance_pack_input_parameters_to_yojson tree =
  list_to_yojson conformance_pack_input_parameter_to_yojson tree

let delivery_s3_key_prefix_to_yojson = string_to_yojson
let delivery_s3_bucket_to_yojson = string_to_yojson
let conformance_pack_id_to_yojson = string_to_yojson

let conformance_pack_detail_to_yojson (x : conformance_pack_detail) =
  assoc_to_yojson
    [
      ("ConformancePackName", Some (conformance_pack_name_to_yojson x.conformance_pack_name));
      ("ConformancePackArn", Some (conformance_pack_arn_to_yojson x.conformance_pack_arn));
      ("ConformancePackId", Some (conformance_pack_id_to_yojson x.conformance_pack_id));
      ("DeliveryS3Bucket", option_to_yojson delivery_s3_bucket_to_yojson x.delivery_s3_bucket);
      ( "DeliveryS3KeyPrefix",
        option_to_yojson delivery_s3_key_prefix_to_yojson x.delivery_s3_key_prefix );
      ( "ConformancePackInputParameters",
        option_to_yojson conformance_pack_input_parameters_to_yojson
          x.conformance_pack_input_parameters );
      ("LastUpdateRequestedTime", option_to_yojson date_to_yojson x.last_update_requested_time);
      ("CreatedBy", option_to_yojson string_with_char_limit256_to_yojson x.created_by);
      ( "TemplateSSMDocumentDetails",
        option_to_yojson template_ssm_document_details_to_yojson x.template_ssm_document_details );
    ]

let conformance_pack_detail_list_to_yojson tree =
  list_to_yojson conformance_pack_detail_to_yojson tree

let conformance_pack_evaluation_filters_to_yojson (x : conformance_pack_evaluation_filters) =
  assoc_to_yojson
    [
      ( "ConfigRuleNames",
        option_to_yojson conformance_pack_config_rule_names_to_yojson x.config_rule_names );
      ( "ComplianceType",
        option_to_yojson conformance_pack_compliance_type_to_yojson x.compliance_type );
      ("ResourceType", option_to_yojson string_with_char_limit256_to_yojson x.resource_type);
      ( "ResourceIds",
        option_to_yojson conformance_pack_compliance_resource_ids_to_yojson x.resource_ids );
    ]

let conformance_pack_evaluation_result_to_yojson (x : conformance_pack_evaluation_result) =
  assoc_to_yojson
    [
      ("ComplianceType", Some (conformance_pack_compliance_type_to_yojson x.compliance_type));
      ( "EvaluationResultIdentifier",
        Some (evaluation_result_identifier_to_yojson x.evaluation_result_identifier) );
      ("ConfigRuleInvokedTime", Some (date_to_yojson x.config_rule_invoked_time));
      ("ResultRecordedTime", Some (date_to_yojson x.result_recorded_time));
      ("Annotation", option_to_yojson annotation_to_yojson x.annotation);
    ]

let conformance_pack_names_list_to_yojson tree = list_to_yojson conformance_pack_name_to_yojson tree

let conformance_pack_names_to_summarize_list_to_yojson tree =
  list_to_yojson conformance_pack_name_to_yojson tree

let controls_list_to_yojson tree = list_to_yojson string_with_char_limit128_to_yojson tree

let conformance_pack_rule_compliance_to_yojson (x : conformance_pack_rule_compliance) =
  assoc_to_yojson
    [
      ("ConfigRuleName", option_to_yojson config_rule_name_to_yojson x.config_rule_name);
      ( "ComplianceType",
        option_to_yojson conformance_pack_compliance_type_to_yojson x.compliance_type );
      ("Controls", option_to_yojson controls_list_to_yojson x.controls);
    ]

let conformance_pack_rule_compliance_list_to_yojson tree =
  list_to_yojson conformance_pack_rule_compliance_to_yojson tree

let conformance_pack_rule_evaluation_results_list_to_yojson tree =
  list_to_yojson conformance_pack_evaluation_result_to_yojson tree

let conformance_pack_state_to_yojson (x : conformance_pack_state) =
  match x with
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_COMPLETE -> `String "CREATE_COMPLETE"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | DELETE_FAILED -> `String "DELETE_FAILED"

let conformance_pack_status_reason_to_yojson = string_to_yojson
let stack_arn_to_yojson = string_to_yojson

let conformance_pack_status_detail_to_yojson (x : conformance_pack_status_detail) =
  assoc_to_yojson
    [
      ("ConformancePackName", Some (conformance_pack_name_to_yojson x.conformance_pack_name));
      ("ConformancePackId", Some (conformance_pack_id_to_yojson x.conformance_pack_id));
      ("ConformancePackArn", Some (conformance_pack_arn_to_yojson x.conformance_pack_arn));
      ("ConformancePackState", Some (conformance_pack_state_to_yojson x.conformance_pack_state));
      ("StackArn", Some (stack_arn_to_yojson x.stack_arn));
      ( "ConformancePackStatusReason",
        option_to_yojson conformance_pack_status_reason_to_yojson x.conformance_pack_status_reason
      );
      ("LastUpdateRequestedTime", Some (date_to_yojson x.last_update_requested_time));
      ("LastUpdateCompletedTime", option_to_yojson date_to_yojson x.last_update_completed_time);
    ]

let conformance_pack_status_details_list_to_yojson tree =
  list_to_yojson conformance_pack_status_detail_to_yojson tree

let conformance_pack_template_validation_exception_to_yojson
    (x : conformance_pack_template_validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let cosmos_page_limit_to_yojson = int_to_yojson
let debug_log_delivery_accounts_to_yojson tree = list_to_yojson account_id_to_yojson tree

let invalid_parameter_value_exception_to_yojson (x : invalid_parameter_value_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let delete_aggregation_authorization_request_to_yojson
    (x : delete_aggregation_authorization_request) =
  assoc_to_yojson
    [
      ("AuthorizedAccountId", Some (account_id_to_yojson x.authorized_account_id));
      ("AuthorizedAwsRegion", Some (aws_region_to_yojson x.authorized_aws_region));
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let no_such_config_rule_exception_to_yojson (x : no_such_config_rule_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let delete_config_rule_request_to_yojson (x : delete_config_rule_request) =
  assoc_to_yojson [ ("ConfigRuleName", Some (config_rule_name_to_yojson x.config_rule_name)) ]

let delete_configuration_aggregator_request_to_yojson (x : delete_configuration_aggregator_request)
    =
  assoc_to_yojson
    [
      ( "ConfigurationAggregatorName",
        Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name) );
    ]

let unmodifiable_entity_exception_to_yojson (x : unmodifiable_entity_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let delete_configuration_recorder_request_to_yojson (x : delete_configuration_recorder_request) =
  assoc_to_yojson
    [ ("ConfigurationRecorderName", Some (recorder_name_to_yojson x.configuration_recorder_name)) ]

let no_such_conformance_pack_exception_to_yojson (x : no_such_conformance_pack_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let delete_conformance_pack_request_to_yojson (x : delete_conformance_pack_request) =
  assoc_to_yojson
    [ ("ConformancePackName", Some (conformance_pack_name_to_yojson x.conformance_pack_name)) ]

let no_such_delivery_channel_exception_to_yojson (x : no_such_delivery_channel_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let last_delivery_channel_delete_failed_exception_to_yojson
    (x : last_delivery_channel_delete_failed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let delete_delivery_channel_request_to_yojson (x : delete_delivery_channel_request) =
  assoc_to_yojson [ ("DeliveryChannelName", Some (channel_name_to_yojson x.delivery_channel_name)) ]

let delete_evaluation_results_response_to_yojson = unit_to_yojson

let delete_evaluation_results_request_to_yojson (x : delete_evaluation_results_request) =
  assoc_to_yojson
    [ ("ConfigRuleName", Some (string_with_char_limit64_to_yojson x.config_rule_name)) ]

let organization_access_denied_exception_to_yojson (x : organization_access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let no_such_organization_config_rule_exception_to_yojson
    (x : no_such_organization_config_rule_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let organization_config_rule_name_to_yojson = string_to_yojson

let delete_organization_config_rule_request_to_yojson (x : delete_organization_config_rule_request)
    =
  assoc_to_yojson
    [
      ( "OrganizationConfigRuleName",
        Some (organization_config_rule_name_to_yojson x.organization_config_rule_name) );
    ]

let no_such_organization_conformance_pack_exception_to_yojson
    (x : no_such_organization_conformance_pack_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let organization_conformance_pack_name_to_yojson = string_to_yojson

let delete_organization_conformance_pack_request_to_yojson
    (x : delete_organization_conformance_pack_request) =
  assoc_to_yojson
    [
      ( "OrganizationConformancePackName",
        Some (organization_conformance_pack_name_to_yojson x.organization_conformance_pack_name) );
    ]

let delete_pending_aggregation_request_request_to_yojson
    (x : delete_pending_aggregation_request_request) =
  assoc_to_yojson
    [
      ("RequesterAccountId", Some (account_id_to_yojson x.requester_account_id));
      ("RequesterAwsRegion", Some (aws_region_to_yojson x.requester_aws_region));
    ]

let remediation_in_progress_exception_to_yojson (x : remediation_in_progress_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let no_such_remediation_configuration_exception_to_yojson
    (x : no_such_remediation_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let insufficient_permissions_exception_to_yojson (x : insufficient_permissions_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let delete_remediation_configuration_response_to_yojson = unit_to_yojson

let delete_remediation_configuration_request_to_yojson
    (x : delete_remediation_configuration_request) =
  assoc_to_yojson
    [
      ("ConfigRuleName", Some (config_rule_name_to_yojson x.config_rule_name));
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
    ]

let no_such_remediation_exception_exception_to_yojson (x : no_such_remediation_exception_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let remediation_exception_resource_key_to_yojson (x : remediation_exception_resource_key) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson string_with_char_limit256_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson string_with_char_limit1024_to_yojson x.resource_id);
    ]

let remediation_exception_resource_keys_to_yojson tree =
  list_to_yojson remediation_exception_resource_key_to_yojson tree

let failed_delete_remediation_exceptions_batch_to_yojson
    (x : failed_delete_remediation_exceptions_batch) =
  assoc_to_yojson
    [
      ("FailureMessage", option_to_yojson string__to_yojson x.failure_message);
      ("FailedItems", option_to_yojson remediation_exception_resource_keys_to_yojson x.failed_items);
    ]

let failed_delete_remediation_exceptions_batches_to_yojson tree =
  list_to_yojson failed_delete_remediation_exceptions_batch_to_yojson tree

let delete_remediation_exceptions_response_to_yojson (x : delete_remediation_exceptions_response) =
  assoc_to_yojson
    [
      ( "FailedBatches",
        option_to_yojson failed_delete_remediation_exceptions_batches_to_yojson x.failed_batches );
    ]

let delete_remediation_exceptions_request_to_yojson (x : delete_remediation_exceptions_request) =
  assoc_to_yojson
    [
      ("ConfigRuleName", Some (config_rule_name_to_yojson x.config_rule_name));
      ("ResourceKeys", Some (remediation_exception_resource_keys_to_yojson x.resource_keys));
    ]

let no_running_configuration_recorder_exception_to_yojson
    (x : no_running_configuration_recorder_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let resource_type_string_to_yojson = string_to_yojson

let delete_resource_config_request_to_yojson (x : delete_resource_config_request) =
  assoc_to_yojson
    [
      ("ResourceType", Some (resource_type_string_to_yojson x.resource_type));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
    ]

let no_such_retention_configuration_exception_to_yojson
    (x : no_such_retention_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let retention_configuration_name_to_yojson = string_to_yojson

let delete_retention_configuration_request_to_yojson (x : delete_retention_configuration_request) =
  assoc_to_yojson
    [
      ( "RetentionConfigurationName",
        Some (retention_configuration_name_to_yojson x.retention_configuration_name) );
    ]

let delete_service_linked_configuration_recorder_response_to_yojson
    (x : delete_service_linked_configuration_recorder_response) =
  assoc_to_yojson
    [
      ("Arn", Some (amazon_resource_name_to_yojson x.arn));
      ("Name", Some (recorder_name_to_yojson x.name));
    ]

let delete_service_linked_configuration_recorder_request_to_yojson
    (x : delete_service_linked_configuration_recorder_request) =
  assoc_to_yojson [ ("ServicePrincipal", Some (service_principal_to_yojson x.service_principal)) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let delete_stored_query_response_to_yojson = unit_to_yojson
let query_name_to_yojson = string_to_yojson

let delete_stored_query_request_to_yojson (x : delete_stored_query_request) =
  assoc_to_yojson [ ("QueryName", Some (query_name_to_yojson x.query_name)) ]

let deliver_config_snapshot_response_to_yojson (x : deliver_config_snapshot_response) =
  assoc_to_yojson [ ("configSnapshotId", option_to_yojson string__to_yojson x.config_snapshot_id) ]

let deliver_config_snapshot_request_to_yojson (x : deliver_config_snapshot_request) =
  assoc_to_yojson [ ("deliveryChannelName", Some (channel_name_to_yojson x.delivery_channel_name)) ]

let delivery_channel_to_yojson (x : delivery_channel) =
  assoc_to_yojson
    [
      ("name", option_to_yojson channel_name_to_yojson x.name);
      ("s3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
      ("s3KeyPrefix", option_to_yojson string__to_yojson x.s3_key_prefix);
      ("s3KmsKeyArn", option_to_yojson string__to_yojson x.s3_kms_key_arn);
      ("snsTopicARN", option_to_yojson string__to_yojson x.sns_topic_ar_n);
      ( "configSnapshotDeliveryProperties",
        option_to_yojson config_snapshot_delivery_properties_to_yojson
          x.config_snapshot_delivery_properties );
    ]

let delivery_channel_list_to_yojson tree = list_to_yojson delivery_channel_to_yojson tree
let delivery_channel_name_list_to_yojson tree = list_to_yojson channel_name_to_yojson tree

let delivery_channel_status_to_yojson (x : delivery_channel_status) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ( "configSnapshotDeliveryInfo",
        option_to_yojson config_export_delivery_info_to_yojson x.config_snapshot_delivery_info );
      ( "configHistoryDeliveryInfo",
        option_to_yojson config_export_delivery_info_to_yojson x.config_history_delivery_info );
      ( "configStreamDeliveryInfo",
        option_to_yojson config_stream_delivery_info_to_yojson x.config_stream_delivery_info );
    ]

let delivery_channel_status_list_to_yojson tree =
  list_to_yojson delivery_channel_status_to_yojson tree

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_limit_exception_to_yojson (x : invalid_limit_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let next_token_to_yojson = string_to_yojson

let describe_aggregate_compliance_by_config_rules_response_to_yojson
    (x : describe_aggregate_compliance_by_config_rules_response) =
  assoc_to_yojson
    [
      ( "AggregateComplianceByConfigRules",
        option_to_yojson aggregate_compliance_by_config_rule_list_to_yojson
          x.aggregate_compliance_by_config_rules );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let group_by_api_limit_to_yojson = int_to_yojson

let describe_aggregate_compliance_by_config_rules_request_to_yojson
    (x : describe_aggregate_compliance_by_config_rules_request) =
  assoc_to_yojson
    [
      ( "ConfigurationAggregatorName",
        Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name) );
      ("Filters", option_to_yojson config_rule_compliance_filters_to_yojson x.filters);
      ("Limit", option_to_yojson group_by_api_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_aggregate_compliance_by_conformance_packs_response_to_yojson
    (x : describe_aggregate_compliance_by_conformance_packs_response) =
  assoc_to_yojson
    [
      ( "AggregateComplianceByConformancePacks",
        option_to_yojson aggregate_compliance_by_conformance_pack_list_to_yojson
          x.aggregate_compliance_by_conformance_packs );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let limit_to_yojson = int_to_yojson

let describe_aggregate_compliance_by_conformance_packs_request_to_yojson
    (x : describe_aggregate_compliance_by_conformance_packs_request) =
  assoc_to_yojson
    [
      ( "ConfigurationAggregatorName",
        Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name) );
      ("Filters", option_to_yojson aggregate_conformance_pack_compliance_filters_to_yojson x.filters);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_aggregation_authorizations_response_to_yojson
    (x : describe_aggregation_authorizations_response) =
  assoc_to_yojson
    [
      ( "AggregationAuthorizations",
        option_to_yojson aggregation_authorization_list_to_yojson x.aggregation_authorizations );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_aggregation_authorizations_request_to_yojson
    (x : describe_aggregation_authorizations_request) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_compliance_by_config_rule_response_to_yojson
    (x : describe_compliance_by_config_rule_response) =
  assoc_to_yojson
    [
      ( "ComplianceByConfigRules",
        option_to_yojson compliance_by_config_rules_to_yojson x.compliance_by_config_rules );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_compliance_by_config_rule_request_to_yojson
    (x : describe_compliance_by_config_rule_request) =
  assoc_to_yojson
    [
      ("ConfigRuleNames", option_to_yojson config_rule_names_to_yojson x.config_rule_names);
      ("ComplianceTypes", option_to_yojson compliance_types_to_yojson x.compliance_types);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_compliance_by_resource_response_to_yojson
    (x : describe_compliance_by_resource_response) =
  assoc_to_yojson
    [
      ( "ComplianceByResources",
        option_to_yojson compliance_by_resources_to_yojson x.compliance_by_resources );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_compliance_by_resource_request_to_yojson (x : describe_compliance_by_resource_request)
    =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson string_with_char_limit256_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson base_resource_id_to_yojson x.resource_id);
      ("ComplianceTypes", option_to_yojson compliance_types_to_yojson x.compliance_types);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_config_rule_evaluation_status_response_to_yojson
    (x : describe_config_rule_evaluation_status_response) =
  assoc_to_yojson
    [
      ( "ConfigRulesEvaluationStatus",
        option_to_yojson config_rule_evaluation_status_list_to_yojson
          x.config_rules_evaluation_status );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let rule_limit_to_yojson = int_to_yojson

let describe_config_rule_evaluation_status_request_to_yojson
    (x : describe_config_rule_evaluation_status_request) =
  assoc_to_yojson
    [
      ("ConfigRuleNames", option_to_yojson config_rule_names_to_yojson x.config_rule_names);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Limit", option_to_yojson rule_limit_to_yojson x.limit);
    ]

let describe_config_rules_response_to_yojson (x : describe_config_rules_response) =
  assoc_to_yojson
    [
      ("ConfigRules", option_to_yojson config_rules_to_yojson x.config_rules);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_config_rules_filters_to_yojson (x : describe_config_rules_filters) =
  assoc_to_yojson
    [
      ("EvaluationMode", option_to_yojson evaluation_mode_to_yojson x.evaluation_mode);
      ( "RuleEvaluationVisibility",
        option_to_yojson rule_evaluation_visibility_to_yojson x.rule_evaluation_visibility );
    ]

let describe_config_rules_request_to_yojson (x : describe_config_rules_request) =
  assoc_to_yojson
    [
      ("ConfigRuleNames", option_to_yojson config_rule_names_to_yojson x.config_rule_names);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filters", option_to_yojson describe_config_rules_filters_to_yojson x.filters);
    ]

let describe_configuration_aggregator_sources_status_response_to_yojson
    (x : describe_configuration_aggregator_sources_status_response) =
  assoc_to_yojson
    [
      ( "AggregatedSourceStatusList",
        option_to_yojson aggregated_source_status_list_to_yojson x.aggregated_source_status_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_configuration_aggregator_sources_status_request_to_yojson
    (x : describe_configuration_aggregator_sources_status_request) =
  assoc_to_yojson
    [
      ( "ConfigurationAggregatorName",
        Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name) );
      ("UpdateStatus", option_to_yojson aggregated_source_status_type_list_to_yojson x.update_status);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
    ]

let describe_configuration_aggregators_response_to_yojson
    (x : describe_configuration_aggregators_response) =
  assoc_to_yojson
    [
      ( "ConfigurationAggregators",
        option_to_yojson configuration_aggregator_list_to_yojson x.configuration_aggregators );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_configuration_aggregators_request_to_yojson
    (x : describe_configuration_aggregators_request) =
  assoc_to_yojson
    [
      ( "ConfigurationAggregatorNames",
        option_to_yojson configuration_aggregator_name_list_to_yojson
          x.configuration_aggregator_names );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
    ]

let describe_configuration_recorder_status_response_to_yojson
    (x : describe_configuration_recorder_status_response) =
  assoc_to_yojson
    [
      ( "ConfigurationRecordersStatus",
        option_to_yojson configuration_recorder_status_list_to_yojson
          x.configuration_recorders_status );
    ]

let describe_configuration_recorder_status_request_to_yojson
    (x : describe_configuration_recorder_status_request) =
  assoc_to_yojson
    [
      ( "ConfigurationRecorderNames",
        option_to_yojson configuration_recorder_name_list_to_yojson x.configuration_recorder_names
      );
      ("ServicePrincipal", option_to_yojson service_principal_to_yojson x.service_principal);
      ("Arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let describe_configuration_recorders_response_to_yojson
    (x : describe_configuration_recorders_response) =
  assoc_to_yojson
    [
      ( "ConfigurationRecorders",
        option_to_yojson configuration_recorder_list_to_yojson x.configuration_recorders );
    ]

let describe_configuration_recorders_request_to_yojson
    (x : describe_configuration_recorders_request) =
  assoc_to_yojson
    [
      ( "ConfigurationRecorderNames",
        option_to_yojson configuration_recorder_name_list_to_yojson x.configuration_recorder_names
      );
      ("ServicePrincipal", option_to_yojson service_principal_to_yojson x.service_principal);
      ("Arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
    ]

let no_such_config_rule_in_conformance_pack_exception_to_yojson
    (x : no_such_config_rule_in_conformance_pack_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let describe_conformance_pack_compliance_response_to_yojson
    (x : describe_conformance_pack_compliance_response) =
  assoc_to_yojson
    [
      ("ConformancePackName", Some (conformance_pack_name_to_yojson x.conformance_pack_name));
      ( "ConformancePackRuleComplianceList",
        Some
          (conformance_pack_rule_compliance_list_to_yojson x.conformance_pack_rule_compliance_list)
      );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_conformance_pack_compliance_limit_to_yojson = int_to_yojson

let describe_conformance_pack_compliance_request_to_yojson
    (x : describe_conformance_pack_compliance_request) =
  assoc_to_yojson
    [
      ("ConformancePackName", Some (conformance_pack_name_to_yojson x.conformance_pack_name));
      ("Filters", option_to_yojson conformance_pack_compliance_filters_to_yojson x.filters);
      ("Limit", option_to_yojson describe_conformance_pack_compliance_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_conformance_pack_status_response_to_yojson
    (x : describe_conformance_pack_status_response) =
  assoc_to_yojson
    [
      ( "ConformancePackStatusDetails",
        option_to_yojson conformance_pack_status_details_list_to_yojson
          x.conformance_pack_status_details );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let page_size_limit_to_yojson = int_to_yojson

let describe_conformance_pack_status_request_to_yojson
    (x : describe_conformance_pack_status_request) =
  assoc_to_yojson
    [
      ( "ConformancePackNames",
        option_to_yojson conformance_pack_names_list_to_yojson x.conformance_pack_names );
      ("Limit", option_to_yojson page_size_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_conformance_packs_response_to_yojson (x : describe_conformance_packs_response) =
  assoc_to_yojson
    [
      ( "ConformancePackDetails",
        option_to_yojson conformance_pack_detail_list_to_yojson x.conformance_pack_details );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_conformance_packs_request_to_yojson (x : describe_conformance_packs_request) =
  assoc_to_yojson
    [
      ( "ConformancePackNames",
        option_to_yojson conformance_pack_names_list_to_yojson x.conformance_pack_names );
      ("Limit", option_to_yojson page_size_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_delivery_channel_status_response_to_yojson
    (x : describe_delivery_channel_status_response) =
  assoc_to_yojson
    [
      ( "DeliveryChannelsStatus",
        option_to_yojson delivery_channel_status_list_to_yojson x.delivery_channels_status );
    ]

let describe_delivery_channel_status_request_to_yojson
    (x : describe_delivery_channel_status_request) =
  assoc_to_yojson
    [
      ( "DeliveryChannelNames",
        option_to_yojson delivery_channel_name_list_to_yojson x.delivery_channel_names );
    ]

let describe_delivery_channels_response_to_yojson (x : describe_delivery_channels_response) =
  assoc_to_yojson
    [ ("DeliveryChannels", option_to_yojson delivery_channel_list_to_yojson x.delivery_channels) ]

let describe_delivery_channels_request_to_yojson (x : describe_delivery_channels_request) =
  assoc_to_yojson
    [
      ( "DeliveryChannelNames",
        option_to_yojson delivery_channel_name_list_to_yojson x.delivery_channel_names );
    ]

let organization_rule_status_to_yojson (x : organization_rule_status) =
  match x with
  | CREATE_SUCCESSFUL -> `String "CREATE_SUCCESSFUL"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETE_SUCCESSFUL -> `String "DELETE_SUCCESSFUL"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | UPDATE_SUCCESSFUL -> `String "UPDATE_SUCCESSFUL"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"

let organization_config_rule_status_to_yojson (x : organization_config_rule_status) =
  assoc_to_yojson
    [
      ( "OrganizationConfigRuleName",
        Some (organization_config_rule_name_to_yojson x.organization_config_rule_name) );
      ( "OrganizationRuleStatus",
        Some (organization_rule_status_to_yojson x.organization_rule_status) );
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("LastUpdateTime", option_to_yojson date_to_yojson x.last_update_time);
    ]

let organization_config_rule_statuses_to_yojson tree =
  list_to_yojson organization_config_rule_status_to_yojson tree

let describe_organization_config_rule_statuses_response_to_yojson
    (x : describe_organization_config_rule_statuses_response) =
  assoc_to_yojson
    [
      ( "OrganizationConfigRuleStatuses",
        option_to_yojson organization_config_rule_statuses_to_yojson
          x.organization_config_rule_statuses );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let organization_config_rule_names_to_yojson tree =
  list_to_yojson string_with_char_limit64_to_yojson tree

let describe_organization_config_rule_statuses_request_to_yojson
    (x : describe_organization_config_rule_statuses_request) =
  assoc_to_yojson
    [
      ( "OrganizationConfigRuleNames",
        option_to_yojson organization_config_rule_names_to_yojson x.organization_config_rule_names
      );
      ("Limit", option_to_yojson cosmos_page_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let string_with_char_limit768_to_yojson = string_to_yojson
let resource_types_scope_to_yojson tree = list_to_yojson string_with_char_limit256_to_yojson tree

let organization_config_rule_trigger_type_no_s_n_to_yojson
    (x : organization_config_rule_trigger_type_no_s_n) =
  match x with
  | CONFIGURATION_ITEM_CHANGE_NOTIFICATION -> `String "ConfigurationItemChangeNotification"
  | OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION ->
      `String "OversizedConfigurationItemChangeNotification"

let organization_config_rule_trigger_type_no_s_ns_to_yojson tree =
  list_to_yojson organization_config_rule_trigger_type_no_s_n_to_yojson tree

let string_with_char_limit256_min0_to_yojson = string_to_yojson

let organization_custom_policy_rule_metadata_no_policy_to_yojson
    (x : organization_custom_policy_rule_metadata_no_policy) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson string_with_char_limit256_min0_to_yojson x.description);
      ( "OrganizationConfigRuleTriggerTypes",
        option_to_yojson organization_config_rule_trigger_type_no_s_ns_to_yojson
          x.organization_config_rule_trigger_types );
      ("InputParameters", option_to_yojson string_with_char_limit1024_to_yojson x.input_parameters);
      ( "MaximumExecutionFrequency",
        option_to_yojson maximum_execution_frequency_to_yojson x.maximum_execution_frequency );
      ("ResourceTypesScope", option_to_yojson resource_types_scope_to_yojson x.resource_types_scope);
      ("ResourceIdScope", option_to_yojson string_with_char_limit768_to_yojson x.resource_id_scope);
      ("TagKeyScope", option_to_yojson string_with_char_limit128_to_yojson x.tag_key_scope);
      ("TagValueScope", option_to_yojson string_with_char_limit256_to_yojson x.tag_value_scope);
      ("PolicyRuntime", option_to_yojson policy_runtime_to_yojson x.policy_runtime);
      ( "DebugLogDeliveryAccounts",
        option_to_yojson debug_log_delivery_accounts_to_yojson x.debug_log_delivery_accounts );
    ]

let excluded_accounts_to_yojson tree = list_to_yojson account_id_to_yojson tree

let organization_config_rule_trigger_type_to_yojson (x : organization_config_rule_trigger_type) =
  match x with
  | CONFIGURATION_ITEM_CHANGE_NOTIFICATION -> `String "ConfigurationItemChangeNotification"
  | OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION ->
      `String "OversizedConfigurationItemChangeNotification"
  | SCHEDULED_NOTIFICATION -> `String "ScheduledNotification"

let organization_config_rule_trigger_types_to_yojson tree =
  list_to_yojson organization_config_rule_trigger_type_to_yojson tree

let organization_custom_rule_metadata_to_yojson (x : organization_custom_rule_metadata) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson string_with_char_limit256_min0_to_yojson x.description);
      ("LambdaFunctionArn", Some (string_with_char_limit256_to_yojson x.lambda_function_arn));
      ( "OrganizationConfigRuleTriggerTypes",
        Some
          (organization_config_rule_trigger_types_to_yojson x.organization_config_rule_trigger_types)
      );
      ("InputParameters", option_to_yojson string_with_char_limit1024_to_yojson x.input_parameters);
      ( "MaximumExecutionFrequency",
        option_to_yojson maximum_execution_frequency_to_yojson x.maximum_execution_frequency );
      ("ResourceTypesScope", option_to_yojson resource_types_scope_to_yojson x.resource_types_scope);
      ("ResourceIdScope", option_to_yojson string_with_char_limit768_to_yojson x.resource_id_scope);
      ("TagKeyScope", option_to_yojson string_with_char_limit128_to_yojson x.tag_key_scope);
      ("TagValueScope", option_to_yojson string_with_char_limit256_to_yojson x.tag_value_scope);
    ]

let organization_managed_rule_metadata_to_yojson (x : organization_managed_rule_metadata) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson string_with_char_limit256_min0_to_yojson x.description);
      ("RuleIdentifier", Some (string_with_char_limit256_to_yojson x.rule_identifier));
      ("InputParameters", option_to_yojson string_with_char_limit1024_to_yojson x.input_parameters);
      ( "MaximumExecutionFrequency",
        option_to_yojson maximum_execution_frequency_to_yojson x.maximum_execution_frequency );
      ("ResourceTypesScope", option_to_yojson resource_types_scope_to_yojson x.resource_types_scope);
      ("ResourceIdScope", option_to_yojson string_with_char_limit768_to_yojson x.resource_id_scope);
      ("TagKeyScope", option_to_yojson string_with_char_limit128_to_yojson x.tag_key_scope);
      ("TagValueScope", option_to_yojson string_with_char_limit256_to_yojson x.tag_value_scope);
    ]

let organization_config_rule_to_yojson (x : organization_config_rule) =
  assoc_to_yojson
    [
      ( "OrganizationConfigRuleName",
        Some (organization_config_rule_name_to_yojson x.organization_config_rule_name) );
      ( "OrganizationConfigRuleArn",
        Some (string_with_char_limit256_to_yojson x.organization_config_rule_arn) );
      ( "OrganizationManagedRuleMetadata",
        option_to_yojson organization_managed_rule_metadata_to_yojson
          x.organization_managed_rule_metadata );
      ( "OrganizationCustomRuleMetadata",
        option_to_yojson organization_custom_rule_metadata_to_yojson
          x.organization_custom_rule_metadata );
      ("ExcludedAccounts", option_to_yojson excluded_accounts_to_yojson x.excluded_accounts);
      ("LastUpdateTime", option_to_yojson date_to_yojson x.last_update_time);
      ( "OrganizationCustomPolicyRuleMetadata",
        option_to_yojson organization_custom_policy_rule_metadata_no_policy_to_yojson
          x.organization_custom_policy_rule_metadata );
    ]

let organization_config_rules_to_yojson tree =
  list_to_yojson organization_config_rule_to_yojson tree

let describe_organization_config_rules_response_to_yojson
    (x : describe_organization_config_rules_response) =
  assoc_to_yojson
    [
      ( "OrganizationConfigRules",
        option_to_yojson organization_config_rules_to_yojson x.organization_config_rules );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_organization_config_rules_request_to_yojson
    (x : describe_organization_config_rules_request) =
  assoc_to_yojson
    [
      ( "OrganizationConfigRuleNames",
        option_to_yojson organization_config_rule_names_to_yojson x.organization_config_rule_names
      );
      ("Limit", option_to_yojson cosmos_page_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let organization_resource_status_to_yojson (x : organization_resource_status) =
  match x with
  | CREATE_SUCCESSFUL -> `String "CREATE_SUCCESSFUL"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETE_SUCCESSFUL -> `String "DELETE_SUCCESSFUL"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | UPDATE_SUCCESSFUL -> `String "UPDATE_SUCCESSFUL"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"

let organization_conformance_pack_status_to_yojson (x : organization_conformance_pack_status) =
  assoc_to_yojson
    [
      ( "OrganizationConformancePackName",
        Some (organization_conformance_pack_name_to_yojson x.organization_conformance_pack_name) );
      ("Status", Some (organization_resource_status_to_yojson x.status));
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("LastUpdateTime", option_to_yojson date_to_yojson x.last_update_time);
    ]

let organization_conformance_pack_statuses_to_yojson tree =
  list_to_yojson organization_conformance_pack_status_to_yojson tree

let describe_organization_conformance_pack_statuses_response_to_yojson
    (x : describe_organization_conformance_pack_statuses_response) =
  assoc_to_yojson
    [
      ( "OrganizationConformancePackStatuses",
        option_to_yojson organization_conformance_pack_statuses_to_yojson
          x.organization_conformance_pack_statuses );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let organization_conformance_pack_names_to_yojson tree =
  list_to_yojson organization_conformance_pack_name_to_yojson tree

let describe_organization_conformance_pack_statuses_request_to_yojson
    (x : describe_organization_conformance_pack_statuses_request) =
  assoc_to_yojson
    [
      ( "OrganizationConformancePackNames",
        option_to_yojson organization_conformance_pack_names_to_yojson
          x.organization_conformance_pack_names );
      ("Limit", option_to_yojson cosmos_page_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let organization_conformance_pack_to_yojson (x : organization_conformance_pack) =
  assoc_to_yojson
    [
      ( "OrganizationConformancePackName",
        Some (organization_conformance_pack_name_to_yojson x.organization_conformance_pack_name) );
      ( "OrganizationConformancePackArn",
        Some (string_with_char_limit256_to_yojson x.organization_conformance_pack_arn) );
      ("DeliveryS3Bucket", option_to_yojson delivery_s3_bucket_to_yojson x.delivery_s3_bucket);
      ( "DeliveryS3KeyPrefix",
        option_to_yojson delivery_s3_key_prefix_to_yojson x.delivery_s3_key_prefix );
      ( "ConformancePackInputParameters",
        option_to_yojson conformance_pack_input_parameters_to_yojson
          x.conformance_pack_input_parameters );
      ("ExcludedAccounts", option_to_yojson excluded_accounts_to_yojson x.excluded_accounts);
      ("LastUpdateTime", Some (date_to_yojson x.last_update_time));
    ]

let organization_conformance_packs_to_yojson tree =
  list_to_yojson organization_conformance_pack_to_yojson tree

let describe_organization_conformance_packs_response_to_yojson
    (x : describe_organization_conformance_packs_response) =
  assoc_to_yojson
    [
      ( "OrganizationConformancePacks",
        option_to_yojson organization_conformance_packs_to_yojson x.organization_conformance_packs
      );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_organization_conformance_packs_request_to_yojson
    (x : describe_organization_conformance_packs_request) =
  assoc_to_yojson
    [
      ( "OrganizationConformancePackNames",
        option_to_yojson organization_conformance_pack_names_to_yojson
          x.organization_conformance_pack_names );
      ("Limit", option_to_yojson cosmos_page_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let pending_aggregation_request_to_yojson (x : pending_aggregation_request) =
  assoc_to_yojson
    [
      ("RequesterAccountId", option_to_yojson account_id_to_yojson x.requester_account_id);
      ("RequesterAwsRegion", option_to_yojson aws_region_to_yojson x.requester_aws_region);
    ]

let pending_aggregation_request_list_to_yojson tree =
  list_to_yojson pending_aggregation_request_to_yojson tree

let describe_pending_aggregation_requests_response_to_yojson
    (x : describe_pending_aggregation_requests_response) =
  assoc_to_yojson
    [
      ( "PendingAggregationRequests",
        option_to_yojson pending_aggregation_request_list_to_yojson x.pending_aggregation_requests
      );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_pending_aggregation_requests_limit_to_yojson = int_to_yojson

let describe_pending_aggregation_requests_request_to_yojson
    (x : describe_pending_aggregation_requests_request) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson describe_pending_aggregation_requests_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let percentage_to_yojson = int_to_yojson

let ssm_controls_to_yojson (x : ssm_controls) =
  assoc_to_yojson
    [
      ( "ConcurrentExecutionRatePercentage",
        option_to_yojson percentage_to_yojson x.concurrent_execution_rate_percentage );
      ("ErrorPercentage", option_to_yojson percentage_to_yojson x.error_percentage);
    ]

let execution_controls_to_yojson (x : execution_controls) =
  assoc_to_yojson [ ("SsmControls", option_to_yojson ssm_controls_to_yojson x.ssm_controls) ]

let static_parameter_values_to_yojson tree = list_to_yojson string_with_char_limit256_to_yojson tree

let static_value_to_yojson (x : static_value) =
  assoc_to_yojson [ ("Values", Some (static_parameter_values_to_yojson x.values)) ]

let resource_value_type_to_yojson (x : resource_value_type) =
  match x with RESOURCE_ID -> `String "RESOURCE_ID"

let resource_value_to_yojson (x : resource_value) =
  assoc_to_yojson [ ("Value", Some (resource_value_type_to_yojson x.value)) ]

let remediation_parameter_value_to_yojson (x : remediation_parameter_value) =
  assoc_to_yojson
    [
      ("ResourceValue", option_to_yojson resource_value_to_yojson x.resource_value);
      ("StaticValue", option_to_yojson static_value_to_yojson x.static_value);
    ]

let remediation_parameters_to_yojson tree =
  map_to_yojson string_with_char_limit256_to_yojson remediation_parameter_value_to_yojson tree

let remediation_target_type_to_yojson (x : remediation_target_type) =
  match x with SSM_DOCUMENT -> `String "SSM_DOCUMENT"

let remediation_configuration_to_yojson (x : remediation_configuration) =
  assoc_to_yojson
    [
      ("ConfigRuleName", Some (config_rule_name_to_yojson x.config_rule_name));
      ("TargetType", Some (remediation_target_type_to_yojson x.target_type));
      ("TargetId", Some (string_with_char_limit256_to_yojson x.target_id));
      ("TargetVersion", option_to_yojson string__to_yojson x.target_version);
      ("Parameters", option_to_yojson remediation_parameters_to_yojson x.parameters);
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
      ("Automatic", option_to_yojson boolean__to_yojson x.automatic);
      ("ExecutionControls", option_to_yojson execution_controls_to_yojson x.execution_controls);
      ( "MaximumAutomaticAttempts",
        option_to_yojson auto_remediation_attempts_to_yojson x.maximum_automatic_attempts );
      ( "RetryAttemptSeconds",
        option_to_yojson auto_remediation_attempt_seconds_to_yojson x.retry_attempt_seconds );
      ("Arn", option_to_yojson string_with_char_limit1024_to_yojson x.arn);
      ( "CreatedByService",
        option_to_yojson string_with_char_limit1024_to_yojson x.created_by_service );
    ]

let remediation_configurations_to_yojson tree =
  list_to_yojson remediation_configuration_to_yojson tree

let describe_remediation_configurations_response_to_yojson
    (x : describe_remediation_configurations_response) =
  assoc_to_yojson
    [
      ( "RemediationConfigurations",
        option_to_yojson remediation_configurations_to_yojson x.remediation_configurations );
    ]

let describe_remediation_configurations_request_to_yojson
    (x : describe_remediation_configurations_request) =
  assoc_to_yojson [ ("ConfigRuleNames", Some (config_rule_names_to_yojson x.config_rule_names)) ]

let remediation_exception_to_yojson (x : remediation_exception) =
  assoc_to_yojson
    [
      ("ConfigRuleName", Some (config_rule_name_to_yojson x.config_rule_name));
      ("ResourceType", Some (string_with_char_limit256_to_yojson x.resource_type));
      ("ResourceId", Some (string_with_char_limit1024_to_yojson x.resource_id));
      ("Message", option_to_yojson string_with_char_limit1024_to_yojson x.message);
      ("ExpirationTime", option_to_yojson date_to_yojson x.expiration_time);
    ]

let remediation_exceptions_to_yojson tree = list_to_yojson remediation_exception_to_yojson tree

let describe_remediation_exceptions_response_to_yojson
    (x : describe_remediation_exceptions_response) =
  assoc_to_yojson
    [
      ( "RemediationExceptions",
        option_to_yojson remediation_exceptions_to_yojson x.remediation_exceptions );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_remediation_exceptions_request_to_yojson (x : describe_remediation_exceptions_request)
    =
  assoc_to_yojson
    [
      ("ConfigRuleName", Some (config_rule_name_to_yojson x.config_rule_name));
      ( "ResourceKeys",
        option_to_yojson remediation_exception_resource_keys_to_yojson x.resource_keys );
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let remediation_execution_step_state_to_yojson (x : remediation_execution_step_state) =
  match x with
  | SUCCEEDED -> `String "SUCCEEDED"
  | PENDING -> `String "PENDING"
  | FAILED -> `String "FAILED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | EXITED -> `String "EXITED"
  | UNKNOWN -> `String "UNKNOWN"

let remediation_execution_step_to_yojson (x : remediation_execution_step) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("State", option_to_yojson remediation_execution_step_state_to_yojson x.state);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("StartTime", option_to_yojson date_to_yojson x.start_time);
      ("StopTime", option_to_yojson date_to_yojson x.stop_time);
    ]

let remediation_execution_steps_to_yojson tree =
  list_to_yojson remediation_execution_step_to_yojson tree

let remediation_execution_state_to_yojson (x : remediation_execution_state) =
  match x with
  | QUEUED -> `String "QUEUED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | UNKNOWN -> `String "UNKNOWN"

let remediation_execution_status_to_yojson (x : remediation_execution_status) =
  assoc_to_yojson
    [
      ("ResourceKey", option_to_yojson resource_key_to_yojson x.resource_key);
      ("State", option_to_yojson remediation_execution_state_to_yojson x.state);
      ("StepDetails", option_to_yojson remediation_execution_steps_to_yojson x.step_details);
      ("InvocationTime", option_to_yojson date_to_yojson x.invocation_time);
      ("LastUpdatedTime", option_to_yojson date_to_yojson x.last_updated_time);
    ]

let remediation_execution_statuses_to_yojson tree =
  list_to_yojson remediation_execution_status_to_yojson tree

let describe_remediation_execution_status_response_to_yojson
    (x : describe_remediation_execution_status_response) =
  assoc_to_yojson
    [
      ( "RemediationExecutionStatuses",
        option_to_yojson remediation_execution_statuses_to_yojson x.remediation_execution_statuses
      );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_remediation_execution_status_request_to_yojson
    (x : describe_remediation_execution_status_request) =
  assoc_to_yojson
    [
      ("ConfigRuleName", Some (config_rule_name_to_yojson x.config_rule_name));
      ("ResourceKeys", option_to_yojson resource_keys_to_yojson x.resource_keys);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let retention_period_in_days_to_yojson = int_to_yojson

let retention_configuration_to_yojson (x : retention_configuration) =
  assoc_to_yojson
    [
      ("Name", Some (retention_configuration_name_to_yojson x.name));
      ("RetentionPeriodInDays", Some (retention_period_in_days_to_yojson x.retention_period_in_days));
    ]

let retention_configuration_list_to_yojson tree =
  list_to_yojson retention_configuration_to_yojson tree

let describe_retention_configurations_response_to_yojson
    (x : describe_retention_configurations_response) =
  assoc_to_yojson
    [
      ( "RetentionConfigurations",
        option_to_yojson retention_configuration_list_to_yojson x.retention_configurations );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let retention_configuration_name_list_to_yojson tree =
  list_to_yojson retention_configuration_name_to_yojson tree

let describe_retention_configurations_request_to_yojson
    (x : describe_retention_configurations_request) =
  assoc_to_yojson
    [
      ( "RetentionConfigurationNames",
        option_to_yojson retention_configuration_name_list_to_yojson x.retention_configuration_names
      );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let disassociate_resource_types_response_to_yojson (x : disassociate_resource_types_response) =
  assoc_to_yojson
    [ ("ConfigurationRecorder", Some (configuration_recorder_to_yojson x.configuration_recorder)) ]

let disassociate_resource_types_request_to_yojson (x : disassociate_resource_types_request) =
  assoc_to_yojson
    [
      ( "ConfigurationRecorderArn",
        Some (amazon_resource_name_to_yojson x.configuration_recorder_arn) );
      ("ResourceTypes", Some (resource_type_list_to_yojson x.resource_types));
    ]

let discovered_resource_identifier_list_to_yojson tree =
  list_to_yojson aggregate_resource_identifier_to_yojson tree

let earlier_time_to_yojson = timestamp_epoch_seconds_to_yojson
let ordering_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let evaluation_to_yojson (x : evaluation) =
  assoc_to_yojson
    [
      ( "ComplianceResourceType",
        Some (string_with_char_limit256_to_yojson x.compliance_resource_type) );
      ("ComplianceResourceId", Some (base_resource_id_to_yojson x.compliance_resource_id));
      ("ComplianceType", Some (compliance_type_to_yojson x.compliance_type));
      ("Annotation", option_to_yojson string_with_char_limit256_to_yojson x.annotation);
      ("OrderingTimestamp", Some (ordering_timestamp_to_yojson x.ordering_timestamp));
    ]

let evaluation_context_identifier_to_yojson = string_to_yojson

let evaluation_context_to_yojson (x : evaluation_context) =
  assoc_to_yojson
    [
      ( "EvaluationContextIdentifier",
        option_to_yojson evaluation_context_identifier_to_yojson x.evaluation_context_identifier );
    ]

let evaluation_result_to_yojson (x : evaluation_result) =
  assoc_to_yojson
    [
      ( "EvaluationResultIdentifier",
        option_to_yojson evaluation_result_identifier_to_yojson x.evaluation_result_identifier );
      ("ComplianceType", option_to_yojson compliance_type_to_yojson x.compliance_type);
      ("ResultRecordedTime", option_to_yojson date_to_yojson x.result_recorded_time);
      ("ConfigRuleInvokedTime", option_to_yojson date_to_yojson x.config_rule_invoked_time);
      ("Annotation", option_to_yojson string_with_char_limit256_to_yojson x.annotation);
      ("ResultToken", option_to_yojson string__to_yojson x.result_token);
    ]

let evaluation_results_to_yojson tree = list_to_yojson evaluation_result_to_yojson tree

let resource_evaluation_status_to_yojson (x : resource_evaluation_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"

let evaluation_status_to_yojson (x : evaluation_status) =
  assoc_to_yojson
    [
      ("Status", Some (resource_evaluation_status_to_yojson x.status));
      ("FailureReason", option_to_yojson string_with_char_limit1024_to_yojson x.failure_reason);
    ]

let evaluation_timeout_to_yojson = int_to_yojson
let evaluations_to_yojson tree = list_to_yojson evaluation_to_yojson tree
let expression_to_yojson = string_to_yojson

let external_evaluation_to_yojson (x : external_evaluation) =
  assoc_to_yojson
    [
      ( "ComplianceResourceType",
        Some (string_with_char_limit256_to_yojson x.compliance_resource_type) );
      ("ComplianceResourceId", Some (base_resource_id_to_yojson x.compliance_resource_id));
      ("ComplianceType", Some (compliance_type_to_yojson x.compliance_type));
      ("Annotation", option_to_yojson string_with_char_limit256_to_yojson x.annotation);
      ("OrderingTimestamp", Some (ordering_timestamp_to_yojson x.ordering_timestamp));
    ]

let failed_remediation_batch_to_yojson (x : failed_remediation_batch) =
  assoc_to_yojson
    [
      ("FailureMessage", option_to_yojson string__to_yojson x.failure_message);
      ("FailedItems", option_to_yojson remediation_configurations_to_yojson x.failed_items);
    ]

let failed_remediation_batches_to_yojson tree =
  list_to_yojson failed_remediation_batch_to_yojson tree

let failed_remediation_exception_batch_to_yojson (x : failed_remediation_exception_batch) =
  assoc_to_yojson
    [
      ("FailureMessage", option_to_yojson string__to_yojson x.failure_message);
      ("FailedItems", option_to_yojson remediation_exceptions_to_yojson x.failed_items);
    ]

let failed_remediation_exception_batches_to_yojson tree =
  list_to_yojson failed_remediation_exception_batch_to_yojson tree

let field_name_to_yojson = string_to_yojson

let field_info_to_yojson (x : field_info) =
  assoc_to_yojson [ ("Name", option_to_yojson field_name_to_yojson x.name) ]

let field_info_list_to_yojson tree = list_to_yojson field_info_to_yojson tree

let get_aggregate_compliance_details_by_config_rule_response_to_yojson
    (x : get_aggregate_compliance_details_by_config_rule_response) =
  assoc_to_yojson
    [
      ( "AggregateEvaluationResults",
        option_to_yojson aggregate_evaluation_result_list_to_yojson x.aggregate_evaluation_results
      );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_aggregate_compliance_details_by_config_rule_request_to_yojson
    (x : get_aggregate_compliance_details_by_config_rule_request) =
  assoc_to_yojson
    [
      ( "ConfigurationAggregatorName",
        Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name) );
      ("ConfigRuleName", Some (config_rule_name_to_yojson x.config_rule_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("AwsRegion", Some (aws_region_to_yojson x.aws_region));
      ("ComplianceType", option_to_yojson compliance_type_to_yojson x.compliance_type);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_aggregate_config_rule_compliance_summary_response_to_yojson
    (x : get_aggregate_config_rule_compliance_summary_response) =
  assoc_to_yojson
    [
      ("GroupByKey", option_to_yojson string_with_char_limit256_to_yojson x.group_by_key);
      ( "AggregateComplianceCounts",
        option_to_yojson aggregate_compliance_count_list_to_yojson x.aggregate_compliance_counts );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_aggregate_config_rule_compliance_summary_request_to_yojson
    (x : get_aggregate_config_rule_compliance_summary_request) =
  assoc_to_yojson
    [
      ( "ConfigurationAggregatorName",
        Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name) );
      ("Filters", option_to_yojson config_rule_compliance_summary_filters_to_yojson x.filters);
      ( "GroupByKey",
        option_to_yojson config_rule_compliance_summary_group_key_to_yojson x.group_by_key );
      ("Limit", option_to_yojson group_by_api_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_aggregate_conformance_pack_compliance_summary_response_to_yojson
    (x : get_aggregate_conformance_pack_compliance_summary_response) =
  assoc_to_yojson
    [
      ( "AggregateConformancePackComplianceSummaries",
        option_to_yojson aggregate_conformance_pack_compliance_summary_list_to_yojson
          x.aggregate_conformance_pack_compliance_summaries );
      ("GroupByKey", option_to_yojson string_with_char_limit256_to_yojson x.group_by_key);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_aggregate_conformance_pack_compliance_summary_request_to_yojson
    (x : get_aggregate_conformance_pack_compliance_summary_request) =
  assoc_to_yojson
    [
      ( "ConfigurationAggregatorName",
        Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name) );
      ( "Filters",
        option_to_yojson aggregate_conformance_pack_compliance_summary_filters_to_yojson x.filters
      );
      ( "GroupByKey",
        option_to_yojson aggregate_conformance_pack_compliance_summary_group_key_to_yojson
          x.group_by_key );
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let long_to_yojson = long_to_yojson

let grouped_resource_count_to_yojson (x : grouped_resource_count) =
  assoc_to_yojson
    [
      ("GroupName", Some (string_with_char_limit256_to_yojson x.group_name));
      ("ResourceCount", Some (long_to_yojson x.resource_count));
    ]

let grouped_resource_count_list_to_yojson tree =
  list_to_yojson grouped_resource_count_to_yojson tree

let get_aggregate_discovered_resource_counts_response_to_yojson
    (x : get_aggregate_discovered_resource_counts_response) =
  assoc_to_yojson
    [
      ("TotalDiscoveredResources", Some (long_to_yojson x.total_discovered_resources));
      ("GroupByKey", option_to_yojson string_with_char_limit256_to_yojson x.group_by_key);
      ( "GroupedResourceCounts",
        option_to_yojson grouped_resource_count_list_to_yojson x.grouped_resource_counts );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let resource_count_group_key_to_yojson (x : resource_count_group_key) =
  match x with
  | RESOURCE_TYPE -> `String "RESOURCE_TYPE"
  | ACCOUNT_ID -> `String "ACCOUNT_ID"
  | AWS_REGION -> `String "AWS_REGION"

let resource_count_filters_to_yojson (x : resource_count_filters) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("Region", option_to_yojson aws_region_to_yojson x.region);
    ]

let get_aggregate_discovered_resource_counts_request_to_yojson
    (x : get_aggregate_discovered_resource_counts_request) =
  assoc_to_yojson
    [
      ( "ConfigurationAggregatorName",
        Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name) );
      ("Filters", option_to_yojson resource_count_filters_to_yojson x.filters);
      ("GroupByKey", option_to_yojson resource_count_group_key_to_yojson x.group_by_key);
      ("Limit", option_to_yojson group_by_api_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let resource_not_discovered_exception_to_yojson (x : resource_not_discovered_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let oversized_configuration_item_exception_to_yojson (x : oversized_configuration_item_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let get_aggregate_resource_config_response_to_yojson (x : get_aggregate_resource_config_response) =
  assoc_to_yojson
    [ ("ConfigurationItem", option_to_yojson configuration_item_to_yojson x.configuration_item) ]

let get_aggregate_resource_config_request_to_yojson (x : get_aggregate_resource_config_request) =
  assoc_to_yojson
    [
      ( "ConfigurationAggregatorName",
        Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name) );
      ("ResourceIdentifier", Some (aggregate_resource_identifier_to_yojson x.resource_identifier));
    ]

let get_compliance_details_by_config_rule_response_to_yojson
    (x : get_compliance_details_by_config_rule_response) =
  assoc_to_yojson
    [
      ("EvaluationResults", option_to_yojson evaluation_results_to_yojson x.evaluation_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_compliance_details_by_config_rule_request_to_yojson
    (x : get_compliance_details_by_config_rule_request) =
  assoc_to_yojson
    [
      ("ConfigRuleName", Some (string_with_char_limit64_to_yojson x.config_rule_name));
      ("ComplianceTypes", option_to_yojson compliance_types_to_yojson x.compliance_types);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_compliance_details_by_resource_response_to_yojson
    (x : get_compliance_details_by_resource_response) =
  assoc_to_yojson
    [
      ("EvaluationResults", option_to_yojson evaluation_results_to_yojson x.evaluation_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let get_compliance_details_by_resource_request_to_yojson
    (x : get_compliance_details_by_resource_request) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson string_with_char_limit256_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson base_resource_id_to_yojson x.resource_id);
      ("ComplianceTypes", option_to_yojson compliance_types_to_yojson x.compliance_types);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "ResourceEvaluationId",
        option_to_yojson resource_evaluation_id_to_yojson x.resource_evaluation_id );
    ]

let get_compliance_summary_by_config_rule_response_to_yojson
    (x : get_compliance_summary_by_config_rule_response) =
  assoc_to_yojson
    [ ("ComplianceSummary", option_to_yojson compliance_summary_to_yojson x.compliance_summary) ]

let get_compliance_summary_by_resource_type_response_to_yojson
    (x : get_compliance_summary_by_resource_type_response) =
  assoc_to_yojson
    [
      ( "ComplianceSummariesByResourceType",
        option_to_yojson compliance_summaries_by_resource_type_to_yojson
          x.compliance_summaries_by_resource_type );
    ]

let resource_types_to_yojson tree = list_to_yojson string_with_char_limit256_to_yojson tree

let get_compliance_summary_by_resource_type_request_to_yojson
    (x : get_compliance_summary_by_resource_type_request) =
  assoc_to_yojson [ ("ResourceTypes", option_to_yojson resource_types_to_yojson x.resource_types) ]

let get_conformance_pack_compliance_details_response_to_yojson
    (x : get_conformance_pack_compliance_details_response) =
  assoc_to_yojson
    [
      ("ConformancePackName", Some (conformance_pack_name_to_yojson x.conformance_pack_name));
      ( "ConformancePackRuleEvaluationResults",
        option_to_yojson conformance_pack_rule_evaluation_results_list_to_yojson
          x.conformance_pack_rule_evaluation_results );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_conformance_pack_compliance_details_limit_to_yojson = int_to_yojson

let get_conformance_pack_compliance_details_request_to_yojson
    (x : get_conformance_pack_compliance_details_request) =
  assoc_to_yojson
    [
      ("ConformancePackName", Some (conformance_pack_name_to_yojson x.conformance_pack_name));
      ("Filters", option_to_yojson conformance_pack_evaluation_filters_to_yojson x.filters);
      ("Limit", option_to_yojson get_conformance_pack_compliance_details_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_conformance_pack_compliance_summary_response_to_yojson
    (x : get_conformance_pack_compliance_summary_response) =
  assoc_to_yojson
    [
      ( "ConformancePackComplianceSummaryList",
        option_to_yojson conformance_pack_compliance_summary_list_to_yojson
          x.conformance_pack_compliance_summary_list );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_conformance_pack_compliance_summary_request_to_yojson
    (x : get_conformance_pack_compliance_summary_request) =
  assoc_to_yojson
    [
      ( "ConformancePackNames",
        Some (conformance_pack_names_to_summarize_list_to_yojson x.conformance_pack_names) );
      ("Limit", option_to_yojson page_size_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_custom_rule_policy_response_to_yojson (x : get_custom_rule_policy_response) =
  assoc_to_yojson [ ("PolicyText", option_to_yojson policy_text_to_yojson x.policy_text) ]

let get_custom_rule_policy_request_to_yojson (x : get_custom_rule_policy_request) =
  assoc_to_yojson
    [ ("ConfigRuleName", option_to_yojson config_rule_name_to_yojson x.config_rule_name) ]

let resource_count_to_yojson (x : resource_count) =
  assoc_to_yojson
    [
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("count", option_to_yojson long_to_yojson x.count);
    ]

let resource_counts_to_yojson tree = list_to_yojson resource_count_to_yojson tree

let get_discovered_resource_counts_response_to_yojson (x : get_discovered_resource_counts_response)
    =
  assoc_to_yojson
    [
      ("totalDiscoveredResources", option_to_yojson long_to_yojson x.total_discovered_resources);
      ("resourceCounts", option_to_yojson resource_counts_to_yojson x.resource_counts);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_discovered_resource_counts_request_to_yojson (x : get_discovered_resource_counts_request) =
  assoc_to_yojson
    [
      ("resourceTypes", option_to_yojson resource_types_to_yojson x.resource_types);
      ("limit", option_to_yojson limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let member_account_rule_status_to_yojson (x : member_account_rule_status) =
  match x with
  | CREATE_SUCCESSFUL -> `String "CREATE_SUCCESSFUL"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETE_SUCCESSFUL -> `String "DELETE_SUCCESSFUL"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | UPDATE_SUCCESSFUL -> `String "UPDATE_SUCCESSFUL"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"

let member_account_status_to_yojson (x : member_account_status) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("ConfigRuleName", Some (string_with_char_limit64_to_yojson x.config_rule_name));
      ( "MemberAccountRuleStatus",
        Some (member_account_rule_status_to_yojson x.member_account_rule_status) );
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("LastUpdateTime", option_to_yojson date_to_yojson x.last_update_time);
    ]

let organization_config_rule_detailed_status_to_yojson tree =
  list_to_yojson member_account_status_to_yojson tree

let get_organization_config_rule_detailed_status_response_to_yojson
    (x : get_organization_config_rule_detailed_status_response) =
  assoc_to_yojson
    [
      ( "OrganizationConfigRuleDetailedStatus",
        option_to_yojson organization_config_rule_detailed_status_to_yojson
          x.organization_config_rule_detailed_status );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let status_detail_filters_to_yojson (x : status_detail_filters) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "MemberAccountRuleStatus",
        option_to_yojson member_account_rule_status_to_yojson x.member_account_rule_status );
    ]

let get_organization_config_rule_detailed_status_request_to_yojson
    (x : get_organization_config_rule_detailed_status_request) =
  assoc_to_yojson
    [
      ( "OrganizationConfigRuleName",
        Some (organization_config_rule_name_to_yojson x.organization_config_rule_name) );
      ("Filters", option_to_yojson status_detail_filters_to_yojson x.filters);
      ("Limit", option_to_yojson cosmos_page_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let organization_resource_detailed_status_to_yojson (x : organization_resource_detailed_status) =
  match x with
  | CREATE_SUCCESSFUL -> `String "CREATE_SUCCESSFUL"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETE_SUCCESSFUL -> `String "DELETE_SUCCESSFUL"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | UPDATE_SUCCESSFUL -> `String "UPDATE_SUCCESSFUL"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"

let organization_conformance_pack_detailed_status_to_yojson
    (x : organization_conformance_pack_detailed_status) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("ConformancePackName", Some (string_with_char_limit256_to_yojson x.conformance_pack_name));
      ("Status", Some (organization_resource_detailed_status_to_yojson x.status));
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("LastUpdateTime", option_to_yojson date_to_yojson x.last_update_time);
    ]

let organization_conformance_pack_detailed_statuses_to_yojson tree =
  list_to_yojson organization_conformance_pack_detailed_status_to_yojson tree

let get_organization_conformance_pack_detailed_status_response_to_yojson
    (x : get_organization_conformance_pack_detailed_status_response) =
  assoc_to_yojson
    [
      ( "OrganizationConformancePackDetailedStatuses",
        option_to_yojson organization_conformance_pack_detailed_statuses_to_yojson
          x.organization_conformance_pack_detailed_statuses );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let organization_resource_detailed_status_filters_to_yojson
    (x : organization_resource_detailed_status_filters) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("Status", option_to_yojson organization_resource_detailed_status_to_yojson x.status);
    ]

let get_organization_conformance_pack_detailed_status_request_to_yojson
    (x : get_organization_conformance_pack_detailed_status_request) =
  assoc_to_yojson
    [
      ( "OrganizationConformancePackName",
        Some (organization_conformance_pack_name_to_yojson x.organization_conformance_pack_name) );
      ("Filters", option_to_yojson organization_resource_detailed_status_filters_to_yojson x.filters);
      ("Limit", option_to_yojson cosmos_page_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let get_organization_custom_rule_policy_response_to_yojson
    (x : get_organization_custom_rule_policy_response) =
  assoc_to_yojson [ ("PolicyText", option_to_yojson policy_text_to_yojson x.policy_text) ]

let get_organization_custom_rule_policy_request_to_yojson
    (x : get_organization_custom_rule_policy_request) =
  assoc_to_yojson
    [
      ( "OrganizationConfigRuleName",
        Some (organization_config_rule_name_to_yojson x.organization_config_rule_name) );
    ]

let invalid_time_range_exception_to_yojson (x : invalid_time_range_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let get_resource_config_history_response_to_yojson (x : get_resource_config_history_response) =
  assoc_to_yojson
    [
      ( "configurationItems",
        option_to_yojson configuration_item_list_to_yojson x.configuration_items );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let later_time_to_yojson = timestamp_epoch_seconds_to_yojson

let get_resource_config_history_request_to_yojson (x : get_resource_config_history_request) =
  assoc_to_yojson
    [
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
      ("resourceId", Some (resource_id_to_yojson x.resource_id));
      ("laterTime", option_to_yojson later_time_to_yojson x.later_time);
      ("earlierTime", option_to_yojson earlier_time_to_yojson x.earlier_time);
      ("chronologicalOrder", option_to_yojson chronological_order_to_yojson x.chronological_order);
      ("limit", option_to_yojson limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let resource_configuration_schema_type_to_yojson (x : resource_configuration_schema_type) =
  match x with CFN_RESOURCE_SCHEMA -> `String "CFN_RESOURCE_SCHEMA"

let resource_configuration_to_yojson = string_to_yojson

let resource_details_to_yojson (x : resource_details) =
  assoc_to_yojson
    [
      ("ResourceId", Some (base_resource_id_to_yojson x.resource_id));
      ("ResourceType", Some (string_with_char_limit256_to_yojson x.resource_type));
      ("ResourceConfiguration", Some (resource_configuration_to_yojson x.resource_configuration));
      ( "ResourceConfigurationSchemaType",
        option_to_yojson resource_configuration_schema_type_to_yojson
          x.resource_configuration_schema_type );
    ]

let get_resource_evaluation_summary_response_to_yojson
    (x : get_resource_evaluation_summary_response) =
  assoc_to_yojson
    [
      ( "ResourceEvaluationId",
        option_to_yojson resource_evaluation_id_to_yojson x.resource_evaluation_id );
      ("EvaluationMode", option_to_yojson evaluation_mode_to_yojson x.evaluation_mode);
      ("EvaluationStatus", option_to_yojson evaluation_status_to_yojson x.evaluation_status);
      ("EvaluationStartTimestamp", option_to_yojson date_to_yojson x.evaluation_start_timestamp);
      ("Compliance", option_to_yojson compliance_type_to_yojson x.compliance);
      ("EvaluationContext", option_to_yojson evaluation_context_to_yojson x.evaluation_context);
      ("ResourceDetails", option_to_yojson resource_details_to_yojson x.resource_details);
    ]

let get_resource_evaluation_summary_request_to_yojson (x : get_resource_evaluation_summary_request)
    =
  assoc_to_yojson
    [ ("ResourceEvaluationId", Some (resource_evaluation_id_to_yojson x.resource_evaluation_id)) ]

let query_expression_to_yojson = string_to_yojson
let query_description_to_yojson = string_to_yojson
let query_arn_to_yojson = string_to_yojson
let query_id_to_yojson = string_to_yojson

let stored_query_to_yojson (x : stored_query) =
  assoc_to_yojson
    [
      ("QueryId", option_to_yojson query_id_to_yojson x.query_id);
      ("QueryArn", option_to_yojson query_arn_to_yojson x.query_arn);
      ("QueryName", Some (query_name_to_yojson x.query_name));
      ("Description", option_to_yojson query_description_to_yojson x.description);
      ("Expression", option_to_yojson query_expression_to_yojson x.expression);
    ]

let get_stored_query_response_to_yojson (x : get_stored_query_response) =
  assoc_to_yojson [ ("StoredQuery", option_to_yojson stored_query_to_yojson x.stored_query) ]

let get_stored_query_request_to_yojson (x : get_stored_query_request) =
  assoc_to_yojson [ ("QueryName", Some (query_name_to_yojson x.query_name)) ]

let idempotent_parameter_mismatch_to_yojson (x : idempotent_parameter_mismatch) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let insufficient_delivery_policy_exception_to_yojson (x : insufficient_delivery_policy_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_configuration_recorder_name_exception_to_yojson
    (x : invalid_configuration_recorder_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_delivery_channel_name_exception_to_yojson (x : invalid_delivery_channel_name_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_expression_exception_to_yojson (x : invalid_expression_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_recording_group_exception_to_yojson (x : invalid_recording_group_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_result_token_exception_to_yojson (x : invalid_result_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_role_exception_to_yojson (x : invalid_role_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_s3_key_prefix_exception_to_yojson (x : invalid_s3_key_prefix_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_s3_kms_key_arn_exception_to_yojson (x : invalid_s3_kms_key_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_sns_topic_arn_exception_to_yojson (x : invalid_sns_topic_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let list_aggregate_discovered_resources_response_to_yojson
    (x : list_aggregate_discovered_resources_response) =
  assoc_to_yojson
    [
      ( "ResourceIdentifiers",
        option_to_yojson discovered_resource_identifier_list_to_yojson x.resource_identifiers );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let resource_filters_to_yojson (x : resource_filters) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("ResourceName", option_to_yojson resource_name_to_yojson x.resource_name);
      ("Region", option_to_yojson aws_region_to_yojson x.region);
    ]

let list_aggregate_discovered_resources_request_to_yojson
    (x : list_aggregate_discovered_resources_request) =
  assoc_to_yojson
    [
      ( "ConfigurationAggregatorName",
        Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name) );
      ("ResourceType", Some (resource_type_to_yojson x.resource_type));
      ("Filters", option_to_yojson resource_filters_to_yojson x.filters);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_configuration_recorders_response_to_yojson (x : list_configuration_recorders_response) =
  assoc_to_yojson
    [
      ( "ConfigurationRecorderSummaries",
        Some (configuration_recorder_summaries_to_yojson x.configuration_recorder_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_configuration_recorders_request_to_yojson (x : list_configuration_recorders_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson configuration_recorder_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_conformance_pack_compliance_scores_response_to_yojson
    (x : list_conformance_pack_compliance_scores_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ConformancePackComplianceScores",
        Some (conformance_pack_compliance_scores_to_yojson x.conformance_pack_compliance_scores) );
    ]

let sort_by_to_yojson (x : sort_by) = match x with SCORE -> `String "SCORE"

let sort_order_to_yojson (x : sort_order) =
  match x with ASCENDING -> `String "ASCENDING" | DESCENDING -> `String "DESCENDING"

let list_conformance_pack_compliance_scores_request_to_yojson
    (x : list_conformance_pack_compliance_scores_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson conformance_pack_compliance_scores_filters_to_yojson x.filters);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_by_to_yojson x.sort_by);
      ("Limit", option_to_yojson page_size_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let resource_deletion_time_to_yojson = timestamp_epoch_seconds_to_yojson

let resource_identifier_to_yojson (x : resource_identifier) =
  assoc_to_yojson
    [
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("resourceName", option_to_yojson resource_name_to_yojson x.resource_name);
      ( "resourceDeletionTime",
        option_to_yojson resource_deletion_time_to_yojson x.resource_deletion_time );
    ]

let resource_identifier_list_to_yojson tree = list_to_yojson resource_identifier_to_yojson tree

let list_discovered_resources_response_to_yojson (x : list_discovered_resources_response) =
  assoc_to_yojson
    [
      ( "resourceIdentifiers",
        option_to_yojson resource_identifier_list_to_yojson x.resource_identifiers );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let resource_id_list_to_yojson tree = list_to_yojson resource_id_to_yojson tree

let list_discovered_resources_request_to_yojson (x : list_discovered_resources_request) =
  assoc_to_yojson
    [
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
      ("resourceIds", option_to_yojson resource_id_list_to_yojson x.resource_ids);
      ("resourceName", option_to_yojson resource_name_to_yojson x.resource_name);
      ("limit", option_to_yojson limit_to_yojson x.limit);
      ("includeDeletedResources", option_to_yojson boolean__to_yojson x.include_deleted_resources);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let resource_evaluation_to_yojson (x : resource_evaluation) =
  assoc_to_yojson
    [
      ( "ResourceEvaluationId",
        option_to_yojson resource_evaluation_id_to_yojson x.resource_evaluation_id );
      ("EvaluationMode", option_to_yojson evaluation_mode_to_yojson x.evaluation_mode);
      ("EvaluationStartTimestamp", option_to_yojson date_to_yojson x.evaluation_start_timestamp);
    ]

let resource_evaluations_to_yojson tree = list_to_yojson resource_evaluation_to_yojson tree

let list_resource_evaluations_response_to_yojson (x : list_resource_evaluations_response) =
  assoc_to_yojson
    [
      ("ResourceEvaluations", option_to_yojson resource_evaluations_to_yojson x.resource_evaluations);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_resource_evaluations_page_item_limit_to_yojson = int_to_yojson

let time_window_to_yojson (x : time_window) =
  assoc_to_yojson
    [
      ("StartTime", option_to_yojson date_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_to_yojson x.end_time);
    ]

let resource_evaluation_filters_to_yojson (x : resource_evaluation_filters) =
  assoc_to_yojson
    [
      ("EvaluationMode", option_to_yojson evaluation_mode_to_yojson x.evaluation_mode);
      ("TimeWindow", option_to_yojson time_window_to_yojson x.time_window);
      ( "EvaluationContextIdentifier",
        option_to_yojson evaluation_context_identifier_to_yojson x.evaluation_context_identifier );
    ]

let list_resource_evaluations_request_to_yojson (x : list_resource_evaluations_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson resource_evaluation_filters_to_yojson x.filters);
      ("Limit", option_to_yojson list_resource_evaluations_page_item_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let stored_query_metadata_to_yojson (x : stored_query_metadata) =
  assoc_to_yojson
    [
      ("QueryId", Some (query_id_to_yojson x.query_id));
      ("QueryArn", Some (query_arn_to_yojson x.query_arn));
      ("QueryName", Some (query_name_to_yojson x.query_name));
      ("Description", option_to_yojson query_description_to_yojson x.description);
    ]

let stored_query_metadata_list_to_yojson tree = list_to_yojson stored_query_metadata_to_yojson tree

let list_stored_queries_response_to_yojson (x : list_stored_queries_response) =
  assoc_to_yojson
    [
      ( "StoredQueryMetadata",
        option_to_yojson stored_query_metadata_list_to_yojson x.stored_query_metadata );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_stored_queries_request_to_yojson (x : list_stored_queries_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
    ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson tag_key_to_yojson x.key);
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_active_resources_exceeded_exception_to_yojson (x : max_active_resources_exceeded_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let max_number_of_config_rules_exceeded_exception_to_yojson
    (x : max_number_of_config_rules_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let max_number_of_configuration_recorders_exceeded_exception_to_yojson
    (x : max_number_of_configuration_recorders_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let max_number_of_conformance_packs_exceeded_exception_to_yojson
    (x : max_number_of_conformance_packs_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let max_number_of_delivery_channels_exceeded_exception_to_yojson
    (x : max_number_of_delivery_channels_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let max_number_of_organization_config_rules_exceeded_exception_to_yojson
    (x : max_number_of_organization_config_rules_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let max_number_of_organization_conformance_packs_exceeded_exception_to_yojson
    (x : max_number_of_organization_conformance_packs_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let max_number_of_retention_configurations_exceeded_exception_to_yojson
    (x : max_number_of_retention_configurations_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let no_available_delivery_channel_exception_to_yojson (x : no_available_delivery_channel_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let no_available_organization_exception_to_yojson (x : no_available_organization_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let no_such_bucket_exception_to_yojson (x : no_such_bucket_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let organization_all_features_not_enabled_exception_to_yojson
    (x : organization_all_features_not_enabled_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let organization_conformance_pack_template_validation_exception_to_yojson
    (x : organization_conformance_pack_template_validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let organization_custom_policy_rule_metadata_to_yojson
    (x : organization_custom_policy_rule_metadata) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson string_with_char_limit256_min0_to_yojson x.description);
      ( "OrganizationConfigRuleTriggerTypes",
        option_to_yojson organization_config_rule_trigger_type_no_s_ns_to_yojson
          x.organization_config_rule_trigger_types );
      ("InputParameters", option_to_yojson string_with_char_limit1024_to_yojson x.input_parameters);
      ( "MaximumExecutionFrequency",
        option_to_yojson maximum_execution_frequency_to_yojson x.maximum_execution_frequency );
      ("ResourceTypesScope", option_to_yojson resource_types_scope_to_yojson x.resource_types_scope);
      ("ResourceIdScope", option_to_yojson string_with_char_limit768_to_yojson x.resource_id_scope);
      ("TagKeyScope", option_to_yojson string_with_char_limit128_to_yojson x.tag_key_scope);
      ("TagValueScope", option_to_yojson string_with_char_limit256_to_yojson x.tag_value_scope);
      ("PolicyRuntime", Some (policy_runtime_to_yojson x.policy_runtime));
      ("PolicyText", Some (policy_text_to_yojson x.policy_text));
      ( "DebugLogDeliveryAccounts",
        option_to_yojson debug_log_delivery_accounts_to_yojson x.debug_log_delivery_accounts );
    ]

let put_aggregation_authorization_response_to_yojson (x : put_aggregation_authorization_response) =
  assoc_to_yojson
    [
      ( "AggregationAuthorization",
        option_to_yojson aggregation_authorization_to_yojson x.aggregation_authorization );
    ]

let tags_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let put_aggregation_authorization_request_to_yojson (x : put_aggregation_authorization_request) =
  assoc_to_yojson
    [
      ("AuthorizedAccountId", Some (account_id_to_yojson x.authorized_account_id));
      ("AuthorizedAwsRegion", Some (aws_region_to_yojson x.authorized_aws_region));
      ("Tags", option_to_yojson tags_list_to_yojson x.tags);
    ]

let put_config_rule_request_to_yojson (x : put_config_rule_request) =
  assoc_to_yojson
    [
      ("ConfigRule", Some (config_rule_to_yojson x.config_rule));
      ("Tags", option_to_yojson tags_list_to_yojson x.tags);
    ]

let put_configuration_aggregator_response_to_yojson (x : put_configuration_aggregator_response) =
  assoc_to_yojson
    [
      ( "ConfigurationAggregator",
        option_to_yojson configuration_aggregator_to_yojson x.configuration_aggregator );
    ]

let put_configuration_aggregator_request_to_yojson (x : put_configuration_aggregator_request) =
  assoc_to_yojson
    [
      ( "ConfigurationAggregatorName",
        Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name) );
      ( "AccountAggregationSources",
        option_to_yojson account_aggregation_source_list_to_yojson x.account_aggregation_sources );
      ( "OrganizationAggregationSource",
        option_to_yojson organization_aggregation_source_to_yojson x.organization_aggregation_source
      );
      ("Tags", option_to_yojson tags_list_to_yojson x.tags);
      ("AggregatorFilters", option_to_yojson aggregator_filters_to_yojson x.aggregator_filters);
    ]

let put_configuration_recorder_request_to_yojson (x : put_configuration_recorder_request) =
  assoc_to_yojson
    [
      ("ConfigurationRecorder", Some (configuration_recorder_to_yojson x.configuration_recorder));
      ("Tags", option_to_yojson tags_list_to_yojson x.tags);
    ]

let put_conformance_pack_response_to_yojson (x : put_conformance_pack_response) =
  assoc_to_yojson
    [
      ("ConformancePackArn", option_to_yojson conformance_pack_arn_to_yojson x.conformance_pack_arn);
    ]

let template_body_to_yojson = string_to_yojson
let template_s3_uri_to_yojson = string_to_yojson

let put_conformance_pack_request_to_yojson (x : put_conformance_pack_request) =
  assoc_to_yojson
    [
      ("ConformancePackName", Some (conformance_pack_name_to_yojson x.conformance_pack_name));
      ("TemplateS3Uri", option_to_yojson template_s3_uri_to_yojson x.template_s3_uri);
      ("TemplateBody", option_to_yojson template_body_to_yojson x.template_body);
      ("DeliveryS3Bucket", option_to_yojson delivery_s3_bucket_to_yojson x.delivery_s3_bucket);
      ( "DeliveryS3KeyPrefix",
        option_to_yojson delivery_s3_key_prefix_to_yojson x.delivery_s3_key_prefix );
      ( "ConformancePackInputParameters",
        option_to_yojson conformance_pack_input_parameters_to_yojson
          x.conformance_pack_input_parameters );
      ( "TemplateSSMDocumentDetails",
        option_to_yojson template_ssm_document_details_to_yojson x.template_ssm_document_details );
      ("Tags", option_to_yojson tags_list_to_yojson x.tags);
    ]

let put_delivery_channel_request_to_yojson (x : put_delivery_channel_request) =
  assoc_to_yojson [ ("DeliveryChannel", Some (delivery_channel_to_yojson x.delivery_channel)) ]

let put_evaluations_response_to_yojson (x : put_evaluations_response) =
  assoc_to_yojson
    [ ("FailedEvaluations", option_to_yojson evaluations_to_yojson x.failed_evaluations) ]

let put_evaluations_request_to_yojson (x : put_evaluations_request) =
  assoc_to_yojson
    [
      ("Evaluations", option_to_yojson evaluations_to_yojson x.evaluations);
      ("ResultToken", Some (string__to_yojson x.result_token));
      ("TestMode", option_to_yojson boolean__to_yojson x.test_mode);
    ]

let put_external_evaluation_response_to_yojson = unit_to_yojson

let put_external_evaluation_request_to_yojson (x : put_external_evaluation_request) =
  assoc_to_yojson
    [
      ("ConfigRuleName", Some (config_rule_name_to_yojson x.config_rule_name));
      ("ExternalEvaluation", Some (external_evaluation_to_yojson x.external_evaluation));
    ]

let put_organization_config_rule_response_to_yojson (x : put_organization_config_rule_response) =
  assoc_to_yojson
    [
      ( "OrganizationConfigRuleArn",
        option_to_yojson string_with_char_limit256_to_yojson x.organization_config_rule_arn );
    ]

let put_organization_config_rule_request_to_yojson (x : put_organization_config_rule_request) =
  assoc_to_yojson
    [
      ( "OrganizationConfigRuleName",
        Some (organization_config_rule_name_to_yojson x.organization_config_rule_name) );
      ( "OrganizationManagedRuleMetadata",
        option_to_yojson organization_managed_rule_metadata_to_yojson
          x.organization_managed_rule_metadata );
      ( "OrganizationCustomRuleMetadata",
        option_to_yojson organization_custom_rule_metadata_to_yojson
          x.organization_custom_rule_metadata );
      ("ExcludedAccounts", option_to_yojson excluded_accounts_to_yojson x.excluded_accounts);
      ( "OrganizationCustomPolicyRuleMetadata",
        option_to_yojson organization_custom_policy_rule_metadata_to_yojson
          x.organization_custom_policy_rule_metadata );
      ("Tags", option_to_yojson tags_list_to_yojson x.tags);
    ]

let put_organization_conformance_pack_response_to_yojson
    (x : put_organization_conformance_pack_response) =
  assoc_to_yojson
    [
      ( "OrganizationConformancePackArn",
        option_to_yojson string_with_char_limit256_to_yojson x.organization_conformance_pack_arn );
    ]

let put_organization_conformance_pack_request_to_yojson
    (x : put_organization_conformance_pack_request) =
  assoc_to_yojson
    [
      ( "OrganizationConformancePackName",
        Some (organization_conformance_pack_name_to_yojson x.organization_conformance_pack_name) );
      ("TemplateS3Uri", option_to_yojson template_s3_uri_to_yojson x.template_s3_uri);
      ("TemplateBody", option_to_yojson template_body_to_yojson x.template_body);
      ("DeliveryS3Bucket", option_to_yojson delivery_s3_bucket_to_yojson x.delivery_s3_bucket);
      ( "DeliveryS3KeyPrefix",
        option_to_yojson delivery_s3_key_prefix_to_yojson x.delivery_s3_key_prefix );
      ( "ConformancePackInputParameters",
        option_to_yojson conformance_pack_input_parameters_to_yojson
          x.conformance_pack_input_parameters );
      ("ExcludedAccounts", option_to_yojson excluded_accounts_to_yojson x.excluded_accounts);
      ("Tags", option_to_yojson tags_list_to_yojson x.tags);
    ]

let put_remediation_configurations_response_to_yojson (x : put_remediation_configurations_response)
    =
  assoc_to_yojson
    [ ("FailedBatches", option_to_yojson failed_remediation_batches_to_yojson x.failed_batches) ]

let put_remediation_configurations_request_to_yojson (x : put_remediation_configurations_request) =
  assoc_to_yojson
    [
      ( "RemediationConfigurations",
        Some (remediation_configurations_to_yojson x.remediation_configurations) );
    ]

let put_remediation_exceptions_response_to_yojson (x : put_remediation_exceptions_response) =
  assoc_to_yojson
    [
      ( "FailedBatches",
        option_to_yojson failed_remediation_exception_batches_to_yojson x.failed_batches );
    ]

let put_remediation_exceptions_request_to_yojson (x : put_remediation_exceptions_request) =
  assoc_to_yojson
    [
      ("ConfigRuleName", Some (config_rule_name_to_yojson x.config_rule_name));
      ("ResourceKeys", Some (remediation_exception_resource_keys_to_yojson x.resource_keys));
      ("Message", option_to_yojson string_with_char_limit1024_to_yojson x.message);
      ("ExpirationTime", option_to_yojson date_to_yojson x.expiration_time);
    ]

let schema_version_id_to_yojson = string_to_yojson

let put_resource_config_request_to_yojson (x : put_resource_config_request) =
  assoc_to_yojson
    [
      ("ResourceType", Some (resource_type_string_to_yojson x.resource_type));
      ("SchemaVersionId", Some (schema_version_id_to_yojson x.schema_version_id));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("ResourceName", option_to_yojson resource_name_to_yojson x.resource_name);
      ("Configuration", Some (configuration_to_yojson x.configuration));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let put_retention_configuration_response_to_yojson (x : put_retention_configuration_response) =
  assoc_to_yojson
    [
      ( "RetentionConfiguration",
        option_to_yojson retention_configuration_to_yojson x.retention_configuration );
    ]

let put_retention_configuration_request_to_yojson (x : put_retention_configuration_request) =
  assoc_to_yojson
    [
      ("RetentionPeriodInDays", Some (retention_period_in_days_to_yojson x.retention_period_in_days));
    ]

let put_service_linked_configuration_recorder_response_to_yojson
    (x : put_service_linked_configuration_recorder_response) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson amazon_resource_name_to_yojson x.arn);
      ("Name", option_to_yojson recorder_name_to_yojson x.name);
    ]

let put_service_linked_configuration_recorder_request_to_yojson
    (x : put_service_linked_configuration_recorder_request) =
  assoc_to_yojson
    [
      ("ServicePrincipal", Some (service_principal_to_yojson x.service_principal));
      ("Tags", option_to_yojson tags_list_to_yojson x.tags);
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let resource_concurrent_modification_exception_to_yojson
    (x : resource_concurrent_modification_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let put_stored_query_response_to_yojson (x : put_stored_query_response) =
  assoc_to_yojson [ ("QueryArn", option_to_yojson query_arn_to_yojson x.query_arn) ]

let put_stored_query_request_to_yojson (x : put_stored_query_request) =
  assoc_to_yojson
    [
      ("StoredQuery", Some (stored_query_to_yojson x.stored_query));
      ("Tags", option_to_yojson tags_list_to_yojson x.tags);
    ]

let query_info_to_yojson (x : query_info) =
  assoc_to_yojson [ ("SelectFields", option_to_yojson field_info_list_to_yojson x.select_fields) ]

let reevaluate_config_rule_names_to_yojson tree = list_to_yojson config_rule_name_to_yojson tree
let results_to_yojson tree = list_to_yojson string__to_yojson tree

let select_aggregate_resource_config_response_to_yojson
    (x : select_aggregate_resource_config_response) =
  assoc_to_yojson
    [
      ("Results", option_to_yojson results_to_yojson x.results);
      ("QueryInfo", option_to_yojson query_info_to_yojson x.query_info);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let select_aggregate_resource_config_request_to_yojson
    (x : select_aggregate_resource_config_request) =
  assoc_to_yojson
    [
      ("Expression", Some (expression_to_yojson x.expression));
      ( "ConfigurationAggregatorName",
        Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name) );
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let select_resource_config_response_to_yojson (x : select_resource_config_response) =
  assoc_to_yojson
    [
      ("Results", option_to_yojson results_to_yojson x.results);
      ("QueryInfo", option_to_yojson query_info_to_yojson x.query_info);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let select_resource_config_request_to_yojson (x : select_resource_config_request) =
  assoc_to_yojson
    [
      ("Expression", Some (expression_to_yojson x.expression));
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let stop_configuration_recorder_request_to_yojson (x : stop_configuration_recorder_request) =
  assoc_to_yojson
    [ ("ConfigurationRecorderName", Some (recorder_name_to_yojson x.configuration_recorder_name)) ]

let start_resource_evaluation_response_to_yojson (x : start_resource_evaluation_response) =
  assoc_to_yojson
    [
      ( "ResourceEvaluationId",
        option_to_yojson resource_evaluation_id_to_yojson x.resource_evaluation_id );
    ]

let start_resource_evaluation_request_to_yojson (x : start_resource_evaluation_request) =
  assoc_to_yojson
    [
      ("ResourceDetails", Some (resource_details_to_yojson x.resource_details));
      ("EvaluationContext", option_to_yojson evaluation_context_to_yojson x.evaluation_context);
      ("EvaluationMode", Some (evaluation_mode_to_yojson x.evaluation_mode));
      ("EvaluationTimeout", option_to_yojson evaluation_timeout_to_yojson x.evaluation_timeout);
      ("ClientToken", option_to_yojson client_token_to_yojson x.client_token);
    ]

let start_remediation_execution_response_to_yojson (x : start_remediation_execution_response) =
  assoc_to_yojson
    [
      ("FailureMessage", option_to_yojson string__to_yojson x.failure_message);
      ("FailedItems", option_to_yojson resource_keys_to_yojson x.failed_items);
    ]

let start_remediation_execution_request_to_yojson (x : start_remediation_execution_request) =
  assoc_to_yojson
    [
      ("ConfigRuleName", Some (config_rule_name_to_yojson x.config_rule_name));
      ("ResourceKeys", Some (resource_keys_to_yojson x.resource_keys));
    ]

let start_configuration_recorder_request_to_yojson (x : start_configuration_recorder_request) =
  assoc_to_yojson
    [ ("ConfigurationRecorderName", Some (recorder_name_to_yojson x.configuration_recorder_name)) ]

let start_config_rules_evaluation_response_to_yojson = unit_to_yojson

let start_config_rules_evaluation_request_to_yojson (x : start_config_rules_evaluation_request) =
  assoc_to_yojson
    [
      ( "ConfigRuleNames",
        option_to_yojson reevaluate_config_rule_names_to_yojson x.config_rule_names );
    ]
