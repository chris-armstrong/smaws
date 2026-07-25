open Types

val make_ingress_vpc_configuration :
  ?vpc_id:string_ -> ?vpc_endpoint_id:string_ -> unit -> ingress_vpc_configuration

val make_vpc_ingress_connection :
  ?vpc_ingress_connection_arn:app_runner_resource_arn ->
  ?vpc_ingress_connection_name:vpc_ingress_connection_name ->
  ?service_arn:app_runner_resource_arn ->
  ?status:vpc_ingress_connection_status ->
  ?account_id:customer_account_id ->
  ?domain_name:domain_name ->
  ?ingress_vpc_configuration:ingress_vpc_configuration ->
  ?created_at:timestamp ->
  ?deleted_at:timestamp ->
  unit ->
  vpc_ingress_connection

val make_update_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection -> unit -> update_vpc_ingress_connection_response

val make_update_vpc_ingress_connection_request :
  vpc_ingress_connection_arn:app_runner_resource_arn ->
  ingress_vpc_configuration:ingress_vpc_configuration ->
  unit ->
  update_vpc_ingress_connection_request

val make_service_observability_configuration :
  ?observability_configuration_arn:app_runner_resource_arn ->
  observability_enabled:boolean_ ->
  unit ->
  service_observability_configuration

val make_ingress_configuration : ?is_publicly_accessible:boolean_ -> unit -> ingress_configuration

val make_egress_configuration :
  ?egress_type:egress_type ->
  ?vpc_connector_arn:app_runner_resource_arn ->
  unit ->
  egress_configuration

val make_network_configuration :
  ?egress_configuration:egress_configuration ->
  ?ingress_configuration:ingress_configuration ->
  ?ip_address_type:ip_address_type ->
  unit ->
  network_configuration

val make_auto_scaling_configuration_summary :
  ?auto_scaling_configuration_arn:app_runner_resource_arn ->
  ?auto_scaling_configuration_name:auto_scaling_configuration_name ->
  ?auto_scaling_configuration_revision:integer ->
  ?status:auto_scaling_configuration_status ->
  ?created_at:timestamp ->
  ?has_associated_service:has_associated_service ->
  ?is_default:is_default ->
  unit ->
  auto_scaling_configuration_summary

val make_health_check_configuration :
  ?protocol:health_check_protocol ->
  ?path:health_check_path ->
  ?interval:health_check_interval ->
  ?timeout:health_check_timeout ->
  ?healthy_threshold:health_check_healthy_threshold ->
  ?unhealthy_threshold:health_check_unhealthy_threshold ->
  unit ->
  health_check_configuration

val make_encryption_configuration : kms_key:kms_key_arn -> unit -> encryption_configuration

val make_instance_configuration :
  ?cpu:cpu -> ?memory:memory -> ?instance_role_arn:role_arn -> unit -> instance_configuration

val make_authentication_configuration :
  ?connection_arn:app_runner_resource_arn ->
  ?access_role_arn:role_arn ->
  unit ->
  authentication_configuration

val make_image_configuration :
  ?runtime_environment_variables:runtime_environment_variables ->
  ?start_command:start_command ->
  ?port:string_ ->
  ?runtime_environment_secrets:runtime_environment_secrets ->
  unit ->
  image_configuration

val make_image_repository :
  ?image_configuration:image_configuration ->
  image_identifier:image_identifier ->
  image_repository_type:image_repository_type ->
  unit ->
  image_repository

val make_code_configuration_values :
  ?build_command:build_command ->
  ?start_command:start_command ->
  ?port:string_ ->
  ?runtime_environment_variables:runtime_environment_variables ->
  ?runtime_environment_secrets:runtime_environment_secrets ->
  runtime:runtime ->
  unit ->
  code_configuration_values

val make_code_configuration :
  ?code_configuration_values:code_configuration_values ->
  configuration_source:configuration_source ->
  unit ->
  code_configuration

val make_source_code_version :
  type_:source_code_version_type -> value:string_ -> unit -> source_code_version

val make_code_repository :
  ?code_configuration:code_configuration ->
  ?source_directory:source_directory ->
  repository_url:string_ ->
  source_code_version:source_code_version ->
  unit ->
  code_repository

val make_source_configuration :
  ?code_repository:code_repository ->
  ?image_repository:image_repository ->
  ?auto_deployments_enabled:nullable_boolean ->
  ?authentication_configuration:authentication_configuration ->
  unit ->
  source_configuration

val make_service :
  ?service_url:string_ ->
  ?deleted_at:timestamp ->
  ?encryption_configuration:encryption_configuration ->
  ?health_check_configuration:health_check_configuration ->
  ?observability_configuration:service_observability_configuration ->
  service_name:service_name ->
  service_id:service_id ->
  service_arn:app_runner_resource_arn ->
  created_at:timestamp ->
  updated_at:timestamp ->
  status:service_status ->
  source_configuration:source_configuration ->
  instance_configuration:instance_configuration ->
  auto_scaling_configuration_summary:auto_scaling_configuration_summary ->
  network_configuration:network_configuration ->
  unit ->
  service

val make_update_service_response :
  service:service -> operation_id:uui_d -> unit -> update_service_response

val make_update_service_request :
  ?source_configuration:source_configuration ->
  ?instance_configuration:instance_configuration ->
  ?auto_scaling_configuration_arn:app_runner_resource_arn ->
  ?health_check_configuration:health_check_configuration ->
  ?network_configuration:network_configuration ->
  ?observability_configuration:service_observability_configuration ->
  service_arn:app_runner_resource_arn ->
  unit ->
  update_service_request

val make_auto_scaling_configuration :
  ?auto_scaling_configuration_arn:app_runner_resource_arn ->
  ?auto_scaling_configuration_name:auto_scaling_configuration_name ->
  ?auto_scaling_configuration_revision:auto_scaling_configuration_revision ->
  ?latest:latest ->
  ?status:auto_scaling_configuration_status ->
  ?max_concurrency:max_concurrency ->
  ?min_size:min_size ->
  ?max_size:max_size ->
  ?created_at:timestamp ->
  ?deleted_at:timestamp ->
  ?has_associated_service:has_associated_service ->
  ?is_default:is_default ->
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
  resource_arn:app_runner_resource_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : ?key:tag_key -> ?value:tag_value -> unit -> tag

val make_tag_resource_request :
  resource_arn:app_runner_resource_arn -> tags:tag_list -> unit -> tag_resource_request

val make_start_deployment_response : operation_id:uui_d -> unit -> start_deployment_response

val make_start_deployment_request :
  service_arn:app_runner_resource_arn -> unit -> start_deployment_request

val make_resume_service_response :
  ?operation_id:uui_d -> service:service -> unit -> resume_service_response

val make_resume_service_request :
  service_arn:app_runner_resource_arn -> unit -> resume_service_request

val make_pause_service_response :
  ?operation_id:uui_d -> service:service -> unit -> pause_service_response

val make_pause_service_request :
  service_arn:app_runner_resource_arn -> unit -> pause_service_request

val make_vpc_ingress_connection_summary :
  ?vpc_ingress_connection_arn:app_runner_resource_arn ->
  ?service_arn:app_runner_resource_arn ->
  unit ->
  vpc_ingress_connection_summary

val make_list_vpc_ingress_connections_response :
  ?next_token:next_token ->
  vpc_ingress_connection_summary_list:vpc_ingress_connection_summary_list ->
  unit ->
  list_vpc_ingress_connections_response

val make_list_vpc_ingress_connections_filter :
  ?service_arn:app_runner_resource_arn ->
  ?vpc_endpoint_id:string_ ->
  unit ->
  list_vpc_ingress_connections_filter

val make_list_vpc_ingress_connections_request :
  ?filter:list_vpc_ingress_connections_filter ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_vpc_ingress_connections_request

val make_vpc_connector :
  ?vpc_connector_name:vpc_connector_name ->
  ?vpc_connector_arn:app_runner_resource_arn ->
  ?vpc_connector_revision:integer ->
  ?subnets:string_list ->
  ?security_groups:string_list ->
  ?status:vpc_connector_status ->
  ?created_at:timestamp ->
  ?deleted_at:timestamp ->
  unit ->
  vpc_connector

val make_list_vpc_connectors_response :
  ?next_token:next_token -> vpc_connectors:vpc_connectors -> unit -> list_vpc_connectors_response

val make_list_vpc_connectors_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_vpc_connectors_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:app_runner_resource_arn -> unit -> list_tags_for_resource_request

val make_list_services_for_auto_scaling_configuration_response :
  ?next_token:next_token ->
  service_arn_list:service_arn_list ->
  unit ->
  list_services_for_auto_scaling_configuration_response

val make_list_services_for_auto_scaling_configuration_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  auto_scaling_configuration_arn:app_runner_resource_arn ->
  unit ->
  list_services_for_auto_scaling_configuration_request

val make_service_summary :
  ?service_name:service_name ->
  ?service_id:service_id ->
  ?service_arn:app_runner_resource_arn ->
  ?service_url:string_ ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?status:service_status ->
  unit ->
  service_summary

val make_list_services_response :
  ?next_token:string_ -> service_summary_list:service_summary_list -> unit -> list_services_response

val make_list_services_request :
  ?next_token:string_ -> ?max_results:service_max_results -> unit -> list_services_request

val make_operation_summary :
  ?id:uui_d ->
  ?type_:operation_type ->
  ?status:operation_status ->
  ?target_arn:app_runner_resource_arn ->
  ?started_at:timestamp ->
  ?ended_at:timestamp ->
  ?updated_at:timestamp ->
  unit ->
  operation_summary

val make_list_operations_response :
  ?operation_summary_list:operation_summary_list ->
  ?next_token:string_ ->
  unit ->
  list_operations_response

val make_list_operations_request :
  ?next_token:string_ ->
  ?max_results:list_operations_max_results ->
  service_arn:app_runner_resource_arn ->
  unit ->
  list_operations_request

val make_observability_configuration_summary :
  ?observability_configuration_arn:app_runner_resource_arn ->
  ?observability_configuration_name:observability_configuration_name ->
  ?observability_configuration_revision:integer ->
  unit ->
  observability_configuration_summary

val make_list_observability_configurations_response :
  ?next_token:next_token ->
  observability_configuration_summary_list:observability_configuration_summary_list ->
  unit ->
  list_observability_configurations_response

val make_list_observability_configurations_request :
  ?observability_configuration_name:observability_configuration_name ->
  ?latest_only:boolean_ ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_observability_configurations_request

val make_connection_summary :
  ?connection_name:connection_name ->
  ?connection_arn:app_runner_resource_arn ->
  ?provider_type:provider_type ->
  ?status:connection_status ->
  ?created_at:timestamp ->
  unit ->
  connection_summary

val make_list_connections_response :
  ?next_token:next_token ->
  connection_summary_list:connection_summary_list ->
  unit ->
  list_connections_response

val make_list_connections_request :
  ?connection_name:connection_name ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_connections_request

val make_list_auto_scaling_configurations_response :
  ?next_token:next_token ->
  auto_scaling_configuration_summary_list:auto_scaling_configuration_summary_list ->
  unit ->
  list_auto_scaling_configurations_response

val make_list_auto_scaling_configurations_request :
  ?auto_scaling_configuration_name:auto_scaling_configuration_name ->
  ?latest_only:boolean_ ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_auto_scaling_configurations_request

val make_vpc_dns_target :
  ?vpc_ingress_connection_arn:app_runner_resource_arn ->
  ?vpc_id:string_ ->
  ?domain_name:domain_name ->
  unit ->
  vpc_dns_target

val make_certificate_validation_record :
  ?name:string_ ->
  ?type_:string_ ->
  ?value:string_ ->
  ?status:certificate_validation_record_status ->
  unit ->
  certificate_validation_record

val make_custom_domain :
  ?certificate_validation_records:certificate_validation_record_list ->
  domain_name:domain_name ->
  enable_www_subdomain:nullable_boolean ->
  status:custom_domain_association_status ->
  unit ->
  custom_domain

val make_disassociate_custom_domain_response :
  dns_target:string_ ->
  service_arn:app_runner_resource_arn ->
  custom_domain:custom_domain ->
  vpc_dns_targets:vpc_dns_target_list ->
  unit ->
  disassociate_custom_domain_response

val make_disassociate_custom_domain_request :
  service_arn:app_runner_resource_arn ->
  domain_name:domain_name ->
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

val make_trace_configuration : vendor:tracing_vendor -> unit -> trace_configuration

val make_observability_configuration :
  ?observability_configuration_arn:app_runner_resource_arn ->
  ?observability_configuration_name:observability_configuration_name ->
  ?trace_configuration:trace_configuration ->
  ?observability_configuration_revision:integer ->
  ?latest:boolean_ ->
  ?status:observability_configuration_status ->
  ?created_at:timestamp ->
  ?deleted_at:timestamp ->
  unit ->
  observability_configuration

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
  dns_target:string_ ->
  service_arn:app_runner_resource_arn ->
  custom_domains:custom_domain_list ->
  vpc_dns_targets:vpc_dns_target_list ->
  unit ->
  describe_custom_domains_response

val make_describe_custom_domains_request :
  ?next_token:string_ ->
  ?max_results:describe_custom_domains_max_results ->
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
  service:service -> operation_id:uui_d -> unit -> delete_service_response

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
  ?connection_name:connection_name ->
  ?connection_arn:app_runner_resource_arn ->
  ?provider_type:provider_type ->
  ?status:connection_status ->
  ?created_at:timestamp ->
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
  service_arn:app_runner_resource_arn ->
  vpc_ingress_connection_name:vpc_ingress_connection_name ->
  ingress_vpc_configuration:ingress_vpc_configuration ->
  unit ->
  create_vpc_ingress_connection_request

val make_create_vpc_connector_response :
  vpc_connector:vpc_connector -> unit -> create_vpc_connector_response

val make_create_vpc_connector_request :
  ?security_groups:string_list ->
  ?tags:tag_list ->
  vpc_connector_name:vpc_connector_name ->
  subnets:string_list ->
  unit ->
  create_vpc_connector_request

val make_create_service_response :
  service:service -> operation_id:uui_d -> unit -> create_service_response

val make_create_service_request :
  ?instance_configuration:instance_configuration ->
  ?tags:tag_list ->
  ?encryption_configuration:encryption_configuration ->
  ?health_check_configuration:health_check_configuration ->
  ?auto_scaling_configuration_arn:app_runner_resource_arn ->
  ?network_configuration:network_configuration ->
  ?observability_configuration:service_observability_configuration ->
  service_name:service_name ->
  source_configuration:source_configuration ->
  unit ->
  create_service_request

val make_create_observability_configuration_response :
  observability_configuration:observability_configuration ->
  unit ->
  create_observability_configuration_response

val make_create_observability_configuration_request :
  ?trace_configuration:trace_configuration ->
  ?tags:tag_list ->
  observability_configuration_name:observability_configuration_name ->
  unit ->
  create_observability_configuration_request

val make_create_connection_response : connection:connection -> unit -> create_connection_response

val make_create_connection_request :
  ?tags:tag_list ->
  connection_name:connection_name ->
  provider_type:provider_type ->
  unit ->
  create_connection_request

val make_create_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration ->
  unit ->
  create_auto_scaling_configuration_response

val make_create_auto_scaling_configuration_request :
  ?max_concurrency:as_config_max_concurrency ->
  ?min_size:as_config_min_size ->
  ?max_size:as_config_max_size ->
  ?tags:tag_list ->
  auto_scaling_configuration_name:auto_scaling_configuration_name ->
  unit ->
  create_auto_scaling_configuration_request

val make_associate_custom_domain_response :
  dns_target:string_ ->
  service_arn:app_runner_resource_arn ->
  custom_domain:custom_domain ->
  vpc_dns_targets:vpc_dns_target_list ->
  unit ->
  associate_custom_domain_response

val make_associate_custom_domain_request :
  ?enable_www_subdomain:nullable_boolean ->
  service_arn:app_runner_resource_arn ->
  domain_name:domain_name ->
  unit ->
  associate_custom_domain_request
