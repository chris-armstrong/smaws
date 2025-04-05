open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "servicediscovery";
      endpointPrefix = "servicediscovery";
      version = "2017-03-14";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec update_service_response = {
  operation_id: string option }
type nonrec record_type =
  | CNAME 
  | AAAA 
  | A 
  | SRV 
type nonrec dns_record = {
  tt_l: int ;
  type_: record_type }
type nonrec dns_config_change = {
  dns_records: dns_record list }
type nonrec health_check_type =
  | TCP 
  | HTTPS 
  | HTTP 
type nonrec health_check_config =
  {
  failure_threshold: int option ;
  resource_path: string option ;
  type_: health_check_type }
type nonrec service_change =
  {
  health_check_config: health_check_config option ;
  dns_config: dns_config_change option ;
  description: string option }
type nonrec update_service_request = {
  service: service_change ;
  id: string }
type nonrec service_not_found = {
  message: string option }
type nonrec invalid_input = {
  message: string option }
type nonrec duplicate_request =
  {
  duplicate_operation_id: string option ;
  message: string option }
type nonrec update_public_dns_namespace_response =
  {
  operation_id: string option }
type nonrec soa_change = {
  tt_l: int }
type nonrec public_dns_properties_mutable_change = {
  so_a: soa_change }
type nonrec public_dns_namespace_properties_change =
  {
  dns_properties: public_dns_properties_mutable_change }
type nonrec public_dns_namespace_change =
  {
  properties: public_dns_namespace_properties_change option ;
  description: string option }
type nonrec update_public_dns_namespace_request =
  {
  namespace: public_dns_namespace_change ;
  updater_request_id: string option ;
  id: string }
type nonrec resource_in_use = {
  message: string option }
type nonrec namespace_not_found = {
  message: string option }
type nonrec update_private_dns_namespace_response =
  {
  operation_id: string option }
type nonrec private_dns_properties_mutable_change = {
  so_a: soa_change }
type nonrec private_dns_namespace_properties_change =
  {
  dns_properties: private_dns_properties_mutable_change }
type nonrec private_dns_namespace_change =
  {
  properties: private_dns_namespace_properties_change option ;
  description: string option }
type nonrec update_private_dns_namespace_request =
  {
  namespace: private_dns_namespace_change ;
  updater_request_id: string option ;
  id: string }
type nonrec custom_health_status =
  | UNHEALTHY 
  | HEALTHY 
type nonrec update_instance_custom_health_status_request =
  {
  status: custom_health_status ;
  instance_id: string ;
  service_id: string }
type nonrec instance_not_found = {
  message: string option }
type nonrec custom_health_not_found = {
  message: string option }
type nonrec update_http_namespace_response = {
  operation_id: string option }
type nonrec http_namespace_change = {
  description: string }
type nonrec update_http_namespace_request =
  {
  namespace: http_namespace_change ;
  updater_request_id: string option ;
  id: string }
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_ar_n: string }
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec too_many_tags_exception =
  {
  resource_name: string option ;
  message: string option }
type nonrec tag_resource_response = unit
type nonrec tag = {
  value: string ;
  key: string }
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_ar_n: string }
type nonrec service_type_option =
  | HTTP 
type nonrec service_type =
  | DNS 
  | DNS_HTTP 
  | HTTP 
type nonrec routing_policy =
  | WEIGHTED 
  | MULTIVALUE 
type nonrec dns_config =
  {
  dns_records: dns_record list ;
  routing_policy: routing_policy option ;
  namespace_id: string option }
type nonrec health_check_custom_config = {
  failure_threshold: int option }
type nonrec service_summary =
  {
  create_date: CoreTypes.Timestamp.t option ;
  health_check_custom_config: health_check_custom_config option ;
  health_check_config: health_check_config option ;
  dns_config: dns_config option ;
  instance_count: int option ;
  description: string option ;
  type_: service_type option ;
  name: string option ;
  arn: string option ;
  id: string option }
type nonrec service_filter_name =
  | NAMESPACE_ID 
type nonrec filter_condition =
  | BEGINS_WITH 
  | BETWEEN 
  | IN 
  | EQ 
type nonrec service_filter =
  {
  condition: filter_condition option ;
  values: string list ;
  name: service_filter_name }
type nonrec service_already_exists =
  {
  service_id: string option ;
  creator_request_id: string option ;
  message: string option }
type nonrec service =
  {
  creator_request_id: string option ;
  create_date: CoreTypes.Timestamp.t option ;
  health_check_custom_config: health_check_custom_config option ;
  health_check_config: health_check_config option ;
  type_: service_type option ;
  dns_config: dns_config option ;
  instance_count: int option ;
  description: string option ;
  namespace_id: string option ;
  name: string option ;
  arn: string option ;
  id: string option }
type nonrec so_a = {
  tt_l: int }
type nonrec resource_limit_exceeded = {
  message: string option }
type nonrec register_instance_response = {
  operation_id: string option }
type nonrec attributes = (string * string) list
type nonrec register_instance_request =
  {
  attributes: attributes ;
  creator_request_id: string option ;
  instance_id: string ;
  service_id: string }
type nonrec list_tags_for_resource_response = {
  tags: tag list option }
type nonrec list_tags_for_resource_request = {
  resource_ar_n: string }
type nonrec list_services_response =
  {
  next_token: string option ;
  services: service_summary list option }
type nonrec list_services_request =
  {
  filters: service_filter list option ;
  max_results: int option ;
  next_token: string option }
type nonrec operation_status =
  | FAIL 
  | SUCCESS 
  | PENDING 
  | SUBMITTED 
type nonrec operation_summary =
  {
  status: operation_status option ;
  id: string option }
type nonrec list_operations_response =
  {
  next_token: string option ;
  operations: operation_summary list option }
type nonrec operation_filter_name =
  | UPDATE_DATE 
  | TYPE 
  | STATUS 
  | SERVICE_ID 
  | NAMESPACE_ID 
type nonrec operation_filter =
  {
  condition: filter_condition option ;
  values: string list ;
  name: operation_filter_name }
type nonrec list_operations_request =
  {
  filters: operation_filter list option ;
  max_results: int option ;
  next_token: string option }
type nonrec namespace_type =
  | HTTP 
  | DNS_PRIVATE 
  | DNS_PUBLIC 
type nonrec dns_properties =
  {
  so_a: so_a option ;
  hosted_zone_id: string option }
type nonrec http_properties = {
  http_name: string option }
type nonrec namespace_properties =
  {
  http_properties: http_properties option ;
  dns_properties: dns_properties option }
type nonrec namespace_summary =
  {
  create_date: CoreTypes.Timestamp.t option ;
  properties: namespace_properties option ;
  service_count: int option ;
  description: string option ;
  type_: namespace_type option ;
  name: string option ;
  arn: string option ;
  id: string option }
type nonrec list_namespaces_response =
  {
  next_token: string option ;
  namespaces: namespace_summary list option }
type nonrec namespace_filter_name =
  | HTTP_NAME 
  | NAME 
  | TYPE 
type nonrec namespace_filter =
  {
  condition: filter_condition option ;
  values: string list ;
  name: namespace_filter_name }
type nonrec list_namespaces_request =
  {
  filters: namespace_filter list option ;
  max_results: int option ;
  next_token: string option }
type nonrec instance_summary =
  {
  attributes: attributes option ;
  id: string option }
type nonrec list_instances_response =
  {
  next_token: string option ;
  instances: instance_summary list option }
type nonrec list_instances_request =
  {
  max_results: int option ;
  next_token: string option ;
  service_id: string }
type nonrec get_service_response = {
  service: service option }
type nonrec get_service_request = {
  id: string }
type nonrec operation_not_found = {
  message: string option }
type nonrec operation_type =
  | DEREGISTER_INSTANCE 
  | REGISTER_INSTANCE 
  | UPDATE_SERVICE 
  | UPDATE_NAMESPACE 
  | DELETE_NAMESPACE 
  | CREATE_NAMESPACE 
type nonrec operation_target_type =
  | INSTANCE 
  | SERVICE 
  | NAMESPACE 
type nonrec operation_targets_map = (operation_target_type * string) list
type nonrec operation =
  {
  targets: operation_targets_map option ;
  update_date: CoreTypes.Timestamp.t option ;
  create_date: CoreTypes.Timestamp.t option ;
  error_code: string option ;
  error_message: string option ;
  status: operation_status option ;
  type_: operation_type option ;
  id: string option }
type nonrec get_operation_response = {
  operation: operation option }
type nonrec get_operation_request = {
  operation_id: string }
type nonrec namespace =
  {
  creator_request_id: string option ;
  create_date: CoreTypes.Timestamp.t option ;
  properties: namespace_properties option ;
  service_count: int option ;
  description: string option ;
  type_: namespace_type option ;
  name: string option ;
  arn: string option ;
  id: string option }
type nonrec get_namespace_response = {
  namespace: namespace option }
type nonrec get_namespace_request = {
  id: string }
type nonrec health_status =
  | UNKNOWN 
  | UNHEALTHY 
  | HEALTHY 
type nonrec instance_health_status_map = (string * health_status) list
type nonrec get_instances_health_status_response =
  {
  next_token: string option ;
  status: instance_health_status_map option }
type nonrec get_instances_health_status_request =
  {
  next_token: string option ;
  max_results: int option ;
  instances: string list option ;
  service_id: string }
type nonrec instance =
  {
  attributes: attributes option ;
  creator_request_id: string option ;
  id: string }
type nonrec get_instance_response = {
  instance: instance option }
type nonrec get_instance_request = {
  instance_id: string ;
  service_id: string }
type nonrec request_limit_exceeded = {
  message: string option }
type nonrec discover_instances_revision_response =
  {
  instances_revision: int option }
type nonrec discover_instances_revision_request =
  {
  service_name: string ;
  namespace_name: string }
type nonrec http_instance_summary =
  {
  attributes: attributes option ;
  health_status: health_status option ;
  service_name: string option ;
  namespace_name: string option ;
  instance_id: string option }
type nonrec discover_instances_response =
  {
  instances_revision: int option ;
  instances: http_instance_summary list option }
type nonrec health_status_filter =
  | HEALTHY_OR_ELSE_ALL 
  | ALL 
  | UNHEALTHY 
  | HEALTHY 
type nonrec discover_instances_request =
  {
  health_status: health_status_filter option ;
  optional_parameters: attributes option ;
  query_parameters: attributes option ;
  max_results: int option ;
  service_name: string ;
  namespace_name: string }
type nonrec deregister_instance_response = {
  operation_id: string option }
type nonrec deregister_instance_request =
  {
  instance_id: string ;
  service_id: string }
type nonrec delete_service_response = unit
type nonrec delete_service_request = {
  id: string }
type nonrec delete_namespace_response = {
  operation_id: string option }
type nonrec delete_namespace_request = {
  id: string }
type nonrec create_service_response = {
  service: service option }
type nonrec create_service_request =
  {
  type_: service_type_option option ;
  tags: tag list option ;
  health_check_custom_config: health_check_custom_config option ;
  health_check_config: health_check_config option ;
  dns_config: dns_config option ;
  description: string option ;
  creator_request_id: string option ;
  namespace_id: string option ;
  name: string }
type nonrec namespace_already_exists =
  {
  namespace_id: string option ;
  creator_request_id: string option ;
  message: string option }
type nonrec create_public_dns_namespace_response =
  {
  operation_id: string option }
type nonrec public_dns_properties_mutable = {
  so_a: so_a }
type nonrec public_dns_namespace_properties =
  {
  dns_properties: public_dns_properties_mutable }
type nonrec create_public_dns_namespace_request =
  {
  properties: public_dns_namespace_properties option ;
  tags: tag list option ;
  description: string option ;
  creator_request_id: string option ;
  name: string }
type nonrec create_private_dns_namespace_response =
  {
  operation_id: string option }
type nonrec private_dns_properties_mutable = {
  so_a: so_a }
type nonrec private_dns_namespace_properties =
  {
  dns_properties: private_dns_properties_mutable }
type nonrec create_private_dns_namespace_request =
  {
  properties: private_dns_namespace_properties option ;
  tags: tag list option ;
  vpc: string ;
  description: string option ;
  creator_request_id: string option ;
  name: string }
type nonrec create_http_namespace_response = {
  operation_id: string option }
type nonrec create_http_namespace_request =
  {
  tags: tag list option ;
  description: string option ;
  creator_request_id: string option ;
  name: string }