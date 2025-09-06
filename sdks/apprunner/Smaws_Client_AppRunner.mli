(** AppRunner client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_vpc_ingress_connection_summary :
  ?service_arn:app_runner_resource_arn ->
  ?vpc_ingress_connection_arn:app_runner_resource_arn ->
  unit ->
  vpc_ingress_connection_summary

val make_ingress_vpc_configuration :
  ?vpc_endpoint_id:string_ -> ?vpc_id:string_ -> unit -> ingress_vpc_configuration

val make_vpc_ingress_connection :
  ?deleted_at:timestamp ->
  ?created_at:timestamp ->
  ?ingress_vpc_configuration:ingress_vpc_configuration ->
  ?domain_name:domain_name ->
  ?account_id:customer_account_id ->
  ?status:vpc_ingress_connection_status ->
  ?service_arn:app_runner_resource_arn ->
  ?vpc_ingress_connection_name:vpc_ingress_connection_name ->
  ?vpc_ingress_connection_arn:app_runner_resource_arn ->
  unit ->
  vpc_ingress_connection

val make_vpc_dns_target :
  ?domain_name:domain_name ->
  ?vpc_id:string_ ->
  ?vpc_ingress_connection_arn:app_runner_resource_arn ->
  unit ->
  vpc_dns_target

val make_vpc_connector :
  ?deleted_at:timestamp ->
  ?created_at:timestamp ->
  ?status:vpc_connector_status ->
  ?security_groups:string_list ->
  ?subnets:string_list ->
  ?vpc_connector_revision:integer ->
  ?vpc_connector_arn:app_runner_resource_arn ->
  ?vpc_connector_name:vpc_connector_name ->
  unit ->
  vpc_connector

val make_update_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection -> unit -> update_vpc_ingress_connection_response

val make_update_vpc_ingress_connection_request :
  ingress_vpc_configuration:ingress_vpc_configuration ->
  vpc_ingress_connection_arn:app_runner_resource_arn ->
  unit ->
  update_vpc_ingress_connection_request

val make_source_code_version :
  value:string_ -> type_:source_code_version_type -> unit -> source_code_version

val make_code_configuration_values :
  ?runtime_environment_secrets:runtime_environment_secrets ->
  ?runtime_environment_variables:runtime_environment_variables ->
  ?port:string_ ->
  ?start_command:start_command ->
  ?build_command:build_command ->
  runtime:runtime ->
  unit ->
  code_configuration_values

val make_code_configuration :
  ?code_configuration_values:code_configuration_values ->
  configuration_source:configuration_source ->
  unit ->
  code_configuration

val make_code_repository :
  ?source_directory:source_directory ->
  ?code_configuration:code_configuration ->
  source_code_version:source_code_version ->
  repository_url:string_ ->
  unit ->
  code_repository

val make_image_configuration :
  ?runtime_environment_secrets:runtime_environment_secrets ->
  ?port:string_ ->
  ?start_command:start_command ->
  ?runtime_environment_variables:runtime_environment_variables ->
  unit ->
  image_configuration

val make_image_repository :
  ?image_configuration:image_configuration ->
  image_repository_type:image_repository_type ->
  image_identifier:image_identifier ->
  unit ->
  image_repository

val make_authentication_configuration :
  ?access_role_arn:role_arn ->
  ?connection_arn:app_runner_resource_arn ->
  unit ->
  authentication_configuration

val make_source_configuration :
  ?authentication_configuration:authentication_configuration ->
  ?auto_deployments_enabled:nullable_boolean ->
  ?image_repository:image_repository ->
  ?code_repository:code_repository ->
  unit ->
  source_configuration

val make_instance_configuration :
  ?instance_role_arn:role_arn -> ?memory:memory -> ?cpu:cpu -> unit -> instance_configuration

val make_encryption_configuration : kms_key:kms_key_arn -> unit -> encryption_configuration

val make_health_check_configuration :
  ?unhealthy_threshold:health_check_unhealthy_threshold ->
  ?healthy_threshold:health_check_healthy_threshold ->
  ?timeout:health_check_timeout ->
  ?interval:health_check_interval ->
  ?path:health_check_path ->
  ?protocol:health_check_protocol ->
  unit ->
  health_check_configuration

val make_auto_scaling_configuration_summary :
  ?is_default:is_default ->
  ?has_associated_service:has_associated_service ->
  ?created_at:timestamp ->
  ?status:auto_scaling_configuration_status ->
  ?auto_scaling_configuration_revision:integer ->
  ?auto_scaling_configuration_name:auto_scaling_configuration_name ->
  ?auto_scaling_configuration_arn:app_runner_resource_arn ->
  unit ->
  auto_scaling_configuration_summary

val make_egress_configuration :
  ?vpc_connector_arn:app_runner_resource_arn ->
  ?egress_type:egress_type ->
  unit ->
  egress_configuration

val make_ingress_configuration : ?is_publicly_accessible:boolean_ -> unit -> ingress_configuration

val make_network_configuration :
  ?ip_address_type:ip_address_type ->
  ?ingress_configuration:ingress_configuration ->
  ?egress_configuration:egress_configuration ->
  unit ->
  network_configuration

val make_service_observability_configuration :
  ?observability_configuration_arn:app_runner_resource_arn ->
  observability_enabled:boolean_ ->
  unit ->
  service_observability_configuration

val make_service :
  ?observability_configuration:service_observability_configuration ->
  ?health_check_configuration:health_check_configuration ->
  ?encryption_configuration:encryption_configuration ->
  ?deleted_at:timestamp ->
  ?service_url:string_ ->
  network_configuration:network_configuration ->
  auto_scaling_configuration_summary:auto_scaling_configuration_summary ->
  instance_configuration:instance_configuration ->
  source_configuration:source_configuration ->
  status:service_status ->
  updated_at:timestamp ->
  created_at:timestamp ->
  service_arn:app_runner_resource_arn ->
  service_id:service_id ->
  service_name:service_name ->
  unit ->
  service

val make_update_service_response :
  operation_id:uui_d -> service:service -> unit -> update_service_response

val make_update_service_request :
  ?observability_configuration:service_observability_configuration ->
  ?network_configuration:network_configuration ->
  ?health_check_configuration:health_check_configuration ->
  ?auto_scaling_configuration_arn:app_runner_resource_arn ->
  ?instance_configuration:instance_configuration ->
  ?source_configuration:source_configuration ->
  service_arn:app_runner_resource_arn ->
  unit ->
  update_service_request

val make_auto_scaling_configuration :
  ?is_default:is_default ->
  ?has_associated_service:has_associated_service ->
  ?deleted_at:timestamp ->
  ?created_at:timestamp ->
  ?max_size:max_size ->
  ?min_size:min_size ->
  ?max_concurrency:max_concurrency ->
  ?status:auto_scaling_configuration_status ->
  ?latest:latest ->
  ?auto_scaling_configuration_revision:auto_scaling_configuration_revision ->
  ?auto_scaling_configuration_name:auto_scaling_configuration_name ->
  ?auto_scaling_configuration_arn:app_runner_resource_arn ->
  unit ->
  auto_scaling_configuration

val make_update_default_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration ->
  unit ->
  update_default_auto_scaling_configuration_response

val make_update_default_auto_scaling_configuration_request :
  auto_scaling_configuration_arn:app_runner_resource_arn ->
  unit ->
  update_default_auto_scaling_configuration_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:app_runner_resource_arn -> unit -> untag_resource_request

val make_trace_configuration : vendor:tracing_vendor -> unit -> trace_configuration
val make_tag_resource_response : unit -> unit
val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_arn:app_runner_resource_arn -> unit -> tag_resource_request

val make_start_deployment_response : operation_id:uui_d -> unit -> start_deployment_response

val make_start_deployment_request :
  service_arn:app_runner_resource_arn -> unit -> start_deployment_request

val make_service_summary :
  ?status:service_status ->
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?service_url:string_ ->
  ?service_arn:app_runner_resource_arn ->
  ?service_id:service_id ->
  ?service_name:service_name ->
  unit ->
  service_summary

val make_resume_service_response :
  ?operation_id:uui_d -> service:service -> unit -> resume_service_response

val make_resume_service_request :
  service_arn:app_runner_resource_arn -> unit -> resume_service_request

val make_pause_service_response :
  ?operation_id:uui_d -> service:service -> unit -> pause_service_response

val make_pause_service_request :
  service_arn:app_runner_resource_arn -> unit -> pause_service_request

val make_operation_summary :
  ?updated_at:timestamp ->
  ?ended_at:timestamp ->
  ?started_at:timestamp ->
  ?target_arn:app_runner_resource_arn ->
  ?status:operation_status ->
  ?type_:operation_type ->
  ?id:uui_d ->
  unit ->
  operation_summary

val make_observability_configuration_summary :
  ?observability_configuration_revision:integer ->
  ?observability_configuration_name:observability_configuration_name ->
  ?observability_configuration_arn:app_runner_resource_arn ->
  unit ->
  observability_configuration_summary

val make_observability_configuration :
  ?deleted_at:timestamp ->
  ?created_at:timestamp ->
  ?status:observability_configuration_status ->
  ?latest:boolean_ ->
  ?observability_configuration_revision:integer ->
  ?trace_configuration:trace_configuration ->
  ?observability_configuration_name:observability_configuration_name ->
  ?observability_configuration_arn:app_runner_resource_arn ->
  unit ->
  observability_configuration

val make_list_vpc_ingress_connections_response :
  ?next_token:next_token ->
  vpc_ingress_connection_summary_list:vpc_ingress_connection_summary_list ->
  unit ->
  list_vpc_ingress_connections_response

val make_list_vpc_ingress_connections_filter :
  ?vpc_endpoint_id:string_ ->
  ?service_arn:app_runner_resource_arn ->
  unit ->
  list_vpc_ingress_connections_filter

val make_list_vpc_ingress_connections_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filter:list_vpc_ingress_connections_filter ->
  unit ->
  list_vpc_ingress_connections_request

val make_list_vpc_connectors_response :
  ?next_token:next_token -> vpc_connectors:vpc_connectors -> unit -> list_vpc_connectors_response

val make_list_vpc_connectors_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_vpc_connectors_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:app_runner_resource_arn -> unit -> list_tags_for_resource_request

val make_list_services_response :
  ?next_token:string_ -> service_summary_list:service_summary_list -> unit -> list_services_response

val make_list_services_request :
  ?max_results:service_max_results -> ?next_token:string_ -> unit -> list_services_request

val make_list_services_for_auto_scaling_configuration_response :
  ?next_token:next_token ->
  service_arn_list:service_arn_list ->
  unit ->
  list_services_for_auto_scaling_configuration_response

val make_list_services_for_auto_scaling_configuration_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  auto_scaling_configuration_arn:app_runner_resource_arn ->
  unit ->
  list_services_for_auto_scaling_configuration_request

val make_list_operations_response :
  ?next_token:string_ ->
  ?operation_summary_list:operation_summary_list ->
  unit ->
  list_operations_response

val make_list_operations_request :
  ?max_results:list_operations_max_results ->
  ?next_token:string_ ->
  service_arn:app_runner_resource_arn ->
  unit ->
  list_operations_request

val make_list_observability_configurations_response :
  ?next_token:next_token ->
  observability_configuration_summary_list:observability_configuration_summary_list ->
  unit ->
  list_observability_configurations_response

val make_list_observability_configurations_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?latest_only:boolean_ ->
  ?observability_configuration_name:observability_configuration_name ->
  unit ->
  list_observability_configurations_request

val make_connection_summary :
  ?created_at:timestamp ->
  ?status:connection_status ->
  ?provider_type:provider_type ->
  ?connection_arn:app_runner_resource_arn ->
  ?connection_name:connection_name ->
  unit ->
  connection_summary

val make_list_connections_response :
  ?next_token:next_token ->
  connection_summary_list:connection_summary_list ->
  unit ->
  list_connections_response

val make_list_connections_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?connection_name:connection_name ->
  unit ->
  list_connections_request

val make_list_auto_scaling_configurations_response :
  ?next_token:next_token ->
  auto_scaling_configuration_summary_list:auto_scaling_configuration_summary_list ->
  unit ->
  list_auto_scaling_configurations_response

val make_list_auto_scaling_configurations_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?latest_only:boolean_ ->
  ?auto_scaling_configuration_name:auto_scaling_configuration_name ->
  unit ->
  list_auto_scaling_configurations_request

val make_certificate_validation_record :
  ?status:certificate_validation_record_status ->
  ?value:string_ ->
  ?type_:string_ ->
  ?name:string_ ->
  unit ->
  certificate_validation_record

val make_custom_domain :
  ?certificate_validation_records:certificate_validation_record_list ->
  status:custom_domain_association_status ->
  enable_www_subdomain:nullable_boolean ->
  domain_name:domain_name ->
  unit ->
  custom_domain

val make_disassociate_custom_domain_response :
  vpc_dns_targets:vpc_dns_target_list ->
  custom_domain:custom_domain ->
  service_arn:app_runner_resource_arn ->
  dns_target:string_ ->
  unit ->
  disassociate_custom_domain_response

val make_disassociate_custom_domain_request :
  domain_name:domain_name ->
  service_arn:app_runner_resource_arn ->
  unit ->
  disassociate_custom_domain_request

val make_describe_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection -> unit -> describe_vpc_ingress_connection_response

val make_describe_vpc_ingress_connection_request :
  vpc_ingress_connection_arn:app_runner_resource_arn ->
  unit ->
  describe_vpc_ingress_connection_request

val make_describe_vpc_connector_response :
  vpc_connector:vpc_connector -> unit -> describe_vpc_connector_response

val make_describe_vpc_connector_request :
  vpc_connector_arn:app_runner_resource_arn -> unit -> describe_vpc_connector_request

val make_describe_service_response : service:service -> unit -> describe_service_response

val make_describe_service_request :
  service_arn:app_runner_resource_arn -> unit -> describe_service_request

val make_describe_observability_configuration_response :
  observability_configuration:observability_configuration ->
  unit ->
  describe_observability_configuration_response

val make_describe_observability_configuration_request :
  observability_configuration_arn:app_runner_resource_arn ->
  unit ->
  describe_observability_configuration_request

val make_describe_custom_domains_response :
  ?next_token:string_ ->
  vpc_dns_targets:vpc_dns_target_list ->
  custom_domains:custom_domain_list ->
  service_arn:app_runner_resource_arn ->
  dns_target:string_ ->
  unit ->
  describe_custom_domains_response

val make_describe_custom_domains_request :
  ?max_results:describe_custom_domains_max_results ->
  ?next_token:string_ ->
  service_arn:app_runner_resource_arn ->
  unit ->
  describe_custom_domains_request

val make_describe_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration ->
  unit ->
  describe_auto_scaling_configuration_response

val make_describe_auto_scaling_configuration_request :
  auto_scaling_configuration_arn:app_runner_resource_arn ->
  unit ->
  describe_auto_scaling_configuration_request

val make_delete_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection -> unit -> delete_vpc_ingress_connection_response

val make_delete_vpc_ingress_connection_request :
  vpc_ingress_connection_arn:app_runner_resource_arn ->
  unit ->
  delete_vpc_ingress_connection_request

val make_delete_vpc_connector_response :
  vpc_connector:vpc_connector -> unit -> delete_vpc_connector_response

val make_delete_vpc_connector_request :
  vpc_connector_arn:app_runner_resource_arn -> unit -> delete_vpc_connector_request

val make_delete_service_response :
  operation_id:uui_d -> service:service -> unit -> delete_service_response

val make_delete_service_request :
  service_arn:app_runner_resource_arn -> unit -> delete_service_request

val make_delete_observability_configuration_response :
  observability_configuration:observability_configuration ->
  unit ->
  delete_observability_configuration_response

val make_delete_observability_configuration_request :
  observability_configuration_arn:app_runner_resource_arn ->
  unit ->
  delete_observability_configuration_request

val make_connection :
  ?created_at:timestamp ->
  ?status:connection_status ->
  ?provider_type:provider_type ->
  ?connection_arn:app_runner_resource_arn ->
  ?connection_name:connection_name ->
  unit ->
  connection

val make_delete_connection_response : ?connection:connection -> unit -> delete_connection_response

val make_delete_connection_request :
  connection_arn:app_runner_resource_arn -> unit -> delete_connection_request

val make_delete_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration ->
  unit ->
  delete_auto_scaling_configuration_response

val make_delete_auto_scaling_configuration_request :
  ?delete_all_revisions:boolean_ ->
  auto_scaling_configuration_arn:app_runner_resource_arn ->
  unit ->
  delete_auto_scaling_configuration_request

val make_create_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection -> unit -> create_vpc_ingress_connection_response

val make_create_vpc_ingress_connection_request :
  ?tags:tag_list ->
  ingress_vpc_configuration:ingress_vpc_configuration ->
  vpc_ingress_connection_name:vpc_ingress_connection_name ->
  service_arn:app_runner_resource_arn ->
  unit ->
  create_vpc_ingress_connection_request

val make_create_vpc_connector_response :
  vpc_connector:vpc_connector -> unit -> create_vpc_connector_response

val make_create_vpc_connector_request :
  ?tags:tag_list ->
  ?security_groups:string_list ->
  subnets:string_list ->
  vpc_connector_name:vpc_connector_name ->
  unit ->
  create_vpc_connector_request

val make_create_service_response :
  operation_id:uui_d -> service:service -> unit -> create_service_response

val make_create_service_request :
  ?observability_configuration:service_observability_configuration ->
  ?network_configuration:network_configuration ->
  ?auto_scaling_configuration_arn:app_runner_resource_arn ->
  ?health_check_configuration:health_check_configuration ->
  ?encryption_configuration:encryption_configuration ->
  ?tags:tag_list ->
  ?instance_configuration:instance_configuration ->
  source_configuration:source_configuration ->
  service_name:service_name ->
  unit ->
  create_service_request

val make_create_observability_configuration_response :
  observability_configuration:observability_configuration ->
  unit ->
  create_observability_configuration_response

val make_create_observability_configuration_request :
  ?tags:tag_list ->
  ?trace_configuration:trace_configuration ->
  observability_configuration_name:observability_configuration_name ->
  unit ->
  create_observability_configuration_request

val make_create_connection_response : connection:connection -> unit -> create_connection_response

val make_create_connection_request :
  ?tags:tag_list ->
  provider_type:provider_type ->
  connection_name:connection_name ->
  unit ->
  create_connection_request

val make_create_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration ->
  unit ->
  create_auto_scaling_configuration_response

val make_create_auto_scaling_configuration_request :
  ?tags:tag_list ->
  ?max_size:as_config_max_size ->
  ?min_size:as_config_min_size ->
  ?max_concurrency:as_config_max_concurrency ->
  auto_scaling_configuration_name:auto_scaling_configuration_name ->
  unit ->
  create_auto_scaling_configuration_request

val make_associate_custom_domain_response :
  vpc_dns_targets:vpc_dns_target_list ->
  custom_domain:custom_domain ->
  service_arn:app_runner_resource_arn ->
  dns_target:string_ ->
  unit ->
  associate_custom_domain_response

val make_associate_custom_domain_request :
  ?enable_www_subdomain:nullable_boolean ->
  domain_name:domain_name ->
  service_arn:app_runner_resource_arn ->
  unit ->
  associate_custom_domain_request
(** {1:operations Operations} *)

module AssociateCustomDomain : sig
  val request :
    Smaws_Lib.Context.t ->
    associate_custom_domain_request ->
    ( associate_custom_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception ] )
    result
end
[@@ocaml.doc
  "Associate your own domain name with the App Runner subdomain URL of your App Runner service.\n\n\
  \ After you call [AssociateCustomDomain] and receive a successful response, use the information \
   in the [CustomDomain] record that's returned to add CNAME records to your Domain Name System \
   (DNS). For each mapped domain name, add a mapping to the target App Runner subdomain and one or \
   more certificate validation records. App Runner then performs DNS validation to verify that you \
   own or control the domain name that you associated. App Runner tracks domain validity in a \
   certificate stored in {{:https://docs.aws.amazon.com/acm/latest/userguide}AWS Certificate \
   Manager (ACM)}.\n\
  \ "]

module CreateAutoScalingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    create_auto_scaling_configuration_request ->
    ( create_auto_scaling_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result
end
[@@ocaml.doc
  "Create an App Runner automatic scaling configuration resource. App Runner requires this \
   resource when you create or update App Runner services and you require non-default auto scaling \
   settings. You can share an auto scaling configuration across multiple services.\n\n\
  \ Create multiple revisions of a configuration by calling this action multiple times using the \
   same [AutoScalingConfigurationName]. The call returns incremental \
   [AutoScalingConfigurationRevision] values. When you create a service and configure an auto \
   scaling configuration resource, the service uses the latest active revision of the auto scaling \
   configuration by default. You can optionally configure the service to use a specific revision.\n\
  \ \n\
  \  Configure a higher [MinSize] to increase the spread of your App Runner service over more \
   Availability Zones in the Amazon Web Services Region. The tradeoff is a higher minimal cost.\n\
  \  \n\
  \   Configure a lower [MaxSize] to control your cost. The tradeoff is lower responsiveness \
   during peak demand.\n\
  \   "]

module CreateConnection : sig
  val request :
    Smaws_Lib.Context.t ->
    create_connection_request ->
    ( create_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result
end
[@@ocaml.doc
  "Create an App Runner connection resource. App Runner requires a connection resource when you \
   create App Runner services that access private repositories from certain third-party providers. \
   You can share a connection across multiple services.\n\n\
  \ A connection resource is needed to access GitHub and Bitbucket repositories. Both require a \
   user interface approval process through the App Runner console before you can use the \
   connection.\n\
  \ "]

module CreateObservabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    create_observability_configuration_request ->
    ( create_observability_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result
end
[@@ocaml.doc
  "Create an App Runner observability configuration resource. App Runner requires this resource \
   when you create or update App Runner services and you want to enable non-default observability \
   features. You can share an observability configuration across multiple services.\n\n\
  \ Create multiple revisions of a configuration by calling this action multiple times using the \
   same [ObservabilityConfigurationName]. The call returns incremental \
   [ObservabilityConfigurationRevision] values. When you create a service and configure an \
   observability configuration resource, the service uses the latest active revision of the \
   observability configuration by default. You can optionally configure the service to use a \
   specific revision.\n\
  \ \n\
  \  The observability configuration resource is designed to configure multiple features \
   (currently one feature, tracing). This action takes optional parameters that describe the \
   configuration of these features (currently one parameter, [TraceConfiguration]). If you don't \
   specify a feature parameter, App Runner doesn't enable the feature.\n\
  \  "]

module CreateService : sig
  val request :
    Smaws_Lib.Context.t ->
    create_service_request ->
    ( create_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result
end
[@@ocaml.doc
  "Create an App Runner service. After the service is created, the action also automatically \
   starts a deployment.\n\n\
  \ This is an asynchronous operation. On a successful call, you can use the returned \
   [OperationId] and the \
   {{:https://docs.aws.amazon.com/apprunner/latest/api/API_ListOperations.html}ListOperations} \
   call to track the operation's progress.\n\
  \ "]

module CreateVpcConnector : sig
  val request :
    Smaws_Lib.Context.t ->
    create_vpc_connector_request ->
    ( create_vpc_connector_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result
end
[@@ocaml.doc
  "Create an App Runner VPC connector resource. App Runner requires this resource when you want to \
   associate your App Runner service to a custom Amazon Virtual Private Cloud (Amazon VPC).\n"]

module CreateVpcIngressConnection : sig
  val request :
    Smaws_Lib.Context.t ->
    create_vpc_ingress_connection_request ->
    ( create_vpc_ingress_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result
end
[@@ocaml.doc
  "Create an App Runner VPC Ingress Connection resource. App Runner requires this resource when \
   you want to associate your App Runner service with an Amazon VPC endpoint.\n"]

module DeleteAutoScalingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_auto_scaling_configuration_request ->
    ( delete_auto_scaling_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Delete an App Runner automatic scaling configuration resource. You can delete a top level auto \
   scaling configuration, a specific revision of one, or all revisions associated with the top \
   level configuration. You can't delete the default auto scaling configuration or a configuration \
   that's used by one or more App Runner services.\n"]

module DeleteConnection : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_connection_request ->
    ( delete_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Delete an App Runner connection. You must first ensure that there are no running App Runner \
   services that use this connection. If there are any, the [DeleteConnection] action fails.\n"]

module DeleteObservabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_observability_configuration_request ->
    ( delete_observability_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Delete an App Runner observability configuration resource. You can delete a specific revision \
   or the latest active revision. You can't delete a configuration that's used by one or more App \
   Runner services.\n"]

module DeleteService : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_service_request ->
    ( delete_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Delete an App Runner service.\n\n\
  \ This is an asynchronous operation. On a successful call, you can use the returned \
   [OperationId] and the [ListOperations] call to track the operation's progress.\n\
  \ \n\
  \   Make sure that you don't have any active VPCIngressConnections associated with the service \
   you want to delete. \n\
  \   \n\
  \    "]

module DeleteVpcConnector : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_vpc_connector_request ->
    ( delete_vpc_connector_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Delete an App Runner VPC connector resource. You can't delete a connector that's used by one or \
   more App Runner services.\n"]

module DeleteVpcIngressConnection : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_vpc_ingress_connection_request ->
    ( delete_vpc_ingress_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Delete an App Runner VPC Ingress Connection resource that's associated with an App Runner \
   service. The VPC Ingress Connection must be in one of the following states to be deleted: \n\n\
  \ {ul\n\
  \       {-   [AVAILABLE] \n\
  \           \n\
  \            }\n\
  \       {-   [FAILED_CREATION] \n\
  \           \n\
  \            }\n\
  \       {-   [FAILED_UPDATE] \n\
  \           \n\
  \            }\n\
  \       {-   [FAILED_DELETION] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DescribeAutoScalingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_auto_scaling_configuration_request ->
    ( describe_auto_scaling_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Return a full description of an App Runner automatic scaling configuration resource.\n"]

module DescribeCustomDomains : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_custom_domains_request ->
    ( describe_custom_domains_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Return a description of custom domain names that are associated with an App Runner service.\n"]

module DescribeObservabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_observability_configuration_request ->
    ( describe_observability_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Return a full description of an App Runner observability configuration resource.\n"]

module DescribeService : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_service_request ->
    ( describe_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Return a full description of an App Runner service.\n"]

module DescribeVpcConnector : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_vpc_connector_request ->
    ( describe_vpc_connector_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Return a description of an App Runner VPC connector resource.\n"]

module DescribeVpcIngressConnection : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_vpc_ingress_connection_request ->
    ( describe_vpc_ingress_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Return a full description of an App Runner VPC Ingress Connection resource.\n"]

module DisassociateCustomDomain : sig
  val request :
    Smaws_Lib.Context.t ->
    disassociate_custom_domain_request ->
    ( disassociate_custom_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Disassociate a custom domain name from an App Runner service.\n\n\
  \ Certificates tracking domain validity are associated with a custom domain and are stored in \
   {{:https://docs.aws.amazon.com/acm/latest/userguide}AWS Certificate Manager (ACM)}. These \
   certificates aren't deleted as part of this action. App Runner delays certificate deletion for \
   30 days after a domain is disassociated from your service.\n\
  \ "]

module ListAutoScalingConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
    list_auto_scaling_configurations_request ->
    ( list_auto_scaling_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of active App Runner automatic scaling configurations in your Amazon Web \
   Services account. You can query the revisions for a specific configuration name or the \
   revisions for all active configurations in your account. You can optionally query only the \
   latest revision of each requested name.\n\n\
  \ To retrieve a full description of a particular configuration revision, call and provide one of \
   the ARNs returned by [ListAutoScalingConfigurations].\n\
  \ "]

module ListConnections : sig
  val request :
    Smaws_Lib.Context.t ->
    list_connections_request ->
    ( list_connections_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of App Runner connections that are associated with your Amazon Web Services \
   account.\n"]

module ListObservabilityConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
    list_observability_configurations_request ->
    ( list_observability_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of active App Runner observability configurations in your Amazon Web Services \
   account. You can query the revisions for a specific configuration name or the revisions for all \
   active configurations in your account. You can optionally query only the latest revision of \
   each requested name.\n\n\
  \ To retrieve a full description of a particular configuration revision, call and provide one of \
   the ARNs returned by [ListObservabilityConfigurations].\n\
  \ "]

module ListOperations : sig
  val request :
    Smaws_Lib.Context.t ->
    list_operations_request ->
    ( list_operations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Return a list of operations that occurred on an App Runner service.\n\n\
  \ The resulting list of [OperationSummary] objects is sorted in reverse chronological order. The \
   first object on the list represents the last started operation.\n\
  \ "]

module ListServices : sig
  val request :
    Smaws_Lib.Context.t ->
    list_services_request ->
    ( list_services_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result
end
[@@ocaml.doc "Returns a list of running App Runner services in your Amazon Web Services account.\n"]

module ListServicesForAutoScalingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    list_services_for_auto_scaling_configuration_request ->
    ( list_services_for_auto_scaling_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of the associated App Runner services using an auto scaling configuration.\n"]

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "List tags that are associated with for an App Runner resource. The response contains a list of \
   tag key-value pairs.\n"]

module ListVpcConnectors : sig
  val request :
    Smaws_Lib.Context.t ->
    list_vpc_connectors_request ->
    ( list_vpc_connectors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result
end
[@@ocaml.doc "Returns a list of App Runner VPC connectors in your Amazon Web Services account.\n"]

module ListVpcIngressConnections : sig
  val request :
    Smaws_Lib.Context.t ->
    list_vpc_ingress_connections_request ->
    ( list_vpc_ingress_connections_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result
end
[@@ocaml.doc
  "Return a list of App Runner VPC Ingress Connections in your Amazon Web Services account.\n"]

module PauseService : sig
  val request :
    Smaws_Lib.Context.t ->
    pause_service_request ->
    ( pause_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Pause an active App Runner service. App Runner reduces compute capacity for the service to zero \
   and loses state (for example, ephemeral storage is removed).\n\n\
  \ This is an asynchronous operation. On a successful call, you can use the returned \
   [OperationId] and the [ListOperations] call to track the operation's progress.\n\
  \ "]

module ResumeService : sig
  val request :
    Smaws_Lib.Context.t ->
    resume_service_request ->
    ( resume_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Resume an active App Runner service. App Runner provisions compute capacity for the service.\n\n\
  \ This is an asynchronous operation. On a successful call, you can use the returned \
   [OperationId] and the [ListOperations] call to track the operation's progress.\n\
  \ "]

module StartDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
    start_deployment_request ->
    ( start_deployment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Initiate a manual deployment of the latest commit in a source code repository or the latest \
   image in a source image repository to an App Runner service.\n\n\
  \ For a source code repository, App Runner retrieves the commit and builds a Docker image. For a \
   source image repository, App Runner retrieves the latest Docker image. In both cases, App \
   Runner then deploys the new image to your service and starts a new container instance.\n\
  \ \n\
  \  This is an asynchronous operation. On a successful call, you can use the returned \
   [OperationId] and the [ListOperations] call to track the operation's progress.\n\
  \  "]

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Add tags to, or update the tag values of, an App Runner resource. A tag is a key-value pair.\n"]

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Remove tags from an App Runner resource.\n"]

module UpdateDefaultAutoScalingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    update_default_auto_scaling_configuration_request ->
    ( update_default_auto_scaling_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Update an auto scaling configuration to be the default. The existing default auto scaling \
   configuration will be set to non-default automatically.\n"]

module UpdateService : sig
  val request :
    Smaws_Lib.Context.t ->
    update_service_request ->
    ( update_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Update an App Runner service. You can update the source configuration and instance \
   configuration of the service. You can also update the ARN of the auto scaling configuration \
   resource that's associated with the service. However, you can't change the name or the \
   encryption configuration of the service. These can be set only when you create the service.\n\n\
  \ To update the tags applied to your service, use the separate actions [TagResource] and \
   [UntagResource].\n\
  \ \n\
  \  This is an asynchronous operation. On a successful call, you can use the returned \
   [OperationId] and the [ListOperations] call to track the operation's progress.\n\
  \  "]

(** {1:Serialization and Deserialization} *)
module UpdateVpcIngressConnection : sig
  val request :
    Smaws_Lib.Context.t ->
    update_vpc_ingress_connection_request ->
    ( update_vpc_ingress_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Update an existing App Runner VPC Ingress Connection resource. The VPC Ingress Connection must \
   be in one of the following states to be updated:\n\n\
  \ {ul\n\
  \       {-   AVAILABLE \n\
  \           \n\
  \            }\n\
  \       {-   FAILED_CREATION \n\
  \           \n\
  \            }\n\
  \       {-   FAILED_UPDATE \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
