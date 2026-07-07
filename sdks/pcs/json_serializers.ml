open Smaws_Lib.Json.SerializeHelpers
open Types

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | OTHER -> `String "other"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | CANNOT_PARSE -> `String "cannotParse"
  | UNKNOWN_OPERATION -> `String "unknownOperation"

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
      ("reason", Some (validation_exception_reason_to_yojson x.reason));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let slurm_rest_mode_to_yojson (x : slurm_rest_mode) =
  match x with NONE -> `String "NONE" | STANDARD -> `String "STANDARD"

let update_slurm_rest_request_to_yojson (x : update_slurm_rest_request) =
  assoc_to_yojson [ ("mode", option_to_yojson slurm_rest_mode_to_yojson x.mode) ]

let update_scheduler_request_to_yojson (x : update_scheduler_request) =
  assoc_to_yojson
    [ ("version", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version)) ]

let slurm_custom_setting_to_yojson (x : slurm_custom_setting) =
  assoc_to_yojson
    [
      ( "parameterValue",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.parameter_value) );
      ( "parameterName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.parameter_name) );
    ]

let slurm_custom_settings_to_yojson tree = list_to_yojson slurm_custom_setting_to_yojson tree

let update_queue_slurm_configuration_request_to_yojson
    (x : update_queue_slurm_configuration_request) =
  assoc_to_yojson
    [
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
    ]

let queue_name_to_yojson = string_to_yojson

let queue_status_to_yojson (x : queue_status) =
  match x with
  | RESUMING -> `String "RESUMING"
  | SUSPENDED -> `String "SUSPENDED"
  | SUSPENDING -> `String "SUSPENDING"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"

let compute_node_group_configuration_to_yojson (x : compute_node_group_configuration) =
  assoc_to_yojson
    [
      ( "computeNodeGroupId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.compute_node_group_id );
    ]

let compute_node_group_configuration_list_to_yojson tree =
  list_to_yojson compute_node_group_configuration_to_yojson tree

let queue_slurm_configuration_to_yojson (x : queue_slurm_configuration) =
  assoc_to_yojson
    [
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
    ]

let error_info_to_yojson (x : error_info) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("code", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.code);
    ]

let error_info_list_to_yojson tree = list_to_yojson error_info_to_yojson tree

let queue_to_yojson (x : queue) =
  assoc_to_yojson
    [
      ("errorInfo", option_to_yojson error_info_list_to_yojson x.error_info);
      ( "slurmConfiguration",
        option_to_yojson queue_slurm_configuration_to_yojson x.slurm_configuration );
      ( "computeNodeGroupConfigurations",
        Some (compute_node_group_configuration_list_to_yojson x.compute_node_group_configurations)
      );
      ("status", Some (queue_status_to_yojson x.status));
      ( "modifiedAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.modified_at) );
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.created_at) );
      ("clusterId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cluster_id));
      ("arn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn));
      ("id", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id));
      ("name", Some (queue_name_to_yojson x.name));
    ]

let update_queue_response_to_yojson (x : update_queue_response) =
  assoc_to_yojson [ ("queue", option_to_yojson queue_to_yojson x.queue) ]

let cluster_identifier_to_yojson = string_to_yojson
let queue_identifier_to_yojson = string_to_yojson
let sb_client_token_to_yojson = string_to_yojson

let update_queue_request_to_yojson (x : update_queue_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "slurmConfiguration",
        option_to_yojson update_queue_slurm_configuration_request_to_yojson x.slurm_configuration );
      ( "computeNodeGroupConfigurations",
        option_to_yojson compute_node_group_configuration_list_to_yojson
          x.compute_node_group_configurations );
      ("queueIdentifier", Some (queue_identifier_to_yojson x.queue_identifier));
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ( "retryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ( "quotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
      ( "resourceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type );
      ( "resourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id );
      ("serviceCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let update_compute_node_group_slurm_configuration_request_to_yojson
    (x : update_compute_node_group_slurm_configuration_request) =
  assoc_to_yojson
    [
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
      ( "scaleDownIdleTimeInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scale_down_idle_time_in_seconds );
    ]

let compute_node_group_name_to_yojson = string_to_yojson

let compute_node_group_status_to_yojson (x : compute_node_group_status) =
  match x with
  | RESUMING -> `String "RESUMING"
  | SUSPENDED -> `String "SUSPENDED"
  | SUSPENDING -> `String "SUSPENDING"
  | DELETED -> `String "DELETED"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"

let ami_id_to_yojson = string_to_yojson
let subnet_id_to_yojson = string_to_yojson
let subnet_id_list_to_yojson tree = list_to_yojson subnet_id_to_yojson tree

let purchase_option_to_yojson (x : purchase_option) =
  match x with
  | INTERRUPTIBLE_CAPACITY_RESERVATION -> `String "INTERRUPTIBLE_CAPACITY_RESERVATION"
  | CAPACITY_BLOCK -> `String "CAPACITY_BLOCK"
  | SPOT -> `String "SPOT"
  | ONDEMAND -> `String "ONDEMAND"

let custom_launch_template_to_yojson (x : custom_launch_template) =
  assoc_to_yojson
    [
      ("version", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version));
      ("id", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id));
    ]

let instance_profile_arn_to_yojson = string_to_yojson

let scaling_configuration_to_yojson (x : scaling_configuration) =
  assoc_to_yojson
    [
      ( "maxInstanceCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_instance_count) );
      ( "minInstanceCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.min_instance_count) );
    ]

let instance_config_to_yojson (x : instance_config) =
  assoc_to_yojson
    [
      ( "instanceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_type );
    ]

let instance_list_to_yojson tree = list_to_yojson instance_config_to_yojson tree

let spot_allocation_strategy_to_yojson (x : spot_allocation_strategy) =
  match x with
  | PRICE_CAPACITY_OPTIMIZED -> `String "price-capacity-optimized"
  | CAPACITY_OPTIMIZED -> `String "capacity-optimized"
  | LOWEST_PRICE -> `String "lowest-price"

let spot_options_to_yojson (x : spot_options) =
  assoc_to_yojson
    [
      ( "allocationStrategy",
        option_to_yojson spot_allocation_strategy_to_yojson x.allocation_strategy );
    ]

let compute_node_group_slurm_configuration_to_yojson (x : compute_node_group_slurm_configuration) =
  assoc_to_yojson
    [
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
      ( "scaleDownIdleTimeInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scale_down_idle_time_in_seconds );
    ]

let compute_node_group_to_yojson (x : compute_node_group) =
  assoc_to_yojson
    [
      ("errorInfo", option_to_yojson error_info_list_to_yojson x.error_info);
      ( "slurmConfiguration",
        option_to_yojson compute_node_group_slurm_configuration_to_yojson x.slurm_configuration );
      ("spotOptions", option_to_yojson spot_options_to_yojson x.spot_options);
      ("instanceConfigs", Some (instance_list_to_yojson x.instance_configs));
      ("scalingConfiguration", Some (scaling_configuration_to_yojson x.scaling_configuration));
      ("iamInstanceProfileArn", Some (instance_profile_arn_to_yojson x.iam_instance_profile_arn));
      ("customLaunchTemplate", Some (custom_launch_template_to_yojson x.custom_launch_template));
      ("purchaseOption", option_to_yojson purchase_option_to_yojson x.purchase_option);
      ("subnetIds", Some (subnet_id_list_to_yojson x.subnet_ids));
      ("amiId", option_to_yojson ami_id_to_yojson x.ami_id);
      ("status", Some (compute_node_group_status_to_yojson x.status));
      ( "modifiedAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.modified_at) );
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.created_at) );
      ("clusterId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cluster_id));
      ("arn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn));
      ("id", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id));
      ("name", Some (compute_node_group_name_to_yojson x.name));
    ]

let update_compute_node_group_response_to_yojson (x : update_compute_node_group_response) =
  assoc_to_yojson
    [ ("computeNodeGroup", option_to_yojson compute_node_group_to_yojson x.compute_node_group) ]

let compute_node_group_identifier_to_yojson = string_to_yojson

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let scaling_configuration_request_to_yojson (x : scaling_configuration_request) =
  assoc_to_yojson
    [
      ( "maxInstanceCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_instance_count) );
      ( "minInstanceCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.min_instance_count) );
    ]

let update_compute_node_group_request_to_yojson (x : update_compute_node_group_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "slurmConfiguration",
        option_to_yojson update_compute_node_group_slurm_configuration_request_to_yojson
          x.slurm_configuration );
      ( "iamInstanceProfileArn",
        option_to_yojson instance_profile_arn_to_yojson x.iam_instance_profile_arn );
      ( "scalingConfiguration",
        option_to_yojson scaling_configuration_request_to_yojson x.scaling_configuration );
      ("spotOptions", option_to_yojson spot_options_to_yojson x.spot_options);
      ("purchaseOption", option_to_yojson purchase_option_to_yojson x.purchase_option);
      ( "customLaunchTemplate",
        option_to_yojson custom_launch_template_to_yojson x.custom_launch_template );
      ("subnetIds", option_to_yojson string_list_to_yojson x.subnet_ids);
      ("amiId", option_to_yojson ami_id_to_yojson x.ami_id);
      ( "computeNodeGroupIdentifier",
        Some (compute_node_group_identifier_to_yojson x.compute_node_group_identifier) );
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
    ]

let slurmdbd_custom_setting_to_yojson (x : slurmdbd_custom_setting) =
  assoc_to_yojson
    [
      ( "parameterValue",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.parameter_value) );
      ( "parameterName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.parameter_name) );
    ]

let slurmdbd_custom_settings_to_yojson tree = list_to_yojson slurmdbd_custom_setting_to_yojson tree

let cgroup_custom_setting_to_yojson (x : cgroup_custom_setting) =
  assoc_to_yojson
    [
      ( "parameterValue",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.parameter_value) );
      ( "parameterName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.parameter_name) );
    ]

let cgroup_custom_settings_to_yojson tree = list_to_yojson cgroup_custom_setting_to_yojson tree

let accounting_mode_to_yojson (x : accounting_mode) =
  match x with NONE -> `String "NONE" | STANDARD -> `String "STANDARD"

let update_accounting_request_to_yojson (x : update_accounting_request) =
  assoc_to_yojson
    [
      ("mode", option_to_yojson accounting_mode_to_yojson x.mode);
      ( "defaultPurgeTimeInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.default_purge_time_in_days );
    ]

let update_cluster_slurm_configuration_request_to_yojson
    (x : update_cluster_slurm_configuration_request) =
  assoc_to_yojson
    [
      ("slurmRest", option_to_yojson update_slurm_rest_request_to_yojson x.slurm_rest);
      ("accounting", option_to_yojson update_accounting_request_to_yojson x.accounting);
      ( "cgroupCustomSettings",
        option_to_yojson cgroup_custom_settings_to_yojson x.cgroup_custom_settings );
      ( "slurmdbdCustomSettings",
        option_to_yojson slurmdbd_custom_settings_to_yojson x.slurmdbd_custom_settings );
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
      ( "scaleDownIdleTimeInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scale_down_idle_time_in_seconds );
    ]

let cluster_status_to_yojson (x : cluster_status) =
  match x with
  | RESUMING -> `String "RESUMING"
  | SUSPENDED -> `String "SUSPENDED"
  | SUSPENDING -> `String "SUSPENDING"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"

let scheduler_type_to_yojson (x : scheduler_type) = match x with SLURM -> `String "SLURM"

let scheduler_to_yojson (x : scheduler) =
  assoc_to_yojson
    [
      ("version", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version));
      ("type", Some (scheduler_type_to_yojson x.type_));
    ]

let size_to_yojson (x : size) =
  match x with LARGE -> `String "LARGE" | MEDIUM -> `String "MEDIUM" | SMALL -> `String "SMALL"

let slurm_auth_key_to_yojson (x : slurm_auth_key) =
  assoc_to_yojson
    [
      ( "secretVersion",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.secret_version) );
      ("secretArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.secret_arn));
    ]

let jwt_key_to_yojson (x : jwt_key) =
  assoc_to_yojson
    [
      ( "secretVersion",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.secret_version) );
      ("secretArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.secret_arn));
    ]

let jwt_auth_to_yojson (x : jwt_auth) =
  assoc_to_yojson [ ("jwtKey", option_to_yojson jwt_key_to_yojson x.jwt_key) ]

let accounting_to_yojson (x : accounting) =
  assoc_to_yojson
    [
      ("mode", Some (accounting_mode_to_yojson x.mode));
      ( "defaultPurgeTimeInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.default_purge_time_in_days );
    ]

let slurm_rest_to_yojson (x : slurm_rest) =
  assoc_to_yojson [ ("mode", Some (slurm_rest_mode_to_yojson x.mode)) ]

let cluster_slurm_configuration_to_yojson (x : cluster_slurm_configuration) =
  assoc_to_yojson
    [
      ("slurmRest", option_to_yojson slurm_rest_to_yojson x.slurm_rest);
      ("accounting", option_to_yojson accounting_to_yojson x.accounting);
      ("jwtAuth", option_to_yojson jwt_auth_to_yojson x.jwt_auth);
      ("authKey", option_to_yojson slurm_auth_key_to_yojson x.auth_key);
      ( "cgroupCustomSettings",
        option_to_yojson cgroup_custom_settings_to_yojson x.cgroup_custom_settings );
      ( "slurmdbdCustomSettings",
        option_to_yojson slurmdbd_custom_settings_to_yojson x.slurmdbd_custom_settings );
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
      ( "scaleDownIdleTimeInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scale_down_idle_time_in_seconds );
    ]

let security_group_id_to_yojson = string_to_yojson
let security_group_id_list_to_yojson tree = list_to_yojson security_group_id_to_yojson tree

let network_type_to_yojson (x : network_type) =
  match x with IPV6 -> `String "IPV6" | IPV4 -> `String "IPV4"

let networking_to_yojson (x : networking) =
  assoc_to_yojson
    [
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("securityGroupIds", option_to_yojson security_group_id_list_to_yojson x.security_group_ids);
      ("subnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
    ]

let endpoint_type_to_yojson (x : endpoint_type) =
  match x with
  | SLURMRESTD -> `String "SLURMRESTD"
  | SLURMDBD -> `String "SLURMDBD"
  | SLURMCTLD -> `String "SLURMCTLD"

let endpoint_to_yojson (x : endpoint) =
  assoc_to_yojson
    [
      ("port", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.port));
      ( "ipv6Address",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ipv6_address );
      ( "publicIpAddress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.public_ip_address
      );
      ( "privateIpAddress",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.private_ip_address) );
      ("type", Some (endpoint_type_to_yojson x.type_));
    ]

let endpoints_to_yojson tree = list_to_yojson endpoint_to_yojson tree

let cluster_to_yojson (x : cluster) =
  assoc_to_yojson
    [
      ("errorInfo", option_to_yojson error_info_list_to_yojson x.error_info);
      ("endpoints", option_to_yojson endpoints_to_yojson x.endpoints);
      ("networking", Some (networking_to_yojson x.networking));
      ( "slurmConfiguration",
        option_to_yojson cluster_slurm_configuration_to_yojson x.slurm_configuration );
      ("size", Some (size_to_yojson x.size));
      ("scheduler", Some (scheduler_to_yojson x.scheduler));
      ( "modifiedAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.modified_at) );
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.created_at) );
      ("status", Some (cluster_status_to_yojson x.status));
      ("arn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn));
      ("id", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id));
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
    ]

let update_cluster_response_to_yojson (x : update_cluster_response) =
  assoc_to_yojson [ ("cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let update_cluster_request_to_yojson (x : update_cluster_request) =
  assoc_to_yojson
    [
      ("scheduler", option_to_yojson update_scheduler_request_to_yojson x.scheduler);
      ( "slurmConfiguration",
        option_to_yojson update_cluster_slurm_configuration_request_to_yojson x.slurm_configuration
      );
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_keys_to_yojson x.tag_keys));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson
let request_tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (request_tag_map_to_yojson x.tags));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let slurm_rest_request_to_yojson (x : slurm_rest_request) =
  assoc_to_yojson [ ("mode", Some (slurm_rest_mode_to_yojson x.mode)) ]

let shared_secret_to_yojson = string_to_yojson

let scheduler_request_to_yojson (x : scheduler_request) =
  assoc_to_yojson
    [
      ("version", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version));
      ("type", Some (scheduler_type_to_yojson x.type_));
    ]

let response_tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let register_compute_node_group_instance_response_to_yojson
    (x : register_compute_node_group_instance_response) =
  assoc_to_yojson
    [
      ("endpoints", Some (endpoints_to_yojson x.endpoints));
      ("sharedSecret", Some (shared_secret_to_yojson x.shared_secret));
      ("nodeID", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.node_i_d));
    ]

let bootstrap_id_to_yojson = string_to_yojson

let register_compute_node_group_instance_request_to_yojson
    (x : register_compute_node_group_instance_request) =
  assoc_to_yojson
    [
      ("bootstrapId", Some (bootstrap_id_to_yojson x.bootstrap_id));
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
    ]

let queue_summary_to_yojson (x : queue_summary) =
  assoc_to_yojson
    [
      ("status", Some (queue_status_to_yojson x.status));
      ( "modifiedAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.modified_at) );
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.created_at) );
      ("clusterId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cluster_id));
      ("arn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn));
      ("id", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id));
      ("name", Some (queue_name_to_yojson x.name));
    ]

let queue_slurm_configuration_request_to_yojson (x : queue_slurm_configuration_request) =
  assoc_to_yojson
    [
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
    ]

let queue_list_to_yojson tree = list_to_yojson queue_summary_to_yojson tree

let networking_request_to_yojson (x : networking_request) =
  assoc_to_yojson
    [
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("securityGroupIds", option_to_yojson security_group_id_list_to_yojson x.security_group_ids);
      ("subnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
    ]

let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson response_tag_map_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

let list_queues_response_to_yojson (x : list_queues_response) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("queues", Some (queue_list_to_yojson x.queues));
    ]

let list_queues_request_to_yojson (x : list_queues_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
    ]

let compute_node_group_summary_to_yojson (x : compute_node_group_summary) =
  assoc_to_yojson
    [
      ("status", Some (compute_node_group_status_to_yojson x.status));
      ( "modifiedAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.modified_at) );
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.created_at) );
      ("clusterId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cluster_id));
      ("arn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn));
      ("id", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id));
      ("name", Some (compute_node_group_name_to_yojson x.name));
    ]

let compute_node_group_list_to_yojson tree =
  list_to_yojson compute_node_group_summary_to_yojson tree

let list_compute_node_groups_response_to_yojson (x : list_compute_node_groups_response) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("computeNodeGroups", Some (compute_node_group_list_to_yojson x.compute_node_groups));
    ]

let list_compute_node_groups_request_to_yojson (x : list_compute_node_groups_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
    ]

let cluster_summary_to_yojson (x : cluster_summary) =
  assoc_to_yojson
    [
      ("status", Some (cluster_status_to_yojson x.status));
      ( "modifiedAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.modified_at) );
      ( "createdAt",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.created_at) );
      ("arn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn));
      ("id", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id));
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
    ]

let cluster_list_to_yojson tree = list_to_yojson cluster_summary_to_yojson tree

let list_clusters_response_to_yojson (x : list_clusters_response) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("clusters", Some (cluster_list_to_yojson x.clusters));
    ]

let list_clusters_request_to_yojson (x : list_clusters_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let get_queue_response_to_yojson (x : get_queue_response) =
  assoc_to_yojson [ ("queue", option_to_yojson queue_to_yojson x.queue) ]

let get_queue_request_to_yojson (x : get_queue_request) =
  assoc_to_yojson
    [
      ("queueIdentifier", Some (queue_identifier_to_yojson x.queue_identifier));
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
    ]

let get_compute_node_group_response_to_yojson (x : get_compute_node_group_response) =
  assoc_to_yojson
    [ ("computeNodeGroup", option_to_yojson compute_node_group_to_yojson x.compute_node_group) ]

let get_compute_node_group_request_to_yojson (x : get_compute_node_group_request) =
  assoc_to_yojson
    [
      ( "computeNodeGroupIdentifier",
        Some (compute_node_group_identifier_to_yojson x.compute_node_group_identifier) );
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
    ]

let get_cluster_response_to_yojson (x : get_cluster_response) =
  assoc_to_yojson [ ("cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let get_cluster_request_to_yojson (x : get_cluster_request) =
  assoc_to_yojson
    [ ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier)) ]

let delete_queue_response_to_yojson = unit_to_yojson

let delete_queue_request_to_yojson (x : delete_queue_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("queueIdentifier", Some (queue_identifier_to_yojson x.queue_identifier));
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
    ]

let delete_compute_node_group_response_to_yojson = unit_to_yojson

let delete_compute_node_group_request_to_yojson (x : delete_compute_node_group_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "computeNodeGroupIdentifier",
        Some (compute_node_group_identifier_to_yojson x.compute_node_group_identifier) );
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
    ]

let delete_cluster_response_to_yojson = unit_to_yojson

let delete_cluster_request_to_yojson (x : delete_cluster_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
    ]

let create_queue_response_to_yojson (x : create_queue_response) =
  assoc_to_yojson [ ("queue", option_to_yojson queue_to_yojson x.queue) ]

let create_queue_request_to_yojson (x : create_queue_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "slurmConfiguration",
        option_to_yojson queue_slurm_configuration_request_to_yojson x.slurm_configuration );
      ( "computeNodeGroupConfigurations",
        option_to_yojson compute_node_group_configuration_list_to_yojson
          x.compute_node_group_configurations );
      ("queueName", Some (queue_name_to_yojson x.queue_name));
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
    ]

let create_compute_node_group_response_to_yojson (x : create_compute_node_group_response) =
  assoc_to_yojson
    [ ("computeNodeGroup", option_to_yojson compute_node_group_to_yojson x.compute_node_group) ]

let compute_node_group_slurm_configuration_request_to_yojson
    (x : compute_node_group_slurm_configuration_request) =
  assoc_to_yojson
    [
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
      ( "scaleDownIdleTimeInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scale_down_idle_time_in_seconds );
    ]

let create_compute_node_group_request_to_yojson (x : create_compute_node_group_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "slurmConfiguration",
        option_to_yojson compute_node_group_slurm_configuration_request_to_yojson
          x.slurm_configuration );
      ("spotOptions", option_to_yojson spot_options_to_yojson x.spot_options);
      ("instanceConfigs", Some (instance_list_to_yojson x.instance_configs));
      ( "scalingConfiguration",
        Some (scaling_configuration_request_to_yojson x.scaling_configuration) );
      ("iamInstanceProfileArn", Some (instance_profile_arn_to_yojson x.iam_instance_profile_arn));
      ("customLaunchTemplate", Some (custom_launch_template_to_yojson x.custom_launch_template));
      ("purchaseOption", option_to_yojson purchase_option_to_yojson x.purchase_option);
      ("subnetIds", Some (string_list_to_yojson x.subnet_ids));
      ("amiId", option_to_yojson ami_id_to_yojson x.ami_id);
      ("computeNodeGroupName", Some (compute_node_group_name_to_yojson x.compute_node_group_name));
      ("clusterIdentifier", Some (cluster_identifier_to_yojson x.cluster_identifier));
    ]

let create_cluster_response_to_yojson (x : create_cluster_response) =
  assoc_to_yojson [ ("cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let cluster_name_to_yojson = string_to_yojson

let accounting_request_to_yojson (x : accounting_request) =
  assoc_to_yojson
    [
      ("mode", Some (accounting_mode_to_yojson x.mode));
      ( "defaultPurgeTimeInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.default_purge_time_in_days );
    ]

let cluster_slurm_configuration_request_to_yojson (x : cluster_slurm_configuration_request) =
  assoc_to_yojson
    [
      ("slurmRest", option_to_yojson slurm_rest_request_to_yojson x.slurm_rest);
      ("accounting", option_to_yojson accounting_request_to_yojson x.accounting);
      ( "cgroupCustomSettings",
        option_to_yojson cgroup_custom_settings_to_yojson x.cgroup_custom_settings );
      ( "slurmdbdCustomSettings",
        option_to_yojson slurmdbd_custom_settings_to_yojson x.slurmdbd_custom_settings );
      ( "slurmCustomSettings",
        option_to_yojson slurm_custom_settings_to_yojson x.slurm_custom_settings );
      ( "scaleDownIdleTimeInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scale_down_idle_time_in_seconds );
    ]

let create_cluster_request_to_yojson (x : create_cluster_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ( "clientToken",
        Some
          (sb_client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "slurmConfiguration",
        option_to_yojson cluster_slurm_configuration_request_to_yojson x.slurm_configuration );
      ("networking", Some (networking_request_to_yojson x.networking));
      ("size", Some (size_to_yojson x.size));
      ("scheduler", Some (scheduler_request_to_yojson x.scheduler));
      ("clusterName", Some (cluster_name_to_yojson x.cluster_name));
    ]
