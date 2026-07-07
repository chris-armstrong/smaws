open Smaws_Lib.Json.SerializeHelpers
open Types

let x_ray_throttle_percent_to_yojson = int_to_yojson
let x_ray_request_count_to_yojson = int_to_yojson
let x_ray_request_average_latency_to_yojson = long_to_yojson
let x_ray_node_type_to_yojson = string_to_yojson
let x_ray_node_name_to_yojson = string_to_yojson
let x_ray_fault_percent_to_yojson = int_to_yojson
let x_ray_error_percent_to_yojson = int_to_yojson
let workload_name_to_yojson = string_to_yojson
let meta_data_value_to_yojson = string_to_yojson
let meta_data_key_to_yojson = string_to_yojson

let workload_meta_data_to_yojson tree =
  map_to_yojson meta_data_key_to_yojson meta_data_value_to_yojson tree

let workload_id_to_yojson = string_to_yojson
let component_name_to_yojson = string_to_yojson

let tier_to_yojson (x : tier) =
  match x with
  | SAP_NETWEAVER_HIGH_AVAILABILITY -> `String "SAP_NETWEAVER_HIGH_AVAILABILITY"
  | SAP_NETWEAVER_DISTRIBUTED -> `String "SAP_NETWEAVER_DISTRIBUTED"
  | SAP_NETWEAVER_STANDARD -> `String "SAP_NETWEAVER_STANDARD"
  | ACTIVE_DIRECTORY -> `String "ACTIVE_DIRECTORY"
  | SHAREPOINT -> `String "SHAREPOINT"
  | SQL_SERVER_FAILOVER_CLUSTER_INSTANCE -> `String "SQL_SERVER_FAILOVER_CLUSTER_INSTANCE"
  | SAP_ASE_HIGH_AVAILABILITY -> `String "SAP_ASE_HIGH_AVAILABILITY"
  | SAP_ASE_SINGLE_NODE -> `String "SAP_ASE_SINGLE_NODE"
  | SAP_HANA_HIGH_AVAILABILITY -> `String "SAP_HANA_HIGH_AVAILABILITY"
  | SAP_HANA_SINGLE_NODE -> `String "SAP_HANA_SINGLE_NODE"
  | SAP_HANA_MULTI_NODE -> `String "SAP_HANA_MULTI_NODE"
  | ORACLE -> `String "ORACLE"
  | JAVA_JMX -> `String "JAVA_JMX"
  | POSTGRESQL -> `String "POSTGRESQL"
  | MYSQL -> `String "MYSQL"
  | SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP -> `String "SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP"
  | SQL_SERVER -> `String "SQL_SERVER"
  | DOT_NET_WEB -> `String "DOT_NET_WEB"
  | DOT_NET_WEB_TIER -> `String "DOT_NET_WEB_TIER"
  | DOT_NET_WORKER -> `String "DOT_NET_WORKER"
  | DOT_NET_CORE -> `String "DOT_NET_CORE"
  | DEFAULT -> `String "DEFAULT"
  | CUSTOM -> `String "CUSTOM"

let remarks_to_yojson = string_to_yojson
let missing_workload_config_to_yojson = bool_to_yojson

let workload_to_yojson (x : workload) =
  assoc_to_yojson
    [
      ( "MissingWorkloadConfig",
        option_to_yojson missing_workload_config_to_yojson x.missing_workload_config );
      ("WorkloadRemarks", option_to_yojson remarks_to_yojson x.workload_remarks);
      ("Tier", option_to_yojson tier_to_yojson x.tier);
      ("WorkloadName", option_to_yojson workload_name_to_yojson x.workload_name);
      ("ComponentName", option_to_yojson component_name_to_yojson x.component_name);
      ("WorkloadId", option_to_yojson workload_id_to_yojson x.workload_id);
    ]

let workload_list_to_yojson tree = list_to_yojson workload_to_yojson tree
let component_configuration_to_yojson = string_to_yojson

let workload_configuration_to_yojson (x : workload_configuration) =
  assoc_to_yojson
    [
      ("Configuration", option_to_yojson component_configuration_to_yojson x.configuration);
      ("Tier", option_to_yojson tier_to_yojson x.tier);
      ("WorkloadName", option_to_yojson workload_name_to_yojson x.workload_name);
    ]

let visibility_to_yojson (x : visibility) =
  match x with VISIBLE -> `String "VISIBLE" | IGNORED -> `String "IGNORED"

let value_to_yojson = double_to_yojson
let error_msg_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_msg_to_yojson x.message) ]

let update_workload_response_to_yojson (x : update_workload_response) =
  assoc_to_yojson
    [
      ( "WorkloadConfiguration",
        option_to_yojson workload_configuration_to_yojson x.workload_configuration );
      ("WorkloadId", option_to_yojson workload_id_to_yojson x.workload_id);
    ]

let resource_group_name_to_yojson = string_to_yojson

let update_workload_request_to_yojson (x : update_workload_request) =
  assoc_to_yojson
    [
      ("WorkloadConfiguration", Some (workload_configuration_to_yojson x.workload_configuration));
      ("WorkloadId", option_to_yojson workload_id_to_yojson x.workload_id);
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_msg_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_msg_to_yojson x.message) ]

let update_status_to_yojson (x : update_status) = match x with RESOLVED -> `String "RESOLVED"
let update_problem_response_to_yojson = unit_to_yojson
let problem_id_to_yojson = string_to_yojson

let update_problem_request_to_yojson (x : update_problem_request) =
  assoc_to_yojson
    [
      ("Visibility", option_to_yojson visibility_to_yojson x.visibility);
      ("UpdateStatus", option_to_yojson update_status_to_yojson x.update_status);
      ("ProblemId", Some (problem_id_to_yojson x.problem_id));
    ]

let log_pattern_set_name_to_yojson = string_to_yojson
let log_pattern_name_to_yojson = string_to_yojson
let log_pattern_regex_to_yojson = string_to_yojson
let log_pattern_rank_to_yojson = int_to_yojson

let log_pattern_to_yojson (x : log_pattern) =
  assoc_to_yojson
    [
      ("Rank", option_to_yojson log_pattern_rank_to_yojson x.rank);
      ("Pattern", option_to_yojson log_pattern_regex_to_yojson x.pattern);
      ("PatternName", option_to_yojson log_pattern_name_to_yojson x.pattern_name);
      ("PatternSetName", option_to_yojson log_pattern_set_name_to_yojson x.pattern_set_name);
    ]

let update_log_pattern_response_to_yojson (x : update_log_pattern_response) =
  assoc_to_yojson
    [
      ("LogPattern", option_to_yojson log_pattern_to_yojson x.log_pattern);
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
    ]

let update_log_pattern_request_to_yojson (x : update_log_pattern_request) =
  assoc_to_yojson
    [
      ("Rank", option_to_yojson log_pattern_rank_to_yojson x.rank);
      ("Pattern", option_to_yojson log_pattern_regex_to_yojson x.pattern);
      ("PatternName", Some (log_pattern_name_to_yojson x.pattern_name));
      ("PatternSetName", Some (log_pattern_set_name_to_yojson x.pattern_set_name));
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_msg_to_yojson x.message) ]

let update_component_response_to_yojson = unit_to_yojson
let custom_component_name_to_yojson = string_to_yojson
let resource_ar_n_to_yojson = string_to_yojson
let resource_list_to_yojson tree = list_to_yojson resource_ar_n_to_yojson tree

let update_component_request_to_yojson (x : update_component_request) =
  assoc_to_yojson
    [
      ("ResourceList", option_to_yojson resource_list_to_yojson x.resource_list);
      ("NewComponentName", option_to_yojson custom_component_name_to_yojson x.new_component_name);
      ("ComponentName", Some (custom_component_name_to_yojson x.component_name));
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let update_component_configuration_response_to_yojson = unit_to_yojson
let monitor_to_yojson = bool_to_yojson
let auto_config_enabled_to_yojson = bool_to_yojson

let update_component_configuration_request_to_yojson (x : update_component_configuration_request) =
  assoc_to_yojson
    [
      ("AutoConfigEnabled", option_to_yojson auto_config_enabled_to_yojson x.auto_config_enabled);
      ( "ComponentConfiguration",
        option_to_yojson component_configuration_to_yojson x.component_configuration );
      ("Tier", option_to_yojson tier_to_yojson x.tier);
      ("Monitor", option_to_yojson monitor_to_yojson x.monitor);
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let account_id_to_yojson = string_to_yojson
let life_cycle_to_yojson = string_to_yojson
let ops_item_sns_topic_arn_to_yojson = string_to_yojson
let sns_notification_arn_to_yojson = string_to_yojson
let ops_center_enabled_to_yojson = bool_to_yojson
let cwe_monitor_enabled_to_yojson = bool_to_yojson

let discovery_type_to_yojson (x : discovery_type) =
  match x with
  | ACCOUNT_BASED -> `String "ACCOUNT_BASED"
  | RESOURCE_GROUP_BASED -> `String "RESOURCE_GROUP_BASED"

let attach_missing_permission_to_yojson = bool_to_yojson

let application_info_to_yojson (x : application_info) =
  assoc_to_yojson
    [
      ( "AttachMissingPermission",
        option_to_yojson attach_missing_permission_to_yojson x.attach_missing_permission );
      ("DiscoveryType", option_to_yojson discovery_type_to_yojson x.discovery_type);
      ("AutoConfigEnabled", option_to_yojson auto_config_enabled_to_yojson x.auto_config_enabled);
      ("Remarks", option_to_yojson remarks_to_yojson x.remarks);
      ("CWEMonitorEnabled", option_to_yojson cwe_monitor_enabled_to_yojson x.cwe_monitor_enabled);
      ("OpsCenterEnabled", option_to_yojson ops_center_enabled_to_yojson x.ops_center_enabled);
      ("SNSNotificationArn", option_to_yojson sns_notification_arn_to_yojson x.sns_notification_arn);
      ( "OpsItemSNSTopicArn",
        option_to_yojson ops_item_sns_topic_arn_to_yojson x.ops_item_sns_topic_arn );
      ("LifeCycle", option_to_yojson life_cycle_to_yojson x.life_cycle);
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let update_application_response_to_yojson (x : update_application_response) =
  assoc_to_yojson
    [ ("ApplicationInfo", option_to_yojson application_info_to_yojson x.application_info) ]

let remove_sns_topic_to_yojson = bool_to_yojson

let update_application_request_to_yojson (x : update_application_request) =
  assoc_to_yojson
    [
      ( "AttachMissingPermission",
        option_to_yojson attach_missing_permission_to_yojson x.attach_missing_permission );
      ("AutoConfigEnabled", option_to_yojson auto_config_enabled_to_yojson x.auto_config_enabled);
      ("RemoveSNSTopic", option_to_yojson remove_sns_topic_to_yojson x.remove_sns_topic);
      ("SNSNotificationArn", option_to_yojson sns_notification_arn_to_yojson x.sns_notification_arn);
      ( "OpsItemSNSTopicArn",
        option_to_yojson ops_item_sns_topic_arn_to_yojson x.ops_item_sns_topic_arn );
      ("CWEMonitorEnabled", option_to_yojson cwe_monitor_enabled_to_yojson x.cwe_monitor_enabled);
      ("OpsCenterEnabled", option_to_yojson ops_center_enabled_to_yojson x.ops_center_enabled);
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let unit__to_yojson = string_to_yojson
let exception_message_to_yojson = string_to_yojson

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("ResourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
    ]

let title_to_yojson = string_to_yojson

let tags_already_exist_exception_to_yojson (x : tags_already_exist_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let status_to_yojson (x : status) =
  match x with
  | RECOVERING -> `String "RECOVERING"
  | RECURRING -> `String "RECURRING"
  | PENDING -> `String "PENDING"
  | RESOLVED -> `String "RESOLVED"
  | IGNORE -> `String "IGNORE"

let states_status_to_yojson = string_to_yojson
let states_input_to_yojson = string_to_yojson
let states_execution_arn_to_yojson = string_to_yojson
let states_arn_to_yojson = string_to_yojson
let start_time_to_yojson = timestamp_epoch_seconds_to_yojson
let source_type_to_yojson = string_to_yojson
let source_ar_n_to_yojson = string_to_yojson
let short_name_to_yojson = string_to_yojson

let severity_level_to_yojson (x : severity_level) =
  match x with
  | High -> `String "High"
  | Medium -> `String "Medium"
  | Low -> `String "Low"
  | Informative -> `String "Informative"

let s3_event_name_to_yojson = string_to_yojson
let resource_type_to_yojson = string_to_yojson

let resolution_method_to_yojson (x : resolution_method) =
  match x with
  | UNRESOLVED -> `String "UNRESOLVED"
  | AUTOMATIC -> `String "AUTOMATIC"
  | MANUAL -> `String "MANUAL"

let remove_workload_response_to_yojson = unit_to_yojson

let remove_workload_request_to_yojson (x : remove_workload_request) =
  assoc_to_yojson
    [
      ("WorkloadId", Some (workload_id_to_yojson x.workload_id));
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let observation_id_to_yojson = string_to_yojson
let end_time_to_yojson = timestamp_epoch_seconds_to_yojson
let log_group_to_yojson = string_to_yojson
let line_time_to_yojson = timestamp_epoch_seconds_to_yojson
let log_text_to_yojson = string_to_yojson

let log_filter_to_yojson (x : log_filter) =
  match x with INFO -> `String "INFO" | WARN -> `String "WARN" | ERROR -> `String "ERROR"

let metric_namespace_to_yojson = string_to_yojson
let metric_name_to_yojson = string_to_yojson
let cloud_watch_event_id_to_yojson = string_to_yojson

let cloud_watch_event_source_to_yojson (x : cloud_watch_event_source) =
  match x with
  | RDS -> `String "RDS"
  | HEALTH -> `String "HEALTH"
  | CODE_DEPLOY -> `String "CODE_DEPLOY"
  | EC2 -> `String "EC2"

let cloud_watch_event_detail_type_to_yojson = string_to_yojson
let health_event_arn_to_yojson = string_to_yojson
let health_service_to_yojson = string_to_yojson
let health_event_type_code_to_yojson = string_to_yojson
let health_event_type_category_to_yojson = string_to_yojson
let health_event_description_to_yojson = string_to_yojson
let code_deploy_deployment_id_to_yojson = string_to_yojson
let code_deploy_deployment_group_to_yojson = string_to_yojson
let code_deploy_state_to_yojson = string_to_yojson
let code_deploy_application_to_yojson = string_to_yojson
let code_deploy_instance_group_id_to_yojson = string_to_yojson
let ec2_state_to_yojson = string_to_yojson
let rds_event_categories_to_yojson = string_to_yojson
let rds_event_message_to_yojson = string_to_yojson
let ebs_event_to_yojson = string_to_yojson
let ebs_result_to_yojson = string_to_yojson
let ebs_cause_to_yojson = string_to_yojson
let ebs_request_id_to_yojson = string_to_yojson

let observation_to_yojson (x : observation) =
  assoc_to_yojson
    [
      ("XRayNodeType", option_to_yojson x_ray_node_type_to_yojson x.x_ray_node_type);
      ("XRayNodeName", option_to_yojson x_ray_node_name_to_yojson x.x_ray_node_name);
      ( "XRayRequestAverageLatency",
        option_to_yojson x_ray_request_average_latency_to_yojson x.x_ray_request_average_latency );
      ("XRayRequestCount", option_to_yojson x_ray_request_count_to_yojson x.x_ray_request_count);
      ("XRayErrorPercent", option_to_yojson x_ray_error_percent_to_yojson x.x_ray_error_percent);
      ( "XRayThrottlePercent",
        option_to_yojson x_ray_throttle_percent_to_yojson x.x_ray_throttle_percent );
      ("XRayFaultPercent", option_to_yojson x_ray_fault_percent_to_yojson x.x_ray_fault_percent);
      ("EbsRequestId", option_to_yojson ebs_request_id_to_yojson x.ebs_request_id);
      ("EbsCause", option_to_yojson ebs_cause_to_yojson x.ebs_cause);
      ("EbsResult", option_to_yojson ebs_result_to_yojson x.ebs_result);
      ("EbsEvent", option_to_yojson ebs_event_to_yojson x.ebs_event);
      ("StatesInput", option_to_yojson states_input_to_yojson x.states_input);
      ("StatesStatus", option_to_yojson states_status_to_yojson x.states_status);
      ("StatesArn", option_to_yojson states_arn_to_yojson x.states_arn);
      ("StatesExecutionArn", option_to_yojson states_execution_arn_to_yojson x.states_execution_arn);
      ("S3EventName", option_to_yojson s3_event_name_to_yojson x.s3_event_name);
      ("RdsEventMessage", option_to_yojson rds_event_message_to_yojson x.rds_event_message);
      ("RdsEventCategories", option_to_yojson rds_event_categories_to_yojson x.rds_event_categories);
      ("Ec2State", option_to_yojson ec2_state_to_yojson x.ec2_state);
      ( "CodeDeployInstanceGroupId",
        option_to_yojson code_deploy_instance_group_id_to_yojson x.code_deploy_instance_group_id );
      ( "CodeDeployApplication",
        option_to_yojson code_deploy_application_to_yojson x.code_deploy_application );
      ("CodeDeployState", option_to_yojson code_deploy_state_to_yojson x.code_deploy_state);
      ( "CodeDeployDeploymentGroup",
        option_to_yojson code_deploy_deployment_group_to_yojson x.code_deploy_deployment_group );
      ( "CodeDeployDeploymentId",
        option_to_yojson code_deploy_deployment_id_to_yojson x.code_deploy_deployment_id );
      ( "HealthEventDescription",
        option_to_yojson health_event_description_to_yojson x.health_event_description );
      ( "HealthEventTypeCategory",
        option_to_yojson health_event_type_category_to_yojson x.health_event_type_category );
      ( "HealthEventTypeCode",
        option_to_yojson health_event_type_code_to_yojson x.health_event_type_code );
      ("HealthService", option_to_yojson health_service_to_yojson x.health_service);
      ("HealthEventArn", option_to_yojson health_event_arn_to_yojson x.health_event_arn);
      ( "CloudWatchEventDetailType",
        option_to_yojson cloud_watch_event_detail_type_to_yojson x.cloud_watch_event_detail_type );
      ( "CloudWatchEventSource",
        option_to_yojson cloud_watch_event_source_to_yojson x.cloud_watch_event_source );
      ("CloudWatchEventId", option_to_yojson cloud_watch_event_id_to_yojson x.cloud_watch_event_id);
      ("Value", option_to_yojson value_to_yojson x.value);
      ("Unit", option_to_yojson unit__to_yojson x.unit_);
      ("MetricName", option_to_yojson metric_name_to_yojson x.metric_name);
      ("MetricNamespace", option_to_yojson metric_namespace_to_yojson x.metric_namespace);
      ("LogFilter", option_to_yojson log_filter_to_yojson x.log_filter);
      ("LogText", option_to_yojson log_text_to_yojson x.log_text);
      ("LineTime", option_to_yojson line_time_to_yojson x.line_time);
      ("LogGroup", option_to_yojson log_group_to_yojson x.log_group);
      ("SourceARN", option_to_yojson source_ar_n_to_yojson x.source_ar_n);
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
      ("EndTime", option_to_yojson end_time_to_yojson x.end_time);
      ("StartTime", option_to_yojson start_time_to_yojson x.start_time);
      ("Id", option_to_yojson observation_id_to_yojson x.id);
    ]

let observation_list_to_yojson tree = list_to_yojson observation_to_yojson tree

let related_observations_to_yojson (x : related_observations) =
  assoc_to_yojson
    [ ("ObservationList", option_to_yojson observation_list_to_yojson x.observation_list) ]

let recurring_count_to_yojson = long_to_yojson

let recommendation_type_to_yojson (x : recommendation_type) =
  match x with
  | ALL -> `String "ALL"
  | WORKLOAD_ONLY -> `String "WORKLOAD_ONLY"
  | INFRA_ONLY -> `String "INFRA_ONLY"

let insights_to_yojson = string_to_yojson
let affected_resource_to_yojson = string_to_yojson

let feedback_value_to_yojson (x : feedback_value) =
  match x with
  | NOT_USEFUL -> `String "NOT_USEFUL"
  | USEFUL -> `String "USEFUL"
  | NOT_SPECIFIED -> `String "NOT_SPECIFIED"

let feedback_key_to_yojson (x : feedback_key) =
  match x with INSIGHTS_FEEDBACK -> `String "INSIGHTS_FEEDBACK"

let feedback_to_yojson tree = map_to_yojson feedback_key_to_yojson feedback_value_to_yojson tree
let last_recurrence_time_to_yojson = timestamp_epoch_seconds_to_yojson

let problem_to_yojson (x : problem) =
  assoc_to_yojson
    [
      ("ResolutionMethod", option_to_yojson resolution_method_to_yojson x.resolution_method);
      ("Visibility", option_to_yojson visibility_to_yojson x.visibility);
      ("LastRecurrenceTime", option_to_yojson last_recurrence_time_to_yojson x.last_recurrence_time);
      ("RecurringCount", option_to_yojson recurring_count_to_yojson x.recurring_count);
      ("Feedback", option_to_yojson feedback_to_yojson x.feedback);
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("SeverityLevel", option_to_yojson severity_level_to_yojson x.severity_level);
      ("EndTime", option_to_yojson end_time_to_yojson x.end_time);
      ("StartTime", option_to_yojson start_time_to_yojson x.start_time);
      ("AffectedResource", option_to_yojson affected_resource_to_yojson x.affected_resource);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("Insights", option_to_yojson insights_to_yojson x.insights);
      ("ShortName", option_to_yojson short_name_to_yojson x.short_name);
      ("Title", option_to_yojson title_to_yojson x.title);
      ("Id", option_to_yojson problem_id_to_yojson x.id);
    ]

let problem_list_to_yojson tree = list_to_yojson problem_to_yojson tree
let pagination_token_to_yojson = string_to_yojson

let os_type_to_yojson (x : os_type) =
  match x with LINUX -> `String "LINUX" | WINDOWS -> `String "WINDOWS"

let max_entities_to_yojson = int_to_yojson
let log_pattern_set_list_to_yojson tree = list_to_yojson log_pattern_set_name_to_yojson tree
let log_pattern_list_to_yojson tree = list_to_yojson log_pattern_to_yojson tree

let list_workloads_response_to_yojson (x : list_workloads_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("WorkloadList", option_to_yojson workload_list_to_yojson x.workload_list);
    ]

let list_workloads_request_to_yojson (x : list_workloads_request) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_entities_to_yojson x.max_results);
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let list_problems_response_to_yojson (x : list_problems_response) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ProblemList", option_to_yojson problem_list_to_yojson x.problem_list);
    ]

let list_problems_request_to_yojson (x : list_problems_request) =
  assoc_to_yojson
    [
      ("Visibility", option_to_yojson visibility_to_yojson x.visibility);
      ("ComponentName", option_to_yojson component_name_to_yojson x.component_name);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_entities_to_yojson x.max_results);
      ("EndTime", option_to_yojson end_time_to_yojson x.end_time);
      ("StartTime", option_to_yojson start_time_to_yojson x.start_time);
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let list_log_patterns_response_to_yojson (x : list_log_patterns_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("LogPatterns", option_to_yojson log_pattern_list_to_yojson x.log_patterns);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
    ]

let list_log_patterns_request_to_yojson (x : list_log_patterns_request) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_entities_to_yojson x.max_results);
      ("PatternSetName", option_to_yojson log_pattern_set_name_to_yojson x.pattern_set_name);
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let list_log_pattern_sets_response_to_yojson (x : list_log_pattern_sets_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("LogPatternSets", option_to_yojson log_pattern_set_list_to_yojson x.log_pattern_sets);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
    ]

let list_log_pattern_sets_request_to_yojson (x : list_log_pattern_sets_request) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_entities_to_yojson x.max_results);
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let configuration_event_monitored_resource_ar_n_to_yojson = string_to_yojson

let configuration_event_status_to_yojson (x : configuration_event_status) =
  match x with ERROR -> `String "ERROR" | WARN -> `String "WARN" | INFO -> `String "INFO"

let configuration_event_resource_type_to_yojson (x : configuration_event_resource_type) =
  match x with
  | SSM_ASSOCIATION -> `String "SSM_ASSOCIATION"
  | CLOUDFORMATION -> `String "CLOUDFORMATION"
  | CLOUDWATCH_LOG -> `String "CLOUDWATCH_LOG"
  | CLOUDWATCH_ALARM -> `String "CLOUDWATCH_ALARM"

let configuration_event_time_to_yojson = timestamp_epoch_seconds_to_yojson
let configuration_event_detail_to_yojson = string_to_yojson
let configuration_event_resource_name_to_yojson = string_to_yojson

let configuration_event_to_yojson (x : configuration_event) =
  assoc_to_yojson
    [
      ( "EventResourceName",
        option_to_yojson configuration_event_resource_name_to_yojson x.event_resource_name );
      ("EventDetail", option_to_yojson configuration_event_detail_to_yojson x.event_detail);
      ("EventTime", option_to_yojson configuration_event_time_to_yojson x.event_time);
      ( "EventResourceType",
        option_to_yojson configuration_event_resource_type_to_yojson x.event_resource_type );
      ("EventStatus", option_to_yojson configuration_event_status_to_yojson x.event_status);
      ( "MonitoredResourceARN",
        option_to_yojson configuration_event_monitored_resource_ar_n_to_yojson
          x.monitored_resource_ar_n );
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
    ]

let configuration_event_list_to_yojson tree = list_to_yojson configuration_event_to_yojson tree

let list_configuration_history_response_to_yojson (x : list_configuration_history_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("EventList", option_to_yojson configuration_event_list_to_yojson x.event_list);
    ]

let list_configuration_history_request_to_yojson (x : list_configuration_history_request) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_entities_to_yojson x.max_results);
      ("EventStatus", option_to_yojson configuration_event_status_to_yojson x.event_status);
      ("EndTime", option_to_yojson end_time_to_yojson x.end_time);
      ("StartTime", option_to_yojson start_time_to_yojson x.start_time);
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
    ]

let detected_workload_to_yojson tree =
  map_to_yojson tier_to_yojson workload_meta_data_to_yojson tree

let application_component_to_yojson (x : application_component) =
  assoc_to_yojson
    [
      ("DetectedWorkload", option_to_yojson detected_workload_to_yojson x.detected_workload);
      ("Monitor", option_to_yojson monitor_to_yojson x.monitor);
      ("Tier", option_to_yojson tier_to_yojson x.tier);
      ("OsType", option_to_yojson os_type_to_yojson x.os_type);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ComponentRemarks", option_to_yojson remarks_to_yojson x.component_remarks);
      ("ComponentName", option_to_yojson component_name_to_yojson x.component_name);
    ]

let application_component_list_to_yojson tree = list_to_yojson application_component_to_yojson tree

let list_components_response_to_yojson (x : list_components_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "ApplicationComponentList",
        option_to_yojson application_component_list_to_yojson x.application_component_list );
    ]

let list_components_request_to_yojson (x : list_components_request) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_entities_to_yojson x.max_results);
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let application_info_list_to_yojson tree = list_to_yojson application_info_to_yojson tree

let list_applications_response_to_yojson (x : list_applications_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "ApplicationInfoList",
        option_to_yojson application_info_list_to_yojson x.application_info_list );
    ]

let list_applications_request_to_yojson (x : list_applications_request) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_entities_to_yojson x.max_results);
    ]

let grouping_type_to_yojson (x : grouping_type) =
  match x with ACCOUNT_BASED -> `String "ACCOUNT_BASED"

let describe_workload_response_to_yojson (x : describe_workload_response) =
  assoc_to_yojson
    [
      ( "WorkloadConfiguration",
        option_to_yojson workload_configuration_to_yojson x.workload_configuration );
      ("WorkloadRemarks", option_to_yojson remarks_to_yojson x.workload_remarks);
      ("WorkloadId", option_to_yojson workload_id_to_yojson x.workload_id);
    ]

let describe_workload_request_to_yojson (x : describe_workload_request) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("WorkloadId", Some (workload_id_to_yojson x.workload_id));
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let describe_problem_observations_response_to_yojson (x : describe_problem_observations_response) =
  assoc_to_yojson
    [
      ("RelatedObservations", option_to_yojson related_observations_to_yojson x.related_observations);
    ]

let describe_problem_observations_request_to_yojson (x : describe_problem_observations_request) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("ProblemId", Some (problem_id_to_yojson x.problem_id));
    ]

let describe_problem_response_to_yojson (x : describe_problem_response) =
  assoc_to_yojson
    [
      ("SNSNotificationArn", option_to_yojson sns_notification_arn_to_yojson x.sns_notification_arn);
      ("Problem", option_to_yojson problem_to_yojson x.problem);
    ]

let describe_problem_request_to_yojson (x : describe_problem_request) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("ProblemId", Some (problem_id_to_yojson x.problem_id));
    ]

let describe_observation_response_to_yojson (x : describe_observation_response) =
  assoc_to_yojson [ ("Observation", option_to_yojson observation_to_yojson x.observation) ]

let describe_observation_request_to_yojson (x : describe_observation_request) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("ObservationId", Some (observation_id_to_yojson x.observation_id));
    ]

let describe_log_pattern_response_to_yojson (x : describe_log_pattern_response) =
  assoc_to_yojson
    [
      ("LogPattern", option_to_yojson log_pattern_to_yojson x.log_pattern);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
    ]

let describe_log_pattern_request_to_yojson (x : describe_log_pattern_request) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("PatternName", Some (log_pattern_name_to_yojson x.pattern_name));
      ("PatternSetName", Some (log_pattern_set_name_to_yojson x.pattern_set_name));
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let describe_component_configuration_recommendation_response_to_yojson
    (x : describe_component_configuration_recommendation_response) =
  assoc_to_yojson
    [
      ( "ComponentConfiguration",
        option_to_yojson component_configuration_to_yojson x.component_configuration );
    ]

let describe_component_configuration_recommendation_request_to_yojson
    (x : describe_component_configuration_recommendation_request) =
  assoc_to_yojson
    [
      ("RecommendationType", option_to_yojson recommendation_type_to_yojson x.recommendation_type);
      ("WorkloadName", option_to_yojson workload_name_to_yojson x.workload_name);
      ("Tier", Some (tier_to_yojson x.tier));
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let describe_component_configuration_response_to_yojson
    (x : describe_component_configuration_response) =
  assoc_to_yojson
    [
      ( "ComponentConfiguration",
        option_to_yojson component_configuration_to_yojson x.component_configuration );
      ("Tier", option_to_yojson tier_to_yojson x.tier);
      ("Monitor", option_to_yojson monitor_to_yojson x.monitor);
    ]

let describe_component_configuration_request_to_yojson
    (x : describe_component_configuration_request) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let describe_component_response_to_yojson (x : describe_component_response) =
  assoc_to_yojson
    [
      ("ResourceList", option_to_yojson resource_list_to_yojson x.resource_list);
      ( "ApplicationComponent",
        option_to_yojson application_component_to_yojson x.application_component );
    ]

let describe_component_request_to_yojson (x : describe_component_request) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let describe_application_response_to_yojson (x : describe_application_response) =
  assoc_to_yojson
    [ ("ApplicationInfo", option_to_yojson application_info_to_yojson x.application_info) ]

let describe_application_request_to_yojson (x : describe_application_request) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let bad_request_exception_to_yojson (x : bad_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_msg_to_yojson x.message) ]

let delete_log_pattern_response_to_yojson = unit_to_yojson

let delete_log_pattern_request_to_yojson (x : delete_log_pattern_request) =
  assoc_to_yojson
    [
      ("PatternName", Some (log_pattern_name_to_yojson x.pattern_name));
      ("PatternSetName", Some (log_pattern_set_name_to_yojson x.pattern_set_name));
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let delete_component_response_to_yojson = unit_to_yojson

let delete_component_request_to_yojson (x : delete_component_request) =
  assoc_to_yojson
    [
      ("ComponentName", Some (custom_component_name_to_yojson x.component_name));
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let delete_application_response_to_yojson = unit_to_yojson

let delete_application_request_to_yojson (x : delete_application_request) =
  assoc_to_yojson
    [ ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name)) ]

let create_log_pattern_response_to_yojson (x : create_log_pattern_response) =
  assoc_to_yojson
    [
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
      ("LogPattern", option_to_yojson log_pattern_to_yojson x.log_pattern);
    ]

let create_log_pattern_request_to_yojson (x : create_log_pattern_request) =
  assoc_to_yojson
    [
      ("Rank", Some (log_pattern_rank_to_yojson x.rank));
      ("Pattern", Some (log_pattern_regex_to_yojson x.pattern));
      ("PatternName", Some (log_pattern_name_to_yojson x.pattern_name));
      ("PatternSetName", Some (log_pattern_set_name_to_yojson x.pattern_set_name));
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let create_component_response_to_yojson = unit_to_yojson

let create_component_request_to_yojson (x : create_component_request) =
  assoc_to_yojson
    [
      ("ResourceList", Some (resource_list_to_yojson x.resource_list));
      ("ComponentName", Some (custom_component_name_to_yojson x.component_name));
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_msg_to_yojson x.message) ]

let create_application_response_to_yojson (x : create_application_response) =
  assoc_to_yojson
    [ ("ApplicationInfo", option_to_yojson application_info_to_yojson x.application_info) ]

let auto_create_to_yojson = bool_to_yojson

let create_application_request_to_yojson (x : create_application_request) =
  assoc_to_yojson
    [
      ( "AttachMissingPermission",
        option_to_yojson attach_missing_permission_to_yojson x.attach_missing_permission );
      ("GroupingType", option_to_yojson grouping_type_to_yojson x.grouping_type);
      ("AutoCreate", option_to_yojson auto_create_to_yojson x.auto_create);
      ("AutoConfigEnabled", option_to_yojson auto_config_enabled_to_yojson x.auto_config_enabled);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("SNSNotificationArn", option_to_yojson sns_notification_arn_to_yojson x.sns_notification_arn);
      ( "OpsItemSNSTopicArn",
        option_to_yojson ops_item_sns_topic_arn_to_yojson x.ops_item_sns_topic_arn );
      ("CWEMonitorEnabled", option_to_yojson cwe_monitor_enabled_to_yojson x.cwe_monitor_enabled);
      ("OpsCenterEnabled", option_to_yojson ops_center_enabled_to_yojson x.ops_center_enabled);
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
    ]

let add_workload_response_to_yojson (x : add_workload_response) =
  assoc_to_yojson
    [
      ( "WorkloadConfiguration",
        option_to_yojson workload_configuration_to_yojson x.workload_configuration );
      ("WorkloadId", option_to_yojson workload_id_to_yojson x.workload_id);
    ]

let add_workload_request_to_yojson (x : add_workload_request) =
  assoc_to_yojson
    [
      ("WorkloadConfiguration", Some (workload_configuration_to_yojson x.workload_configuration));
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
    ]
