open Types

val make_lambdas :
  ?arn:lambda_arn ->
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cross_account_role:iam_role_arn ->
  unit ->
  lambdas

val make_lambda_ungraceful : ?behavior:lambda_ungraceful_behavior -> unit -> lambda_ungraceful

val make_custom_action_lambda_configuration :
  ?ungraceful:lambda_ungraceful ->
  ?timeout_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  region_to_run:region_to_run_in ->
  retry_interval_minutes:Smaws_Lib.Smithy_api.Types.float_ ->
  lambdas:lambda_list ->
  unit ->
  custom_action_lambda_configuration

val make_asg :
  ?arn:asg_arn ->
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cross_account_role:iam_role_arn ->
  unit ->
  asg

val make_ec2_ungraceful :
  minimum_success_percentage:Smaws_Lib.Smithy_api.Types.integer -> unit -> ec2_ungraceful

val make_ec2_asg_capacity_increase_configuration :
  ?capacity_monitoring_approach:ec2_asg_capacity_monitoring_approach ->
  ?target_percent:Smaws_Lib.Smithy_api.Types.integer ->
  ?ungraceful:ec2_ungraceful ->
  ?timeout_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  asgs:asg_list ->
  unit ->
  ec2_asg_capacity_increase_configuration

val make_execution_approval_configuration :
  ?timeout_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  approval_role:role_arn ->
  unit ->
  execution_approval_configuration

val make_arc_routing_control_state :
  state:routing_control_state_change ->
  routing_control_arn:routing_control_arn ->
  unit ->
  arc_routing_control_state

val make_arc_routing_control_configuration :
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cross_account_role:iam_role_arn ->
  ?timeout_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  region_and_routing_controls:region_and_routing_controls ->
  unit ->
  arc_routing_control_configuration

val make_global_aurora_ungraceful :
  ?ungraceful:global_aurora_ungraceful_behavior -> unit -> global_aurora_ungraceful

val make_global_aurora_configuration :
  ?ungraceful:global_aurora_ungraceful ->
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cross_account_role:iam_role_arn ->
  ?timeout_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  database_cluster_arns:aurora_cluster_arns ->
  global_cluster_identifier:global_cluster_identifier ->
  behavior:global_aurora_default_behavior ->
  unit ->
  global_aurora_configuration

val make_region_switch_plan_configuration :
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cross_account_role:iam_role_arn ->
  arn:plan_arn ->
  unit ->
  region_switch_plan_configuration

val make_service :
  ?service_arn:ecs_service_arn ->
  ?cluster_arn:ecs_cluster_arn ->
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cross_account_role:iam_role_arn ->
  unit ->
  service

val make_ecs_ungraceful :
  minimum_success_percentage:Smaws_Lib.Smithy_api.Types.integer -> unit -> ecs_ungraceful

val make_ecs_capacity_increase_configuration :
  ?capacity_monitoring_approach:ecs_capacity_monitoring_approach ->
  ?target_percent:Smaws_Lib.Smithy_api.Types.integer ->
  ?ungraceful:ecs_ungraceful ->
  ?timeout_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  services:service_list ->
  unit ->
  ecs_capacity_increase_configuration

val make_kubernetes_resource_type :
  kind:Smaws_Lib.Smithy_api.Types.string_ ->
  api_version:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  kubernetes_resource_type

val make_kubernetes_scaling_resource :
  ?hpa_name:Smaws_Lib.Smithy_api.Types.string_ ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  namespace:kubernetes_namespace ->
  unit ->
  kubernetes_scaling_resource

val make_eks_cluster :
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cross_account_role:iam_role_arn ->
  cluster_arn:eks_cluster_arn ->
  unit ->
  eks_cluster

val make_eks_resource_scaling_ungraceful :
  minimum_success_percentage:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  eks_resource_scaling_ungraceful

val make_eks_resource_scaling_configuration :
  ?capacity_monitoring_approach:eks_capacity_monitoring_approach ->
  ?target_percent:Smaws_Lib.Smithy_api.Types.integer ->
  ?ungraceful:eks_resource_scaling_ungraceful ->
  ?eks_clusters:eks_clusters ->
  ?scaling_resources:kubernetes_scaling_apps ->
  ?timeout_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  kubernetes_resource_type:kubernetes_resource_type ->
  unit ->
  eks_resource_scaling_configuration

val make_route53_resource_record_set :
  ?region:region ->
  ?record_set_identifier:route53_resource_record_set_identifier ->
  unit ->
  route53_resource_record_set

val make_route53_health_check_configuration :
  ?record_sets:route53_resource_record_set_list ->
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cross_account_role:iam_role_arn ->
  ?timeout_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  record_name:route53_record_name ->
  hosted_zone_id:route53_hosted_zone_id ->
  unit ->
  route53_health_check_configuration

val make_document_db_ungraceful :
  ?ungraceful:document_db_ungraceful_behavior -> unit -> document_db_ungraceful

val make_document_db_configuration :
  ?ungraceful:document_db_ungraceful ->
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cross_account_role:iam_role_arn ->
  ?timeout_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  database_cluster_arns:document_db_cluster_arns ->
  global_cluster_identifier:document_db_global_cluster_identifier ->
  behavior:document_db_default_behavior ->
  unit ->
  document_db_configuration

val make_rds_promote_read_replica_configuration :
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cross_account_role:iam_role_arn ->
  ?timeout_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  db_instance_arn_map:rds_db_instance_arn_map ->
  unit ->
  rds_promote_read_replica_configuration

val make_rds_create_cross_region_replica_configuration :
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cross_account_role:iam_role_arn ->
  ?timeout_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  db_instance_arn_map:rds_db_instance_arn_map ->
  unit ->
  rds_create_cross_region_replica_configuration

val make_event_source_mapping :
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cross_account_role:iam_role_arn ->
  arn:event_source_mapping_arn ->
  unit ->
  event_source_mapping

val make_lambda_event_source_mapping_ungraceful :
  ?behavior:lambda_event_source_mapping_ungraceful_behavior ->
  unit ->
  lambda_event_source_mapping_ungraceful

val make_lambda_event_source_mapping_configuration :
  ?ungraceful:lambda_event_source_mapping_ungraceful ->
  ?timeout_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  region_event_source_mappings:region_event_source_mapping_map ->
  action:event_source_mapping_action ->
  unit ->
  lambda_event_source_mapping_configuration

val make_aurora_serverless_scaling_configuration :
  ?target_percent:Smaws_Lib.Smithy_api.Types.integer ->
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cross_account_role:iam_role_arn ->
  ?timeout_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  region_database_cluster_arns:region_aurora_cluster_map ->
  global_cluster_identifier:global_cluster_identifier ->
  unit ->
  aurora_serverless_scaling_configuration

val make_aurora_provisioned_scaling_configuration :
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cross_account_role:iam_role_arn ->
  ?timeout_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  instance_arns:region_aurora_instance_arn_map ->
  region_database_cluster_arns:region_aurora_cluster_map ->
  global_cluster_identifier:global_cluster_identifier ->
  unit ->
  aurora_provisioned_scaling_configuration

val make_neptune_ungraceful : ?ungraceful:neptune_ungraceful_behavior -> unit -> neptune_ungraceful

val make_neptune_global_database_configuration :
  ?ungraceful:neptune_ungraceful ->
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cross_account_role:iam_role_arn ->
  ?timeout_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  region_database_cluster_arns:region_neptune_cluster_arn_map ->
  global_cluster_identifier:neptune_global_cluster_identifier ->
  behavior:neptune_default_behavior ->
  unit ->
  neptune_global_database_configuration

val make_parallel_execution_block_configuration :
  steps:steps -> unit -> parallel_execution_block_configuration

val make_step :
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  execution_block_type:execution_block_type ->
  execution_block_configuration:execution_block_configuration ->
  name:step_name ->
  unit ->
  step

val make_workflow :
  ?workflow_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?workflow_target_region:region ->
  ?steps:steps ->
  workflow_target_action:workflow_target_action ->
  unit ->
  workflow

val make_associated_alarm :
  ?external_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cross_account_role:iam_role_arn ->
  alarm_type:alarm_type ->
  resource_identifier:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  associated_alarm

val make_trigger_condition :
  condition:alarm_condition ->
  associated_alarm_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  trigger_condition

val make_trigger :
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  min_delay_minutes_between_executions:Smaws_Lib.Smithy_api.Types.integer ->
  conditions:trigger_condition_list ->
  action:workflow_target_action ->
  target_region:region ->
  unit ->
  trigger

val make_s3_report_output_configuration :
  ?bucket_owner:account_id ->
  ?bucket_path:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  s3_report_output_configuration

val make_report_configuration : ?report_output:report_output_list -> unit -> report_configuration

val make_plan :
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?primary_region:region ->
  ?report_configuration:report_configuration ->
  ?triggers:trigger_list ->
  ?associated_alarms:associated_alarm_map ->
  ?recovery_time_objective_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  owner:account_id ->
  recovery_approach:recovery_approach ->
  regions:region_list ->
  name:plan_name ->
  execution_role:iam_role_arn ->
  workflows:workflow_list ->
  arn:plan_arn ->
  unit ->
  plan

val make_update_plan_response : ?plan:plan -> unit -> update_plan_response

val make_update_plan_request :
  ?report_configuration:report_configuration ->
  ?triggers:trigger_list ->
  ?associated_alarms:associated_alarm_map ->
  ?recovery_time_objective_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  execution_role:iam_role_arn ->
  workflows:workflow_list ->
  arn:plan_arn ->
  unit ->
  update_plan_request

val make_update_plan_execution_step_response : unit -> unit

val make_update_plan_execution_step_request :
  action_to_take:update_plan_execution_step_action ->
  step_name:Smaws_Lib.Smithy_api.Types.string_ ->
  comment:execution_comment ->
  execution_id:execution_id ->
  plan_arn:plan_arn ->
  unit ->
  update_plan_execution_step_request

val make_update_plan_execution_response : unit -> unit

val make_update_plan_execution_request :
  ?comment:execution_comment ->
  action:update_plan_execution_action ->
  execution_id:execution_id ->
  plan_arn:plan_arn ->
  unit ->
  update_plan_execution_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_tag_keys:tag_keys -> arn:plan_arn -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag_resource_request : tags:tags -> arn:plan_arn -> unit -> tag_resource_request

val make_step_state :
  ?step_mode:execution_mode ->
  ?end_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:step_status ->
  ?name:step_name ->
  unit ->
  step_state

val make_start_plan_execution_response :
  ?deactivate_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?activate_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?plan_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?plan:plan_arn ->
  ?execution_id:execution_id ->
  unit ->
  start_plan_execution_response

val make_start_plan_execution_request :
  ?recovery_execution_id:recovery_execution_id ->
  ?latest_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?comment:execution_comment ->
  ?mode:execution_mode ->
  action:execution_action ->
  target_region:Smaws_Lib.Smithy_api.Types.string_ ->
  plan_arn:plan_arn ->
  unit ->
  start_plan_execution_request

val make_s3_report_output :
  ?s3_object_key:Smaws_Lib.Smithy_api.Types.string_ -> unit -> s3_report_output

val make_route53_health_check :
  ?status:route53_health_check_status ->
  ?health_check_id:route53_health_check_id ->
  region:region ->
  record_name:route53_record_name ->
  hosted_zone_id:route53_hosted_zone_id ->
  unit ->
  route53_health_check

val make_minimal_workflow :
  ?name:Smaws_Lib.Smithy_api.Types.string_ -> ?action:execution_action -> unit -> minimal_workflow

val make_resource_warning :
  ?resource_arn:resource_arn ->
  ?step_name:step_name ->
  ?workflow:minimal_workflow ->
  warning_message:Smaws_Lib.Smithy_api.Types.string_ ->
  warning_updated_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  warning_status:resource_warning_status ->
  version:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  resource_warning

val make_failed_report_output :
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_code:failed_report_error_code ->
  unit ->
  failed_report_output

val make_abbreviated_plan :
  ?recovery_time_objective_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  ?active_plan_execution:execution_id ->
  ?execution_role:Smaws_Lib.Smithy_api.Types.string_ ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?primary_region:region ->
  recovery_approach:recovery_approach ->
  regions:region_list ->
  name:plan_name ->
  owner:account_id ->
  arn:plan_arn ->
  unit ->
  abbreviated_plan

val make_list_tags_for_resource_response :
  ?resource_tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request : arn:plan_arn -> unit -> list_tags_for_resource_request

val make_list_route53_health_checks_response :
  ?next_token:next_token ->
  ?health_checks:route53_health_check_list ->
  unit ->
  list_route53_health_checks_response

val make_list_route53_health_checks_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?record_name:route53_record_name ->
  ?hosted_zone_id:route53_hosted_zone_id ->
  arn:plan_arn ->
  unit ->
  list_route53_health_checks_request

val make_list_route53_health_checks_in_region_response :
  ?next_token:next_token ->
  ?health_checks:route53_health_check_list ->
  unit ->
  list_route53_health_checks_in_region_response

val make_list_route53_health_checks_in_region_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?record_name:route53_record_name ->
  ?hosted_zone_id:route53_hosted_zone_id ->
  arn:plan_arn ->
  unit ->
  list_route53_health_checks_in_region_request

val make_list_plans_response :
  ?next_token:next_token -> ?plans:plan_list -> unit -> list_plans_response

val make_list_plans_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_plans_request

val make_list_plans_in_region_response :
  ?next_token:next_token -> ?plans:plan_list -> unit -> list_plans_in_region_response

val make_list_plans_in_region_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_plans_in_region_request

val make_abbreviated_execution :
  ?actual_recovery_time:duration ->
  ?recovery_execution_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?end_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?comment:Smaws_Lib.Smithy_api.Types.string_ ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?version:Smaws_Lib.Smithy_api.Types.string_ ->
  execution_region:Smaws_Lib.Smithy_api.Types.string_ ->
  execution_action:execution_action ->
  execution_state:execution_state ->
  mode:execution_mode ->
  start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  execution_id:execution_id ->
  plan_arn:plan_arn ->
  unit ->
  abbreviated_execution

val make_list_plan_executions_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?items:abbreviated_executions_list ->
  unit ->
  list_plan_executions_response

val make_list_plan_executions_request :
  ?state:execution_state ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:list_executions_max_results ->
  plan_arn:plan_arn ->
  unit ->
  list_plan_executions_request

val make_execution_event :
  ?previous_event_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resources:resources ->
  ?execution_block_type:execution_block_type ->
  ?step_name:step_name ->
  ?type_:execution_event_type ->
  ?timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  event_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  execution_event

val make_list_plan_execution_events_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?items:execution_event_list ->
  unit ->
  list_plan_execution_events_response

val make_list_plan_execution_events_request :
  ?name:step_name ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:list_execution_events_max_results ->
  execution_id:execution_id ->
  plan_arn:plan_arn ->
  unit ->
  list_plan_execution_events_request

val make_get_plan_response : ?plan:plan -> unit -> get_plan_response
val make_get_plan_request : arn:plan_arn -> unit -> get_plan_request
val make_get_plan_in_region_response : ?plan:plan -> unit -> get_plan_in_region_response
val make_get_plan_in_region_request : arn:plan_arn -> unit -> get_plan_in_region_request

val make_generated_report :
  ?report_output:report_output ->
  ?report_generation_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  generated_report

val make_get_plan_execution_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?generated_report_details:generated_report_details ->
  ?actual_recovery_time:duration ->
  ?plan:plan ->
  ?step_states:step_states ->
  ?recovery_execution_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?end_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?comment:Smaws_Lib.Smithy_api.Types.string_ ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?version:Smaws_Lib.Smithy_api.Types.string_ ->
  execution_region:Smaws_Lib.Smithy_api.Types.string_ ->
  execution_action:execution_action ->
  execution_state:execution_state ->
  mode:execution_mode ->
  start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  execution_id:execution_id ->
  plan_arn:plan_arn ->
  unit ->
  get_plan_execution_response

val make_get_plan_execution_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:get_plan_execution_step_states_max_results ->
  execution_id:execution_id ->
  plan_arn:plan_arn ->
  unit ->
  get_plan_execution_request

val make_get_plan_evaluation_status_response :
  ?next_token:next_token ->
  ?warnings:plan_warnings ->
  ?evaluation_state:evaluation_status ->
  ?region:region ->
  ?last_evaluated_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?last_evaluation_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  plan_arn:plan_arn ->
  unit ->
  get_plan_evaluation_status_response

val make_get_plan_evaluation_status_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  plan_arn:plan_arn ->
  unit ->
  get_plan_evaluation_status_request

val make_delete_plan_response : unit -> unit
val make_delete_plan_request : arn:plan_arn -> unit -> delete_plan_request
val make_create_plan_response : ?plan:plan -> unit -> create_plan_response

val make_create_plan_request :
  ?tags:tags ->
  ?primary_region:region ->
  ?report_configuration:report_configuration ->
  ?triggers:trigger_list ->
  ?associated_alarms:associated_alarm_map ->
  ?recovery_time_objective_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  recovery_approach:recovery_approach ->
  regions:region_list ->
  name:plan_name ->
  execution_role:iam_role_arn ->
  workflows:workflow_list ->
  unit ->
  create_plan_request

val make_cancel_plan_execution_response : unit -> unit

val make_cancel_plan_execution_request :
  ?comment:execution_comment ->
  execution_id:execution_id ->
  plan_arn:plan_arn ->
  unit ->
  cancel_plan_execution_request

val make_approve_plan_execution_step_response : unit -> unit

val make_approve_plan_execution_step_request :
  ?comment:execution_comment ->
  approval:approval ->
  step_name:step_name ->
  execution_id:execution_id ->
  plan_arn:plan_arn ->
  unit ->
  approve_plan_execution_step_request
