open Smaws_Lib.Json.SerializeHelpers
open Types

let untag_resource_output_to_yojson = unit_to_yojson
let container_ar_n_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("Resource", Some (container_ar_n_to_yojson x.resource));
    ]

let error_message_to_yojson = string_to_yojson

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let container_not_found_exception_to_yojson (x : container_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let container_in_use_exception_to_yojson (x : container_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let time_stamp_to_yojson = timestamp_epoch_seconds_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_resource_output_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson tag_value_to_yojson x.value);
      ("Key", Some (tag_key_to_yojson x.key));
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("Resource", Some (container_ar_n_to_yojson x.resource));
    ]

let stop_access_logging_output_to_yojson = unit_to_yojson
let container_name_to_yojson = string_to_yojson

let stop_access_logging_input_to_yojson (x : stop_access_logging_input) =
  assoc_to_yojson [ ("ContainerName", Some (container_name_to_yojson x.container_name)) ]

let start_access_logging_output_to_yojson = unit_to_yojson

let start_access_logging_input_to_yojson (x : start_access_logging_input) =
  assoc_to_yojson [ ("ContainerName", Some (container_name_to_yojson x.container_name)) ]

let put_metric_policy_output_to_yojson = unit_to_yojson

let container_level_metrics_to_yojson (x : container_level_metrics) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let object_group_to_yojson = string_to_yojson
let object_group_name_to_yojson = string_to_yojson

let metric_policy_rule_to_yojson (x : metric_policy_rule) =
  assoc_to_yojson
    [
      ("ObjectGroupName", Some (object_group_name_to_yojson x.object_group_name));
      ("ObjectGroup", Some (object_group_to_yojson x.object_group));
    ]

let metric_policy_rules_to_yojson tree = list_to_yojson metric_policy_rule_to_yojson tree

let metric_policy_to_yojson (x : metric_policy) =
  assoc_to_yojson
    [
      ("MetricPolicyRules", option_to_yojson metric_policy_rules_to_yojson x.metric_policy_rules);
      ("ContainerLevelMetrics", Some (container_level_metrics_to_yojson x.container_level_metrics));
    ]

let put_metric_policy_input_to_yojson (x : put_metric_policy_input) =
  assoc_to_yojson
    [
      ("MetricPolicy", Some (metric_policy_to_yojson x.metric_policy));
      ("ContainerName", Some (container_name_to_yojson x.container_name));
    ]

let put_lifecycle_policy_output_to_yojson = unit_to_yojson
let lifecycle_policy_to_yojson = string_to_yojson

let put_lifecycle_policy_input_to_yojson (x : put_lifecycle_policy_input) =
  assoc_to_yojson
    [
      ("LifecyclePolicy", Some (lifecycle_policy_to_yojson x.lifecycle_policy));
      ("ContainerName", Some (container_name_to_yojson x.container_name));
    ]

let put_cors_policy_output_to_yojson = unit_to_yojson
let origin_to_yojson = string_to_yojson
let allowed_origins_to_yojson tree = list_to_yojson origin_to_yojson tree

let method_name_to_yojson (x : method_name) =
  match x with
  | HEAD -> `String "HEAD"
  | DELETE -> `String "DELETE"
  | GET -> `String "GET"
  | PUT -> `String "PUT"

let allowed_methods_to_yojson tree = list_to_yojson method_name_to_yojson tree
let header_to_yojson = string_to_yojson
let allowed_headers_to_yojson tree = list_to_yojson header_to_yojson tree
let max_age_seconds_to_yojson = int_to_yojson
let expose_headers_to_yojson tree = list_to_yojson header_to_yojson tree

let cors_rule_to_yojson (x : cors_rule) =
  assoc_to_yojson
    [
      ("ExposeHeaders", option_to_yojson expose_headers_to_yojson x.expose_headers);
      ("MaxAgeSeconds", option_to_yojson max_age_seconds_to_yojson x.max_age_seconds);
      ("AllowedHeaders", Some (allowed_headers_to_yojson x.allowed_headers));
      ("AllowedMethods", option_to_yojson allowed_methods_to_yojson x.allowed_methods);
      ("AllowedOrigins", Some (allowed_origins_to_yojson x.allowed_origins));
    ]

let cors_policy_to_yojson tree = list_to_yojson cors_rule_to_yojson tree

let put_cors_policy_input_to_yojson (x : put_cors_policy_input) =
  assoc_to_yojson
    [
      ("CorsPolicy", Some (cors_policy_to_yojson x.cors_policy));
      ("ContainerName", Some (container_name_to_yojson x.container_name));
    ]

let put_container_policy_output_to_yojson = unit_to_yojson
let container_policy_to_yojson = string_to_yojson

let put_container_policy_input_to_yojson (x : put_container_policy_input) =
  assoc_to_yojson
    [
      ("Policy", Some (container_policy_to_yojson x.policy));
      ("ContainerName", Some (container_name_to_yojson x.container_name));
    ]

let policy_not_found_exception_to_yojson (x : policy_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let pagination_token_to_yojson = string_to_yojson

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson [ ("Resource", Some (container_ar_n_to_yojson x.resource)) ]

let endpoint_to_yojson = string_to_yojson

let container_status_to_yojson (x : container_status) =
  match x with
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"

let container_access_logging_enabled_to_yojson = bool_to_yojson

let container_to_yojson (x : container) =
  assoc_to_yojson
    [
      ( "AccessLoggingEnabled",
        option_to_yojson container_access_logging_enabled_to_yojson x.access_logging_enabled );
      ("Status", option_to_yojson container_status_to_yojson x.status);
      ("Name", option_to_yojson container_name_to_yojson x.name);
      ("ARN", option_to_yojson container_ar_n_to_yojson x.ar_n);
      ("CreationTime", option_to_yojson time_stamp_to_yojson x.creation_time);
      ("Endpoint", option_to_yojson endpoint_to_yojson x.endpoint);
    ]

let container_list_to_yojson tree = list_to_yojson container_to_yojson tree

let list_containers_output_to_yojson (x : list_containers_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Containers", Some (container_list_to_yojson x.containers));
    ]

let container_list_limit_to_yojson = int_to_yojson

let list_containers_input_to_yojson (x : list_containers_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson container_list_limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let get_metric_policy_output_to_yojson (x : get_metric_policy_output) =
  assoc_to_yojson [ ("MetricPolicy", Some (metric_policy_to_yojson x.metric_policy)) ]

let get_metric_policy_input_to_yojson (x : get_metric_policy_input) =
  assoc_to_yojson [ ("ContainerName", Some (container_name_to_yojson x.container_name)) ]

let get_lifecycle_policy_output_to_yojson (x : get_lifecycle_policy_output) =
  assoc_to_yojson [ ("LifecyclePolicy", Some (lifecycle_policy_to_yojson x.lifecycle_policy)) ]

let get_lifecycle_policy_input_to_yojson (x : get_lifecycle_policy_input) =
  assoc_to_yojson [ ("ContainerName", Some (container_name_to_yojson x.container_name)) ]

let cors_policy_not_found_exception_to_yojson (x : cors_policy_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let get_cors_policy_output_to_yojson (x : get_cors_policy_output) =
  assoc_to_yojson [ ("CorsPolicy", Some (cors_policy_to_yojson x.cors_policy)) ]

let get_cors_policy_input_to_yojson (x : get_cors_policy_input) =
  assoc_to_yojson [ ("ContainerName", Some (container_name_to_yojson x.container_name)) ]

let get_container_policy_output_to_yojson (x : get_container_policy_output) =
  assoc_to_yojson [ ("Policy", Some (container_policy_to_yojson x.policy)) ]

let get_container_policy_input_to_yojson (x : get_container_policy_input) =
  assoc_to_yojson [ ("ContainerName", Some (container_name_to_yojson x.container_name)) ]

let describe_container_output_to_yojson (x : describe_container_output) =
  assoc_to_yojson [ ("Container", option_to_yojson container_to_yojson x.container) ]

let describe_container_input_to_yojson (x : describe_container_input) =
  assoc_to_yojson [ ("ContainerName", option_to_yojson container_name_to_yojson x.container_name) ]

let delete_metric_policy_output_to_yojson = unit_to_yojson

let delete_metric_policy_input_to_yojson (x : delete_metric_policy_input) =
  assoc_to_yojson [ ("ContainerName", Some (container_name_to_yojson x.container_name)) ]

let delete_lifecycle_policy_output_to_yojson = unit_to_yojson

let delete_lifecycle_policy_input_to_yojson (x : delete_lifecycle_policy_input) =
  assoc_to_yojson [ ("ContainerName", Some (container_name_to_yojson x.container_name)) ]

let delete_cors_policy_output_to_yojson = unit_to_yojson

let delete_cors_policy_input_to_yojson (x : delete_cors_policy_input) =
  assoc_to_yojson [ ("ContainerName", Some (container_name_to_yojson x.container_name)) ]

let delete_container_policy_output_to_yojson = unit_to_yojson

let delete_container_policy_input_to_yojson (x : delete_container_policy_input) =
  assoc_to_yojson [ ("ContainerName", Some (container_name_to_yojson x.container_name)) ]

let delete_container_output_to_yojson = unit_to_yojson

let delete_container_input_to_yojson (x : delete_container_input) =
  assoc_to_yojson [ ("ContainerName", Some (container_name_to_yojson x.container_name)) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_container_output_to_yojson (x : create_container_output) =
  assoc_to_yojson [ ("Container", Some (container_to_yojson x.container)) ]

let create_container_input_to_yojson (x : create_container_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ContainerName", Some (container_name_to_yojson x.container_name));
    ]
