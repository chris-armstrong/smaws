type nonrec workflow_target_action =
  | POST_RECOVERY [@ocaml.doc ""]
  | DEACTIVATE [@ocaml.doc ""]
  | ACTIVATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec step_name = string [@@ocaml.doc ""]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec lambda_arn = string [@@ocaml.doc ""]

type nonrec lambdas = {
  arn : lambda_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the Lambda function.\n"]
  external_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The external ID (secret key) for the configuration.\n"]
  cross_account_role : iam_role_arn option;
      [@ocaml.doc "The cross account role for the configuration.\n"]
}
[@@ocaml.doc
  "Configuration for Amazon Web Services Lambda functions used in a Region switch plan.\n"]

type nonrec lambda_list = lambdas list [@@ocaml.doc ""]

type nonrec region_to_run_in =
  | INACTIVE_REGION [@ocaml.doc ""]
  | ACTIVE_REGION [@ocaml.doc ""]
  | DEACTIVATING_REGION [@ocaml.doc ""]
  | ACTIVATING_REGION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lambda_ungraceful_behavior = SKIP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec lambda_ungraceful = {
  behavior : lambda_ungraceful_behavior option;
      [@ocaml.doc "The ungraceful behavior for a Lambda function, which must be set to [skip].\n"]
}
[@@ocaml.doc "Configuration for handling failures when invoking Lambda functions.\n"]

type nonrec custom_action_lambda_configuration = {
  ungraceful : lambda_ungraceful option; [@ocaml.doc "The settings for ungraceful execution.\n"]
  region_to_run : region_to_run_in;
      [@ocaml.doc
        "The Amazon Web Services Region for the function to run in. For recovery workflows use \
         [activatingRegion] or [deactivatingRegion]. For post-recovery workflows, use \
         [activeRegion] (the Region with customer traffic) or [inactiveRegion] (the Region with no \
         customer traffic).\n"]
  retry_interval_minutes : Smaws_Lib.Smithy_api.Types.float_;
      [@ocaml.doc "The retry interval specified.\n"]
  lambdas : lambda_list;
      [@ocaml.doc "The Amazon Web Services Lambda functions for the execution block.\n"]
  timeout_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The timeout value specified for the configuration.\n"]
}
[@@ocaml.doc
  "Configuration for Amazon Web Services Lambda functions that perform custom actions during a \
   Region switch.\n"]

type nonrec asg_arn = string [@@ocaml.doc ""]

type nonrec asg = {
  arn : asg_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the EC2 Auto Scaling group.\n"]
  external_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The external ID (secret key) for the configuration.\n"]
  cross_account_role : iam_role_arn option;
      [@ocaml.doc "The cross account role for the configuration.\n"]
}
[@@ocaml.doc "Configuration for an Amazon EC2 Auto Scaling group used in a Region switch plan.\n"]

type nonrec asg_list = asg list [@@ocaml.doc ""]

type nonrec ec2_ungraceful = {
  minimum_success_percentage : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The minimum success percentage that you specify for EC2 Auto Scaling groups.\n"]
}
[@@ocaml.doc "Configuration for handling failures when performing operations on EC2 resources.\n"]

type nonrec ec2_asg_capacity_monitoring_approach =
  | AUTOSCALING_MAX_IN_LAST_24_HOURS [@ocaml.doc ""]
  | SAMPLED_MAX_IN_LAST_24_HOURS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ec2_asg_capacity_increase_configuration = {
  capacity_monitoring_approach : ec2_asg_capacity_monitoring_approach option;
      [@ocaml.doc
        "The monitoring approach that you specify EC2 Auto Scaling groups for the configuration.\n"]
  target_percent : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The target percentage that you specify for EC2 Auto Scaling groups. The default is 100.\n"]
  ungraceful : ec2_ungraceful option; [@ocaml.doc "The settings for ungraceful execution.\n"]
  asgs : asg_list; [@ocaml.doc "The EC2 Auto Scaling groups for the configuration.\n"]
  timeout_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The timeout value specified for the configuration.\n"]
}
[@@ocaml.doc
  "Configuration for increasing the capacity of Amazon EC2 Auto Scaling groups during a Region \
   switch.\n"]

type nonrec role_arn = string [@@ocaml.doc ""]

type nonrec execution_approval_configuration = {
  approval_role : role_arn; [@ocaml.doc "The IAM approval role for the configuration.\n"]
  timeout_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The timeout value specified for the configuration.\n"]
}
[@@ocaml.doc
  "Configuration for approval steps in a Region switch plan execution. Approval steps require \
   manual intervention before the execution can proceed.\n"]

type nonrec routing_control_arn = string [@@ocaml.doc ""]

type nonrec routing_control_state_change = OFF [@ocaml.doc ""] | ON [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec arc_routing_control_state = {
  state : routing_control_state_change;
      [@ocaml.doc "The state of an ARC routing control, On or Off.\n"]
  routing_control_arn : routing_control_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a routing control.\n"]
}
[@@ocaml.doc "Represents the state of an ARC routing control.\n"]

type nonrec arc_routing_control_states = arc_routing_control_state list [@@ocaml.doc ""]

type nonrec region_and_routing_controls =
  (Smaws_Lib.Smithy_api.Types.string_ * arc_routing_control_states) list
[@@ocaml.doc ""]

type nonrec arc_routing_control_configuration = {
  region_and_routing_controls : region_and_routing_controls;
      [@ocaml.doc "The Region and ARC routing controls for the configuration.\n"]
  external_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The external ID (secret key) for the configuration.\n"]
  cross_account_role : iam_role_arn option;
      [@ocaml.doc "The cross account role for the configuration.\n"]
  timeout_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The timeout value specified for the configuration.\n"]
}
[@@ocaml.doc
  "Configuration for ARC routing controls used in a Region switch plan. Routing controls are \
   simple on/off switches that you can use to shift traffic away from an impaired Region.\n"]

type nonrec global_aurora_default_behavior =
  | FAILOVER [@ocaml.doc ""]
  | SWITCHOVER_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec global_aurora_ungraceful_behavior = FAILOVER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec global_aurora_ungraceful = {
  ungraceful : global_aurora_ungraceful_behavior option;
      [@ocaml.doc "The settings for ungraceful execution.\n"]
}
[@@ocaml.doc
  "Configuration for handling failures when performing operations on Aurora global databases.\n"]

type nonrec global_cluster_identifier = string [@@ocaml.doc ""]

type nonrec aurora_cluster_arn = string [@@ocaml.doc ""]

type nonrec aurora_cluster_arns = aurora_cluster_arn list [@@ocaml.doc ""]

type nonrec global_aurora_configuration = {
  database_cluster_arns : aurora_cluster_arns;
      [@ocaml.doc "The database cluster Amazon Resource Names (ARNs) for a global database.\n"]
  global_cluster_identifier : global_cluster_identifier;
      [@ocaml.doc "The global cluster identifier for a global database.\n"]
  ungraceful : global_aurora_ungraceful option;
      [@ocaml.doc "The settings for ungraceful execution.\n"]
  behavior : global_aurora_default_behavior;
      [@ocaml.doc
        "The behavior for a global database, that is, only allow switchover or also allow failover.\n"]
  external_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The external ID (secret key) for the configuration.\n"]
  cross_account_role : iam_role_arn option;
      [@ocaml.doc "The cross account role for the configuration.\n"]
  timeout_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The timeout value specified for the configuration.\n"]
}
[@@ocaml.doc "Configuration for Amazon Aurora global databases used in a Region switch plan.\n"]

type nonrec plan_arn = string [@@ocaml.doc ""]

type nonrec region_switch_plan_configuration = {
  arn : plan_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the plan configuration.\n"]
  external_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The external ID (secret key) for the configuration.\n"]
  cross_account_role : iam_role_arn option;
      [@ocaml.doc "The cross account role for the configuration.\n"]
}
[@@ocaml.doc
  "Configuration for nested Region switch plans. This allows one Region switch plan to trigger \
   another plan as part of its execution.\n"]

type nonrec ecs_cluster_arn = string [@@ocaml.doc ""]

type nonrec ecs_service_arn = string [@@ocaml.doc ""]

type nonrec service = {
  service_arn : ecs_service_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for a service.\n"]
  cluster_arn : ecs_cluster_arn option;
      [@ocaml.doc "The cluster Amazon Resource Name (ARN) for a service.\n"]
  external_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The external ID (secret key) for the service.\n"]
  cross_account_role : iam_role_arn option; [@ocaml.doc "The cross account role for a service.\n"]
}
[@@ocaml.doc "The service for a cross account role.\n"]

type nonrec service_list = service list [@@ocaml.doc ""]

type nonrec ecs_ungraceful = {
  minimum_success_percentage : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The minimum success percentage specified for the configuration.\n"]
}
[@@ocaml.doc "The settings for ungraceful execution.\n"]

type nonrec ecs_capacity_monitoring_approach =
  | CONTAINER_INSIGHTS_MAX_IN_LAST_24_HOURS [@ocaml.doc ""]
  | SAMPLED_MAX_IN_LAST_24_HOURS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ecs_capacity_increase_configuration = {
  capacity_monitoring_approach : ecs_capacity_monitoring_approach option;
      [@ocaml.doc
        "The monitoring approach specified for the configuration, for example, [Most_Recent].\n"]
  target_percent : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The target percentage specified for the configuration. The default is 100.\n"]
  ungraceful : ecs_ungraceful option; [@ocaml.doc "The settings for ungraceful execution.\n"]
  services : service_list; [@ocaml.doc "The services specified for the configuration.\n"]
  timeout_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The timeout value specified for the configuration.\n"]
}
[@@ocaml.doc "The configuration for an Amazon Web Services ECS capacity increase.\n"]

type nonrec kubernetes_resource_type = {
  kind : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The kind for the Kubernetes resource.\n"]
  api_version : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The API version type for the Kubernetes resource.\n"]
}
[@@ocaml.doc "Defines the type of Kubernetes resource to scale in an Amazon EKS cluster.\n"]

type nonrec kubernetes_namespace = string [@@ocaml.doc ""]

type nonrec kubernetes_scaling_resource = {
  hpa_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The hpaname for the Kubernetes resource.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The name for the Kubernetes resource.\n"]
  namespace : kubernetes_namespace; [@ocaml.doc "The namespace for the Kubernetes resource.\n"]
}
[@@ocaml.doc "Defines a Kubernetes resource to scale in an Amazon EKS cluster.\n"]

type nonrec region = string [@@ocaml.doc ""]

type nonrec regional_scaling_resource = (region * kubernetes_scaling_resource) list [@@ocaml.doc ""]

type nonrec kubernetes_scaling_application =
  (Smaws_Lib.Smithy_api.Types.string_ * regional_scaling_resource) list
[@@ocaml.doc ""]

type nonrec kubernetes_scaling_apps = kubernetes_scaling_application list [@@ocaml.doc ""]

type nonrec eks_cluster_arn = string [@@ocaml.doc ""]

type nonrec eks_cluster = {
  cluster_arn : eks_cluster_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of an Amazon Web Services EKS cluster.\n"]
  external_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The external ID (secret key) for the configuration.\n"]
  cross_account_role : iam_role_arn option;
      [@ocaml.doc "The cross account role for the configuration.\n"]
}
[@@ocaml.doc "The Amazon Web Services EKS cluster execution block configuration.\n"]

type nonrec eks_clusters = eks_cluster list [@@ocaml.doc ""]

type nonrec eks_resource_scaling_ungraceful = {
  minimum_success_percentage : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The minimum success percentage for the configuration.\n"]
}
[@@ocaml.doc "The ungraceful settings for Amazon Web Services EKS resource scaling.\n"]

type nonrec eks_capacity_monitoring_approach = SAMPLED_MAX_IN_LAST_24_HOURS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec eks_resource_scaling_configuration = {
  capacity_monitoring_approach : eks_capacity_monitoring_approach option;
      [@ocaml.doc
        "The monitoring approach for the configuration, that is, whether it was sampled in the \
         last 24 hours or autoscaled in the last 24 hours.\n"]
  target_percent : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The target percentage for the configuration. The default is 100.\n"]
  ungraceful : eks_resource_scaling_ungraceful option;
      [@ocaml.doc "The settings for ungraceful execution.\n"]
  eks_clusters : eks_clusters option; [@ocaml.doc "The clusters for the configuration.\n"]
  scaling_resources : kubernetes_scaling_apps option;
      [@ocaml.doc "The scaling resources for the configuration.\n"]
  kubernetes_resource_type : kubernetes_resource_type;
      [@ocaml.doc "The Kubernetes resource type for the configuration.\n"]
  timeout_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The timeout value specified for the configuration.\n"]
}
[@@ocaml.doc "The Amazon Web Services EKS resource scaling configuration.\n"]

type nonrec route53_hosted_zone_id = string [@@ocaml.doc ""]

type nonrec route53_record_name = string [@@ocaml.doc ""]

type nonrec route53_resource_record_set_identifier = string [@@ocaml.doc ""]

type nonrec route53_resource_record_set = {
  region : region option; [@ocaml.doc "The Amazon Route 53 record set Region.\n"]
  record_set_identifier : route53_resource_record_set_identifier option;
      [@ocaml.doc "The Amazon Route 53 record set identifier.\n"]
}
[@@ocaml.doc "The Amazon Route 53 record set.\n"]

type nonrec route53_resource_record_set_list = route53_resource_record_set list [@@ocaml.doc ""]

type nonrec route53_health_check_configuration = {
  record_sets : route53_resource_record_set_list option;
      [@ocaml.doc "The Amazon Route 53 health check configuration record sets.\n"]
  record_name : route53_record_name;
      [@ocaml.doc "The Amazon Route 53 health check configuration record name.\n"]
  hosted_zone_id : route53_hosted_zone_id;
      [@ocaml.doc "The Amazon Route 53 health check configuration hosted zone ID.\n"]
  external_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The external ID (secret key) for the configuration.\n"]
  cross_account_role : iam_role_arn option;
      [@ocaml.doc "The cross account role for the configuration.\n"]
  timeout_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The Amazon Route 53 health check configuration time out (in minutes).\n"]
}
[@@ocaml.doc "The Amazon Route 53 health check configuration.\n"]

type nonrec document_db_default_behavior =
  | FAILOVER [@ocaml.doc ""]
  | SWITCHOVER_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec document_db_ungraceful_behavior = FAILOVER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec document_db_ungraceful = {
  ungraceful : document_db_ungraceful_behavior option;
      [@ocaml.doc "The settings for ungraceful execution.\n"]
}
[@@ocaml.doc
  "Configuration for handling failures when performing operations on DocumentDB global clusters.\n"]

type nonrec document_db_global_cluster_identifier = string [@@ocaml.doc ""]

type nonrec document_db_cluster_arn = string [@@ocaml.doc ""]

type nonrec document_db_cluster_arns = document_db_cluster_arn list [@@ocaml.doc ""]

type nonrec document_db_configuration = {
  database_cluster_arns : document_db_cluster_arns;
      [@ocaml.doc
        "The database cluster Amazon Resource Names (ARNs) for a DocumentDB global cluster.\n"]
  global_cluster_identifier : document_db_global_cluster_identifier;
      [@ocaml.doc "The global cluster identifier for a DocumentDB global cluster.\n"]
  ungraceful : document_db_ungraceful option;
      [@ocaml.doc "The settings for ungraceful execution.\n"]
  behavior : document_db_default_behavior;
      [@ocaml.doc
        "The behavior for a global cluster, that is, only allow switchover or also allow failover.\n"]
  external_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The external ID (secret key) for the configuration.\n"]
  cross_account_role : iam_role_arn option;
      [@ocaml.doc "The cross account role for the configuration.\n"]
  timeout_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The timeout value specified for the configuration.\n"]
}
[@@ocaml.doc "Configuration for Amazon DocumentDB global clusters used in a Region switch plan.\n"]

type nonrec rds_db_instance_arn = string [@@ocaml.doc ""]

type nonrec rds_db_instance_arn_map = (region * rds_db_instance_arn) list [@@ocaml.doc ""]

type nonrec rds_promote_read_replica_configuration = {
  db_instance_arn_map : rds_db_instance_arn_map;
      [@ocaml.doc "A map of database instance ARNs for each Region in the plan.\n"]
  external_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The external ID (secret key) for the configuration.\n"]
  cross_account_role : iam_role_arn option;
      [@ocaml.doc "The cross-account role for the configuration.\n"]
  timeout_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The timeout value specified for the configuration.\n"]
}
[@@ocaml.doc
  "Configuration for promoting an Amazon RDS read replica to a standalone database instance during \
   a Region switch.\n"]

type nonrec rds_create_cross_region_replica_configuration = {
  db_instance_arn_map : rds_db_instance_arn_map;
      [@ocaml.doc "A map of database instance ARNs for each Region in the plan.\n"]
  external_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The external ID (secret key) for the configuration.\n"]
  cross_account_role : iam_role_arn option;
      [@ocaml.doc "The cross-account role for the configuration.\n"]
  timeout_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The timeout value specified for the configuration.\n"]
}
[@@ocaml.doc
  "Configuration for creating an Amazon RDS cross-Region read replica during post-recovery in a \
   Region switch.\n"]

type nonrec event_source_mapping_action = DISABLE [@ocaml.doc ""] | ENABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_source_mapping_arn = string [@@ocaml.doc ""]

type nonrec event_source_mapping = {
  arn : event_source_mapping_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Lambda event source mapping.\n"]
  external_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The external ID (secret key) for the configuration.\n"]
  cross_account_role : iam_role_arn option;
      [@ocaml.doc "The cross account role for the configuration.\n"]
}
[@@ocaml.doc
  "The Amazon Web Services Lambda event source mapping configuration, containing the resource ARN \
   and optional cross-account configuration.\n"]

type nonrec region_event_source_mapping_map = (region * event_source_mapping) list [@@ocaml.doc ""]

type nonrec lambda_event_source_mapping_ungraceful_behavior = SKIP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lambda_event_source_mapping_ungraceful = {
  behavior : lambda_event_source_mapping_ungraceful_behavior option;
      [@ocaml.doc
        "Set to [skip] to skip executing this event source mapping step during an ungraceful \
         execution.\n"]
}
[@@ocaml.doc
  "Specifies whether to skip enabling or disabling an event source mapping during an ungraceful \
   execution.\n"]

type nonrec lambda_event_source_mapping_configuration = {
  ungraceful : lambda_event_source_mapping_ungraceful option;
      [@ocaml.doc "The settings for ungraceful execution.\n"]
  region_event_source_mappings : region_event_source_mapping_map;
      [@ocaml.doc
        "Per-region configuration for which Lambda event source mapping to enable or disable when \
         activating or deactivating a region.\n"]
  action : event_source_mapping_action;
      [@ocaml.doc
        "The action to take - whether to [enable] or [disable] an event source mapping.\n"]
  timeout_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The timeout value specified for the configuration.\n"]
}
[@@ocaml.doc
  "Configuration for Amazon Web Services Lambda event source mappings used in a Region switch plan.\n"]

type nonrec region_aurora_cluster_map = (region * aurora_cluster_arn) list
[@@ocaml.doc
  "A map of Region to Aurora database cluster ARN for Aurora Serverless scaling configuration.\n"]

type nonrec aurora_serverless_scaling_configuration = {
  target_percent : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The target capacity percentage for Aurora Serverless scaling.\n"]
  region_database_cluster_arns : region_aurora_cluster_map;
      [@ocaml.doc
        "Per-Region configuration that maps each Region to the Aurora database cluster ARN for \
         scaling.\n"]
  global_cluster_identifier : global_cluster_identifier;
      [@ocaml.doc "The global cluster identifier for a global database.\n"]
  external_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The external ID (secret key) for the configuration.\n"]
  cross_account_role : iam_role_arn option;
      [@ocaml.doc "The cross account role for the configuration.\n"]
  timeout_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The timeout value specified for the configuration.\n"]
}
[@@ocaml.doc "Configuration for Amazon Aurora Serverless scaling used in a Region switch plan.\n"]

type nonrec aurora_instance_arn = string [@@ocaml.doc ""]

type nonrec region_aurora_instance_arn_map = (region * aurora_instance_arn) list [@@ocaml.doc ""]

type nonrec aurora_provisioned_scaling_configuration = {
  instance_arns : region_aurora_instance_arn_map;
      [@ocaml.doc
        "Per-Region configuration that maps each Region to the Aurora database instance ARN for \
         scaling.\n"]
  region_database_cluster_arns : region_aurora_cluster_map;
      [@ocaml.doc
        "Per-Region configuration that maps each Region to the Aurora database cluster ARN for \
         scaling.\n"]
  global_cluster_identifier : global_cluster_identifier;
      [@ocaml.doc "The global cluster identifier for a global database.\n"]
  external_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The external ID (secret key) for the configuration.\n"]
  cross_account_role : iam_role_arn option;
      [@ocaml.doc "The cross account role for the configuration.\n"]
  timeout_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The timeout value specified for the configuration.\n"]
}
[@@ocaml.doc
  "Configuration for Amazon Aurora provisioned cluster scaling used in a Region switch plan.\n"]

type nonrec neptune_default_behavior = FAILOVER [@ocaml.doc ""] | SWITCHOVER_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec neptune_ungraceful_behavior = FAILOVER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec neptune_ungraceful = {
  ungraceful : neptune_ungraceful_behavior option;
      [@ocaml.doc "The settings for ungraceful execution.\n"]
}
[@@ocaml.doc
  "Configuration for handling failures when performing operations on Neptune global databases.\n"]

type nonrec neptune_global_cluster_identifier = string [@@ocaml.doc ""]

type nonrec neptune_cluster_arn = string [@@ocaml.doc ""]

type nonrec region_neptune_cluster_arn_map = (region * neptune_cluster_arn) list
[@@ocaml.doc
  "A map of Region to Neptune database cluster ARN for Neptune global database configuration.\n"]

type nonrec neptune_global_database_configuration = {
  region_database_cluster_arns : region_neptune_cluster_arn_map;
      [@ocaml.doc
        "The database cluster Amazon Resource Names (ARNs) for a Neptune global database.\n"]
  global_cluster_identifier : neptune_global_cluster_identifier;
      [@ocaml.doc "The global cluster identifier for a Neptune global database.\n"]
  ungraceful : neptune_ungraceful option; [@ocaml.doc "The settings for ungraceful execution.\n"]
  behavior : neptune_default_behavior;
      [@ocaml.doc
        "The behavior for a global database, that is, only allow switchover or also allow failover.\n"]
  external_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The external ID (secret key) for the configuration.\n"]
  cross_account_role : iam_role_arn option;
      [@ocaml.doc "The cross account role for the configuration.\n"]
  timeout_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The timeout value specified for the configuration.\n"]
}
[@@ocaml.doc "Configuration for Amazon Neptune global databases used in a Region switch plan.\n"]

type nonrec execution_block_type =
  | NEPTUNE [@ocaml.doc ""]
  | AURORA_PROVISIONED_SCALING [@ocaml.doc ""]
  | AURORA_SERVERLESS_SCALING [@ocaml.doc ""]
  | LAMBDA_EVENT_SOURCE_MAPPING [@ocaml.doc ""]
  | RDS_CREATE_CROSS_REGION_REPLICA [@ocaml.doc ""]
  | RDS_PROMOTE_READ_REPLICA [@ocaml.doc ""]
  | DOCUMENTDB [@ocaml.doc ""]
  | ROUTE53_HEALTH_CHECK [@ocaml.doc ""]
  | EKS_RESOURCE_SCALING [@ocaml.doc ""]
  | ECS [@ocaml.doc ""]
  | PARALLEL [@ocaml.doc ""]
  | REGION_SWITCH [@ocaml.doc ""]
  | ROUTING_CONTROL [@ocaml.doc ""]
  | EC2_ASG [@ocaml.doc ""]
  | AURORA [@ocaml.doc ""]
  | EXECUTION_APPROVAL [@ocaml.doc ""]
  | CUSTOM_ACTION_LAMBDA [@ocaml.doc ""]
[@@ocaml.doc ""]

type execution_block_configuration =
  | NeptuneGlobalDatabaseConfig of neptune_global_database_configuration
      [@ocaml.doc "A Neptune global database execution block.\n"]
  | AuroraProvisionedScalingConfig of aurora_provisioned_scaling_configuration
      [@ocaml.doc "An Aurora provisioned cluster scaling execution block.\n"]
  | AuroraServerlessScalingConfig of aurora_serverless_scaling_configuration
      [@ocaml.doc "An Aurora Serverless scaling execution block.\n"]
  | LambdaEventSourceMappingConfig of lambda_event_source_mapping_configuration
      [@ocaml.doc "A Lambda event source mapping execution block.\n"]
  | RdsCreateCrossRegionReadReplicaConfig of rds_create_cross_region_replica_configuration
      [@ocaml.doc "An Amazon RDS create cross-Region replica execution block.\n"]
  | RdsPromoteReadReplicaConfig of rds_promote_read_replica_configuration
      [@ocaml.doc "An Amazon RDS promote read replica execution block.\n"]
  | DocumentDbConfig of document_db_configuration [@ocaml.doc ""]
  | Route53HealthCheckConfig of route53_health_check_configuration
      [@ocaml.doc "The Amazon Route 53 health check configuration.\n"]
  | EksResourceScalingConfig of eks_resource_scaling_configuration
      [@ocaml.doc "An Amazon Web Services EKS resource scaling execution block.\n"]
  | EcsCapacityIncreaseConfig of ecs_capacity_increase_configuration
      [@ocaml.doc "The capacity increase specified for the configuration.\n"]
  | RegionSwitchPlanConfig of region_switch_plan_configuration
      [@ocaml.doc "A Region switch plan execution block.\n"]
  | ParallelConfig of parallel_execution_block_configuration
      [@ocaml.doc "A parallel configuration execution block.\n"]
  | GlobalAuroraConfig of global_aurora_configuration
      [@ocaml.doc "An Aurora Global Database execution block.\n"]
  | ArcRoutingControlConfig of arc_routing_control_configuration
      [@ocaml.doc "An ARC routing control execution block.\n"]
  | ExecutionApprovalConfig of execution_approval_configuration
      [@ocaml.doc "A manual approval execution block.\n"]
  | Ec2AsgCapacityIncreaseConfig of ec2_asg_capacity_increase_configuration
      [@ocaml.doc "An EC2 Auto Scaling group execution block.\n"]
  | CustomActionLambdaConfig of custom_action_lambda_configuration
      [@ocaml.doc "An Amazon Web Services Lambda execution block.\n"]
[@@ocaml.doc
  "Execution block configurations for a workflow in a Region switch plan. An execution block \
   represents a specific type of action to perform during a Region switch.\n"]

and parallel_execution_block_configuration = {
  steps : steps; [@ocaml.doc "The steps for a parallel execution block.\n"]
}
[@@ocaml.doc
  "Configuration for steps that should be executed in parallel during a Region switch.\n"]

and step = {
  execution_block_type : execution_block_type;
      [@ocaml.doc "The type of an execution block in a workflow.\n"]
  execution_block_configuration : execution_block_configuration;
      [@ocaml.doc "The configuration for an execution block in a workflow.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The description of a step in a workflow.\n"]
  name : step_name; [@ocaml.doc "The name of a step in a workflow.\n"]
}
[@@ocaml.doc
  "Represents a step in a Region switch plan workflow. Each step performs a specific action during \
   the Region switch process.\n"]

and steps = step list [@@ocaml.doc ""]

type nonrec workflow = {
  workflow_description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The description of the workflow.\n"]
  workflow_target_region : region option;
      [@ocaml.doc "The Amazon Web Services Region that the workflow targets.\n"]
  workflow_target_action : workflow_target_action;
      [@ocaml.doc
        "The action that the workflow performs. Valid values include [activate] and [deactivate].\n"]
  steps : steps option; [@ocaml.doc "The steps that make up the workflow.\n"]
}
[@@ocaml.doc
  "Represents a workflow in a Region switch plan. A workflow defines a sequence of steps to \
   execute during a Region switch.\n"]

type nonrec workflow_list = workflow list [@@ocaml.doc ""]

type nonrec alarm_type = TRIGGER [@ocaml.doc ""] | APPLICATION_HEALTH [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec associated_alarm = {
  alarm_type : alarm_type;
      [@ocaml.doc
        "The alarm type for an associated alarm. An associated CloudWatch alarm can be an \
         application health alarm or a trigger alarm.\n"]
  resource_identifier : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The resource identifier for alarms that you associate with a plan.\n"]
  external_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The external ID (secret key) for the configuration.\n"]
  cross_account_role : iam_role_arn option;
      [@ocaml.doc "The cross account role for the configuration.\n"]
}
[@@ocaml.doc
  "An Amazon CloudWatch alarm associated with a Region switch plan. These alarms can be used to \
   trigger automatic execution of the plan.\n"]

type nonrec associated_alarm_map = (Smaws_Lib.Smithy_api.Types.string_ * associated_alarm) list
[@@ocaml.doc ""]

type nonrec alarm_condition = GREEN [@ocaml.doc ""] | RED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec trigger_condition = {
  condition : alarm_condition;
      [@ocaml.doc "The condition that must be met. Valid values include [green] and [red].\n"]
  associated_alarm_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the CloudWatch alarm associated with the condition.\n"]
}
[@@ocaml.doc "Defines a condition that must be met for a trigger to fire.\n"]

type nonrec trigger_condition_list = trigger_condition list [@@ocaml.doc ""]

type nonrec trigger = {
  min_delay_minutes_between_executions : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc
        "The minimum time, in minutes, that must elapse between automatic executions of the plan.\n"]
  conditions : trigger_condition_list;
      [@ocaml.doc "The conditions that must be met for the trigger to fire.\n"]
  action : workflow_target_action;
      [@ocaml.doc
        "The action to perform when the trigger fires. Valid values include [activate] and \
         [deactivate].\n"]
  target_region : region; [@ocaml.doc "The Amazon Web Services Region for a trigger.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The description for a trigger.\n"]
}
[@@ocaml.doc
  "Defines a condition that can automatically trigger the execution of a Region switch plan.\n"]

type nonrec trigger_list = trigger list [@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec s3_report_output_configuration = {
  bucket_owner : account_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID that owns the S3 bucket. Required to ensure the bucket \
         is still owned by the same expected owner at generation time.\n"]
  bucket_path : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The S3 bucket name and optional prefix where reports are stored. Format: bucket-name or \
         bucket-name/prefix.\n"]
}
[@@ocaml.doc "Configuration for delivering generated reports to an Amazon S3 bucket.\n"]

type nonrec report_output_configuration =
  | S3Configuration of s3_report_output_configuration
      [@ocaml.doc "Configuration for delivering reports to an Amazon S3 bucket.\n"]
[@@ocaml.doc "Configuration for report output destinations used in a Region switch plan.\n"]

type nonrec report_output_list = report_output_configuration list [@@ocaml.doc ""]

type nonrec report_configuration = {
  report_output : report_output_list option;
      [@ocaml.doc "The output configuration for the report.\n"]
}
[@@ocaml.doc
  "Configuration for automatic report generation for plan executions. When configured, Region \
   switch automatically generates a report after each plan execution that includes execution \
   events, plan configuration, and CloudWatch alarm states.\n"]

type nonrec plan_name = string [@@ocaml.doc ""]

type nonrec region_list = region list [@@ocaml.doc ""]

type nonrec recovery_approach = ACTIVE_PASSIVE [@ocaml.doc ""] | ACTIVE_ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec plan = {
  updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the plan was last updated.\n"]
  version : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The version for the plan.\n"]
  owner : account_id; [@ocaml.doc "The owner of a plan.\n"]
  primary_region : region option; [@ocaml.doc "The primary Region for a plan.\n"]
  recovery_approach : recovery_approach;
      [@ocaml.doc
        "The recovery approach for a Region switch plan, which can be active/active (activeActive) \
         or active/passive (activePassive).\n"]
  regions : region_list; [@ocaml.doc "The Amazon Web Services Regions for a plan.\n"]
  name : plan_name; [@ocaml.doc "The name for a plan.\n"]
  report_configuration : report_configuration option;
      [@ocaml.doc "The report configuration for a plan.\n"]
  triggers : trigger_list option; [@ocaml.doc "The triggers for a plan.\n"]
  associated_alarms : associated_alarm_map option;
      [@ocaml.doc "The associated application health alarms for a plan.\n"]
  recovery_time_objective_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The recovery time objective for a plan.\n"]
  execution_role : iam_role_arn; [@ocaml.doc "The execution role for a plan.\n"]
  workflows : workflow_list; [@ocaml.doc "The workflows for a plan.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The description for a plan.\n"]
  arn : plan_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the plan.\n"]
}
[@@ocaml.doc
  "Represents a Region switch plan. A plan defines the steps required to shift traffic from one \
   Amazon Web Services Region to another.\n"]

type nonrec update_plan_response = {
  plan : plan option; [@ocaml.doc "The details of the updated Region switch plan.\n"]
}
[@@ocaml.doc ""]

type nonrec update_plan_request = {
  report_configuration : report_configuration option;
      [@ocaml.doc "The updated report configuration for the plan.\n"]
  triggers : trigger_list option;
      [@ocaml.doc
        "The updated conditions that can automatically trigger the execution of the plan.\n"]
  associated_alarms : associated_alarm_map option;
      [@ocaml.doc "The updated CloudWatch alarms associated with the plan.\n"]
  recovery_time_objective_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The updated target recovery time objective (RTO) in minutes for the plan.\n"]
  execution_role : iam_role_arn;
      [@ocaml.doc
        "The updated IAM role ARN that grants Region switch the permissions needed to execute the \
         plan steps.\n"]
  workflows : workflow_list; [@ocaml.doc "The updated workflows for the Region switch plan.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The updated description for the Region switch plan.\n"]
  arn : plan_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the plan.\n"]
}
[@@ocaml.doc ""]

type nonrec update_plan_execution_step_response = unit [@@ocaml.doc ""]

type nonrec execution_id = string [@@ocaml.doc ""]

type nonrec execution_comment = string [@@ocaml.doc ""]

type nonrec update_plan_execution_step_action =
  | SKIP [@ocaml.doc ""]
  | SWITCH_TO_UNGRACEFUL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_plan_execution_step_request = {
  action_to_take : update_plan_execution_step_action;
      [@ocaml.doc
        "The updated action to take for the step. This can be used to skip or retry a step.\n"]
  step_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the execution step to update.\n"]
  comment : execution_comment; [@ocaml.doc "An optional comment about the plan execution.\n"]
  execution_id : execution_id;
      [@ocaml.doc "The unique identifier of the plan execution containing the step to update.\n"]
  plan_arn : plan_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the plan containing the execution step to update.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified resource was not found.\n\n HTTP Status Code: 404\n "]

type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You do not have sufficient access to perform this action.\n\n HTTP Status Code: 403\n "]

type nonrec update_plan_execution_response = unit [@@ocaml.doc ""]

type nonrec update_plan_execution_action =
  | RESUME [@ocaml.doc ""]
  | PAUSE [@ocaml.doc ""]
  | SWITCH_TO_UNGRACEFUL [@ocaml.doc ""]
  | SWITCH_TO_GRACEFUL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_plan_execution_request = {
  comment : execution_comment option; [@ocaml.doc "An optional comment about the plan execution.\n"]
  action : update_plan_execution_action;
      [@ocaml.doc
        "The action specified for a plan execution, for example, Switch to Graceful or Pause.\n"]
  execution_id : execution_id; [@ocaml.doc "The execution identifier of a plan execution.\n"]
  plan_arn : plan_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the plan with the execution to update.\n"]
}
[@@ocaml.doc ""]

type nonrec illegal_state_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The operation failed because the current state of the resource doesn't allow the operation to \
   proceed.\n\n\
  \ HTTP Status Code: 400\n\
  \ "]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_tag_keys : tag_keys; [@ocaml.doc "Tag keys that you remove from a resource.\n"]
  arn : plan_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) for a tag you remove a resource from.\n"]
}
[@@ocaml.doc ""]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request processing has failed because of an unknown error, exception, or failure.\n\n\
  \ HTTP Status Code: 500\n\
  \ "]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tags = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tags;
      [@ocaml.doc
        "Tags that you add to a resource. You can add a maximum of 50 tags in Region switch.\n"]
  arn : plan_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) for a tag that you add to a resource.\n"]
}
[@@ocaml.doc ""]

type nonrec step_status =
  | PENDING_APPROVAL [@ocaml.doc ""]
  | SKIPPED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | NOT_STARTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec execution_mode = UNGRACEFUL [@ocaml.doc ""] | GRACEFUL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec step_state = {
  step_mode : execution_mode option;
      [@ocaml.doc "The mode for a step execution. The mode can be Graceful or Ungraceful.\n"]
  end_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when a step endeded execution.\n"]
  start_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when a step started execution.\n"]
  status : step_status option;
      [@ocaml.doc
        "The status of a step in a workflow. For example, a status might be Completed or Pending \
         Approval.\n"]
  name : step_name option; [@ocaml.doc "The name of a step in a workflow.\n"]
}
[@@ocaml.doc "Represents the state of a step in a plan execution.\n"]

type nonrec step_states = step_state list [@@ocaml.doc ""]

type nonrec start_plan_execution_response = {
  deactivate_region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region to deactivate.\n"]
  activate_region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region to activate.\n"]
  plan_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The version of the plan, a unique number generated by Region switch.\n"]
  plan : plan_arn option; [@ocaml.doc "The details of the Region switch plan.\n"]
  execution_id : execution_id option; [@ocaml.doc "The execution identifier of a plan execution.\n"]
}
[@@ocaml.doc ""]

type nonrec execution_action =
  | POST_RECOVERY [@ocaml.doc ""]
  | DEACTIVATE [@ocaml.doc ""]
  | ACTIVATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec recovery_execution_id = string [@@ocaml.doc ""]

type nonrec start_plan_execution_request = {
  recovery_execution_id : recovery_execution_id option;
      [@ocaml.doc
        "The execution identifier of the recovery execution that ran in the opposite region \
         post-recovery is ran in. Required when starting a post-recovery execution.\n"]
  latest_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A boolean value indicating whether to use the latest version of the plan. If set to \
         false, you must specify a specific version.\n"]
  comment : execution_comment option;
      [@ocaml.doc "An optional comment explaining why the plan execution is being started.\n"]
  mode : execution_mode option;
      [@ocaml.doc
        "The plan execution mode. Valid values are [graceful], for starting the execution in \
         graceful mode, or [ungraceful], for starting the execution in ungraceful mode.\n"]
  action : execution_action;
      [@ocaml.doc
        "The action to perform. Valid values are [activate] (to shift traffic to the target \
         Region) or [deactivate] (to shift traffic away from the target Region).\n"]
  target_region : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The Amazon Web Services Region to target with this execution. This is the Region that \
         traffic will be shifted to or from, depending on the action.\n"]
  plan_arn : plan_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the plan to execute.\n"]
}
[@@ocaml.doc ""]

type nonrec illegal_argument_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "The request processing has an invalid argument.\n"]

type nonrec s3_report_output = {
  s3_object_key : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The S3 object key where the generated report is stored.\n"]
}
[@@ocaml.doc "Information about a report delivered to Amazon S3.\n"]

type nonrec route53_health_check_status =
  | UNKNOWN [@ocaml.doc ""]
  | UNHEALTHY [@ocaml.doc ""]
  | HEALTHY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec route53_health_check_id = string [@@ocaml.doc ""]

type nonrec route53_health_check = {
  region : region; [@ocaml.doc "The Amazon Route 53 Region.\n"]
  status : route53_health_check_status option;
      [@ocaml.doc "The Amazon Route 53 health check status.\n"]
  health_check_id : route53_health_check_id option;
      [@ocaml.doc "The Amazon Route 53 health check ID.\n"]
  record_name : route53_record_name; [@ocaml.doc "The Amazon Route 53 record name.\n"]
  hosted_zone_id : route53_hosted_zone_id;
      [@ocaml.doc "The Amazon Route 53 health check hosted zone ID.\n"]
}
[@@ocaml.doc "The Amazon Route 53 health check.\n"]

type nonrec route53_health_check_list = route53_health_check list [@@ocaml.doc ""]

type nonrec resources = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec resource_warning_status = RESOLVED [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec minimal_workflow = {
  name : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The name for a minimal workflow\n"]
  action : execution_action option;
      [@ocaml.doc "The action for a minimal workflow, which can be Activate or Deactivate.\n"]
}
[@@ocaml.doc "A simplified representation of a workflow in a Region switch plan.\n"]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec resource_warning = {
  warning_message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The warning message about what needs to be corrected.\n"]
  warning_updated_time : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The timestamp when the warning was last updated.\n"]
  warning_status : resource_warning_status; [@ocaml.doc "The status of the resource warning.\n"]
  resource_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
  step_name : step_name option; [@ocaml.doc "The name of the step for the resource warning.\n"]
  version : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The version for the resource warning.\n"]
  workflow : minimal_workflow option; [@ocaml.doc "The workflow for the resource warning.\n"]
}
[@@ocaml.doc "Represents a warning about a resource in a Region switch plan.\n"]

type nonrec failed_report_error_code =
  | CONFIGURATION_ERROR [@ocaml.doc ""]
  | INVALID_RESOURCE [@ocaml.doc ""]
  | INSUFFICIENT_PERMISSIONS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec failed_report_output = {
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The error message for the failed report generation.\n"]
  error_code : failed_report_error_code option;
      [@ocaml.doc "The error code for the failed report generation.\n"]
}
[@@ocaml.doc "Information about a report generation that failed.\n"]

type nonrec report_output =
  | FailedReportOutput of failed_report_output
      [@ocaml.doc "The details about a failed report generation.\n"]
  | S3ReportOutput of s3_report_output
      [@ocaml.doc "Information about a report delivered to Amazon S3.\n"]
[@@ocaml.doc "The output location or cause of a failure in report generation.\n"]

type nonrec region_switch_plan = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec plan_warnings = resource_warning list [@@ocaml.doc ""]

type nonrec abbreviated_plan = {
  recovery_time_objective_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The recovery time objective that you've specified.\n"]
  active_plan_execution : execution_id option;
      [@ocaml.doc "Specifies if this is the active plan execution at this time.\n"]
  execution_role : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The execution role is a way to categorize a Region switch plan. \n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The description of a Region switch plan.\n"]
  updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the plan execution was last updated.\n"]
  version : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The version for the plan.\n"]
  primary_region : region option; [@ocaml.doc "The primary Region for a plan.\n"]
  recovery_approach : recovery_approach;
      [@ocaml.doc
        "The recovery approach for a Region switch plan, which can be active/active (activeActive) \
         or active/passive (activePassive).\n"]
  regions : region_list;
      [@ocaml.doc "The Amazon Web Services Region specified for a Region switch plan.\n"]
  name : plan_name; [@ocaml.doc "The name of a Region switch plan.\n"]
  owner : account_id; [@ocaml.doc "The owner of a Region switch plan.\n"]
  arn : plan_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the Region switch plan.\n"]
}
[@@ocaml.doc
  "A summarized representation of a Region switch plan. This structure contains key information \
   about a plan without all the detailed workflow and step data.\n"]

type nonrec plan_list = abbreviated_plan list [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  resource_tags : tags option; [@ocaml.doc "The tags for a resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  arn : plan_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_route53_health_checks_response = {
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token. A response may contain no results while still including a \
         [nextToken]. Continue paginating until [nextToken] is null to retrieve all results.\n"]
  health_checks : route53_health_check_list option;
      [@ocaml.doc "List of the health checks requested.\n"]
}
[@@ocaml.doc ""]

type nonrec list_route53_health_checks_request = {
  next_token : next_token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [nextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [nextToken] \
         response to request the next page of results.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  record_name : route53_record_name option; [@ocaml.doc "The record name for the health checks.\n"]
  hosted_zone_id : route53_hosted_zone_id option;
      [@ocaml.doc "The hosted zone ID for the health checks.\n"]
  arn : plan_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Amazon Route 53 health check request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_route53_health_checks_in_region_response = {
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token. A response may contain no results while still including a \
         [nextToken]. Continue paginating until [nextToken] is null to retrieve all results.\n"]
  health_checks : route53_health_check_list option;
      [@ocaml.doc "List of the health checks requested.\n"]
}
[@@ocaml.doc ""]

type nonrec list_route53_health_checks_in_region_request = {
  next_token : next_token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [nextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [nextToken] \
         response to request the next page of results.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  record_name : route53_record_name option; [@ocaml.doc "The record name for the health checks.\n"]
  hosted_zone_id : route53_hosted_zone_id option;
      [@ocaml.doc "The hosted zone ID for the health checks.\n"]
  arn : plan_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the Arc Region Switch Plan.\n"]
}
[@@ocaml.doc ""]

type nonrec list_plans_response = {
  next_token : next_token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [nextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [nextToken] \
         response to request the next page of results.\n"]
  plans : plan_list option; [@ocaml.doc "The plans that were requested.\n"]
}
[@@ocaml.doc ""]

type nonrec list_plans_request = {
  next_token : next_token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [nextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [nextToken] \
         response to request the next page of results.\n"]
  max_results : max_results option;
      [@ocaml.doc "The number of objects that you want to return with this call.\n"]
}
[@@ocaml.doc ""]

type nonrec list_plans_in_region_response = {
  next_token : next_token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [nextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [nextToken] \
         response to request the next page of results.\n"]
  plans : plan_list option; [@ocaml.doc "The plans that were requested.\n"]
}
[@@ocaml.doc ""]

type nonrec list_plans_in_region_request = {
  next_token : next_token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [nextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [nextToken] \
         response to request the next page of results.\n"]
  max_results : max_results option;
      [@ocaml.doc "The number of objects that you want to return with this call.\n"]
}
[@@ocaml.doc ""]

type nonrec execution_state =
  | COMPLETED_MONITORING_APPLICATION_HEALTH [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | PENDING_MANUAL_APPROVAL [@ocaml.doc ""]
  | PLAN_EXECUTION_TIMED_OUT [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | COMPLETED_WITH_EXCEPTIONS [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | PAUSED_BY_OPERATOR [@ocaml.doc ""]
  | PAUSED_BY_FAILED_STEP [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec duration = string [@@ocaml.doc ""]

type nonrec abbreviated_execution = {
  actual_recovery_time : duration option;
      [@ocaml.doc
        "The actual recovery time that Region switch calculates for a plan execution. Actual \
         recovery time includes the time for the plan to run added to the time elapsed until the \
         application health alarms that you've specified are healthy again.\n"]
  recovery_execution_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The unique identifier of the most recent recovery execution. Required when starting a \
         post-recovery execution.\n"]
  execution_region : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Web Services Region for a plan execution.\n"]
  execution_action : execution_action;
      [@ocaml.doc
        "The plan execution action. Valid values are [activate], to activate an Amazon Web \
         Services Region, or [deactivate], to deactivate a Region.\n"]
  execution_state : execution_state;
      [@ocaml.doc
        "The plan execution state. Provides the state of a plan execution, for example, In \
         Progress or Paused by Operator.\n"]
  mode : execution_mode;
      [@ocaml.doc
        "The plan execution mode. Valid values are [graceful], for graceful executions, or \
         [ungraceful], for ungraceful executions.\n"]
  end_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the plan execution was ended.\n"]
  start_time : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The timestamp when the plan execution was started.\n"]
  comment : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "An optional comment about the plan execution.\n"]
  updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the plan execution was last updated.\n"]
  version : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The version for the plan.\n"]
  execution_id : execution_id; [@ocaml.doc "The execution identifier of a plan execution.\n"]
  plan_arn : plan_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the plan.\n"]
}
[@@ocaml.doc
  "A summarized representation of a plan execution. This structure contains key information about \
   an execution without all the detailed step data.\n"]

type nonrec abbreviated_executions_list = abbreviated_execution list [@@ocaml.doc ""]

type nonrec list_plan_executions_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [nextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [nextToken] \
         response to request the next page of results.\n"]
  items : abbreviated_executions_list option;
      [@ocaml.doc "The items in the plan execution to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_executions_max_results = int [@@ocaml.doc ""]

type nonrec list_plan_executions_request = {
  state : execution_state option;
      [@ocaml.doc
        "The state of the plan execution. For example, the plan execution might be In Progress.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [nextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [nextToken] \
         response to request the next page of results.\n"]
  max_results : list_executions_max_results option;
      [@ocaml.doc "The number of objects that you want to return with this call.\n"]
  plan_arn : plan_arn; [@ocaml.doc "The ARN for the plan.\n"]
}
[@@ocaml.doc ""]

type nonrec execution_event_type =
  | PLAN_EVALUATION_WARNING [@ocaml.doc ""]
  | STEP_PENDING_APPLICATION_HEALTH_MONITOR [@ocaml.doc ""]
  | STEP_EXECUTION_BEHAVIOR_CHANGED_TO_UNGRACEFUL [@ocaml.doc ""]
  | STEP_PENDING_APPROVAL [@ocaml.doc ""]
  | STEP_CANCELED [@ocaml.doc ""]
  | STEP_PAUSED_BY_OPERATOR [@ocaml.doc ""]
  | STEP_PAUSED_BY_ERROR [@ocaml.doc ""]
  | STEP_SKIPPED [@ocaml.doc ""]
  | STEP_FAILED [@ocaml.doc ""]
  | STEP_SUCCEEDED [@ocaml.doc ""]
  | STEP_UPDATE [@ocaml.doc ""]
  | STEP_STARTED [@ocaml.doc ""]
  | EXECUTION_SUCCESS_MONITORING_APPLICATION_HEALTH [@ocaml.doc ""]
  | EXECUTION_PENDING_CHILD_PLAN_MANUAL_APPROVAL [@ocaml.doc ""]
  | EXECUTION_BEHAVIOR_CHANGED_TO_GRACEFUL [@ocaml.doc ""]
  | EXECUTION_BEHAVIOR_CHANGED_TO_UNGRACEFUL [@ocaml.doc ""]
  | EXECUTION_PENDING_APPROVAL [@ocaml.doc ""]
  | EXECUTION_CANCELED [@ocaml.doc ""]
  | EXECUTION_CANCELING [@ocaml.doc ""]
  | EXECUTION_PAUSED [@ocaml.doc ""]
  | EXECUTION_PAUSING [@ocaml.doc ""]
  | EXECUTION_FAILED [@ocaml.doc ""]
  | EXECUTION_SUCCEEDED [@ocaml.doc ""]
  | EXECUTION_STARTED [@ocaml.doc ""]
  | EXECUTION_PENDING [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec execution_event = {
  previous_event_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The event ID of the previous execution event.\n"]
  event_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The event ID for an execution event.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The description for an execution event.\n"]
  error : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "Errors for an execution event.\n"]
  resources : resources option; [@ocaml.doc "The resources for an execution event.\n"]
  execution_block_type : execution_block_type option;
      [@ocaml.doc "The execution block type for an execution event.\n"]
  step_name : step_name option; [@ocaml.doc "The step name for an execution event.\n"]
  type_ : execution_event_type option; [@ocaml.doc "The type of an execution event.\n"]
  timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp for an execution event.\n"]
}
[@@ocaml.doc
  "Represents an event that occurred during a plan execution. These events provide a detailed \
   timeline of the execution process.\n"]

type nonrec execution_event_list = execution_event list [@@ocaml.doc ""]

type nonrec list_plan_execution_events_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [nextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [nextToken] \
         response to request the next page of results.\n"]
  items : execution_event_list option; [@ocaml.doc "The items in the plan execution event.\n"]
}
[@@ocaml.doc ""]

type nonrec list_execution_events_max_results = int [@@ocaml.doc ""]

type nonrec list_plan_execution_events_request = {
  name : step_name option; [@ocaml.doc "The name of the plan execution event.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [nextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [nextToken] \
         response to request the next page of results.\n"]
  max_results : list_execution_events_max_results option;
      [@ocaml.doc "The number of objects that you want to return with this call.\n"]
  execution_id : execution_id; [@ocaml.doc "The execution identifier of a plan execution.\n"]
  plan_arn : plan_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the plan.\n"]
}
[@@ocaml.doc ""]

type nonrec get_plan_response = {
  plan : plan option;
      [@ocaml.doc "The detailed information about the requested Region switch plan.\n"]
}
[@@ocaml.doc ""]

type nonrec get_plan_request = {
  arn : plan_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the plan.\n"]
}
[@@ocaml.doc ""]

type nonrec get_plan_in_region_response = {
  plan : plan option; [@ocaml.doc "The details of the Region switch plan.\n"]
}
[@@ocaml.doc ""]

type nonrec get_plan_in_region_request = {
  arn : plan_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the plan in Region.\n"]
}
[@@ocaml.doc ""]

type nonrec get_plan_execution_step_states_max_results = int [@@ocaml.doc ""]

type nonrec generated_report = {
  report_output : report_output option;
      [@ocaml.doc "The output location or cause of a failure in report generation.\n"]
  report_generation_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the report was generated.\n"]
}
[@@ocaml.doc "Information about a generated execution report.\n"]

type nonrec generated_report_details = generated_report list [@@ocaml.doc ""]

type nonrec get_plan_execution_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [nextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [nextToken] \
         response to request the next page of results.\n"]
  generated_report_details : generated_report_details option;
      [@ocaml.doc
        "Information about the location of a generated report, or the cause of its failure.\n"]
  actual_recovery_time : duration option;
      [@ocaml.doc
        "The actual recovery time that Region switch calculates for a plan execution. Actual \
         recovery time includes the time for the plan to run added to the time elapsed until the \
         application health alarms that you've specified are healthy again.\n"]
  plan : plan option; [@ocaml.doc "The details of the Region switch plan.\n"]
  step_states : step_states option; [@ocaml.doc "The states of the steps in the plan execution.\n"]
  recovery_execution_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The unique identifier of the most recent recovery execution. Required when starting a \
         post-recovery execution.\n"]
  execution_region : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Web Services Region for a plan execution.\n"]
  execution_action : execution_action;
      [@ocaml.doc
        "The plan execution action. Valid values are [activate], to activate an Amazon Web \
         Services Region, or [deactivate], to deactivate a Region.\n"]
  execution_state : execution_state;
      [@ocaml.doc
        "The plan execution state. Provides the state of a plan execution, for example, In \
         Progress or Paused by Operator.\n"]
  mode : execution_mode;
      [@ocaml.doc
        "The plan execution mode. Valid values are [graceful], for graceful executions, or \
         [ungraceful], for ungraceful executions.\n"]
  end_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time (UTC) when the plan execution ended.\n"]
  start_time : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The time (UTC) when the plan execution started.\n"]
  comment : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A comment included on the plan execution.\n"]
  updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the plan execution was last updated.\n"]
  version : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The version for the plan.\n"]
  execution_id : execution_id; [@ocaml.doc "The execution identifier of a plan execution.\n"]
  plan_arn : plan_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the plan.\n"]
}
[@@ocaml.doc ""]

type nonrec get_plan_execution_request = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [nextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [nextToken] \
         response to request the next page of results.\n"]
  max_results : get_plan_execution_step_states_max_results option;
      [@ocaml.doc "The number of objects that you want to return with this call.\n"]
  execution_id : execution_id; [@ocaml.doc "The execution identifier of a plan execution.\n"]
  plan_arn : plan_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the plan with the execution to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec evaluation_status =
  | UNKNOWN [@ocaml.doc ""]
  | PENDING_EVALUATION [@ocaml.doc ""]
  | ACTION_REQUIRED [@ocaml.doc ""]
  | PASSED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_plan_evaluation_status_response = {
  next_token : next_token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [nextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [nextToken] \
         response to request the next page of results.\n"]
  warnings : plan_warnings option; [@ocaml.doc "The current evaluation warnings for the plan. \n"]
  evaluation_state : evaluation_status option; [@ocaml.doc "The evaluation state for the plan.\n"]
  region : region option; [@ocaml.doc "The Amazon Web Services Region for the plan.\n"]
  last_evaluated_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The version of the last evaluation of the plan.\n"]
  last_evaluation_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time of the last time that Region switch ran an evaluation of the plan.\n"]
  plan_arn : plan_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the plan.\n"]
}
[@@ocaml.doc ""]

type nonrec get_plan_evaluation_status_request = {
  next_token : next_token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [nextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [nextToken] \
         response to request the next page of results.\n"]
  max_results : max_results option;
      [@ocaml.doc "The number of objects that you want to return with this call.\n"]
  plan_arn : plan_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Region switch plan to retrieve evaluation status for.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_plan_response = unit [@@ocaml.doc ""]

type nonrec delete_plan_request = {
  arn : plan_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the plan.\n"]
}
[@@ocaml.doc ""]

type nonrec create_plan_response = {
  plan : plan option; [@ocaml.doc "The details of the created Region switch plan.\n"]
}
[@@ocaml.doc ""]

type nonrec create_plan_request = {
  tags : tags option; [@ocaml.doc "The tags to apply to the Region switch plan.\n"]
  primary_region : region option;
      [@ocaml.doc
        "The primary Amazon Web Services Region for the application. This is the Region where the \
         application normally runs before any Region switch occurs.\n"]
  recovery_approach : recovery_approach;
      [@ocaml.doc
        "The recovery approach for a Region switch plan, which can be active/active (activeActive) \
         or active/passive (activePassive).\n"]
  regions : region_list;
      [@ocaml.doc
        "An array that specifies the Amazon Web Services Regions for a Region switch plan. Specify \
         two Regions.\n"]
  name : plan_name; [@ocaml.doc "The name of a Region switch plan.\n"]
  report_configuration : report_configuration option; [@ocaml.doc ""]
  triggers : trigger_list option;
      [@ocaml.doc "The triggers associated with a Region switch plan.\n"]
  associated_alarms : associated_alarm_map option;
      [@ocaml.doc "The alarms associated with a Region switch plan.\n"]
  recovery_time_objective_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Optionally, you can specify an recovery time objective for a Region switch plan, in \
         minutes.\n"]
  execution_role : iam_role_arn;
      [@ocaml.doc "An execution role is a way to categorize a Region switch plan.\n"]
  workflows : workflow_list;
      [@ocaml.doc "An array of workflows included in a Region switch plan.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The description of a Region switch plan.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_plan_execution_response = unit [@@ocaml.doc ""]

type nonrec cancel_plan_execution_request = {
  comment : execution_comment option;
      [@ocaml.doc "A comment that you can enter about canceling a plan execution step.\n"]
  execution_id : execution_id; [@ocaml.doc "The execution identifier of a plan execution.\n"]
  plan_arn : plan_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the plan.\n"]
}
[@@ocaml.doc ""]

type nonrec approve_plan_execution_step_response = unit [@@ocaml.doc ""]

type nonrec approval = DECLINE [@ocaml.doc ""] | APPROVE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec approve_plan_execution_step_request = {
  comment : execution_comment option;
      [@ocaml.doc "A comment that you can enter about a plan execution.\n"]
  approval : approval; [@ocaml.doc "The status of approval for a plan execution step. \n"]
  step_name : step_name; [@ocaml.doc "The name of a step in a plan execution.\n"]
  execution_id : execution_id; [@ocaml.doc "The execution identifier of a plan execution.\n"]
  plan_arn : plan_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the plan.\n"]
}
[@@ocaml.doc ""]
