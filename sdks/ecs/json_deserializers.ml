open Smaws_Lib.Json.DeserializeHelpers
open Types

let boxed_integer_of_yojson = int_of_yojson

let accelerator_count_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min = option_of_yojson (value_for_key boxed_integer_of_yojson "min") _list path;
     max = option_of_yojson (value_for_key boxed_integer_of_yojson "max") _list path;
   }
    : accelerator_count_request)

let accelerator_manufacturer_of_yojson (tree : t) path =
  ((match tree with
    | `String "amazon-web-services" -> AMAZON_WEB_SERVICES
    | `String "amd" -> AMD
    | `String "nvidia" -> NVIDIA
    | `String "xilinx" -> XILINX
    | `String "habana" -> HABANA
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AcceleratorManufacturer" value)
    | _ -> raise (deserialize_wrong_type_error path "AcceleratorManufacturer")
     : accelerator_manufacturer)
    : accelerator_manufacturer)

let accelerator_manufacturer_set_of_yojson tree path =
  list_of_yojson accelerator_manufacturer_of_yojson tree path

let accelerator_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "a100" -> A100
    | `String "inferentia" -> INFERENTIA
    | `String "k520" -> K520
    | `String "k80" -> K80
    | `String "m60" -> M60
    | `String "radeon-pro-v520" -> RADEON_PRO_V520
    | `String "t4" -> T4
    | `String "vu9p" -> VU9P
    | `String "v100" -> V100
    | `String "a10g" -> A10G
    | `String "h100" -> H100
    | `String "t4g" -> T4G
    | `String value -> raise (deserialize_unknown_enum_value_error path "AcceleratorName" value)
    | _ -> raise (deserialize_wrong_type_error path "AcceleratorName")
     : accelerator_name)
    : accelerator_name)

let accelerator_name_set_of_yojson tree path = list_of_yojson accelerator_name_of_yojson tree path

let accelerator_total_memory_mi_b_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min = option_of_yojson (value_for_key boxed_integer_of_yojson "min") _list path;
     max = option_of_yojson (value_for_key boxed_integer_of_yojson "max") _list path;
   }
    : accelerator_total_memory_mi_b_request)

let accelerator_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "gpu" -> GPU
    | `String "fpga" -> FPGA
    | `String "inference" -> INFERENCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AcceleratorType" value)
    | _ -> raise (deserialize_wrong_type_error path "AcceleratorType")
     : accelerator_type)
    : accelerator_type)

let accelerator_type_set_of_yojson tree path = list_of_yojson accelerator_type_of_yojson tree path
let string__of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : access_denied_exception)

let access_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PUBLIC" -> PUBLIC
    | `String "PRIVATE" -> PRIVATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessType" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessType")
     : access_type)
    : access_type)

let advanced_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alternate_target_group_arn =
       option_of_yojson (value_for_key string__of_yojson "alternateTargetGroupArn") _list path;
     production_listener_rule =
       option_of_yojson (value_for_key string__of_yojson "productionListenerRule") _list path;
     test_listener_rule =
       option_of_yojson (value_for_key string__of_yojson "testListenerRule") _list path;
     role_arn = option_of_yojson (value_for_key string__of_yojson "roleArn") _list path;
   }
    : advanced_configuration)

let agent_update_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "STAGING" -> STAGING
    | `String "STAGED" -> STAGED
    | `String "UPDATING" -> UPDATING
    | `String "UPDATED" -> UPDATED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AgentUpdateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AgentUpdateStatus")
     : agent_update_status)
    : agent_update_status)

let allowed_instance_type_of_yojson = string_of_yojson

let allowed_instance_type_set_of_yojson tree path =
  list_of_yojson allowed_instance_type_of_yojson tree path

let server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : server_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : resource_not_found_exception)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_parameter_exception)

let cluster_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : cluster_not_found_exception)

let client_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : client_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key string__of_yojson "resourceArn" _list path;
     tag_keys = value_for_key tag_keys_of_yojson "tagKeys" _list path;
   }
    : untag_resource_request)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : limit_exceeded_exception)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key tag_key_of_yojson "key") _list path;
     value = option_of_yojson (value_for_key tag_value_of_yojson "value") _list path;
   }
    : tag)

let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key string__of_yojson "resourceArn" _list path;
     tags = value_for_key tags_of_yojson "tags" _list path;
   }
    : tag_resource_request)

let setting_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "user" -> USER
    | `String "aws_managed" -> AWS_MANAGED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SettingType" value)
    | _ -> raise (deserialize_wrong_type_error path "SettingType")
     : setting_type)
    : setting_type)

let setting_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "serviceLongArnFormat" -> SERVICE_LONG_ARN_FORMAT
    | `String "taskLongArnFormat" -> TASK_LONG_ARN_FORMAT
    | `String "containerInstanceLongArnFormat" -> CONTAINER_INSTANCE_LONG_ARN_FORMAT
    | `String "awsvpcTrunking" -> AWSVPC_TRUNKING
    | `String "containerInsights" -> CONTAINER_INSIGHTS
    | `String "fargateFIPSMode" -> FARGATE_FIPS_MODE
    | `String "tagResourceAuthorization" -> TAG_RESOURCE_AUTHORIZATION
    | `String "fargateTaskRetirementWaitPeriod" -> FARGATE_TASK_RETIREMENT_WAIT_PERIOD
    | `String "guardDutyActivate" -> GUARD_DUTY_ACTIVATE
    | `String "defaultLogDriverMode" -> DEFAULT_LOG_DRIVER_MODE
    | `String "fargateEventWindows" -> FARGATE_EVENT_WINDOWS
    | `String value -> raise (deserialize_unknown_enum_value_error path "SettingName" value)
    | _ -> raise (deserialize_wrong_type_error path "SettingName")
     : setting_name)
    : setting_name)

let setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key setting_name_of_yojson "name") _list path;
     value = option_of_yojson (value_for_key string__of_yojson "value") _list path;
     principal_arn = option_of_yojson (value_for_key string__of_yojson "principalArn") _list path;
     type_ = option_of_yojson (value_for_key setting_type_of_yojson "type") _list path;
   }
    : setting)

let put_account_setting_default_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ setting = option_of_yojson (value_for_key setting_of_yojson "setting") _list path }
    : put_account_setting_default_response)

let put_account_setting_default_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key setting_name_of_yojson "name" _list path;
     value = value_for_key string__of_yojson "value" _list path;
   }
    : put_account_setting_default_request)

let put_account_setting_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ setting = option_of_yojson (value_for_key setting_of_yojson "setting") _list path }
    : put_account_setting_response)

let put_account_setting_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key setting_name_of_yojson "name" _list path;
     value = value_for_key string__of_yojson "value" _list path;
     principal_arn = option_of_yojson (value_for_key string__of_yojson "principalArn") _list path;
   }
    : put_account_setting_request)

let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let list_task_definition_families_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     families = option_of_yojson (value_for_key string_list_of_yojson "families") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_task_definition_families_response)

let task_definition_family_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "INACTIVE" -> INACTIVE
    | `String "ALL" -> ALL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TaskDefinitionFamilyStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskDefinitionFamilyStatus")
     : task_definition_family_status)
    : task_definition_family_status)

let list_task_definition_families_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     family_prefix = option_of_yojson (value_for_key string__of_yojson "familyPrefix") _list path;
     status =
       option_of_yojson (value_for_key task_definition_family_status_of_yojson "status") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key boxed_integer_of_yojson "maxResults") _list path;
   }
    : list_task_definition_families_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key string__of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let namespace_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : namespace_not_found_exception)

let list_services_by_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_arns = option_of_yojson (value_for_key string_list_of_yojson "serviceArns") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_services_by_namespace_response)

let list_services_by_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace = value_for_key string__of_yojson "namespace" _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key boxed_integer_of_yojson "maxResults") _list path;
   }
    : list_services_by_namespace_request)

let settings_of_yojson tree path = list_of_yojson setting_of_yojson tree path

let list_account_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     settings = option_of_yojson (value_for_key settings_of_yojson "settings") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_account_settings_response)

let integer_of_yojson = int_of_yojson
let boolean__of_yojson = bool_of_yojson

let list_account_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key setting_name_of_yojson "name") _list path;
     value = option_of_yojson (value_for_key string__of_yojson "value") _list path;
     principal_arn = option_of_yojson (value_for_key string__of_yojson "principalArn") _list path;
     effective_settings =
       option_of_yojson (value_for_key boolean__of_yojson "effectiveSettings") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key integer_of_yojson "maxResults") _list path;
   }
    : list_account_settings_request)

let discover_poll_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint = option_of_yojson (value_for_key string__of_yojson "endpoint") _list path;
     telemetry_endpoint =
       option_of_yojson (value_for_key string__of_yojson "telemetryEndpoint") _list path;
     service_connect_endpoint =
       option_of_yojson (value_for_key string__of_yojson "serviceConnectEndpoint") _list path;
   }
    : discover_poll_endpoint_response)

let discover_poll_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_instance =
       option_of_yojson (value_for_key string__of_yojson "containerInstance") _list path;
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
   }
    : discover_poll_endpoint_request)

let boxed_boolean_of_yojson = bool_of_yojson

let ephemeral_storage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ size_in_gi_b = value_for_key integer_of_yojson "sizeInGiB" _list path } : ephemeral_storage)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let key_value_pair_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     value = option_of_yojson (value_for_key string__of_yojson "value") _list path;
   }
    : key_value_pair)

let proxy_configuration_properties_of_yojson tree path =
  list_of_yojson key_value_pair_of_yojson tree path

let proxy_configuration_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "APPMESH" -> APPMESH
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProxyConfigurationType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProxyConfigurationType")
     : proxy_configuration_type)
    : proxy_configuration_type)

let proxy_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key proxy_configuration_type_of_yojson "type") _list path;
     container_name = value_for_key string__of_yojson "containerName" _list path;
     properties =
       option_of_yojson
         (value_for_key proxy_configuration_properties_of_yojson "properties")
         _list path;
   }
    : proxy_configuration)

let ipc_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "host" -> HOST
    | `String "task" -> TASK
    | `String "none" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "IpcMode" value)
    | _ -> raise (deserialize_wrong_type_error path "IpcMode")
     : ipc_mode)
    : ipc_mode)

let pid_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "host" -> HOST
    | `String "task" -> TASK
    | `String value -> raise (deserialize_unknown_enum_value_error path "PidMode" value)
    | _ -> raise (deserialize_wrong_type_error path "PidMode")
     : pid_mode)
    : pid_mode)

let inference_accelerator_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_name = value_for_key string__of_yojson "deviceName" _list path;
     device_type = value_for_key string__of_yojson "deviceType" _list path;
   }
    : inference_accelerator)

let inference_accelerators_of_yojson tree path =
  list_of_yojson inference_accelerator_of_yojson tree path

let compatibility_of_yojson (tree : t) path =
  ((match tree with
    | `String "EC2" -> EC2
    | `String "FARGATE" -> FARGATE
    | `String "EXTERNAL" -> EXTERNAL
    | `String "MANAGED_INSTANCES" -> MANAGED_INSTANCES
    | `String value -> raise (deserialize_unknown_enum_value_error path "Compatibility" value)
    | _ -> raise (deserialize_wrong_type_error path "Compatibility")
     : compatibility)
    : compatibility)

let compatibility_list_of_yojson tree path = list_of_yojson compatibility_of_yojson tree path

let os_family_of_yojson (tree : t) path =
  ((match tree with
    | `String "WINDOWS_SERVER_2019_FULL" -> WINDOWS_SERVER_2019_FULL
    | `String "WINDOWS_SERVER_2019_CORE" -> WINDOWS_SERVER_2019_CORE
    | `String "WINDOWS_SERVER_2016_FULL" -> WINDOWS_SERVER_2016_FULL
    | `String "WINDOWS_SERVER_2004_CORE" -> WINDOWS_SERVER_2004_CORE
    | `String "WINDOWS_SERVER_2022_CORE" -> WINDOWS_SERVER_2022_CORE
    | `String "WINDOWS_SERVER_2022_FULL" -> WINDOWS_SERVER_2022_FULL
    | `String "WINDOWS_SERVER_2025_CORE" -> WINDOWS_SERVER_2025_CORE
    | `String "WINDOWS_SERVER_2025_FULL" -> WINDOWS_SERVER_2025_FULL
    | `String "WINDOWS_SERVER_20H2_CORE" -> WINDOWS_SERVER_20H2_CORE
    | `String "LINUX" -> LINUX
    | `String value -> raise (deserialize_unknown_enum_value_error path "OSFamily" value)
    | _ -> raise (deserialize_wrong_type_error path "OSFamily")
     : os_family)
    : os_family)

let cpu_architecture_of_yojson (tree : t) path =
  ((match tree with
    | `String "X86_64" -> X86_64
    | `String "ARM64" -> ARM64
    | `String value -> raise (deserialize_unknown_enum_value_error path "CPUArchitecture" value)
    | _ -> raise (deserialize_wrong_type_error path "CPUArchitecture")
     : cpu_architecture)
    : cpu_architecture)

let runtime_platform_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cpu_architecture =
       option_of_yojson (value_for_key cpu_architecture_of_yojson "cpuArchitecture") _list path;
     operating_system_family =
       option_of_yojson (value_for_key os_family_of_yojson "operatingSystemFamily") _list path;
   }
    : runtime_platform)

let task_definition_placement_constraint_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "memberOf" -> MEMBER_OF
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "TaskDefinitionPlacementConstraintType" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskDefinitionPlacementConstraintType")
     : task_definition_placement_constraint_type)
    : task_definition_placement_constraint_type)

let task_definition_placement_constraint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       option_of_yojson
         (value_for_key task_definition_placement_constraint_type_of_yojson "type")
         _list path;
     expression = option_of_yojson (value_for_key string__of_yojson "expression") _list path;
   }
    : task_definition_placement_constraint)

let task_definition_placement_constraints_of_yojson tree path =
  list_of_yojson task_definition_placement_constraint_of_yojson tree path

let target_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "container-instance" -> CONTAINER_INSTANCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetType" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetType")
     : target_type)
    : target_type)

let attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key string__of_yojson "name" _list path;
     value = option_of_yojson (value_for_key string__of_yojson "value") _list path;
     target_type = option_of_yojson (value_for_key target_type_of_yojson "targetType") _list path;
     target_id = option_of_yojson (value_for_key string__of_yojson "targetId") _list path;
   }
    : attribute)

let requires_attributes_of_yojson tree path = list_of_yojson attribute_of_yojson tree path

let task_definition_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "INACTIVE" -> INACTIVE
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TaskDefinitionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskDefinitionStatus")
     : task_definition_status)
    : task_definition_status)

let f_sx_windows_file_server_authorization_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     credentials_parameter = value_for_key string__of_yojson "credentialsParameter" _list path;
     domain = value_for_key string__of_yojson "domain" _list path;
   }
    : f_sx_windows_file_server_authorization_config)

let f_sx_windows_file_server_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_id = value_for_key string__of_yojson "fileSystemId" _list path;
     root_directory = value_for_key string__of_yojson "rootDirectory" _list path;
     authorization_config =
       value_for_key f_sx_windows_file_server_authorization_config_of_yojson "authorizationConfig"
         _list path;
   }
    : f_sx_windows_file_server_volume_configuration)

let s3_files_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_arn = value_for_key string__of_yojson "fileSystemArn" _list path;
     root_directory = option_of_yojson (value_for_key string__of_yojson "rootDirectory") _list path;
     transit_encryption_port =
       option_of_yojson (value_for_key boxed_integer_of_yojson "transitEncryptionPort") _list path;
     access_point_arn =
       option_of_yojson (value_for_key string__of_yojson "accessPointArn") _list path;
   }
    : s3_files_volume_configuration)

let efs_authorization_config_ia_m_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EFSAuthorizationConfigIAM" value)
    | _ -> raise (deserialize_wrong_type_error path "EFSAuthorizationConfigIAM")
     : efs_authorization_config_ia_m)
    : efs_authorization_config_ia_m)

let efs_authorization_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_point_id = option_of_yojson (value_for_key string__of_yojson "accessPointId") _list path;
     iam = option_of_yojson (value_for_key efs_authorization_config_ia_m_of_yojson "iam") _list path;
   }
    : efs_authorization_config)

let efs_transit_encryption_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EFSTransitEncryption" value)
    | _ -> raise (deserialize_wrong_type_error path "EFSTransitEncryption")
     : efs_transit_encryption)
    : efs_transit_encryption)

let efs_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_id = value_for_key string__of_yojson "fileSystemId" _list path;
     root_directory = option_of_yojson (value_for_key string__of_yojson "rootDirectory") _list path;
     transit_encryption =
       option_of_yojson
         (value_for_key efs_transit_encryption_of_yojson "transitEncryption")
         _list path;
     transit_encryption_port =
       option_of_yojson (value_for_key boxed_integer_of_yojson "transitEncryptionPort") _list path;
     authorization_config =
       option_of_yojson
         (value_for_key efs_authorization_config_of_yojson "authorizationConfig")
         _list path;
   }
    : efs_volume_configuration)

let string_map_of_yojson tree path = map_of_yojson string__of_yojson string__of_yojson tree path

let scope_of_yojson (tree : t) path =
  ((match tree with
    | `String "task" -> TASK
    | `String "shared" -> SHARED
    | `String value -> raise (deserialize_unknown_enum_value_error path "Scope" value)
    | _ -> raise (deserialize_wrong_type_error path "Scope")
     : scope)
    : scope)

let docker_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scope = option_of_yojson (value_for_key scope_of_yojson "scope") _list path;
     autoprovision =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "autoprovision") _list path;
     driver = option_of_yojson (value_for_key string__of_yojson "driver") _list path;
     driver_opts = option_of_yojson (value_for_key string_map_of_yojson "driverOpts") _list path;
     labels = option_of_yojson (value_for_key string_map_of_yojson "labels") _list path;
   }
    : docker_volume_configuration)

let host_volume_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ source_path = option_of_yojson (value_for_key string__of_yojson "sourcePath") _list path }
    : host_volume_properties)

let volume_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     host = option_of_yojson (value_for_key host_volume_properties_of_yojson "host") _list path;
     docker_volume_configuration =
       option_of_yojson
         (value_for_key docker_volume_configuration_of_yojson "dockerVolumeConfiguration")
         _list path;
     efs_volume_configuration =
       option_of_yojson
         (value_for_key efs_volume_configuration_of_yojson "efsVolumeConfiguration")
         _list path;
     s3files_volume_configuration =
       option_of_yojson
         (value_for_key s3_files_volume_configuration_of_yojson "s3filesVolumeConfiguration")
         _list path;
     fsx_windows_file_server_volume_configuration =
       option_of_yojson
         (value_for_key f_sx_windows_file_server_volume_configuration_of_yojson
            "fsxWindowsFileServerVolumeConfiguration")
         _list path;
     configured_at_launch =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "configuredAtLaunch") _list path;
   }
    : volume)

let volume_list_of_yojson tree path = list_of_yojson volume_of_yojson tree path

let network_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "bridge" -> BRIDGE
    | `String "host" -> HOST
    | `String "awsvpc" -> AWSVPC
    | `String "none" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "NetworkMode" value)
    | _ -> raise (deserialize_wrong_type_error path "NetworkMode")
     : network_mode)
    : network_mode)

let firelens_configuration_options_map_of_yojson tree path =
  map_of_yojson string__of_yojson string__of_yojson tree path

let firelens_configuration_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "fluentd" -> FLUENTD
    | `String "fluentbit" -> FLUENTBIT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FirelensConfigurationType" value)
    | _ -> raise (deserialize_wrong_type_error path "FirelensConfigurationType")
     : firelens_configuration_type)
    : firelens_configuration_type)

let firelens_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key firelens_configuration_type_of_yojson "type" _list path;
     options =
       option_of_yojson
         (value_for_key firelens_configuration_options_map_of_yojson "options")
         _list path;
   }
    : firelens_configuration)

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GPU" -> GPU
    | `String "InferenceAccelerator" -> INFERENCE_ACCELERATOR
    | `String "NeuronDevice" -> NEURON_DEVICE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let resource_requirement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key string__of_yojson "value" _list path;
     type_ = value_for_key resource_type_of_yojson "type" _list path;
   }
    : resource_requirement)

let resource_requirements_of_yojson tree path =
  list_of_yojson resource_requirement_of_yojson tree path

let system_control_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace = option_of_yojson (value_for_key string__of_yojson "namespace") _list path;
     value = option_of_yojson (value_for_key string__of_yojson "value") _list path;
   }
    : system_control)

let system_controls_of_yojson tree path = list_of_yojson system_control_of_yojson tree path

let health_check_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     command = value_for_key string_list_of_yojson "command" _list path;
     interval = option_of_yojson (value_for_key boxed_integer_of_yojson "interval") _list path;
     timeout = option_of_yojson (value_for_key boxed_integer_of_yojson "timeout") _list path;
     retries = option_of_yojson (value_for_key boxed_integer_of_yojson "retries") _list path;
     start_period =
       option_of_yojson (value_for_key boxed_integer_of_yojson "startPeriod") _list path;
   }
    : health_check)

let secret_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key string__of_yojson "name" _list path;
     value_from = value_for_key string__of_yojson "valueFrom" _list path;
   }
    : secret)

let secret_list_of_yojson tree path = list_of_yojson secret_of_yojson tree path

let log_configuration_options_map_of_yojson tree path =
  map_of_yojson string__of_yojson string__of_yojson tree path

let log_driver_of_yojson (tree : t) path =
  ((match tree with
    | `String "json-file" -> JSON_FILE
    | `String "syslog" -> SYSLOG
    | `String "journald" -> JOURNALD
    | `String "gelf" -> GELF
    | `String "fluentd" -> FLUENTD
    | `String "awslogs" -> AWSLOGS
    | `String "splunk" -> SPLUNK
    | `String "awsfirelens" -> AWSFIRELENS
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogDriver" value)
    | _ -> raise (deserialize_wrong_type_error path "LogDriver")
     : log_driver)
    : log_driver)

let log_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_driver = value_for_key log_driver_of_yojson "logDriver" _list path;
     options =
       option_of_yojson (value_for_key log_configuration_options_map_of_yojson "options") _list path;
     secret_options =
       option_of_yojson (value_for_key secret_list_of_yojson "secretOptions") _list path;
   }
    : log_configuration)

let ulimit_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "core" -> CORE
    | `String "cpu" -> CPU
    | `String "data" -> DATA
    | `String "fsize" -> FSIZE
    | `String "locks" -> LOCKS
    | `String "memlock" -> MEMLOCK
    | `String "msgqueue" -> MSGQUEUE
    | `String "nice" -> NICE
    | `String "nofile" -> NOFILE
    | `String "nproc" -> NPROC
    | `String "rss" -> RSS
    | `String "rtprio" -> RTPRIO
    | `String "rttime" -> RTTIME
    | `String "sigpending" -> SIGPENDING
    | `String "stack" -> STACK
    | `String value -> raise (deserialize_unknown_enum_value_error path "UlimitName" value)
    | _ -> raise (deserialize_wrong_type_error path "UlimitName")
     : ulimit_name)
    : ulimit_name)

let ulimit_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key ulimit_name_of_yojson "name" _list path;
     soft_limit = value_for_key integer_of_yojson "softLimit" _list path;
     hard_limit = value_for_key integer_of_yojson "hardLimit" _list path;
   }
    : ulimit)

let ulimit_list_of_yojson tree path = list_of_yojson ulimit_of_yojson tree path

let docker_labels_map_of_yojson tree path =
  map_of_yojson string__of_yojson string__of_yojson tree path

let host_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hostname = value_for_key string__of_yojson "hostname" _list path;
     ip_address = value_for_key string__of_yojson "ipAddress" _list path;
   }
    : host_entry)

let host_entry_list_of_yojson tree path = list_of_yojson host_entry_of_yojson tree path

let version_consistency_of_yojson (tree : t) path =
  ((match tree with
    | `String "enabled" -> ENABLED
    | `String "disabled" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "VersionConsistency" value)
    | _ -> raise (deserialize_wrong_type_error path "VersionConsistency")
     : version_consistency)
    : version_consistency)

let container_condition_of_yojson (tree : t) path =
  ((match tree with
    | `String "START" -> START
    | `String "COMPLETE" -> COMPLETE
    | `String "SUCCESS" -> SUCCESS
    | `String "HEALTHY" -> HEALTHY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContainerCondition" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerCondition")
     : container_condition)
    : container_condition)

let container_dependency_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name = value_for_key string__of_yojson "containerName" _list path;
     condition = value_for_key container_condition_of_yojson "condition" _list path;
   }
    : container_dependency)

let container_dependencies_of_yojson tree path =
  list_of_yojson container_dependency_of_yojson tree path

let tmpfs_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_path = value_for_key string__of_yojson "containerPath" _list path;
     size = value_for_key integer_of_yojson "size" _list path;
     mount_options =
       option_of_yojson (value_for_key string_list_of_yojson "mountOptions") _list path;
   }
    : tmpfs)

let tmpfs_list_of_yojson tree path = list_of_yojson tmpfs_of_yojson tree path

let device_cgroup_permission_of_yojson (tree : t) path =
  ((match tree with
    | `String "read" -> READ
    | `String "write" -> WRITE
    | `String "mknod" -> MKNOD
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeviceCgroupPermission" value)
    | _ -> raise (deserialize_wrong_type_error path "DeviceCgroupPermission")
     : device_cgroup_permission)
    : device_cgroup_permission)

let device_cgroup_permissions_of_yojson tree path =
  list_of_yojson device_cgroup_permission_of_yojson tree path

let device_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     host_path = value_for_key string__of_yojson "hostPath" _list path;
     container_path = option_of_yojson (value_for_key string__of_yojson "containerPath") _list path;
     permissions =
       option_of_yojson (value_for_key device_cgroup_permissions_of_yojson "permissions") _list path;
   }
    : device)

let devices_list_of_yojson tree path = list_of_yojson device_of_yojson tree path

let kernel_capabilities_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     add = option_of_yojson (value_for_key string_list_of_yojson "add") _list path;
     drop = option_of_yojson (value_for_key string_list_of_yojson "drop") _list path;
   }
    : kernel_capabilities)

let linux_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capabilities =
       option_of_yojson (value_for_key kernel_capabilities_of_yojson "capabilities") _list path;
     devices = option_of_yojson (value_for_key devices_list_of_yojson "devices") _list path;
     init_process_enabled =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "initProcessEnabled") _list path;
     shared_memory_size =
       option_of_yojson (value_for_key boxed_integer_of_yojson "sharedMemorySize") _list path;
     tmpfs = option_of_yojson (value_for_key tmpfs_list_of_yojson "tmpfs") _list path;
     max_swap = option_of_yojson (value_for_key boxed_integer_of_yojson "maxSwap") _list path;
     swappiness = option_of_yojson (value_for_key boxed_integer_of_yojson "swappiness") _list path;
   }
    : linux_parameters)

let volume_from_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_container =
       option_of_yojson (value_for_key string__of_yojson "sourceContainer") _list path;
     read_only = option_of_yojson (value_for_key boxed_boolean_of_yojson "readOnly") _list path;
   }
    : volume_from)

let volume_from_list_of_yojson tree path = list_of_yojson volume_from_of_yojson tree path

let mount_point_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_volume = option_of_yojson (value_for_key string__of_yojson "sourceVolume") _list path;
     container_path = option_of_yojson (value_for_key string__of_yojson "containerPath") _list path;
     read_only = option_of_yojson (value_for_key boxed_boolean_of_yojson "readOnly") _list path;
   }
    : mount_point)

let mount_point_list_of_yojson tree path = list_of_yojson mount_point_of_yojson tree path

let environment_file_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "s3" -> S3
    | `String value -> raise (deserialize_unknown_enum_value_error path "EnvironmentFileType" value)
    | _ -> raise (deserialize_wrong_type_error path "EnvironmentFileType")
     : environment_file_type)
    : environment_file_type)

let environment_file_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key string__of_yojson "value" _list path;
     type_ = value_for_key environment_file_type_of_yojson "type" _list path;
   }
    : environment_file)

let environment_files_of_yojson tree path = list_of_yojson environment_file_of_yojson tree path
let environment_variables_of_yojson tree path = list_of_yojson key_value_pair_of_yojson tree path
let integer_list_of_yojson tree path = list_of_yojson boxed_integer_of_yojson tree path

let container_restart_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled = value_for_key boxed_boolean_of_yojson "enabled" _list path;
     ignored_exit_codes =
       option_of_yojson (value_for_key integer_list_of_yojson "ignoredExitCodes") _list path;
     restart_attempt_period =
       option_of_yojson (value_for_key boxed_integer_of_yojson "restartAttemptPeriod") _list path;
   }
    : container_restart_policy)

let application_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "http" -> HTTP
    | `String "http2" -> HTTP2
    | `String "grpc" -> GRPC
    | `String value -> raise (deserialize_unknown_enum_value_error path "ApplicationProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "ApplicationProtocol")
     : application_protocol)
    : application_protocol)

let transport_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "tcp" -> TCP
    | `String "udp" -> UDP
    | `String value -> raise (deserialize_unknown_enum_value_error path "TransportProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "TransportProtocol")
     : transport_protocol)
    : transport_protocol)

let port_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_port =
       option_of_yojson (value_for_key boxed_integer_of_yojson "containerPort") _list path;
     host_port = option_of_yojson (value_for_key boxed_integer_of_yojson "hostPort") _list path;
     protocol = option_of_yojson (value_for_key transport_protocol_of_yojson "protocol") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     app_protocol =
       option_of_yojson (value_for_key application_protocol_of_yojson "appProtocol") _list path;
     container_port_range =
       option_of_yojson (value_for_key string__of_yojson "containerPortRange") _list path;
   }
    : port_mapping)

let port_mapping_list_of_yojson tree path = list_of_yojson port_mapping_of_yojson tree path

let repository_credentials_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ credentials_parameter = value_for_key string__of_yojson "credentialsParameter" _list path }
    : repository_credentials)

let container_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     image = option_of_yojson (value_for_key string__of_yojson "image") _list path;
     repository_credentials =
       option_of_yojson
         (value_for_key repository_credentials_of_yojson "repositoryCredentials")
         _list path;
     cpu = option_of_yojson (value_for_key integer_of_yojson "cpu") _list path;
     memory = option_of_yojson (value_for_key boxed_integer_of_yojson "memory") _list path;
     memory_reservation =
       option_of_yojson (value_for_key boxed_integer_of_yojson "memoryReservation") _list path;
     links = option_of_yojson (value_for_key string_list_of_yojson "links") _list path;
     port_mappings =
       option_of_yojson (value_for_key port_mapping_list_of_yojson "portMappings") _list path;
     essential = option_of_yojson (value_for_key boxed_boolean_of_yojson "essential") _list path;
     restart_policy =
       option_of_yojson
         (value_for_key container_restart_policy_of_yojson "restartPolicy")
         _list path;
     entry_point = option_of_yojson (value_for_key string_list_of_yojson "entryPoint") _list path;
     command = option_of_yojson (value_for_key string_list_of_yojson "command") _list path;
     environment =
       option_of_yojson (value_for_key environment_variables_of_yojson "environment") _list path;
     environment_files =
       option_of_yojson (value_for_key environment_files_of_yojson "environmentFiles") _list path;
     mount_points =
       option_of_yojson (value_for_key mount_point_list_of_yojson "mountPoints") _list path;
     volumes_from =
       option_of_yojson (value_for_key volume_from_list_of_yojson "volumesFrom") _list path;
     linux_parameters =
       option_of_yojson (value_for_key linux_parameters_of_yojson "linuxParameters") _list path;
     secrets = option_of_yojson (value_for_key secret_list_of_yojson "secrets") _list path;
     depends_on =
       option_of_yojson (value_for_key container_dependencies_of_yojson "dependsOn") _list path;
     start_timeout =
       option_of_yojson (value_for_key boxed_integer_of_yojson "startTimeout") _list path;
     stop_timeout =
       option_of_yojson (value_for_key boxed_integer_of_yojson "stopTimeout") _list path;
     version_consistency =
       option_of_yojson
         (value_for_key version_consistency_of_yojson "versionConsistency")
         _list path;
     hostname = option_of_yojson (value_for_key string__of_yojson "hostname") _list path;
     user = option_of_yojson (value_for_key string__of_yojson "user") _list path;
     working_directory =
       option_of_yojson (value_for_key string__of_yojson "workingDirectory") _list path;
     disable_networking =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "disableNetworking") _list path;
     privileged = option_of_yojson (value_for_key boxed_boolean_of_yojson "privileged") _list path;
     readonly_root_filesystem =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "readonlyRootFilesystem") _list path;
     dns_servers = option_of_yojson (value_for_key string_list_of_yojson "dnsServers") _list path;
     dns_search_domains =
       option_of_yojson (value_for_key string_list_of_yojson "dnsSearchDomains") _list path;
     extra_hosts =
       option_of_yojson (value_for_key host_entry_list_of_yojson "extraHosts") _list path;
     docker_security_options =
       option_of_yojson (value_for_key string_list_of_yojson "dockerSecurityOptions") _list path;
     interactive = option_of_yojson (value_for_key boxed_boolean_of_yojson "interactive") _list path;
     pseudo_terminal =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "pseudoTerminal") _list path;
     docker_labels =
       option_of_yojson (value_for_key docker_labels_map_of_yojson "dockerLabels") _list path;
     ulimits = option_of_yojson (value_for_key ulimit_list_of_yojson "ulimits") _list path;
     log_configuration =
       option_of_yojson (value_for_key log_configuration_of_yojson "logConfiguration") _list path;
     health_check = option_of_yojson (value_for_key health_check_of_yojson "healthCheck") _list path;
     system_controls =
       option_of_yojson (value_for_key system_controls_of_yojson "systemControls") _list path;
     resource_requirements =
       option_of_yojson
         (value_for_key resource_requirements_of_yojson "resourceRequirements")
         _list path;
     firelens_configuration =
       option_of_yojson
         (value_for_key firelens_configuration_of_yojson "firelensConfiguration")
         _list path;
     credential_specs =
       option_of_yojson (value_for_key string_list_of_yojson "credentialSpecs") _list path;
   }
    : container_definition)

let container_definitions_of_yojson tree path =
  list_of_yojson container_definition_of_yojson tree path

let task_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_definition_arn =
       option_of_yojson (value_for_key string__of_yojson "taskDefinitionArn") _list path;
     container_definitions =
       option_of_yojson
         (value_for_key container_definitions_of_yojson "containerDefinitions")
         _list path;
     family = option_of_yojson (value_for_key string__of_yojson "family") _list path;
     task_role_arn = option_of_yojson (value_for_key string__of_yojson "taskRoleArn") _list path;
     execution_role_arn =
       option_of_yojson (value_for_key string__of_yojson "executionRoleArn") _list path;
     network_mode = option_of_yojson (value_for_key network_mode_of_yojson "networkMode") _list path;
     revision = option_of_yojson (value_for_key integer_of_yojson "revision") _list path;
     volumes = option_of_yojson (value_for_key volume_list_of_yojson "volumes") _list path;
     status = option_of_yojson (value_for_key task_definition_status_of_yojson "status") _list path;
     requires_attributes =
       option_of_yojson
         (value_for_key requires_attributes_of_yojson "requiresAttributes")
         _list path;
     placement_constraints =
       option_of_yojson
         (value_for_key task_definition_placement_constraints_of_yojson "placementConstraints")
         _list path;
     compatibilities =
       option_of_yojson (value_for_key compatibility_list_of_yojson "compatibilities") _list path;
     runtime_platform =
       option_of_yojson (value_for_key runtime_platform_of_yojson "runtimePlatform") _list path;
     requires_compatibilities =
       option_of_yojson
         (value_for_key compatibility_list_of_yojson "requiresCompatibilities")
         _list path;
     cpu = option_of_yojson (value_for_key string__of_yojson "cpu") _list path;
     memory = option_of_yojson (value_for_key string__of_yojson "memory") _list path;
     inference_accelerators =
       option_of_yojson
         (value_for_key inference_accelerators_of_yojson "inferenceAccelerators")
         _list path;
     pid_mode = option_of_yojson (value_for_key pid_mode_of_yojson "pidMode") _list path;
     ipc_mode = option_of_yojson (value_for_key ipc_mode_of_yojson "ipcMode") _list path;
     proxy_configuration =
       option_of_yojson
         (value_for_key proxy_configuration_of_yojson "proxyConfiguration")
         _list path;
     registered_at = option_of_yojson (value_for_key timestamp_of_yojson "registeredAt") _list path;
     deregistered_at =
       option_of_yojson (value_for_key timestamp_of_yojson "deregisteredAt") _list path;
     delete_requested_at =
       option_of_yojson (value_for_key timestamp_of_yojson "deleteRequestedAt") _list path;
     registered_by = option_of_yojson (value_for_key string__of_yojson "registeredBy") _list path;
     ephemeral_storage =
       option_of_yojson (value_for_key ephemeral_storage_of_yojson "ephemeralStorage") _list path;
     enable_fault_injection =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "enableFaultInjection") _list path;
   }
    : task_definition)

let describe_task_definition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_definition =
       option_of_yojson (value_for_key task_definition_of_yojson "taskDefinition") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : describe_task_definition_response)

let task_definition_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "TAGS" -> TAGS
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaskDefinitionField" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskDefinitionField")
     : task_definition_field)
    : task_definition_field)

let task_definition_field_list_of_yojson tree path =
  list_of_yojson task_definition_field_of_yojson tree path

let describe_task_definition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_definition = value_for_key string__of_yojson "taskDefinition" _list path;
     include_ =
       option_of_yojson (value_for_key task_definition_field_list_of_yojson "include") _list path;
   }
    : describe_task_definition_request)

let deregister_task_definition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_definition =
       option_of_yojson (value_for_key task_definition_of_yojson "taskDefinition") _list path;
   }
    : deregister_task_definition_response)

let deregister_task_definition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_definition = value_for_key string__of_yojson "taskDefinition" _list path }
    : deregister_task_definition_request)

let delete_account_setting_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ setting = option_of_yojson (value_for_key setting_of_yojson "setting") _list path }
    : delete_account_setting_response)

let delete_account_setting_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key setting_name_of_yojson "name" _list path;
     principal_arn = option_of_yojson (value_for_key string__of_yojson "principalArn") _list path;
   }
    : delete_account_setting_request)

let unsupported_feature_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : unsupported_feature_exception)

let service_deployment_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : service_deployment_not_found_exception)

let continue_service_deployment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_deployment_arn =
       option_of_yojson (value_for_key string__of_yojson "serviceDeploymentArn") _list path;
   }
    : continue_service_deployment_response)

let deployment_lifecycle_hook_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "ROLLBACK" -> ROLLBACK
    | `String "CONTINUE" -> CONTINUE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeploymentLifecycleHookAction" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentLifecycleHookAction")
     : deployment_lifecycle_hook_action)
    : deployment_lifecycle_hook_action)

let continue_service_deployment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_deployment_arn = value_for_key string__of_yojson "serviceDeploymentArn" _list path;
     hook_id = value_for_key string__of_yojson "hookId" _list path;
     action =
       option_of_yojson
         (value_for_key deployment_lifecycle_hook_action_of_yojson "action")
         _list path;
   }
    : continue_service_deployment_request)

let assign_public_ip_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssignPublicIp" value)
    | _ -> raise (deserialize_wrong_type_error path "AssignPublicIp")
     : assign_public_ip)
    : assign_public_ip)

let attachment_details_of_yojson tree path = list_of_yojson key_value_pair_of_yojson tree path

let attachment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key string__of_yojson "id") _list path;
     type_ = option_of_yojson (value_for_key string__of_yojson "type") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     details = option_of_yojson (value_for_key attachment_details_of_yojson "details") _list path;
   }
    : attachment)

let attachment_state_change_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attachment_arn = value_for_key string__of_yojson "attachmentArn" _list path;
     status = value_for_key string__of_yojson "status" _list path;
   }
    : attachment_state_change)

let attachment_state_changes_of_yojson tree path =
  list_of_yojson attachment_state_change_of_yojson tree path

let attachments_of_yojson tree path = list_of_yojson attachment_of_yojson tree path

let attribute_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : attribute_limit_exceeded_exception)

let attributes_of_yojson tree path = list_of_yojson attribute_of_yojson tree path

let auto_repair_actions_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutoRepairActionsStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoRepairActionsStatus")
     : auto_repair_actions_status)
    : auto_repair_actions_status)

let auto_repair_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     actions_status =
       option_of_yojson
         (value_for_key auto_repair_actions_status_of_yojson "actionsStatus")
         _list path;
   }
    : auto_repair_configuration)

let managed_draining_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ManagedDraining" value)
    | _ -> raise (deserialize_wrong_type_error path "ManagedDraining")
     : managed_draining)
    : managed_draining)

let managed_termination_protection_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ManagedTerminationProtection" value)
    | _ -> raise (deserialize_wrong_type_error path "ManagedTerminationProtection")
     : managed_termination_protection)
    : managed_termination_protection)

let managed_scaling_instance_warmup_period_of_yojson = int_of_yojson
let managed_scaling_step_size_of_yojson = int_of_yojson
let managed_scaling_target_capacity_of_yojson = int_of_yojson

let managed_scaling_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ManagedScalingStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ManagedScalingStatus")
     : managed_scaling_status)
    : managed_scaling_status)

let managed_scaling_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key managed_scaling_status_of_yojson "status") _list path;
     target_capacity =
       option_of_yojson
         (value_for_key managed_scaling_target_capacity_of_yojson "targetCapacity")
         _list path;
     minimum_scaling_step_size =
       option_of_yojson
         (value_for_key managed_scaling_step_size_of_yojson "minimumScalingStepSize")
         _list path;
     maximum_scaling_step_size =
       option_of_yojson
         (value_for_key managed_scaling_step_size_of_yojson "maximumScalingStepSize")
         _list path;
     instance_warmup_period =
       option_of_yojson
         (value_for_key managed_scaling_instance_warmup_period_of_yojson "instanceWarmupPeriod")
         _list path;
   }
    : managed_scaling)

let auto_scaling_group_provider_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_scaling_group_arn = value_for_key string__of_yojson "autoScalingGroupArn" _list path;
     managed_scaling =
       option_of_yojson (value_for_key managed_scaling_of_yojson "managedScaling") _list path;
     managed_termination_protection =
       option_of_yojson
         (value_for_key managed_termination_protection_of_yojson "managedTerminationProtection")
         _list path;
     managed_draining =
       option_of_yojson (value_for_key managed_draining_of_yojson "managedDraining") _list path;
   }
    : auto_scaling_group_provider)

let auto_scaling_group_provider_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_scaling =
       option_of_yojson (value_for_key managed_scaling_of_yojson "managedScaling") _list path;
     managed_termination_protection =
       option_of_yojson
         (value_for_key managed_termination_protection_of_yojson "managedTerminationProtection")
         _list path;
     managed_draining =
       option_of_yojson (value_for_key managed_draining_of_yojson "managedDraining") _list path;
   }
    : auto_scaling_group_provider_update)

let availability_zone_rebalancing_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AvailabilityZoneRebalancing" value)
    | _ -> raise (deserialize_wrong_type_error path "AvailabilityZoneRebalancing")
     : availability_zone_rebalancing)
    : availability_zone_rebalancing)

let aws_vpc_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnets = value_for_key string_list_of_yojson "subnets" _list path;
     security_groups =
       option_of_yojson (value_for_key string_list_of_yojson "securityGroups") _list path;
     assign_public_ip =
       option_of_yojson (value_for_key assign_public_ip_of_yojson "assignPublicIp") _list path;
   }
    : aws_vpc_configuration)

let bare_metal_of_yojson (tree : t) path =
  ((match tree with
    | `String "included" -> INCLUDED
    | `String "required" -> REQUIRED
    | `String "excluded" -> EXCLUDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "BareMetal" value)
    | _ -> raise (deserialize_wrong_type_error path "BareMetal")
     : bare_metal)
    : bare_metal)

let baseline_ebs_bandwidth_mbps_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min = option_of_yojson (value_for_key boxed_integer_of_yojson "min") _list path;
     max = option_of_yojson (value_for_key boxed_integer_of_yojson "max") _list path;
   }
    : baseline_ebs_bandwidth_mbps_request)

let blocked_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : blocked_exception)

let boxed_double_of_yojson = double_of_yojson

let burstable_performance_of_yojson (tree : t) path =
  ((match tree with
    | `String "included" -> INCLUDED
    | `String "required" -> REQUIRED
    | `String "excluded" -> EXCLUDED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BurstablePerformance" value)
    | _ -> raise (deserialize_wrong_type_error path "BurstablePerformance")
     : burstable_performance)
    : burstable_performance)

let double_of_yojson = double_of_yojson

let canary_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     canary_percent = option_of_yojson (value_for_key double_of_yojson "canaryPercent") _list path;
     canary_bake_time_in_minutes =
       option_of_yojson (value_for_key integer_of_yojson "canaryBakeTimeInMinutes") _list path;
   }
    : canary_configuration)

let capacity_option_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ON_DEMAND" -> ON_DEMAND
    | `String "SPOT" -> SPOT
    | `String "RESERVED" -> RESERVED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CapacityOptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "CapacityOptionType")
     : capacity_option_type)
    : capacity_option_type)

let capacity_provider_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EC2_AUTOSCALING" -> EC2_AUTOSCALING
    | `String "MANAGED_INSTANCES" -> MANAGED_INSTANCES
    | `String "FARGATE" -> FARGATE
    | `String "FARGATE_SPOT" -> FARGATE_SPOT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CapacityProviderType" value)
    | _ -> raise (deserialize_wrong_type_error path "CapacityProviderType")
     : capacity_provider_type)
    : capacity_provider_type)

let capacity_provider_update_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "CREATE_COMPLETE" -> CREATE_COMPLETE
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "DELETE_COMPLETE" -> DELETE_COMPLETE
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
    | `String "UPDATE_COMPLETE" -> UPDATE_COMPLETE
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CapacityProviderUpdateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CapacityProviderUpdateStatus")
     : capacity_provider_update_status)
    : capacity_provider_update_status)

let infrastructure_optimization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scale_in_after =
       option_of_yojson (value_for_key boxed_integer_of_yojson "scaleInAfter") _list path;
   }
    : infrastructure_optimization)

let propagate_mi_tags_of_yojson (tree : t) path =
  ((match tree with
    | `String "CAPACITY_PROVIDER" -> CAPACITY_PROVIDER
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "PropagateMITags" value)
    | _ -> raise (deserialize_wrong_type_error path "PropagateMITags")
     : propagate_mi_tags)
    : propagate_mi_tags)

let capacity_reservation_preference_of_yojson (tree : t) path =
  ((match tree with
    | `String "RESERVATIONS_ONLY" -> RESERVATIONS_ONLY
    | `String "RESERVATIONS_FIRST" -> RESERVATIONS_FIRST
    | `String "RESERVATIONS_EXCLUDED" -> RESERVATIONS_EXCLUDED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CapacityReservationPreference" value)
    | _ -> raise (deserialize_wrong_type_error path "CapacityReservationPreference")
     : capacity_reservation_preference)
    : capacity_reservation_preference)

let capacity_reservation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reservation_group_arn =
       option_of_yojson (value_for_key string__of_yojson "reservationGroupArn") _list path;
     reservation_preference =
       option_of_yojson
         (value_for_key capacity_reservation_preference_of_yojson "reservationPreference")
         _list path;
   }
    : capacity_reservation_request)

let network_bandwidth_gbps_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min = option_of_yojson (value_for_key boxed_double_of_yojson "min") _list path;
     max = option_of_yojson (value_for_key boxed_double_of_yojson "max") _list path;
   }
    : network_bandwidth_gbps_request)

let total_local_storage_gb_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min = option_of_yojson (value_for_key boxed_double_of_yojson "min") _list path;
     max = option_of_yojson (value_for_key boxed_double_of_yojson "max") _list path;
   }
    : total_local_storage_gb_request)

let local_storage_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "hdd" -> HDD
    | `String "ssd" -> SSD
    | `String value -> raise (deserialize_unknown_enum_value_error path "LocalStorageType" value)
    | _ -> raise (deserialize_wrong_type_error path "LocalStorageType")
     : local_storage_type)
    : local_storage_type)

let local_storage_type_set_of_yojson tree path =
  list_of_yojson local_storage_type_of_yojson tree path

let local_storage_of_yojson (tree : t) path =
  ((match tree with
    | `String "included" -> INCLUDED
    | `String "required" -> REQUIRED
    | `String "excluded" -> EXCLUDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "LocalStorage" value)
    | _ -> raise (deserialize_wrong_type_error path "LocalStorage")
     : local_storage)
    : local_storage)

let network_interface_count_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min = option_of_yojson (value_for_key boxed_integer_of_yojson "min") _list path;
     max = option_of_yojson (value_for_key boxed_integer_of_yojson "max") _list path;
   }
    : network_interface_count_request)

let instance_generation_of_yojson (tree : t) path =
  ((match tree with
    | `String "current" -> CURRENT
    | `String "previous" -> PREVIOUS
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceGeneration" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceGeneration")
     : instance_generation)
    : instance_generation)

let instance_generation_set_of_yojson tree path =
  list_of_yojson instance_generation_of_yojson tree path

let excluded_instance_type_of_yojson = string_of_yojson

let excluded_instance_type_set_of_yojson tree path =
  list_of_yojson excluded_instance_type_of_yojson tree path

let memory_gi_b_per_v_cpu_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min = option_of_yojson (value_for_key boxed_double_of_yojson "min") _list path;
     max = option_of_yojson (value_for_key boxed_double_of_yojson "max") _list path;
   }
    : memory_gi_b_per_v_cpu_request)

let cpu_manufacturer_of_yojson (tree : t) path =
  ((match tree with
    | `String "intel" -> INTEL
    | `String "amd" -> AMD
    | `String "amazon-web-services" -> AMAZON_WEB_SERVICES
    | `String value -> raise (deserialize_unknown_enum_value_error path "CpuManufacturer" value)
    | _ -> raise (deserialize_wrong_type_error path "CpuManufacturer")
     : cpu_manufacturer)
    : cpu_manufacturer)

let cpu_manufacturer_set_of_yojson tree path = list_of_yojson cpu_manufacturer_of_yojson tree path

let memory_mi_b_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min = value_for_key boxed_integer_of_yojson "min" _list path;
     max = option_of_yojson (value_for_key boxed_integer_of_yojson "max") _list path;
   }
    : memory_mi_b_request)

let v_cpu_count_range_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min = value_for_key boxed_integer_of_yojson "min" _list path;
     max = option_of_yojson (value_for_key boxed_integer_of_yojson "max") _list path;
   }
    : v_cpu_count_range_request)

let instance_requirements_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     v_cpu_count = value_for_key v_cpu_count_range_request_of_yojson "vCpuCount" _list path;
     memory_mi_b = value_for_key memory_mi_b_request_of_yojson "memoryMiB" _list path;
     cpu_manufacturers =
       option_of_yojson (value_for_key cpu_manufacturer_set_of_yojson "cpuManufacturers") _list path;
     memory_gi_b_per_v_cpu =
       option_of_yojson
         (value_for_key memory_gi_b_per_v_cpu_request_of_yojson "memoryGiBPerVCpu")
         _list path;
     excluded_instance_types =
       option_of_yojson
         (value_for_key excluded_instance_type_set_of_yojson "excludedInstanceTypes")
         _list path;
     instance_generations =
       option_of_yojson
         (value_for_key instance_generation_set_of_yojson "instanceGenerations")
         _list path;
     spot_max_price_percentage_over_lowest_price =
       option_of_yojson
         (value_for_key boxed_integer_of_yojson "spotMaxPricePercentageOverLowestPrice")
         _list path;
     on_demand_max_price_percentage_over_lowest_price =
       option_of_yojson
         (value_for_key boxed_integer_of_yojson "onDemandMaxPricePercentageOverLowestPrice")
         _list path;
     bare_metal = option_of_yojson (value_for_key bare_metal_of_yojson "bareMetal") _list path;
     burstable_performance =
       option_of_yojson
         (value_for_key burstable_performance_of_yojson "burstablePerformance")
         _list path;
     require_hibernate_support =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "requireHibernateSupport") _list path;
     network_interface_count =
       option_of_yojson
         (value_for_key network_interface_count_request_of_yojson "networkInterfaceCount")
         _list path;
     local_storage =
       option_of_yojson (value_for_key local_storage_of_yojson "localStorage") _list path;
     local_storage_types =
       option_of_yojson
         (value_for_key local_storage_type_set_of_yojson "localStorageTypes")
         _list path;
     total_local_storage_g_b =
       option_of_yojson
         (value_for_key total_local_storage_gb_request_of_yojson "totalLocalStorageGB")
         _list path;
     baseline_ebs_bandwidth_mbps =
       option_of_yojson
         (value_for_key baseline_ebs_bandwidth_mbps_request_of_yojson "baselineEbsBandwidthMbps")
         _list path;
     accelerator_types =
       option_of_yojson (value_for_key accelerator_type_set_of_yojson "acceleratorTypes") _list path;
     accelerator_count =
       option_of_yojson
         (value_for_key accelerator_count_request_of_yojson "acceleratorCount")
         _list path;
     accelerator_manufacturers =
       option_of_yojson
         (value_for_key accelerator_manufacturer_set_of_yojson "acceleratorManufacturers")
         _list path;
     accelerator_names =
       option_of_yojson (value_for_key accelerator_name_set_of_yojson "acceleratorNames") _list path;
     accelerator_total_memory_mi_b =
       option_of_yojson
         (value_for_key accelerator_total_memory_mi_b_request_of_yojson "acceleratorTotalMemoryMiB")
         _list path;
     network_bandwidth_gbps =
       option_of_yojson
         (value_for_key network_bandwidth_gbps_request_of_yojson "networkBandwidthGbps")
         _list path;
     allowed_instance_types =
       option_of_yojson
         (value_for_key allowed_instance_type_set_of_yojson "allowedInstanceTypes")
         _list path;
     max_spot_price_as_percentage_of_optimal_on_demand_price =
       option_of_yojson
         (value_for_key boxed_integer_of_yojson "maxSpotPriceAsPercentageOfOptimalOnDemandPrice")
         _list path;
   }
    : instance_requirements_request)

let managed_instances_monitoring_options_of_yojson (tree : t) path =
  ((match tree with
    | `String "BASIC" -> BASIC
    | `String "DETAILED" -> DETAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ManagedInstancesMonitoringOptions" value)
    | _ -> raise (deserialize_wrong_type_error path "ManagedInstancesMonitoringOptions")
     : managed_instances_monitoring_options)
    : managed_instances_monitoring_options)

let managed_instances_local_storage_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     use_local_storage =
       option_of_yojson (value_for_key boolean__of_yojson "useLocalStorage") _list path;
   }
    : managed_instances_local_storage_configuration)

let task_volume_storage_gi_b_of_yojson = int_of_yojson

let managed_instances_storage_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage_size_gi_b =
       option_of_yojson
         (value_for_key task_volume_storage_gi_b_of_yojson "storageSizeGiB")
         _list path;
   }
    : managed_instances_storage_configuration)

let managed_instances_network_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnets = option_of_yojson (value_for_key string_list_of_yojson "subnets") _list path;
     security_groups =
       option_of_yojson (value_for_key string_list_of_yojson "securityGroups") _list path;
   }
    : managed_instances_network_configuration)

let instance_launch_template_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ec2_instance_profile_arn = value_for_key string__of_yojson "ec2InstanceProfileArn" _list path;
     network_configuration =
       value_for_key managed_instances_network_configuration_of_yojson "networkConfiguration" _list
         path;
     storage_configuration =
       option_of_yojson
         (value_for_key managed_instances_storage_configuration_of_yojson "storageConfiguration")
         _list path;
     local_storage_configuration =
       option_of_yojson
         (value_for_key managed_instances_local_storage_configuration_of_yojson
            "localStorageConfiguration")
         _list path;
     monitoring =
       option_of_yojson
         (value_for_key managed_instances_monitoring_options_of_yojson "monitoring")
         _list path;
     capacity_option_type =
       option_of_yojson
         (value_for_key capacity_option_type_of_yojson "capacityOptionType")
         _list path;
     instance_metadata_tags_propagation =
       option_of_yojson
         (value_for_key boxed_boolean_of_yojson "instanceMetadataTagsPropagation")
         _list path;
     instance_requirements =
       option_of_yojson
         (value_for_key instance_requirements_request_of_yojson "instanceRequirements")
         _list path;
     fips_enabled =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "fipsEnabled") _list path;
     capacity_reservations =
       option_of_yojson
         (value_for_key capacity_reservation_request_of_yojson "capacityReservations")
         _list path;
   }
    : instance_launch_template)

let managed_instances_provider_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     infrastructure_role_arn =
       option_of_yojson (value_for_key string__of_yojson "infrastructureRoleArn") _list path;
     instance_launch_template =
       option_of_yojson
         (value_for_key instance_launch_template_of_yojson "instanceLaunchTemplate")
         _list path;
     propagate_tags =
       option_of_yojson (value_for_key propagate_mi_tags_of_yojson "propagateTags") _list path;
     infrastructure_optimization =
       option_of_yojson
         (value_for_key infrastructure_optimization_of_yojson "infrastructureOptimization")
         _list path;
     auto_repair_configuration =
       option_of_yojson
         (value_for_key auto_repair_configuration_of_yojson "autoRepairConfiguration")
         _list path;
   }
    : managed_instances_provider)

let capacity_provider_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PROVISIONING" -> PROVISIONING
    | `String "ACTIVE" -> ACTIVE
    | `String "DEPROVISIONING" -> DEPROVISIONING
    | `String "INACTIVE" -> INACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CapacityProviderStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CapacityProviderStatus")
     : capacity_provider_status)
    : capacity_provider_status)

let capacity_provider_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_provider_arn =
       option_of_yojson (value_for_key string__of_yojson "capacityProviderArn") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     status =
       option_of_yojson (value_for_key capacity_provider_status_of_yojson "status") _list path;
     auto_scaling_group_provider =
       option_of_yojson
         (value_for_key auto_scaling_group_provider_of_yojson "autoScalingGroupProvider")
         _list path;
     managed_instances_provider =
       option_of_yojson
         (value_for_key managed_instances_provider_of_yojson "managedInstancesProvider")
         _list path;
     update_status =
       option_of_yojson
         (value_for_key capacity_provider_update_status_of_yojson "updateStatus")
         _list path;
     update_status_reason =
       option_of_yojson (value_for_key string__of_yojson "updateStatusReason") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     type_ = option_of_yojson (value_for_key capacity_provider_type_of_yojson "type") _list path;
   }
    : capacity_provider)

let capacity_provider_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "TAGS" -> TAGS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CapacityProviderField" value)
    | _ -> raise (deserialize_wrong_type_error path "CapacityProviderField")
     : capacity_provider_field)
    : capacity_provider_field)

let capacity_provider_field_list_of_yojson tree path =
  list_of_yojson capacity_provider_field_of_yojson tree path

let capacity_provider_strategy_item_base_of_yojson = int_of_yojson
let capacity_provider_strategy_item_weight_of_yojson = int_of_yojson

let capacity_provider_strategy_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_provider = value_for_key string__of_yojson "capacityProvider" _list path;
     weight =
       option_of_yojson
         (value_for_key capacity_provider_strategy_item_weight_of_yojson "weight")
         _list path;
     base =
       option_of_yojson
         (value_for_key capacity_provider_strategy_item_base_of_yojson "base")
         _list path;
   }
    : capacity_provider_strategy_item)

let capacity_provider_strategy_of_yojson tree path =
  list_of_yojson capacity_provider_strategy_item_of_yojson tree path

let capacity_providers_of_yojson tree path = list_of_yojson capacity_provider_of_yojson tree path

let cluster_service_connect_defaults_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ namespace = option_of_yojson (value_for_key string__of_yojson "namespace") _list path }
    : cluster_service_connect_defaults)

let cluster_setting_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "containerInsights" -> CONTAINER_INSIGHTS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClusterSettingName" value)
    | _ -> raise (deserialize_wrong_type_error path "ClusterSettingName")
     : cluster_setting_name)
    : cluster_setting_name)

let cluster_setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key cluster_setting_name_of_yojson "name") _list path;
     value = option_of_yojson (value_for_key string__of_yojson "value") _list path;
   }
    : cluster_setting)

let cluster_settings_of_yojson tree path = list_of_yojson cluster_setting_of_yojson tree path
let statistics_of_yojson tree path = list_of_yojson key_value_pair_of_yojson tree path

let managed_storage_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "kmsKeyId") _list path;
     fargate_ephemeral_storage_kms_key_id =
       option_of_yojson
         (value_for_key string__of_yojson "fargateEphemeralStorageKmsKeyId")
         _list path;
   }
    : managed_storage_configuration)

let execute_command_log_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_watch_log_group_name =
       option_of_yojson (value_for_key string__of_yojson "cloudWatchLogGroupName") _list path;
     cloud_watch_encryption_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "cloudWatchEncryptionEnabled") _list path;
     s3_bucket_name = option_of_yojson (value_for_key string__of_yojson "s3BucketName") _list path;
     s3_encryption_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "s3EncryptionEnabled") _list path;
     s3_key_prefix = option_of_yojson (value_for_key string__of_yojson "s3KeyPrefix") _list path;
   }
    : execute_command_log_configuration)

let execute_command_logging_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "DEFAULT" -> DEFAULT
    | `String "OVERRIDE" -> OVERRIDE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExecuteCommandLogging" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecuteCommandLogging")
     : execute_command_logging)
    : execute_command_logging)

let execute_command_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "kmsKeyId") _list path;
     logging =
       option_of_yojson (value_for_key execute_command_logging_of_yojson "logging") _list path;
     log_configuration =
       option_of_yojson
         (value_for_key execute_command_log_configuration_of_yojson "logConfiguration")
         _list path;
   }
    : execute_command_configuration)

let cluster_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execute_command_configuration =
       option_of_yojson
         (value_for_key execute_command_configuration_of_yojson "executeCommandConfiguration")
         _list path;
     managed_storage_configuration =
       option_of_yojson
         (value_for_key managed_storage_configuration_of_yojson "managedStorageConfiguration")
         _list path;
   }
    : cluster_configuration)

let cluster_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_arn = option_of_yojson (value_for_key string__of_yojson "clusterArn") _list path;
     cluster_name = option_of_yojson (value_for_key string__of_yojson "clusterName") _list path;
     configuration =
       option_of_yojson (value_for_key cluster_configuration_of_yojson "configuration") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     registered_container_instances_count =
       option_of_yojson
         (value_for_key integer_of_yojson "registeredContainerInstancesCount")
         _list path;
     running_tasks_count =
       option_of_yojson (value_for_key integer_of_yojson "runningTasksCount") _list path;
     pending_tasks_count =
       option_of_yojson (value_for_key integer_of_yojson "pendingTasksCount") _list path;
     active_services_count =
       option_of_yojson (value_for_key integer_of_yojson "activeServicesCount") _list path;
     statistics = option_of_yojson (value_for_key statistics_of_yojson "statistics") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     settings = option_of_yojson (value_for_key cluster_settings_of_yojson "settings") _list path;
     capacity_providers =
       option_of_yojson (value_for_key string_list_of_yojson "capacityProviders") _list path;
     default_capacity_provider_strategy =
       option_of_yojson
         (value_for_key capacity_provider_strategy_of_yojson "defaultCapacityProviderStrategy")
         _list path;
     attachments = option_of_yojson (value_for_key attachments_of_yojson "attachments") _list path;
     attachments_status =
       option_of_yojson (value_for_key string__of_yojson "attachmentsStatus") _list path;
     service_connect_defaults =
       option_of_yojson
         (value_for_key cluster_service_connect_defaults_of_yojson "serviceConnectDefaults")
         _list path;
   }
    : cluster)

let cluster_contains_capacity_provider_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : cluster_contains_capacity_provider_exception)

let cluster_contains_container_instances_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : cluster_contains_container_instances_exception)

let cluster_contains_services_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : cluster_contains_services_exception)

let cluster_contains_tasks_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : cluster_contains_tasks_exception)

let cluster_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "ATTACHMENTS" -> ATTACHMENTS
    | `String "CONFIGURATIONS" -> CONFIGURATIONS
    | `String "SETTINGS" -> SETTINGS
    | `String "STATISTICS" -> STATISTICS
    | `String "TAGS" -> TAGS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClusterField" value)
    | _ -> raise (deserialize_wrong_type_error path "ClusterField")
     : cluster_field)
    : cluster_field)

let cluster_field_list_of_yojson tree path = list_of_yojson cluster_field_of_yojson tree path

let cluster_service_connect_defaults_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ namespace = value_for_key string__of_yojson "namespace" _list path }
    : cluster_service_connect_defaults_request)

let clusters_of_yojson tree path = list_of_yojson cluster_of_yojson tree path
let resource_ids_of_yojson tree path = list_of_yojson string__of_yojson tree path

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ids = option_of_yojson (value_for_key resource_ids_of_yojson "resourceIds") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : conflict_exception)

let connectivity_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONNECTED" -> CONNECTED
    | `String "DISCONNECTED" -> DISCONNECTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "Connectivity" value)
    | _ -> raise (deserialize_wrong_type_error path "Connectivity")
     : connectivity)
    : connectivity)

let neuron_device_ids_of_yojson tree path = list_of_yojson string__of_yojson tree path
let gpu_ids_of_yojson tree path = list_of_yojson string__of_yojson tree path

let managed_agent_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "ExecuteCommandAgent" -> ExecuteCommandAgent
    | `String value -> raise (deserialize_unknown_enum_value_error path "ManagedAgentName" value)
    | _ -> raise (deserialize_wrong_type_error path "ManagedAgentName")
     : managed_agent_name)
    : managed_agent_name)

let managed_agent_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_started_at =
       option_of_yojson (value_for_key timestamp_of_yojson "lastStartedAt") _list path;
     name = option_of_yojson (value_for_key managed_agent_name_of_yojson "name") _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "reason") _list path;
     last_status = option_of_yojson (value_for_key string__of_yojson "lastStatus") _list path;
   }
    : managed_agent)

let managed_agents_of_yojson tree path = list_of_yojson managed_agent_of_yojson tree path

let health_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "HEALTHY" -> HEALTHY
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String "UNKNOWN" -> UNKNOWN
    | `String value -> raise (deserialize_unknown_enum_value_error path "HealthStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "HealthStatus")
     : health_status)
    : health_status)

let network_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attachment_id = option_of_yojson (value_for_key string__of_yojson "attachmentId") _list path;
     private_ipv4_address =
       option_of_yojson (value_for_key string__of_yojson "privateIpv4Address") _list path;
     ipv6_address = option_of_yojson (value_for_key string__of_yojson "ipv6Address") _list path;
   }
    : network_interface)

let network_interfaces_of_yojson tree path = list_of_yojson network_interface_of_yojson tree path

let network_binding_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bind_i_p = option_of_yojson (value_for_key string__of_yojson "bindIP") _list path;
     container_port =
       option_of_yojson (value_for_key boxed_integer_of_yojson "containerPort") _list path;
     host_port = option_of_yojson (value_for_key boxed_integer_of_yojson "hostPort") _list path;
     protocol = option_of_yojson (value_for_key transport_protocol_of_yojson "protocol") _list path;
     container_port_range =
       option_of_yojson (value_for_key string__of_yojson "containerPortRange") _list path;
     host_port_range = option_of_yojson (value_for_key string__of_yojson "hostPortRange") _list path;
   }
    : network_binding)

let network_bindings_of_yojson tree path = list_of_yojson network_binding_of_yojson tree path

let container_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_arn = option_of_yojson (value_for_key string__of_yojson "containerArn") _list path;
     task_arn = option_of_yojson (value_for_key string__of_yojson "taskArn") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     image = option_of_yojson (value_for_key string__of_yojson "image") _list path;
     image_digest = option_of_yojson (value_for_key string__of_yojson "imageDigest") _list path;
     runtime_id = option_of_yojson (value_for_key string__of_yojson "runtimeId") _list path;
     last_status = option_of_yojson (value_for_key string__of_yojson "lastStatus") _list path;
     exit_code = option_of_yojson (value_for_key boxed_integer_of_yojson "exitCode") _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "reason") _list path;
     network_bindings =
       option_of_yojson (value_for_key network_bindings_of_yojson "networkBindings") _list path;
     network_interfaces =
       option_of_yojson (value_for_key network_interfaces_of_yojson "networkInterfaces") _list path;
     health_status =
       option_of_yojson (value_for_key health_status_of_yojson "healthStatus") _list path;
     managed_agents =
       option_of_yojson (value_for_key managed_agents_of_yojson "managedAgents") _list path;
     cpu = option_of_yojson (value_for_key string__of_yojson "cpu") _list path;
     memory = option_of_yojson (value_for_key string__of_yojson "memory") _list path;
     memory_reservation =
       option_of_yojson (value_for_key string__of_yojson "memoryReservation") _list path;
     gpu_ids = option_of_yojson (value_for_key gpu_ids_of_yojson "gpuIds") _list path;
     neuron_device_ids =
       option_of_yojson (value_for_key neuron_device_ids_of_yojson "neuronDeviceIds") _list path;
   }
    : container)

let container_image_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name = option_of_yojson (value_for_key string__of_yojson "containerName") _list path;
     image_digest = option_of_yojson (value_for_key string__of_yojson "imageDigest") _list path;
     image = option_of_yojson (value_for_key string__of_yojson "image") _list path;
   }
    : container_image)

let container_images_of_yojson tree path = list_of_yojson container_image_of_yojson tree path

let instance_health_check_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "OK" -> OK
    | `String "IMPAIRED" -> IMPAIRED
    | `String "INSUFFICIENT_DATA" -> INSUFFICIENT_DATA
    | `String "INITIALIZING" -> INITIALIZING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstanceHealthCheckState" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceHealthCheckState")
     : instance_health_check_state)
    : instance_health_check_state)

let instance_health_check_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONTAINER_RUNTIME" -> CONTAINER_RUNTIME
    | `String "ACCELERATED_COMPUTE" -> ACCELERATED_COMPUTE
    | `String "DAEMON" -> DAEMON
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstanceHealthCheckType" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceHealthCheckType")
     : instance_health_check_type)
    : instance_health_check_type)

let instance_health_check_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key instance_health_check_type_of_yojson "type") _list path;
     status =
       option_of_yojson (value_for_key instance_health_check_state_of_yojson "status") _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
     last_updated = option_of_yojson (value_for_key timestamp_of_yojson "lastUpdated") _list path;
     last_status_change =
       option_of_yojson (value_for_key timestamp_of_yojson "lastStatusChange") _list path;
   }
    : instance_health_check_result)

let instance_health_check_result_list_of_yojson tree path =
  list_of_yojson instance_health_check_result_of_yojson tree path

let container_instance_health_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     overall_status =
       option_of_yojson
         (value_for_key instance_health_check_state_of_yojson "overallStatus")
         _list path;
     details =
       option_of_yojson
         (value_for_key instance_health_check_result_list_of_yojson "details")
         _list path;
   }
    : container_instance_health_status)

let long_of_yojson = long_of_yojson

let resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     type_ = option_of_yojson (value_for_key string__of_yojson "type") _list path;
     double_value = option_of_yojson (value_for_key double_of_yojson "doubleValue") _list path;
     long_value = option_of_yojson (value_for_key long_of_yojson "longValue") _list path;
     integer_value = option_of_yojson (value_for_key integer_of_yojson "integerValue") _list path;
     string_set_value =
       option_of_yojson (value_for_key string_list_of_yojson "stringSetValue") _list path;
   }
    : resource)

let resources_of_yojson tree path = list_of_yojson resource_of_yojson tree path

let version_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agent_version = option_of_yojson (value_for_key string__of_yojson "agentVersion") _list path;
     agent_hash = option_of_yojson (value_for_key string__of_yojson "agentHash") _list path;
     docker_version = option_of_yojson (value_for_key string__of_yojson "dockerVersion") _list path;
   }
    : version_info)

let container_instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_instance_arn =
       option_of_yojson (value_for_key string__of_yojson "containerInstanceArn") _list path;
     ec2_instance_id = option_of_yojson (value_for_key string__of_yojson "ec2InstanceId") _list path;
     capacity_provider_name =
       option_of_yojson (value_for_key string__of_yojson "capacityProviderName") _list path;
     version = option_of_yojson (value_for_key long_of_yojson "version") _list path;
     version_info = option_of_yojson (value_for_key version_info_of_yojson "versionInfo") _list path;
     remaining_resources =
       option_of_yojson (value_for_key resources_of_yojson "remainingResources") _list path;
     registered_resources =
       option_of_yojson (value_for_key resources_of_yojson "registeredResources") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
     agent_connected =
       option_of_yojson (value_for_key boolean__of_yojson "agentConnected") _list path;
     running_tasks_count =
       option_of_yojson (value_for_key integer_of_yojson "runningTasksCount") _list path;
     pending_tasks_count =
       option_of_yojson (value_for_key integer_of_yojson "pendingTasksCount") _list path;
     agent_update_status =
       option_of_yojson (value_for_key agent_update_status_of_yojson "agentUpdateStatus") _list path;
     attributes = option_of_yojson (value_for_key attributes_of_yojson "attributes") _list path;
     registered_at = option_of_yojson (value_for_key timestamp_of_yojson "registeredAt") _list path;
     attachments = option_of_yojson (value_for_key attachments_of_yojson "attachments") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     health_status =
       option_of_yojson
         (value_for_key container_instance_health_status_of_yojson "healthStatus")
         _list path;
   }
    : container_instance)

let container_instance_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "TAGS" -> TAGS
    | `String "CONTAINER_INSTANCE_HEALTH" -> CONTAINER_INSTANCE_HEALTH
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerInstanceField" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerInstanceField")
     : container_instance_field)
    : container_instance_field)

let container_instance_field_list_of_yojson tree path =
  list_of_yojson container_instance_field_of_yojson tree path

let container_instance_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "DRAINING" -> DRAINING
    | `String "REGISTERING" -> REGISTERING
    | `String "DEREGISTERING" -> DEREGISTERING
    | `String "REGISTRATION_FAILED" -> REGISTRATION_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerInstanceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerInstanceStatus")
     : container_instance_status)
    : container_instance_status)

let container_instances_of_yojson tree path = list_of_yojson container_instance_of_yojson tree path

let container_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     command = option_of_yojson (value_for_key string_list_of_yojson "command") _list path;
     environment =
       option_of_yojson (value_for_key environment_variables_of_yojson "environment") _list path;
     environment_files =
       option_of_yojson (value_for_key environment_files_of_yojson "environmentFiles") _list path;
     cpu = option_of_yojson (value_for_key boxed_integer_of_yojson "cpu") _list path;
     memory = option_of_yojson (value_for_key boxed_integer_of_yojson "memory") _list path;
     memory_reservation =
       option_of_yojson (value_for_key boxed_integer_of_yojson "memoryReservation") _list path;
     resource_requirements =
       option_of_yojson
         (value_for_key resource_requirements_of_yojson "resourceRequirements")
         _list path;
   }
    : container_override)

let container_overrides_of_yojson tree path = list_of_yojson container_override_of_yojson tree path

let container_state_change_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name = option_of_yojson (value_for_key string__of_yojson "containerName") _list path;
     image_digest = option_of_yojson (value_for_key string__of_yojson "imageDigest") _list path;
     runtime_id = option_of_yojson (value_for_key string__of_yojson "runtimeId") _list path;
     exit_code = option_of_yojson (value_for_key boxed_integer_of_yojson "exitCode") _list path;
     network_bindings =
       option_of_yojson (value_for_key network_bindings_of_yojson "networkBindings") _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "reason") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
   }
    : container_state_change)

let container_state_changes_of_yojson tree path =
  list_of_yojson container_state_change_of_yojson tree path

let containers_of_yojson tree path = list_of_yojson container_of_yojson tree path

let update_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : update_in_progress_exception)

let create_capacity_provider_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_provider =
       option_of_yojson (value_for_key capacity_provider_of_yojson "capacityProvider") _list path;
   }
    : create_capacity_provider_response)

let create_managed_instances_provider_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     infrastructure_role_arn = value_for_key string__of_yojson "infrastructureRoleArn" _list path;
     instance_launch_template =
       value_for_key instance_launch_template_of_yojson "instanceLaunchTemplate" _list path;
     propagate_tags =
       option_of_yojson (value_for_key propagate_mi_tags_of_yojson "propagateTags") _list path;
     infrastructure_optimization =
       option_of_yojson
         (value_for_key infrastructure_optimization_of_yojson "infrastructureOptimization")
         _list path;
     auto_repair_configuration =
       option_of_yojson
         (value_for_key auto_repair_configuration_of_yojson "autoRepairConfiguration")
         _list path;
   }
    : create_managed_instances_provider_configuration)

let create_capacity_provider_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key string__of_yojson "name" _list path;
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     auto_scaling_group_provider =
       option_of_yojson
         (value_for_key auto_scaling_group_provider_of_yojson "autoScalingGroupProvider")
         _list path;
     managed_instances_provider =
       option_of_yojson
         (value_for_key create_managed_instances_provider_configuration_of_yojson
            "managedInstancesProvider")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : create_capacity_provider_request)

let create_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "cluster") _list path }
    : create_cluster_response)

let create_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_name = option_of_yojson (value_for_key string__of_yojson "clusterName") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     settings = option_of_yojson (value_for_key cluster_settings_of_yojson "settings") _list path;
     configuration =
       option_of_yojson (value_for_key cluster_configuration_of_yojson "configuration") _list path;
     capacity_providers =
       option_of_yojson (value_for_key string_list_of_yojson "capacityProviders") _list path;
     default_capacity_provider_strategy =
       option_of_yojson
         (value_for_key capacity_provider_strategy_of_yojson "defaultCapacityProviderStrategy")
         _list path;
     service_connect_defaults =
       option_of_yojson
         (value_for_key cluster_service_connect_defaults_request_of_yojson "serviceConnectDefaults")
         _list path;
   }
    : create_cluster_request)

let platform_unknown_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : platform_unknown_exception)

let daemon_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "DaemonStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DaemonStatus")
     : daemon_status)
    : daemon_status)

let create_daemon_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_arn = option_of_yojson (value_for_key string__of_yojson "daemonArn") _list path;
     status = option_of_yojson (value_for_key daemon_status_of_yojson "status") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     deployment_arn = option_of_yojson (value_for_key string__of_yojson "deploymentArn") _list path;
   }
    : create_daemon_response)

let daemon_propagate_tags_of_yojson (tree : t) path =
  ((match tree with
    | `String "DAEMON" -> DAEMON
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DaemonPropagateTags" value)
    | _ -> raise (deserialize_wrong_type_error path "DaemonPropagateTags")
     : daemon_propagate_tags)
    : daemon_propagate_tags)

let daemon_alarm_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alarm_names = option_of_yojson (value_for_key string_list_of_yojson "alarmNames") _list path;
     enable = option_of_yojson (value_for_key boolean__of_yojson "enable") _list path;
   }
    : daemon_alarm_configuration)

let daemon_drain_percent_of_yojson = double_of_yojson

let daemon_deployment_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     drain_percent =
       option_of_yojson (value_for_key daemon_drain_percent_of_yojson "drainPercent") _list path;
     alarms =
       option_of_yojson (value_for_key daemon_alarm_configuration_of_yojson "alarms") _list path;
     bake_time_in_minutes =
       option_of_yojson (value_for_key integer_of_yojson "bakeTimeInMinutes") _list path;
   }
    : daemon_deployment_configuration)

let create_daemon_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_name = value_for_key string__of_yojson "daemonName" _list path;
     cluster_arn = option_of_yojson (value_for_key string__of_yojson "clusterArn") _list path;
     daemon_task_definition_arn =
       value_for_key string__of_yojson "daemonTaskDefinitionArn" _list path;
     capacity_provider_arns = value_for_key string_list_of_yojson "capacityProviderArns" _list path;
     deployment_configuration =
       option_of_yojson
         (value_for_key daemon_deployment_configuration_of_yojson "deploymentConfiguration")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     propagate_tags =
       option_of_yojson (value_for_key daemon_propagate_tags_of_yojson "propagateTags") _list path;
     enable_ecs_managed_tags =
       option_of_yojson (value_for_key boolean__of_yojson "enableECSManagedTags") _list path;
     enable_execute_command =
       option_of_yojson (value_for_key boolean__of_yojson "enableExecuteCommand") _list path;
     client_token = option_of_yojson (value_for_key string__of_yojson "clientToken") _list path;
   }
    : create_daemon_request)

let platform_task_definition_incompatibility_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : platform_task_definition_incompatibility_exception)

let ingress_path_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_type = value_for_key access_type_of_yojson "accessType" _list path;
     endpoint = value_for_key string__of_yojson "endpoint" _list path;
   }
    : ingress_path_summary)

let ingress_path_summaries_of_yojson tree path =
  list_of_yojson ingress_path_summary_of_yojson tree path

let express_gateway_service_scaling_metric_of_yojson (tree : t) path =
  ((match tree with
    | `String "AVERAGE_CPU" -> AverageCPUUtilization
    | `String "AVERAGE_MEMORY" -> AverageMemoryUtilization
    | `String "REQUEST_COUNT_PER_TARGET" -> RequestCountPerTarget
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExpressGatewayServiceScalingMetric" value)
    | _ -> raise (deserialize_wrong_type_error path "ExpressGatewayServiceScalingMetric")
     : express_gateway_service_scaling_metric)
    : express_gateway_service_scaling_metric)

let express_gateway_scaling_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min_task_count =
       option_of_yojson (value_for_key boxed_integer_of_yojson "minTaskCount") _list path;
     max_task_count =
       option_of_yojson (value_for_key boxed_integer_of_yojson "maxTaskCount") _list path;
     auto_scaling_metric =
       option_of_yojson
         (value_for_key express_gateway_service_scaling_metric_of_yojson "autoScalingMetric")
         _list path;
     auto_scaling_target_value =
       option_of_yojson (value_for_key boxed_integer_of_yojson "autoScalingTargetValue") _list path;
   }
    : express_gateway_scaling_target)

let express_gateway_repository_credentials_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     credentials_parameter =
       option_of_yojson (value_for_key string__of_yojson "credentialsParameter") _list path;
   }
    : express_gateway_repository_credentials)

let express_gateway_service_aws_logs_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group = value_for_key string__of_yojson "logGroup" _list path;
     log_stream_prefix = value_for_key string__of_yojson "logStreamPrefix" _list path;
   }
    : express_gateway_service_aws_logs_configuration)

let express_gateway_container_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image = value_for_key string__of_yojson "image" _list path;
     container_port =
       option_of_yojson (value_for_key boxed_integer_of_yojson "containerPort") _list path;
     aws_logs_configuration =
       option_of_yojson
         (value_for_key express_gateway_service_aws_logs_configuration_of_yojson
            "awsLogsConfiguration")
         _list path;
     repository_credentials =
       option_of_yojson
         (value_for_key express_gateway_repository_credentials_of_yojson "repositoryCredentials")
         _list path;
     command = option_of_yojson (value_for_key string_list_of_yojson "command") _list path;
     environment =
       option_of_yojson (value_for_key environment_variables_of_yojson "environment") _list path;
     secrets = option_of_yojson (value_for_key secret_list_of_yojson "secrets") _list path;
   }
    : express_gateway_container)

let express_gateway_service_network_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_groups =
       option_of_yojson (value_for_key string_list_of_yojson "securityGroups") _list path;
     subnets = option_of_yojson (value_for_key string_list_of_yojson "subnets") _list path;
   }
    : express_gateway_service_network_configuration)

let express_gateway_service_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_revision_arn =
       option_of_yojson (value_for_key string__of_yojson "serviceRevisionArn") _list path;
     execution_role_arn =
       option_of_yojson (value_for_key string__of_yojson "executionRoleArn") _list path;
     task_role_arn = option_of_yojson (value_for_key string__of_yojson "taskRoleArn") _list path;
     task_definition_arn =
       option_of_yojson (value_for_key string__of_yojson "taskDefinitionArn") _list path;
     cpu = option_of_yojson (value_for_key string__of_yojson "cpu") _list path;
     memory = option_of_yojson (value_for_key string__of_yojson "memory") _list path;
     network_configuration =
       option_of_yojson
         (value_for_key express_gateway_service_network_configuration_of_yojson
            "networkConfiguration")
         _list path;
     health_check_path =
       option_of_yojson (value_for_key string__of_yojson "healthCheckPath") _list path;
     primary_container =
       option_of_yojson
         (value_for_key express_gateway_container_of_yojson "primaryContainer")
         _list path;
     scaling_target =
       option_of_yojson
         (value_for_key express_gateway_scaling_target_of_yojson "scalingTarget")
         _list path;
     ingress_paths =
       option_of_yojson (value_for_key ingress_path_summaries_of_yojson "ingressPaths") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
   }
    : express_gateway_service_configuration)

let express_gateway_service_configurations_of_yojson tree path =
  list_of_yojson express_gateway_service_configuration_of_yojson tree path

let express_gateway_service_status_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "DRAINING" -> DRAINING
    | `String "INACTIVE" -> INACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExpressGatewayServiceStatusCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ExpressGatewayServiceStatusCode")
     : express_gateway_service_status_code)
    : express_gateway_service_status_code)

let express_gateway_service_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_code =
       option_of_yojson
         (value_for_key express_gateway_service_status_code_of_yojson "statusCode")
         _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
   }
    : express_gateway_service_status)

let ecs_express_gateway_service_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     service_name = option_of_yojson (value_for_key string__of_yojson "serviceName") _list path;
     service_arn = option_of_yojson (value_for_key string__of_yojson "serviceArn") _list path;
     infrastructure_role_arn =
       option_of_yojson (value_for_key string__of_yojson "infrastructureRoleArn") _list path;
     status =
       option_of_yojson (value_for_key express_gateway_service_status_of_yojson "status") _list path;
     current_deployment =
       option_of_yojson (value_for_key string__of_yojson "currentDeployment") _list path;
     active_configurations =
       option_of_yojson
         (value_for_key express_gateway_service_configurations_of_yojson "activeConfigurations")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
   }
    : ecs_express_gateway_service)

let create_express_gateway_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service =
       option_of_yojson (value_for_key ecs_express_gateway_service_of_yojson "service") _list path;
   }
    : create_express_gateway_service_response)

let create_express_gateway_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_role_arn =
       option_of_yojson (value_for_key string__of_yojson "executionRoleArn") _list path;
     infrastructure_role_arn = value_for_key string__of_yojson "infrastructureRoleArn" _list path;
     service_name = option_of_yojson (value_for_key string__of_yojson "serviceName") _list path;
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     health_check_path =
       option_of_yojson (value_for_key string__of_yojson "healthCheckPath") _list path;
     primary_container =
       option_of_yojson
         (value_for_key express_gateway_container_of_yojson "primaryContainer")
         _list path;
     task_role_arn = option_of_yojson (value_for_key string__of_yojson "taskRoleArn") _list path;
     network_configuration =
       option_of_yojson
         (value_for_key express_gateway_service_network_configuration_of_yojson
            "networkConfiguration")
         _list path;
     cpu = option_of_yojson (value_for_key string__of_yojson "cpu") _list path;
     memory = option_of_yojson (value_for_key string__of_yojson "memory") _list path;
     scaling_target =
       option_of_yojson
         (value_for_key express_gateway_scaling_target_of_yojson "scalingTarget")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     task_definition_arn =
       option_of_yojson (value_for_key string__of_yojson "taskDefinitionArn") _list path;
   }
    : create_express_gateway_service_request)

let resource_management_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOMER" -> CUSTOMER
    | `String "ECS" -> ECS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResourceManagementType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceManagementType")
     : resource_management_type)
    : resource_management_type)

let propagate_tags_of_yojson (tree : t) path =
  ((match tree with
    | `String "TASK_DEFINITION" -> TASK_DEFINITION
    | `String "SERVICE" -> SERVICE
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "PropagateTags" value)
    | _ -> raise (deserialize_wrong_type_error path "PropagateTags")
     : propagate_tags)
    : propagate_tags)

let deployment_controller_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ECS" -> ECS
    | `String "CODE_DEPLOY" -> CODE_DEPLOY
    | `String "EXTERNAL" -> EXTERNAL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeploymentControllerType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentControllerType")
     : deployment_controller_type)
    : deployment_controller_type)

let deployment_controller_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ type_ = value_for_key deployment_controller_type_of_yojson "type" _list path }
    : deployment_controller)

let scheduling_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "REPLICA" -> REPLICA
    | `String "DAEMON" -> DAEMON
    | `String value -> raise (deserialize_unknown_enum_value_error path "SchedulingStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "SchedulingStrategy")
     : scheduling_strategy)
    : scheduling_strategy)

let network_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     awsvpc_configuration =
       option_of_yojson
         (value_for_key aws_vpc_configuration_of_yojson "awsvpcConfiguration")
         _list path;
   }
    : network_configuration)

let placement_strategy_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "random" -> RANDOM
    | `String "spread" -> SPREAD
    | `String "binpack" -> BINPACK
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PlacementStrategyType" value)
    | _ -> raise (deserialize_wrong_type_error path "PlacementStrategyType")
     : placement_strategy_type)
    : placement_strategy_type)

let placement_strategy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key placement_strategy_type_of_yojson "type") _list path;
     field = option_of_yojson (value_for_key string__of_yojson "field") _list path;
   }
    : placement_strategy)

let placement_strategies_of_yojson tree path = list_of_yojson placement_strategy_of_yojson tree path

let placement_constraint_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "distinctInstance" -> DISTINCT_INSTANCE
    | `String "memberOf" -> MEMBER_OF
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PlacementConstraintType" value)
    | _ -> raise (deserialize_wrong_type_error path "PlacementConstraintType")
     : placement_constraint_type)
    : placement_constraint_type)

let placement_constraint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key placement_constraint_type_of_yojson "type") _list path;
     expression = option_of_yojson (value_for_key string__of_yojson "expression") _list path;
   }
    : placement_constraint)

let placement_constraints_of_yojson tree path =
  list_of_yojson placement_constraint_of_yojson tree path

let service_current_revision_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     requested_task_count =
       option_of_yojson (value_for_key integer_of_yojson "requestedTaskCount") _list path;
     running_task_count =
       option_of_yojson (value_for_key integer_of_yojson "runningTaskCount") _list path;
     pending_task_count =
       option_of_yojson (value_for_key integer_of_yojson "pendingTaskCount") _list path;
   }
    : service_current_revision_summary)

let service_current_revision_summary_list_of_yojson tree path =
  list_of_yojson service_current_revision_summary_of_yojson tree path

let service_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key string__of_yojson "id") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : service_event)

let service_events_of_yojson tree path = list_of_yojson service_event_of_yojson tree path
let iam_role_arn_of_yojson = string_of_yojson

let vpc_lattice_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn = value_for_key iam_role_arn_of_yojson "roleArn" _list path;
     target_group_arn = value_for_key string__of_yojson "targetGroupArn" _list path;
     port_name = value_for_key string__of_yojson "portName" _list path;
   }
    : vpc_lattice_configuration)

let vpc_lattice_configurations_of_yojson tree path =
  list_of_yojson vpc_lattice_configuration_of_yojson tree path

let deployment_ephemeral_storage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ kms_key_id = option_of_yojson (value_for_key string__of_yojson "kmsKeyId") _list path }
    : deployment_ephemeral_storage)

let task_filesystem_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ext3" -> EXT3
    | `String "ext4" -> EXT4
    | `String "xfs" -> XFS
    | `String "ntfs" -> NTFS
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaskFilesystemType" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskFilesystemType")
     : task_filesystem_type)
    : task_filesystem_type)

let ebs_resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "volume" -> VOLUME
    | `String value -> raise (deserialize_unknown_enum_value_error path "EBSResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "EBSResourceType")
     : ebs_resource_type)
    : ebs_resource_type)

let ebs_tag_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key ebs_resource_type_of_yojson "resourceType" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     propagate_tags =
       option_of_yojson (value_for_key propagate_tags_of_yojson "propagateTags") _list path;
   }
    : ebs_tag_specification)

let ebs_tag_specifications_of_yojson tree path =
  list_of_yojson ebs_tag_specification_of_yojson tree path

let ebs_snapshot_id_of_yojson = string_of_yojson
let ebs_volume_type_of_yojson = string_of_yojson
let ebskms_key_id_of_yojson = string_of_yojson

let service_managed_ebs_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encrypted = option_of_yojson (value_for_key boxed_boolean_of_yojson "encrypted") _list path;
     kms_key_id = option_of_yojson (value_for_key ebskms_key_id_of_yojson "kmsKeyId") _list path;
     volume_type =
       option_of_yojson (value_for_key ebs_volume_type_of_yojson "volumeType") _list path;
     size_in_gi_b = option_of_yojson (value_for_key boxed_integer_of_yojson "sizeInGiB") _list path;
     snapshot_id =
       option_of_yojson (value_for_key ebs_snapshot_id_of_yojson "snapshotId") _list path;
     volume_initialization_rate =
       option_of_yojson
         (value_for_key boxed_integer_of_yojson "volumeInitializationRate")
         _list path;
     iops = option_of_yojson (value_for_key boxed_integer_of_yojson "iops") _list path;
     throughput = option_of_yojson (value_for_key boxed_integer_of_yojson "throughput") _list path;
     tag_specifications =
       option_of_yojson
         (value_for_key ebs_tag_specifications_of_yojson "tagSpecifications")
         _list path;
     role_arn = value_for_key iam_role_arn_of_yojson "roleArn" _list path;
     filesystem_type =
       option_of_yojson (value_for_key task_filesystem_type_of_yojson "filesystemType") _list path;
   }
    : service_managed_ebs_volume_configuration)

let ecs_volume_name_of_yojson = string_of_yojson

let service_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key ecs_volume_name_of_yojson "name" _list path;
     managed_ebs_volume =
       option_of_yojson
         (value_for_key service_managed_ebs_volume_configuration_of_yojson "managedEBSVolume")
         _list path;
   }
    : service_volume_configuration)

let service_volume_configurations_of_yojson tree path =
  list_of_yojson service_volume_configuration_of_yojson tree path

let service_connect_service_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     discovery_name = option_of_yojson (value_for_key string__of_yojson "discoveryName") _list path;
     discovery_arn = option_of_yojson (value_for_key string__of_yojson "discoveryArn") _list path;
   }
    : service_connect_service_resource)

let service_connect_service_resource_list_of_yojson tree path =
  list_of_yojson service_connect_service_resource_of_yojson tree path

let service_connect_include_query_parameters_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ServiceConnectIncludeQueryParameters" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceConnectIncludeQueryParameters")
     : service_connect_include_query_parameters)
    : service_connect_include_query_parameters)

let service_connect_access_logging_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "TEXT" -> TEXT
    | `String "JSON" -> JSON
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ServiceConnectAccessLoggingFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceConnectAccessLoggingFormat")
     : service_connect_access_logging_format)
    : service_connect_access_logging_format)

let service_connect_access_log_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     format = value_for_key service_connect_access_logging_format_of_yojson "format" _list path;
     include_query_parameters =
       option_of_yojson
         (value_for_key service_connect_include_query_parameters_of_yojson "includeQueryParameters")
         _list path;
   }
    : service_connect_access_log_configuration)

let service_connect_tls_certificate_authority_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_pca_authority_arn =
       option_of_yojson (value_for_key string__of_yojson "awsPcaAuthorityArn") _list path;
   }
    : service_connect_tls_certificate_authority)

let service_connect_tls_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     issuer_certificate_authority =
       value_for_key service_connect_tls_certificate_authority_of_yojson
         "issuerCertificateAuthority" _list path;
     kms_key = option_of_yojson (value_for_key string__of_yojson "kmsKey") _list path;
     role_arn = option_of_yojson (value_for_key string__of_yojson "roleArn") _list path;
   }
    : service_connect_tls_configuration)

let duration_of_yojson = int_of_yojson

let timeout_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idle_timeout_seconds =
       option_of_yojson (value_for_key duration_of_yojson "idleTimeoutSeconds") _list path;
     per_request_timeout_seconds =
       option_of_yojson (value_for_key duration_of_yojson "perRequestTimeoutSeconds") _list path;
   }
    : timeout_configuration)

let port_number_of_yojson = int_of_yojson

let service_connect_test_traffic_header_match_rules_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ exact = value_for_key string__of_yojson "exact" _list path }
    : service_connect_test_traffic_header_match_rules)

let service_connect_test_traffic_header_rules_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key string__of_yojson "name" _list path;
     value =
       option_of_yojson
         (value_for_key service_connect_test_traffic_header_match_rules_of_yojson "value")
         _list path;
   }
    : service_connect_test_traffic_header_rules)

let service_connect_test_traffic_rules_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     header = value_for_key service_connect_test_traffic_header_rules_of_yojson "header" _list path;
   }
    : service_connect_test_traffic_rules)

let service_connect_client_alias_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     port = value_for_key port_number_of_yojson "port" _list path;
     dns_name = option_of_yojson (value_for_key string__of_yojson "dnsName") _list path;
     test_traffic_rules =
       option_of_yojson
         (value_for_key service_connect_test_traffic_rules_of_yojson "testTrafficRules")
         _list path;
   }
    : service_connect_client_alias)

let service_connect_client_alias_list_of_yojson tree path =
  list_of_yojson service_connect_client_alias_of_yojson tree path

let service_connect_service_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     port_name = value_for_key string__of_yojson "portName" _list path;
     discovery_name = option_of_yojson (value_for_key string__of_yojson "discoveryName") _list path;
     client_aliases =
       option_of_yojson
         (value_for_key service_connect_client_alias_list_of_yojson "clientAliases")
         _list path;
     ingress_port_override =
       option_of_yojson (value_for_key port_number_of_yojson "ingressPortOverride") _list path;
     timeout = option_of_yojson (value_for_key timeout_configuration_of_yojson "timeout") _list path;
     tls =
       option_of_yojson (value_for_key service_connect_tls_configuration_of_yojson "tls") _list path;
   }
    : service_connect_service)

let service_connect_service_list_of_yojson tree path =
  list_of_yojson service_connect_service_of_yojson tree path

let service_connect_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled = value_for_key boolean__of_yojson "enabled" _list path;
     namespace = option_of_yojson (value_for_key string__of_yojson "namespace") _list path;
     services =
       option_of_yojson (value_for_key service_connect_service_list_of_yojson "services") _list path;
     log_configuration =
       option_of_yojson (value_for_key log_configuration_of_yojson "logConfiguration") _list path;
     access_log_configuration =
       option_of_yojson
         (value_for_key service_connect_access_log_configuration_of_yojson "accessLogConfiguration")
         _list path;
   }
    : service_connect_configuration)

let deployment_rollout_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeploymentRolloutState" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentRolloutState")
     : deployment_rollout_state)
    : deployment_rollout_state)

let launch_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EC2" -> EC2
    | `String "FARGATE" -> FARGATE
    | `String "EXTERNAL" -> EXTERNAL
    | `String "MANAGED_INSTANCES" -> MANAGED_INSTANCES
    | `String value -> raise (deserialize_unknown_enum_value_error path "LaunchType" value)
    | _ -> raise (deserialize_wrong_type_error path "LaunchType")
     : launch_type)
    : launch_type)

let deployment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key string__of_yojson "id") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     task_definition =
       option_of_yojson (value_for_key string__of_yojson "taskDefinition") _list path;
     desired_count = option_of_yojson (value_for_key integer_of_yojson "desiredCount") _list path;
     pending_count = option_of_yojson (value_for_key integer_of_yojson "pendingCount") _list path;
     running_count = option_of_yojson (value_for_key integer_of_yojson "runningCount") _list path;
     failed_tasks = option_of_yojson (value_for_key integer_of_yojson "failedTasks") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
     capacity_provider_strategy =
       option_of_yojson
         (value_for_key capacity_provider_strategy_of_yojson "capacityProviderStrategy")
         _list path;
     launch_type = option_of_yojson (value_for_key launch_type_of_yojson "launchType") _list path;
     platform_version =
       option_of_yojson (value_for_key string__of_yojson "platformVersion") _list path;
     platform_family =
       option_of_yojson (value_for_key string__of_yojson "platformFamily") _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "networkConfiguration")
         _list path;
     rollout_state =
       option_of_yojson (value_for_key deployment_rollout_state_of_yojson "rolloutState") _list path;
     rollout_state_reason =
       option_of_yojson (value_for_key string__of_yojson "rolloutStateReason") _list path;
     service_connect_configuration =
       option_of_yojson
         (value_for_key service_connect_configuration_of_yojson "serviceConnectConfiguration")
         _list path;
     service_connect_resources =
       option_of_yojson
         (value_for_key service_connect_service_resource_list_of_yojson "serviceConnectResources")
         _list path;
     volume_configurations =
       option_of_yojson
         (value_for_key service_volume_configurations_of_yojson "volumeConfigurations")
         _list path;
     fargate_ephemeral_storage =
       option_of_yojson
         (value_for_key deployment_ephemeral_storage_of_yojson "fargateEphemeralStorage")
         _list path;
     vpc_lattice_configurations =
       option_of_yojson
         (value_for_key vpc_lattice_configurations_of_yojson "vpcLatticeConfigurations")
         _list path;
   }
    : deployment)

let deployments_of_yojson tree path = list_of_yojson deployment_of_yojson tree path

let stability_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "STEADY_STATE" -> STEADY_STATE
    | `String "STABILIZING" -> STABILIZING
    | `String value -> raise (deserialize_unknown_enum_value_error path "StabilityStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "StabilityStatus")
     : stability_status)
    : stability_status)

let scale_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "PERCENT" -> PERCENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScaleUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "ScaleUnit")
     : scale_unit)
    : scale_unit)

let scale_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key double_of_yojson "value") _list path;
     unit_ = option_of_yojson (value_for_key scale_unit_of_yojson "unit") _list path;
   }
    : scale)

let service_registry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_arn = option_of_yojson (value_for_key string__of_yojson "registryArn") _list path;
     port = option_of_yojson (value_for_key boxed_integer_of_yojson "port") _list path;
     container_name = option_of_yojson (value_for_key string__of_yojson "containerName") _list path;
     container_port =
       option_of_yojson (value_for_key boxed_integer_of_yojson "containerPort") _list path;
   }
    : service_registry)

let service_registries_of_yojson tree path = list_of_yojson service_registry_of_yojson tree path

let load_balancer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_group_arn =
       option_of_yojson (value_for_key string__of_yojson "targetGroupArn") _list path;
     load_balancer_name =
       option_of_yojson (value_for_key string__of_yojson "loadBalancerName") _list path;
     container_name = option_of_yojson (value_for_key string__of_yojson "containerName") _list path;
     container_port =
       option_of_yojson (value_for_key boxed_integer_of_yojson "containerPort") _list path;
     advanced_configuration =
       option_of_yojson
         (value_for_key advanced_configuration_of_yojson "advancedConfiguration")
         _list path;
   }
    : load_balancer)

let load_balancers_of_yojson tree path = list_of_yojson load_balancer_of_yojson tree path

let task_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key string__of_yojson "id") _list path;
     task_set_arn = option_of_yojson (value_for_key string__of_yojson "taskSetArn") _list path;
     service_arn = option_of_yojson (value_for_key string__of_yojson "serviceArn") _list path;
     cluster_arn = option_of_yojson (value_for_key string__of_yojson "clusterArn") _list path;
     started_by = option_of_yojson (value_for_key string__of_yojson "startedBy") _list path;
     external_id = option_of_yojson (value_for_key string__of_yojson "externalId") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     task_definition =
       option_of_yojson (value_for_key string__of_yojson "taskDefinition") _list path;
     computed_desired_count =
       option_of_yojson (value_for_key integer_of_yojson "computedDesiredCount") _list path;
     pending_count = option_of_yojson (value_for_key integer_of_yojson "pendingCount") _list path;
     running_count = option_of_yojson (value_for_key integer_of_yojson "runningCount") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
     launch_type = option_of_yojson (value_for_key launch_type_of_yojson "launchType") _list path;
     capacity_provider_strategy =
       option_of_yojson
         (value_for_key capacity_provider_strategy_of_yojson "capacityProviderStrategy")
         _list path;
     platform_version =
       option_of_yojson (value_for_key string__of_yojson "platformVersion") _list path;
     platform_family =
       option_of_yojson (value_for_key string__of_yojson "platformFamily") _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "networkConfiguration")
         _list path;
     load_balancers =
       option_of_yojson (value_for_key load_balancers_of_yojson "loadBalancers") _list path;
     service_registries =
       option_of_yojson (value_for_key service_registries_of_yojson "serviceRegistries") _list path;
     scale = option_of_yojson (value_for_key scale_of_yojson "scale") _list path;
     stability_status =
       option_of_yojson (value_for_key stability_status_of_yojson "stabilityStatus") _list path;
     stability_status_at =
       option_of_yojson (value_for_key timestamp_of_yojson "stabilityStatusAt") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     fargate_ephemeral_storage =
       option_of_yojson
         (value_for_key deployment_ephemeral_storage_of_yojson "fargateEphemeralStorage")
         _list path;
   }
    : task_set)

let task_sets_of_yojson tree path = list_of_yojson task_set_of_yojson tree path

let linear_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     step_percent = option_of_yojson (value_for_key double_of_yojson "stepPercent") _list path;
     step_bake_time_in_minutes =
       option_of_yojson (value_for_key integer_of_yojson "stepBakeTimeInMinutes") _list path;
   }
    : linear_configuration)

let deployment_lifecycle_hook_duration_of_yojson = int_of_yojson

let deployment_lifecycle_hook_timeout_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_in_minutes =
       option_of_yojson
         (value_for_key deployment_lifecycle_hook_duration_of_yojson "timeoutInMinutes")
         _list path;
     action =
       option_of_yojson
         (value_for_key deployment_lifecycle_hook_action_of_yojson "action")
         _list path;
   }
    : deployment_lifecycle_hook_timeout_configuration)

let hook_details_of_yojson = json_of_yojson

let deployment_lifecycle_hook_stage_of_yojson (tree : t) path =
  ((match tree with
    | `String "RECONCILE_SERVICE" -> RECONCILE_SERVICE
    | `String "PRE_SCALE_UP" -> PRE_SCALE_UP
    | `String "POST_SCALE_UP" -> POST_SCALE_UP
    | `String "TEST_TRAFFIC_SHIFT" -> TEST_TRAFFIC_SHIFT
    | `String "POST_TEST_TRAFFIC_SHIFT" -> POST_TEST_TRAFFIC_SHIFT
    | `String "PRE_PRODUCTION_TRAFFIC_SHIFT" -> PRE_PRODUCTION_TRAFFIC_SHIFT
    | `String "PRODUCTION_TRAFFIC_SHIFT" -> PRODUCTION_TRAFFIC_SHIFT
    | `String "POST_PRODUCTION_TRAFFIC_SHIFT" -> POST_PRODUCTION_TRAFFIC_SHIFT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeploymentLifecycleHookStage" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentLifecycleHookStage")
     : deployment_lifecycle_hook_stage)
    : deployment_lifecycle_hook_stage)

let deployment_lifecycle_hook_stage_list_of_yojson tree path =
  list_of_yojson deployment_lifecycle_hook_stage_of_yojson tree path

let deployment_lifecycle_hook_target_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_LAMBDA" -> AWS_LAMBDA
    | `String "PAUSE" -> PAUSE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeploymentLifecycleHookTargetType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentLifecycleHookTargetType")
     : deployment_lifecycle_hook_target_type)
    : deployment_lifecycle_hook_target_type)

let deployment_lifecycle_hook_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_type =
       option_of_yojson
         (value_for_key deployment_lifecycle_hook_target_type_of_yojson "targetType")
         _list path;
     hook_target_arn = option_of_yojson (value_for_key string__of_yojson "hookTargetArn") _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "roleArn") _list path;
     lifecycle_stages =
       option_of_yojson
         (value_for_key deployment_lifecycle_hook_stage_list_of_yojson "lifecycleStages")
         _list path;
     hook_details = option_of_yojson (value_for_key hook_details_of_yojson "hookDetails") _list path;
     timeout_configuration =
       option_of_yojson
         (value_for_key deployment_lifecycle_hook_timeout_configuration_of_yojson
            "timeoutConfiguration")
         _list path;
   }
    : deployment_lifecycle_hook)

let deployment_lifecycle_hook_list_of_yojson tree path =
  list_of_yojson deployment_lifecycle_hook_of_yojson tree path

let deployment_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "ROLLING" -> ROLLING
    | `String "BLUE_GREEN" -> BLUE_GREEN
    | `String "LINEAR" -> LINEAR
    | `String "CANARY" -> CANARY
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeploymentStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentStrategy")
     : deployment_strategy)
    : deployment_strategy)

let deployment_alarms_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alarm_names = value_for_key string_list_of_yojson "alarmNames" _list path;
     rollback = value_for_key boolean__of_yojson "rollback" _list path;
     enable = value_for_key boolean__of_yojson "enable" _list path;
   }
    : deployment_alarms)

let threshold_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "COUNT" -> COUNT
    | `String "BOUNDED_PERCENT" -> BOUNDED_PERCENT
    | `String "UNBOUNDED_PERCENT" -> UNBOUNDED_PERCENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ThresholdType" value)
    | _ -> raise (deserialize_wrong_type_error path "ThresholdType")
     : threshold_type)
    : threshold_type)

let threshold_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key threshold_type_of_yojson "type" _list path;
     value = value_for_key integer_of_yojson "value" _list path;
   }
    : threshold_configuration)

let deployment_circuit_breaker_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable = value_for_key boolean__of_yojson "enable" _list path;
     rollback = value_for_key boolean__of_yojson "rollback" _list path;
     reset_on_healthy_task =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "resetOnHealthyTask") _list path;
     threshold_configuration =
       option_of_yojson
         (value_for_key threshold_configuration_of_yojson "thresholdConfiguration")
         _list path;
   }
    : deployment_circuit_breaker)

let deployment_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_circuit_breaker =
       option_of_yojson
         (value_for_key deployment_circuit_breaker_of_yojson "deploymentCircuitBreaker")
         _list path;
     maximum_percent =
       option_of_yojson (value_for_key boxed_integer_of_yojson "maximumPercent") _list path;
     minimum_healthy_percent =
       option_of_yojson (value_for_key boxed_integer_of_yojson "minimumHealthyPercent") _list path;
     alarms = option_of_yojson (value_for_key deployment_alarms_of_yojson "alarms") _list path;
     strategy = option_of_yojson (value_for_key deployment_strategy_of_yojson "strategy") _list path;
     bake_time_in_minutes =
       option_of_yojson (value_for_key boxed_integer_of_yojson "bakeTimeInMinutes") _list path;
     lifecycle_hooks =
       option_of_yojson
         (value_for_key deployment_lifecycle_hook_list_of_yojson "lifecycleHooks")
         _list path;
     linear_configuration =
       option_of_yojson
         (value_for_key linear_configuration_of_yojson "linearConfiguration")
         _list path;
     canary_configuration =
       option_of_yojson
         (value_for_key canary_configuration_of_yojson "canaryConfiguration")
         _list path;
   }
    : deployment_configuration)

let service_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_arn = option_of_yojson (value_for_key string__of_yojson "serviceArn") _list path;
     service_name = option_of_yojson (value_for_key string__of_yojson "serviceName") _list path;
     cluster_arn = option_of_yojson (value_for_key string__of_yojson "clusterArn") _list path;
     load_balancers =
       option_of_yojson (value_for_key load_balancers_of_yojson "loadBalancers") _list path;
     service_registries =
       option_of_yojson (value_for_key service_registries_of_yojson "serviceRegistries") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     desired_count = option_of_yojson (value_for_key integer_of_yojson "desiredCount") _list path;
     running_count = option_of_yojson (value_for_key integer_of_yojson "runningCount") _list path;
     pending_count = option_of_yojson (value_for_key integer_of_yojson "pendingCount") _list path;
     launch_type = option_of_yojson (value_for_key launch_type_of_yojson "launchType") _list path;
     capacity_provider_strategy =
       option_of_yojson
         (value_for_key capacity_provider_strategy_of_yojson "capacityProviderStrategy")
         _list path;
     platform_version =
       option_of_yojson (value_for_key string__of_yojson "platformVersion") _list path;
     platform_family =
       option_of_yojson (value_for_key string__of_yojson "platformFamily") _list path;
     task_definition =
       option_of_yojson (value_for_key string__of_yojson "taskDefinition") _list path;
     deployment_configuration =
       option_of_yojson
         (value_for_key deployment_configuration_of_yojson "deploymentConfiguration")
         _list path;
     task_sets = option_of_yojson (value_for_key task_sets_of_yojson "taskSets") _list path;
     deployments = option_of_yojson (value_for_key deployments_of_yojson "deployments") _list path;
     role_arn = option_of_yojson (value_for_key string__of_yojson "roleArn") _list path;
     events = option_of_yojson (value_for_key service_events_of_yojson "events") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     current_service_deployment =
       option_of_yojson (value_for_key string__of_yojson "currentServiceDeployment") _list path;
     current_service_revisions =
       option_of_yojson
         (value_for_key service_current_revision_summary_list_of_yojson "currentServiceRevisions")
         _list path;
     placement_constraints =
       option_of_yojson
         (value_for_key placement_constraints_of_yojson "placementConstraints")
         _list path;
     placement_strategy =
       option_of_yojson
         (value_for_key placement_strategies_of_yojson "placementStrategy")
         _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "networkConfiguration")
         _list path;
     health_check_grace_period_seconds =
       option_of_yojson
         (value_for_key boxed_integer_of_yojson "healthCheckGracePeriodSeconds")
         _list path;
     scheduling_strategy =
       option_of_yojson
         (value_for_key scheduling_strategy_of_yojson "schedulingStrategy")
         _list path;
     deployment_controller =
       option_of_yojson
         (value_for_key deployment_controller_of_yojson "deploymentController")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     created_by = option_of_yojson (value_for_key string__of_yojson "createdBy") _list path;
     enable_ecs_managed_tags =
       option_of_yojson (value_for_key boolean__of_yojson "enableECSManagedTags") _list path;
     propagate_tags =
       option_of_yojson (value_for_key propagate_tags_of_yojson "propagateTags") _list path;
     enable_execute_command =
       option_of_yojson (value_for_key boolean__of_yojson "enableExecuteCommand") _list path;
     availability_zone_rebalancing =
       option_of_yojson
         (value_for_key availability_zone_rebalancing_of_yojson "availabilityZoneRebalancing")
         _list path;
     resource_management_type =
       option_of_yojson
         (value_for_key resource_management_type_of_yojson "resourceManagementType")
         _list path;
   }
    : service)

let create_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service = option_of_yojson (value_for_key service_of_yojson "service") _list path }
    : create_service_response)

let metric_resolution_seconds_of_yojson = int_of_yojson
let metric_name_of_yojson = string_of_yojson
let metric_names_list_of_yojson tree path = list_of_yojson metric_name_of_yojson tree path

let metric_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_names = value_for_key metric_names_list_of_yojson "metricNames" _list path;
     resolution_seconds =
       value_for_key metric_resolution_seconds_of_yojson "resolutionSeconds" _list path;
   }
    : metric_configuration)

let metric_configuration_list_of_yojson tree path =
  list_of_yojson metric_configuration_of_yojson tree path

let monitoring_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_configurations =
       option_of_yojson
         (value_for_key metric_configuration_list_of_yojson "metricConfigurations")
         _list path;
   }
    : monitoring_configuration)

let create_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     service_name = value_for_key string__of_yojson "serviceName" _list path;
     task_definition =
       option_of_yojson (value_for_key string__of_yojson "taskDefinition") _list path;
     availability_zone_rebalancing =
       option_of_yojson
         (value_for_key availability_zone_rebalancing_of_yojson "availabilityZoneRebalancing")
         _list path;
     load_balancers =
       option_of_yojson (value_for_key load_balancers_of_yojson "loadBalancers") _list path;
     service_registries =
       option_of_yojson (value_for_key service_registries_of_yojson "serviceRegistries") _list path;
     desired_count =
       option_of_yojson (value_for_key boxed_integer_of_yojson "desiredCount") _list path;
     client_token = option_of_yojson (value_for_key string__of_yojson "clientToken") _list path;
     launch_type = option_of_yojson (value_for_key launch_type_of_yojson "launchType") _list path;
     capacity_provider_strategy =
       option_of_yojson
         (value_for_key capacity_provider_strategy_of_yojson "capacityProviderStrategy")
         _list path;
     platform_version =
       option_of_yojson (value_for_key string__of_yojson "platformVersion") _list path;
     role = option_of_yojson (value_for_key string__of_yojson "role") _list path;
     deployment_configuration =
       option_of_yojson
         (value_for_key deployment_configuration_of_yojson "deploymentConfiguration")
         _list path;
     placement_constraints =
       option_of_yojson
         (value_for_key placement_constraints_of_yojson "placementConstraints")
         _list path;
     placement_strategy =
       option_of_yojson
         (value_for_key placement_strategies_of_yojson "placementStrategy")
         _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "networkConfiguration")
         _list path;
     health_check_grace_period_seconds =
       option_of_yojson
         (value_for_key boxed_integer_of_yojson "healthCheckGracePeriodSeconds")
         _list path;
     scheduling_strategy =
       option_of_yojson
         (value_for_key scheduling_strategy_of_yojson "schedulingStrategy")
         _list path;
     deployment_controller =
       option_of_yojson
         (value_for_key deployment_controller_of_yojson "deploymentController")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     enable_ecs_managed_tags =
       option_of_yojson (value_for_key boolean__of_yojson "enableECSManagedTags") _list path;
     propagate_tags =
       option_of_yojson (value_for_key propagate_tags_of_yojson "propagateTags") _list path;
     enable_execute_command =
       option_of_yojson (value_for_key boolean__of_yojson "enableExecuteCommand") _list path;
     service_connect_configuration =
       option_of_yojson
         (value_for_key service_connect_configuration_of_yojson "serviceConnectConfiguration")
         _list path;
     volume_configurations =
       option_of_yojson
         (value_for_key service_volume_configurations_of_yojson "volumeConfigurations")
         _list path;
     vpc_lattice_configurations =
       option_of_yojson
         (value_for_key vpc_lattice_configurations_of_yojson "vpcLatticeConfigurations")
         _list path;
     monitoring =
       option_of_yojson (value_for_key monitoring_configuration_of_yojson "monitoring") _list path;
   }
    : create_service_request)

let service_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : service_not_found_exception)

let service_not_active_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : service_not_active_exception)

let create_task_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_set = option_of_yojson (value_for_key task_set_of_yojson "taskSet") _list path }
    : create_task_set_response)

let create_task_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service = value_for_key string__of_yojson "service" _list path;
     cluster = value_for_key string__of_yojson "cluster" _list path;
     external_id = option_of_yojson (value_for_key string__of_yojson "externalId") _list path;
     task_definition = value_for_key string__of_yojson "taskDefinition" _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "networkConfiguration")
         _list path;
     load_balancers =
       option_of_yojson (value_for_key load_balancers_of_yojson "loadBalancers") _list path;
     service_registries =
       option_of_yojson (value_for_key service_registries_of_yojson "serviceRegistries") _list path;
     launch_type = option_of_yojson (value_for_key launch_type_of_yojson "launchType") _list path;
     capacity_provider_strategy =
       option_of_yojson
         (value_for_key capacity_provider_strategy_of_yojson "capacityProviderStrategy")
         _list path;
     platform_version =
       option_of_yojson (value_for_key string__of_yojson "platformVersion") _list path;
     scale = option_of_yojson (value_for_key scale_of_yojson "scale") _list path;
     client_token = option_of_yojson (value_for_key string__of_yojson "clientToken") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : create_task_set_request)

let created_at_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     before = option_of_yojson (value_for_key timestamp_of_yojson "before") _list path;
     after = option_of_yojson (value_for_key timestamp_of_yojson "after") _list path;
   }
    : created_at)

let daemon_capacity_provider_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     running_count = option_of_yojson (value_for_key integer_of_yojson "runningCount") _list path;
   }
    : daemon_capacity_provider)

let daemon_capacity_provider_list_of_yojson tree path =
  list_of_yojson daemon_capacity_provider_of_yojson tree path

let daemon_deployment_rollback_monitors_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "TRIGGERED" -> TRIGGERED
    | `String "MONITORING" -> MONITORING
    | `String "MONITORING_COMPLETE" -> MONITORING_COMPLETE
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "DaemonDeploymentRollbackMonitorsStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DaemonDeploymentRollbackMonitorsStatus")
     : daemon_deployment_rollback_monitors_status)
    : daemon_deployment_rollback_monitors_status)

let daemon_circuit_breaker_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_count = option_of_yojson (value_for_key integer_of_yojson "failureCount") _list path;
     status =
       option_of_yojson
         (value_for_key daemon_deployment_rollback_monitors_status_of_yojson "status")
         _list path;
     threshold = option_of_yojson (value_for_key integer_of_yojson "threshold") _list path;
   }
    : daemon_circuit_breaker)

let daemon_linux_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capabilities =
       option_of_yojson (value_for_key kernel_capabilities_of_yojson "capabilities") _list path;
     devices = option_of_yojson (value_for_key devices_list_of_yojson "devices") _list path;
     init_process_enabled =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "initProcessEnabled") _list path;
     tmpfs = option_of_yojson (value_for_key tmpfs_list_of_yojson "tmpfs") _list path;
   }
    : daemon_linux_parameters)

let daemon_container_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     image = value_for_key string__of_yojson "image" _list path;
     memory = option_of_yojson (value_for_key boxed_integer_of_yojson "memory") _list path;
     memory_reservation =
       option_of_yojson (value_for_key boxed_integer_of_yojson "memoryReservation") _list path;
     repository_credentials =
       option_of_yojson
         (value_for_key repository_credentials_of_yojson "repositoryCredentials")
         _list path;
     health_check = option_of_yojson (value_for_key health_check_of_yojson "healthCheck") _list path;
     cpu = option_of_yojson (value_for_key integer_of_yojson "cpu") _list path;
     essential = option_of_yojson (value_for_key boxed_boolean_of_yojson "essential") _list path;
     entry_point = option_of_yojson (value_for_key string_list_of_yojson "entryPoint") _list path;
     command = option_of_yojson (value_for_key string_list_of_yojson "command") _list path;
     working_directory =
       option_of_yojson (value_for_key string__of_yojson "workingDirectory") _list path;
     environment_files =
       option_of_yojson (value_for_key environment_files_of_yojson "environmentFiles") _list path;
     environment =
       option_of_yojson (value_for_key environment_variables_of_yojson "environment") _list path;
     secrets = option_of_yojson (value_for_key secret_list_of_yojson "secrets") _list path;
     readonly_root_filesystem =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "readonlyRootFilesystem") _list path;
     mount_points =
       option_of_yojson (value_for_key mount_point_list_of_yojson "mountPoints") _list path;
     log_configuration =
       option_of_yojson (value_for_key log_configuration_of_yojson "logConfiguration") _list path;
     firelens_configuration =
       option_of_yojson
         (value_for_key firelens_configuration_of_yojson "firelensConfiguration")
         _list path;
     privileged = option_of_yojson (value_for_key boxed_boolean_of_yojson "privileged") _list path;
     user = option_of_yojson (value_for_key string__of_yojson "user") _list path;
     ulimits = option_of_yojson (value_for_key ulimit_list_of_yojson "ulimits") _list path;
     linux_parameters =
       option_of_yojson
         (value_for_key daemon_linux_parameters_of_yojson "linuxParameters")
         _list path;
     depends_on =
       option_of_yojson (value_for_key container_dependencies_of_yojson "dependsOn") _list path;
     start_timeout =
       option_of_yojson (value_for_key boxed_integer_of_yojson "startTimeout") _list path;
     stop_timeout =
       option_of_yojson (value_for_key boxed_integer_of_yojson "stopTimeout") _list path;
     system_controls =
       option_of_yojson (value_for_key system_controls_of_yojson "systemControls") _list path;
     interactive = option_of_yojson (value_for_key boxed_boolean_of_yojson "interactive") _list path;
     pseudo_terminal =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "pseudoTerminal") _list path;
     restart_policy =
       option_of_yojson
         (value_for_key container_restart_policy_of_yojson "restartPolicy")
         _list path;
   }
    : daemon_container_definition)

let daemon_container_definition_list_of_yojson tree path =
  list_of_yojson daemon_container_definition_of_yojson tree path

let daemon_container_image_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name = option_of_yojson (value_for_key string__of_yojson "containerName") _list path;
     image_digest = option_of_yojson (value_for_key string__of_yojson "imageDigest") _list path;
     image = option_of_yojson (value_for_key string__of_yojson "image") _list path;
   }
    : daemon_container_image)

let daemon_container_images_of_yojson tree path =
  list_of_yojson daemon_container_image_of_yojson tree path

let daemon_rollback_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key string__of_yojson "reason") _list path;
     started_at = option_of_yojson (value_for_key timestamp_of_yojson "startedAt") _list path;
     rollback_target_daemon_revision_arn =
       option_of_yojson
         (value_for_key string__of_yojson "rollbackTargetDaemonRevisionArn")
         _list path;
     rollback_capacity_providers =
       option_of_yojson (value_for_key string_list_of_yojson "rollbackCapacityProviders") _list path;
   }
    : daemon_rollback)

let daemon_deployment_alarms_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson
         (value_for_key daemon_deployment_rollback_monitors_status_of_yojson "status")
         _list path;
     alarm_names = option_of_yojson (value_for_key string_list_of_yojson "alarmNames") _list path;
     triggered_alarm_names =
       option_of_yojson (value_for_key string_list_of_yojson "triggeredAlarmNames") _list path;
   }
    : daemon_deployment_alarms)

let daemon_deployment_capacity_provider_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     running_instance_count =
       option_of_yojson (value_for_key boxed_integer_of_yojson "runningInstanceCount") _list path;
     draining_instance_count =
       option_of_yojson (value_for_key boxed_integer_of_yojson "drainingInstanceCount") _list path;
   }
    : daemon_deployment_capacity_provider)

let daemon_deployment_capacity_provider_list_of_yojson tree path =
  list_of_yojson daemon_deployment_capacity_provider_of_yojson tree path

let daemon_deployment_revision_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     capacity_providers =
       option_of_yojson
         (value_for_key daemon_deployment_capacity_provider_list_of_yojson "capacityProviders")
         _list path;
     total_running_instance_count =
       option_of_yojson
         (value_for_key boxed_integer_of_yojson "totalRunningInstanceCount")
         _list path;
     total_draining_instance_count =
       option_of_yojson
         (value_for_key boxed_integer_of_yojson "totalDrainingInstanceCount")
         _list path;
   }
    : daemon_deployment_revision_detail)

let daemon_deployment_revision_detail_list_of_yojson tree path =
  list_of_yojson daemon_deployment_revision_detail_of_yojson tree path

let daemon_deployment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "SUCCESSFUL" -> SUCCESSFUL
    | `String "STOPPED" -> STOPPED
    | `String "STOP_REQUESTED" -> STOP_REQUESTED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "ROLLBACK_IN_PROGRESS" -> ROLLBACK_IN_PROGRESS
    | `String "ROLLBACK_SUCCESSFUL" -> ROLLBACK_SUCCESSFUL
    | `String "ROLLBACK_FAILED" -> ROLLBACK_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DaemonDeploymentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DaemonDeploymentStatus")
     : daemon_deployment_status)
    : daemon_deployment_status)

let daemon_deployment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_deployment_arn =
       option_of_yojson (value_for_key string__of_yojson "daemonDeploymentArn") _list path;
     cluster_arn = option_of_yojson (value_for_key string__of_yojson "clusterArn") _list path;
     status =
       option_of_yojson (value_for_key daemon_deployment_status_of_yojson "status") _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
     target_daemon_revision =
       option_of_yojson
         (value_for_key daemon_deployment_revision_detail_of_yojson "targetDaemonRevision")
         _list path;
     source_daemon_revisions =
       option_of_yojson
         (value_for_key daemon_deployment_revision_detail_list_of_yojson "sourceDaemonRevisions")
         _list path;
     circuit_breaker =
       option_of_yojson (value_for_key daemon_circuit_breaker_of_yojson "circuitBreaker") _list path;
     alarms =
       option_of_yojson (value_for_key daemon_deployment_alarms_of_yojson "alarms") _list path;
     rollback = option_of_yojson (value_for_key daemon_rollback_of_yojson "rollback") _list path;
     deployment_configuration =
       option_of_yojson
         (value_for_key daemon_deployment_configuration_of_yojson "deploymentConfiguration")
         _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     started_at = option_of_yojson (value_for_key timestamp_of_yojson "startedAt") _list path;
     stopped_at = option_of_yojson (value_for_key timestamp_of_yojson "stoppedAt") _list path;
     finished_at = option_of_yojson (value_for_key timestamp_of_yojson "finishedAt") _list path;
   }
    : daemon_deployment)

let daemon_deployment_list_of_yojson tree path =
  list_of_yojson daemon_deployment_of_yojson tree path

let daemon_deployment_status_list_of_yojson tree path =
  list_of_yojson daemon_deployment_status_of_yojson tree path

let daemon_deployment_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_deployment_arn =
       option_of_yojson (value_for_key string__of_yojson "daemonDeploymentArn") _list path;
     daemon_arn = option_of_yojson (value_for_key string__of_yojson "daemonArn") _list path;
     cluster_arn = option_of_yojson (value_for_key string__of_yojson "clusterArn") _list path;
     status =
       option_of_yojson (value_for_key daemon_deployment_status_of_yojson "status") _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
     target_daemon_revision_arn =
       option_of_yojson (value_for_key string__of_yojson "targetDaemonRevisionArn") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     started_at = option_of_yojson (value_for_key timestamp_of_yojson "startedAt") _list path;
     stopped_at = option_of_yojson (value_for_key timestamp_of_yojson "stoppedAt") _list path;
     finished_at = option_of_yojson (value_for_key timestamp_of_yojson "finishedAt") _list path;
   }
    : daemon_deployment_summary)

let daemon_deployment_summary_list_of_yojson tree path =
  list_of_yojson daemon_deployment_summary_of_yojson tree path

let daemon_revision_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     capacity_providers =
       option_of_yojson
         (value_for_key daemon_capacity_provider_list_of_yojson "capacityProviders")
         _list path;
     total_running_count =
       option_of_yojson (value_for_key integer_of_yojson "totalRunningCount") _list path;
   }
    : daemon_revision_detail)

let daemon_revision_detail_list_of_yojson tree path =
  list_of_yojson daemon_revision_detail_of_yojson tree path

let daemon_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_arn = option_of_yojson (value_for_key string__of_yojson "daemonArn") _list path;
     cluster_arn = option_of_yojson (value_for_key string__of_yojson "clusterArn") _list path;
     status = option_of_yojson (value_for_key daemon_status_of_yojson "status") _list path;
     current_revisions =
       option_of_yojson
         (value_for_key daemon_revision_detail_list_of_yojson "currentRevisions")
         _list path;
     deployment_arn = option_of_yojson (value_for_key string__of_yojson "deploymentArn") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
   }
    : daemon_detail)

let daemon_ipc_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "none" -> NONE
    | `String "shared" -> SHARED
    | `String value -> raise (deserialize_unknown_enum_value_error path "DaemonIpcMode" value)
    | _ -> raise (deserialize_wrong_type_error path "DaemonIpcMode")
     : daemon_ipc_mode)
    : daemon_ipc_mode)

let daemon_not_active_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : daemon_not_active_exception)

let daemon_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : daemon_not_found_exception)

let daemon_pid_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "none" -> NONE
    | `String "shared" -> SHARED
    | `String value -> raise (deserialize_unknown_enum_value_error path "DaemonPidMode" value)
    | _ -> raise (deserialize_wrong_type_error path "DaemonPidMode")
     : daemon_pid_mode)
    : daemon_pid_mode)

let daemon_revision_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_revision_arn =
       option_of_yojson (value_for_key string__of_yojson "daemonRevisionArn") _list path;
     cluster_arn = option_of_yojson (value_for_key string__of_yojson "clusterArn") _list path;
     daemon_arn = option_of_yojson (value_for_key string__of_yojson "daemonArn") _list path;
     daemon_task_definition_arn =
       option_of_yojson (value_for_key string__of_yojson "daemonTaskDefinitionArn") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     container_images =
       option_of_yojson
         (value_for_key daemon_container_images_of_yojson "containerImages")
         _list path;
     propagate_tags =
       option_of_yojson (value_for_key daemon_propagate_tags_of_yojson "propagateTags") _list path;
     enable_ecs_managed_tags =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "enableECSManagedTags") _list path;
     enable_execute_command =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "enableExecuteCommand") _list path;
   }
    : daemon_revision)

let daemon_revisions_of_yojson tree path = list_of_yojson daemon_revision_of_yojson tree path

let daemon_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_arn = option_of_yojson (value_for_key string__of_yojson "daemonArn") _list path;
     status = option_of_yojson (value_for_key daemon_status_of_yojson "status") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
   }
    : daemon_summary)

let daemon_summaries_list_of_yojson tree path = list_of_yojson daemon_summary_of_yojson tree path

let daemon_task_definition_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "DELETED" -> DELETED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DaemonTaskDefinitionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DaemonTaskDefinitionStatus")
     : daemon_task_definition_status)
    : daemon_task_definition_status)

let daemon_volume_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     host = option_of_yojson (value_for_key host_volume_properties_of_yojson "host") _list path;
   }
    : daemon_volume)

let daemon_volume_list_of_yojson tree path = list_of_yojson daemon_volume_of_yojson tree path

let daemon_task_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_task_definition_arn =
       option_of_yojson (value_for_key string__of_yojson "daemonTaskDefinitionArn") _list path;
     family = option_of_yojson (value_for_key string__of_yojson "family") _list path;
     revision = option_of_yojson (value_for_key integer_of_yojson "revision") _list path;
     task_role_arn = option_of_yojson (value_for_key string__of_yojson "taskRoleArn") _list path;
     execution_role_arn =
       option_of_yojson (value_for_key string__of_yojson "executionRoleArn") _list path;
     container_definitions =
       option_of_yojson
         (value_for_key daemon_container_definition_list_of_yojson "containerDefinitions")
         _list path;
     volumes = option_of_yojson (value_for_key daemon_volume_list_of_yojson "volumes") _list path;
     cpu = option_of_yojson (value_for_key string__of_yojson "cpu") _list path;
     memory = option_of_yojson (value_for_key string__of_yojson "memory") _list path;
     status =
       option_of_yojson (value_for_key daemon_task_definition_status_of_yojson "status") _list path;
     registered_at = option_of_yojson (value_for_key timestamp_of_yojson "registeredAt") _list path;
     delete_requested_at =
       option_of_yojson (value_for_key timestamp_of_yojson "deleteRequestedAt") _list path;
     registered_by = option_of_yojson (value_for_key string__of_yojson "registeredBy") _list path;
     pid_mode = option_of_yojson (value_for_key daemon_pid_mode_of_yojson "pidMode") _list path;
     ipc_mode = option_of_yojson (value_for_key daemon_ipc_mode_of_yojson "ipcMode") _list path;
   }
    : daemon_task_definition)

let daemon_task_definition_revision_filter_of_yojson (tree : t) path =
  ((match tree with
    | `String "LAST_REGISTERED" -> LAST_REGISTERED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DaemonTaskDefinitionRevisionFilter" value)
    | _ -> raise (deserialize_wrong_type_error path "DaemonTaskDefinitionRevisionFilter")
     : daemon_task_definition_revision_filter)
    : daemon_task_definition_revision_filter)

let daemon_task_definition_status_filter_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "ALL" -> ALL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DaemonTaskDefinitionStatusFilter" value)
    | _ -> raise (deserialize_wrong_type_error path "DaemonTaskDefinitionStatusFilter")
     : daemon_task_definition_status_filter)
    : daemon_task_definition_status_filter)

let daemon_task_definition_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     registered_at = option_of_yojson (value_for_key timestamp_of_yojson "registeredAt") _list path;
     registered_by = option_of_yojson (value_for_key string__of_yojson "registeredBy") _list path;
     delete_requested_at =
       option_of_yojson (value_for_key timestamp_of_yojson "deleteRequestedAt") _list path;
     status =
       option_of_yojson (value_for_key daemon_task_definition_status_of_yojson "status") _list path;
   }
    : daemon_task_definition_summary)

let daemon_task_definition_summaries_of_yojson tree path =
  list_of_yojson daemon_task_definition_summary_of_yojson tree path

let target_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : target_not_found_exception)

let delete_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ attributes = option_of_yojson (value_for_key attributes_of_yojson "attributes") _list path }
    : delete_attributes_response)

let delete_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     attributes = value_for_key attributes_of_yojson "attributes" _list path;
   }
    : delete_attributes_request)

let delete_capacity_provider_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_provider =
       option_of_yojson (value_for_key capacity_provider_of_yojson "capacityProvider") _list path;
   }
    : delete_capacity_provider_response)

let delete_capacity_provider_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_provider = value_for_key string__of_yojson "capacityProvider" _list path;
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
   }
    : delete_capacity_provider_request)

let delete_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "cluster") _list path }
    : delete_cluster_response)

let delete_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = value_for_key string__of_yojson "cluster" _list path } : delete_cluster_request)

let delete_daemon_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_arn = option_of_yojson (value_for_key string__of_yojson "daemonArn") _list path;
     status = option_of_yojson (value_for_key daemon_status_of_yojson "status") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
     deployment_arn = option_of_yojson (value_for_key string__of_yojson "deploymentArn") _list path;
   }
    : delete_daemon_response)

let delete_daemon_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ daemon_arn = value_for_key string__of_yojson "daemonArn" _list path } : delete_daemon_request)

let delete_daemon_task_definition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_task_definition_arn =
       option_of_yojson (value_for_key string__of_yojson "daemonTaskDefinitionArn") _list path;
   }
    : delete_daemon_task_definition_response)

let delete_daemon_task_definition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ daemon_task_definition = value_for_key string__of_yojson "daemonTaskDefinition" _list path }
    : delete_daemon_task_definition_request)

let delete_express_gateway_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service =
       option_of_yojson (value_for_key ecs_express_gateway_service_of_yojson "service") _list path;
   }
    : delete_express_gateway_service_response)

let delete_express_gateway_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_arn = value_for_key string__of_yojson "serviceArn" _list path }
    : delete_express_gateway_service_request)

let delete_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service = option_of_yojson (value_for_key service_of_yojson "service") _list path }
    : delete_service_response)

let delete_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     service = value_for_key string__of_yojson "service" _list path;
     force = option_of_yojson (value_for_key boxed_boolean_of_yojson "force") _list path;
   }
    : delete_service_request)

let failure_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "reason") _list path;
     detail = option_of_yojson (value_for_key string__of_yojson "detail") _list path;
   }
    : failure)

let failures_of_yojson tree path = list_of_yojson failure_of_yojson tree path
let task_definition_list_of_yojson tree path = list_of_yojson task_definition_of_yojson tree path

let delete_task_definitions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_definitions =
       option_of_yojson (value_for_key task_definition_list_of_yojson "taskDefinitions") _list path;
     failures = option_of_yojson (value_for_key failures_of_yojson "failures") _list path;
   }
    : delete_task_definitions_response)

let delete_task_definitions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_definitions = value_for_key string_list_of_yojson "taskDefinitions" _list path }
    : delete_task_definitions_request)

let task_set_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : task_set_not_found_exception)

let delete_task_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_set = option_of_yojson (value_for_key task_set_of_yojson "taskSet") _list path }
    : delete_task_set_response)

let delete_task_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = value_for_key string__of_yojson "cluster" _list path;
     service = value_for_key string__of_yojson "service" _list path;
     task_set = value_for_key string__of_yojson "taskSet" _list path;
     force = option_of_yojson (value_for_key boxed_boolean_of_yojson "force") _list path;
   }
    : delete_task_set_request)

let deployment_lifecycle_hook_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWAITING_ACTION" -> AWAITING_ACTION
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String "TIMED_OUT" -> TIMED_OUT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeploymentLifecycleHookStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentLifecycleHookStatus")
     : deployment_lifecycle_hook_status)
    : deployment_lifecycle_hook_status)

let deployment_lifecycle_hook_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hook_id = option_of_yojson (value_for_key string__of_yojson "hookId") _list path;
     target_type =
       option_of_yojson
         (value_for_key deployment_lifecycle_hook_target_type_of_yojson "targetType")
         _list path;
     target_arn = option_of_yojson (value_for_key string__of_yojson "targetArn") _list path;
     status =
       option_of_yojson
         (value_for_key deployment_lifecycle_hook_status_of_yojson "status")
         _list path;
     expires_at = option_of_yojson (value_for_key timestamp_of_yojson "expiresAt") _list path;
     timeout_action =
       option_of_yojson
         (value_for_key deployment_lifecycle_hook_action_of_yojson "timeoutAction")
         _list path;
   }
    : deployment_lifecycle_hook_detail)

let deployment_lifecycle_hook_detail_list_of_yojson tree path =
  list_of_yojson deployment_lifecycle_hook_detail_of_yojson tree path

let deregister_container_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_instance =
       option_of_yojson (value_for_key container_instance_of_yojson "containerInstance") _list path;
   }
    : deregister_container_instance_response)

let deregister_container_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     container_instance = value_for_key string__of_yojson "containerInstance" _list path;
     force = option_of_yojson (value_for_key boxed_boolean_of_yojson "force") _list path;
   }
    : deregister_container_instance_request)

let describe_capacity_providers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_providers =
       option_of_yojson (value_for_key capacity_providers_of_yojson "capacityProviders") _list path;
     failures = option_of_yojson (value_for_key failures_of_yojson "failures") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : describe_capacity_providers_response)

let describe_capacity_providers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_providers =
       option_of_yojson (value_for_key string_list_of_yojson "capacityProviders") _list path;
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     include_ =
       option_of_yojson (value_for_key capacity_provider_field_list_of_yojson "include") _list path;
     max_results = option_of_yojson (value_for_key boxed_integer_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : describe_capacity_providers_request)

let describe_clusters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     clusters = option_of_yojson (value_for_key clusters_of_yojson "clusters") _list path;
     failures = option_of_yojson (value_for_key failures_of_yojson "failures") _list path;
   }
    : describe_clusters_response)

let describe_clusters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     clusters = option_of_yojson (value_for_key string_list_of_yojson "clusters") _list path;
     include_ = option_of_yojson (value_for_key cluster_field_list_of_yojson "include") _list path;
   }
    : describe_clusters_request)

let describe_container_instances_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_instances =
       option_of_yojson
         (value_for_key container_instances_of_yojson "containerInstances")
         _list path;
     failures = option_of_yojson (value_for_key failures_of_yojson "failures") _list path;
   }
    : describe_container_instances_response)

let describe_container_instances_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     container_instances = value_for_key string_list_of_yojson "containerInstances" _list path;
     include_ =
       option_of_yojson (value_for_key container_instance_field_list_of_yojson "include") _list path;
   }
    : describe_container_instances_request)

let describe_daemon_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ daemon = option_of_yojson (value_for_key daemon_detail_of_yojson "daemon") _list path }
    : describe_daemon_response)

let describe_daemon_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ daemon_arn = value_for_key string__of_yojson "daemonArn" _list path }
    : describe_daemon_request)

let describe_daemon_deployments_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failures = option_of_yojson (value_for_key failures_of_yojson "failures") _list path;
     daemon_deployments =
       option_of_yojson
         (value_for_key daemon_deployment_list_of_yojson "daemonDeployments")
         _list path;
   }
    : describe_daemon_deployments_response)

let describe_daemon_deployments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_deployment_arns = value_for_key string_list_of_yojson "daemonDeploymentArns" _list path;
   }
    : describe_daemon_deployments_request)

let describe_daemon_revisions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_revisions =
       option_of_yojson (value_for_key daemon_revisions_of_yojson "daemonRevisions") _list path;
     failures = option_of_yojson (value_for_key failures_of_yojson "failures") _list path;
   }
    : describe_daemon_revisions_response)

let describe_daemon_revisions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ daemon_revision_arns = value_for_key string_list_of_yojson "daemonRevisionArns" _list path }
    : describe_daemon_revisions_request)

let describe_daemon_task_definition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_task_definition =
       option_of_yojson
         (value_for_key daemon_task_definition_of_yojson "daemonTaskDefinition")
         _list path;
   }
    : describe_daemon_task_definition_response)

let describe_daemon_task_definition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ daemon_task_definition = value_for_key string__of_yojson "daemonTaskDefinition" _list path }
    : describe_daemon_task_definition_request)

let describe_express_gateway_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service =
       option_of_yojson (value_for_key ecs_express_gateway_service_of_yojson "service") _list path;
   }
    : describe_express_gateway_service_response)

let express_gateway_service_include_of_yojson (tree : t) path =
  ((match tree with
    | `String "TAGS" -> TAGS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExpressGatewayServiceInclude" value)
    | _ -> raise (deserialize_wrong_type_error path "ExpressGatewayServiceInclude")
     : express_gateway_service_include)
    : express_gateway_service_include)

let express_gateway_service_include_list_of_yojson tree path =
  list_of_yojson express_gateway_service_include_of_yojson tree path

let describe_express_gateway_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_arn = value_for_key string__of_yojson "serviceArn" _list path;
     include_ =
       option_of_yojson
         (value_for_key express_gateway_service_include_list_of_yojson "include")
         _list path;
   }
    : describe_express_gateway_service_request)

let service_deployment_rollback_monitors_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "TRIGGERED" -> TRIGGERED
    | `String "MONITORING" -> MONITORING
    | `String "MONITORING_COMPLETE" -> MONITORING_COMPLETE
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ServiceDeploymentRollbackMonitorsStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceDeploymentRollbackMonitorsStatus")
     : service_deployment_rollback_monitors_status)
    : service_deployment_rollback_monitors_status)

let service_deployment_alarms_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson
         (value_for_key service_deployment_rollback_monitors_status_of_yojson "status")
         _list path;
     alarm_names = option_of_yojson (value_for_key string_list_of_yojson "alarmNames") _list path;
     triggered_alarm_names =
       option_of_yojson (value_for_key string_list_of_yojson "triggeredAlarmNames") _list path;
   }
    : service_deployment_alarms)

let service_deployment_circuit_breaker_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson
         (value_for_key service_deployment_rollback_monitors_status_of_yojson "status")
         _list path;
     failure_count = option_of_yojson (value_for_key integer_of_yojson "failureCount") _list path;
     threshold = option_of_yojson (value_for_key integer_of_yojson "threshold") _list path;
   }
    : service_deployment_circuit_breaker)

let rollback_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key string__of_yojson "reason") _list path;
     started_at = option_of_yojson (value_for_key timestamp_of_yojson "startedAt") _list path;
     service_revision_arn =
       option_of_yojson (value_for_key string__of_yojson "serviceRevisionArn") _list path;
   }
    : rollback)

let service_deployment_lifecycle_stage_of_yojson (tree : t) path =
  ((match tree with
    | `String "RECONCILE_SERVICE" -> RECONCILE_SERVICE
    | `String "PRE_SCALE_UP" -> PRE_SCALE_UP
    | `String "SCALE_UP" -> SCALE_UP
    | `String "POST_SCALE_UP" -> POST_SCALE_UP
    | `String "TEST_TRAFFIC_SHIFT" -> TEST_TRAFFIC_SHIFT
    | `String "POST_TEST_TRAFFIC_SHIFT" -> POST_TEST_TRAFFIC_SHIFT
    | `String "PRODUCTION_TRAFFIC_SHIFT" -> PRODUCTION_TRAFFIC_SHIFT
    | `String "POST_PRODUCTION_TRAFFIC_SHIFT" -> POST_PRODUCTION_TRAFFIC_SHIFT
    | `String "BAKE_TIME" -> BAKE_TIME
    | `String "CLEAN_UP" -> CLEAN_UP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ServiceDeploymentLifecycleStage" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceDeploymentLifecycleStage")
     : service_deployment_lifecycle_stage)
    : service_deployment_lifecycle_stage)

let service_deployment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "SUCCESSFUL" -> SUCCESSFUL
    | `String "STOPPED" -> STOPPED
    | `String "STOP_REQUESTED" -> STOP_REQUESTED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "ROLLBACK_REQUESTED" -> ROLLBACK_REQUESTED
    | `String "ROLLBACK_IN_PROGRESS" -> ROLLBACK_IN_PROGRESS
    | `String "ROLLBACK_SUCCESSFUL" -> ROLLBACK_SUCCESSFUL
    | `String "ROLLBACK_FAILED" -> ROLLBACK_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ServiceDeploymentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceDeploymentStatus")
     : service_deployment_status)
    : service_deployment_status)

let service_revision_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     requested_task_count =
       option_of_yojson (value_for_key integer_of_yojson "requestedTaskCount") _list path;
     running_task_count =
       option_of_yojson (value_for_key integer_of_yojson "runningTaskCount") _list path;
     pending_task_count =
       option_of_yojson (value_for_key integer_of_yojson "pendingTaskCount") _list path;
     requested_test_traffic_weight =
       option_of_yojson (value_for_key double_of_yojson "requestedTestTrafficWeight") _list path;
     requested_production_traffic_weight =
       option_of_yojson
         (value_for_key double_of_yojson "requestedProductionTrafficWeight")
         _list path;
   }
    : service_revision_summary)

let service_revisions_summary_list_of_yojson tree path =
  list_of_yojson service_revision_summary_of_yojson tree path

let service_deployment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_deployment_arn =
       option_of_yojson (value_for_key string__of_yojson "serviceDeploymentArn") _list path;
     service_arn = option_of_yojson (value_for_key string__of_yojson "serviceArn") _list path;
     cluster_arn = option_of_yojson (value_for_key string__of_yojson "clusterArn") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     started_at = option_of_yojson (value_for_key timestamp_of_yojson "startedAt") _list path;
     finished_at = option_of_yojson (value_for_key timestamp_of_yojson "finishedAt") _list path;
     stopped_at = option_of_yojson (value_for_key timestamp_of_yojson "stoppedAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
     source_service_revisions =
       option_of_yojson
         (value_for_key service_revisions_summary_list_of_yojson "sourceServiceRevisions")
         _list path;
     target_service_revision =
       option_of_yojson
         (value_for_key service_revision_summary_of_yojson "targetServiceRevision")
         _list path;
     status =
       option_of_yojson (value_for_key service_deployment_status_of_yojson "status") _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
     lifecycle_stage =
       option_of_yojson
         (value_for_key service_deployment_lifecycle_stage_of_yojson "lifecycleStage")
         _list path;
     lifecycle_hook_details =
       option_of_yojson
         (value_for_key deployment_lifecycle_hook_detail_list_of_yojson "lifecycleHookDetails")
         _list path;
     deployment_configuration =
       option_of_yojson
         (value_for_key deployment_configuration_of_yojson "deploymentConfiguration")
         _list path;
     rollback = option_of_yojson (value_for_key rollback_of_yojson "rollback") _list path;
     deployment_circuit_breaker =
       option_of_yojson
         (value_for_key service_deployment_circuit_breaker_of_yojson "deploymentCircuitBreaker")
         _list path;
     alarms =
       option_of_yojson (value_for_key service_deployment_alarms_of_yojson "alarms") _list path;
   }
    : service_deployment)

let service_deployments_of_yojson tree path = list_of_yojson service_deployment_of_yojson tree path

let describe_service_deployments_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_deployments =
       option_of_yojson
         (value_for_key service_deployments_of_yojson "serviceDeployments")
         _list path;
     failures = option_of_yojson (value_for_key failures_of_yojson "failures") _list path;
   }
    : describe_service_deployments_response)

let describe_service_deployments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_deployment_arns =
       value_for_key string_list_of_yojson "serviceDeploymentArns" _list path;
   }
    : describe_service_deployments_request)

let managed_resource_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PROVISIONING" -> PROVISIONING
    | `String "ACTIVE" -> ACTIVE
    | `String "DEPROVISIONING" -> DEPROVISIONING
    | `String "DELETED" -> DELETED
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ManagedResourceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ManagedResourceStatus")
     : managed_resource_status)
    : managed_resource_status)

let managed_log_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     status = value_for_key managed_resource_status_of_yojson "status" _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
     updated_at = value_for_key timestamp_of_yojson "updatedAt" _list path;
     log_group_name = value_for_key string__of_yojson "logGroupName" _list path;
   }
    : managed_log_group)

let managed_log_groups_of_yojson tree path = list_of_yojson managed_log_group_of_yojson tree path

let managed_security_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     status = value_for_key managed_resource_status_of_yojson "status" _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
     updated_at = value_for_key timestamp_of_yojson "updatedAt" _list path;
   }
    : managed_security_group)

let managed_security_groups_of_yojson tree path =
  list_of_yojson managed_security_group_of_yojson tree path

let managed_metric_alarm_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     status = value_for_key managed_resource_status_of_yojson "status" _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
     updated_at = value_for_key timestamp_of_yojson "updatedAt" _list path;
   }
    : managed_metric_alarm)

let managed_metric_alarms_of_yojson tree path =
  list_of_yojson managed_metric_alarm_of_yojson tree path

let managed_application_auto_scaling_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     status = value_for_key managed_resource_status_of_yojson "status" _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
     updated_at = value_for_key timestamp_of_yojson "updatedAt" _list path;
     policy_type = value_for_key string__of_yojson "policyType" _list path;
     target_value = value_for_key double_of_yojson "targetValue" _list path;
     metric = value_for_key string__of_yojson "metric" _list path;
   }
    : managed_application_auto_scaling_policy)

let managed_application_auto_scaling_policies_of_yojson tree path =
  list_of_yojson managed_application_auto_scaling_policy_of_yojson tree path

let managed_scalable_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     status = value_for_key managed_resource_status_of_yojson "status" _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
     updated_at = value_for_key timestamp_of_yojson "updatedAt" _list path;
     min_capacity = value_for_key integer_of_yojson "minCapacity" _list path;
     max_capacity = value_for_key integer_of_yojson "maxCapacity" _list path;
   }
    : managed_scalable_target)

let managed_auto_scaling_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scalable_target =
       option_of_yojson
         (value_for_key managed_scalable_target_of_yojson "scalableTarget")
         _list path;
     application_auto_scaling_policies =
       option_of_yojson
         (value_for_key managed_application_auto_scaling_policies_of_yojson
            "applicationAutoScalingPolicies")
         _list path;
   }
    : managed_auto_scaling)

let managed_target_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     status = value_for_key managed_resource_status_of_yojson "status" _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
     updated_at = value_for_key timestamp_of_yojson "updatedAt" _list path;
     health_check_path = value_for_key string__of_yojson "healthCheckPath" _list path;
     health_check_port = value_for_key integer_of_yojson "healthCheckPort" _list path;
     port = value_for_key integer_of_yojson "port" _list path;
   }
    : managed_target_group)

let managed_target_groups_of_yojson tree path =
  list_of_yojson managed_target_group_of_yojson tree path

let managed_listener_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     status = value_for_key managed_resource_status_of_yojson "status" _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
     updated_at = value_for_key timestamp_of_yojson "updatedAt" _list path;
   }
    : managed_listener_rule)

let managed_listener_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     status = value_for_key managed_resource_status_of_yojson "status" _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
     updated_at = value_for_key timestamp_of_yojson "updatedAt" _list path;
   }
    : managed_listener)

let managed_certificate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     status = value_for_key managed_resource_status_of_yojson "status" _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
     updated_at = value_for_key timestamp_of_yojson "updatedAt" _list path;
     domain_name = value_for_key string__of_yojson "domainName" _list path;
   }
    : managed_certificate)

let managed_load_balancer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key string__of_yojson "arn") _list path;
     status = value_for_key managed_resource_status_of_yojson "status" _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
     updated_at = value_for_key timestamp_of_yojson "updatedAt" _list path;
     scheme = value_for_key string__of_yojson "scheme" _list path;
     subnet_ids = option_of_yojson (value_for_key string_list_of_yojson "subnetIds") _list path;
     security_group_ids =
       option_of_yojson (value_for_key string_list_of_yojson "securityGroupIds") _list path;
   }
    : managed_load_balancer)

let managed_ingress_path_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_type = value_for_key access_type_of_yojson "accessType" _list path;
     endpoint = value_for_key string__of_yojson "endpoint" _list path;
     load_balancer =
       option_of_yojson (value_for_key managed_load_balancer_of_yojson "loadBalancer") _list path;
     load_balancer_security_groups =
       option_of_yojson
         (value_for_key managed_security_groups_of_yojson "loadBalancerSecurityGroups")
         _list path;
     certificate =
       option_of_yojson (value_for_key managed_certificate_of_yojson "certificate") _list path;
     listener = option_of_yojson (value_for_key managed_listener_of_yojson "listener") _list path;
     rule = option_of_yojson (value_for_key managed_listener_rule_of_yojson "rule") _list path;
     target_groups =
       option_of_yojson (value_for_key managed_target_groups_of_yojson "targetGroups") _list path;
   }
    : managed_ingress_path)

let managed_ingress_paths_of_yojson tree path =
  list_of_yojson managed_ingress_path_of_yojson tree path

let ecs_managed_resources_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ingress_paths =
       option_of_yojson (value_for_key managed_ingress_paths_of_yojson "ingressPaths") _list path;
     auto_scaling =
       option_of_yojson (value_for_key managed_auto_scaling_of_yojson "autoScaling") _list path;
     metric_alarms =
       option_of_yojson (value_for_key managed_metric_alarms_of_yojson "metricAlarms") _list path;
     service_security_groups =
       option_of_yojson
         (value_for_key managed_security_groups_of_yojson "serviceSecurityGroups")
         _list path;
     log_groups =
       option_of_yojson (value_for_key managed_log_groups_of_yojson "logGroups") _list path;
   }
    : ecs_managed_resources)

let service_revision_load_balancer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_group_arn =
       option_of_yojson (value_for_key string__of_yojson "targetGroupArn") _list path;
     production_listener_rule =
       option_of_yojson (value_for_key string__of_yojson "productionListenerRule") _list path;
   }
    : service_revision_load_balancer)

let service_revision_load_balancers_of_yojson tree path =
  list_of_yojson service_revision_load_balancer_of_yojson tree path

let resolved_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     load_balancers =
       option_of_yojson
         (value_for_key service_revision_load_balancers_of_yojson "loadBalancers")
         _list path;
   }
    : resolved_configuration)

let service_revision_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_revision_arn =
       option_of_yojson (value_for_key string__of_yojson "serviceRevisionArn") _list path;
     service_arn = option_of_yojson (value_for_key string__of_yojson "serviceArn") _list path;
     cluster_arn = option_of_yojson (value_for_key string__of_yojson "clusterArn") _list path;
     task_definition =
       option_of_yojson (value_for_key string__of_yojson "taskDefinition") _list path;
     capacity_provider_strategy =
       option_of_yojson
         (value_for_key capacity_provider_strategy_of_yojson "capacityProviderStrategy")
         _list path;
     launch_type = option_of_yojson (value_for_key launch_type_of_yojson "launchType") _list path;
     platform_version =
       option_of_yojson (value_for_key string__of_yojson "platformVersion") _list path;
     platform_family =
       option_of_yojson (value_for_key string__of_yojson "platformFamily") _list path;
     load_balancers =
       option_of_yojson (value_for_key load_balancers_of_yojson "loadBalancers") _list path;
     service_registries =
       option_of_yojson (value_for_key service_registries_of_yojson "serviceRegistries") _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "networkConfiguration")
         _list path;
     container_images =
       option_of_yojson (value_for_key container_images_of_yojson "containerImages") _list path;
     guard_duty_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "guardDutyEnabled") _list path;
     service_connect_configuration =
       option_of_yojson
         (value_for_key service_connect_configuration_of_yojson "serviceConnectConfiguration")
         _list path;
     volume_configurations =
       option_of_yojson
         (value_for_key service_volume_configurations_of_yojson "volumeConfigurations")
         _list path;
     fargate_ephemeral_storage =
       option_of_yojson
         (value_for_key deployment_ephemeral_storage_of_yojson "fargateEphemeralStorage")
         _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     vpc_lattice_configurations =
       option_of_yojson
         (value_for_key vpc_lattice_configurations_of_yojson "vpcLatticeConfigurations")
         _list path;
     resolved_configuration =
       option_of_yojson
         (value_for_key resolved_configuration_of_yojson "resolvedConfiguration")
         _list path;
     ecs_managed_resources =
       option_of_yojson
         (value_for_key ecs_managed_resources_of_yojson "ecsManagedResources")
         _list path;
     monitoring =
       option_of_yojson (value_for_key monitoring_configuration_of_yojson "monitoring") _list path;
   }
    : service_revision)

let service_revisions_of_yojson tree path = list_of_yojson service_revision_of_yojson tree path

let describe_service_revisions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_revisions =
       option_of_yojson (value_for_key service_revisions_of_yojson "serviceRevisions") _list path;
     failures = option_of_yojson (value_for_key failures_of_yojson "failures") _list path;
   }
    : describe_service_revisions_response)

let describe_service_revisions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_revision_arns = value_for_key string_list_of_yojson "serviceRevisionArns" _list path }
    : describe_service_revisions_request)

let services_of_yojson tree path = list_of_yojson service_of_yojson tree path

let describe_services_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     services = option_of_yojson (value_for_key services_of_yojson "services") _list path;
     failures = option_of_yojson (value_for_key failures_of_yojson "failures") _list path;
   }
    : describe_services_response)

let service_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "TAGS" -> TAGS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceField" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceField")
     : service_field)
    : service_field)

let service_field_list_of_yojson tree path = list_of_yojson service_field_of_yojson tree path

let describe_services_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     services = value_for_key string_list_of_yojson "services" _list path;
     include_ = option_of_yojson (value_for_key service_field_list_of_yojson "include") _list path;
   }
    : describe_services_request)

let describe_task_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_sets = option_of_yojson (value_for_key task_sets_of_yojson "taskSets") _list path;
     failures = option_of_yojson (value_for_key failures_of_yojson "failures") _list path;
   }
    : describe_task_sets_response)

let task_set_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "TAGS" -> TAGS
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaskSetField" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskSetField")
     : task_set_field)
    : task_set_field)

let task_set_field_list_of_yojson tree path = list_of_yojson task_set_field_of_yojson tree path

let describe_task_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = value_for_key string__of_yojson "cluster" _list path;
     service = value_for_key string__of_yojson "service" _list path;
     task_sets = option_of_yojson (value_for_key string_list_of_yojson "taskSets") _list path;
     include_ = option_of_yojson (value_for_key task_set_field_list_of_yojson "include") _list path;
   }
    : describe_task_sets_request)

let task_ephemeral_storage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     size_in_gi_b = option_of_yojson (value_for_key integer_of_yojson "sizeInGiB") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "kmsKeyId") _list path;
   }
    : task_ephemeral_storage)

let task_stop_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "TaskFailedToStart" -> TASK_FAILED_TO_START
    | `String "EssentialContainerExited" -> ESSENTIAL_CONTAINER_EXITED
    | `String "UserInitiated" -> USER_INITIATED
    | `String "ServiceSchedulerInitiated" -> SERVICE_SCHEDULER_INITIATED
    | `String "SpotInterruption" -> SPOT_INTERRUPTION
    | `String "TerminationNotice" -> TERMINATION_NOTICE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaskStopCode" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskStopCode")
     : task_stop_code)
    : task_stop_code)

let inference_accelerator_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_name = option_of_yojson (value_for_key string__of_yojson "deviceName") _list path;
     device_type = option_of_yojson (value_for_key string__of_yojson "deviceType") _list path;
   }
    : inference_accelerator_override)

let inference_accelerator_overrides_of_yojson tree path =
  list_of_yojson inference_accelerator_override_of_yojson tree path

let task_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_overrides =
       option_of_yojson
         (value_for_key container_overrides_of_yojson "containerOverrides")
         _list path;
     cpu = option_of_yojson (value_for_key string__of_yojson "cpu") _list path;
     inference_accelerator_overrides =
       option_of_yojson
         (value_for_key inference_accelerator_overrides_of_yojson "inferenceAcceleratorOverrides")
         _list path;
     execution_role_arn =
       option_of_yojson (value_for_key string__of_yojson "executionRoleArn") _list path;
     memory = option_of_yojson (value_for_key string__of_yojson "memory") _list path;
     task_role_arn = option_of_yojson (value_for_key string__of_yojson "taskRoleArn") _list path;
     ephemeral_storage =
       option_of_yojson (value_for_key ephemeral_storage_of_yojson "ephemeralStorage") _list path;
   }
    : task_override)

let task_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attachments = option_of_yojson (value_for_key attachments_of_yojson "attachments") _list path;
     attributes = option_of_yojson (value_for_key attributes_of_yojson "attributes") _list path;
     availability_zone =
       option_of_yojson (value_for_key string__of_yojson "availabilityZone") _list path;
     capacity_provider_name =
       option_of_yojson (value_for_key string__of_yojson "capacityProviderName") _list path;
     cluster_arn = option_of_yojson (value_for_key string__of_yojson "clusterArn") _list path;
     connectivity =
       option_of_yojson (value_for_key connectivity_of_yojson "connectivity") _list path;
     connectivity_at =
       option_of_yojson (value_for_key timestamp_of_yojson "connectivityAt") _list path;
     container_instance_arn =
       option_of_yojson (value_for_key string__of_yojson "containerInstanceArn") _list path;
     containers = option_of_yojson (value_for_key containers_of_yojson "containers") _list path;
     cpu = option_of_yojson (value_for_key string__of_yojson "cpu") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     desired_status = option_of_yojson (value_for_key string__of_yojson "desiredStatus") _list path;
     enable_execute_command =
       option_of_yojson (value_for_key boolean__of_yojson "enableExecuteCommand") _list path;
     execution_stopped_at =
       option_of_yojson (value_for_key timestamp_of_yojson "executionStoppedAt") _list path;
     group = option_of_yojson (value_for_key string__of_yojson "group") _list path;
     health_status =
       option_of_yojson (value_for_key health_status_of_yojson "healthStatus") _list path;
     inference_accelerators =
       option_of_yojson
         (value_for_key inference_accelerators_of_yojson "inferenceAccelerators")
         _list path;
     last_status = option_of_yojson (value_for_key string__of_yojson "lastStatus") _list path;
     launch_type = option_of_yojson (value_for_key launch_type_of_yojson "launchType") _list path;
     memory = option_of_yojson (value_for_key string__of_yojson "memory") _list path;
     overrides = option_of_yojson (value_for_key task_override_of_yojson "overrides") _list path;
     platform_version =
       option_of_yojson (value_for_key string__of_yojson "platformVersion") _list path;
     platform_family =
       option_of_yojson (value_for_key string__of_yojson "platformFamily") _list path;
     pull_started_at =
       option_of_yojson (value_for_key timestamp_of_yojson "pullStartedAt") _list path;
     pull_stopped_at =
       option_of_yojson (value_for_key timestamp_of_yojson "pullStoppedAt") _list path;
     started_at = option_of_yojson (value_for_key timestamp_of_yojson "startedAt") _list path;
     started_by = option_of_yojson (value_for_key string__of_yojson "startedBy") _list path;
     stop_code = option_of_yojson (value_for_key task_stop_code_of_yojson "stopCode") _list path;
     stopped_at = option_of_yojson (value_for_key timestamp_of_yojson "stoppedAt") _list path;
     stopped_reason = option_of_yojson (value_for_key string__of_yojson "stoppedReason") _list path;
     stopping_at = option_of_yojson (value_for_key timestamp_of_yojson "stoppingAt") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     task_arn = option_of_yojson (value_for_key string__of_yojson "taskArn") _list path;
     task_definition_arn =
       option_of_yojson (value_for_key string__of_yojson "taskDefinitionArn") _list path;
     version = option_of_yojson (value_for_key long_of_yojson "version") _list path;
     ephemeral_storage =
       option_of_yojson (value_for_key ephemeral_storage_of_yojson "ephemeralStorage") _list path;
     fargate_ephemeral_storage =
       option_of_yojson
         (value_for_key task_ephemeral_storage_of_yojson "fargateEphemeralStorage")
         _list path;
   }
    : task)

let tasks_of_yojson tree path = list_of_yojson task_of_yojson tree path

let describe_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tasks = option_of_yojson (value_for_key tasks_of_yojson "tasks") _list path;
     failures = option_of_yojson (value_for_key failures_of_yojson "failures") _list path;
   }
    : describe_tasks_response)

let task_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "TAGS" -> TAGS
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaskField" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskField")
     : task_field)
    : task_field)

let task_field_list_of_yojson tree path = list_of_yojson task_field_of_yojson tree path

let describe_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     tasks = value_for_key string_list_of_yojson "tasks" _list path;
     include_ = option_of_yojson (value_for_key task_field_list_of_yojson "include") _list path;
   }
    : describe_tasks_request)

let desired_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "RUNNING" -> RUNNING
    | `String "PENDING" -> PENDING
    | `String "STOPPED" -> STOPPED
    | `String value -> raise (deserialize_unknown_enum_value_error path "DesiredStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DesiredStatus")
     : desired_status)
    : desired_status)

let target_not_connected_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : target_not_connected_exception)

let sensitive_string_of_yojson = string_of_yojson

let session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id = option_of_yojson (value_for_key string__of_yojson "sessionId") _list path;
     stream_url = option_of_yojson (value_for_key string__of_yojson "streamUrl") _list path;
     token_value =
       option_of_yojson (value_for_key sensitive_string_of_yojson "tokenValue") _list path;
   }
    : session)

let execute_command_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_arn = option_of_yojson (value_for_key string__of_yojson "clusterArn") _list path;
     container_arn = option_of_yojson (value_for_key string__of_yojson "containerArn") _list path;
     container_name = option_of_yojson (value_for_key string__of_yojson "containerName") _list path;
     interactive = option_of_yojson (value_for_key boolean__of_yojson "interactive") _list path;
     session = option_of_yojson (value_for_key session_of_yojson "session") _list path;
     task_arn = option_of_yojson (value_for_key string__of_yojson "taskArn") _list path;
   }
    : execute_command_response)

let execute_command_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     container = option_of_yojson (value_for_key string__of_yojson "container") _list path;
     command = value_for_key string__of_yojson "command" _list path;
     interactive = value_for_key boolean__of_yojson "interactive" _list path;
     task = value_for_key string__of_yojson "task" _list path;
   }
    : execute_command_request)

let protected_task_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_arn = option_of_yojson (value_for_key string__of_yojson "taskArn") _list path;
     protection_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "protectionEnabled") _list path;
     expiration_date =
       option_of_yojson (value_for_key timestamp_of_yojson "expirationDate") _list path;
   }
    : protected_task)

let protected_tasks_of_yojson tree path = list_of_yojson protected_task_of_yojson tree path

let get_task_protection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protected_tasks =
       option_of_yojson (value_for_key protected_tasks_of_yojson "protectedTasks") _list path;
     failures = option_of_yojson (value_for_key failures_of_yojson "failures") _list path;
   }
    : get_task_protection_response)

let get_task_protection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = value_for_key string__of_yojson "cluster" _list path;
     tasks = option_of_yojson (value_for_key string_list_of_yojson "tasks") _list path;
   }
    : get_task_protection_request)

let instance_launch_template_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ec2_instance_profile_arn =
       option_of_yojson (value_for_key string__of_yojson "ec2InstanceProfileArn") _list path;
     network_configuration =
       option_of_yojson
         (value_for_key managed_instances_network_configuration_of_yojson "networkConfiguration")
         _list path;
     storage_configuration =
       option_of_yojson
         (value_for_key managed_instances_storage_configuration_of_yojson "storageConfiguration")
         _list path;
     instance_metadata_tags_propagation =
       option_of_yojson
         (value_for_key boxed_boolean_of_yojson "instanceMetadataTagsPropagation")
         _list path;
     local_storage_configuration =
       option_of_yojson
         (value_for_key managed_instances_local_storage_configuration_of_yojson
            "localStorageConfiguration")
         _list path;
     monitoring =
       option_of_yojson
         (value_for_key managed_instances_monitoring_options_of_yojson "monitoring")
         _list path;
     instance_requirements =
       option_of_yojson
         (value_for_key instance_requirements_request_of_yojson "instanceRequirements")
         _list path;
     capacity_reservations =
       option_of_yojson
         (value_for_key capacity_reservation_request_of_yojson "capacityReservations")
         _list path;
   }
    : instance_launch_template_update)

let list_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes = option_of_yojson (value_for_key attributes_of_yojson "attributes") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_attributes_response)

let list_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     target_type = value_for_key target_type_of_yojson "targetType" _list path;
     attribute_name = option_of_yojson (value_for_key string__of_yojson "attributeName") _list path;
     attribute_value =
       option_of_yojson (value_for_key string__of_yojson "attributeValue") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key boxed_integer_of_yojson "maxResults") _list path;
   }
    : list_attributes_request)

let list_clusters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_arns = option_of_yojson (value_for_key string_list_of_yojson "clusterArns") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_clusters_response)

let list_clusters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key boxed_integer_of_yojson "maxResults") _list path;
   }
    : list_clusters_request)

let list_container_instances_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_instance_arns =
       option_of_yojson (value_for_key string_list_of_yojson "containerInstanceArns") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_container_instances_response)

let list_container_instances_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     filter = option_of_yojson (value_for_key string__of_yojson "filter") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key boxed_integer_of_yojson "maxResults") _list path;
     status =
       option_of_yojson (value_for_key container_instance_status_of_yojson "status") _list path;
   }
    : list_container_instances_request)

let list_daemon_deployments_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     daemon_deployments =
       option_of_yojson
         (value_for_key daemon_deployment_summary_list_of_yojson "daemonDeployments")
         _list path;
   }
    : list_daemon_deployments_response)

let list_daemon_deployments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_arn = value_for_key string__of_yojson "daemonArn" _list path;
     status =
       option_of_yojson (value_for_key daemon_deployment_status_list_of_yojson "status") _list path;
     created_at = option_of_yojson (value_for_key created_at_of_yojson "createdAt") _list path;
     max_results = option_of_yojson (value_for_key boxed_integer_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_daemon_deployments_request)

let list_daemon_task_definitions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_task_definitions =
       option_of_yojson
         (value_for_key daemon_task_definition_summaries_of_yojson "daemonTaskDefinitions")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_daemon_task_definitions_response)

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASC" -> ASC
    | `String "DESC" -> DESC
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let list_daemon_task_definitions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     family_prefix = option_of_yojson (value_for_key string__of_yojson "familyPrefix") _list path;
     family = option_of_yojson (value_for_key string__of_yojson "family") _list path;
     revision =
       option_of_yojson
         (value_for_key daemon_task_definition_revision_filter_of_yojson "revision")
         _list path;
     status =
       option_of_yojson
         (value_for_key daemon_task_definition_status_filter_of_yojson "status")
         _list path;
     sort = option_of_yojson (value_for_key sort_order_of_yojson "sort") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key boxed_integer_of_yojson "maxResults") _list path;
   }
    : list_daemon_task_definitions_request)

let list_daemons_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_summaries_list =
       option_of_yojson
         (value_for_key daemon_summaries_list_of_yojson "daemonSummariesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_daemons_response)

let list_daemons_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_arn = option_of_yojson (value_for_key string__of_yojson "clusterArn") _list path;
     capacity_provider_arns =
       option_of_yojson (value_for_key string_list_of_yojson "capacityProviderArns") _list path;
     max_results = option_of_yojson (value_for_key boxed_integer_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_daemons_request)

let service_deployment_brief_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_deployment_arn =
       option_of_yojson (value_for_key string__of_yojson "serviceDeploymentArn") _list path;
     service_arn = option_of_yojson (value_for_key string__of_yojson "serviceArn") _list path;
     cluster_arn = option_of_yojson (value_for_key string__of_yojson "clusterArn") _list path;
     started_at = option_of_yojson (value_for_key timestamp_of_yojson "startedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     finished_at = option_of_yojson (value_for_key timestamp_of_yojson "finishedAt") _list path;
     target_service_revision_arn =
       option_of_yojson (value_for_key string__of_yojson "targetServiceRevisionArn") _list path;
     status =
       option_of_yojson (value_for_key service_deployment_status_of_yojson "status") _list path;
     status_reason = option_of_yojson (value_for_key string__of_yojson "statusReason") _list path;
   }
    : service_deployment_brief)

let service_deployments_brief_of_yojson tree path =
  list_of_yojson service_deployment_brief_of_yojson tree path

let list_service_deployments_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_deployments =
       option_of_yojson
         (value_for_key service_deployments_brief_of_yojson "serviceDeployments")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_service_deployments_response)

let service_deployment_status_list_of_yojson tree path =
  list_of_yojson service_deployment_status_of_yojson tree path

let list_service_deployments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service = value_for_key string__of_yojson "service" _list path;
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     status =
       option_of_yojson (value_for_key service_deployment_status_list_of_yojson "status") _list path;
     created_at = option_of_yojson (value_for_key created_at_of_yojson "createdAt") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key boxed_integer_of_yojson "maxResults") _list path;
   }
    : list_service_deployments_request)

let list_services_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_arns = option_of_yojson (value_for_key string_list_of_yojson "serviceArns") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_services_response)

let list_services_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key boxed_integer_of_yojson "maxResults") _list path;
     launch_type = option_of_yojson (value_for_key launch_type_of_yojson "launchType") _list path;
     scheduling_strategy =
       option_of_yojson
         (value_for_key scheduling_strategy_of_yojson "schedulingStrategy")
         _list path;
     resource_management_type =
       option_of_yojson
         (value_for_key resource_management_type_of_yojson "resourceManagementType")
         _list path;
   }
    : list_services_request)

let list_task_definitions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_definition_arns =
       option_of_yojson (value_for_key string_list_of_yojson "taskDefinitionArns") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_task_definitions_response)

let list_task_definitions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     family_prefix = option_of_yojson (value_for_key string__of_yojson "familyPrefix") _list path;
     status = option_of_yojson (value_for_key task_definition_status_of_yojson "status") _list path;
     sort = option_of_yojson (value_for_key sort_order_of_yojson "sort") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key boxed_integer_of_yojson "maxResults") _list path;
   }
    : list_task_definitions_request)

let list_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_arns = option_of_yojson (value_for_key string_list_of_yojson "taskArns") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : list_tasks_response)

let list_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     container_instance =
       option_of_yojson (value_for_key string__of_yojson "containerInstance") _list path;
     family = option_of_yojson (value_for_key string__of_yojson "family") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key boxed_integer_of_yojson "maxResults") _list path;
     started_by = option_of_yojson (value_for_key string__of_yojson "startedBy") _list path;
     service_name = option_of_yojson (value_for_key string__of_yojson "serviceName") _list path;
     desired_status =
       option_of_yojson (value_for_key desired_status_of_yojson "desiredStatus") _list path;
     launch_type = option_of_yojson (value_for_key launch_type_of_yojson "launchType") _list path;
     daemon_name = option_of_yojson (value_for_key string__of_yojson "daemonName") _list path;
   }
    : list_tasks_request)

let managed_agent_state_change_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name = value_for_key string__of_yojson "containerName" _list path;
     managed_agent_name = value_for_key managed_agent_name_of_yojson "managedAgentName" _list path;
     status = value_for_key string__of_yojson "status" _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "reason") _list path;
   }
    : managed_agent_state_change)

let managed_agent_state_changes_of_yojson tree path =
  list_of_yojson managed_agent_state_change_of_yojson tree path

let missing_version_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : missing_version_exception)

let no_update_available_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : no_update_available_exception)

let platform_device_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GPU" -> GPU
    | `String "NEURON_DEVICE" -> NEURON_DEVICE
    | `String value -> raise (deserialize_unknown_enum_value_error path "PlatformDeviceType" value)
    | _ -> raise (deserialize_wrong_type_error path "PlatformDeviceType")
     : platform_device_type)
    : platform_device_type)

let platform_device_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key string__of_yojson "id" _list path;
     type_ = value_for_key platform_device_type_of_yojson "type" _list path;
   }
    : platform_device)

let platform_devices_of_yojson tree path = list_of_yojson platform_device_of_yojson tree path

let put_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ attributes = option_of_yojson (value_for_key attributes_of_yojson "attributes") _list path }
    : put_attributes_response)

let put_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     attributes = value_for_key attributes_of_yojson "attributes" _list path;
   }
    : put_attributes_request)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : resource_in_use_exception)

let put_cluster_capacity_providers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "cluster") _list path }
    : put_cluster_capacity_providers_response)

let put_cluster_capacity_providers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = value_for_key string__of_yojson "cluster" _list path;
     capacity_providers = value_for_key string_list_of_yojson "capacityProviders" _list path;
     default_capacity_provider_strategy =
       value_for_key capacity_provider_strategy_of_yojson "defaultCapacityProviderStrategy" _list
         path;
   }
    : put_cluster_capacity_providers_request)

let register_container_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_instance =
       option_of_yojson (value_for_key container_instance_of_yojson "containerInstance") _list path;
   }
    : register_container_instance_response)

let register_container_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     instance_identity_document =
       option_of_yojson (value_for_key string__of_yojson "instanceIdentityDocument") _list path;
     instance_identity_document_signature =
       option_of_yojson
         (value_for_key string__of_yojson "instanceIdentityDocumentSignature")
         _list path;
     total_resources =
       option_of_yojson (value_for_key resources_of_yojson "totalResources") _list path;
     version_info = option_of_yojson (value_for_key version_info_of_yojson "versionInfo") _list path;
     container_instance_arn =
       option_of_yojson (value_for_key string__of_yojson "containerInstanceArn") _list path;
     attributes = option_of_yojson (value_for_key attributes_of_yojson "attributes") _list path;
     platform_devices =
       option_of_yojson (value_for_key platform_devices_of_yojson "platformDevices") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : register_container_instance_request)

let register_daemon_task_definition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_task_definition_arn =
       option_of_yojson (value_for_key string__of_yojson "daemonTaskDefinitionArn") _list path;
   }
    : register_daemon_task_definition_response)

let register_daemon_task_definition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     family = value_for_key string__of_yojson "family" _list path;
     task_role_arn = option_of_yojson (value_for_key string__of_yojson "taskRoleArn") _list path;
     execution_role_arn =
       option_of_yojson (value_for_key string__of_yojson "executionRoleArn") _list path;
     container_definitions =
       value_for_key daemon_container_definition_list_of_yojson "containerDefinitions" _list path;
     cpu = option_of_yojson (value_for_key string__of_yojson "cpu") _list path;
     memory = option_of_yojson (value_for_key string__of_yojson "memory") _list path;
     volumes = option_of_yojson (value_for_key daemon_volume_list_of_yojson "volumes") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     pid_mode = option_of_yojson (value_for_key daemon_pid_mode_of_yojson "pidMode") _list path;
     ipc_mode = option_of_yojson (value_for_key daemon_ipc_mode_of_yojson "ipcMode") _list path;
   }
    : register_daemon_task_definition_request)

let register_task_definition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_definition =
       option_of_yojson (value_for_key task_definition_of_yojson "taskDefinition") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : register_task_definition_response)

let register_task_definition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     family = value_for_key string__of_yojson "family" _list path;
     task_role_arn = option_of_yojson (value_for_key string__of_yojson "taskRoleArn") _list path;
     execution_role_arn =
       option_of_yojson (value_for_key string__of_yojson "executionRoleArn") _list path;
     network_mode = option_of_yojson (value_for_key network_mode_of_yojson "networkMode") _list path;
     container_definitions =
       value_for_key container_definitions_of_yojson "containerDefinitions" _list path;
     volumes = option_of_yojson (value_for_key volume_list_of_yojson "volumes") _list path;
     placement_constraints =
       option_of_yojson
         (value_for_key task_definition_placement_constraints_of_yojson "placementConstraints")
         _list path;
     requires_compatibilities =
       option_of_yojson
         (value_for_key compatibility_list_of_yojson "requiresCompatibilities")
         _list path;
     cpu = option_of_yojson (value_for_key string__of_yojson "cpu") _list path;
     memory = option_of_yojson (value_for_key string__of_yojson "memory") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     pid_mode = option_of_yojson (value_for_key pid_mode_of_yojson "pidMode") _list path;
     ipc_mode = option_of_yojson (value_for_key ipc_mode_of_yojson "ipcMode") _list path;
     proxy_configuration =
       option_of_yojson
         (value_for_key proxy_configuration_of_yojson "proxyConfiguration")
         _list path;
     inference_accelerators =
       option_of_yojson
         (value_for_key inference_accelerators_of_yojson "inferenceAccelerators")
         _list path;
     ephemeral_storage =
       option_of_yojson (value_for_key ephemeral_storage_of_yojson "ephemeralStorage") _list path;
     runtime_platform =
       option_of_yojson (value_for_key runtime_platform_of_yojson "runtimePlatform") _list path;
     enable_fault_injection =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "enableFaultInjection") _list path;
   }
    : register_task_definition_request)

let run_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tasks = option_of_yojson (value_for_key tasks_of_yojson "tasks") _list path;
     failures = option_of_yojson (value_for_key failures_of_yojson "failures") _list path;
   }
    : run_task_response)

let task_managed_ebs_volume_termination_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_on_termination = value_for_key boxed_boolean_of_yojson "deleteOnTermination" _list path;
   }
    : task_managed_ebs_volume_termination_policy)

let task_managed_ebs_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encrypted = option_of_yojson (value_for_key boxed_boolean_of_yojson "encrypted") _list path;
     kms_key_id = option_of_yojson (value_for_key ebskms_key_id_of_yojson "kmsKeyId") _list path;
     volume_type =
       option_of_yojson (value_for_key ebs_volume_type_of_yojson "volumeType") _list path;
     size_in_gi_b = option_of_yojson (value_for_key boxed_integer_of_yojson "sizeInGiB") _list path;
     snapshot_id =
       option_of_yojson (value_for_key ebs_snapshot_id_of_yojson "snapshotId") _list path;
     volume_initialization_rate =
       option_of_yojson
         (value_for_key boxed_integer_of_yojson "volumeInitializationRate")
         _list path;
     iops = option_of_yojson (value_for_key boxed_integer_of_yojson "iops") _list path;
     throughput = option_of_yojson (value_for_key boxed_integer_of_yojson "throughput") _list path;
     tag_specifications =
       option_of_yojson
         (value_for_key ebs_tag_specifications_of_yojson "tagSpecifications")
         _list path;
     role_arn = value_for_key iam_role_arn_of_yojson "roleArn" _list path;
     termination_policy =
       option_of_yojson
         (value_for_key task_managed_ebs_volume_termination_policy_of_yojson "terminationPolicy")
         _list path;
     filesystem_type =
       option_of_yojson (value_for_key task_filesystem_type_of_yojson "filesystemType") _list path;
   }
    : task_managed_ebs_volume_configuration)

let task_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key ecs_volume_name_of_yojson "name" _list path;
     managed_ebs_volume =
       option_of_yojson
         (value_for_key task_managed_ebs_volume_configuration_of_yojson "managedEBSVolume")
         _list path;
   }
    : task_volume_configuration)

let task_volume_configurations_of_yojson tree path =
  list_of_yojson task_volume_configuration_of_yojson tree path

let run_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_provider_strategy =
       option_of_yojson
         (value_for_key capacity_provider_strategy_of_yojson "capacityProviderStrategy")
         _list path;
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     count = option_of_yojson (value_for_key boxed_integer_of_yojson "count") _list path;
     enable_ecs_managed_tags =
       option_of_yojson (value_for_key boolean__of_yojson "enableECSManagedTags") _list path;
     enable_execute_command =
       option_of_yojson (value_for_key boolean__of_yojson "enableExecuteCommand") _list path;
     group = option_of_yojson (value_for_key string__of_yojson "group") _list path;
     launch_type = option_of_yojson (value_for_key launch_type_of_yojson "launchType") _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "networkConfiguration")
         _list path;
     overrides = option_of_yojson (value_for_key task_override_of_yojson "overrides") _list path;
     placement_constraints =
       option_of_yojson
         (value_for_key placement_constraints_of_yojson "placementConstraints")
         _list path;
     placement_strategy =
       option_of_yojson
         (value_for_key placement_strategies_of_yojson "placementStrategy")
         _list path;
     platform_version =
       option_of_yojson (value_for_key string__of_yojson "platformVersion") _list path;
     propagate_tags =
       option_of_yojson (value_for_key propagate_tags_of_yojson "propagateTags") _list path;
     reference_id = option_of_yojson (value_for_key string__of_yojson "referenceId") _list path;
     started_by = option_of_yojson (value_for_key string__of_yojson "startedBy") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     task_definition = value_for_key string__of_yojson "taskDefinition" _list path;
     client_token = option_of_yojson (value_for_key string__of_yojson "clientToken") _list path;
     volume_configurations =
       option_of_yojson
         (value_for_key task_volume_configurations_of_yojson "volumeConfigurations")
         _list path;
   }
    : run_task_request)

let start_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tasks = option_of_yojson (value_for_key tasks_of_yojson "tasks") _list path;
     failures = option_of_yojson (value_for_key failures_of_yojson "failures") _list path;
   }
    : start_task_response)

let start_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     container_instances = value_for_key string_list_of_yojson "containerInstances" _list path;
     enable_ecs_managed_tags =
       option_of_yojson (value_for_key boolean__of_yojson "enableECSManagedTags") _list path;
     enable_execute_command =
       option_of_yojson (value_for_key boolean__of_yojson "enableExecuteCommand") _list path;
     group = option_of_yojson (value_for_key string__of_yojson "group") _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "networkConfiguration")
         _list path;
     overrides = option_of_yojson (value_for_key task_override_of_yojson "overrides") _list path;
     propagate_tags =
       option_of_yojson (value_for_key propagate_tags_of_yojson "propagateTags") _list path;
     reference_id = option_of_yojson (value_for_key string__of_yojson "referenceId") _list path;
     started_by = option_of_yojson (value_for_key string__of_yojson "startedBy") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     task_definition = value_for_key string__of_yojson "taskDefinition" _list path;
     volume_configurations =
       option_of_yojson
         (value_for_key task_volume_configurations_of_yojson "volumeConfigurations")
         _list path;
   }
    : start_task_request)

let stop_service_deployment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_deployment_arn =
       option_of_yojson (value_for_key string__of_yojson "serviceDeploymentArn") _list path;
   }
    : stop_service_deployment_response)

let stop_service_deployment_stop_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ABORT" -> ABORT
    | `String "ROLLBACK" -> ROLLBACK
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StopServiceDeploymentStopType" value)
    | _ -> raise (deserialize_wrong_type_error path "StopServiceDeploymentStopType")
     : stop_service_deployment_stop_type)
    : stop_service_deployment_stop_type)

let stop_service_deployment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_deployment_arn = value_for_key string__of_yojson "serviceDeploymentArn" _list path;
     stop_type =
       option_of_yojson
         (value_for_key stop_service_deployment_stop_type_of_yojson "stopType")
         _list path;
   }
    : stop_service_deployment_request)

let stop_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task = option_of_yojson (value_for_key task_of_yojson "task") _list path }
    : stop_task_response)

let stop_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     task = value_for_key string__of_yojson "task" _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "reason") _list path;
   }
    : stop_task_request)

let submit_attachment_state_changes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acknowledgment = option_of_yojson (value_for_key string__of_yojson "acknowledgment") _list path;
   }
    : submit_attachment_state_changes_response)

let submit_attachment_state_changes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     attachments = value_for_key attachment_state_changes_of_yojson "attachments" _list path;
   }
    : submit_attachment_state_changes_request)

let submit_container_state_change_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acknowledgment = option_of_yojson (value_for_key string__of_yojson "acknowledgment") _list path;
   }
    : submit_container_state_change_response)

let submit_container_state_change_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     task = option_of_yojson (value_for_key string__of_yojson "task") _list path;
     container_name = option_of_yojson (value_for_key string__of_yojson "containerName") _list path;
     runtime_id = option_of_yojson (value_for_key string__of_yojson "runtimeId") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     exit_code = option_of_yojson (value_for_key boxed_integer_of_yojson "exitCode") _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "reason") _list path;
     network_bindings =
       option_of_yojson (value_for_key network_bindings_of_yojson "networkBindings") _list path;
   }
    : submit_container_state_change_request)

let submit_task_state_change_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acknowledgment = option_of_yojson (value_for_key string__of_yojson "acknowledgment") _list path;
   }
    : submit_task_state_change_response)

let submit_task_state_change_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     task = option_of_yojson (value_for_key string__of_yojson "task") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "reason") _list path;
     containers =
       option_of_yojson (value_for_key container_state_changes_of_yojson "containers") _list path;
     attachments =
       option_of_yojson (value_for_key attachment_state_changes_of_yojson "attachments") _list path;
     managed_agents =
       option_of_yojson
         (value_for_key managed_agent_state_changes_of_yojson "managedAgents")
         _list path;
     pull_started_at =
       option_of_yojson (value_for_key timestamp_of_yojson "pullStartedAt") _list path;
     pull_stopped_at =
       option_of_yojson (value_for_key timestamp_of_yojson "pullStoppedAt") _list path;
     execution_stopped_at =
       option_of_yojson (value_for_key timestamp_of_yojson "executionStoppedAt") _list path;
   }
    : submit_task_state_change_request)

let update_capacity_provider_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_provider =
       option_of_yojson (value_for_key capacity_provider_of_yojson "capacityProvider") _list path;
   }
    : update_capacity_provider_response)

let update_managed_instances_provider_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     infrastructure_role_arn = value_for_key string__of_yojson "infrastructureRoleArn" _list path;
     instance_launch_template =
       value_for_key instance_launch_template_update_of_yojson "instanceLaunchTemplate" _list path;
     propagate_tags =
       option_of_yojson (value_for_key propagate_mi_tags_of_yojson "propagateTags") _list path;
     infrastructure_optimization =
       option_of_yojson
         (value_for_key infrastructure_optimization_of_yojson "infrastructureOptimization")
         _list path;
     auto_repair_configuration =
       option_of_yojson
         (value_for_key auto_repair_configuration_of_yojson "autoRepairConfiguration")
         _list path;
   }
    : update_managed_instances_provider_configuration)

let update_capacity_provider_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key string__of_yojson "name" _list path;
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     auto_scaling_group_provider =
       option_of_yojson
         (value_for_key auto_scaling_group_provider_update_of_yojson "autoScalingGroupProvider")
         _list path;
     managed_instances_provider =
       option_of_yojson
         (value_for_key update_managed_instances_provider_configuration_of_yojson
            "managedInstancesProvider")
         _list path;
   }
    : update_capacity_provider_request)

let update_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "cluster") _list path }
    : update_cluster_response)

let update_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = value_for_key string__of_yojson "cluster" _list path;
     settings = option_of_yojson (value_for_key cluster_settings_of_yojson "settings") _list path;
     configuration =
       option_of_yojson (value_for_key cluster_configuration_of_yojson "configuration") _list path;
     service_connect_defaults =
       option_of_yojson
         (value_for_key cluster_service_connect_defaults_request_of_yojson "serviceConnectDefaults")
         _list path;
   }
    : update_cluster_request)

let update_cluster_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "cluster") _list path }
    : update_cluster_settings_response)

let update_cluster_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = value_for_key string__of_yojson "cluster" _list path;
     settings = value_for_key cluster_settings_of_yojson "settings" _list path;
   }
    : update_cluster_settings_request)

let update_container_agent_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_instance =
       option_of_yojson (value_for_key container_instance_of_yojson "containerInstance") _list path;
   }
    : update_container_agent_response)

let update_container_agent_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     container_instance = value_for_key string__of_yojson "containerInstance" _list path;
   }
    : update_container_agent_request)

let update_container_instances_state_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_instances =
       option_of_yojson
         (value_for_key container_instances_of_yojson "containerInstances")
         _list path;
     failures = option_of_yojson (value_for_key failures_of_yojson "failures") _list path;
   }
    : update_container_instances_state_response)

let update_container_instances_state_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     container_instances = value_for_key string_list_of_yojson "containerInstances" _list path;
     status = value_for_key container_instance_status_of_yojson "status" _list path;
   }
    : update_container_instances_state_request)

let update_daemon_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_arn = option_of_yojson (value_for_key string__of_yojson "daemonArn") _list path;
     status = option_of_yojson (value_for_key daemon_status_of_yojson "status") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
     deployment_arn = option_of_yojson (value_for_key string__of_yojson "deploymentArn") _list path;
   }
    : update_daemon_response)

let update_daemon_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     daemon_arn = value_for_key string__of_yojson "daemonArn" _list path;
     daemon_task_definition_arn =
       value_for_key string__of_yojson "daemonTaskDefinitionArn" _list path;
     capacity_provider_arns = value_for_key string_list_of_yojson "capacityProviderArns" _list path;
     deployment_configuration =
       option_of_yojson
         (value_for_key daemon_deployment_configuration_of_yojson "deploymentConfiguration")
         _list path;
     propagate_tags =
       option_of_yojson (value_for_key daemon_propagate_tags_of_yojson "propagateTags") _list path;
     enable_ecs_managed_tags =
       option_of_yojson (value_for_key boolean__of_yojson "enableECSManagedTags") _list path;
     enable_execute_command =
       option_of_yojson (value_for_key boolean__of_yojson "enableExecuteCommand") _list path;
   }
    : update_daemon_request)

let updated_express_gateway_service_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_arn = option_of_yojson (value_for_key string__of_yojson "serviceArn") _list path;
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     service_name = option_of_yojson (value_for_key string__of_yojson "serviceName") _list path;
     status =
       option_of_yojson (value_for_key express_gateway_service_status_of_yojson "status") _list path;
     target_configuration =
       option_of_yojson
         (value_for_key express_gateway_service_configuration_of_yojson "targetConfiguration")
         _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
   }
    : updated_express_gateway_service)

let update_express_gateway_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service =
       option_of_yojson
         (value_for_key updated_express_gateway_service_of_yojson "service")
         _list path;
   }
    : update_express_gateway_service_response)

let update_express_gateway_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_arn = value_for_key string__of_yojson "serviceArn" _list path;
     execution_role_arn =
       option_of_yojson (value_for_key string__of_yojson "executionRoleArn") _list path;
     health_check_path =
       option_of_yojson (value_for_key string__of_yojson "healthCheckPath") _list path;
     primary_container =
       option_of_yojson
         (value_for_key express_gateway_container_of_yojson "primaryContainer")
         _list path;
     task_role_arn = option_of_yojson (value_for_key string__of_yojson "taskRoleArn") _list path;
     network_configuration =
       option_of_yojson
         (value_for_key express_gateway_service_network_configuration_of_yojson
            "networkConfiguration")
         _list path;
     cpu = option_of_yojson (value_for_key string__of_yojson "cpu") _list path;
     memory = option_of_yojson (value_for_key string__of_yojson "memory") _list path;
     scaling_target =
       option_of_yojson
         (value_for_key express_gateway_scaling_target_of_yojson "scalingTarget")
         _list path;
     task_definition_arn =
       option_of_yojson (value_for_key string__of_yojson "taskDefinitionArn") _list path;
   }
    : update_express_gateway_service_request)

let update_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service = option_of_yojson (value_for_key service_of_yojson "service") _list path }
    : update_service_response)

let update_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = option_of_yojson (value_for_key string__of_yojson "cluster") _list path;
     service = value_for_key string__of_yojson "service" _list path;
     desired_count =
       option_of_yojson (value_for_key boxed_integer_of_yojson "desiredCount") _list path;
     task_definition =
       option_of_yojson (value_for_key string__of_yojson "taskDefinition") _list path;
     capacity_provider_strategy =
       option_of_yojson
         (value_for_key capacity_provider_strategy_of_yojson "capacityProviderStrategy")
         _list path;
     deployment_configuration =
       option_of_yojson
         (value_for_key deployment_configuration_of_yojson "deploymentConfiguration")
         _list path;
     availability_zone_rebalancing =
       option_of_yojson
         (value_for_key availability_zone_rebalancing_of_yojson "availabilityZoneRebalancing")
         _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "networkConfiguration")
         _list path;
     placement_constraints =
       option_of_yojson
         (value_for_key placement_constraints_of_yojson "placementConstraints")
         _list path;
     placement_strategy =
       option_of_yojson
         (value_for_key placement_strategies_of_yojson "placementStrategy")
         _list path;
     platform_version =
       option_of_yojson (value_for_key string__of_yojson "platformVersion") _list path;
     force_new_deployment =
       option_of_yojson (value_for_key boolean__of_yojson "forceNewDeployment") _list path;
     health_check_grace_period_seconds =
       option_of_yojson
         (value_for_key boxed_integer_of_yojson "healthCheckGracePeriodSeconds")
         _list path;
     deployment_controller =
       option_of_yojson
         (value_for_key deployment_controller_of_yojson "deploymentController")
         _list path;
     enable_execute_command =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "enableExecuteCommand") _list path;
     enable_ecs_managed_tags =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "enableECSManagedTags") _list path;
     load_balancers =
       option_of_yojson (value_for_key load_balancers_of_yojson "loadBalancers") _list path;
     propagate_tags =
       option_of_yojson (value_for_key propagate_tags_of_yojson "propagateTags") _list path;
     service_registries =
       option_of_yojson (value_for_key service_registries_of_yojson "serviceRegistries") _list path;
     service_connect_configuration =
       option_of_yojson
         (value_for_key service_connect_configuration_of_yojson "serviceConnectConfiguration")
         _list path;
     volume_configurations =
       option_of_yojson
         (value_for_key service_volume_configurations_of_yojson "volumeConfigurations")
         _list path;
     vpc_lattice_configurations =
       option_of_yojson
         (value_for_key vpc_lattice_configurations_of_yojson "vpcLatticeConfigurations")
         _list path;
     monitoring =
       option_of_yojson (value_for_key monitoring_configuration_of_yojson "monitoring") _list path;
   }
    : update_service_request)

let update_service_primary_task_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_set = option_of_yojson (value_for_key task_set_of_yojson "taskSet") _list path }
    : update_service_primary_task_set_response)

let update_service_primary_task_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = value_for_key string__of_yojson "cluster" _list path;
     service = value_for_key string__of_yojson "service" _list path;
     primary_task_set = value_for_key string__of_yojson "primaryTaskSet" _list path;
   }
    : update_service_primary_task_set_request)

let update_task_protection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protected_tasks =
       option_of_yojson (value_for_key protected_tasks_of_yojson "protectedTasks") _list path;
     failures = option_of_yojson (value_for_key failures_of_yojson "failures") _list path;
   }
    : update_task_protection_response)

let update_task_protection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = value_for_key string__of_yojson "cluster" _list path;
     tasks = value_for_key string_list_of_yojson "tasks" _list path;
     protection_enabled = value_for_key boolean__of_yojson "protectionEnabled" _list path;
     expires_in_minutes =
       option_of_yojson (value_for_key boxed_integer_of_yojson "expiresInMinutes") _list path;
   }
    : update_task_protection_request)

let update_task_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_set = option_of_yojson (value_for_key task_set_of_yojson "taskSet") _list path }
    : update_task_set_response)

let update_task_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster = value_for_key string__of_yojson "cluster" _list path;
     service = value_for_key string__of_yojson "service" _list path;
     task_set = value_for_key string__of_yojson "taskSet" _list path;
     scale = value_for_key scale_of_yojson "scale" _list path;
   }
    : update_task_set_request)
