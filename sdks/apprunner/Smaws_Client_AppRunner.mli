(** 
    AppRunner client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

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
  service_arn: string }(** {1:builders Builders} *)

val make_vpc_ingress_connection_summary :
  ?service_arn:string ->
    ?vpc_ingress_connection_arn:string ->
      unit -> vpc_ingress_connection_summary
val make_ingress_vpc_configuration :
  ?vpc_endpoint_id:string ->
    ?vpc_id:string -> unit -> ingress_vpc_configuration
val make_vpc_ingress_connection :
  ?deleted_at:CoreTypes.Timestamp.t ->
    ?created_at:CoreTypes.Timestamp.t ->
      ?ingress_vpc_configuration:ingress_vpc_configuration ->
        ?domain_name:string ->
          ?account_id:string ->
            ?status:vpc_ingress_connection_status ->
              ?service_arn:string ->
                ?vpc_ingress_connection_name:string ->
                  ?vpc_ingress_connection_arn:string ->
                    unit -> vpc_ingress_connection
val make_vpc_dns_target :
  ?domain_name:string ->
    ?vpc_id:string ->
      ?vpc_ingress_connection_arn:string -> unit -> vpc_dns_target
val make_vpc_connector :
  ?deleted_at:CoreTypes.Timestamp.t ->
    ?created_at:CoreTypes.Timestamp.t ->
      ?status:vpc_connector_status ->
        ?security_groups:string list ->
          ?subnets:string list ->
            ?vpc_connector_revision:int ->
              ?vpc_connector_arn:string ->
                ?vpc_connector_name:string -> unit -> vpc_connector
val make_update_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection ->
    unit -> update_vpc_ingress_connection_response
val make_update_vpc_ingress_connection_request :
  ingress_vpc_configuration:ingress_vpc_configuration ->
    vpc_ingress_connection_arn:string ->
      unit -> update_vpc_ingress_connection_request
val make_source_code_version :
  value:string ->
    type_:source_code_version_type -> unit -> source_code_version
val make_code_configuration_values :
  ?runtime_environment_secrets:runtime_environment_secrets ->
    ?runtime_environment_variables:runtime_environment_variables ->
      ?port:string ->
        ?start_command:string ->
          ?build_command:string ->
            runtime:runtime -> unit -> code_configuration_values
val make_code_configuration :
  ?code_configuration_values:code_configuration_values ->
    configuration_source:configuration_source -> unit -> code_configuration
val make_code_repository :
  ?source_directory:string ->
    ?code_configuration:code_configuration ->
      source_code_version:source_code_version ->
        repository_url:string -> unit -> code_repository
val make_image_configuration :
  ?runtime_environment_secrets:runtime_environment_secrets ->
    ?port:string ->
      ?start_command:string ->
        ?runtime_environment_variables:runtime_environment_variables ->
          unit -> image_configuration
val make_image_repository :
  ?image_configuration:image_configuration ->
    image_repository_type:image_repository_type ->
      image_identifier:string -> unit -> image_repository
val make_authentication_configuration :
  ?access_role_arn:string ->
    ?connection_arn:string -> unit -> authentication_configuration
val make_source_configuration :
  ?authentication_configuration:authentication_configuration ->
    ?auto_deployments_enabled:bool ->
      ?image_repository:image_repository ->
        ?code_repository:code_repository -> unit -> source_configuration
val make_instance_configuration :
  ?instance_role_arn:string ->
    ?memory:string -> ?cpu:string -> unit -> instance_configuration
val make_encryption_configuration :
  kms_key:string -> unit -> encryption_configuration
val make_health_check_configuration :
  ?unhealthy_threshold:int ->
    ?healthy_threshold:int ->
      ?timeout:int ->
        ?interval:int ->
          ?path:string ->
            ?protocol:health_check_protocol ->
              unit -> health_check_configuration
val make_auto_scaling_configuration_summary :
  ?is_default:bool ->
    ?has_associated_service:bool ->
      ?created_at:CoreTypes.Timestamp.t ->
        ?status:auto_scaling_configuration_status ->
          ?auto_scaling_configuration_revision:int ->
            ?auto_scaling_configuration_name:string ->
              ?auto_scaling_configuration_arn:string ->
                unit -> auto_scaling_configuration_summary
val make_egress_configuration :
  ?vpc_connector_arn:string ->
    ?egress_type:egress_type -> unit -> egress_configuration
val make_ingress_configuration :
  ?is_publicly_accessible:bool -> unit -> ingress_configuration
val make_network_configuration :
  ?ip_address_type:ip_address_type ->
    ?ingress_configuration:ingress_configuration ->
      ?egress_configuration:egress_configuration ->
        unit -> network_configuration
val make_service_observability_configuration :
  ?observability_configuration_arn:string ->
    observability_enabled:bool -> unit -> service_observability_configuration
val make_service :
  ?observability_configuration:service_observability_configuration ->
    ?health_check_configuration:health_check_configuration ->
      ?encryption_configuration:encryption_configuration ->
        ?deleted_at:CoreTypes.Timestamp.t ->
          ?service_url:string ->
            network_configuration:network_configuration ->
              auto_scaling_configuration_summary:auto_scaling_configuration_summary
                ->
                instance_configuration:instance_configuration ->
                  source_configuration:source_configuration ->
                    status:service_status ->
                      updated_at:CoreTypes.Timestamp.t ->
                        created_at:CoreTypes.Timestamp.t ->
                          service_arn:string ->
                            service_id:string ->
                              service_name:string -> unit -> service
val make_update_service_response :
  operation_id:string -> service:service -> unit -> update_service_response
val make_update_service_request :
  ?observability_configuration:service_observability_configuration ->
    ?network_configuration:network_configuration ->
      ?health_check_configuration:health_check_configuration ->
        ?auto_scaling_configuration_arn:string ->
          ?instance_configuration:instance_configuration ->
            ?source_configuration:source_configuration ->
              service_arn:string -> unit -> update_service_request
val make_auto_scaling_configuration :
  ?is_default:bool ->
    ?has_associated_service:bool ->
      ?deleted_at:CoreTypes.Timestamp.t ->
        ?created_at:CoreTypes.Timestamp.t ->
          ?max_size:int ->
            ?min_size:int ->
              ?max_concurrency:int ->
                ?status:auto_scaling_configuration_status ->
                  ?latest:bool ->
                    ?auto_scaling_configuration_revision:int ->
                      ?auto_scaling_configuration_name:string ->
                        ?auto_scaling_configuration_arn:string ->
                          unit -> auto_scaling_configuration
val make_update_default_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration ->
    unit -> update_default_auto_scaling_configuration_response
val make_update_default_auto_scaling_configuration_request :
  auto_scaling_configuration_arn:string ->
    unit -> update_default_auto_scaling_configuration_request
val make_untag_resource_response : unit -> untag_resource_response
val make_untag_resource_request :
  tag_keys:string list ->
    resource_arn:string -> unit -> untag_resource_request
val make_trace_configuration :
  vendor:tracing_vendor -> unit -> trace_configuration
val make_tag_resource_response : unit -> tag_resource_response
val make_tag : ?value:string -> ?key:string -> unit -> tag
val make_tag_resource_request :
  tags:tag list -> resource_arn:string -> unit -> tag_resource_request
val make_start_deployment_response :
  operation_id:string -> unit -> start_deployment_response
val make_start_deployment_request :
  service_arn:string -> unit -> start_deployment_request
val make_service_summary :
  ?status:service_status ->
    ?updated_at:CoreTypes.Timestamp.t ->
      ?created_at:CoreTypes.Timestamp.t ->
        ?service_url:string ->
          ?service_arn:string ->
            ?service_id:string ->
              ?service_name:string -> unit -> service_summary
val make_resume_service_response :
  ?operation_id:string -> service:service -> unit -> resume_service_response
val make_resume_service_request :
  service_arn:string -> unit -> resume_service_request
val make_pause_service_response :
  ?operation_id:string -> service:service -> unit -> pause_service_response
val make_pause_service_request :
  service_arn:string -> unit -> pause_service_request
val make_operation_summary :
  ?updated_at:CoreTypes.Timestamp.t ->
    ?ended_at:CoreTypes.Timestamp.t ->
      ?started_at:CoreTypes.Timestamp.t ->
        ?target_arn:string ->
          ?status:operation_status ->
            ?type_:operation_type -> ?id:string -> unit -> operation_summary
val make_observability_configuration_summary :
  ?observability_configuration_revision:int ->
    ?observability_configuration_name:string ->
      ?observability_configuration_arn:string ->
        unit -> observability_configuration_summary
val make_observability_configuration :
  ?deleted_at:CoreTypes.Timestamp.t ->
    ?created_at:CoreTypes.Timestamp.t ->
      ?status:observability_configuration_status ->
        ?latest:bool ->
          ?observability_configuration_revision:int ->
            ?trace_configuration:trace_configuration ->
              ?observability_configuration_name:string ->
                ?observability_configuration_arn:string ->
                  unit -> observability_configuration
val make_list_vpc_ingress_connections_response :
  ?next_token:string ->
    vpc_ingress_connection_summary_list:vpc_ingress_connection_summary list
      -> unit -> list_vpc_ingress_connections_response
val make_list_vpc_ingress_connections_filter :
  ?vpc_endpoint_id:string ->
    ?service_arn:string -> unit -> list_vpc_ingress_connections_filter
val make_list_vpc_ingress_connections_request :
  ?next_token:string ->
    ?max_results:int ->
      ?filter:list_vpc_ingress_connections_filter ->
        unit -> list_vpc_ingress_connections_request
val make_list_vpc_connectors_response :
  ?next_token:string ->
    vpc_connectors:vpc_connector list -> unit -> list_vpc_connectors_response
val make_list_vpc_connectors_request :
  ?next_token:string ->
    ?max_results:int -> unit -> list_vpc_connectors_request
val make_list_tags_for_resource_response :
  ?tags:tag list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_arn:string -> unit -> list_tags_for_resource_request
val make_list_services_response :
  ?next_token:string ->
    service_summary_list:service_summary list ->
      unit -> list_services_response
val make_list_services_request :
  ?max_results:int -> ?next_token:string -> unit -> list_services_request
val make_list_services_for_auto_scaling_configuration_response :
  ?next_token:string ->
    service_arn_list:string list ->
      unit -> list_services_for_auto_scaling_configuration_response
val make_list_services_for_auto_scaling_configuration_request :
  ?next_token:string ->
    ?max_results:int ->
      auto_scaling_configuration_arn:string ->
        unit -> list_services_for_auto_scaling_configuration_request
val make_list_operations_response :
  ?next_token:string ->
    ?operation_summary_list:operation_summary list ->
      unit -> list_operations_response
val make_list_operations_request :
  ?max_results:int ->
    ?next_token:string ->
      service_arn:string -> unit -> list_operations_request
val make_list_observability_configurations_response :
  ?next_token:string ->
    observability_configuration_summary_list:observability_configuration_summary
      list -> unit -> list_observability_configurations_response
val make_list_observability_configurations_request :
  ?next_token:string ->
    ?max_results:int ->
      ?latest_only:bool ->
        ?observability_configuration_name:string ->
          unit -> list_observability_configurations_request
val make_connection_summary :
  ?created_at:CoreTypes.Timestamp.t ->
    ?status:connection_status ->
      ?provider_type:provider_type ->
        ?connection_arn:string ->
          ?connection_name:string -> unit -> connection_summary
val make_list_connections_response :
  ?next_token:string ->
    connection_summary_list:connection_summary list ->
      unit -> list_connections_response
val make_list_connections_request :
  ?next_token:string ->
    ?max_results:int ->
      ?connection_name:string -> unit -> list_connections_request
val make_list_auto_scaling_configurations_response :
  ?next_token:string ->
    auto_scaling_configuration_summary_list:auto_scaling_configuration_summary
      list -> unit -> list_auto_scaling_configurations_response
val make_list_auto_scaling_configurations_request :
  ?next_token:string ->
    ?max_results:int ->
      ?latest_only:bool ->
        ?auto_scaling_configuration_name:string ->
          unit -> list_auto_scaling_configurations_request
val make_certificate_validation_record :
  ?status:certificate_validation_record_status ->
    ?value:string ->
      ?type_:string -> ?name:string -> unit -> certificate_validation_record
val make_custom_domain :
  ?certificate_validation_records:certificate_validation_record list ->
    status:custom_domain_association_status ->
      enable_www_subdomain:bool ->
        domain_name:string -> unit -> custom_domain
val make_disassociate_custom_domain_response :
  vpc_dns_targets:vpc_dns_target list ->
    custom_domain:custom_domain ->
      service_arn:string ->
        dns_target:string -> unit -> disassociate_custom_domain_response
val make_disassociate_custom_domain_request :
  domain_name:string ->
    service_arn:string -> unit -> disassociate_custom_domain_request
val make_describe_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection ->
    unit -> describe_vpc_ingress_connection_response
val make_describe_vpc_ingress_connection_request :
  vpc_ingress_connection_arn:string ->
    unit -> describe_vpc_ingress_connection_request
val make_describe_vpc_connector_response :
  vpc_connector:vpc_connector -> unit -> describe_vpc_connector_response
val make_describe_vpc_connector_request :
  vpc_connector_arn:string -> unit -> describe_vpc_connector_request
val make_describe_service_response :
  service:service -> unit -> describe_service_response
val make_describe_service_request :
  service_arn:string -> unit -> describe_service_request
val make_describe_observability_configuration_response :
  observability_configuration:observability_configuration ->
    unit -> describe_observability_configuration_response
val make_describe_observability_configuration_request :
  observability_configuration_arn:string ->
    unit -> describe_observability_configuration_request
val make_describe_custom_domains_response :
  ?next_token:string ->
    vpc_dns_targets:vpc_dns_target list ->
      custom_domains:custom_domain list ->
        service_arn:string ->
          dns_target:string -> unit -> describe_custom_domains_response
val make_describe_custom_domains_request :
  ?max_results:int ->
    ?next_token:string ->
      service_arn:string -> unit -> describe_custom_domains_request
val make_describe_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration ->
    unit -> describe_auto_scaling_configuration_response
val make_describe_auto_scaling_configuration_request :
  auto_scaling_configuration_arn:string ->
    unit -> describe_auto_scaling_configuration_request
val make_delete_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection ->
    unit -> delete_vpc_ingress_connection_response
val make_delete_vpc_ingress_connection_request :
  vpc_ingress_connection_arn:string ->
    unit -> delete_vpc_ingress_connection_request
val make_delete_vpc_connector_response :
  vpc_connector:vpc_connector -> unit -> delete_vpc_connector_response
val make_delete_vpc_connector_request :
  vpc_connector_arn:string -> unit -> delete_vpc_connector_request
val make_delete_service_response :
  operation_id:string -> service:service -> unit -> delete_service_response
val make_delete_service_request :
  service_arn:string -> unit -> delete_service_request
val make_delete_observability_configuration_response :
  observability_configuration:observability_configuration ->
    unit -> delete_observability_configuration_response
val make_delete_observability_configuration_request :
  observability_configuration_arn:string ->
    unit -> delete_observability_configuration_request
val make_connection :
  ?created_at:CoreTypes.Timestamp.t ->
    ?status:connection_status ->
      ?provider_type:provider_type ->
        ?connection_arn:string ->
          ?connection_name:string -> unit -> connection
val make_delete_connection_response :
  ?connection:connection -> unit -> delete_connection_response
val make_delete_connection_request :
  connection_arn:string -> unit -> delete_connection_request
val make_delete_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration ->
    unit -> delete_auto_scaling_configuration_response
val make_delete_auto_scaling_configuration_request :
  ?delete_all_revisions:bool ->
    auto_scaling_configuration_arn:string ->
      unit -> delete_auto_scaling_configuration_request
val make_create_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection ->
    unit -> create_vpc_ingress_connection_response
val make_create_vpc_ingress_connection_request :
  ?tags:tag list ->
    ingress_vpc_configuration:ingress_vpc_configuration ->
      vpc_ingress_connection_name:string ->
        service_arn:string -> unit -> create_vpc_ingress_connection_request
val make_create_vpc_connector_response :
  vpc_connector:vpc_connector -> unit -> create_vpc_connector_response
val make_create_vpc_connector_request :
  ?tags:tag list ->
    ?security_groups:string list ->
      subnets:string list ->
        vpc_connector_name:string -> unit -> create_vpc_connector_request
val make_create_service_response :
  operation_id:string -> service:service -> unit -> create_service_response
val make_create_service_request :
  ?observability_configuration:service_observability_configuration ->
    ?network_configuration:network_configuration ->
      ?auto_scaling_configuration_arn:string ->
        ?health_check_configuration:health_check_configuration ->
          ?encryption_configuration:encryption_configuration ->
            ?tags:tag list ->
              ?instance_configuration:instance_configuration ->
                source_configuration:source_configuration ->
                  service_name:string -> unit -> create_service_request
val make_create_observability_configuration_response :
  observability_configuration:observability_configuration ->
    unit -> create_observability_configuration_response
val make_create_observability_configuration_request :
  ?tags:tag list ->
    ?trace_configuration:trace_configuration ->
      observability_configuration_name:string ->
        unit -> create_observability_configuration_request
val make_create_connection_response :
  connection:connection -> unit -> create_connection_response
val make_create_connection_request :
  ?tags:tag list ->
    provider_type:provider_type ->
      connection_name:string -> unit -> create_connection_request
val make_create_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration ->
    unit -> create_auto_scaling_configuration_response
val make_create_auto_scaling_configuration_request :
  ?tags:tag list ->
    ?max_size:int ->
      ?min_size:int ->
        ?max_concurrency:int ->
          auto_scaling_configuration_name:string ->
            unit -> create_auto_scaling_configuration_request
val make_associate_custom_domain_response :
  vpc_dns_targets:vpc_dns_target list ->
    custom_domain:custom_domain ->
      service_arn:string ->
        dns_target:string -> unit -> associate_custom_domain_response
val make_associate_custom_domain_request :
  ?enable_www_subdomain:bool ->
    domain_name:string ->
      service_arn:string -> unit -> associate_custom_domain_request(** {1:operations Operations} *)

module AssociateCustomDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_custom_domain_request ->
        (associate_custom_domain_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            
        ]
      ) result
  (** 
    Associate your own domain name with the App Runner subdomain URL of your App Runner service.
    
     After you call [AssociateCustomDomain] and receive a successful response, use the information in the [CustomDomain] record that's returned to add CNAME records to your Domain Name System (DNS). For each mapped domain name, add a mapping to the target App Runner subdomain and one or more certificate validation records. App Runner then performs DNS validation to verify that you own or control the domain name that you associated. App Runner tracks domain validity in a certificate stored in {{:https://docs.aws.amazon.com/acm/latest/userguide}AWS Certificate Manager (ACM)}.
      *)

  
end

module CreateAutoScalingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      create_auto_scaling_configuration_request ->
        (create_auto_scaling_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            
        ]
      ) result
  (** 
    Create an App Runner automatic scaling configuration resource. App Runner requires this resource when you create or update App Runner services and you require non-default auto scaling settings. You can share an auto scaling configuration across multiple services.
    
     Create multiple revisions of a configuration by calling this action multiple times using the same [AutoScalingConfigurationName]. The call returns incremental [AutoScalingConfigurationRevision] values. When you create a service and configure an auto scaling configuration resource, the service uses the latest active revision of the auto scaling configuration by default. You can optionally configure the service to use a specific revision.
     
      Configure a higher [MinSize] to increase the spread of your App Runner service over more Availability Zones in the Amazon Web Services Region. The tradeoff is a higher minimal cost.
      
       Configure a lower [MaxSize] to control your cost. The tradeoff is lower responsiveness during peak demand.
        *)

  
end

module CreateConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_connection_request ->
        (create_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            
        ]
      ) result
  (** 
    Create an App Runner connection resource. App Runner requires a connection resource when you create App Runner services that access private repositories from certain third-party providers. You can share a connection across multiple services.
    
     A connection resource is needed to access GitHub and Bitbucket repositories. Both require a user interface approval process through the App Runner console before you can use the connection.
      *)

  
end

module CreateObservabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      create_observability_configuration_request ->
        (create_observability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            
        ]
      ) result
  (** 
    Create an App Runner observability configuration resource. App Runner requires this resource when you create or update App Runner services and you want to enable non-default observability features. You can share an observability configuration across multiple services.
    
     Create multiple revisions of a configuration by calling this action multiple times using the same [ObservabilityConfigurationName]. The call returns incremental [ObservabilityConfigurationRevision] values. When you create a service and configure an observability configuration resource, the service uses the latest active revision of the observability configuration by default. You can optionally configure the service to use a specific revision.
     
      The observability configuration resource is designed to configure multiple features (currently one feature, tracing). This action takes optional parameters that describe the configuration of these features (currently one parameter, [TraceConfiguration]). If you don't specify a feature parameter, App Runner doesn't enable the feature.
       *)

  
end

module CreateService : sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_request ->
        (create_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            
        ]
      ) result
  (** 
    Create an App Runner service. After the service is created, the action also automatically starts a deployment.
    
     This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the {{:https://docs.aws.amazon.com/apprunner/latest/api/API_ListOperations.html}ListOperations} call to track the operation's progress.
      *)

  
end

module CreateVpcConnector : sig
  val request :
    Smaws_Lib.Context.t ->
      create_vpc_connector_request ->
        (create_vpc_connector_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            
        ]
      ) result
  (** 
    Create an App Runner VPC connector resource. App Runner requires this resource when you want to associate your App Runner service to a custom Amazon Virtual Private Cloud (Amazon VPC).
     *)

  
end

module CreateVpcIngressConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_vpc_ingress_connection_request ->
        (create_vpc_ingress_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            
        ]
      ) result
  (** 
    Create an App Runner VPC Ingress Connection resource. App Runner requires this resource when you want to associate your App Runner service with an Amazon VPC endpoint.
     *)

  
end

module DeleteAutoScalingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_auto_scaling_configuration_request ->
        (delete_auto_scaling_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Delete an App Runner automatic scaling configuration resource. You can delete a top level auto scaling configuration, a specific revision of one, or all revisions associated with the top level configuration. You can't delete the default auto scaling configuration or a configuration that's used by one or more App Runner services.
     *)

  
end

module DeleteConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_connection_request ->
        (delete_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Delete an App Runner connection. You must first ensure that there are no running App Runner services that use this connection. If there are any, the [DeleteConnection] action fails.
     *)

  
end

module DeleteObservabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_observability_configuration_request ->
        (delete_observability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Delete an App Runner observability configuration resource. You can delete a specific revision or the latest active revision. You can't delete a configuration that's used by one or more App Runner services.
     *)

  
end

module DeleteService : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_service_request ->
        (delete_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Delete an App Runner service.
    
     This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the [ListOperations] call to track the operation's progress.
     
      Make sure that you don't have any active VPCIngressConnections associated with the service you want to delete.
      
       *)

  
end

module DeleteVpcConnector : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vpc_connector_request ->
        (delete_vpc_connector_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Delete an App Runner VPC connector resource. You can't delete a connector that's used by one or more App Runner services.
     *)

  
end

module DeleteVpcIngressConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vpc_ingress_connection_request ->
        (delete_vpc_ingress_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Delete an App Runner VPC Ingress Connection resource that's associated with an App Runner service. The VPC Ingress Connection must be in one of the following states to be deleted:
    
     {ul
          {- [AVAILABLE]
             
             }
           {- [FAILED_CREATION]
              
              }
           {- [FAILED_UPDATE]
              
              }
           {- [FAILED_DELETION]
              
              }
          
      }
       *)

  
end

module DescribeAutoScalingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_auto_scaling_configuration_request ->
        (describe_auto_scaling_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Return a full description of an App Runner automatic scaling configuration resource.
     *)

  
end

module DescribeCustomDomains : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_custom_domains_request ->
        (describe_custom_domains_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Return a description of custom domain names that are associated with an App Runner service.
     *)

  
end

module DescribeObservabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_observability_configuration_request ->
        (describe_observability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Return a full description of an App Runner observability configuration resource.
     *)

  
end

module DescribeService : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_service_request ->
        (describe_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Return a full description of an App Runner service.
     *)

  
end

module DescribeVpcConnector : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_vpc_connector_request ->
        (describe_vpc_connector_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Return a description of an App Runner VPC connector resource.
     *)

  
end

module DescribeVpcIngressConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_vpc_ingress_connection_request ->
        (describe_vpc_ingress_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Return a full description of an App Runner VPC Ingress Connection resource.
     *)

  
end

module DisassociateCustomDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_custom_domain_request ->
        (disassociate_custom_domain_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Disassociate a custom domain name from an App Runner service.
    
     Certificates tracking domain validity are associated with a custom domain and are stored in {{:https://docs.aws.amazon.com/acm/latest/userguide}AWS Certificate Manager (ACM)}. These certificates aren't deleted as part of this action. App Runner delays certificate deletion for 30 days after a domain is disassociated from your service.
      *)

  
end

module ListAutoScalingConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_auto_scaling_configurations_request ->
        (list_auto_scaling_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            
        ]
      ) result
  (** 
    Returns a list of active App Runner automatic scaling configurations in your Amazon Web Services account. You can query the revisions for a specific configuration name or the revisions for all active configurations in your account. You can optionally query only the latest revision of each requested name.
    
     To retrieve a full description of a particular configuration revision, call and provide one of the ARNs returned by [ListAutoScalingConfigurations].
      *)

  
end

module ListConnections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_connections_request ->
        (list_connections_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            
        ]
      ) result
  (** 
    Returns a list of App Runner connections that are associated with your Amazon Web Services account.
     *)

  
end

module ListObservabilityConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_observability_configurations_request ->
        (list_observability_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            
        ]
      ) result
  (** 
    Returns a list of active App Runner observability configurations in your Amazon Web Services account. You can query the revisions for a specific configuration name or the revisions for all active configurations in your account. You can optionally query only the latest revision of each requested name.
    
     To retrieve a full description of a particular configuration revision, call and provide one of the ARNs returned by [ListObservabilityConfigurations].
      *)

  
end

module ListOperations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_operations_request ->
        (list_operations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Return a list of operations that occurred on an App Runner service.
    
     The resulting list of [OperationSummary] objects is sorted in reverse chronological order. The first object on the list represents the last started operation.
      *)

  
end

module ListServices : sig
  val request :
    Smaws_Lib.Context.t ->
      list_services_request ->
        (list_services_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            
        ]
      ) result
  (** 
    Returns a list of running App Runner services in your Amazon Web Services account.
     *)

  
end

module ListServicesForAutoScalingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      list_services_for_auto_scaling_configuration_request ->
        (list_services_for_auto_scaling_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns a list of the associated App Runner services using an auto scaling configuration.
     *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    List tags that are associated with for an App Runner resource. The response contains a list of tag key-value pairs.
     *)

  
end

module ListVpcConnectors : sig
  val request :
    Smaws_Lib.Context.t ->
      list_vpc_connectors_request ->
        (list_vpc_connectors_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            
        ]
      ) result
  (** 
    Returns a list of App Runner VPC connectors in your Amazon Web Services account.
     *)

  
end

module ListVpcIngressConnections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_vpc_ingress_connections_request ->
        (list_vpc_ingress_connections_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            
        ]
      ) result
  (** 
    Return a list of App Runner VPC Ingress Connections in your Amazon Web Services account.
     *)

  
end

module PauseService : sig
  val request :
    Smaws_Lib.Context.t ->
      pause_service_request ->
        (pause_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Pause an active App Runner service. App Runner reduces compute capacity for the service to zero and loses state (for example, ephemeral storage is removed).
    
     This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the [ListOperations] call to track the operation's progress.
      *)

  
end

module ResumeService : sig
  val request :
    Smaws_Lib.Context.t ->
      resume_service_request ->
        (resume_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Resume an active App Runner service. App Runner provisions compute capacity for the service.
    
     This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the [ListOperations] call to track the operation's progress.
      *)

  
end

module StartDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      start_deployment_request ->
        (start_deployment_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Initiate a manual deployment of the latest commit in a source code repository or the latest image in a source image repository to an App Runner service.
    
     For a source code repository, App Runner retrieves the commit and builds a Docker image. For a source image repository, App Runner retrieves the latest Docker image. In both cases, App Runner then deploys the new image to your service and starts a new container instance.
     
      This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the [ListOperations] call to track the operation's progress.
       *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Add tags to, or update the tag values of, an App Runner resource. A tag is a key-value pair.
     *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Remove tags from an App Runner resource.
     *)

  
end

module UpdateDefaultAutoScalingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      update_default_auto_scaling_configuration_request ->
        (update_default_auto_scaling_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Update an auto scaling configuration to be the default. The existing default auto scaling configuration will be set to non-default automatically.
     *)

  
end

module UpdateService : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_request ->
        (update_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Update an App Runner service. You can update the source configuration and instance configuration of the service. You can also update the ARN of the auto scaling configuration resource that's associated with the service. However, you can't change the name or the encryption configuration of the service. These can be set only when you create the service.
    
     To update the tags applied to your service, use the separate actions [TagResource] and [UntagResource].
     
      This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the [ListOperations] call to track the operation's progress.
       *)

  
end

module UpdateVpcIngressConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      update_vpc_ingress_connection_request ->
        (update_vpc_ingress_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Update an existing App Runner VPC Ingress Connection resource. The VPC Ingress Connection must be in one of the following states to be updated:
    
     {ul
          {- AVAILABLE
             
             }
           {- FAILED_CREATION
              
              }
           {- FAILED_UPDATE
              
              }
          
      }
       *)

  
end

