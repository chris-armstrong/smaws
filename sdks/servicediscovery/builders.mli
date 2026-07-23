open Types

val make_create_http_namespace_response :
  ?operation_id:operation_id -> unit -> create_http_namespace_response

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_create_http_namespace_request :
  ?creator_request_id:resource_id ->
  ?description:resource_description ->
  ?tags:tag_list ->
  name:namespace_name_http ->
  unit ->
  create_http_namespace_request

val make_create_private_dns_namespace_response :
  ?operation_id:operation_id -> unit -> create_private_dns_namespace_response

val make_so_a : tt_l:record_tt_l -> unit -> so_a
val make_private_dns_properties_mutable : so_a:so_a -> unit -> private_dns_properties_mutable

val make_private_dns_namespace_properties :
  dns_properties:private_dns_properties_mutable -> unit -> private_dns_namespace_properties

val make_create_private_dns_namespace_request :
  ?creator_request_id:resource_id ->
  ?description:resource_description ->
  ?tags:tag_list ->
  ?properties:private_dns_namespace_properties ->
  name:namespace_name_private ->
  vpc:resource_id ->
  unit ->
  create_private_dns_namespace_request

val make_create_public_dns_namespace_response :
  ?operation_id:operation_id -> unit -> create_public_dns_namespace_response

val make_public_dns_properties_mutable : so_a:so_a -> unit -> public_dns_properties_mutable

val make_public_dns_namespace_properties :
  dns_properties:public_dns_properties_mutable -> unit -> public_dns_namespace_properties

val make_create_public_dns_namespace_request :
  ?creator_request_id:resource_id ->
  ?description:resource_description ->
  ?tags:tag_list ->
  ?properties:public_dns_namespace_properties ->
  name:namespace_name_public ->
  unit ->
  create_public_dns_namespace_request

val make_health_check_custom_config :
  ?failure_threshold:failure_threshold -> unit -> health_check_custom_config

val make_health_check_config :
  ?resource_path:resource_path ->
  ?failure_threshold:failure_threshold ->
  type_:health_check_type ->
  unit ->
  health_check_config

val make_dns_record : type_:record_type -> tt_l:record_tt_l -> unit -> dns_record

val make_dns_config :
  ?namespace_id:resource_id ->
  ?routing_policy:routing_policy ->
  dns_records:dns_record_list ->
  unit ->
  dns_config

val make_service :
  ?id:resource_id ->
  ?arn:arn ->
  ?resource_owner:aws_account_id ->
  ?name:service_name ->
  ?namespace_id:resource_id ->
  ?description:resource_description ->
  ?instance_count:resource_count ->
  ?dns_config:dns_config ->
  ?type_:service_type ->
  ?health_check_config:health_check_config ->
  ?health_check_custom_config:health_check_custom_config ->
  ?create_date:timestamp ->
  ?creator_request_id:resource_id ->
  ?created_by_account:aws_account_id ->
  unit ->
  service

val make_create_service_response : ?service:service -> unit -> create_service_response

val make_create_service_request :
  ?namespace_id:arn ->
  ?creator_request_id:resource_id ->
  ?description:resource_description ->
  ?dns_config:dns_config ->
  ?health_check_config:health_check_config ->
  ?health_check_custom_config:health_check_custom_config ->
  ?tags:tag_list ->
  ?type_:service_type_option ->
  name:service_name ->
  unit ->
  create_service_request

val make_delete_namespace_response : ?operation_id:operation_id -> unit -> delete_namespace_response
val make_delete_namespace_request : id:arn -> unit -> delete_namespace_request
val make_delete_service_response : unit -> unit
val make_delete_service_request : id:arn -> unit -> delete_service_request
val make_delete_service_attributes_response : unit -> unit

val make_delete_service_attributes_request :
  service_id:arn ->
  attributes:service_attribute_key_list ->
  unit ->
  delete_service_attributes_request

val make_deregister_instance_response :
  ?operation_id:operation_id -> unit -> deregister_instance_response

val make_deregister_instance_request :
  service_id:arn -> instance_id:resource_id -> unit -> deregister_instance_request

val make_http_instance_summary :
  ?instance_id:resource_id ->
  ?namespace_name:namespace_name_http ->
  ?service_name:service_name ->
  ?health_status:health_status ->
  ?attributes:attributes ->
  unit ->
  http_instance_summary

val make_discover_instances_response :
  ?instances:http_instance_summary_list ->
  ?instances_revision:revision ->
  unit ->
  discover_instances_response

val make_discover_instances_request :
  ?max_results:discover_max_results ->
  ?query_parameters:attributes ->
  ?optional_parameters:attributes ->
  ?health_status:health_status_filter ->
  ?owner_account:aws_account_id ->
  namespace_name:namespace_name ->
  service_name:service_name ->
  unit ->
  discover_instances_request

val make_discover_instances_revision_response :
  ?instances_revision:revision -> unit -> discover_instances_revision_response

val make_discover_instances_revision_request :
  ?owner_account:aws_account_id ->
  namespace_name:namespace_name ->
  service_name:service_name ->
  unit ->
  discover_instances_revision_request

val make_dns_config_change : dns_records:dns_record_list -> unit -> dns_config_change
val make_dns_properties : ?hosted_zone_id:resource_id -> ?so_a:so_a -> unit -> dns_properties

val make_instance :
  ?creator_request_id:resource_id ->
  ?attributes:attributes ->
  ?created_by_account:aws_account_id ->
  id:resource_id ->
  unit ->
  instance

val make_get_instance_response :
  ?resource_owner:aws_account_id -> ?instance:instance -> unit -> get_instance_response

val make_get_instance_request :
  service_id:arn -> instance_id:resource_id -> unit -> get_instance_request

val make_get_instances_health_status_response :
  ?status:instance_health_status_map ->
  ?next_token:next_token ->
  unit ->
  get_instances_health_status_response

val make_get_instances_health_status_request :
  ?instances:instance_id_list ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  service_id:arn ->
  unit ->
  get_instances_health_status_request

val make_http_properties : ?http_name:namespace_name -> unit -> http_properties

val make_namespace_properties :
  ?dns_properties:dns_properties -> ?http_properties:http_properties -> unit -> namespace_properties

val make_namespace :
  ?id:resource_id ->
  ?arn:arn ->
  ?resource_owner:aws_account_id ->
  ?name:namespace_name ->
  ?type_:namespace_type ->
  ?description:resource_description ->
  ?service_count:resource_count ->
  ?properties:namespace_properties ->
  ?create_date:timestamp ->
  ?creator_request_id:resource_id ->
  unit ->
  namespace

val make_get_namespace_response : ?namespace:namespace -> unit -> get_namespace_response
val make_get_namespace_request : id:arn -> unit -> get_namespace_request

val make_operation :
  ?id:operation_id ->
  ?owner_account:aws_account_id ->
  ?type_:operation_type ->
  ?status:operation_status ->
  ?error_message:message ->
  ?error_code:code ->
  ?create_date:timestamp ->
  ?update_date:timestamp ->
  ?targets:operation_targets_map ->
  unit ->
  operation

val make_get_operation_response : ?operation:operation -> unit -> get_operation_response

val make_get_operation_request :
  ?owner_account:aws_account_id -> operation_id:operation_id -> unit -> get_operation_request

val make_get_service_response : ?service:service -> unit -> get_service_response
val make_get_service_request : id:arn -> unit -> get_service_request

val make_service_attributes :
  ?service_arn:arn ->
  ?resource_owner:aws_account_id ->
  ?attributes:service_attributes_map ->
  unit ->
  service_attributes

val make_get_service_attributes_response :
  ?service_attributes:service_attributes -> unit -> get_service_attributes_response

val make_get_service_attributes_request : service_id:arn -> unit -> get_service_attributes_request
val make_http_namespace_change : description:resource_description -> unit -> http_namespace_change

val make_instance_summary :
  ?id:resource_id ->
  ?attributes:attributes ->
  ?created_by_account:aws_account_id ->
  unit ->
  instance_summary

val make_list_instances_response :
  ?resource_owner:aws_account_id ->
  ?instances:instance_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_instances_response

val make_list_instances_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  service_id:arn ->
  unit ->
  list_instances_request

val make_namespace_summary :
  ?id:resource_id ->
  ?arn:arn ->
  ?resource_owner:aws_account_id ->
  ?name:namespace_name ->
  ?type_:namespace_type ->
  ?description:resource_description ->
  ?service_count:resource_count ->
  ?properties:namespace_properties ->
  ?create_date:timestamp ->
  unit ->
  namespace_summary

val make_list_namespaces_response :
  ?namespaces:namespace_summaries_list -> ?next_token:next_token -> unit -> list_namespaces_response

val make_namespace_filter :
  ?condition:filter_condition ->
  name:namespace_filter_name ->
  values:filter_values ->
  unit ->
  namespace_filter

val make_list_namespaces_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:namespace_filters ->
  unit ->
  list_namespaces_request

val make_operation_summary :
  ?id:operation_id -> ?status:operation_status -> unit -> operation_summary

val make_list_operations_response :
  ?operations:operation_summary_list -> ?next_token:next_token -> unit -> list_operations_response

val make_operation_filter :
  ?condition:filter_condition ->
  name:operation_filter_name ->
  values:filter_values ->
  unit ->
  operation_filter

val make_list_operations_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:operation_filters ->
  unit ->
  list_operations_request

val make_service_summary :
  ?id:resource_id ->
  ?arn:arn ->
  ?resource_owner:aws_account_id ->
  ?name:service_name ->
  ?type_:service_type ->
  ?description:resource_description ->
  ?instance_count:resource_count ->
  ?dns_config:dns_config ->
  ?health_check_config:health_check_config ->
  ?health_check_custom_config:health_check_custom_config ->
  ?create_date:timestamp ->
  ?created_by_account:aws_account_id ->
  unit ->
  service_summary

val make_list_services_response :
  ?services:service_summaries_list -> ?next_token:next_token -> unit -> list_services_response

val make_service_filter :
  ?condition:filter_condition ->
  name:service_filter_name ->
  values:filter_values ->
  unit ->
  service_filter

val make_list_services_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:service_filters ->
  unit ->
  list_services_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_soa_change : tt_l:record_tt_l -> unit -> soa_change

val make_private_dns_properties_mutable_change :
  so_a:soa_change -> unit -> private_dns_properties_mutable_change

val make_private_dns_namespace_properties_change :
  dns_properties:private_dns_properties_mutable_change ->
  unit ->
  private_dns_namespace_properties_change

val make_private_dns_namespace_change :
  ?description:resource_description ->
  ?properties:private_dns_namespace_properties_change ->
  unit ->
  private_dns_namespace_change

val make_public_dns_properties_mutable_change :
  so_a:soa_change -> unit -> public_dns_properties_mutable_change

val make_public_dns_namespace_properties_change :
  dns_properties:public_dns_properties_mutable_change ->
  unit ->
  public_dns_namespace_properties_change

val make_public_dns_namespace_change :
  ?description:resource_description ->
  ?properties:public_dns_namespace_properties_change ->
  unit ->
  public_dns_namespace_change

val make_register_instance_response :
  ?operation_id:operation_id -> unit -> register_instance_response

val make_register_instance_request :
  ?creator_request_id:resource_id ->
  service_id:arn ->
  instance_id:instance_id ->
  attributes:attributes ->
  unit ->
  register_instance_request

val make_update_service_attributes_response : unit -> unit

val make_update_service_attributes_request :
  service_id:arn -> attributes:service_attributes_map -> unit -> update_service_attributes_request

val make_update_service_response : ?operation_id:operation_id -> unit -> update_service_response

val make_service_change :
  ?description:resource_description ->
  ?dns_config:dns_config_change ->
  ?health_check_config:health_check_config ->
  unit ->
  service_change

val make_update_service_request : id:arn -> service:service_change -> unit -> update_service_request

val make_update_public_dns_namespace_response :
  ?operation_id:operation_id -> unit -> update_public_dns_namespace_response

val make_update_public_dns_namespace_request :
  ?updater_request_id:resource_id ->
  id:arn ->
  namespace:public_dns_namespace_change ->
  unit ->
  update_public_dns_namespace_request

val make_update_private_dns_namespace_response :
  ?operation_id:operation_id -> unit -> update_private_dns_namespace_response

val make_update_private_dns_namespace_request :
  ?updater_request_id:resource_id ->
  id:arn ->
  namespace:private_dns_namespace_change ->
  unit ->
  update_private_dns_namespace_request

val make_update_instance_custom_health_status_request :
  service_id:arn ->
  instance_id:resource_id ->
  status:custom_health_status ->
  unit ->
  update_instance_custom_health_status_request

val make_update_http_namespace_response :
  ?operation_id:operation_id -> unit -> update_http_namespace_response

val make_update_http_namespace_request :
  ?updater_request_id:resource_id ->
  id:arn ->
  namespace:http_namespace_change ->
  unit ->
  update_http_namespace_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_request
