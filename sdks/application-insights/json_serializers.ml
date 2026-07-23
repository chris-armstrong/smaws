open Smaws_Lib.Json.SerializeHelpers
open Types

let error_msg_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_msg_to_yojson x.message) ]

let account_id_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_msg_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_msg_to_yojson x.message) ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_msg_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_msg_to_yojson x.message) ]

let component_configuration_to_yojson = string_to_yojson

let tier_to_yojson (x : tier) =
  match x with
  | CUSTOM -> `String "CUSTOM"
  | DEFAULT -> `String "DEFAULT"
  | DOT_NET_CORE -> `String "DOT_NET_CORE"
  | DOT_NET_WORKER -> `String "DOT_NET_WORKER"
  | DOT_NET_WEB_TIER -> `String "DOT_NET_WEB_TIER"
  | DOT_NET_WEB -> `String "DOT_NET_WEB"
  | SQL_SERVER -> `String "SQL_SERVER"
  | SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP -> `String "SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP"
  | MYSQL -> `String "MYSQL"
  | POSTGRESQL -> `String "POSTGRESQL"
  | JAVA_JMX -> `String "JAVA_JMX"
  | ORACLE -> `String "ORACLE"
  | SAP_HANA_MULTI_NODE -> `String "SAP_HANA_MULTI_NODE"
  | SAP_HANA_SINGLE_NODE -> `String "SAP_HANA_SINGLE_NODE"
  | SAP_HANA_HIGH_AVAILABILITY -> `String "SAP_HANA_HIGH_AVAILABILITY"
  | SAP_ASE_SINGLE_NODE -> `String "SAP_ASE_SINGLE_NODE"
  | SAP_ASE_HIGH_AVAILABILITY -> `String "SAP_ASE_HIGH_AVAILABILITY"
  | SQL_SERVER_FAILOVER_CLUSTER_INSTANCE -> `String "SQL_SERVER_FAILOVER_CLUSTER_INSTANCE"
  | SHAREPOINT -> `String "SHAREPOINT"
  | ACTIVE_DIRECTORY -> `String "ACTIVE_DIRECTORY"
  | SAP_NETWEAVER_STANDARD -> `String "SAP_NETWEAVER_STANDARD"
  | SAP_NETWEAVER_DISTRIBUTED -> `String "SAP_NETWEAVER_DISTRIBUTED"
  | SAP_NETWEAVER_HIGH_AVAILABILITY -> `String "SAP_NETWEAVER_HIGH_AVAILABILITY"

let workload_name_to_yojson = string_to_yojson

let workload_configuration_to_yojson (x : workload_configuration) =
  assoc_to_yojson
    [
      ("WorkloadName", option_to_yojson workload_name_to_yojson x.workload_name);
      ("Tier", option_to_yojson tier_to_yojson x.tier);
      ("Configuration", option_to_yojson component_configuration_to_yojson x.configuration);
    ]

let workload_id_to_yojson = string_to_yojson

let add_workload_response_to_yojson (x : add_workload_response) =
  assoc_to_yojson
    [
      ("WorkloadId", option_to_yojson workload_id_to_yojson x.workload_id);
      ( "WorkloadConfiguration",
        option_to_yojson workload_configuration_to_yojson x.workload_configuration );
    ]

let component_name_to_yojson = string_to_yojson
let resource_group_name_to_yojson = string_to_yojson

let add_workload_request_to_yojson (x : add_workload_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("WorkloadConfiguration", Some (workload_configuration_to_yojson x.workload_configuration));
    ]

let affected_resource_to_yojson = string_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let meta_data_value_to_yojson = string_to_yojson
let meta_data_key_to_yojson = string_to_yojson

let workload_meta_data_to_yojson tree =
  map_to_yojson meta_data_key_to_yojson meta_data_value_to_yojson tree

let detected_workload_to_yojson tree =
  map_to_yojson tier_to_yojson workload_meta_data_to_yojson tree

let monitor_to_yojson = bool_to_yojson

let os_type_to_yojson (x : os_type) =
  match x with WINDOWS -> `String "WINDOWS" | LINUX -> `String "LINUX"

let resource_type_to_yojson = string_to_yojson
let remarks_to_yojson = string_to_yojson

let application_component_to_yojson (x : application_component) =
  assoc_to_yojson
    [
      ("ComponentName", option_to_yojson component_name_to_yojson x.component_name);
      ("ComponentRemarks", option_to_yojson remarks_to_yojson x.component_remarks);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("OsType", option_to_yojson os_type_to_yojson x.os_type);
      ("Tier", option_to_yojson tier_to_yojson x.tier);
      ("Monitor", option_to_yojson monitor_to_yojson x.monitor);
      ("DetectedWorkload", option_to_yojson detected_workload_to_yojson x.detected_workload);
    ]

let application_component_list_to_yojson tree = list_to_yojson application_component_to_yojson tree
let attach_missing_permission_to_yojson = bool_to_yojson

let discovery_type_to_yojson (x : discovery_type) =
  match x with
  | RESOURCE_GROUP_BASED -> `String "RESOURCE_GROUP_BASED"
  | ACCOUNT_BASED -> `String "ACCOUNT_BASED"

let auto_config_enabled_to_yojson = bool_to_yojson
let cwe_monitor_enabled_to_yojson = bool_to_yojson
let ops_center_enabled_to_yojson = bool_to_yojson
let sns_notification_arn_to_yojson = string_to_yojson
let ops_item_sns_topic_arn_to_yojson = string_to_yojson
let life_cycle_to_yojson = string_to_yojson

let application_info_to_yojson (x : application_info) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
      ("LifeCycle", option_to_yojson life_cycle_to_yojson x.life_cycle);
      ( "OpsItemSNSTopicArn",
        option_to_yojson ops_item_sns_topic_arn_to_yojson x.ops_item_sns_topic_arn );
      ("SNSNotificationArn", option_to_yojson sns_notification_arn_to_yojson x.sns_notification_arn);
      ("OpsCenterEnabled", option_to_yojson ops_center_enabled_to_yojson x.ops_center_enabled);
      ("CWEMonitorEnabled", option_to_yojson cwe_monitor_enabled_to_yojson x.cwe_monitor_enabled);
      ("Remarks", option_to_yojson remarks_to_yojson x.remarks);
      ("AutoConfigEnabled", option_to_yojson auto_config_enabled_to_yojson x.auto_config_enabled);
      ("DiscoveryType", option_to_yojson discovery_type_to_yojson x.discovery_type);
      ( "AttachMissingPermission",
        option_to_yojson attach_missing_permission_to_yojson x.attach_missing_permission );
    ]

let application_info_list_to_yojson tree = list_to_yojson application_info_to_yojson tree
let auto_create_to_yojson = bool_to_yojson

let bad_request_exception_to_yojson (x : bad_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_msg_to_yojson x.message) ]

let cloud_watch_event_detail_type_to_yojson = string_to_yojson
let cloud_watch_event_id_to_yojson = string_to_yojson

let cloud_watch_event_source_to_yojson (x : cloud_watch_event_source) =
  match x with
  | EC2 -> `String "EC2"
  | CODE_DEPLOY -> `String "CODE_DEPLOY"
  | HEALTH -> `String "HEALTH"
  | RDS -> `String "RDS"

let code_deploy_application_to_yojson = string_to_yojson
let code_deploy_deployment_group_to_yojson = string_to_yojson
let code_deploy_deployment_id_to_yojson = string_to_yojson
let code_deploy_instance_group_id_to_yojson = string_to_yojson
let code_deploy_state_to_yojson = string_to_yojson
let configuration_event_resource_name_to_yojson = string_to_yojson
let configuration_event_detail_to_yojson = string_to_yojson
let configuration_event_time_to_yojson = timestamp_epoch_seconds_to_yojson

let configuration_event_resource_type_to_yojson (x : configuration_event_resource_type) =
  match x with
  | CLOUDWATCH_ALARM -> `String "CLOUDWATCH_ALARM"
  | CLOUDWATCH_LOG -> `String "CLOUDWATCH_LOG"
  | CLOUDFORMATION -> `String "CLOUDFORMATION"
  | SSM_ASSOCIATION -> `String "SSM_ASSOCIATION"

let configuration_event_status_to_yojson (x : configuration_event_status) =
  match x with INFO -> `String "INFO" | WARN -> `String "WARN" | ERROR -> `String "ERROR"

let configuration_event_monitored_resource_ar_n_to_yojson = string_to_yojson

let configuration_event_to_yojson (x : configuration_event) =
  assoc_to_yojson
    [
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "MonitoredResourceARN",
        option_to_yojson configuration_event_monitored_resource_ar_n_to_yojson
          x.monitored_resource_ar_n );
      ("EventStatus", option_to_yojson configuration_event_status_to_yojson x.event_status);
      ( "EventResourceType",
        option_to_yojson configuration_event_resource_type_to_yojson x.event_resource_type );
      ("EventTime", option_to_yojson configuration_event_time_to_yojson x.event_time);
      ("EventDetail", option_to_yojson configuration_event_detail_to_yojson x.event_detail);
      ( "EventResourceName",
        option_to_yojson configuration_event_resource_name_to_yojson x.event_resource_name );
    ]

let configuration_event_list_to_yojson tree = list_to_yojson configuration_event_to_yojson tree
let exception_message_to_yojson = string_to_yojson

let tags_already_exist_exception_to_yojson (x : tags_already_exist_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let create_application_response_to_yojson (x : create_application_response) =
  assoc_to_yojson
    [ ("ApplicationInfo", option_to_yojson application_info_to_yojson x.application_info) ]

let grouping_type_to_yojson (x : grouping_type) =
  match x with ACCOUNT_BASED -> `String "ACCOUNT_BASED"

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let create_application_request_to_yojson (x : create_application_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
      ("OpsCenterEnabled", option_to_yojson ops_center_enabled_to_yojson x.ops_center_enabled);
      ("CWEMonitorEnabled", option_to_yojson cwe_monitor_enabled_to_yojson x.cwe_monitor_enabled);
      ( "OpsItemSNSTopicArn",
        option_to_yojson ops_item_sns_topic_arn_to_yojson x.ops_item_sns_topic_arn );
      ("SNSNotificationArn", option_to_yojson sns_notification_arn_to_yojson x.sns_notification_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("AutoConfigEnabled", option_to_yojson auto_config_enabled_to_yojson x.auto_config_enabled);
      ("AutoCreate", option_to_yojson auto_create_to_yojson x.auto_create);
      ("GroupingType", option_to_yojson grouping_type_to_yojson x.grouping_type);
      ( "AttachMissingPermission",
        option_to_yojson attach_missing_permission_to_yojson x.attach_missing_permission );
    ]

let create_component_response_to_yojson = unit_to_yojson
let resource_ar_n_to_yojson = string_to_yojson
let resource_list_to_yojson tree = list_to_yojson resource_ar_n_to_yojson tree
let custom_component_name_to_yojson = string_to_yojson

let create_component_request_to_yojson (x : create_component_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("ComponentName", Some (custom_component_name_to_yojson x.component_name));
      ("ResourceList", Some (resource_list_to_yojson x.resource_list));
    ]

let log_pattern_rank_to_yojson = int_to_yojson
let log_pattern_regex_to_yojson = string_to_yojson
let log_pattern_name_to_yojson = string_to_yojson
let log_pattern_set_name_to_yojson = string_to_yojson

let log_pattern_to_yojson (x : log_pattern) =
  assoc_to_yojson
    [
      ("PatternSetName", option_to_yojson log_pattern_set_name_to_yojson x.pattern_set_name);
      ("PatternName", option_to_yojson log_pattern_name_to_yojson x.pattern_name);
      ("Pattern", option_to_yojson log_pattern_regex_to_yojson x.pattern);
      ("Rank", option_to_yojson log_pattern_rank_to_yojson x.rank);
    ]

let create_log_pattern_response_to_yojson (x : create_log_pattern_response) =
  assoc_to_yojson
    [
      ("LogPattern", option_to_yojson log_pattern_to_yojson x.log_pattern);
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
    ]

let create_log_pattern_request_to_yojson (x : create_log_pattern_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("PatternSetName", Some (log_pattern_set_name_to_yojson x.pattern_set_name));
      ("PatternName", Some (log_pattern_name_to_yojson x.pattern_name));
      ("Pattern", Some (log_pattern_regex_to_yojson x.pattern));
      ("Rank", Some (log_pattern_rank_to_yojson x.rank));
    ]

let delete_application_response_to_yojson = unit_to_yojson

let delete_application_request_to_yojson (x : delete_application_request) =
  assoc_to_yojson
    [ ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name)) ]

let delete_component_response_to_yojson = unit_to_yojson

let delete_component_request_to_yojson (x : delete_component_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("ComponentName", Some (custom_component_name_to_yojson x.component_name));
    ]

let delete_log_pattern_response_to_yojson = unit_to_yojson

let delete_log_pattern_request_to_yojson (x : delete_log_pattern_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("PatternSetName", Some (log_pattern_set_name_to_yojson x.pattern_set_name));
      ("PatternName", Some (log_pattern_name_to_yojson x.pattern_name));
    ]

let describe_application_response_to_yojson (x : describe_application_response) =
  assoc_to_yojson
    [ ("ApplicationInfo", option_to_yojson application_info_to_yojson x.application_info) ]

let describe_application_request_to_yojson (x : describe_application_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let describe_component_response_to_yojson (x : describe_component_response) =
  assoc_to_yojson
    [
      ( "ApplicationComponent",
        option_to_yojson application_component_to_yojson x.application_component );
      ("ResourceList", option_to_yojson resource_list_to_yojson x.resource_list);
    ]

let describe_component_request_to_yojson (x : describe_component_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let describe_component_configuration_response_to_yojson
    (x : describe_component_configuration_response) =
  assoc_to_yojson
    [
      ("Monitor", option_to_yojson monitor_to_yojson x.monitor);
      ("Tier", option_to_yojson tier_to_yojson x.tier);
      ( "ComponentConfiguration",
        option_to_yojson component_configuration_to_yojson x.component_configuration );
    ]

let describe_component_configuration_request_to_yojson
    (x : describe_component_configuration_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let describe_component_configuration_recommendation_response_to_yojson
    (x : describe_component_configuration_recommendation_response) =
  assoc_to_yojson
    [
      ( "ComponentConfiguration",
        option_to_yojson component_configuration_to_yojson x.component_configuration );
    ]

let recommendation_type_to_yojson (x : recommendation_type) =
  match x with
  | INFRA_ONLY -> `String "INFRA_ONLY"
  | WORKLOAD_ONLY -> `String "WORKLOAD_ONLY"
  | ALL -> `String "ALL"

let describe_component_configuration_recommendation_request_to_yojson
    (x : describe_component_configuration_recommendation_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("Tier", Some (tier_to_yojson x.tier));
      ("WorkloadName", option_to_yojson workload_name_to_yojson x.workload_name);
      ("RecommendationType", option_to_yojson recommendation_type_to_yojson x.recommendation_type);
    ]

let describe_log_pattern_response_to_yojson (x : describe_log_pattern_response) =
  assoc_to_yojson
    [
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("LogPattern", option_to_yojson log_pattern_to_yojson x.log_pattern);
    ]

let describe_log_pattern_request_to_yojson (x : describe_log_pattern_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("PatternSetName", Some (log_pattern_set_name_to_yojson x.pattern_set_name));
      ("PatternName", Some (log_pattern_name_to_yojson x.pattern_name));
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let x_ray_node_type_to_yojson = string_to_yojson
let x_ray_node_name_to_yojson = string_to_yojson
let x_ray_request_average_latency_to_yojson = long_to_yojson
let x_ray_request_count_to_yojson = int_to_yojson
let x_ray_error_percent_to_yojson = int_to_yojson
let x_ray_throttle_percent_to_yojson = int_to_yojson
let x_ray_fault_percent_to_yojson = int_to_yojson
let ebs_request_id_to_yojson = string_to_yojson
let ebs_cause_to_yojson = string_to_yojson
let ebs_result_to_yojson = string_to_yojson
let ebs_event_to_yojson = string_to_yojson
let states_input_to_yojson = string_to_yojson
let states_status_to_yojson = string_to_yojson
let states_arn_to_yojson = string_to_yojson
let states_execution_arn_to_yojson = string_to_yojson
let s3_event_name_to_yojson = string_to_yojson
let rds_event_message_to_yojson = string_to_yojson
let rds_event_categories_to_yojson = string_to_yojson
let ec2_state_to_yojson = string_to_yojson
let health_event_description_to_yojson = string_to_yojson
let health_event_type_category_to_yojson = string_to_yojson
let health_event_type_code_to_yojson = string_to_yojson
let health_service_to_yojson = string_to_yojson
let health_event_arn_to_yojson = string_to_yojson
let value_to_yojson = double_to_yojson
let unit__to_yojson = string_to_yojson
let metric_name_to_yojson = string_to_yojson
let metric_namespace_to_yojson = string_to_yojson

let log_filter_to_yojson (x : log_filter) =
  match x with ERROR -> `String "ERROR" | WARN -> `String "WARN" | INFO -> `String "INFO"

let log_text_to_yojson = string_to_yojson
let line_time_to_yojson = timestamp_epoch_seconds_to_yojson
let log_group_to_yojson = string_to_yojson
let source_ar_n_to_yojson = string_to_yojson
let source_type_to_yojson = string_to_yojson
let end_time_to_yojson = timestamp_epoch_seconds_to_yojson
let start_time_to_yojson = timestamp_epoch_seconds_to_yojson
let observation_id_to_yojson = string_to_yojson

let observation_to_yojson (x : observation) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson observation_id_to_yojson x.id);
      ("StartTime", option_to_yojson start_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson end_time_to_yojson x.end_time);
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
      ("SourceARN", option_to_yojson source_ar_n_to_yojson x.source_ar_n);
      ("LogGroup", option_to_yojson log_group_to_yojson x.log_group);
      ("LineTime", option_to_yojson line_time_to_yojson x.line_time);
      ("LogText", option_to_yojson log_text_to_yojson x.log_text);
      ("LogFilter", option_to_yojson log_filter_to_yojson x.log_filter);
      ("MetricNamespace", option_to_yojson metric_namespace_to_yojson x.metric_namespace);
      ("MetricName", option_to_yojson metric_name_to_yojson x.metric_name);
      ("Unit", option_to_yojson unit__to_yojson x.unit_);
      ("Value", option_to_yojson value_to_yojson x.value);
      ("CloudWatchEventId", option_to_yojson cloud_watch_event_id_to_yojson x.cloud_watch_event_id);
      ( "CloudWatchEventSource",
        option_to_yojson cloud_watch_event_source_to_yojson x.cloud_watch_event_source );
      ( "CloudWatchEventDetailType",
        option_to_yojson cloud_watch_event_detail_type_to_yojson x.cloud_watch_event_detail_type );
      ("HealthEventArn", option_to_yojson health_event_arn_to_yojson x.health_event_arn);
      ("HealthService", option_to_yojson health_service_to_yojson x.health_service);
      ( "HealthEventTypeCode",
        option_to_yojson health_event_type_code_to_yojson x.health_event_type_code );
      ( "HealthEventTypeCategory",
        option_to_yojson health_event_type_category_to_yojson x.health_event_type_category );
      ( "HealthEventDescription",
        option_to_yojson health_event_description_to_yojson x.health_event_description );
      ( "CodeDeployDeploymentId",
        option_to_yojson code_deploy_deployment_id_to_yojson x.code_deploy_deployment_id );
      ( "CodeDeployDeploymentGroup",
        option_to_yojson code_deploy_deployment_group_to_yojson x.code_deploy_deployment_group );
      ("CodeDeployState", option_to_yojson code_deploy_state_to_yojson x.code_deploy_state);
      ( "CodeDeployApplication",
        option_to_yojson code_deploy_application_to_yojson x.code_deploy_application );
      ( "CodeDeployInstanceGroupId",
        option_to_yojson code_deploy_instance_group_id_to_yojson x.code_deploy_instance_group_id );
      ("Ec2State", option_to_yojson ec2_state_to_yojson x.ec2_state);
      ("RdsEventCategories", option_to_yojson rds_event_categories_to_yojson x.rds_event_categories);
      ("RdsEventMessage", option_to_yojson rds_event_message_to_yojson x.rds_event_message);
      ("S3EventName", option_to_yojson s3_event_name_to_yojson x.s3_event_name);
      ("StatesExecutionArn", option_to_yojson states_execution_arn_to_yojson x.states_execution_arn);
      ("StatesArn", option_to_yojson states_arn_to_yojson x.states_arn);
      ("StatesStatus", option_to_yojson states_status_to_yojson x.states_status);
      ("StatesInput", option_to_yojson states_input_to_yojson x.states_input);
      ("EbsEvent", option_to_yojson ebs_event_to_yojson x.ebs_event);
      ("EbsResult", option_to_yojson ebs_result_to_yojson x.ebs_result);
      ("EbsCause", option_to_yojson ebs_cause_to_yojson x.ebs_cause);
      ("EbsRequestId", option_to_yojson ebs_request_id_to_yojson x.ebs_request_id);
      ("XRayFaultPercent", option_to_yojson x_ray_fault_percent_to_yojson x.x_ray_fault_percent);
      ( "XRayThrottlePercent",
        option_to_yojson x_ray_throttle_percent_to_yojson x.x_ray_throttle_percent );
      ("XRayErrorPercent", option_to_yojson x_ray_error_percent_to_yojson x.x_ray_error_percent);
      ("XRayRequestCount", option_to_yojson x_ray_request_count_to_yojson x.x_ray_request_count);
      ( "XRayRequestAverageLatency",
        option_to_yojson x_ray_request_average_latency_to_yojson x.x_ray_request_average_latency );
      ("XRayNodeName", option_to_yojson x_ray_node_name_to_yojson x.x_ray_node_name);
      ("XRayNodeType", option_to_yojson x_ray_node_type_to_yojson x.x_ray_node_type);
    ]

let describe_observation_response_to_yojson (x : describe_observation_response) =
  assoc_to_yojson [ ("Observation", option_to_yojson observation_to_yojson x.observation) ]

let describe_observation_request_to_yojson (x : describe_observation_request) =
  assoc_to_yojson
    [
      ("ObservationId", Some (observation_id_to_yojson x.observation_id));
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let resolution_method_to_yojson (x : resolution_method) =
  match x with
  | MANUAL -> `String "MANUAL"
  | AUTOMATIC -> `String "AUTOMATIC"
  | UNRESOLVED -> `String "UNRESOLVED"

let visibility_to_yojson (x : visibility) =
  match x with IGNORED -> `String "IGNORED" | VISIBLE -> `String "VISIBLE"

let last_recurrence_time_to_yojson = timestamp_epoch_seconds_to_yojson
let recurring_count_to_yojson = long_to_yojson

let feedback_value_to_yojson (x : feedback_value) =
  match x with
  | NOT_SPECIFIED -> `String "NOT_SPECIFIED"
  | USEFUL -> `String "USEFUL"
  | NOT_USEFUL -> `String "NOT_USEFUL"

let feedback_key_to_yojson (x : feedback_key) =
  match x with INSIGHTS_FEEDBACK -> `String "INSIGHTS_FEEDBACK"

let feedback_to_yojson tree = map_to_yojson feedback_key_to_yojson feedback_value_to_yojson tree

let severity_level_to_yojson (x : severity_level) =
  match x with
  | Informative -> `String "Informative"
  | Low -> `String "Low"
  | Medium -> `String "Medium"
  | High -> `String "High"

let status_to_yojson (x : status) =
  match x with
  | IGNORE -> `String "IGNORE"
  | RESOLVED -> `String "RESOLVED"
  | PENDING -> `String "PENDING"
  | RECURRING -> `String "RECURRING"
  | RECOVERING -> `String "RECOVERING"

let insights_to_yojson = string_to_yojson
let short_name_to_yojson = string_to_yojson
let title_to_yojson = string_to_yojson
let problem_id_to_yojson = string_to_yojson

let problem_to_yojson (x : problem) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson problem_id_to_yojson x.id);
      ("Title", option_to_yojson title_to_yojson x.title);
      ("ShortName", option_to_yojson short_name_to_yojson x.short_name);
      ("Insights", option_to_yojson insights_to_yojson x.insights);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("AffectedResource", option_to_yojson affected_resource_to_yojson x.affected_resource);
      ("StartTime", option_to_yojson start_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson end_time_to_yojson x.end_time);
      ("SeverityLevel", option_to_yojson severity_level_to_yojson x.severity_level);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
      ("Feedback", option_to_yojson feedback_to_yojson x.feedback);
      ("RecurringCount", option_to_yojson recurring_count_to_yojson x.recurring_count);
      ("LastRecurrenceTime", option_to_yojson last_recurrence_time_to_yojson x.last_recurrence_time);
      ("Visibility", option_to_yojson visibility_to_yojson x.visibility);
      ("ResolutionMethod", option_to_yojson resolution_method_to_yojson x.resolution_method);
    ]

let describe_problem_response_to_yojson (x : describe_problem_response) =
  assoc_to_yojson
    [
      ("Problem", option_to_yojson problem_to_yojson x.problem);
      ("SNSNotificationArn", option_to_yojson sns_notification_arn_to_yojson x.sns_notification_arn);
    ]

let describe_problem_request_to_yojson (x : describe_problem_request) =
  assoc_to_yojson
    [
      ("ProblemId", Some (problem_id_to_yojson x.problem_id));
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let observation_list_to_yojson tree = list_to_yojson observation_to_yojson tree

let related_observations_to_yojson (x : related_observations) =
  assoc_to_yojson
    [ ("ObservationList", option_to_yojson observation_list_to_yojson x.observation_list) ]

let describe_problem_observations_response_to_yojson (x : describe_problem_observations_response) =
  assoc_to_yojson
    [
      ("RelatedObservations", option_to_yojson related_observations_to_yojson x.related_observations);
    ]

let describe_problem_observations_request_to_yojson (x : describe_problem_observations_request) =
  assoc_to_yojson
    [
      ("ProblemId", Some (problem_id_to_yojson x.problem_id));
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let describe_workload_response_to_yojson (x : describe_workload_response) =
  assoc_to_yojson
    [
      ("WorkloadId", option_to_yojson workload_id_to_yojson x.workload_id);
      ("WorkloadRemarks", option_to_yojson remarks_to_yojson x.workload_remarks);
      ( "WorkloadConfiguration",
        option_to_yojson workload_configuration_to_yojson x.workload_configuration );
    ]

let describe_workload_request_to_yojson (x : describe_workload_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("WorkloadId", Some (workload_id_to_yojson x.workload_id));
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let update_workload_response_to_yojson (x : update_workload_response) =
  assoc_to_yojson
    [
      ("WorkloadId", option_to_yojson workload_id_to_yojson x.workload_id);
      ( "WorkloadConfiguration",
        option_to_yojson workload_configuration_to_yojson x.workload_configuration );
    ]

let update_workload_request_to_yojson (x : update_workload_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("WorkloadId", option_to_yojson workload_id_to_yojson x.workload_id);
      ("WorkloadConfiguration", Some (workload_configuration_to_yojson x.workload_configuration));
    ]

let update_problem_response_to_yojson = unit_to_yojson
let update_status_to_yojson (x : update_status) = match x with RESOLVED -> `String "RESOLVED"

let update_problem_request_to_yojson (x : update_problem_request) =
  assoc_to_yojson
    [
      ("ProblemId", Some (problem_id_to_yojson x.problem_id));
      ("UpdateStatus", option_to_yojson update_status_to_yojson x.update_status);
      ("Visibility", option_to_yojson visibility_to_yojson x.visibility);
    ]

let update_log_pattern_response_to_yojson (x : update_log_pattern_response) =
  assoc_to_yojson
    [
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
      ("LogPattern", option_to_yojson log_pattern_to_yojson x.log_pattern);
    ]

let update_log_pattern_request_to_yojson (x : update_log_pattern_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("PatternSetName", Some (log_pattern_set_name_to_yojson x.pattern_set_name));
      ("PatternName", Some (log_pattern_name_to_yojson x.pattern_name));
      ("Pattern", option_to_yojson log_pattern_regex_to_yojson x.pattern);
      ("Rank", option_to_yojson log_pattern_rank_to_yojson x.rank);
    ]

let update_component_configuration_response_to_yojson = unit_to_yojson

let update_component_configuration_request_to_yojson (x : update_component_configuration_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("Monitor", option_to_yojson monitor_to_yojson x.monitor);
      ("Tier", option_to_yojson tier_to_yojson x.tier);
      ( "ComponentConfiguration",
        option_to_yojson component_configuration_to_yojson x.component_configuration );
      ("AutoConfigEnabled", option_to_yojson auto_config_enabled_to_yojson x.auto_config_enabled);
    ]

let update_component_response_to_yojson = unit_to_yojson

let update_component_request_to_yojson (x : update_component_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("ComponentName", Some (custom_component_name_to_yojson x.component_name));
      ("NewComponentName", option_to_yojson custom_component_name_to_yojson x.new_component_name);
      ("ResourceList", option_to_yojson resource_list_to_yojson x.resource_list);
    ]

let update_application_response_to_yojson (x : update_application_response) =
  assoc_to_yojson
    [ ("ApplicationInfo", option_to_yojson application_info_to_yojson x.application_info) ]

let remove_sns_topic_to_yojson = bool_to_yojson

let update_application_request_to_yojson (x : update_application_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("OpsCenterEnabled", option_to_yojson ops_center_enabled_to_yojson x.ops_center_enabled);
      ("CWEMonitorEnabled", option_to_yojson cwe_monitor_enabled_to_yojson x.cwe_monitor_enabled);
      ( "OpsItemSNSTopicArn",
        option_to_yojson ops_item_sns_topic_arn_to_yojson x.ops_item_sns_topic_arn );
      ("SNSNotificationArn", option_to_yojson sns_notification_arn_to_yojson x.sns_notification_arn);
      ("RemoveSNSTopic", option_to_yojson remove_sns_topic_to_yojson x.remove_sns_topic);
      ("AutoConfigEnabled", option_to_yojson auto_config_enabled_to_yojson x.auto_config_enabled);
      ( "AttachMissingPermission",
        option_to_yojson attach_missing_permission_to_yojson x.attach_missing_permission );
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("ResourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let remove_workload_response_to_yojson = unit_to_yojson

let remove_workload_request_to_yojson (x : remove_workload_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("WorkloadId", Some (workload_id_to_yojson x.workload_id));
    ]

let pagination_token_to_yojson = string_to_yojson
let missing_workload_config_to_yojson = bool_to_yojson

let workload_to_yojson (x : workload) =
  assoc_to_yojson
    [
      ("WorkloadId", option_to_yojson workload_id_to_yojson x.workload_id);
      ("ComponentName", option_to_yojson component_name_to_yojson x.component_name);
      ("WorkloadName", option_to_yojson workload_name_to_yojson x.workload_name);
      ("Tier", option_to_yojson tier_to_yojson x.tier);
      ("WorkloadRemarks", option_to_yojson remarks_to_yojson x.workload_remarks);
      ( "MissingWorkloadConfig",
        option_to_yojson missing_workload_config_to_yojson x.missing_workload_config );
    ]

let workload_list_to_yojson tree = list_to_yojson workload_to_yojson tree

let list_workloads_response_to_yojson (x : list_workloads_response) =
  assoc_to_yojson
    [
      ("WorkloadList", option_to_yojson workload_list_to_yojson x.workload_list);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let max_entities_to_yojson = int_to_yojson

let list_workloads_request_to_yojson (x : list_workloads_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("ComponentName", Some (component_name_to_yojson x.component_name));
      ("MaxResults", option_to_yojson max_entities_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let problem_list_to_yojson tree = list_to_yojson problem_to_yojson tree

let list_problems_response_to_yojson (x : list_problems_response) =
  assoc_to_yojson
    [
      ("ProblemList", option_to_yojson problem_list_to_yojson x.problem_list);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let list_problems_request_to_yojson (x : list_problems_request) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
      ("StartTime", option_to_yojson start_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson end_time_to_yojson x.end_time);
      ("MaxResults", option_to_yojson max_entities_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ComponentName", option_to_yojson component_name_to_yojson x.component_name);
      ("Visibility", option_to_yojson visibility_to_yojson x.visibility);
    ]

let log_pattern_set_list_to_yojson tree = list_to_yojson log_pattern_set_name_to_yojson tree

let list_log_pattern_sets_response_to_yojson (x : list_log_pattern_sets_response) =
  assoc_to_yojson
    [
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("LogPatternSets", option_to_yojson log_pattern_set_list_to_yojson x.log_pattern_sets);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_log_pattern_sets_request_to_yojson (x : list_log_pattern_sets_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("MaxResults", option_to_yojson max_entities_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let log_pattern_list_to_yojson tree = list_to_yojson log_pattern_to_yojson tree

let list_log_patterns_response_to_yojson (x : list_log_patterns_response) =
  assoc_to_yojson
    [
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("LogPatterns", option_to_yojson log_pattern_list_to_yojson x.log_patterns);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_log_patterns_request_to_yojson (x : list_log_patterns_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("PatternSetName", option_to_yojson log_pattern_set_name_to_yojson x.pattern_set_name);
      ("MaxResults", option_to_yojson max_entities_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let list_configuration_history_response_to_yojson (x : list_configuration_history_response) =
  assoc_to_yojson
    [
      ("EventList", option_to_yojson configuration_event_list_to_yojson x.event_list);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_configuration_history_request_to_yojson (x : list_configuration_history_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", option_to_yojson resource_group_name_to_yojson x.resource_group_name);
      ("StartTime", option_to_yojson start_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson end_time_to_yojson x.end_time);
      ("EventStatus", option_to_yojson configuration_event_status_to_yojson x.event_status);
      ("MaxResults", option_to_yojson max_entities_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let list_components_response_to_yojson (x : list_components_response) =
  assoc_to_yojson
    [
      ( "ApplicationComponentList",
        option_to_yojson application_component_list_to_yojson x.application_component_list );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_components_request_to_yojson (x : list_components_request) =
  assoc_to_yojson
    [
      ("ResourceGroupName", Some (resource_group_name_to_yojson x.resource_group_name));
      ("MaxResults", option_to_yojson max_entities_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let list_applications_response_to_yojson (x : list_applications_response) =
  assoc_to_yojson
    [
      ( "ApplicationInfoList",
        option_to_yojson application_info_list_to_yojson x.application_info_list );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_applications_request_to_yojson (x : list_applications_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_entities_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
    ]
