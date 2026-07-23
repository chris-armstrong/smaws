open Smaws_Lib.Json.DeserializeHelpers
open Types

let ar_n_of_yojson = string_of_yojson
let string__of_yojson = string_of_yojson
let aggregator_region_list_of_yojson tree path = list_of_yojson string__of_yojson tree path
let boolean__of_yojson = bool_of_yojson
let account_id_of_yojson = string_of_yojson

let account_aggregation_source_account_list_of_yojson tree path =
  list_of_yojson account_id_of_yojson tree path

let account_aggregation_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids =
       value_for_key account_aggregation_source_account_list_of_yojson "AccountIds" _list path;
     all_aws_regions =
       option_of_yojson (value_for_key boolean__of_yojson "AllAwsRegions") _list path;
     aws_regions =
       option_of_yojson (value_for_key aggregator_region_list_of_yojson "AwsRegions") _list path;
   }
    : account_aggregation_source)

let account_aggregation_source_list_of_yojson tree path =
  list_of_yojson account_aggregation_source_of_yojson tree path

let aws_region_of_yojson = string_of_yojson
let integer_of_yojson = int_of_yojson

let compliance_contributor_count_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capped_count = option_of_yojson (value_for_key integer_of_yojson "CappedCount") _list path;
     cap_exceeded = option_of_yojson (value_for_key boolean__of_yojson "CapExceeded") _list path;
   }
    : compliance_contributor_count)

let compliance_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLIANT" -> Compliant
    | `String "NON_COMPLIANT" -> Non_Compliant
    | `String "NOT_APPLICABLE" -> Not_Applicable
    | `String "INSUFFICIENT_DATA" -> Insufficient_Data
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComplianceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ComplianceType")
     : compliance_type)
    : compliance_type)

let compliance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_type =
       option_of_yojson (value_for_key compliance_type_of_yojson "ComplianceType") _list path;
     compliance_contributor_count =
       option_of_yojson
         (value_for_key compliance_contributor_count_of_yojson "ComplianceContributorCount")
         _list path;
   }
    : compliance)

let config_rule_name_of_yojson = string_of_yojson

let aggregate_compliance_by_config_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name =
       option_of_yojson (value_for_key config_rule_name_of_yojson "ConfigRuleName") _list path;
     compliance = option_of_yojson (value_for_key compliance_of_yojson "Compliance") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     aws_region = option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion") _list path;
   }
    : aggregate_compliance_by_config_rule)

let aggregate_compliance_by_config_rule_list_of_yojson tree path =
  list_of_yojson aggregate_compliance_by_config_rule_of_yojson tree path

let conformance_pack_compliance_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLIANT" -> COMPLIANT
    | `String "NON_COMPLIANT" -> NON_COMPLIANT
    | `String "INSUFFICIENT_DATA" -> INSUFFICIENT_DATA
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConformancePackComplianceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConformancePackComplianceType")
     : conformance_pack_compliance_type)
    : conformance_pack_compliance_type)

let aggregate_conformance_pack_compliance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_type =
       option_of_yojson
         (value_for_key conformance_pack_compliance_type_of_yojson "ComplianceType")
         _list path;
     compliant_rule_count =
       option_of_yojson (value_for_key integer_of_yojson "CompliantRuleCount") _list path;
     non_compliant_rule_count =
       option_of_yojson (value_for_key integer_of_yojson "NonCompliantRuleCount") _list path;
     total_rule_count =
       option_of_yojson (value_for_key integer_of_yojson "TotalRuleCount") _list path;
   }
    : aggregate_conformance_pack_compliance)

let conformance_pack_name_of_yojson = string_of_yojson

let aggregate_compliance_by_conformance_pack_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_name =
       option_of_yojson
         (value_for_key conformance_pack_name_of_yojson "ConformancePackName")
         _list path;
     compliance =
       option_of_yojson
         (value_for_key aggregate_conformance_pack_compliance_of_yojson "Compliance")
         _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     aws_region = option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion") _list path;
   }
    : aggregate_compliance_by_conformance_pack)

let aggregate_compliance_by_conformance_pack_list_of_yojson tree path =
  list_of_yojson aggregate_compliance_by_conformance_pack_of_yojson tree path

let date_of_yojson = timestamp_epoch_seconds_of_yojson

let compliance_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliant_resource_count =
       option_of_yojson
         (value_for_key compliance_contributor_count_of_yojson "CompliantResourceCount")
         _list path;
     non_compliant_resource_count =
       option_of_yojson
         (value_for_key compliance_contributor_count_of_yojson "NonCompliantResourceCount")
         _list path;
     compliance_summary_timestamp =
       option_of_yojson (value_for_key date_of_yojson "ComplianceSummaryTimestamp") _list path;
   }
    : compliance_summary)

let string_with_char_limit256_of_yojson = string_of_yojson

let aggregate_compliance_count_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_name =
       option_of_yojson (value_for_key string_with_char_limit256_of_yojson "GroupName") _list path;
     compliance_summary =
       option_of_yojson (value_for_key compliance_summary_of_yojson "ComplianceSummary") _list path;
   }
    : aggregate_compliance_count)

let aggregate_compliance_count_list_of_yojson tree path =
  list_of_yojson aggregate_compliance_count_of_yojson tree path

let aggregate_conformance_pack_compliance_count_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliant_conformance_pack_count =
       option_of_yojson (value_for_key integer_of_yojson "CompliantConformancePackCount") _list path;
     non_compliant_conformance_pack_count =
       option_of_yojson
         (value_for_key integer_of_yojson "NonCompliantConformancePackCount")
         _list path;
   }
    : aggregate_conformance_pack_compliance_count)

let aggregate_conformance_pack_compliance_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_name =
       option_of_yojson
         (value_for_key conformance_pack_name_of_yojson "ConformancePackName")
         _list path;
     compliance_type =
       option_of_yojson
         (value_for_key conformance_pack_compliance_type_of_yojson "ComplianceType")
         _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     aws_region = option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion") _list path;
   }
    : aggregate_conformance_pack_compliance_filters)

let aggregate_conformance_pack_compliance_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_summary =
       option_of_yojson
         (value_for_key aggregate_conformance_pack_compliance_count_of_yojson "ComplianceSummary")
         _list path;
     group_name =
       option_of_yojson (value_for_key string_with_char_limit256_of_yojson "GroupName") _list path;
   }
    : aggregate_conformance_pack_compliance_summary)

let aggregate_conformance_pack_compliance_summary_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     aws_region = option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion") _list path;
   }
    : aggregate_conformance_pack_compliance_summary_filters)

let aggregate_conformance_pack_compliance_summary_group_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT_ID" -> ACCOUNT_ID
    | `String "AWS_REGION" -> AWS_REGION
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "AggregateConformancePackComplianceSummaryGroupKey" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path "AggregateConformancePackComplianceSummaryGroupKey")
     : aggregate_conformance_pack_compliance_summary_group_key)
    : aggregate_conformance_pack_compliance_summary_group_key)

let aggregate_conformance_pack_compliance_summary_list_of_yojson tree path =
  list_of_yojson aggregate_conformance_pack_compliance_summary_of_yojson tree path

let resource_evaluation_id_of_yojson = string_of_yojson

let evaluation_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "DETECTIVE" -> DETECTIVE
    | `String "PROACTIVE" -> PROACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "EvaluationMode" value)
    | _ -> raise (deserialize_wrong_type_error path "EvaluationMode")
     : evaluation_mode)
    : evaluation_mode)

let base_resource_id_of_yojson = string_of_yojson

let evaluation_result_qualifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name =
       option_of_yojson (value_for_key config_rule_name_of_yojson "ConfigRuleName") _list path;
     resource_type =
       option_of_yojson
         (value_for_key string_with_char_limit256_of_yojson "ResourceType")
         _list path;
     resource_id =
       option_of_yojson (value_for_key base_resource_id_of_yojson "ResourceId") _list path;
     evaluation_mode =
       option_of_yojson (value_for_key evaluation_mode_of_yojson "EvaluationMode") _list path;
   }
    : evaluation_result_qualifier)

let evaluation_result_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_result_qualifier =
       option_of_yojson
         (value_for_key evaluation_result_qualifier_of_yojson "EvaluationResultQualifier")
         _list path;
     ordering_timestamp =
       option_of_yojson (value_for_key date_of_yojson "OrderingTimestamp") _list path;
     resource_evaluation_id =
       option_of_yojson
         (value_for_key resource_evaluation_id_of_yojson "ResourceEvaluationId")
         _list path;
   }
    : evaluation_result_identifier)

let aggregate_evaluation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_result_identifier =
       option_of_yojson
         (value_for_key evaluation_result_identifier_of_yojson "EvaluationResultIdentifier")
         _list path;
     compliance_type =
       option_of_yojson (value_for_key compliance_type_of_yojson "ComplianceType") _list path;
     result_recorded_time =
       option_of_yojson (value_for_key date_of_yojson "ResultRecordedTime") _list path;
     config_rule_invoked_time =
       option_of_yojson (value_for_key date_of_yojson "ConfigRuleInvokedTime") _list path;
     annotation =
       option_of_yojson (value_for_key string_with_char_limit256_of_yojson "Annotation") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     aws_region = option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion") _list path;
   }
    : aggregate_evaluation_result)

let aggregate_evaluation_result_list_of_yojson tree path =
  list_of_yojson aggregate_evaluation_result_of_yojson tree path

let resource_name_of_yojson = string_of_yojson

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS::EC2::CustomerGateway" -> CustomerGateway
    | `String "AWS::EC2::EIP" -> EIP
    | `String "AWS::EC2::Host" -> Host
    | `String "AWS::EC2::Instance" -> Instance
    | `String "AWS::EC2::InternetGateway" -> InternetGateway
    | `String "AWS::EC2::NetworkAcl" -> NetworkAcl
    | `String "AWS::EC2::NetworkInterface" -> NetworkInterface
    | `String "AWS::EC2::RouteTable" -> RouteTable
    | `String "AWS::EC2::SecurityGroup" -> SecurityGroup
    | `String "AWS::EC2::Subnet" -> Subnet
    | `String "AWS::CloudTrail::Trail" -> Trail
    | `String "AWS::EC2::Volume" -> Volume
    | `String "AWS::EC2::VPC" -> VPC
    | `String "AWS::EC2::VPNConnection" -> VPNConnection
    | `String "AWS::EC2::VPNGateway" -> VPNGateway
    | `String "AWS::EC2::RegisteredHAInstance" -> RegisteredHAInstance
    | `String "AWS::EC2::NatGateway" -> NatGateway
    | `String "AWS::EC2::EgressOnlyInternetGateway" -> EgressOnlyInternetGateway
    | `String "AWS::EC2::VPCEndpoint" -> VPCEndpoint
    | `String "AWS::EC2::VPCEndpointService" -> VPCEndpointService
    | `String "AWS::EC2::FlowLog" -> FlowLog
    | `String "AWS::EC2::VPCPeeringConnection" -> VPCPeeringConnection
    | `String "AWS::Elasticsearch::Domain" -> Domain
    | `String "AWS::IAM::Group" -> Group
    | `String "AWS::IAM::Policy" -> Policy
    | `String "AWS::IAM::Role" -> Role
    | `String "AWS::IAM::User" -> User
    | `String "AWS::ElasticLoadBalancingV2::LoadBalancer" -> LoadBalancerV2
    | `String "AWS::ACM::Certificate" -> Certificate
    | `String "AWS::RDS::DBInstance" -> DBInstance
    | `String "AWS::RDS::DBSubnetGroup" -> DBSubnetGroup
    | `String "AWS::RDS::DBSecurityGroup" -> DBSecurityGroup
    | `String "AWS::RDS::DBSnapshot" -> DBSnapshot
    | `String "AWS::RDS::DBCluster" -> DBCluster
    | `String "AWS::RDS::DBClusterSnapshot" -> DBClusterSnapshot
    | `String "AWS::RDS::EventSubscription" -> EventSubscription
    | `String "AWS::S3::Bucket" -> Bucket
    | `String "AWS::S3::AccountPublicAccessBlock" -> AccountPublicAccessBlock
    | `String "AWS::Redshift::Cluster" -> Cluster
    | `String "AWS::Redshift::ClusterSnapshot" -> ClusterSnapshot
    | `String "AWS::Redshift::ClusterParameterGroup" -> ClusterParameterGroup
    | `String "AWS::Redshift::ClusterSecurityGroup" -> ClusterSecurityGroup
    | `String "AWS::Redshift::ClusterSubnetGroup" -> ClusterSubnetGroup
    | `String "AWS::Redshift::EventSubscription" -> RedshiftEventSubscription
    | `String "AWS::SSM::ManagedInstanceInventory" -> ManagedInstanceInventory
    | `String "AWS::CloudWatch::Alarm" -> Alarm
    | `String "AWS::CloudFormation::Stack" -> Stack
    | `String "AWS::ElasticLoadBalancing::LoadBalancer" -> LoadBalancer
    | `String "AWS::AutoScaling::AutoScalingGroup" -> AutoScalingGroup
    | `String "AWS::AutoScaling::LaunchConfiguration" -> LaunchConfiguration
    | `String "AWS::AutoScaling::ScalingPolicy" -> ScalingPolicy
    | `String "AWS::AutoScaling::ScheduledAction" -> ScheduledAction
    | `String "AWS::DynamoDB::Table" -> Table
    | `String "AWS::CodeBuild::Project" -> Project
    | `String "AWS::WAF::RateBasedRule" -> RateBasedRule
    | `String "AWS::WAF::Rule" -> Rule
    | `String "AWS::WAF::RuleGroup" -> RuleGroup
    | `String "AWS::WAF::WebACL" -> WebACL
    | `String "AWS::WAFRegional::RateBasedRule" -> RegionalRateBasedRule
    | `String "AWS::WAFRegional::Rule" -> RegionalRule
    | `String "AWS::WAFRegional::RuleGroup" -> RegionalRuleGroup
    | `String "AWS::WAFRegional::WebACL" -> RegionalWebACL
    | `String "AWS::CloudFront::Distribution" -> Distribution
    | `String "AWS::CloudFront::StreamingDistribution" -> StreamingDistribution
    | `String "AWS::Lambda::Function" -> Function
    | `String "AWS::NetworkFirewall::Firewall" -> NetworkFirewallFirewall
    | `String "AWS::NetworkFirewall::FirewallPolicy" -> NetworkFirewallFirewallPolicy
    | `String "AWS::NetworkFirewall::RuleGroup" -> NetworkFirewallRuleGroup
    | `String "AWS::ElasticBeanstalk::Application" -> Application
    | `String "AWS::ElasticBeanstalk::ApplicationVersion" -> ApplicationVersion
    | `String "AWS::ElasticBeanstalk::Environment" -> Environment
    | `String "AWS::WAFv2::WebACL" -> WebACLV2
    | `String "AWS::WAFv2::RuleGroup" -> RuleGroupV2
    | `String "AWS::WAFv2::IPSet" -> IPSetV2
    | `String "AWS::WAFv2::RegexPatternSet" -> RegexPatternSetV2
    | `String "AWS::WAFv2::ManagedRuleSet" -> ManagedRuleSetV2
    | `String "AWS::XRay::EncryptionConfig" -> EncryptionConfig
    | `String "AWS::SSM::AssociationCompliance" -> AssociationCompliance
    | `String "AWS::SSM::PatchCompliance" -> PatchCompliance
    | `String "AWS::Shield::Protection" -> Protection
    | `String "AWS::ShieldRegional::Protection" -> RegionalProtection
    | `String "AWS::Config::ConformancePackCompliance" -> ConformancePackCompliance
    | `String "AWS::Config::ResourceCompliance" -> ResourceCompliance
    | `String "AWS::ApiGateway::Stage" -> Stage
    | `String "AWS::ApiGateway::RestApi" -> RestApi
    | `String "AWS::ApiGatewayV2::Stage" -> StageV2
    | `String "AWS::ApiGatewayV2::Api" -> Api
    | `String "AWS::CodePipeline::Pipeline" -> Pipeline
    | `String "AWS::ServiceCatalog::CloudFormationProvisionedProduct" ->
        CloudFormationProvisionedProduct
    | `String "AWS::ServiceCatalog::CloudFormationProduct" -> CloudFormationProduct
    | `String "AWS::ServiceCatalog::Portfolio" -> Portfolio
    | `String "AWS::SQS::Queue" -> Queue
    | `String "AWS::KMS::Key" -> Key
    | `String "AWS::QLDB::Ledger" -> QLDBLedger
    | `String "AWS::SecretsManager::Secret" -> Secret
    | `String "AWS::SNS::Topic" -> Topic
    | `String "AWS::SSM::FileData" -> FileData
    | `String "AWS::Backup::BackupPlan" -> BackupPlan
    | `String "AWS::Backup::BackupSelection" -> BackupSelection
    | `String "AWS::Backup::BackupVault" -> BackupVault
    | `String "AWS::Backup::RecoveryPoint" -> BackupRecoveryPoint
    | `String "AWS::ECR::Repository" -> ECRRepository
    | `String "AWS::ECS::Cluster" -> ECSCluster
    | `String "AWS::ECS::Service" -> ECSService
    | `String "AWS::ECS::TaskDefinition" -> ECSTaskDefinition
    | `String "AWS::EFS::AccessPoint" -> EFSAccessPoint
    | `String "AWS::EFS::FileSystem" -> EFSFileSystem
    | `String "AWS::EKS::Cluster" -> EKSCluster
    | `String "AWS::OpenSearch::Domain" -> OpenSearchDomain
    | `String "AWS::EC2::TransitGateway" -> TransitGateway
    | `String "AWS::Kinesis::Stream" -> KinesisStream
    | `String "AWS::Kinesis::StreamConsumer" -> KinesisStreamConsumer
    | `String "AWS::CodeDeploy::Application" -> CodeDeployApplication
    | `String "AWS::CodeDeploy::DeploymentConfig" -> CodeDeployDeploymentConfig
    | `String "AWS::CodeDeploy::DeploymentGroup" -> CodeDeployDeploymentGroup
    | `String "AWS::EC2::LaunchTemplate" -> LaunchTemplate
    | `String "AWS::ECR::PublicRepository" -> ECRPublicRepository
    | `String "AWS::GuardDuty::Detector" -> GuardDutyDetector
    | `String "AWS::EMR::SecurityConfiguration" -> EMRSecurityConfiguration
    | `String "AWS::SageMaker::CodeRepository" -> SageMakerCodeRepository
    | `String "AWS::Route53Resolver::ResolverEndpoint" -> Route53ResolverResolverEndpoint
    | `String "AWS::Route53Resolver::ResolverRule" -> Route53ResolverResolverRule
    | `String "AWS::Route53Resolver::ResolverRuleAssociation" ->
        Route53ResolverResolverRuleAssociation
    | `String "AWS::DMS::ReplicationSubnetGroup" -> DMSReplicationSubnetGroup
    | `String "AWS::DMS::EventSubscription" -> DMSEventSubscription
    | `String "AWS::MSK::Cluster" -> MSKCluster
    | `String "AWS::StepFunctions::Activity" -> StepFunctionsActivity
    | `String "AWS::WorkSpaces::Workspace" -> WorkSpacesWorkspace
    | `String "AWS::WorkSpaces::ConnectionAlias" -> WorkSpacesConnectionAlias
    | `String "AWS::SageMaker::Model" -> SageMakerModel
    | `String "AWS::ElasticLoadBalancingV2::Listener" -> ListenerV2
    | `String "AWS::StepFunctions::StateMachine" -> StepFunctionsStateMachine
    | `String "AWS::Batch::JobQueue" -> BatchJobQueue
    | `String "AWS::Batch::ComputeEnvironment" -> BatchComputeEnvironment
    | `String "AWS::AccessAnalyzer::Analyzer" -> AccessAnalyzerAnalyzer
    | `String "AWS::Athena::WorkGroup" -> AthenaWorkGroup
    | `String "AWS::Athena::DataCatalog" -> AthenaDataCatalog
    | `String "AWS::Detective::Graph" -> DetectiveGraph
    | `String "AWS::GlobalAccelerator::Accelerator" -> GlobalAcceleratorAccelerator
    | `String "AWS::GlobalAccelerator::EndpointGroup" -> GlobalAcceleratorEndpointGroup
    | `String "AWS::GlobalAccelerator::Listener" -> GlobalAcceleratorListener
    | `String "AWS::EC2::TransitGatewayAttachment" -> TransitGatewayAttachment
    | `String "AWS::EC2::TransitGatewayRouteTable" -> TransitGatewayRouteTable
    | `String "AWS::DMS::Certificate" -> DMSCertificate
    | `String "AWS::AppConfig::Application" -> AppConfigApplication
    | `String "AWS::AppSync::GraphQLApi" -> AppSyncGraphQLApi
    | `String "AWS::DataSync::LocationSMB" -> DataSyncLocationSMB
    | `String "AWS::DataSync::LocationFSxLustre" -> DataSyncLocationFSxLustre
    | `String "AWS::DataSync::LocationS3" -> DataSyncLocationS3
    | `String "AWS::DataSync::LocationEFS" -> DataSyncLocationEFS
    | `String "AWS::DataSync::Task" -> DataSyncTask
    | `String "AWS::DataSync::LocationNFS" -> DataSyncLocationNFS
    | `String "AWS::EC2::NetworkInsightsAccessScopeAnalysis" -> NetworkInsightsAccessScopeAnalysis
    | `String "AWS::EKS::FargateProfile" -> EKSFargateProfile
    | `String "AWS::Glue::Job" -> GlueJob
    | `String "AWS::GuardDuty::ThreatIntelSet" -> GuardDutyThreatIntelSet
    | `String "AWS::GuardDuty::IPSet" -> GuardDutyIPSet
    | `String "AWS::SageMaker::Workteam" -> SageMakerWorkteam
    | `String "AWS::SageMaker::NotebookInstanceLifecycleConfig" ->
        SageMakerNotebookInstanceLifecycleConfig
    | `String "AWS::ServiceDiscovery::Service" -> ServiceDiscoveryService
    | `String "AWS::ServiceDiscovery::PublicDnsNamespace" -> ServiceDiscoveryPublicDnsNamespace
    | `String "AWS::SES::ContactList" -> SESContactList
    | `String "AWS::SES::ConfigurationSet" -> SESConfigurationSet
    | `String "AWS::Route53::HostedZone" -> Route53HostedZone
    | `String "AWS::IoTEvents::Input" -> IoTEventsInput
    | `String "AWS::IoTEvents::DetectorModel" -> IoTEventsDetectorModel
    | `String "AWS::IoTEvents::AlarmModel" -> IoTEventsAlarmModel
    | `String "AWS::ServiceDiscovery::HttpNamespace" -> ServiceDiscoveryHttpNamespace
    | `String "AWS::Events::EventBus" -> EventsEventBus
    | `String "AWS::ImageBuilder::ContainerRecipe" -> ImageBuilderContainerRecipe
    | `String "AWS::ImageBuilder::DistributionConfiguration" ->
        ImageBuilderDistributionConfiguration
    | `String "AWS::ImageBuilder::InfrastructureConfiguration" ->
        ImageBuilderInfrastructureConfiguration
    | `String "AWS::DataSync::LocationObjectStorage" -> DataSyncLocationObjectStorage
    | `String "AWS::DataSync::LocationHDFS" -> DataSyncLocationHDFS
    | `String "AWS::Glue::Classifier" -> GlueClassifier
    | `String "AWS::Route53RecoveryReadiness::Cell" -> Route53RecoveryReadinessCell
    | `String "AWS::Route53RecoveryReadiness::ReadinessCheck" ->
        Route53RecoveryReadinessReadinessCheck
    | `String "AWS::ECR::RegistryPolicy" -> ECRRegistryPolicy
    | `String "AWS::Backup::ReportPlan" -> BackupReportPlan
    | `String "AWS::Lightsail::Certificate" -> LightsailCertificate
    | `String "AWS::RUM::AppMonitor" -> RUMAppMonitor
    | `String "AWS::Events::Endpoint" -> EventsEndpoint
    | `String "AWS::SES::ReceiptRuleSet" -> SESReceiptRuleSet
    | `String "AWS::Events::Archive" -> EventsArchive
    | `String "AWS::Events::ApiDestination" -> EventsApiDestination
    | `String "AWS::Lightsail::Disk" -> LightsailDisk
    | `String "AWS::FIS::ExperimentTemplate" -> FISExperimentTemplate
    | `String "AWS::DataSync::LocationFSxWindows" -> DataSyncLocationFSxWindows
    | `String "AWS::SES::ReceiptFilter" -> SESReceiptFilter
    | `String "AWS::GuardDuty::Filter" -> GuardDutyFilter
    | `String "AWS::SES::Template" -> SESTemplate
    | `String "AWS::AmazonMQ::Broker" -> AmazonMQBroker
    | `String "AWS::AppConfig::Environment" -> AppConfigEnvironment
    | `String "AWS::AppConfig::ConfigurationProfile" -> AppConfigConfigurationProfile
    | `String "AWS::Cloud9::EnvironmentEC2" -> Cloud9EnvironmentEC2
    | `String "AWS::EventSchemas::Registry" -> EventSchemasRegistry
    | `String "AWS::EventSchemas::RegistryPolicy" -> EventSchemasRegistryPolicy
    | `String "AWS::EventSchemas::Discoverer" -> EventSchemasDiscoverer
    | `String "AWS::FraudDetector::Label" -> FraudDetectorLabel
    | `String "AWS::FraudDetector::EntityType" -> FraudDetectorEntityType
    | `String "AWS::FraudDetector::Variable" -> FraudDetectorVariable
    | `String "AWS::FraudDetector::Outcome" -> FraudDetectorOutcome
    | `String "AWS::IoT::Authorizer" -> IoTAuthorizer
    | `String "AWS::IoT::SecurityProfile" -> IoTSecurityProfile
    | `String "AWS::IoT::RoleAlias" -> IoTRoleAlias
    | `String "AWS::IoT::Dimension" -> IoTDimension
    | `String "AWS::IoTAnalytics::Datastore" -> IoTAnalyticsDatastore
    | `String "AWS::Lightsail::Bucket" -> LightsailBucket
    | `String "AWS::Lightsail::StaticIp" -> LightsailStaticIp
    | `String "AWS::MediaPackage::PackagingGroup" -> MediaPackagePackagingGroup
    | `String "AWS::Route53RecoveryReadiness::RecoveryGroup" ->
        Route53RecoveryReadinessRecoveryGroup
    | `String "AWS::ResilienceHub::ResiliencyPolicy" -> ResilienceHubResiliencyPolicy
    | `String "AWS::Transfer::Workflow" -> TransferWorkflow
    | `String "AWS::EKS::IdentityProviderConfig" -> EKSIdentityProviderConfig
    | `String "AWS::EKS::Addon" -> EKSAddon
    | `String "AWS::Glue::MLTransform" -> GlueMLTransform
    | `String "AWS::IoT::Policy" -> IoTPolicy
    | `String "AWS::IoT::MitigationAction" -> IoTMitigationAction
    | `String "AWS::IoTTwinMaker::Workspace" -> IoTTwinMakerWorkspace
    | `String "AWS::IoTTwinMaker::Entity" -> IoTTwinMakerEntity
    | `String "AWS::IoTAnalytics::Dataset" -> IoTAnalyticsDataset
    | `String "AWS::IoTAnalytics::Pipeline" -> IoTAnalyticsPipeline
    | `String "AWS::IoTAnalytics::Channel" -> IoTAnalyticsChannel
    | `String "AWS::IoTSiteWise::Dashboard" -> IoTSiteWiseDashboard
    | `String "AWS::IoTSiteWise::Project" -> IoTSiteWiseProject
    | `String "AWS::IoTSiteWise::Portal" -> IoTSiteWisePortal
    | `String "AWS::IoTSiteWise::AssetModel" -> IoTSiteWiseAssetModel
    | `String "AWS::IVS::Channel" -> IVSChannel
    | `String "AWS::IVS::RecordingConfiguration" -> IVSRecordingConfiguration
    | `String "AWS::IVS::PlaybackKeyPair" -> IVSPlaybackKeyPair
    | `String "AWS::KinesisAnalyticsV2::Application" -> KinesisAnalyticsV2Application
    | `String "AWS::RDS::GlobalCluster" -> RDSGlobalCluster
    | `String "AWS::S3::MultiRegionAccessPoint" -> S3MultiRegionAccessPoint
    | `String "AWS::DeviceFarm::TestGridProject" -> DeviceFarmTestGridProject
    | `String "AWS::Budgets::BudgetsAction" -> BudgetsBudgetsAction
    | `String "AWS::Lex::Bot" -> LexBot
    | `String "AWS::CodeGuruReviewer::RepositoryAssociation" ->
        CodeGuruReviewerRepositoryAssociation
    | `String "AWS::IoT::CustomMetric" -> IoTCustomMetric
    | `String "AWS::Route53Resolver::FirewallDomainList" -> Route53ResolverFirewallDomainList
    | `String "AWS::RoboMaker::RobotApplicationVersion" -> RoboMakerRobotApplicationVersion
    | `String "AWS::EC2::TrafficMirrorSession" -> EC2TrafficMirrorSession
    | `String "AWS::IoTSiteWise::Gateway" -> IoTSiteWiseGateway
    | `String "AWS::Lex::BotAlias" -> LexBotAlias
    | `String "AWS::LookoutMetrics::Alert" -> LookoutMetricsAlert
    | `String "AWS::IoT::AccountAuditConfiguration" -> IoTAccountAuditConfiguration
    | `String "AWS::EC2::TrafficMirrorTarget" -> EC2TrafficMirrorTarget
    | `String "AWS::S3::StorageLens" -> S3StorageLens
    | `String "AWS::IoT::ScheduledAudit" -> IoTScheduledAudit
    | `String "AWS::Events::Connection" -> EventsConnection
    | `String "AWS::EventSchemas::Schema" -> EventSchemasSchema
    | `String "AWS::MediaPackage::PackagingConfiguration" -> MediaPackagePackagingConfiguration
    | `String "AWS::KinesisVideo::SignalingChannel" -> KinesisVideoSignalingChannel
    | `String "AWS::AppStream::DirectoryConfig" -> AppStreamDirectoryConfig
    | `String "AWS::LookoutVision::Project" -> LookoutVisionProject
    | `String "AWS::Route53RecoveryControl::Cluster" -> Route53RecoveryControlCluster
    | `String "AWS::Route53RecoveryControl::SafetyRule" -> Route53RecoveryControlSafetyRule
    | `String "AWS::Route53RecoveryControl::ControlPanel" -> Route53RecoveryControlControlPanel
    | `String "AWS::Route53RecoveryControl::RoutingControl" -> Route53RecoveryControlRoutingControl
    | `String "AWS::Route53RecoveryReadiness::ResourceSet" -> Route53RecoveryReadinessResourceSet
    | `String "AWS::RoboMaker::SimulationApplication" -> RoboMakerSimulationApplication
    | `String "AWS::RoboMaker::RobotApplication" -> RoboMakerRobotApplication
    | `String "AWS::HealthLake::FHIRDatastore" -> HealthLakeFHIRDatastore
    | `String "AWS::Pinpoint::Segment" -> PinpointSegment
    | `String "AWS::Pinpoint::ApplicationSettings" -> PinpointApplicationSettings
    | `String "AWS::Events::Rule" -> EventsRule
    | `String "AWS::EC2::DHCPOptions" -> EC2DHCPOptions
    | `String "AWS::EC2::NetworkInsightsPath" -> EC2NetworkInsightsPath
    | `String "AWS::EC2::TrafficMirrorFilter" -> EC2TrafficMirrorFilter
    | `String "AWS::EC2::IPAM" -> EC2IPAM
    | `String "AWS::IoTTwinMaker::Scene" -> IoTTwinMakerScene
    | `String "AWS::NetworkManager::TransitGatewayRegistration" ->
        NetworkManagerTransitGatewayRegistration
    | `String "AWS::CustomerProfiles::Domain" -> CustomerProfilesDomain
    | `String "AWS::AutoScaling::WarmPool" -> AutoScalingWarmPool
    | `String "AWS::Connect::PhoneNumber" -> ConnectPhoneNumber
    | `String "AWS::AppConfig::DeploymentStrategy" -> AppConfigDeploymentStrategy
    | `String "AWS::AppFlow::Flow" -> AppFlowFlow
    | `String "AWS::AuditManager::Assessment" -> AuditManagerAssessment
    | `String "AWS::CloudWatch::MetricStream" -> CloudWatchMetricStream
    | `String "AWS::DeviceFarm::InstanceProfile" -> DeviceFarmInstanceProfile
    | `String "AWS::DeviceFarm::Project" -> DeviceFarmProject
    | `String "AWS::EC2::EC2Fleet" -> EC2EC2Fleet
    | `String "AWS::EC2::SubnetRouteTableAssociation" -> EC2SubnetRouteTableAssociation
    | `String "AWS::ECR::PullThroughCacheRule" -> ECRPullThroughCacheRule
    | `String "AWS::GroundStation::Config" -> GroundStationConfig
    | `String "AWS::ImageBuilder::ImagePipeline" -> ImageBuilderImagePipeline
    | `String "AWS::IoT::FleetMetric" -> IoTFleetMetric
    | `String "AWS::IoTWireless::ServiceProfile" -> IoTWirelessServiceProfile
    | `String "AWS::NetworkManager::Device" -> NetworkManagerDevice
    | `String "AWS::NetworkManager::GlobalNetwork" -> NetworkManagerGlobalNetwork
    | `String "AWS::NetworkManager::Link" -> NetworkManagerLink
    | `String "AWS::NetworkManager::Site" -> NetworkManagerSite
    | `String "AWS::Panorama::Package" -> PanoramaPackage
    | `String "AWS::Pinpoint::App" -> PinpointApp
    | `String "AWS::Redshift::ScheduledAction" -> RedshiftScheduledAction
    | `String "AWS::Route53Resolver::FirewallRuleGroupAssociation" ->
        Route53ResolverFirewallRuleGroupAssociation
    | `String "AWS::SageMaker::AppImageConfig" -> SageMakerAppImageConfig
    | `String "AWS::SageMaker::Image" -> SageMakerImage
    | `String "AWS::ECS::TaskSet" -> ECSTaskSet
    | `String "AWS::Cassandra::Keyspace" -> CassandraKeyspace
    | `String "AWS::Signer::SigningProfile" -> SignerSigningProfile
    | `String "AWS::Amplify::App" -> AmplifyApp
    | `String "AWS::AppMesh::VirtualNode" -> AppMeshVirtualNode
    | `String "AWS::AppMesh::VirtualService" -> AppMeshVirtualService
    | `String "AWS::AppRunner::VpcConnector" -> AppRunnerVpcConnector
    | `String "AWS::AppStream::Application" -> AppStreamApplication
    | `String "AWS::CodeArtifact::Repository" -> CodeArtifactRepository
    | `String "AWS::EC2::PrefixList" -> EC2PrefixList
    | `String "AWS::EC2::SpotFleet" -> EC2SpotFleet
    | `String "AWS::Evidently::Project" -> EvidentlyProject
    | `String "AWS::Forecast::Dataset" -> ForecastDataset
    | `String "AWS::IAM::SAMLProvider" -> IAMSAMLProvider
    | `String "AWS::IAM::ServerCertificate" -> IAMServerCertificate
    | `String "AWS::Pinpoint::Campaign" -> PinpointCampaign
    | `String "AWS::Pinpoint::InAppTemplate" -> PinpointInAppTemplate
    | `String "AWS::SageMaker::Domain" -> SageMakerDomain
    | `String "AWS::Transfer::Agreement" -> TransferAgreement
    | `String "AWS::Transfer::Connector" -> TransferConnector
    | `String "AWS::KinesisFirehose::DeliveryStream" -> KinesisFirehoseDeliveryStream
    | `String "AWS::Amplify::Branch" -> AmplifyBranch
    | `String "AWS::AppIntegrations::EventIntegration" -> AppIntegrationsEventIntegration
    | `String "AWS::AppMesh::Route" -> AppMeshRoute
    | `String "AWS::Athena::PreparedStatement" -> AthenaPreparedStatement
    | `String "AWS::EC2::IPAMScope" -> EC2IPAMScope
    | `String "AWS::Evidently::Launch" -> EvidentlyLaunch
    | `String "AWS::Forecast::DatasetGroup" -> ForecastDatasetGroup
    | `String "AWS::GreengrassV2::ComponentVersion" -> GreengrassV2ComponentVersion
    | `String "AWS::GroundStation::MissionProfile" -> GroundStationMissionProfile
    | `String "AWS::MediaConnect::FlowEntitlement" -> MediaConnectFlowEntitlement
    | `String "AWS::MediaConnect::FlowVpcInterface" -> MediaConnectFlowVpcInterface
    | `String "AWS::MediaTailor::PlaybackConfiguration" -> MediaTailorPlaybackConfiguration
    | `String "AWS::MSK::Configuration" -> MSKConfiguration
    | `String "AWS::Personalize::Dataset" -> PersonalizeDataset
    | `String "AWS::Personalize::Schema" -> PersonalizeSchema
    | `String "AWS::Personalize::Solution" -> PersonalizeSolution
    | `String "AWS::Pinpoint::EmailTemplate" -> PinpointEmailTemplate
    | `String "AWS::Pinpoint::EventStream" -> PinpointEventStream
    | `String "AWS::ResilienceHub::App" -> ResilienceHubApp
    | `String "AWS::ACMPCA::CertificateAuthority" -> ACMPCACertificateAuthority
    | `String "AWS::AppConfig::HostedConfigurationVersion" -> AppConfigHostedConfigurationVersion
    | `String "AWS::AppMesh::VirtualGateway" -> AppMeshVirtualGateway
    | `String "AWS::AppMesh::VirtualRouter" -> AppMeshVirtualRouter
    | `String "AWS::AppRunner::Service" -> AppRunnerService
    | `String "AWS::CustomerProfiles::ObjectType" -> CustomerProfilesObjectType
    | `String "AWS::DMS::Endpoint" -> DMSEndpoint
    | `String "AWS::EC2::CapacityReservation" -> EC2CapacityReservation
    | `String "AWS::EC2::ClientVpnEndpoint" -> EC2ClientVpnEndpoint
    | `String "AWS::Kendra::Index" -> KendraIndex
    | `String "AWS::KinesisVideo::Stream" -> KinesisVideoStream
    | `String "AWS::Logs::Destination" -> LogsDestination
    | `String "AWS::Pinpoint::EmailChannel" -> PinpointEmailChannel
    | `String "AWS::S3::AccessPoint" -> S3AccessPoint
    | `String "AWS::NetworkManager::CustomerGatewayAssociation" ->
        NetworkManagerCustomerGatewayAssociation
    | `String "AWS::NetworkManager::LinkAssociation" -> NetworkManagerLinkAssociation
    | `String "AWS::IoTWireless::MulticastGroup" -> IoTWirelessMulticastGroup
    | `String "AWS::Personalize::DatasetGroup" -> PersonalizeDatasetGroup
    | `String "AWS::IoTTwinMaker::ComponentType" -> IoTTwinMakerComponentType
    | `String "AWS::CodeBuild::ReportGroup" -> CodeBuildReportGroup
    | `String "AWS::SageMaker::FeatureGroup" -> SageMakerFeatureGroup
    | `String "AWS::MSK::BatchScramSecret" -> MSKBatchScramSecret
    | `String "AWS::AppStream::Stack" -> AppStreamStack
    | `String "AWS::IoT::JobTemplate" -> IoTJobTemplate
    | `String "AWS::IoTWireless::FuotaTask" -> IoTWirelessFuotaTask
    | `String "AWS::IoT::ProvisioningTemplate" -> IoTProvisioningTemplate
    | `String "AWS::InspectorV2::Filter" -> InspectorV2Filter
    | `String "AWS::Route53Resolver::ResolverQueryLoggingConfigAssociation" ->
        Route53ResolverResolverQueryLoggingConfigAssociation
    | `String "AWS::ServiceDiscovery::Instance" -> ServiceDiscoveryInstance
    | `String "AWS::Transfer::Certificate" -> TransferCertificate
    | `String "AWS::MediaConnect::FlowSource" -> MediaConnectFlowSource
    | `String "AWS::APS::RuleGroupsNamespace" -> APSRuleGroupsNamespace
    | `String "AWS::CodeGuruProfiler::ProfilingGroup" -> CodeGuruProfilerProfilingGroup
    | `String "AWS::Route53Resolver::ResolverQueryLoggingConfig" ->
        Route53ResolverResolverQueryLoggingConfig
    | `String "AWS::Batch::SchedulingPolicy" -> BatchSchedulingPolicy
    | `String "AWS::ACMPCA::CertificateAuthorityActivation" -> ACMPCACertificateAuthorityActivation
    | `String "AWS::AppMesh::GatewayRoute" -> AppMeshGatewayRoute
    | `String "AWS::AppMesh::Mesh" -> AppMeshMesh
    | `String "AWS::Connect::Instance" -> ConnectInstance
    | `String "AWS::Connect::QuickConnect" -> ConnectQuickConnect
    | `String "AWS::EC2::CarrierGateway" -> EC2CarrierGateway
    | `String "AWS::EC2::IPAMPool" -> EC2IPAMPool
    | `String "AWS::EC2::TransitGatewayConnect" -> EC2TransitGatewayConnect
    | `String "AWS::EC2::TransitGatewayMulticastDomain" -> EC2TransitGatewayMulticastDomain
    | `String "AWS::ECS::CapacityProvider" -> ECSCapacityProvider
    | `String "AWS::IAM::InstanceProfile" -> IAMInstanceProfile
    | `String "AWS::IoT::CACertificate" -> IoTCACertificate
    | `String "AWS::IoTTwinMaker::SyncJob" -> IoTTwinMakerSyncJob
    | `String "AWS::KafkaConnect::Connector" -> KafkaConnectConnector
    | `String "AWS::Lambda::CodeSigningConfig" -> LambdaCodeSigningConfig
    | `String "AWS::NetworkManager::ConnectPeer" -> NetworkManagerConnectPeer
    | `String "AWS::ResourceExplorer2::Index" -> ResourceExplorer2Index
    | `String "AWS::AppStream::Fleet" -> AppStreamFleet
    | `String "AWS::Cognito::UserPool" -> CognitoUserPool
    | `String "AWS::Cognito::UserPoolClient" -> CognitoUserPoolClient
    | `String "AWS::Cognito::UserPoolGroup" -> CognitoUserPoolGroup
    | `String "AWS::EC2::NetworkInsightsAccessScope" -> EC2NetworkInsightsAccessScope
    | `String "AWS::EC2::NetworkInsightsAnalysis" -> EC2NetworkInsightsAnalysis
    | `String "AWS::Grafana::Workspace" -> GrafanaWorkspace
    | `String "AWS::GroundStation::DataflowEndpointGroup" -> GroundStationDataflowEndpointGroup
    | `String "AWS::ImageBuilder::ImageRecipe" -> ImageBuilderImageRecipe
    | `String "AWS::KMS::Alias" -> KMSAlias
    | `String "AWS::M2::Environment" -> M2Environment
    | `String "AWS::QuickSight::DataSource" -> QuickSightDataSource
    | `String "AWS::QuickSight::Template" -> QuickSightTemplate
    | `String "AWS::QuickSight::Theme" -> QuickSightTheme
    | `String "AWS::RDS::OptionGroup" -> RDSOptionGroup
    | `String "AWS::Redshift::EndpointAccess" -> RedshiftEndpointAccess
    | `String "AWS::Route53Resolver::FirewallRuleGroup" -> Route53ResolverFirewallRuleGroup
    | `String "AWS::SSM::Document" -> SSMDocument
    | `String "AWS::AppConfig::ExtensionAssociation" -> AppConfigExtensionAssociation
    | `String "AWS::AppIntegrations::Application" -> AppIntegrationsApplication
    | `String "AWS::AppSync::ApiCache" -> AppSyncApiCache
    | `String "AWS::Bedrock::Guardrail" -> BedrockGuardrail
    | `String "AWS::Bedrock::KnowledgeBase" -> BedrockKnowledgeBase
    | `String "AWS::Cognito::IdentityPool" -> CognitoIdentityPool
    | `String "AWS::Connect::Rule" -> ConnectRule
    | `String "AWS::Connect::User" -> ConnectUser
    | `String "AWS::EC2::ClientVpnTargetNetworkAssociation" -> EC2ClientVpnTargetNetworkAssociation
    | `String "AWS::EC2::EIPAssociation" -> EC2EIPAssociation
    | `String "AWS::EC2::IPAMResourceDiscovery" -> EC2IPAMResourceDiscovery
    | `String "AWS::EC2::IPAMResourceDiscoveryAssociation" -> EC2IPAMResourceDiscoveryAssociation
    | `String "AWS::EC2::InstanceConnectEndpoint" -> EC2InstanceConnectEndpoint
    | `String "AWS::EC2::SnapshotBlockPublicAccess" -> EC2SnapshotBlockPublicAccess
    | `String "AWS::EC2::VPCBlockPublicAccessExclusion" -> EC2VPCBlockPublicAccessExclusion
    | `String "AWS::EC2::VPCBlockPublicAccessOptions" -> EC2VPCBlockPublicAccessOptions
    | `String "AWS::EC2::VPCEndpointConnectionNotification" -> EC2VPCEndpointConnectionNotification
    | `String "AWS::EC2::VPNConnectionRoute" -> EC2VPNConnectionRoute
    | `String "AWS::Evidently::Segment" -> EvidentlySegment
    | `String "AWS::IAM::OIDCProvider" -> IAMOIDCProvider
    | `String "AWS::InspectorV2::Activation" -> InspectorV2Activation
    | `String "AWS::MSK::ClusterPolicy" -> MSKClusterPolicy
    | `String "AWS::MSK::VpcConnection" -> MSKVpcConnection
    | `String "AWS::MediaConnect::Gateway" -> MediaConnectGateway
    | `String "AWS::MemoryDB::SubnetGroup" -> MemoryDBSubnetGroup
    | `String "AWS::OpenSearchServerless::Collection" -> OpenSearchServerlessCollection
    | `String "AWS::OpenSearchServerless::VpcEndpoint" -> OpenSearchServerlessVpcEndpoint
    | `String "AWS::Redshift::EndpointAuthorization" -> RedshiftEndpointAuthorization
    | `String "AWS::Route53Profiles::Profile" -> Route53ProfilesProfile
    | `String "AWS::S3::StorageLensGroup" -> S3StorageLensGroup
    | `String "AWS::S3Express::BucketPolicy" -> S3ExpressBucketPolicy
    | `String "AWS::S3Express::DirectoryBucket" -> S3ExpressDirectoryBucket
    | `String "AWS::SageMaker::InferenceExperiment" -> SageMakerInferenceExperiment
    | `String "AWS::SecurityHub::Standard" -> SecurityHubStandard
    | `String "AWS::Transfer::Profile" -> TransferProfile
    | `String "AWS::CloudFormation::StackSet" -> CloudFormationStackSet
    | `String "AWS::MediaPackageV2::Channel" -> MediaPackageV2Channel
    | `String "AWS::S3::AccessGrantsLocation" -> S3AccessGrantsLocation
    | `String "AWS::S3::AccessGrant" -> S3AccessGrant
    | `String "AWS::S3::AccessGrantsInstance" -> S3AccessGrantsInstance
    | `String "AWS::EMRServerless::Application" -> EMRServerlessApplication
    | `String "AWS::Config::AggregationAuthorization" -> ConfigAggregationAuthorization
    | `String "AWS::Bedrock::ApplicationInferenceProfile" -> BedrockApplicationInferenceProfile
    | `String "AWS::ApiGatewayV2::Integration" -> ApiGatewayV2Integration
    | `String "AWS::SageMaker::MlflowTrackingServer" -> SageMakerMlflowTrackingServer
    | `String "AWS::SageMaker::ModelBiasJobDefinition" -> SageMakerModelBiasJobDefinition
    | `String "AWS::SecretsManager::RotationSchedule" -> SecretsManagerRotationSchedule
    | `String "AWS::Deadline::QueueFleetAssociation" -> DeadlineQueueFleetAssociation
    | `String "AWS::ECR::RepositoryCreationTemplate" -> ECRRepositoryCreationTemplate
    | `String "AWS::CloudFormation::LambdaHook" -> CloudFormationLambdaHook
    | `String "AWS::EC2::SubnetNetworkAclAssociation" -> EC2SubnetNetworkAclAssociation
    | `String "AWS::ApiGateway::UsagePlan" -> ApiGatewayUsagePlan
    | `String "AWS::AppConfig::Extension" -> AppConfigExtension
    | `String "AWS::Deadline::Fleet" -> DeadlineFleet
    | `String "AWS::EMR::Studio" -> EMRStudio
    | `String "AWS::S3Tables::TableBucket" -> S3TablesTableBucket
    | `String "AWS::CloudFront::RealtimeLogConfig" -> CloudFrontRealtimeLogConfig
    | `String "AWS::BackupGateway::Hypervisor" -> BackupGatewayHypervisor
    | `String "AWS::BCMDataExports::Export" -> BCMDataExportsExport
    | `String "AWS::CloudFormation::GuardHook" -> CloudFormationGuardHook
    | `String "AWS::CloudFront::PublicKey" -> CloudFrontPublicKey
    | `String "AWS::CloudTrail::EventDataStore" -> CloudTrailEventDataStore
    | `String "AWS::EntityResolution::IdMappingWorkflow" -> EntityResolutionIdMappingWorkflow
    | `String "AWS::EntityResolution::SchemaMapping" -> EntityResolutionSchemaMapping
    | `String "AWS::IoT::DomainConfiguration" -> IoTDomainConfiguration
    | `String "AWS::PCAConnectorAD::DirectoryRegistration" -> PCAConnectorADDirectoryRegistration
    | `String "AWS::RDS::Integration" -> RDSIntegration
    | `String "AWS::Config::ConformancePack" -> ConfigConformancePack
    | `String "AWS::RolesAnywhere::Profile" -> RolesAnywhereProfile
    | `String "AWS::CodeArtifact::Domain" -> CodeArtifactDomain
    | `String "AWS::Backup::RestoreTestingPlan" -> BackupRestoreTestingPlan
    | `String "AWS::Config::StoredQuery" -> ConfigStoredQuery
    | `String "AWS::SageMaker::DataQualityJobDefinition" -> SageMakerDataQualityJobDefinition
    | `String "AWS::SageMaker::ModelExplainabilityJobDefinition" ->
        SageMakerModelExplainabilityJobDefinition
    | `String "AWS::SageMaker::ModelQualityJobDefinition" -> SageMakerModelQualityJobDefinition
    | `String "AWS::SageMaker::StudioLifecycleConfig" -> SageMakerStudioLifecycleConfig
    | `String "AWS::SES::DedicatedIpPool" -> SESDedicatedIpPool
    | `String "AWS::SES::MailManagerTrafficPolicy" -> SESMailManagerTrafficPolicy
    | `String "AWS::SSM::ResourceDataSync" -> SSMResourceDataSync
    | `String "AWS::BedrockAgentCore::Runtime" -> BedrockAgentCoreRuntime
    | `String "AWS::BedrockAgentCore::BrowserCustom" -> BedrockAgentCoreBrowserCustom
    | `String "AWS::ElasticLoadBalancingV2::TargetGroup" -> ElasticLoadBalancingV2TargetGroup
    | `String "AWS::EMRContainers::VirtualCluster" -> EMRContainersVirtualCluster
    | `String "AWS::EntityResolution::MatchingWorkflow" -> EntityResolutionMatchingWorkflow
    | `String "AWS::IoTCoreDeviceAdvisor::SuiteDefinition" -> IoTCoreDeviceAdvisorSuiteDefinition
    | `String "AWS::EC2::SecurityGroupVpcAssociation" -> EC2SecurityGroupVpcAssociation
    | `String "AWS::EC2::VerifiedAccessInstance" -> EC2VerifiedAccessInstance
    | `String "AWS::KafkaConnect::CustomPlugin" -> KafkaConnectCustomPlugin
    | `String "AWS::NetworkManager::TransitGatewayPeering" -> NetworkManagerTransitGatewayPeering
    | `String "AWS::OpenSearchServerless::SecurityConfig" -> OpenSearchServerlessSecurityConfig
    | `String "AWS::Redshift::Integration" -> RedshiftIntegration
    | `String "AWS::RolesAnywhere::TrustAnchor" -> RolesAnywhereTrustAnchor
    | `String "AWS::Route53Profiles::ProfileAssociation" -> Route53ProfilesProfileAssociation
    | `String "AWS::SSMIncidents::ResponsePlan" -> SSMIncidentsResponsePlan
    | `String "AWS::Transfer::Server" -> TransferServer
    | `String "AWS::Glue::Database" -> GlueDatabase
    | `String "AWS::Organizations::OrganizationalUnit" -> OrganizationsOrganizationalUnit
    | `String "AWS::EC2::IPAMPoolCidr" -> EC2IPAMPoolCidr
    | `String "AWS::EC2::VPCGatewayAttachment" -> EC2VPCGatewayAttachment
    | `String "AWS::Bedrock::Prompt" -> BedrockPrompt
    | `String "AWS::Comprehend::Flywheel" -> ComprehendFlywheel
    | `String "AWS::DataSync::Agent" -> DataSyncAgent
    | `String "AWS::MediaTailor::LiveSource" -> MediaTailorLiveSource
    | `String "AWS::MSK::ServerlessCluster" -> MSKServerlessCluster
    | `String "AWS::IoTSiteWise::Asset" -> IoTSiteWiseAsset
    | `String "AWS::B2BI::Capability" -> B2BICapability
    | `String "AWS::CloudFront::KeyValueStore" -> CloudFrontKeyValueStore
    | `String "AWS::Deadline::Monitor" -> DeadlineMonitor
    | `String "AWS::GuardDuty::MalwareProtectionPlan" -> GuardDutyMalwareProtectionPlan
    | `String "AWS::Location::APIKey" -> LocationAPIKey
    | `String "AWS::MediaPackageV2::OriginEndpoint" -> MediaPackageV2OriginEndpoint
    | `String "AWS::PCAConnectorAD::Connector" -> PCAConnectorADConnector
    | `String "AWS::S3Tables::TableBucketPolicy" -> S3TablesTableBucketPolicy
    | `String "AWS::SecretsManager::ResourcePolicy" -> SecretsManagerResourcePolicy
    | `String "AWS::SSMContacts::Contact" -> SSMContactsContact
    | `String "AWS::IoT::ThingGroup" -> IoTThingGroup
    | `String "AWS::ImageBuilder::LifecyclePolicy" -> ImageBuilderLifecyclePolicy
    | `String "AWS::GameLift::Build" -> GameLiftBuild
    | `String "AWS::ECR::ReplicationConfiguration" -> ECRReplicationConfiguration
    | `String "AWS::EC2::SubnetCidrBlock" -> EC2SubnetCidrBlock
    | `String "AWS::Connect::SecurityProfile" -> ConnectSecurityProfile
    | `String "AWS::CleanRoomsML::TrainingDataset" -> CleanRoomsMLTrainingDataset
    | `String "AWS::AppStream::AppBlockBuilder" -> AppStreamAppBlockBuilder
    | `String "AWS::Route53::DNSSEC" -> Route53DNSSEC
    | `String "AWS::SageMaker::UserProfile" -> SageMakerUserProfile
    | `String "AWS::ApiGateway::Method" -> ApiGatewayMethod
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let resource_id_of_yojson = string_of_yojson

let aggregate_resource_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_account_id = value_for_key account_id_of_yojson "SourceAccountId" _list path;
     source_region = value_for_key aws_region_of_yojson "SourceRegion" _list path;
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
     resource_type = value_for_key resource_type_of_yojson "ResourceType" _list path;
     resource_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ResourceName") _list path;
   }
    : aggregate_resource_identifier)

let aggregated_source_status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "OUTDATED" -> OUTDATED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AggregatedSourceStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "AggregatedSourceStatusType")
     : aggregated_source_status_type)
    : aggregated_source_status_type)

let aggregated_source_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT" -> ACCOUNT
    | `String "ORGANIZATION" -> ORGANIZATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AggregatedSourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "AggregatedSourceType")
     : aggregated_source_type)
    : aggregated_source_type)

let aggregated_source_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_id = option_of_yojson (value_for_key string__of_yojson "SourceId") _list path;
     source_type =
       option_of_yojson (value_for_key aggregated_source_type_of_yojson "SourceType") _list path;
     aws_region = option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion") _list path;
     last_update_status =
       option_of_yojson
         (value_for_key aggregated_source_status_type_of_yojson "LastUpdateStatus")
         _list path;
     last_update_time = option_of_yojson (value_for_key date_of_yojson "LastUpdateTime") _list path;
     last_error_code = option_of_yojson (value_for_key string__of_yojson "LastErrorCode") _list path;
     last_error_message =
       option_of_yojson (value_for_key string__of_yojson "LastErrorMessage") _list path;
   }
    : aggregated_source_status)

let aggregated_source_status_list_of_yojson tree path =
  list_of_yojson aggregated_source_status_of_yojson tree path

let aggregated_source_status_type_list_of_yojson tree path =
  list_of_yojson aggregated_source_status_type_of_yojson tree path

let aggregation_authorization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregation_authorization_arn =
       option_of_yojson (value_for_key string__of_yojson "AggregationAuthorizationArn") _list path;
     authorized_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "AuthorizedAccountId") _list path;
     authorized_aws_region =
       option_of_yojson (value_for_key aws_region_of_yojson "AuthorizedAwsRegion") _list path;
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
   }
    : aggregation_authorization)

let aggregation_authorization_list_of_yojson tree path =
  list_of_yojson aggregation_authorization_of_yojson tree path

let resource_type_value_of_yojson = string_of_yojson

let resource_type_value_list_of_yojson tree path =
  list_of_yojson resource_type_value_of_yojson tree path

let aggregator_filter_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INCLUDE" -> INCLUDE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AggregatorFilterType" value)
    | _ -> raise (deserialize_wrong_type_error path "AggregatorFilterType")
     : aggregator_filter_type)
    : aggregator_filter_type)

let aggregator_filter_resource_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key aggregator_filter_type_of_yojson "Type") _list path;
     value = option_of_yojson (value_for_key resource_type_value_list_of_yojson "Value") _list path;
   }
    : aggregator_filter_resource_type)

let service_principal_value_of_yojson = string_of_yojson

let service_principal_value_list_of_yojson tree path =
  list_of_yojson service_principal_value_of_yojson tree path

let aggregator_filter_service_principal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key aggregator_filter_type_of_yojson "Type") _list path;
     value =
       option_of_yojson (value_for_key service_principal_value_list_of_yojson "Value") _list path;
   }
    : aggregator_filter_service_principal)

let aggregator_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson
         (value_for_key aggregator_filter_resource_type_of_yojson "ResourceType")
         _list path;
     service_principal =
       option_of_yojson
         (value_for_key aggregator_filter_service_principal_of_yojson "ServicePrincipal")
         _list path;
   }
    : aggregator_filters)

let all_supported_of_yojson = bool_of_yojson
let amazon_resource_name_of_yojson = string_of_yojson
let annotation_of_yojson = string_of_yojson
let error_message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : validation_exception)

let no_such_configuration_recorder_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_such_configuration_recorder_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : conflict_exception)

let service_principal_of_yojson = string_of_yojson

let recording_scope_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL" -> INTERNAL
    | `String "PAID" -> PAID
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecordingScope" value)
    | _ -> raise (deserialize_wrong_type_error path "RecordingScope")
     : recording_scope)
    : recording_scope)

let recording_frequency_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONTINUOUS" -> CONTINUOUS
    | `String "DAILY" -> DAILY
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecordingFrequency" value)
    | _ -> raise (deserialize_wrong_type_error path "RecordingFrequency")
     : recording_frequency)
    : recording_frequency)

let recording_mode_resource_types_list_of_yojson tree path =
  list_of_yojson resource_type_of_yojson tree path

let description_of_yojson = string_of_yojson

let recording_mode_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     resource_types =
       value_for_key recording_mode_resource_types_list_of_yojson "resourceTypes" _list path;
     recording_frequency =
       value_for_key recording_frequency_of_yojson "recordingFrequency" _list path;
   }
    : recording_mode_override)

let recording_mode_overrides_of_yojson tree path =
  list_of_yojson recording_mode_override_of_yojson tree path

let recording_mode_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recording_frequency =
       value_for_key recording_frequency_of_yojson "recordingFrequency" _list path;
     recording_mode_overrides =
       option_of_yojson
         (value_for_key recording_mode_overrides_of_yojson "recordingModeOverrides")
         _list path;
   }
    : recording_mode)

let recording_strategy_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL_SUPPORTED_RESOURCE_TYPES" -> ALL_SUPPORTED_RESOURCE_TYPES
    | `String "INCLUSION_BY_RESOURCE_TYPES" -> INCLUSION_BY_RESOURCE_TYPES
    | `String "EXCLUSION_BY_RESOURCE_TYPES" -> EXCLUSION_BY_RESOURCE_TYPES
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RecordingStrategyType" value)
    | _ -> raise (deserialize_wrong_type_error path "RecordingStrategyType")
     : recording_strategy_type)
    : recording_strategy_type)

let recording_strategy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     use_only =
       option_of_yojson (value_for_key recording_strategy_type_of_yojson "useOnly") _list path;
   }
    : recording_strategy)

let resource_type_list_of_yojson tree path = list_of_yojson resource_type_of_yojson tree path

let exclusion_by_resource_types_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_types =
       option_of_yojson (value_for_key resource_type_list_of_yojson "resourceTypes") _list path;
   }
    : exclusion_by_resource_types)

let include_global_resource_types_of_yojson = bool_of_yojson

let recording_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     all_supported =
       option_of_yojson (value_for_key all_supported_of_yojson "allSupported") _list path;
     include_global_resource_types =
       option_of_yojson
         (value_for_key include_global_resource_types_of_yojson "includeGlobalResourceTypes")
         _list path;
     resource_types =
       option_of_yojson (value_for_key resource_type_list_of_yojson "resourceTypes") _list path;
     exclusion_by_resource_types =
       option_of_yojson
         (value_for_key exclusion_by_resource_types_of_yojson "exclusionByResourceTypes")
         _list path;
     recording_strategy =
       option_of_yojson (value_for_key recording_strategy_of_yojson "recordingStrategy") _list path;
   }
    : recording_group)

let recorder_name_of_yojson = string_of_yojson

let configuration_recorder_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key recorder_name_of_yojson "name") _list path;
     role_ar_n = option_of_yojson (value_for_key string__of_yojson "roleARN") _list path;
     recording_group =
       option_of_yojson (value_for_key recording_group_of_yojson "recordingGroup") _list path;
     recording_mode =
       option_of_yojson (value_for_key recording_mode_of_yojson "recordingMode") _list path;
     recording_scope =
       option_of_yojson (value_for_key recording_scope_of_yojson "recordingScope") _list path;
     service_principal =
       option_of_yojson (value_for_key service_principal_of_yojson "servicePrincipal") _list path;
   }
    : configuration_recorder)

let associate_resource_types_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder =
       value_for_key configuration_recorder_of_yojson "ConfigurationRecorder" _list path;
   }
    : associate_resource_types_response)

let associate_resource_types_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder_arn =
       value_for_key amazon_resource_name_of_yojson "ConfigurationRecorderArn" _list path;
     resource_types = value_for_key resource_type_list_of_yojson "ResourceTypes" _list path;
   }
    : associate_resource_types_request)

let auto_remediation_attempt_seconds_of_yojson = long_of_yojson
let auto_remediation_attempts_of_yojson = int_of_yojson
let availability_zone_of_yojson = string_of_yojson
let configuration_item_delivery_time_of_yojson = timestamp_epoch_seconds_of_yojson
let supplementary_configuration_value_of_yojson = string_of_yojson
let supplementary_configuration_name_of_yojson = string_of_yojson

let supplementary_configuration_of_yojson tree path =
  map_of_yojson supplementary_configuration_name_of_yojson
    supplementary_configuration_value_of_yojson tree path

let configuration_of_yojson = string_of_yojson
let resource_creation_time_of_yojson = timestamp_epoch_seconds_of_yojson
let configuration_state_id_of_yojson = string_of_yojson

let configuration_item_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "OK" -> OK
    | `String "ResourceDiscovered" -> ResourceDiscovered
    | `String "ResourceNotRecorded" -> ResourceNotRecorded
    | `String "ResourceDeleted" -> ResourceDeleted
    | `String "ResourceDeletedNotRecorded" -> ResourceDeletedNotRecorded
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConfigurationItemStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ConfigurationItemStatus")
     : configuration_item_status)
    : configuration_item_status)

let configuration_item_capture_time_of_yojson = timestamp_epoch_seconds_of_yojson
let version_of_yojson = string_of_yojson

let base_configuration_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key version_of_yojson "version") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     configuration_item_capture_time =
       option_of_yojson
         (value_for_key configuration_item_capture_time_of_yojson "configurationItemCaptureTime")
         _list path;
     configuration_item_status =
       option_of_yojson
         (value_for_key configuration_item_status_of_yojson "configurationItemStatus")
         _list path;
     configuration_state_id =
       option_of_yojson
         (value_for_key configuration_state_id_of_yojson "configurationStateId")
         _list path;
     arn = option_of_yojson (value_for_key ar_n_of_yojson "arn") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "resourceId") _list path;
     resource_name =
       option_of_yojson (value_for_key resource_name_of_yojson "resourceName") _list path;
     aws_region = option_of_yojson (value_for_key aws_region_of_yojson "awsRegion") _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "availabilityZone") _list path;
     resource_creation_time =
       option_of_yojson
         (value_for_key resource_creation_time_of_yojson "resourceCreationTime")
         _list path;
     configuration =
       option_of_yojson (value_for_key configuration_of_yojson "configuration") _list path;
     supplementary_configuration =
       option_of_yojson
         (value_for_key supplementary_configuration_of_yojson "supplementaryConfiguration")
         _list path;
     recording_frequency =
       option_of_yojson
         (value_for_key recording_frequency_of_yojson "recordingFrequency")
         _list path;
     configuration_item_delivery_time =
       option_of_yojson
         (value_for_key configuration_item_delivery_time_of_yojson "configurationItemDeliveryTime")
         _list path;
   }
    : base_configuration_item)

let base_configuration_items_of_yojson tree path =
  list_of_yojson base_configuration_item_of_yojson tree path

let no_such_configuration_aggregator_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_such_configuration_aggregator_exception)

let unprocessed_resource_identifier_list_of_yojson tree path =
  list_of_yojson aggregate_resource_identifier_of_yojson tree path

let batch_get_aggregate_resource_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     base_configuration_items =
       option_of_yojson
         (value_for_key base_configuration_items_of_yojson "BaseConfigurationItems")
         _list path;
     unprocessed_resource_identifiers =
       option_of_yojson
         (value_for_key unprocessed_resource_identifier_list_of_yojson
            "UnprocessedResourceIdentifiers")
         _list path;
   }
    : batch_get_aggregate_resource_config_response)

let resource_identifiers_list_of_yojson tree path =
  list_of_yojson aggregate_resource_identifier_of_yojson tree path

let configuration_aggregator_name_of_yojson = string_of_yojson

let batch_get_aggregate_resource_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator_name =
       value_for_key configuration_aggregator_name_of_yojson "ConfigurationAggregatorName" _list
         path;
     resource_identifiers =
       value_for_key resource_identifiers_list_of_yojson "ResourceIdentifiers" _list path;
   }
    : batch_get_aggregate_resource_config_request)

let no_available_configuration_recorder_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_available_configuration_recorder_exception)

let resource_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_of_yojson "resourceType" _list path;
     resource_id = value_for_key resource_id_of_yojson "resourceId" _list path;
   }
    : resource_key)

let resource_keys_of_yojson tree path = list_of_yojson resource_key_of_yojson tree path

let batch_get_resource_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     base_configuration_items =
       option_of_yojson
         (value_for_key base_configuration_items_of_yojson "baseConfigurationItems")
         _list path;
     unprocessed_resource_keys =
       option_of_yojson (value_for_key resource_keys_of_yojson "unprocessedResourceKeys") _list path;
   }
    : batch_get_resource_config_response)

let batch_get_resource_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_keys = value_for_key resource_keys_of_yojson "resourceKeys" _list path }
    : batch_get_resource_config_request)

let channel_name_of_yojson = string_of_yojson

let chronological_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "Reverse" -> Reverse
    | `String "Forward" -> Forward
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChronologicalOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "ChronologicalOrder")
     : chronological_order)
    : chronological_order)

let client_token_of_yojson = string_of_yojson
let string_with_char_limit64_of_yojson = string_of_yojson

let compliance_by_config_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name =
       option_of_yojson
         (value_for_key string_with_char_limit64_of_yojson "ConfigRuleName")
         _list path;
     compliance = option_of_yojson (value_for_key compliance_of_yojson "Compliance") _list path;
   }
    : compliance_by_config_rule)

let compliance_by_config_rules_of_yojson tree path =
  list_of_yojson compliance_by_config_rule_of_yojson tree path

let compliance_by_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson
         (value_for_key string_with_char_limit256_of_yojson "ResourceType")
         _list path;
     resource_id =
       option_of_yojson (value_for_key base_resource_id_of_yojson "ResourceId") _list path;
     compliance = option_of_yojson (value_for_key compliance_of_yojson "Compliance") _list path;
   }
    : compliance_by_resource)

let compliance_by_resources_of_yojson tree path =
  list_of_yojson compliance_by_resource_of_yojson tree path

let compliance_resource_types_of_yojson tree path =
  list_of_yojson string_with_char_limit256_of_yojson tree path

let compliance_score_of_yojson = string_of_yojson

let compliance_summary_by_resource_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson
         (value_for_key string_with_char_limit256_of_yojson "ResourceType")
         _list path;
     compliance_summary =
       option_of_yojson (value_for_key compliance_summary_of_yojson "ComplianceSummary") _list path;
   }
    : compliance_summary_by_resource_type)

let compliance_summaries_by_resource_type_of_yojson tree path =
  list_of_yojson compliance_summary_by_resource_type_of_yojson tree path

let compliance_types_of_yojson tree path = list_of_yojson compliance_type_of_yojson tree path

let delivery_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Success" -> Success
    | `String "Failure" -> Failure
    | `String "Not_Applicable" -> Not_Applicable
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeliveryStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DeliveryStatus")
     : delivery_status)
    : delivery_status)

let config_export_delivery_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_status =
       option_of_yojson (value_for_key delivery_status_of_yojson "lastStatus") _list path;
     last_error_code = option_of_yojson (value_for_key string__of_yojson "lastErrorCode") _list path;
     last_error_message =
       option_of_yojson (value_for_key string__of_yojson "lastErrorMessage") _list path;
     last_attempt_time =
       option_of_yojson (value_for_key date_of_yojson "lastAttemptTime") _list path;
     last_successful_time =
       option_of_yojson (value_for_key date_of_yojson "lastSuccessfulTime") _list path;
     next_delivery_time =
       option_of_yojson (value_for_key date_of_yojson "nextDeliveryTime") _list path;
   }
    : config_export_delivery_info)

let rule_evaluation_visibility_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXTERNAL" -> EXTERNAL
    | `String "INTERNAL" -> INTERNAL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RuleEvaluationVisibility" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleEvaluationVisibility")
     : rule_evaluation_visibility)
    : rule_evaluation_visibility)

let evaluation_mode_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ mode = option_of_yojson (value_for_key evaluation_mode_of_yojson "Mode") _list path }
    : evaluation_mode_configuration)

let evaluation_modes_of_yojson tree path =
  list_of_yojson evaluation_mode_configuration_of_yojson tree path

let config_rule_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETING" -> DELETING
    | `String "DELETING_RESULTS" -> DELETING_RESULTS
    | `String "EVALUATING" -> EVALUATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConfigRuleState" value)
    | _ -> raise (deserialize_wrong_type_error path "ConfigRuleState")
     : config_rule_state)
    : config_rule_state)

let maximum_execution_frequency_of_yojson (tree : t) path =
  ((match tree with
    | `String "One_Hour" -> One_Hour
    | `String "Three_Hours" -> Three_Hours
    | `String "Six_Hours" -> Six_Hours
    | `String "Twelve_Hours" -> Twelve_Hours
    | `String "TwentyFour_Hours" -> TwentyFour_Hours
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MaximumExecutionFrequency" value)
    | _ -> raise (deserialize_wrong_type_error path "MaximumExecutionFrequency")
     : maximum_execution_frequency)
    : maximum_execution_frequency)

let string_with_char_limit1024_of_yojson = string_of_yojson
let policy_text_of_yojson = string_of_yojson
let policy_runtime_of_yojson = string_of_yojson

let custom_policy_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_runtime = value_for_key policy_runtime_of_yojson "PolicyRuntime" _list path;
     policy_text = value_for_key policy_text_of_yojson "PolicyText" _list path;
     enable_debug_log_delivery =
       option_of_yojson (value_for_key boolean__of_yojson "EnableDebugLogDelivery") _list path;
   }
    : custom_policy_details)

let message_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ConfigurationItemChangeNotification" -> ConfigurationItemChangeNotification
    | `String "ConfigurationSnapshotDeliveryCompleted" -> ConfigurationSnapshotDeliveryCompleted
    | `String "ScheduledNotification" -> ScheduledNotification
    | `String "OversizedConfigurationItemChangeNotification" ->
        OversizedConfigurationItemChangeNotification
    | `String value -> raise (deserialize_unknown_enum_value_error path "MessageType" value)
    | _ -> raise (deserialize_wrong_type_error path "MessageType")
     : message_type)
    : message_type)

let event_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "aws.config" -> Aws_Config
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventSource" value)
    | _ -> raise (deserialize_wrong_type_error path "EventSource")
     : event_source)
    : event_source)

let source_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_source = option_of_yojson (value_for_key event_source_of_yojson "EventSource") _list path;
     message_type = option_of_yojson (value_for_key message_type_of_yojson "MessageType") _list path;
     maximum_execution_frequency =
       option_of_yojson
         (value_for_key maximum_execution_frequency_of_yojson "MaximumExecutionFrequency")
         _list path;
   }
    : source_detail)

let source_details_of_yojson tree path = list_of_yojson source_detail_of_yojson tree path

let owner_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOM_LAMBDA" -> Custom_Lambda
    | `String "AWS" -> Aws
    | `String "CUSTOM_POLICY" -> Custom_Policy
    | `String value -> raise (deserialize_unknown_enum_value_error path "Owner" value)
    | _ -> raise (deserialize_wrong_type_error path "Owner")
     : owner)
    : owner)

let source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     owner = value_for_key owner_of_yojson "Owner" _list path;
     source_identifier =
       option_of_yojson
         (value_for_key string_with_char_limit256_of_yojson "SourceIdentifier")
         _list path;
     source_details =
       option_of_yojson (value_for_key source_details_of_yojson "SourceDetails") _list path;
     custom_policy_details =
       option_of_yojson
         (value_for_key custom_policy_details_of_yojson "CustomPolicyDetails")
         _list path;
   }
    : source)

let string_with_char_limit128_of_yojson = string_of_yojson

let service_principals_of_yojson tree path =
  list_of_yojson string_with_char_limit128_of_yojson tree path

let scope_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_resource_types =
       option_of_yojson
         (value_for_key compliance_resource_types_of_yojson "ComplianceResourceTypes")
         _list path;
     tag_key =
       option_of_yojson (value_for_key string_with_char_limit128_of_yojson "TagKey") _list path;
     tag_value =
       option_of_yojson (value_for_key string_with_char_limit256_of_yojson "TagValue") _list path;
     compliance_resource_id =
       option_of_yojson (value_for_key base_resource_id_of_yojson "ComplianceResourceId") _list path;
     service_principals =
       option_of_yojson (value_for_key service_principals_of_yojson "ServicePrincipals") _list path;
   }
    : scope)

let emptiable_string_with_char_limit256_of_yojson = string_of_yojson

let config_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name =
       option_of_yojson (value_for_key config_rule_name_of_yojson "ConfigRuleName") _list path;
     config_rule_arn =
       option_of_yojson
         (value_for_key string_with_char_limit256_of_yojson "ConfigRuleArn")
         _list path;
     config_rule_id =
       option_of_yojson (value_for_key string_with_char_limit64_of_yojson "ConfigRuleId") _list path;
     description =
       option_of_yojson
         (value_for_key emptiable_string_with_char_limit256_of_yojson "Description")
         _list path;
     scope = option_of_yojson (value_for_key scope_of_yojson "Scope") _list path;
     source = value_for_key source_of_yojson "Source" _list path;
     input_parameters =
       option_of_yojson
         (value_for_key string_with_char_limit1024_of_yojson "InputParameters")
         _list path;
     maximum_execution_frequency =
       option_of_yojson
         (value_for_key maximum_execution_frequency_of_yojson "MaximumExecutionFrequency")
         _list path;
     config_rule_state =
       option_of_yojson (value_for_key config_rule_state_of_yojson "ConfigRuleState") _list path;
     created_by =
       option_of_yojson (value_for_key string_with_char_limit256_of_yojson "CreatedBy") _list path;
     evaluation_modes =
       option_of_yojson (value_for_key evaluation_modes_of_yojson "EvaluationModes") _list path;
     rule_evaluation_visibility =
       option_of_yojson
         (value_for_key rule_evaluation_visibility_of_yojson "RuleEvaluationVisibility")
         _list path;
   }
    : config_rule)

let config_rule_compliance_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name =
       option_of_yojson (value_for_key config_rule_name_of_yojson "ConfigRuleName") _list path;
     compliance_type =
       option_of_yojson (value_for_key compliance_type_of_yojson "ComplianceType") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     aws_region = option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion") _list path;
   }
    : config_rule_compliance_filters)

let config_rule_compliance_summary_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     aws_region = option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion") _list path;
   }
    : config_rule_compliance_summary_filters)

let config_rule_compliance_summary_group_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT_ID" -> ACCOUNT_ID
    | `String "AWS_REGION" -> AWS_REGION
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ConfigRuleComplianceSummaryGroupKey" value)
    | _ -> raise (deserialize_wrong_type_error path "ConfigRuleComplianceSummaryGroupKey")
     : config_rule_compliance_summary_group_key)
    : config_rule_compliance_summary_group_key)

let config_rule_evaluation_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name =
       option_of_yojson (value_for_key config_rule_name_of_yojson "ConfigRuleName") _list path;
     config_rule_arn = option_of_yojson (value_for_key string__of_yojson "ConfigRuleArn") _list path;
     config_rule_id = option_of_yojson (value_for_key string__of_yojson "ConfigRuleId") _list path;
     last_successful_invocation_time =
       option_of_yojson (value_for_key date_of_yojson "LastSuccessfulInvocationTime") _list path;
     last_failed_invocation_time =
       option_of_yojson (value_for_key date_of_yojson "LastFailedInvocationTime") _list path;
     last_successful_evaluation_time =
       option_of_yojson (value_for_key date_of_yojson "LastSuccessfulEvaluationTime") _list path;
     last_failed_evaluation_time =
       option_of_yojson (value_for_key date_of_yojson "LastFailedEvaluationTime") _list path;
     first_activated_time =
       option_of_yojson (value_for_key date_of_yojson "FirstActivatedTime") _list path;
     last_deactivated_time =
       option_of_yojson (value_for_key date_of_yojson "LastDeactivatedTime") _list path;
     last_error_code = option_of_yojson (value_for_key string__of_yojson "LastErrorCode") _list path;
     last_error_message =
       option_of_yojson (value_for_key string__of_yojson "LastErrorMessage") _list path;
     first_evaluation_started =
       option_of_yojson (value_for_key boolean__of_yojson "FirstEvaluationStarted") _list path;
     last_debug_log_delivery_status =
       option_of_yojson (value_for_key string__of_yojson "LastDebugLogDeliveryStatus") _list path;
     last_debug_log_delivery_status_reason =
       option_of_yojson
         (value_for_key string__of_yojson "LastDebugLogDeliveryStatusReason")
         _list path;
     last_debug_log_delivery_time =
       option_of_yojson (value_for_key date_of_yojson "LastDebugLogDeliveryTime") _list path;
   }
    : config_rule_evaluation_status)

let config_rule_evaluation_status_list_of_yojson tree path =
  list_of_yojson config_rule_evaluation_status_of_yojson tree path

let config_rule_names_of_yojson tree path = list_of_yojson config_rule_name_of_yojson tree path
let config_rules_of_yojson tree path = list_of_yojson config_rule_of_yojson tree path

let config_snapshot_delivery_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_frequency =
       option_of_yojson
         (value_for_key maximum_execution_frequency_of_yojson "deliveryFrequency")
         _list path;
   }
    : config_snapshot_delivery_properties)

let config_stream_delivery_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_status =
       option_of_yojson (value_for_key delivery_status_of_yojson "lastStatus") _list path;
     last_error_code = option_of_yojson (value_for_key string__of_yojson "lastErrorCode") _list path;
     last_error_message =
       option_of_yojson (value_for_key string__of_yojson "lastErrorMessage") _list path;
     last_status_change_time =
       option_of_yojson (value_for_key date_of_yojson "lastStatusChangeTime") _list path;
   }
    : config_stream_delivery_info)

let organization_aggregation_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn = value_for_key string__of_yojson "RoleArn" _list path;
     aws_regions =
       option_of_yojson (value_for_key aggregator_region_list_of_yojson "AwsRegions") _list path;
     all_aws_regions =
       option_of_yojson (value_for_key boolean__of_yojson "AllAwsRegions") _list path;
   }
    : organization_aggregation_source)

let configuration_aggregator_arn_of_yojson = string_of_yojson

let configuration_aggregator_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator_name =
       option_of_yojson
         (value_for_key configuration_aggregator_name_of_yojson "ConfigurationAggregatorName")
         _list path;
     configuration_aggregator_arn =
       option_of_yojson
         (value_for_key configuration_aggregator_arn_of_yojson "ConfigurationAggregatorArn")
         _list path;
     account_aggregation_sources =
       option_of_yojson
         (value_for_key account_aggregation_source_list_of_yojson "AccountAggregationSources")
         _list path;
     organization_aggregation_source =
       option_of_yojson
         (value_for_key organization_aggregation_source_of_yojson "OrganizationAggregationSource")
         _list path;
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key date_of_yojson "LastUpdatedTime") _list path;
     created_by =
       option_of_yojson (value_for_key string_with_char_limit256_of_yojson "CreatedBy") _list path;
     aggregator_filters =
       option_of_yojson (value_for_key aggregator_filters_of_yojson "AggregatorFilters") _list path;
   }
    : configuration_aggregator)

let configuration_aggregator_list_of_yojson tree path =
  list_of_yojson configuration_aggregator_of_yojson tree path

let configuration_aggregator_name_list_of_yojson tree path =
  list_of_yojson configuration_aggregator_name_of_yojson tree path

let relationship_name_of_yojson = string_of_yojson

let relationship_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "resourceId") _list path;
     resource_name =
       option_of_yojson (value_for_key resource_name_of_yojson "resourceName") _list path;
     relationship_name =
       option_of_yojson (value_for_key relationship_name_of_yojson "relationshipName") _list path;
   }
    : relationship)

let relationship_list_of_yojson tree path = list_of_yojson relationship_of_yojson tree path
let related_event_of_yojson = string_of_yojson
let related_event_list_of_yojson tree path = list_of_yojson related_event_of_yojson tree path
let value_of_yojson = string_of_yojson
let name_of_yojson = string_of_yojson
let tags_of_yojson tree path = map_of_yojson name_of_yojson value_of_yojson tree path
let configuration_item_md5_hash_of_yojson = string_of_yojson

let configuration_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key version_of_yojson "version") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     configuration_item_capture_time =
       option_of_yojson
         (value_for_key configuration_item_capture_time_of_yojson "configurationItemCaptureTime")
         _list path;
     configuration_item_status =
       option_of_yojson
         (value_for_key configuration_item_status_of_yojson "configurationItemStatus")
         _list path;
     configuration_state_id =
       option_of_yojson
         (value_for_key configuration_state_id_of_yojson "configurationStateId")
         _list path;
     configuration_item_md5_hash =
       option_of_yojson
         (value_for_key configuration_item_md5_hash_of_yojson "configurationItemMD5Hash")
         _list path;
     arn = option_of_yojson (value_for_key ar_n_of_yojson "arn") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "resourceId") _list path;
     resource_name =
       option_of_yojson (value_for_key resource_name_of_yojson "resourceName") _list path;
     aws_region = option_of_yojson (value_for_key aws_region_of_yojson "awsRegion") _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "availabilityZone") _list path;
     resource_creation_time =
       option_of_yojson
         (value_for_key resource_creation_time_of_yojson "resourceCreationTime")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     related_events =
       option_of_yojson (value_for_key related_event_list_of_yojson "relatedEvents") _list path;
     relationships =
       option_of_yojson (value_for_key relationship_list_of_yojson "relationships") _list path;
     configuration =
       option_of_yojson (value_for_key configuration_of_yojson "configuration") _list path;
     supplementary_configuration =
       option_of_yojson
         (value_for_key supplementary_configuration_of_yojson "supplementaryConfiguration")
         _list path;
     recording_frequency =
       option_of_yojson
         (value_for_key recording_frequency_of_yojson "recordingFrequency")
         _list path;
     configuration_item_delivery_time =
       option_of_yojson
         (value_for_key configuration_item_delivery_time_of_yojson "configurationItemDeliveryTime")
         _list path;
   }
    : configuration_item)

let configuration_item_list_of_yojson tree path =
  list_of_yojson configuration_item_of_yojson tree path

let configuration_recorder_filter_value_of_yojson = string_of_yojson

let configuration_recorder_filter_values_of_yojson tree path =
  list_of_yojson configuration_recorder_filter_value_of_yojson tree path

let configuration_recorder_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "recordingScope" -> RecordingScope
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConfigurationRecorderFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "ConfigurationRecorderFilterName")
     : configuration_recorder_filter_name)
    : configuration_recorder_filter_name)

let configuration_recorder_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter_name =
       option_of_yojson
         (value_for_key configuration_recorder_filter_name_of_yojson "filterName")
         _list path;
     filter_value =
       option_of_yojson
         (value_for_key configuration_recorder_filter_values_of_yojson "filterValue")
         _list path;
   }
    : configuration_recorder_filter)

let configuration_recorder_filter_list_of_yojson tree path =
  list_of_yojson configuration_recorder_filter_of_yojson tree path

let configuration_recorder_list_of_yojson tree path =
  list_of_yojson configuration_recorder_of_yojson tree path

let configuration_recorder_name_list_of_yojson tree path =
  list_of_yojson recorder_name_of_yojson tree path

let recorder_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Pending" -> Pending
    | `String "Success" -> Success
    | `String "Failure" -> Failure
    | `String "NotApplicable" -> NotApplicable
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecorderStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RecorderStatus")
     : recorder_status)
    : recorder_status)

let configuration_recorder_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     last_start_time = option_of_yojson (value_for_key date_of_yojson "lastStartTime") _list path;
     last_stop_time = option_of_yojson (value_for_key date_of_yojson "lastStopTime") _list path;
     recording = option_of_yojson (value_for_key boolean__of_yojson "recording") _list path;
     last_status =
       option_of_yojson (value_for_key recorder_status_of_yojson "lastStatus") _list path;
     last_error_code = option_of_yojson (value_for_key string__of_yojson "lastErrorCode") _list path;
     last_error_message =
       option_of_yojson (value_for_key string__of_yojson "lastErrorMessage") _list path;
     last_status_change_time =
       option_of_yojson (value_for_key date_of_yojson "lastStatusChangeTime") _list path;
     service_principal =
       option_of_yojson (value_for_key service_principal_of_yojson "servicePrincipal") _list path;
   }
    : configuration_recorder_status)

let configuration_recorder_status_list_of_yojson tree path =
  list_of_yojson configuration_recorder_status_of_yojson tree path

let configuration_recorder_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "arn" _list path;
     name = value_for_key recorder_name_of_yojson "name" _list path;
     service_principal =
       option_of_yojson (value_for_key service_principal_of_yojson "servicePrincipal") _list path;
     recording_scope = value_for_key recording_scope_of_yojson "recordingScope" _list path;
   }
    : configuration_recorder_summary)

let configuration_recorder_summaries_of_yojson tree path =
  list_of_yojson configuration_recorder_summary_of_yojson tree path

let conformance_pack_arn_of_yojson = string_of_yojson

let conformance_pack_config_rule_names_of_yojson tree path =
  list_of_yojson string_with_char_limit64_of_yojson tree path

let conformance_pack_compliance_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_names =
       option_of_yojson
         (value_for_key conformance_pack_config_rule_names_of_yojson "ConfigRuleNames")
         _list path;
     compliance_type =
       option_of_yojson
         (value_for_key conformance_pack_compliance_type_of_yojson "ComplianceType")
         _list path;
   }
    : conformance_pack_compliance_filters)

let conformance_pack_compliance_resource_ids_of_yojson tree path =
  list_of_yojson string_with_char_limit256_of_yojson tree path

let last_updated_time_of_yojson = timestamp_epoch_seconds_of_yojson

let conformance_pack_compliance_score_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     score = option_of_yojson (value_for_key compliance_score_of_yojson "Score") _list path;
     conformance_pack_name =
       option_of_yojson
         (value_for_key conformance_pack_name_of_yojson "ConformancePackName")
         _list path;
     last_updated_time =
       option_of_yojson (value_for_key last_updated_time_of_yojson "LastUpdatedTime") _list path;
   }
    : conformance_pack_compliance_score)

let conformance_pack_compliance_scores_of_yojson tree path =
  list_of_yojson conformance_pack_compliance_score_of_yojson tree path

let conformance_pack_name_filter_of_yojson tree path =
  list_of_yojson conformance_pack_name_of_yojson tree path

let conformance_pack_compliance_scores_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_names =
       value_for_key conformance_pack_name_filter_of_yojson "ConformancePackNames" _list path;
   }
    : conformance_pack_compliance_scores_filters)

let conformance_pack_compliance_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_name =
       value_for_key conformance_pack_name_of_yojson "ConformancePackName" _list path;
     conformance_pack_compliance_status =
       value_for_key conformance_pack_compliance_type_of_yojson "ConformancePackComplianceStatus"
         _list path;
   }
    : conformance_pack_compliance_summary)

let conformance_pack_compliance_summary_list_of_yojson tree path =
  list_of_yojson conformance_pack_compliance_summary_of_yojson tree path

let ssm_document_version_of_yojson = string_of_yojson
let ssm_document_name_of_yojson = string_of_yojson

let template_ssm_document_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_name = value_for_key ssm_document_name_of_yojson "DocumentName" _list path;
     document_version =
       option_of_yojson (value_for_key ssm_document_version_of_yojson "DocumentVersion") _list path;
   }
    : template_ssm_document_details)

let parameter_value_of_yojson = string_of_yojson
let parameter_name_of_yojson = string_of_yojson

let conformance_pack_input_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_name = value_for_key parameter_name_of_yojson "ParameterName" _list path;
     parameter_value = value_for_key parameter_value_of_yojson "ParameterValue" _list path;
   }
    : conformance_pack_input_parameter)

let conformance_pack_input_parameters_of_yojson tree path =
  list_of_yojson conformance_pack_input_parameter_of_yojson tree path

let delivery_s3_key_prefix_of_yojson = string_of_yojson
let delivery_s3_bucket_of_yojson = string_of_yojson
let conformance_pack_id_of_yojson = string_of_yojson

let conformance_pack_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_name =
       value_for_key conformance_pack_name_of_yojson "ConformancePackName" _list path;
     conformance_pack_arn =
       value_for_key conformance_pack_arn_of_yojson "ConformancePackArn" _list path;
     conformance_pack_id =
       value_for_key conformance_pack_id_of_yojson "ConformancePackId" _list path;
     delivery_s3_bucket =
       option_of_yojson (value_for_key delivery_s3_bucket_of_yojson "DeliveryS3Bucket") _list path;
     delivery_s3_key_prefix =
       option_of_yojson
         (value_for_key delivery_s3_key_prefix_of_yojson "DeliveryS3KeyPrefix")
         _list path;
     conformance_pack_input_parameters =
       option_of_yojson
         (value_for_key conformance_pack_input_parameters_of_yojson "ConformancePackInputParameters")
         _list path;
     last_update_requested_time =
       option_of_yojson (value_for_key date_of_yojson "LastUpdateRequestedTime") _list path;
     created_by =
       option_of_yojson (value_for_key string_with_char_limit256_of_yojson "CreatedBy") _list path;
     template_ssm_document_details =
       option_of_yojson
         (value_for_key template_ssm_document_details_of_yojson "TemplateSSMDocumentDetails")
         _list path;
   }
    : conformance_pack_detail)

let conformance_pack_detail_list_of_yojson tree path =
  list_of_yojson conformance_pack_detail_of_yojson tree path

let conformance_pack_evaluation_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_names =
       option_of_yojson
         (value_for_key conformance_pack_config_rule_names_of_yojson "ConfigRuleNames")
         _list path;
     compliance_type =
       option_of_yojson
         (value_for_key conformance_pack_compliance_type_of_yojson "ComplianceType")
         _list path;
     resource_type =
       option_of_yojson
         (value_for_key string_with_char_limit256_of_yojson "ResourceType")
         _list path;
     resource_ids =
       option_of_yojson
         (value_for_key conformance_pack_compliance_resource_ids_of_yojson "ResourceIds")
         _list path;
   }
    : conformance_pack_evaluation_filters)

let conformance_pack_evaluation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_type =
       value_for_key conformance_pack_compliance_type_of_yojson "ComplianceType" _list path;
     evaluation_result_identifier =
       value_for_key evaluation_result_identifier_of_yojson "EvaluationResultIdentifier" _list path;
     config_rule_invoked_time = value_for_key date_of_yojson "ConfigRuleInvokedTime" _list path;
     result_recorded_time = value_for_key date_of_yojson "ResultRecordedTime" _list path;
     annotation = option_of_yojson (value_for_key annotation_of_yojson "Annotation") _list path;
   }
    : conformance_pack_evaluation_result)

let conformance_pack_names_list_of_yojson tree path =
  list_of_yojson conformance_pack_name_of_yojson tree path

let conformance_pack_names_to_summarize_list_of_yojson tree path =
  list_of_yojson conformance_pack_name_of_yojson tree path

let controls_list_of_yojson tree path = list_of_yojson string_with_char_limit128_of_yojson tree path

let conformance_pack_rule_compliance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name =
       option_of_yojson (value_for_key config_rule_name_of_yojson "ConfigRuleName") _list path;
     compliance_type =
       option_of_yojson
         (value_for_key conformance_pack_compliance_type_of_yojson "ComplianceType")
         _list path;
     controls = option_of_yojson (value_for_key controls_list_of_yojson "Controls") _list path;
   }
    : conformance_pack_rule_compliance)

let conformance_pack_rule_compliance_list_of_yojson tree path =
  list_of_yojson conformance_pack_rule_compliance_of_yojson tree path

let conformance_pack_rule_evaluation_results_list_of_yojson tree path =
  list_of_yojson conformance_pack_evaluation_result_of_yojson tree path

let conformance_pack_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "CREATE_COMPLETE" -> CREATE_COMPLETE
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConformancePackState" value)
    | _ -> raise (deserialize_wrong_type_error path "ConformancePackState")
     : conformance_pack_state)
    : conformance_pack_state)

let conformance_pack_status_reason_of_yojson = string_of_yojson
let stack_arn_of_yojson = string_of_yojson

let conformance_pack_status_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_name =
       value_for_key conformance_pack_name_of_yojson "ConformancePackName" _list path;
     conformance_pack_id =
       value_for_key conformance_pack_id_of_yojson "ConformancePackId" _list path;
     conformance_pack_arn =
       value_for_key conformance_pack_arn_of_yojson "ConformancePackArn" _list path;
     conformance_pack_state =
       value_for_key conformance_pack_state_of_yojson "ConformancePackState" _list path;
     stack_arn = value_for_key stack_arn_of_yojson "StackArn" _list path;
     conformance_pack_status_reason =
       option_of_yojson
         (value_for_key conformance_pack_status_reason_of_yojson "ConformancePackStatusReason")
         _list path;
     last_update_requested_time = value_for_key date_of_yojson "LastUpdateRequestedTime" _list path;
     last_update_completed_time =
       option_of_yojson (value_for_key date_of_yojson "LastUpdateCompletedTime") _list path;
   }
    : conformance_pack_status_detail)

let conformance_pack_status_details_list_of_yojson tree path =
  list_of_yojson conformance_pack_status_detail_of_yojson tree path

let conformance_pack_template_validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : conformance_pack_template_validation_exception)

let cosmos_page_limit_of_yojson = int_of_yojson
let debug_log_delivery_accounts_of_yojson tree path = list_of_yojson account_id_of_yojson tree path

let invalid_parameter_value_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_parameter_value_exception)

let delete_aggregation_authorization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authorized_account_id = value_for_key account_id_of_yojson "AuthorizedAccountId" _list path;
     authorized_aws_region = value_for_key aws_region_of_yojson "AuthorizedAwsRegion" _list path;
   }
    : delete_aggregation_authorization_request)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_in_use_exception)

let no_such_config_rule_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_such_config_rule_exception)

let delete_config_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ config_rule_name = value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path }
    : delete_config_rule_request)

let delete_configuration_aggregator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator_name =
       value_for_key configuration_aggregator_name_of_yojson "ConfigurationAggregatorName" _list
         path;
   }
    : delete_configuration_aggregator_request)

let unmodifiable_entity_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : unmodifiable_entity_exception)

let delete_configuration_recorder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder_name =
       value_for_key recorder_name_of_yojson "ConfigurationRecorderName" _list path;
   }
    : delete_configuration_recorder_request)

let no_such_conformance_pack_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_such_conformance_pack_exception)

let delete_conformance_pack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_name =
       value_for_key conformance_pack_name_of_yojson "ConformancePackName" _list path;
   }
    : delete_conformance_pack_request)

let no_such_delivery_channel_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_such_delivery_channel_exception)

let last_delivery_channel_delete_failed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : last_delivery_channel_delete_failed_exception)

let delete_delivery_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ delivery_channel_name = value_for_key channel_name_of_yojson "DeliveryChannelName" _list path }
    : delete_delivery_channel_request)

let delete_evaluation_results_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_evaluation_results_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name = value_for_key string_with_char_limit64_of_yojson "ConfigRuleName" _list path;
   }
    : delete_evaluation_results_request)

let organization_access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : organization_access_denied_exception)

let no_such_organization_config_rule_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_such_organization_config_rule_exception)

let organization_config_rule_name_of_yojson = string_of_yojson

let delete_organization_config_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_config_rule_name =
       value_for_key organization_config_rule_name_of_yojson "OrganizationConfigRuleName" _list path;
   }
    : delete_organization_config_rule_request)

let no_such_organization_conformance_pack_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_such_organization_conformance_pack_exception)

let organization_conformance_pack_name_of_yojson = string_of_yojson

let delete_organization_conformance_pack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_conformance_pack_name =
       value_for_key organization_conformance_pack_name_of_yojson "OrganizationConformancePackName"
         _list path;
   }
    : delete_organization_conformance_pack_request)

let delete_pending_aggregation_request_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requester_account_id = value_for_key account_id_of_yojson "RequesterAccountId" _list path;
     requester_aws_region = value_for_key aws_region_of_yojson "RequesterAwsRegion" _list path;
   }
    : delete_pending_aggregation_request_request)

let remediation_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : remediation_in_progress_exception)

let no_such_remediation_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_such_remediation_configuration_exception)

let insufficient_permissions_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : insufficient_permissions_exception)

let delete_remediation_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_remediation_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name = value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path;
     resource_type = option_of_yojson (value_for_key string__of_yojson "ResourceType") _list path;
   }
    : delete_remediation_configuration_request)

let no_such_remediation_exception_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_such_remediation_exception_exception)

let remediation_exception_resource_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson
         (value_for_key string_with_char_limit256_of_yojson "ResourceType")
         _list path;
     resource_id =
       option_of_yojson (value_for_key string_with_char_limit1024_of_yojson "ResourceId") _list path;
   }
    : remediation_exception_resource_key)

let remediation_exception_resource_keys_of_yojson tree path =
  list_of_yojson remediation_exception_resource_key_of_yojson tree path

let failed_delete_remediation_exceptions_batch_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_message =
       option_of_yojson (value_for_key string__of_yojson "FailureMessage") _list path;
     failed_items =
       option_of_yojson
         (value_for_key remediation_exception_resource_keys_of_yojson "FailedItems")
         _list path;
   }
    : failed_delete_remediation_exceptions_batch)

let failed_delete_remediation_exceptions_batches_of_yojson tree path =
  list_of_yojson failed_delete_remediation_exceptions_batch_of_yojson tree path

let delete_remediation_exceptions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_batches =
       option_of_yojson
         (value_for_key failed_delete_remediation_exceptions_batches_of_yojson "FailedBatches")
         _list path;
   }
    : delete_remediation_exceptions_response)

let delete_remediation_exceptions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name = value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path;
     resource_keys =
       value_for_key remediation_exception_resource_keys_of_yojson "ResourceKeys" _list path;
   }
    : delete_remediation_exceptions_request)

let no_running_configuration_recorder_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_running_configuration_recorder_exception)

let resource_type_string_of_yojson = string_of_yojson

let delete_resource_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_string_of_yojson "ResourceType" _list path;
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
   }
    : delete_resource_config_request)

let no_such_retention_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_such_retention_configuration_exception)

let retention_configuration_name_of_yojson = string_of_yojson

let delete_retention_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retention_configuration_name =
       value_for_key retention_configuration_name_of_yojson "RetentionConfigurationName" _list path;
   }
    : delete_retention_configuration_request)

let delete_service_linked_configuration_recorder_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "Arn" _list path;
     name = value_for_key recorder_name_of_yojson "Name" _list path;
   }
    : delete_service_linked_configuration_recorder_response)

let delete_service_linked_configuration_recorder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_principal = value_for_key service_principal_of_yojson "ServicePrincipal" _list path }
    : delete_service_linked_configuration_recorder_request)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_not_found_exception)

let delete_stored_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let query_name_of_yojson = string_of_yojson

let delete_stored_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ query_name = value_for_key query_name_of_yojson "QueryName" _list path }
    : delete_stored_query_request)

let deliver_config_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_snapshot_id =
       option_of_yojson (value_for_key string__of_yojson "configSnapshotId") _list path;
   }
    : deliver_config_snapshot_response)

let deliver_config_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ delivery_channel_name = value_for_key channel_name_of_yojson "deliveryChannelName" _list path }
    : deliver_config_snapshot_request)

let delivery_channel_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key channel_name_of_yojson "name") _list path;
     s3_bucket_name = option_of_yojson (value_for_key string__of_yojson "s3BucketName") _list path;
     s3_key_prefix = option_of_yojson (value_for_key string__of_yojson "s3KeyPrefix") _list path;
     s3_kms_key_arn = option_of_yojson (value_for_key string__of_yojson "s3KmsKeyArn") _list path;
     sns_topic_ar_n = option_of_yojson (value_for_key string__of_yojson "snsTopicARN") _list path;
     config_snapshot_delivery_properties =
       option_of_yojson
         (value_for_key config_snapshot_delivery_properties_of_yojson
            "configSnapshotDeliveryProperties")
         _list path;
   }
    : delivery_channel)

let delivery_channel_list_of_yojson tree path = list_of_yojson delivery_channel_of_yojson tree path
let delivery_channel_name_list_of_yojson tree path = list_of_yojson channel_name_of_yojson tree path

let delivery_channel_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     config_snapshot_delivery_info =
       option_of_yojson
         (value_for_key config_export_delivery_info_of_yojson "configSnapshotDeliveryInfo")
         _list path;
     config_history_delivery_info =
       option_of_yojson
         (value_for_key config_export_delivery_info_of_yojson "configHistoryDeliveryInfo")
         _list path;
     config_stream_delivery_info =
       option_of_yojson
         (value_for_key config_stream_delivery_info_of_yojson "configStreamDeliveryInfo")
         _list path;
   }
    : delivery_channel_status)

let delivery_channel_status_list_of_yojson tree path =
  list_of_yojson delivery_channel_status_of_yojson tree path

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_next_token_exception)

let invalid_limit_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_limit_exception)

let next_token_of_yojson = string_of_yojson

let describe_aggregate_compliance_by_config_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregate_compliance_by_config_rules =
       option_of_yojson
         (value_for_key aggregate_compliance_by_config_rule_list_of_yojson
            "AggregateComplianceByConfigRules")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_aggregate_compliance_by_config_rules_response)

let group_by_api_limit_of_yojson = int_of_yojson

let describe_aggregate_compliance_by_config_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator_name =
       value_for_key configuration_aggregator_name_of_yojson "ConfigurationAggregatorName" _list
         path;
     filters =
       option_of_yojson
         (value_for_key config_rule_compliance_filters_of_yojson "Filters")
         _list path;
     limit = option_of_yojson (value_for_key group_by_api_limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_aggregate_compliance_by_config_rules_request)

let describe_aggregate_compliance_by_conformance_packs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregate_compliance_by_conformance_packs =
       option_of_yojson
         (value_for_key aggregate_compliance_by_conformance_pack_list_of_yojson
            "AggregateComplianceByConformancePacks")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_aggregate_compliance_by_conformance_packs_response)

let limit_of_yojson = int_of_yojson

let describe_aggregate_compliance_by_conformance_packs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator_name =
       value_for_key configuration_aggregator_name_of_yojson "ConfigurationAggregatorName" _list
         path;
     filters =
       option_of_yojson
         (value_for_key aggregate_conformance_pack_compliance_filters_of_yojson "Filters")
         _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_aggregate_compliance_by_conformance_packs_request)

let describe_aggregation_authorizations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregation_authorizations =
       option_of_yojson
         (value_for_key aggregation_authorization_list_of_yojson "AggregationAuthorizations")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_aggregation_authorizations_response)

let describe_aggregation_authorizations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_aggregation_authorizations_request)

let describe_compliance_by_config_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_by_config_rules =
       option_of_yojson
         (value_for_key compliance_by_config_rules_of_yojson "ComplianceByConfigRules")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_compliance_by_config_rule_response)

let describe_compliance_by_config_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_names =
       option_of_yojson (value_for_key config_rule_names_of_yojson "ConfigRuleNames") _list path;
     compliance_types =
       option_of_yojson (value_for_key compliance_types_of_yojson "ComplianceTypes") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_compliance_by_config_rule_request)

let describe_compliance_by_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_by_resources =
       option_of_yojson
         (value_for_key compliance_by_resources_of_yojson "ComplianceByResources")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_compliance_by_resource_response)

let describe_compliance_by_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson
         (value_for_key string_with_char_limit256_of_yojson "ResourceType")
         _list path;
     resource_id =
       option_of_yojson (value_for_key base_resource_id_of_yojson "ResourceId") _list path;
     compliance_types =
       option_of_yojson (value_for_key compliance_types_of_yojson "ComplianceTypes") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_compliance_by_resource_request)

let describe_config_rule_evaluation_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rules_evaluation_status =
       option_of_yojson
         (value_for_key config_rule_evaluation_status_list_of_yojson "ConfigRulesEvaluationStatus")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_config_rule_evaluation_status_response)

let rule_limit_of_yojson = int_of_yojson

let describe_config_rule_evaluation_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_names =
       option_of_yojson (value_for_key config_rule_names_of_yojson "ConfigRuleNames") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key rule_limit_of_yojson "Limit") _list path;
   }
    : describe_config_rule_evaluation_status_request)

let describe_config_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rules = option_of_yojson (value_for_key config_rules_of_yojson "ConfigRules") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_config_rules_response)

let describe_config_rules_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_mode =
       option_of_yojson (value_for_key evaluation_mode_of_yojson "EvaluationMode") _list path;
     rule_evaluation_visibility =
       option_of_yojson
         (value_for_key rule_evaluation_visibility_of_yojson "RuleEvaluationVisibility")
         _list path;
   }
    : describe_config_rules_filters)

let describe_config_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_names =
       option_of_yojson (value_for_key config_rule_names_of_yojson "ConfigRuleNames") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     filters =
       option_of_yojson (value_for_key describe_config_rules_filters_of_yojson "Filters") _list path;
   }
    : describe_config_rules_request)

let describe_configuration_aggregator_sources_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregated_source_status_list =
       option_of_yojson
         (value_for_key aggregated_source_status_list_of_yojson "AggregatedSourceStatusList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_configuration_aggregator_sources_status_response)

let describe_configuration_aggregator_sources_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator_name =
       value_for_key configuration_aggregator_name_of_yojson "ConfigurationAggregatorName" _list
         path;
     update_status =
       option_of_yojson
         (value_for_key aggregated_source_status_type_list_of_yojson "UpdateStatus")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
   }
    : describe_configuration_aggregator_sources_status_request)

let describe_configuration_aggregators_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregators =
       option_of_yojson
         (value_for_key configuration_aggregator_list_of_yojson "ConfigurationAggregators")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_configuration_aggregators_response)

let describe_configuration_aggregators_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator_names =
       option_of_yojson
         (value_for_key configuration_aggregator_name_list_of_yojson "ConfigurationAggregatorNames")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
   }
    : describe_configuration_aggregators_request)

let describe_configuration_recorder_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorders_status =
       option_of_yojson
         (value_for_key configuration_recorder_status_list_of_yojson "ConfigurationRecordersStatus")
         _list path;
   }
    : describe_configuration_recorder_status_response)

let describe_configuration_recorder_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder_names =
       option_of_yojson
         (value_for_key configuration_recorder_name_list_of_yojson "ConfigurationRecorderNames")
         _list path;
     service_principal =
       option_of_yojson (value_for_key service_principal_of_yojson "ServicePrincipal") _list path;
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "Arn") _list path;
   }
    : describe_configuration_recorder_status_request)

let describe_configuration_recorders_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorders =
       option_of_yojson
         (value_for_key configuration_recorder_list_of_yojson "ConfigurationRecorders")
         _list path;
   }
    : describe_configuration_recorders_response)

let describe_configuration_recorders_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder_names =
       option_of_yojson
         (value_for_key configuration_recorder_name_list_of_yojson "ConfigurationRecorderNames")
         _list path;
     service_principal =
       option_of_yojson (value_for_key service_principal_of_yojson "ServicePrincipal") _list path;
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "Arn") _list path;
   }
    : describe_configuration_recorders_request)

let no_such_config_rule_in_conformance_pack_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_such_config_rule_in_conformance_pack_exception)

let describe_conformance_pack_compliance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_name =
       value_for_key conformance_pack_name_of_yojson "ConformancePackName" _list path;
     conformance_pack_rule_compliance_list =
       value_for_key conformance_pack_rule_compliance_list_of_yojson
         "ConformancePackRuleComplianceList" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_conformance_pack_compliance_response)

let describe_conformance_pack_compliance_limit_of_yojson = int_of_yojson

let describe_conformance_pack_compliance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_name =
       value_for_key conformance_pack_name_of_yojson "ConformancePackName" _list path;
     filters =
       option_of_yojson
         (value_for_key conformance_pack_compliance_filters_of_yojson "Filters")
         _list path;
     limit =
       option_of_yojson
         (value_for_key describe_conformance_pack_compliance_limit_of_yojson "Limit")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_conformance_pack_compliance_request)

let describe_conformance_pack_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_status_details =
       option_of_yojson
         (value_for_key conformance_pack_status_details_list_of_yojson
            "ConformancePackStatusDetails")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_conformance_pack_status_response)

let page_size_limit_of_yojson = int_of_yojson

let describe_conformance_pack_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_names =
       option_of_yojson
         (value_for_key conformance_pack_names_list_of_yojson "ConformancePackNames")
         _list path;
     limit = option_of_yojson (value_for_key page_size_limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_conformance_pack_status_request)

let describe_conformance_packs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_details =
       option_of_yojson
         (value_for_key conformance_pack_detail_list_of_yojson "ConformancePackDetails")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_conformance_packs_response)

let describe_conformance_packs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_names =
       option_of_yojson
         (value_for_key conformance_pack_names_list_of_yojson "ConformancePackNames")
         _list path;
     limit = option_of_yojson (value_for_key page_size_limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_conformance_packs_request)

let describe_delivery_channel_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_channels_status =
       option_of_yojson
         (value_for_key delivery_channel_status_list_of_yojson "DeliveryChannelsStatus")
         _list path;
   }
    : describe_delivery_channel_status_response)

let describe_delivery_channel_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_channel_names =
       option_of_yojson
         (value_for_key delivery_channel_name_list_of_yojson "DeliveryChannelNames")
         _list path;
   }
    : describe_delivery_channel_status_request)

let describe_delivery_channels_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_channels =
       option_of_yojson
         (value_for_key delivery_channel_list_of_yojson "DeliveryChannels")
         _list path;
   }
    : describe_delivery_channels_response)

let describe_delivery_channels_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_channel_names =
       option_of_yojson
         (value_for_key delivery_channel_name_list_of_yojson "DeliveryChannelNames")
         _list path;
   }
    : describe_delivery_channels_request)

let organization_rule_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_SUCCESSFUL" -> CREATE_SUCCESSFUL
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "DELETE_SUCCESSFUL" -> DELETE_SUCCESSFUL
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "UPDATE_SUCCESSFUL" -> UPDATE_SUCCESSFUL
    | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OrganizationRuleStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OrganizationRuleStatus")
     : organization_rule_status)
    : organization_rule_status)

let organization_config_rule_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_config_rule_name =
       value_for_key organization_config_rule_name_of_yojson "OrganizationConfigRuleName" _list path;
     organization_rule_status =
       value_for_key organization_rule_status_of_yojson "OrganizationRuleStatus" _list path;
     error_code = option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list path;
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
     last_update_time = option_of_yojson (value_for_key date_of_yojson "LastUpdateTime") _list path;
   }
    : organization_config_rule_status)

let organization_config_rule_statuses_of_yojson tree path =
  list_of_yojson organization_config_rule_status_of_yojson tree path

let describe_organization_config_rule_statuses_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_config_rule_statuses =
       option_of_yojson
         (value_for_key organization_config_rule_statuses_of_yojson "OrganizationConfigRuleStatuses")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_organization_config_rule_statuses_response)

let organization_config_rule_names_of_yojson tree path =
  list_of_yojson string_with_char_limit64_of_yojson tree path

let describe_organization_config_rule_statuses_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_config_rule_names =
       option_of_yojson
         (value_for_key organization_config_rule_names_of_yojson "OrganizationConfigRuleNames")
         _list path;
     limit = option_of_yojson (value_for_key cosmos_page_limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_organization_config_rule_statuses_request)

let string_with_char_limit768_of_yojson = string_of_yojson

let resource_types_scope_of_yojson tree path =
  list_of_yojson string_with_char_limit256_of_yojson tree path

let organization_config_rule_trigger_type_no_s_n_of_yojson (tree : t) path =
  ((match tree with
    | `String "ConfigurationItemChangeNotification" -> CONFIGURATION_ITEM_CHANGE_NOTIFICATION
    | `String "OversizedConfigurationItemChangeNotification" ->
        OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "OrganizationConfigRuleTriggerTypeNoSN" value)
    | _ -> raise (deserialize_wrong_type_error path "OrganizationConfigRuleTriggerTypeNoSN")
     : organization_config_rule_trigger_type_no_s_n)
    : organization_config_rule_trigger_type_no_s_n)

let organization_config_rule_trigger_type_no_s_ns_of_yojson tree path =
  list_of_yojson organization_config_rule_trigger_type_no_s_n_of_yojson tree path

let string_with_char_limit256_min0_of_yojson = string_of_yojson

let organization_custom_policy_rule_metadata_no_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson
         (value_for_key string_with_char_limit256_min0_of_yojson "Description")
         _list path;
     organization_config_rule_trigger_types =
       option_of_yojson
         (value_for_key organization_config_rule_trigger_type_no_s_ns_of_yojson
            "OrganizationConfigRuleTriggerTypes")
         _list path;
     input_parameters =
       option_of_yojson
         (value_for_key string_with_char_limit1024_of_yojson "InputParameters")
         _list path;
     maximum_execution_frequency =
       option_of_yojson
         (value_for_key maximum_execution_frequency_of_yojson "MaximumExecutionFrequency")
         _list path;
     resource_types_scope =
       option_of_yojson
         (value_for_key resource_types_scope_of_yojson "ResourceTypesScope")
         _list path;
     resource_id_scope =
       option_of_yojson
         (value_for_key string_with_char_limit768_of_yojson "ResourceIdScope")
         _list path;
     tag_key_scope =
       option_of_yojson (value_for_key string_with_char_limit128_of_yojson "TagKeyScope") _list path;
     tag_value_scope =
       option_of_yojson
         (value_for_key string_with_char_limit256_of_yojson "TagValueScope")
         _list path;
     policy_runtime =
       option_of_yojson (value_for_key policy_runtime_of_yojson "PolicyRuntime") _list path;
     debug_log_delivery_accounts =
       option_of_yojson
         (value_for_key debug_log_delivery_accounts_of_yojson "DebugLogDeliveryAccounts")
         _list path;
   }
    : organization_custom_policy_rule_metadata_no_policy)

let excluded_accounts_of_yojson tree path = list_of_yojson account_id_of_yojson tree path

let organization_config_rule_trigger_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ConfigurationItemChangeNotification" -> CONFIGURATION_ITEM_CHANGE_NOTIFICATION
    | `String "OversizedConfigurationItemChangeNotification" ->
        OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION
    | `String "ScheduledNotification" -> SCHEDULED_NOTIFICATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OrganizationConfigRuleTriggerType" value)
    | _ -> raise (deserialize_wrong_type_error path "OrganizationConfigRuleTriggerType")
     : organization_config_rule_trigger_type)
    : organization_config_rule_trigger_type)

let organization_config_rule_trigger_types_of_yojson tree path =
  list_of_yojson organization_config_rule_trigger_type_of_yojson tree path

let organization_custom_rule_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson
         (value_for_key string_with_char_limit256_min0_of_yojson "Description")
         _list path;
     lambda_function_arn =
       value_for_key string_with_char_limit256_of_yojson "LambdaFunctionArn" _list path;
     organization_config_rule_trigger_types =
       value_for_key organization_config_rule_trigger_types_of_yojson
         "OrganizationConfigRuleTriggerTypes" _list path;
     input_parameters =
       option_of_yojson
         (value_for_key string_with_char_limit1024_of_yojson "InputParameters")
         _list path;
     maximum_execution_frequency =
       option_of_yojson
         (value_for_key maximum_execution_frequency_of_yojson "MaximumExecutionFrequency")
         _list path;
     resource_types_scope =
       option_of_yojson
         (value_for_key resource_types_scope_of_yojson "ResourceTypesScope")
         _list path;
     resource_id_scope =
       option_of_yojson
         (value_for_key string_with_char_limit768_of_yojson "ResourceIdScope")
         _list path;
     tag_key_scope =
       option_of_yojson (value_for_key string_with_char_limit128_of_yojson "TagKeyScope") _list path;
     tag_value_scope =
       option_of_yojson
         (value_for_key string_with_char_limit256_of_yojson "TagValueScope")
         _list path;
   }
    : organization_custom_rule_metadata)

let organization_managed_rule_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson
         (value_for_key string_with_char_limit256_min0_of_yojson "Description")
         _list path;
     rule_identifier = value_for_key string_with_char_limit256_of_yojson "RuleIdentifier" _list path;
     input_parameters =
       option_of_yojson
         (value_for_key string_with_char_limit1024_of_yojson "InputParameters")
         _list path;
     maximum_execution_frequency =
       option_of_yojson
         (value_for_key maximum_execution_frequency_of_yojson "MaximumExecutionFrequency")
         _list path;
     resource_types_scope =
       option_of_yojson
         (value_for_key resource_types_scope_of_yojson "ResourceTypesScope")
         _list path;
     resource_id_scope =
       option_of_yojson
         (value_for_key string_with_char_limit768_of_yojson "ResourceIdScope")
         _list path;
     tag_key_scope =
       option_of_yojson (value_for_key string_with_char_limit128_of_yojson "TagKeyScope") _list path;
     tag_value_scope =
       option_of_yojson
         (value_for_key string_with_char_limit256_of_yojson "TagValueScope")
         _list path;
   }
    : organization_managed_rule_metadata)

let organization_config_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_config_rule_name =
       value_for_key organization_config_rule_name_of_yojson "OrganizationConfigRuleName" _list path;
     organization_config_rule_arn =
       value_for_key string_with_char_limit256_of_yojson "OrganizationConfigRuleArn" _list path;
     organization_managed_rule_metadata =
       option_of_yojson
         (value_for_key organization_managed_rule_metadata_of_yojson
            "OrganizationManagedRuleMetadata")
         _list path;
     organization_custom_rule_metadata =
       option_of_yojson
         (value_for_key organization_custom_rule_metadata_of_yojson "OrganizationCustomRuleMetadata")
         _list path;
     excluded_accounts =
       option_of_yojson (value_for_key excluded_accounts_of_yojson "ExcludedAccounts") _list path;
     last_update_time = option_of_yojson (value_for_key date_of_yojson "LastUpdateTime") _list path;
     organization_custom_policy_rule_metadata =
       option_of_yojson
         (value_for_key organization_custom_policy_rule_metadata_no_policy_of_yojson
            "OrganizationCustomPolicyRuleMetadata")
         _list path;
   }
    : organization_config_rule)

let organization_config_rules_of_yojson tree path =
  list_of_yojson organization_config_rule_of_yojson tree path

let describe_organization_config_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_config_rules =
       option_of_yojson
         (value_for_key organization_config_rules_of_yojson "OrganizationConfigRules")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_organization_config_rules_response)

let describe_organization_config_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_config_rule_names =
       option_of_yojson
         (value_for_key organization_config_rule_names_of_yojson "OrganizationConfigRuleNames")
         _list path;
     limit = option_of_yojson (value_for_key cosmos_page_limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_organization_config_rules_request)

let organization_resource_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_SUCCESSFUL" -> CREATE_SUCCESSFUL
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "DELETE_SUCCESSFUL" -> DELETE_SUCCESSFUL
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "UPDATE_SUCCESSFUL" -> UPDATE_SUCCESSFUL
    | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OrganizationResourceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OrganizationResourceStatus")
     : organization_resource_status)
    : organization_resource_status)

let organization_conformance_pack_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_conformance_pack_name =
       value_for_key organization_conformance_pack_name_of_yojson "OrganizationConformancePackName"
         _list path;
     status = value_for_key organization_resource_status_of_yojson "Status" _list path;
     error_code = option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list path;
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
     last_update_time = option_of_yojson (value_for_key date_of_yojson "LastUpdateTime") _list path;
   }
    : organization_conformance_pack_status)

let organization_conformance_pack_statuses_of_yojson tree path =
  list_of_yojson organization_conformance_pack_status_of_yojson tree path

let describe_organization_conformance_pack_statuses_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_conformance_pack_statuses =
       option_of_yojson
         (value_for_key organization_conformance_pack_statuses_of_yojson
            "OrganizationConformancePackStatuses")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_organization_conformance_pack_statuses_response)

let organization_conformance_pack_names_of_yojson tree path =
  list_of_yojson organization_conformance_pack_name_of_yojson tree path

let describe_organization_conformance_pack_statuses_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_conformance_pack_names =
       option_of_yojson
         (value_for_key organization_conformance_pack_names_of_yojson
            "OrganizationConformancePackNames")
         _list path;
     limit = option_of_yojson (value_for_key cosmos_page_limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_organization_conformance_pack_statuses_request)

let organization_conformance_pack_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_conformance_pack_name =
       value_for_key organization_conformance_pack_name_of_yojson "OrganizationConformancePackName"
         _list path;
     organization_conformance_pack_arn =
       value_for_key string_with_char_limit256_of_yojson "OrganizationConformancePackArn" _list path;
     delivery_s3_bucket =
       option_of_yojson (value_for_key delivery_s3_bucket_of_yojson "DeliveryS3Bucket") _list path;
     delivery_s3_key_prefix =
       option_of_yojson
         (value_for_key delivery_s3_key_prefix_of_yojson "DeliveryS3KeyPrefix")
         _list path;
     conformance_pack_input_parameters =
       option_of_yojson
         (value_for_key conformance_pack_input_parameters_of_yojson "ConformancePackInputParameters")
         _list path;
     excluded_accounts =
       option_of_yojson (value_for_key excluded_accounts_of_yojson "ExcludedAccounts") _list path;
     last_update_time = value_for_key date_of_yojson "LastUpdateTime" _list path;
   }
    : organization_conformance_pack)

let organization_conformance_packs_of_yojson tree path =
  list_of_yojson organization_conformance_pack_of_yojson tree path

let describe_organization_conformance_packs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_conformance_packs =
       option_of_yojson
         (value_for_key organization_conformance_packs_of_yojson "OrganizationConformancePacks")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_organization_conformance_packs_response)

let describe_organization_conformance_packs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_conformance_pack_names =
       option_of_yojson
         (value_for_key organization_conformance_pack_names_of_yojson
            "OrganizationConformancePackNames")
         _list path;
     limit = option_of_yojson (value_for_key cosmos_page_limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_organization_conformance_packs_request)

let pending_aggregation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requester_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "RequesterAccountId") _list path;
     requester_aws_region =
       option_of_yojson (value_for_key aws_region_of_yojson "RequesterAwsRegion") _list path;
   }
    : pending_aggregation_request)

let pending_aggregation_request_list_of_yojson tree path =
  list_of_yojson pending_aggregation_request_of_yojson tree path

let describe_pending_aggregation_requests_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pending_aggregation_requests =
       option_of_yojson
         (value_for_key pending_aggregation_request_list_of_yojson "PendingAggregationRequests")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_pending_aggregation_requests_response)

let describe_pending_aggregation_requests_limit_of_yojson = int_of_yojson

let describe_pending_aggregation_requests_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       option_of_yojson
         (value_for_key describe_pending_aggregation_requests_limit_of_yojson "Limit")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_pending_aggregation_requests_request)

let percentage_of_yojson = int_of_yojson

let ssm_controls_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     concurrent_execution_rate_percentage =
       option_of_yojson
         (value_for_key percentage_of_yojson "ConcurrentExecutionRatePercentage")
         _list path;
     error_percentage =
       option_of_yojson (value_for_key percentage_of_yojson "ErrorPercentage") _list path;
   }
    : ssm_controls)

let execution_controls_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ssm_controls = option_of_yojson (value_for_key ssm_controls_of_yojson "SsmControls") _list path;
   }
    : execution_controls)

let static_parameter_values_of_yojson tree path =
  list_of_yojson string_with_char_limit256_of_yojson tree path

let static_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ values = value_for_key static_parameter_values_of_yojson "Values" _list path } : static_value)

let resource_value_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RESOURCE_ID" -> RESOURCE_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceValueType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceValueType")
     : resource_value_type)
    : resource_value_type)

let resource_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ value = value_for_key resource_value_type_of_yojson "Value" _list path } : resource_value)

let remediation_parameter_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_value =
       option_of_yojson (value_for_key resource_value_of_yojson "ResourceValue") _list path;
     static_value = option_of_yojson (value_for_key static_value_of_yojson "StaticValue") _list path;
   }
    : remediation_parameter_value)

let remediation_parameters_of_yojson tree path =
  map_of_yojson string_with_char_limit256_of_yojson remediation_parameter_value_of_yojson tree path

let remediation_target_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SSM_DOCUMENT" -> SSM_DOCUMENT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RemediationTargetType" value)
    | _ -> raise (deserialize_wrong_type_error path "RemediationTargetType")
     : remediation_target_type)
    : remediation_target_type)

let remediation_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name = value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path;
     target_type = value_for_key remediation_target_type_of_yojson "TargetType" _list path;
     target_id = value_for_key string_with_char_limit256_of_yojson "TargetId" _list path;
     target_version = option_of_yojson (value_for_key string__of_yojson "TargetVersion") _list path;
     parameters =
       option_of_yojson (value_for_key remediation_parameters_of_yojson "Parameters") _list path;
     resource_type = option_of_yojson (value_for_key string__of_yojson "ResourceType") _list path;
     automatic = option_of_yojson (value_for_key boolean__of_yojson "Automatic") _list path;
     execution_controls =
       option_of_yojson (value_for_key execution_controls_of_yojson "ExecutionControls") _list path;
     maximum_automatic_attempts =
       option_of_yojson
         (value_for_key auto_remediation_attempts_of_yojson "MaximumAutomaticAttempts")
         _list path;
     retry_attempt_seconds =
       option_of_yojson
         (value_for_key auto_remediation_attempt_seconds_of_yojson "RetryAttemptSeconds")
         _list path;
     arn = option_of_yojson (value_for_key string_with_char_limit1024_of_yojson "Arn") _list path;
     created_by_service =
       option_of_yojson
         (value_for_key string_with_char_limit1024_of_yojson "CreatedByService")
         _list path;
   }
    : remediation_configuration)

let remediation_configurations_of_yojson tree path =
  list_of_yojson remediation_configuration_of_yojson tree path

let describe_remediation_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remediation_configurations =
       option_of_yojson
         (value_for_key remediation_configurations_of_yojson "RemediationConfigurations")
         _list path;
   }
    : describe_remediation_configurations_response)

let describe_remediation_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ config_rule_names = value_for_key config_rule_names_of_yojson "ConfigRuleNames" _list path }
    : describe_remediation_configurations_request)

let remediation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name = value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path;
     resource_type = value_for_key string_with_char_limit256_of_yojson "ResourceType" _list path;
     resource_id = value_for_key string_with_char_limit1024_of_yojson "ResourceId" _list path;
     message =
       option_of_yojson (value_for_key string_with_char_limit1024_of_yojson "Message") _list path;
     expiration_time = option_of_yojson (value_for_key date_of_yojson "ExpirationTime") _list path;
   }
    : remediation_exception)

let remediation_exceptions_of_yojson tree path =
  list_of_yojson remediation_exception_of_yojson tree path

let describe_remediation_exceptions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remediation_exceptions =
       option_of_yojson
         (value_for_key remediation_exceptions_of_yojson "RemediationExceptions")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_remediation_exceptions_response)

let describe_remediation_exceptions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name = value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path;
     resource_keys =
       option_of_yojson
         (value_for_key remediation_exception_resource_keys_of_yojson "ResourceKeys")
         _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_remediation_exceptions_request)

let remediation_execution_step_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "PENDING" -> PENDING
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "EXITED" -> EXITED
    | `String "UNKNOWN" -> UNKNOWN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RemediationExecutionStepState" value)
    | _ -> raise (deserialize_wrong_type_error path "RemediationExecutionStepState")
     : remediation_execution_step_state)
    : remediation_execution_step_state)

let remediation_execution_step_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     state =
       option_of_yojson
         (value_for_key remediation_execution_step_state_of_yojson "State")
         _list path;
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
     start_time = option_of_yojson (value_for_key date_of_yojson "StartTime") _list path;
     stop_time = option_of_yojson (value_for_key date_of_yojson "StopTime") _list path;
   }
    : remediation_execution_step)

let remediation_execution_steps_of_yojson tree path =
  list_of_yojson remediation_execution_step_of_yojson tree path

let remediation_execution_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "QUEUED" -> QUEUED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String "UNKNOWN" -> UNKNOWN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RemediationExecutionState" value)
    | _ -> raise (deserialize_wrong_type_error path "RemediationExecutionState")
     : remediation_execution_state)
    : remediation_execution_state)

let remediation_execution_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_key = option_of_yojson (value_for_key resource_key_of_yojson "ResourceKey") _list path;
     state =
       option_of_yojson (value_for_key remediation_execution_state_of_yojson "State") _list path;
     step_details =
       option_of_yojson
         (value_for_key remediation_execution_steps_of_yojson "StepDetails")
         _list path;
     invocation_time = option_of_yojson (value_for_key date_of_yojson "InvocationTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key date_of_yojson "LastUpdatedTime") _list path;
   }
    : remediation_execution_status)

let remediation_execution_statuses_of_yojson tree path =
  list_of_yojson remediation_execution_status_of_yojson tree path

let describe_remediation_execution_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remediation_execution_statuses =
       option_of_yojson
         (value_for_key remediation_execution_statuses_of_yojson "RemediationExecutionStatuses")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_remediation_execution_status_response)

let describe_remediation_execution_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name = value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path;
     resource_keys =
       option_of_yojson (value_for_key resource_keys_of_yojson "ResourceKeys") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_remediation_execution_status_request)

let retention_period_in_days_of_yojson = int_of_yojson

let retention_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key retention_configuration_name_of_yojson "Name" _list path;
     retention_period_in_days =
       value_for_key retention_period_in_days_of_yojson "RetentionPeriodInDays" _list path;
   }
    : retention_configuration)

let retention_configuration_list_of_yojson tree path =
  list_of_yojson retention_configuration_of_yojson tree path

let describe_retention_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retention_configurations =
       option_of_yojson
         (value_for_key retention_configuration_list_of_yojson "RetentionConfigurations")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_retention_configurations_response)

let retention_configuration_name_list_of_yojson tree path =
  list_of_yojson retention_configuration_name_of_yojson tree path

let describe_retention_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retention_configuration_names =
       option_of_yojson
         (value_for_key retention_configuration_name_list_of_yojson "RetentionConfigurationNames")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_retention_configurations_request)

let disassociate_resource_types_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder =
       value_for_key configuration_recorder_of_yojson "ConfigurationRecorder" _list path;
   }
    : disassociate_resource_types_response)

let disassociate_resource_types_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder_arn =
       value_for_key amazon_resource_name_of_yojson "ConfigurationRecorderArn" _list path;
     resource_types = value_for_key resource_type_list_of_yojson "ResourceTypes" _list path;
   }
    : disassociate_resource_types_request)

let discovered_resource_identifier_list_of_yojson tree path =
  list_of_yojson aggregate_resource_identifier_of_yojson tree path

let earlier_time_of_yojson = timestamp_epoch_seconds_of_yojson
let ordering_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let evaluation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_resource_type =
       value_for_key string_with_char_limit256_of_yojson "ComplianceResourceType" _list path;
     compliance_resource_id =
       value_for_key base_resource_id_of_yojson "ComplianceResourceId" _list path;
     compliance_type = value_for_key compliance_type_of_yojson "ComplianceType" _list path;
     annotation =
       option_of_yojson (value_for_key string_with_char_limit256_of_yojson "Annotation") _list path;
     ordering_timestamp = value_for_key ordering_timestamp_of_yojson "OrderingTimestamp" _list path;
   }
    : evaluation)

let evaluation_context_identifier_of_yojson = string_of_yojson

let evaluation_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_context_identifier =
       option_of_yojson
         (value_for_key evaluation_context_identifier_of_yojson "EvaluationContextIdentifier")
         _list path;
   }
    : evaluation_context)

let evaluation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_result_identifier =
       option_of_yojson
         (value_for_key evaluation_result_identifier_of_yojson "EvaluationResultIdentifier")
         _list path;
     compliance_type =
       option_of_yojson (value_for_key compliance_type_of_yojson "ComplianceType") _list path;
     result_recorded_time =
       option_of_yojson (value_for_key date_of_yojson "ResultRecordedTime") _list path;
     config_rule_invoked_time =
       option_of_yojson (value_for_key date_of_yojson "ConfigRuleInvokedTime") _list path;
     annotation =
       option_of_yojson (value_for_key string_with_char_limit256_of_yojson "Annotation") _list path;
     result_token = option_of_yojson (value_for_key string__of_yojson "ResultToken") _list path;
   }
    : evaluation_result)

let evaluation_results_of_yojson tree path = list_of_yojson evaluation_result_of_yojson tree path

let resource_evaluation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResourceEvaluationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceEvaluationStatus")
     : resource_evaluation_status)
    : resource_evaluation_status)

let evaluation_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key resource_evaluation_status_of_yojson "Status" _list path;
     failure_reason =
       option_of_yojson
         (value_for_key string_with_char_limit1024_of_yojson "FailureReason")
         _list path;
   }
    : evaluation_status)

let evaluation_timeout_of_yojson = int_of_yojson
let evaluations_of_yojson tree path = list_of_yojson evaluation_of_yojson tree path
let expression_of_yojson = string_of_yojson

let external_evaluation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_resource_type =
       value_for_key string_with_char_limit256_of_yojson "ComplianceResourceType" _list path;
     compliance_resource_id =
       value_for_key base_resource_id_of_yojson "ComplianceResourceId" _list path;
     compliance_type = value_for_key compliance_type_of_yojson "ComplianceType" _list path;
     annotation =
       option_of_yojson (value_for_key string_with_char_limit256_of_yojson "Annotation") _list path;
     ordering_timestamp = value_for_key ordering_timestamp_of_yojson "OrderingTimestamp" _list path;
   }
    : external_evaluation)

let failed_remediation_batch_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_message =
       option_of_yojson (value_for_key string__of_yojson "FailureMessage") _list path;
     failed_items =
       option_of_yojson
         (value_for_key remediation_configurations_of_yojson "FailedItems")
         _list path;
   }
    : failed_remediation_batch)

let failed_remediation_batches_of_yojson tree path =
  list_of_yojson failed_remediation_batch_of_yojson tree path

let failed_remediation_exception_batch_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_message =
       option_of_yojson (value_for_key string__of_yojson "FailureMessage") _list path;
     failed_items =
       option_of_yojson (value_for_key remediation_exceptions_of_yojson "FailedItems") _list path;
   }
    : failed_remediation_exception_batch)

let failed_remediation_exception_batches_of_yojson tree path =
  list_of_yojson failed_remediation_exception_batch_of_yojson tree path

let field_name_of_yojson = string_of_yojson

let field_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key field_name_of_yojson "Name") _list path } : field_info)

let field_info_list_of_yojson tree path = list_of_yojson field_info_of_yojson tree path

let get_aggregate_compliance_details_by_config_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregate_evaluation_results =
       option_of_yojson
         (value_for_key aggregate_evaluation_result_list_of_yojson "AggregateEvaluationResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_aggregate_compliance_details_by_config_rule_response)

let get_aggregate_compliance_details_by_config_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator_name =
       value_for_key configuration_aggregator_name_of_yojson "ConfigurationAggregatorName" _list
         path;
     config_rule_name = value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     aws_region = value_for_key aws_region_of_yojson "AwsRegion" _list path;
     compliance_type =
       option_of_yojson (value_for_key compliance_type_of_yojson "ComplianceType") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_aggregate_compliance_details_by_config_rule_request)

let get_aggregate_config_rule_compliance_summary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_by_key =
       option_of_yojson (value_for_key string_with_char_limit256_of_yojson "GroupByKey") _list path;
     aggregate_compliance_counts =
       option_of_yojson
         (value_for_key aggregate_compliance_count_list_of_yojson "AggregateComplianceCounts")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_aggregate_config_rule_compliance_summary_response)

let get_aggregate_config_rule_compliance_summary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator_name =
       value_for_key configuration_aggregator_name_of_yojson "ConfigurationAggregatorName" _list
         path;
     filters =
       option_of_yojson
         (value_for_key config_rule_compliance_summary_filters_of_yojson "Filters")
         _list path;
     group_by_key =
       option_of_yojson
         (value_for_key config_rule_compliance_summary_group_key_of_yojson "GroupByKey")
         _list path;
     limit = option_of_yojson (value_for_key group_by_api_limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_aggregate_config_rule_compliance_summary_request)

let get_aggregate_conformance_pack_compliance_summary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregate_conformance_pack_compliance_summaries =
       option_of_yojson
         (value_for_key aggregate_conformance_pack_compliance_summary_list_of_yojson
            "AggregateConformancePackComplianceSummaries")
         _list path;
     group_by_key =
       option_of_yojson (value_for_key string_with_char_limit256_of_yojson "GroupByKey") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_aggregate_conformance_pack_compliance_summary_response)

let get_aggregate_conformance_pack_compliance_summary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator_name =
       value_for_key configuration_aggregator_name_of_yojson "ConfigurationAggregatorName" _list
         path;
     filters =
       option_of_yojson
         (value_for_key aggregate_conformance_pack_compliance_summary_filters_of_yojson "Filters")
         _list path;
     group_by_key =
       option_of_yojson
         (value_for_key aggregate_conformance_pack_compliance_summary_group_key_of_yojson
            "GroupByKey")
         _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_aggregate_conformance_pack_compliance_summary_request)

let long_of_yojson = long_of_yojson

let grouped_resource_count_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_name = value_for_key string_with_char_limit256_of_yojson "GroupName" _list path;
     resource_count = value_for_key long_of_yojson "ResourceCount" _list path;
   }
    : grouped_resource_count)

let grouped_resource_count_list_of_yojson tree path =
  list_of_yojson grouped_resource_count_of_yojson tree path

let get_aggregate_discovered_resource_counts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_discovered_resources = value_for_key long_of_yojson "TotalDiscoveredResources" _list path;
     group_by_key =
       option_of_yojson (value_for_key string_with_char_limit256_of_yojson "GroupByKey") _list path;
     grouped_resource_counts =
       option_of_yojson
         (value_for_key grouped_resource_count_list_of_yojson "GroupedResourceCounts")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_aggregate_discovered_resource_counts_response)

let resource_count_group_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "RESOURCE_TYPE" -> RESOURCE_TYPE
    | `String "ACCOUNT_ID" -> ACCOUNT_ID
    | `String "AWS_REGION" -> AWS_REGION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResourceCountGroupKey" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceCountGroupKey")
     : resource_count_group_key)
    : resource_count_group_key)

let resource_count_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     region = option_of_yojson (value_for_key aws_region_of_yojson "Region") _list path;
   }
    : resource_count_filters)

let get_aggregate_discovered_resource_counts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator_name =
       value_for_key configuration_aggregator_name_of_yojson "ConfigurationAggregatorName" _list
         path;
     filters =
       option_of_yojson (value_for_key resource_count_filters_of_yojson "Filters") _list path;
     group_by_key =
       option_of_yojson (value_for_key resource_count_group_key_of_yojson "GroupByKey") _list path;
     limit = option_of_yojson (value_for_key group_by_api_limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_aggregate_discovered_resource_counts_request)

let resource_not_discovered_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_not_discovered_exception)

let oversized_configuration_item_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : oversized_configuration_item_exception)

let get_aggregate_resource_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_item =
       option_of_yojson (value_for_key configuration_item_of_yojson "ConfigurationItem") _list path;
   }
    : get_aggregate_resource_config_response)

let get_aggregate_resource_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator_name =
       value_for_key configuration_aggregator_name_of_yojson "ConfigurationAggregatorName" _list
         path;
     resource_identifier =
       value_for_key aggregate_resource_identifier_of_yojson "ResourceIdentifier" _list path;
   }
    : get_aggregate_resource_config_request)

let get_compliance_details_by_config_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_results =
       option_of_yojson (value_for_key evaluation_results_of_yojson "EvaluationResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_compliance_details_by_config_rule_response)

let get_compliance_details_by_config_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name = value_for_key string_with_char_limit64_of_yojson "ConfigRuleName" _list path;
     compliance_types =
       option_of_yojson (value_for_key compliance_types_of_yojson "ComplianceTypes") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_compliance_details_by_config_rule_request)

let get_compliance_details_by_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_results =
       option_of_yojson (value_for_key evaluation_results_of_yojson "EvaluationResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : get_compliance_details_by_resource_response)

let get_compliance_details_by_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson
         (value_for_key string_with_char_limit256_of_yojson "ResourceType")
         _list path;
     resource_id =
       option_of_yojson (value_for_key base_resource_id_of_yojson "ResourceId") _list path;
     compliance_types =
       option_of_yojson (value_for_key compliance_types_of_yojson "ComplianceTypes") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     resource_evaluation_id =
       option_of_yojson
         (value_for_key resource_evaluation_id_of_yojson "ResourceEvaluationId")
         _list path;
   }
    : get_compliance_details_by_resource_request)

let get_compliance_summary_by_config_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_summary =
       option_of_yojson (value_for_key compliance_summary_of_yojson "ComplianceSummary") _list path;
   }
    : get_compliance_summary_by_config_rule_response)

let get_compliance_summary_by_resource_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_summaries_by_resource_type =
       option_of_yojson
         (value_for_key compliance_summaries_by_resource_type_of_yojson
            "ComplianceSummariesByResourceType")
         _list path;
   }
    : get_compliance_summary_by_resource_type_response)

let resource_types_of_yojson tree path =
  list_of_yojson string_with_char_limit256_of_yojson tree path

let get_compliance_summary_by_resource_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_types =
       option_of_yojson (value_for_key resource_types_of_yojson "ResourceTypes") _list path;
   }
    : get_compliance_summary_by_resource_type_request)

let get_conformance_pack_compliance_details_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_name =
       value_for_key conformance_pack_name_of_yojson "ConformancePackName" _list path;
     conformance_pack_rule_evaluation_results =
       option_of_yojson
         (value_for_key conformance_pack_rule_evaluation_results_list_of_yojson
            "ConformancePackRuleEvaluationResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_conformance_pack_compliance_details_response)

let get_conformance_pack_compliance_details_limit_of_yojson = int_of_yojson

let get_conformance_pack_compliance_details_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_name =
       value_for_key conformance_pack_name_of_yojson "ConformancePackName" _list path;
     filters =
       option_of_yojson
         (value_for_key conformance_pack_evaluation_filters_of_yojson "Filters")
         _list path;
     limit =
       option_of_yojson
         (value_for_key get_conformance_pack_compliance_details_limit_of_yojson "Limit")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_conformance_pack_compliance_details_request)

let get_conformance_pack_compliance_summary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_compliance_summary_list =
       option_of_yojson
         (value_for_key conformance_pack_compliance_summary_list_of_yojson
            "ConformancePackComplianceSummaryList")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_conformance_pack_compliance_summary_response)

let get_conformance_pack_compliance_summary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_names =
       value_for_key conformance_pack_names_to_summarize_list_of_yojson "ConformancePackNames" _list
         path;
     limit = option_of_yojson (value_for_key page_size_limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_conformance_pack_compliance_summary_request)

let get_custom_rule_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy_text = option_of_yojson (value_for_key policy_text_of_yojson "PolicyText") _list path }
    : get_custom_rule_policy_response)

let get_custom_rule_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name =
       option_of_yojson (value_for_key config_rule_name_of_yojson "ConfigRuleName") _list path;
   }
    : get_custom_rule_policy_request)

let resource_count_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     count = option_of_yojson (value_for_key long_of_yojson "count") _list path;
   }
    : resource_count)

let resource_counts_of_yojson tree path = list_of_yojson resource_count_of_yojson tree path

let get_discovered_resource_counts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_discovered_resources =
       option_of_yojson (value_for_key long_of_yojson "totalDiscoveredResources") _list path;
     resource_counts =
       option_of_yojson (value_for_key resource_counts_of_yojson "resourceCounts") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_discovered_resource_counts_response)

let get_discovered_resource_counts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_types =
       option_of_yojson (value_for_key resource_types_of_yojson "resourceTypes") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_discovered_resource_counts_request)

let member_account_rule_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_SUCCESSFUL" -> CREATE_SUCCESSFUL
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "DELETE_SUCCESSFUL" -> DELETE_SUCCESSFUL
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "UPDATE_SUCCESSFUL" -> UPDATE_SUCCESSFUL
    | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MemberAccountRuleStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "MemberAccountRuleStatus")
     : member_account_rule_status)
    : member_account_rule_status)

let member_account_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     config_rule_name = value_for_key string_with_char_limit64_of_yojson "ConfigRuleName" _list path;
     member_account_rule_status =
       value_for_key member_account_rule_status_of_yojson "MemberAccountRuleStatus" _list path;
     error_code = option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list path;
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
     last_update_time = option_of_yojson (value_for_key date_of_yojson "LastUpdateTime") _list path;
   }
    : member_account_status)

let organization_config_rule_detailed_status_of_yojson tree path =
  list_of_yojson member_account_status_of_yojson tree path

let get_organization_config_rule_detailed_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_config_rule_detailed_status =
       option_of_yojson
         (value_for_key organization_config_rule_detailed_status_of_yojson
            "OrganizationConfigRuleDetailedStatus")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : get_organization_config_rule_detailed_status_response)

let status_detail_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     member_account_rule_status =
       option_of_yojson
         (value_for_key member_account_rule_status_of_yojson "MemberAccountRuleStatus")
         _list path;
   }
    : status_detail_filters)

let get_organization_config_rule_detailed_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_config_rule_name =
       value_for_key organization_config_rule_name_of_yojson "OrganizationConfigRuleName" _list path;
     filters = option_of_yojson (value_for_key status_detail_filters_of_yojson "Filters") _list path;
     limit = option_of_yojson (value_for_key cosmos_page_limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : get_organization_config_rule_detailed_status_request)

let organization_resource_detailed_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_SUCCESSFUL" -> CREATE_SUCCESSFUL
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "DELETE_SUCCESSFUL" -> DELETE_SUCCESSFUL
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "UPDATE_SUCCESSFUL" -> UPDATE_SUCCESSFUL
    | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OrganizationResourceDetailedStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OrganizationResourceDetailedStatus")
     : organization_resource_detailed_status)
    : organization_resource_detailed_status)

let organization_conformance_pack_detailed_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     conformance_pack_name =
       value_for_key string_with_char_limit256_of_yojson "ConformancePackName" _list path;
     status = value_for_key organization_resource_detailed_status_of_yojson "Status" _list path;
     error_code = option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list path;
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
     last_update_time = option_of_yojson (value_for_key date_of_yojson "LastUpdateTime") _list path;
   }
    : organization_conformance_pack_detailed_status)

let organization_conformance_pack_detailed_statuses_of_yojson tree path =
  list_of_yojson organization_conformance_pack_detailed_status_of_yojson tree path

let get_organization_conformance_pack_detailed_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_conformance_pack_detailed_statuses =
       option_of_yojson
         (value_for_key organization_conformance_pack_detailed_statuses_of_yojson
            "OrganizationConformancePackDetailedStatuses")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : get_organization_conformance_pack_detailed_status_response)

let organization_resource_detailed_status_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     status =
       option_of_yojson
         (value_for_key organization_resource_detailed_status_of_yojson "Status")
         _list path;
   }
    : organization_resource_detailed_status_filters)

let get_organization_conformance_pack_detailed_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_conformance_pack_name =
       value_for_key organization_conformance_pack_name_of_yojson "OrganizationConformancePackName"
         _list path;
     filters =
       option_of_yojson
         (value_for_key organization_resource_detailed_status_filters_of_yojson "Filters")
         _list path;
     limit = option_of_yojson (value_for_key cosmos_page_limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : get_organization_conformance_pack_detailed_status_request)

let get_organization_custom_rule_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy_text = option_of_yojson (value_for_key policy_text_of_yojson "PolicyText") _list path }
    : get_organization_custom_rule_policy_response)

let get_organization_custom_rule_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_config_rule_name =
       value_for_key organization_config_rule_name_of_yojson "OrganizationConfigRuleName" _list path;
   }
    : get_organization_custom_rule_policy_request)

let invalid_time_range_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_time_range_exception)

let get_resource_config_history_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_items =
       option_of_yojson
         (value_for_key configuration_item_list_of_yojson "configurationItems")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_resource_config_history_response)

let later_time_of_yojson = timestamp_epoch_seconds_of_yojson

let get_resource_config_history_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_of_yojson "resourceType" _list path;
     resource_id = value_for_key resource_id_of_yojson "resourceId" _list path;
     later_time = option_of_yojson (value_for_key later_time_of_yojson "laterTime") _list path;
     earlier_time = option_of_yojson (value_for_key earlier_time_of_yojson "earlierTime") _list path;
     chronological_order =
       option_of_yojson
         (value_for_key chronological_order_of_yojson "chronologicalOrder")
         _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_resource_config_history_request)

let resource_configuration_schema_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CFN_RESOURCE_SCHEMA" -> CFN_RESOURCE_SCHEMA
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResourceConfigurationSchemaType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceConfigurationSchemaType")
     : resource_configuration_schema_type)
    : resource_configuration_schema_type)

let resource_configuration_of_yojson = string_of_yojson

let resource_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key base_resource_id_of_yojson "ResourceId" _list path;
     resource_type = value_for_key string_with_char_limit256_of_yojson "ResourceType" _list path;
     resource_configuration =
       value_for_key resource_configuration_of_yojson "ResourceConfiguration" _list path;
     resource_configuration_schema_type =
       option_of_yojson
         (value_for_key resource_configuration_schema_type_of_yojson
            "ResourceConfigurationSchemaType")
         _list path;
   }
    : resource_details)

let get_resource_evaluation_summary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_evaluation_id =
       option_of_yojson
         (value_for_key resource_evaluation_id_of_yojson "ResourceEvaluationId")
         _list path;
     evaluation_mode =
       option_of_yojson (value_for_key evaluation_mode_of_yojson "EvaluationMode") _list path;
     evaluation_status =
       option_of_yojson (value_for_key evaluation_status_of_yojson "EvaluationStatus") _list path;
     evaluation_start_timestamp =
       option_of_yojson (value_for_key date_of_yojson "EvaluationStartTimestamp") _list path;
     compliance = option_of_yojson (value_for_key compliance_type_of_yojson "Compliance") _list path;
     evaluation_context =
       option_of_yojson (value_for_key evaluation_context_of_yojson "EvaluationContext") _list path;
     resource_details =
       option_of_yojson (value_for_key resource_details_of_yojson "ResourceDetails") _list path;
   }
    : get_resource_evaluation_summary_response)

let get_resource_evaluation_summary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_evaluation_id =
       value_for_key resource_evaluation_id_of_yojson "ResourceEvaluationId" _list path;
   }
    : get_resource_evaluation_summary_request)

let query_expression_of_yojson = string_of_yojson
let query_description_of_yojson = string_of_yojson
let query_arn_of_yojson = string_of_yojson
let query_id_of_yojson = string_of_yojson

let stored_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_id = option_of_yojson (value_for_key query_id_of_yojson "QueryId") _list path;
     query_arn = option_of_yojson (value_for_key query_arn_of_yojson "QueryArn") _list path;
     query_name = value_for_key query_name_of_yojson "QueryName" _list path;
     description =
       option_of_yojson (value_for_key query_description_of_yojson "Description") _list path;
     expression =
       option_of_yojson (value_for_key query_expression_of_yojson "Expression") _list path;
   }
    : stored_query)

let get_stored_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stored_query = option_of_yojson (value_for_key stored_query_of_yojson "StoredQuery") _list path;
   }
    : get_stored_query_response)

let get_stored_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ query_name = value_for_key query_name_of_yojson "QueryName" _list path }
    : get_stored_query_request)

let idempotent_parameter_mismatch_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : idempotent_parameter_mismatch)

let insufficient_delivery_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : insufficient_delivery_policy_exception)

let invalid_configuration_recorder_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_configuration_recorder_name_exception)

let invalid_delivery_channel_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_delivery_channel_name_exception)

let invalid_expression_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_expression_exception)

let invalid_recording_group_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_recording_group_exception)

let invalid_result_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_result_token_exception)

let invalid_role_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_role_exception)

let invalid_s3_key_prefix_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_s3_key_prefix_exception)

let invalid_s3_kms_key_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_s3_kms_key_arn_exception)

let invalid_sns_topic_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_sns_topic_arn_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let list_aggregate_discovered_resources_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_identifiers =
       option_of_yojson
         (value_for_key discovered_resource_identifier_list_of_yojson "ResourceIdentifiers")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_aggregate_discovered_resources_response)

let resource_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "ResourceId") _list path;
     resource_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ResourceName") _list path;
     region = option_of_yojson (value_for_key aws_region_of_yojson "Region") _list path;
   }
    : resource_filters)

let list_aggregate_discovered_resources_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator_name =
       value_for_key configuration_aggregator_name_of_yojson "ConfigurationAggregatorName" _list
         path;
     resource_type = value_for_key resource_type_of_yojson "ResourceType" _list path;
     filters = option_of_yojson (value_for_key resource_filters_of_yojson "Filters") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_aggregate_discovered_resources_request)

let list_configuration_recorders_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder_summaries =
       value_for_key configuration_recorder_summaries_of_yojson "ConfigurationRecorderSummaries"
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_configuration_recorders_response)

let max_results_of_yojson = int_of_yojson

let list_configuration_recorders_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson
         (value_for_key configuration_recorder_filter_list_of_yojson "Filters")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_configuration_recorders_request)

let list_conformance_pack_compliance_scores_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     conformance_pack_compliance_scores =
       value_for_key conformance_pack_compliance_scores_of_yojson "ConformancePackComplianceScores"
         _list path;
   }
    : list_conformance_pack_compliance_scores_response)

let sort_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "SCORE" -> SCORE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "SortBy")
     : sort_by)
    : sort_by)

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASCENDING" -> ASCENDING
    | `String "DESCENDING" -> DESCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let list_conformance_pack_compliance_scores_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson
         (value_for_key conformance_pack_compliance_scores_filters_of_yojson "Filters")
         _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
     sort_by = option_of_yojson (value_for_key sort_by_of_yojson "SortBy") _list path;
     limit = option_of_yojson (value_for_key page_size_limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_conformance_pack_compliance_scores_request)

let resource_deletion_time_of_yojson = timestamp_epoch_seconds_of_yojson

let resource_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "resourceId") _list path;
     resource_name =
       option_of_yojson (value_for_key resource_name_of_yojson "resourceName") _list path;
     resource_deletion_time =
       option_of_yojson
         (value_for_key resource_deletion_time_of_yojson "resourceDeletionTime")
         _list path;
   }
    : resource_identifier)

let resource_identifier_list_of_yojson tree path =
  list_of_yojson resource_identifier_of_yojson tree path

let list_discovered_resources_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_identifiers =
       option_of_yojson
         (value_for_key resource_identifier_list_of_yojson "resourceIdentifiers")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_discovered_resources_response)

let resource_id_list_of_yojson tree path = list_of_yojson resource_id_of_yojson tree path

let list_discovered_resources_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_of_yojson "resourceType" _list path;
     resource_ids =
       option_of_yojson (value_for_key resource_id_list_of_yojson "resourceIds") _list path;
     resource_name =
       option_of_yojson (value_for_key resource_name_of_yojson "resourceName") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "limit") _list path;
     include_deleted_resources =
       option_of_yojson (value_for_key boolean__of_yojson "includeDeletedResources") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_discovered_resources_request)

let resource_evaluation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_evaluation_id =
       option_of_yojson
         (value_for_key resource_evaluation_id_of_yojson "ResourceEvaluationId")
         _list path;
     evaluation_mode =
       option_of_yojson (value_for_key evaluation_mode_of_yojson "EvaluationMode") _list path;
     evaluation_start_timestamp =
       option_of_yojson (value_for_key date_of_yojson "EvaluationStartTimestamp") _list path;
   }
    : resource_evaluation)

let resource_evaluations_of_yojson tree path =
  list_of_yojson resource_evaluation_of_yojson tree path

let list_resource_evaluations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_evaluations =
       option_of_yojson
         (value_for_key resource_evaluations_of_yojson "ResourceEvaluations")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_resource_evaluations_response)

let list_resource_evaluations_page_item_limit_of_yojson = int_of_yojson

let time_window_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_time = option_of_yojson (value_for_key date_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key date_of_yojson "EndTime") _list path;
   }
    : time_window)

let resource_evaluation_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_mode =
       option_of_yojson (value_for_key evaluation_mode_of_yojson "EvaluationMode") _list path;
     time_window = option_of_yojson (value_for_key time_window_of_yojson "TimeWindow") _list path;
     evaluation_context_identifier =
       option_of_yojson
         (value_for_key evaluation_context_identifier_of_yojson "EvaluationContextIdentifier")
         _list path;
   }
    : resource_evaluation_filters)

let list_resource_evaluations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson (value_for_key resource_evaluation_filters_of_yojson "Filters") _list path;
     limit =
       option_of_yojson
         (value_for_key list_resource_evaluations_page_item_limit_of_yojson "Limit")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_resource_evaluations_request)

let stored_query_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_id = value_for_key query_id_of_yojson "QueryId" _list path;
     query_arn = value_for_key query_arn_of_yojson "QueryArn" _list path;
     query_name = value_for_key query_name_of_yojson "QueryName" _list path;
     description =
       option_of_yojson (value_for_key query_description_of_yojson "Description") _list path;
   }
    : stored_query_metadata)

let stored_query_metadata_list_of_yojson tree path =
  list_of_yojson stored_query_metadata_of_yojson tree path

let list_stored_queries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stored_query_metadata =
       option_of_yojson
         (value_for_key stored_query_metadata_list_of_yojson "StoredQueryMetadata")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_stored_queries_response)

let list_stored_queries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key limit_of_yojson "MaxResults") _list path;
   }
    : list_stored_queries_request)

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key tag_key_of_yojson "Key") _list path;
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_tags_for_resource_request)

let max_active_resources_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : max_active_resources_exceeded_exception)

let max_number_of_config_rules_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : max_number_of_config_rules_exceeded_exception)

let max_number_of_configuration_recorders_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : max_number_of_configuration_recorders_exceeded_exception)

let max_number_of_conformance_packs_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : max_number_of_conformance_packs_exceeded_exception)

let max_number_of_delivery_channels_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : max_number_of_delivery_channels_exceeded_exception)

let max_number_of_organization_config_rules_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : max_number_of_organization_config_rules_exceeded_exception)

let max_number_of_organization_conformance_packs_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : max_number_of_organization_conformance_packs_exceeded_exception)

let max_number_of_retention_configurations_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : max_number_of_retention_configurations_exceeded_exception)

let no_available_delivery_channel_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_available_delivery_channel_exception)

let no_available_organization_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_available_organization_exception)

let no_such_bucket_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_such_bucket_exception)

let organization_all_features_not_enabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : organization_all_features_not_enabled_exception)

let organization_conformance_pack_template_validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : organization_conformance_pack_template_validation_exception)

let organization_custom_policy_rule_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson
         (value_for_key string_with_char_limit256_min0_of_yojson "Description")
         _list path;
     organization_config_rule_trigger_types =
       option_of_yojson
         (value_for_key organization_config_rule_trigger_type_no_s_ns_of_yojson
            "OrganizationConfigRuleTriggerTypes")
         _list path;
     input_parameters =
       option_of_yojson
         (value_for_key string_with_char_limit1024_of_yojson "InputParameters")
         _list path;
     maximum_execution_frequency =
       option_of_yojson
         (value_for_key maximum_execution_frequency_of_yojson "MaximumExecutionFrequency")
         _list path;
     resource_types_scope =
       option_of_yojson
         (value_for_key resource_types_scope_of_yojson "ResourceTypesScope")
         _list path;
     resource_id_scope =
       option_of_yojson
         (value_for_key string_with_char_limit768_of_yojson "ResourceIdScope")
         _list path;
     tag_key_scope =
       option_of_yojson (value_for_key string_with_char_limit128_of_yojson "TagKeyScope") _list path;
     tag_value_scope =
       option_of_yojson
         (value_for_key string_with_char_limit256_of_yojson "TagValueScope")
         _list path;
     policy_runtime = value_for_key policy_runtime_of_yojson "PolicyRuntime" _list path;
     policy_text = value_for_key policy_text_of_yojson "PolicyText" _list path;
     debug_log_delivery_accounts =
       option_of_yojson
         (value_for_key debug_log_delivery_accounts_of_yojson "DebugLogDeliveryAccounts")
         _list path;
   }
    : organization_custom_policy_rule_metadata)

let put_aggregation_authorization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregation_authorization =
       option_of_yojson
         (value_for_key aggregation_authorization_of_yojson "AggregationAuthorization")
         _list path;
   }
    : put_aggregation_authorization_response)

let tags_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let put_aggregation_authorization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authorized_account_id = value_for_key account_id_of_yojson "AuthorizedAccountId" _list path;
     authorized_aws_region = value_for_key aws_region_of_yojson "AuthorizedAwsRegion" _list path;
     tags = option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list path;
   }
    : put_aggregation_authorization_request)

let put_config_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule = value_for_key config_rule_of_yojson "ConfigRule" _list path;
     tags = option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list path;
   }
    : put_config_rule_request)

let put_configuration_aggregator_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator =
       option_of_yojson
         (value_for_key configuration_aggregator_of_yojson "ConfigurationAggregator")
         _list path;
   }
    : put_configuration_aggregator_response)

let put_configuration_aggregator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_aggregator_name =
       value_for_key configuration_aggregator_name_of_yojson "ConfigurationAggregatorName" _list
         path;
     account_aggregation_sources =
       option_of_yojson
         (value_for_key account_aggregation_source_list_of_yojson "AccountAggregationSources")
         _list path;
     organization_aggregation_source =
       option_of_yojson
         (value_for_key organization_aggregation_source_of_yojson "OrganizationAggregationSource")
         _list path;
     tags = option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list path;
     aggregator_filters =
       option_of_yojson (value_for_key aggregator_filters_of_yojson "AggregatorFilters") _list path;
   }
    : put_configuration_aggregator_request)

let put_configuration_recorder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder =
       value_for_key configuration_recorder_of_yojson "ConfigurationRecorder" _list path;
     tags = option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list path;
   }
    : put_configuration_recorder_request)

let put_conformance_pack_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_arn =
       option_of_yojson
         (value_for_key conformance_pack_arn_of_yojson "ConformancePackArn")
         _list path;
   }
    : put_conformance_pack_response)

let template_body_of_yojson = string_of_yojson
let template_s3_uri_of_yojson = string_of_yojson

let put_conformance_pack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conformance_pack_name =
       value_for_key conformance_pack_name_of_yojson "ConformancePackName" _list path;
     template_s3_uri =
       option_of_yojson (value_for_key template_s3_uri_of_yojson "TemplateS3Uri") _list path;
     template_body =
       option_of_yojson (value_for_key template_body_of_yojson "TemplateBody") _list path;
     delivery_s3_bucket =
       option_of_yojson (value_for_key delivery_s3_bucket_of_yojson "DeliveryS3Bucket") _list path;
     delivery_s3_key_prefix =
       option_of_yojson
         (value_for_key delivery_s3_key_prefix_of_yojson "DeliveryS3KeyPrefix")
         _list path;
     conformance_pack_input_parameters =
       option_of_yojson
         (value_for_key conformance_pack_input_parameters_of_yojson "ConformancePackInputParameters")
         _list path;
     template_ssm_document_details =
       option_of_yojson
         (value_for_key template_ssm_document_details_of_yojson "TemplateSSMDocumentDetails")
         _list path;
     tags = option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list path;
   }
    : put_conformance_pack_request)

let put_delivery_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ delivery_channel = value_for_key delivery_channel_of_yojson "DeliveryChannel" _list path }
    : put_delivery_channel_request)

let put_evaluations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_evaluations =
       option_of_yojson (value_for_key evaluations_of_yojson "FailedEvaluations") _list path;
   }
    : put_evaluations_response)

let put_evaluations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluations = option_of_yojson (value_for_key evaluations_of_yojson "Evaluations") _list path;
     result_token = value_for_key string__of_yojson "ResultToken" _list path;
     test_mode = option_of_yojson (value_for_key boolean__of_yojson "TestMode") _list path;
   }
    : put_evaluations_request)

let put_external_evaluation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let put_external_evaluation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name = value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path;
     external_evaluation =
       value_for_key external_evaluation_of_yojson "ExternalEvaluation" _list path;
   }
    : put_external_evaluation_request)

let put_organization_config_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_config_rule_arn =
       option_of_yojson
         (value_for_key string_with_char_limit256_of_yojson "OrganizationConfigRuleArn")
         _list path;
   }
    : put_organization_config_rule_response)

let put_organization_config_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_config_rule_name =
       value_for_key organization_config_rule_name_of_yojson "OrganizationConfigRuleName" _list path;
     organization_managed_rule_metadata =
       option_of_yojson
         (value_for_key organization_managed_rule_metadata_of_yojson
            "OrganizationManagedRuleMetadata")
         _list path;
     organization_custom_rule_metadata =
       option_of_yojson
         (value_for_key organization_custom_rule_metadata_of_yojson "OrganizationCustomRuleMetadata")
         _list path;
     excluded_accounts =
       option_of_yojson (value_for_key excluded_accounts_of_yojson "ExcludedAccounts") _list path;
     organization_custom_policy_rule_metadata =
       option_of_yojson
         (value_for_key organization_custom_policy_rule_metadata_of_yojson
            "OrganizationCustomPolicyRuleMetadata")
         _list path;
     tags = option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list path;
   }
    : put_organization_config_rule_request)

let put_organization_conformance_pack_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_conformance_pack_arn =
       option_of_yojson
         (value_for_key string_with_char_limit256_of_yojson "OrganizationConformancePackArn")
         _list path;
   }
    : put_organization_conformance_pack_response)

let put_organization_conformance_pack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_conformance_pack_name =
       value_for_key organization_conformance_pack_name_of_yojson "OrganizationConformancePackName"
         _list path;
     template_s3_uri =
       option_of_yojson (value_for_key template_s3_uri_of_yojson "TemplateS3Uri") _list path;
     template_body =
       option_of_yojson (value_for_key template_body_of_yojson "TemplateBody") _list path;
     delivery_s3_bucket =
       option_of_yojson (value_for_key delivery_s3_bucket_of_yojson "DeliveryS3Bucket") _list path;
     delivery_s3_key_prefix =
       option_of_yojson
         (value_for_key delivery_s3_key_prefix_of_yojson "DeliveryS3KeyPrefix")
         _list path;
     conformance_pack_input_parameters =
       option_of_yojson
         (value_for_key conformance_pack_input_parameters_of_yojson "ConformancePackInputParameters")
         _list path;
     excluded_accounts =
       option_of_yojson (value_for_key excluded_accounts_of_yojson "ExcludedAccounts") _list path;
     tags = option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list path;
   }
    : put_organization_conformance_pack_request)

let put_remediation_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_batches =
       option_of_yojson
         (value_for_key failed_remediation_batches_of_yojson "FailedBatches")
         _list path;
   }
    : put_remediation_configurations_response)

let put_remediation_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remediation_configurations =
       value_for_key remediation_configurations_of_yojson "RemediationConfigurations" _list path;
   }
    : put_remediation_configurations_request)

let put_remediation_exceptions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_batches =
       option_of_yojson
         (value_for_key failed_remediation_exception_batches_of_yojson "FailedBatches")
         _list path;
   }
    : put_remediation_exceptions_response)

let put_remediation_exceptions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name = value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path;
     resource_keys =
       value_for_key remediation_exception_resource_keys_of_yojson "ResourceKeys" _list path;
     message =
       option_of_yojson (value_for_key string_with_char_limit1024_of_yojson "Message") _list path;
     expiration_time = option_of_yojson (value_for_key date_of_yojson "ExpirationTime") _list path;
   }
    : put_remediation_exceptions_request)

let schema_version_id_of_yojson = string_of_yojson

let put_resource_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_string_of_yojson "ResourceType" _list path;
     schema_version_id = value_for_key schema_version_id_of_yojson "SchemaVersionId" _list path;
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
     resource_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ResourceName") _list path;
     configuration = value_for_key configuration_of_yojson "Configuration" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : put_resource_config_request)

let put_retention_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retention_configuration =
       option_of_yojson
         (value_for_key retention_configuration_of_yojson "RetentionConfiguration")
         _list path;
   }
    : put_retention_configuration_response)

let put_retention_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retention_period_in_days =
       value_for_key retention_period_in_days_of_yojson "RetentionPeriodInDays" _list path;
   }
    : put_retention_configuration_request)

let put_service_linked_configuration_recorder_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key amazon_resource_name_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key recorder_name_of_yojson "Name") _list path;
   }
    : put_service_linked_configuration_recorder_response)

let put_service_linked_configuration_recorder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_principal = value_for_key service_principal_of_yojson "ServicePrincipal" _list path;
     tags = option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list path;
   }
    : put_service_linked_configuration_recorder_request)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : too_many_tags_exception)

let resource_concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_concurrent_modification_exception)

let put_stored_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ query_arn = option_of_yojson (value_for_key query_arn_of_yojson "QueryArn") _list path }
    : put_stored_query_response)

let put_stored_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stored_query = value_for_key stored_query_of_yojson "StoredQuery" _list path;
     tags = option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list path;
   }
    : put_stored_query_request)

let query_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     select_fields =
       option_of_yojson (value_for_key field_info_list_of_yojson "SelectFields") _list path;
   }
    : query_info)

let reevaluate_config_rule_names_of_yojson tree path =
  list_of_yojson config_rule_name_of_yojson tree path

let results_of_yojson tree path = list_of_yojson string__of_yojson tree path

let select_aggregate_resource_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     results = option_of_yojson (value_for_key results_of_yojson "Results") _list path;
     query_info = option_of_yojson (value_for_key query_info_of_yojson "QueryInfo") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : select_aggregate_resource_config_response)

let select_aggregate_resource_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expression = value_for_key expression_of_yojson "Expression" _list path;
     configuration_aggregator_name =
       value_for_key configuration_aggregator_name_of_yojson "ConfigurationAggregatorName" _list
         path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
     max_results = option_of_yojson (value_for_key limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : select_aggregate_resource_config_request)

let select_resource_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     results = option_of_yojson (value_for_key results_of_yojson "Results") _list path;
     query_info = option_of_yojson (value_for_key query_info_of_yojson "QueryInfo") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : select_resource_config_response)

let select_resource_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expression = value_for_key expression_of_yojson "Expression" _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : select_resource_config_request)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let stop_configuration_recorder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder_name =
       value_for_key recorder_name_of_yojson "ConfigurationRecorderName" _list path;
   }
    : stop_configuration_recorder_request)

let start_resource_evaluation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_evaluation_id =
       option_of_yojson
         (value_for_key resource_evaluation_id_of_yojson "ResourceEvaluationId")
         _list path;
   }
    : start_resource_evaluation_response)

let start_resource_evaluation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_details = value_for_key resource_details_of_yojson "ResourceDetails" _list path;
     evaluation_context =
       option_of_yojson (value_for_key evaluation_context_of_yojson "EvaluationContext") _list path;
     evaluation_mode = value_for_key evaluation_mode_of_yojson "EvaluationMode" _list path;
     evaluation_timeout =
       option_of_yojson (value_for_key evaluation_timeout_of_yojson "EvaluationTimeout") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
   }
    : start_resource_evaluation_request)

let start_remediation_execution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_message =
       option_of_yojson (value_for_key string__of_yojson "FailureMessage") _list path;
     failed_items =
       option_of_yojson (value_for_key resource_keys_of_yojson "FailedItems") _list path;
   }
    : start_remediation_execution_response)

let start_remediation_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_name = value_for_key config_rule_name_of_yojson "ConfigRuleName" _list path;
     resource_keys = value_for_key resource_keys_of_yojson "ResourceKeys" _list path;
   }
    : start_remediation_execution_request)

let start_configuration_recorder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_recorder_name =
       value_for_key recorder_name_of_yojson "ConfigurationRecorderName" _list path;
   }
    : start_configuration_recorder_request)

let start_config_rules_evaluation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let start_config_rules_evaluation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_rule_names =
       option_of_yojson
         (value_for_key reevaluate_config_rule_names_of_yojson "ConfigRuleNames")
         _list path;
   }
    : start_config_rules_evaluation_request)
