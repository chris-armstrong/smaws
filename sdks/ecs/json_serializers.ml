open Smaws_Lib.Json.SerializeHelpers
open Types

let iam_role_arn_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson

let vpc_lattice_configuration_to_yojson (x : vpc_lattice_configuration) =
  assoc_to_yojson
    [
      ("portName", Some (string__to_yojson x.port_name));
      ("targetGroupArn", Some (string__to_yojson x.target_group_arn));
      ("roleArn", Some (iam_role_arn_to_yojson x.role_arn));
    ]

let vpc_lattice_configurations_to_yojson tree =
  list_to_yojson vpc_lattice_configuration_to_yojson tree

let host_volume_properties_to_yojson (x : host_volume_properties) =
  assoc_to_yojson [ ("sourcePath", option_to_yojson string__to_yojson x.source_path) ]

let scope_to_yojson (x : scope) = match x with SHARED -> `String "shared" | TASK -> `String "task"
let boxed_boolean_to_yojson = bool_to_yojson
let string_map_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree

let docker_volume_configuration_to_yojson (x : docker_volume_configuration) =
  assoc_to_yojson
    [
      ("labels", option_to_yojson string_map_to_yojson x.labels);
      ("driverOpts", option_to_yojson string_map_to_yojson x.driver_opts);
      ("driver", option_to_yojson string__to_yojson x.driver);
      ("autoprovision", option_to_yojson boxed_boolean_to_yojson x.autoprovision);
      ("scope", option_to_yojson scope_to_yojson x.scope);
    ]

let efs_transit_encryption_to_yojson (x : efs_transit_encryption) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let boxed_integer_to_yojson = int_to_yojson

let efs_authorization_config_ia_m_to_yojson (x : efs_authorization_config_ia_m) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let efs_authorization_config_to_yojson (x : efs_authorization_config) =
  assoc_to_yojson
    [
      ("iam", option_to_yojson efs_authorization_config_ia_m_to_yojson x.iam);
      ("accessPointId", option_to_yojson string__to_yojson x.access_point_id);
    ]

let efs_volume_configuration_to_yojson (x : efs_volume_configuration) =
  assoc_to_yojson
    [
      ( "authorizationConfig",
        option_to_yojson efs_authorization_config_to_yojson x.authorization_config );
      ("transitEncryptionPort", option_to_yojson boxed_integer_to_yojson x.transit_encryption_port);
      ("transitEncryption", option_to_yojson efs_transit_encryption_to_yojson x.transit_encryption);
      ("rootDirectory", option_to_yojson string__to_yojson x.root_directory);
      ("fileSystemId", Some (string__to_yojson x.file_system_id));
    ]

let s3_files_volume_configuration_to_yojson (x : s3_files_volume_configuration) =
  assoc_to_yojson
    [
      ("accessPointArn", option_to_yojson string__to_yojson x.access_point_arn);
      ("transitEncryptionPort", option_to_yojson boxed_integer_to_yojson x.transit_encryption_port);
      ("rootDirectory", option_to_yojson string__to_yojson x.root_directory);
      ("fileSystemArn", Some (string__to_yojson x.file_system_arn));
    ]

let f_sx_windows_file_server_authorization_config_to_yojson
    (x : f_sx_windows_file_server_authorization_config) =
  assoc_to_yojson
    [
      ("domain", Some (string__to_yojson x.domain));
      ("credentialsParameter", Some (string__to_yojson x.credentials_parameter));
    ]

let f_sx_windows_file_server_volume_configuration_to_yojson
    (x : f_sx_windows_file_server_volume_configuration) =
  assoc_to_yojson
    [
      ( "authorizationConfig",
        Some (f_sx_windows_file_server_authorization_config_to_yojson x.authorization_config) );
      ("rootDirectory", Some (string__to_yojson x.root_directory));
      ("fileSystemId", Some (string__to_yojson x.file_system_id));
    ]

let volume_to_yojson (x : volume) =
  assoc_to_yojson
    [
      ("configuredAtLaunch", option_to_yojson boxed_boolean_to_yojson x.configured_at_launch);
      ( "fsxWindowsFileServerVolumeConfiguration",
        option_to_yojson f_sx_windows_file_server_volume_configuration_to_yojson
          x.fsx_windows_file_server_volume_configuration );
      ( "s3filesVolumeConfiguration",
        option_to_yojson s3_files_volume_configuration_to_yojson x.s3files_volume_configuration );
      ( "efsVolumeConfiguration",
        option_to_yojson efs_volume_configuration_to_yojson x.efs_volume_configuration );
      ( "dockerVolumeConfiguration",
        option_to_yojson docker_volume_configuration_to_yojson x.docker_volume_configuration );
      ("host", option_to_yojson host_volume_properties_to_yojson x.host);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let volume_list_to_yojson tree = list_to_yojson volume_to_yojson tree

let volume_from_to_yojson (x : volume_from) =
  assoc_to_yojson
    [
      ("readOnly", option_to_yojson boxed_boolean_to_yojson x.read_only);
      ("sourceContainer", option_to_yojson string__to_yojson x.source_container);
    ]

let volume_from_list_to_yojson tree = list_to_yojson volume_from_to_yojson tree

let version_info_to_yojson (x : version_info) =
  assoc_to_yojson
    [
      ("dockerVersion", option_to_yojson string__to_yojson x.docker_version);
      ("agentHash", option_to_yojson string__to_yojson x.agent_hash);
      ("agentVersion", option_to_yojson string__to_yojson x.agent_version);
    ]

let version_consistency_to_yojson (x : version_consistency) =
  match x with DISABLED -> `String "disabled" | ENABLED -> `String "enabled"

let v_cpu_count_range_request_to_yojson (x : v_cpu_count_range_request) =
  assoc_to_yojson
    [
      ("max", option_to_yojson boxed_integer_to_yojson x.max);
      ("min", Some (boxed_integer_to_yojson x.min));
    ]

let express_gateway_service_status_code_to_yojson (x : express_gateway_service_status_code) =
  match x with
  | INACTIVE -> `String "INACTIVE"
  | DRAINING -> `String "DRAINING"
  | ACTIVE -> `String "ACTIVE"

let express_gateway_service_status_to_yojson (x : express_gateway_service_status) =
  assoc_to_yojson
    [
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("statusCode", option_to_yojson express_gateway_service_status_code_to_yojson x.status_code);
    ]

let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let express_gateway_service_network_configuration_to_yojson
    (x : express_gateway_service_network_configuration) =
  assoc_to_yojson
    [
      ("subnets", option_to_yojson string_list_to_yojson x.subnets);
      ("securityGroups", option_to_yojson string_list_to_yojson x.security_groups);
    ]

let express_gateway_service_aws_logs_configuration_to_yojson
    (x : express_gateway_service_aws_logs_configuration) =
  assoc_to_yojson
    [
      ("logStreamPrefix", Some (string__to_yojson x.log_stream_prefix));
      ("logGroup", Some (string__to_yojson x.log_group));
    ]

let express_gateway_repository_credentials_to_yojson (x : express_gateway_repository_credentials) =
  assoc_to_yojson
    [ ("credentialsParameter", option_to_yojson string__to_yojson x.credentials_parameter) ]

let key_value_pair_to_yojson (x : key_value_pair) =
  assoc_to_yojson
    [
      ("value", option_to_yojson string__to_yojson x.value);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let environment_variables_to_yojson tree = list_to_yojson key_value_pair_to_yojson tree

let secret_to_yojson (x : secret) =
  assoc_to_yojson
    [
      ("valueFrom", Some (string__to_yojson x.value_from)); ("name", Some (string__to_yojson x.name));
    ]

let secret_list_to_yojson tree = list_to_yojson secret_to_yojson tree

let express_gateway_container_to_yojson (x : express_gateway_container) =
  assoc_to_yojson
    [
      ("secrets", option_to_yojson secret_list_to_yojson x.secrets);
      ("environment", option_to_yojson environment_variables_to_yojson x.environment);
      ("command", option_to_yojson string_list_to_yojson x.command);
      ( "repositoryCredentials",
        option_to_yojson express_gateway_repository_credentials_to_yojson x.repository_credentials
      );
      ( "awsLogsConfiguration",
        option_to_yojson express_gateway_service_aws_logs_configuration_to_yojson
          x.aws_logs_configuration );
      ("containerPort", option_to_yojson boxed_integer_to_yojson x.container_port);
      ("image", Some (string__to_yojson x.image));
    ]

let express_gateway_service_scaling_metric_to_yojson (x : express_gateway_service_scaling_metric) =
  match x with
  | RequestCountPerTarget -> `String "REQUEST_COUNT_PER_TARGET"
  | AverageMemoryUtilization -> `String "AVERAGE_MEMORY"
  | AverageCPUUtilization -> `String "AVERAGE_CPU"

let express_gateway_scaling_target_to_yojson (x : express_gateway_scaling_target) =
  assoc_to_yojson
    [
      ( "autoScalingTargetValue",
        option_to_yojson boxed_integer_to_yojson x.auto_scaling_target_value );
      ( "autoScalingMetric",
        option_to_yojson express_gateway_service_scaling_metric_to_yojson x.auto_scaling_metric );
      ("maxTaskCount", option_to_yojson boxed_integer_to_yojson x.max_task_count);
      ("minTaskCount", option_to_yojson boxed_integer_to_yojson x.min_task_count);
    ]

let access_type_to_yojson (x : access_type) =
  match x with PRIVATE -> `String "PRIVATE" | PUBLIC -> `String "PUBLIC"

let ingress_path_summary_to_yojson (x : ingress_path_summary) =
  assoc_to_yojson
    [
      ("endpoint", Some (string__to_yojson x.endpoint));
      ("accessType", Some (access_type_to_yojson x.access_type));
    ]

let ingress_path_summaries_to_yojson tree = list_to_yojson ingress_path_summary_to_yojson tree
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let express_gateway_service_configuration_to_yojson (x : express_gateway_service_configuration) =
  assoc_to_yojson
    [
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("ingressPaths", option_to_yojson ingress_path_summaries_to_yojson x.ingress_paths);
      ("scalingTarget", option_to_yojson express_gateway_scaling_target_to_yojson x.scaling_target);
      ("primaryContainer", option_to_yojson express_gateway_container_to_yojson x.primary_container);
      ("healthCheckPath", option_to_yojson string__to_yojson x.health_check_path);
      ( "networkConfiguration",
        option_to_yojson express_gateway_service_network_configuration_to_yojson
          x.network_configuration );
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ("taskDefinitionArn", option_to_yojson string__to_yojson x.task_definition_arn);
      ("taskRoleArn", option_to_yojson string__to_yojson x.task_role_arn);
      ("executionRoleArn", option_to_yojson string__to_yojson x.execution_role_arn);
      ("serviceRevisionArn", option_to_yojson string__to_yojson x.service_revision_arn);
    ]

let updated_express_gateway_service_to_yojson (x : updated_express_gateway_service) =
  assoc_to_yojson
    [
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ( "targetConfiguration",
        option_to_yojson express_gateway_service_configuration_to_yojson x.target_configuration );
      ("status", option_to_yojson express_gateway_service_status_to_yojson x.status);
      ("serviceName", option_to_yojson string__to_yojson x.service_name);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("serviceArn", option_to_yojson string__to_yojson x.service_arn);
    ]

let integer_to_yojson = int_to_yojson

let launch_type_to_yojson (x : launch_type) =
  match x with
  | MANAGED_INSTANCES -> `String "MANAGED_INSTANCES"
  | EXTERNAL -> `String "EXTERNAL"
  | FARGATE -> `String "FARGATE"
  | EC2 -> `String "EC2"

let capacity_provider_strategy_item_weight_to_yojson = int_to_yojson
let capacity_provider_strategy_item_base_to_yojson = int_to_yojson

let capacity_provider_strategy_item_to_yojson (x : capacity_provider_strategy_item) =
  assoc_to_yojson
    [
      ("base", option_to_yojson capacity_provider_strategy_item_base_to_yojson x.base);
      ("weight", option_to_yojson capacity_provider_strategy_item_weight_to_yojson x.weight);
      ("capacityProvider", Some (string__to_yojson x.capacity_provider));
    ]

let capacity_provider_strategy_to_yojson tree =
  list_to_yojson capacity_provider_strategy_item_to_yojson tree

let assign_public_ip_to_yojson (x : assign_public_ip) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let aws_vpc_configuration_to_yojson (x : aws_vpc_configuration) =
  assoc_to_yojson
    [
      ("assignPublicIp", option_to_yojson assign_public_ip_to_yojson x.assign_public_ip);
      ("securityGroups", option_to_yojson string_list_to_yojson x.security_groups);
      ("subnets", Some (string_list_to_yojson x.subnets));
    ]

let network_configuration_to_yojson (x : network_configuration) =
  assoc_to_yojson
    [
      ( "awsvpcConfiguration",
        option_to_yojson aws_vpc_configuration_to_yojson x.awsvpc_configuration );
    ]

let advanced_configuration_to_yojson (x : advanced_configuration) =
  assoc_to_yojson
    [
      ("roleArn", option_to_yojson string__to_yojson x.role_arn);
      ("testListenerRule", option_to_yojson string__to_yojson x.test_listener_rule);
      ("productionListenerRule", option_to_yojson string__to_yojson x.production_listener_rule);
      ("alternateTargetGroupArn", option_to_yojson string__to_yojson x.alternate_target_group_arn);
    ]

let load_balancer_to_yojson (x : load_balancer) =
  assoc_to_yojson
    [
      ( "advancedConfiguration",
        option_to_yojson advanced_configuration_to_yojson x.advanced_configuration );
      ("containerPort", option_to_yojson boxed_integer_to_yojson x.container_port);
      ("containerName", option_to_yojson string__to_yojson x.container_name);
      ("loadBalancerName", option_to_yojson string__to_yojson x.load_balancer_name);
      ("targetGroupArn", option_to_yojson string__to_yojson x.target_group_arn);
    ]

let load_balancers_to_yojson tree = list_to_yojson load_balancer_to_yojson tree

let service_registry_to_yojson (x : service_registry) =
  assoc_to_yojson
    [
      ("containerPort", option_to_yojson boxed_integer_to_yojson x.container_port);
      ("containerName", option_to_yojson string__to_yojson x.container_name);
      ("port", option_to_yojson boxed_integer_to_yojson x.port);
      ("registryArn", option_to_yojson string__to_yojson x.registry_arn);
    ]

let service_registries_to_yojson tree = list_to_yojson service_registry_to_yojson tree
let double_to_yojson = double_to_yojson
let scale_unit_to_yojson (x : scale_unit) = match x with PERCENT -> `String "PERCENT"

let scale_to_yojson (x : scale) =
  assoc_to_yojson
    [
      ("unit", option_to_yojson scale_unit_to_yojson x.unit_);
      ("value", option_to_yojson double_to_yojson x.value);
    ]

let stability_status_to_yojson (x : stability_status) =
  match x with STABILIZING -> `String "STABILIZING" | STEADY_STATE -> `String "STEADY_STATE"

let tag_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("value", option_to_yojson tag_value_to_yojson x.value);
      ("key", option_to_yojson tag_key_to_yojson x.key);
    ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let deployment_ephemeral_storage_to_yojson (x : deployment_ephemeral_storage) =
  assoc_to_yojson [ ("kmsKeyId", option_to_yojson string__to_yojson x.kms_key_id) ]

let task_set_to_yojson (x : task_set) =
  assoc_to_yojson
    [
      ( "fargateEphemeralStorage",
        option_to_yojson deployment_ephemeral_storage_to_yojson x.fargate_ephemeral_storage );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("stabilityStatusAt", option_to_yojson timestamp_to_yojson x.stability_status_at);
      ("stabilityStatus", option_to_yojson stability_status_to_yojson x.stability_status);
      ("scale", option_to_yojson scale_to_yojson x.scale);
      ("serviceRegistries", option_to_yojson service_registries_to_yojson x.service_registries);
      ("loadBalancers", option_to_yojson load_balancers_to_yojson x.load_balancers);
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("platformFamily", option_to_yojson string__to_yojson x.platform_family);
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ( "capacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("runningCount", option_to_yojson integer_to_yojson x.running_count);
      ("pendingCount", option_to_yojson integer_to_yojson x.pending_count);
      ("computedDesiredCount", option_to_yojson integer_to_yojson x.computed_desired_count);
      ("taskDefinition", option_to_yojson string__to_yojson x.task_definition);
      ("status", option_to_yojson string__to_yojson x.status);
      ("externalId", option_to_yojson string__to_yojson x.external_id);
      ("startedBy", option_to_yojson string__to_yojson x.started_by);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("serviceArn", option_to_yojson string__to_yojson x.service_arn);
      ("taskSetArn", option_to_yojson string__to_yojson x.task_set_arn);
      ("id", option_to_yojson string__to_yojson x.id);
    ]

let update_task_set_response_to_yojson (x : update_task_set_response) =
  assoc_to_yojson [ ("taskSet", option_to_yojson task_set_to_yojson x.task_set) ]

let update_task_set_request_to_yojson (x : update_task_set_request) =
  assoc_to_yojson
    [
      ("scale", Some (scale_to_yojson x.scale));
      ("taskSet", Some (string__to_yojson x.task_set));
      ("service", Some (string__to_yojson x.service));
      ("cluster", Some (string__to_yojson x.cluster));
    ]

let unsupported_feature_exception_to_yojson (x : unsupported_feature_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let task_set_not_found_exception_to_yojson (x : task_set_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let service_not_found_exception_to_yojson (x : service_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let service_not_active_exception_to_yojson (x : service_not_active_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let server_exception_to_yojson (x : server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let cluster_not_found_exception_to_yojson (x : cluster_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let client_exception_to_yojson (x : client_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let boolean__to_yojson = bool_to_yojson

let protected_task_to_yojson (x : protected_task) =
  assoc_to_yojson
    [
      ("expirationDate", option_to_yojson timestamp_to_yojson x.expiration_date);
      ("protectionEnabled", option_to_yojson boolean__to_yojson x.protection_enabled);
      ("taskArn", option_to_yojson string__to_yojson x.task_arn);
    ]

let protected_tasks_to_yojson tree = list_to_yojson protected_task_to_yojson tree

let failure_to_yojson (x : failure) =
  assoc_to_yojson
    [
      ("detail", option_to_yojson string__to_yojson x.detail);
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let failures_to_yojson tree = list_to_yojson failure_to_yojson tree

let update_task_protection_response_to_yojson (x : update_task_protection_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("protectedTasks", option_to_yojson protected_tasks_to_yojson x.protected_tasks);
    ]

let update_task_protection_request_to_yojson (x : update_task_protection_request) =
  assoc_to_yojson
    [
      ("expiresInMinutes", option_to_yojson boxed_integer_to_yojson x.expires_in_minutes);
      ("protectionEnabled", Some (boolean__to_yojson x.protection_enabled));
      ("tasks", Some (string_list_to_yojson x.tasks));
      ("cluster", Some (string__to_yojson x.cluster));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let threshold_type_to_yojson (x : threshold_type) =
  match x with
  | UNBOUNDED_PERCENT -> `String "UNBOUNDED_PERCENT"
  | BOUNDED_PERCENT -> `String "BOUNDED_PERCENT"
  | COUNT -> `String "COUNT"

let threshold_configuration_to_yojson (x : threshold_configuration) =
  assoc_to_yojson
    [
      ("value", Some (integer_to_yojson x.value)); ("type", Some (threshold_type_to_yojson x.type_));
    ]

let deployment_circuit_breaker_to_yojson (x : deployment_circuit_breaker) =
  assoc_to_yojson
    [
      ( "thresholdConfiguration",
        option_to_yojson threshold_configuration_to_yojson x.threshold_configuration );
      ("resetOnHealthyTask", option_to_yojson boxed_boolean_to_yojson x.reset_on_healthy_task);
      ("rollback", Some (boolean__to_yojson x.rollback));
      ("enable", Some (boolean__to_yojson x.enable));
    ]

let deployment_alarms_to_yojson (x : deployment_alarms) =
  assoc_to_yojson
    [
      ("enable", Some (boolean__to_yojson x.enable));
      ("rollback", Some (boolean__to_yojson x.rollback));
      ("alarmNames", Some (string_list_to_yojson x.alarm_names));
    ]

let deployment_strategy_to_yojson (x : deployment_strategy) =
  match x with
  | CANARY -> `String "CANARY"
  | LINEAR -> `String "LINEAR"
  | BLUE_GREEN -> `String "BLUE_GREEN"
  | ROLLING -> `String "ROLLING"

let deployment_lifecycle_hook_target_type_to_yojson (x : deployment_lifecycle_hook_target_type) =
  match x with PAUSE -> `String "PAUSE" | AWS_LAMBDA -> `String "AWS_LAMBDA"

let deployment_lifecycle_hook_stage_to_yojson (x : deployment_lifecycle_hook_stage) =
  match x with
  | POST_PRODUCTION_TRAFFIC_SHIFT -> `String "POST_PRODUCTION_TRAFFIC_SHIFT"
  | PRODUCTION_TRAFFIC_SHIFT -> `String "PRODUCTION_TRAFFIC_SHIFT"
  | PRE_PRODUCTION_TRAFFIC_SHIFT -> `String "PRE_PRODUCTION_TRAFFIC_SHIFT"
  | POST_TEST_TRAFFIC_SHIFT -> `String "POST_TEST_TRAFFIC_SHIFT"
  | TEST_TRAFFIC_SHIFT -> `String "TEST_TRAFFIC_SHIFT"
  | POST_SCALE_UP -> `String "POST_SCALE_UP"
  | PRE_SCALE_UP -> `String "PRE_SCALE_UP"
  | RECONCILE_SERVICE -> `String "RECONCILE_SERVICE"

let deployment_lifecycle_hook_stage_list_to_yojson tree =
  list_to_yojson deployment_lifecycle_hook_stage_to_yojson tree

let hook_details_to_yojson = json_to_yojson
let deployment_lifecycle_hook_duration_to_yojson = int_to_yojson

let deployment_lifecycle_hook_action_to_yojson (x : deployment_lifecycle_hook_action) =
  match x with CONTINUE -> `String "CONTINUE" | ROLLBACK -> `String "ROLLBACK"

let deployment_lifecycle_hook_timeout_configuration_to_yojson
    (x : deployment_lifecycle_hook_timeout_configuration) =
  assoc_to_yojson
    [
      ("action", option_to_yojson deployment_lifecycle_hook_action_to_yojson x.action);
      ( "timeoutInMinutes",
        option_to_yojson deployment_lifecycle_hook_duration_to_yojson x.timeout_in_minutes );
    ]

let deployment_lifecycle_hook_to_yojson (x : deployment_lifecycle_hook) =
  assoc_to_yojson
    [
      ( "timeoutConfiguration",
        option_to_yojson deployment_lifecycle_hook_timeout_configuration_to_yojson
          x.timeout_configuration );
      ("hookDetails", option_to_yojson hook_details_to_yojson x.hook_details);
      ( "lifecycleStages",
        option_to_yojson deployment_lifecycle_hook_stage_list_to_yojson x.lifecycle_stages );
      ("roleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("hookTargetArn", option_to_yojson string__to_yojson x.hook_target_arn);
      ("targetType", option_to_yojson deployment_lifecycle_hook_target_type_to_yojson x.target_type);
    ]

let deployment_lifecycle_hook_list_to_yojson tree =
  list_to_yojson deployment_lifecycle_hook_to_yojson tree

let linear_configuration_to_yojson (x : linear_configuration) =
  assoc_to_yojson
    [
      ("stepBakeTimeInMinutes", option_to_yojson integer_to_yojson x.step_bake_time_in_minutes);
      ("stepPercent", option_to_yojson double_to_yojson x.step_percent);
    ]

let canary_configuration_to_yojson (x : canary_configuration) =
  assoc_to_yojson
    [
      ("canaryBakeTimeInMinutes", option_to_yojson integer_to_yojson x.canary_bake_time_in_minutes);
      ("canaryPercent", option_to_yojson double_to_yojson x.canary_percent);
    ]

let deployment_configuration_to_yojson (x : deployment_configuration) =
  assoc_to_yojson
    [
      ("canaryConfiguration", option_to_yojson canary_configuration_to_yojson x.canary_configuration);
      ("linearConfiguration", option_to_yojson linear_configuration_to_yojson x.linear_configuration);
      ("lifecycleHooks", option_to_yojson deployment_lifecycle_hook_list_to_yojson x.lifecycle_hooks);
      ("bakeTimeInMinutes", option_to_yojson boxed_integer_to_yojson x.bake_time_in_minutes);
      ("strategy", option_to_yojson deployment_strategy_to_yojson x.strategy);
      ("alarms", option_to_yojson deployment_alarms_to_yojson x.alarms);
      ("minimumHealthyPercent", option_to_yojson boxed_integer_to_yojson x.minimum_healthy_percent);
      ("maximumPercent", option_to_yojson boxed_integer_to_yojson x.maximum_percent);
      ( "deploymentCircuitBreaker",
        option_to_yojson deployment_circuit_breaker_to_yojson x.deployment_circuit_breaker );
    ]

let task_sets_to_yojson tree = list_to_yojson task_set_to_yojson tree

let deployment_rollout_state_to_yojson (x : deployment_rollout_state) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"

let port_number_to_yojson = int_to_yojson

let service_connect_test_traffic_header_match_rules_to_yojson
    (x : service_connect_test_traffic_header_match_rules) =
  assoc_to_yojson [ ("exact", Some (string__to_yojson x.exact)) ]

let service_connect_test_traffic_header_rules_to_yojson
    (x : service_connect_test_traffic_header_rules) =
  assoc_to_yojson
    [
      ("value", option_to_yojson service_connect_test_traffic_header_match_rules_to_yojson x.value);
      ("name", Some (string__to_yojson x.name));
    ]

let service_connect_test_traffic_rules_to_yojson (x : service_connect_test_traffic_rules) =
  assoc_to_yojson
    [ ("header", Some (service_connect_test_traffic_header_rules_to_yojson x.header)) ]

let service_connect_client_alias_to_yojson (x : service_connect_client_alias) =
  assoc_to_yojson
    [
      ( "testTrafficRules",
        option_to_yojson service_connect_test_traffic_rules_to_yojson x.test_traffic_rules );
      ("dnsName", option_to_yojson string__to_yojson x.dns_name);
      ("port", Some (port_number_to_yojson x.port));
    ]

let service_connect_client_alias_list_to_yojson tree =
  list_to_yojson service_connect_client_alias_to_yojson tree

let duration_to_yojson = int_to_yojson

let timeout_configuration_to_yojson (x : timeout_configuration) =
  assoc_to_yojson
    [
      ("perRequestTimeoutSeconds", option_to_yojson duration_to_yojson x.per_request_timeout_seconds);
      ("idleTimeoutSeconds", option_to_yojson duration_to_yojson x.idle_timeout_seconds);
    ]

let service_connect_tls_certificate_authority_to_yojson
    (x : service_connect_tls_certificate_authority) =
  assoc_to_yojson
    [ ("awsPcaAuthorityArn", option_to_yojson string__to_yojson x.aws_pca_authority_arn) ]

let service_connect_tls_configuration_to_yojson (x : service_connect_tls_configuration) =
  assoc_to_yojson
    [
      ("roleArn", option_to_yojson string__to_yojson x.role_arn);
      ("kmsKey", option_to_yojson string__to_yojson x.kms_key);
      ( "issuerCertificateAuthority",
        Some (service_connect_tls_certificate_authority_to_yojson x.issuer_certificate_authority) );
    ]

let service_connect_service_to_yojson (x : service_connect_service) =
  assoc_to_yojson
    [
      ("tls", option_to_yojson service_connect_tls_configuration_to_yojson x.tls);
      ("timeout", option_to_yojson timeout_configuration_to_yojson x.timeout);
      ("ingressPortOverride", option_to_yojson port_number_to_yojson x.ingress_port_override);
      ( "clientAliases",
        option_to_yojson service_connect_client_alias_list_to_yojson x.client_aliases );
      ("discoveryName", option_to_yojson string__to_yojson x.discovery_name);
      ("portName", Some (string__to_yojson x.port_name));
    ]

let service_connect_service_list_to_yojson tree =
  list_to_yojson service_connect_service_to_yojson tree

let log_driver_to_yojson (x : log_driver) =
  match x with
  | AWSFIRELENS -> `String "awsfirelens"
  | SPLUNK -> `String "splunk"
  | AWSLOGS -> `String "awslogs"
  | FLUENTD -> `String "fluentd"
  | GELF -> `String "gelf"
  | JOURNALD -> `String "journald"
  | SYSLOG -> `String "syslog"
  | JSON_FILE -> `String "json-file"

let log_configuration_options_map_to_yojson tree =
  map_to_yojson string__to_yojson string__to_yojson tree

let log_configuration_to_yojson (x : log_configuration) =
  assoc_to_yojson
    [
      ("secretOptions", option_to_yojson secret_list_to_yojson x.secret_options);
      ("options", option_to_yojson log_configuration_options_map_to_yojson x.options);
      ("logDriver", Some (log_driver_to_yojson x.log_driver));
    ]

let service_connect_access_logging_format_to_yojson (x : service_connect_access_logging_format) =
  match x with JSON -> `String "JSON" | TEXT -> `String "TEXT"

let service_connect_include_query_parameters_to_yojson
    (x : service_connect_include_query_parameters) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let service_connect_access_log_configuration_to_yojson
    (x : service_connect_access_log_configuration) =
  assoc_to_yojson
    [
      ( "includeQueryParameters",
        option_to_yojson service_connect_include_query_parameters_to_yojson
          x.include_query_parameters );
      ("format", Some (service_connect_access_logging_format_to_yojson x.format));
    ]

let service_connect_configuration_to_yojson (x : service_connect_configuration) =
  assoc_to_yojson
    [
      ( "accessLogConfiguration",
        option_to_yojson service_connect_access_log_configuration_to_yojson
          x.access_log_configuration );
      ("logConfiguration", option_to_yojson log_configuration_to_yojson x.log_configuration);
      ("services", option_to_yojson service_connect_service_list_to_yojson x.services);
      ("namespace", option_to_yojson string__to_yojson x.namespace);
      ("enabled", Some (boolean__to_yojson x.enabled));
    ]

let service_connect_service_resource_to_yojson (x : service_connect_service_resource) =
  assoc_to_yojson
    [
      ("discoveryArn", option_to_yojson string__to_yojson x.discovery_arn);
      ("discoveryName", option_to_yojson string__to_yojson x.discovery_name);
    ]

let service_connect_service_resource_list_to_yojson tree =
  list_to_yojson service_connect_service_resource_to_yojson tree

let ecs_volume_name_to_yojson = string_to_yojson
let ebskms_key_id_to_yojson = string_to_yojson
let ebs_volume_type_to_yojson = string_to_yojson
let ebs_snapshot_id_to_yojson = string_to_yojson
let ebs_resource_type_to_yojson (x : ebs_resource_type) = match x with VOLUME -> `String "volume"

let propagate_tags_to_yojson (x : propagate_tags) =
  match x with
  | NONE -> `String "NONE"
  | SERVICE -> `String "SERVICE"
  | TASK_DEFINITION -> `String "TASK_DEFINITION"

let ebs_tag_specification_to_yojson (x : ebs_tag_specification) =
  assoc_to_yojson
    [
      ("propagateTags", option_to_yojson propagate_tags_to_yojson x.propagate_tags);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("resourceType", Some (ebs_resource_type_to_yojson x.resource_type));
    ]

let ebs_tag_specifications_to_yojson tree = list_to_yojson ebs_tag_specification_to_yojson tree

let task_filesystem_type_to_yojson (x : task_filesystem_type) =
  match x with
  | NTFS -> `String "ntfs"
  | XFS -> `String "xfs"
  | EXT4 -> `String "ext4"
  | EXT3 -> `String "ext3"

let service_managed_ebs_volume_configuration_to_yojson
    (x : service_managed_ebs_volume_configuration) =
  assoc_to_yojson
    [
      ("filesystemType", option_to_yojson task_filesystem_type_to_yojson x.filesystem_type);
      ("roleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("tagSpecifications", option_to_yojson ebs_tag_specifications_to_yojson x.tag_specifications);
      ("throughput", option_to_yojson boxed_integer_to_yojson x.throughput);
      ("iops", option_to_yojson boxed_integer_to_yojson x.iops);
      ( "volumeInitializationRate",
        option_to_yojson boxed_integer_to_yojson x.volume_initialization_rate );
      ("snapshotId", option_to_yojson ebs_snapshot_id_to_yojson x.snapshot_id);
      ("sizeInGiB", option_to_yojson boxed_integer_to_yojson x.size_in_gi_b);
      ("volumeType", option_to_yojson ebs_volume_type_to_yojson x.volume_type);
      ("kmsKeyId", option_to_yojson ebskms_key_id_to_yojson x.kms_key_id);
      ("encrypted", option_to_yojson boxed_boolean_to_yojson x.encrypted);
    ]

let service_volume_configuration_to_yojson (x : service_volume_configuration) =
  assoc_to_yojson
    [
      ( "managedEBSVolume",
        option_to_yojson service_managed_ebs_volume_configuration_to_yojson x.managed_ebs_volume );
      ("name", Some (ecs_volume_name_to_yojson x.name));
    ]

let service_volume_configurations_to_yojson tree =
  list_to_yojson service_volume_configuration_to_yojson tree

let deployment_to_yojson (x : deployment) =
  assoc_to_yojson
    [
      ( "vpcLatticeConfigurations",
        option_to_yojson vpc_lattice_configurations_to_yojson x.vpc_lattice_configurations );
      ( "fargateEphemeralStorage",
        option_to_yojson deployment_ephemeral_storage_to_yojson x.fargate_ephemeral_storage );
      ( "volumeConfigurations",
        option_to_yojson service_volume_configurations_to_yojson x.volume_configurations );
      ( "serviceConnectResources",
        option_to_yojson service_connect_service_resource_list_to_yojson x.service_connect_resources
      );
      ( "serviceConnectConfiguration",
        option_to_yojson service_connect_configuration_to_yojson x.service_connect_configuration );
      ("rolloutStateReason", option_to_yojson string__to_yojson x.rollout_state_reason);
      ("rolloutState", option_to_yojson deployment_rollout_state_to_yojson x.rollout_state);
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("platformFamily", option_to_yojson string__to_yojson x.platform_family);
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ( "capacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("failedTasks", option_to_yojson integer_to_yojson x.failed_tasks);
      ("runningCount", option_to_yojson integer_to_yojson x.running_count);
      ("pendingCount", option_to_yojson integer_to_yojson x.pending_count);
      ("desiredCount", option_to_yojson integer_to_yojson x.desired_count);
      ("taskDefinition", option_to_yojson string__to_yojson x.task_definition);
      ("status", option_to_yojson string__to_yojson x.status);
      ("id", option_to_yojson string__to_yojson x.id);
    ]

let deployments_to_yojson tree = list_to_yojson deployment_to_yojson tree

let service_event_to_yojson (x : service_event) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("id", option_to_yojson string__to_yojson x.id);
    ]

let service_events_to_yojson tree = list_to_yojson service_event_to_yojson tree

let service_current_revision_summary_to_yojson (x : service_current_revision_summary) =
  assoc_to_yojson
    [
      ("pendingTaskCount", option_to_yojson integer_to_yojson x.pending_task_count);
      ("runningTaskCount", option_to_yojson integer_to_yojson x.running_task_count);
      ("requestedTaskCount", option_to_yojson integer_to_yojson x.requested_task_count);
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let service_current_revision_summary_list_to_yojson tree =
  list_to_yojson service_current_revision_summary_to_yojson tree

let placement_constraint_type_to_yojson (x : placement_constraint_type) =
  match x with MEMBER_OF -> `String "memberOf" | DISTINCT_INSTANCE -> `String "distinctInstance"

let placement_constraint_to_yojson (x : placement_constraint) =
  assoc_to_yojson
    [
      ("expression", option_to_yojson string__to_yojson x.expression);
      ("type", option_to_yojson placement_constraint_type_to_yojson x.type_);
    ]

let placement_constraints_to_yojson tree = list_to_yojson placement_constraint_to_yojson tree

let placement_strategy_type_to_yojson (x : placement_strategy_type) =
  match x with
  | BINPACK -> `String "binpack"
  | SPREAD -> `String "spread"
  | RANDOM -> `String "random"

let placement_strategy_to_yojson (x : placement_strategy) =
  assoc_to_yojson
    [
      ("field", option_to_yojson string__to_yojson x.field);
      ("type", option_to_yojson placement_strategy_type_to_yojson x.type_);
    ]

let placement_strategies_to_yojson tree = list_to_yojson placement_strategy_to_yojson tree

let scheduling_strategy_to_yojson (x : scheduling_strategy) =
  match x with DAEMON -> `String "DAEMON" | REPLICA -> `String "REPLICA"

let deployment_controller_type_to_yojson (x : deployment_controller_type) =
  match x with
  | EXTERNAL -> `String "EXTERNAL"
  | CODE_DEPLOY -> `String "CODE_DEPLOY"
  | ECS -> `String "ECS"

let deployment_controller_to_yojson (x : deployment_controller) =
  assoc_to_yojson [ ("type", Some (deployment_controller_type_to_yojson x.type_)) ]

let availability_zone_rebalancing_to_yojson (x : availability_zone_rebalancing) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let resource_management_type_to_yojson (x : resource_management_type) =
  match x with ECS -> `String "ECS" | CUSTOMER -> `String "CUSTOMER"

let service_to_yojson (x : service) =
  assoc_to_yojson
    [
      ( "resourceManagementType",
        option_to_yojson resource_management_type_to_yojson x.resource_management_type );
      ( "availabilityZoneRebalancing",
        option_to_yojson availability_zone_rebalancing_to_yojson x.availability_zone_rebalancing );
      ("enableExecuteCommand", option_to_yojson boolean__to_yojson x.enable_execute_command);
      ("propagateTags", option_to_yojson propagate_tags_to_yojson x.propagate_tags);
      ("enableECSManagedTags", option_to_yojson boolean__to_yojson x.enable_ecs_managed_tags);
      ("createdBy", option_to_yojson string__to_yojson x.created_by);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "deploymentController",
        option_to_yojson deployment_controller_to_yojson x.deployment_controller );
      ("schedulingStrategy", option_to_yojson scheduling_strategy_to_yojson x.scheduling_strategy);
      ( "healthCheckGracePeriodSeconds",
        option_to_yojson boxed_integer_to_yojson x.health_check_grace_period_seconds );
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("placementStrategy", option_to_yojson placement_strategies_to_yojson x.placement_strategy);
      ( "placementConstraints",
        option_to_yojson placement_constraints_to_yojson x.placement_constraints );
      ( "currentServiceRevisions",
        option_to_yojson service_current_revision_summary_list_to_yojson x.current_service_revisions
      );
      ("currentServiceDeployment", option_to_yojson string__to_yojson x.current_service_deployment);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("events", option_to_yojson service_events_to_yojson x.events);
      ("roleArn", option_to_yojson string__to_yojson x.role_arn);
      ("deployments", option_to_yojson deployments_to_yojson x.deployments);
      ("taskSets", option_to_yojson task_sets_to_yojson x.task_sets);
      ( "deploymentConfiguration",
        option_to_yojson deployment_configuration_to_yojson x.deployment_configuration );
      ("taskDefinition", option_to_yojson string__to_yojson x.task_definition);
      ("platformFamily", option_to_yojson string__to_yojson x.platform_family);
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ( "capacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ("pendingCount", option_to_yojson integer_to_yojson x.pending_count);
      ("runningCount", option_to_yojson integer_to_yojson x.running_count);
      ("desiredCount", option_to_yojson integer_to_yojson x.desired_count);
      ("status", option_to_yojson string__to_yojson x.status);
      ("serviceRegistries", option_to_yojson service_registries_to_yojson x.service_registries);
      ("loadBalancers", option_to_yojson load_balancers_to_yojson x.load_balancers);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("serviceName", option_to_yojson string__to_yojson x.service_name);
      ("serviceArn", option_to_yojson string__to_yojson x.service_arn);
    ]

let update_service_response_to_yojson (x : update_service_response) =
  assoc_to_yojson [ ("service", option_to_yojson service_to_yojson x.service) ]

let metric_name_to_yojson = string_to_yojson
let metric_names_list_to_yojson tree = list_to_yojson metric_name_to_yojson tree
let metric_resolution_seconds_to_yojson = int_to_yojson

let metric_configuration_to_yojson (x : metric_configuration) =
  assoc_to_yojson
    [
      ("resolutionSeconds", Some (metric_resolution_seconds_to_yojson x.resolution_seconds));
      ("metricNames", Some (metric_names_list_to_yojson x.metric_names));
    ]

let metric_configuration_list_to_yojson tree = list_to_yojson metric_configuration_to_yojson tree

let monitoring_configuration_to_yojson (x : monitoring_configuration) =
  assoc_to_yojson
    [
      ( "metricConfigurations",
        option_to_yojson metric_configuration_list_to_yojson x.metric_configurations );
    ]

let update_service_request_to_yojson (x : update_service_request) =
  assoc_to_yojson
    [
      ("monitoring", option_to_yojson monitoring_configuration_to_yojson x.monitoring);
      ( "vpcLatticeConfigurations",
        option_to_yojson vpc_lattice_configurations_to_yojson x.vpc_lattice_configurations );
      ( "volumeConfigurations",
        option_to_yojson service_volume_configurations_to_yojson x.volume_configurations );
      ( "serviceConnectConfiguration",
        option_to_yojson service_connect_configuration_to_yojson x.service_connect_configuration );
      ("serviceRegistries", option_to_yojson service_registries_to_yojson x.service_registries);
      ("propagateTags", option_to_yojson propagate_tags_to_yojson x.propagate_tags);
      ("loadBalancers", option_to_yojson load_balancers_to_yojson x.load_balancers);
      ("enableECSManagedTags", option_to_yojson boxed_boolean_to_yojson x.enable_ecs_managed_tags);
      ("enableExecuteCommand", option_to_yojson boxed_boolean_to_yojson x.enable_execute_command);
      ( "deploymentController",
        option_to_yojson deployment_controller_to_yojson x.deployment_controller );
      ( "healthCheckGracePeriodSeconds",
        option_to_yojson boxed_integer_to_yojson x.health_check_grace_period_seconds );
      ("forceNewDeployment", option_to_yojson boolean__to_yojson x.force_new_deployment);
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("placementStrategy", option_to_yojson placement_strategies_to_yojson x.placement_strategy);
      ( "placementConstraints",
        option_to_yojson placement_constraints_to_yojson x.placement_constraints );
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ( "availabilityZoneRebalancing",
        option_to_yojson availability_zone_rebalancing_to_yojson x.availability_zone_rebalancing );
      ( "deploymentConfiguration",
        option_to_yojson deployment_configuration_to_yojson x.deployment_configuration );
      ( "capacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
      ("taskDefinition", option_to_yojson string__to_yojson x.task_definition);
      ("desiredCount", option_to_yojson boxed_integer_to_yojson x.desired_count);
      ("service", Some (string__to_yojson x.service));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let update_service_primary_task_set_response_to_yojson
    (x : update_service_primary_task_set_response) =
  assoc_to_yojson [ ("taskSet", option_to_yojson task_set_to_yojson x.task_set) ]

let update_service_primary_task_set_request_to_yojson (x : update_service_primary_task_set_request)
    =
  assoc_to_yojson
    [
      ("primaryTaskSet", Some (string__to_yojson x.primary_task_set));
      ("service", Some (string__to_yojson x.service));
      ("cluster", Some (string__to_yojson x.cluster));
    ]

let platform_unknown_exception_to_yojson (x : platform_unknown_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let platform_task_definition_incompatibility_exception_to_yojson
    (x : platform_task_definition_incompatibility_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let namespace_not_found_exception_to_yojson (x : namespace_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let managed_instances_network_configuration_to_yojson (x : managed_instances_network_configuration)
    =
  assoc_to_yojson
    [
      ("securityGroups", option_to_yojson string_list_to_yojson x.security_groups);
      ("subnets", option_to_yojson string_list_to_yojson x.subnets);
    ]

let task_volume_storage_gi_b_to_yojson = int_to_yojson

let managed_instances_storage_configuration_to_yojson (x : managed_instances_storage_configuration)
    =
  assoc_to_yojson
    [ ("storageSizeGiB", option_to_yojson task_volume_storage_gi_b_to_yojson x.storage_size_gi_b) ]

let managed_instances_local_storage_configuration_to_yojson
    (x : managed_instances_local_storage_configuration) =
  assoc_to_yojson [ ("useLocalStorage", option_to_yojson boolean__to_yojson x.use_local_storage) ]

let managed_instances_monitoring_options_to_yojson (x : managed_instances_monitoring_options) =
  match x with DETAILED -> `String "DETAILED" | BASIC -> `String "BASIC"

let memory_mi_b_request_to_yojson (x : memory_mi_b_request) =
  assoc_to_yojson
    [
      ("max", option_to_yojson boxed_integer_to_yojson x.max);
      ("min", Some (boxed_integer_to_yojson x.min));
    ]

let cpu_manufacturer_to_yojson (x : cpu_manufacturer) =
  match x with
  | AMAZON_WEB_SERVICES -> `String "amazon-web-services"
  | AMD -> `String "amd"
  | INTEL -> `String "intel"

let cpu_manufacturer_set_to_yojson tree = list_to_yojson cpu_manufacturer_to_yojson tree
let boxed_double_to_yojson = double_to_yojson

let memory_gi_b_per_v_cpu_request_to_yojson (x : memory_gi_b_per_v_cpu_request) =
  assoc_to_yojson
    [
      ("max", option_to_yojson boxed_double_to_yojson x.max);
      ("min", option_to_yojson boxed_double_to_yojson x.min);
    ]

let excluded_instance_type_to_yojson = string_to_yojson
let excluded_instance_type_set_to_yojson tree = list_to_yojson excluded_instance_type_to_yojson tree

let instance_generation_to_yojson (x : instance_generation) =
  match x with PREVIOUS -> `String "previous" | CURRENT -> `String "current"

let instance_generation_set_to_yojson tree = list_to_yojson instance_generation_to_yojson tree

let bare_metal_to_yojson (x : bare_metal) =
  match x with
  | EXCLUDED -> `String "excluded"
  | REQUIRED -> `String "required"
  | INCLUDED -> `String "included"

let burstable_performance_to_yojson (x : burstable_performance) =
  match x with
  | EXCLUDED -> `String "excluded"
  | REQUIRED -> `String "required"
  | INCLUDED -> `String "included"

let network_interface_count_request_to_yojson (x : network_interface_count_request) =
  assoc_to_yojson
    [
      ("max", option_to_yojson boxed_integer_to_yojson x.max);
      ("min", option_to_yojson boxed_integer_to_yojson x.min);
    ]

let local_storage_to_yojson (x : local_storage) =
  match x with
  | EXCLUDED -> `String "excluded"
  | REQUIRED -> `String "required"
  | INCLUDED -> `String "included"

let local_storage_type_to_yojson (x : local_storage_type) =
  match x with SSD -> `String "ssd" | HDD -> `String "hdd"

let local_storage_type_set_to_yojson tree = list_to_yojson local_storage_type_to_yojson tree

let total_local_storage_gb_request_to_yojson (x : total_local_storage_gb_request) =
  assoc_to_yojson
    [
      ("max", option_to_yojson boxed_double_to_yojson x.max);
      ("min", option_to_yojson boxed_double_to_yojson x.min);
    ]

let baseline_ebs_bandwidth_mbps_request_to_yojson (x : baseline_ebs_bandwidth_mbps_request) =
  assoc_to_yojson
    [
      ("max", option_to_yojson boxed_integer_to_yojson x.max);
      ("min", option_to_yojson boxed_integer_to_yojson x.min);
    ]

let accelerator_type_to_yojson (x : accelerator_type) =
  match x with INFERENCE -> `String "inference" | FPGA -> `String "fpga" | GPU -> `String "gpu"

let accelerator_type_set_to_yojson tree = list_to_yojson accelerator_type_to_yojson tree

let accelerator_count_request_to_yojson (x : accelerator_count_request) =
  assoc_to_yojson
    [
      ("max", option_to_yojson boxed_integer_to_yojson x.max);
      ("min", option_to_yojson boxed_integer_to_yojson x.min);
    ]

let accelerator_manufacturer_to_yojson (x : accelerator_manufacturer) =
  match x with
  | HABANA -> `String "habana"
  | XILINX -> `String "xilinx"
  | NVIDIA -> `String "nvidia"
  | AMD -> `String "amd"
  | AMAZON_WEB_SERVICES -> `String "amazon-web-services"

let accelerator_manufacturer_set_to_yojson tree =
  list_to_yojson accelerator_manufacturer_to_yojson tree

let accelerator_name_to_yojson (x : accelerator_name) =
  match x with
  | T4G -> `String "t4g"
  | H100 -> `String "h100"
  | A10G -> `String "a10g"
  | V100 -> `String "v100"
  | VU9P -> `String "vu9p"
  | T4 -> `String "t4"
  | RADEON_PRO_V520 -> `String "radeon-pro-v520"
  | M60 -> `String "m60"
  | K80 -> `String "k80"
  | K520 -> `String "k520"
  | INFERENTIA -> `String "inferentia"
  | A100 -> `String "a100"

let accelerator_name_set_to_yojson tree = list_to_yojson accelerator_name_to_yojson tree

let accelerator_total_memory_mi_b_request_to_yojson (x : accelerator_total_memory_mi_b_request) =
  assoc_to_yojson
    [
      ("max", option_to_yojson boxed_integer_to_yojson x.max);
      ("min", option_to_yojson boxed_integer_to_yojson x.min);
    ]

let network_bandwidth_gbps_request_to_yojson (x : network_bandwidth_gbps_request) =
  assoc_to_yojson
    [
      ("max", option_to_yojson boxed_double_to_yojson x.max);
      ("min", option_to_yojson boxed_double_to_yojson x.min);
    ]

let allowed_instance_type_to_yojson = string_to_yojson
let allowed_instance_type_set_to_yojson tree = list_to_yojson allowed_instance_type_to_yojson tree

let instance_requirements_request_to_yojson (x : instance_requirements_request) =
  assoc_to_yojson
    [
      ( "maxSpotPriceAsPercentageOfOptimalOnDemandPrice",
        option_to_yojson boxed_integer_to_yojson
          x.max_spot_price_as_percentage_of_optimal_on_demand_price );
      ( "allowedInstanceTypes",
        option_to_yojson allowed_instance_type_set_to_yojson x.allowed_instance_types );
      ( "networkBandwidthGbps",
        option_to_yojson network_bandwidth_gbps_request_to_yojson x.network_bandwidth_gbps );
      ( "acceleratorTotalMemoryMiB",
        option_to_yojson accelerator_total_memory_mi_b_request_to_yojson
          x.accelerator_total_memory_mi_b );
      ("acceleratorNames", option_to_yojson accelerator_name_set_to_yojson x.accelerator_names);
      ( "acceleratorManufacturers",
        option_to_yojson accelerator_manufacturer_set_to_yojson x.accelerator_manufacturers );
      ("acceleratorCount", option_to_yojson accelerator_count_request_to_yojson x.accelerator_count);
      ("acceleratorTypes", option_to_yojson accelerator_type_set_to_yojson x.accelerator_types);
      ( "baselineEbsBandwidthMbps",
        option_to_yojson baseline_ebs_bandwidth_mbps_request_to_yojson x.baseline_ebs_bandwidth_mbps
      );
      ( "totalLocalStorageGB",
        option_to_yojson total_local_storage_gb_request_to_yojson x.total_local_storage_g_b );
      ("localStorageTypes", option_to_yojson local_storage_type_set_to_yojson x.local_storage_types);
      ("localStorage", option_to_yojson local_storage_to_yojson x.local_storage);
      ( "networkInterfaceCount",
        option_to_yojson network_interface_count_request_to_yojson x.network_interface_count );
      ( "requireHibernateSupport",
        option_to_yojson boxed_boolean_to_yojson x.require_hibernate_support );
      ( "burstablePerformance",
        option_to_yojson burstable_performance_to_yojson x.burstable_performance );
      ("bareMetal", option_to_yojson bare_metal_to_yojson x.bare_metal);
      ( "onDemandMaxPricePercentageOverLowestPrice",
        option_to_yojson boxed_integer_to_yojson x.on_demand_max_price_percentage_over_lowest_price
      );
      ( "spotMaxPricePercentageOverLowestPrice",
        option_to_yojson boxed_integer_to_yojson x.spot_max_price_percentage_over_lowest_price );
      ( "instanceGenerations",
        option_to_yojson instance_generation_set_to_yojson x.instance_generations );
      ( "excludedInstanceTypes",
        option_to_yojson excluded_instance_type_set_to_yojson x.excluded_instance_types );
      ( "memoryGiBPerVCpu",
        option_to_yojson memory_gi_b_per_v_cpu_request_to_yojson x.memory_gi_b_per_v_cpu );
      ("cpuManufacturers", option_to_yojson cpu_manufacturer_set_to_yojson x.cpu_manufacturers);
      ("memoryMiB", Some (memory_mi_b_request_to_yojson x.memory_mi_b));
      ("vCpuCount", Some (v_cpu_count_range_request_to_yojson x.v_cpu_count));
    ]

let capacity_reservation_preference_to_yojson (x : capacity_reservation_preference) =
  match x with
  | RESERVATIONS_EXCLUDED -> `String "RESERVATIONS_EXCLUDED"
  | RESERVATIONS_FIRST -> `String "RESERVATIONS_FIRST"
  | RESERVATIONS_ONLY -> `String "RESERVATIONS_ONLY"

let capacity_reservation_request_to_yojson (x : capacity_reservation_request) =
  assoc_to_yojson
    [
      ( "reservationPreference",
        option_to_yojson capacity_reservation_preference_to_yojson x.reservation_preference );
      ("reservationGroupArn", option_to_yojson string__to_yojson x.reservation_group_arn);
    ]

let instance_launch_template_update_to_yojson (x : instance_launch_template_update) =
  assoc_to_yojson
    [
      ( "capacityReservations",
        option_to_yojson capacity_reservation_request_to_yojson x.capacity_reservations );
      ( "instanceRequirements",
        option_to_yojson instance_requirements_request_to_yojson x.instance_requirements );
      ("monitoring", option_to_yojson managed_instances_monitoring_options_to_yojson x.monitoring);
      ( "localStorageConfiguration",
        option_to_yojson managed_instances_local_storage_configuration_to_yojson
          x.local_storage_configuration );
      ( "instanceMetadataTagsPropagation",
        option_to_yojson boxed_boolean_to_yojson x.instance_metadata_tags_propagation );
      ( "storageConfiguration",
        option_to_yojson managed_instances_storage_configuration_to_yojson x.storage_configuration
      );
      ( "networkConfiguration",
        option_to_yojson managed_instances_network_configuration_to_yojson x.network_configuration
      );
      ("ec2InstanceProfileArn", option_to_yojson string__to_yojson x.ec2_instance_profile_arn);
    ]

let propagate_mi_tags_to_yojson (x : propagate_mi_tags) =
  match x with NONE -> `String "NONE" | CAPACITY_PROVIDER -> `String "CAPACITY_PROVIDER"

let infrastructure_optimization_to_yojson (x : infrastructure_optimization) =
  assoc_to_yojson [ ("scaleInAfter", option_to_yojson boxed_integer_to_yojson x.scale_in_after) ]

let auto_repair_actions_status_to_yojson (x : auto_repair_actions_status) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let auto_repair_configuration_to_yojson (x : auto_repair_configuration) =
  assoc_to_yojson
    [ ("actionsStatus", option_to_yojson auto_repair_actions_status_to_yojson x.actions_status) ]

let update_managed_instances_provider_configuration_to_yojson
    (x : update_managed_instances_provider_configuration) =
  assoc_to_yojson
    [
      ( "autoRepairConfiguration",
        option_to_yojson auto_repair_configuration_to_yojson x.auto_repair_configuration );
      ( "infrastructureOptimization",
        option_to_yojson infrastructure_optimization_to_yojson x.infrastructure_optimization );
      ("propagateTags", option_to_yojson propagate_mi_tags_to_yojson x.propagate_tags);
      ( "instanceLaunchTemplate",
        Some (instance_launch_template_update_to_yojson x.instance_launch_template) );
      ("infrastructureRoleArn", Some (string__to_yojson x.infrastructure_role_arn));
    ]

let update_in_progress_exception_to_yojson (x : update_in_progress_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let update_express_gateway_service_response_to_yojson (x : update_express_gateway_service_response)
    =
  assoc_to_yojson
    [ ("service", option_to_yojson updated_express_gateway_service_to_yojson x.service) ]

let update_express_gateway_service_request_to_yojson (x : update_express_gateway_service_request) =
  assoc_to_yojson
    [
      ("taskDefinitionArn", option_to_yojson string__to_yojson x.task_definition_arn);
      ("scalingTarget", option_to_yojson express_gateway_scaling_target_to_yojson x.scaling_target);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ( "networkConfiguration",
        option_to_yojson express_gateway_service_network_configuration_to_yojson
          x.network_configuration );
      ("taskRoleArn", option_to_yojson string__to_yojson x.task_role_arn);
      ("primaryContainer", option_to_yojson express_gateway_container_to_yojson x.primary_container);
      ("healthCheckPath", option_to_yojson string__to_yojson x.health_check_path);
      ("executionRoleArn", option_to_yojson string__to_yojson x.execution_role_arn);
      ("serviceArn", Some (string__to_yojson x.service_arn));
    ]

let daemon_status_to_yojson (x : daemon_status) =
  match x with DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS" | ACTIVE -> `String "ACTIVE"

let update_daemon_response_to_yojson (x : update_daemon_response) =
  assoc_to_yojson
    [
      ("deploymentArn", option_to_yojson string__to_yojson x.deployment_arn);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("status", option_to_yojson daemon_status_to_yojson x.status);
      ("daemonArn", option_to_yojson string__to_yojson x.daemon_arn);
    ]

let daemon_drain_percent_to_yojson = double_to_yojson

let daemon_alarm_configuration_to_yojson (x : daemon_alarm_configuration) =
  assoc_to_yojson
    [
      ("enable", option_to_yojson boolean__to_yojson x.enable);
      ("alarmNames", option_to_yojson string_list_to_yojson x.alarm_names);
    ]

let daemon_deployment_configuration_to_yojson (x : daemon_deployment_configuration) =
  assoc_to_yojson
    [
      ("bakeTimeInMinutes", option_to_yojson integer_to_yojson x.bake_time_in_minutes);
      ("alarms", option_to_yojson daemon_alarm_configuration_to_yojson x.alarms);
      ("drainPercent", option_to_yojson daemon_drain_percent_to_yojson x.drain_percent);
    ]

let daemon_propagate_tags_to_yojson (x : daemon_propagate_tags) =
  match x with NONE -> `String "NONE" | DAEMON -> `String "DAEMON"

let update_daemon_request_to_yojson (x : update_daemon_request) =
  assoc_to_yojson
    [
      ("enableExecuteCommand", option_to_yojson boolean__to_yojson x.enable_execute_command);
      ("enableECSManagedTags", option_to_yojson boolean__to_yojson x.enable_ecs_managed_tags);
      ("propagateTags", option_to_yojson daemon_propagate_tags_to_yojson x.propagate_tags);
      ( "deploymentConfiguration",
        option_to_yojson daemon_deployment_configuration_to_yojson x.deployment_configuration );
      ("capacityProviderArns", Some (string_list_to_yojson x.capacity_provider_arns));
      ("daemonTaskDefinitionArn", Some (string__to_yojson x.daemon_task_definition_arn));
      ("daemonArn", Some (string__to_yojson x.daemon_arn));
    ]

let daemon_not_found_exception_to_yojson (x : daemon_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let daemon_not_active_exception_to_yojson (x : daemon_not_active_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let long_to_yojson = long_to_yojson

let resource_to_yojson (x : resource) =
  assoc_to_yojson
    [
      ("stringSetValue", option_to_yojson string_list_to_yojson x.string_set_value);
      ("integerValue", option_to_yojson integer_to_yojson x.integer_value);
      ("longValue", option_to_yojson long_to_yojson x.long_value);
      ("doubleValue", option_to_yojson double_to_yojson x.double_value);
      ("type", option_to_yojson string__to_yojson x.type_);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let resources_to_yojson tree = list_to_yojson resource_to_yojson tree

let agent_update_status_to_yojson (x : agent_update_status) =
  match x with
  | FAILED -> `String "FAILED"
  | UPDATED -> `String "UPDATED"
  | UPDATING -> `String "UPDATING"
  | STAGED -> `String "STAGED"
  | STAGING -> `String "STAGING"
  | PENDING -> `String "PENDING"

let target_type_to_yojson (x : target_type) =
  match x with CONTAINER_INSTANCE -> `String "container-instance"

let attribute_to_yojson (x : attribute) =
  assoc_to_yojson
    [
      ("targetId", option_to_yojson string__to_yojson x.target_id);
      ("targetType", option_to_yojson target_type_to_yojson x.target_type);
      ("value", option_to_yojson string__to_yojson x.value);
      ("name", Some (string__to_yojson x.name));
    ]

let attributes_to_yojson tree = list_to_yojson attribute_to_yojson tree
let attachment_details_to_yojson tree = list_to_yojson key_value_pair_to_yojson tree

let attachment_to_yojson (x : attachment) =
  assoc_to_yojson
    [
      ("details", option_to_yojson attachment_details_to_yojson x.details);
      ("status", option_to_yojson string__to_yojson x.status);
      ("type", option_to_yojson string__to_yojson x.type_);
      ("id", option_to_yojson string__to_yojson x.id);
    ]

let attachments_to_yojson tree = list_to_yojson attachment_to_yojson tree

let instance_health_check_state_to_yojson (x : instance_health_check_state) =
  match x with
  | INITIALIZING -> `String "INITIALIZING"
  | INSUFFICIENT_DATA -> `String "INSUFFICIENT_DATA"
  | IMPAIRED -> `String "IMPAIRED"
  | OK -> `String "OK"

let instance_health_check_type_to_yojson (x : instance_health_check_type) =
  match x with
  | DAEMON -> `String "DAEMON"
  | ACCELERATED_COMPUTE -> `String "ACCELERATED_COMPUTE"
  | CONTAINER_RUNTIME -> `String "CONTAINER_RUNTIME"

let instance_health_check_result_to_yojson (x : instance_health_check_result) =
  assoc_to_yojson
    [
      ("lastStatusChange", option_to_yojson timestamp_to_yojson x.last_status_change);
      ("lastUpdated", option_to_yojson timestamp_to_yojson x.last_updated);
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("status", option_to_yojson instance_health_check_state_to_yojson x.status);
      ("type", option_to_yojson instance_health_check_type_to_yojson x.type_);
    ]

let instance_health_check_result_list_to_yojson tree =
  list_to_yojson instance_health_check_result_to_yojson tree

let container_instance_health_status_to_yojson (x : container_instance_health_status) =
  assoc_to_yojson
    [
      ("details", option_to_yojson instance_health_check_result_list_to_yojson x.details);
      ("overallStatus", option_to_yojson instance_health_check_state_to_yojson x.overall_status);
    ]

let container_instance_to_yojson (x : container_instance) =
  assoc_to_yojson
    [
      ("healthStatus", option_to_yojson container_instance_health_status_to_yojson x.health_status);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("attachments", option_to_yojson attachments_to_yojson x.attachments);
      ("registeredAt", option_to_yojson timestamp_to_yojson x.registered_at);
      ("attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("agentUpdateStatus", option_to_yojson agent_update_status_to_yojson x.agent_update_status);
      ("pendingTasksCount", option_to_yojson integer_to_yojson x.pending_tasks_count);
      ("runningTasksCount", option_to_yojson integer_to_yojson x.running_tasks_count);
      ("agentConnected", option_to_yojson boolean__to_yojson x.agent_connected);
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("status", option_to_yojson string__to_yojson x.status);
      ("registeredResources", option_to_yojson resources_to_yojson x.registered_resources);
      ("remainingResources", option_to_yojson resources_to_yojson x.remaining_resources);
      ("versionInfo", option_to_yojson version_info_to_yojson x.version_info);
      ("version", option_to_yojson long_to_yojson x.version);
      ("capacityProviderName", option_to_yojson string__to_yojson x.capacity_provider_name);
      ("ec2InstanceId", option_to_yojson string__to_yojson x.ec2_instance_id);
      ("containerInstanceArn", option_to_yojson string__to_yojson x.container_instance_arn);
    ]

let container_instances_to_yojson tree = list_to_yojson container_instance_to_yojson tree

let update_container_instances_state_response_to_yojson
    (x : update_container_instances_state_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("containerInstances", option_to_yojson container_instances_to_yojson x.container_instances);
    ]

let container_instance_status_to_yojson (x : container_instance_status) =
  match x with
  | REGISTRATION_FAILED -> `String "REGISTRATION_FAILED"
  | DEREGISTERING -> `String "DEREGISTERING"
  | REGISTERING -> `String "REGISTERING"
  | DRAINING -> `String "DRAINING"
  | ACTIVE -> `String "ACTIVE"

let update_container_instances_state_request_to_yojson
    (x : update_container_instances_state_request) =
  assoc_to_yojson
    [
      ("status", Some (container_instance_status_to_yojson x.status));
      ("containerInstances", Some (string_list_to_yojson x.container_instances));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let update_container_agent_response_to_yojson (x : update_container_agent_response) =
  assoc_to_yojson
    [ ("containerInstance", option_to_yojson container_instance_to_yojson x.container_instance) ]

let update_container_agent_request_to_yojson (x : update_container_agent_request) =
  assoc_to_yojson
    [
      ("containerInstance", Some (string__to_yojson x.container_instance));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let no_update_available_exception_to_yojson (x : no_update_available_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let missing_version_exception_to_yojson (x : missing_version_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let execute_command_logging_to_yojson (x : execute_command_logging) =
  match x with
  | OVERRIDE -> `String "OVERRIDE"
  | DEFAULT -> `String "DEFAULT"
  | NONE -> `String "NONE"

let execute_command_log_configuration_to_yojson (x : execute_command_log_configuration) =
  assoc_to_yojson
    [
      ("s3KeyPrefix", option_to_yojson string__to_yojson x.s3_key_prefix);
      ("s3EncryptionEnabled", option_to_yojson boolean__to_yojson x.s3_encryption_enabled);
      ("s3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
      ( "cloudWatchEncryptionEnabled",
        option_to_yojson boolean__to_yojson x.cloud_watch_encryption_enabled );
      ("cloudWatchLogGroupName", option_to_yojson string__to_yojson x.cloud_watch_log_group_name);
    ]

let execute_command_configuration_to_yojson (x : execute_command_configuration) =
  assoc_to_yojson
    [
      ( "logConfiguration",
        option_to_yojson execute_command_log_configuration_to_yojson x.log_configuration );
      ("logging", option_to_yojson execute_command_logging_to_yojson x.logging);
      ("kmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
    ]

let managed_storage_configuration_to_yojson (x : managed_storage_configuration) =
  assoc_to_yojson
    [
      ( "fargateEphemeralStorageKmsKeyId",
        option_to_yojson string__to_yojson x.fargate_ephemeral_storage_kms_key_id );
      ("kmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
    ]

let cluster_configuration_to_yojson (x : cluster_configuration) =
  assoc_to_yojson
    [
      ( "managedStorageConfiguration",
        option_to_yojson managed_storage_configuration_to_yojson x.managed_storage_configuration );
      ( "executeCommandConfiguration",
        option_to_yojson execute_command_configuration_to_yojson x.execute_command_configuration );
    ]

let statistics_to_yojson tree = list_to_yojson key_value_pair_to_yojson tree

let cluster_setting_name_to_yojson (x : cluster_setting_name) =
  match x with CONTAINER_INSIGHTS -> `String "containerInsights"

let cluster_setting_to_yojson (x : cluster_setting) =
  assoc_to_yojson
    [
      ("value", option_to_yojson string__to_yojson x.value);
      ("name", option_to_yojson cluster_setting_name_to_yojson x.name);
    ]

let cluster_settings_to_yojson tree = list_to_yojson cluster_setting_to_yojson tree

let cluster_service_connect_defaults_to_yojson (x : cluster_service_connect_defaults) =
  assoc_to_yojson [ ("namespace", option_to_yojson string__to_yojson x.namespace) ]

let cluster_to_yojson (x : cluster) =
  assoc_to_yojson
    [
      ( "serviceConnectDefaults",
        option_to_yojson cluster_service_connect_defaults_to_yojson x.service_connect_defaults );
      ("attachmentsStatus", option_to_yojson string__to_yojson x.attachments_status);
      ("attachments", option_to_yojson attachments_to_yojson x.attachments);
      ( "defaultCapacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.default_capacity_provider_strategy
      );
      ("capacityProviders", option_to_yojson string_list_to_yojson x.capacity_providers);
      ("settings", option_to_yojson cluster_settings_to_yojson x.settings);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("statistics", option_to_yojson statistics_to_yojson x.statistics);
      ("activeServicesCount", option_to_yojson integer_to_yojson x.active_services_count);
      ("pendingTasksCount", option_to_yojson integer_to_yojson x.pending_tasks_count);
      ("runningTasksCount", option_to_yojson integer_to_yojson x.running_tasks_count);
      ( "registeredContainerInstancesCount",
        option_to_yojson integer_to_yojson x.registered_container_instances_count );
      ("status", option_to_yojson string__to_yojson x.status);
      ("configuration", option_to_yojson cluster_configuration_to_yojson x.configuration);
      ("clusterName", option_to_yojson string__to_yojson x.cluster_name);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
    ]

let update_cluster_settings_response_to_yojson (x : update_cluster_settings_response) =
  assoc_to_yojson [ ("cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let update_cluster_settings_request_to_yojson (x : update_cluster_settings_request) =
  assoc_to_yojson
    [
      ("settings", Some (cluster_settings_to_yojson x.settings));
      ("cluster", Some (string__to_yojson x.cluster));
    ]

let update_cluster_response_to_yojson (x : update_cluster_response) =
  assoc_to_yojson [ ("cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let cluster_service_connect_defaults_request_to_yojson
    (x : cluster_service_connect_defaults_request) =
  assoc_to_yojson [ ("namespace", Some (string__to_yojson x.namespace)) ]

let update_cluster_request_to_yojson (x : update_cluster_request) =
  assoc_to_yojson
    [
      ( "serviceConnectDefaults",
        option_to_yojson cluster_service_connect_defaults_request_to_yojson
          x.service_connect_defaults );
      ("configuration", option_to_yojson cluster_configuration_to_yojson x.configuration);
      ("settings", option_to_yojson cluster_settings_to_yojson x.settings);
      ("cluster", Some (string__to_yojson x.cluster));
    ]

let capacity_provider_status_to_yojson (x : capacity_provider_status) =
  match x with
  | INACTIVE -> `String "INACTIVE"
  | DEPROVISIONING -> `String "DEPROVISIONING"
  | ACTIVE -> `String "ACTIVE"
  | PROVISIONING -> `String "PROVISIONING"

let managed_scaling_status_to_yojson (x : managed_scaling_status) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let managed_scaling_target_capacity_to_yojson = int_to_yojson
let managed_scaling_step_size_to_yojson = int_to_yojson
let managed_scaling_instance_warmup_period_to_yojson = int_to_yojson

let managed_scaling_to_yojson (x : managed_scaling) =
  assoc_to_yojson
    [
      ( "instanceWarmupPeriod",
        option_to_yojson managed_scaling_instance_warmup_period_to_yojson x.instance_warmup_period
      );
      ( "maximumScalingStepSize",
        option_to_yojson managed_scaling_step_size_to_yojson x.maximum_scaling_step_size );
      ( "minimumScalingStepSize",
        option_to_yojson managed_scaling_step_size_to_yojson x.minimum_scaling_step_size );
      ( "targetCapacity",
        option_to_yojson managed_scaling_target_capacity_to_yojson x.target_capacity );
      ("status", option_to_yojson managed_scaling_status_to_yojson x.status);
    ]

let managed_termination_protection_to_yojson (x : managed_termination_protection) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let managed_draining_to_yojson (x : managed_draining) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let auto_scaling_group_provider_to_yojson (x : auto_scaling_group_provider) =
  assoc_to_yojson
    [
      ("managedDraining", option_to_yojson managed_draining_to_yojson x.managed_draining);
      ( "managedTerminationProtection",
        option_to_yojson managed_termination_protection_to_yojson x.managed_termination_protection
      );
      ("managedScaling", option_to_yojson managed_scaling_to_yojson x.managed_scaling);
      ("autoScalingGroupArn", Some (string__to_yojson x.auto_scaling_group_arn));
    ]

let capacity_option_type_to_yojson (x : capacity_option_type) =
  match x with
  | RESERVED -> `String "RESERVED"
  | SPOT -> `String "SPOT"
  | ON_DEMAND -> `String "ON_DEMAND"

let instance_launch_template_to_yojson (x : instance_launch_template) =
  assoc_to_yojson
    [
      ( "capacityReservations",
        option_to_yojson capacity_reservation_request_to_yojson x.capacity_reservations );
      ("fipsEnabled", option_to_yojson boxed_boolean_to_yojson x.fips_enabled);
      ( "instanceRequirements",
        option_to_yojson instance_requirements_request_to_yojson x.instance_requirements );
      ( "instanceMetadataTagsPropagation",
        option_to_yojson boxed_boolean_to_yojson x.instance_metadata_tags_propagation );
      ("capacityOptionType", option_to_yojson capacity_option_type_to_yojson x.capacity_option_type);
      ("monitoring", option_to_yojson managed_instances_monitoring_options_to_yojson x.monitoring);
      ( "localStorageConfiguration",
        option_to_yojson managed_instances_local_storage_configuration_to_yojson
          x.local_storage_configuration );
      ( "storageConfiguration",
        option_to_yojson managed_instances_storage_configuration_to_yojson x.storage_configuration
      );
      ( "networkConfiguration",
        Some (managed_instances_network_configuration_to_yojson x.network_configuration) );
      ("ec2InstanceProfileArn", Some (string__to_yojson x.ec2_instance_profile_arn));
    ]

let managed_instances_provider_to_yojson (x : managed_instances_provider) =
  assoc_to_yojson
    [
      ( "autoRepairConfiguration",
        option_to_yojson auto_repair_configuration_to_yojson x.auto_repair_configuration );
      ( "infrastructureOptimization",
        option_to_yojson infrastructure_optimization_to_yojson x.infrastructure_optimization );
      ("propagateTags", option_to_yojson propagate_mi_tags_to_yojson x.propagate_tags);
      ( "instanceLaunchTemplate",
        option_to_yojson instance_launch_template_to_yojson x.instance_launch_template );
      ("infrastructureRoleArn", option_to_yojson string__to_yojson x.infrastructure_role_arn);
    ]

let capacity_provider_update_status_to_yojson (x : capacity_provider_update_status) =
  match x with
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | UPDATE_COMPLETE -> `String "UPDATE_COMPLETE"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETE_COMPLETE -> `String "DELETE_COMPLETE"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATE_COMPLETE -> `String "CREATE_COMPLETE"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"

let capacity_provider_type_to_yojson (x : capacity_provider_type) =
  match x with
  | FARGATE_SPOT -> `String "FARGATE_SPOT"
  | FARGATE -> `String "FARGATE"
  | MANAGED_INSTANCES -> `String "MANAGED_INSTANCES"
  | EC2_AUTOSCALING -> `String "EC2_AUTOSCALING"

let capacity_provider_to_yojson (x : capacity_provider) =
  assoc_to_yojson
    [
      ("type", option_to_yojson capacity_provider_type_to_yojson x.type_);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("updateStatusReason", option_to_yojson string__to_yojson x.update_status_reason);
      ("updateStatus", option_to_yojson capacity_provider_update_status_to_yojson x.update_status);
      ( "managedInstancesProvider",
        option_to_yojson managed_instances_provider_to_yojson x.managed_instances_provider );
      ( "autoScalingGroupProvider",
        option_to_yojson auto_scaling_group_provider_to_yojson x.auto_scaling_group_provider );
      ("status", option_to_yojson capacity_provider_status_to_yojson x.status);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("name", option_to_yojson string__to_yojson x.name);
      ("capacityProviderArn", option_to_yojson string__to_yojson x.capacity_provider_arn);
    ]

let update_capacity_provider_response_to_yojson (x : update_capacity_provider_response) =
  assoc_to_yojson
    [ ("capacityProvider", option_to_yojson capacity_provider_to_yojson x.capacity_provider) ]

let auto_scaling_group_provider_update_to_yojson (x : auto_scaling_group_provider_update) =
  assoc_to_yojson
    [
      ("managedDraining", option_to_yojson managed_draining_to_yojson x.managed_draining);
      ( "managedTerminationProtection",
        option_to_yojson managed_termination_protection_to_yojson x.managed_termination_protection
      );
      ("managedScaling", option_to_yojson managed_scaling_to_yojson x.managed_scaling);
    ]

let update_capacity_provider_request_to_yojson (x : update_capacity_provider_request) =
  assoc_to_yojson
    [
      ( "managedInstancesProvider",
        option_to_yojson update_managed_instances_provider_configuration_to_yojson
          x.managed_instances_provider );
      ( "autoScalingGroupProvider",
        option_to_yojson auto_scaling_group_provider_update_to_yojson x.auto_scaling_group_provider
      );
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("name", Some (string__to_yojson x.name));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_keys_to_yojson x.tag_keys));
      ("resourceArn", Some (string__to_yojson x.resource_arn));
    ]

let ulimit_name_to_yojson (x : ulimit_name) =
  match x with
  | STACK -> `String "stack"
  | SIGPENDING -> `String "sigpending"
  | RTTIME -> `String "rttime"
  | RTPRIO -> `String "rtprio"
  | RSS -> `String "rss"
  | NPROC -> `String "nproc"
  | NOFILE -> `String "nofile"
  | NICE -> `String "nice"
  | MSGQUEUE -> `String "msgqueue"
  | MEMLOCK -> `String "memlock"
  | LOCKS -> `String "locks"
  | FSIZE -> `String "fsize"
  | DATA -> `String "data"
  | CPU -> `String "cpu"
  | CORE -> `String "core"

let ulimit_to_yojson (x : ulimit) =
  assoc_to_yojson
    [
      ("hardLimit", Some (integer_to_yojson x.hard_limit));
      ("softLimit", Some (integer_to_yojson x.soft_limit));
      ("name", Some (ulimit_name_to_yojson x.name));
    ]

let ulimit_list_to_yojson tree = list_to_yojson ulimit_to_yojson tree

let transport_protocol_to_yojson (x : transport_protocol) =
  match x with UDP -> `String "udp" | TCP -> `String "tcp"

let tmpfs_to_yojson (x : tmpfs) =
  assoc_to_yojson
    [
      ("mountOptions", option_to_yojson string_list_to_yojson x.mount_options);
      ("size", Some (integer_to_yojson x.size));
      ("containerPath", Some (string__to_yojson x.container_path));
    ]

let tmpfs_list_to_yojson tree = list_to_yojson tmpfs_to_yojson tree

let connectivity_to_yojson (x : connectivity) =
  match x with DISCONNECTED -> `String "DISCONNECTED" | CONNECTED -> `String "CONNECTED"

let network_binding_to_yojson (x : network_binding) =
  assoc_to_yojson
    [
      ("hostPortRange", option_to_yojson string__to_yojson x.host_port_range);
      ("containerPortRange", option_to_yojson string__to_yojson x.container_port_range);
      ("protocol", option_to_yojson transport_protocol_to_yojson x.protocol);
      ("hostPort", option_to_yojson boxed_integer_to_yojson x.host_port);
      ("containerPort", option_to_yojson boxed_integer_to_yojson x.container_port);
      ("bindIP", option_to_yojson string__to_yojson x.bind_i_p);
    ]

let network_bindings_to_yojson tree = list_to_yojson network_binding_to_yojson tree

let network_interface_to_yojson (x : network_interface) =
  assoc_to_yojson
    [
      ("ipv6Address", option_to_yojson string__to_yojson x.ipv6_address);
      ("privateIpv4Address", option_to_yojson string__to_yojson x.private_ipv4_address);
      ("attachmentId", option_to_yojson string__to_yojson x.attachment_id);
    ]

let network_interfaces_to_yojson tree = list_to_yojson network_interface_to_yojson tree

let health_status_to_yojson (x : health_status) =
  match x with
  | UNKNOWN -> `String "UNKNOWN"
  | UNHEALTHY -> `String "UNHEALTHY"
  | HEALTHY -> `String "HEALTHY"

let managed_agent_name_to_yojson (x : managed_agent_name) =
  match x with ExecuteCommandAgent -> `String "ExecuteCommandAgent"

let managed_agent_to_yojson (x : managed_agent) =
  assoc_to_yojson
    [
      ("lastStatus", option_to_yojson string__to_yojson x.last_status);
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("name", option_to_yojson managed_agent_name_to_yojson x.name);
      ("lastStartedAt", option_to_yojson timestamp_to_yojson x.last_started_at);
    ]

let managed_agents_to_yojson tree = list_to_yojson managed_agent_to_yojson tree
let gpu_ids_to_yojson tree = list_to_yojson string__to_yojson tree
let neuron_device_ids_to_yojson tree = list_to_yojson string__to_yojson tree

let container_to_yojson (x : container) =
  assoc_to_yojson
    [
      ("neuronDeviceIds", option_to_yojson neuron_device_ids_to_yojson x.neuron_device_ids);
      ("gpuIds", option_to_yojson gpu_ids_to_yojson x.gpu_ids);
      ("memoryReservation", option_to_yojson string__to_yojson x.memory_reservation);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ("managedAgents", option_to_yojson managed_agents_to_yojson x.managed_agents);
      ("healthStatus", option_to_yojson health_status_to_yojson x.health_status);
      ("networkInterfaces", option_to_yojson network_interfaces_to_yojson x.network_interfaces);
      ("networkBindings", option_to_yojson network_bindings_to_yojson x.network_bindings);
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("exitCode", option_to_yojson boxed_integer_to_yojson x.exit_code);
      ("lastStatus", option_to_yojson string__to_yojson x.last_status);
      ("runtimeId", option_to_yojson string__to_yojson x.runtime_id);
      ("imageDigest", option_to_yojson string__to_yojson x.image_digest);
      ("image", option_to_yojson string__to_yojson x.image);
      ("name", option_to_yojson string__to_yojson x.name);
      ("taskArn", option_to_yojson string__to_yojson x.task_arn);
      ("containerArn", option_to_yojson string__to_yojson x.container_arn);
    ]

let containers_to_yojson tree = list_to_yojson container_to_yojson tree

let inference_accelerator_to_yojson (x : inference_accelerator) =
  assoc_to_yojson
    [
      ("deviceType", Some (string__to_yojson x.device_type));
      ("deviceName", Some (string__to_yojson x.device_name));
    ]

let inference_accelerators_to_yojson tree = list_to_yojson inference_accelerator_to_yojson tree
let environment_file_type_to_yojson (x : environment_file_type) = match x with S3 -> `String "s3"

let environment_file_to_yojson (x : environment_file) =
  assoc_to_yojson
    [
      ("type", Some (environment_file_type_to_yojson x.type_));
      ("value", Some (string__to_yojson x.value));
    ]

let environment_files_to_yojson tree = list_to_yojson environment_file_to_yojson tree

let resource_type_to_yojson (x : resource_type) =
  match x with
  | NEURON_DEVICE -> `String "NeuronDevice"
  | INFERENCE_ACCELERATOR -> `String "InferenceAccelerator"
  | GPU -> `String "GPU"

let resource_requirement_to_yojson (x : resource_requirement) =
  assoc_to_yojson
    [
      ("type", Some (resource_type_to_yojson x.type_)); ("value", Some (string__to_yojson x.value));
    ]

let resource_requirements_to_yojson tree = list_to_yojson resource_requirement_to_yojson tree

let container_override_to_yojson (x : container_override) =
  assoc_to_yojson
    [
      ( "resourceRequirements",
        option_to_yojson resource_requirements_to_yojson x.resource_requirements );
      ("memoryReservation", option_to_yojson boxed_integer_to_yojson x.memory_reservation);
      ("memory", option_to_yojson boxed_integer_to_yojson x.memory);
      ("cpu", option_to_yojson boxed_integer_to_yojson x.cpu);
      ("environmentFiles", option_to_yojson environment_files_to_yojson x.environment_files);
      ("environment", option_to_yojson environment_variables_to_yojson x.environment);
      ("command", option_to_yojson string_list_to_yojson x.command);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let container_overrides_to_yojson tree = list_to_yojson container_override_to_yojson tree

let inference_accelerator_override_to_yojson (x : inference_accelerator_override) =
  assoc_to_yojson
    [
      ("deviceType", option_to_yojson string__to_yojson x.device_type);
      ("deviceName", option_to_yojson string__to_yojson x.device_name);
    ]

let inference_accelerator_overrides_to_yojson tree =
  list_to_yojson inference_accelerator_override_to_yojson tree

let ephemeral_storage_to_yojson (x : ephemeral_storage) =
  assoc_to_yojson [ ("sizeInGiB", Some (integer_to_yojson x.size_in_gi_b)) ]

let task_override_to_yojson (x : task_override) =
  assoc_to_yojson
    [
      ("ephemeralStorage", option_to_yojson ephemeral_storage_to_yojson x.ephemeral_storage);
      ("taskRoleArn", option_to_yojson string__to_yojson x.task_role_arn);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("executionRoleArn", option_to_yojson string__to_yojson x.execution_role_arn);
      ( "inferenceAcceleratorOverrides",
        option_to_yojson inference_accelerator_overrides_to_yojson x.inference_accelerator_overrides
      );
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ("containerOverrides", option_to_yojson container_overrides_to_yojson x.container_overrides);
    ]

let task_stop_code_to_yojson (x : task_stop_code) =
  match x with
  | TERMINATION_NOTICE -> `String "TerminationNotice"
  | SPOT_INTERRUPTION -> `String "SpotInterruption"
  | SERVICE_SCHEDULER_INITIATED -> `String "ServiceSchedulerInitiated"
  | USER_INITIATED -> `String "UserInitiated"
  | ESSENTIAL_CONTAINER_EXITED -> `String "EssentialContainerExited"
  | TASK_FAILED_TO_START -> `String "TaskFailedToStart"

let task_ephemeral_storage_to_yojson (x : task_ephemeral_storage) =
  assoc_to_yojson
    [
      ("kmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("sizeInGiB", option_to_yojson integer_to_yojson x.size_in_gi_b);
    ]

let task_to_yojson (x : task) =
  assoc_to_yojson
    [
      ( "fargateEphemeralStorage",
        option_to_yojson task_ephemeral_storage_to_yojson x.fargate_ephemeral_storage );
      ("ephemeralStorage", option_to_yojson ephemeral_storage_to_yojson x.ephemeral_storage);
      ("version", option_to_yojson long_to_yojson x.version);
      ("taskDefinitionArn", option_to_yojson string__to_yojson x.task_definition_arn);
      ("taskArn", option_to_yojson string__to_yojson x.task_arn);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("stoppingAt", option_to_yojson timestamp_to_yojson x.stopping_at);
      ("stoppedReason", option_to_yojson string__to_yojson x.stopped_reason);
      ("stoppedAt", option_to_yojson timestamp_to_yojson x.stopped_at);
      ("stopCode", option_to_yojson task_stop_code_to_yojson x.stop_code);
      ("startedBy", option_to_yojson string__to_yojson x.started_by);
      ("startedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("pullStoppedAt", option_to_yojson timestamp_to_yojson x.pull_stopped_at);
      ("pullStartedAt", option_to_yojson timestamp_to_yojson x.pull_started_at);
      ("platformFamily", option_to_yojson string__to_yojson x.platform_family);
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("overrides", option_to_yojson task_override_to_yojson x.overrides);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ("lastStatus", option_to_yojson string__to_yojson x.last_status);
      ( "inferenceAccelerators",
        option_to_yojson inference_accelerators_to_yojson x.inference_accelerators );
      ("healthStatus", option_to_yojson health_status_to_yojson x.health_status);
      ("group", option_to_yojson string__to_yojson x.group);
      ("executionStoppedAt", option_to_yojson timestamp_to_yojson x.execution_stopped_at);
      ("enableExecuteCommand", option_to_yojson boolean__to_yojson x.enable_execute_command);
      ("desiredStatus", option_to_yojson string__to_yojson x.desired_status);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ("containers", option_to_yojson containers_to_yojson x.containers);
      ("containerInstanceArn", option_to_yojson string__to_yojson x.container_instance_arn);
      ("connectivityAt", option_to_yojson timestamp_to_yojson x.connectivity_at);
      ("connectivity", option_to_yojson connectivity_to_yojson x.connectivity);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("capacityProviderName", option_to_yojson string__to_yojson x.capacity_provider_name);
      ("availabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ("attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("attachments", option_to_yojson attachments_to_yojson x.attachments);
    ]

let tasks_to_yojson tree = list_to_yojson task_to_yojson tree

let task_managed_ebs_volume_termination_policy_to_yojson
    (x : task_managed_ebs_volume_termination_policy) =
  assoc_to_yojson
    [ ("deleteOnTermination", Some (boxed_boolean_to_yojson x.delete_on_termination)) ]

let task_managed_ebs_volume_configuration_to_yojson (x : task_managed_ebs_volume_configuration) =
  assoc_to_yojson
    [
      ("filesystemType", option_to_yojson task_filesystem_type_to_yojson x.filesystem_type);
      ( "terminationPolicy",
        option_to_yojson task_managed_ebs_volume_termination_policy_to_yojson x.termination_policy
      );
      ("roleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("tagSpecifications", option_to_yojson ebs_tag_specifications_to_yojson x.tag_specifications);
      ("throughput", option_to_yojson boxed_integer_to_yojson x.throughput);
      ("iops", option_to_yojson boxed_integer_to_yojson x.iops);
      ( "volumeInitializationRate",
        option_to_yojson boxed_integer_to_yojson x.volume_initialization_rate );
      ("snapshotId", option_to_yojson ebs_snapshot_id_to_yojson x.snapshot_id);
      ("sizeInGiB", option_to_yojson boxed_integer_to_yojson x.size_in_gi_b);
      ("volumeType", option_to_yojson ebs_volume_type_to_yojson x.volume_type);
      ("kmsKeyId", option_to_yojson ebskms_key_id_to_yojson x.kms_key_id);
      ("encrypted", option_to_yojson boxed_boolean_to_yojson x.encrypted);
    ]

let task_volume_configuration_to_yojson (x : task_volume_configuration) =
  assoc_to_yojson
    [
      ( "managedEBSVolume",
        option_to_yojson task_managed_ebs_volume_configuration_to_yojson x.managed_ebs_volume );
      ("name", Some (ecs_volume_name_to_yojson x.name));
    ]

let task_volume_configurations_to_yojson tree =
  list_to_yojson task_volume_configuration_to_yojson tree

let task_set_field_to_yojson (x : task_set_field) = match x with TAGS -> `String "TAGS"
let task_set_field_list_to_yojson tree = list_to_yojson task_set_field_to_yojson tree
let task_field_to_yojson (x : task_field) = match x with TAGS -> `String "TAGS"
let task_field_list_to_yojson tree = list_to_yojson task_field_to_yojson tree

let task_definition_status_to_yojson (x : task_definition_status) =
  match x with
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | INACTIVE -> `String "INACTIVE"
  | ACTIVE -> `String "ACTIVE"

let task_definition_placement_constraint_type_to_yojson
    (x : task_definition_placement_constraint_type) =
  match x with MEMBER_OF -> `String "memberOf"

let task_definition_placement_constraint_to_yojson (x : task_definition_placement_constraint) =
  assoc_to_yojson
    [
      ("expression", option_to_yojson string__to_yojson x.expression);
      ("type", option_to_yojson task_definition_placement_constraint_type_to_yojson x.type_);
    ]

let task_definition_placement_constraints_to_yojson tree =
  list_to_yojson task_definition_placement_constraint_to_yojson tree

let repository_credentials_to_yojson (x : repository_credentials) =
  assoc_to_yojson [ ("credentialsParameter", Some (string__to_yojson x.credentials_parameter)) ]

let application_protocol_to_yojson (x : application_protocol) =
  match x with GRPC -> `String "grpc" | HTTP2 -> `String "http2" | HTTP -> `String "http"

let port_mapping_to_yojson (x : port_mapping) =
  assoc_to_yojson
    [
      ("containerPortRange", option_to_yojson string__to_yojson x.container_port_range);
      ("appProtocol", option_to_yojson application_protocol_to_yojson x.app_protocol);
      ("name", option_to_yojson string__to_yojson x.name);
      ("protocol", option_to_yojson transport_protocol_to_yojson x.protocol);
      ("hostPort", option_to_yojson boxed_integer_to_yojson x.host_port);
      ("containerPort", option_to_yojson boxed_integer_to_yojson x.container_port);
    ]

let port_mapping_list_to_yojson tree = list_to_yojson port_mapping_to_yojson tree
let integer_list_to_yojson tree = list_to_yojson boxed_integer_to_yojson tree

let container_restart_policy_to_yojson (x : container_restart_policy) =
  assoc_to_yojson
    [
      ("restartAttemptPeriod", option_to_yojson boxed_integer_to_yojson x.restart_attempt_period);
      ("ignoredExitCodes", option_to_yojson integer_list_to_yojson x.ignored_exit_codes);
      ("enabled", Some (boxed_boolean_to_yojson x.enabled));
    ]

let mount_point_to_yojson (x : mount_point) =
  assoc_to_yojson
    [
      ("readOnly", option_to_yojson boxed_boolean_to_yojson x.read_only);
      ("containerPath", option_to_yojson string__to_yojson x.container_path);
      ("sourceVolume", option_to_yojson string__to_yojson x.source_volume);
    ]

let mount_point_list_to_yojson tree = list_to_yojson mount_point_to_yojson tree

let kernel_capabilities_to_yojson (x : kernel_capabilities) =
  assoc_to_yojson
    [
      ("drop", option_to_yojson string_list_to_yojson x.drop);
      ("add", option_to_yojson string_list_to_yojson x.add);
    ]

let device_cgroup_permission_to_yojson (x : device_cgroup_permission) =
  match x with MKNOD -> `String "mknod" | WRITE -> `String "write" | READ -> `String "read"

let device_cgroup_permissions_to_yojson tree =
  list_to_yojson device_cgroup_permission_to_yojson tree

let device_to_yojson (x : device) =
  assoc_to_yojson
    [
      ("permissions", option_to_yojson device_cgroup_permissions_to_yojson x.permissions);
      ("containerPath", option_to_yojson string__to_yojson x.container_path);
      ("hostPath", Some (string__to_yojson x.host_path));
    ]

let devices_list_to_yojson tree = list_to_yojson device_to_yojson tree

let linux_parameters_to_yojson (x : linux_parameters) =
  assoc_to_yojson
    [
      ("swappiness", option_to_yojson boxed_integer_to_yojson x.swappiness);
      ("maxSwap", option_to_yojson boxed_integer_to_yojson x.max_swap);
      ("tmpfs", option_to_yojson tmpfs_list_to_yojson x.tmpfs);
      ("sharedMemorySize", option_to_yojson boxed_integer_to_yojson x.shared_memory_size);
      ("initProcessEnabled", option_to_yojson boxed_boolean_to_yojson x.init_process_enabled);
      ("devices", option_to_yojson devices_list_to_yojson x.devices);
      ("capabilities", option_to_yojson kernel_capabilities_to_yojson x.capabilities);
    ]

let container_condition_to_yojson (x : container_condition) =
  match x with
  | HEALTHY -> `String "HEALTHY"
  | SUCCESS -> `String "SUCCESS"
  | COMPLETE -> `String "COMPLETE"
  | START -> `String "START"

let container_dependency_to_yojson (x : container_dependency) =
  assoc_to_yojson
    [
      ("condition", Some (container_condition_to_yojson x.condition));
      ("containerName", Some (string__to_yojson x.container_name));
    ]

let container_dependencies_to_yojson tree = list_to_yojson container_dependency_to_yojson tree

let host_entry_to_yojson (x : host_entry) =
  assoc_to_yojson
    [
      ("ipAddress", Some (string__to_yojson x.ip_address));
      ("hostname", Some (string__to_yojson x.hostname));
    ]

let host_entry_list_to_yojson tree = list_to_yojson host_entry_to_yojson tree
let docker_labels_map_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree

let health_check_to_yojson (x : health_check) =
  assoc_to_yojson
    [
      ("startPeriod", option_to_yojson boxed_integer_to_yojson x.start_period);
      ("retries", option_to_yojson boxed_integer_to_yojson x.retries);
      ("timeout", option_to_yojson boxed_integer_to_yojson x.timeout);
      ("interval", option_to_yojson boxed_integer_to_yojson x.interval);
      ("command", Some (string_list_to_yojson x.command));
    ]

let system_control_to_yojson (x : system_control) =
  assoc_to_yojson
    [
      ("value", option_to_yojson string__to_yojson x.value);
      ("namespace", option_to_yojson string__to_yojson x.namespace);
    ]

let system_controls_to_yojson tree = list_to_yojson system_control_to_yojson tree

let firelens_configuration_type_to_yojson (x : firelens_configuration_type) =
  match x with FLUENTBIT -> `String "fluentbit" | FLUENTD -> `String "fluentd"

let firelens_configuration_options_map_to_yojson tree =
  map_to_yojson string__to_yojson string__to_yojson tree

let firelens_configuration_to_yojson (x : firelens_configuration) =
  assoc_to_yojson
    [
      ("options", option_to_yojson firelens_configuration_options_map_to_yojson x.options);
      ("type", Some (firelens_configuration_type_to_yojson x.type_));
    ]

let container_definition_to_yojson (x : container_definition) =
  assoc_to_yojson
    [
      ("credentialSpecs", option_to_yojson string_list_to_yojson x.credential_specs);
      ( "firelensConfiguration",
        option_to_yojson firelens_configuration_to_yojson x.firelens_configuration );
      ( "resourceRequirements",
        option_to_yojson resource_requirements_to_yojson x.resource_requirements );
      ("systemControls", option_to_yojson system_controls_to_yojson x.system_controls);
      ("healthCheck", option_to_yojson health_check_to_yojson x.health_check);
      ("logConfiguration", option_to_yojson log_configuration_to_yojson x.log_configuration);
      ("ulimits", option_to_yojson ulimit_list_to_yojson x.ulimits);
      ("dockerLabels", option_to_yojson docker_labels_map_to_yojson x.docker_labels);
      ("pseudoTerminal", option_to_yojson boxed_boolean_to_yojson x.pseudo_terminal);
      ("interactive", option_to_yojson boxed_boolean_to_yojson x.interactive);
      ("dockerSecurityOptions", option_to_yojson string_list_to_yojson x.docker_security_options);
      ("extraHosts", option_to_yojson host_entry_list_to_yojson x.extra_hosts);
      ("dnsSearchDomains", option_to_yojson string_list_to_yojson x.dns_search_domains);
      ("dnsServers", option_to_yojson string_list_to_yojson x.dns_servers);
      ("readonlyRootFilesystem", option_to_yojson boxed_boolean_to_yojson x.readonly_root_filesystem);
      ("privileged", option_to_yojson boxed_boolean_to_yojson x.privileged);
      ("disableNetworking", option_to_yojson boxed_boolean_to_yojson x.disable_networking);
      ("workingDirectory", option_to_yojson string__to_yojson x.working_directory);
      ("user", option_to_yojson string__to_yojson x.user);
      ("hostname", option_to_yojson string__to_yojson x.hostname);
      ("versionConsistency", option_to_yojson version_consistency_to_yojson x.version_consistency);
      ("stopTimeout", option_to_yojson boxed_integer_to_yojson x.stop_timeout);
      ("startTimeout", option_to_yojson boxed_integer_to_yojson x.start_timeout);
      ("dependsOn", option_to_yojson container_dependencies_to_yojson x.depends_on);
      ("secrets", option_to_yojson secret_list_to_yojson x.secrets);
      ("linuxParameters", option_to_yojson linux_parameters_to_yojson x.linux_parameters);
      ("volumesFrom", option_to_yojson volume_from_list_to_yojson x.volumes_from);
      ("mountPoints", option_to_yojson mount_point_list_to_yojson x.mount_points);
      ("environmentFiles", option_to_yojson environment_files_to_yojson x.environment_files);
      ("environment", option_to_yojson environment_variables_to_yojson x.environment);
      ("command", option_to_yojson string_list_to_yojson x.command);
      ("entryPoint", option_to_yojson string_list_to_yojson x.entry_point);
      ("restartPolicy", option_to_yojson container_restart_policy_to_yojson x.restart_policy);
      ("essential", option_to_yojson boxed_boolean_to_yojson x.essential);
      ("portMappings", option_to_yojson port_mapping_list_to_yojson x.port_mappings);
      ("links", option_to_yojson string_list_to_yojson x.links);
      ("memoryReservation", option_to_yojson boxed_integer_to_yojson x.memory_reservation);
      ("memory", option_to_yojson boxed_integer_to_yojson x.memory);
      ("cpu", option_to_yojson integer_to_yojson x.cpu);
      ( "repositoryCredentials",
        option_to_yojson repository_credentials_to_yojson x.repository_credentials );
      ("image", option_to_yojson string__to_yojson x.image);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let container_definitions_to_yojson tree = list_to_yojson container_definition_to_yojson tree

let network_mode_to_yojson (x : network_mode) =
  match x with
  | NONE -> `String "none"
  | AWSVPC -> `String "awsvpc"
  | HOST -> `String "host"
  | BRIDGE -> `String "bridge"

let requires_attributes_to_yojson tree = list_to_yojson attribute_to_yojson tree

let compatibility_to_yojson (x : compatibility) =
  match x with
  | MANAGED_INSTANCES -> `String "MANAGED_INSTANCES"
  | EXTERNAL -> `String "EXTERNAL"
  | FARGATE -> `String "FARGATE"
  | EC2 -> `String "EC2"

let compatibility_list_to_yojson tree = list_to_yojson compatibility_to_yojson tree

let cpu_architecture_to_yojson (x : cpu_architecture) =
  match x with ARM64 -> `String "ARM64" | X86_64 -> `String "X86_64"

let os_family_to_yojson (x : os_family) =
  match x with
  | LINUX -> `String "LINUX"
  | WINDOWS_SERVER_20H2_CORE -> `String "WINDOWS_SERVER_20H2_CORE"
  | WINDOWS_SERVER_2025_FULL -> `String "WINDOWS_SERVER_2025_FULL"
  | WINDOWS_SERVER_2025_CORE -> `String "WINDOWS_SERVER_2025_CORE"
  | WINDOWS_SERVER_2022_FULL -> `String "WINDOWS_SERVER_2022_FULL"
  | WINDOWS_SERVER_2022_CORE -> `String "WINDOWS_SERVER_2022_CORE"
  | WINDOWS_SERVER_2004_CORE -> `String "WINDOWS_SERVER_2004_CORE"
  | WINDOWS_SERVER_2016_FULL -> `String "WINDOWS_SERVER_2016_FULL"
  | WINDOWS_SERVER_2019_CORE -> `String "WINDOWS_SERVER_2019_CORE"
  | WINDOWS_SERVER_2019_FULL -> `String "WINDOWS_SERVER_2019_FULL"

let runtime_platform_to_yojson (x : runtime_platform) =
  assoc_to_yojson
    [
      ("operatingSystemFamily", option_to_yojson os_family_to_yojson x.operating_system_family);
      ("cpuArchitecture", option_to_yojson cpu_architecture_to_yojson x.cpu_architecture);
    ]

let pid_mode_to_yojson (x : pid_mode) =
  match x with TASK -> `String "task" | HOST -> `String "host"

let ipc_mode_to_yojson (x : ipc_mode) =
  match x with NONE -> `String "none" | TASK -> `String "task" | HOST -> `String "host"

let proxy_configuration_type_to_yojson (x : proxy_configuration_type) =
  match x with APPMESH -> `String "APPMESH"

let proxy_configuration_properties_to_yojson tree = list_to_yojson key_value_pair_to_yojson tree

let proxy_configuration_to_yojson (x : proxy_configuration) =
  assoc_to_yojson
    [
      ("properties", option_to_yojson proxy_configuration_properties_to_yojson x.properties);
      ("containerName", Some (string__to_yojson x.container_name));
      ("type", option_to_yojson proxy_configuration_type_to_yojson x.type_);
    ]

let task_definition_to_yojson (x : task_definition) =
  assoc_to_yojson
    [
      ("enableFaultInjection", option_to_yojson boxed_boolean_to_yojson x.enable_fault_injection);
      ("ephemeralStorage", option_to_yojson ephemeral_storage_to_yojson x.ephemeral_storage);
      ("registeredBy", option_to_yojson string__to_yojson x.registered_by);
      ("deleteRequestedAt", option_to_yojson timestamp_to_yojson x.delete_requested_at);
      ("deregisteredAt", option_to_yojson timestamp_to_yojson x.deregistered_at);
      ("registeredAt", option_to_yojson timestamp_to_yojson x.registered_at);
      ("proxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ("ipcMode", option_to_yojson ipc_mode_to_yojson x.ipc_mode);
      ("pidMode", option_to_yojson pid_mode_to_yojson x.pid_mode);
      ( "inferenceAccelerators",
        option_to_yojson inference_accelerators_to_yojson x.inference_accelerators );
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ( "requiresCompatibilities",
        option_to_yojson compatibility_list_to_yojson x.requires_compatibilities );
      ("runtimePlatform", option_to_yojson runtime_platform_to_yojson x.runtime_platform);
      ("compatibilities", option_to_yojson compatibility_list_to_yojson x.compatibilities);
      ( "placementConstraints",
        option_to_yojson task_definition_placement_constraints_to_yojson x.placement_constraints );
      ("requiresAttributes", option_to_yojson requires_attributes_to_yojson x.requires_attributes);
      ("status", option_to_yojson task_definition_status_to_yojson x.status);
      ("volumes", option_to_yojson volume_list_to_yojson x.volumes);
      ("revision", option_to_yojson integer_to_yojson x.revision);
      ("networkMode", option_to_yojson network_mode_to_yojson x.network_mode);
      ("executionRoleArn", option_to_yojson string__to_yojson x.execution_role_arn);
      ("taskRoleArn", option_to_yojson string__to_yojson x.task_role_arn);
      ("family", option_to_yojson string__to_yojson x.family);
      ( "containerDefinitions",
        option_to_yojson container_definitions_to_yojson x.container_definitions );
      ("taskDefinitionArn", option_to_yojson string__to_yojson x.task_definition_arn);
    ]

let task_definition_list_to_yojson tree = list_to_yojson task_definition_to_yojson tree

let task_definition_field_to_yojson (x : task_definition_field) =
  match x with TAGS -> `String "TAGS"

let task_definition_field_list_to_yojson tree = list_to_yojson task_definition_field_to_yojson tree

let task_definition_family_status_to_yojson (x : task_definition_family_status) =
  match x with ALL -> `String "ALL" | INACTIVE -> `String "INACTIVE" | ACTIVE -> `String "ACTIVE"

let target_not_found_exception_to_yojson (x : target_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let target_not_connected_exception_to_yojson (x : target_not_connected_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (tags_to_yojson x.tags));
      ("resourceArn", Some (string__to_yojson x.resource_arn));
    ]

let submit_task_state_change_response_to_yojson (x : submit_task_state_change_response) =
  assoc_to_yojson [ ("acknowledgment", option_to_yojson string__to_yojson x.acknowledgment) ]

let container_state_change_to_yojson (x : container_state_change) =
  assoc_to_yojson
    [
      ("status", option_to_yojson string__to_yojson x.status);
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("networkBindings", option_to_yojson network_bindings_to_yojson x.network_bindings);
      ("exitCode", option_to_yojson boxed_integer_to_yojson x.exit_code);
      ("runtimeId", option_to_yojson string__to_yojson x.runtime_id);
      ("imageDigest", option_to_yojson string__to_yojson x.image_digest);
      ("containerName", option_to_yojson string__to_yojson x.container_name);
    ]

let container_state_changes_to_yojson tree = list_to_yojson container_state_change_to_yojson tree

let attachment_state_change_to_yojson (x : attachment_state_change) =
  assoc_to_yojson
    [
      ("status", Some (string__to_yojson x.status));
      ("attachmentArn", Some (string__to_yojson x.attachment_arn));
    ]

let attachment_state_changes_to_yojson tree = list_to_yojson attachment_state_change_to_yojson tree

let managed_agent_state_change_to_yojson (x : managed_agent_state_change) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("status", Some (string__to_yojson x.status));
      ("managedAgentName", Some (managed_agent_name_to_yojson x.managed_agent_name));
      ("containerName", Some (string__to_yojson x.container_name));
    ]

let managed_agent_state_changes_to_yojson tree =
  list_to_yojson managed_agent_state_change_to_yojson tree

let submit_task_state_change_request_to_yojson (x : submit_task_state_change_request) =
  assoc_to_yojson
    [
      ("executionStoppedAt", option_to_yojson timestamp_to_yojson x.execution_stopped_at);
      ("pullStoppedAt", option_to_yojson timestamp_to_yojson x.pull_stopped_at);
      ("pullStartedAt", option_to_yojson timestamp_to_yojson x.pull_started_at);
      ("managedAgents", option_to_yojson managed_agent_state_changes_to_yojson x.managed_agents);
      ("attachments", option_to_yojson attachment_state_changes_to_yojson x.attachments);
      ("containers", option_to_yojson container_state_changes_to_yojson x.containers);
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("status", option_to_yojson string__to_yojson x.status);
      ("task", option_to_yojson string__to_yojson x.task);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let submit_container_state_change_response_to_yojson (x : submit_container_state_change_response) =
  assoc_to_yojson [ ("acknowledgment", option_to_yojson string__to_yojson x.acknowledgment) ]

let submit_container_state_change_request_to_yojson (x : submit_container_state_change_request) =
  assoc_to_yojson
    [
      ("networkBindings", option_to_yojson network_bindings_to_yojson x.network_bindings);
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("exitCode", option_to_yojson boxed_integer_to_yojson x.exit_code);
      ("status", option_to_yojson string__to_yojson x.status);
      ("runtimeId", option_to_yojson string__to_yojson x.runtime_id);
      ("containerName", option_to_yojson string__to_yojson x.container_name);
      ("task", option_to_yojson string__to_yojson x.task);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let submit_attachment_state_changes_response_to_yojson
    (x : submit_attachment_state_changes_response) =
  assoc_to_yojson [ ("acknowledgment", option_to_yojson string__to_yojson x.acknowledgment) ]

let submit_attachment_state_changes_request_to_yojson (x : submit_attachment_state_changes_request)
    =
  assoc_to_yojson
    [
      ("attachments", Some (attachment_state_changes_to_yojson x.attachments));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let stop_task_response_to_yojson (x : stop_task_response) =
  assoc_to_yojson [ ("task", option_to_yojson task_to_yojson x.task) ]

let stop_task_request_to_yojson (x : stop_task_request) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("task", Some (string__to_yojson x.task));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let stop_service_deployment_stop_type_to_yojson (x : stop_service_deployment_stop_type) =
  match x with ROLLBACK -> `String "ROLLBACK" | ABORT -> `String "ABORT"

let stop_service_deployment_response_to_yojson (x : stop_service_deployment_response) =
  assoc_to_yojson
    [ ("serviceDeploymentArn", option_to_yojson string__to_yojson x.service_deployment_arn) ]

let stop_service_deployment_request_to_yojson (x : stop_service_deployment_request) =
  assoc_to_yojson
    [
      ("stopType", option_to_yojson stop_service_deployment_stop_type_to_yojson x.stop_type);
      ("serviceDeploymentArn", Some (string__to_yojson x.service_deployment_arn));
    ]

let service_deployment_not_found_exception_to_yojson (x : service_deployment_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let resource_ids_to_yojson tree = list_to_yojson string__to_yojson tree

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("resourceIds", option_to_yojson resource_ids_to_yojson x.resource_ids);
    ]

let start_task_response_to_yojson (x : start_task_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("tasks", option_to_yojson tasks_to_yojson x.tasks);
    ]

let start_task_request_to_yojson (x : start_task_request) =
  assoc_to_yojson
    [
      ( "volumeConfigurations",
        option_to_yojson task_volume_configurations_to_yojson x.volume_configurations );
      ("taskDefinition", Some (string__to_yojson x.task_definition));
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("startedBy", option_to_yojson string__to_yojson x.started_by);
      ("referenceId", option_to_yojson string__to_yojson x.reference_id);
      ("propagateTags", option_to_yojson propagate_tags_to_yojson x.propagate_tags);
      ("overrides", option_to_yojson task_override_to_yojson x.overrides);
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("group", option_to_yojson string__to_yojson x.group);
      ("enableExecuteCommand", option_to_yojson boolean__to_yojson x.enable_execute_command);
      ("enableECSManagedTags", option_to_yojson boolean__to_yojson x.enable_ecs_managed_tags);
      ("containerInstances", Some (string_list_to_yojson x.container_instances));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let sort_order_to_yojson (x : sort_order) =
  match x with DESC -> `String "DESC" | ASC -> `String "ASC"

let setting_name_to_yojson (x : setting_name) =
  match x with
  | FARGATE_EVENT_WINDOWS -> `String "fargateEventWindows"
  | DEFAULT_LOG_DRIVER_MODE -> `String "defaultLogDriverMode"
  | GUARD_DUTY_ACTIVATE -> `String "guardDutyActivate"
  | FARGATE_TASK_RETIREMENT_WAIT_PERIOD -> `String "fargateTaskRetirementWaitPeriod"
  | TAG_RESOURCE_AUTHORIZATION -> `String "tagResourceAuthorization"
  | FARGATE_FIPS_MODE -> `String "fargateFIPSMode"
  | CONTAINER_INSIGHTS -> `String "containerInsights"
  | AWSVPC_TRUNKING -> `String "awsvpcTrunking"
  | CONTAINER_INSTANCE_LONG_ARN_FORMAT -> `String "containerInstanceLongArnFormat"
  | TASK_LONG_ARN_FORMAT -> `String "taskLongArnFormat"
  | SERVICE_LONG_ARN_FORMAT -> `String "serviceLongArnFormat"

let setting_type_to_yojson (x : setting_type) =
  match x with AWS_MANAGED -> `String "aws_managed" | USER -> `String "user"

let setting_to_yojson (x : setting) =
  assoc_to_yojson
    [
      ("type", option_to_yojson setting_type_to_yojson x.type_);
      ("principalArn", option_to_yojson string__to_yojson x.principal_arn);
      ("value", option_to_yojson string__to_yojson x.value);
      ("name", option_to_yojson setting_name_to_yojson x.name);
    ]

let settings_to_yojson tree = list_to_yojson setting_to_yojson tree
let sensitive_string_to_yojson = string_to_yojson

let session_to_yojson (x : session) =
  assoc_to_yojson
    [
      ("tokenValue", option_to_yojson sensitive_string_to_yojson x.token_value);
      ("streamUrl", option_to_yojson string__to_yojson x.stream_url);
      ("sessionId", option_to_yojson string__to_yojson x.session_id);
    ]

let services_to_yojson tree = list_to_yojson service_to_yojson tree

let service_revision_summary_to_yojson (x : service_revision_summary) =
  assoc_to_yojson
    [
      ( "requestedProductionTrafficWeight",
        option_to_yojson double_to_yojson x.requested_production_traffic_weight );
      ( "requestedTestTrafficWeight",
        option_to_yojson double_to_yojson x.requested_test_traffic_weight );
      ("pendingTaskCount", option_to_yojson integer_to_yojson x.pending_task_count);
      ("runningTaskCount", option_to_yojson integer_to_yojson x.running_task_count);
      ("requestedTaskCount", option_to_yojson integer_to_yojson x.requested_task_count);
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let service_revisions_summary_list_to_yojson tree =
  list_to_yojson service_revision_summary_to_yojson tree

let container_image_to_yojson (x : container_image) =
  assoc_to_yojson
    [
      ("image", option_to_yojson string__to_yojson x.image);
      ("imageDigest", option_to_yojson string__to_yojson x.image_digest);
      ("containerName", option_to_yojson string__to_yojson x.container_name);
    ]

let container_images_to_yojson tree = list_to_yojson container_image_to_yojson tree

let service_revision_load_balancer_to_yojson (x : service_revision_load_balancer) =
  assoc_to_yojson
    [
      ("productionListenerRule", option_to_yojson string__to_yojson x.production_listener_rule);
      ("targetGroupArn", option_to_yojson string__to_yojson x.target_group_arn);
    ]

let service_revision_load_balancers_to_yojson tree =
  list_to_yojson service_revision_load_balancer_to_yojson tree

let resolved_configuration_to_yojson (x : resolved_configuration) =
  assoc_to_yojson
    [
      ("loadBalancers", option_to_yojson service_revision_load_balancers_to_yojson x.load_balancers);
    ]

let managed_resource_status_to_yojson (x : managed_resource_status) =
  match x with
  | FAILED -> `String "FAILED"
  | DELETED -> `String "DELETED"
  | DEPROVISIONING -> `String "DEPROVISIONING"
  | ACTIVE -> `String "ACTIVE"
  | PROVISIONING -> `String "PROVISIONING"

let managed_load_balancer_to_yojson (x : managed_load_balancer) =
  assoc_to_yojson
    [
      ("securityGroupIds", option_to_yojson string_list_to_yojson x.security_group_ids);
      ("subnetIds", option_to_yojson string_list_to_yojson x.subnet_ids);
      ("scheme", Some (string__to_yojson x.scheme));
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let managed_security_group_to_yojson (x : managed_security_group) =
  assoc_to_yojson
    [
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let managed_security_groups_to_yojson tree = list_to_yojson managed_security_group_to_yojson tree

let managed_certificate_to_yojson (x : managed_certificate) =
  assoc_to_yojson
    [
      ("domainName", Some (string__to_yojson x.domain_name));
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let managed_listener_to_yojson (x : managed_listener) =
  assoc_to_yojson
    [
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let managed_listener_rule_to_yojson (x : managed_listener_rule) =
  assoc_to_yojson
    [
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let managed_target_group_to_yojson (x : managed_target_group) =
  assoc_to_yojson
    [
      ("port", Some (integer_to_yojson x.port));
      ("healthCheckPort", Some (integer_to_yojson x.health_check_port));
      ("healthCheckPath", Some (string__to_yojson x.health_check_path));
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let managed_target_groups_to_yojson tree = list_to_yojson managed_target_group_to_yojson tree

let managed_ingress_path_to_yojson (x : managed_ingress_path) =
  assoc_to_yojson
    [
      ("targetGroups", option_to_yojson managed_target_groups_to_yojson x.target_groups);
      ("rule", option_to_yojson managed_listener_rule_to_yojson x.rule);
      ("listener", option_to_yojson managed_listener_to_yojson x.listener);
      ("certificate", option_to_yojson managed_certificate_to_yojson x.certificate);
      ( "loadBalancerSecurityGroups",
        option_to_yojson managed_security_groups_to_yojson x.load_balancer_security_groups );
      ("loadBalancer", option_to_yojson managed_load_balancer_to_yojson x.load_balancer);
      ("endpoint", Some (string__to_yojson x.endpoint));
      ("accessType", Some (access_type_to_yojson x.access_type));
    ]

let managed_ingress_paths_to_yojson tree = list_to_yojson managed_ingress_path_to_yojson tree

let managed_scalable_target_to_yojson (x : managed_scalable_target) =
  assoc_to_yojson
    [
      ("maxCapacity", Some (integer_to_yojson x.max_capacity));
      ("minCapacity", Some (integer_to_yojson x.min_capacity));
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let managed_application_auto_scaling_policy_to_yojson (x : managed_application_auto_scaling_policy)
    =
  assoc_to_yojson
    [
      ("metric", Some (string__to_yojson x.metric));
      ("targetValue", Some (double_to_yojson x.target_value));
      ("policyType", Some (string__to_yojson x.policy_type));
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let managed_application_auto_scaling_policies_to_yojson tree =
  list_to_yojson managed_application_auto_scaling_policy_to_yojson tree

let managed_auto_scaling_to_yojson (x : managed_auto_scaling) =
  assoc_to_yojson
    [
      ( "applicationAutoScalingPolicies",
        option_to_yojson managed_application_auto_scaling_policies_to_yojson
          x.application_auto_scaling_policies );
      ("scalableTarget", option_to_yojson managed_scalable_target_to_yojson x.scalable_target);
    ]

let managed_metric_alarm_to_yojson (x : managed_metric_alarm) =
  assoc_to_yojson
    [
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let managed_metric_alarms_to_yojson tree = list_to_yojson managed_metric_alarm_to_yojson tree

let managed_log_group_to_yojson (x : managed_log_group) =
  assoc_to_yojson
    [
      ("logGroupName", Some (string__to_yojson x.log_group_name));
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("status", Some (managed_resource_status_to_yojson x.status));
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let managed_log_groups_to_yojson tree = list_to_yojson managed_log_group_to_yojson tree

let ecs_managed_resources_to_yojson (x : ecs_managed_resources) =
  assoc_to_yojson
    [
      ("logGroups", option_to_yojson managed_log_groups_to_yojson x.log_groups);
      ( "serviceSecurityGroups",
        option_to_yojson managed_security_groups_to_yojson x.service_security_groups );
      ("metricAlarms", option_to_yojson managed_metric_alarms_to_yojson x.metric_alarms);
      ("autoScaling", option_to_yojson managed_auto_scaling_to_yojson x.auto_scaling);
      ("ingressPaths", option_to_yojson managed_ingress_paths_to_yojson x.ingress_paths);
    ]

let service_revision_to_yojson (x : service_revision) =
  assoc_to_yojson
    [
      ("monitoring", option_to_yojson monitoring_configuration_to_yojson x.monitoring);
      ( "ecsManagedResources",
        option_to_yojson ecs_managed_resources_to_yojson x.ecs_managed_resources );
      ( "resolvedConfiguration",
        option_to_yojson resolved_configuration_to_yojson x.resolved_configuration );
      ( "vpcLatticeConfigurations",
        option_to_yojson vpc_lattice_configurations_to_yojson x.vpc_lattice_configurations );
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ( "fargateEphemeralStorage",
        option_to_yojson deployment_ephemeral_storage_to_yojson x.fargate_ephemeral_storage );
      ( "volumeConfigurations",
        option_to_yojson service_volume_configurations_to_yojson x.volume_configurations );
      ( "serviceConnectConfiguration",
        option_to_yojson service_connect_configuration_to_yojson x.service_connect_configuration );
      ("guardDutyEnabled", option_to_yojson boolean__to_yojson x.guard_duty_enabled);
      ("containerImages", option_to_yojson container_images_to_yojson x.container_images);
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("serviceRegistries", option_to_yojson service_registries_to_yojson x.service_registries);
      ("loadBalancers", option_to_yojson load_balancers_to_yojson x.load_balancers);
      ("platformFamily", option_to_yojson string__to_yojson x.platform_family);
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ( "capacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
      ("taskDefinition", option_to_yojson string__to_yojson x.task_definition);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("serviceArn", option_to_yojson string__to_yojson x.service_arn);
      ("serviceRevisionArn", option_to_yojson string__to_yojson x.service_revision_arn);
    ]

let service_revisions_to_yojson tree = list_to_yojson service_revision_to_yojson tree
let service_field_to_yojson (x : service_field) = match x with TAGS -> `String "TAGS"
let service_field_list_to_yojson tree = list_to_yojson service_field_to_yojson tree

let service_deployment_status_to_yojson (x : service_deployment_status) =
  match x with
  | ROLLBACK_FAILED -> `String "ROLLBACK_FAILED"
  | ROLLBACK_SUCCESSFUL -> `String "ROLLBACK_SUCCESSFUL"
  | ROLLBACK_IN_PROGRESS -> `String "ROLLBACK_IN_PROGRESS"
  | ROLLBACK_REQUESTED -> `String "ROLLBACK_REQUESTED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | STOP_REQUESTED -> `String "STOP_REQUESTED"
  | STOPPED -> `String "STOPPED"
  | SUCCESSFUL -> `String "SUCCESSFUL"
  | PENDING -> `String "PENDING"

let service_deployment_brief_to_yojson (x : service_deployment_brief) =
  assoc_to_yojson
    [
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("status", option_to_yojson service_deployment_status_to_yojson x.status);
      ("targetServiceRevisionArn", option_to_yojson string__to_yojson x.target_service_revision_arn);
      ("finishedAt", option_to_yojson timestamp_to_yojson x.finished_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("startedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("serviceArn", option_to_yojson string__to_yojson x.service_arn);
      ("serviceDeploymentArn", option_to_yojson string__to_yojson x.service_deployment_arn);
    ]

let service_deployments_brief_to_yojson tree =
  list_to_yojson service_deployment_brief_to_yojson tree

let service_deployment_lifecycle_stage_to_yojson (x : service_deployment_lifecycle_stage) =
  match x with
  | CLEAN_UP -> `String "CLEAN_UP"
  | BAKE_TIME -> `String "BAKE_TIME"
  | POST_PRODUCTION_TRAFFIC_SHIFT -> `String "POST_PRODUCTION_TRAFFIC_SHIFT"
  | PRODUCTION_TRAFFIC_SHIFT -> `String "PRODUCTION_TRAFFIC_SHIFT"
  | POST_TEST_TRAFFIC_SHIFT -> `String "POST_TEST_TRAFFIC_SHIFT"
  | TEST_TRAFFIC_SHIFT -> `String "TEST_TRAFFIC_SHIFT"
  | POST_SCALE_UP -> `String "POST_SCALE_UP"
  | SCALE_UP -> `String "SCALE_UP"
  | PRE_SCALE_UP -> `String "PRE_SCALE_UP"
  | RECONCILE_SERVICE -> `String "RECONCILE_SERVICE"

let deployment_lifecycle_hook_status_to_yojson (x : deployment_lifecycle_hook_status) =
  match x with
  | TIMED_OUT -> `String "TIMED_OUT"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | AWAITING_ACTION -> `String "AWAITING_ACTION"

let deployment_lifecycle_hook_detail_to_yojson (x : deployment_lifecycle_hook_detail) =
  assoc_to_yojson
    [
      ("timeoutAction", option_to_yojson deployment_lifecycle_hook_action_to_yojson x.timeout_action);
      ("expiresAt", option_to_yojson timestamp_to_yojson x.expires_at);
      ("status", option_to_yojson deployment_lifecycle_hook_status_to_yojson x.status);
      ("targetArn", option_to_yojson string__to_yojson x.target_arn);
      ("targetType", option_to_yojson deployment_lifecycle_hook_target_type_to_yojson x.target_type);
      ("hookId", option_to_yojson string__to_yojson x.hook_id);
    ]

let deployment_lifecycle_hook_detail_list_to_yojson tree =
  list_to_yojson deployment_lifecycle_hook_detail_to_yojson tree

let rollback_to_yojson (x : rollback) =
  assoc_to_yojson
    [
      ("serviceRevisionArn", option_to_yojson string__to_yojson x.service_revision_arn);
      ("startedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("reason", option_to_yojson string__to_yojson x.reason);
    ]

let service_deployment_rollback_monitors_status_to_yojson
    (x : service_deployment_rollback_monitors_status) =
  match x with
  | DISABLED -> `String "DISABLED"
  | MONITORING_COMPLETE -> `String "MONITORING_COMPLETE"
  | MONITORING -> `String "MONITORING"
  | TRIGGERED -> `String "TRIGGERED"

let service_deployment_circuit_breaker_to_yojson (x : service_deployment_circuit_breaker) =
  assoc_to_yojson
    [
      ("threshold", option_to_yojson integer_to_yojson x.threshold);
      ("failureCount", option_to_yojson integer_to_yojson x.failure_count);
      ("status", option_to_yojson service_deployment_rollback_monitors_status_to_yojson x.status);
    ]

let service_deployment_alarms_to_yojson (x : service_deployment_alarms) =
  assoc_to_yojson
    [
      ("triggeredAlarmNames", option_to_yojson string_list_to_yojson x.triggered_alarm_names);
      ("alarmNames", option_to_yojson string_list_to_yojson x.alarm_names);
      ("status", option_to_yojson service_deployment_rollback_monitors_status_to_yojson x.status);
    ]

let service_deployment_to_yojson (x : service_deployment) =
  assoc_to_yojson
    [
      ("alarms", option_to_yojson service_deployment_alarms_to_yojson x.alarms);
      ( "deploymentCircuitBreaker",
        option_to_yojson service_deployment_circuit_breaker_to_yojson x.deployment_circuit_breaker
      );
      ("rollback", option_to_yojson rollback_to_yojson x.rollback);
      ( "deploymentConfiguration",
        option_to_yojson deployment_configuration_to_yojson x.deployment_configuration );
      ( "lifecycleHookDetails",
        option_to_yojson deployment_lifecycle_hook_detail_list_to_yojson x.lifecycle_hook_details );
      ( "lifecycleStage",
        option_to_yojson service_deployment_lifecycle_stage_to_yojson x.lifecycle_stage );
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("status", option_to_yojson service_deployment_status_to_yojson x.status);
      ( "targetServiceRevision",
        option_to_yojson service_revision_summary_to_yojson x.target_service_revision );
      ( "sourceServiceRevisions",
        option_to_yojson service_revisions_summary_list_to_yojson x.source_service_revisions );
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("stoppedAt", option_to_yojson timestamp_to_yojson x.stopped_at);
      ("finishedAt", option_to_yojson timestamp_to_yojson x.finished_at);
      ("startedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("serviceArn", option_to_yojson string__to_yojson x.service_arn);
      ("serviceDeploymentArn", option_to_yojson string__to_yojson x.service_deployment_arn);
    ]

let service_deployments_to_yojson tree = list_to_yojson service_deployment_to_yojson tree

let service_deployment_status_list_to_yojson tree =
  list_to_yojson service_deployment_status_to_yojson tree

let run_task_response_to_yojson (x : run_task_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("tasks", option_to_yojson tasks_to_yojson x.tasks);
    ]

let run_task_request_to_yojson (x : run_task_request) =
  assoc_to_yojson
    [
      ( "volumeConfigurations",
        option_to_yojson task_volume_configurations_to_yojson x.volume_configurations );
      ( "clientToken",
        Some (string__to_yojson (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ())))
      );
      ("taskDefinition", Some (string__to_yojson x.task_definition));
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("startedBy", option_to_yojson string__to_yojson x.started_by);
      ("referenceId", option_to_yojson string__to_yojson x.reference_id);
      ("propagateTags", option_to_yojson propagate_tags_to_yojson x.propagate_tags);
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("placementStrategy", option_to_yojson placement_strategies_to_yojson x.placement_strategy);
      ( "placementConstraints",
        option_to_yojson placement_constraints_to_yojson x.placement_constraints );
      ("overrides", option_to_yojson task_override_to_yojson x.overrides);
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ("group", option_to_yojson string__to_yojson x.group);
      ("enableExecuteCommand", option_to_yojson boolean__to_yojson x.enable_execute_command);
      ("enableECSManagedTags", option_to_yojson boolean__to_yojson x.enable_ecs_managed_tags);
      ("count", option_to_yojson boxed_integer_to_yojson x.count);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ( "capacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
    ]

let blocked_exception_to_yojson (x : blocked_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let register_task_definition_response_to_yojson (x : register_task_definition_response) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("taskDefinition", option_to_yojson task_definition_to_yojson x.task_definition);
    ]

let register_task_definition_request_to_yojson (x : register_task_definition_request) =
  assoc_to_yojson
    [
      ("enableFaultInjection", option_to_yojson boxed_boolean_to_yojson x.enable_fault_injection);
      ("runtimePlatform", option_to_yojson runtime_platform_to_yojson x.runtime_platform);
      ("ephemeralStorage", option_to_yojson ephemeral_storage_to_yojson x.ephemeral_storage);
      ( "inferenceAccelerators",
        option_to_yojson inference_accelerators_to_yojson x.inference_accelerators );
      ("proxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
      ("ipcMode", option_to_yojson ipc_mode_to_yojson x.ipc_mode);
      ("pidMode", option_to_yojson pid_mode_to_yojson x.pid_mode);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ( "requiresCompatibilities",
        option_to_yojson compatibility_list_to_yojson x.requires_compatibilities );
      ( "placementConstraints",
        option_to_yojson task_definition_placement_constraints_to_yojson x.placement_constraints );
      ("volumes", option_to_yojson volume_list_to_yojson x.volumes);
      ("containerDefinitions", Some (container_definitions_to_yojson x.container_definitions));
      ("networkMode", option_to_yojson network_mode_to_yojson x.network_mode);
      ("executionRoleArn", option_to_yojson string__to_yojson x.execution_role_arn);
      ("taskRoleArn", option_to_yojson string__to_yojson x.task_role_arn);
      ("family", Some (string__to_yojson x.family));
    ]

let register_daemon_task_definition_response_to_yojson
    (x : register_daemon_task_definition_response) =
  assoc_to_yojson
    [ ("daemonTaskDefinitionArn", option_to_yojson string__to_yojson x.daemon_task_definition_arn) ]

let daemon_linux_parameters_to_yojson (x : daemon_linux_parameters) =
  assoc_to_yojson
    [
      ("tmpfs", option_to_yojson tmpfs_list_to_yojson x.tmpfs);
      ("initProcessEnabled", option_to_yojson boxed_boolean_to_yojson x.init_process_enabled);
      ("devices", option_to_yojson devices_list_to_yojson x.devices);
      ("capabilities", option_to_yojson kernel_capabilities_to_yojson x.capabilities);
    ]

let daemon_container_definition_to_yojson (x : daemon_container_definition) =
  assoc_to_yojson
    [
      ("restartPolicy", option_to_yojson container_restart_policy_to_yojson x.restart_policy);
      ("pseudoTerminal", option_to_yojson boxed_boolean_to_yojson x.pseudo_terminal);
      ("interactive", option_to_yojson boxed_boolean_to_yojson x.interactive);
      ("systemControls", option_to_yojson system_controls_to_yojson x.system_controls);
      ("stopTimeout", option_to_yojson boxed_integer_to_yojson x.stop_timeout);
      ("startTimeout", option_to_yojson boxed_integer_to_yojson x.start_timeout);
      ("dependsOn", option_to_yojson container_dependencies_to_yojson x.depends_on);
      ("linuxParameters", option_to_yojson daemon_linux_parameters_to_yojson x.linux_parameters);
      ("ulimits", option_to_yojson ulimit_list_to_yojson x.ulimits);
      ("user", option_to_yojson string__to_yojson x.user);
      ("privileged", option_to_yojson boxed_boolean_to_yojson x.privileged);
      ( "firelensConfiguration",
        option_to_yojson firelens_configuration_to_yojson x.firelens_configuration );
      ("logConfiguration", option_to_yojson log_configuration_to_yojson x.log_configuration);
      ("mountPoints", option_to_yojson mount_point_list_to_yojson x.mount_points);
      ("readonlyRootFilesystem", option_to_yojson boxed_boolean_to_yojson x.readonly_root_filesystem);
      ("secrets", option_to_yojson secret_list_to_yojson x.secrets);
      ("environment", option_to_yojson environment_variables_to_yojson x.environment);
      ("environmentFiles", option_to_yojson environment_files_to_yojson x.environment_files);
      ("workingDirectory", option_to_yojson string__to_yojson x.working_directory);
      ("command", option_to_yojson string_list_to_yojson x.command);
      ("entryPoint", option_to_yojson string_list_to_yojson x.entry_point);
      ("essential", option_to_yojson boxed_boolean_to_yojson x.essential);
      ("cpu", option_to_yojson integer_to_yojson x.cpu);
      ("healthCheck", option_to_yojson health_check_to_yojson x.health_check);
      ( "repositoryCredentials",
        option_to_yojson repository_credentials_to_yojson x.repository_credentials );
      ("memoryReservation", option_to_yojson boxed_integer_to_yojson x.memory_reservation);
      ("memory", option_to_yojson boxed_integer_to_yojson x.memory);
      ("image", Some (string__to_yojson x.image));
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let daemon_container_definition_list_to_yojson tree =
  list_to_yojson daemon_container_definition_to_yojson tree

let daemon_volume_to_yojson (x : daemon_volume) =
  assoc_to_yojson
    [
      ("host", option_to_yojson host_volume_properties_to_yojson x.host);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let daemon_volume_list_to_yojson tree = list_to_yojson daemon_volume_to_yojson tree

let daemon_pid_mode_to_yojson (x : daemon_pid_mode) =
  match x with SHARED -> `String "shared" | NONE -> `String "none"

let daemon_ipc_mode_to_yojson (x : daemon_ipc_mode) =
  match x with SHARED -> `String "shared" | NONE -> `String "none"

let register_daemon_task_definition_request_to_yojson (x : register_daemon_task_definition_request)
    =
  assoc_to_yojson
    [
      ("ipcMode", option_to_yojson daemon_ipc_mode_to_yojson x.ipc_mode);
      ("pidMode", option_to_yojson daemon_pid_mode_to_yojson x.pid_mode);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("volumes", option_to_yojson daemon_volume_list_to_yojson x.volumes);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ( "containerDefinitions",
        Some (daemon_container_definition_list_to_yojson x.container_definitions) );
      ("executionRoleArn", option_to_yojson string__to_yojson x.execution_role_arn);
      ("taskRoleArn", option_to_yojson string__to_yojson x.task_role_arn);
      ("family", Some (string__to_yojson x.family));
    ]

let register_container_instance_response_to_yojson (x : register_container_instance_response) =
  assoc_to_yojson
    [ ("containerInstance", option_to_yojson container_instance_to_yojson x.container_instance) ]

let platform_device_type_to_yojson (x : platform_device_type) =
  match x with NEURON_DEVICE -> `String "NEURON_DEVICE" | GPU -> `String "GPU"

let platform_device_to_yojson (x : platform_device) =
  assoc_to_yojson
    [
      ("type", Some (platform_device_type_to_yojson x.type_)); ("id", Some (string__to_yojson x.id));
    ]

let platform_devices_to_yojson tree = list_to_yojson platform_device_to_yojson tree

let register_container_instance_request_to_yojson (x : register_container_instance_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("platformDevices", option_to_yojson platform_devices_to_yojson x.platform_devices);
      ("attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("containerInstanceArn", option_to_yojson string__to_yojson x.container_instance_arn);
      ("versionInfo", option_to_yojson version_info_to_yojson x.version_info);
      ("totalResources", option_to_yojson resources_to_yojson x.total_resources);
      ( "instanceIdentityDocumentSignature",
        option_to_yojson string__to_yojson x.instance_identity_document_signature );
      ("instanceIdentityDocument", option_to_yojson string__to_yojson x.instance_identity_document);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let put_cluster_capacity_providers_response_to_yojson (x : put_cluster_capacity_providers_response)
    =
  assoc_to_yojson [ ("cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let put_cluster_capacity_providers_request_to_yojson (x : put_cluster_capacity_providers_request) =
  assoc_to_yojson
    [
      ( "defaultCapacityProviderStrategy",
        Some (capacity_provider_strategy_to_yojson x.default_capacity_provider_strategy) );
      ("capacityProviders", Some (string_list_to_yojson x.capacity_providers));
      ("cluster", Some (string__to_yojson x.cluster));
    ]

let put_attributes_response_to_yojson (x : put_attributes_response) =
  assoc_to_yojson [ ("attributes", option_to_yojson attributes_to_yojson x.attributes) ]

let put_attributes_request_to_yojson (x : put_attributes_request) =
  assoc_to_yojson
    [
      ("attributes", Some (attributes_to_yojson x.attributes));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let attribute_limit_exceeded_exception_to_yojson (x : attribute_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let put_account_setting_response_to_yojson (x : put_account_setting_response) =
  assoc_to_yojson [ ("setting", option_to_yojson setting_to_yojson x.setting) ]

let put_account_setting_request_to_yojson (x : put_account_setting_request) =
  assoc_to_yojson
    [
      ("principalArn", option_to_yojson string__to_yojson x.principal_arn);
      ("value", Some (string__to_yojson x.value));
      ("name", Some (setting_name_to_yojson x.name));
    ]

let put_account_setting_default_response_to_yojson (x : put_account_setting_default_response) =
  assoc_to_yojson [ ("setting", option_to_yojson setting_to_yojson x.setting) ]

let put_account_setting_default_request_to_yojson (x : put_account_setting_default_request) =
  assoc_to_yojson
    [ ("value", Some (string__to_yojson x.value)); ("name", Some (setting_name_to_yojson x.name)) ]

let list_tasks_response_to_yojson (x : list_tasks_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("taskArns", option_to_yojson string_list_to_yojson x.task_arns);
    ]

let desired_status_to_yojson (x : desired_status) =
  match x with
  | STOPPED -> `String "STOPPED"
  | PENDING -> `String "PENDING"
  | RUNNING -> `String "RUNNING"

let list_tasks_request_to_yojson (x : list_tasks_request) =
  assoc_to_yojson
    [
      ("daemonName", option_to_yojson string__to_yojson x.daemon_name);
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ("desiredStatus", option_to_yojson desired_status_to_yojson x.desired_status);
      ("serviceName", option_to_yojson string__to_yojson x.service_name);
      ("startedBy", option_to_yojson string__to_yojson x.started_by);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("family", option_to_yojson string__to_yojson x.family);
      ("containerInstance", option_to_yojson string__to_yojson x.container_instance);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let list_task_definitions_response_to_yojson (x : list_task_definitions_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("taskDefinitionArns", option_to_yojson string_list_to_yojson x.task_definition_arns);
    ]

let list_task_definitions_request_to_yojson (x : list_task_definitions_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("sort", option_to_yojson sort_order_to_yojson x.sort);
      ("status", option_to_yojson task_definition_status_to_yojson x.status);
      ("familyPrefix", option_to_yojson string__to_yojson x.family_prefix);
    ]

let list_task_definition_families_response_to_yojson (x : list_task_definition_families_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("families", option_to_yojson string_list_to_yojson x.families);
    ]

let list_task_definition_families_request_to_yojson (x : list_task_definition_families_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("status", option_to_yojson task_definition_family_status_to_yojson x.status);
      ("familyPrefix", option_to_yojson string__to_yojson x.family_prefix);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (string__to_yojson x.resource_arn)) ]

let list_services_response_to_yojson (x : list_services_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("serviceArns", option_to_yojson string_list_to_yojson x.service_arns);
    ]

let list_services_request_to_yojson (x : list_services_request) =
  assoc_to_yojson
    [
      ( "resourceManagementType",
        option_to_yojson resource_management_type_to_yojson x.resource_management_type );
      ("schedulingStrategy", option_to_yojson scheduling_strategy_to_yojson x.scheduling_strategy);
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let list_services_by_namespace_response_to_yojson (x : list_services_by_namespace_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("serviceArns", option_to_yojson string_list_to_yojson x.service_arns);
    ]

let list_services_by_namespace_request_to_yojson (x : list_services_by_namespace_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("namespace", Some (string__to_yojson x.namespace));
    ]

let list_service_deployments_response_to_yojson (x : list_service_deployments_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ( "serviceDeployments",
        option_to_yojson service_deployments_brief_to_yojson x.service_deployments );
    ]

let created_at_to_yojson (x : created_at) =
  assoc_to_yojson
    [
      ("after", option_to_yojson timestamp_to_yojson x.after);
      ("before", option_to_yojson timestamp_to_yojson x.before);
    ]

let list_service_deployments_request_to_yojson (x : list_service_deployments_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("createdAt", option_to_yojson created_at_to_yojson x.created_at);
      ("status", option_to_yojson service_deployment_status_list_to_yojson x.status);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("service", Some (string__to_yojson x.service));
    ]

let daemon_summary_to_yojson (x : daemon_summary) =
  assoc_to_yojson
    [
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("status", option_to_yojson daemon_status_to_yojson x.status);
      ("daemonArn", option_to_yojson string__to_yojson x.daemon_arn);
    ]

let daemon_summaries_list_to_yojson tree = list_to_yojson daemon_summary_to_yojson tree

let list_daemons_response_to_yojson (x : list_daemons_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ( "daemonSummariesList",
        option_to_yojson daemon_summaries_list_to_yojson x.daemon_summaries_list );
    ]

let list_daemons_request_to_yojson (x : list_daemons_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("capacityProviderArns", option_to_yojson string_list_to_yojson x.capacity_provider_arns);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
    ]

let daemon_task_definition_status_to_yojson (x : daemon_task_definition_status) =
  match x with
  | DELETED -> `String "DELETED"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | ACTIVE -> `String "ACTIVE"

let daemon_task_definition_summary_to_yojson (x : daemon_task_definition_summary) =
  assoc_to_yojson
    [
      ("status", option_to_yojson daemon_task_definition_status_to_yojson x.status);
      ("deleteRequestedAt", option_to_yojson timestamp_to_yojson x.delete_requested_at);
      ("registeredBy", option_to_yojson string__to_yojson x.registered_by);
      ("registeredAt", option_to_yojson timestamp_to_yojson x.registered_at);
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let daemon_task_definition_summaries_to_yojson tree =
  list_to_yojson daemon_task_definition_summary_to_yojson tree

let list_daemon_task_definitions_response_to_yojson (x : list_daemon_task_definitions_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ( "daemonTaskDefinitions",
        option_to_yojson daemon_task_definition_summaries_to_yojson x.daemon_task_definitions );
    ]

let daemon_task_definition_revision_filter_to_yojson (x : daemon_task_definition_revision_filter) =
  match x with LAST_REGISTERED -> `String "LAST_REGISTERED"

let daemon_task_definition_status_filter_to_yojson (x : daemon_task_definition_status_filter) =
  match x with
  | ALL -> `String "ALL"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | ACTIVE -> `String "ACTIVE"

let list_daemon_task_definitions_request_to_yojson (x : list_daemon_task_definitions_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("sort", option_to_yojson sort_order_to_yojson x.sort);
      ("status", option_to_yojson daemon_task_definition_status_filter_to_yojson x.status);
      ("revision", option_to_yojson daemon_task_definition_revision_filter_to_yojson x.revision);
      ("family", option_to_yojson string__to_yojson x.family);
      ("familyPrefix", option_to_yojson string__to_yojson x.family_prefix);
    ]

let daemon_deployment_status_to_yojson (x : daemon_deployment_status) =
  match x with
  | ROLLBACK_FAILED -> `String "ROLLBACK_FAILED"
  | ROLLBACK_SUCCESSFUL -> `String "ROLLBACK_SUCCESSFUL"
  | ROLLBACK_IN_PROGRESS -> `String "ROLLBACK_IN_PROGRESS"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | STOP_REQUESTED -> `String "STOP_REQUESTED"
  | STOPPED -> `String "STOPPED"
  | SUCCESSFUL -> `String "SUCCESSFUL"
  | PENDING -> `String "PENDING"

let daemon_deployment_summary_to_yojson (x : daemon_deployment_summary) =
  assoc_to_yojson
    [
      ("finishedAt", option_to_yojson timestamp_to_yojson x.finished_at);
      ("stoppedAt", option_to_yojson timestamp_to_yojson x.stopped_at);
      ("startedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("targetDaemonRevisionArn", option_to_yojson string__to_yojson x.target_daemon_revision_arn);
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("status", option_to_yojson daemon_deployment_status_to_yojson x.status);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("daemonArn", option_to_yojson string__to_yojson x.daemon_arn);
      ("daemonDeploymentArn", option_to_yojson string__to_yojson x.daemon_deployment_arn);
    ]

let daemon_deployment_summary_list_to_yojson tree =
  list_to_yojson daemon_deployment_summary_to_yojson tree

let list_daemon_deployments_response_to_yojson (x : list_daemon_deployments_response) =
  assoc_to_yojson
    [
      ( "daemonDeployments",
        option_to_yojson daemon_deployment_summary_list_to_yojson x.daemon_deployments );
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let daemon_deployment_status_list_to_yojson tree =
  list_to_yojson daemon_deployment_status_to_yojson tree

let list_daemon_deployments_request_to_yojson (x : list_daemon_deployments_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("createdAt", option_to_yojson created_at_to_yojson x.created_at);
      ("status", option_to_yojson daemon_deployment_status_list_to_yojson x.status);
      ("daemonArn", Some (string__to_yojson x.daemon_arn));
    ]

let list_container_instances_response_to_yojson (x : list_container_instances_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("containerInstanceArns", option_to_yojson string_list_to_yojson x.container_instance_arns);
    ]

let list_container_instances_request_to_yojson (x : list_container_instances_request) =
  assoc_to_yojson
    [
      ("status", option_to_yojson container_instance_status_to_yojson x.status);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("filter", option_to_yojson string__to_yojson x.filter);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let list_clusters_response_to_yojson (x : list_clusters_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("clusterArns", option_to_yojson string_list_to_yojson x.cluster_arns);
    ]

let list_clusters_request_to_yojson (x : list_clusters_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_attributes_response_to_yojson (x : list_attributes_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("attributes", option_to_yojson attributes_to_yojson x.attributes);
    ]

let list_attributes_request_to_yojson (x : list_attributes_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("attributeValue", option_to_yojson string__to_yojson x.attribute_value);
      ("attributeName", option_to_yojson string__to_yojson x.attribute_name);
      ("targetType", Some (target_type_to_yojson x.target_type));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let list_account_settings_response_to_yojson (x : list_account_settings_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("settings", option_to_yojson settings_to_yojson x.settings);
    ]

let list_account_settings_request_to_yojson (x : list_account_settings_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson integer_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("effectiveSettings", option_to_yojson boolean__to_yojson x.effective_settings);
      ("principalArn", option_to_yojson string__to_yojson x.principal_arn);
      ("value", option_to_yojson string__to_yojson x.value);
      ("name", option_to_yojson setting_name_to_yojson x.name);
    ]

let get_task_protection_response_to_yojson (x : get_task_protection_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("protectedTasks", option_to_yojson protected_tasks_to_yojson x.protected_tasks);
    ]

let get_task_protection_request_to_yojson (x : get_task_protection_request) =
  assoc_to_yojson
    [
      ("tasks", option_to_yojson string_list_to_yojson x.tasks);
      ("cluster", Some (string__to_yojson x.cluster));
    ]

let express_gateway_service_include_to_yojson (x : express_gateway_service_include) =
  match x with TAGS -> `String "TAGS"

let express_gateway_service_include_list_to_yojson tree =
  list_to_yojson express_gateway_service_include_to_yojson tree

let express_gateway_service_configurations_to_yojson tree =
  list_to_yojson express_gateway_service_configuration_to_yojson tree

let execute_command_response_to_yojson (x : execute_command_response) =
  assoc_to_yojson
    [
      ("taskArn", option_to_yojson string__to_yojson x.task_arn);
      ("session", option_to_yojson session_to_yojson x.session);
      ("interactive", option_to_yojson boolean__to_yojson x.interactive);
      ("containerName", option_to_yojson string__to_yojson x.container_name);
      ("containerArn", option_to_yojson string__to_yojson x.container_arn);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
    ]

let execute_command_request_to_yojson (x : execute_command_request) =
  assoc_to_yojson
    [
      ("task", Some (string__to_yojson x.task));
      ("interactive", Some (boolean__to_yojson x.interactive));
      ("command", Some (string__to_yojson x.command));
      ("container", option_to_yojson string__to_yojson x.container);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let ecs_express_gateway_service_to_yojson (x : ecs_express_gateway_service) =
  assoc_to_yojson
    [
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "activeConfigurations",
        option_to_yojson express_gateway_service_configurations_to_yojson x.active_configurations );
      ("currentDeployment", option_to_yojson string__to_yojson x.current_deployment);
      ("status", option_to_yojson express_gateway_service_status_to_yojson x.status);
      ("infrastructureRoleArn", option_to_yojson string__to_yojson x.infrastructure_role_arn);
      ("serviceArn", option_to_yojson string__to_yojson x.service_arn);
      ("serviceName", option_to_yojson string__to_yojson x.service_name);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let discover_poll_endpoint_response_to_yojson (x : discover_poll_endpoint_response) =
  assoc_to_yojson
    [
      ("serviceConnectEndpoint", option_to_yojson string__to_yojson x.service_connect_endpoint);
      ("telemetryEndpoint", option_to_yojson string__to_yojson x.telemetry_endpoint);
      ("endpoint", option_to_yojson string__to_yojson x.endpoint);
    ]

let discover_poll_endpoint_request_to_yojson (x : discover_poll_endpoint_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("containerInstance", option_to_yojson string__to_yojson x.container_instance);
    ]

let describe_tasks_response_to_yojson (x : describe_tasks_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("tasks", option_to_yojson tasks_to_yojson x.tasks);
    ]

let describe_tasks_request_to_yojson (x : describe_tasks_request) =
  assoc_to_yojson
    [
      ("include", option_to_yojson task_field_list_to_yojson x.include_);
      ("tasks", Some (string_list_to_yojson x.tasks));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let describe_task_sets_response_to_yojson (x : describe_task_sets_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("taskSets", option_to_yojson task_sets_to_yojson x.task_sets);
    ]

let describe_task_sets_request_to_yojson (x : describe_task_sets_request) =
  assoc_to_yojson
    [
      ("include", option_to_yojson task_set_field_list_to_yojson x.include_);
      ("taskSets", option_to_yojson string_list_to_yojson x.task_sets);
      ("service", Some (string__to_yojson x.service));
      ("cluster", Some (string__to_yojson x.cluster));
    ]

let describe_task_definition_response_to_yojson (x : describe_task_definition_response) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("taskDefinition", option_to_yojson task_definition_to_yojson x.task_definition);
    ]

let describe_task_definition_request_to_yojson (x : describe_task_definition_request) =
  assoc_to_yojson
    [
      ("include", option_to_yojson task_definition_field_list_to_yojson x.include_);
      ("taskDefinition", Some (string__to_yojson x.task_definition));
    ]

let describe_services_response_to_yojson (x : describe_services_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("services", option_to_yojson services_to_yojson x.services);
    ]

let describe_services_request_to_yojson (x : describe_services_request) =
  assoc_to_yojson
    [
      ("include", option_to_yojson service_field_list_to_yojson x.include_);
      ("services", Some (string_list_to_yojson x.services));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let describe_service_revisions_response_to_yojson (x : describe_service_revisions_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("serviceRevisions", option_to_yojson service_revisions_to_yojson x.service_revisions);
    ]

let describe_service_revisions_request_to_yojson (x : describe_service_revisions_request) =
  assoc_to_yojson [ ("serviceRevisionArns", Some (string_list_to_yojson x.service_revision_arns)) ]

let describe_service_deployments_response_to_yojson (x : describe_service_deployments_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("serviceDeployments", option_to_yojson service_deployments_to_yojson x.service_deployments);
    ]

let describe_service_deployments_request_to_yojson (x : describe_service_deployments_request) =
  assoc_to_yojson
    [ ("serviceDeploymentArns", Some (string_list_to_yojson x.service_deployment_arns)) ]

let describe_express_gateway_service_response_to_yojson
    (x : describe_express_gateway_service_response) =
  assoc_to_yojson [ ("service", option_to_yojson ecs_express_gateway_service_to_yojson x.service) ]

let describe_express_gateway_service_request_to_yojson
    (x : describe_express_gateway_service_request) =
  assoc_to_yojson
    [
      ("include", option_to_yojson express_gateway_service_include_list_to_yojson x.include_);
      ("serviceArn", Some (string__to_yojson x.service_arn));
    ]

let daemon_task_definition_to_yojson (x : daemon_task_definition) =
  assoc_to_yojson
    [
      ("ipcMode", option_to_yojson daemon_ipc_mode_to_yojson x.ipc_mode);
      ("pidMode", option_to_yojson daemon_pid_mode_to_yojson x.pid_mode);
      ("registeredBy", option_to_yojson string__to_yojson x.registered_by);
      ("deleteRequestedAt", option_to_yojson timestamp_to_yojson x.delete_requested_at);
      ("registeredAt", option_to_yojson timestamp_to_yojson x.registered_at);
      ("status", option_to_yojson daemon_task_definition_status_to_yojson x.status);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ("volumes", option_to_yojson daemon_volume_list_to_yojson x.volumes);
      ( "containerDefinitions",
        option_to_yojson daemon_container_definition_list_to_yojson x.container_definitions );
      ("executionRoleArn", option_to_yojson string__to_yojson x.execution_role_arn);
      ("taskRoleArn", option_to_yojson string__to_yojson x.task_role_arn);
      ("revision", option_to_yojson integer_to_yojson x.revision);
      ("family", option_to_yojson string__to_yojson x.family);
      ("daemonTaskDefinitionArn", option_to_yojson string__to_yojson x.daemon_task_definition_arn);
    ]

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

let daemon_container_image_to_yojson (x : daemon_container_image) =
  assoc_to_yojson
    [
      ("image", option_to_yojson string__to_yojson x.image);
      ("imageDigest", option_to_yojson string__to_yojson x.image_digest);
      ("containerName", option_to_yojson string__to_yojson x.container_name);
    ]

let daemon_container_images_to_yojson tree = list_to_yojson daemon_container_image_to_yojson tree

let daemon_revision_to_yojson (x : daemon_revision) =
  assoc_to_yojson
    [
      ("enableExecuteCommand", option_to_yojson boxed_boolean_to_yojson x.enable_execute_command);
      ("enableECSManagedTags", option_to_yojson boxed_boolean_to_yojson x.enable_ecs_managed_tags);
      ("propagateTags", option_to_yojson daemon_propagate_tags_to_yojson x.propagate_tags);
      ("containerImages", option_to_yojson daemon_container_images_to_yojson x.container_images);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("daemonTaskDefinitionArn", option_to_yojson string__to_yojson x.daemon_task_definition_arn);
      ("daemonArn", option_to_yojson string__to_yojson x.daemon_arn);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("daemonRevisionArn", option_to_yojson string__to_yojson x.daemon_revision_arn);
    ]

let daemon_revisions_to_yojson tree = list_to_yojson daemon_revision_to_yojson tree

let describe_daemon_revisions_response_to_yojson (x : describe_daemon_revisions_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("daemonRevisions", option_to_yojson daemon_revisions_to_yojson x.daemon_revisions);
    ]

let describe_daemon_revisions_request_to_yojson (x : describe_daemon_revisions_request) =
  assoc_to_yojson [ ("daemonRevisionArns", Some (string_list_to_yojson x.daemon_revision_arns)) ]

let daemon_capacity_provider_to_yojson (x : daemon_capacity_provider) =
  assoc_to_yojson
    [
      ("runningCount", option_to_yojson integer_to_yojson x.running_count);
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let daemon_capacity_provider_list_to_yojson tree =
  list_to_yojson daemon_capacity_provider_to_yojson tree

let daemon_revision_detail_to_yojson (x : daemon_revision_detail) =
  assoc_to_yojson
    [
      ("totalRunningCount", option_to_yojson integer_to_yojson x.total_running_count);
      ( "capacityProviders",
        option_to_yojson daemon_capacity_provider_list_to_yojson x.capacity_providers );
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let daemon_revision_detail_list_to_yojson tree =
  list_to_yojson daemon_revision_detail_to_yojson tree

let daemon_detail_to_yojson (x : daemon_detail) =
  assoc_to_yojson
    [
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("deploymentArn", option_to_yojson string__to_yojson x.deployment_arn);
      ( "currentRevisions",
        option_to_yojson daemon_revision_detail_list_to_yojson x.current_revisions );
      ("status", option_to_yojson daemon_status_to_yojson x.status);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("daemonArn", option_to_yojson string__to_yojson x.daemon_arn);
    ]

let describe_daemon_response_to_yojson (x : describe_daemon_response) =
  assoc_to_yojson [ ("daemon", option_to_yojson daemon_detail_to_yojson x.daemon) ]

let describe_daemon_request_to_yojson (x : describe_daemon_request) =
  assoc_to_yojson [ ("daemonArn", Some (string__to_yojson x.daemon_arn)) ]

let daemon_deployment_capacity_provider_to_yojson (x : daemon_deployment_capacity_provider) =
  assoc_to_yojson
    [
      ("drainingInstanceCount", option_to_yojson boxed_integer_to_yojson x.draining_instance_count);
      ("runningInstanceCount", option_to_yojson boxed_integer_to_yojson x.running_instance_count);
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let daemon_deployment_capacity_provider_list_to_yojson tree =
  list_to_yojson daemon_deployment_capacity_provider_to_yojson tree

let daemon_deployment_revision_detail_to_yojson (x : daemon_deployment_revision_detail) =
  assoc_to_yojson
    [
      ( "totalDrainingInstanceCount",
        option_to_yojson boxed_integer_to_yojson x.total_draining_instance_count );
      ( "totalRunningInstanceCount",
        option_to_yojson boxed_integer_to_yojson x.total_running_instance_count );
      ( "capacityProviders",
        option_to_yojson daemon_deployment_capacity_provider_list_to_yojson x.capacity_providers );
      ("arn", option_to_yojson string__to_yojson x.arn);
    ]

let daemon_deployment_revision_detail_list_to_yojson tree =
  list_to_yojson daemon_deployment_revision_detail_to_yojson tree

let daemon_deployment_rollback_monitors_status_to_yojson
    (x : daemon_deployment_rollback_monitors_status) =
  match x with
  | DISABLED -> `String "DISABLED"
  | MONITORING_COMPLETE -> `String "MONITORING_COMPLETE"
  | MONITORING -> `String "MONITORING"
  | TRIGGERED -> `String "TRIGGERED"

let daemon_circuit_breaker_to_yojson (x : daemon_circuit_breaker) =
  assoc_to_yojson
    [
      ("threshold", option_to_yojson integer_to_yojson x.threshold);
      ("status", option_to_yojson daemon_deployment_rollback_monitors_status_to_yojson x.status);
      ("failureCount", option_to_yojson integer_to_yojson x.failure_count);
    ]

let daemon_deployment_alarms_to_yojson (x : daemon_deployment_alarms) =
  assoc_to_yojson
    [
      ("triggeredAlarmNames", option_to_yojson string_list_to_yojson x.triggered_alarm_names);
      ("alarmNames", option_to_yojson string_list_to_yojson x.alarm_names);
      ("status", option_to_yojson daemon_deployment_rollback_monitors_status_to_yojson x.status);
    ]

let daemon_rollback_to_yojson (x : daemon_rollback) =
  assoc_to_yojson
    [
      ( "rollbackCapacityProviders",
        option_to_yojson string_list_to_yojson x.rollback_capacity_providers );
      ( "rollbackTargetDaemonRevisionArn",
        option_to_yojson string__to_yojson x.rollback_target_daemon_revision_arn );
      ("startedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("reason", option_to_yojson string__to_yojson x.reason);
    ]

let daemon_deployment_to_yojson (x : daemon_deployment) =
  assoc_to_yojson
    [
      ("finishedAt", option_to_yojson timestamp_to_yojson x.finished_at);
      ("stoppedAt", option_to_yojson timestamp_to_yojson x.stopped_at);
      ("startedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ( "deploymentConfiguration",
        option_to_yojson daemon_deployment_configuration_to_yojson x.deployment_configuration );
      ("rollback", option_to_yojson daemon_rollback_to_yojson x.rollback);
      ("alarms", option_to_yojson daemon_deployment_alarms_to_yojson x.alarms);
      ("circuitBreaker", option_to_yojson daemon_circuit_breaker_to_yojson x.circuit_breaker);
      ( "sourceDaemonRevisions",
        option_to_yojson daemon_deployment_revision_detail_list_to_yojson x.source_daemon_revisions
      );
      ( "targetDaemonRevision",
        option_to_yojson daemon_deployment_revision_detail_to_yojson x.target_daemon_revision );
      ("statusReason", option_to_yojson string__to_yojson x.status_reason);
      ("status", option_to_yojson daemon_deployment_status_to_yojson x.status);
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("daemonDeploymentArn", option_to_yojson string__to_yojson x.daemon_deployment_arn);
    ]

let daemon_deployment_list_to_yojson tree = list_to_yojson daemon_deployment_to_yojson tree

let describe_daemon_deployments_response_to_yojson (x : describe_daemon_deployments_response) =
  assoc_to_yojson
    [
      ("daemonDeployments", option_to_yojson daemon_deployment_list_to_yojson x.daemon_deployments);
      ("failures", option_to_yojson failures_to_yojson x.failures);
    ]

let describe_daemon_deployments_request_to_yojson (x : describe_daemon_deployments_request) =
  assoc_to_yojson
    [ ("daemonDeploymentArns", Some (string_list_to_yojson x.daemon_deployment_arns)) ]

let describe_container_instances_response_to_yojson (x : describe_container_instances_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("containerInstances", option_to_yojson container_instances_to_yojson x.container_instances);
    ]

let container_instance_field_to_yojson (x : container_instance_field) =
  match x with
  | CONTAINER_INSTANCE_HEALTH -> `String "CONTAINER_INSTANCE_HEALTH"
  | TAGS -> `String "TAGS"

let container_instance_field_list_to_yojson tree =
  list_to_yojson container_instance_field_to_yojson tree

let describe_container_instances_request_to_yojson (x : describe_container_instances_request) =
  assoc_to_yojson
    [
      ("include", option_to_yojson container_instance_field_list_to_yojson x.include_);
      ("containerInstances", Some (string_list_to_yojson x.container_instances));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let clusters_to_yojson tree = list_to_yojson cluster_to_yojson tree

let describe_clusters_response_to_yojson (x : describe_clusters_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("clusters", option_to_yojson clusters_to_yojson x.clusters);
    ]

let cluster_field_to_yojson (x : cluster_field) =
  match x with
  | TAGS -> `String "TAGS"
  | STATISTICS -> `String "STATISTICS"
  | SETTINGS -> `String "SETTINGS"
  | CONFIGURATIONS -> `String "CONFIGURATIONS"
  | ATTACHMENTS -> `String "ATTACHMENTS"

let cluster_field_list_to_yojson tree = list_to_yojson cluster_field_to_yojson tree

let describe_clusters_request_to_yojson (x : describe_clusters_request) =
  assoc_to_yojson
    [
      ("include", option_to_yojson cluster_field_list_to_yojson x.include_);
      ("clusters", option_to_yojson string_list_to_yojson x.clusters);
    ]

let capacity_providers_to_yojson tree = list_to_yojson capacity_provider_to_yojson tree

let describe_capacity_providers_response_to_yojson (x : describe_capacity_providers_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("capacityProviders", option_to_yojson capacity_providers_to_yojson x.capacity_providers);
    ]

let capacity_provider_field_to_yojson (x : capacity_provider_field) =
  match x with TAGS -> `String "TAGS"

let capacity_provider_field_list_to_yojson tree =
  list_to_yojson capacity_provider_field_to_yojson tree

let describe_capacity_providers_request_to_yojson (x : describe_capacity_providers_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
      ("include", option_to_yojson capacity_provider_field_list_to_yojson x.include_);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("capacityProviders", option_to_yojson string_list_to_yojson x.capacity_providers);
    ]

let deregister_task_definition_response_to_yojson (x : deregister_task_definition_response) =
  assoc_to_yojson
    [ ("taskDefinition", option_to_yojson task_definition_to_yojson x.task_definition) ]

let deregister_task_definition_request_to_yojson (x : deregister_task_definition_request) =
  assoc_to_yojson [ ("taskDefinition", Some (string__to_yojson x.task_definition)) ]

let deregister_container_instance_response_to_yojson (x : deregister_container_instance_response) =
  assoc_to_yojson
    [ ("containerInstance", option_to_yojson container_instance_to_yojson x.container_instance) ]

let deregister_container_instance_request_to_yojson (x : deregister_container_instance_request) =
  assoc_to_yojson
    [
      ("force", option_to_yojson boxed_boolean_to_yojson x.force);
      ("containerInstance", Some (string__to_yojson x.container_instance));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let delete_task_set_response_to_yojson (x : delete_task_set_response) =
  assoc_to_yojson [ ("taskSet", option_to_yojson task_set_to_yojson x.task_set) ]

let delete_task_set_request_to_yojson (x : delete_task_set_request) =
  assoc_to_yojson
    [
      ("force", option_to_yojson boxed_boolean_to_yojson x.force);
      ("taskSet", Some (string__to_yojson x.task_set));
      ("service", Some (string__to_yojson x.service));
      ("cluster", Some (string__to_yojson x.cluster));
    ]

let delete_task_definitions_response_to_yojson (x : delete_task_definitions_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson failures_to_yojson x.failures);
      ("taskDefinitions", option_to_yojson task_definition_list_to_yojson x.task_definitions);
    ]

let delete_task_definitions_request_to_yojson (x : delete_task_definitions_request) =
  assoc_to_yojson [ ("taskDefinitions", Some (string_list_to_yojson x.task_definitions)) ]

let delete_service_response_to_yojson (x : delete_service_response) =
  assoc_to_yojson [ ("service", option_to_yojson service_to_yojson x.service) ]

let delete_service_request_to_yojson (x : delete_service_request) =
  assoc_to_yojson
    [
      ("force", option_to_yojson boxed_boolean_to_yojson x.force);
      ("service", Some (string__to_yojson x.service));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let delete_express_gateway_service_response_to_yojson (x : delete_express_gateway_service_response)
    =
  assoc_to_yojson [ ("service", option_to_yojson ecs_express_gateway_service_to_yojson x.service) ]

let delete_express_gateway_service_request_to_yojson (x : delete_express_gateway_service_request) =
  assoc_to_yojson [ ("serviceArn", Some (string__to_yojson x.service_arn)) ]

let delete_daemon_task_definition_response_to_yojson (x : delete_daemon_task_definition_response) =
  assoc_to_yojson
    [ ("daemonTaskDefinitionArn", option_to_yojson string__to_yojson x.daemon_task_definition_arn) ]

let delete_daemon_task_definition_request_to_yojson (x : delete_daemon_task_definition_request) =
  assoc_to_yojson [ ("daemonTaskDefinition", Some (string__to_yojson x.daemon_task_definition)) ]

let delete_daemon_response_to_yojson (x : delete_daemon_response) =
  assoc_to_yojson
    [
      ("deploymentArn", option_to_yojson string__to_yojson x.deployment_arn);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("status", option_to_yojson daemon_status_to_yojson x.status);
      ("daemonArn", option_to_yojson string__to_yojson x.daemon_arn);
    ]

let delete_daemon_request_to_yojson (x : delete_daemon_request) =
  assoc_to_yojson [ ("daemonArn", Some (string__to_yojson x.daemon_arn)) ]

let delete_cluster_response_to_yojson (x : delete_cluster_response) =
  assoc_to_yojson [ ("cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let delete_cluster_request_to_yojson (x : delete_cluster_request) =
  assoc_to_yojson [ ("cluster", Some (string__to_yojson x.cluster)) ]

let cluster_contains_tasks_exception_to_yojson (x : cluster_contains_tasks_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let cluster_contains_services_exception_to_yojson (x : cluster_contains_services_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let cluster_contains_container_instances_exception_to_yojson
    (x : cluster_contains_container_instances_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let cluster_contains_capacity_provider_exception_to_yojson
    (x : cluster_contains_capacity_provider_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let delete_capacity_provider_response_to_yojson (x : delete_capacity_provider_response) =
  assoc_to_yojson
    [ ("capacityProvider", option_to_yojson capacity_provider_to_yojson x.capacity_provider) ]

let delete_capacity_provider_request_to_yojson (x : delete_capacity_provider_request) =
  assoc_to_yojson
    [
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("capacityProvider", Some (string__to_yojson x.capacity_provider));
    ]

let delete_attributes_response_to_yojson (x : delete_attributes_response) =
  assoc_to_yojson [ ("attributes", option_to_yojson attributes_to_yojson x.attributes) ]

let delete_attributes_request_to_yojson (x : delete_attributes_request) =
  assoc_to_yojson
    [
      ("attributes", Some (attributes_to_yojson x.attributes));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let delete_account_setting_response_to_yojson (x : delete_account_setting_response) =
  assoc_to_yojson [ ("setting", option_to_yojson setting_to_yojson x.setting) ]

let delete_account_setting_request_to_yojson (x : delete_account_setting_request) =
  assoc_to_yojson
    [
      ("principalArn", option_to_yojson string__to_yojson x.principal_arn);
      ("name", Some (setting_name_to_yojson x.name));
    ]

let create_task_set_response_to_yojson (x : create_task_set_response) =
  assoc_to_yojson [ ("taskSet", option_to_yojson task_set_to_yojson x.task_set) ]

let create_task_set_request_to_yojson (x : create_task_set_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("clientToken", option_to_yojson string__to_yojson x.client_token);
      ("scale", option_to_yojson scale_to_yojson x.scale);
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ( "capacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ("serviceRegistries", option_to_yojson service_registries_to_yojson x.service_registries);
      ("loadBalancers", option_to_yojson load_balancers_to_yojson x.load_balancers);
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("taskDefinition", Some (string__to_yojson x.task_definition));
      ("externalId", option_to_yojson string__to_yojson x.external_id);
      ("cluster", Some (string__to_yojson x.cluster));
      ("service", Some (string__to_yojson x.service));
    ]

let create_service_response_to_yojson (x : create_service_response) =
  assoc_to_yojson [ ("service", option_to_yojson service_to_yojson x.service) ]

let create_service_request_to_yojson (x : create_service_request) =
  assoc_to_yojson
    [
      ("monitoring", option_to_yojson monitoring_configuration_to_yojson x.monitoring);
      ( "vpcLatticeConfigurations",
        option_to_yojson vpc_lattice_configurations_to_yojson x.vpc_lattice_configurations );
      ( "volumeConfigurations",
        option_to_yojson service_volume_configurations_to_yojson x.volume_configurations );
      ( "serviceConnectConfiguration",
        option_to_yojson service_connect_configuration_to_yojson x.service_connect_configuration );
      ("enableExecuteCommand", option_to_yojson boolean__to_yojson x.enable_execute_command);
      ("propagateTags", option_to_yojson propagate_tags_to_yojson x.propagate_tags);
      ("enableECSManagedTags", option_to_yojson boolean__to_yojson x.enable_ecs_managed_tags);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "deploymentController",
        option_to_yojson deployment_controller_to_yojson x.deployment_controller );
      ("schedulingStrategy", option_to_yojson scheduling_strategy_to_yojson x.scheduling_strategy);
      ( "healthCheckGracePeriodSeconds",
        option_to_yojson boxed_integer_to_yojson x.health_check_grace_period_seconds );
      ( "networkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ("placementStrategy", option_to_yojson placement_strategies_to_yojson x.placement_strategy);
      ( "placementConstraints",
        option_to_yojson placement_constraints_to_yojson x.placement_constraints );
      ( "deploymentConfiguration",
        option_to_yojson deployment_configuration_to_yojson x.deployment_configuration );
      ("role", option_to_yojson string__to_yojson x.role);
      ("platformVersion", option_to_yojson string__to_yojson x.platform_version);
      ( "capacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.capacity_provider_strategy );
      ("launchType", option_to_yojson launch_type_to_yojson x.launch_type);
      ("clientToken", option_to_yojson string__to_yojson x.client_token);
      ("desiredCount", option_to_yojson boxed_integer_to_yojson x.desired_count);
      ("serviceRegistries", option_to_yojson service_registries_to_yojson x.service_registries);
      ("loadBalancers", option_to_yojson load_balancers_to_yojson x.load_balancers);
      ( "availabilityZoneRebalancing",
        option_to_yojson availability_zone_rebalancing_to_yojson x.availability_zone_rebalancing );
      ("taskDefinition", option_to_yojson string__to_yojson x.task_definition);
      ("serviceName", Some (string__to_yojson x.service_name));
      ("cluster", option_to_yojson string__to_yojson x.cluster);
    ]

let create_managed_instances_provider_configuration_to_yojson
    (x : create_managed_instances_provider_configuration) =
  assoc_to_yojson
    [
      ( "autoRepairConfiguration",
        option_to_yojson auto_repair_configuration_to_yojson x.auto_repair_configuration );
      ( "infrastructureOptimization",
        option_to_yojson infrastructure_optimization_to_yojson x.infrastructure_optimization );
      ("propagateTags", option_to_yojson propagate_mi_tags_to_yojson x.propagate_tags);
      ( "instanceLaunchTemplate",
        Some (instance_launch_template_to_yojson x.instance_launch_template) );
      ("infrastructureRoleArn", Some (string__to_yojson x.infrastructure_role_arn));
    ]

let create_express_gateway_service_response_to_yojson (x : create_express_gateway_service_response)
    =
  assoc_to_yojson [ ("service", option_to_yojson ecs_express_gateway_service_to_yojson x.service) ]

let create_express_gateway_service_request_to_yojson (x : create_express_gateway_service_request) =
  assoc_to_yojson
    [
      ("taskDefinitionArn", option_to_yojson string__to_yojson x.task_definition_arn);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("scalingTarget", option_to_yojson express_gateway_scaling_target_to_yojson x.scaling_target);
      ("memory", option_to_yojson string__to_yojson x.memory);
      ("cpu", option_to_yojson string__to_yojson x.cpu);
      ( "networkConfiguration",
        option_to_yojson express_gateway_service_network_configuration_to_yojson
          x.network_configuration );
      ("taskRoleArn", option_to_yojson string__to_yojson x.task_role_arn);
      ("primaryContainer", option_to_yojson express_gateway_container_to_yojson x.primary_container);
      ("healthCheckPath", option_to_yojson string__to_yojson x.health_check_path);
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("serviceName", option_to_yojson string__to_yojson x.service_name);
      ("infrastructureRoleArn", Some (string__to_yojson x.infrastructure_role_arn));
      ("executionRoleArn", option_to_yojson string__to_yojson x.execution_role_arn);
    ]

let create_daemon_response_to_yojson (x : create_daemon_response) =
  assoc_to_yojson
    [
      ("deploymentArn", option_to_yojson string__to_yojson x.deployment_arn);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("status", option_to_yojson daemon_status_to_yojson x.status);
      ("daemonArn", option_to_yojson string__to_yojson x.daemon_arn);
    ]

let create_daemon_request_to_yojson (x : create_daemon_request) =
  assoc_to_yojson
    [
      ("clientToken", option_to_yojson string__to_yojson x.client_token);
      ("enableExecuteCommand", option_to_yojson boolean__to_yojson x.enable_execute_command);
      ("enableECSManagedTags", option_to_yojson boolean__to_yojson x.enable_ecs_managed_tags);
      ("propagateTags", option_to_yojson daemon_propagate_tags_to_yojson x.propagate_tags);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "deploymentConfiguration",
        option_to_yojson daemon_deployment_configuration_to_yojson x.deployment_configuration );
      ("capacityProviderArns", Some (string_list_to_yojson x.capacity_provider_arns));
      ("daemonTaskDefinitionArn", Some (string__to_yojson x.daemon_task_definition_arn));
      ("clusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("daemonName", Some (string__to_yojson x.daemon_name));
    ]

let create_cluster_response_to_yojson (x : create_cluster_response) =
  assoc_to_yojson [ ("cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let create_cluster_request_to_yojson (x : create_cluster_request) =
  assoc_to_yojson
    [
      ( "serviceConnectDefaults",
        option_to_yojson cluster_service_connect_defaults_request_to_yojson
          x.service_connect_defaults );
      ( "defaultCapacityProviderStrategy",
        option_to_yojson capacity_provider_strategy_to_yojson x.default_capacity_provider_strategy
      );
      ("capacityProviders", option_to_yojson string_list_to_yojson x.capacity_providers);
      ("configuration", option_to_yojson cluster_configuration_to_yojson x.configuration);
      ("settings", option_to_yojson cluster_settings_to_yojson x.settings);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("clusterName", option_to_yojson string__to_yojson x.cluster_name);
    ]

let create_capacity_provider_response_to_yojson (x : create_capacity_provider_response) =
  assoc_to_yojson
    [ ("capacityProvider", option_to_yojson capacity_provider_to_yojson x.capacity_provider) ]

let create_capacity_provider_request_to_yojson (x : create_capacity_provider_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "managedInstancesProvider",
        option_to_yojson create_managed_instances_provider_configuration_to_yojson
          x.managed_instances_provider );
      ( "autoScalingGroupProvider",
        option_to_yojson auto_scaling_group_provider_to_yojson x.auto_scaling_group_provider );
      ("cluster", option_to_yojson string__to_yojson x.cluster);
      ("name", Some (string__to_yojson x.name));
    ]

let continue_service_deployment_response_to_yojson (x : continue_service_deployment_response) =
  assoc_to_yojson
    [ ("serviceDeploymentArn", option_to_yojson string__to_yojson x.service_deployment_arn) ]

let continue_service_deployment_request_to_yojson (x : continue_service_deployment_request) =
  assoc_to_yojson
    [
      ("action", option_to_yojson deployment_lifecycle_hook_action_to_yojson x.action);
      ("hookId", Some (string__to_yojson x.hook_id));
      ("serviceDeploymentArn", Some (string__to_yojson x.service_deployment_arn));
    ]
