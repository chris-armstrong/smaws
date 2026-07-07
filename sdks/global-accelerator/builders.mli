open Types

val make_byoip_cidr_event :
  ?timestamp:timestamp -> ?message:generic_string -> unit -> byoip_cidr_event

val make_byoip_cidr :
  ?events:byoip_cidr_events -> ?state:byoip_cidr_state -> ?cidr:generic_string -> unit -> byoip_cidr

val make_withdraw_byoip_cidr_response :
  ?byoip_cidr:byoip_cidr -> unit -> withdraw_byoip_cidr_response

val make_withdraw_byoip_cidr_request : cidr:generic_string -> unit -> withdraw_byoip_cidr_request
val make_port_range : ?to_port:port_number -> ?from_port:port_number -> unit -> port_range

val make_listener :
  ?client_affinity:client_affinity ->
  ?protocol:protocol ->
  ?port_ranges:port_ranges ->
  ?listener_arn:generic_string ->
  unit ->
  listener

val make_update_listener_response : ?listener:listener -> unit -> update_listener_response

val make_update_listener_request :
  ?client_affinity:client_affinity ->
  ?protocol:protocol ->
  ?port_ranges:port_ranges ->
  listener_arn:generic_string ->
  unit ->
  update_listener_request

val make_endpoint_description :
  ?client_ip_preservation_enabled:generic_boolean ->
  ?health_reason:generic_string ->
  ?health_state:health_state ->
  ?weight:endpoint_weight ->
  ?endpoint_id:generic_string ->
  unit ->
  endpoint_description

val make_port_override :
  ?endpoint_port:port_number -> ?listener_port:port_number -> unit -> port_override

val make_endpoint_group :
  ?port_overrides:port_overrides ->
  ?threshold_count:threshold_count ->
  ?health_check_interval_seconds:health_check_interval_seconds ->
  ?health_check_path:health_check_path ->
  ?health_check_protocol:health_check_protocol ->
  ?health_check_port:health_check_port ->
  ?traffic_dial_percentage:traffic_dial_percentage ->
  ?endpoint_descriptions:endpoint_descriptions ->
  ?endpoint_group_region:generic_string ->
  ?endpoint_group_arn:generic_string ->
  unit ->
  endpoint_group

val make_update_endpoint_group_response :
  ?endpoint_group:endpoint_group -> unit -> update_endpoint_group_response

val make_endpoint_configuration :
  ?attachment_arn:generic_string ->
  ?client_ip_preservation_enabled:generic_boolean ->
  ?weight:endpoint_weight ->
  ?endpoint_id:generic_string ->
  unit ->
  endpoint_configuration

val make_update_endpoint_group_request :
  ?port_overrides:port_overrides ->
  ?threshold_count:threshold_count ->
  ?health_check_interval_seconds:health_check_interval_seconds ->
  ?health_check_path:health_check_path ->
  ?health_check_protocol:health_check_protocol ->
  ?health_check_port:health_check_port ->
  ?traffic_dial_percentage:traffic_dial_percentage ->
  ?endpoint_configurations:endpoint_configurations ->
  endpoint_group_arn:generic_string ->
  unit ->
  update_endpoint_group_request

val make_custom_routing_listener :
  ?port_ranges:port_ranges -> ?listener_arn:generic_string -> unit -> custom_routing_listener

val make_update_custom_routing_listener_response :
  ?listener:custom_routing_listener -> unit -> update_custom_routing_listener_response

val make_update_custom_routing_listener_request :
  port_ranges:port_ranges ->
  listener_arn:generic_string ->
  unit ->
  update_custom_routing_listener_request

val make_ip_set :
  ?ip_address_family:ip_address_family ->
  ?ip_addresses:ip_addresses ->
  ?ip_family:generic_string ->
  unit ->
  ip_set

val make_custom_routing_accelerator :
  ?last_modified_time:timestamp ->
  ?created_time:timestamp ->
  ?status:custom_routing_accelerator_status ->
  ?dns_name:generic_string ->
  ?ip_sets:ip_sets ->
  ?enabled:generic_boolean ->
  ?ip_address_type:ip_address_type ->
  ?name:generic_string ->
  ?accelerator_arn:generic_string ->
  unit ->
  custom_routing_accelerator

val make_update_custom_routing_accelerator_response :
  ?accelerator:custom_routing_accelerator -> unit -> update_custom_routing_accelerator_response

val make_update_custom_routing_accelerator_request :
  ?enabled:generic_boolean ->
  ?ip_addresses:ip_addresses ->
  ?ip_address_type:ip_address_type ->
  ?name:generic_string ->
  accelerator_arn:generic_string ->
  unit ->
  update_custom_routing_accelerator_request

val make_custom_routing_accelerator_attributes :
  ?flow_logs_s3_prefix:generic_string ->
  ?flow_logs_s3_bucket:generic_string ->
  ?flow_logs_enabled:generic_boolean ->
  unit ->
  custom_routing_accelerator_attributes

val make_update_custom_routing_accelerator_attributes_response :
  ?accelerator_attributes:custom_routing_accelerator_attributes ->
  unit ->
  update_custom_routing_accelerator_attributes_response

val make_update_custom_routing_accelerator_attributes_request :
  ?flow_logs_s3_prefix:generic_string ->
  ?flow_logs_s3_bucket:generic_string ->
  ?flow_logs_enabled:generic_boolean ->
  accelerator_arn:generic_string ->
  unit ->
  update_custom_routing_accelerator_attributes_request

val make_resource :
  ?region:generic_string -> ?cidr:generic_string -> ?endpoint_id:generic_string -> unit -> resource

val make_attachment :
  ?created_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?resources:resources ->
  ?principals:principals ->
  ?name:attachment_name ->
  ?attachment_arn:generic_string ->
  unit ->
  attachment

val make_update_cross_account_attachment_response :
  ?cross_account_attachment:attachment -> unit -> update_cross_account_attachment_response

val make_update_cross_account_attachment_request :
  ?remove_resources:resources ->
  ?add_resources:resources ->
  ?remove_principals:principals ->
  ?add_principals:principals ->
  ?name:attachment_name ->
  attachment_arn:generic_string ->
  unit ->
  update_cross_account_attachment_request

val make_accelerator_event :
  ?timestamp:timestamp -> ?message:generic_string -> unit -> accelerator_event

val make_accelerator :
  ?events:accelerator_events ->
  ?dual_stack_dns_name:generic_string ->
  ?last_modified_time:timestamp ->
  ?created_time:timestamp ->
  ?status:accelerator_status ->
  ?dns_name:generic_string ->
  ?ip_sets:ip_sets ->
  ?enabled:generic_boolean ->
  ?ip_address_type:ip_address_type ->
  ?name:generic_string ->
  ?accelerator_arn:generic_string ->
  unit ->
  accelerator

val make_update_accelerator_response :
  ?accelerator:accelerator -> unit -> update_accelerator_response

val make_update_accelerator_request :
  ?enabled:generic_boolean ->
  ?ip_addresses:ip_addresses ->
  ?ip_address_type:ip_address_type ->
  ?name:generic_string ->
  accelerator_arn:generic_string ->
  unit ->
  update_accelerator_request

val make_accelerator_attributes :
  ?flow_logs_s3_prefix:generic_string ->
  ?flow_logs_s3_bucket:generic_string ->
  ?flow_logs_enabled:generic_boolean ->
  unit ->
  accelerator_attributes

val make_update_accelerator_attributes_response :
  ?accelerator_attributes:accelerator_attributes -> unit -> update_accelerator_attributes_response

val make_update_accelerator_attributes_request :
  ?flow_logs_s3_prefix:generic_string ->
  ?flow_logs_s3_bucket:generic_string ->
  ?flow_logs_enabled:generic_boolean ->
  accelerator_arn:generic_string ->
  unit ->
  update_accelerator_attributes_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_keys -> resource_arn:resource_arn -> unit -> untag_resource_request

val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:tags -> resource_arn:resource_arn -> unit -> tag_resource_request

val make_socket_address : ?port:port_number -> ?ip_address:generic_string -> unit -> socket_address

val make_endpoint_identifier :
  ?client_ip_preservation_enabled:generic_boolean ->
  endpoint_id:generic_string ->
  unit ->
  endpoint_identifier

val make_remove_endpoints_request :
  endpoint_group_arn:generic_string ->
  endpoint_identifiers:endpoint_identifiers ->
  unit ->
  remove_endpoints_request

val make_remove_custom_routing_endpoints_request :
  endpoint_group_arn:generic_string ->
  endpoint_ids:endpoint_ids ->
  unit ->
  remove_custom_routing_endpoints_request

val make_provision_byoip_cidr_response :
  ?byoip_cidr:byoip_cidr -> unit -> provision_byoip_cidr_response

val make_cidr_authorization_context :
  signature:generic_string -> message:generic_string -> unit -> cidr_authorization_context

val make_provision_byoip_cidr_request :
  cidr_authorization_context:cidr_authorization_context ->
  cidr:generic_string ->
  unit ->
  provision_byoip_cidr_request

val make_port_mapping :
  ?destination_traffic_state:custom_routing_destination_traffic_state ->
  ?protocols:custom_routing_protocols ->
  ?destination_socket_address:socket_address ->
  ?endpoint_id:generic_string ->
  ?endpoint_group_arn:generic_string ->
  ?accelerator_port:port_number ->
  unit ->
  port_mapping

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_request

val make_list_listeners_response :
  ?next_token:generic_string -> ?listeners:listeners -> unit -> list_listeners_response

val make_list_listeners_request :
  ?next_token:generic_string ->
  ?max_results:max_results ->
  accelerator_arn:generic_string ->
  unit ->
  list_listeners_request

val make_list_endpoint_groups_response :
  ?next_token:generic_string ->
  ?endpoint_groups:endpoint_groups ->
  unit ->
  list_endpoint_groups_response

val make_list_endpoint_groups_request :
  ?next_token:generic_string ->
  ?max_results:max_results ->
  listener_arn:generic_string ->
  unit ->
  list_endpoint_groups_request

val make_list_custom_routing_port_mappings_response :
  ?next_token:generic_string ->
  ?port_mappings:port_mappings ->
  unit ->
  list_custom_routing_port_mappings_response

val make_list_custom_routing_port_mappings_request :
  ?next_token:generic_string ->
  ?max_results:port_mappings_max_results ->
  ?endpoint_group_arn:generic_string ->
  accelerator_arn:generic_string ->
  unit ->
  list_custom_routing_port_mappings_request

val make_destination_port_mapping :
  ?destination_traffic_state:custom_routing_destination_traffic_state ->
  ?ip_address_type:ip_address_type ->
  ?destination_socket_address:socket_address ->
  ?endpoint_group_region:generic_string ->
  ?endpoint_id:generic_string ->
  ?endpoint_group_arn:generic_string ->
  ?accelerator_socket_addresses:socket_addresses ->
  ?accelerator_arn:generic_string ->
  unit ->
  destination_port_mapping

val make_list_custom_routing_port_mappings_by_destination_response :
  ?next_token:generic_string ->
  ?destination_port_mappings:destination_port_mappings ->
  unit ->
  list_custom_routing_port_mappings_by_destination_response

val make_list_custom_routing_port_mappings_by_destination_request :
  ?next_token:generic_string ->
  ?max_results:port_mappings_max_results ->
  destination_address:generic_string ->
  endpoint_id:generic_string ->
  unit ->
  list_custom_routing_port_mappings_by_destination_request

val make_list_custom_routing_listeners_response :
  ?next_token:generic_string ->
  ?listeners:custom_routing_listeners ->
  unit ->
  list_custom_routing_listeners_response

val make_list_custom_routing_listeners_request :
  ?next_token:generic_string ->
  ?max_results:max_results ->
  accelerator_arn:generic_string ->
  unit ->
  list_custom_routing_listeners_request

val make_custom_routing_destination_description :
  ?protocols:protocols ->
  ?to_port:port_number ->
  ?from_port:port_number ->
  unit ->
  custom_routing_destination_description

val make_custom_routing_endpoint_description :
  ?endpoint_id:generic_string -> unit -> custom_routing_endpoint_description

val make_custom_routing_endpoint_group :
  ?endpoint_descriptions:custom_routing_endpoint_descriptions ->
  ?destination_descriptions:custom_routing_destination_descriptions ->
  ?endpoint_group_region:generic_string ->
  ?endpoint_group_arn:generic_string ->
  unit ->
  custom_routing_endpoint_group

val make_list_custom_routing_endpoint_groups_response :
  ?next_token:generic_string ->
  ?endpoint_groups:custom_routing_endpoint_groups ->
  unit ->
  list_custom_routing_endpoint_groups_response

val make_list_custom_routing_endpoint_groups_request :
  ?next_token:generic_string ->
  ?max_results:max_results ->
  listener_arn:generic_string ->
  unit ->
  list_custom_routing_endpoint_groups_request

val make_list_custom_routing_accelerators_response :
  ?next_token:generic_string ->
  ?accelerators:custom_routing_accelerators ->
  unit ->
  list_custom_routing_accelerators_response

val make_list_custom_routing_accelerators_request :
  ?next_token:generic_string ->
  ?max_results:max_results ->
  unit ->
  list_custom_routing_accelerators_request

val make_cross_account_resource :
  ?attachment_arn:generic_string ->
  ?cidr:generic_string ->
  ?endpoint_id:generic_string ->
  unit ->
  cross_account_resource

val make_list_cross_account_resources_response :
  ?next_token:generic_string ->
  ?cross_account_resources:cross_account_resources ->
  unit ->
  list_cross_account_resources_response

val make_list_cross_account_resources_request :
  ?next_token:generic_string ->
  ?max_results:max_results ->
  ?accelerator_arn:generic_string ->
  resource_owner_aws_account_id:aws_account_id ->
  unit ->
  list_cross_account_resources_request

val make_list_cross_account_resource_accounts_response :
  ?resource_owner_aws_account_ids:aws_account_ids ->
  unit ->
  list_cross_account_resource_accounts_response

val make_list_cross_account_resource_accounts_request : unit -> unit

val make_list_cross_account_attachments_response :
  ?next_token:generic_string ->
  ?cross_account_attachments:attachments ->
  unit ->
  list_cross_account_attachments_response

val make_list_cross_account_attachments_request :
  ?next_token:generic_string ->
  ?max_results:max_results ->
  unit ->
  list_cross_account_attachments_request

val make_list_byoip_cidrs_response :
  ?next_token:generic_string -> ?byoip_cidrs:byoip_cidrs -> unit -> list_byoip_cidrs_response

val make_list_byoip_cidrs_request :
  ?next_token:generic_string -> ?max_results:max_results -> unit -> list_byoip_cidrs_request

val make_list_accelerators_response :
  ?next_token:generic_string -> ?accelerators:accelerators -> unit -> list_accelerators_response

val make_list_accelerators_request :
  ?next_token:generic_string -> ?max_results:max_results -> unit -> list_accelerators_request

val make_describe_listener_response : ?listener:listener -> unit -> describe_listener_response

val make_describe_listener_request :
  listener_arn:generic_string -> unit -> describe_listener_request

val make_describe_endpoint_group_response :
  ?endpoint_group:endpoint_group -> unit -> describe_endpoint_group_response

val make_describe_endpoint_group_request :
  endpoint_group_arn:generic_string -> unit -> describe_endpoint_group_request

val make_describe_custom_routing_listener_response :
  ?listener:custom_routing_listener -> unit -> describe_custom_routing_listener_response

val make_describe_custom_routing_listener_request :
  listener_arn:generic_string -> unit -> describe_custom_routing_listener_request

val make_describe_custom_routing_endpoint_group_response :
  ?endpoint_group:custom_routing_endpoint_group ->
  unit ->
  describe_custom_routing_endpoint_group_response

val make_describe_custom_routing_endpoint_group_request :
  endpoint_group_arn:generic_string -> unit -> describe_custom_routing_endpoint_group_request

val make_describe_custom_routing_accelerator_attributes_response :
  ?accelerator_attributes:custom_routing_accelerator_attributes ->
  unit ->
  describe_custom_routing_accelerator_attributes_response

val make_describe_custom_routing_accelerator_attributes_request :
  accelerator_arn:generic_string -> unit -> describe_custom_routing_accelerator_attributes_request

val make_describe_custom_routing_accelerator_response :
  ?accelerator:custom_routing_accelerator -> unit -> describe_custom_routing_accelerator_response

val make_describe_custom_routing_accelerator_request :
  accelerator_arn:generic_string -> unit -> describe_custom_routing_accelerator_request

val make_describe_cross_account_attachment_response :
  ?cross_account_attachment:attachment -> unit -> describe_cross_account_attachment_response

val make_describe_cross_account_attachment_request :
  attachment_arn:generic_string -> unit -> describe_cross_account_attachment_request

val make_describe_accelerator_attributes_response :
  ?accelerator_attributes:accelerator_attributes -> unit -> describe_accelerator_attributes_response

val make_describe_accelerator_attributes_request :
  accelerator_arn:generic_string -> unit -> describe_accelerator_attributes_request

val make_describe_accelerator_response :
  ?accelerator:accelerator -> unit -> describe_accelerator_response

val make_describe_accelerator_request :
  accelerator_arn:generic_string -> unit -> describe_accelerator_request

val make_deprovision_byoip_cidr_response :
  ?byoip_cidr:byoip_cidr -> unit -> deprovision_byoip_cidr_response

val make_deprovision_byoip_cidr_request :
  cidr:generic_string -> unit -> deprovision_byoip_cidr_request

val make_deny_custom_routing_traffic_request :
  ?deny_all_traffic_to_endpoint:generic_boolean ->
  ?destination_ports:destination_ports ->
  ?destination_addresses:destination_addresses ->
  endpoint_id:generic_string ->
  endpoint_group_arn:generic_string ->
  unit ->
  deny_custom_routing_traffic_request

val make_delete_listener_request : listener_arn:generic_string -> unit -> delete_listener_request

val make_delete_endpoint_group_request :
  endpoint_group_arn:generic_string -> unit -> delete_endpoint_group_request

val make_delete_custom_routing_listener_request :
  listener_arn:generic_string -> unit -> delete_custom_routing_listener_request

val make_delete_custom_routing_endpoint_group_request :
  endpoint_group_arn:generic_string -> unit -> delete_custom_routing_endpoint_group_request

val make_delete_custom_routing_accelerator_request :
  accelerator_arn:generic_string -> unit -> delete_custom_routing_accelerator_request

val make_delete_cross_account_attachment_request :
  attachment_arn:generic_string -> unit -> delete_cross_account_attachment_request

val make_delete_accelerator_request :
  accelerator_arn:generic_string -> unit -> delete_accelerator_request

val make_create_listener_response : ?listener:listener -> unit -> create_listener_response

val make_create_listener_request :
  ?client_affinity:client_affinity ->
  idempotency_token:idempotency_token ->
  protocol:protocol ->
  port_ranges:port_ranges ->
  accelerator_arn:generic_string ->
  unit ->
  create_listener_request

val make_create_endpoint_group_response :
  ?endpoint_group:endpoint_group -> unit -> create_endpoint_group_response

val make_create_endpoint_group_request :
  ?port_overrides:port_overrides ->
  ?threshold_count:threshold_count ->
  ?health_check_interval_seconds:health_check_interval_seconds ->
  ?health_check_path:health_check_path ->
  ?health_check_protocol:health_check_protocol ->
  ?health_check_port:health_check_port ->
  ?traffic_dial_percentage:traffic_dial_percentage ->
  ?endpoint_configurations:endpoint_configurations ->
  idempotency_token:idempotency_token ->
  endpoint_group_region:generic_string ->
  listener_arn:generic_string ->
  unit ->
  create_endpoint_group_request

val make_create_custom_routing_listener_response :
  ?listener:custom_routing_listener -> unit -> create_custom_routing_listener_response

val make_create_custom_routing_listener_request :
  idempotency_token:idempotency_token ->
  port_ranges:port_ranges ->
  accelerator_arn:generic_string ->
  unit ->
  create_custom_routing_listener_request

val make_create_custom_routing_endpoint_group_response :
  ?endpoint_group:custom_routing_endpoint_group ->
  unit ->
  create_custom_routing_endpoint_group_response

val make_custom_routing_destination_configuration :
  protocols:custom_routing_protocols ->
  to_port:port_number ->
  from_port:port_number ->
  unit ->
  custom_routing_destination_configuration

val make_create_custom_routing_endpoint_group_request :
  idempotency_token:idempotency_token ->
  destination_configurations:custom_routing_destination_configurations ->
  endpoint_group_region:generic_string ->
  listener_arn:generic_string ->
  unit ->
  create_custom_routing_endpoint_group_request

val make_create_custom_routing_accelerator_response :
  ?accelerator:custom_routing_accelerator -> unit -> create_custom_routing_accelerator_response

val make_create_custom_routing_accelerator_request :
  ?tags:tags ->
  ?enabled:generic_boolean ->
  ?ip_addresses:ip_addresses ->
  ?ip_address_type:ip_address_type ->
  idempotency_token:idempotency_token ->
  name:generic_string ->
  unit ->
  create_custom_routing_accelerator_request

val make_create_cross_account_attachment_response :
  ?cross_account_attachment:attachment -> unit -> create_cross_account_attachment_response

val make_create_cross_account_attachment_request :
  ?tags:tags ->
  ?resources:resources ->
  ?principals:principals ->
  idempotency_token:idempotency_token ->
  name:attachment_name ->
  unit ->
  create_cross_account_attachment_request

val make_create_accelerator_response :
  ?accelerator:accelerator -> unit -> create_accelerator_response

val make_create_accelerator_request :
  ?tags:tags ->
  ?enabled:generic_boolean ->
  ?ip_addresses:ip_addresses ->
  ?ip_address_type:ip_address_type ->
  idempotency_token:idempotency_token ->
  name:generic_string ->
  unit ->
  create_accelerator_request

val make_allow_custom_routing_traffic_request :
  ?allow_all_traffic_to_endpoint:generic_boolean ->
  ?destination_ports:destination_ports ->
  ?destination_addresses:destination_addresses ->
  endpoint_id:generic_string ->
  endpoint_group_arn:generic_string ->
  unit ->
  allow_custom_routing_traffic_request

val make_advertise_byoip_cidr_response :
  ?byoip_cidr:byoip_cidr -> unit -> advertise_byoip_cidr_response

val make_advertise_byoip_cidr_request : cidr:generic_string -> unit -> advertise_byoip_cidr_request

val make_add_endpoints_response :
  ?endpoint_group_arn:generic_string ->
  ?endpoint_descriptions:endpoint_descriptions ->
  unit ->
  add_endpoints_response

val make_add_endpoints_request :
  endpoint_group_arn:generic_string ->
  endpoint_configurations:endpoint_configurations ->
  unit ->
  add_endpoints_request

val make_add_custom_routing_endpoints_response :
  ?endpoint_group_arn:generic_string ->
  ?endpoint_descriptions:custom_routing_endpoint_descriptions ->
  unit ->
  add_custom_routing_endpoints_response

val make_custom_routing_endpoint_configuration :
  ?attachment_arn:generic_string ->
  ?endpoint_id:generic_string ->
  unit ->
  custom_routing_endpoint_configuration

val make_add_custom_routing_endpoints_request :
  endpoint_group_arn:generic_string ->
  endpoint_configurations:custom_routing_endpoint_configurations ->
  unit ->
  add_custom_routing_endpoints_request
