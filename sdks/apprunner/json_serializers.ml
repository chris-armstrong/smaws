open Smaws_Lib.Json.SerializeHelpers
open Types

let as_config_max_concurrency_to_yojson = int_to_yojson
let as_config_max_size_to_yojson = int_to_yojson
let as_config_min_size_to_yojson = int_to_yojson
let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_state_exception_to_yojson (x : invalid_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_service_error_exception_to_yojson (x : internal_service_error_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let string__to_yojson = string_to_yojson

let ingress_vpc_configuration_to_yojson (x : ingress_vpc_configuration) =
  assoc_to_yojson
    [
      ("VpcId", option_to_yojson string__to_yojson x.vpc_id);
      ("VpcEndpointId", option_to_yojson string__to_yojson x.vpc_endpoint_id);
    ]

let domain_name_to_yojson = string_to_yojson
let customer_account_id_to_yojson = string_to_yojson

let vpc_ingress_connection_status_to_yojson (x : vpc_ingress_connection_status) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | PENDING_CREATION -> `String "PENDING_CREATION"
  | PENDING_UPDATE -> `String "PENDING_UPDATE"
  | PENDING_DELETION -> `String "PENDING_DELETION"
  | FAILED_CREATION -> `String "FAILED_CREATION"
  | FAILED_UPDATE -> `String "FAILED_UPDATE"
  | FAILED_DELETION -> `String "FAILED_DELETION"
  | DELETED -> `String "DELETED"

let app_runner_resource_arn_to_yojson = string_to_yojson
let vpc_ingress_connection_name_to_yojson = string_to_yojson

let vpc_ingress_connection_to_yojson (x : vpc_ingress_connection) =
  assoc_to_yojson
    [
      ( "VpcIngressConnectionArn",
        option_to_yojson app_runner_resource_arn_to_yojson x.vpc_ingress_connection_arn );
      ( "VpcIngressConnectionName",
        option_to_yojson vpc_ingress_connection_name_to_yojson x.vpc_ingress_connection_name );
      ("ServiceArn", option_to_yojson app_runner_resource_arn_to_yojson x.service_arn);
      ("Status", option_to_yojson vpc_ingress_connection_status_to_yojson x.status);
      ("AccountId", option_to_yojson customer_account_id_to_yojson x.account_id);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ( "IngressVpcConfiguration",
        option_to_yojson ingress_vpc_configuration_to_yojson x.ingress_vpc_configuration );
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("DeletedAt", option_to_yojson timestamp_to_yojson x.deleted_at);
    ]

let update_vpc_ingress_connection_response_to_yojson (x : update_vpc_ingress_connection_response) =
  assoc_to_yojson
    [ ("VpcIngressConnection", Some (vpc_ingress_connection_to_yojson x.vpc_ingress_connection)) ]

let update_vpc_ingress_connection_request_to_yojson (x : update_vpc_ingress_connection_request) =
  assoc_to_yojson
    [
      ( "VpcIngressConnectionArn",
        Some (app_runner_resource_arn_to_yojson x.vpc_ingress_connection_arn) );
      ( "IngressVpcConfiguration",
        Some (ingress_vpc_configuration_to_yojson x.ingress_vpc_configuration) );
    ]

let uui_d_to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson

let service_observability_configuration_to_yojson (x : service_observability_configuration) =
  assoc_to_yojson
    [
      ("ObservabilityEnabled", Some (boolean__to_yojson x.observability_enabled));
      ( "ObservabilityConfigurationArn",
        option_to_yojson app_runner_resource_arn_to_yojson x.observability_configuration_arn );
    ]

let ip_address_type_to_yojson (x : ip_address_type) =
  match x with IPV4 -> `String "IPV4" | DUAL_STACK -> `String "DUAL_STACK"

let ingress_configuration_to_yojson (x : ingress_configuration) =
  assoc_to_yojson
    [ ("IsPubliclyAccessible", option_to_yojson boolean__to_yojson x.is_publicly_accessible) ]

let egress_type_to_yojson (x : egress_type) =
  match x with DEFAULT -> `String "DEFAULT" | VPC -> `String "VPC"

let egress_configuration_to_yojson (x : egress_configuration) =
  assoc_to_yojson
    [
      ("EgressType", option_to_yojson egress_type_to_yojson x.egress_type);
      ("VpcConnectorArn", option_to_yojson app_runner_resource_arn_to_yojson x.vpc_connector_arn);
    ]

let network_configuration_to_yojson (x : network_configuration) =
  assoc_to_yojson
    [
      ("EgressConfiguration", option_to_yojson egress_configuration_to_yojson x.egress_configuration);
      ( "IngressConfiguration",
        option_to_yojson ingress_configuration_to_yojson x.ingress_configuration );
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
    ]

let is_default_to_yojson = bool_to_yojson
let has_associated_service_to_yojson = bool_to_yojson

let auto_scaling_configuration_status_to_yojson (x : auto_scaling_configuration_status) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE"

let integer_to_yojson = int_to_yojson
let auto_scaling_configuration_name_to_yojson = string_to_yojson

let auto_scaling_configuration_summary_to_yojson (x : auto_scaling_configuration_summary) =
  assoc_to_yojson
    [
      ( "AutoScalingConfigurationArn",
        option_to_yojson app_runner_resource_arn_to_yojson x.auto_scaling_configuration_arn );
      ( "AutoScalingConfigurationName",
        option_to_yojson auto_scaling_configuration_name_to_yojson x.auto_scaling_configuration_name
      );
      ( "AutoScalingConfigurationRevision",
        option_to_yojson integer_to_yojson x.auto_scaling_configuration_revision );
      ("Status", option_to_yojson auto_scaling_configuration_status_to_yojson x.status);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ( "HasAssociatedService",
        option_to_yojson has_associated_service_to_yojson x.has_associated_service );
      ("IsDefault", option_to_yojson is_default_to_yojson x.is_default);
    ]

let health_check_unhealthy_threshold_to_yojson = int_to_yojson
let health_check_healthy_threshold_to_yojson = int_to_yojson
let health_check_timeout_to_yojson = int_to_yojson
let health_check_interval_to_yojson = int_to_yojson
let health_check_path_to_yojson = string_to_yojson

let health_check_protocol_to_yojson (x : health_check_protocol) =
  match x with TCP -> `String "TCP" | HTTP -> `String "HTTP"

let health_check_configuration_to_yojson (x : health_check_configuration) =
  assoc_to_yojson
    [
      ("Protocol", option_to_yojson health_check_protocol_to_yojson x.protocol);
      ("Path", option_to_yojson health_check_path_to_yojson x.path);
      ("Interval", option_to_yojson health_check_interval_to_yojson x.interval);
      ("Timeout", option_to_yojson health_check_timeout_to_yojson x.timeout);
      ( "HealthyThreshold",
        option_to_yojson health_check_healthy_threshold_to_yojson x.healthy_threshold );
      ( "UnhealthyThreshold",
        option_to_yojson health_check_unhealthy_threshold_to_yojson x.unhealthy_threshold );
    ]

let kms_key_arn_to_yojson = string_to_yojson

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson [ ("KmsKey", Some (kms_key_arn_to_yojson x.kms_key)) ]

let role_arn_to_yojson = string_to_yojson
let memory_to_yojson = string_to_yojson
let cpu_to_yojson = string_to_yojson

let instance_configuration_to_yojson (x : instance_configuration) =
  assoc_to_yojson
    [
      ("Cpu", option_to_yojson cpu_to_yojson x.cpu);
      ("Memory", option_to_yojson memory_to_yojson x.memory);
      ("InstanceRoleArn", option_to_yojson role_arn_to_yojson x.instance_role_arn);
    ]

let authentication_configuration_to_yojson (x : authentication_configuration) =
  assoc_to_yojson
    [
      ("ConnectionArn", option_to_yojson app_runner_resource_arn_to_yojson x.connection_arn);
      ("AccessRoleArn", option_to_yojson role_arn_to_yojson x.access_role_arn);
    ]

let nullable_boolean_to_yojson = bool_to_yojson

let image_repository_type_to_yojson (x : image_repository_type) =
  match x with ECR -> `String "ECR" | ECR_PUBLIC -> `String "ECR_PUBLIC"

let runtime_environment_secrets_value_to_yojson = string_to_yojson
let runtime_environment_secrets_name_to_yojson = string_to_yojson

let runtime_environment_secrets_to_yojson tree =
  map_to_yojson runtime_environment_secrets_name_to_yojson
    runtime_environment_secrets_value_to_yojson tree

let start_command_to_yojson = string_to_yojson
let runtime_environment_variables_value_to_yojson = string_to_yojson
let runtime_environment_variables_key_to_yojson = string_to_yojson

let runtime_environment_variables_to_yojson tree =
  map_to_yojson runtime_environment_variables_key_to_yojson
    runtime_environment_variables_value_to_yojson tree

let image_configuration_to_yojson (x : image_configuration) =
  assoc_to_yojson
    [
      ( "RuntimeEnvironmentVariables",
        option_to_yojson runtime_environment_variables_to_yojson x.runtime_environment_variables );
      ("StartCommand", option_to_yojson start_command_to_yojson x.start_command);
      ("Port", option_to_yojson string__to_yojson x.port);
      ( "RuntimeEnvironmentSecrets",
        option_to_yojson runtime_environment_secrets_to_yojson x.runtime_environment_secrets );
    ]

let image_identifier_to_yojson = string_to_yojson

let image_repository_to_yojson (x : image_repository) =
  assoc_to_yojson
    [
      ("ImageIdentifier", Some (image_identifier_to_yojson x.image_identifier));
      ("ImageConfiguration", option_to_yojson image_configuration_to_yojson x.image_configuration);
      ("ImageRepositoryType", Some (image_repository_type_to_yojson x.image_repository_type));
    ]

let source_directory_to_yojson = string_to_yojson
let build_command_to_yojson = string_to_yojson

let runtime_to_yojson (x : runtime) =
  match x with
  | PYTHON_3 -> `String "PYTHON_3"
  | NODEJS_12 -> `String "NODEJS_12"
  | NODEJS_14 -> `String "NODEJS_14"
  | CORRETTO_8 -> `String "CORRETTO_8"
  | CORRETTO_11 -> `String "CORRETTO_11"
  | NODEJS_16 -> `String "NODEJS_16"
  | GO_1 -> `String "GO_1"
  | DOTNET_6 -> `String "DOTNET_6"
  | PHP_81 -> `String "PHP_81"
  | RUBY_31 -> `String "RUBY_31"
  | PYTHON_311 -> `String "PYTHON_311"
  | NODEJS_18 -> `String "NODEJS_18"
  | NODEJS_22 -> `String "NODEJS_22"

let code_configuration_values_to_yojson (x : code_configuration_values) =
  assoc_to_yojson
    [
      ("Runtime", Some (runtime_to_yojson x.runtime));
      ("BuildCommand", option_to_yojson build_command_to_yojson x.build_command);
      ("StartCommand", option_to_yojson start_command_to_yojson x.start_command);
      ("Port", option_to_yojson string__to_yojson x.port);
      ( "RuntimeEnvironmentVariables",
        option_to_yojson runtime_environment_variables_to_yojson x.runtime_environment_variables );
      ( "RuntimeEnvironmentSecrets",
        option_to_yojson runtime_environment_secrets_to_yojson x.runtime_environment_secrets );
    ]

let configuration_source_to_yojson (x : configuration_source) =
  match x with REPOSITORY -> `String "REPOSITORY" | API -> `String "API"

let code_configuration_to_yojson (x : code_configuration) =
  assoc_to_yojson
    [
      ("ConfigurationSource", Some (configuration_source_to_yojson x.configuration_source));
      ( "CodeConfigurationValues",
        option_to_yojson code_configuration_values_to_yojson x.code_configuration_values );
    ]

let source_code_version_type_to_yojson (x : source_code_version_type) =
  match x with BRANCH -> `String "BRANCH"

let source_code_version_to_yojson (x : source_code_version) =
  assoc_to_yojson
    [
      ("Type", Some (source_code_version_type_to_yojson x.type_));
      ("Value", Some (string__to_yojson x.value));
    ]

let code_repository_to_yojson (x : code_repository) =
  assoc_to_yojson
    [
      ("RepositoryUrl", Some (string__to_yojson x.repository_url));
      ("SourceCodeVersion", Some (source_code_version_to_yojson x.source_code_version));
      ("CodeConfiguration", option_to_yojson code_configuration_to_yojson x.code_configuration);
      ("SourceDirectory", option_to_yojson source_directory_to_yojson x.source_directory);
    ]

let source_configuration_to_yojson (x : source_configuration) =
  assoc_to_yojson
    [
      ("CodeRepository", option_to_yojson code_repository_to_yojson x.code_repository);
      ("ImageRepository", option_to_yojson image_repository_to_yojson x.image_repository);
      ( "AutoDeploymentsEnabled",
        option_to_yojson nullable_boolean_to_yojson x.auto_deployments_enabled );
      ( "AuthenticationConfiguration",
        option_to_yojson authentication_configuration_to_yojson x.authentication_configuration );
    ]

let service_status_to_yojson (x : service_status) =
  match x with
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | RUNNING -> `String "RUNNING"
  | DELETED -> `String "DELETED"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | PAUSED -> `String "PAUSED"
  | OPERATION_IN_PROGRESS -> `String "OPERATION_IN_PROGRESS"

let service_id_to_yojson = string_to_yojson
let service_name_to_yojson = string_to_yojson

let service_to_yojson (x : service) =
  assoc_to_yojson
    [
      ("ServiceName", Some (service_name_to_yojson x.service_name));
      ("ServiceId", Some (service_id_to_yojson x.service_id));
      ("ServiceArn", Some (app_runner_resource_arn_to_yojson x.service_arn));
      ("ServiceUrl", option_to_yojson string__to_yojson x.service_url);
      ("CreatedAt", Some (timestamp_to_yojson x.created_at));
      ("UpdatedAt", Some (timestamp_to_yojson x.updated_at));
      ("DeletedAt", option_to_yojson timestamp_to_yojson x.deleted_at);
      ("Status", Some (service_status_to_yojson x.status));
      ("SourceConfiguration", Some (source_configuration_to_yojson x.source_configuration));
      ("InstanceConfiguration", Some (instance_configuration_to_yojson x.instance_configuration));
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "HealthCheckConfiguration",
        option_to_yojson health_check_configuration_to_yojson x.health_check_configuration );
      ( "AutoScalingConfigurationSummary",
        Some (auto_scaling_configuration_summary_to_yojson x.auto_scaling_configuration_summary) );
      ("NetworkConfiguration", Some (network_configuration_to_yojson x.network_configuration));
      ( "ObservabilityConfiguration",
        option_to_yojson service_observability_configuration_to_yojson x.observability_configuration
      );
    ]

let update_service_response_to_yojson (x : update_service_response) =
  assoc_to_yojson
    [
      ("Service", Some (service_to_yojson x.service));
      ("OperationId", Some (uui_d_to_yojson x.operation_id));
    ]

let update_service_request_to_yojson (x : update_service_request) =
  assoc_to_yojson
    [
      ("ServiceArn", Some (app_runner_resource_arn_to_yojson x.service_arn));
      ("SourceConfiguration", option_to_yojson source_configuration_to_yojson x.source_configuration);
      ( "InstanceConfiguration",
        option_to_yojson instance_configuration_to_yojson x.instance_configuration );
      ( "AutoScalingConfigurationArn",
        option_to_yojson app_runner_resource_arn_to_yojson x.auto_scaling_configuration_arn );
      ( "HealthCheckConfiguration",
        option_to_yojson health_check_configuration_to_yojson x.health_check_configuration );
      ( "NetworkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ( "ObservabilityConfiguration",
        option_to_yojson service_observability_configuration_to_yojson x.observability_configuration
      );
    ]

let max_size_to_yojson = int_to_yojson
let min_size_to_yojson = int_to_yojson
let max_concurrency_to_yojson = int_to_yojson
let latest_to_yojson = bool_to_yojson
let auto_scaling_configuration_revision_to_yojson = int_to_yojson

let auto_scaling_configuration_to_yojson (x : auto_scaling_configuration) =
  assoc_to_yojson
    [
      ( "AutoScalingConfigurationArn",
        option_to_yojson app_runner_resource_arn_to_yojson x.auto_scaling_configuration_arn );
      ( "AutoScalingConfigurationName",
        option_to_yojson auto_scaling_configuration_name_to_yojson x.auto_scaling_configuration_name
      );
      ( "AutoScalingConfigurationRevision",
        option_to_yojson auto_scaling_configuration_revision_to_yojson
          x.auto_scaling_configuration_revision );
      ("Latest", option_to_yojson latest_to_yojson x.latest);
      ("Status", option_to_yojson auto_scaling_configuration_status_to_yojson x.status);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ("MinSize", option_to_yojson min_size_to_yojson x.min_size);
      ("MaxSize", option_to_yojson max_size_to_yojson x.max_size);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("DeletedAt", option_to_yojson timestamp_to_yojson x.deleted_at);
      ( "HasAssociatedService",
        option_to_yojson has_associated_service_to_yojson x.has_associated_service );
      ("IsDefault", option_to_yojson is_default_to_yojson x.is_default);
    ]

let update_default_auto_scaling_configuration_response_to_yojson
    (x : update_default_auto_scaling_configuration_response) =
  assoc_to_yojson
    [
      ( "AutoScalingConfiguration",
        Some (auto_scaling_configuration_to_yojson x.auto_scaling_configuration) );
    ]

let update_default_auto_scaling_configuration_request_to_yojson
    (x : update_default_auto_scaling_configuration_request) =
  assoc_to_yojson
    [
      ( "AutoScalingConfigurationArn",
        Some (app_runner_resource_arn_to_yojson x.auto_scaling_configuration_arn) );
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (app_runner_resource_arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson tag_key_to_yojson x.key);
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (app_runner_resource_arn_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let start_deployment_response_to_yojson (x : start_deployment_response) =
  assoc_to_yojson [ ("OperationId", Some (uui_d_to_yojson x.operation_id)) ]

let start_deployment_request_to_yojson (x : start_deployment_request) =
  assoc_to_yojson [ ("ServiceArn", Some (app_runner_resource_arn_to_yojson x.service_arn)) ]

let resume_service_response_to_yojson (x : resume_service_response) =
  assoc_to_yojson
    [
      ("Service", Some (service_to_yojson x.service));
      ("OperationId", option_to_yojson uui_d_to_yojson x.operation_id);
    ]

let resume_service_request_to_yojson (x : resume_service_request) =
  assoc_to_yojson [ ("ServiceArn", Some (app_runner_resource_arn_to_yojson x.service_arn)) ]

let pause_service_response_to_yojson (x : pause_service_response) =
  assoc_to_yojson
    [
      ("Service", Some (service_to_yojson x.service));
      ("OperationId", option_to_yojson uui_d_to_yojson x.operation_id);
    ]

let pause_service_request_to_yojson (x : pause_service_request) =
  assoc_to_yojson [ ("ServiceArn", Some (app_runner_resource_arn_to_yojson x.service_arn)) ]

let next_token_to_yojson = string_to_yojson

let vpc_ingress_connection_summary_to_yojson (x : vpc_ingress_connection_summary) =
  assoc_to_yojson
    [
      ( "VpcIngressConnectionArn",
        option_to_yojson app_runner_resource_arn_to_yojson x.vpc_ingress_connection_arn );
      ("ServiceArn", option_to_yojson app_runner_resource_arn_to_yojson x.service_arn);
    ]

let vpc_ingress_connection_summary_list_to_yojson tree =
  list_to_yojson vpc_ingress_connection_summary_to_yojson tree

let list_vpc_ingress_connections_response_to_yojson (x : list_vpc_ingress_connections_response) =
  assoc_to_yojson
    [
      ( "VpcIngressConnectionSummaryList",
        Some (vpc_ingress_connection_summary_list_to_yojson x.vpc_ingress_connection_summary_list)
      );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_vpc_ingress_connections_filter_to_yojson (x : list_vpc_ingress_connections_filter) =
  assoc_to_yojson
    [
      ("ServiceArn", option_to_yojson app_runner_resource_arn_to_yojson x.service_arn);
      ("VpcEndpointId", option_to_yojson string__to_yojson x.vpc_endpoint_id);
    ]

let list_vpc_ingress_connections_request_to_yojson (x : list_vpc_ingress_connections_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson list_vpc_ingress_connections_filter_to_yojson x.filter);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let vpc_connector_status_to_yojson (x : vpc_connector_status) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE"

let string_list_to_yojson tree = list_to_yojson string__to_yojson tree
let vpc_connector_name_to_yojson = string_to_yojson

let vpc_connector_to_yojson (x : vpc_connector) =
  assoc_to_yojson
    [
      ("VpcConnectorName", option_to_yojson vpc_connector_name_to_yojson x.vpc_connector_name);
      ("VpcConnectorArn", option_to_yojson app_runner_resource_arn_to_yojson x.vpc_connector_arn);
      ("VpcConnectorRevision", option_to_yojson integer_to_yojson x.vpc_connector_revision);
      ("Subnets", option_to_yojson string_list_to_yojson x.subnets);
      ("SecurityGroups", option_to_yojson string_list_to_yojson x.security_groups);
      ("Status", option_to_yojson vpc_connector_status_to_yojson x.status);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("DeletedAt", option_to_yojson timestamp_to_yojson x.deleted_at);
    ]

let vpc_connectors_to_yojson tree = list_to_yojson vpc_connector_to_yojson tree

let list_vpc_connectors_response_to_yojson (x : list_vpc_connectors_response) =
  assoc_to_yojson
    [
      ("VpcConnectors", Some (vpc_connectors_to_yojson x.vpc_connectors));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_vpc_connectors_request_to_yojson (x : list_vpc_connectors_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (app_runner_resource_arn_to_yojson x.resource_arn)) ]

let service_arn_list_to_yojson tree = list_to_yojson app_runner_resource_arn_to_yojson tree

let list_services_for_auto_scaling_configuration_response_to_yojson
    (x : list_services_for_auto_scaling_configuration_response) =
  assoc_to_yojson
    [
      ("ServiceArnList", Some (service_arn_list_to_yojson x.service_arn_list));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_services_for_auto_scaling_configuration_request_to_yojson
    (x : list_services_for_auto_scaling_configuration_request) =
  assoc_to_yojson
    [
      ( "AutoScalingConfigurationArn",
        Some (app_runner_resource_arn_to_yojson x.auto_scaling_configuration_arn) );
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let service_summary_to_yojson (x : service_summary) =
  assoc_to_yojson
    [
      ("ServiceName", option_to_yojson service_name_to_yojson x.service_name);
      ("ServiceId", option_to_yojson service_id_to_yojson x.service_id);
      ("ServiceArn", option_to_yojson app_runner_resource_arn_to_yojson x.service_arn);
      ("ServiceUrl", option_to_yojson string__to_yojson x.service_url);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("Status", option_to_yojson service_status_to_yojson x.status);
    ]

let service_summary_list_to_yojson tree = list_to_yojson service_summary_to_yojson tree

let list_services_response_to_yojson (x : list_services_response) =
  assoc_to_yojson
    [
      ("ServiceSummaryList", Some (service_summary_list_to_yojson x.service_summary_list));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let service_max_results_to_yojson = int_to_yojson

let list_services_request_to_yojson (x : list_services_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson service_max_results_to_yojson x.max_results);
    ]

let operation_status_to_yojson (x : operation_status) =
  match x with
  | PENDING -> `String "PENDING"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | ROLLBACK_IN_PROGRESS -> `String "ROLLBACK_IN_PROGRESS"
  | ROLLBACK_FAILED -> `String "ROLLBACK_FAILED"
  | ROLLBACK_SUCCEEDED -> `String "ROLLBACK_SUCCEEDED"

let operation_type_to_yojson (x : operation_type) =
  match x with
  | START_DEPLOYMENT -> `String "START_DEPLOYMENT"
  | CREATE_SERVICE -> `String "CREATE_SERVICE"
  | PAUSE_SERVICE -> `String "PAUSE_SERVICE"
  | RESUME_SERVICE -> `String "RESUME_SERVICE"
  | DELETE_SERVICE -> `String "DELETE_SERVICE"
  | UPDATE_SERVICE -> `String "UPDATE_SERVICE"

let operation_summary_to_yojson (x : operation_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson uui_d_to_yojson x.id);
      ("Type", option_to_yojson operation_type_to_yojson x.type_);
      ("Status", option_to_yojson operation_status_to_yojson x.status);
      ("TargetArn", option_to_yojson app_runner_resource_arn_to_yojson x.target_arn);
      ("StartedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("EndedAt", option_to_yojson timestamp_to_yojson x.ended_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let operation_summary_list_to_yojson tree = list_to_yojson operation_summary_to_yojson tree

let list_operations_response_to_yojson (x : list_operations_response) =
  assoc_to_yojson
    [
      ( "OperationSummaryList",
        option_to_yojson operation_summary_list_to_yojson x.operation_summary_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_operations_max_results_to_yojson = int_to_yojson

let list_operations_request_to_yojson (x : list_operations_request) =
  assoc_to_yojson
    [
      ("ServiceArn", Some (app_runner_resource_arn_to_yojson x.service_arn));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_operations_max_results_to_yojson x.max_results);
    ]

let observability_configuration_name_to_yojson = string_to_yojson

let observability_configuration_summary_to_yojson (x : observability_configuration_summary) =
  assoc_to_yojson
    [
      ( "ObservabilityConfigurationArn",
        option_to_yojson app_runner_resource_arn_to_yojson x.observability_configuration_arn );
      ( "ObservabilityConfigurationName",
        option_to_yojson observability_configuration_name_to_yojson
          x.observability_configuration_name );
      ( "ObservabilityConfigurationRevision",
        option_to_yojson integer_to_yojson x.observability_configuration_revision );
    ]

let observability_configuration_summary_list_to_yojson tree =
  list_to_yojson observability_configuration_summary_to_yojson tree

let list_observability_configurations_response_to_yojson
    (x : list_observability_configurations_response) =
  assoc_to_yojson
    [
      ( "ObservabilityConfigurationSummaryList",
        Some
          (observability_configuration_summary_list_to_yojson
             x.observability_configuration_summary_list) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_observability_configurations_request_to_yojson
    (x : list_observability_configurations_request) =
  assoc_to_yojson
    [
      ( "ObservabilityConfigurationName",
        option_to_yojson observability_configuration_name_to_yojson
          x.observability_configuration_name );
      ("LatestOnly", option_to_yojson boolean__to_yojson x.latest_only);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let connection_status_to_yojson (x : connection_status) =
  match x with
  | PENDING_HANDSHAKE -> `String "PENDING_HANDSHAKE"
  | AVAILABLE -> `String "AVAILABLE"
  | ERROR -> `String "ERROR"
  | DELETED -> `String "DELETED"

let provider_type_to_yojson (x : provider_type) =
  match x with GITHUB -> `String "GITHUB" | BITBUCKET -> `String "BITBUCKET"

let connection_name_to_yojson = string_to_yojson

let connection_summary_to_yojson (x : connection_summary) =
  assoc_to_yojson
    [
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("ConnectionArn", option_to_yojson app_runner_resource_arn_to_yojson x.connection_arn);
      ("ProviderType", option_to_yojson provider_type_to_yojson x.provider_type);
      ("Status", option_to_yojson connection_status_to_yojson x.status);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
    ]

let connection_summary_list_to_yojson tree = list_to_yojson connection_summary_to_yojson tree

let list_connections_response_to_yojson (x : list_connections_response) =
  assoc_to_yojson
    [
      ("ConnectionSummaryList", Some (connection_summary_list_to_yojson x.connection_summary_list));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_connections_request_to_yojson (x : list_connections_request) =
  assoc_to_yojson
    [
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let auto_scaling_configuration_summary_list_to_yojson tree =
  list_to_yojson auto_scaling_configuration_summary_to_yojson tree

let list_auto_scaling_configurations_response_to_yojson
    (x : list_auto_scaling_configurations_response) =
  assoc_to_yojson
    [
      ( "AutoScalingConfigurationSummaryList",
        Some
          (auto_scaling_configuration_summary_list_to_yojson
             x.auto_scaling_configuration_summary_list) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_auto_scaling_configurations_request_to_yojson
    (x : list_auto_scaling_configurations_request) =
  assoc_to_yojson
    [
      ( "AutoScalingConfigurationName",
        option_to_yojson auto_scaling_configuration_name_to_yojson x.auto_scaling_configuration_name
      );
      ("LatestOnly", option_to_yojson boolean__to_yojson x.latest_only);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let vpc_dns_target_to_yojson (x : vpc_dns_target) =
  assoc_to_yojson
    [
      ( "VpcIngressConnectionArn",
        option_to_yojson app_runner_resource_arn_to_yojson x.vpc_ingress_connection_arn );
      ("VpcId", option_to_yojson string__to_yojson x.vpc_id);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
    ]

let vpc_dns_target_list_to_yojson tree = list_to_yojson vpc_dns_target_to_yojson tree

let custom_domain_association_status_to_yojson (x : custom_domain_association_status) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | PENDING_CERTIFICATE_DNS_VALIDATION -> `String "PENDING_CERTIFICATE_DNS_VALIDATION"
  | BINDING_CERTIFICATE -> `String "BINDING_CERTIFICATE"

let certificate_validation_record_status_to_yojson (x : certificate_validation_record_status) =
  match x with
  | PENDING_VALIDATION -> `String "PENDING_VALIDATION"
  | SUCCESS -> `String "SUCCESS"
  | FAILED -> `String "FAILED"

let certificate_validation_record_to_yojson (x : certificate_validation_record) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Type", option_to_yojson string__to_yojson x.type_);
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Status", option_to_yojson certificate_validation_record_status_to_yojson x.status);
    ]

let certificate_validation_record_list_to_yojson tree =
  list_to_yojson certificate_validation_record_to_yojson tree

let custom_domain_to_yojson (x : custom_domain) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("EnableWWWSubdomain", Some (nullable_boolean_to_yojson x.enable_www_subdomain));
      ( "CertificateValidationRecords",
        option_to_yojson certificate_validation_record_list_to_yojson
          x.certificate_validation_records );
      ("Status", Some (custom_domain_association_status_to_yojson x.status));
    ]

let disassociate_custom_domain_response_to_yojson (x : disassociate_custom_domain_response) =
  assoc_to_yojson
    [
      ("DNSTarget", Some (string__to_yojson x.dns_target));
      ("ServiceArn", Some (app_runner_resource_arn_to_yojson x.service_arn));
      ("CustomDomain", Some (custom_domain_to_yojson x.custom_domain));
      ("VpcDNSTargets", Some (vpc_dns_target_list_to_yojson x.vpc_dns_targets));
    ]

let disassociate_custom_domain_request_to_yojson (x : disassociate_custom_domain_request) =
  assoc_to_yojson
    [
      ("ServiceArn", Some (app_runner_resource_arn_to_yojson x.service_arn));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let describe_vpc_ingress_connection_response_to_yojson
    (x : describe_vpc_ingress_connection_response) =
  assoc_to_yojson
    [ ("VpcIngressConnection", Some (vpc_ingress_connection_to_yojson x.vpc_ingress_connection)) ]

let describe_vpc_ingress_connection_request_to_yojson (x : describe_vpc_ingress_connection_request)
    =
  assoc_to_yojson
    [
      ( "VpcIngressConnectionArn",
        Some (app_runner_resource_arn_to_yojson x.vpc_ingress_connection_arn) );
    ]

let describe_vpc_connector_response_to_yojson (x : describe_vpc_connector_response) =
  assoc_to_yojson [ ("VpcConnector", Some (vpc_connector_to_yojson x.vpc_connector)) ]

let describe_vpc_connector_request_to_yojson (x : describe_vpc_connector_request) =
  assoc_to_yojson
    [ ("VpcConnectorArn", Some (app_runner_resource_arn_to_yojson x.vpc_connector_arn)) ]

let describe_service_response_to_yojson (x : describe_service_response) =
  assoc_to_yojson [ ("Service", Some (service_to_yojson x.service)) ]

let describe_service_request_to_yojson (x : describe_service_request) =
  assoc_to_yojson [ ("ServiceArn", Some (app_runner_resource_arn_to_yojson x.service_arn)) ]

let observability_configuration_status_to_yojson (x : observability_configuration_status) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE"

let tracing_vendor_to_yojson (x : tracing_vendor) = match x with AWSXRAY -> `String "AWSXRAY"

let trace_configuration_to_yojson (x : trace_configuration) =
  assoc_to_yojson [ ("Vendor", Some (tracing_vendor_to_yojson x.vendor)) ]

let observability_configuration_to_yojson (x : observability_configuration) =
  assoc_to_yojson
    [
      ( "ObservabilityConfigurationArn",
        option_to_yojson app_runner_resource_arn_to_yojson x.observability_configuration_arn );
      ( "ObservabilityConfigurationName",
        option_to_yojson observability_configuration_name_to_yojson
          x.observability_configuration_name );
      ("TraceConfiguration", option_to_yojson trace_configuration_to_yojson x.trace_configuration);
      ( "ObservabilityConfigurationRevision",
        option_to_yojson integer_to_yojson x.observability_configuration_revision );
      ("Latest", option_to_yojson boolean__to_yojson x.latest);
      ("Status", option_to_yojson observability_configuration_status_to_yojson x.status);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("DeletedAt", option_to_yojson timestamp_to_yojson x.deleted_at);
    ]

let describe_observability_configuration_response_to_yojson
    (x : describe_observability_configuration_response) =
  assoc_to_yojson
    [
      ( "ObservabilityConfiguration",
        Some (observability_configuration_to_yojson x.observability_configuration) );
    ]

let describe_observability_configuration_request_to_yojson
    (x : describe_observability_configuration_request) =
  assoc_to_yojson
    [
      ( "ObservabilityConfigurationArn",
        Some (app_runner_resource_arn_to_yojson x.observability_configuration_arn) );
    ]

let custom_domain_list_to_yojson tree = list_to_yojson custom_domain_to_yojson tree

let describe_custom_domains_response_to_yojson (x : describe_custom_domains_response) =
  assoc_to_yojson
    [
      ("DNSTarget", Some (string__to_yojson x.dns_target));
      ("ServiceArn", Some (app_runner_resource_arn_to_yojson x.service_arn));
      ("CustomDomains", Some (custom_domain_list_to_yojson x.custom_domains));
      ("VpcDNSTargets", Some (vpc_dns_target_list_to_yojson x.vpc_dns_targets));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_custom_domains_max_results_to_yojson = int_to_yojson

let describe_custom_domains_request_to_yojson (x : describe_custom_domains_request) =
  assoc_to_yojson
    [
      ("ServiceArn", Some (app_runner_resource_arn_to_yojson x.service_arn));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson describe_custom_domains_max_results_to_yojson x.max_results);
    ]

let describe_auto_scaling_configuration_response_to_yojson
    (x : describe_auto_scaling_configuration_response) =
  assoc_to_yojson
    [
      ( "AutoScalingConfiguration",
        Some (auto_scaling_configuration_to_yojson x.auto_scaling_configuration) );
    ]

let describe_auto_scaling_configuration_request_to_yojson
    (x : describe_auto_scaling_configuration_request) =
  assoc_to_yojson
    [
      ( "AutoScalingConfigurationArn",
        Some (app_runner_resource_arn_to_yojson x.auto_scaling_configuration_arn) );
    ]

let delete_vpc_ingress_connection_response_to_yojson (x : delete_vpc_ingress_connection_response) =
  assoc_to_yojson
    [ ("VpcIngressConnection", Some (vpc_ingress_connection_to_yojson x.vpc_ingress_connection)) ]

let delete_vpc_ingress_connection_request_to_yojson (x : delete_vpc_ingress_connection_request) =
  assoc_to_yojson
    [
      ( "VpcIngressConnectionArn",
        Some (app_runner_resource_arn_to_yojson x.vpc_ingress_connection_arn) );
    ]

let delete_vpc_connector_response_to_yojson (x : delete_vpc_connector_response) =
  assoc_to_yojson [ ("VpcConnector", Some (vpc_connector_to_yojson x.vpc_connector)) ]

let delete_vpc_connector_request_to_yojson (x : delete_vpc_connector_request) =
  assoc_to_yojson
    [ ("VpcConnectorArn", Some (app_runner_resource_arn_to_yojson x.vpc_connector_arn)) ]

let delete_service_response_to_yojson (x : delete_service_response) =
  assoc_to_yojson
    [
      ("Service", Some (service_to_yojson x.service));
      ("OperationId", Some (uui_d_to_yojson x.operation_id));
    ]

let delete_service_request_to_yojson (x : delete_service_request) =
  assoc_to_yojson [ ("ServiceArn", Some (app_runner_resource_arn_to_yojson x.service_arn)) ]

let delete_observability_configuration_response_to_yojson
    (x : delete_observability_configuration_response) =
  assoc_to_yojson
    [
      ( "ObservabilityConfiguration",
        Some (observability_configuration_to_yojson x.observability_configuration) );
    ]

let delete_observability_configuration_request_to_yojson
    (x : delete_observability_configuration_request) =
  assoc_to_yojson
    [
      ( "ObservabilityConfigurationArn",
        Some (app_runner_resource_arn_to_yojson x.observability_configuration_arn) );
    ]

let connection_to_yojson (x : connection) =
  assoc_to_yojson
    [
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("ConnectionArn", option_to_yojson app_runner_resource_arn_to_yojson x.connection_arn);
      ("ProviderType", option_to_yojson provider_type_to_yojson x.provider_type);
      ("Status", option_to_yojson connection_status_to_yojson x.status);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
    ]

let delete_connection_response_to_yojson (x : delete_connection_response) =
  assoc_to_yojson [ ("Connection", option_to_yojson connection_to_yojson x.connection) ]

let delete_connection_request_to_yojson (x : delete_connection_request) =
  assoc_to_yojson [ ("ConnectionArn", Some (app_runner_resource_arn_to_yojson x.connection_arn)) ]

let delete_auto_scaling_configuration_response_to_yojson
    (x : delete_auto_scaling_configuration_response) =
  assoc_to_yojson
    [
      ( "AutoScalingConfiguration",
        Some (auto_scaling_configuration_to_yojson x.auto_scaling_configuration) );
    ]

let delete_auto_scaling_configuration_request_to_yojson
    (x : delete_auto_scaling_configuration_request) =
  assoc_to_yojson
    [
      ( "AutoScalingConfigurationArn",
        Some (app_runner_resource_arn_to_yojson x.auto_scaling_configuration_arn) );
      ("DeleteAllRevisions", option_to_yojson boolean__to_yojson x.delete_all_revisions);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_vpc_ingress_connection_response_to_yojson (x : create_vpc_ingress_connection_response) =
  assoc_to_yojson
    [ ("VpcIngressConnection", Some (vpc_ingress_connection_to_yojson x.vpc_ingress_connection)) ]

let create_vpc_ingress_connection_request_to_yojson (x : create_vpc_ingress_connection_request) =
  assoc_to_yojson
    [
      ("ServiceArn", Some (app_runner_resource_arn_to_yojson x.service_arn));
      ( "VpcIngressConnectionName",
        Some (vpc_ingress_connection_name_to_yojson x.vpc_ingress_connection_name) );
      ( "IngressVpcConfiguration",
        Some (ingress_vpc_configuration_to_yojson x.ingress_vpc_configuration) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_vpc_connector_response_to_yojson (x : create_vpc_connector_response) =
  assoc_to_yojson [ ("VpcConnector", Some (vpc_connector_to_yojson x.vpc_connector)) ]

let create_vpc_connector_request_to_yojson (x : create_vpc_connector_request) =
  assoc_to_yojson
    [
      ("VpcConnectorName", Some (vpc_connector_name_to_yojson x.vpc_connector_name));
      ("Subnets", Some (string_list_to_yojson x.subnets));
      ("SecurityGroups", option_to_yojson string_list_to_yojson x.security_groups);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_service_response_to_yojson (x : create_service_response) =
  assoc_to_yojson
    [
      ("Service", Some (service_to_yojson x.service));
      ("OperationId", Some (uui_d_to_yojson x.operation_id));
    ]

let create_service_request_to_yojson (x : create_service_request) =
  assoc_to_yojson
    [
      ("ServiceName", Some (service_name_to_yojson x.service_name));
      ("SourceConfiguration", Some (source_configuration_to_yojson x.source_configuration));
      ( "InstanceConfiguration",
        option_to_yojson instance_configuration_to_yojson x.instance_configuration );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "HealthCheckConfiguration",
        option_to_yojson health_check_configuration_to_yojson x.health_check_configuration );
      ( "AutoScalingConfigurationArn",
        option_to_yojson app_runner_resource_arn_to_yojson x.auto_scaling_configuration_arn );
      ( "NetworkConfiguration",
        option_to_yojson network_configuration_to_yojson x.network_configuration );
      ( "ObservabilityConfiguration",
        option_to_yojson service_observability_configuration_to_yojson x.observability_configuration
      );
    ]

let create_observability_configuration_response_to_yojson
    (x : create_observability_configuration_response) =
  assoc_to_yojson
    [
      ( "ObservabilityConfiguration",
        Some (observability_configuration_to_yojson x.observability_configuration) );
    ]

let create_observability_configuration_request_to_yojson
    (x : create_observability_configuration_request) =
  assoc_to_yojson
    [
      ( "ObservabilityConfigurationName",
        Some (observability_configuration_name_to_yojson x.observability_configuration_name) );
      ("TraceConfiguration", option_to_yojson trace_configuration_to_yojson x.trace_configuration);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_connection_response_to_yojson (x : create_connection_response) =
  assoc_to_yojson [ ("Connection", Some (connection_to_yojson x.connection)) ]

let create_connection_request_to_yojson (x : create_connection_request) =
  assoc_to_yojson
    [
      ("ConnectionName", Some (connection_name_to_yojson x.connection_name));
      ("ProviderType", Some (provider_type_to_yojson x.provider_type));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_auto_scaling_configuration_response_to_yojson
    (x : create_auto_scaling_configuration_response) =
  assoc_to_yojson
    [
      ( "AutoScalingConfiguration",
        Some (auto_scaling_configuration_to_yojson x.auto_scaling_configuration) );
    ]

let create_auto_scaling_configuration_request_to_yojson
    (x : create_auto_scaling_configuration_request) =
  assoc_to_yojson
    [
      ( "AutoScalingConfigurationName",
        Some (auto_scaling_configuration_name_to_yojson x.auto_scaling_configuration_name) );
      ("MaxConcurrency", option_to_yojson as_config_max_concurrency_to_yojson x.max_concurrency);
      ("MinSize", option_to_yojson as_config_min_size_to_yojson x.min_size);
      ("MaxSize", option_to_yojson as_config_max_size_to_yojson x.max_size);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let associate_custom_domain_response_to_yojson (x : associate_custom_domain_response) =
  assoc_to_yojson
    [
      ("DNSTarget", Some (string__to_yojson x.dns_target));
      ("ServiceArn", Some (app_runner_resource_arn_to_yojson x.service_arn));
      ("CustomDomain", Some (custom_domain_to_yojson x.custom_domain));
      ("VpcDNSTargets", Some (vpc_dns_target_list_to_yojson x.vpc_dns_targets));
    ]

let associate_custom_domain_request_to_yojson (x : associate_custom_domain_request) =
  assoc_to_yojson
    [
      ("ServiceArn", Some (app_runner_resource_arn_to_yojson x.service_arn));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("EnableWWWSubdomain", option_to_yojson nullable_boolean_to_yojson x.enable_www_subdomain);
    ]
