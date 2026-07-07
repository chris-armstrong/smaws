open Smaws_Lib.Json.DeserializeHelpers
open Types

let x_ray_throttle_percent_of_yojson = int_of_yojson
let x_ray_request_count_of_yojson = int_of_yojson
let x_ray_request_average_latency_of_yojson = long_of_yojson
let x_ray_node_type_of_yojson = string_of_yojson
let x_ray_node_name_of_yojson = string_of_yojson
let x_ray_fault_percent_of_yojson = int_of_yojson
let x_ray_error_percent_of_yojson = int_of_yojson
let workload_name_of_yojson = string_of_yojson
let meta_data_value_of_yojson = string_of_yojson
let meta_data_key_of_yojson = string_of_yojson

let workload_meta_data_of_yojson tree path =
  map_of_yojson meta_data_key_of_yojson meta_data_value_of_yojson tree path

let workload_id_of_yojson = string_of_yojson
let component_name_of_yojson = string_of_yojson

let tier_of_yojson (tree : t) path =
  ((match tree with
    | `String "SAP_NETWEAVER_HIGH_AVAILABILITY" -> SAP_NETWEAVER_HIGH_AVAILABILITY
    | `String "SAP_NETWEAVER_DISTRIBUTED" -> SAP_NETWEAVER_DISTRIBUTED
    | `String "SAP_NETWEAVER_STANDARD" -> SAP_NETWEAVER_STANDARD
    | `String "ACTIVE_DIRECTORY" -> ACTIVE_DIRECTORY
    | `String "SHAREPOINT" -> SHAREPOINT
    | `String "SQL_SERVER_FAILOVER_CLUSTER_INSTANCE" -> SQL_SERVER_FAILOVER_CLUSTER_INSTANCE
    | `String "SAP_ASE_HIGH_AVAILABILITY" -> SAP_ASE_HIGH_AVAILABILITY
    | `String "SAP_ASE_SINGLE_NODE" -> SAP_ASE_SINGLE_NODE
    | `String "SAP_HANA_HIGH_AVAILABILITY" -> SAP_HANA_HIGH_AVAILABILITY
    | `String "SAP_HANA_SINGLE_NODE" -> SAP_HANA_SINGLE_NODE
    | `String "SAP_HANA_MULTI_NODE" -> SAP_HANA_MULTI_NODE
    | `String "ORACLE" -> ORACLE
    | `String "JAVA_JMX" -> JAVA_JMX
    | `String "POSTGRESQL" -> POSTGRESQL
    | `String "MYSQL" -> MYSQL
    | `String "SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP" -> SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP
    | `String "SQL_SERVER" -> SQL_SERVER
    | `String "DOT_NET_WEB" -> DOT_NET_WEB
    | `String "DOT_NET_WEB_TIER" -> DOT_NET_WEB_TIER
    | `String "DOT_NET_WORKER" -> DOT_NET_WORKER
    | `String "DOT_NET_CORE" -> DOT_NET_CORE
    | `String "DEFAULT" -> DEFAULT
    | `String "CUSTOM" -> CUSTOM
    | `String value -> raise (deserialize_unknown_enum_value_error path "Tier" value)
    | _ -> raise (deserialize_wrong_type_error path "Tier")
     : tier)
    : tier)

let remarks_of_yojson = string_of_yojson
let missing_workload_config_of_yojson = bool_of_yojson

let workload_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     missing_workload_config =
       option_of_yojson
         (value_for_key missing_workload_config_of_yojson "MissingWorkloadConfig")
         _list path;
     workload_remarks =
       option_of_yojson (value_for_key remarks_of_yojson "WorkloadRemarks") _list path;
     tier = option_of_yojson (value_for_key tier_of_yojson "Tier") _list path;
     workload_name =
       option_of_yojson (value_for_key workload_name_of_yojson "WorkloadName") _list path;
     component_name =
       option_of_yojson (value_for_key component_name_of_yojson "ComponentName") _list path;
     workload_id = option_of_yojson (value_for_key workload_id_of_yojson "WorkloadId") _list path;
   }
    : workload)

let workload_list_of_yojson tree path = list_of_yojson workload_of_yojson tree path
let component_configuration_of_yojson = string_of_yojson

let workload_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson (value_for_key component_configuration_of_yojson "Configuration") _list path;
     tier = option_of_yojson (value_for_key tier_of_yojson "Tier") _list path;
     workload_name =
       option_of_yojson (value_for_key workload_name_of_yojson "WorkloadName") _list path;
   }
    : workload_configuration)

let visibility_of_yojson (tree : t) path =
  ((match tree with
    | `String "VISIBLE" -> VISIBLE
    | `String "IGNORED" -> IGNORED
    | `String value -> raise (deserialize_unknown_enum_value_error path "Visibility" value)
    | _ -> raise (deserialize_wrong_type_error path "Visibility")
     : visibility)
    : visibility)

let value_of_yojson = double_of_yojson
let error_msg_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_msg_of_yojson "Message") _list path }
    : validation_exception)

let update_workload_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workload_configuration =
       option_of_yojson
         (value_for_key workload_configuration_of_yojson "WorkloadConfiguration")
         _list path;
     workload_id = option_of_yojson (value_for_key workload_id_of_yojson "WorkloadId") _list path;
   }
    : update_workload_response)

let resource_group_name_of_yojson = string_of_yojson

let update_workload_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workload_configuration =
       value_for_key workload_configuration_of_yojson "WorkloadConfiguration" _list path;
     workload_id = option_of_yojson (value_for_key workload_id_of_yojson "WorkloadId") _list path;
     component_name = value_for_key component_name_of_yojson "ComponentName" _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : update_workload_request)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_msg_of_yojson "Message") _list path }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_msg_of_yojson "Message") _list path }
    : internal_server_exception)

let update_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "RESOLVED" -> RESOLVED
    | `String value -> raise (deserialize_unknown_enum_value_error path "UpdateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateStatus")
     : update_status)
    : update_status)

let update_problem_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let problem_id_of_yojson = string_of_yojson

let update_problem_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     visibility = option_of_yojson (value_for_key visibility_of_yojson "Visibility") _list path;
     update_status =
       option_of_yojson (value_for_key update_status_of_yojson "UpdateStatus") _list path;
     problem_id = value_for_key problem_id_of_yojson "ProblemId" _list path;
   }
    : update_problem_request)

let log_pattern_set_name_of_yojson = string_of_yojson
let log_pattern_name_of_yojson = string_of_yojson
let log_pattern_regex_of_yojson = string_of_yojson
let log_pattern_rank_of_yojson = int_of_yojson

let log_pattern_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rank = option_of_yojson (value_for_key log_pattern_rank_of_yojson "Rank") _list path;
     pattern = option_of_yojson (value_for_key log_pattern_regex_of_yojson "Pattern") _list path;
     pattern_name =
       option_of_yojson (value_for_key log_pattern_name_of_yojson "PatternName") _list path;
     pattern_set_name =
       option_of_yojson (value_for_key log_pattern_set_name_of_yojson "PatternSetName") _list path;
   }
    : log_pattern)

let update_log_pattern_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_pattern = option_of_yojson (value_for_key log_pattern_of_yojson "LogPattern") _list path;
     resource_group_name =
       option_of_yojson (value_for_key resource_group_name_of_yojson "ResourceGroupName") _list path;
   }
    : update_log_pattern_response)

let update_log_pattern_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rank = option_of_yojson (value_for_key log_pattern_rank_of_yojson "Rank") _list path;
     pattern = option_of_yojson (value_for_key log_pattern_regex_of_yojson "Pattern") _list path;
     pattern_name = value_for_key log_pattern_name_of_yojson "PatternName" _list path;
     pattern_set_name = value_for_key log_pattern_set_name_of_yojson "PatternSetName" _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : update_log_pattern_request)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_msg_of_yojson "Message") _list path }
    : resource_in_use_exception)

let update_component_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let custom_component_name_of_yojson = string_of_yojson
let resource_ar_n_of_yojson = string_of_yojson
let resource_list_of_yojson tree path = list_of_yojson resource_ar_n_of_yojson tree path

let update_component_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_list =
       option_of_yojson (value_for_key resource_list_of_yojson "ResourceList") _list path;
     new_component_name =
       option_of_yojson
         (value_for_key custom_component_name_of_yojson "NewComponentName")
         _list path;
     component_name = value_for_key custom_component_name_of_yojson "ComponentName" _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : update_component_request)

let update_component_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let monitor_of_yojson = bool_of_yojson
let auto_config_enabled_of_yojson = bool_of_yojson

let update_component_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_config_enabled =
       option_of_yojson (value_for_key auto_config_enabled_of_yojson "AutoConfigEnabled") _list path;
     component_configuration =
       option_of_yojson
         (value_for_key component_configuration_of_yojson "ComponentConfiguration")
         _list path;
     tier = option_of_yojson (value_for_key tier_of_yojson "Tier") _list path;
     monitor = option_of_yojson (value_for_key monitor_of_yojson "Monitor") _list path;
     component_name = value_for_key component_name_of_yojson "ComponentName" _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : update_component_configuration_request)

let account_id_of_yojson = string_of_yojson
let life_cycle_of_yojson = string_of_yojson
let ops_item_sns_topic_arn_of_yojson = string_of_yojson
let sns_notification_arn_of_yojson = string_of_yojson
let ops_center_enabled_of_yojson = bool_of_yojson
let cwe_monitor_enabled_of_yojson = bool_of_yojson

let discovery_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT_BASED" -> ACCOUNT_BASED
    | `String "RESOURCE_GROUP_BASED" -> RESOURCE_GROUP_BASED
    | `String value -> raise (deserialize_unknown_enum_value_error path "DiscoveryType" value)
    | _ -> raise (deserialize_wrong_type_error path "DiscoveryType")
     : discovery_type)
    : discovery_type)

let attach_missing_permission_of_yojson = bool_of_yojson

let application_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attach_missing_permission =
       option_of_yojson
         (value_for_key attach_missing_permission_of_yojson "AttachMissingPermission")
         _list path;
     discovery_type =
       option_of_yojson (value_for_key discovery_type_of_yojson "DiscoveryType") _list path;
     auto_config_enabled =
       option_of_yojson (value_for_key auto_config_enabled_of_yojson "AutoConfigEnabled") _list path;
     remarks = option_of_yojson (value_for_key remarks_of_yojson "Remarks") _list path;
     cwe_monitor_enabled =
       option_of_yojson (value_for_key cwe_monitor_enabled_of_yojson "CWEMonitorEnabled") _list path;
     ops_center_enabled =
       option_of_yojson (value_for_key ops_center_enabled_of_yojson "OpsCenterEnabled") _list path;
     sns_notification_arn =
       option_of_yojson
         (value_for_key sns_notification_arn_of_yojson "SNSNotificationArn")
         _list path;
     ops_item_sns_topic_arn =
       option_of_yojson
         (value_for_key ops_item_sns_topic_arn_of_yojson "OpsItemSNSTopicArn")
         _list path;
     life_cycle = option_of_yojson (value_for_key life_cycle_of_yojson "LifeCycle") _list path;
     resource_group_name =
       option_of_yojson (value_for_key resource_group_name_of_yojson "ResourceGroupName") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
   }
    : application_info)

let update_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_info =
       option_of_yojson (value_for_key application_info_of_yojson "ApplicationInfo") _list path;
   }
    : update_application_response)

let remove_sns_topic_of_yojson = bool_of_yojson

let update_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attach_missing_permission =
       option_of_yojson
         (value_for_key attach_missing_permission_of_yojson "AttachMissingPermission")
         _list path;
     auto_config_enabled =
       option_of_yojson (value_for_key auto_config_enabled_of_yojson "AutoConfigEnabled") _list path;
     remove_sns_topic =
       option_of_yojson (value_for_key remove_sns_topic_of_yojson "RemoveSNSTopic") _list path;
     sns_notification_arn =
       option_of_yojson
         (value_for_key sns_notification_arn_of_yojson "SNSNotificationArn")
         _list path;
     ops_item_sns_topic_arn =
       option_of_yojson
         (value_for_key ops_item_sns_topic_arn_of_yojson "OpsItemSNSTopicArn")
         _list path;
     cwe_monitor_enabled =
       option_of_yojson (value_for_key cwe_monitor_enabled_of_yojson "CWEMonitorEnabled") _list path;
     ops_center_enabled =
       option_of_yojson (value_for_key ops_center_enabled_of_yojson "OpsCenterEnabled") _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : update_application_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let amazon_resource_name_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : untag_resource_request)

let unit__of_yojson = string_of_yojson
let exception_message_of_yojson = string_of_yojson

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "ResourceName") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
   }
    : too_many_tags_exception)

let title_of_yojson = string_of_yojson

let tags_already_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : tags_already_exist_exception)

let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : tag_resource_request)

let status_of_yojson (tree : t) path =
  ((match tree with
    | `String "RECOVERING" -> RECOVERING
    | `String "RECURRING" -> RECURRING
    | `String "PENDING" -> PENDING
    | `String "RESOLVED" -> RESOLVED
    | `String "IGNORE" -> IGNORE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Status" value)
    | _ -> raise (deserialize_wrong_type_error path "Status")
     : status)
    : status)

let states_status_of_yojson = string_of_yojson
let states_input_of_yojson = string_of_yojson
let states_execution_arn_of_yojson = string_of_yojson
let states_arn_of_yojson = string_of_yojson
let start_time_of_yojson = timestamp_epoch_seconds_of_yojson
let source_type_of_yojson = string_of_yojson
let source_ar_n_of_yojson = string_of_yojson
let short_name_of_yojson = string_of_yojson

let severity_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "High" -> High
    | `String "Medium" -> Medium
    | `String "Low" -> Low
    | `String "Informative" -> Informative
    | `String value -> raise (deserialize_unknown_enum_value_error path "SeverityLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "SeverityLevel")
     : severity_level)
    : severity_level)

let s3_event_name_of_yojson = string_of_yojson
let resource_type_of_yojson = string_of_yojson

let resolution_method_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNRESOLVED" -> UNRESOLVED
    | `String "AUTOMATIC" -> AUTOMATIC
    | `String "MANUAL" -> MANUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResolutionMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "ResolutionMethod")
     : resolution_method)
    : resolution_method)

let remove_workload_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let remove_workload_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workload_id = value_for_key workload_id_of_yojson "WorkloadId" _list path;
     component_name = value_for_key component_name_of_yojson "ComponentName" _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : remove_workload_request)

let observation_id_of_yojson = string_of_yojson
let end_time_of_yojson = timestamp_epoch_seconds_of_yojson
let log_group_of_yojson = string_of_yojson
let line_time_of_yojson = timestamp_epoch_seconds_of_yojson
let log_text_of_yojson = string_of_yojson

let log_filter_of_yojson (tree : t) path =
  ((match tree with
    | `String "INFO" -> INFO
    | `String "WARN" -> WARN
    | `String "ERROR" -> ERROR
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogFilter" value)
    | _ -> raise (deserialize_wrong_type_error path "LogFilter")
     : log_filter)
    : log_filter)

let metric_namespace_of_yojson = string_of_yojson
let metric_name_of_yojson = string_of_yojson
let cloud_watch_event_id_of_yojson = string_of_yojson

let cloud_watch_event_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "RDS" -> RDS
    | `String "HEALTH" -> HEALTH
    | `String "CODE_DEPLOY" -> CODE_DEPLOY
    | `String "EC2" -> EC2
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CloudWatchEventSource" value)
    | _ -> raise (deserialize_wrong_type_error path "CloudWatchEventSource")
     : cloud_watch_event_source)
    : cloud_watch_event_source)

let cloud_watch_event_detail_type_of_yojson = string_of_yojson
let health_event_arn_of_yojson = string_of_yojson
let health_service_of_yojson = string_of_yojson
let health_event_type_code_of_yojson = string_of_yojson
let health_event_type_category_of_yojson = string_of_yojson
let health_event_description_of_yojson = string_of_yojson
let code_deploy_deployment_id_of_yojson = string_of_yojson
let code_deploy_deployment_group_of_yojson = string_of_yojson
let code_deploy_state_of_yojson = string_of_yojson
let code_deploy_application_of_yojson = string_of_yojson
let code_deploy_instance_group_id_of_yojson = string_of_yojson
let ec2_state_of_yojson = string_of_yojson
let rds_event_categories_of_yojson = string_of_yojson
let rds_event_message_of_yojson = string_of_yojson
let ebs_event_of_yojson = string_of_yojson
let ebs_result_of_yojson = string_of_yojson
let ebs_cause_of_yojson = string_of_yojson
let ebs_request_id_of_yojson = string_of_yojson

let observation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     x_ray_node_type =
       option_of_yojson (value_for_key x_ray_node_type_of_yojson "XRayNodeType") _list path;
     x_ray_node_name =
       option_of_yojson (value_for_key x_ray_node_name_of_yojson "XRayNodeName") _list path;
     x_ray_request_average_latency =
       option_of_yojson
         (value_for_key x_ray_request_average_latency_of_yojson "XRayRequestAverageLatency")
         _list path;
     x_ray_request_count =
       option_of_yojson (value_for_key x_ray_request_count_of_yojson "XRayRequestCount") _list path;
     x_ray_error_percent =
       option_of_yojson (value_for_key x_ray_error_percent_of_yojson "XRayErrorPercent") _list path;
     x_ray_throttle_percent =
       option_of_yojson
         (value_for_key x_ray_throttle_percent_of_yojson "XRayThrottlePercent")
         _list path;
     x_ray_fault_percent =
       option_of_yojson (value_for_key x_ray_fault_percent_of_yojson "XRayFaultPercent") _list path;
     ebs_request_id =
       option_of_yojson (value_for_key ebs_request_id_of_yojson "EbsRequestId") _list path;
     ebs_cause = option_of_yojson (value_for_key ebs_cause_of_yojson "EbsCause") _list path;
     ebs_result = option_of_yojson (value_for_key ebs_result_of_yojson "EbsResult") _list path;
     ebs_event = option_of_yojson (value_for_key ebs_event_of_yojson "EbsEvent") _list path;
     states_input = option_of_yojson (value_for_key states_input_of_yojson "StatesInput") _list path;
     states_status =
       option_of_yojson (value_for_key states_status_of_yojson "StatesStatus") _list path;
     states_arn = option_of_yojson (value_for_key states_arn_of_yojson "StatesArn") _list path;
     states_execution_arn =
       option_of_yojson
         (value_for_key states_execution_arn_of_yojson "StatesExecutionArn")
         _list path;
     s3_event_name =
       option_of_yojson (value_for_key s3_event_name_of_yojson "S3EventName") _list path;
     rds_event_message =
       option_of_yojson (value_for_key rds_event_message_of_yojson "RdsEventMessage") _list path;
     rds_event_categories =
       option_of_yojson
         (value_for_key rds_event_categories_of_yojson "RdsEventCategories")
         _list path;
     ec2_state = option_of_yojson (value_for_key ec2_state_of_yojson "Ec2State") _list path;
     code_deploy_instance_group_id =
       option_of_yojson
         (value_for_key code_deploy_instance_group_id_of_yojson "CodeDeployInstanceGroupId")
         _list path;
     code_deploy_application =
       option_of_yojson
         (value_for_key code_deploy_application_of_yojson "CodeDeployApplication")
         _list path;
     code_deploy_state =
       option_of_yojson (value_for_key code_deploy_state_of_yojson "CodeDeployState") _list path;
     code_deploy_deployment_group =
       option_of_yojson
         (value_for_key code_deploy_deployment_group_of_yojson "CodeDeployDeploymentGroup")
         _list path;
     code_deploy_deployment_id =
       option_of_yojson
         (value_for_key code_deploy_deployment_id_of_yojson "CodeDeployDeploymentId")
         _list path;
     health_event_description =
       option_of_yojson
         (value_for_key health_event_description_of_yojson "HealthEventDescription")
         _list path;
     health_event_type_category =
       option_of_yojson
         (value_for_key health_event_type_category_of_yojson "HealthEventTypeCategory")
         _list path;
     health_event_type_code =
       option_of_yojson
         (value_for_key health_event_type_code_of_yojson "HealthEventTypeCode")
         _list path;
     health_service =
       option_of_yojson (value_for_key health_service_of_yojson "HealthService") _list path;
     health_event_arn =
       option_of_yojson (value_for_key health_event_arn_of_yojson "HealthEventArn") _list path;
     cloud_watch_event_detail_type =
       option_of_yojson
         (value_for_key cloud_watch_event_detail_type_of_yojson "CloudWatchEventDetailType")
         _list path;
     cloud_watch_event_source =
       option_of_yojson
         (value_for_key cloud_watch_event_source_of_yojson "CloudWatchEventSource")
         _list path;
     cloud_watch_event_id =
       option_of_yojson
         (value_for_key cloud_watch_event_id_of_yojson "CloudWatchEventId")
         _list path;
     value = option_of_yojson (value_for_key value_of_yojson "Value") _list path;
     unit_ = option_of_yojson (value_for_key unit__of_yojson "Unit") _list path;
     metric_name = option_of_yojson (value_for_key metric_name_of_yojson "MetricName") _list path;
     metric_namespace =
       option_of_yojson (value_for_key metric_namespace_of_yojson "MetricNamespace") _list path;
     log_filter = option_of_yojson (value_for_key log_filter_of_yojson "LogFilter") _list path;
     log_text = option_of_yojson (value_for_key log_text_of_yojson "LogText") _list path;
     line_time = option_of_yojson (value_for_key line_time_of_yojson "LineTime") _list path;
     log_group = option_of_yojson (value_for_key log_group_of_yojson "LogGroup") _list path;
     source_ar_n = option_of_yojson (value_for_key source_ar_n_of_yojson "SourceARN") _list path;
     source_type = option_of_yojson (value_for_key source_type_of_yojson "SourceType") _list path;
     end_time = option_of_yojson (value_for_key end_time_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key start_time_of_yojson "StartTime") _list path;
     id = option_of_yojson (value_for_key observation_id_of_yojson "Id") _list path;
   }
    : observation)

let observation_list_of_yojson tree path = list_of_yojson observation_of_yojson tree path

let related_observations_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     observation_list =
       option_of_yojson (value_for_key observation_list_of_yojson "ObservationList") _list path;
   }
    : related_observations)

let recurring_count_of_yojson = long_of_yojson

let recommendation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL" -> ALL
    | `String "WORKLOAD_ONLY" -> WORKLOAD_ONLY
    | `String "INFRA_ONLY" -> INFRA_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecommendationType" value)
    | _ -> raise (deserialize_wrong_type_error path "RecommendationType")
     : recommendation_type)
    : recommendation_type)

let insights_of_yojson = string_of_yojson
let affected_resource_of_yojson = string_of_yojson

let feedback_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOT_USEFUL" -> NOT_USEFUL
    | `String "USEFUL" -> USEFUL
    | `String "NOT_SPECIFIED" -> NOT_SPECIFIED
    | `String value -> raise (deserialize_unknown_enum_value_error path "FeedbackValue" value)
    | _ -> raise (deserialize_wrong_type_error path "FeedbackValue")
     : feedback_value)
    : feedback_value)

let feedback_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "INSIGHTS_FEEDBACK" -> INSIGHTS_FEEDBACK
    | `String value -> raise (deserialize_unknown_enum_value_error path "FeedbackKey" value)
    | _ -> raise (deserialize_wrong_type_error path "FeedbackKey")
     : feedback_key)
    : feedback_key)

let feedback_of_yojson tree path =
  map_of_yojson feedback_key_of_yojson feedback_value_of_yojson tree path

let last_recurrence_time_of_yojson = timestamp_epoch_seconds_of_yojson

let problem_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolution_method =
       option_of_yojson (value_for_key resolution_method_of_yojson "ResolutionMethod") _list path;
     visibility = option_of_yojson (value_for_key visibility_of_yojson "Visibility") _list path;
     last_recurrence_time =
       option_of_yojson
         (value_for_key last_recurrence_time_of_yojson "LastRecurrenceTime")
         _list path;
     recurring_count =
       option_of_yojson (value_for_key recurring_count_of_yojson "RecurringCount") _list path;
     feedback = option_of_yojson (value_for_key feedback_of_yojson "Feedback") _list path;
     resource_group_name =
       option_of_yojson (value_for_key resource_group_name_of_yojson "ResourceGroupName") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     severity_level =
       option_of_yojson (value_for_key severity_level_of_yojson "SeverityLevel") _list path;
     end_time = option_of_yojson (value_for_key end_time_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key start_time_of_yojson "StartTime") _list path;
     affected_resource =
       option_of_yojson (value_for_key affected_resource_of_yojson "AffectedResource") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     insights = option_of_yojson (value_for_key insights_of_yojson "Insights") _list path;
     short_name = option_of_yojson (value_for_key short_name_of_yojson "ShortName") _list path;
     title = option_of_yojson (value_for_key title_of_yojson "Title") _list path;
     id = option_of_yojson (value_for_key problem_id_of_yojson "Id") _list path;
   }
    : problem)

let problem_list_of_yojson tree path = list_of_yojson problem_of_yojson tree path
let pagination_token_of_yojson = string_of_yojson

let os_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "LINUX" -> LINUX
    | `String "WINDOWS" -> WINDOWS
    | `String value -> raise (deserialize_unknown_enum_value_error path "OsType" value)
    | _ -> raise (deserialize_wrong_type_error path "OsType")
     : os_type)
    : os_type)

let max_entities_of_yojson = int_of_yojson

let log_pattern_set_list_of_yojson tree path =
  list_of_yojson log_pattern_set_name_of_yojson tree path

let log_pattern_list_of_yojson tree path = list_of_yojson log_pattern_of_yojson tree path

let list_workloads_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     workload_list =
       option_of_yojson (value_for_key workload_list_of_yojson "WorkloadList") _list path;
   }
    : list_workloads_response)

let list_workloads_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_entities_of_yojson "MaxResults") _list path;
     component_name = value_for_key component_name_of_yojson "ComponentName" _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : list_workloads_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let list_problems_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     resource_group_name =
       option_of_yojson (value_for_key resource_group_name_of_yojson "ResourceGroupName") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     problem_list = option_of_yojson (value_for_key problem_list_of_yojson "ProblemList") _list path;
   }
    : list_problems_response)

let list_problems_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     visibility = option_of_yojson (value_for_key visibility_of_yojson "Visibility") _list path;
     component_name =
       option_of_yojson (value_for_key component_name_of_yojson "ComponentName") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_entities_of_yojson "MaxResults") _list path;
     end_time = option_of_yojson (value_for_key end_time_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key start_time_of_yojson "StartTime") _list path;
     resource_group_name =
       option_of_yojson (value_for_key resource_group_name_of_yojson "ResourceGroupName") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
   }
    : list_problems_request)

let list_log_patterns_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     log_patterns =
       option_of_yojson (value_for_key log_pattern_list_of_yojson "LogPatterns") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     resource_group_name =
       option_of_yojson (value_for_key resource_group_name_of_yojson "ResourceGroupName") _list path;
   }
    : list_log_patterns_response)

let list_log_patterns_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_entities_of_yojson "MaxResults") _list path;
     pattern_set_name =
       option_of_yojson (value_for_key log_pattern_set_name_of_yojson "PatternSetName") _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : list_log_patterns_request)

let list_log_pattern_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     log_pattern_sets =
       option_of_yojson (value_for_key log_pattern_set_list_of_yojson "LogPatternSets") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     resource_group_name =
       option_of_yojson (value_for_key resource_group_name_of_yojson "ResourceGroupName") _list path;
   }
    : list_log_pattern_sets_response)

let list_log_pattern_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_entities_of_yojson "MaxResults") _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : list_log_pattern_sets_request)

let configuration_event_monitored_resource_ar_n_of_yojson = string_of_yojson

let configuration_event_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "WARN" -> WARN
    | `String "INFO" -> INFO
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConfigurationEventStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ConfigurationEventStatus")
     : configuration_event_status)
    : configuration_event_status)

let configuration_event_resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SSM_ASSOCIATION" -> SSM_ASSOCIATION
    | `String "CLOUDFORMATION" -> CLOUDFORMATION
    | `String "CLOUDWATCH_LOG" -> CLOUDWATCH_LOG
    | `String "CLOUDWATCH_ALARM" -> CLOUDWATCH_ALARM
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConfigurationEventResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConfigurationEventResourceType")
     : configuration_event_resource_type)
    : configuration_event_resource_type)

let configuration_event_time_of_yojson = timestamp_epoch_seconds_of_yojson
let configuration_event_detail_of_yojson = string_of_yojson
let configuration_event_resource_name_of_yojson = string_of_yojson

let configuration_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_resource_name =
       option_of_yojson
         (value_for_key configuration_event_resource_name_of_yojson "EventResourceName")
         _list path;
     event_detail =
       option_of_yojson
         (value_for_key configuration_event_detail_of_yojson "EventDetail")
         _list path;
     event_time =
       option_of_yojson (value_for_key configuration_event_time_of_yojson "EventTime") _list path;
     event_resource_type =
       option_of_yojson
         (value_for_key configuration_event_resource_type_of_yojson "EventResourceType")
         _list path;
     event_status =
       option_of_yojson
         (value_for_key configuration_event_status_of_yojson "EventStatus")
         _list path;
     monitored_resource_ar_n =
       option_of_yojson
         (value_for_key configuration_event_monitored_resource_ar_n_of_yojson "MonitoredResourceARN")
         _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     resource_group_name =
       option_of_yojson (value_for_key resource_group_name_of_yojson "ResourceGroupName") _list path;
   }
    : configuration_event)

let configuration_event_list_of_yojson tree path =
  list_of_yojson configuration_event_of_yojson tree path

let list_configuration_history_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     event_list =
       option_of_yojson (value_for_key configuration_event_list_of_yojson "EventList") _list path;
   }
    : list_configuration_history_response)

let list_configuration_history_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_entities_of_yojson "MaxResults") _list path;
     event_status =
       option_of_yojson
         (value_for_key configuration_event_status_of_yojson "EventStatus")
         _list path;
     end_time = option_of_yojson (value_for_key end_time_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key start_time_of_yojson "StartTime") _list path;
     resource_group_name =
       option_of_yojson (value_for_key resource_group_name_of_yojson "ResourceGroupName") _list path;
   }
    : list_configuration_history_request)

let detected_workload_of_yojson tree path =
  map_of_yojson tier_of_yojson workload_meta_data_of_yojson tree path

let application_component_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     detected_workload =
       option_of_yojson (value_for_key detected_workload_of_yojson "DetectedWorkload") _list path;
     monitor = option_of_yojson (value_for_key monitor_of_yojson "Monitor") _list path;
     tier = option_of_yojson (value_for_key tier_of_yojson "Tier") _list path;
     os_type = option_of_yojson (value_for_key os_type_of_yojson "OsType") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     component_remarks =
       option_of_yojson (value_for_key remarks_of_yojson "ComponentRemarks") _list path;
     component_name =
       option_of_yojson (value_for_key component_name_of_yojson "ComponentName") _list path;
   }
    : application_component)

let application_component_list_of_yojson tree path =
  list_of_yojson application_component_of_yojson tree path

let list_components_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     application_component_list =
       option_of_yojson
         (value_for_key application_component_list_of_yojson "ApplicationComponentList")
         _list path;
   }
    : list_components_response)

let list_components_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_entities_of_yojson "MaxResults") _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : list_components_request)

let application_info_list_of_yojson tree path = list_of_yojson application_info_of_yojson tree path

let list_applications_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     application_info_list =
       option_of_yojson
         (value_for_key application_info_list_of_yojson "ApplicationInfoList")
         _list path;
   }
    : list_applications_response)

let list_applications_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_entities_of_yojson "MaxResults") _list path;
   }
    : list_applications_request)

let grouping_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT_BASED" -> ACCOUNT_BASED
    | `String value -> raise (deserialize_unknown_enum_value_error path "GroupingType" value)
    | _ -> raise (deserialize_wrong_type_error path "GroupingType")
     : grouping_type)
    : grouping_type)

let describe_workload_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workload_configuration =
       option_of_yojson
         (value_for_key workload_configuration_of_yojson "WorkloadConfiguration")
         _list path;
     workload_remarks =
       option_of_yojson (value_for_key remarks_of_yojson "WorkloadRemarks") _list path;
     workload_id = option_of_yojson (value_for_key workload_id_of_yojson "WorkloadId") _list path;
   }
    : describe_workload_response)

let describe_workload_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     workload_id = value_for_key workload_id_of_yojson "WorkloadId" _list path;
     component_name = value_for_key component_name_of_yojson "ComponentName" _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : describe_workload_request)

let describe_problem_observations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     related_observations =
       option_of_yojson
         (value_for_key related_observations_of_yojson "RelatedObservations")
         _list path;
   }
    : describe_problem_observations_response)

let describe_problem_observations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     problem_id = value_for_key problem_id_of_yojson "ProblemId" _list path;
   }
    : describe_problem_observations_request)

let describe_problem_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sns_notification_arn =
       option_of_yojson
         (value_for_key sns_notification_arn_of_yojson "SNSNotificationArn")
         _list path;
     problem = option_of_yojson (value_for_key problem_of_yojson "Problem") _list path;
   }
    : describe_problem_response)

let describe_problem_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     problem_id = value_for_key problem_id_of_yojson "ProblemId" _list path;
   }
    : describe_problem_request)

let describe_observation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ observation = option_of_yojson (value_for_key observation_of_yojson "Observation") _list path }
    : describe_observation_response)

let describe_observation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     observation_id = value_for_key observation_id_of_yojson "ObservationId" _list path;
   }
    : describe_observation_request)

let describe_log_pattern_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_pattern = option_of_yojson (value_for_key log_pattern_of_yojson "LogPattern") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     resource_group_name =
       option_of_yojson (value_for_key resource_group_name_of_yojson "ResourceGroupName") _list path;
   }
    : describe_log_pattern_response)

let describe_log_pattern_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     pattern_name = value_for_key log_pattern_name_of_yojson "PatternName" _list path;
     pattern_set_name = value_for_key log_pattern_set_name_of_yojson "PatternSetName" _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : describe_log_pattern_request)

let describe_component_configuration_recommendation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     component_configuration =
       option_of_yojson
         (value_for_key component_configuration_of_yojson "ComponentConfiguration")
         _list path;
   }
    : describe_component_configuration_recommendation_response)

let describe_component_configuration_recommendation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendation_type =
       option_of_yojson
         (value_for_key recommendation_type_of_yojson "RecommendationType")
         _list path;
     workload_name =
       option_of_yojson (value_for_key workload_name_of_yojson "WorkloadName") _list path;
     tier = value_for_key tier_of_yojson "Tier" _list path;
     component_name = value_for_key component_name_of_yojson "ComponentName" _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : describe_component_configuration_recommendation_request)

let describe_component_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     component_configuration =
       option_of_yojson
         (value_for_key component_configuration_of_yojson "ComponentConfiguration")
         _list path;
     tier = option_of_yojson (value_for_key tier_of_yojson "Tier") _list path;
     monitor = option_of_yojson (value_for_key monitor_of_yojson "Monitor") _list path;
   }
    : describe_component_configuration_response)

let describe_component_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     component_name = value_for_key component_name_of_yojson "ComponentName" _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : describe_component_configuration_request)

let describe_component_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_list =
       option_of_yojson (value_for_key resource_list_of_yojson "ResourceList") _list path;
     application_component =
       option_of_yojson
         (value_for_key application_component_of_yojson "ApplicationComponent")
         _list path;
   }
    : describe_component_response)

let describe_component_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     component_name = value_for_key component_name_of_yojson "ComponentName" _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : describe_component_request)

let describe_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_info =
       option_of_yojson (value_for_key application_info_of_yojson "ApplicationInfo") _list path;
   }
    : describe_application_response)

let describe_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : describe_application_request)

let bad_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_msg_of_yojson "Message") _list path }
    : bad_request_exception)

let delete_log_pattern_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_log_pattern_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pattern_name = value_for_key log_pattern_name_of_yojson "PatternName" _list path;
     pattern_set_name = value_for_key log_pattern_set_name_of_yojson "PatternSetName" _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : delete_log_pattern_request)

let delete_component_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_component_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     component_name = value_for_key custom_component_name_of_yojson "ComponentName" _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : delete_component_request)

let delete_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : delete_application_request)

let create_log_pattern_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_group_name =
       option_of_yojson (value_for_key resource_group_name_of_yojson "ResourceGroupName") _list path;
     log_pattern = option_of_yojson (value_for_key log_pattern_of_yojson "LogPattern") _list path;
   }
    : create_log_pattern_response)

let create_log_pattern_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rank = value_for_key log_pattern_rank_of_yojson "Rank" _list path;
     pattern = value_for_key log_pattern_regex_of_yojson "Pattern" _list path;
     pattern_name = value_for_key log_pattern_name_of_yojson "PatternName" _list path;
     pattern_set_name = value_for_key log_pattern_set_name_of_yojson "PatternSetName" _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : create_log_pattern_request)

let create_component_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_component_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_list = value_for_key resource_list_of_yojson "ResourceList" _list path;
     component_name = value_for_key custom_component_name_of_yojson "ComponentName" _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : create_component_request)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_msg_of_yojson "Message") _list path }
    : access_denied_exception)

let create_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_info =
       option_of_yojson (value_for_key application_info_of_yojson "ApplicationInfo") _list path;
   }
    : create_application_response)

let auto_create_of_yojson = bool_of_yojson

let create_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attach_missing_permission =
       option_of_yojson
         (value_for_key attach_missing_permission_of_yojson "AttachMissingPermission")
         _list path;
     grouping_type =
       option_of_yojson (value_for_key grouping_type_of_yojson "GroupingType") _list path;
     auto_create = option_of_yojson (value_for_key auto_create_of_yojson "AutoCreate") _list path;
     auto_config_enabled =
       option_of_yojson (value_for_key auto_config_enabled_of_yojson "AutoConfigEnabled") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     sns_notification_arn =
       option_of_yojson
         (value_for_key sns_notification_arn_of_yojson "SNSNotificationArn")
         _list path;
     ops_item_sns_topic_arn =
       option_of_yojson
         (value_for_key ops_item_sns_topic_arn_of_yojson "OpsItemSNSTopicArn")
         _list path;
     cwe_monitor_enabled =
       option_of_yojson (value_for_key cwe_monitor_enabled_of_yojson "CWEMonitorEnabled") _list path;
     ops_center_enabled =
       option_of_yojson (value_for_key ops_center_enabled_of_yojson "OpsCenterEnabled") _list path;
     resource_group_name =
       option_of_yojson (value_for_key resource_group_name_of_yojson "ResourceGroupName") _list path;
   }
    : create_application_request)

let add_workload_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workload_configuration =
       option_of_yojson
         (value_for_key workload_configuration_of_yojson "WorkloadConfiguration")
         _list path;
     workload_id = option_of_yojson (value_for_key workload_id_of_yojson "WorkloadId") _list path;
   }
    : add_workload_response)

let add_workload_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workload_configuration =
       value_for_key workload_configuration_of_yojson "WorkloadConfiguration" _list path;
     component_name = value_for_key component_name_of_yojson "ComponentName" _list path;
     resource_group_name =
       value_for_key resource_group_name_of_yojson "ResourceGroupName" _list path;
   }
    : add_workload_request)
