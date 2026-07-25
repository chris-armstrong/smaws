open Smaws_Lib.Json.SerializeHelpers
open Types

let boxed_integer_to_yojson = int_to_yojson

let accelerator_count_request_to_yojson (x : accelerator_count_request) =
  assoc_to_yojson
    [
      ("min", option_to_yojson boxed_integer_to_yojson x.min);
      ("max", option_to_yojson boxed_integer_to_yojson x.max);
    ]

let accelerator_manufacturer_to_yojson (x : accelerator_manufacturer) =
  match x with
  | AMAZON_WEB_SERVICES -> `String "amazon-web-services"
  | AMD -> `String "amd"
  | NVIDIA -> `String "nvidia"
  | XILINX -> `String "xilinx"
  | HABANA -> `String "habana"

let accelerator_manufacturer_set_to_yojson tree =
  list_to_yojson accelerator_manufacturer_to_yojson tree

let accelerator_name_to_yojson (x : accelerator_name) =
  match x with
  | A100 -> `String "a100"
  | INFERENTIA -> `String "inferentia"
  | K520 -> `String "k520"
  | K80 -> `String "k80"
  | M60 -> `String "m60"
  | RADEON_PRO_V520 -> `String "radeon-pro-v520"
  | T4 -> `String "t4"
  | VU9P -> `String "vu9p"
  | V100 -> `String "v100"
  | A10G -> `String "a10g"
  | H100 -> `String "h100"
  | T4G -> `String "t4g"

let accelerator_name_set_to_yojson tree = list_to_yojson accelerator_name_to_yojson tree

let accelerator_total_memory_mi_b_request_to_yojson (x : accelerator_total_memory_mi_b_request) =
  assoc_to_yojson
    [
      ("min", option_to_yojson boxed_integer_to_yojson x.min);
      ("max", option_to_yojson boxed_integer_to_yojson x.max);
    ]

let accelerator_type_to_yojson (x : accelerator_type) =
  match x with GPU -> `String "gpu" | FPGA -> `String "fpga" | INFERENCE -> `String "inference"

let accelerator_type_set_to_yojson tree = list_to_yojson accelerator_type_to_yojson tree
let string__to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let access_type_to_yojson (x : access_type) =
  match x with PUBLIC -> `String "PUBLIC" | PRIVATE -> `String "PRIVATE"

let advanced_configuration_to_yojson (x : advanced_configuration) =
  assoc_to_yojson
    [
      ("alternateTargetGroupArn", option_to_yojson string__to_yojson x.alternate_target_group_arn);
      ("productionListenerRule", option_to_yojson string__to_yojson x.production_listener_rule);
      ("testListenerRule", option_to_yojson string__to_yojson x.test_listener_rule);
      ("roleArn", option_to_yojson string__to_yojson x.role_arn);
    ]

let agent_update_status_to_yojson (x : agent_update_status) =
  match x with
  | PENDING -> `String "PENDING"
  | STAGING -> `String "STAGING"
  | STAGED -> `String "STAGED"
  | UPDATING -> `String "UPDATING"
  | UPDATED -> `String "UPDATED"
  | FAILED -> `String "FAILED"

let allowed_instance_type_to_yojson = string_to_yojson
let allowed_instance_type_set_to_yojson tree = list_to_yojson allowed_instance_type_to_yojson tree

let server_exception_to_yojson (x : server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let cluster_not_found_exception_to_yojson (x : cluster_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let client_exception_to_yojson (x : client_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (string__to_yojson x.resource_arn));
      ("tagKeys", Some (tag_keys_to_yojson x.tag_keys));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("key", option_to_yojson tag_key_to_yojson x.key);
      ("value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (string__to_yojson x.resource_arn));
      ("tags", Some (tags_to_yojson x.tags));
    ]

let setting_type_to_yojson (x : setting_type) =
  match x with USER -> `String "user" | AWS_MANAGED -> `String "aws_managed"

let setting_name_to_yojson (x : setting_name) =
  match x with
  | SERVICE_LONG_ARN_FORMAT -> `String "serviceLongArnFormat"
  | TASK_LONG_ARN_FORMAT -> `String "taskLongArnFormat"
  | CONTAINER_INSTANCE_LONG_ARN_FORMAT -> `String "containerInstanceLongArnFormat"
  | AWSVPC_TRUNKING -> `String "awsvpcTrunking"
  | CONTAINER_INSIGHTS -> `String "containerInsights"
  | FARGATE_FIPS_MODE -> `String "fargateFIPSMode"
  | TAG_RESOURCE_AUTHORIZATION -> `String "tagResourceAuthorization"
  | FARGATE_TASK_RETIREMENT_WAIT_PERIOD -> `String "fargateTaskRetirementWaitPeriod"
  | GUARD_DUTY_ACTIVATE -> `String "guardDutyActivate"
  | DEFAULT_LOG_DRIVER_MODE -> `String "defaultLogDriverMode"
  | FARGATE_EVENT_WINDOWS -> `String "fargateEventWindows"

let setting_to_yojson (x : setting) =
  assoc_to_yojson
    [
      ("name", option_to_yojson setting_name_to_yojson x.name);
      ("value", option_to_yojson string__to_yojson x.value);
      ("principalArn", option_to_yojson string__to_yojson x.principal_arn);
      ("type", option_to_yojson setting_type_to_yojson x.type_);
    ]

let put_account_setting_default_response_to_yojson (x : put_account_setting_default_response) =
  assoc_to_yojson [ ("setting", option_to_yojson setting_to_yojson x.setting) ]

let put_account_setting_default_request_to_yojson (x : put_account_setting_default_request) =
  assoc_to_yojson
    [ ("name", Some (setting_name_to_yojson x.name)); ("value", Some (string__to_yojson x.value)) ]

let put_account_setting_response_to_yojson (x : put_account_setting_response) =
  assoc_to_yojson [ ("setting", option_to_yojson setting_to_yojson x.setting) ]

let put_account_setting_request_to_yojson (x : put_account_setting_request) =
  assoc_to_yojson
    [
      ("name", Some (setting_name_to_yojson x.name));
      ("value", Some (string__to_yojson x.value));
      ("principalArn", option_to_yojson string__to_yojson x.principal_arn);
    ]

let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let list_task_definition_families_response_to_yojson (x : list_task_definition_families_response) =
  assoc_to_yojson
    [
      ("families", option_to_yojson string_list_to_yojson x.families);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let task_definition_family_status_to_yojson (x : task_definition_family_status) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE" | ALL -> `String "ALL"

let list_task_definition_families_request_to_yojson (x : list_task_definition_families_request) =
  assoc_to_yojson
    [
      ("familyPrefix", option_to_yojson string__to_yojson x.family_prefix);
      ("status", option_to_yojson task_definition_family_status_to_yojson x.status);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (string__to_yojson x.resource_arn)) ]

let namespace_not_found_exception_to_yojson (x : namespace_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let list_services_by_namespace_response_to_yojson (x : list_services_by_namespace_response) =
  assoc_to_yojson
    [
      ("serviceArns", option_to_yojson string_list_to_yojson x.service_arns);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_services_by_namespace_request_to_yojson (x : list_services_by_namespace_request) =
  assoc_to_yojson
    [
      ("namespace", Some (string__to_yojson x.namespace));
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
    ]

let settings_to_yojson tree = list_to_yojson setting_to_yojson tree

let list_account_settings_response_to_yojson (x : list_account_settings_response) =
  assoc_to_yojson
    [
      ("settings", option_to_yojson settings_to_yojson x.settings);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let integer_to_yojson = int_to_yojson
let boolean__to_yojson = bool_to_yojson

let list_account_settings_request_to_yojson (x : list_account_settings_request) =
  assoc_to_yojson
    [
      ("name", option_to_yojson setting_name_to_yojson x.name);
      ("value", option_to_yojson string__to_yojson x.value);
      ("principalArn", option_to_yojson string__to_yojson x.principal_arn);
      ("effectiveSettings", option_to_yojson boolean__to_yojson x.effective_settings);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
    ]

let discover_poll_endpoint_response_to_yojson (x : discover_poll_endpoint_response) =
  assoc_to_yojson
    [
      ("endpoint", option_to_yojson string__to_yojson x.endpoint);
      ("telemetryEndpoint", option_to_yojson string__to_yojson x.telemetry_endpoint);
      ("serviceConnectEndpoint", option_to_yojson string__to_yojson x.service_connect_endpoint);
    ]

let discover_poll_endpoint_request_to_yojson (x : discover_poll_endpoint_request) =
  assoc_to_yojson
    [
      ("containerInstance", option_to_yojson string__to_yojson x.container_instance);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let boxed_boolean_to_yojson = bool_to_yojson

let ephemeral_storage_to_yojson (x : ephemeral_storage) =
  assoc_to_yojson [ ("sizeInGiB", Some (integer_to_yojson x.size_in_gi_b)) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let key_value_pair_to_yojson (x : key_value_pair) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("value", option_to_yojson string__to_yojson x.value);
    ]

let proxy_configuration_properties_to_yojson tree = list_to_yojson key_value_pair_to_yojson tree

let proxy_configuration_type_to_yojson (x : proxy_configuration_type) =
  match x with APPMESH -> `String "APPMESH"

let proxy_configuration_to_yojson (x : proxy_configuration) =
  assoc_to_yojson
    [
      ("type", option_to_yojson proxy_configuration_type_to_yojson x.type_);
      ("containerName", Some (string__to_yojson x.container_name));
      ("properties", option_to_yojson proxy_configuration_properties_to_yojson x.properties);
    ]

let ipc_mode_to_yojson (x : ipc_mode) =
  match x with HOST -> `String "host" | TASK -> `String "task" | NONE -> `String "none"

let pid_mode_to_yojson (x : pid_mode) =
  match x with HOST -> `String "host" | TASK -> `String "task"

let inference_accelerator_to_yojson (x : inference_accelerator) =
  assoc_to_yojson
    [
      ("deviceName", Some (string__to_yojson x.device_name));
      ("deviceType", Some (string__to_yojson x.device_type));
    ]

let inference_accelerators_to_yojson tree = list_to_yojson inference_accelerator_to_yojson tree

let compatibility_to_yojson (x : compatibility) =
  match x with
  | EC2 -> `String "EC2"
  | FARGATE -> `String "FARGATE"
  | EXTERNAL -> `String "EXTERNAL"
  | MANAGED_INSTANCES -> `String "MANAGED_INSTANCES"

let compatibility_list_to_yojson tree = list_to_yojson compatibility_to_yojson tree

let os_family_to_yojson (x : os_family) =
  match x with
  | WINDOWS_SERVER_2019_FULL -> `String "WINDOWS_SERVER_2019_FULL"
  | WINDOWS_SERVER_2019_CORE -> `String "WINDOWS_SERVER_2019_CORE"
  | WINDOWS_SERVER_2016_FULL -> `String "WINDOWS_SERVER_2016_FULL"
  | WINDOWS_SERVER_2004_CORE -> `String "WINDOWS_SERVER_2004_CORE"
  | WINDOWS_SERVER_2022_CORE -> `String "WINDOWS_SERVER_2022_CORE"
  | WINDOWS_SERVER_2022_FULL -> `String "WINDOWS_SERVER_2022_FULL"
  | WINDOWS_SERVER_2025_CORE -> `String "WINDOWS_SERVER_2025_CORE"
  | WINDOWS_SERVER_2025_FULL -> `String "WINDOWS_SERVER_2025_FULL"
  | WINDOWS_SERVER_20H2_CORE -> `String "WINDOWS_SERVER_20H2_CORE"
  | LINUX -> `String "LINUX"

let cpu_architecture_to_yojson (x : cpu_architecture) =
  match x with X86_64 -> `String "X86_64" | ARM64 -> `String "ARM64"

let runtime_platform_to_yojson (x : runtime_platform) =
  assoc_to_yojson
    [
      ("cpuArchitecture", option_to_yojson cpu_architecture_to_yojson x.cpu_architecture);
      ("operatingSystemFamily", option_to_yojson os_family_to_yojson x.operating_system_family);
    ]

let task_definition_placement_constraint_type_to_yojson
    (x : task_definition_placement_constraint_type) =
  match x with MEMBER_OF -> `String "memberOf"

let task_definition_placement_constraint_to_yojson (x : task_definition_placement_constraint) =
  assoc_to_yojson
    [
      ("type", option_to_yojson task_definition_placement_constraint_type_to_yojson x.type_);
      ("expression", option_to_yojson string__to_yojson x.expression);
    ]

let task_definition_placement_constraints_to_yojson tree =
  list_to_yojson task_definition_placement_constraint_to_yojson tree

let target_type_to_yojson (x : target_type) =
  match x with CONTAINER_INSTANCE -> `String "container-instance"

let attribute_to_yojson (x : attribute) =
  assoc_to_yojson
    [
      ("name", Some (string__to_yojson x.name));
      ("value", option_to_yojson string__to_yojson x.value);
      ("targetType", option_to_yojson target_type_to_yojson x.target_type);
      ("targetId", option_to_yojson string__to_yojson x.target_id);
    ]

let requires_attributes_to_yojson tree = list_to_yojson attribute_to_yojson tree

let task_definition_status_to_yojson (x : task_definition_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | INACTIVE -> `String "INACTIVE"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"

let f_sx_windows_file_server_authorization_config_to_yojson
    (x : f_sx_windows_file_server_authorization_config) =
  assoc_to_yojson
    [
      ("credentialsParameter", Some (string__to_yojson x.credentials_parameter));
      ("domain", Some (string__to_yojson x.domain));
    ]

let f_sx_windows_file_server_volume_configuration_to_yojson
    (x : f_sx_windows_file_server_volume_configuration) =
  assoc_to_yojson
    [
      ("fileSystemId", Some (string__to_yojson x.file_system_id));
      ("rootDirectory", Some (string__to_yojson x.root_directory));
      ( "authorizationConfig",
        Some (f_sx_windows_file_server_authorization_config_to_yojson x.authorization_config) );
    ]

let s3_files_volume_configuration_to_yojson (x : s3_files_volume_configuration) =
  assoc_to_yojson
    [
      ("fileSystemArn", Some (string__to_yojson x.file_system_arn));
      ("rootDirectory", option_to_yojson string__to_yojson x.root_directory);
      ("transitEncryptionPort", option_to_yojson boxed_integer_to_yojson x.transit_encryption_port);
      ("accessPointArn", option_to_yojson string__to_yojson x.access_point_arn);
    ]

let efs_authorization_config_ia_m_to_yojson (x : efs_authorization_config_ia_m) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let efs_authorization_config_to_yojson (x : efs_authorization_config) =
  assoc_to_yojson
    [
      ("accessPointId", option_to_yojson string__to_yojson x.access_point_id);
      ("iam", option_to_yojson efs_authorization_config_ia_m_to_yojson x.iam);
    ]

let efs_transit_encryption_to_yojson (x : efs_transit_encryption) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let efs_volume_configuration_to_yojson (x : efs_volume_configuration) =
  assoc_to_yojson
    [
      ("fileSystemId", Some (string__to_yojson x.file_system_id));
      ("rootDirectory", option_to_yojson string__to_yojson x.root_directory);
      ("transitEncryption", option_to_yojson efs_transit_encryption_to_yojson x.transit_encryption);
      ("transitEncryptionPort", option_to_yojson boxed_integer_to_yojson x.transit_encryption_port);
      ( "authorizationConfig",
        option_to_yojson efs_authorization_config_to_yojson x.authorization_config );
    ]

let string_map_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree
let scope_to_yojson (x : scope) = match x with TASK -> `String "task" | SHARED -> `String "shared"

let docker_volume_configuration_to_yojson (x : docker_volume_configuration) =
  assoc_to_yojson
    [
      ("scope", option_to_yojson scope_to_yojson x.scope);
      ("autoprovision", option_to_yojson boxed_boolean_to_yojson x.autoprovision);
      ("driver", option_to_yojson string__to_yojson x.driver);
      ("driverOpts", option_to_yojson string_map_to_yojson x.driver_opts);
      ("labels", option_to_yojson string_map_to_yojson x.labels);
    ]

let host_volume_properties_to_yojson (x : host_volume_properties) =
  assoc_to_yojson [ ("sourcePath", option_to_yojson string__to_yojson x.source_path) ]

let volume_to_yojson (x : volume) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("host", option_to_yojson host_volume_properties_to_yojson x.host);
      ( "dockerVolumeConfiguration",
        option_to_yojson docker_volume_configuration_to_yojson x.docker_volume_configuration );
      ( "efsVolumeConfiguration",
        option_to_yojson efs_volume_configuration_to_yojson x.efs_volume_configuration );
      ( "s3filesVolumeConfiguration",
        option_to_yojson s3_files_volume_configuration_to_yojson x.s3files_volume_configuration );
      ( "fsxWindowsFileServerVolumeConfiguration",
        option_to_yojson f_sx_windows_file_server_volume_configuration_to_yojson
          x.fsx_windows_file_server_volume_configuration );
      ("configuredAtLaunch", option_to_yojson boxed_boolean_to_yojson x.configured_at_launch);
    ]

let volume_list_to_yojson tree = list_to_yojson volume_to_yojson tree

let network_mode_to_yojson (x : network_mode) =
  match x with
  | BRIDGE -> `String "bridge"
  | HOST -> `String "host"
  | AWSVPC -> `String "awsvpc"
  | NONE -> `String "none"

let firelens_configuration_options_map_to_yojson tree =
  map_to_yojson string__to_yojson string__to_yojson tree

let firelens_configuration_type_to_yojson (x : firelens_configuration_type) =
  match x with FLUENTD -> `String "fluentd" | FLUENTBIT -> `String "fluentbit"

let firelens_configuration_to_yojson (x : firelens_configuration) =
  assoc_to_yojson
    [
      ("type", Some (firelens_configuration_type_to_yojson x.type_));
      ("options", option_to_yojson firelens_configuration_options_map_to_yojson x.options);
    ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | GPU -> `String "GPU"
  | INFERENCE_ACCELERATOR -> `String "InferenceAccelerator"
  | NEURON_DEVICE -> `String "NeuronDevice"

let resource_requirement_to_yojson (x : resource_requirement) =
  assoc_to_yojson
    [
      ("value", Some (string__to_yojson x.value)); ("type", Some (resource_type_to_yojson x.type_));
    ]

let resource_requirements_to_yojson tree = list_to_yojson resource_requirement_to_yojson tree

let system_control_to_yojson (x : system_control) =
  assoc_to_yojson
    [
      ("namespace", option_to_yojson string__to_yojson x.namespace);
      ("value", option_to_yojson string__to_yojson x.value);
    ]

let system_controls_to_yojson tree = list_to_yojson system_control_to_yojson tree

let health_check_to_yojson (x : health_check) =
  assoc_to_yojson
    [
      ("command", Some (string_list_to_yojson x.command));
      ("interval", option_to_yojson boxed_integer_to_yojson x.interval);
      ("timeout", option_to_yojson boxed_integer_to_yojson x.timeout);
      ("retries", option_to_yojson boxed_integer_to_yojson x.retries);
      ("startPeriod", option_to_yojson boxed_integer_to_yojson x.start_period);
    ]

let secret_to_yojson (x : secret) =
  assoc_to_yojson
    [
      ("name", Some (string__to_yojson x.name)); ("valueFrom", Some (string__to_yojson x.value_from));
    ]

let secret_list_to_yojson tree = list_to_yojson secret_to_yojson tree

let log_configuration_options_map_to_yojson tree =
  map_to_yojson string__to_yojson string__to_yojson tree

let log_driver_to_yojson (x : log_driver) =
  match x with
  | JSON_FILE -> `String "json-file"
  | SYSLOG -> `String "syslog"
  | JOURNALD -> `String "journald"
  | GELF -> `String "gelf"
  | FLUENTD -> `String "fluentd"
  | AWSLOGS -> `String "awslogs"
  | SPLUNK -> `String "splunk"
  | AWSFIRELENS -> `String "awsfirelens"

let log_configuration_to_yojson (x : log_configuration) =
  assoc_to_yojson
    [
      ("logDriver", Some (log_driver_to_yojson x.log_driver));
      ("options", option_to_yojson log_configuration_options_map_to_yojson x.options);
      ("secretOptions", option_to_yojson secret_list_to_yojson x.secret_options);
    ]

let ulimit_name_to_yojson (x : ulimit_name) =
  match x with
  | CORE -> `String "core"
  | CPU -> `String "cpu"
  | DATA -> `String "data"
  | FSIZE -> `String "fsize"
  | LOCKS -> `String "locks"
  | MEMLOCK -> `String "memlock"
  | MSGQUEUE -> `String "msgqueue"
  | NICE -> `String "nice"
  | NOFILE -> `String "nofile"
  | NPROC -> `String "nproc"
  | RSS -> `String "rss"
  | RTPRIO -> `String "rtprio"
  | RTTIME -> `String "rttime"
  | SIGPENDING -> `String "sigpending"
  | STACK -> `String "stack"

let ulimit_to_yojson (x : ulimit) =
  assoc_to_yojson
    [
      ("name", Some (ulimit_name_to_yojson x.name));
      ("softLimit", Some (integer_to_yojson x.soft_limit));
      ("hardLimit", Some (integer_to_yojson x.hard_limit));
    ]

let ulimit_list_to_yojson tree = list_to_yojson ulimit_to_yojson tree
let docker_labels_map_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree

let host_entry_to_yojson (x : host_entry) =
  assoc_to_yojson
    [
      ("hostname", Some (string__to_yojson x.hostname));
      ("ipAddress", Some (string__to_yojson x.ip_address));
    ]

let host_entry_list_to_yojson tree = list_to_yojson host_entry_to_yojson tree

let version_consistency_to_yojson (x : version_consistency) =
  match x with ENABLED -> `String "enabled" | DISABLED -> `String "disabled"

let container_condition_to_yojson (x : container_condition) =
  match x with
  | START -> `String "START"
  | COMPLETE -> `String "COMPLETE"
  | SUCCESS -> `String "SUCCESS"
  | HEALTHY -> `String "HEALTHY"

let container_dependency_to_yojson (x : container_dependency) =
  assoc_to_yojson
    [
      ("containerName", Some (string__to_yojson x.container_name));
      ("condition", Some (container_condition_to_yojson x.condition));
    ]

let container_dependencies_to_yojson tree = list_to_yojson container_dependency_to_yojson tree

let tmpfs_to_yojson (x : tmpfs) =
  assoc_to_yojson
    [
      ("containerPath", Some (string__to_yojson x.container_path));
      ("size", Some (integer_to_yojson x.size));
      ("mountOptions", option_to_yojson string_list_to_yojson x.mount_options);
    ]

let tmpfs_list_to_yojson tree = list_to_yojson tmpfs_to_yojson tree

let device_cgroup_permission_to_yojson (x : device_cgroup_permission) =
  match x with READ -> `String "read" | WRITE -> `String "write" | MKNOD -> `String "mknod"

let device_cgroup_permissions_to_yojson tree =
  list_to_yojson device_cgroup_permission_to_yojson tree

let device_to_yojson (x : device) =
  assoc_to_yojson
    [
      ("hostPath", Some (string__to_yojson x.host_path));
      ("containerPath", option_to_yojson string__to_yojson x.container_path);
      ("permissions", option_to_yojson device_cgroup_permissions_to_yojson x.permissions);
    ]

let devices_list_to_yojson tree = list_to_yojson device_to_yojson tree

let kernel_capabilities_to_yojson (x : kernel_capabilities) =
  assoc_to_yojson
    [
      ("add", option_to_yojson string_list_to_yojson x.add);
      ("drop", option_to_yojson string_list_to_yojson x.drop);
    ]

let linux_parameters_to_yojson (x : linux_parameters) =
  assoc_to_yojson
    [
      ("capabilities", option_to_yojson kernel_capabilities_to_yojson x.capabilities);
      ("devices", option_to_yojson devices_list_to_yojson x.devices);
      ("initProcessEnabled", option_to_yojson boxed_boolean_to_yojson x.init_process_enabled);
      ("sharedMemorySize", option_to_yojson boxed_integer_to_yojson x.shared_memory_size);
      ("tmpfs", option_to_yojson tmpfs_list_to_yojson x.tmpfs);
      ("maxSwap", option_to_yojson boxed_integer_to_yojson x.max_swap);
      ("swappiness", option_to_yojson boxed_integer_to_yojson x.swappiness);
    ]

let volume_from_to_yojson (x : volume_from) =
  assoc_to_yojson
    [
      ("sourceContainer", option_to_yojson string__to_yojson x.source_container);
      ("readOnly", option_to_yojson boxed_boolean_to_yojson x.read_only);
    ]

let volume_from_list_to_yojson tree = list_to_yojson volume_from_to_yojson tree

let mount_point_to_yojson (x : mount_point) =
  assoc_to_yojson
    [
      ("sourceVolume", option_to_yojson string__to_yojson x.source_volume);
      ("containerPath", option_to_yojson string__to_yojson x.container_path);
      ("readOnly", option_to_yojson boxed_boolean_to_yojson x.read_only);
    ]

let mount_point_list_to_yojson tree = list_to_yojson mount_point_to_yojson tree
let environment_file_type_to_yojson (x : environment_file_type) = match x with S3 -> `String "s3"

let environment_file_to_yojson (x : environment_file) =
  assoc_to_yojson
    [
      ("value", Some (string__to_yojson x.value));
      ("type", Some (environment_file_type_to_yojson x.type_));
    ]

let environment_files_to_yojson tree = list_to_yojson environment_file_to_yojson tree
let environment_variables_to_yojson tree = list_to_yojson key_value_pair_to_yojson tree
let integer_list_to_yojson tree = list_to_yojson boxed_integer_to_yojson tree

let container_restart_policy_to_yojson (x : container_restart_policy) =
  assoc_to_yojson
    [
      ("enabled", Some (boxed_boolean_to_yojson x.enabled));
      ("ignoredExitCodes", option_to_yojson integer_list_to_yojson x.ignored_exit_codes);
      ("restartAttemptPeriod", option_to_yojson boxed_integer_to_yojson x.restart_attempt_period);
    ]

let application_protocol_to_yojson (x : application_protocol) =
  match x with HTTP -> `String "http" | HTTP2 -> `String "http2" | GRPC -> `String "grpc"

let transport_protocol_to_yojson (x : transport_protocol) =
  match x with TCP -> `String "tcp" | UDP -> `String "udp"

let port_mapping_to_yojson (x : port_mapping) =
  assoc_to_yojson
    [
      ("containerPort", option_to_yojson boxed_integer_to_yojson x.container_port);
      ("hostPort", option_to_yojson boxed_integer_to_yojson x.host_port);
      ("protocol", option_to_yojson transport_protocol_to_yojson x.protocol);
      ("name", option_to_yojson string__to_yojson x.name);
      ("appProtocol", option_to_yojson application_protocol_to_yojson x.app_protocol);
      ("containerPortRange", option_to_yojson string__to_yojson x.container_port_range);
    ]

let port_mapping_list_to_yojson tree = list_to_yojson port_mapping_to_yojson tree

let repository_credentials_to_yojson (x : repository_credentials) =
  assoc_to_yojson [ ("credentialsParameter", Some (string__to_yojson x.credentials_parameter)) ]

let container_definition_to_yojson (x : container_definition) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("image", option_to_yojson string__to_yojson x.image);
      ( "repositoryCredentials",
        option_to_yojson repository_credentials_to_yojson x.repository_credentials );
      ("cpu", option_to_yojson integer_to_yojson x.cpu);
      ("memory", option_to_yojson boxed_integer_to_yojson x.memory);
      ("memoryReservation", option_to_yojson boxed_integer_to_yojson x.memory_reservation);
      ("links", option_to_yojson string_list_to_yojson x.links);
      ("portMappings", option_to_yojson port_mapping_list_to_yojson x.port_mappings);
      ("essential", option_to_yojson boxed_boolean_to_yojson x.essential);
      ("restartPolicy", option_to_yojson container_restart_policy_to_yojson x.restart_policy);
      ("entryPoint", option_to_yojson string_list_to_yojson x.entry_point);
      ("command", option_to_yojson string_list_to_yojson x.command);
      ("environment", option_to_yojson environment_variables_to_yojson x.environment);
      ("environmentFiles", option_to_yojson environment_files_to_yojson x.environment_files);
      ("mountPoints", option_to_yojson mount_point_list_to_yojson x.mount_points);
      ("volumesFrom", option_to_yojson volume_from_list_to_yojson x.volumes_from);
      ("linuxParameters", option_to_yojson linux_parameters_to_yojson x.linux_parameters);
      ("secrets", option_to_yojson secret_list_to_yojson x.secrets);
      ("dependsOn", option_to_yojson container_dependencies_to_yojson x.depends_on);
      ("startTimeout", option_to_yojson boxed_integer_to_yojson x.start_timeout);
      ("stopTimeout", option_to_yojson boxed_integer_to_yojson x.stop_timeout);
      ("versionConsistency", option_to_yojson version_consistency_to_yojson x.version_consistency);
      ("hostname", option_to_yojson string__to_yojson x.hostname);
      ("user", option_to_yojson string__to_yojson x.user);
      ("workingDirectory", option_to_yojson string__to_yojson x.working_directory);
      ("disableNetworking", option_to_yojson boxed_boolean_to_yojson x.disable_networking);
      ("privileged", option_to_yojson boxed_boolean_to_yojson x.privileged);
      ("readonlyRootFilesystem", option_to_yojson boxed_boolean_to_yojson x.readonly_root_filesystem);
      ("dnsServers", option_to_yojson string_list_to_yojson x.dns_servers);
      ("dnsSearchDomains", option_to_yojson string_list_to_yojson x.dns_search_domains);
      ("extraHosts", option_to_yojson host_entry_list_to_yojson x.extra_hosts);
      ("dockerSecurityOptions", option_to_yojson string_list_to_yojson x.docker_security_options);
      ("interactive", option_to_yojson boxed_boolean_to_yojson x.interactive);
      ("pseudoTerminal", option_to_yojson boxed_boolean_to_yojson x.pseudo_terminal);
      ("dockerLabels", option_to_yojson docker_labels_map_to_yojson x.docker_labels);
      ("ulimits", option_to_yojson ulimit_list_to_yojson x.ulimits);
      ("logConfiguration", option_to_yojson log_configuration_to_yojson x.log_configuration);
      ("healthCheck", option_to_yojson health_check_to_yojson x.health_check);
      ("systemControls", option_to_yojson system_controls_to_yojson x.system_controls);
      ( "resourceRequirements",
        option_to_yojson resource_requirements_to_yojson x.resource_requirements );
      ( "firelensConfiguration",
        option_to_yojson firelens_configuration_to_yojson x.firelens_configuration );
      ("credentialSpecs", option_to_yojson string_list_to_yojson x.credential_specs);
    ]

let container_definitions_to_yojson tree = list_to_yojson container_definition_to_yojson tree

let task_definition_to_yojson (x : task_definition) =
  assoc_to_yojson
    [
      ("taskDefinitionArn", option_to_yojson string__to_yojson x.task_definition_arn);
      ( "containerDefinitions",
        option_to_yojson container_definitions_to_yojson x.container_definitions );
      ("family", option_to_yojson string__to_yojson x.family);
      ("taskRoleArn", option_to_yojson string__to_yojson x.task_role_arn);
      ("executionRoleArn", option_to_yojson string__to_yojson x.execution_role_arn);
      ("networkMode", option_to_yojson network_mode_to_yojson x.network_mode);
      ("revision", option_to_yojson integer_to_yojson x.revision);
      ("volumes", option_to_yojson volume_list_to_yojson x.volumes);
      ("status", option_to_yojson task_definition_status_to_yojson x.status);
      ("requiresAttributes", option_to_yojson requires_attributes_to_yojson x.requires_attributes);
      ( "placementConstraints",
        option_to_yojson task_definition_placement_constraints_to_yojson x.placement_constraints );
      ("compatibilities", option_to_yojson compatibility_list_to_yojson x.compatibilities);
      ("runtimePlatform", option_to_yojson runtime_platform_to_yojson x.runtime_platform);
      ( "requiresCompatibilities",
        option_to_yojson compatibility_list_to_yojson x.requires_compatibilities );
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ( "inferenceAccelerators",
        option_to_yojson inference_accelerators_to_yojson x.inference_accelerators );
      ("pidMode", option_to_yojson pid_mode_to_yojson x.pid_mode);
      ("ipcMode", option_to_yojson ipc_mode_to_yojson x.ipc_mode);
      ("proxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ("registeredAt", option_to_yojson timestamp_to_yojson x.registered_at);
      ("deregisteredAt", option_to_yojson timestamp_to_yojson x.deregistered_at);
      ("deleteRequestedAt", option_to_yojson timestamp_to_yojson x.delete_requested_at);
      ("registeredBy", option_to_yojson string__to_yojson x.registered_by);
      ("ephemeralStorage", option_to_yojson ephemeral_storage_to_yojson x.ephemeral_storage);
      ("enableFaultInjection", option_to_yojson boxed_boolean_to_yojson x.enable_fault_injection);
    ]

let describe_task_definition_response_to_yojson (x : describe_task_definition_response) =
  assoc_to_yojson
    [
      ("taskDefinition", option_to_yojson task_definition_to_yojson x.task_definition);
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let task_definition_field_to_yojson (x : task_definition_field) =
  match x with TAGS -> `String "TAGS"

let task_definition_field_list_to_yojson tree = list_to_yojson task_definition_field_to_yojson tree

let describe_task_definition_request_to_yojson (x : describe_task_definition_request) =
  assoc_to_yojson
    [
      ("taskDefinition", Some (string__to_yojson x.task_definition));
      ("include", option_to_yojson task_definition_field_list_to_yojson x.include_);
    ]

let deregister_task_definition_response_to_yojson (x : deregister_task_definition_response) =
  assoc_to_yojson
    [ ("taskDefinition", option_to_yojson task_definition_to_yojson x.task_definition) ]

let deregister_task_definition_request_to_yojson (x : deregister_task_definition_request) =
  assoc_to_yojson [ ("taskDefinition", Some (string__to_yojson x.task_definition)) ]

let delete_account_setting_response_to_yojson (x : delete_account_setting_response) =
  assoc_to_yojson [ ("setting", option_to_yojson setting_to_yojson x.setting) ]

let delete_account_setting_request_to_yojson (x : delete_account_setting_request) =
  assoc_to_yojson
    [
      ("name", Some (setting_name_to_yojson x.name));
      ("principalArn", option_to_yojson string__to_yojson x.principal_arn);
    ]

let unsupported_feature_exception_to_yojson (x : unsupported_feature_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let service_deployment_not_found_exception_to_yojson (x : service_deployment_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let continue_service_deployment_response_to_yojson (x : continue_service_deployment_response) =
  assoc_to_yojson
    [ ("serviceDeploymentArn", option_to_yojson string__to_yojson x.service_deployment_arn) ]

let deployment_lifecycle_hook_action_to_yojson (x : deployment_lifecycle_hook_action) =
  match x with ROLLBACK -> `String "ROLLBACK" | CONTINUE -> `String "CONTINUE"

let continue_service_deployment_request_to_yojson (x : continue_service_deployment_request) =
  assoc_to_yojson
    [
      ("serviceDeploymentArn", Some (string__to_yojson x.service_deployment_arn));
      ("hookId", Some (string__to_yojson x.hook_id));
      ("action", option_to_yojson deployment_lifecycle_hook_action_to_yojson x.action);
    ]

let assign_public_ip_to_yojson (x : assign_public_ip) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let attachment_details_to_yojson tree = list_to_yojson key_value_pair_to_yojson tree

let attachment_to_yojson (x : attachment) =
  assoc_to_yojson
    [
      ("id", option_to_yojson string__to_yojson x.id);
      ("type", option_to_yojson string__to_yojson x.type_);
      ("status", option_to_yojson string__to_yojson x.status);
      ("details", option_to_yojson attachment_details_to_yojson x.details);
    ]

let attachment_state_change_to_yojson (x : attachment_state_change) =
  assoc_to_yojson
    [
      ("attachmentArn", Some (string__to_yojson x.attachment_arn));
      ("status", Some (string__to_yojson x.status));
    ]

let attachment_state_changes_to_yojson tree = list_to_yojson attachment_state_change_to_yojson tree
let attachments_to_yojson tree = list_to_yojson attachment_to_yojson tree

let attribute_limit_exceeded_exception_to_yojson (x : attribute_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let attributes_to_yojson tree = list_to_yojson attribute_to_yojson tree

let auto_repair_actions_status_to_yojson (x : auto_repair_actions_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let auto_repair_configuration_to_yojson (x : auto_repair_configuration) =
  assoc_to_yojson
    [ ("actionsStatus", option_to_yojson auto_repair_actions_status_to_yojson x.actions_status) ]

let managed_draining_to_yojson (x : managed_draining) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let managed_termination_protection_to_yojson (x : managed_termination_protection) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let managed_scaling_instance_warmup_period_to_yojson = int_to_yojson
let managed_scaling_step_size_to_yojson = int_to_yojson
let managed_scaling_target_capacity_to_yojson = int_to_yojson

let managed_scaling_status_to_yojson (x : managed_scaling_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let managed_scaling_to_yojson (x : managed_scaling) =
  assoc_to_yojson
    [
      ("status", option_to_yojson managed_scaling_status_to_yojson x.status);
      ( "targetCapacity",
        option_to_yojson managed_scaling_target_capacity_to_yojson x.target_capacity );
      ( "minimumScalingStepSize",
        option_to_yojson managed_scaling_step_size_to_yojson x.minimum_scaling_step_size );
      ( "maximumScalingStepSize",
        option_to_yojson managed_scaling_step_size_to_yojson x.maximum_scaling_step_size );
      ( "instanceWarmupPeriod",
        option_to_yojson managed_scaling_instance_warmup_period_to_yojson x.instance_warmup_period
      );
    ]

let auto_scaling_group_provider_to_yojson (x : auto_scaling_group_provider) =
  assoc_to_yojson
    [
      ("autoScalingGroupArn", Some (string__to_yojson x.auto_scaling_group_arn));
      ("managedScaling", option_to_yojson managed_scaling_to_yojson x.managed_scaling);
      ( "managedTerminationProtection",
        option_to_yojson managed_termination_protection_to_yojson x.managed_termination_protection
      );
      ("managedDraining", option_to_yojson managed_draining_to_yojson x.managed_draining);
    ]

let auto_scaling_group_provider_update_to_yojson (x : auto_scaling_group_provider_update) =
  assoc_to_yojson
    [
      ("managedScaling", option_to_yojson managed_scaling_to_yojson x.managed_scaling);
      ( "managedTerminationProtection",
        option_to_yojson managed_termination_protection_to_yojson x.managed_termination_protection
      );
      ("managedDraining", option_to_yojson managed_draining_to_yojson x.managed_draining);
    ]

let availability_zone_rebalancing_to_yojson (x : availability_zone_rebalancing) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let aws_vpc_configuration_to_yojson (x : aws_vpc_configuration) =
  assoc_to_yojson
    [
      ("subnets", Some (string_list_to_yojson x.subnets));
      ("securityGroups", option_to_yojson string_list_to_yojson x.security_groups);
      ("assignPublicIp", option_to_yojson assign_public_ip_to_yojson x.assign_public_ip);
    ]

let bare_metal_to_yojson (x : bare_metal) =
  match x with
  | INCLUDED -> `String "included"
  | REQUIRED -> `String "required"
  | EXCLUDED -> `String "excluded"

let baseline_ebs_bandwidth_mbps_request_to_yojson (x : baseline_ebs_bandwidth_mbps_request) =
  assoc_to_yojson
    [
      ("min", option_to_yojson boxed_integer_to_yojson x.min);
      ("max", option_to_yojson boxed_integer_to_yojson x.max);
    ]

let blocked_exception_to_yojson (x : blocked_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let boxed_double_to_yojson = double_to_yojson

let burstable_performance_to_yojson (x : burstable_performance) =
  match x with
  | INCLUDED -> `String "included"
  | REQUIRED -> `String "required"
  | EXCLUDED -> `String "excluded"

let double_to_yojson = double_to_yojson

let canary_configuration_to_yojson (x : canary_configuration) =
  assoc_to_yojson
    [
      ("canaryPercent", option_to_yojson double_to_yojson x.canary_percent);
      ("canaryBakeTimeInMinutes", option_to_yojson integer_to_yojson x.canary_bake_time_in_minutes);
    ]

let capacity_option_type_to_yojson (x : capacity_option_type) =
  match x with
  | ON_DEMAND -> `String "ON_DEMAND"
  | SPOT -> `String "SPOT"
  | RESERVED -> `String "RESERVED"

let capacity_provider_type_to_yojson (x : capacity_provider_type) =
  match x with
  | EC2_AUTOSCALING -> `String "EC2_AUTOSCALING"
  | MANAGED_INSTANCES -> `String "MANAGED_INSTANCES"
  | FARGATE -> `String "FARGATE"
  | FARGATE_SPOT -> `String "FARGATE_SPOT"

let capacity_provider_update_status_to_yojson (x : capacity_provider_update_status) =
  match x with
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_COMPLETE -> `String "CREATE_COMPLETE"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | DELETE_COMPLETE -> `String "DELETE_COMPLETE"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | UPDATE_COMPLETE -> `String "UPDATE_COMPLETE"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"

let infrastructure_optimization_to_yojson (x : infrastructure_optimization) =
  assoc_to_yojson [ ("scaleInAfter", option_to_yojson boxed_integer_to_yojson x.scale_in_after) ]

let propagate_mi_tags_to_yojson (x : propagate_mi_tags) =
  match x with CAPACITY_PROVIDER -> `String "CAPACITY_PROVIDER" | NONE -> `String "NONE"

let capacity_reservation_preference_to_yojson (x : capacity_reservation_preference) =
  match x with
  | RESERVATIONS_ONLY -> `String "RESERVATIONS_ONLY"
  | RESERVATIONS_FIRST -> `String "RESERVATIONS_FIRST"
  | RESERVATIONS_EXCLUDED -> `String "RESERVATIONS_EXCLUDED"

let capacity_reservation_request_to_yojson (x : capacity_reservation_request) =
  assoc_to_yojson
    [
      ("reservationGroupArn", option_to_yojson string__to_yojson x.reservation_group_arn);
      ( "reservationPreference",
        option_to_yojson capacity_reservation_preference_to_yojson x.reservation_preference );
    ]

let network_bandwidth_gbps_request_to_yojson (x : network_bandwidth_gbps_request) =
  assoc_to_yojson
    [
      ("min", option_to_yojson boxed_double_to_yojson x.min);
      ("max", option_to_yojson boxed_double_to_yojson x.max);
    ]

let total_local_storage_gb_request_to_yojson (x : total_local_storage_gb_request) =
  assoc_to_yojson
    [
      ("min", option_to_yojson boxed_double_to_yojson x.min);
      ("max", option_to_yojson boxed_double_to_yojson x.max);
    ]

let local_storage_type_to_yojson (x : local_storage_type) =
  match x with HDD -> `String "hdd" | SSD -> `String "ssd"

let local_storage_type_set_to_yojson tree = list_to_yojson local_storage_type_to_yojson tree

let local_storage_to_yojson (x : local_storage) =
  match x with
  | INCLUDED -> `String "included"
  | REQUIRED -> `String "required"
  | EXCLUDED -> `String "excluded"

let network_interface_count_request_to_yojson (x : network_interface_count_request) =
  assoc_to_yojson
    [
      ("min", option_to_yojson boxed_integer_to_yojson x.min);
      ("max", option_to_yojson boxed_integer_to_yojson x.max);
    ]

let instance_generation_to_yojson (x : instance_generation) =
  match x with CURRENT -> `String "current" | PREVIOUS -> `String "previous"

let instance_generation_set_to_yojson tree = list_to_yojson instance_generation_to_yojson tree
let excluded_instance_type_to_yojson = string_to_yojson
let excluded_instance_type_set_to_yojson tree = list_to_yojson excluded_instance_type_to_yojson tree

let memory_gi_b_per_v_cpu_request_to_yojson (x : memory_gi_b_per_v_cpu_request) =
  assoc_to_yojson
    [
      ("min", option_to_yojson boxed_double_to_yojson x.min);
      ("max", option_to_yojson boxed_double_to_yojson x.max);
    ]

let cpu_manufacturer_to_yojson (x : cpu_manufacturer) =
  match x with
  | INTEL -> `String "intel"
  | AMD -> `String "amd"
  | AMAZON_WEB_SERVICES -> `String "amazon-web-services"

let cpu_manufacturer_set_to_yojson tree = list_to_yojson cpu_manufacturer_to_yojson tree

let memory_mi_b_request_to_yojson (x : memory_mi_b_request) =
  assoc_to_yojson
    [
      ("min", Some (boxed_integer_to_yojson x.min));
      ("max", option_to_yojson boxed_integer_to_yojson x.max);
    ]

let v_cpu_count_range_request_to_yojson (x : v_cpu_count_range_request) =
  assoc_to_yojson
    [
      ("min", Some (boxed_integer_to_yojson x.min));
      ("max", option_to_yojson boxed_integer_to_yojson x.max);
    ]

let instance_requirements_request_to_yojson (x : instance_requirements_request) =
  assoc_to_yojson
    [
      ("vCpuCount", Some (v_cpu_count_range_request_to_yojson x.v_cpu_count));
      ("memoryMiB", Some (memory_mi_b_request_to_yojson x.memory_mi_b));
      ("cpuManufacturers", option_to_yojson cpu_manufacturer_set_to_yojson x.cpu_manufacturers);
      ( "memoryGiBPerVCpu",
        option_to_yojson memory_gi_b_per_v_cpu_request_to_yojson x.memory_gi_b_per_v_cpu );
      ( "excludedInstanceTypes",
        option_to_yojson excluded_instance_type_set_to_yojson x.excluded_instance_types );
      ( "instanceGenerations",
        option_to_yojson instance_generation_set_to_yojson x.instance_generations );
      ( "spotMaxPricePercentageOverLowestPrice",
        option_to_yojson boxed_integer_to_yojson x.spot_max_price_percentage_over_lowest_price );
      ( "onDemandMaxPricePercentageOverLowestPrice",
        option_to_yojson boxed_integer_to_yojson x.on_demand_max_price_percentage_over_lowest_price
      );
      ("bareMetal", option_to_yojson bare_metal_to_yojson x.bare_metal);
      ( "burstablePerformance",
        option_to_yojson burstable_performance_to_yojson x.burstable_performance );
      ( "requireHibernateSupport",
        option_to_yojson boxed_boolean_to_yojson x.require_hibernate_support );
      ( "networkInterfaceCount",
        option_to_yojson network_interface_count_request_to_yojson x.network_interface_count );
      ("localStorage", option_to_yojson local_storage_to_yojson x.local_storage);
      ("localStorageTypes", option_to_yojson local_storage_type_set_to_yojson x.local_storage_types);
      ( "totalLocalStorageGB",
        option_to_yojson total_local_storage_gb_request_to_yojson x.total_local_storage_g_b );
      ( "baselineEbsBandwidthMbps",
        option_to_yojson baseline_ebs_bandwidth_mbps_request_to_yojson x.baseline_ebs_bandwidth_mbps
      );
      ("acceleratorTypes", option_to_yojson accelerator_type_set_to_yojson x.accelerator_types);
      ("acceleratorCount", option_to_yojson accelerator_count_request_to_yojson x.accelerator_count);
      ( "acceleratorManufacturers",
        option_to_yojson accelerator_manufacturer_set_to_yojson x.accelerator_manufacturers );
      ("acceleratorNames", option_to_yojson accelerator_name_set_to_yojson x.accelerator_names);
      ( "acceleratorTotalMemoryMiB",
        option_to_yojson accelerator_total_memory_mi_b_request_to_yojson
          x.accelerator_total_memory_mi_b );
      ( "networkBandwidthGbps",
        option_to_yojson network_bandwidth_gbps_request_to_yojson x.network_bandwidth_gbps );
      ( "allowedInstanceTypes",
        option_to_yojson allowed_instance_type_set_to_yojson x.allowed_instance_types );
      ( "maxSpotPriceAsPercentageOfOptimalOnDemandPrice",
        option_to_yojson boxed_integer_to_yojson
          x.max_spot_price_as_percentage_of_optimal_on_demand_price );
    ]

let managed_instances_monitoring_options_to_yojson (x : managed_instances_monitoring_options) =
  match x with BASIC -> `String "BASIC" | DETAILED -> `String "DETAILED"

let managed_instances_local_storage_configuration_to_yojson
    (x : managed_instances_local_storage_configuration) =
  assoc_to_yojson [ ("useLocalStorage", option_to_yojson boolean__to_yojson x.use_local_storage) ]

let task_volume_storage_gi_b_to_yojson = int_to_yojson

let managed_instances_storage_configuration_to_yojson (x : managed_instances_storage_configuration)
    =
  assoc_to_yojson
    [ ("storageSizeGiB", option_to_yojson task_volume_storage_gi_b_to_yojson x.storage_size_gi_b) ]

let managed_instances_network_configuration_to_yojson (x : managed_instances_network_configuration)
    =
  assoc_to_yojson
    [
      ("subnets", option_to_yojson string_list_to_yojson x.subnets);
      ("securityGroups", option_to_yojson string_list_to_yojson x.security_groups);
    ]

let instance_launch_template_to_yojson (x : instance_launch_template) =
  assoc_to_yojson
    [
      ("ec2InstanceProfileArn", Some (string__to_yojson x.ec2_instance_profile_arn));
      ( "networkConfiguration",
        Some (managed_instances_network_configuration_to_yojson x.network_configuration) );
      ( "storageConfiguration",
        option_to_yojson managed_instances_storage_configuration_to_yojson x.storage_configuration
      );
      ( "localStorageConfiguration",
        option_to_yojson managed_instances_local_storage_configuration_to_yojson
          x.local_storage_configuration );
      ("monitoring", option_to_yojson managed_instances_monitoring_options_to_yojson x.monitoring);
      ("capacityOptionType", option_to_yojson capacity_option_type_to_yojson x.capacity_option_type);
      ( "instanceMetadataTagsPropagation",
        option_to_yojson boxed_boolean_to_yojson x.instance_metadata_tags_propagation );
      ( "instanceRequirements",
        option_to_yojson instance_requirements_request_to_yojson x.instance_requirements );
      ("fipsEnabled", option_to_yojson boxed_boolean_to_yojson x.fips_enabled);
      ( "capacityReservations",
        option_to_yojson capacity_reservation_request_to_yojson x.capacity_reservations );
    ]

let managed_instances_provider_to_yojson (x : managed_instances_provider) =
  assoc_to_yojson
    [
      ("infrastructureRoleArn", option_to_yojson string__to_yojson x.infrastructure_role_arn);
      ( "instanceLaunchTemplate",
        option_to_yojson instance_launch_template_to_yojson x.instance_launch_template );
      ("propagateTags", option_to_yojson propagate_mi_tags_to_yojson x.propagate_tags);
      ( "infrastructureOptimization",
        option_to_yojson infrastructure_optimization_to_yojson x.infrastructure_optimization );
      ( "autoRepairConfiguration",
        option_to_yojson auto_repair_configuration_to_yojson x.auto_repair_configuration );
    ]

let capacity_provider_status_to_yojson (x : capacity_provider_status) =
  match x with
  | PROVISIONING -> `String "PROVISIONING"
  | ACTIVE -> `String "ACTIVE"
  | DEPROVISIONING -> `String "DEPROVISIONING"
  | INACTIVE -> `String "INACTIVE"

let capacity_provider_to_yojson (x : capacity_provider) =
  assoc_to_yojson
    [
      ("capacityProviderArn", option_to_yojson string__to_yojson x.capacity_provider_arn);
      ("name", option_to_yojson string__to_yojson x.name);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("status", option_to_yojson capacity_provider_status_to_yojson x.status);
      ( "autoScalingGroupProvider",
        option_to_yojson auto_scaling_group_provider_to_yojson x.auto_scaling_group_provider );
      ( "managedInstancesProvider",
        option_to_yojson managed_instances_provider_to_yojson x.managed_instances_provider );
      ("updateStatus", option_to_yojson capacity_provider_update_status_to_yojson x.update_status);
      ("updateStatusReason", option_to_yojson string__to_yojson x.update_status_reason);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("type", option_to_yojson capacity_provider_type_to_yojson x.type_);
    ]

let capacity_provider_field_to_yojson (x : capacity_provider_field) =
  match x with TAGS -> `String "TAGS"

let capacity_provider_field_list_to_yojson tree =
  list_to_yojson capacity_provider_field_to_yojson tree

let capacity_provider_strategy_item_base_to_yojson = int_to_yojson
let capacity_provider_strategy_item_weight_to_yojson = int_to_yojson

let capacity_provider_strategy_item_to_yojson (x : capacity_provider_strategy_item) =
  assoc_to_yojson
    [
      ("capacityProvider", Some (string__to_yojson x.capacity_provider));
      ("weight", option_to_yojson capacity_provider_strategy_item_weight_to_yojson x.weight);
      ("base", option_to_yojson capacity_provider_strategy_item_base_to_yojson x.base);
    ]

let capacity_provider_strategy_to_yojson tree =
  list_to_yojson capacity_provider_strategy_item_to_yojson tree

let capacity_providers_to_yojson tree = list_to_yojson capacity_provider_to_yojson tree

let cluster_service_connect_defaults_to_yojson (x : cluster_service_connect_defaults) =
  assoc_to_yojson [ ("namespace", option_to_yojson string__to_yojson x.namespace) ]

let cluster_setting_name_to_yojson (x : cluster_setting_name) =
  match x with CONTAINER_INSIGHTS -> `String "containerInsights"

let cluster_setting_to_yojson (x : cluster_setting) =
  assoc_to_yojson
    [
      ("name", option_to_yojson cluster_setting_name_to_yojson x.name);
      ("value", option_to_yojson string__to_yojson x.value);
    ]

let cluster_settings_to_yojson tree = list_to_yojson cluster_setting_to_yojson tree
let statistics_to_yojson tree = list_to_yojson key_value_pair_to_yojson tree

let managed_storage_configuration_to_yojson (x : managed_storage_configuration) =
  assoc_to_yojson
    [
      ("kmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ( "fargateEphemeralStorageKmsKeyId",
        option_to_yojson string__to_yojson x.fargate_ephemeral_storage_kms_key_id );
    ]

let execute_command_log_configuration_to_yojson (x : execute_command_log_configuration) =
  assoc_to_yojson
    [
      ("cloudWatchLogGroupName", option_to_yojson string__to_yojson x.cloud_watch_log_group_name);
      ( "cloudWatchEncryptionEnabled",
        option_to_yojson boolean__to_yojson x.cloud_watch_encryption_enabled );
      ("s3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
      ("s3EncryptionEnabled", option_to_yojson boolean__to_yojson x.s3_encryption_enabled);
      ("s3KeyPrefix", option_to_yojson string__to_yojson x.s3_key_prefix);
    ]

let execute_command_logging_to_yojson (x : execute_command_logging) =
  match x with
  | NONE -> `String "NONE"
  | DEFAULT -> `String "DEFAULT"
  | OVERRIDE -> `String "OVERRIDE"

let execute_command_configuration_to_yojson (x : execute_command_configuration) =
  assoc_to_yojson
    [
      ("kmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("logging", option_to_yojson execute_command_logging_to_yojson x.logging);
      ( "logConfiguration",
        option_to_yojson execute_command_log_configuration_to_yojson x.log_configuration );
    ]

let cluster_configuration_to_yojson (x : cluster_configuration) =
  assoc_to_yojson
    [
      ( "executeCommandConfiguration",
        option_to_yojson execute_command_configuration_to_yojson x.execute_command_configuration );
      ( "managedStorageConfiguration",
        option_to_yojson managed_storage_configuration_to_yojson x.managed_storage_configuration );
    ]

let cluster_to_yojson (x : cluster) =
  assoc_to_yojson
    [
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("clusterName", option_to_yojson string__to_yojson x.cluster_name);
      ("configuration", option_to_yojson cluster_configuration_to_yojson x.configuration);
      ("status", option_to_yojson string__to_yojson x.status);
      ( "registeredContainerInstancesCount",
        option_to_yojson integer_to_yojson x.registered_container_instances_count );
      ("runningTasksCount", option_to_yojson integer_to_yojson x.running_tasks_count);
      ("pendingTasksCount", option_to_yojson integer_to_yojson x.pending_tasks_count);
      ("activeServicesCount", option_to_yojson integer_to_yojson x.active_services_count);
      ("statistics", option_to_yojson statistics_to_yojson x.statistics);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("settings", option_to_yojson cluster_settings_to_yojson x.settings);
      ("capacityProviders", option_to_yojson string_list_to_yojson x.capacity_providers);
      ( "defaultCapacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.default_capacity_provider_strategy
      );
      ("attachments", option_to_yojson attachments_to_yojson x.attachments);
      ("attachmentsStatus", option_to_yojson string__to_yojson x.attachments_status);
      ( "serviceConnectDefaults",
        option_to_yojson cluster_service_connect_defaults_to_yojson x.service_connect_defaults );
    ]

let cluster_contains_capacity_provider_exception_to_yojson
    (x : cluster_contains_capacity_provider_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let cluster_contains_container_instances_exception_to_yojson
    (x : cluster_contains_container_instances_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let cluster_contains_services_exception_to_yojson (x : cluster_contains_services_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let cluster_contains_tasks_exception_to_yojson (x : cluster_contains_tasks_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let cluster_field_to_yojson (x : cluster_field) =
  match x with
  | ATTACHMENTS -> `String "ATTACHMENTS"
  | CONFIGURATIONS -> `String "CONFIGURATIONS"
  | SETTINGS -> `String "SETTINGS"
  | STATISTICS -> `String "STATISTICS"
  | TAGS -> `String "TAGS"

let cluster_field_list_to_yojson tree = list_to_yojson cluster_field_to_yojson tree

let cluster_service_connect_defaults_request_to_yojson
    (x : cluster_service_connect_defaults_request) =
  assoc_to_yojson [ ("namespace", Some (string__to_yojson x.namespace)) ]

let clusters_to_yojson tree = list_to_yojson cluster_to_yojson tree
let resource_ids_to_yojson tree = list_to_yojson string__to_yojson tree

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("resourceIds", option_to_yojson resource_ids_to_yojson x.resource_ids);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let connectivity_to_yojson (x : connectivity) =
  match x with CONNECTED -> `String "CONNECTED" | DISCONNECTED -> `String "DISCONNECTED"

let neuron_device_ids_to_yojson tree = list_to_yojson string__to_yojson tree
let gpu_ids_to_yojson tree = list_to_yojson string__to_yojson tree

let managed_agent_name_to_yojson (x : managed_agent_name) =
  match x with ExecuteCommandAgent -> `String "ExecuteCommandAgent"

let managed_agent_to_yojson (x : managed_agent) =
  assoc_to_yojson
    [
      ("lastStartedAt", option_to_yojson timestamp_to_yojson x.last_started_at);
      ("name", option_to_yojson managed_agent_name_to_yojson x.name);
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("lastStatus", option_to_yojson string__to_yojson x.last_status);
    ]

let managed_agents_to_yojson tree = list_to_yojson managed_agent_to_yojson tree

let health_status_to_yojson (x : health_status) =
  match x with
  | HEALTHY -> `String "HEALTHY"
  | UNHEALTHY -> `String "UNHEALTHY"
  | UNKNOWN -> `String "UNKNOWN"

let network_interface_to_yojson (x : network_interface) =
  assoc_to_yojson
    [
      ("attachmentId", option_to_yojson string__to_yojson x.attachment_id);
      ("privateIpv4Address", option_to_yojson string__to_yojson x.private_ipv4_address);
      ("ipv6Address", option_to_yojson string__to_yojson x.ipv6_address);
    ]

let network_interfaces_to_yojson tree = list_to_yojson network_interface_to_yojson tree

let network_binding_to_yojson (x : network_binding) =
  assoc_to_yojson
    [
      ("bindIP", option_to_yojson string__to_yojson x.bind_i_p);
      ("containerPort", option_to_yojson boxed_integer_to_yojson x.container_port);
      ("hostPort", option_to_yojson boxed_integer_to_yojson x.host_port);
      ("protocol", option_to_yojson transport_protocol_to_yojson x.protocol);
      ("containerPortRange", option_to_yojson string__to_yojson x.container_port_range);
      ("hostPortRange", option_to_yojson string__to_yojson x.host_port_range);
    ]

let network_bindings_to_yojson tree = list_to_yojson network_binding_to_yojson tree

let container_to_yojson (x : container) =
  assoc_to_yojson
    [
      ("containerArn", option_to_yojson string__to_yojson x.container_arn);
      ("taskArn", option_to_yojson string__to_yojson x.task_arn);
      ("name", option_to_yojson string__to_yojson x.name);
      ("image", option_to_yojson string__to_yojson x.image);
      ("imageDigest", option_to_yojson string__to_yojson x.image_digest);
      ("runtimeId", option_to_yojson string__to_yojson x.runtime_id);
      ("lastStatus", option_to_yojson string__to_yojson x.last_status);
      ("exitCode", option_to_yojson boxed_integer_to_yojson x.exit_code);
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("networkBindings", option_to_yojson network_bindings_to_yojson x.network_bindings);
      ("networkInterfaces", option_to_yojson network_interfaces_to_yojson x.network_interfaces);
      ("healthStatus", option_to_yojson health_status_to_yojson x.health_status);
      ("managedAgents", option_to_yojson managed_agents_to_yojson x.managed_agents);
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("memoryReservation", option_to_yojson string__to_yojson x.memory_reservation);
      ("gpuIds", option_to_yojson gpu_ids_to_yojson x.gpu_ids);
      ("neuronDeviceIds", option_to_yojson neuron_device_ids_to_yojson x.neuron_device_ids);
    ]

let container_image_to_yojson (x : container_image) =
  assoc_to_yojson
    [
      ("containerName", option_to_yojson string__to_yojson x.container_name);
      ("imageDigest", option_to_yojson string__to_yojson x.image_digest);
      ("image", option_to_yojson string__to_yojson x.image);
    ]

let container_images_to_yojson tree = list_to_yojson container_image_to_yojson tree

let instance_health_check_state_to_yojson (x : instance_health_check_state) =
  match x with
  | OK -> `String "OK"
  | IMPAIRED -> `String "IMPAIRED"
  | INSUFFICIENT_DATA -> `String "INSUFFICIENT_DATA"
  | INITIALIZING -> `String "INITIALIZING"

let instance_health_check_type_to_yojson (x : instance_health_check_type) =
  match x with
  | CONTAINER_RUNTIME -> `String "CONTAINER_RUNTIME"
  | ACCELERATED_COMPUTE -> `String "ACCELERATED_COMPUTE"
  | DAEMON -> `String "DAEMON"

let instance_health_check_result_to_yojson (x : instance_health_check_result) =
  assoc_to_yojson
    [
      ("type", option_to_yojson instance_health_check_type_to_yojson x.type_);
      ("status", option_to_yojson instance_health_check_state_to_yojson x.status);
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("lastUpdated", option_to_yojson timestamp_to_yojson x.last_updated);
      ("lastStatusChange", option_to_yojson timestamp_to_yojson x.last_status_change);
    ]

let instance_health_check_result_list_to_yojson tree =
  list_to_yojson instance_health_check_result_to_yojson tree

let container_instance_health_status_to_yojson (x : container_instance_health_status) =
  assoc_to_yojson
    [
      ("overallStatus", option_to_yojson instance_health_check_state_to_yojson x.overall_status);
      ("details", option_to_yojson instance_health_check_result_list_to_yojson x.details);
    ]

let long_to_yojson = long_to_yojson

let resource_to_yojson (x : resource) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("type", option_to_yojson string__to_yojson x.type_);
      ("doubleValue", option_to_yojson double_to_yojson x.double_value);
      ("longValue", option_to_yojson long_to_yojson x.long_value);
      ("integerValue", option_to_yojson integer_to_yojson x.integer_value);
      ("stringSetValue", option_to_yojson string_list_to_yojson x.string_set_value);
    ]

let resources_to_yojson tree = list_to_yojson resource_to_yojson tree

let version_info_to_yojson (x : version_info) =
  assoc_to_yojson
    [
      ("agentVersion", option_to_yojson string__to_yojson x.agent_version);
      ("agentHash", option_to_yojson string__to_yojson x.agent_hash);
      ("dockerVersion", option_to_yojson string__to_yojson x.docker_version);
    ]

let container_instance_to_yojson (x : container_instance) =
  assoc_to_yojson
    [
      ("containerInstanceArn", option_to_yojson string__to_yojson x.container_instance_arn);
      ("ec2InstanceId", option_to_yojson string__to_yojson x.ec2_instance_id);
      ("capacityProviderName", option_to_yojson string__to_yojson x.capacity_provider_name);
      ("version", option_to_yojson long_to_yojson x.version);
      ("versionInfo", option_to_yojson version_info_to_yojson x.version_info);
      ("remainingResources", option_to_yojson resources_to_yojson x.remaining_resources);
      ("registeredResources", option_to_yojson resources_to_yojson x.registered_resources);
      ("status", option_to_yojson string__to_yojson x.status);
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("agentConnected", option_to_yojson boolean__to_yojson x.agent_connected);
      ("runningTasksCount", option_to_yojson integer_to_yojson x.running_tasks_count);
      ("pendingTasksCount", option_to_yojson integer_to_yojson x.pending_tasks_count);
      ("agentUpdateStatus", option_to_yojson agent_update_status_to_yojson x.agent_update_status);
      ("attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("registeredAt", option_to_yojson timestamp_to_yojson x.registered_at);
      ("attachments", option_to_yojson attachments_to_yojson x.attachments);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("healthStatus", option_to_yojson container_instance_health_status_to_yojson x.health_status);
    ]

let container_instance_field_to_yojson (x : container_instance_field) =
  match x with
  | TAGS -> `String "TAGS"
  | CONTAINER_INSTANCE_HEALTH -> `String "CONTAINER_INSTANCE_HEALTH"

let container_instance_field_list_to_yojson tree =
  list_to_yojson container_instance_field_to_yojson tree

let container_instance_status_to_yojson (x : container_instance_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | DRAINING -> `String "DRAINING"
  | REGISTERING -> `String "REGISTERING"
  | DEREGISTERING -> `String "DEREGISTERING"
  | REGISTRATION_FAILED -> `String "REGISTRATION_FAILED"

let container_instances_to_yojson tree = list_to_yojson container_instance_to_yojson tree

let container_override_to_yojson (x : container_override) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("command", option_to_yojson string_list_to_yojson x.command);
      ("environment", option_to_yojson environment_variables_to_yojson x.environment);
      ("environmentFiles", option_to_yojson environment_files_to_yojson x.environment_files);
      ("cpu", option_to_yojson boxed_integer_to_yojson x.cpu);
      ("memory", option_to_yojson boxed_integer_to_yojson x.memory);
      ("memoryReservation", option_to_yojson boxed_integer_to_yojson x.memory_reservation);
      ( "resourceRequirements",
        option_to_yojson resource_requirements_to_yojson x.resource_requirements );
    ]

let container_overrides_to_yojson tree = list_to_yojson container_override_to_yojson tree

let container_state_change_to_yojson (x : container_state_change) =
  assoc_to_yojson
    [
      ("containerName", option_to_yojson string__to_yojson x.container_name);
      ("imageDigest", option_to_yojson string__to_yojson x.image_digest);
      ("runtimeId", option_to_yojson string__to_yojson x.runtime_id);
      ("exitCode", option_to_yojson boxed_integer_to_yojson x.exit_code);
      ("networkBindings", option_to_yojson network_bindings_to_yojson x.network_bindings);
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("status", option_to_yojson string__to_yojson x.status);
    ]

let container_state_changes_to_yojson tree = list_to_yojson container_state_change_to_yojson tree
let containers_to_yojson tree = list_to_yojson container_to_yojson tree

let update_in_progress_exception_to_yojson (x : update_in_progress_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let create_capacity_provider_response_to_yojson (x : create_capacity_provider_response) =
  assoc_to_yojson
    [ ("capacityProvider", option_to_yojson capacity_provider_to_yojson x.capacity_provider) ]

let create_managed_instances_provider_configuration_to_yojson
    (x : create_managed_instances_provider_configuration) =
  assoc_to_yojson
    [
      ("infrastructureRoleArn", Some (string__to_yojson x.infrastructure_role_arn));
      ( "instanceLaunchTemplate",
        Some (instance_launch_template_to_yojson x.instance_launch_template) );
      ("propagateTags", option_to_yojson propagate_mi_tags_to_yojson x.propagate_tags);
      ( "infrastructureOptimization",
        option_to_yojson infrastructure_optimization_to_yojson x.infrastructure_optimization );
      ( "autoRepairConfiguration",
        option_to_yojson auto_repair_configuration_to_yojson x.auto_repair_configuration );
    ]

let create_capacity_provider_request_to_yojson (x : create_capacity_provider_request) =
  assoc_to_yojson
    [
      ("name", Some (string__to_yojson x.name));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ( "autoScalingGroupProvider",
        option_to_yojson auto_scaling_group_provider_to_yojson x.auto_scaling_group_provider );
      ( "managedInstancesProvider",
        option_to_yojson create_managed_instances_provider_configuration_to_yojson
          x.managed_instances_provider );
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_cluster_response_to_yojson (x : create_cluster_response) =
  assoc_to_yojson [ ("cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let create_cluster_request_to_yojson (x : create_cluster_request) =
  assoc_to_yojson
    [
      ("clusterName", option_to_yojson string__to_yojson x.cluster_name);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("settings", option_to_yojson cluster_settings_to_yojson x.settings);
      ("configuration", option_to_yojson cluster_configuration_to_yojson x.configuration);
      ("capacityProviders", option_to_yojson string_list_to_yojson x.capacity_providers);
      ( "defaultCapacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.default_capacity_provider_strategy
      );
      ( "serviceConnectDefaults",
        option_to_yojson cluster_service_connect_defaults_request_to_yojson
          x.service_connect_defaults );
    ]

let platform_unknown_exception_to_yojson (x : platform_unknown_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let daemon_status_to_yojson (x : daemon_status) =
  match x with ACTIVE -> `String "ACTIVE" | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"

let create_daemon_response_to_yojson (x : create_daemon_response) =
  assoc_to_yojson
    [
      ("daemonArn", option_to_yojson string__to_yojson x.daemon_arn);
      ("status", option_to_yojson daemon_status_to_yojson x.status);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("deploymentArn", option_to_yojson string__to_yojson x.deployment_arn);
    ]

let daemon_propagate_tags_to_yojson (x : daemon_propagate_tags) =
  match x with DAEMON -> `String "DAEMON" | NONE -> `String "NONE"

let daemon_alarm_configuration_to_yojson (x : daemon_alarm_configuration) =
  assoc_to_yojson
    [
      ("alarmNames", option_to_yojson string_list_to_yojson x.alarm_names);
      ("enable", option_to_yojson boolean__to_yojson x.enable);
    ]

let daemon_drain_percent_to_yojson = double_to_yojson

let daemon_deployment_configuration_to_yojson (x : daemon_deployment_configuration) =
  assoc_to_yojson
    [
      ("drainPercent", option_to_yojson daemon_drain_percent_to_yojson x.drain_percent);
      ("alarms", option_to_yojson daemon_alarm_configuration_to_yojson x.alarms);
      ("bakeTimeInMinutes", option_to_yojson integer_to_yojson x.bake_time_in_minutes);
    ]

let create_daemon_request_to_yojson (x : create_daemon_request) =
  assoc_to_yojson
    [
      ("daemonName", Some (string__to_yojson x.daemon_name));
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("daemonTaskDefinitionArn", Some (string__to_yojson x.daemon_task_definition_arn));
      ("capacityProviderArns", Some (string_list_to_yojson x.capacity_provider_arns));
      ( "deploymentConfiguration",
        option_to_yojson daemon_deployment_configuration_to_yojson x.deployment_configuration );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("propagateTags", option_to_yojson daemon_propagate_tags_to_yojson x.propagate_tags);
      ("enableECSManagedTags", option_to_yojson boolean__to_yojson x.enable_ecs_managed_tags);
      ("enableExecuteCommand", option_to_yojson boolean__to_yojson x.enable_execute_command);
      ("clientToken", option_to_yojson string__to_yojson x.client_token);
    ]

let platform_task_definition_incompatibility_exception_to_yojson
    (x : platform_task_definition_incompatibility_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let ingress_path_summary_to_yojson (x : ingress_path_summary) =
  assoc_to_yojson
    [
      ("accessType", Some (access_type_to_yojson x.access_type));
      ("endpoint", Some (string__to_yojson x.endpoint));
    ]

let ingress_path_summaries_to_yojson tree = list_to_yojson ingress_path_summary_to_yojson tree

let express_gateway_service_scaling_metric_to_yojson (x : express_gateway_service_scaling_metric) =
  match x with
  | AverageCPUUtilization -> `String "AVERAGE_CPU"
  | AverageMemoryUtilization -> `String "AVERAGE_MEMORY"
  | RequestCountPerTarget -> `String "REQUEST_COUNT_PER_TARGET"

let express_gateway_scaling_target_to_yojson (x : express_gateway_scaling_target) =
  assoc_to_yojson
    [
      ("minTaskCount", option_to_yojson boxed_integer_to_yojson x.min_task_count);
      ("maxTaskCount", option_to_yojson boxed_integer_to_yojson x.max_task_count);
      ( "autoScalingMetric",
        option_to_yojson express_gateway_service_scaling_metric_to_yojson x.auto_scaling_metric );
      ( "autoScalingTargetValue",
        option_to_yojson boxed_integer_to_yojson x.auto_scaling_target_value );
    ]

let express_gateway_repository_credentials_to_yojson (x : express_gateway_repository_credentials) =
  assoc_to_yojson
    [ ("credentialsParameter", option_to_yojson string__to_yojson x.credentials_parameter) ]

let express_gateway_service_aws_logs_configuration_to_yojson
    (x : express_gateway_service_aws_logs_configuration) =
  assoc_to_yojson
    [
      ("logGroup", Some (string__to_yojson x.log_group));
      ("logStreamPrefix", Some (string__to_yojson x.log_stream_prefix));
    ]

let express_gateway_container_to_yojson (x : express_gateway_container) =
  assoc_to_yojson
    [
      ("image", Some (string__to_yojson x.image));
      ("containerPort", option_to_yojson boxed_integer_to_yojson x.container_port);
      ( "awsLogsConfiguration",
        option_to_yojson express_gateway_service_aws_logs_configuration_to_yojson
          x.aws_logs_configuration );
      ( "repositoryCredentials",
        option_to_yojson express_gateway_repository_credentials_to_yojson x.repository_credentials
      );
      ("command", option_to_yojson string_list_to_yojson x.command);
      ("environment", option_to_yojson environment_variables_to_yojson x.environment);
      ("secrets", option_to_yojson secret_list_to_yojson x.secrets);
    ]

let express_gateway_service_network_configuration_to_yojson
    (x : express_gateway_service_network_configuration) =
  assoc_to_yojson
    [
      ("securityGroups", option_to_yojson string_list_to_yojson x.security_groups);
      ("subnets", option_to_yojson string_list_to_yojson x.subnets);
    ]

let express_gateway_service_configuration_to_yojson (x : express_gateway_service_configuration) =
  assoc_to_yojson
    [
      ("serviceRevisionArn", option_to_yojson string__to_yojson x.service_revision_arn);
      ("executionRoleArn", option_to_yojson string__to_yojson x.execution_role_arn);
      ("taskRoleArn", option_to_yojson string__to_yojson x.task_role_arn);
      ("taskDefinitionArn", option_to_yojson string__to_yojson x.task_definition_arn);
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ( "networkConfiguration",
        option_to_yojson express_gateway_service_network_configuration_to_yojson
          x.network_configuration );
      ("healthCheckPath", option_to_yojson string__to_yojson x.health_check_path);
      ("primaryContainer", option_to_yojson express_gateway_container_to_yojson x.primary_container);
      ("scalingTarget", option_to_yojson express_gateway_scaling_target_to_yojson x.scaling_target);
      ("ingressPaths", option_to_yojson ingress_path_summaries_to_yojson x.ingress_paths);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
    ]

let express_gateway_service_configurations_to_yojson tree =
  list_to_yojson express_gateway_service_configuration_to_yojson tree

let express_gateway_service_status_code_to_yojson (x : express_gateway_service_status_code) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | DRAINING -> `String "DRAINING"
  | INACTIVE -> `String "INACTIVE"

let express_gateway_service_status_to_yojson (x : express_gateway_service_status) =
  assoc_to_yojson
    [
      ("statusCode", option_to_yojson express_gateway_service_status_code_to_yojson x.status_code);
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
    ]

let ecs_express_gateway_service_to_yojson (x : ecs_express_gateway_service) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("serviceName", option_to_yojson string__to_yojson x.service_name);
      ("serviceArn", option_to_yojson string__to_yojson x.service_arn);
      ("infrastructureRoleArn", option_to_yojson string__to_yojson x.infrastructure_role_arn);
      ("status", option_to_yojson express_gateway_service_status_to_yojson x.status);
      ("currentDeployment", option_to_yojson string__to_yojson x.current_deployment);
      ( "activeConfigurations",
        option_to_yojson express_gateway_service_configurations_to_yojson x.active_configurations );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let create_express_gateway_service_response_to_yojson (x : create_express_gateway_service_response)
    =
  assoc_to_yojson [ ("service", option_to_yojson ecs_express_gateway_service_to_yojson x.service) ]

let create_express_gateway_service_request_to_yojson (x : create_express_gateway_service_request) =
  assoc_to_yojson
    [
      ("executionRoleArn", option_to_yojson string__to_yojson x.execution_role_arn);
      ("infrastructureRoleArn", Some (string__to_yojson x.infrastructure_role_arn));
      ("serviceName", option_to_yojson string__to_yojson x.service_name);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("healthCheckPath", option_to_yojson string__to_yojson x.health_check_path);
      ("primaryContainer", option_to_yojson express_gateway_container_to_yojson x.primary_container);
      ("taskRoleArn", option_to_yojson string__to_yojson x.task_role_arn);
      ( "networkConfiguration",
        option_to_yojson express_gateway_service_network_configuration_to_yojson
          x.network_configuration );
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("scalingTarget", option_to_yojson express_gateway_scaling_target_to_yojson x.scaling_target);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("taskDefinitionArn", option_to_yojson string__to_yojson x.task_definition_arn);
    ]

let resource_management_type_to_yojson (x : resource_management_type) =
  match x with CUSTOMER -> `String "CUSTOMER" | ECS -> `String "ECS"

let propagate_tags_to_yojson (x : propagate_tags) =
  match x with
  | TASK_DEFINITION -> `String "TASK_DEFINITION"
  | SERVICE -> `String "SERVICE"
  | NONE -> `String "NONE"

let deployment_controller_type_to_yojson (x : deployment_controller_type) =
  match x with
  | ECS -> `String "ECS"
  | CODE_DEPLOY -> `String "CODE_DEPLOY"
  | EXTERNAL -> `String "EXTERNAL"

let deployment_controller_to_yojson (x : deployment_controller) =
  assoc_to_yojson [ ("type", Some (deployment_controller_type_to_yojson x.type_)) ]

let scheduling_strategy_to_yojson (x : scheduling_strategy) =
  match x with REPLICA -> `String "REPLICA" | DAEMON -> `String "DAEMON"

let network_configuration_to_yojson (x : network_configuration) =
  assoc_to_yojson
    [
      ( "awsvpcConfiguration",
        option_to_yojson aws_vpc_configuration_to_yojson x.awsvpc_configuration );
    ]

let placement_strategy_type_to_yojson (x : placement_strategy_type) =
  match x with
  | RANDOM -> `String "random"
  | SPREAD -> `String "spread"
  | BINPACK -> `String "binpack"

let placement_strategy_to_yojson (x : placement_strategy) =
  assoc_to_yojson
    [
      ("type", option_to_yojson placement_strategy_type_to_yojson x.type_);
      ("field", option_to_yojson string__to_yojson x.field);
    ]

let placement_strategies_to_yojson tree = list_to_yojson placement_strategy_to_yojson tree

let placement_constraint_type_to_yojson (x : placement_constraint_type) =
  match x with DISTINCT_INSTANCE -> `String "distinctInstance" | MEMBER_OF -> `String "memberOf"

let placement_constraint_to_yojson (x : placement_constraint) =
  assoc_to_yojson
    [
      ("type", option_to_yojson placement_constraint_type_to_yojson x.type_);
      ("expression", option_to_yojson string__to_yojson x.expression);
    ]

let placement_constraints_to_yojson tree = list_to_yojson placement_constraint_to_yojson tree

let service_current_revision_summary_to_yojson (x : service_current_revision_summary) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("requestedTaskCount", option_to_yojson integer_to_yojson x.requested_task_count);
      ("runningTaskCount", option_to_yojson integer_to_yojson x.running_task_count);
      ("pendingTaskCount", option_to_yojson integer_to_yojson x.pending_task_count);
    ]

let service_current_revision_summary_list_to_yojson tree =
  list_to_yojson service_current_revision_summary_to_yojson tree

let service_event_to_yojson (x : service_event) =
  assoc_to_yojson
    [
      ("id", option_to_yojson string__to_yojson x.id);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let service_events_to_yojson tree = list_to_yojson service_event_to_yojson tree
let iam_role_arn_to_yojson = string_to_yojson

let vpc_lattice_configuration_to_yojson (x : vpc_lattice_configuration) =
  assoc_to_yojson
    [
      ("roleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("targetGroupArn", Some (string__to_yojson x.target_group_arn));
      ("portName", Some (string__to_yojson x.port_name));
    ]

let vpc_lattice_configurations_to_yojson tree =
  list_to_yojson vpc_lattice_configuration_to_yojson tree

let deployment_ephemeral_storage_to_yojson (x : deployment_ephemeral_storage) =
  assoc_to_yojson [ ("kmsKeyId", option_to_yojson string__to_yojson x.kms_key_id) ]

let task_filesystem_type_to_yojson (x : task_filesystem_type) =
  match x with
  | EXT3 -> `String "ext3"
  | EXT4 -> `String "ext4"
  | XFS -> `String "xfs"
  | NTFS -> `String "ntfs"

let ebs_resource_type_to_yojson (x : ebs_resource_type) = match x with VOLUME -> `String "volume"

let ebs_tag_specification_to_yojson (x : ebs_tag_specification) =
  assoc_to_yojson
    [
      ("resourceType", Some (ebs_resource_type_to_yojson x.resource_type));
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("propagateTags", option_to_yojson propagate_tags_to_yojson x.propagate_tags);
    ]

let ebs_tag_specifications_to_yojson tree = list_to_yojson ebs_tag_specification_to_yojson tree
let ebs_snapshot_id_to_yojson = string_to_yojson
let ebs_volume_type_to_yojson = string_to_yojson
let ebskms_key_id_to_yojson = string_to_yojson

let service_managed_ebs_volume_configuration_to_yojson
    (x : service_managed_ebs_volume_configuration) =
  assoc_to_yojson
    [
      ("encrypted", option_to_yojson boxed_boolean_to_yojson x.encrypted);
      ("kmsKeyId", option_to_yojson ebskms_key_id_to_yojson x.kms_key_id);
      ("volumeType", option_to_yojson ebs_volume_type_to_yojson x.volume_type);
      ("sizeInGiB", option_to_yojson boxed_integer_to_yojson x.size_in_gi_b);
      ("snapshotId", option_to_yojson ebs_snapshot_id_to_yojson x.snapshot_id);
      ( "volumeInitializationRate",
        option_to_yojson boxed_integer_to_yojson x.volume_initialization_rate );
      ("iops", option_to_yojson boxed_integer_to_yojson x.iops);
      ("throughput", option_to_yojson boxed_integer_to_yojson x.throughput);
      ("tagSpecifications", option_to_yojson ebs_tag_specifications_to_yojson x.tag_specifications);
      ("roleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("filesystemType", option_to_yojson task_filesystem_type_to_yojson x.filesystem_type);
    ]

let ecs_volume_name_to_yojson = string_to_yojson

let service_volume_configuration_to_yojson (x : service_volume_configuration) =
  assoc_to_yojson
    [
      ("name", Some (ecs_volume_name_to_yojson x.name));
      ( "managedEBSVolume",
        option_to_yojson service_managed_ebs_volume_configuration_to_yojson x.managed_ebs_volume );
    ]

let service_volume_configurations_to_yojson tree =
  list_to_yojson service_volume_configuration_to_yojson tree

let service_connect_service_resource_to_yojson (x : service_connect_service_resource) =
  assoc_to_yojson
    [
      ("discoveryName", option_to_yojson string__to_yojson x.discovery_name);
      ("discoveryArn", option_to_yojson string__to_yojson x.discovery_arn);
    ]

let service_connect_service_resource_list_to_yojson tree =
  list_to_yojson service_connect_service_resource_to_yojson tree

let service_connect_include_query_parameters_to_yojson
    (x : service_connect_include_query_parameters) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let service_connect_access_logging_format_to_yojson (x : service_connect_access_logging_format) =
  match x with TEXT -> `String "TEXT" | JSON -> `String "JSON"

let service_connect_access_log_configuration_to_yojson
    (x : service_connect_access_log_configuration) =
  assoc_to_yojson
    [
      ("format", Some (service_connect_access_logging_format_to_yojson x.format));
      ( "includeQueryParameters",
        option_to_yojson service_connect_include_query_parameters_to_yojson
          x.include_query_parameters );
    ]

let service_connect_tls_certificate_authority_to_yojson
    (x : service_connect_tls_certificate_authority) =
  assoc_to_yojson
    [ ("awsPcaAuthorityArn", option_to_yojson string__to_yojson x.aws_pca_authority_arn) ]

let service_connect_tls_configuration_to_yojson (x : service_connect_tls_configuration) =
  assoc_to_yojson
    [
      ( "issuerCertificateAuthority",
        Some (service_connect_tls_certificate_authority_to_yojson x.issuer_certificate_authority) );
      ("kmsKey", option_to_yojson string__to_yojson x.kms_key);
      ("roleArn", option_to_yojson string__to_yojson x.role_arn);
    ]

let duration_to_yojson = int_to_yojson

let timeout_configuration_to_yojson (x : timeout_configuration) =
  assoc_to_yojson
    [
      ("idleTimeoutSeconds", option_to_yojson duration_to_yojson x.idle_timeout_seconds);
      ("perRequestTimeoutSeconds", option_to_yojson duration_to_yojson x.per_request_timeout_seconds);
    ]

let port_number_to_yojson = int_to_yojson

let service_connect_test_traffic_header_match_rules_to_yojson
    (x : service_connect_test_traffic_header_match_rules) =
  assoc_to_yojson [ ("exact", Some (string__to_yojson x.exact)) ]

let service_connect_test_traffic_header_rules_to_yojson
    (x : service_connect_test_traffic_header_rules) =
  assoc_to_yojson
    [
      ("name", Some (string__to_yojson x.name));
      ("value", option_to_yojson service_connect_test_traffic_header_match_rules_to_yojson x.value);
    ]

let service_connect_test_traffic_rules_to_yojson (x : service_connect_test_traffic_rules) =
  assoc_to_yojson
    [ ("header", Some (service_connect_test_traffic_header_rules_to_yojson x.header)) ]

let service_connect_client_alias_to_yojson (x : service_connect_client_alias) =
  assoc_to_yojson
    [
      ("port", Some (port_number_to_yojson x.port));
      ("dnsName", option_to_yojson string__to_yojson x.dns_name);
      ( "testTrafficRules",
        option_to_yojson service_connect_test_traffic_rules_to_yojson x.test_traffic_rules );
    ]

let service_connect_client_alias_list_to_yojson tree =
  list_to_yojson service_connect_client_alias_to_yojson tree

let service_connect_service_to_yojson (x : service_connect_service) =
  assoc_to_yojson
    [
      ("portName", Some (string__to_yojson x.port_name));
      ("discoveryName", option_to_yojson string__to_yojson x.discovery_name);
      ( "clientAliases",
        option_to_yojson service_connect_client_alias_list_to_yojson x.client_aliases );
      ("ingressPortOverride", option_to_yojson port_number_to_yojson x.ingress_port_override);
      ("timeout", option_to_yojson timeout_configuration_to_yojson x.timeout);
      ("tls", option_to_yojson service_connect_tls_configuration_to_yojson x.tls);
    ]

let service_connect_service_list_to_yojson tree =
  list_to_yojson service_connect_service_to_yojson tree

let service_connect_configuration_to_yojson (x : service_connect_configuration) =
  assoc_to_yojson
    [
      ("enabled", Some (boolean__to_yojson x.enabled));
      ("namespace", option_to_yojson string__to_yojson x.namespace);
      ("services", option_to_yojson service_connect_service_list_to_yojson x.services);
      ("logConfiguration", option_to_yojson log_configuration_to_yojson x.log_configuration);
      ( "accessLogConfiguration",
        option_to_yojson service_connect_access_log_configuration_to_yojson
          x.access_log_configuration );
    ]

let deployment_rollout_state_to_yojson (x : deployment_rollout_state) =
  match x with
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let launch_type_to_yojson (x : launch_type) =
  match x with
  | EC2 -> `String "EC2"
  | FARGATE -> `String "FARGATE"
  | EXTERNAL -> `String "EXTERNAL"
  | MANAGED_INSTANCES -> `String "MANAGED_INSTANCES"

let deployment_to_yojson (x : deployment) =
  assoc_to_yojson
    [
      ("id", option_to_yojson string__to_yojson x.id);
      ("status", option_to_yojson string__to_yojson x.status);
      ("taskDefinition", option_to_yojson string__to_yojson x.task_definition);
      ("desiredCount", option_to_yojson integer_to_yojson x.desired_count);
      ("pendingCount", option_to_yojson integer_to_yojson x.pending_count);
      ("runningCount", option_to_yojson integer_to_yojson x.running_count);
      ("failedTasks", option_to_yojson integer_to_yojson x.failed_tasks);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ( "capacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("platformFamily", option_to_yojson string__to_yojson x.platform_family);
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("rolloutState", option_to_yojson deployment_rollout_state_to_yojson x.rollout_state);
      ("rolloutStateReason", option_to_yojson string__to_yojson x.rollout_state_reason);
      ( "serviceConnectConfiguration",
        option_to_yojson service_connect_configuration_to_yojson x.service_connect_configuration );
      ( "serviceConnectResources",
        option_to_yojson service_connect_service_resource_list_to_yojson x.service_connect_resources
      );
      ( "volumeConfigurations",
        option_to_yojson service_volume_configurations_to_yojson x.volume_configurations );
      ( "fargateEphemeralStorage",
        option_to_yojson deployment_ephemeral_storage_to_yojson x.fargate_ephemeral_storage );
      ( "vpcLatticeConfigurations",
        option_to_yojson vpc_lattice_configurations_to_yojson x.vpc_lattice_configurations );
    ]

let deployments_to_yojson tree = list_to_yojson deployment_to_yojson tree

let stability_status_to_yojson (x : stability_status) =
  match x with STEADY_STATE -> `String "STEADY_STATE" | STABILIZING -> `String "STABILIZING"

let scale_unit_to_yojson (x : scale_unit) = match x with PERCENT -> `String "PERCENT"

let scale_to_yojson (x : scale) =
  assoc_to_yojson
    [
      ("value", option_to_yojson double_to_yojson x.value);
      ("unit", option_to_yojson scale_unit_to_yojson x.unit_);
    ]

let service_registry_to_yojson (x : service_registry) =
  assoc_to_yojson
    [
      ("registryArn", option_to_yojson string__to_yojson x.registry_arn);
      ("port", option_to_yojson boxed_integer_to_yojson x.port);
      ("containerName", option_to_yojson string__to_yojson x.container_name);
      ("containerPort", option_to_yojson boxed_integer_to_yojson x.container_port);
    ]

let service_registries_to_yojson tree = list_to_yojson service_registry_to_yojson tree

let load_balancer_to_yojson (x : load_balancer) =
  assoc_to_yojson
    [
      ("targetGroupArn", option_to_yojson string__to_yojson x.target_group_arn);
      ("loadBalancerName", option_to_yojson string__to_yojson x.load_balancer_name);
      ("containerName", option_to_yojson string__to_yojson x.container_name);
      ("containerPort", option_to_yojson boxed_integer_to_yojson x.container_port);
      ( "advancedConfiguration",
        option_to_yojson advanced_configuration_to_yojson x.advanced_configuration );
    ]

let load_balancers_to_yojson tree = list_to_yojson load_balancer_to_yojson tree

let task_set_to_yojson (x : task_set) =
  assoc_to_yojson
    [
      ("id", option_to_yojson string__to_yojson x.id);
      ("taskSetArn", option_to_yojson string__to_yojson x.task_set_arn);
      ("serviceArn", option_to_yojson string__to_yojson x.service_arn);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("startedBy", option_to_yojson string__to_yojson x.started_by);
      ("externalId", option_to_yojson string__to_yojson x.external_id);
      ("status", option_to_yojson string__to_yojson x.status);
      ("taskDefinition", option_to_yojson string__to_yojson x.task_definition);
      ("computedDesiredCount", option_to_yojson integer_to_yojson x.computed_desired_count);
      ("pendingCount", option_to_yojson integer_to_yojson x.pending_count);
      ("runningCount", option_to_yojson integer_to_yojson x.running_count);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ( "capacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("platformFamily", option_to_yojson string__to_yojson x.platform_family);
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("loadBalancers", option_to_yojson load_balancers_to_yojson x.load_balancers);
      ("serviceRegistries", option_to_yojson service_registries_to_yojson x.service_registries);
      ("scale", option_to_yojson scale_to_yojson x.scale);
      ("stabilityStatus", option_to_yojson stability_status_to_yojson x.stability_status);
      ("stabilityStatusAt", option_to_yojson timestamp_to_yojson x.stability_status_at);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "fargateEphemeralStorage",
        option_to_yojson deployment_ephemeral_storage_to_yojson x.fargate_ephemeral_storage );
    ]

let task_sets_to_yojson tree = list_to_yojson task_set_to_yojson tree

let linear_configuration_to_yojson (x : linear_configuration) =
  assoc_to_yojson
    [
      ("stepPercent", option_to_yojson double_to_yojson x.step_percent);
      ("stepBakeTimeInMinutes", option_to_yojson integer_to_yojson x.step_bake_time_in_minutes);
    ]

let deployment_lifecycle_hook_duration_to_yojson = int_to_yojson

let deployment_lifecycle_hook_timeout_configuration_to_yojson
    (x : deployment_lifecycle_hook_timeout_configuration) =
  assoc_to_yojson
    [
      ( "timeoutInMinutes",
        option_to_yojson deployment_lifecycle_hook_duration_to_yojson x.timeout_in_minutes );
      ("action", option_to_yojson deployment_lifecycle_hook_action_to_yojson x.action);
    ]

let hook_details_to_yojson = json_to_yojson

let deployment_lifecycle_hook_stage_to_yojson (x : deployment_lifecycle_hook_stage) =
  match x with
  | RECONCILE_SERVICE -> `String "RECONCILE_SERVICE"
  | PRE_SCALE_UP -> `String "PRE_SCALE_UP"
  | POST_SCALE_UP -> `String "POST_SCALE_UP"
  | TEST_TRAFFIC_SHIFT -> `String "TEST_TRAFFIC_SHIFT"
  | POST_TEST_TRAFFIC_SHIFT -> `String "POST_TEST_TRAFFIC_SHIFT"
  | PRE_PRODUCTION_TRAFFIC_SHIFT -> `String "PRE_PRODUCTION_TRAFFIC_SHIFT"
  | PRODUCTION_TRAFFIC_SHIFT -> `String "PRODUCTION_TRAFFIC_SHIFT"
  | POST_PRODUCTION_TRAFFIC_SHIFT -> `String "POST_PRODUCTION_TRAFFIC_SHIFT"

let deployment_lifecycle_hook_stage_list_to_yojson tree =
  list_to_yojson deployment_lifecycle_hook_stage_to_yojson tree

let deployment_lifecycle_hook_target_type_to_yojson (x : deployment_lifecycle_hook_target_type) =
  match x with AWS_LAMBDA -> `String "AWS_LAMBDA" | PAUSE -> `String "PAUSE"

let deployment_lifecycle_hook_to_yojson (x : deployment_lifecycle_hook) =
  assoc_to_yojson
    [
      ("targetType", option_to_yojson deployment_lifecycle_hook_target_type_to_yojson x.target_type);
      ("hookTargetArn", option_to_yojson string__to_yojson x.hook_target_arn);
      ("roleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ( "lifecycleStages",
        option_to_yojson deployment_lifecycle_hook_stage_list_to_yojson x.lifecycle_stages );
      ("hookDetails", option_to_yojson hook_details_to_yojson x.hook_details);
      ( "timeoutConfiguration",
        option_to_yojson deployment_lifecycle_hook_timeout_configuration_to_yojson
          x.timeout_configuration );
    ]

let deployment_lifecycle_hook_list_to_yojson tree =
  list_to_yojson deployment_lifecycle_hook_to_yojson tree

let deployment_strategy_to_yojson (x : deployment_strategy) =
  match x with
  | ROLLING -> `String "ROLLING"
  | BLUE_GREEN -> `String "BLUE_GREEN"
  | LINEAR -> `String "LINEAR"
  | CANARY -> `String "CANARY"

let deployment_alarms_to_yojson (x : deployment_alarms) =
  assoc_to_yojson
    [
      ("alarmNames", Some (string_list_to_yojson x.alarm_names));
      ("rollback", Some (boolean__to_yojson x.rollback));
      ("enable", Some (boolean__to_yojson x.enable));
    ]

let threshold_type_to_yojson (x : threshold_type) =
  match x with
  | COUNT -> `String "COUNT"
  | BOUNDED_PERCENT -> `String "BOUNDED_PERCENT"
  | UNBOUNDED_PERCENT -> `String "UNBOUNDED_PERCENT"

let threshold_configuration_to_yojson (x : threshold_configuration) =
  assoc_to_yojson
    [
      ("type", Some (threshold_type_to_yojson x.type_)); ("value", Some (integer_to_yojson x.value));
    ]

let deployment_circuit_breaker_to_yojson (x : deployment_circuit_breaker) =
  assoc_to_yojson
    [
      ("enable", Some (boolean__to_yojson x.enable));
      ("rollback", Some (boolean__to_yojson x.rollback));
      ("resetOnHealthyTask", option_to_yojson boxed_boolean_to_yojson x.reset_on_healthy_task);
      ( "thresholdConfiguration",
        option_to_yojson threshold_configuration_to_yojson x.threshold_configuration );
    ]

let deployment_configuration_to_yojson (x : deployment_configuration) =
  assoc_to_yojson
    [
      ( "deploymentCircuitBreaker",
        option_to_yojson deployment_circuit_breaker_to_yojson x.deployment_circuit_breaker );
      ("maximumPercent", option_to_yojson boxed_integer_to_yojson x.maximum_percent);
      ("minimumHealthyPercent", option_to_yojson boxed_integer_to_yojson x.minimum_healthy_percent);
      ("alarms", option_to_yojson deployment_alarms_to_yojson x.alarms);
      ("strategy", option_to_yojson deployment_strategy_to_yojson x.strategy);
      ("bakeTimeInMinutes", option_to_yojson boxed_integer_to_yojson x.bake_time_in_minutes);
      ("lifecycleHooks", option_to_yojson deployment_lifecycle_hook_list_to_yojson x.lifecycle_hooks);
      ("linearConfiguration", option_to_yojson linear_configuration_to_yojson x.linear_configuration);
      ("canaryConfiguration", option_to_yojson canary_configuration_to_yojson x.canary_configuration);
    ]

let service_to_yojson (x : service) =
  assoc_to_yojson
    [
      ("serviceArn", option_to_yojson string__to_yojson x.service_arn);
      ("serviceName", option_to_yojson string__to_yojson x.service_name);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("loadBalancers", option_to_yojson load_balancers_to_yojson x.load_balancers);
      ("serviceRegistries", option_to_yojson service_registries_to_yojson x.service_registries);
      ("status", option_to_yojson string__to_yojson x.status);
      ("desiredCount", option_to_yojson integer_to_yojson x.desired_count);
      ("runningCount", option_to_yojson integer_to_yojson x.running_count);
      ("pendingCount", option_to_yojson integer_to_yojson x.pending_count);
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ( "capacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("platformFamily", option_to_yojson string__to_yojson x.platform_family);
      ("taskDefinition", option_to_yojson string__to_yojson x.task_definition);
      ( "deploymentConfiguration",
        option_to_yojson deployment_configuration_to_yojson x.deployment_configuration );
      ("taskSets", option_to_yojson task_sets_to_yojson x.task_sets);
      ("deployments", option_to_yojson deployments_to_yojson x.deployments);
      ("roleArn", option_to_yojson string__to_yojson x.role_arn);
      ("events", option_to_yojson service_events_to_yojson x.events);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("currentServiceDeployment", option_to_yojson string__to_yojson x.current_service_deployment);
      ( "currentServiceRevisions",
        option_to_yojson service_current_revision_summary_list_to_yojson x.current_service_revisions
      );
      ( "placementConstraints",
        option_to_yojson placement_constraints_to_yojson x.placement_constraints );
      ("placementStrategy", option_to_yojson placement_strategies_to_yojson x.placement_strategy);
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ( "healthCheckGracePeriodSeconds",
        option_to_yojson boxed_integer_to_yojson x.health_check_grace_period_seconds );
      ("schedulingStrategy", option_to_yojson scheduling_strategy_to_yojson x.scheduling_strategy);
      ( "deploymentController",
        option_to_yojson deployment_controller_to_yojson x.deployment_controller );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("createdBy", option_to_yojson string__to_yojson x.created_by);
      ("enableECSManagedTags", option_to_yojson boolean__to_yojson x.enable_ecs_managed_tags);
      ("propagateTags", option_to_yojson propagate_tags_to_yojson x.propagate_tags);
      ("enableExecuteCommand", option_to_yojson boolean__to_yojson x.enable_execute_command);
      ( "availabilityZoneRebalancing",
        option_to_yojson availability_zone_rebalancing_to_yojson x.availability_zone_rebalancing );
      ( "resourceManagementType",
        option_to_yojson resource_management_type_to_yojson x.resource_management_type );
    ]

let create_service_response_to_yojson (x : create_service_response) =
  assoc_to_yojson [ ("service", option_to_yojson service_to_yojson x.service) ]

let metric_resolution_seconds_to_yojson = int_to_yojson
let metric_name_to_yojson = string_to_yojson
let metric_names_list_to_yojson tree = list_to_yojson metric_name_to_yojson tree

let metric_configuration_to_yojson (x : metric_configuration) =
  assoc_to_yojson
    [
      ("metricNames", Some (metric_names_list_to_yojson x.metric_names));
      ("resolutionSeconds", Some (metric_resolution_seconds_to_yojson x.resolution_seconds));
    ]

let metric_configuration_list_to_yojson tree = list_to_yojson metric_configuration_to_yojson tree

let monitoring_configuration_to_yojson (x : monitoring_configuration) =
  assoc_to_yojson
    [
      ( "metricConfigurations",
        option_to_yojson metric_configuration_list_to_yojson x.metric_configurations );
    ]

let create_service_request_to_yojson (x : create_service_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("serviceName", Some (string__to_yojson x.service_name));
      ("taskDefinition", option_to_yojson string__to_yojson x.task_definition);
      ( "availabilityZoneRebalancing",
        option_to_yojson availability_zone_rebalancing_to_yojson x.availability_zone_rebalancing );
      ("loadBalancers", option_to_yojson load_balancers_to_yojson x.load_balancers);
      ("serviceRegistries", option_to_yojson service_registries_to_yojson x.service_registries);
      ("desiredCount", option_to_yojson boxed_integer_to_yojson x.desired_count);
      ("clientToken", option_to_yojson string__to_yojson x.client_token);
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ( "capacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("role", option_to_yojson string__to_yojson x.role);
      ( "deploymentConfiguration",
        option_to_yojson deployment_configuration_to_yojson x.deployment_configuration );
      ( "placementConstraints",
        option_to_yojson placement_constraints_to_yojson x.placement_constraints );
      ("placementStrategy", option_to_yojson placement_strategies_to_yojson x.placement_strategy);
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ( "healthCheckGracePeriodSeconds",
        option_to_yojson boxed_integer_to_yojson x.health_check_grace_period_seconds );
      ("schedulingStrategy", option_to_yojson scheduling_strategy_to_yojson x.scheduling_strategy);
      ( "deploymentController",
        option_to_yojson deployment_controller_to_yojson x.deployment_controller );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("enableECSManagedTags", option_to_yojson boolean__to_yojson x.enable_ecs_managed_tags);
      ("propagateTags", option_to_yojson propagate_tags_to_yojson x.propagate_tags);
      ("enableExecuteCommand", option_to_yojson boolean__to_yojson x.enable_execute_command);
      ( "serviceConnectConfiguration",
        option_to_yojson service_connect_configuration_to_yojson x.service_connect_configuration );
      ( "volumeConfigurations",
        option_to_yojson service_volume_configurations_to_yojson x.volume_configurations );
      ( "vpcLatticeConfigurations",
        option_to_yojson vpc_lattice_configurations_to_yojson x.vpc_lattice_configurations );
      ("monitoring", option_to_yojson monitoring_configuration_to_yojson x.monitoring);
    ]

let service_not_found_exception_to_yojson (x : service_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let service_not_active_exception_to_yojson (x : service_not_active_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let create_task_set_response_to_yojson (x : create_task_set_response) =
  assoc_to_yojson [ ("taskSet", option_to_yojson task_set_to_yojson x.task_set) ]

let create_task_set_request_to_yojson (x : create_task_set_request) =
  assoc_to_yojson
    [
      ("service", Some (string__to_yojson x.service));
      ("cluster", Some (string__to_yojson x.cluster));
      ("externalId", option_to_yojson string__to_yojson x.external_id);
      ("taskDefinition", Some (string__to_yojson x.task_definition));
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("loadBalancers", option_to_yojson load_balancers_to_yojson x.load_balancers);
      ("serviceRegistries", option_to_yojson service_registries_to_yojson x.service_registries);
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ( "capacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("scale", option_to_yojson scale_to_yojson x.scale);
      ("clientToken", option_to_yojson string__to_yojson x.client_token);
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let created_at_to_yojson (x : created_at) =
  assoc_to_yojson
    [
      ("before", option_to_yojson timestamp_to_yojson x.before);
      ("after", option_to_yojson timestamp_to_yojson x.after);
    ]

let daemon_capacity_provider_to_yojson (x : daemon_capacity_provider) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("runningCount", option_to_yojson integer_to_yojson x.running_count);
    ]

let daemon_capacity_provider_list_to_yojson tree =
  list_to_yojson daemon_capacity_provider_to_yojson tree

let daemon_deployment_rollback_monitors_status_to_yojson
    (x : daemon_deployment_rollback_monitors_status) =
  match x with
  | TRIGGERED -> `String "TRIGGERED"
  | MONITORING -> `String "MONITORING"
  | MONITORING_COMPLETE -> `String "MONITORING_COMPLETE"
  | DISABLED -> `String "DISABLED"

let daemon_circuit_breaker_to_yojson (x : daemon_circuit_breaker) =
  assoc_to_yojson
    [
      ("failureCount", option_to_yojson integer_to_yojson x.failure_count);
      ("status", option_to_yojson daemon_deployment_rollback_monitors_status_to_yojson x.status);
      ("threshold", option_to_yojson integer_to_yojson x.threshold);
    ]

let daemon_linux_parameters_to_yojson (x : daemon_linux_parameters) =
  assoc_to_yojson
    [
      ("capabilities", option_to_yojson kernel_capabilities_to_yojson x.capabilities);
      ("devices", option_to_yojson devices_list_to_yojson x.devices);
      ("initProcessEnabled", option_to_yojson boxed_boolean_to_yojson x.init_process_enabled);
      ("tmpfs", option_to_yojson tmpfs_list_to_yojson x.tmpfs);
    ]

let daemon_container_definition_to_yojson (x : daemon_container_definition) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("image", Some (string__to_yojson x.image));
      ("memory", option_to_yojson boxed_integer_to_yojson x.memory);
      ("memoryReservation", option_to_yojson boxed_integer_to_yojson x.memory_reservation);
      ( "repositoryCredentials",
        option_to_yojson repository_credentials_to_yojson x.repository_credentials );
      ("healthCheck", option_to_yojson health_check_to_yojson x.health_check);
      ("cpu", option_to_yojson integer_to_yojson x.cpu);
      ("essential", option_to_yojson boxed_boolean_to_yojson x.essential);
      ("entryPoint", option_to_yojson string_list_to_yojson x.entry_point);
      ("command", option_to_yojson string_list_to_yojson x.command);
      ("workingDirectory", option_to_yojson string__to_yojson x.working_directory);
      ("environmentFiles", option_to_yojson environment_files_to_yojson x.environment_files);
      ("environment", option_to_yojson environment_variables_to_yojson x.environment);
      ("secrets", option_to_yojson secret_list_to_yojson x.secrets);
      ("readonlyRootFilesystem", option_to_yojson boxed_boolean_to_yojson x.readonly_root_filesystem);
      ("mountPoints", option_to_yojson mount_point_list_to_yojson x.mount_points);
      ("logConfiguration", option_to_yojson log_configuration_to_yojson x.log_configuration);
      ( "firelensConfiguration",
        option_to_yojson firelens_configuration_to_yojson x.firelens_configuration );
      ("privileged", option_to_yojson boxed_boolean_to_yojson x.privileged);
      ("user", option_to_yojson string__to_yojson x.user);
      ("ulimits", option_to_yojson ulimit_list_to_yojson x.ulimits);
      ("linuxParameters", option_to_yojson daemon_linux_parameters_to_yojson x.linux_parameters);
      ("dependsOn", option_to_yojson container_dependencies_to_yojson x.depends_on);
      ("startTimeout", option_to_yojson boxed_integer_to_yojson x.start_timeout);
      ("stopTimeout", option_to_yojson boxed_integer_to_yojson x.stop_timeout);
      ("systemControls", option_to_yojson system_controls_to_yojson x.system_controls);
      ("interactive", option_to_yojson boxed_boolean_to_yojson x.interactive);
      ("pseudoTerminal", option_to_yojson boxed_boolean_to_yojson x.pseudo_terminal);
      ("restartPolicy", option_to_yojson container_restart_policy_to_yojson x.restart_policy);
    ]

let daemon_container_definition_list_to_yojson tree =
  list_to_yojson daemon_container_definition_to_yojson tree

let daemon_container_image_to_yojson (x : daemon_container_image) =
  assoc_to_yojson
    [
      ("containerName", option_to_yojson string__to_yojson x.container_name);
      ("imageDigest", option_to_yojson string__to_yojson x.image_digest);
      ("image", option_to_yojson string__to_yojson x.image);
    ]

let daemon_container_images_to_yojson tree = list_to_yojson daemon_container_image_to_yojson tree

let daemon_rollback_to_yojson (x : daemon_rollback) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("startedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ( "rollbackTargetDaemonRevisionArn",
        option_to_yojson string__to_yojson x.rollback_target_daemon_revision_arn );
      ( "rollbackCapacityProviders",
        option_to_yojson string_list_to_yojson x.rollback_capacity_providers );
    ]

let daemon_deployment_alarms_to_yojson (x : daemon_deployment_alarms) =
  assoc_to_yojson
    [
      ("status", option_to_yojson daemon_deployment_rollback_monitors_status_to_yojson x.status);
      ("alarmNames", option_to_yojson string_list_to_yojson x.alarm_names);
      ("triggeredAlarmNames", option_to_yojson string_list_to_yojson x.triggered_alarm_names);
    ]

let daemon_deployment_capacity_provider_to_yojson (x : daemon_deployment_capacity_provider) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("runningInstanceCount", option_to_yojson boxed_integer_to_yojson x.running_instance_count);
      ("drainingInstanceCount", option_to_yojson boxed_integer_to_yojson x.draining_instance_count);
    ]

let daemon_deployment_capacity_provider_list_to_yojson tree =
  list_to_yojson daemon_deployment_capacity_provider_to_yojson tree

let daemon_deployment_revision_detail_to_yojson (x : daemon_deployment_revision_detail) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ( "capacityProviders",
        option_to_yojson daemon_deployment_capacity_provider_list_to_yojson x.capacity_providers );
      ( "totalRunningInstanceCount",
        option_to_yojson boxed_integer_to_yojson x.total_running_instance_count );
      ( "totalDrainingInstanceCount",
        option_to_yojson boxed_integer_to_yojson x.total_draining_instance_count );
    ]

let daemon_deployment_revision_detail_list_to_yojson tree =
  list_to_yojson daemon_deployment_revision_detail_to_yojson tree

let daemon_deployment_status_to_yojson (x : daemon_deployment_status) =
  match x with
  | PENDING -> `String "PENDING"
  | SUCCESSFUL -> `String "SUCCESSFUL"
  | STOPPED -> `String "STOPPED"
  | STOP_REQUESTED -> `String "STOP_REQUESTED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | ROLLBACK_IN_PROGRESS -> `String "ROLLBACK_IN_PROGRESS"
  | ROLLBACK_SUCCESSFUL -> `String "ROLLBACK_SUCCESSFUL"
  | ROLLBACK_FAILED -> `String "ROLLBACK_FAILED"

let daemon_deployment_to_yojson (x : daemon_deployment) =
  assoc_to_yojson
    [
      ("daemonDeploymentArn", option_to_yojson string__to_yojson x.daemon_deployment_arn);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("status", option_to_yojson daemon_deployment_status_to_yojson x.status);
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ( "targetDaemonRevision",
        option_to_yojson daemon_deployment_revision_detail_to_yojson x.target_daemon_revision );
      ( "sourceDaemonRevisions",
        option_to_yojson daemon_deployment_revision_detail_list_to_yojson x.source_daemon_revisions
      );
      ("circuitBreaker", option_to_yojson daemon_circuit_breaker_to_yojson x.circuit_breaker);
      ("alarms", option_to_yojson daemon_deployment_alarms_to_yojson x.alarms);
      ("rollback", option_to_yojson daemon_rollback_to_yojson x.rollback);
      ( "deploymentConfiguration",
        option_to_yojson daemon_deployment_configuration_to_yojson x.deployment_configuration );
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("startedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("stoppedAt", option_to_yojson timestamp_to_yojson x.stopped_at);
      ("finishedAt", option_to_yojson timestamp_to_yojson x.finished_at);
    ]

let daemon_deployment_list_to_yojson tree = list_to_yojson daemon_deployment_to_yojson tree

let daemon_deployment_status_list_to_yojson tree =
  list_to_yojson daemon_deployment_status_to_yojson tree

let daemon_deployment_summary_to_yojson (x : daemon_deployment_summary) =
  assoc_to_yojson
    [
      ("daemonDeploymentArn", option_to_yojson string__to_yojson x.daemon_deployment_arn);
      ("daemonArn", option_to_yojson string__to_yojson x.daemon_arn);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("status", option_to_yojson daemon_deployment_status_to_yojson x.status);
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("targetDaemonRevisionArn", option_to_yojson string__to_yojson x.target_daemon_revision_arn);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("startedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("stoppedAt", option_to_yojson timestamp_to_yojson x.stopped_at);
      ("finishedAt", option_to_yojson timestamp_to_yojson x.finished_at);
    ]

let daemon_deployment_summary_list_to_yojson tree =
  list_to_yojson daemon_deployment_summary_to_yojson tree

let daemon_revision_detail_to_yojson (x : daemon_revision_detail) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ( "capacityProviders",
        option_to_yojson daemon_capacity_provider_list_to_yojson x.capacity_providers );
      ("totalRunningCount", option_to_yojson integer_to_yojson x.total_running_count);
    ]

let daemon_revision_detail_list_to_yojson tree =
  list_to_yojson daemon_revision_detail_to_yojson tree

let daemon_detail_to_yojson (x : daemon_detail) =
  assoc_to_yojson
    [
      ("daemonArn", option_to_yojson string__to_yojson x.daemon_arn);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("status", option_to_yojson daemon_status_to_yojson x.status);
      ( "currentRevisions",
        option_to_yojson daemon_revision_detail_list_to_yojson x.current_revisions );
      ("deploymentArn", option_to_yojson string__to_yojson x.deployment_arn);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let daemon_ipc_mode_to_yojson (x : daemon_ipc_mode) =
  match x with NONE -> `String "none" | SHARED -> `String "shared"

let daemon_not_active_exception_to_yojson (x : daemon_not_active_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let daemon_not_found_exception_to_yojson (x : daemon_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let daemon_pid_mode_to_yojson (x : daemon_pid_mode) =
  match x with NONE -> `String "none" | SHARED -> `String "shared"

let daemon_revision_to_yojson (x : daemon_revision) =
  assoc_to_yojson
    [
      ("daemonRevisionArn", option_to_yojson string__to_yojson x.daemon_revision_arn);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("daemonArn", option_to_yojson string__to_yojson x.daemon_arn);
      ("daemonTaskDefinitionArn", option_to_yojson string__to_yojson x.daemon_task_definition_arn);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("containerImages", option_to_yojson daemon_container_images_to_yojson x.container_images);
      ("propagateTags", option_to_yojson daemon_propagate_tags_to_yojson x.propagate_tags);
      ("enableECSManagedTags", option_to_yojson boxed_boolean_to_yojson x.enable_ecs_managed_tags);
      ("enableExecuteCommand", option_to_yojson boxed_boolean_to_yojson x.enable_execute_command);
    ]

let daemon_revisions_to_yojson tree = list_to_yojson daemon_revision_to_yojson tree

let daemon_summary_to_yojson (x : daemon_summary) =
  assoc_to_yojson
    [
      ("daemonArn", option_to_yojson string__to_yojson x.daemon_arn);
      ("status", option_to_yojson daemon_status_to_yojson x.status);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let daemon_summaries_list_to_yojson tree = list_to_yojson daemon_summary_to_yojson tree

let daemon_task_definition_status_to_yojson (x : daemon_task_definition_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | DELETED -> `String "DELETED"

let daemon_volume_to_yojson (x : daemon_volume) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("host", option_to_yojson host_volume_properties_to_yojson x.host);
    ]

let daemon_volume_list_to_yojson tree = list_to_yojson daemon_volume_to_yojson tree

let daemon_task_definition_to_yojson (x : daemon_task_definition) =
  assoc_to_yojson
    [
      ("daemonTaskDefinitionArn", option_to_yojson string__to_yojson x.daemon_task_definition_arn);
      ("family", option_to_yojson string__to_yojson x.family);
      ("revision", option_to_yojson integer_to_yojson x.revision);
      ("taskRoleArn", option_to_yojson string__to_yojson x.task_role_arn);
      ("executionRoleArn", option_to_yojson string__to_yojson x.execution_role_arn);
      ( "containerDefinitions",
        option_to_yojson daemon_container_definition_list_to_yojson x.container_definitions );
      ("volumes", option_to_yojson daemon_volume_list_to_yojson x.volumes);
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("status", option_to_yojson daemon_task_definition_status_to_yojson x.status);
      ("registeredAt", option_to_yojson timestamp_to_yojson x.registered_at);
      ("deleteRequestedAt", option_to_yojson timestamp_to_yojson x.delete_requested_at);
      ("registeredBy", option_to_yojson string__to_yojson x.registered_by);
      ("pidMode", option_to_yojson daemon_pid_mode_to_yojson x.pid_mode);
      ("ipcMode", option_to_yojson daemon_ipc_mode_to_yojson x.ipc_mode);
    ]

let daemon_task_definition_revision_filter_to_yojson (x : daemon_task_definition_revision_filter) =
  match x with LAST_REGISTERED -> `String "LAST_REGISTERED"

let daemon_task_definition_status_filter_to_yojson (x : daemon_task_definition_status_filter) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | ALL -> `String "ALL"

let daemon_task_definition_summary_to_yojson (x : daemon_task_definition_summary) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("registeredAt", option_to_yojson timestamp_to_yojson x.registered_at);
      ("registeredBy", option_to_yojson string__to_yojson x.registered_by);
      ("deleteRequestedAt", option_to_yojson timestamp_to_yojson x.delete_requested_at);
      ("status", option_to_yojson daemon_task_definition_status_to_yojson x.status);
    ]

let daemon_task_definition_summaries_to_yojson tree =
  list_to_yojson daemon_task_definition_summary_to_yojson tree

let target_not_found_exception_to_yojson (x : target_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let delete_attributes_response_to_yojson (x : delete_attributes_response) =
  assoc_to_yojson [ ("attributes", option_to_yojson attributes_to_yojson x.attributes) ]

let delete_attributes_request_to_yojson (x : delete_attributes_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("attributes", Some (attributes_to_yojson x.attributes));
    ]

let delete_capacity_provider_response_to_yojson (x : delete_capacity_provider_response) =
  assoc_to_yojson
    [ ("capacityProvider", option_to_yojson capacity_provider_to_yojson x.capacity_provider) ]

let delete_capacity_provider_request_to_yojson (x : delete_capacity_provider_request) =
  assoc_to_yojson
    [
      ("capacityProvider", Some (string__to_yojson x.capacity_provider));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let delete_cluster_response_to_yojson (x : delete_cluster_response) =
  assoc_to_yojson [ ("cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let delete_cluster_request_to_yojson (x : delete_cluster_request) =
  assoc_to_yojson [ ("cluster", Some (string__to_yojson x.cluster)) ]

let delete_daemon_response_to_yojson (x : delete_daemon_response) =
  assoc_to_yojson
    [
      ("daemonArn", option_to_yojson string__to_yojson x.daemon_arn);
      ("status", option_to_yojson daemon_status_to_yojson x.status);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("deploymentArn", option_to_yojson string__to_yojson x.deployment_arn);
    ]

let delete_daemon_request_to_yojson (x : delete_daemon_request) =
  assoc_to_yojson [ ("daemonArn", Some (string__to_yojson x.daemon_arn)) ]

let delete_daemon_task_definition_response_to_yojson (x : delete_daemon_task_definition_response) =
  assoc_to_yojson
    [ ("daemonTaskDefinitionArn", option_to_yojson string__to_yojson x.daemon_task_definition_arn) ]

let delete_daemon_task_definition_request_to_yojson (x : delete_daemon_task_definition_request) =
  assoc_to_yojson [ ("daemonTaskDefinition", Some (string__to_yojson x.daemon_task_definition)) ]

let delete_express_gateway_service_response_to_yojson (x : delete_express_gateway_service_response)
    =
  assoc_to_yojson [ ("service", option_to_yojson ecs_express_gateway_service_to_yojson x.service) ]

let delete_express_gateway_service_request_to_yojson (x : delete_express_gateway_service_request) =
  assoc_to_yojson [ ("serviceArn", Some (string__to_yojson x.service_arn)) ]

let delete_service_response_to_yojson (x : delete_service_response) =
  assoc_to_yojson [ ("service", option_to_yojson service_to_yojson x.service) ]

let delete_service_request_to_yojson (x : delete_service_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("service", Some (string__to_yojson x.service));
      ("force", option_to_yojson boxed_boolean_to_yojson x.force);
    ]

let failure_to_yojson (x : failure) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("detail", option_to_yojson string__to_yojson x.detail);
    ]

let failures_to_yojson tree = list_to_yojson failure_to_yojson tree
let task_definition_list_to_yojson tree = list_to_yojson task_definition_to_yojson tree

let delete_task_definitions_response_to_yojson (x : delete_task_definitions_response) =
  assoc_to_yojson
    [
      ("taskDefinitions", option_to_yojson task_definition_list_to_yojson x.task_definitions);
      ("failures", option_to_yojson failures_to_yojson x.failures);
    ]

let delete_task_definitions_request_to_yojson (x : delete_task_definitions_request) =
  assoc_to_yojson [ ("taskDefinitions", Some (string_list_to_yojson x.task_definitions)) ]

let task_set_not_found_exception_to_yojson (x : task_set_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let delete_task_set_response_to_yojson (x : delete_task_set_response) =
  assoc_to_yojson [ ("taskSet", option_to_yojson task_set_to_yojson x.task_set) ]

let delete_task_set_request_to_yojson (x : delete_task_set_request) =
  assoc_to_yojson
    [
      ("cluster", Some (string__to_yojson x.cluster));
      ("service", Some (string__to_yojson x.service));
      ("taskSet", Some (string__to_yojson x.task_set));
      ("force", option_to_yojson boxed_boolean_to_yojson x.force);
    ]

let deployment_lifecycle_hook_status_to_yojson (x : deployment_lifecycle_hook_status) =
  match x with
  | AWAITING_ACTION -> `String "AWAITING_ACTION"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | TIMED_OUT -> `String "TIMED_OUT"

let deployment_lifecycle_hook_detail_to_yojson (x : deployment_lifecycle_hook_detail) =
  assoc_to_yojson
    [
      ("hookId", option_to_yojson string__to_yojson x.hook_id);
      ("targetType", option_to_yojson deployment_lifecycle_hook_target_type_to_yojson x.target_type);
      ("targetArn", option_to_yojson string__to_yojson x.target_arn);
      ("status", option_to_yojson deployment_lifecycle_hook_status_to_yojson x.status);
      ("expiresAt", option_to_yojson timestamp_to_yojson x.expires_at);
      ("timeoutAction", option_to_yojson deployment_lifecycle_hook_action_to_yojson x.timeout_action);
    ]

let deployment_lifecycle_hook_detail_list_to_yojson tree =
  list_to_yojson deployment_lifecycle_hook_detail_to_yojson tree

let deregister_container_instance_response_to_yojson (x : deregister_container_instance_response) =
  assoc_to_yojson
    [ ("containerInstance", option_to_yojson container_instance_to_yojson x.container_instance) ]

let deregister_container_instance_request_to_yojson (x : deregister_container_instance_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("containerInstance", Some (string__to_yojson x.container_instance));
      ("force", option_to_yojson boxed_boolean_to_yojson x.force);
    ]

let describe_capacity_providers_response_to_yojson (x : describe_capacity_providers_response) =
  assoc_to_yojson
    [
      ("capacityProviders", option_to_yojson capacity_providers_to_yojson x.capacity_providers);
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_capacity_providers_request_to_yojson (x : describe_capacity_providers_request) =
  assoc_to_yojson
    [
      ("capacityProviders", option_to_yojson string_list_to_yojson x.capacity_providers);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("include", option_to_yojson capacity_provider_field_list_to_yojson x.include_);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_clusters_response_to_yojson (x : describe_clusters_response) =
  assoc_to_yojson
    [
      ("clusters", option_to_yojson clusters_to_yojson x.clusters);
      ("failures", option_to_yojson failures_to_yojson x.failures);
    ]

let describe_clusters_request_to_yojson (x : describe_clusters_request) =
  assoc_to_yojson
    [
      ("clusters", option_to_yojson string_list_to_yojson x.clusters);
      ("include", option_to_yojson cluster_field_list_to_yojson x.include_);
    ]

let describe_container_instances_response_to_yojson (x : describe_container_instances_response) =
  assoc_to_yojson
    [
      ("containerInstances", option_to_yojson container_instances_to_yojson x.container_instances);
      ("failures", option_to_yojson failures_to_yojson x.failures);
    ]

let describe_container_instances_request_to_yojson (x : describe_container_instances_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("containerInstances", Some (string_list_to_yojson x.container_instances));
      ("include", option_to_yojson container_instance_field_list_to_yojson x.include_);
    ]

let describe_daemon_response_to_yojson (x : describe_daemon_response) =
  assoc_to_yojson [ ("daemon", option_to_yojson daemon_detail_to_yojson x.daemon) ]

let describe_daemon_request_to_yojson (x : describe_daemon_request) =
  assoc_to_yojson [ ("daemonArn", Some (string__to_yojson x.daemon_arn)) ]

let describe_daemon_deployments_response_to_yojson (x : describe_daemon_deployments_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("daemonDeployments", option_to_yojson daemon_deployment_list_to_yojson x.daemon_deployments);
    ]

let describe_daemon_deployments_request_to_yojson (x : describe_daemon_deployments_request) =
  assoc_to_yojson
    [ ("daemonDeploymentArns", Some (string_list_to_yojson x.daemon_deployment_arns)) ]

let describe_daemon_revisions_response_to_yojson (x : describe_daemon_revisions_response) =
  assoc_to_yojson
    [
      ("daemonRevisions", option_to_yojson daemon_revisions_to_yojson x.daemon_revisions);
      ("failures", option_to_yojson failures_to_yojson x.failures);
    ]

let describe_daemon_revisions_request_to_yojson (x : describe_daemon_revisions_request) =
  assoc_to_yojson [ ("daemonRevisionArns", Some (string_list_to_yojson x.daemon_revision_arns)) ]

let describe_daemon_task_definition_response_to_yojson
    (x : describe_daemon_task_definition_response) =
  assoc_to_yojson
    [
      ( "daemonTaskDefinition",
        option_to_yojson daemon_task_definition_to_yojson x.daemon_task_definition );
    ]

let describe_daemon_task_definition_request_to_yojson (x : describe_daemon_task_definition_request)
    =
  assoc_to_yojson [ ("daemonTaskDefinition", Some (string__to_yojson x.daemon_task_definition)) ]

let describe_express_gateway_service_response_to_yojson
    (x : describe_express_gateway_service_response) =
  assoc_to_yojson [ ("service", option_to_yojson ecs_express_gateway_service_to_yojson x.service) ]

let express_gateway_service_include_to_yojson (x : express_gateway_service_include) =
  match x with TAGS -> `String "TAGS"

let express_gateway_service_include_list_to_yojson tree =
  list_to_yojson express_gateway_service_include_to_yojson tree

let describe_express_gateway_service_request_to_yojson
    (x : describe_express_gateway_service_request) =
  assoc_to_yojson
    [
      ("serviceArn", Some (string__to_yojson x.service_arn));
      ("include", option_to_yojson express_gateway_service_include_list_to_yojson x.include_);
    ]

let service_deployment_rollback_monitors_status_to_yojson
    (x : service_deployment_rollback_monitors_status) =
  match x with
  | TRIGGERED -> `String "TRIGGERED"
  | MONITORING -> `String "MONITORING"
  | MONITORING_COMPLETE -> `String "MONITORING_COMPLETE"
  | DISABLED -> `String "DISABLED"

let service_deployment_alarms_to_yojson (x : service_deployment_alarms) =
  assoc_to_yojson
    [
      ("status", option_to_yojson service_deployment_rollback_monitors_status_to_yojson x.status);
      ("alarmNames", option_to_yojson string_list_to_yojson x.alarm_names);
      ("triggeredAlarmNames", option_to_yojson string_list_to_yojson x.triggered_alarm_names);
    ]

let service_deployment_circuit_breaker_to_yojson (x : service_deployment_circuit_breaker) =
  assoc_to_yojson
    [
      ("status", option_to_yojson service_deployment_rollback_monitors_status_to_yojson x.status);
      ("failureCount", option_to_yojson integer_to_yojson x.failure_count);
      ("threshold", option_to_yojson integer_to_yojson x.threshold);
    ]

let rollback_to_yojson (x : rollback) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("startedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("serviceRevisionArn", option_to_yojson string__to_yojson x.service_revision_arn);
    ]

let service_deployment_lifecycle_stage_to_yojson (x : service_deployment_lifecycle_stage) =
  match x with
  | RECONCILE_SERVICE -> `String "RECONCILE_SERVICE"
  | PRE_SCALE_UP -> `String "PRE_SCALE_UP"
  | SCALE_UP -> `String "SCALE_UP"
  | POST_SCALE_UP -> `String "POST_SCALE_UP"
  | TEST_TRAFFIC_SHIFT -> `String "TEST_TRAFFIC_SHIFT"
  | POST_TEST_TRAFFIC_SHIFT -> `String "POST_TEST_TRAFFIC_SHIFT"
  | PRODUCTION_TRAFFIC_SHIFT -> `String "PRODUCTION_TRAFFIC_SHIFT"
  | POST_PRODUCTION_TRAFFIC_SHIFT -> `String "POST_PRODUCTION_TRAFFIC_SHIFT"
  | BAKE_TIME -> `String "BAKE_TIME"
  | CLEAN_UP -> `String "CLEAN_UP"

let service_deployment_status_to_yojson (x : service_deployment_status) =
  match x with
  | PENDING -> `String "PENDING"
  | SUCCESSFUL -> `String "SUCCESSFUL"
  | STOPPED -> `String "STOPPED"
  | STOP_REQUESTED -> `String "STOP_REQUESTED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | ROLLBACK_REQUESTED -> `String "ROLLBACK_REQUESTED"
  | ROLLBACK_IN_PROGRESS -> `String "ROLLBACK_IN_PROGRESS"
  | ROLLBACK_SUCCESSFUL -> `String "ROLLBACK_SUCCESSFUL"
  | ROLLBACK_FAILED -> `String "ROLLBACK_FAILED"

let service_revision_summary_to_yojson (x : service_revision_summary) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("requestedTaskCount", option_to_yojson integer_to_yojson x.requested_task_count);
      ("runningTaskCount", option_to_yojson integer_to_yojson x.running_task_count);
      ("pendingTaskCount", option_to_yojson integer_to_yojson x.pending_task_count);
      ( "requestedTestTrafficWeight",
        option_to_yojson double_to_yojson x.requested_test_traffic_weight );
      ( "requestedProductionTrafficWeight",
        option_to_yojson double_to_yojson x.requested_production_traffic_weight );
    ]

let service_revisions_summary_list_to_yojson tree =
  list_to_yojson service_revision_summary_to_yojson tree

let service_deployment_to_yojson (x : service_deployment) =
  assoc_to_yojson
    [
      ("serviceDeploymentArn", option_to_yojson string__to_yojson x.service_deployment_arn);
      ("serviceArn", option_to_yojson string__to_yojson x.service_arn);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("startedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("finishedAt", option_to_yojson timestamp_to_yojson x.finished_at);
      ("stoppedAt", option_to_yojson timestamp_to_yojson x.stopped_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ( "sourceServiceRevisions",
        option_to_yojson service_revisions_summary_list_to_yojson x.source_service_revisions );
      ( "targetServiceRevision",
        option_to_yojson service_revision_summary_to_yojson x.target_service_revision );
      ("status", option_to_yojson service_deployment_status_to_yojson x.status);
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ( "lifecycleStage",
        option_to_yojson service_deployment_lifecycle_stage_to_yojson x.lifecycle_stage );
      ( "lifecycleHookDetails",
        option_to_yojson deployment_lifecycle_hook_detail_list_to_yojson x.lifecycle_hook_details );
      ( "deploymentConfiguration",
        option_to_yojson deployment_configuration_to_yojson x.deployment_configuration );
      ("rollback", option_to_yojson rollback_to_yojson x.rollback);
      ( "deploymentCircuitBreaker",
        option_to_yojson service_deployment_circuit_breaker_to_yojson x.deployment_circuit_breaker
      );
      ("alarms", option_to_yojson service_deployment_alarms_to_yojson x.alarms);
    ]

let service_deployments_to_yojson tree = list_to_yojson service_deployment_to_yojson tree

let describe_service_deployments_response_to_yojson (x : describe_service_deployments_response) =
  assoc_to_yojson
    [
      ("serviceDeployments", option_to_yojson service_deployments_to_yojson x.service_deployments);
      ("failures", option_to_yojson failures_to_yojson x.failures);
    ]

let describe_service_deployments_request_to_yojson (x : describe_service_deployments_request) =
  assoc_to_yojson
    [ ("serviceDeploymentArns", Some (string_list_to_yojson x.service_deployment_arns)) ]

let managed_resource_status_to_yojson (x : managed_resource_status) =
  match x with
  | PROVISIONING -> `String "PROVISIONING"
  | ACTIVE -> `String "ACTIVE"
  | DEPROVISIONING -> `String "DEPROVISIONING"
  | DELETED -> `String "DELETED"
  | FAILED -> `String "FAILED"

let managed_log_group_to_yojson (x : managed_log_group) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("logGroupName", Some (string__to_yojson x.log_group_name));
    ]

let managed_log_groups_to_yojson tree = list_to_yojson managed_log_group_to_yojson tree

let managed_security_group_to_yojson (x : managed_security_group) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
    ]

let managed_security_groups_to_yojson tree = list_to_yojson managed_security_group_to_yojson tree

let managed_metric_alarm_to_yojson (x : managed_metric_alarm) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
    ]

let managed_metric_alarms_to_yojson tree = list_to_yojson managed_metric_alarm_to_yojson tree

let managed_application_auto_scaling_policy_to_yojson (x : managed_application_auto_scaling_policy)
    =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("policyType", Some (string__to_yojson x.policy_type));
      ("targetValue", Some (double_to_yojson x.target_value));
      ("metric", Some (string__to_yojson x.metric));
    ]

let managed_application_auto_scaling_policies_to_yojson tree =
  list_to_yojson managed_application_auto_scaling_policy_to_yojson tree

let managed_scalable_target_to_yojson (x : managed_scalable_target) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("minCapacity", Some (integer_to_yojson x.min_capacity));
      ("maxCapacity", Some (integer_to_yojson x.max_capacity));
    ]

let managed_auto_scaling_to_yojson (x : managed_auto_scaling) =
  assoc_to_yojson
    [
      ("scalableTarget", option_to_yojson managed_scalable_target_to_yojson x.scalable_target);
      ( "applicationAutoScalingPolicies",
        option_to_yojson managed_application_auto_scaling_policies_to_yojson
          x.application_auto_scaling_policies );
    ]

let managed_target_group_to_yojson (x : managed_target_group) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("healthCheckPath", Some (string__to_yojson x.health_check_path));
      ("healthCheckPort", Some (integer_to_yojson x.health_check_port));
      ("port", Some (integer_to_yojson x.port));
    ]

let managed_target_groups_to_yojson tree = list_to_yojson managed_target_group_to_yojson tree

let managed_listener_rule_to_yojson (x : managed_listener_rule) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
    ]

let managed_listener_to_yojson (x : managed_listener) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
    ]

let managed_certificate_to_yojson (x : managed_certificate) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("domainName", Some (string__to_yojson x.domain_name));
    ]

let managed_load_balancer_to_yojson (x : managed_load_balancer) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson string__to_yojson x.arn);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("scheme", Some (string__to_yojson x.scheme));
      ("subnetIds", option_to_yojson string_list_to_yojson x.subnet_ids);
      ("securityGroupIds", option_to_yojson string_list_to_yojson x.security_group_ids);
    ]

let managed_ingress_path_to_yojson (x : managed_ingress_path) =
  assoc_to_yojson
    [
      ("accessType", Some (access_type_to_yojson x.access_type));
      ("endpoint", Some (string__to_yojson x.endpoint));
      ("loadBalancer", option_to_yojson managed_load_balancer_to_yojson x.load_balancer);
      ( "loadBalancerSecurityGroups",
        option_to_yojson managed_security_groups_to_yojson x.load_balancer_security_groups );
      ("certificate", option_to_yojson managed_certificate_to_yojson x.certificate);
      ("listener", option_to_yojson managed_listener_to_yojson x.listener);
      ("rule", option_to_yojson managed_listener_rule_to_yojson x.rule);
      ("targetGroups", option_to_yojson managed_target_groups_to_yojson x.target_groups);
    ]

let managed_ingress_paths_to_yojson tree = list_to_yojson managed_ingress_path_to_yojson tree

let ecs_managed_resources_to_yojson (x : ecs_managed_resources) =
  assoc_to_yojson
    [
      ("ingressPaths", option_to_yojson managed_ingress_paths_to_yojson x.ingress_paths);
      ("autoScaling", option_to_yojson managed_auto_scaling_to_yojson x.auto_scaling);
      ("metricAlarms", option_to_yojson managed_metric_alarms_to_yojson x.metric_alarms);
      ( "serviceSecurityGroups",
        option_to_yojson managed_security_groups_to_yojson x.service_security_groups );
      ("logGroups", option_to_yojson managed_log_groups_to_yojson x.log_groups);
    ]

let service_revision_load_balancer_to_yojson (x : service_revision_load_balancer) =
  assoc_to_yojson
    [
      ("targetGroupArn", option_to_yojson string__to_yojson x.target_group_arn);
      ("productionListenerRule", option_to_yojson string__to_yojson x.production_listener_rule);
    ]

let service_revision_load_balancers_to_yojson tree =
  list_to_yojson service_revision_load_balancer_to_yojson tree

let resolved_configuration_to_yojson (x : resolved_configuration) =
  assoc_to_yojson
    [
      ("loadBalancers", option_to_yojson service_revision_load_balancers_to_yojson x.load_balancers);
    ]

let service_revision_to_yojson (x : service_revision) =
  assoc_to_yojson
    [
      ("serviceRevisionArn", option_to_yojson string__to_yojson x.service_revision_arn);
      ("serviceArn", option_to_yojson string__to_yojson x.service_arn);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("taskDefinition", option_to_yojson string__to_yojson x.task_definition);
      ( "capacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("platformFamily", option_to_yojson string__to_yojson x.platform_family);
      ("loadBalancers", option_to_yojson load_balancers_to_yojson x.load_balancers);
      ("serviceRegistries", option_to_yojson service_registries_to_yojson x.service_registries);
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("containerImages", option_to_yojson container_images_to_yojson x.container_images);
      ("guardDutyEnabled", option_to_yojson boolean__to_yojson x.guard_duty_enabled);
      ( "serviceConnectConfiguration",
        option_to_yojson service_connect_configuration_to_yojson x.service_connect_configuration );
      ( "volumeConfigurations",
        option_to_yojson service_volume_configurations_to_yojson x.volume_configurations );
      ( "fargateEphemeralStorage",
        option_to_yojson deployment_ephemeral_storage_to_yojson x.fargate_ephemeral_storage );
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ( "vpcLatticeConfigurations",
        option_to_yojson vpc_lattice_configurations_to_yojson x.vpc_lattice_configurations );
      ( "resolvedConfiguration",
        option_to_yojson resolved_configuration_to_yojson x.resolved_configuration );
      ( "ecsManagedResources",
        option_to_yojson ecs_managed_resources_to_yojson x.ecs_managed_resources );
      ("monitoring", option_to_yojson monitoring_configuration_to_yojson x.monitoring);
    ]

let service_revisions_to_yojson tree = list_to_yojson service_revision_to_yojson tree

let describe_service_revisions_response_to_yojson (x : describe_service_revisions_response) =
  assoc_to_yojson
    [
      ("serviceRevisions", option_to_yojson service_revisions_to_yojson x.service_revisions);
      ("failures", option_to_yojson failures_to_yojson x.failures);
    ]

let describe_service_revisions_request_to_yojson (x : describe_service_revisions_request) =
  assoc_to_yojson [ ("serviceRevisionArns", Some (string_list_to_yojson x.service_revision_arns)) ]

let services_to_yojson tree = list_to_yojson service_to_yojson tree

let describe_services_response_to_yojson (x : describe_services_response) =
  assoc_to_yojson
    [
      ("services", option_to_yojson services_to_yojson x.services);
      ("failures", option_to_yojson failures_to_yojson x.failures);
    ]

let service_field_to_yojson (x : service_field) = match x with TAGS -> `String "TAGS"
let service_field_list_to_yojson tree = list_to_yojson service_field_to_yojson tree

let describe_services_request_to_yojson (x : describe_services_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("services", Some (string_list_to_yojson x.services));
      ("include", option_to_yojson service_field_list_to_yojson x.include_);
    ]

let describe_task_sets_response_to_yojson (x : describe_task_sets_response) =
  assoc_to_yojson
    [
      ("taskSets", option_to_yojson task_sets_to_yojson x.task_sets);
      ("failures", option_to_yojson failures_to_yojson x.failures);
    ]

let task_set_field_to_yojson (x : task_set_field) = match x with TAGS -> `String "TAGS"
let task_set_field_list_to_yojson tree = list_to_yojson task_set_field_to_yojson tree

let describe_task_sets_request_to_yojson (x : describe_task_sets_request) =
  assoc_to_yojson
    [
      ("cluster", Some (string__to_yojson x.cluster));
      ("service", Some (string__to_yojson x.service));
      ("taskSets", option_to_yojson string_list_to_yojson x.task_sets);
      ("include", option_to_yojson task_set_field_list_to_yojson x.include_);
    ]

let task_ephemeral_storage_to_yojson (x : task_ephemeral_storage) =
  assoc_to_yojson
    [
      ("sizeInGiB", option_to_yojson integer_to_yojson x.size_in_gi_b);
      ("kmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
    ]

let task_stop_code_to_yojson (x : task_stop_code) =
  match x with
  | TASK_FAILED_TO_START -> `String "TaskFailedToStart"
  | ESSENTIAL_CONTAINER_EXITED -> `String "EssentialContainerExited"
  | USER_INITIATED -> `String "UserInitiated"
  | SERVICE_SCHEDULER_INITIATED -> `String "ServiceSchedulerInitiated"
  | SPOT_INTERRUPTION -> `String "SpotInterruption"
  | TERMINATION_NOTICE -> `String "TerminationNotice"

let inference_accelerator_override_to_yojson (x : inference_accelerator_override) =
  assoc_to_yojson
    [
      ("deviceName", option_to_yojson string__to_yojson x.device_name);
      ("deviceType", option_to_yojson string__to_yojson x.device_type);
    ]

let inference_accelerator_overrides_to_yojson tree =
  list_to_yojson inference_accelerator_override_to_yojson tree

let task_override_to_yojson (x : task_override) =
  assoc_to_yojson
    [
      ("containerOverrides", option_to_yojson container_overrides_to_yojson x.container_overrides);
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ( "inferenceAcceleratorOverrides",
        option_to_yojson inference_accelerator_overrides_to_yojson x.inference_accelerator_overrides
      );
      ("executionRoleArn", option_to_yojson string__to_yojson x.execution_role_arn);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("taskRoleArn", option_to_yojson string__to_yojson x.task_role_arn);
      ("ephemeralStorage", option_to_yojson ephemeral_storage_to_yojson x.ephemeral_storage);
    ]

let task_to_yojson (x : task) =
  assoc_to_yojson
    [
      ("attachments", option_to_yojson attachments_to_yojson x.attachments);
      ("attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("availabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ("capacityProviderName", option_to_yojson string__to_yojson x.capacity_provider_name);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("connectivity", option_to_yojson connectivity_to_yojson x.connectivity);
      ("connectivityAt", option_to_yojson timestamp_to_yojson x.connectivity_at);
      ("containerInstanceArn", option_to_yojson string__to_yojson x.container_instance_arn);
      ("containers", option_to_yojson containers_to_yojson x.containers);
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("desiredStatus", option_to_yojson string__to_yojson x.desired_status);
      ("enableExecuteCommand", option_to_yojson boolean__to_yojson x.enable_execute_command);
      ("executionStoppedAt", option_to_yojson timestamp_to_yojson x.execution_stopped_at);
      ("group", option_to_yojson string__to_yojson x.group);
      ("healthStatus", option_to_yojson health_status_to_yojson x.health_status);
      ( "inferenceAccelerators",
        option_to_yojson inference_accelerators_to_yojson x.inference_accelerators );
      ("lastStatus", option_to_yojson string__to_yojson x.last_status);
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("overrides", option_to_yojson task_override_to_yojson x.overrides);
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("platformFamily", option_to_yojson string__to_yojson x.platform_family);
      ("pullStartedAt", option_to_yojson timestamp_to_yojson x.pull_started_at);
      ("pullStoppedAt", option_to_yojson timestamp_to_yojson x.pull_stopped_at);
      ("startedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("startedBy", option_to_yojson string__to_yojson x.started_by);
      ("stopCode", option_to_yojson task_stop_code_to_yojson x.stop_code);
      ("stoppedAt", option_to_yojson timestamp_to_yojson x.stopped_at);
      ("stoppedReason", option_to_yojson string__to_yojson x.stopped_reason);
      ("stoppingAt", option_to_yojson timestamp_to_yojson x.stopping_at);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("taskArn", option_to_yojson string__to_yojson x.task_arn);
      ("taskDefinitionArn", option_to_yojson string__to_yojson x.task_definition_arn);
      ("version", option_to_yojson long_to_yojson x.version);
      ("ephemeralStorage", option_to_yojson ephemeral_storage_to_yojson x.ephemeral_storage);
      ( "fargateEphemeralStorage",
        option_to_yojson task_ephemeral_storage_to_yojson x.fargate_ephemeral_storage );
    ]

let tasks_to_yojson tree = list_to_yojson task_to_yojson tree

let describe_tasks_response_to_yojson (x : describe_tasks_response) =
  assoc_to_yojson
    [
      ("tasks", option_to_yojson tasks_to_yojson x.tasks);
      ("failures", option_to_yojson failures_to_yojson x.failures);
    ]

let task_field_to_yojson (x : task_field) = match x with TAGS -> `String "TAGS"
let task_field_list_to_yojson tree = list_to_yojson task_field_to_yojson tree

let describe_tasks_request_to_yojson (x : describe_tasks_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("tasks", Some (string_list_to_yojson x.tasks));
      ("include", option_to_yojson task_field_list_to_yojson x.include_);
    ]

let desired_status_to_yojson (x : desired_status) =
  match x with
  | RUNNING -> `String "RUNNING"
  | PENDING -> `String "PENDING"
  | STOPPED -> `String "STOPPED"

let target_not_connected_exception_to_yojson (x : target_not_connected_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let sensitive_string_to_yojson = string_to_yojson

let session_to_yojson (x : session) =
  assoc_to_yojson
    [
      ("sessionId", option_to_yojson string__to_yojson x.session_id);
      ("streamUrl", option_to_yojson string__to_yojson x.stream_url);
      ("tokenValue", option_to_yojson sensitive_string_to_yojson x.token_value);
    ]

let execute_command_response_to_yojson (x : execute_command_response) =
  assoc_to_yojson
    [
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("containerArn", option_to_yojson string__to_yojson x.container_arn);
      ("containerName", option_to_yojson string__to_yojson x.container_name);
      ("interactive", option_to_yojson boolean__to_yojson x.interactive);
      ("session", option_to_yojson session_to_yojson x.session);
      ("taskArn", option_to_yojson string__to_yojson x.task_arn);
    ]

let execute_command_request_to_yojson (x : execute_command_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("container", option_to_yojson string__to_yojson x.container);
      ("command", Some (string__to_yojson x.command));
      ("interactive", Some (boolean__to_yojson x.interactive));
      ("task", Some (string__to_yojson x.task));
    ]

let protected_task_to_yojson (x : protected_task) =
  assoc_to_yojson
    [
      ("taskArn", option_to_yojson string__to_yojson x.task_arn);
      ("protectionEnabled", option_to_yojson boolean__to_yojson x.protection_enabled);
      ("expirationDate", option_to_yojson timestamp_to_yojson x.expiration_date);
    ]

let protected_tasks_to_yojson tree = list_to_yojson protected_task_to_yojson tree

let get_task_protection_response_to_yojson (x : get_task_protection_response) =
  assoc_to_yojson
    [
      ("protectedTasks", option_to_yojson protected_tasks_to_yojson x.protected_tasks);
      ("failures", option_to_yojson failures_to_yojson x.failures);
    ]

let get_task_protection_request_to_yojson (x : get_task_protection_request) =
  assoc_to_yojson
    [
      ("cluster", Some (string__to_yojson x.cluster));
      ("tasks", option_to_yojson string_list_to_yojson x.tasks);
    ]

let instance_launch_template_update_to_yojson (x : instance_launch_template_update) =
  assoc_to_yojson
    [
      ("ec2InstanceProfileArn", option_to_yojson string__to_yojson x.ec2_instance_profile_arn);
      ( "networkConfiguration",
        option_to_yojson managed_instances_network_configuration_to_yojson x.network_configuration
      );
      ( "storageConfiguration",
        option_to_yojson managed_instances_storage_configuration_to_yojson x.storage_configuration
      );
      ( "instanceMetadataTagsPropagation",
        option_to_yojson boxed_boolean_to_yojson x.instance_metadata_tags_propagation );
      ( "localStorageConfiguration",
        option_to_yojson managed_instances_local_storage_configuration_to_yojson
          x.local_storage_configuration );
      ("monitoring", option_to_yojson managed_instances_monitoring_options_to_yojson x.monitoring);
      ( "instanceRequirements",
        option_to_yojson instance_requirements_request_to_yojson x.instance_requirements );
      ( "capacityReservations",
        option_to_yojson capacity_reservation_request_to_yojson x.capacity_reservations );
    ]

let list_attributes_response_to_yojson (x : list_attributes_response) =
  assoc_to_yojson
    [
      ("attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_attributes_request_to_yojson (x : list_attributes_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("targetType", Some (target_type_to_yojson x.target_type));
      ("attributeName", option_to_yojson string__to_yojson x.attribute_name);
      ("attributeValue", option_to_yojson string__to_yojson x.attribute_value);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
    ]

let list_clusters_response_to_yojson (x : list_clusters_response) =
  assoc_to_yojson
    [
      ("clusterArns", option_to_yojson string_list_to_yojson x.cluster_arns);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_clusters_request_to_yojson (x : list_clusters_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
    ]

let list_container_instances_response_to_yojson (x : list_container_instances_response) =
  assoc_to_yojson
    [
      ("containerInstanceArns", option_to_yojson string_list_to_yojson x.container_instance_arns);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_container_instances_request_to_yojson (x : list_container_instances_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("filter", option_to_yojson string__to_yojson x.filter);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("status", option_to_yojson container_instance_status_to_yojson x.status);
    ]

let list_daemon_deployments_response_to_yojson (x : list_daemon_deployments_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ( "daemonDeployments",
        option_to_yojson daemon_deployment_summary_list_to_yojson x.daemon_deployments );
    ]

let list_daemon_deployments_request_to_yojson (x : list_daemon_deployments_request) =
  assoc_to_yojson
    [
      ("daemonArn", Some (string__to_yojson x.daemon_arn));
      ("status", option_to_yojson daemon_deployment_status_list_to_yojson x.status);
      ("createdAt", option_to_yojson created_at_to_yojson x.created_at);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_daemon_task_definitions_response_to_yojson (x : list_daemon_task_definitions_response) =
  assoc_to_yojson
    [
      ( "daemonTaskDefinitions",
        option_to_yojson daemon_task_definition_summaries_to_yojson x.daemon_task_definitions );
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let sort_order_to_yojson (x : sort_order) =
  match x with ASC -> `String "ASC" | DESC -> `String "DESC"

let list_daemon_task_definitions_request_to_yojson (x : list_daemon_task_definitions_request) =
  assoc_to_yojson
    [
      ("familyPrefix", option_to_yojson string__to_yojson x.family_prefix);
      ("family", option_to_yojson string__to_yojson x.family);
      ("revision", option_to_yojson daemon_task_definition_revision_filter_to_yojson x.revision);
      ("status", option_to_yojson daemon_task_definition_status_filter_to_yojson x.status);
      ("sort", option_to_yojson sort_order_to_yojson x.sort);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
    ]

let list_daemons_response_to_yojson (x : list_daemons_response) =
  assoc_to_yojson
    [
      ( "daemonSummariesList",
        option_to_yojson daemon_summaries_list_to_yojson x.daemon_summaries_list );
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_daemons_request_to_yojson (x : list_daemons_request) =
  assoc_to_yojson
    [
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("capacityProviderArns", option_to_yojson string_list_to_yojson x.capacity_provider_arns);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let service_deployment_brief_to_yojson (x : service_deployment_brief) =
  assoc_to_yojson
    [
      ("serviceDeploymentArn", option_to_yojson string__to_yojson x.service_deployment_arn);
      ("serviceArn", option_to_yojson string__to_yojson x.service_arn);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("startedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("finishedAt", option_to_yojson timestamp_to_yojson x.finished_at);
      ("targetServiceRevisionArn", option_to_yojson string__to_yojson x.target_service_revision_arn);
      ("status", option_to_yojson service_deployment_status_to_yojson x.status);
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
    ]

let service_deployments_brief_to_yojson tree =
  list_to_yojson service_deployment_brief_to_yojson tree

let list_service_deployments_response_to_yojson (x : list_service_deployments_response) =
  assoc_to_yojson
    [
      ( "serviceDeployments",
        option_to_yojson service_deployments_brief_to_yojson x.service_deployments );
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let service_deployment_status_list_to_yojson tree =
  list_to_yojson service_deployment_status_to_yojson tree

let list_service_deployments_request_to_yojson (x : list_service_deployments_request) =
  assoc_to_yojson
    [
      ("service", Some (string__to_yojson x.service));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("status", option_to_yojson service_deployment_status_list_to_yojson x.status);
      ("createdAt", option_to_yojson created_at_to_yojson x.created_at);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
    ]

let list_services_response_to_yojson (x : list_services_response) =
  assoc_to_yojson
    [
      ("serviceArns", option_to_yojson string_list_to_yojson x.service_arns);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_services_request_to_yojson (x : list_services_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ("schedulingStrategy", option_to_yojson scheduling_strategy_to_yojson x.scheduling_strategy);
      ( "resourceManagementType",
        option_to_yojson resource_management_type_to_yojson x.resource_management_type );
    ]

let list_task_definitions_response_to_yojson (x : list_task_definitions_response) =
  assoc_to_yojson
    [
      ("taskDefinitionArns", option_to_yojson string_list_to_yojson x.task_definition_arns);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_task_definitions_request_to_yojson (x : list_task_definitions_request) =
  assoc_to_yojson
    [
      ("familyPrefix", option_to_yojson string__to_yojson x.family_prefix);
      ("status", option_to_yojson task_definition_status_to_yojson x.status);
      ("sort", option_to_yojson sort_order_to_yojson x.sort);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
    ]

let list_tasks_response_to_yojson (x : list_tasks_response) =
  assoc_to_yojson
    [
      ("taskArns", option_to_yojson string_list_to_yojson x.task_arns);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_tasks_request_to_yojson (x : list_tasks_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("containerInstance", option_to_yojson string__to_yojson x.container_instance);
      ("family", option_to_yojson string__to_yojson x.family);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("startedBy", option_to_yojson string__to_yojson x.started_by);
      ("serviceName", option_to_yojson string__to_yojson x.service_name);
      ("desiredStatus", option_to_yojson desired_status_to_yojson x.desired_status);
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ("daemonName", option_to_yojson string__to_yojson x.daemon_name);
    ]

let managed_agent_state_change_to_yojson (x : managed_agent_state_change) =
  assoc_to_yojson
    [
      ("containerName", Some (string__to_yojson x.container_name));
      ("managedAgentName", Some (managed_agent_name_to_yojson x.managed_agent_name));
      ("status", Some (string__to_yojson x.status));
      ("reason", option_to_yojson string__to_yojson x.reason);
    ]

let managed_agent_state_changes_to_yojson tree =
  list_to_yojson managed_agent_state_change_to_yojson tree

let missing_version_exception_to_yojson (x : missing_version_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let no_update_available_exception_to_yojson (x : no_update_available_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let platform_device_type_to_yojson (x : platform_device_type) =
  match x with GPU -> `String "GPU" | NEURON_DEVICE -> `String "NEURON_DEVICE"

let platform_device_to_yojson (x : platform_device) =
  assoc_to_yojson
    [
      ("id", Some (string__to_yojson x.id)); ("type", Some (platform_device_type_to_yojson x.type_));
    ]

let platform_devices_to_yojson tree = list_to_yojson platform_device_to_yojson tree

let put_attributes_response_to_yojson (x : put_attributes_response) =
  assoc_to_yojson [ ("attributes", option_to_yojson attributes_to_yojson x.attributes) ]

let put_attributes_request_to_yojson (x : put_attributes_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("attributes", Some (attributes_to_yojson x.attributes));
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let put_cluster_capacity_providers_response_to_yojson (x : put_cluster_capacity_providers_response)
    =
  assoc_to_yojson [ ("cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let put_cluster_capacity_providers_request_to_yojson (x : put_cluster_capacity_providers_request) =
  assoc_to_yojson
    [
      ("cluster", Some (string__to_yojson x.cluster));
      ("capacityProviders", Some (string_list_to_yojson x.capacity_providers));
      ( "defaultCapacityProviderStrategy",
        Some (capacity_provider_strategy_to_yojson x.default_capacity_provider_strategy) );
    ]

let register_container_instance_response_to_yojson (x : register_container_instance_response) =
  assoc_to_yojson
    [ ("containerInstance", option_to_yojson container_instance_to_yojson x.container_instance) ]

let register_container_instance_request_to_yojson (x : register_container_instance_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("instanceIdentityDocument", option_to_yojson string__to_yojson x.instance_identity_document);
      ( "instanceIdentityDocumentSignature",
        option_to_yojson string__to_yojson x.instance_identity_document_signature );
      ("totalResources", option_to_yojson resources_to_yojson x.total_resources);
      ("versionInfo", option_to_yojson version_info_to_yojson x.version_info);
      ("containerInstanceArn", option_to_yojson string__to_yojson x.container_instance_arn);
      ("attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("platformDevices", option_to_yojson platform_devices_to_yojson x.platform_devices);
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let register_daemon_task_definition_response_to_yojson
    (x : register_daemon_task_definition_response) =
  assoc_to_yojson
    [ ("daemonTaskDefinitionArn", option_to_yojson string__to_yojson x.daemon_task_definition_arn) ]

let register_daemon_task_definition_request_to_yojson (x : register_daemon_task_definition_request)
    =
  assoc_to_yojson
    [
      ("family", Some (string__to_yojson x.family));
      ("taskRoleArn", option_to_yojson string__to_yojson x.task_role_arn);
      ("executionRoleArn", option_to_yojson string__to_yojson x.execution_role_arn);
      ( "containerDefinitions",
        Some (daemon_container_definition_list_to_yojson x.container_definitions) );
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("volumes", option_to_yojson daemon_volume_list_to_yojson x.volumes);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("pidMode", option_to_yojson daemon_pid_mode_to_yojson x.pid_mode);
      ("ipcMode", option_to_yojson daemon_ipc_mode_to_yojson x.ipc_mode);
    ]

let register_task_definition_response_to_yojson (x : register_task_definition_response) =
  assoc_to_yojson
    [
      ("taskDefinition", option_to_yojson task_definition_to_yojson x.task_definition);
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let register_task_definition_request_to_yojson (x : register_task_definition_request) =
  assoc_to_yojson
    [
      ("family", Some (string__to_yojson x.family));
      ("taskRoleArn", option_to_yojson string__to_yojson x.task_role_arn);
      ("executionRoleArn", option_to_yojson string__to_yojson x.execution_role_arn);
      ("networkMode", option_to_yojson network_mode_to_yojson x.network_mode);
      ("containerDefinitions", Some (container_definitions_to_yojson x.container_definitions));
      ("volumes", option_to_yojson volume_list_to_yojson x.volumes);
      ( "placementConstraints",
        option_to_yojson task_definition_placement_constraints_to_yojson x.placement_constraints );
      ( "requiresCompatibilities",
        option_to_yojson compatibility_list_to_yojson x.requires_compatibilities );
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("pidMode", option_to_yojson pid_mode_to_yojson x.pid_mode);
      ("ipcMode", option_to_yojson ipc_mode_to_yojson x.ipc_mode);
      ("proxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ( "inferenceAccelerators",
        option_to_yojson inference_accelerators_to_yojson x.inference_accelerators );
      ("ephemeralStorage", option_to_yojson ephemeral_storage_to_yojson x.ephemeral_storage);
      ("runtimePlatform", option_to_yojson runtime_platform_to_yojson x.runtime_platform);
      ("enableFaultInjection", option_to_yojson boxed_boolean_to_yojson x.enable_fault_injection);
    ]

let run_task_response_to_yojson (x : run_task_response) =
  assoc_to_yojson
    [
      ("tasks", option_to_yojson tasks_to_yojson x.tasks);
      ("failures", option_to_yojson failures_to_yojson x.failures);
    ]

let task_managed_ebs_volume_termination_policy_to_yojson
    (x : task_managed_ebs_volume_termination_policy) =
  assoc_to_yojson
    [ ("deleteOnTermination", Some (boxed_boolean_to_yojson x.delete_on_termination)) ]

let task_managed_ebs_volume_configuration_to_yojson (x : task_managed_ebs_volume_configuration) =
  assoc_to_yojson
    [
      ("encrypted", option_to_yojson boxed_boolean_to_yojson x.encrypted);
      ("kmsKeyId", option_to_yojson ebskms_key_id_to_yojson x.kms_key_id);
      ("volumeType", option_to_yojson ebs_volume_type_to_yojson x.volume_type);
      ("sizeInGiB", option_to_yojson boxed_integer_to_yojson x.size_in_gi_b);
      ("snapshotId", option_to_yojson ebs_snapshot_id_to_yojson x.snapshot_id);
      ( "volumeInitializationRate",
        option_to_yojson boxed_integer_to_yojson x.volume_initialization_rate );
      ("iops", option_to_yojson boxed_integer_to_yojson x.iops);
      ("throughput", option_to_yojson boxed_integer_to_yojson x.throughput);
      ("tagSpecifications", option_to_yojson ebs_tag_specifications_to_yojson x.tag_specifications);
      ("roleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ( "terminationPolicy",
        option_to_yojson task_managed_ebs_volume_termination_policy_to_yojson x.termination_policy
      );
      ("filesystemType", option_to_yojson task_filesystem_type_to_yojson x.filesystem_type);
    ]

let task_volume_configuration_to_yojson (x : task_volume_configuration) =
  assoc_to_yojson
    [
      ("name", Some (ecs_volume_name_to_yojson x.name));
      ( "managedEBSVolume",
        option_to_yojson task_managed_ebs_volume_configuration_to_yojson x.managed_ebs_volume );
    ]

let task_volume_configurations_to_yojson tree =
  list_to_yojson task_volume_configuration_to_yojson tree

let run_task_request_to_yojson (x : run_task_request) =
  assoc_to_yojson
    [
      ( "capacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("count", option_to_yojson boxed_integer_to_yojson x.count);
      ("enableECSManagedTags", option_to_yojson boolean__to_yojson x.enable_ecs_managed_tags);
      ("enableExecuteCommand", option_to_yojson boolean__to_yojson x.enable_execute_command);
      ("group", option_to_yojson string__to_yojson x.group);
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("overrides", option_to_yojson task_override_to_yojson x.overrides);
      ( "placementConstraints",
        option_to_yojson placement_constraints_to_yojson x.placement_constraints );
      ("placementStrategy", option_to_yojson placement_strategies_to_yojson x.placement_strategy);
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("propagateTags", option_to_yojson propagate_tags_to_yojson x.propagate_tags);
      ("referenceId", option_to_yojson string__to_yojson x.reference_id);
      ("startedBy", option_to_yojson string__to_yojson x.started_by);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("taskDefinition", Some (string__to_yojson x.task_definition));
      ( "clientToken",
        Some (string__to_yojson (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ())))
      );
      ( "volumeConfigurations",
        option_to_yojson task_volume_configurations_to_yojson x.volume_configurations );
    ]

let start_task_response_to_yojson (x : start_task_response) =
  assoc_to_yojson
    [
      ("tasks", option_to_yojson tasks_to_yojson x.tasks);
      ("failures", option_to_yojson failures_to_yojson x.failures);
    ]

let start_task_request_to_yojson (x : start_task_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("containerInstances", Some (string_list_to_yojson x.container_instances));
      ("enableECSManagedTags", option_to_yojson boolean__to_yojson x.enable_ecs_managed_tags);
      ("enableExecuteCommand", option_to_yojson boolean__to_yojson x.enable_execute_command);
      ("group", option_to_yojson string__to_yojson x.group);
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("overrides", option_to_yojson task_override_to_yojson x.overrides);
      ("propagateTags", option_to_yojson propagate_tags_to_yojson x.propagate_tags);
      ("referenceId", option_to_yojson string__to_yojson x.reference_id);
      ("startedBy", option_to_yojson string__to_yojson x.started_by);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("taskDefinition", Some (string__to_yojson x.task_definition));
      ( "volumeConfigurations",
        option_to_yojson task_volume_configurations_to_yojson x.volume_configurations );
    ]

let stop_service_deployment_response_to_yojson (x : stop_service_deployment_response) =
  assoc_to_yojson
    [ ("serviceDeploymentArn", option_to_yojson string__to_yojson x.service_deployment_arn) ]

let stop_service_deployment_stop_type_to_yojson (x : stop_service_deployment_stop_type) =
  match x with ABORT -> `String "ABORT" | ROLLBACK -> `String "ROLLBACK"

let stop_service_deployment_request_to_yojson (x : stop_service_deployment_request) =
  assoc_to_yojson
    [
      ("serviceDeploymentArn", Some (string__to_yojson x.service_deployment_arn));
      ("stopType", option_to_yojson stop_service_deployment_stop_type_to_yojson x.stop_type);
    ]

let stop_task_response_to_yojson (x : stop_task_response) =
  assoc_to_yojson [ ("task", option_to_yojson task_to_yojson x.task) ]

let stop_task_request_to_yojson (x : stop_task_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("task", Some (string__to_yojson x.task));
      ("reason", option_to_yojson string__to_yojson x.reason);
    ]

let submit_attachment_state_changes_response_to_yojson
    (x : submit_attachment_state_changes_response) =
  assoc_to_yojson [ ("acknowledgment", option_to_yojson string__to_yojson x.acknowledgment) ]

let submit_attachment_state_changes_request_to_yojson (x : submit_attachment_state_changes_request)
    =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("attachments", Some (attachment_state_changes_to_yojson x.attachments));
    ]

let submit_container_state_change_response_to_yojson (x : submit_container_state_change_response) =
  assoc_to_yojson [ ("acknowledgment", option_to_yojson string__to_yojson x.acknowledgment) ]

let submit_container_state_change_request_to_yojson (x : submit_container_state_change_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("task", option_to_yojson string__to_yojson x.task);
      ("containerName", option_to_yojson string__to_yojson x.container_name);
      ("runtimeId", option_to_yojson string__to_yojson x.runtime_id);
      ("status", option_to_yojson string__to_yojson x.status);
      ("exitCode", option_to_yojson boxed_integer_to_yojson x.exit_code);
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("networkBindings", option_to_yojson network_bindings_to_yojson x.network_bindings);
    ]

let submit_task_state_change_response_to_yojson (x : submit_task_state_change_response) =
  assoc_to_yojson [ ("acknowledgment", option_to_yojson string__to_yojson x.acknowledgment) ]

let submit_task_state_change_request_to_yojson (x : submit_task_state_change_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("task", option_to_yojson string__to_yojson x.task);
      ("status", option_to_yojson string__to_yojson x.status);
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("containers", option_to_yojson container_state_changes_to_yojson x.containers);
      ("attachments", option_to_yojson attachment_state_changes_to_yojson x.attachments);
      ("managedAgents", option_to_yojson managed_agent_state_changes_to_yojson x.managed_agents);
      ("pullStartedAt", option_to_yojson timestamp_to_yojson x.pull_started_at);
      ("pullStoppedAt", option_to_yojson timestamp_to_yojson x.pull_stopped_at);
      ("executionStoppedAt", option_to_yojson timestamp_to_yojson x.execution_stopped_at);
    ]

let update_capacity_provider_response_to_yojson (x : update_capacity_provider_response) =
  assoc_to_yojson
    [ ("capacityProvider", option_to_yojson capacity_provider_to_yojson x.capacity_provider) ]

let update_managed_instances_provider_configuration_to_yojson
    (x : update_managed_instances_provider_configuration) =
  assoc_to_yojson
    [
      ("infrastructureRoleArn", Some (string__to_yojson x.infrastructure_role_arn));
      ( "instanceLaunchTemplate",
        Some (instance_launch_template_update_to_yojson x.instance_launch_template) );
      ("propagateTags", option_to_yojson propagate_mi_tags_to_yojson x.propagate_tags);
      ( "infrastructureOptimization",
        option_to_yojson infrastructure_optimization_to_yojson x.infrastructure_optimization );
      ( "autoRepairConfiguration",
        option_to_yojson auto_repair_configuration_to_yojson x.auto_repair_configuration );
    ]

let update_capacity_provider_request_to_yojson (x : update_capacity_provider_request) =
  assoc_to_yojson
    [
      ("name", Some (string__to_yojson x.name));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ( "autoScalingGroupProvider",
        option_to_yojson auto_scaling_group_provider_update_to_yojson x.auto_scaling_group_provider
      );
      ( "managedInstancesProvider",
        option_to_yojson update_managed_instances_provider_configuration_to_yojson
          x.managed_instances_provider );
    ]

let update_cluster_response_to_yojson (x : update_cluster_response) =
  assoc_to_yojson [ ("cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let update_cluster_request_to_yojson (x : update_cluster_request) =
  assoc_to_yojson
    [
      ("cluster", Some (string__to_yojson x.cluster));
      ("settings", option_to_yojson cluster_settings_to_yojson x.settings);
      ("configuration", option_to_yojson cluster_configuration_to_yojson x.configuration);
      ( "serviceConnectDefaults",
        option_to_yojson cluster_service_connect_defaults_request_to_yojson
          x.service_connect_defaults );
    ]

let update_cluster_settings_response_to_yojson (x : update_cluster_settings_response) =
  assoc_to_yojson [ ("cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let update_cluster_settings_request_to_yojson (x : update_cluster_settings_request) =
  assoc_to_yojson
    [
      ("cluster", Some (string__to_yojson x.cluster));
      ("settings", Some (cluster_settings_to_yojson x.settings));
    ]

let update_container_agent_response_to_yojson (x : update_container_agent_response) =
  assoc_to_yojson
    [ ("containerInstance", option_to_yojson container_instance_to_yojson x.container_instance) ]

let update_container_agent_request_to_yojson (x : update_container_agent_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("containerInstance", Some (string__to_yojson x.container_instance));
    ]

let update_container_instances_state_response_to_yojson
    (x : update_container_instances_state_response) =
  assoc_to_yojson
    [
      ("containerInstances", option_to_yojson container_instances_to_yojson x.container_instances);
      ("failures", option_to_yojson failures_to_yojson x.failures);
    ]

let update_container_instances_state_request_to_yojson
    (x : update_container_instances_state_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("containerInstances", Some (string_list_to_yojson x.container_instances));
      ("status", Some (container_instance_status_to_yojson x.status));
    ]

let update_daemon_response_to_yojson (x : update_daemon_response) =
  assoc_to_yojson
    [
      ("daemonArn", option_to_yojson string__to_yojson x.daemon_arn);
      ("status", option_to_yojson daemon_status_to_yojson x.status);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("deploymentArn", option_to_yojson string__to_yojson x.deployment_arn);
    ]

let update_daemon_request_to_yojson (x : update_daemon_request) =
  assoc_to_yojson
    [
      ("daemonArn", Some (string__to_yojson x.daemon_arn));
      ("daemonTaskDefinitionArn", Some (string__to_yojson x.daemon_task_definition_arn));
      ("capacityProviderArns", Some (string_list_to_yojson x.capacity_provider_arns));
      ( "deploymentConfiguration",
        option_to_yojson daemon_deployment_configuration_to_yojson x.deployment_configuration );
      ("propagateTags", option_to_yojson daemon_propagate_tags_to_yojson x.propagate_tags);
      ("enableECSManagedTags", option_to_yojson boolean__to_yojson x.enable_ecs_managed_tags);
      ("enableExecuteCommand", option_to_yojson boolean__to_yojson x.enable_execute_command);
    ]

let updated_express_gateway_service_to_yojson (x : updated_express_gateway_service) =
  assoc_to_yojson
    [
      ("serviceArn", option_to_yojson string__to_yojson x.service_arn);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("serviceName", option_to_yojson string__to_yojson x.service_name);
      ("status", option_to_yojson express_gateway_service_status_to_yojson x.status);
      ( "targetConfiguration",
        option_to_yojson express_gateway_service_configuration_to_yojson x.target_configuration );
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let update_express_gateway_service_response_to_yojson (x : update_express_gateway_service_response)
    =
  assoc_to_yojson
    [ ("service", option_to_yojson updated_express_gateway_service_to_yojson x.service) ]

let update_express_gateway_service_request_to_yojson (x : update_express_gateway_service_request) =
  assoc_to_yojson
    [
      ("serviceArn", Some (string__to_yojson x.service_arn));
      ("executionRoleArn", option_to_yojson string__to_yojson x.execution_role_arn);
      ("healthCheckPath", option_to_yojson string__to_yojson x.health_check_path);
      ("primaryContainer", option_to_yojson express_gateway_container_to_yojson x.primary_container);
      ("taskRoleArn", option_to_yojson string__to_yojson x.task_role_arn);
      ( "networkConfiguration",
        option_to_yojson express_gateway_service_network_configuration_to_yojson
          x.network_configuration );
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("scalingTarget", option_to_yojson express_gateway_scaling_target_to_yojson x.scaling_target);
      ("taskDefinitionArn", option_to_yojson string__to_yojson x.task_definition_arn);
    ]

let update_service_response_to_yojson (x : update_service_response) =
  assoc_to_yojson [ ("service", option_to_yojson service_to_yojson x.service) ]

let update_service_request_to_yojson (x : update_service_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("service", Some (string__to_yojson x.service));
      ("desiredCount", option_to_yojson boxed_integer_to_yojson x.desired_count);
      ("taskDefinition", option_to_yojson string__to_yojson x.task_definition);
      ( "capacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
      ( "deploymentConfiguration",
        option_to_yojson deployment_configuration_to_yojson x.deployment_configuration );
      ( "availabilityZoneRebalancing",
        option_to_yojson availability_zone_rebalancing_to_yojson x.availability_zone_rebalancing );
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ( "placementConstraints",
        option_to_yojson placement_constraints_to_yojson x.placement_constraints );
      ("placementStrategy", option_to_yojson placement_strategies_to_yojson x.placement_strategy);
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("forceNewDeployment", option_to_yojson boolean__to_yojson x.force_new_deployment);
      ( "healthCheckGracePeriodSeconds",
        option_to_yojson boxed_integer_to_yojson x.health_check_grace_period_seconds );
      ( "deploymentController",
        option_to_yojson deployment_controller_to_yojson x.deployment_controller );
      ("enableExecuteCommand", option_to_yojson boxed_boolean_to_yojson x.enable_execute_command);
      ("enableECSManagedTags", option_to_yojson boxed_boolean_to_yojson x.enable_ecs_managed_tags);
      ("loadBalancers", option_to_yojson load_balancers_to_yojson x.load_balancers);
      ("propagateTags", option_to_yojson propagate_tags_to_yojson x.propagate_tags);
      ("serviceRegistries", option_to_yojson service_registries_to_yojson x.service_registries);
      ( "serviceConnectConfiguration",
        option_to_yojson service_connect_configuration_to_yojson x.service_connect_configuration );
      ( "volumeConfigurations",
        option_to_yojson service_volume_configurations_to_yojson x.volume_configurations );
      ( "vpcLatticeConfigurations",
        option_to_yojson vpc_lattice_configurations_to_yojson x.vpc_lattice_configurations );
      ("monitoring", option_to_yojson monitoring_configuration_to_yojson x.monitoring);
    ]

let update_service_primary_task_set_response_to_yojson
    (x : update_service_primary_task_set_response) =
  assoc_to_yojson [ ("taskSet", option_to_yojson task_set_to_yojson x.task_set) ]

let update_service_primary_task_set_request_to_yojson (x : update_service_primary_task_set_request)
    =
  assoc_to_yojson
    [
      ("cluster", Some (string__to_yojson x.cluster));
      ("service", Some (string__to_yojson x.service));
      ("primaryTaskSet", Some (string__to_yojson x.primary_task_set));
    ]

let update_task_protection_response_to_yojson (x : update_task_protection_response) =
  assoc_to_yojson
    [
      ("protectedTasks", option_to_yojson protected_tasks_to_yojson x.protected_tasks);
      ("failures", option_to_yojson failures_to_yojson x.failures);
    ]

let update_task_protection_request_to_yojson (x : update_task_protection_request) =
  assoc_to_yojson
    [
      ("cluster", Some (string__to_yojson x.cluster));
      ("tasks", Some (string_list_to_yojson x.tasks));
      ("protectionEnabled", Some (boolean__to_yojson x.protection_enabled));
      ("expiresInMinutes", option_to_yojson boxed_integer_to_yojson x.expires_in_minutes);
    ]

let update_task_set_response_to_yojson (x : update_task_set_response) =
  assoc_to_yojson [ ("taskSet", option_to_yojson task_set_to_yojson x.task_set) ]

let update_task_set_request_to_yojson (x : update_task_set_request) =
  assoc_to_yojson
    [
      ("cluster", Some (string__to_yojson x.cluster));
      ("service", Some (string__to_yojson x.service));
      ("taskSet", Some (string__to_yojson x.task_set));
      ("scale", Some (scale_to_yojson x.scale));
    ]
