open Types

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
