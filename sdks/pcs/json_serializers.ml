open Smaws_Lib.Json.SerializeHelpers
open Types

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_keys_to_yojson x.tag_keys));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("serviceCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code));
      ( "resourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id );
      ( "resourceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type );
      ( "quotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson
let request_tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tags", Some (request_tag_map_to_yojson x.tags));
    ]

let response_tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson response_tag_map_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let accounting_mode_to_yojson (x : accounting_mode) =
  match x with STANDARD -> `String "STANDARD" | NONE -> `String "NONE"

let accounting_to_yojson (x : accounting) =
  assoc_to_yojson
    [
      ( "defaultPurgeTimeInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.default_purge_time_in_days );
      ("mode", Some (accounting_mode_to_yojson x.mode));
    ]

let accounting_request_to_yojson (x : accounting_request) =
  assoc_to_yojson
    [
      ( "defaultPurgeTimeInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.default_purge_time_in_days );
      ("mode", Some (accounting_mode_to_yojson x.mode));
    ]

let ami_id_to_yojson = string_to_yojson
let bootstrap_id_to_yojson = string_to_yojson

let cgroup_custom_setting_to_yojson (x : cgroup_custom_setting) =
  assoc_to_yojson
    [
      ( "parameterName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.parameter_name) );
      ( "parameterValue",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.parameter_value) );
    ]

let cgroup_custom_settings_to_yojson tree = list_to_yojson cgroup_custom_setting_to_yojson tree

let error_info_to_yojson (x : error_info) =
  assoc_to_yojson
    [
      ("code", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.code);
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let error_info_list_to_yojson tree = list_to_yojson error_info_to_yojson tree

let endpoint_type_to_yojson (x : endpoint_type) =
  match x with
  | SLURMCTLD -> `String "SLURMCTLD"
  | SLURMDBD -> `String "SLURMDBD"
  | SLURMRESTD -> `String "SLURMRESTD"

let endpoint_to_yojson (x : endpoint) =
  assoc_to_yojson
    [
      ("type", Some (endpoint_type_to_yojson x.type_));
      ( "privateIpAddress",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.private_ip_address) );
      ( "publicIpAddress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.public_ip_address
      );
      ( "ipv6Address",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ipv6_address );
      ("port", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.port));
    ]

let endpoints_to_yojson tree = list_to_yojson endpoint_to_yojson tree

let network_type_to_yojson (x : network_type) =
  match x with IPV4 -> `String "IPV4" | IPV6 -> `String "IPV6"

let security_group_id_to_yojson = string_to_yojson
let security_group_id_list_to_yojson tree = list_to_yojson security_group_id_to_yojson tree
let subnet_id_to_yojson = string_to_yojson
let subnet_id_list_to_yojson tree = list_to_yojson subnet_id_to_yojson tree

let networking_to_yojson (x : networking) =
  assoc_to_yojson
    [
      ("subnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
      ("securityGroupIds", option_to_yojson security_group_id_list_to_yojson x.security_group_ids);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
    ]

let slurm_rest_mode_to_yojson (x : slurm_rest_mode) =
  match x with STANDARD -> `String "STANDARD" | NONE -> `String "NONE"

let slurm_rest_to_yojson (x : slurm_rest) =
  assoc_to_yojson [ ("mode", Some (slurm_rest_mode_to_yojson x.mode)) ]

let jwt_key_to_yojson (x : jwt_key) =
  assoc_to_yojson
    [
      ("secretArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.secret_arn));
      ( "secretVersion",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.secret_version) );
    ]

let jwt_auth_to_yojson (x : jwt_auth) =
  assoc_to_yojson [ ("jwtKey", option_to_yojson jwt_key_to_yojson x.jwt_key) ]

let slurm_auth_key_to_yojson (x : slurm_auth_key) =
  assoc_to_yojson
    [
      ("secretArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.secret_arn));
      ( "secretVersion",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.secret_version) );
    ]

let slurmdbd_custom_setting_to_yojson (x : slurmdbd_custom_setting) =
  assoc_to_yojson
    [
      ( "parameterName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.parameter_name) );
      ( "parameterValue",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.parameter_value) );
    ]

let slurmdbd_custom_settings_to_yojson tree = list_to_yojson slurmdbd_custom_setting_to_yojson tree

let slurm_custom_setting_to_yojson (x : slurm_custom_setting) =
  assoc_to_yojson
    [
      ( "parameterName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.parameter_name) );
      ( "parameterValue",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.parameter_value) );
    ]

let slurm_custom_settings_to_yojson tree = list_to_yojson slurm_custom_setting_to_yojson tree

let cluster_slurm_configuration_to_yojson (x : cluster_slurm_configuration) =
  assoc_to_yojson
    [
      ( "scaleDownIdleTimeInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scale_down_idle_time_in_seconds );
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
      ( "slurmdbdCustomSettings",
        option_to_yojson slurmdbd_custom_settings_to_yojson x.slurmdbd_custom_settings );
      ( "cgroupCustomSettings",
        option_to_yojson cgroup_custom_settings_to_yojson x.cgroup_custom_settings );
      ("authKey", option_to_yojson slurm_auth_key_to_yojson x.auth_key);
      ("jwtAuth", option_to_yojson jwt_auth_to_yojson x.jwt_auth);
      ("accounting", option_to_yojson accounting_to_yojson x.accounting);
      ("slurmRest", option_to_yojson slurm_rest_to_yojson x.slurm_rest);
    ]

let size_to_yojson (x : size) =
  match x with SMALL -> `String "SMALL" | MEDIUM -> `String "MEDIUM" | LARGE -> `String "LARGE"

let scheduler_type_to_yojson (x : scheduler_type) = match x with SLURM -> `String "SLURM"

let scheduler_to_yojson (x : scheduler) =
  assoc_to_yojson
    [
      ("type", Some (scheduler_type_to_yojson x.type_));
      ("version", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version));
    ]

let cluster_status_to_yojson (x : cluster_status) =
  match x with
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | SUSPENDING -> `String "SUSPENDING"
  | SUSPENDED -> `String "SUSPENDED"
  | RESUMING -> `String "RESUMING"

let cluster_to_yojson (x : cluster) =
  assoc_to_yojson
    [
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("id", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id));
      ("arn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn));
      ("status", Some (cluster_status_to_yojson x.status));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.created_at) );
      ( "modifiedAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.modified_at) );
      ("scheduler", Some (scheduler_to_yojson x.scheduler));
      ("size", Some (size_to_yojson x.size));
      ( "slurmConfiguration",
        option_to_yojson cluster_slurm_configuration_to_yojson x.slurm_configuration );
      ("networking", Some (networking_to_yojson x.networking));
      ("endpoints", option_to_yojson endpoints_to_yojson x.endpoints);
      ("errorInfo", option_to_yojson error_info_list_to_yojson x.error_info);
    ]

let cluster_identifier_to_yojson = string_to_yojson

let cluster_summary_to_yojson (x : cluster_summary) =
  assoc_to_yojson
    [
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("id", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id));
      ("arn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.created_at) );
      ( "modifiedAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.modified_at) );
      ("status", Some (cluster_status_to_yojson x.status));
    ]

let cluster_list_to_yojson tree = list_to_yojson cluster_summary_to_yojson tree
let cluster_name_to_yojson = string_to_yojson

let slurm_rest_request_to_yojson (x : slurm_rest_request) =
  assoc_to_yojson [ ("mode", Some (slurm_rest_mode_to_yojson x.mode)) ]

let cluster_slurm_configuration_request_to_yojson (x : cluster_slurm_configuration_request) =
  assoc_to_yojson
    [
      ( "scaleDownIdleTimeInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scale_down_idle_time_in_seconds );
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
      ( "slurmdbdCustomSettings",
        option_to_yojson slurmdbd_custom_settings_to_yojson x.slurmdbd_custom_settings );
      ( "cgroupCustomSettings",
        option_to_yojson cgroup_custom_settings_to_yojson x.cgroup_custom_settings );
      ("accounting", option_to_yojson accounting_request_to_yojson x.accounting);
      ("slurmRest", option_to_yojson slurm_rest_request_to_yojson x.slurm_rest);
    ]

let compute_node_group_slurm_configuration_to_yojson (x : compute_node_group_slurm_configuration) =
  assoc_to_yojson
    [
      ( "scaleDownIdleTimeInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scale_down_idle_time_in_seconds );
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
    ]

let spot_allocation_strategy_to_yojson (x : spot_allocation_strategy) =
  match x with
  | LOWEST_PRICE -> `String "lowest-price"
  | CAPACITY_OPTIMIZED -> `String "capacity-optimized"
  | PRICE_CAPACITY_OPTIMIZED -> `String "price-capacity-optimized"

let spot_options_to_yojson (x : spot_options) =
  assoc_to_yojson
    [
      ( "allocationStrategy",
        option_to_yojson spot_allocation_strategy_to_yojson x.allocation_strategy );
    ]

let instance_config_to_yojson (x : instance_config) =
  assoc_to_yojson
    [
      ( "instanceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_type );
    ]

let instance_list_to_yojson tree = list_to_yojson instance_config_to_yojson tree

let scaling_configuration_to_yojson (x : scaling_configuration) =
  assoc_to_yojson
    [
      ( "minInstanceCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.min_instance_count) );
      ( "maxInstanceCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_instance_count) );
    ]

let instance_profile_arn_to_yojson = string_to_yojson

let custom_launch_template_to_yojson (x : custom_launch_template) =
  assoc_to_yojson
    [
      ("id", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id));
      ("version", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version));
    ]

let purchase_option_to_yojson (x : purchase_option) =
  match x with
  | ONDEMAND -> `String "ONDEMAND"
  | SPOT -> `String "SPOT"
  | CAPACITY_BLOCK -> `String "CAPACITY_BLOCK"
  | INTERRUPTIBLE_CAPACITY_RESERVATION -> `String "INTERRUPTIBLE_CAPACITY_RESERVATION"

let compute_node_group_status_to_yojson (x : compute_node_group_status) =
  match x with
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | DELETED -> `String "DELETED"
  | SUSPENDING -> `String "SUSPENDING"
  | SUSPENDED -> `String "SUSPENDED"
  | RESUMING -> `String "RESUMING"

let compute_node_group_name_to_yojson = string_to_yojson

let compute_node_group_to_yojson (x : compute_node_group) =
  assoc_to_yojson
    [
      ("name", Some (compute_node_group_name_to_yojson x.name));
      ("id", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id));
      ("arn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn));
      ("clusterId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cluster_id));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.created_at) );
      ( "modifiedAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.modified_at) );
      ("status", Some (compute_node_group_status_to_yojson x.status));
      ("amiId", option_to_yojson ami_id_to_yojson x.ami_id);
      ("subnetIds", Some (subnet_id_list_to_yojson x.subnet_ids));
      ("purchaseOption", option_to_yojson purchase_option_to_yojson x.purchase_option);
      ("customLaunchTemplate", Some (custom_launch_template_to_yojson x.custom_launch_template));
      ("iamInstanceProfileArn", Some (instance_profile_arn_to_yojson x.iam_instance_profile_arn));
      ("scalingConfiguration", Some (scaling_configuration_to_yojson x.scaling_configuration));
      ("instanceConfigs", Some (instance_list_to_yojson x.instance_configs));
      ("spotOptions", option_to_yojson spot_options_to_yojson x.spot_options);
      ( "slurmConfiguration",
        option_to_yojson compute_node_group_slurm_configuration_to_yojson x.slurm_configuration );
      ("errorInfo", option_to_yojson error_info_list_to_yojson x.error_info);
    ]

let compute_node_group_configuration_to_yojson (x : compute_node_group_configuration) =
  assoc_to_yojson
    [
      ( "computeNodeGroupId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.compute_node_group_id );
    ]

let compute_node_group_configuration_list_to_yojson tree =
  list_to_yojson compute_node_group_configuration_to_yojson tree

let compute_node_group_identifier_to_yojson = string_to_yojson

let compute_node_group_summary_to_yojson (x : compute_node_group_summary) =
  assoc_to_yojson
    [
      ("name", Some (compute_node_group_name_to_yojson x.name));
      ("id", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id));
      ("arn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn));
      ("clusterId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cluster_id));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.created_at) );
      ( "modifiedAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.modified_at) );
      ("status", Some (compute_node_group_status_to_yojson x.status));
    ]

let compute_node_group_list_to_yojson tree =
  list_to_yojson compute_node_group_summary_to_yojson tree

let compute_node_group_slurm_configuration_request_to_yojson
    (x : compute_node_group_slurm_configuration_request) =
  assoc_to_yojson
    [
      ( "scaleDownIdleTimeInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scale_down_idle_time_in_seconds );
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
    ]

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | UNKNOWN_OPERATION -> `String "unknownOperation"
  | CANNOT_PARSE -> `String "cannotParse"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | OTHER -> `String "other"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("reason", Some (validation_exception_reason_to_yojson x.reason));
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ( "retryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let create_cluster_response_to_yojson (x : create_cluster_response) =
  assoc_to_yojson [ ("cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let sb_client_token_to_yojson = string_to_yojson

let networking_request_to_yojson (x : networking_request) =
  assoc_to_yojson
    [
      ("subnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
      ("securityGroupIds", option_to_yojson security_group_id_list_to_yojson x.security_group_ids);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
    ]

let scheduler_request_to_yojson (x : scheduler_request) =
  assoc_to_yojson
    [
      ("type", Some (scheduler_type_to_yojson x.type_));
      ("version", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version));
    ]

let create_cluster_request_to_yojson (x : create_cluster_request) =
  assoc_to_yojson
    [
      ("clusterName", Some (cluster_name_to_yojson x.cluster_name));
      ("scheduler", Some (scheduler_request_to_yojson x.scheduler));
      ("size", Some (size_to_yojson x.size));
      ("networking", Some (networking_request_to_yojson x.networking));
      ( "slurmConfiguration",
        option_to_yojson cluster_slurm_configuration_request_to_yojson x.slurm_configuration );
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
    ]

let create_compute_node_group_response_to_yojson (x : create_compute_node_group_response) =
  assoc_to_yojson
    [ ("computeNodeGroup", option_to_yojson compute_node_group_to_yojson x.compute_node_group) ]

let scaling_configuration_request_to_yojson (x : scaling_configuration_request) =
  assoc_to_yojson
    [
      ( "minInstanceCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.min_instance_count) );
      ( "maxInstanceCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_instance_count) );
    ]

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let create_compute_node_group_request_to_yojson (x : create_compute_node_group_request) =
  assoc_to_yojson
    [
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
      ("computeNodeGroupName", Some (compute_node_group_name_to_yojson x.compute_node_group_name));
      ("amiId", option_to_yojson ami_id_to_yojson x.ami_id);
      ("subnetIds", Some (string_list_to_yojson x.subnet_ids));
      ("purchaseOption", option_to_yojson purchase_option_to_yojson x.purchase_option);
      ("customLaunchTemplate", Some (custom_launch_template_to_yojson x.custom_launch_template));
      ("iamInstanceProfileArn", Some (instance_profile_arn_to_yojson x.iam_instance_profile_arn));
      ( "scalingConfiguration",
        Some (scaling_configuration_request_to_yojson x.scaling_configuration) );
      ("instanceConfigs", Some (instance_list_to_yojson x.instance_configs));
      ("spotOptions", option_to_yojson spot_options_to_yojson x.spot_options);
      ( "slurmConfiguration",
        option_to_yojson compute_node_group_slurm_configuration_request_to_yojson
          x.slurm_configuration );
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
    ]

let queue_slurm_configuration_to_yojson (x : queue_slurm_configuration) =
  assoc_to_yojson
    [
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
    ]

let queue_status_to_yojson (x : queue_status) =
  match x with
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | SUSPENDING -> `String "SUSPENDING"
  | SUSPENDED -> `String "SUSPENDED"
  | RESUMING -> `String "RESUMING"

let queue_name_to_yojson = string_to_yojson

let queue_to_yojson (x : queue) =
  assoc_to_yojson
    [
      ("name", Some (queue_name_to_yojson x.name));
      ("id", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id));
      ("arn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn));
      ("clusterId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cluster_id));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.created_at) );
      ( "modifiedAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.modified_at) );
      ("status", Some (queue_status_to_yojson x.status));
      ( "computeNodeGroupConfigurations",
        Some (compute_node_group_configuration_list_to_yojson x.compute_node_group_configurations)
      );
      ( "slurmConfiguration",
        option_to_yojson queue_slurm_configuration_to_yojson x.slurm_configuration );
      ("errorInfo", option_to_yojson error_info_list_to_yojson x.error_info);
    ]

let create_queue_response_to_yojson (x : create_queue_response) =
  assoc_to_yojson [ ("queue", option_to_yojson queue_to_yojson x.queue) ]

let queue_slurm_configuration_request_to_yojson (x : queue_slurm_configuration_request) =
  assoc_to_yojson
    [
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
    ]

let create_queue_request_to_yojson (x : create_queue_request) =
  assoc_to_yojson
    [
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
      ("queueName", Some (queue_name_to_yojson x.queue_name));
      ( "computeNodeGroupConfigurations",
        option_to_yojson compute_node_group_configuration_list_to_yojson
          x.compute_node_group_configurations );
      ( "slurmConfiguration",
        option_to_yojson queue_slurm_configuration_request_to_yojson x.slurm_configuration );
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
    ]

let delete_cluster_response_to_yojson = unit_to_yojson

let delete_cluster_request_to_yojson (x : delete_cluster_request) =
  assoc_to_yojson
    [
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_compute_node_group_response_to_yojson = unit_to_yojson

let delete_compute_node_group_request_to_yojson (x : delete_compute_node_group_request) =
  assoc_to_yojson
    [
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
      ( "computeNodeGroupIdentifier",
        Some (compute_node_group_identifier_to_yojson x.compute_node_group_identifier) );
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_queue_response_to_yojson = unit_to_yojson
let queue_identifier_to_yojson = string_to_yojson

let delete_queue_request_to_yojson (x : delete_queue_request) =
  assoc_to_yojson
    [
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
      ("queueIdentifier", Some (queue_identifier_to_yojson x.queue_identifier));
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let get_cluster_response_to_yojson (x : get_cluster_response) =
  assoc_to_yojson [ ("cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let get_cluster_request_to_yojson (x : get_cluster_request) =
  assoc_to_yojson
    [ ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier)) ]

let get_compute_node_group_response_to_yojson (x : get_compute_node_group_response) =
  assoc_to_yojson
    [ ("computeNodeGroup", option_to_yojson compute_node_group_to_yojson x.compute_node_group) ]

let get_compute_node_group_request_to_yojson (x : get_compute_node_group_request) =
  assoc_to_yojson
    [
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
      ( "computeNodeGroupIdentifier",
        Some (compute_node_group_identifier_to_yojson x.compute_node_group_identifier) );
    ]

let get_queue_response_to_yojson (x : get_queue_response) =
  assoc_to_yojson [ ("queue", option_to_yojson queue_to_yojson x.queue) ]

let get_queue_request_to_yojson (x : get_queue_request) =
  assoc_to_yojson
    [
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
      ("queueIdentifier", Some (queue_identifier_to_yojson x.queue_identifier));
    ]

let list_clusters_response_to_yojson (x : list_clusters_response) =
  assoc_to_yojson
    [
      ("clusters", Some (cluster_list_to_yojson x.clusters));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let max_results_to_yojson = int_to_yojson

let list_clusters_request_to_yojson (x : list_clusters_request) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_compute_node_groups_response_to_yojson (x : list_compute_node_groups_response) =
  assoc_to_yojson
    [
      ("computeNodeGroups", Some (compute_node_group_list_to_yojson x.compute_node_groups));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_compute_node_groups_request_to_yojson (x : list_compute_node_groups_request) =
  assoc_to_yojson
    [
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let queue_summary_to_yojson (x : queue_summary) =
  assoc_to_yojson
    [
      ("name", Some (queue_name_to_yojson x.name));
      ("id", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id));
      ("arn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn));
      ("clusterId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cluster_id));
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.created_at) );
      ( "modifiedAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.modified_at) );
      ("status", Some (queue_status_to_yojson x.status));
    ]

let queue_list_to_yojson tree = list_to_yojson queue_summary_to_yojson tree

let list_queues_response_to_yojson (x : list_queues_response) =
  assoc_to_yojson
    [
      ("queues", Some (queue_list_to_yojson x.queues));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_queues_request_to_yojson (x : list_queues_request) =
  assoc_to_yojson
    [
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let shared_secret_to_yojson = string_to_yojson

let register_compute_node_group_instance_response_to_yojson
    (x : register_compute_node_group_instance_response) =
  assoc_to_yojson
    [
      ("nodeID", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.node_i_d));
      ("sharedSecret", Some (shared_secret_to_yojson x.shared_secret));
      ("endpoints", Some (endpoints_to_yojson x.endpoints));
    ]

let register_compute_node_group_instance_request_to_yojson
    (x : register_compute_node_group_instance_request) =
  assoc_to_yojson
    [
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
      ("bootstrapId", Some (bootstrap_id_to_yojson x.bootstrap_id));
    ]

let update_accounting_request_to_yojson (x : update_accounting_request) =
  assoc_to_yojson
    [
      ( "defaultPurgeTimeInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.default_purge_time_in_days );
      ("mode", option_to_yojson accounting_mode_to_yojson x.mode);
    ]

let update_cluster_response_to_yojson (x : update_cluster_response) =
  assoc_to_yojson [ ("cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let update_scheduler_request_to_yojson (x : update_scheduler_request) =
  assoc_to_yojson
    [ ("version", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version)) ]

let update_slurm_rest_request_to_yojson (x : update_slurm_rest_request) =
  assoc_to_yojson [ ("mode", option_to_yojson slurm_rest_mode_to_yojson x.mode) ]

let update_cluster_slurm_configuration_request_to_yojson
    (x : update_cluster_slurm_configuration_request) =
  assoc_to_yojson
    [
      ( "scaleDownIdleTimeInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scale_down_idle_time_in_seconds );
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
      ( "slurmdbdCustomSettings",
        option_to_yojson slurmdbd_custom_settings_to_yojson x.slurmdbd_custom_settings );
      ( "cgroupCustomSettings",
        option_to_yojson cgroup_custom_settings_to_yojson x.cgroup_custom_settings );
      ("accounting", option_to_yojson update_accounting_request_to_yojson x.accounting);
      ("slurmRest", option_to_yojson update_slurm_rest_request_to_yojson x.slurm_rest);
    ]

let update_cluster_request_to_yojson (x : update_cluster_request) =
  assoc_to_yojson
    [
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "slurmConfiguration",
        option_to_yojson update_cluster_slurm_configuration_request_to_yojson x.slurm_configuration
      );
      ("scheduler", option_to_yojson update_scheduler_request_to_yojson x.scheduler);
    ]

let update_compute_node_group_response_to_yojson (x : update_compute_node_group_response) =
  assoc_to_yojson
    [ ("computeNodeGroup", option_to_yojson compute_node_group_to_yojson x.compute_node_group) ]

let update_compute_node_group_slurm_configuration_request_to_yojson
    (x : update_compute_node_group_slurm_configuration_request) =
  assoc_to_yojson
    [
      ( "scaleDownIdleTimeInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scale_down_idle_time_in_seconds );
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
    ]

let update_compute_node_group_request_to_yojson (x : update_compute_node_group_request) =
  assoc_to_yojson
    [
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
      ( "computeNodeGroupIdentifier",
        Some (compute_node_group_identifier_to_yojson x.compute_node_group_identifier) );
      ("amiId", option_to_yojson ami_id_to_yojson x.ami_id);
      ("subnetIds", option_to_yojson string_list_to_yojson x.subnet_ids);
      ( "customLaunchTemplate",
        option_to_yojson custom_launch_template_to_yojson x.custom_launch_template );
      ("purchaseOption", option_to_yojson purchase_option_to_yojson x.purchase_option);
      ("spotOptions", option_to_yojson spot_options_to_yojson x.spot_options);
      ( "scalingConfiguration",
        option_to_yojson scaling_configuration_request_to_yojson x.scaling_configuration );
      ( "iamInstanceProfileArn",
        option_to_yojson instance_profile_arn_to_yojson x.iam_instance_profile_arn );
      ( "slurmConfiguration",
        option_to_yojson update_compute_node_group_slurm_configuration_request_to_yojson
          x.slurm_configuration );
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let update_queue_response_to_yojson (x : update_queue_response) =
  assoc_to_yojson [ ("queue", option_to_yojson queue_to_yojson x.queue) ]

let update_queue_slurm_configuration_request_to_yojson
    (x : update_queue_slurm_configuration_request) =
  assoc_to_yojson
    [
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
    ]

let update_queue_request_to_yojson (x : update_queue_request) =
  assoc_to_yojson
    [
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
      ("queueIdentifier", Some (queue_identifier_to_yojson x.queue_identifier));
      ( "computeNodeGroupConfigurations",
        option_to_yojson compute_node_group_configuration_list_to_yojson
          x.compute_node_group_configurations );
      ( "slurmConfiguration",
        option_to_yojson update_queue_slurm_configuration_request_to_yojson x.slurm_configuration );
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]
