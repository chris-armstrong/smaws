open Smaws_Lib.Json.DeserializeHelpers
open Types

let app_runner_resource_arn_of_yojson = string_of_yojson

let vpc_ingress_connection_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_arn =
       option_of_yojson (value_for_key app_runner_resource_arn_of_yojson "ServiceArn") _list path;
     vpc_ingress_connection_arn =
       option_of_yojson
         (value_for_key app_runner_resource_arn_of_yojson "VpcIngressConnectionArn")
         _list path;
   }
    : vpc_ingress_connection_summary)

let vpc_ingress_connection_summary_list_of_yojson tree path =
  list_of_yojson vpc_ingress_connection_summary_of_yojson tree path

let vpc_ingress_connection_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETED" -> DELETED
    | `String "FAILED_DELETION" -> FAILED_DELETION
    | `String "FAILED_UPDATE" -> FAILED_UPDATE
    | `String "FAILED_CREATION" -> FAILED_CREATION
    | `String "PENDING_DELETION" -> PENDING_DELETION
    | `String "PENDING_UPDATE" -> PENDING_UPDATE
    | `String "PENDING_CREATION" -> PENDING_CREATION
    | `String "AVAILABLE" -> AVAILABLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "VpcIngressConnectionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "VpcIngressConnectionStatus")
     : vpc_ingress_connection_status)
    : vpc_ingress_connection_status)

let vpc_ingress_connection_name_of_yojson = string_of_yojson
let customer_account_id_of_yojson = string_of_yojson
let domain_name_of_yojson = string_of_yojson
let string__of_yojson = string_of_yojson

let ingress_vpc_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_id = option_of_yojson (value_for_key string__of_yojson "VpcEndpointId") _list path;
     vpc_id = option_of_yojson (value_for_key string__of_yojson "VpcId") _list path;
   }
    : ingress_vpc_configuration)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let vpc_ingress_connection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deleted_at = option_of_yojson (value_for_key timestamp_of_yojson "DeletedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     ingress_vpc_configuration =
       option_of_yojson
         (value_for_key ingress_vpc_configuration_of_yojson "IngressVpcConfiguration")
         _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
     account_id =
       option_of_yojson (value_for_key customer_account_id_of_yojson "AccountId") _list path;
     status =
       option_of_yojson (value_for_key vpc_ingress_connection_status_of_yojson "Status") _list path;
     service_arn =
       option_of_yojson (value_for_key app_runner_resource_arn_of_yojson "ServiceArn") _list path;
     vpc_ingress_connection_name =
       option_of_yojson
         (value_for_key vpc_ingress_connection_name_of_yojson "VpcIngressConnectionName")
         _list path;
     vpc_ingress_connection_arn =
       option_of_yojson
         (value_for_key app_runner_resource_arn_of_yojson "VpcIngressConnectionArn")
         _list path;
   }
    : vpc_ingress_connection)

let vpc_dns_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
     vpc_id = option_of_yojson (value_for_key string__of_yojson "VpcId") _list path;
     vpc_ingress_connection_arn =
       option_of_yojson
         (value_for_key app_runner_resource_arn_of_yojson "VpcIngressConnectionArn")
         _list path;
   }
    : vpc_dns_target)

let vpc_dns_target_list_of_yojson tree path = list_of_yojson vpc_dns_target_of_yojson tree path
let vpc_connector_name_of_yojson = string_of_yojson
let integer_of_yojson = int_of_yojson
let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let vpc_connector_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "INACTIVE" -> INACTIVE
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "VpcConnectorStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "VpcConnectorStatus")
     : vpc_connector_status)
    : vpc_connector_status)

let vpc_connector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deleted_at = option_of_yojson (value_for_key timestamp_of_yojson "DeletedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     status = option_of_yojson (value_for_key vpc_connector_status_of_yojson "Status") _list path;
     security_groups =
       option_of_yojson (value_for_key string_list_of_yojson "SecurityGroups") _list path;
     subnets = option_of_yojson (value_for_key string_list_of_yojson "Subnets") _list path;
     vpc_connector_revision =
       option_of_yojson (value_for_key integer_of_yojson "VpcConnectorRevision") _list path;
     vpc_connector_arn =
       option_of_yojson
         (value_for_key app_runner_resource_arn_of_yojson "VpcConnectorArn")
         _list path;
     vpc_connector_name =
       option_of_yojson (value_for_key vpc_connector_name_of_yojson "VpcConnectorName") _list path;
   }
    : vpc_connector)

let vpc_connectors_of_yojson tree path = list_of_yojson vpc_connector_of_yojson tree path

let update_vpc_ingress_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_ingress_connection =
       value_for_key vpc_ingress_connection_of_yojson "VpcIngressConnection" _list path;
   }
    : update_vpc_ingress_connection_response)

let update_vpc_ingress_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ingress_vpc_configuration =
       value_for_key ingress_vpc_configuration_of_yojson "IngressVpcConfiguration" _list path;
     vpc_ingress_connection_arn =
       value_for_key app_runner_resource_arn_of_yojson "VpcIngressConnectionArn" _list path;
   }
    : update_vpc_ingress_connection_request)

let error_message_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let invalid_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_state_exception)

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_request_exception)

let internal_service_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_service_error_exception)

let service_name_of_yojson = string_of_yojson
let service_id_of_yojson = string_of_yojson

let service_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPERATION_IN_PROGRESS" -> OPERATION_IN_PROGRESS
    | `String "PAUSED" -> PAUSED
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "DELETED" -> DELETED
    | `String "RUNNING" -> RUNNING
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceStatus")
     : service_status)
    : service_status)

let source_code_version_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BRANCH" -> BRANCH
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SourceCodeVersionType" value)
    | _ -> raise (deserialize_wrong_type_error path "SourceCodeVersionType")
     : source_code_version_type)
    : source_code_version_type)

let source_code_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key string__of_yojson "Value" _list path;
     type_ = value_for_key source_code_version_type_of_yojson "Type" _list path;
   }
    : source_code_version)

let configuration_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "API" -> API
    | `String "REPOSITORY" -> REPOSITORY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConfigurationSource" value)
    | _ -> raise (deserialize_wrong_type_error path "ConfigurationSource")
     : configuration_source)
    : configuration_source)

let runtime_of_yojson (tree : t) path =
  ((match tree with
    | `String "NODEJS_22" -> NODEJS_22
    | `String "NODEJS_18" -> NODEJS_18
    | `String "PYTHON_311" -> PYTHON_311
    | `String "RUBY_31" -> RUBY_31
    | `String "PHP_81" -> PHP_81
    | `String "DOTNET_6" -> DOTNET_6
    | `String "GO_1" -> GO_1
    | `String "NODEJS_16" -> NODEJS_16
    | `String "CORRETTO_11" -> CORRETTO_11
    | `String "CORRETTO_8" -> CORRETTO_8
    | `String "NODEJS_14" -> NODEJS_14
    | `String "NODEJS_12" -> NODEJS_12
    | `String "PYTHON_3" -> PYTHON_3
    | `String value -> raise (deserialize_unknown_enum_value_error path "Runtime" value)
    | _ -> raise (deserialize_wrong_type_error path "Runtime")
     : runtime)
    : runtime)

let build_command_of_yojson = string_of_yojson
let start_command_of_yojson = string_of_yojson
let runtime_environment_variables_value_of_yojson = string_of_yojson
let runtime_environment_variables_key_of_yojson = string_of_yojson

let runtime_environment_variables_of_yojson tree path =
  map_of_yojson runtime_environment_variables_key_of_yojson
    runtime_environment_variables_value_of_yojson tree path

let runtime_environment_secrets_value_of_yojson = string_of_yojson
let runtime_environment_secrets_name_of_yojson = string_of_yojson

let runtime_environment_secrets_of_yojson tree path =
  map_of_yojson runtime_environment_secrets_name_of_yojson
    runtime_environment_secrets_value_of_yojson tree path

let code_configuration_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     runtime_environment_secrets =
       option_of_yojson
         (value_for_key runtime_environment_secrets_of_yojson "RuntimeEnvironmentSecrets")
         _list path;
     runtime_environment_variables =
       option_of_yojson
         (value_for_key runtime_environment_variables_of_yojson "RuntimeEnvironmentVariables")
         _list path;
     port = option_of_yojson (value_for_key string__of_yojson "Port") _list path;
     start_command =
       option_of_yojson (value_for_key start_command_of_yojson "StartCommand") _list path;
     build_command =
       option_of_yojson (value_for_key build_command_of_yojson "BuildCommand") _list path;
     runtime = value_for_key runtime_of_yojson "Runtime" _list path;
   }
    : code_configuration_values)

let code_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code_configuration_values =
       option_of_yojson
         (value_for_key code_configuration_values_of_yojson "CodeConfigurationValues")
         _list path;
     configuration_source =
       value_for_key configuration_source_of_yojson "ConfigurationSource" _list path;
   }
    : code_configuration)

let source_directory_of_yojson = string_of_yojson

let code_repository_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_directory =
       option_of_yojson (value_for_key source_directory_of_yojson "SourceDirectory") _list path;
     code_configuration =
       option_of_yojson (value_for_key code_configuration_of_yojson "CodeConfiguration") _list path;
     source_code_version =
       value_for_key source_code_version_of_yojson "SourceCodeVersion" _list path;
     repository_url = value_for_key string__of_yojson "RepositoryUrl" _list path;
   }
    : code_repository)

let image_identifier_of_yojson = string_of_yojson

let image_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     runtime_environment_secrets =
       option_of_yojson
         (value_for_key runtime_environment_secrets_of_yojson "RuntimeEnvironmentSecrets")
         _list path;
     port = option_of_yojson (value_for_key string__of_yojson "Port") _list path;
     start_command =
       option_of_yojson (value_for_key start_command_of_yojson "StartCommand") _list path;
     runtime_environment_variables =
       option_of_yojson
         (value_for_key runtime_environment_variables_of_yojson "RuntimeEnvironmentVariables")
         _list path;
   }
    : image_configuration)

let image_repository_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ECR_PUBLIC" -> ECR_PUBLIC
    | `String "ECR" -> ECR
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImageRepositoryType" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageRepositoryType")
     : image_repository_type)
    : image_repository_type)

let image_repository_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_repository_type =
       value_for_key image_repository_type_of_yojson "ImageRepositoryType" _list path;
     image_configuration =
       option_of_yojson
         (value_for_key image_configuration_of_yojson "ImageConfiguration")
         _list path;
     image_identifier = value_for_key image_identifier_of_yojson "ImageIdentifier" _list path;
   }
    : image_repository)

let nullable_boolean_of_yojson = bool_of_yojson
let role_arn_of_yojson = string_of_yojson

let authentication_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "AccessRoleArn") _list path;
     connection_arn =
       option_of_yojson (value_for_key app_runner_resource_arn_of_yojson "ConnectionArn") _list path;
   }
    : authentication_configuration)

let source_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_configuration =
       option_of_yojson
         (value_for_key authentication_configuration_of_yojson "AuthenticationConfiguration")
         _list path;
     auto_deployments_enabled =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "AutoDeploymentsEnabled")
         _list path;
     image_repository =
       option_of_yojson (value_for_key image_repository_of_yojson "ImageRepository") _list path;
     code_repository =
       option_of_yojson (value_for_key code_repository_of_yojson "CodeRepository") _list path;
   }
    : source_configuration)

let cpu_of_yojson = string_of_yojson
let memory_of_yojson = string_of_yojson

let instance_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "InstanceRoleArn") _list path;
     memory = option_of_yojson (value_for_key memory_of_yojson "Memory") _list path;
     cpu = option_of_yojson (value_for_key cpu_of_yojson "Cpu") _list path;
   }
    : instance_configuration)

let kms_key_arn_of_yojson = string_of_yojson

let encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ kms_key = value_for_key kms_key_arn_of_yojson "KmsKey" _list path } : encryption_configuration)

let health_check_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "HTTP" -> HTTP
    | `String "TCP" -> TCP
    | `String value -> raise (deserialize_unknown_enum_value_error path "HealthCheckProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "HealthCheckProtocol")
     : health_check_protocol)
    : health_check_protocol)

let health_check_path_of_yojson = string_of_yojson
let health_check_interval_of_yojson = int_of_yojson
let health_check_timeout_of_yojson = int_of_yojson
let health_check_healthy_threshold_of_yojson = int_of_yojson
let health_check_unhealthy_threshold_of_yojson = int_of_yojson

let health_check_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unhealthy_threshold =
       option_of_yojson
         (value_for_key health_check_unhealthy_threshold_of_yojson "UnhealthyThreshold")
         _list path;
     healthy_threshold =
       option_of_yojson
         (value_for_key health_check_healthy_threshold_of_yojson "HealthyThreshold")
         _list path;
     timeout = option_of_yojson (value_for_key health_check_timeout_of_yojson "Timeout") _list path;
     interval =
       option_of_yojson (value_for_key health_check_interval_of_yojson "Interval") _list path;
     path = option_of_yojson (value_for_key health_check_path_of_yojson "Path") _list path;
     protocol =
       option_of_yojson (value_for_key health_check_protocol_of_yojson "Protocol") _list path;
   }
    : health_check_configuration)

let auto_scaling_configuration_name_of_yojson = string_of_yojson

let auto_scaling_configuration_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "INACTIVE" -> INACTIVE
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutoScalingConfigurationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoScalingConfigurationStatus")
     : auto_scaling_configuration_status)
    : auto_scaling_configuration_status)

let has_associated_service_of_yojson = bool_of_yojson
let is_default_of_yojson = bool_of_yojson

let auto_scaling_configuration_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_default = option_of_yojson (value_for_key is_default_of_yojson "IsDefault") _list path;
     has_associated_service =
       option_of_yojson
         (value_for_key has_associated_service_of_yojson "HasAssociatedService")
         _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     status =
       option_of_yojson
         (value_for_key auto_scaling_configuration_status_of_yojson "Status")
         _list path;
     auto_scaling_configuration_revision =
       option_of_yojson
         (value_for_key integer_of_yojson "AutoScalingConfigurationRevision")
         _list path;
     auto_scaling_configuration_name =
       option_of_yojson
         (value_for_key auto_scaling_configuration_name_of_yojson "AutoScalingConfigurationName")
         _list path;
     auto_scaling_configuration_arn =
       option_of_yojson
         (value_for_key app_runner_resource_arn_of_yojson "AutoScalingConfigurationArn")
         _list path;
   }
    : auto_scaling_configuration_summary)

let egress_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "VPC" -> VPC
    | `String "DEFAULT" -> DEFAULT
    | `String value -> raise (deserialize_unknown_enum_value_error path "EgressType" value)
    | _ -> raise (deserialize_wrong_type_error path "EgressType")
     : egress_type)
    : egress_type)

let egress_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_connector_arn =
       option_of_yojson
         (value_for_key app_runner_resource_arn_of_yojson "VpcConnectorArn")
         _list path;
     egress_type = option_of_yojson (value_for_key egress_type_of_yojson "EgressType") _list path;
   }
    : egress_configuration)

let boolean__of_yojson = bool_of_yojson

let ingress_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_publicly_accessible =
       option_of_yojson (value_for_key boolean__of_yojson "IsPubliclyAccessible") _list path;
   }
    : ingress_configuration)

let ip_address_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DUAL_STACK" -> DUAL_STACK
    | `String "IPV4" -> IPV4
    | `String value -> raise (deserialize_unknown_enum_value_error path "IpAddressType" value)
    | _ -> raise (deserialize_wrong_type_error path "IpAddressType")
     : ip_address_type)
    : ip_address_type)

let network_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "IpAddressType") _list path;
     ingress_configuration =
       option_of_yojson
         (value_for_key ingress_configuration_of_yojson "IngressConfiguration")
         _list path;
     egress_configuration =
       option_of_yojson
         (value_for_key egress_configuration_of_yojson "EgressConfiguration")
         _list path;
   }
    : network_configuration)

let service_observability_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     observability_configuration_arn =
       option_of_yojson
         (value_for_key app_runner_resource_arn_of_yojson "ObservabilityConfigurationArn")
         _list path;
     observability_enabled = value_for_key boolean__of_yojson "ObservabilityEnabled" _list path;
   }
    : service_observability_configuration)

let service_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     observability_configuration =
       option_of_yojson
         (value_for_key service_observability_configuration_of_yojson "ObservabilityConfiguration")
         _list path;
     network_configuration =
       value_for_key network_configuration_of_yojson "NetworkConfiguration" _list path;
     auto_scaling_configuration_summary =
       value_for_key auto_scaling_configuration_summary_of_yojson "AutoScalingConfigurationSummary"
         _list path;
     health_check_configuration =
       option_of_yojson
         (value_for_key health_check_configuration_of_yojson "HealthCheckConfiguration")
         _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     instance_configuration =
       value_for_key instance_configuration_of_yojson "InstanceConfiguration" _list path;
     source_configuration =
       value_for_key source_configuration_of_yojson "SourceConfiguration" _list path;
     status = value_for_key service_status_of_yojson "Status" _list path;
     deleted_at = option_of_yojson (value_for_key timestamp_of_yojson "DeletedAt") _list path;
     updated_at = value_for_key timestamp_of_yojson "UpdatedAt" _list path;
     created_at = value_for_key timestamp_of_yojson "CreatedAt" _list path;
     service_url = option_of_yojson (value_for_key string__of_yojson "ServiceUrl") _list path;
     service_arn = value_for_key app_runner_resource_arn_of_yojson "ServiceArn" _list path;
     service_id = value_for_key service_id_of_yojson "ServiceId" _list path;
     service_name = value_for_key service_name_of_yojson "ServiceName" _list path;
   }
    : service)

let uui_d_of_yojson = string_of_yojson

let update_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = value_for_key uui_d_of_yojson "OperationId" _list path;
     service = value_for_key service_of_yojson "Service" _list path;
   }
    : update_service_response)

let update_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     observability_configuration =
       option_of_yojson
         (value_for_key service_observability_configuration_of_yojson "ObservabilityConfiguration")
         _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "NetworkConfiguration")
         _list path;
     health_check_configuration =
       option_of_yojson
         (value_for_key health_check_configuration_of_yojson "HealthCheckConfiguration")
         _list path;
     auto_scaling_configuration_arn =
       option_of_yojson
         (value_for_key app_runner_resource_arn_of_yojson "AutoScalingConfigurationArn")
         _list path;
     instance_configuration =
       option_of_yojson
         (value_for_key instance_configuration_of_yojson "InstanceConfiguration")
         _list path;
     source_configuration =
       option_of_yojson
         (value_for_key source_configuration_of_yojson "SourceConfiguration")
         _list path;
     service_arn = value_for_key app_runner_resource_arn_of_yojson "ServiceArn" _list path;
   }
    : update_service_request)

let auto_scaling_configuration_revision_of_yojson = int_of_yojson
let latest_of_yojson = bool_of_yojson
let max_concurrency_of_yojson = int_of_yojson
let min_size_of_yojson = int_of_yojson
let max_size_of_yojson = int_of_yojson

let auto_scaling_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_default = option_of_yojson (value_for_key is_default_of_yojson "IsDefault") _list path;
     has_associated_service =
       option_of_yojson
         (value_for_key has_associated_service_of_yojson "HasAssociatedService")
         _list path;
     deleted_at = option_of_yojson (value_for_key timestamp_of_yojson "DeletedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     max_size = option_of_yojson (value_for_key max_size_of_yojson "MaxSize") _list path;
     min_size = option_of_yojson (value_for_key min_size_of_yojson "MinSize") _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     status =
       option_of_yojson
         (value_for_key auto_scaling_configuration_status_of_yojson "Status")
         _list path;
     latest = option_of_yojson (value_for_key latest_of_yojson "Latest") _list path;
     auto_scaling_configuration_revision =
       option_of_yojson
         (value_for_key auto_scaling_configuration_revision_of_yojson
            "AutoScalingConfigurationRevision")
         _list path;
     auto_scaling_configuration_name =
       option_of_yojson
         (value_for_key auto_scaling_configuration_name_of_yojson "AutoScalingConfigurationName")
         _list path;
     auto_scaling_configuration_arn =
       option_of_yojson
         (value_for_key app_runner_resource_arn_of_yojson "AutoScalingConfigurationArn")
         _list path;
   }
    : auto_scaling_configuration)

let update_default_auto_scaling_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_scaling_configuration =
       value_for_key auto_scaling_configuration_of_yojson "AutoScalingConfiguration" _list path;
   }
    : update_default_auto_scaling_configuration_response)

let update_default_auto_scaling_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_scaling_configuration_arn =
       value_for_key app_runner_resource_arn_of_yojson "AutoScalingConfigurationArn" _list path;
   }
    : update_default_auto_scaling_configuration_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_arn = value_for_key app_runner_resource_arn_of_yojson "ResourceArn" _list path;
   }
    : untag_resource_request)

let tracing_vendor_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWSXRAY" -> AWSXRAY
    | `String value -> raise (deserialize_unknown_enum_value_error path "TracingVendor" value)
    | _ -> raise (deserialize_wrong_type_error path "TracingVendor")
     : tracing_vendor)
    : tracing_vendor)

let trace_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vendor = value_for_key tracing_vendor_of_yojson "Vendor" _list path } : trace_configuration)

let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key tag_key_of_yojson "Key") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_arn = value_for_key app_runner_resource_arn_of_yojson "ResourceArn" _list path;
   }
    : tag_resource_request)

let start_deployment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation_id = value_for_key uui_d_of_yojson "OperationId" _list path }
    : start_deployment_response)

let start_deployment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_arn = value_for_key app_runner_resource_arn_of_yojson "ServiceArn" _list path }
    : start_deployment_request)

let service_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key service_status_of_yojson "Status") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     service_url = option_of_yojson (value_for_key string__of_yojson "ServiceUrl") _list path;
     service_arn =
       option_of_yojson (value_for_key app_runner_resource_arn_of_yojson "ServiceArn") _list path;
     service_id = option_of_yojson (value_for_key service_id_of_yojson "ServiceId") _list path;
     service_name = option_of_yojson (value_for_key service_name_of_yojson "ServiceName") _list path;
   }
    : service_summary)

let service_summary_list_of_yojson tree path = list_of_yojson service_summary_of_yojson tree path

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : service_quota_exceeded_exception)

let service_max_results_of_yojson = int_of_yojson

let service_arn_list_of_yojson tree path =
  list_of_yojson app_runner_resource_arn_of_yojson tree path

let resume_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key uui_d_of_yojson "OperationId") _list path;
     service = value_for_key service_of_yojson "Service" _list path;
   }
    : resume_service_response)

let resume_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_arn = value_for_key app_runner_resource_arn_of_yojson "ServiceArn" _list path }
    : resume_service_request)

let provider_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BITBUCKET" -> BITBUCKET
    | `String "GITHUB" -> GITHUB
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProviderType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProviderType")
     : provider_type)
    : provider_type)

let pause_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key uui_d_of_yojson "OperationId") _list path;
     service = value_for_key service_of_yojson "Service" _list path;
   }
    : pause_service_response)

let pause_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_arn = value_for_key app_runner_resource_arn_of_yojson "ServiceArn" _list path }
    : pause_service_request)

let operation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATE_SERVICE" -> UPDATE_SERVICE
    | `String "DELETE_SERVICE" -> DELETE_SERVICE
    | `String "RESUME_SERVICE" -> RESUME_SERVICE
    | `String "PAUSE_SERVICE" -> PAUSE_SERVICE
    | `String "CREATE_SERVICE" -> CREATE_SERVICE
    | `String "START_DEPLOYMENT" -> START_DEPLOYMENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationType" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationType")
     : operation_type)
    : operation_type)

let operation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ROLLBACK_SUCCEEDED" -> ROLLBACK_SUCCEEDED
    | `String "ROLLBACK_FAILED" -> ROLLBACK_FAILED
    | `String "ROLLBACK_IN_PROGRESS" -> ROLLBACK_IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationStatus")
     : operation_status)
    : operation_status)

let operation_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
     ended_at = option_of_yojson (value_for_key timestamp_of_yojson "EndedAt") _list path;
     started_at = option_of_yojson (value_for_key timestamp_of_yojson "StartedAt") _list path;
     target_arn =
       option_of_yojson (value_for_key app_runner_resource_arn_of_yojson "TargetArn") _list path;
     status = option_of_yojson (value_for_key operation_status_of_yojson "Status") _list path;
     type_ = option_of_yojson (value_for_key operation_type_of_yojson "Type") _list path;
     id = option_of_yojson (value_for_key uui_d_of_yojson "Id") _list path;
   }
    : operation_summary)

let operation_summary_list_of_yojson tree path =
  list_of_yojson operation_summary_of_yojson tree path

let observability_configuration_name_of_yojson = string_of_yojson

let observability_configuration_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     observability_configuration_revision =
       option_of_yojson
         (value_for_key integer_of_yojson "ObservabilityConfigurationRevision")
         _list path;
     observability_configuration_name =
       option_of_yojson
         (value_for_key observability_configuration_name_of_yojson "ObservabilityConfigurationName")
         _list path;
     observability_configuration_arn =
       option_of_yojson
         (value_for_key app_runner_resource_arn_of_yojson "ObservabilityConfigurationArn")
         _list path;
   }
    : observability_configuration_summary)

let observability_configuration_summary_list_of_yojson tree path =
  list_of_yojson observability_configuration_summary_of_yojson tree path

let observability_configuration_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "INACTIVE" -> INACTIVE
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ObservabilityConfigurationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ObservabilityConfigurationStatus")
     : observability_configuration_status)
    : observability_configuration_status)

let observability_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deleted_at = option_of_yojson (value_for_key timestamp_of_yojson "DeletedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     status =
       option_of_yojson
         (value_for_key observability_configuration_status_of_yojson "Status")
         _list path;
     latest = option_of_yojson (value_for_key boolean__of_yojson "Latest") _list path;
     observability_configuration_revision =
       option_of_yojson
         (value_for_key integer_of_yojson "ObservabilityConfigurationRevision")
         _list path;
     trace_configuration =
       option_of_yojson
         (value_for_key trace_configuration_of_yojson "TraceConfiguration")
         _list path;
     observability_configuration_name =
       option_of_yojson
         (value_for_key observability_configuration_name_of_yojson "ObservabilityConfigurationName")
         _list path;
     observability_configuration_arn =
       option_of_yojson
         (value_for_key app_runner_resource_arn_of_yojson "ObservabilityConfigurationArn")
         _list path;
   }
    : observability_configuration)

let next_token_of_yojson = string_of_yojson
let max_results_of_yojson = int_of_yojson

let list_vpc_ingress_connections_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     vpc_ingress_connection_summary_list =
       value_for_key vpc_ingress_connection_summary_list_of_yojson "VpcIngressConnectionSummaryList"
         _list path;
   }
    : list_vpc_ingress_connections_response)

let list_vpc_ingress_connections_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_id = option_of_yojson (value_for_key string__of_yojson "VpcEndpointId") _list path;
     service_arn =
       option_of_yojson (value_for_key app_runner_resource_arn_of_yojson "ServiceArn") _list path;
   }
    : list_vpc_ingress_connections_filter)

let list_vpc_ingress_connections_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     filter =
       option_of_yojson
         (value_for_key list_vpc_ingress_connections_filter_of_yojson "Filter")
         _list path;
   }
    : list_vpc_ingress_connections_request)

let list_vpc_connectors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     vpc_connectors = value_for_key vpc_connectors_of_yojson "VpcConnectors" _list path;
   }
    : list_vpc_connectors_response)

let list_vpc_connectors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_vpc_connectors_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key app_runner_resource_arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let list_services_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     service_summary_list =
       value_for_key service_summary_list_of_yojson "ServiceSummaryList" _list path;
   }
    : list_services_response)

let list_services_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key service_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_services_request)

let list_services_for_auto_scaling_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     service_arn_list = value_for_key service_arn_list_of_yojson "ServiceArnList" _list path;
   }
    : list_services_for_auto_scaling_configuration_response)

let list_services_for_auto_scaling_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     auto_scaling_configuration_arn =
       value_for_key app_runner_resource_arn_of_yojson "AutoScalingConfigurationArn" _list path;
   }
    : list_services_for_auto_scaling_configuration_request)

let list_operations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     operation_summary_list =
       option_of_yojson
         (value_for_key operation_summary_list_of_yojson "OperationSummaryList")
         _list path;
   }
    : list_operations_response)

let list_operations_max_results_of_yojson = int_of_yojson

let list_operations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key list_operations_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     service_arn = value_for_key app_runner_resource_arn_of_yojson "ServiceArn" _list path;
   }
    : list_operations_request)

let list_observability_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     observability_configuration_summary_list =
       value_for_key observability_configuration_summary_list_of_yojson
         "ObservabilityConfigurationSummaryList" _list path;
   }
    : list_observability_configurations_response)

let list_observability_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     latest_only = option_of_yojson (value_for_key boolean__of_yojson "LatestOnly") _list path;
     observability_configuration_name =
       option_of_yojson
         (value_for_key observability_configuration_name_of_yojson "ObservabilityConfigurationName")
         _list path;
   }
    : list_observability_configurations_request)

let connection_name_of_yojson = string_of_yojson

let connection_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETED" -> DELETED
    | `String "ERROR" -> ERROR
    | `String "AVAILABLE" -> AVAILABLE
    | `String "PENDING_HANDSHAKE" -> PENDING_HANDSHAKE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionStatus")
     : connection_status)
    : connection_status)

let connection_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     status = option_of_yojson (value_for_key connection_status_of_yojson "Status") _list path;
     provider_type =
       option_of_yojson (value_for_key provider_type_of_yojson "ProviderType") _list path;
     connection_arn =
       option_of_yojson (value_for_key app_runner_resource_arn_of_yojson "ConnectionArn") _list path;
     connection_name =
       option_of_yojson (value_for_key connection_name_of_yojson "ConnectionName") _list path;
   }
    : connection_summary)

let connection_summary_list_of_yojson tree path =
  list_of_yojson connection_summary_of_yojson tree path

let list_connections_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     connection_summary_list =
       value_for_key connection_summary_list_of_yojson "ConnectionSummaryList" _list path;
   }
    : list_connections_response)

let list_connections_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     connection_name =
       option_of_yojson (value_for_key connection_name_of_yojson "ConnectionName") _list path;
   }
    : list_connections_request)

let auto_scaling_configuration_summary_list_of_yojson tree path =
  list_of_yojson auto_scaling_configuration_summary_of_yojson tree path

let list_auto_scaling_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     auto_scaling_configuration_summary_list =
       value_for_key auto_scaling_configuration_summary_list_of_yojson
         "AutoScalingConfigurationSummaryList" _list path;
   }
    : list_auto_scaling_configurations_response)

let list_auto_scaling_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     latest_only = option_of_yojson (value_for_key boolean__of_yojson "LatestOnly") _list path;
     auto_scaling_configuration_name =
       option_of_yojson
         (value_for_key auto_scaling_configuration_name_of_yojson "AutoScalingConfigurationName")
         _list path;
   }
    : list_auto_scaling_configurations_request)

let certificate_validation_record_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "SUCCESS" -> SUCCESS
    | `String "PENDING_VALIDATION" -> PENDING_VALIDATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CertificateValidationRecordStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateValidationRecordStatus")
     : certificate_validation_record_status)
    : certificate_validation_record_status)

let certificate_validation_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson
         (value_for_key certificate_validation_record_status_of_yojson "Status")
         _list path;
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
     type_ = option_of_yojson (value_for_key string__of_yojson "Type") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : certificate_validation_record)

let certificate_validation_record_list_of_yojson tree path =
  list_of_yojson certificate_validation_record_of_yojson tree path

let custom_domain_association_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "BINDING_CERTIFICATE" -> BINDING_CERTIFICATE
    | `String "PENDING_CERTIFICATE_DNS_VALIDATION" -> PENDING_CERTIFICATE_DNS_VALIDATION
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "CREATING" -> CREATING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CustomDomainAssociationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomDomainAssociationStatus")
     : custom_domain_association_status)
    : custom_domain_association_status)

let custom_domain_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key custom_domain_association_status_of_yojson "Status" _list path;
     certificate_validation_records =
       option_of_yojson
         (value_for_key certificate_validation_record_list_of_yojson "CertificateValidationRecords")
         _list path;
     enable_www_subdomain = value_for_key nullable_boolean_of_yojson "EnableWWWSubdomain" _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : custom_domain)

let disassociate_custom_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_dns_targets = value_for_key vpc_dns_target_list_of_yojson "VpcDNSTargets" _list path;
     custom_domain = value_for_key custom_domain_of_yojson "CustomDomain" _list path;
     service_arn = value_for_key app_runner_resource_arn_of_yojson "ServiceArn" _list path;
     dns_target = value_for_key string__of_yojson "DNSTarget" _list path;
   }
    : disassociate_custom_domain_response)

let disassociate_custom_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     service_arn = value_for_key app_runner_resource_arn_of_yojson "ServiceArn" _list path;
   }
    : disassociate_custom_domain_request)

let describe_vpc_ingress_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_ingress_connection =
       value_for_key vpc_ingress_connection_of_yojson "VpcIngressConnection" _list path;
   }
    : describe_vpc_ingress_connection_response)

let describe_vpc_ingress_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_ingress_connection_arn =
       value_for_key app_runner_resource_arn_of_yojson "VpcIngressConnectionArn" _list path;
   }
    : describe_vpc_ingress_connection_request)

let describe_vpc_connector_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vpc_connector = value_for_key vpc_connector_of_yojson "VpcConnector" _list path }
    : describe_vpc_connector_response)

let describe_vpc_connector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_connector_arn =
       value_for_key app_runner_resource_arn_of_yojson "VpcConnectorArn" _list path;
   }
    : describe_vpc_connector_request)

let describe_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service = value_for_key service_of_yojson "Service" _list path } : describe_service_response)

let describe_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_arn = value_for_key app_runner_resource_arn_of_yojson "ServiceArn" _list path }
    : describe_service_request)

let describe_observability_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     observability_configuration =
       value_for_key observability_configuration_of_yojson "ObservabilityConfiguration" _list path;
   }
    : describe_observability_configuration_response)

let describe_observability_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     observability_configuration_arn =
       value_for_key app_runner_resource_arn_of_yojson "ObservabilityConfigurationArn" _list path;
   }
    : describe_observability_configuration_request)

let custom_domain_list_of_yojson tree path = list_of_yojson custom_domain_of_yojson tree path

let describe_custom_domains_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     vpc_dns_targets = value_for_key vpc_dns_target_list_of_yojson "VpcDNSTargets" _list path;
     custom_domains = value_for_key custom_domain_list_of_yojson "CustomDomains" _list path;
     service_arn = value_for_key app_runner_resource_arn_of_yojson "ServiceArn" _list path;
     dns_target = value_for_key string__of_yojson "DNSTarget" _list path;
   }
    : describe_custom_domains_response)

let describe_custom_domains_max_results_of_yojson = int_of_yojson

let describe_custom_domains_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key describe_custom_domains_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     service_arn = value_for_key app_runner_resource_arn_of_yojson "ServiceArn" _list path;
   }
    : describe_custom_domains_request)

let describe_auto_scaling_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_scaling_configuration =
       value_for_key auto_scaling_configuration_of_yojson "AutoScalingConfiguration" _list path;
   }
    : describe_auto_scaling_configuration_response)

let describe_auto_scaling_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_scaling_configuration_arn =
       value_for_key app_runner_resource_arn_of_yojson "AutoScalingConfigurationArn" _list path;
   }
    : describe_auto_scaling_configuration_request)

let delete_vpc_ingress_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_ingress_connection =
       value_for_key vpc_ingress_connection_of_yojson "VpcIngressConnection" _list path;
   }
    : delete_vpc_ingress_connection_response)

let delete_vpc_ingress_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_ingress_connection_arn =
       value_for_key app_runner_resource_arn_of_yojson "VpcIngressConnectionArn" _list path;
   }
    : delete_vpc_ingress_connection_request)

let delete_vpc_connector_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vpc_connector = value_for_key vpc_connector_of_yojson "VpcConnector" _list path }
    : delete_vpc_connector_response)

let delete_vpc_connector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_connector_arn =
       value_for_key app_runner_resource_arn_of_yojson "VpcConnectorArn" _list path;
   }
    : delete_vpc_connector_request)

let delete_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = value_for_key uui_d_of_yojson "OperationId" _list path;
     service = value_for_key service_of_yojson "Service" _list path;
   }
    : delete_service_response)

let delete_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_arn = value_for_key app_runner_resource_arn_of_yojson "ServiceArn" _list path }
    : delete_service_request)

let delete_observability_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     observability_configuration =
       value_for_key observability_configuration_of_yojson "ObservabilityConfiguration" _list path;
   }
    : delete_observability_configuration_response)

let delete_observability_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     observability_configuration_arn =
       value_for_key app_runner_resource_arn_of_yojson "ObservabilityConfigurationArn" _list path;
   }
    : delete_observability_configuration_request)

let connection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     status = option_of_yojson (value_for_key connection_status_of_yojson "Status") _list path;
     provider_type =
       option_of_yojson (value_for_key provider_type_of_yojson "ProviderType") _list path;
     connection_arn =
       option_of_yojson (value_for_key app_runner_resource_arn_of_yojson "ConnectionArn") _list path;
     connection_name =
       option_of_yojson (value_for_key connection_name_of_yojson "ConnectionName") _list path;
   }
    : connection)

let delete_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection = option_of_yojson (value_for_key connection_of_yojson "Connection") _list path }
    : delete_connection_response)

let delete_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection_arn = value_for_key app_runner_resource_arn_of_yojson "ConnectionArn" _list path }
    : delete_connection_request)

let delete_auto_scaling_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_scaling_configuration =
       value_for_key auto_scaling_configuration_of_yojson "AutoScalingConfiguration" _list path;
   }
    : delete_auto_scaling_configuration_response)

let delete_auto_scaling_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_all_revisions =
       option_of_yojson (value_for_key boolean__of_yojson "DeleteAllRevisions") _list path;
     auto_scaling_configuration_arn =
       value_for_key app_runner_resource_arn_of_yojson "AutoScalingConfigurationArn" _list path;
   }
    : delete_auto_scaling_configuration_request)

let create_vpc_ingress_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_ingress_connection =
       value_for_key vpc_ingress_connection_of_yojson "VpcIngressConnection" _list path;
   }
    : create_vpc_ingress_connection_response)

let create_vpc_ingress_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     ingress_vpc_configuration =
       value_for_key ingress_vpc_configuration_of_yojson "IngressVpcConfiguration" _list path;
     vpc_ingress_connection_name =
       value_for_key vpc_ingress_connection_name_of_yojson "VpcIngressConnectionName" _list path;
     service_arn = value_for_key app_runner_resource_arn_of_yojson "ServiceArn" _list path;
   }
    : create_vpc_ingress_connection_request)

let create_vpc_connector_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vpc_connector = value_for_key vpc_connector_of_yojson "VpcConnector" _list path }
    : create_vpc_connector_response)

let create_vpc_connector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     security_groups =
       option_of_yojson (value_for_key string_list_of_yojson "SecurityGroups") _list path;
     subnets = value_for_key string_list_of_yojson "Subnets" _list path;
     vpc_connector_name = value_for_key vpc_connector_name_of_yojson "VpcConnectorName" _list path;
   }
    : create_vpc_connector_request)

let create_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = value_for_key uui_d_of_yojson "OperationId" _list path;
     service = value_for_key service_of_yojson "Service" _list path;
   }
    : create_service_response)

let create_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     observability_configuration =
       option_of_yojson
         (value_for_key service_observability_configuration_of_yojson "ObservabilityConfiguration")
         _list path;
     network_configuration =
       option_of_yojson
         (value_for_key network_configuration_of_yojson "NetworkConfiguration")
         _list path;
     auto_scaling_configuration_arn =
       option_of_yojson
         (value_for_key app_runner_resource_arn_of_yojson "AutoScalingConfigurationArn")
         _list path;
     health_check_configuration =
       option_of_yojson
         (value_for_key health_check_configuration_of_yojson "HealthCheckConfiguration")
         _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     instance_configuration =
       option_of_yojson
         (value_for_key instance_configuration_of_yojson "InstanceConfiguration")
         _list path;
     source_configuration =
       value_for_key source_configuration_of_yojson "SourceConfiguration" _list path;
     service_name = value_for_key service_name_of_yojson "ServiceName" _list path;
   }
    : create_service_request)

let create_observability_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     observability_configuration =
       value_for_key observability_configuration_of_yojson "ObservabilityConfiguration" _list path;
   }
    : create_observability_configuration_response)

let create_observability_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     trace_configuration =
       option_of_yojson
         (value_for_key trace_configuration_of_yojson "TraceConfiguration")
         _list path;
     observability_configuration_name =
       value_for_key observability_configuration_name_of_yojson "ObservabilityConfigurationName"
         _list path;
   }
    : create_observability_configuration_request)

let create_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection = value_for_key connection_of_yojson "Connection" _list path }
    : create_connection_response)

let create_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     provider_type = value_for_key provider_type_of_yojson "ProviderType" _list path;
     connection_name = value_for_key connection_name_of_yojson "ConnectionName" _list path;
   }
    : create_connection_request)

let create_auto_scaling_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_scaling_configuration =
       value_for_key auto_scaling_configuration_of_yojson "AutoScalingConfiguration" _list path;
   }
    : create_auto_scaling_configuration_response)

let as_config_max_concurrency_of_yojson = int_of_yojson
let as_config_min_size_of_yojson = int_of_yojson
let as_config_max_size_of_yojson = int_of_yojson

let create_auto_scaling_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     max_size = option_of_yojson (value_for_key as_config_max_size_of_yojson "MaxSize") _list path;
     min_size = option_of_yojson (value_for_key as_config_min_size_of_yojson "MinSize") _list path;
     max_concurrency =
       option_of_yojson
         (value_for_key as_config_max_concurrency_of_yojson "MaxConcurrency")
         _list path;
     auto_scaling_configuration_name =
       value_for_key auto_scaling_configuration_name_of_yojson "AutoScalingConfigurationName" _list
         path;
   }
    : create_auto_scaling_configuration_request)

let associate_custom_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_dns_targets = value_for_key vpc_dns_target_list_of_yojson "VpcDNSTargets" _list path;
     custom_domain = value_for_key custom_domain_of_yojson "CustomDomain" _list path;
     service_arn = value_for_key app_runner_resource_arn_of_yojson "ServiceArn" _list path;
     dns_target = value_for_key string__of_yojson "DNSTarget" _list path;
   }
    : associate_custom_domain_response)

let associate_custom_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_www_subdomain =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "EnableWWWSubdomain") _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     service_arn = value_for_key app_runner_resource_arn_of_yojson "ServiceArn" _list path;
   }
    : associate_custom_domain_request)
