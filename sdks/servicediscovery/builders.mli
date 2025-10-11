open Types

val make_update_service_response : ?operation_id:operation_id -> unit -> update_service_response
val make_dns_record : tt_l:record_tt_l -> type_:record_type -> unit -> dns_record
val make_dns_config_change : dns_records:dns_record_list -> unit -> dns_config_change

val make_health_check_config :
  ?failure_threshold:failure_threshold ->
  ?resource_path:resource_path ->
  type_:health_check_type ->
  unit ->
  health_check_config

val make_service_change :
  ?health_check_config:health_check_config ->
  ?dns_config:dns_config_change ->
  ?description:resource_description ->
  unit ->
  service_change

val make_update_service_request :
  service:service_change -> id:resource_id -> unit -> update_service_request

val make_update_service_attributes_response : unit -> unit

val make_update_service_attributes_request :
  attributes:service_attributes_map ->
  service_id:resource_id ->
  unit ->
  update_service_attributes_request

val make_update_public_dns_namespace_response :
  ?operation_id:operation_id -> unit -> update_public_dns_namespace_response

val make_soa_change : tt_l:record_tt_l -> unit -> soa_change

val make_public_dns_properties_mutable_change :
  so_a:soa_change -> unit -> public_dns_properties_mutable_change

val make_public_dns_namespace_properties_change :
  dns_properties:public_dns_properties_mutable_change ->
  unit ->
  public_dns_namespace_properties_change

val make_public_dns_namespace_change :
  ?properties:public_dns_namespace_properties_change ->
  ?description:resource_description ->
  unit ->
  public_dns_namespace_change

val make_update_public_dns_namespace_request :
  ?updater_request_id:resource_id ->
  namespace:public_dns_namespace_change ->
  id:resource_id ->
  unit ->
  update_public_dns_namespace_request

val make_update_private_dns_namespace_response :
  ?operation_id:operation_id -> unit -> update_private_dns_namespace_response

val make_private_dns_properties_mutable_change :
  so_a:soa_change -> unit -> private_dns_properties_mutable_change

val make_private_dns_namespace_properties_change :
  dns_properties:private_dns_properties_mutable_change ->
  unit ->
  private_dns_namespace_properties_change

val make_private_dns_namespace_change :
  ?properties:private_dns_namespace_properties_change ->
  ?description:resource_description ->
  unit ->
  private_dns_namespace_change

val make_update_private_dns_namespace_request :
  ?updater_request_id:resource_id ->
  namespace:private_dns_namespace_change ->
  id:resource_id ->
  unit ->
  update_private_dns_namespace_request

val make_update_instance_custom_health_status_request :
  status:custom_health_status ->
  instance_id:resource_id ->
  service_id:resource_id ->
  unit ->
  update_instance_custom_health_status_request

val make_update_http_namespace_response :
  ?operation_id:operation_id -> unit -> update_http_namespace_response

val make_http_namespace_change : description:resource_description -> unit -> http_namespace_change

val make_update_http_namespace_request :
  ?updater_request_id:resource_id ->
  namespace:http_namespace_change ->
  id:resource_id ->
  unit ->
  update_http_namespace_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_request

val make_dns_config :
  ?routing_policy:routing_policy ->
  ?namespace_id:resource_id ->
  dns_records:dns_record_list ->
  unit ->
  dns_config

val make_health_check_custom_config :
  ?failure_threshold:failure_threshold -> unit -> health_check_custom_config

val make_service_summary :
  ?create_date:timestamp ->
  ?health_check_custom_config:health_check_custom_config ->
  ?health_check_config:health_check_config ->
  ?dns_config:dns_config ->
  ?instance_count:resource_count ->
  ?description:resource_description ->
  ?type_:service_type ->
  ?name:service_name ->
  ?arn:arn ->
  ?id:resource_id ->
  unit ->
  service_summary

val make_service_filter :
  ?condition:filter_condition ->
  values:filter_values ->
  name:service_filter_name ->
  unit ->
  service_filter

val make_service_attributes :
  ?attributes:service_attributes_map -> ?service_arn:arn -> unit -> service_attributes

val make_service :
  ?creator_request_id:resource_id ->
  ?create_date:timestamp ->
  ?health_check_custom_config:health_check_custom_config ->
  ?health_check_config:health_check_config ->
  ?type_:service_type ->
  ?dns_config:dns_config ->
  ?instance_count:resource_count ->
  ?description:resource_description ->
  ?namespace_id:resource_id ->
  ?name:service_name ->
  ?arn:arn ->
  ?id:resource_id ->
  unit ->
  service

val make_so_a : tt_l:record_tt_l -> unit -> so_a

val make_register_instance_response :
  ?operation_id:operation_id -> unit -> register_instance_response

val make_register_instance_request :
  ?creator_request_id:resource_id ->
  attributes:attributes ->
  instance_id:instance_id ->
  service_id:resource_id ->
  unit ->
  register_instance_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_services_response :
  ?next_token:next_token -> ?services:service_summaries_list -> unit -> list_services_response

val make_list_services_request :
  ?filters:service_filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_services_request

val make_operation_summary :
  ?status:operation_status -> ?id:operation_id -> unit -> operation_summary

val make_list_operations_response :
  ?next_token:next_token -> ?operations:operation_summary_list -> unit -> list_operations_response

val make_operation_filter :
  ?condition:filter_condition ->
  values:filter_values ->
  name:operation_filter_name ->
  unit ->
  operation_filter

val make_list_operations_request :
  ?filters:operation_filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_operations_request

val make_dns_properties : ?so_a:so_a -> ?hosted_zone_id:resource_id -> unit -> dns_properties
val make_http_properties : ?http_name:namespace_name -> unit -> http_properties

val make_namespace_properties :
  ?http_properties:http_properties -> ?dns_properties:dns_properties -> unit -> namespace_properties

val make_namespace_summary :
  ?create_date:timestamp ->
  ?properties:namespace_properties ->
  ?service_count:resource_count ->
  ?description:resource_description ->
  ?type_:namespace_type ->
  ?name:namespace_name ->
  ?arn:arn ->
  ?id:resource_id ->
  unit ->
  namespace_summary

val make_list_namespaces_response :
  ?next_token:next_token -> ?namespaces:namespace_summaries_list -> unit -> list_namespaces_response

val make_namespace_filter :
  ?condition:filter_condition ->
  values:filter_values ->
  name:namespace_filter_name ->
  unit ->
  namespace_filter

val make_list_namespaces_request :
  ?filters:namespace_filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_namespaces_request

val make_instance_summary : ?attributes:attributes -> ?id:resource_id -> unit -> instance_summary

val make_list_instances_response :
  ?next_token:next_token -> ?instances:instance_summary_list -> unit -> list_instances_response

val make_list_instances_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  service_id:resource_id ->
  unit ->
  list_instances_request

val make_get_service_attributes_response :
  ?service_attributes:service_attributes -> unit -> get_service_attributes_response

val make_get_service_attributes_request :
  service_id:resource_id -> unit -> get_service_attributes_request

val make_get_service_response : ?service:service -> unit -> get_service_response
val make_get_service_request : id:resource_id -> unit -> get_service_request

val make_operation :
  ?targets:operation_targets_map ->
  ?update_date:timestamp ->
  ?create_date:timestamp ->
  ?error_code:code ->
  ?error_message:message ->
  ?status:operation_status ->
  ?type_:operation_type ->
  ?id:operation_id ->
  unit ->
  operation

val make_get_operation_response : ?operation:operation -> unit -> get_operation_response
val make_get_operation_request : operation_id:resource_id -> unit -> get_operation_request

val make_namespace :
  ?creator_request_id:resource_id ->
  ?create_date:timestamp ->
  ?properties:namespace_properties ->
  ?service_count:resource_count ->
  ?description:resource_description ->
  ?type_:namespace_type ->
  ?name:namespace_name ->
  ?arn:arn ->
  ?id:resource_id ->
  unit ->
  namespace

val make_get_namespace_response : ?namespace:namespace -> unit -> get_namespace_response
val make_get_namespace_request : id:resource_id -> unit -> get_namespace_request

val make_get_instances_health_status_response :
  ?next_token:next_token ->
  ?status:instance_health_status_map ->
  unit ->
  get_instances_health_status_response

val make_get_instances_health_status_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?instances:instance_id_list ->
  service_id:resource_id ->
  unit ->
  get_instances_health_status_request

val make_instance :
  ?attributes:attributes -> ?creator_request_id:resource_id -> id:resource_id -> unit -> instance

val make_get_instance_response : ?instance:instance -> unit -> get_instance_response

val make_get_instance_request :
  instance_id:resource_id -> service_id:resource_id -> unit -> get_instance_request

val make_discover_instances_revision_response :
  ?instances_revision:revision -> unit -> discover_instances_revision_response

val make_discover_instances_revision_request :
  service_name:service_name ->
  namespace_name:namespace_name ->
  unit ->
  discover_instances_revision_request

val make_http_instance_summary :
  ?attributes:attributes ->
  ?health_status:health_status ->
  ?service_name:service_name ->
  ?namespace_name:namespace_name_http ->
  ?instance_id:resource_id ->
  unit ->
  http_instance_summary

val make_discover_instances_response :
  ?instances_revision:revision ->
  ?instances:http_instance_summary_list ->
  unit ->
  discover_instances_response

val make_discover_instances_request :
  ?health_status:health_status_filter ->
  ?optional_parameters:attributes ->
  ?query_parameters:attributes ->
  ?max_results:discover_max_results ->
  service_name:service_name ->
  namespace_name:namespace_name ->
  unit ->
  discover_instances_request

val make_deregister_instance_response :
  ?operation_id:operation_id -> unit -> deregister_instance_response

val make_deregister_instance_request :
  instance_id:resource_id -> service_id:resource_id -> unit -> deregister_instance_request

val make_delete_service_attributes_response : unit -> unit

val make_delete_service_attributes_request :
  attributes:service_attribute_key_list ->
  service_id:resource_id ->
  unit ->
  delete_service_attributes_request

val make_delete_service_response : unit -> unit
val make_delete_service_request : id:resource_id -> unit -> delete_service_request
val make_delete_namespace_response : ?operation_id:operation_id -> unit -> delete_namespace_response
val make_delete_namespace_request : id:resource_id -> unit -> delete_namespace_request
val make_create_service_response : ?service:service -> unit -> create_service_response

val make_create_service_request :
  ?type_:service_type_option ->
  ?tags:tag_list ->
  ?health_check_custom_config:health_check_custom_config ->
  ?health_check_config:health_check_config ->
  ?dns_config:dns_config ->
  ?description:resource_description ->
  ?creator_request_id:resource_id ->
  ?namespace_id:resource_id ->
  name:service_name ->
  unit ->
  create_service_request

val make_create_public_dns_namespace_response :
  ?operation_id:operation_id -> unit -> create_public_dns_namespace_response

val make_public_dns_properties_mutable : so_a:so_a -> unit -> public_dns_properties_mutable

val make_public_dns_namespace_properties :
  dns_properties:public_dns_properties_mutable -> unit -> public_dns_namespace_properties

val make_create_public_dns_namespace_request :
  ?properties:public_dns_namespace_properties ->
  ?tags:tag_list ->
  ?description:resource_description ->
  ?creator_request_id:resource_id ->
  name:namespace_name_public ->
  unit ->
  create_public_dns_namespace_request

val make_create_private_dns_namespace_response :
  ?operation_id:operation_id -> unit -> create_private_dns_namespace_response

val make_private_dns_properties_mutable : so_a:so_a -> unit -> private_dns_properties_mutable

val make_private_dns_namespace_properties :
  dns_properties:private_dns_properties_mutable -> unit -> private_dns_namespace_properties

val make_create_private_dns_namespace_request :
  ?properties:private_dns_namespace_properties ->
  ?tags:tag_list ->
  ?description:resource_description ->
  ?creator_request_id:resource_id ->
  vpc:resource_id ->
  name:namespace_name_private ->
  unit ->
  create_private_dns_namespace_request

val make_create_http_namespace_response :
  ?operation_id:operation_id -> unit -> create_http_namespace_response

val make_create_http_namespace_request :
  ?tags:tag_list ->
  ?description:resource_description ->
  ?creator_request_id:resource_id ->
  name:namespace_name_http ->
  unit ->
  create_http_namespace_request
