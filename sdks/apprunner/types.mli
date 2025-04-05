open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec vpc_ingress_connection_summary =
  {
  service_arn: string option ;
  vpc_ingress_connection_arn: string option }
type nonrec vpc_ingress_connection_status =
  | DELETED 
  | FAILED_DELETION 
  | FAILED_UPDATE 
  | FAILED_CREATION 
  | PENDING_DELETION 
  | PENDING_UPDATE 
  | PENDING_CREATION 
  | AVAILABLE 
type nonrec ingress_vpc_configuration =
  {
  vpc_endpoint_id: string option ;
  vpc_id: string option }
type nonrec vpc_ingress_connection =
  {
  deleted_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  ingress_vpc_configuration: ingress_vpc_configuration option ;
  domain_name: string option ;
  account_id: string option ;
  status: vpc_ingress_connection_status option ;
  service_arn: string option ;
  vpc_ingress_connection_name: string option ;
  vpc_ingress_connection_arn: string option }
type nonrec vpc_dns_target =
  {
  domain_name: string option ;
  vpc_id: string option ;
  vpc_ingress_connection_arn: string option }
type nonrec vpc_connector_status =
  | INACTIVE 
  | ACTIVE 
type nonrec vpc_connector =
  {
  deleted_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  status: vpc_connector_status option ;
  security_groups: string list option ;
  subnets: string list option ;
  vpc_connector_revision: int option ;
  vpc_connector_arn: string option ;
  vpc_connector_name: string option }
type nonrec update_vpc_ingress_connection_response =
  {
  vpc_ingress_connection: vpc_ingress_connection }
type nonrec update_vpc_ingress_connection_request =
  {
  ingress_vpc_configuration: ingress_vpc_configuration ;
  vpc_ingress_connection_arn: string }
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec invalid_state_exception = {
  message: string option }
type nonrec invalid_request_exception = {
  message: string option }
type nonrec internal_service_error_exception = {
  message: string option }
type nonrec service_status =
  | OPERATION_IN_PROGRESS 
  | PAUSED 
  | DELETE_FAILED 
  | DELETED 
  | RUNNING 
  | CREATE_FAILED 
type nonrec source_code_version_type =
  | BRANCH 
type nonrec source_code_version =
  {
  value: string ;
  type_: source_code_version_type }
type nonrec configuration_source =
  | API 
  | REPOSITORY 
type nonrec runtime =
  | NODEJS_18 
  | PYTHON_311 
  | RUBY_31 
  | PHP_81 
  | DOTNET_6 
  | GO_1 
  | NODEJS_16 
  | CORRETTO_11 
  | CORRETTO_8 
  | NODEJS_14 
  | NODEJS_12 
  | PYTHON_3 
type nonrec runtime_environment_variables = (string * string) list
type nonrec runtime_environment_secrets = (string * string) list
type nonrec code_configuration_values =
  {
  runtime_environment_secrets: runtime_environment_secrets option ;
  runtime_environment_variables: runtime_environment_variables option ;
  port: string option ;
  start_command: string option ;
  build_command: string option ;
  runtime: runtime }
type nonrec code_configuration =
  {
  code_configuration_values: code_configuration_values option ;
  configuration_source: configuration_source }
type nonrec code_repository =
  {
  source_directory: string option ;
  code_configuration: code_configuration option ;
  source_code_version: source_code_version ;
  repository_url: string }
type nonrec image_configuration =
  {
  runtime_environment_secrets: runtime_environment_secrets option ;
  port: string option ;
  start_command: string option ;
  runtime_environment_variables: runtime_environment_variables option }
type nonrec image_repository_type =
  | ECR_PUBLIC 
  | ECR 
type nonrec image_repository =
  {
  image_repository_type: image_repository_type ;
  image_configuration: image_configuration option ;
  image_identifier: string }
type nonrec authentication_configuration =
  {
  access_role_arn: string option ;
  connection_arn: string option }
type nonrec source_configuration =
  {
  authentication_configuration: authentication_configuration option ;
  auto_deployments_enabled: bool option ;
  image_repository: image_repository option ;
  code_repository: code_repository option }
type nonrec instance_configuration =
  {
  instance_role_arn: string option ;
  memory: string option ;
  cpu: string option }
type nonrec encryption_configuration = {
  kms_key: string }
type nonrec health_check_protocol =
  | HTTP 
  | TCP 
type nonrec health_check_configuration =
  {
  unhealthy_threshold: int option ;
  healthy_threshold: int option ;
  timeout: int option ;
  interval: int option ;
  path: string option ;
  protocol: health_check_protocol option }
type nonrec auto_scaling_configuration_status =
  | INACTIVE 
  | ACTIVE 
type nonrec auto_scaling_configuration_summary =
  {
  is_default: bool option ;
  has_associated_service: bool option ;
  created_at: CoreTypes.Timestamp.t option ;
  status: auto_scaling_configuration_status option ;
  auto_scaling_configuration_revision: int option ;
  auto_scaling_configuration_name: string option ;
  auto_scaling_configuration_arn: string option }
type nonrec egress_type =
  | VPC 
  | DEFAULT 
type nonrec egress_configuration =
  {
  vpc_connector_arn: string option ;
  egress_type: egress_type option }
type nonrec ingress_configuration = {
  is_publicly_accessible: bool option }
type nonrec ip_address_type =
  | DUAL_STACK 
  | IPV4 
type nonrec network_configuration =
  {
  ip_address_type: ip_address_type option ;
  ingress_configuration: ingress_configuration option ;
  egress_configuration: egress_configuration option }
type nonrec service_observability_configuration =
  {
  observability_configuration_arn: string option ;
  observability_enabled: bool }
type nonrec service =
  {
  observability_configuration: service_observability_configuration option ;
  network_configuration: network_configuration ;
  auto_scaling_configuration_summary: auto_scaling_configuration_summary ;
  health_check_configuration: health_check_configuration option ;
  encryption_configuration: encryption_configuration option ;
  instance_configuration: instance_configuration ;
  source_configuration: source_configuration ;
  status: service_status ;
  deleted_at: CoreTypes.Timestamp.t option ;
  updated_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  service_url: string option ;
  service_arn: string ;
  service_id: string ;
  service_name: string }
type nonrec update_service_response =
  {
  operation_id: string ;
  service: service }
type nonrec update_service_request =
  {
  observability_configuration: service_observability_configuration option ;
  network_configuration: network_configuration option ;
  health_check_configuration: health_check_configuration option ;
  auto_scaling_configuration_arn: string option ;
  instance_configuration: instance_configuration option ;
  source_configuration: source_configuration option ;
  service_arn: string }
type nonrec auto_scaling_configuration =
  {
  is_default: bool option ;
  has_associated_service: bool option ;
  deleted_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  max_size: int option ;
  min_size: int option ;
  max_concurrency: int option ;
  status: auto_scaling_configuration_status option ;
  latest: bool option ;
  auto_scaling_configuration_revision: int option ;
  auto_scaling_configuration_name: string option ;
  auto_scaling_configuration_arn: string option }
type nonrec update_default_auto_scaling_configuration_response =
  {
  auto_scaling_configuration: auto_scaling_configuration }
type nonrec update_default_auto_scaling_configuration_request =
  {
  auto_scaling_configuration_arn: string }
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_arn: string }
type nonrec tracing_vendor =
  | AWSXRAY 
type nonrec trace_configuration = {
  vendor: tracing_vendor }
type nonrec tag_resource_response = unit
type nonrec tag = {
  value: string option ;
  key: string option }
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_arn: string }
type nonrec start_deployment_response = {
  operation_id: string }
type nonrec start_deployment_request = {
  service_arn: string }
type nonrec service_summary =
  {
  status: service_status option ;
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  service_url: string option ;
  service_arn: string option ;
  service_id: string option ;
  service_name: string option }
type nonrec service_quota_exceeded_exception = {
  message: string option }
type nonrec resume_service_response =
  {
  operation_id: string option ;
  service: service }
type nonrec resume_service_request = {
  service_arn: string }
type nonrec provider_type =
  | BITBUCKET 
  | GITHUB 
type nonrec pause_service_response =
  {
  operation_id: string option ;
  service: service }
type nonrec pause_service_request = {
  service_arn: string }
type nonrec operation_type =
  | UPDATE_SERVICE 
  | DELETE_SERVICE 
  | RESUME_SERVICE 
  | PAUSE_SERVICE 
  | CREATE_SERVICE 
  | START_DEPLOYMENT 
type nonrec operation_status =
  | ROLLBACK_SUCCEEDED 
  | ROLLBACK_FAILED 
  | ROLLBACK_IN_PROGRESS 
  | SUCCEEDED 
  | FAILED 
  | IN_PROGRESS 
  | PENDING 
type nonrec operation_summary =
  {
  updated_at: CoreTypes.Timestamp.t option ;
  ended_at: CoreTypes.Timestamp.t option ;
  started_at: CoreTypes.Timestamp.t option ;
  target_arn: string option ;
  status: operation_status option ;
  type_: operation_type option ;
  id: string option }
type nonrec observability_configuration_summary =
  {
  observability_configuration_revision: int option ;
  observability_configuration_name: string option ;
  observability_configuration_arn: string option }
type nonrec observability_configuration_status =
  | INACTIVE 
  | ACTIVE 
type nonrec observability_configuration =
  {
  deleted_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  status: observability_configuration_status option ;
  latest: bool option ;
  observability_configuration_revision: int option ;
  trace_configuration: trace_configuration option ;
  observability_configuration_name: string option ;
  observability_configuration_arn: string option }
type nonrec list_vpc_ingress_connections_response =
  {
  next_token: string option ;
  vpc_ingress_connection_summary_list: vpc_ingress_connection_summary list }
type nonrec list_vpc_ingress_connections_filter =
  {
  vpc_endpoint_id: string option ;
  service_arn: string option }
type nonrec list_vpc_ingress_connections_request =
  {
  next_token: string option ;
  max_results: int option ;
  filter: list_vpc_ingress_connections_filter option }
type nonrec list_vpc_connectors_response =
  {
  next_token: string option ;
  vpc_connectors: vpc_connector list }
type nonrec list_vpc_connectors_request =
  {
  next_token: string option ;
  max_results: int option }
type nonrec list_tags_for_resource_response = {
  tags: tag list option }
type nonrec list_tags_for_resource_request = {
  resource_arn: string }
type nonrec list_services_response =
  {
  next_token: string option ;
  service_summary_list: service_summary list }
type nonrec list_services_request =
  {
  max_results: int option ;
  next_token: string option }
type nonrec list_services_for_auto_scaling_configuration_response =
  {
  next_token: string option ;
  service_arn_list: string list }
type nonrec list_services_for_auto_scaling_configuration_request =
  {
  next_token: string option ;
  max_results: int option ;
  auto_scaling_configuration_arn: string }
type nonrec list_operations_response =
  {
  next_token: string option ;
  operation_summary_list: operation_summary list option }
type nonrec list_operations_request =
  {
  max_results: int option ;
  next_token: string option ;
  service_arn: string }
type nonrec list_observability_configurations_response =
  {
  next_token: string option ;
  observability_configuration_summary_list:
    observability_configuration_summary list }
type nonrec list_observability_configurations_request =
  {
  next_token: string option ;
  max_results: int option ;
  latest_only: bool option ;
  observability_configuration_name: string option }
type nonrec connection_status =
  | DELETED 
  | ERROR 
  | AVAILABLE 
  | PENDING_HANDSHAKE 
type nonrec connection_summary =
  {
  created_at: CoreTypes.Timestamp.t option ;
  status: connection_status option ;
  provider_type: provider_type option ;
  connection_arn: string option ;
  connection_name: string option }
type nonrec list_connections_response =
  {
  next_token: string option ;
  connection_summary_list: connection_summary list }
type nonrec list_connections_request =
  {
  next_token: string option ;
  max_results: int option ;
  connection_name: string option }
type nonrec list_auto_scaling_configurations_response =
  {
  next_token: string option ;
  auto_scaling_configuration_summary_list:
    auto_scaling_configuration_summary list }
type nonrec list_auto_scaling_configurations_request =
  {
  next_token: string option ;
  max_results: int option ;
  latest_only: bool option ;
  auto_scaling_configuration_name: string option }
type nonrec certificate_validation_record_status =
  | FAILED 
  | SUCCESS 
  | PENDING_VALIDATION 
type nonrec certificate_validation_record =
  {
  status: certificate_validation_record_status option ;
  value: string option ;
  type_: string option ;
  name: string option }
type nonrec custom_domain_association_status =
  | BINDING_CERTIFICATE 
  | PENDING_CERTIFICATE_DNS_VALIDATION 
  | DELETE_FAILED 
  | DELETING 
  | ACTIVE 
  | CREATE_FAILED 
  | CREATING 
type nonrec custom_domain =
  {
  status: custom_domain_association_status ;
  certificate_validation_records: certificate_validation_record list option ;
  enable_www_subdomain: bool ;
  domain_name: string }
type nonrec disassociate_custom_domain_response =
  {
  vpc_dns_targets: vpc_dns_target list ;
  custom_domain: custom_domain ;
  service_arn: string ;
  dns_target: string }
type nonrec disassociate_custom_domain_request =
  {
  domain_name: string ;
  service_arn: string }
type nonrec describe_vpc_ingress_connection_response =
  {
  vpc_ingress_connection: vpc_ingress_connection }
type nonrec describe_vpc_ingress_connection_request =
  {
  vpc_ingress_connection_arn: string }
type nonrec describe_vpc_connector_response = {
  vpc_connector: vpc_connector }
type nonrec describe_vpc_connector_request = {
  vpc_connector_arn: string }
type nonrec describe_service_response = {
  service: service }
type nonrec describe_service_request = {
  service_arn: string }
type nonrec describe_observability_configuration_response =
  {
  observability_configuration: observability_configuration }
type nonrec describe_observability_configuration_request =
  {
  observability_configuration_arn: string }
type nonrec describe_custom_domains_response =
  {
  next_token: string option ;
  vpc_dns_targets: vpc_dns_target list ;
  custom_domains: custom_domain list ;
  service_arn: string ;
  dns_target: string }
type nonrec describe_custom_domains_request =
  {
  max_results: int option ;
  next_token: string option ;
  service_arn: string }
type nonrec describe_auto_scaling_configuration_response =
  {
  auto_scaling_configuration: auto_scaling_configuration }
type nonrec describe_auto_scaling_configuration_request =
  {
  auto_scaling_configuration_arn: string }
type nonrec delete_vpc_ingress_connection_response =
  {
  vpc_ingress_connection: vpc_ingress_connection }
type nonrec delete_vpc_ingress_connection_request =
  {
  vpc_ingress_connection_arn: string }
type nonrec delete_vpc_connector_response = {
  vpc_connector: vpc_connector }
type nonrec delete_vpc_connector_request = {
  vpc_connector_arn: string }
type nonrec delete_service_response =
  {
  operation_id: string ;
  service: service }
type nonrec delete_service_request = {
  service_arn: string }
type nonrec delete_observability_configuration_response =
  {
  observability_configuration: observability_configuration }
type nonrec delete_observability_configuration_request =
  {
  observability_configuration_arn: string }
type nonrec connection =
  {
  created_at: CoreTypes.Timestamp.t option ;
  status: connection_status option ;
  provider_type: provider_type option ;
  connection_arn: string option ;
  connection_name: string option }
type nonrec delete_connection_response = {
  connection: connection option }
type nonrec delete_connection_request = {
  connection_arn: string }
type nonrec delete_auto_scaling_configuration_response =
  {
  auto_scaling_configuration: auto_scaling_configuration }
type nonrec delete_auto_scaling_configuration_request =
  {
  delete_all_revisions: bool option ;
  auto_scaling_configuration_arn: string }
type nonrec create_vpc_ingress_connection_response =
  {
  vpc_ingress_connection: vpc_ingress_connection }
type nonrec create_vpc_ingress_connection_request =
  {
  tags: tag list option ;
  ingress_vpc_configuration: ingress_vpc_configuration ;
  vpc_ingress_connection_name: string ;
  service_arn: string }
type nonrec create_vpc_connector_response = {
  vpc_connector: vpc_connector }
type nonrec create_vpc_connector_request =
  {
  tags: tag list option ;
  security_groups: string list option ;
  subnets: string list ;
  vpc_connector_name: string }
type nonrec create_service_response =
  {
  operation_id: string ;
  service: service }
type nonrec create_service_request =
  {
  observability_configuration: service_observability_configuration option ;
  network_configuration: network_configuration option ;
  auto_scaling_configuration_arn: string option ;
  health_check_configuration: health_check_configuration option ;
  encryption_configuration: encryption_configuration option ;
  tags: tag list option ;
  instance_configuration: instance_configuration option ;
  source_configuration: source_configuration ;
  service_name: string }
type nonrec create_observability_configuration_response =
  {
  observability_configuration: observability_configuration }
type nonrec create_observability_configuration_request =
  {
  tags: tag list option ;
  trace_configuration: trace_configuration option ;
  observability_configuration_name: string }
type nonrec create_connection_response = {
  connection: connection }
type nonrec create_connection_request =
  {
  tags: tag list option ;
  provider_type: provider_type ;
  connection_name: string }
type nonrec create_auto_scaling_configuration_response =
  {
  auto_scaling_configuration: auto_scaling_configuration }
type nonrec create_auto_scaling_configuration_request =
  {
  tags: tag list option ;
  max_size: int option ;
  min_size: int option ;
  max_concurrency: int option ;
  auto_scaling_configuration_name: string }
type nonrec associate_custom_domain_response =
  {
  vpc_dns_targets: vpc_dns_target list ;
  custom_domain: custom_domain ;
  service_arn: string ;
  dns_target: string }
type nonrec associate_custom_domain_request =
  {
  enable_www_subdomain: bool option ;
  domain_name: string ;
  service_arn: string }