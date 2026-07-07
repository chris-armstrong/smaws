open Smaws_Lib.Json.DeserializeHelpers
open Types

let untag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let container_ar_n_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource = value_for_key container_ar_n_of_yojson "Resource" _list path;
   }
    : untag_resource_input)

let error_message_of_yojson = string_of_yojson

let internal_server_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_server_error)

let container_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : container_not_found_exception)

let container_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : container_in_use_exception)

let time_stamp_of_yojson = timestamp_epoch_seconds_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource = value_for_key container_ar_n_of_yojson "Resource" _list path;
   }
    : tag_resource_input)

let stop_access_logging_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let container_name_of_yojson = string_of_yojson

let stop_access_logging_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ container_name = value_for_key container_name_of_yojson "ContainerName" _list path }
    : stop_access_logging_input)

let start_access_logging_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let start_access_logging_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ container_name = value_for_key container_name_of_yojson "ContainerName" _list path }
    : start_access_logging_input)

let put_metric_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let container_level_metrics_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerLevelMetrics" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerLevelMetrics")
     : container_level_metrics)
    : container_level_metrics)

let object_group_of_yojson = string_of_yojson
let object_group_name_of_yojson = string_of_yojson

let metric_policy_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     object_group_name = value_for_key object_group_name_of_yojson "ObjectGroupName" _list path;
     object_group = value_for_key object_group_of_yojson "ObjectGroup" _list path;
   }
    : metric_policy_rule)

let metric_policy_rules_of_yojson tree path = list_of_yojson metric_policy_rule_of_yojson tree path

let metric_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_policy_rules =
       option_of_yojson (value_for_key metric_policy_rules_of_yojson "MetricPolicyRules") _list path;
     container_level_metrics =
       value_for_key container_level_metrics_of_yojson "ContainerLevelMetrics" _list path;
   }
    : metric_policy)

let put_metric_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_policy = value_for_key metric_policy_of_yojson "MetricPolicy" _list path;
     container_name = value_for_key container_name_of_yojson "ContainerName" _list path;
   }
    : put_metric_policy_input)

let put_lifecycle_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let lifecycle_policy_of_yojson = string_of_yojson

let put_lifecycle_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lifecycle_policy = value_for_key lifecycle_policy_of_yojson "LifecyclePolicy" _list path;
     container_name = value_for_key container_name_of_yojson "ContainerName" _list path;
   }
    : put_lifecycle_policy_input)

let put_cors_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let origin_of_yojson = string_of_yojson
let allowed_origins_of_yojson tree path = list_of_yojson origin_of_yojson tree path

let method_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "HEAD" -> HEAD
    | `String "DELETE" -> DELETE
    | `String "GET" -> GET
    | `String "PUT" -> PUT
    | `String value -> raise (deserialize_unknown_enum_value_error path "MethodName" value)
    | _ -> raise (deserialize_wrong_type_error path "MethodName")
     : method_name)
    : method_name)

let allowed_methods_of_yojson tree path = list_of_yojson method_name_of_yojson tree path
let header_of_yojson = string_of_yojson
let allowed_headers_of_yojson tree path = list_of_yojson header_of_yojson tree path
let max_age_seconds_of_yojson = int_of_yojson
let expose_headers_of_yojson tree path = list_of_yojson header_of_yojson tree path

let cors_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expose_headers =
       option_of_yojson (value_for_key expose_headers_of_yojson "ExposeHeaders") _list path;
     max_age_seconds =
       option_of_yojson (value_for_key max_age_seconds_of_yojson "MaxAgeSeconds") _list path;
     allowed_headers = value_for_key allowed_headers_of_yojson "AllowedHeaders" _list path;
     allowed_methods =
       option_of_yojson (value_for_key allowed_methods_of_yojson "AllowedMethods") _list path;
     allowed_origins = value_for_key allowed_origins_of_yojson "AllowedOrigins" _list path;
   }
    : cors_rule)

let cors_policy_of_yojson tree path = list_of_yojson cors_rule_of_yojson tree path

let put_cors_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cors_policy = value_for_key cors_policy_of_yojson "CorsPolicy" _list path;
     container_name = value_for_key container_name_of_yojson "ContainerName" _list path;
   }
    : put_cors_policy_input)

let put_container_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let container_policy_of_yojson = string_of_yojson

let put_container_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy = value_for_key container_policy_of_yojson "Policy" _list path;
     container_name = value_for_key container_name_of_yojson "ContainerName" _list path;
   }
    : put_container_policy_input)

let policy_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : policy_not_found_exception)

let pagination_token_of_yojson = string_of_yojson

let list_tags_for_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_output)

let list_tags_for_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource = value_for_key container_ar_n_of_yojson "Resource" _list path }
    : list_tags_for_resource_input)

let endpoint_of_yojson = string_of_yojson

let container_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETING" -> DELETING
    | `String "CREATING" -> CREATING
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContainerStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerStatus")
     : container_status)
    : container_status)

let container_access_logging_enabled_of_yojson = bool_of_yojson

let container_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_logging_enabled =
       option_of_yojson
         (value_for_key container_access_logging_enabled_of_yojson "AccessLoggingEnabled")
         _list path;
     status = option_of_yojson (value_for_key container_status_of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key container_name_of_yojson "Name") _list path;
     ar_n = option_of_yojson (value_for_key container_ar_n_of_yojson "ARN") _list path;
     creation_time = option_of_yojson (value_for_key time_stamp_of_yojson "CreationTime") _list path;
     endpoint = option_of_yojson (value_for_key endpoint_of_yojson "Endpoint") _list path;
   }
    : container)

let container_list_of_yojson tree path = list_of_yojson container_of_yojson tree path

let list_containers_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     containers = value_for_key container_list_of_yojson "Containers" _list path;
   }
    : list_containers_output)

let container_list_limit_of_yojson = int_of_yojson

let list_containers_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key container_list_limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_containers_input)

let get_metric_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ metric_policy = value_for_key metric_policy_of_yojson "MetricPolicy" _list path }
    : get_metric_policy_output)

let get_metric_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ container_name = value_for_key container_name_of_yojson "ContainerName" _list path }
    : get_metric_policy_input)

let get_lifecycle_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ lifecycle_policy = value_for_key lifecycle_policy_of_yojson "LifecyclePolicy" _list path }
    : get_lifecycle_policy_output)

let get_lifecycle_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ container_name = value_for_key container_name_of_yojson "ContainerName" _list path }
    : get_lifecycle_policy_input)

let cors_policy_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : cors_policy_not_found_exception)

let get_cors_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cors_policy = value_for_key cors_policy_of_yojson "CorsPolicy" _list path }
    : get_cors_policy_output)

let get_cors_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ container_name = value_for_key container_name_of_yojson "ContainerName" _list path }
    : get_cors_policy_input)

let get_container_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy = value_for_key container_policy_of_yojson "Policy" _list path }
    : get_container_policy_output)

let get_container_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ container_name = value_for_key container_name_of_yojson "ContainerName" _list path }
    : get_container_policy_input)

let describe_container_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ container = option_of_yojson (value_for_key container_of_yojson "Container") _list path }
    : describe_container_output)

let describe_container_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name =
       option_of_yojson (value_for_key container_name_of_yojson "ContainerName") _list path;
   }
    : describe_container_input)

let delete_metric_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_metric_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ container_name = value_for_key container_name_of_yojson "ContainerName" _list path }
    : delete_metric_policy_input)

let delete_lifecycle_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_lifecycle_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ container_name = value_for_key container_name_of_yojson "ContainerName" _list path }
    : delete_lifecycle_policy_input)

let delete_cors_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_cors_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ container_name = value_for_key container_name_of_yojson "ContainerName" _list path }
    : delete_cors_policy_input)

let delete_container_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_container_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ container_name = value_for_key container_name_of_yojson "ContainerName" _list path }
    : delete_container_policy_input)

let delete_container_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_container_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ container_name = value_for_key container_name_of_yojson "ContainerName" _list path }
    : delete_container_input)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : limit_exceeded_exception)

let create_container_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ container = value_for_key container_of_yojson "Container" _list path }
    : create_container_output)

let create_container_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     container_name = value_for_key container_name_of_yojson "ContainerName" _list path;
   }
    : create_container_input)
