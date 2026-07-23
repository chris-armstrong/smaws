open Types

val make_accelerator_event :
  ?message:generic_string -> ?timestamp:timestamp -> unit -> accelerator_event

val make_ip_set :
  ?ip_family:generic_string ->
  ?ip_addresses:ip_addresses ->
  ?ip_address_family:ip_address_family ->
  unit ->
  ip_set

val make_accelerator :
  ?accelerator_arn:generic_string ->
  ?name:generic_string ->
  ?ip_address_type:ip_address_type ->
  ?enabled:generic_boolean ->
  ?ip_sets:ip_sets ->
  ?dns_name:generic_string ->
  ?status:accelerator_status ->
  ?created_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?dual_stack_dns_name:generic_string ->
  ?events:accelerator_events ->
  unit ->
  accelerator

val make_accelerator_attributes :
  ?flow_logs_enabled:generic_boolean ->
  ?flow_logs_s3_bucket:generic_string ->
  ?flow_logs_s3_prefix:generic_string ->
  unit ->
  accelerator_attributes

val make_custom_routing_endpoint_description :
  ?endpoint_id:generic_string -> unit -> custom_routing_endpoint_description

val make_add_custom_routing_endpoints_response :
  ?endpoint_descriptions:custom_routing_endpoint_descriptions ->
  ?endpoint_group_arn:generic_string ->
  unit ->
  add_custom_routing_endpoints_response

val make_custom_routing_endpoint_configuration :
  ?endpoint_id:generic_string ->
  ?attachment_arn:generic_string ->
  unit ->
  custom_routing_endpoint_configuration

val make_add_custom_routing_endpoints_request :
  endpoint_configurations:custom_routing_endpoint_configurations ->
  endpoint_group_arn:generic_string ->
  unit ->
  add_custom_routing_endpoints_request

val make_endpoint_description :
  ?endpoint_id:generic_string ->
  ?weight:endpoint_weight ->
  ?health_state:health_state ->
  ?health_reason:generic_string ->
  ?client_ip_preservation_enabled:generic_boolean ->
  unit ->
  endpoint_description

val make_add_endpoints_response :
  ?endpoint_descriptions:endpoint_descriptions ->
  ?endpoint_group_arn:generic_string ->
  unit ->
  add_endpoints_response

val make_endpoint_configuration :
  ?endpoint_id:generic_string ->
  ?weight:endpoint_weight ->
  ?client_ip_preservation_enabled:generic_boolean ->
  ?attachment_arn:generic_string ->
  unit ->
  endpoint_configuration

val make_add_endpoints_request :
  endpoint_configurations:endpoint_configurations ->
  endpoint_group_arn:generic_string ->
  unit ->
  add_endpoints_request

val make_byoip_cidr_event :
  ?message:generic_string -> ?timestamp:timestamp -> unit -> byoip_cidr_event

val make_byoip_cidr :
  ?cidr:generic_string -> ?state:byoip_cidr_state -> ?events:byoip_cidr_events -> unit -> byoip_cidr

val make_advertise_byoip_cidr_response :
  ?byoip_cidr:byoip_cidr -> unit -> advertise_byoip_cidr_response

val make_advertise_byoip_cidr_request : cidr:generic_string -> unit -> advertise_byoip_cidr_request

val make_allow_custom_routing_traffic_request :
  ?destination_addresses:destination_addresses ->
  ?destination_ports:destination_ports ->
  ?allow_all_traffic_to_endpoint:generic_boolean ->
  endpoint_group_arn:generic_string ->
  endpoint_id:generic_string ->
  unit ->
  allow_custom_routing_traffic_request

val make_resource :
  ?endpoint_id:generic_string -> ?cidr:generic_string -> ?region:generic_string -> unit -> resource

val make_attachment :
  ?attachment_arn:generic_string ->
  ?name:attachment_name ->
  ?principals:principals ->
  ?resources:resources ->
  ?last_modified_time:timestamp ->
  ?created_time:timestamp ->
  unit ->
  attachment

val make_cidr_authorization_context :
  message:generic_string -> signature:generic_string -> unit -> cidr_authorization_context

val make_create_accelerator_response :
  ?accelerator:accelerator -> unit -> create_accelerator_response

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_create_accelerator_request :
  ?ip_address_type:ip_address_type ->
  ?ip_addresses:ip_addresses ->
  ?enabled:generic_boolean ->
  ?tags:tags ->
  name:generic_string ->
  idempotency_token:idempotency_token ->
  unit ->
  create_accelerator_request

val make_create_cross_account_attachment_response :
  ?cross_account_attachment:attachment -> unit -> create_cross_account_attachment_response

val make_create_cross_account_attachment_request :
  ?principals:principals ->
  ?resources:resources ->
  ?tags:tags ->
  name:attachment_name ->
  idempotency_token:idempotency_token ->
  unit ->
  create_cross_account_attachment_request

val make_custom_routing_accelerator :
  ?accelerator_arn:generic_string ->
  ?name:generic_string ->
  ?ip_address_type:ip_address_type ->
  ?enabled:generic_boolean ->
  ?ip_sets:ip_sets ->
  ?dns_name:generic_string ->
  ?status:custom_routing_accelerator_status ->
  ?created_time:timestamp ->
  ?last_modified_time:timestamp ->
  unit ->
  custom_routing_accelerator

val make_create_custom_routing_accelerator_response :
  ?accelerator:custom_routing_accelerator -> unit -> create_custom_routing_accelerator_response

val make_create_custom_routing_accelerator_request :
  ?ip_address_type:ip_address_type ->
  ?ip_addresses:ip_addresses ->
  ?enabled:generic_boolean ->
  ?tags:tags ->
  name:generic_string ->
  idempotency_token:idempotency_token ->
  unit ->
  create_custom_routing_accelerator_request

val make_custom_routing_destination_description :
  ?from_port:port_number ->
  ?to_port:port_number ->
  ?protocols:protocols ->
  unit ->
  custom_routing_destination_description

val make_custom_routing_endpoint_group :
  ?endpoint_group_arn:generic_string ->
  ?endpoint_group_region:generic_string ->
  ?destination_descriptions:custom_routing_destination_descriptions ->
  ?endpoint_descriptions:custom_routing_endpoint_descriptions ->
  unit ->
  custom_routing_endpoint_group

val make_create_custom_routing_endpoint_group_response :
  ?endpoint_group:custom_routing_endpoint_group ->
  unit ->
  create_custom_routing_endpoint_group_response

val make_custom_routing_destination_configuration :
  from_port:port_number ->
  to_port:port_number ->
  protocols:custom_routing_protocols ->
  unit ->
  custom_routing_destination_configuration

val make_create_custom_routing_endpoint_group_request :
  listener_arn:generic_string ->
  endpoint_group_region:generic_string ->
  destination_configurations:custom_routing_destination_configurations ->
  idempotency_token:idempotency_token ->
  unit ->
  create_custom_routing_endpoint_group_request

val make_port_range : ?from_port:port_number -> ?to_port:port_number -> unit -> port_range

val make_custom_routing_listener :
  ?listener_arn:generic_string -> ?port_ranges:port_ranges -> unit -> custom_routing_listener

val make_create_custom_routing_listener_response :
  ?listener:custom_routing_listener -> unit -> create_custom_routing_listener_response

val make_create_custom_routing_listener_request :
  accelerator_arn:generic_string ->
  port_ranges:port_ranges ->
  idempotency_token:idempotency_token ->
  unit ->
  create_custom_routing_listener_request

val make_port_override :
  ?listener_port:port_number -> ?endpoint_port:port_number -> unit -> port_override

val make_endpoint_group :
  ?endpoint_group_arn:generic_string ->
  ?endpoint_group_region:generic_string ->
  ?endpoint_descriptions:endpoint_descriptions ->
  ?traffic_dial_percentage:traffic_dial_percentage ->
  ?health_check_port:health_check_port ->
  ?health_check_protocol:health_check_protocol ->
  ?health_check_path:health_check_path ->
  ?health_check_interval_seconds:health_check_interval_seconds ->
  ?threshold_count:threshold_count ->
  ?port_overrides:port_overrides ->
  unit ->
  endpoint_group

val make_create_endpoint_group_response :
  ?endpoint_group:endpoint_group -> unit -> create_endpoint_group_response

val make_create_endpoint_group_request :
  ?endpoint_configurations:endpoint_configurations ->
  ?traffic_dial_percentage:traffic_dial_percentage ->
  ?health_check_port:health_check_port ->
  ?health_check_protocol:health_check_protocol ->
  ?health_check_path:health_check_path ->
  ?health_check_interval_seconds:health_check_interval_seconds ->
  ?threshold_count:threshold_count ->
  ?port_overrides:port_overrides ->
  listener_arn:generic_string ->
  endpoint_group_region:generic_string ->
  idempotency_token:idempotency_token ->
  unit ->
  create_endpoint_group_request

val make_listener :
  ?listener_arn:generic_string ->
  ?port_ranges:port_ranges ->
  ?protocol:protocol ->
  ?client_affinity:client_affinity ->
  unit ->
  listener

val make_create_listener_response : ?listener:listener -> unit -> create_listener_response

val make_create_listener_request :
  ?client_affinity:client_affinity ->
  accelerator_arn:generic_string ->
  port_ranges:port_ranges ->
  protocol:protocol ->
  idempotency_token:idempotency_token ->
  unit ->
  create_listener_request

val make_cross_account_resource :
  ?endpoint_id:generic_string ->
  ?cidr:generic_string ->
  ?attachment_arn:generic_string ->
  unit ->
  cross_account_resource

val make_custom_routing_accelerator_attributes :
  ?flow_logs_enabled:generic_boolean ->
  ?flow_logs_s3_bucket:generic_string ->
  ?flow_logs_s3_prefix:generic_string ->
  unit ->
  custom_routing_accelerator_attributes

val make_delete_accelerator_request :
  accelerator_arn:generic_string -> unit -> delete_accelerator_request

val make_delete_cross_account_attachment_request :
  attachment_arn:generic_string -> unit -> delete_cross_account_attachment_request

val make_delete_custom_routing_accelerator_request :
  accelerator_arn:generic_string -> unit -> delete_custom_routing_accelerator_request

val make_delete_custom_routing_endpoint_group_request :
  endpoint_group_arn:generic_string -> unit -> delete_custom_routing_endpoint_group_request

val make_delete_custom_routing_listener_request :
  listener_arn:generic_string -> unit -> delete_custom_routing_listener_request

val make_delete_endpoint_group_request :
  endpoint_group_arn:generic_string -> unit -> delete_endpoint_group_request

val make_delete_listener_request : listener_arn:generic_string -> unit -> delete_listener_request

val make_deny_custom_routing_traffic_request :
  ?destination_addresses:destination_addresses ->
  ?destination_ports:destination_ports ->
  ?deny_all_traffic_to_endpoint:generic_boolean ->
  endpoint_group_arn:generic_string ->
  endpoint_id:generic_string ->
  unit ->
  deny_custom_routing_traffic_request

val make_deprovision_byoip_cidr_response :
  ?byoip_cidr:byoip_cidr -> unit -> deprovision_byoip_cidr_response

val make_deprovision_byoip_cidr_request :
  cidr:generic_string -> unit -> deprovision_byoip_cidr_request

val make_describe_accelerator_response :
  ?accelerator:accelerator -> unit -> describe_accelerator_response

val make_describe_accelerator_request :
  accelerator_arn:generic_string -> unit -> describe_accelerator_request

val make_describe_accelerator_attributes_response :
  ?accelerator_attributes:accelerator_attributes -> unit -> describe_accelerator_attributes_response

val make_describe_accelerator_attributes_request :
  accelerator_arn:generic_string -> unit -> describe_accelerator_attributes_request

val make_describe_cross_account_attachment_response :
  ?cross_account_attachment:attachment -> unit -> describe_cross_account_attachment_response

val make_describe_cross_account_attachment_request :
  attachment_arn:generic_string -> unit -> describe_cross_account_attachment_request

val make_describe_custom_routing_accelerator_response :
  ?accelerator:custom_routing_accelerator -> unit -> describe_custom_routing_accelerator_response

val make_describe_custom_routing_accelerator_request :
  accelerator_arn:generic_string -> unit -> describe_custom_routing_accelerator_request

val make_describe_custom_routing_accelerator_attributes_response :
  ?accelerator_attributes:custom_routing_accelerator_attributes ->
  unit ->
  describe_custom_routing_accelerator_attributes_response

val make_describe_custom_routing_accelerator_attributes_request :
  accelerator_arn:generic_string -> unit -> describe_custom_routing_accelerator_attributes_request

val make_describe_custom_routing_endpoint_group_response :
  ?endpoint_group:custom_routing_endpoint_group ->
  unit ->
  describe_custom_routing_endpoint_group_response

val make_describe_custom_routing_endpoint_group_request :
  endpoint_group_arn:generic_string -> unit -> describe_custom_routing_endpoint_group_request

val make_describe_custom_routing_listener_response :
  ?listener:custom_routing_listener -> unit -> describe_custom_routing_listener_response

val make_describe_custom_routing_listener_request :
  listener_arn:generic_string -> unit -> describe_custom_routing_listener_request

val make_describe_endpoint_group_response :
  ?endpoint_group:endpoint_group -> unit -> describe_endpoint_group_response

val make_describe_endpoint_group_request :
  endpoint_group_arn:generic_string -> unit -> describe_endpoint_group_request

val make_describe_listener_response : ?listener:listener -> unit -> describe_listener_response

val make_describe_listener_request :
  listener_arn:generic_string -> unit -> describe_listener_request

val make_socket_address : ?ip_address:generic_string -> ?port:port_number -> unit -> socket_address

val make_destination_port_mapping :
  ?accelerator_arn:generic_string ->
  ?accelerator_socket_addresses:socket_addresses ->
  ?endpoint_group_arn:generic_string ->
  ?endpoint_id:generic_string ->
  ?endpoint_group_region:generic_string ->
  ?destination_socket_address:socket_address ->
  ?ip_address_type:ip_address_type ->
  ?destination_traffic_state:custom_routing_destination_traffic_state ->
  unit ->
  destination_port_mapping

val make_endpoint_identifier :
  ?client_ip_preservation_enabled:generic_boolean ->
  endpoint_id:generic_string ->
  unit ->
  endpoint_identifier

val make_withdraw_byoip_cidr_response :
  ?byoip_cidr:byoip_cidr -> unit -> withdraw_byoip_cidr_response

val make_withdraw_byoip_cidr_request : cidr:generic_string -> unit -> withdraw_byoip_cidr_request
val make_update_listener_response : ?listener:listener -> unit -> update_listener_response

val make_update_listener_request :
  ?port_ranges:port_ranges ->
  ?protocol:protocol ->
  ?client_affinity:client_affinity ->
  listener_arn:generic_string ->
  unit ->
  update_listener_request

val make_update_endpoint_group_response :
  ?endpoint_group:endpoint_group -> unit -> update_endpoint_group_response

val make_update_endpoint_group_request :
  ?endpoint_configurations:endpoint_configurations ->
  ?traffic_dial_percentage:traffic_dial_percentage ->
  ?health_check_port:health_check_port ->
  ?health_check_protocol:health_check_protocol ->
  ?health_check_path:health_check_path ->
  ?health_check_interval_seconds:health_check_interval_seconds ->
  ?threshold_count:threshold_count ->
  ?port_overrides:port_overrides ->
  endpoint_group_arn:generic_string ->
  unit ->
  update_endpoint_group_request

val make_update_custom_routing_listener_response :
  ?listener:custom_routing_listener -> unit -> update_custom_routing_listener_response

val make_update_custom_routing_listener_request :
  listener_arn:generic_string ->
  port_ranges:port_ranges ->
  unit ->
  update_custom_routing_listener_request

val make_update_custom_routing_accelerator_attributes_response :
  ?accelerator_attributes:custom_routing_accelerator_attributes ->
  unit ->
  update_custom_routing_accelerator_attributes_response

val make_update_custom_routing_accelerator_attributes_request :
  ?flow_logs_enabled:generic_boolean ->
  ?flow_logs_s3_bucket:generic_string ->
  ?flow_logs_s3_prefix:generic_string ->
  accelerator_arn:generic_string ->
  unit ->
  update_custom_routing_accelerator_attributes_request

val make_update_custom_routing_accelerator_response :
  ?accelerator:custom_routing_accelerator -> unit -> update_custom_routing_accelerator_response

val make_update_custom_routing_accelerator_request :
  ?name:generic_string ->
  ?ip_address_type:ip_address_type ->
  ?ip_addresses:ip_addresses ->
  ?enabled:generic_boolean ->
  accelerator_arn:generic_string ->
  unit ->
  update_custom_routing_accelerator_request

val make_update_cross_account_attachment_response :
  ?cross_account_attachment:attachment -> unit -> update_cross_account_attachment_response

val make_update_cross_account_attachment_request :
  ?name:attachment_name ->
  ?add_principals:principals ->
  ?remove_principals:principals ->
  ?add_resources:resources ->
  ?remove_resources:resources ->
  attachment_arn:generic_string ->
  unit ->
  update_cross_account_attachment_request

val make_update_accelerator_attributes_response :
  ?accelerator_attributes:accelerator_attributes -> unit -> update_accelerator_attributes_response

val make_update_accelerator_attributes_request :
  ?flow_logs_enabled:generic_boolean ->
  ?flow_logs_s3_bucket:generic_string ->
  ?flow_logs_s3_prefix:generic_string ->
  accelerator_arn:generic_string ->
  unit ->
  update_accelerator_attributes_request

val make_update_accelerator_response :
  ?accelerator:accelerator -> unit -> update_accelerator_response

val make_update_accelerator_request :
  ?name:generic_string ->
  ?ip_address_type:ip_address_type ->
  ?ip_addresses:ip_addresses ->
  ?enabled:generic_boolean ->
  accelerator_arn:generic_string ->
  unit ->
  update_accelerator_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:resource_arn -> tag_keys:tag_keys -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:resource_arn -> tags:tags -> unit -> tag_resource_request

val make_remove_endpoints_request :
  endpoint_identifiers:endpoint_identifiers ->
  endpoint_group_arn:generic_string ->
  unit ->
  remove_endpoints_request

val make_remove_custom_routing_endpoints_request :
  endpoint_ids:endpoint_ids ->
  endpoint_group_arn:generic_string ->
  unit ->
  remove_custom_routing_endpoints_request

val make_provision_byoip_cidr_response :
  ?byoip_cidr:byoip_cidr -> unit -> provision_byoip_cidr_response

val make_provision_byoip_cidr_request :
  cidr:generic_string ->
  cidr_authorization_context:cidr_authorization_context ->
  unit ->
  provision_byoip_cidr_request

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_request

val make_list_listeners_response :
  ?listeners:listeners -> ?next_token:generic_string -> unit -> list_listeners_response

val make_list_listeners_request :
  ?max_results:max_results ->
  ?next_token:generic_string ->
  accelerator_arn:generic_string ->
  unit ->
  list_listeners_request

val make_list_endpoint_groups_response :
  ?endpoint_groups:endpoint_groups ->
  ?next_token:generic_string ->
  unit ->
  list_endpoint_groups_response

val make_list_endpoint_groups_request :
  ?max_results:max_results ->
  ?next_token:generic_string ->
  listener_arn:generic_string ->
  unit ->
  list_endpoint_groups_request

val make_list_custom_routing_port_mappings_by_destination_response :
  ?destination_port_mappings:destination_port_mappings ->
  ?next_token:generic_string ->
  unit ->
  list_custom_routing_port_mappings_by_destination_response

val make_list_custom_routing_port_mappings_by_destination_request :
  ?max_results:port_mappings_max_results ->
  ?next_token:generic_string ->
  endpoint_id:generic_string ->
  destination_address:generic_string ->
  unit ->
  list_custom_routing_port_mappings_by_destination_request

val make_port_mapping :
  ?accelerator_port:port_number ->
  ?endpoint_group_arn:generic_string ->
  ?endpoint_id:generic_string ->
  ?destination_socket_address:socket_address ->
  ?protocols:custom_routing_protocols ->
  ?destination_traffic_state:custom_routing_destination_traffic_state ->
  unit ->
  port_mapping

val make_list_custom_routing_port_mappings_response :
  ?port_mappings:port_mappings ->
  ?next_token:generic_string ->
  unit ->
  list_custom_routing_port_mappings_response

val make_list_custom_routing_port_mappings_request :
  ?endpoint_group_arn:generic_string ->
  ?max_results:port_mappings_max_results ->
  ?next_token:generic_string ->
  accelerator_arn:generic_string ->
  unit ->
  list_custom_routing_port_mappings_request

val make_list_custom_routing_listeners_response :
  ?listeners:custom_routing_listeners ->
  ?next_token:generic_string ->
  unit ->
  list_custom_routing_listeners_response

val make_list_custom_routing_listeners_request :
  ?max_results:max_results ->
  ?next_token:generic_string ->
  accelerator_arn:generic_string ->
  unit ->
  list_custom_routing_listeners_request

val make_list_custom_routing_endpoint_groups_response :
  ?endpoint_groups:custom_routing_endpoint_groups ->
  ?next_token:generic_string ->
  unit ->
  list_custom_routing_endpoint_groups_response

val make_list_custom_routing_endpoint_groups_request :
  ?max_results:max_results ->
  ?next_token:generic_string ->
  listener_arn:generic_string ->
  unit ->
  list_custom_routing_endpoint_groups_request

val make_list_custom_routing_accelerators_response :
  ?accelerators:custom_routing_accelerators ->
  ?next_token:generic_string ->
  unit ->
  list_custom_routing_accelerators_response

val make_list_custom_routing_accelerators_request :
  ?max_results:max_results ->
  ?next_token:generic_string ->
  unit ->
  list_custom_routing_accelerators_request

val make_list_cross_account_resources_response :
  ?cross_account_resources:cross_account_resources ->
  ?next_token:generic_string ->
  unit ->
  list_cross_account_resources_response

val make_list_cross_account_resources_request :
  ?accelerator_arn:generic_string ->
  ?max_results:max_results ->
  ?next_token:generic_string ->
  resource_owner_aws_account_id:aws_account_id ->
  unit ->
  list_cross_account_resources_request

val make_list_cross_account_resource_accounts_response :
  ?resource_owner_aws_account_ids:aws_account_ids ->
  unit ->
  list_cross_account_resource_accounts_response

val make_list_cross_account_resource_accounts_request : unit -> unit

val make_list_cross_account_attachments_response :
  ?cross_account_attachments:attachments ->
  ?next_token:generic_string ->
  unit ->
  list_cross_account_attachments_response

val make_list_cross_account_attachments_request :
  ?max_results:max_results ->
  ?next_token:generic_string ->
  unit ->
  list_cross_account_attachments_request

val make_list_byoip_cidrs_response :
  ?byoip_cidrs:byoip_cidrs -> ?next_token:generic_string -> unit -> list_byoip_cidrs_response

val make_list_byoip_cidrs_request :
  ?max_results:max_results -> ?next_token:generic_string -> unit -> list_byoip_cidrs_request

val make_list_accelerators_response :
  ?accelerators:accelerators -> ?next_token:generic_string -> unit -> list_accelerators_response

val make_list_accelerators_request :
  ?max_results:max_results -> ?next_token:generic_string -> unit -> list_accelerators_request
