open Smaws_Lib.Json.DeserializeHelpers
open Types

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId" _list
         path;
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceType" _list
         path;
   }
    : resource_not_found_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let arn_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
     tag_keys = value_for_key tag_keys_of_yojson "tagKeys" _list path;
   }
    : untag_resource_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     service_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "serviceCode" _list
         path;
     resource_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId")
         _list path;
     resource_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceType")
         _list path;
     quota_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "quotaCode")
         _list path;
   }
    : service_quota_exceeded_exception)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson

let request_tag_map_of_yojson tree path =
  map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
     tags = value_for_key request_tag_map_of_yojson "tags" _list path;
   }
    : tag_resource_request)

let response_tag_map_of_yojson tree path =
  map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key response_tag_map_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : access_denied_exception)

let accounting_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDARD" -> STANDARD
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccountingMode" value)
    | _ -> raise (deserialize_wrong_type_error path "AccountingMode")
     : accounting_mode)
    : accounting_mode)

let accounting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_purge_time_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "defaultPurgeTimeInDays")
         _list path;
     mode = value_for_key accounting_mode_of_yojson "mode" _list path;
   }
    : accounting)

let accounting_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_purge_time_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "defaultPurgeTimeInDays")
         _list path;
     mode = value_for_key accounting_mode_of_yojson "mode" _list path;
   }
    : accounting_request)

let ami_id_of_yojson = string_of_yojson
let bootstrap_id_of_yojson = string_of_yojson

let cgroup_custom_setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "parameterName" _list
         path;
     parameter_value =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "parameterValue"
         _list path;
   }
    : cgroup_custom_setting)

let cgroup_custom_settings_of_yojson tree path =
  list_of_yojson cgroup_custom_setting_of_yojson tree path

let error_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "code")
         _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : error_info)

let error_info_list_of_yojson tree path = list_of_yojson error_info_of_yojson tree path

let endpoint_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SLURMCTLD" -> SLURMCTLD
    | `String "SLURMDBD" -> SLURMDBD
    | `String "SLURMRESTD" -> SLURMRESTD
    | `String value -> raise (deserialize_unknown_enum_value_error path "EndpointType" value)
    | _ -> raise (deserialize_wrong_type_error path "EndpointType")
     : endpoint_type)
    : endpoint_type)

let endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key endpoint_type_of_yojson "type" _list path;
     private_ip_address =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "privateIpAddress"
         _list path;
     public_ip_address =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "publicIpAddress")
         _list path;
     ipv6_address =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ipv6Address")
         _list path;
     port =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "port" _list path;
   }
    : endpoint)

let endpoints_of_yojson tree path = list_of_yojson endpoint_of_yojson tree path

let network_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IPV4" -> IPV4
    | `String "IPV6" -> IPV6
    | `String value -> raise (deserialize_unknown_enum_value_error path "NetworkType" value)
    | _ -> raise (deserialize_wrong_type_error path "NetworkType")
     : network_type)
    : network_type)

let security_group_id_of_yojson = string_of_yojson

let security_group_id_list_of_yojson tree path =
  list_of_yojson security_group_id_of_yojson tree path

let subnet_id_of_yojson = string_of_yojson
let subnet_id_list_of_yojson tree path = list_of_yojson subnet_id_of_yojson tree path

let networking_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_ids = option_of_yojson (value_for_key subnet_id_list_of_yojson "subnetIds") _list path;
     security_group_ids =
       option_of_yojson
         (value_for_key security_group_id_list_of_yojson "securityGroupIds")
         _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "networkType") _list path;
   }
    : networking)

let slurm_rest_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDARD" -> STANDARD
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SlurmRestMode" value)
    | _ -> raise (deserialize_wrong_type_error path "SlurmRestMode")
     : slurm_rest_mode)
    : slurm_rest_mode)

let slurm_rest_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ mode = value_for_key slurm_rest_mode_of_yojson "mode" _list path } : slurm_rest)

let jwt_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "secretArn" _list
         path;
     secret_version =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "secretVersion" _list
         path;
   }
    : jwt_key)

let jwt_auth_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ jwt_key = option_of_yojson (value_for_key jwt_key_of_yojson "jwtKey") _list path } : jwt_auth)

let slurm_auth_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "secretArn" _list
         path;
     secret_version =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "secretVersion" _list
         path;
   }
    : slurm_auth_key)

let slurmdbd_custom_setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "parameterName" _list
         path;
     parameter_value =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "parameterValue"
         _list path;
   }
    : slurmdbd_custom_setting)

let slurmdbd_custom_settings_of_yojson tree path =
  list_of_yojson slurmdbd_custom_setting_of_yojson tree path

let slurm_custom_setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "parameterName" _list
         path;
     parameter_value =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "parameterValue"
         _list path;
   }
    : slurm_custom_setting)

let slurm_custom_settings_of_yojson tree path =
  list_of_yojson slurm_custom_setting_of_yojson tree path

let cluster_slurm_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scale_down_idle_time_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "scaleDownIdleTimeInSeconds")
         _list path;
     slurm_custom_settings =
       option_of_yojson
         (value_for_key slurm_custom_settings_of_yojson "slurmCustomSettings")
         _list path;
     slurmdbd_custom_settings =
       option_of_yojson
         (value_for_key slurmdbd_custom_settings_of_yojson "slurmdbdCustomSettings")
         _list path;
     cgroup_custom_settings =
       option_of_yojson
         (value_for_key cgroup_custom_settings_of_yojson "cgroupCustomSettings")
         _list path;
     auth_key = option_of_yojson (value_for_key slurm_auth_key_of_yojson "authKey") _list path;
     jwt_auth = option_of_yojson (value_for_key jwt_auth_of_yojson "jwtAuth") _list path;
     accounting = option_of_yojson (value_for_key accounting_of_yojson "accounting") _list path;
     slurm_rest = option_of_yojson (value_for_key slurm_rest_of_yojson "slurmRest") _list path;
   }
    : cluster_slurm_configuration)

let size_of_yojson (tree : t) path =
  ((match tree with
    | `String "SMALL" -> SMALL
    | `String "MEDIUM" -> MEDIUM
    | `String "LARGE" -> LARGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Size" value)
    | _ -> raise (deserialize_wrong_type_error path "Size")
     : size)
    : size)

let scheduler_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SLURM" -> SLURM
    | `String value -> raise (deserialize_unknown_enum_value_error path "SchedulerType" value)
    | _ -> raise (deserialize_wrong_type_error path "SchedulerType")
     : scheduler_type)
    : scheduler_type)

let scheduler_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key scheduler_type_of_yojson "type" _list path;
     version =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "version" _list path;
   }
    : scheduler)

let cluster_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "ACTIVE" -> ACTIVE
    | `String "UPDATING" -> UPDATING
    | `String "DELETING" -> DELETING
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "SUSPENDING" -> SUSPENDING
    | `String "SUSPENDED" -> SUSPENDED
    | `String "RESUMING" -> RESUMING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClusterStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ClusterStatus")
     : cluster_status)
    : cluster_status)

let cluster_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "name" _list path;
     id = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "id" _list path;
     arn = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "arn" _list path;
     status = value_for_key cluster_status_of_yojson "status" _list path;
     created_at =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
         "createdAt" _list path;
     modified_at =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
         "modifiedAt" _list path;
     scheduler = value_for_key scheduler_of_yojson "scheduler" _list path;
     size = value_for_key size_of_yojson "size" _list path;
     slurm_configuration =
       option_of_yojson
         (value_for_key cluster_slurm_configuration_of_yojson "slurmConfiguration")
         _list path;
     networking = value_for_key networking_of_yojson "networking" _list path;
     endpoints = option_of_yojson (value_for_key endpoints_of_yojson "endpoints") _list path;
     error_info = option_of_yojson (value_for_key error_info_list_of_yojson "errorInfo") _list path;
   }
    : cluster)

let cluster_identifier_of_yojson = string_of_yojson

let cluster_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "name" _list path;
     id = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "id" _list path;
     arn = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "arn" _list path;
     created_at =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
         "createdAt" _list path;
     modified_at =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
         "modifiedAt" _list path;
     status = value_for_key cluster_status_of_yojson "status" _list path;
   }
    : cluster_summary)

let cluster_list_of_yojson tree path = list_of_yojson cluster_summary_of_yojson tree path
let cluster_name_of_yojson = string_of_yojson

let slurm_rest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ mode = value_for_key slurm_rest_mode_of_yojson "mode" _list path } : slurm_rest_request)

let cluster_slurm_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scale_down_idle_time_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "scaleDownIdleTimeInSeconds")
         _list path;
     slurm_custom_settings =
       option_of_yojson
         (value_for_key slurm_custom_settings_of_yojson "slurmCustomSettings")
         _list path;
     slurmdbd_custom_settings =
       option_of_yojson
         (value_for_key slurmdbd_custom_settings_of_yojson "slurmdbdCustomSettings")
         _list path;
     cgroup_custom_settings =
       option_of_yojson
         (value_for_key cgroup_custom_settings_of_yojson "cgroupCustomSettings")
         _list path;
     accounting =
       option_of_yojson (value_for_key accounting_request_of_yojson "accounting") _list path;
     slurm_rest =
       option_of_yojson (value_for_key slurm_rest_request_of_yojson "slurmRest") _list path;
   }
    : cluster_slurm_configuration_request)

let compute_node_group_slurm_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scale_down_idle_time_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "scaleDownIdleTimeInSeconds")
         _list path;
     slurm_custom_settings =
       option_of_yojson
         (value_for_key slurm_custom_settings_of_yojson "slurmCustomSettings")
         _list path;
   }
    : compute_node_group_slurm_configuration)

let spot_allocation_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "lowest-price" -> LOWEST_PRICE
    | `String "capacity-optimized" -> CAPACITY_OPTIMIZED
    | `String "price-capacity-optimized" -> PRICE_CAPACITY_OPTIMIZED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SpotAllocationStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "SpotAllocationStrategy")
     : spot_allocation_strategy)
    : spot_allocation_strategy)

let spot_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allocation_strategy =
       option_of_yojson
         (value_for_key spot_allocation_strategy_of_yojson "allocationStrategy")
         _list path;
   }
    : spot_options)

let instance_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "instanceType")
         _list path;
   }
    : instance_config)

let instance_list_of_yojson tree path = list_of_yojson instance_config_of_yojson tree path

let scaling_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min_instance_count =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "minInstanceCount"
         _list path;
     max_instance_count =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxInstanceCount"
         _list path;
   }
    : scaling_configuration)

let instance_profile_arn_of_yojson = string_of_yojson

let custom_launch_template_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "id" _list path;
     version =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "version" _list path;
   }
    : custom_launch_template)

let purchase_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "ONDEMAND" -> ONDEMAND
    | `String "SPOT" -> SPOT
    | `String "CAPACITY_BLOCK" -> CAPACITY_BLOCK
    | `String "INTERRUPTIBLE_CAPACITY_RESERVATION" -> INTERRUPTIBLE_CAPACITY_RESERVATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "PurchaseOption" value)
    | _ -> raise (deserialize_wrong_type_error path "PurchaseOption")
     : purchase_option)
    : purchase_option)

let compute_node_group_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "ACTIVE" -> ACTIVE
    | `String "UPDATING" -> UPDATING
    | `String "DELETING" -> DELETING
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "DELETED" -> DELETED
    | `String "SUSPENDING" -> SUSPENDING
    | `String "SUSPENDED" -> SUSPENDED
    | `String "RESUMING" -> RESUMING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ComputeNodeGroupStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ComputeNodeGroupStatus")
     : compute_node_group_status)
    : compute_node_group_status)

let compute_node_group_name_of_yojson = string_of_yojson

let compute_node_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key compute_node_group_name_of_yojson "name" _list path;
     id = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "id" _list path;
     arn = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "arn" _list path;
     cluster_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clusterId" _list
         path;
     created_at =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
         "createdAt" _list path;
     modified_at =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
         "modifiedAt" _list path;
     status = value_for_key compute_node_group_status_of_yojson "status" _list path;
     ami_id = option_of_yojson (value_for_key ami_id_of_yojson "amiId") _list path;
     subnet_ids = value_for_key subnet_id_list_of_yojson "subnetIds" _list path;
     purchase_option =
       option_of_yojson (value_for_key purchase_option_of_yojson "purchaseOption") _list path;
     custom_launch_template =
       value_for_key custom_launch_template_of_yojson "customLaunchTemplate" _list path;
     iam_instance_profile_arn =
       value_for_key instance_profile_arn_of_yojson "iamInstanceProfileArn" _list path;
     scaling_configuration =
       value_for_key scaling_configuration_of_yojson "scalingConfiguration" _list path;
     instance_configs = value_for_key instance_list_of_yojson "instanceConfigs" _list path;
     spot_options = option_of_yojson (value_for_key spot_options_of_yojson "spotOptions") _list path;
     slurm_configuration =
       option_of_yojson
         (value_for_key compute_node_group_slurm_configuration_of_yojson "slurmConfiguration")
         _list path;
     error_info = option_of_yojson (value_for_key error_info_list_of_yojson "errorInfo") _list path;
   }
    : compute_node_group)

let compute_node_group_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compute_node_group_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "computeNodeGroupId")
         _list path;
   }
    : compute_node_group_configuration)

let compute_node_group_configuration_list_of_yojson tree path =
  list_of_yojson compute_node_group_configuration_of_yojson tree path

let compute_node_group_identifier_of_yojson = string_of_yojson

let compute_node_group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key compute_node_group_name_of_yojson "name" _list path;
     id = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "id" _list path;
     arn = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "arn" _list path;
     cluster_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clusterId" _list
         path;
     created_at =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
         "createdAt" _list path;
     modified_at =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
         "modifiedAt" _list path;
     status = value_for_key compute_node_group_status_of_yojson "status" _list path;
   }
    : compute_node_group_summary)

let compute_node_group_list_of_yojson tree path =
  list_of_yojson compute_node_group_summary_of_yojson tree path

let compute_node_group_slurm_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scale_down_idle_time_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "scaleDownIdleTimeInSeconds")
         _list path;
     slurm_custom_settings =
       option_of_yojson
         (value_for_key slurm_custom_settings_of_yojson "slurmCustomSettings")
         _list path;
   }
    : compute_node_group_slurm_configuration_request)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId" _list
         path;
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceType" _list
         path;
   }
    : conflict_exception)

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "name" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "unknownOperation" -> UNKNOWN_OPERATION
    | `String "cannotParse" -> CANNOT_PARSE
    | `String "fieldValidationFailed" -> FIELD_VALIDATION_FAILED
    | `String "other" -> OTHER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     reason = value_for_key validation_exception_reason_of_yojson "reason" _list path;
     field_list =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "fieldList")
         _list path;
   }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     retry_after_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "retryAfterSeconds")
         _list path;
   }
    : throttling_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : internal_server_exception)

let create_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "cluster") _list path }
    : create_cluster_response)

let sb_client_token_of_yojson = string_of_yojson

let networking_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_ids = option_of_yojson (value_for_key subnet_id_list_of_yojson "subnetIds") _list path;
     security_group_ids =
       option_of_yojson
         (value_for_key security_group_id_list_of_yojson "securityGroupIds")
         _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "networkType") _list path;
   }
    : networking_request)

let scheduler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key scheduler_type_of_yojson "type" _list path;
     version =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "version" _list path;
   }
    : scheduler_request)

let create_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_name = value_for_key cluster_name_of_yojson "clusterName" _list path;
     scheduler = value_for_key scheduler_request_of_yojson "scheduler" _list path;
     size = value_for_key size_of_yojson "size" _list path;
     networking = value_for_key networking_request_of_yojson "networking" _list path;
     slurm_configuration =
       option_of_yojson
         (value_for_key cluster_slurm_configuration_request_of_yojson "slurmConfiguration")
         _list path;
     client_token =
       option_of_yojson (value_for_key sb_client_token_of_yojson "clientToken") _list path;
     tags = option_of_yojson (value_for_key request_tag_map_of_yojson "tags") _list path;
   }
    : create_cluster_request)

let create_compute_node_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compute_node_group =
       option_of_yojson (value_for_key compute_node_group_of_yojson "computeNodeGroup") _list path;
   }
    : create_compute_node_group_response)

let scaling_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min_instance_count =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "minInstanceCount"
         _list path;
     max_instance_count =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxInstanceCount"
         _list path;
   }
    : scaling_configuration_request)

let string_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let create_compute_node_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_identifier = value_for_key cluster_identifier_of_yojson "clusterIdentifier" _list path;
     compute_node_group_name =
       value_for_key compute_node_group_name_of_yojson "computeNodeGroupName" _list path;
     ami_id = option_of_yojson (value_for_key ami_id_of_yojson "amiId") _list path;
     subnet_ids = value_for_key string_list_of_yojson "subnetIds" _list path;
     purchase_option =
       option_of_yojson (value_for_key purchase_option_of_yojson "purchaseOption") _list path;
     custom_launch_template =
       value_for_key custom_launch_template_of_yojson "customLaunchTemplate" _list path;
     iam_instance_profile_arn =
       value_for_key instance_profile_arn_of_yojson "iamInstanceProfileArn" _list path;
     scaling_configuration =
       value_for_key scaling_configuration_request_of_yojson "scalingConfiguration" _list path;
     instance_configs = value_for_key instance_list_of_yojson "instanceConfigs" _list path;
     spot_options = option_of_yojson (value_for_key spot_options_of_yojson "spotOptions") _list path;
     slurm_configuration =
       option_of_yojson
         (value_for_key compute_node_group_slurm_configuration_request_of_yojson
            "slurmConfiguration")
         _list path;
     client_token =
       option_of_yojson (value_for_key sb_client_token_of_yojson "clientToken") _list path;
     tags = option_of_yojson (value_for_key request_tag_map_of_yojson "tags") _list path;
   }
    : create_compute_node_group_request)

let queue_slurm_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     slurm_custom_settings =
       option_of_yojson
         (value_for_key slurm_custom_settings_of_yojson "slurmCustomSettings")
         _list path;
   }
    : queue_slurm_configuration)

let queue_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "ACTIVE" -> ACTIVE
    | `String "UPDATING" -> UPDATING
    | `String "DELETING" -> DELETING
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "SUSPENDING" -> SUSPENDING
    | `String "SUSPENDED" -> SUSPENDED
    | `String "RESUMING" -> RESUMING
    | `String value -> raise (deserialize_unknown_enum_value_error path "QueueStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "QueueStatus")
     : queue_status)
    : queue_status)

let queue_name_of_yojson = string_of_yojson

let queue_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key queue_name_of_yojson "name" _list path;
     id = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "id" _list path;
     arn = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "arn" _list path;
     cluster_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clusterId" _list
         path;
     created_at =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
         "createdAt" _list path;
     modified_at =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
         "modifiedAt" _list path;
     status = value_for_key queue_status_of_yojson "status" _list path;
     compute_node_group_configurations =
       value_for_key compute_node_group_configuration_list_of_yojson
         "computeNodeGroupConfigurations" _list path;
     slurm_configuration =
       option_of_yojson
         (value_for_key queue_slurm_configuration_of_yojson "slurmConfiguration")
         _list path;
     error_info = option_of_yojson (value_for_key error_info_list_of_yojson "errorInfo") _list path;
   }
    : queue)

let create_queue_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ queue = option_of_yojson (value_for_key queue_of_yojson "queue") _list path }
    : create_queue_response)

let queue_slurm_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     slurm_custom_settings =
       option_of_yojson
         (value_for_key slurm_custom_settings_of_yojson "slurmCustomSettings")
         _list path;
   }
    : queue_slurm_configuration_request)

let create_queue_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_identifier = value_for_key cluster_identifier_of_yojson "clusterIdentifier" _list path;
     queue_name = value_for_key queue_name_of_yojson "queueName" _list path;
     compute_node_group_configurations =
       option_of_yojson
         (value_for_key compute_node_group_configuration_list_of_yojson
            "computeNodeGroupConfigurations")
         _list path;
     slurm_configuration =
       option_of_yojson
         (value_for_key queue_slurm_configuration_request_of_yojson "slurmConfiguration")
         _list path;
     client_token =
       option_of_yojson (value_for_key sb_client_token_of_yojson "clientToken") _list path;
     tags = option_of_yojson (value_for_key request_tag_map_of_yojson "tags") _list path;
   }
    : create_queue_request)

let delete_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_identifier = value_for_key cluster_identifier_of_yojson "clusterIdentifier" _list path;
     client_token =
       option_of_yojson (value_for_key sb_client_token_of_yojson "clientToken") _list path;
   }
    : delete_cluster_request)

let delete_compute_node_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_compute_node_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_identifier = value_for_key cluster_identifier_of_yojson "clusterIdentifier" _list path;
     compute_node_group_identifier =
       value_for_key compute_node_group_identifier_of_yojson "computeNodeGroupIdentifier" _list path;
     client_token =
       option_of_yojson (value_for_key sb_client_token_of_yojson "clientToken") _list path;
   }
    : delete_compute_node_group_request)

let delete_queue_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let queue_identifier_of_yojson = string_of_yojson

let delete_queue_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_identifier = value_for_key cluster_identifier_of_yojson "clusterIdentifier" _list path;
     queue_identifier = value_for_key queue_identifier_of_yojson "queueIdentifier" _list path;
     client_token =
       option_of_yojson (value_for_key sb_client_token_of_yojson "clientToken") _list path;
   }
    : delete_queue_request)

let get_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "cluster") _list path }
    : get_cluster_response)

let get_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_identifier = value_for_key cluster_identifier_of_yojson "clusterIdentifier" _list path;
   }
    : get_cluster_request)

let get_compute_node_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compute_node_group =
       option_of_yojson (value_for_key compute_node_group_of_yojson "computeNodeGroup") _list path;
   }
    : get_compute_node_group_response)

let get_compute_node_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_identifier = value_for_key cluster_identifier_of_yojson "clusterIdentifier" _list path;
     compute_node_group_identifier =
       value_for_key compute_node_group_identifier_of_yojson "computeNodeGroupIdentifier" _list path;
   }
    : get_compute_node_group_request)

let get_queue_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ queue = option_of_yojson (value_for_key queue_of_yojson "queue") _list path }
    : get_queue_response)

let get_queue_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_identifier = value_for_key cluster_identifier_of_yojson "clusterIdentifier" _list path;
     queue_identifier = value_for_key queue_identifier_of_yojson "queueIdentifier" _list path;
   }
    : get_queue_request)

let list_clusters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     clusters = value_for_key cluster_list_of_yojson "clusters" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_clusters_response)

let max_results_of_yojson = int_of_yojson

let list_clusters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_clusters_request)

let list_compute_node_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compute_node_groups =
       value_for_key compute_node_group_list_of_yojson "computeNodeGroups" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_compute_node_groups_response)

let list_compute_node_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_identifier = value_for_key cluster_identifier_of_yojson "clusterIdentifier" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_compute_node_groups_request)

let queue_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key queue_name_of_yojson "name" _list path;
     id = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "id" _list path;
     arn = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "arn" _list path;
     cluster_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clusterId" _list
         path;
     created_at =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
         "createdAt" _list path;
     modified_at =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
         "modifiedAt" _list path;
     status = value_for_key queue_status_of_yojson "status" _list path;
   }
    : queue_summary)

let queue_list_of_yojson tree path = list_of_yojson queue_summary_of_yojson tree path

let list_queues_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     queues = value_for_key queue_list_of_yojson "queues" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_queues_response)

let list_queues_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_identifier = value_for_key cluster_identifier_of_yojson "clusterIdentifier" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_queues_request)

let shared_secret_of_yojson = string_of_yojson

let register_compute_node_group_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     node_i_d =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nodeID" _list path;
     shared_secret = value_for_key shared_secret_of_yojson "sharedSecret" _list path;
     endpoints = value_for_key endpoints_of_yojson "endpoints" _list path;
   }
    : register_compute_node_group_instance_response)

let register_compute_node_group_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_identifier = value_for_key cluster_identifier_of_yojson "clusterIdentifier" _list path;
     bootstrap_id = value_for_key bootstrap_id_of_yojson "bootstrapId" _list path;
   }
    : register_compute_node_group_instance_request)

let update_accounting_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_purge_time_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "defaultPurgeTimeInDays")
         _list path;
     mode = option_of_yojson (value_for_key accounting_mode_of_yojson "mode") _list path;
   }
    : update_accounting_request)

let update_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "cluster") _list path }
    : update_cluster_response)

let update_scheduler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "version" _list path;
   }
    : update_scheduler_request)

let update_slurm_rest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ mode = option_of_yojson (value_for_key slurm_rest_mode_of_yojson "mode") _list path }
    : update_slurm_rest_request)

let update_cluster_slurm_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scale_down_idle_time_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "scaleDownIdleTimeInSeconds")
         _list path;
     slurm_custom_settings =
       option_of_yojson
         (value_for_key slurm_custom_settings_of_yojson "slurmCustomSettings")
         _list path;
     slurmdbd_custom_settings =
       option_of_yojson
         (value_for_key slurmdbd_custom_settings_of_yojson "slurmdbdCustomSettings")
         _list path;
     cgroup_custom_settings =
       option_of_yojson
         (value_for_key cgroup_custom_settings_of_yojson "cgroupCustomSettings")
         _list path;
     accounting =
       option_of_yojson (value_for_key update_accounting_request_of_yojson "accounting") _list path;
     slurm_rest =
       option_of_yojson (value_for_key update_slurm_rest_request_of_yojson "slurmRest") _list path;
   }
    : update_cluster_slurm_configuration_request)

let update_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_identifier = value_for_key cluster_identifier_of_yojson "clusterIdentifier" _list path;
     client_token =
       option_of_yojson (value_for_key sb_client_token_of_yojson "clientToken") _list path;
     slurm_configuration =
       option_of_yojson
         (value_for_key update_cluster_slurm_configuration_request_of_yojson "slurmConfiguration")
         _list path;
     scheduler =
       option_of_yojson (value_for_key update_scheduler_request_of_yojson "scheduler") _list path;
   }
    : update_cluster_request)

let update_compute_node_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compute_node_group =
       option_of_yojson (value_for_key compute_node_group_of_yojson "computeNodeGroup") _list path;
   }
    : update_compute_node_group_response)

let update_compute_node_group_slurm_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scale_down_idle_time_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "scaleDownIdleTimeInSeconds")
         _list path;
     slurm_custom_settings =
       option_of_yojson
         (value_for_key slurm_custom_settings_of_yojson "slurmCustomSettings")
         _list path;
   }
    : update_compute_node_group_slurm_configuration_request)

let update_compute_node_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_identifier = value_for_key cluster_identifier_of_yojson "clusterIdentifier" _list path;
     compute_node_group_identifier =
       value_for_key compute_node_group_identifier_of_yojson "computeNodeGroupIdentifier" _list path;
     ami_id = option_of_yojson (value_for_key ami_id_of_yojson "amiId") _list path;
     subnet_ids = option_of_yojson (value_for_key string_list_of_yojson "subnetIds") _list path;
     custom_launch_template =
       option_of_yojson
         (value_for_key custom_launch_template_of_yojson "customLaunchTemplate")
         _list path;
     purchase_option =
       option_of_yojson (value_for_key purchase_option_of_yojson "purchaseOption") _list path;
     spot_options = option_of_yojson (value_for_key spot_options_of_yojson "spotOptions") _list path;
     scaling_configuration =
       option_of_yojson
         (value_for_key scaling_configuration_request_of_yojson "scalingConfiguration")
         _list path;
     iam_instance_profile_arn =
       option_of_yojson
         (value_for_key instance_profile_arn_of_yojson "iamInstanceProfileArn")
         _list path;
     slurm_configuration =
       option_of_yojson
         (value_for_key update_compute_node_group_slurm_configuration_request_of_yojson
            "slurmConfiguration")
         _list path;
     client_token =
       option_of_yojson (value_for_key sb_client_token_of_yojson "clientToken") _list path;
   }
    : update_compute_node_group_request)

let update_queue_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ queue = option_of_yojson (value_for_key queue_of_yojson "queue") _list path }
    : update_queue_response)

let update_queue_slurm_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     slurm_custom_settings =
       option_of_yojson
         (value_for_key slurm_custom_settings_of_yojson "slurmCustomSettings")
         _list path;
   }
    : update_queue_slurm_configuration_request)

let update_queue_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_identifier = value_for_key cluster_identifier_of_yojson "clusterIdentifier" _list path;
     queue_identifier = value_for_key queue_identifier_of_yojson "queueIdentifier" _list path;
     compute_node_group_configurations =
       option_of_yojson
         (value_for_key compute_node_group_configuration_list_of_yojson
            "computeNodeGroupConfigurations")
         _list path;
     slurm_configuration =
       option_of_yojson
         (value_for_key update_queue_slurm_configuration_request_of_yojson "slurmConfiguration")
         _list path;
     client_token =
       option_of_yojson (value_for_key sb_client_token_of_yojson "clientToken") _list path;
   }
    : update_queue_request)
