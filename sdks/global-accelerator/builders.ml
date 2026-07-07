open Types

let make_byoip_cidr_event ?timestamp:(timestamp_ : timestamp option)
    ?message:(message_ : generic_string option) () =
  ({ timestamp = timestamp_; message = message_ } : byoip_cidr_event)

let make_byoip_cidr ?events:(events_ : byoip_cidr_events option)
    ?state:(state_ : byoip_cidr_state option) ?cidr:(cidr_ : generic_string option) () =
  ({ events = events_; state = state_; cidr = cidr_ } : byoip_cidr)

let make_withdraw_byoip_cidr_response ?byoip_cidr:(byoip_cidr_ : byoip_cidr option) () =
  ({ byoip_cidr = byoip_cidr_ } : withdraw_byoip_cidr_response)

let make_withdraw_byoip_cidr_request ~cidr:(cidr_ : generic_string) () =
  ({ cidr = cidr_ } : withdraw_byoip_cidr_request)

let make_port_range ?to_port:(to_port_ : port_number option)
    ?from_port:(from_port_ : port_number option) () =
  ({ to_port = to_port_; from_port = from_port_ } : port_range)

let make_listener ?client_affinity:(client_affinity_ : client_affinity option)
    ?protocol:(protocol_ : protocol option) ?port_ranges:(port_ranges_ : port_ranges option)
    ?listener_arn:(listener_arn_ : generic_string option) () =
  ({
     client_affinity = client_affinity_;
     protocol = protocol_;
     port_ranges = port_ranges_;
     listener_arn = listener_arn_;
   }
    : listener)

let make_update_listener_response ?listener:(listener_ : listener option) () =
  ({ listener = listener_ } : update_listener_response)

let make_update_listener_request ?client_affinity:(client_affinity_ : client_affinity option)
    ?protocol:(protocol_ : protocol option) ?port_ranges:(port_ranges_ : port_ranges option)
    ~listener_arn:(listener_arn_ : generic_string) () =
  ({
     client_affinity = client_affinity_;
     protocol = protocol_;
     port_ranges = port_ranges_;
     listener_arn = listener_arn_;
   }
    : update_listener_request)

let make_endpoint_description
    ?client_ip_preservation_enabled:(client_ip_preservation_enabled_ : generic_boolean option)
    ?health_reason:(health_reason_ : generic_string option)
    ?health_state:(health_state_ : health_state option) ?weight:(weight_ : endpoint_weight option)
    ?endpoint_id:(endpoint_id_ : generic_string option) () =
  ({
     client_ip_preservation_enabled = client_ip_preservation_enabled_;
     health_reason = health_reason_;
     health_state = health_state_;
     weight = weight_;
     endpoint_id = endpoint_id_;
   }
    : endpoint_description)

let make_port_override ?endpoint_port:(endpoint_port_ : port_number option)
    ?listener_port:(listener_port_ : port_number option) () =
  ({ endpoint_port = endpoint_port_; listener_port = listener_port_ } : port_override)

let make_endpoint_group ?port_overrides:(port_overrides_ : port_overrides option)
    ?threshold_count:(threshold_count_ : threshold_count option)
    ?health_check_interval_seconds:
      (health_check_interval_seconds_ : health_check_interval_seconds option)
    ?health_check_path:(health_check_path_ : health_check_path option)
    ?health_check_protocol:(health_check_protocol_ : health_check_protocol option)
    ?health_check_port:(health_check_port_ : health_check_port option)
    ?traffic_dial_percentage:(traffic_dial_percentage_ : traffic_dial_percentage option)
    ?endpoint_descriptions:(endpoint_descriptions_ : endpoint_descriptions option)
    ?endpoint_group_region:(endpoint_group_region_ : generic_string option)
    ?endpoint_group_arn:(endpoint_group_arn_ : generic_string option) () =
  ({
     port_overrides = port_overrides_;
     threshold_count = threshold_count_;
     health_check_interval_seconds = health_check_interval_seconds_;
     health_check_path = health_check_path_;
     health_check_protocol = health_check_protocol_;
     health_check_port = health_check_port_;
     traffic_dial_percentage = traffic_dial_percentage_;
     endpoint_descriptions = endpoint_descriptions_;
     endpoint_group_region = endpoint_group_region_;
     endpoint_group_arn = endpoint_group_arn_;
   }
    : endpoint_group)

let make_update_endpoint_group_response ?endpoint_group:(endpoint_group_ : endpoint_group option) ()
    =
  ({ endpoint_group = endpoint_group_ } : update_endpoint_group_response)

let make_endpoint_configuration ?attachment_arn:(attachment_arn_ : generic_string option)
    ?client_ip_preservation_enabled:(client_ip_preservation_enabled_ : generic_boolean option)
    ?weight:(weight_ : endpoint_weight option) ?endpoint_id:(endpoint_id_ : generic_string option)
    () =
  ({
     attachment_arn = attachment_arn_;
     client_ip_preservation_enabled = client_ip_preservation_enabled_;
     weight = weight_;
     endpoint_id = endpoint_id_;
   }
    : endpoint_configuration)

let make_update_endpoint_group_request ?port_overrides:(port_overrides_ : port_overrides option)
    ?threshold_count:(threshold_count_ : threshold_count option)
    ?health_check_interval_seconds:
      (health_check_interval_seconds_ : health_check_interval_seconds option)
    ?health_check_path:(health_check_path_ : health_check_path option)
    ?health_check_protocol:(health_check_protocol_ : health_check_protocol option)
    ?health_check_port:(health_check_port_ : health_check_port option)
    ?traffic_dial_percentage:(traffic_dial_percentage_ : traffic_dial_percentage option)
    ?endpoint_configurations:(endpoint_configurations_ : endpoint_configurations option)
    ~endpoint_group_arn:(endpoint_group_arn_ : generic_string) () =
  ({
     port_overrides = port_overrides_;
     threshold_count = threshold_count_;
     health_check_interval_seconds = health_check_interval_seconds_;
     health_check_path = health_check_path_;
     health_check_protocol = health_check_protocol_;
     health_check_port = health_check_port_;
     traffic_dial_percentage = traffic_dial_percentage_;
     endpoint_configurations = endpoint_configurations_;
     endpoint_group_arn = endpoint_group_arn_;
   }
    : update_endpoint_group_request)

let make_custom_routing_listener ?port_ranges:(port_ranges_ : port_ranges option)
    ?listener_arn:(listener_arn_ : generic_string option) () =
  ({ port_ranges = port_ranges_; listener_arn = listener_arn_ } : custom_routing_listener)

let make_update_custom_routing_listener_response
    ?listener:(listener_ : custom_routing_listener option) () =
  ({ listener = listener_ } : update_custom_routing_listener_response)

let make_update_custom_routing_listener_request ~port_ranges:(port_ranges_ : port_ranges)
    ~listener_arn:(listener_arn_ : generic_string) () =
  ({ port_ranges = port_ranges_; listener_arn = listener_arn_ }
    : update_custom_routing_listener_request)

let make_ip_set ?ip_address_family:(ip_address_family_ : ip_address_family option)
    ?ip_addresses:(ip_addresses_ : ip_addresses option)
    ?ip_family:(ip_family_ : generic_string option) () =
  ({ ip_address_family = ip_address_family_; ip_addresses = ip_addresses_; ip_family = ip_family_ }
    : ip_set)

let make_custom_routing_accelerator ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_time:(created_time_ : timestamp option)
    ?status:(status_ : custom_routing_accelerator_status option)
    ?dns_name:(dns_name_ : generic_string option) ?ip_sets:(ip_sets_ : ip_sets option)
    ?enabled:(enabled_ : generic_boolean option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?name:(name_ : generic_string option)
    ?accelerator_arn:(accelerator_arn_ : generic_string option) () =
  ({
     last_modified_time = last_modified_time_;
     created_time = created_time_;
     status = status_;
     dns_name = dns_name_;
     ip_sets = ip_sets_;
     enabled = enabled_;
     ip_address_type = ip_address_type_;
     name = name_;
     accelerator_arn = accelerator_arn_;
   }
    : custom_routing_accelerator)

let make_update_custom_routing_accelerator_response
    ?accelerator:(accelerator_ : custom_routing_accelerator option) () =
  ({ accelerator = accelerator_ } : update_custom_routing_accelerator_response)

let make_update_custom_routing_accelerator_request ?enabled:(enabled_ : generic_boolean option)
    ?ip_addresses:(ip_addresses_ : ip_addresses option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?name:(name_ : generic_string option) ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({
     enabled = enabled_;
     ip_addresses = ip_addresses_;
     ip_address_type = ip_address_type_;
     name = name_;
     accelerator_arn = accelerator_arn_;
   }
    : update_custom_routing_accelerator_request)

let make_custom_routing_accelerator_attributes
    ?flow_logs_s3_prefix:(flow_logs_s3_prefix_ : generic_string option)
    ?flow_logs_s3_bucket:(flow_logs_s3_bucket_ : generic_string option)
    ?flow_logs_enabled:(flow_logs_enabled_ : generic_boolean option) () =
  ({
     flow_logs_s3_prefix = flow_logs_s3_prefix_;
     flow_logs_s3_bucket = flow_logs_s3_bucket_;
     flow_logs_enabled = flow_logs_enabled_;
   }
    : custom_routing_accelerator_attributes)

let make_update_custom_routing_accelerator_attributes_response
    ?accelerator_attributes:(accelerator_attributes_ : custom_routing_accelerator_attributes option)
    () =
  ({ accelerator_attributes = accelerator_attributes_ }
    : update_custom_routing_accelerator_attributes_response)

let make_update_custom_routing_accelerator_attributes_request
    ?flow_logs_s3_prefix:(flow_logs_s3_prefix_ : generic_string option)
    ?flow_logs_s3_bucket:(flow_logs_s3_bucket_ : generic_string option)
    ?flow_logs_enabled:(flow_logs_enabled_ : generic_boolean option)
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({
     flow_logs_s3_prefix = flow_logs_s3_prefix_;
     flow_logs_s3_bucket = flow_logs_s3_bucket_;
     flow_logs_enabled = flow_logs_enabled_;
     accelerator_arn = accelerator_arn_;
   }
    : update_custom_routing_accelerator_attributes_request)

let make_resource ?region:(region_ : generic_string option) ?cidr:(cidr_ : generic_string option)
    ?endpoint_id:(endpoint_id_ : generic_string option) () =
  ({ region = region_; cidr = cidr_; endpoint_id = endpoint_id_ } : resource)

let make_attachment ?created_time:(created_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?resources:(resources_ : resources option) ?principals:(principals_ : principals option)
    ?name:(name_ : attachment_name option) ?attachment_arn:(attachment_arn_ : generic_string option)
    () =
  ({
     created_time = created_time_;
     last_modified_time = last_modified_time_;
     resources = resources_;
     principals = principals_;
     name = name_;
     attachment_arn = attachment_arn_;
   }
    : attachment)

let make_update_cross_account_attachment_response
    ?cross_account_attachment:(cross_account_attachment_ : attachment option) () =
  ({ cross_account_attachment = cross_account_attachment_ }
    : update_cross_account_attachment_response)

let make_update_cross_account_attachment_request
    ?remove_resources:(remove_resources_ : resources option)
    ?add_resources:(add_resources_ : resources option)
    ?remove_principals:(remove_principals_ : principals option)
    ?add_principals:(add_principals_ : principals option) ?name:(name_ : attachment_name option)
    ~attachment_arn:(attachment_arn_ : generic_string) () =
  ({
     remove_resources = remove_resources_;
     add_resources = add_resources_;
     remove_principals = remove_principals_;
     add_principals = add_principals_;
     name = name_;
     attachment_arn = attachment_arn_;
   }
    : update_cross_account_attachment_request)

let make_accelerator_event ?timestamp:(timestamp_ : timestamp option)
    ?message:(message_ : generic_string option) () =
  ({ timestamp = timestamp_; message = message_ } : accelerator_event)

let make_accelerator ?events:(events_ : accelerator_events option)
    ?dual_stack_dns_name:(dual_stack_dns_name_ : generic_string option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_time:(created_time_ : timestamp option) ?status:(status_ : accelerator_status option)
    ?dns_name:(dns_name_ : generic_string option) ?ip_sets:(ip_sets_ : ip_sets option)
    ?enabled:(enabled_ : generic_boolean option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?name:(name_ : generic_string option)
    ?accelerator_arn:(accelerator_arn_ : generic_string option) () =
  ({
     events = events_;
     dual_stack_dns_name = dual_stack_dns_name_;
     last_modified_time = last_modified_time_;
     created_time = created_time_;
     status = status_;
     dns_name = dns_name_;
     ip_sets = ip_sets_;
     enabled = enabled_;
     ip_address_type = ip_address_type_;
     name = name_;
     accelerator_arn = accelerator_arn_;
   }
    : accelerator)

let make_update_accelerator_response ?accelerator:(accelerator_ : accelerator option) () =
  ({ accelerator = accelerator_ } : update_accelerator_response)

let make_update_accelerator_request ?enabled:(enabled_ : generic_boolean option)
    ?ip_addresses:(ip_addresses_ : ip_addresses option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?name:(name_ : generic_string option) ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({
     enabled = enabled_;
     ip_addresses = ip_addresses_;
     ip_address_type = ip_address_type_;
     name = name_;
     accelerator_arn = accelerator_arn_;
   }
    : update_accelerator_request)

let make_accelerator_attributes ?flow_logs_s3_prefix:(flow_logs_s3_prefix_ : generic_string option)
    ?flow_logs_s3_bucket:(flow_logs_s3_bucket_ : generic_string option)
    ?flow_logs_enabled:(flow_logs_enabled_ : generic_boolean option) () =
  ({
     flow_logs_s3_prefix = flow_logs_s3_prefix_;
     flow_logs_s3_bucket = flow_logs_s3_bucket_;
     flow_logs_enabled = flow_logs_enabled_;
   }
    : accelerator_attributes)

let make_update_accelerator_attributes_response
    ?accelerator_attributes:(accelerator_attributes_ : accelerator_attributes option) () =
  ({ accelerator_attributes = accelerator_attributes_ } : update_accelerator_attributes_response)

let make_update_accelerator_attributes_request
    ?flow_logs_s3_prefix:(flow_logs_s3_prefix_ : generic_string option)
    ?flow_logs_s3_bucket:(flow_logs_s3_bucket_ : generic_string option)
    ?flow_logs_enabled:(flow_logs_enabled_ : generic_boolean option)
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({
     flow_logs_s3_prefix = flow_logs_s3_prefix_;
     flow_logs_s3_bucket = flow_logs_s3_bucket_;
     flow_logs_enabled = flow_logs_enabled_;
     accelerator_arn = accelerator_arn_;
   }
    : update_accelerator_attributes_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_keys)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tags) ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_socket_address ?port:(port_ : port_number option)
    ?ip_address:(ip_address_ : generic_string option) () =
  ({ port = port_; ip_address = ip_address_ } : socket_address)

let make_endpoint_identifier
    ?client_ip_preservation_enabled:(client_ip_preservation_enabled_ : generic_boolean option)
    ~endpoint_id:(endpoint_id_ : generic_string) () =
  ({ client_ip_preservation_enabled = client_ip_preservation_enabled_; endpoint_id = endpoint_id_ }
    : endpoint_identifier)

let make_remove_endpoints_request ~endpoint_group_arn:(endpoint_group_arn_ : generic_string)
    ~endpoint_identifiers:(endpoint_identifiers_ : endpoint_identifiers) () =
  ({ endpoint_group_arn = endpoint_group_arn_; endpoint_identifiers = endpoint_identifiers_ }
    : remove_endpoints_request)

let make_remove_custom_routing_endpoints_request
    ~endpoint_group_arn:(endpoint_group_arn_ : generic_string)
    ~endpoint_ids:(endpoint_ids_ : endpoint_ids) () =
  ({ endpoint_group_arn = endpoint_group_arn_; endpoint_ids = endpoint_ids_ }
    : remove_custom_routing_endpoints_request)

let make_provision_byoip_cidr_response ?byoip_cidr:(byoip_cidr_ : byoip_cidr option) () =
  ({ byoip_cidr = byoip_cidr_ } : provision_byoip_cidr_response)

let make_cidr_authorization_context ~signature:(signature_ : generic_string)
    ~message:(message_ : generic_string) () =
  ({ signature = signature_; message = message_ } : cidr_authorization_context)

let make_provision_byoip_cidr_request
    ~cidr_authorization_context:(cidr_authorization_context_ : cidr_authorization_context)
    ~cidr:(cidr_ : generic_string) () =
  ({ cidr_authorization_context = cidr_authorization_context_; cidr = cidr_ }
    : provision_byoip_cidr_request)

let make_port_mapping
    ?destination_traffic_state:
      (destination_traffic_state_ : custom_routing_destination_traffic_state option)
    ?protocols:(protocols_ : custom_routing_protocols option)
    ?destination_socket_address:(destination_socket_address_ : socket_address option)
    ?endpoint_id:(endpoint_id_ : generic_string option)
    ?endpoint_group_arn:(endpoint_group_arn_ : generic_string option)
    ?accelerator_port:(accelerator_port_ : port_number option) () =
  ({
     destination_traffic_state = destination_traffic_state_;
     protocols = protocols_;
     destination_socket_address = destination_socket_address_;
     endpoint_id = endpoint_id_;
     endpoint_group_arn = endpoint_group_arn_;
     accelerator_port = accelerator_port_;
   }
    : port_mapping)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_listeners_response ?next_token:(next_token_ : generic_string option)
    ?listeners:(listeners_ : listeners option) () =
  ({ next_token = next_token_; listeners = listeners_ } : list_listeners_response)

let make_list_listeners_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results option)
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({ next_token = next_token_; max_results = max_results_; accelerator_arn = accelerator_arn_ }
    : list_listeners_request)

let make_list_endpoint_groups_response ?next_token:(next_token_ : generic_string option)
    ?endpoint_groups:(endpoint_groups_ : endpoint_groups option) () =
  ({ next_token = next_token_; endpoint_groups = endpoint_groups_ } : list_endpoint_groups_response)

let make_list_endpoint_groups_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results option) ~listener_arn:(listener_arn_ : generic_string)
    () =
  ({ next_token = next_token_; max_results = max_results_; listener_arn = listener_arn_ }
    : list_endpoint_groups_request)

let make_list_custom_routing_port_mappings_response
    ?next_token:(next_token_ : generic_string option)
    ?port_mappings:(port_mappings_ : port_mappings option) () =
  ({ next_token = next_token_; port_mappings = port_mappings_ }
    : list_custom_routing_port_mappings_response)

let make_list_custom_routing_port_mappings_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : port_mappings_max_results option)
    ?endpoint_group_arn:(endpoint_group_arn_ : generic_string option)
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     endpoint_group_arn = endpoint_group_arn_;
     accelerator_arn = accelerator_arn_;
   }
    : list_custom_routing_port_mappings_request)

let make_destination_port_mapping
    ?destination_traffic_state:
      (destination_traffic_state_ : custom_routing_destination_traffic_state option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?destination_socket_address:(destination_socket_address_ : socket_address option)
    ?endpoint_group_region:(endpoint_group_region_ : generic_string option)
    ?endpoint_id:(endpoint_id_ : generic_string option)
    ?endpoint_group_arn:(endpoint_group_arn_ : generic_string option)
    ?accelerator_socket_addresses:(accelerator_socket_addresses_ : socket_addresses option)
    ?accelerator_arn:(accelerator_arn_ : generic_string option) () =
  ({
     destination_traffic_state = destination_traffic_state_;
     ip_address_type = ip_address_type_;
     destination_socket_address = destination_socket_address_;
     endpoint_group_region = endpoint_group_region_;
     endpoint_id = endpoint_id_;
     endpoint_group_arn = endpoint_group_arn_;
     accelerator_socket_addresses = accelerator_socket_addresses_;
     accelerator_arn = accelerator_arn_;
   }
    : destination_port_mapping)

let make_list_custom_routing_port_mappings_by_destination_response
    ?next_token:(next_token_ : generic_string option)
    ?destination_port_mappings:(destination_port_mappings_ : destination_port_mappings option) () =
  ({ next_token = next_token_; destination_port_mappings = destination_port_mappings_ }
    : list_custom_routing_port_mappings_by_destination_response)

let make_list_custom_routing_port_mappings_by_destination_request
    ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : port_mappings_max_results option)
    ~destination_address:(destination_address_ : generic_string)
    ~endpoint_id:(endpoint_id_ : generic_string) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     destination_address = destination_address_;
     endpoint_id = endpoint_id_;
   }
    : list_custom_routing_port_mappings_by_destination_request)

let make_list_custom_routing_listeners_response ?next_token:(next_token_ : generic_string option)
    ?listeners:(listeners_ : custom_routing_listeners option) () =
  ({ next_token = next_token_; listeners = listeners_ } : list_custom_routing_listeners_response)

let make_list_custom_routing_listeners_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results option)
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({ next_token = next_token_; max_results = max_results_; accelerator_arn = accelerator_arn_ }
    : list_custom_routing_listeners_request)

let make_custom_routing_destination_description ?protocols:(protocols_ : protocols option)
    ?to_port:(to_port_ : port_number option) ?from_port:(from_port_ : port_number option) () =
  ({ protocols = protocols_; to_port = to_port_; from_port = from_port_ }
    : custom_routing_destination_description)

let make_custom_routing_endpoint_description ?endpoint_id:(endpoint_id_ : generic_string option) ()
    =
  ({ endpoint_id = endpoint_id_ } : custom_routing_endpoint_description)

let make_custom_routing_endpoint_group
    ?endpoint_descriptions:(endpoint_descriptions_ : custom_routing_endpoint_descriptions option)
    ?destination_descriptions:
      (destination_descriptions_ : custom_routing_destination_descriptions option)
    ?endpoint_group_region:(endpoint_group_region_ : generic_string option)
    ?endpoint_group_arn:(endpoint_group_arn_ : generic_string option) () =
  ({
     endpoint_descriptions = endpoint_descriptions_;
     destination_descriptions = destination_descriptions_;
     endpoint_group_region = endpoint_group_region_;
     endpoint_group_arn = endpoint_group_arn_;
   }
    : custom_routing_endpoint_group)

let make_list_custom_routing_endpoint_groups_response
    ?next_token:(next_token_ : generic_string option)
    ?endpoint_groups:(endpoint_groups_ : custom_routing_endpoint_groups option) () =
  ({ next_token = next_token_; endpoint_groups = endpoint_groups_ }
    : list_custom_routing_endpoint_groups_response)

let make_list_custom_routing_endpoint_groups_request
    ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results option) ~listener_arn:(listener_arn_ : generic_string)
    () =
  ({ next_token = next_token_; max_results = max_results_; listener_arn = listener_arn_ }
    : list_custom_routing_endpoint_groups_request)

let make_list_custom_routing_accelerators_response ?next_token:(next_token_ : generic_string option)
    ?accelerators:(accelerators_ : custom_routing_accelerators option) () =
  ({ next_token = next_token_; accelerators = accelerators_ }
    : list_custom_routing_accelerators_response)

let make_list_custom_routing_accelerators_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ }
    : list_custom_routing_accelerators_request)

let make_cross_account_resource ?attachment_arn:(attachment_arn_ : generic_string option)
    ?cidr:(cidr_ : generic_string option) ?endpoint_id:(endpoint_id_ : generic_string option) () =
  ({ attachment_arn = attachment_arn_; cidr = cidr_; endpoint_id = endpoint_id_ }
    : cross_account_resource)

let make_list_cross_account_resources_response ?next_token:(next_token_ : generic_string option)
    ?cross_account_resources:(cross_account_resources_ : cross_account_resources option) () =
  ({ next_token = next_token_; cross_account_resources = cross_account_resources_ }
    : list_cross_account_resources_response)

let make_list_cross_account_resources_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results option)
    ?accelerator_arn:(accelerator_arn_ : generic_string option)
    ~resource_owner_aws_account_id:(resource_owner_aws_account_id_ : aws_account_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     resource_owner_aws_account_id = resource_owner_aws_account_id_;
     accelerator_arn = accelerator_arn_;
   }
    : list_cross_account_resources_request)

let make_list_cross_account_resource_accounts_response
    ?resource_owner_aws_account_ids:(resource_owner_aws_account_ids_ : aws_account_ids option) () =
  ({ resource_owner_aws_account_ids = resource_owner_aws_account_ids_ }
    : list_cross_account_resource_accounts_response)

let make_list_cross_account_resource_accounts_request () = (() : unit)

let make_list_cross_account_attachments_response ?next_token:(next_token_ : generic_string option)
    ?cross_account_attachments:(cross_account_attachments_ : attachments option) () =
  ({ next_token = next_token_; cross_account_attachments = cross_account_attachments_ }
    : list_cross_account_attachments_response)

let make_list_cross_account_attachments_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ }
    : list_cross_account_attachments_request)

let make_list_byoip_cidrs_response ?next_token:(next_token_ : generic_string option)
    ?byoip_cidrs:(byoip_cidrs_ : byoip_cidrs option) () =
  ({ next_token = next_token_; byoip_cidrs = byoip_cidrs_ } : list_byoip_cidrs_response)

let make_list_byoip_cidrs_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_byoip_cidrs_request)

let make_list_accelerators_response ?next_token:(next_token_ : generic_string option)
    ?accelerators:(accelerators_ : accelerators option) () =
  ({ next_token = next_token_; accelerators = accelerators_ } : list_accelerators_response)

let make_list_accelerators_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_accelerators_request)

let make_describe_listener_response ?listener:(listener_ : listener option) () =
  ({ listener = listener_ } : describe_listener_response)

let make_describe_listener_request ~listener_arn:(listener_arn_ : generic_string) () =
  ({ listener_arn = listener_arn_ } : describe_listener_request)

let make_describe_endpoint_group_response ?endpoint_group:(endpoint_group_ : endpoint_group option)
    () =
  ({ endpoint_group = endpoint_group_ } : describe_endpoint_group_response)

let make_describe_endpoint_group_request ~endpoint_group_arn:(endpoint_group_arn_ : generic_string)
    () =
  ({ endpoint_group_arn = endpoint_group_arn_ } : describe_endpoint_group_request)

let make_describe_custom_routing_listener_response
    ?listener:(listener_ : custom_routing_listener option) () =
  ({ listener = listener_ } : describe_custom_routing_listener_response)

let make_describe_custom_routing_listener_request ~listener_arn:(listener_arn_ : generic_string) ()
    =
  ({ listener_arn = listener_arn_ } : describe_custom_routing_listener_request)

let make_describe_custom_routing_endpoint_group_response
    ?endpoint_group:(endpoint_group_ : custom_routing_endpoint_group option) () =
  ({ endpoint_group = endpoint_group_ } : describe_custom_routing_endpoint_group_response)

let make_describe_custom_routing_endpoint_group_request
    ~endpoint_group_arn:(endpoint_group_arn_ : generic_string) () =
  ({ endpoint_group_arn = endpoint_group_arn_ } : describe_custom_routing_endpoint_group_request)

let make_describe_custom_routing_accelerator_attributes_response
    ?accelerator_attributes:(accelerator_attributes_ : custom_routing_accelerator_attributes option)
    () =
  ({ accelerator_attributes = accelerator_attributes_ }
    : describe_custom_routing_accelerator_attributes_response)

let make_describe_custom_routing_accelerator_attributes_request
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({ accelerator_arn = accelerator_arn_ } : describe_custom_routing_accelerator_attributes_request)

let make_describe_custom_routing_accelerator_response
    ?accelerator:(accelerator_ : custom_routing_accelerator option) () =
  ({ accelerator = accelerator_ } : describe_custom_routing_accelerator_response)

let make_describe_custom_routing_accelerator_request
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({ accelerator_arn = accelerator_arn_ } : describe_custom_routing_accelerator_request)

let make_describe_cross_account_attachment_response
    ?cross_account_attachment:(cross_account_attachment_ : attachment option) () =
  ({ cross_account_attachment = cross_account_attachment_ }
    : describe_cross_account_attachment_response)

let make_describe_cross_account_attachment_request
    ~attachment_arn:(attachment_arn_ : generic_string) () =
  ({ attachment_arn = attachment_arn_ } : describe_cross_account_attachment_request)

let make_describe_accelerator_attributes_response
    ?accelerator_attributes:(accelerator_attributes_ : accelerator_attributes option) () =
  ({ accelerator_attributes = accelerator_attributes_ } : describe_accelerator_attributes_response)

let make_describe_accelerator_attributes_request
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({ accelerator_arn = accelerator_arn_ } : describe_accelerator_attributes_request)

let make_describe_accelerator_response ?accelerator:(accelerator_ : accelerator option) () =
  ({ accelerator = accelerator_ } : describe_accelerator_response)

let make_describe_accelerator_request ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({ accelerator_arn = accelerator_arn_ } : describe_accelerator_request)

let make_deprovision_byoip_cidr_response ?byoip_cidr:(byoip_cidr_ : byoip_cidr option) () =
  ({ byoip_cidr = byoip_cidr_ } : deprovision_byoip_cidr_response)

let make_deprovision_byoip_cidr_request ~cidr:(cidr_ : generic_string) () =
  ({ cidr = cidr_ } : deprovision_byoip_cidr_request)

let make_deny_custom_routing_traffic_request
    ?deny_all_traffic_to_endpoint:(deny_all_traffic_to_endpoint_ : generic_boolean option)
    ?destination_ports:(destination_ports_ : destination_ports option)
    ?destination_addresses:(destination_addresses_ : destination_addresses option)
    ~endpoint_id:(endpoint_id_ : generic_string)
    ~endpoint_group_arn:(endpoint_group_arn_ : generic_string) () =
  ({
     deny_all_traffic_to_endpoint = deny_all_traffic_to_endpoint_;
     destination_ports = destination_ports_;
     destination_addresses = destination_addresses_;
     endpoint_id = endpoint_id_;
     endpoint_group_arn = endpoint_group_arn_;
   }
    : deny_custom_routing_traffic_request)

let make_delete_listener_request ~listener_arn:(listener_arn_ : generic_string) () =
  ({ listener_arn = listener_arn_ } : delete_listener_request)

let make_delete_endpoint_group_request ~endpoint_group_arn:(endpoint_group_arn_ : generic_string) ()
    =
  ({ endpoint_group_arn = endpoint_group_arn_ } : delete_endpoint_group_request)

let make_delete_custom_routing_listener_request ~listener_arn:(listener_arn_ : generic_string) () =
  ({ listener_arn = listener_arn_ } : delete_custom_routing_listener_request)

let make_delete_custom_routing_endpoint_group_request
    ~endpoint_group_arn:(endpoint_group_arn_ : generic_string) () =
  ({ endpoint_group_arn = endpoint_group_arn_ } : delete_custom_routing_endpoint_group_request)

let make_delete_custom_routing_accelerator_request
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({ accelerator_arn = accelerator_arn_ } : delete_custom_routing_accelerator_request)

let make_delete_cross_account_attachment_request ~attachment_arn:(attachment_arn_ : generic_string)
    () =
  ({ attachment_arn = attachment_arn_ } : delete_cross_account_attachment_request)

let make_delete_accelerator_request ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({ accelerator_arn = accelerator_arn_ } : delete_accelerator_request)

let make_create_listener_response ?listener:(listener_ : listener option) () =
  ({ listener = listener_ } : create_listener_response)

let make_create_listener_request ?client_affinity:(client_affinity_ : client_affinity option)
    ~idempotency_token:(idempotency_token_ : idempotency_token) ~protocol:(protocol_ : protocol)
    ~port_ranges:(port_ranges_ : port_ranges) ~accelerator_arn:(accelerator_arn_ : generic_string)
    () =
  ({
     idempotency_token = idempotency_token_;
     client_affinity = client_affinity_;
     protocol = protocol_;
     port_ranges = port_ranges_;
     accelerator_arn = accelerator_arn_;
   }
    : create_listener_request)

let make_create_endpoint_group_response ?endpoint_group:(endpoint_group_ : endpoint_group option) ()
    =
  ({ endpoint_group = endpoint_group_ } : create_endpoint_group_response)

let make_create_endpoint_group_request ?port_overrides:(port_overrides_ : port_overrides option)
    ?threshold_count:(threshold_count_ : threshold_count option)
    ?health_check_interval_seconds:
      (health_check_interval_seconds_ : health_check_interval_seconds option)
    ?health_check_path:(health_check_path_ : health_check_path option)
    ?health_check_protocol:(health_check_protocol_ : health_check_protocol option)
    ?health_check_port:(health_check_port_ : health_check_port option)
    ?traffic_dial_percentage:(traffic_dial_percentage_ : traffic_dial_percentage option)
    ?endpoint_configurations:(endpoint_configurations_ : endpoint_configurations option)
    ~idempotency_token:(idempotency_token_ : idempotency_token)
    ~endpoint_group_region:(endpoint_group_region_ : generic_string)
    ~listener_arn:(listener_arn_ : generic_string) () =
  ({
     port_overrides = port_overrides_;
     idempotency_token = idempotency_token_;
     threshold_count = threshold_count_;
     health_check_interval_seconds = health_check_interval_seconds_;
     health_check_path = health_check_path_;
     health_check_protocol = health_check_protocol_;
     health_check_port = health_check_port_;
     traffic_dial_percentage = traffic_dial_percentage_;
     endpoint_configurations = endpoint_configurations_;
     endpoint_group_region = endpoint_group_region_;
     listener_arn = listener_arn_;
   }
    : create_endpoint_group_request)

let make_create_custom_routing_listener_response
    ?listener:(listener_ : custom_routing_listener option) () =
  ({ listener = listener_ } : create_custom_routing_listener_response)

let make_create_custom_routing_listener_request
    ~idempotency_token:(idempotency_token_ : idempotency_token)
    ~port_ranges:(port_ranges_ : port_ranges) ~accelerator_arn:(accelerator_arn_ : generic_string)
    () =
  ({
     idempotency_token = idempotency_token_;
     port_ranges = port_ranges_;
     accelerator_arn = accelerator_arn_;
   }
    : create_custom_routing_listener_request)

let make_create_custom_routing_endpoint_group_response
    ?endpoint_group:(endpoint_group_ : custom_routing_endpoint_group option) () =
  ({ endpoint_group = endpoint_group_ } : create_custom_routing_endpoint_group_response)

let make_custom_routing_destination_configuration ~protocols:(protocols_ : custom_routing_protocols)
    ~to_port:(to_port_ : port_number) ~from_port:(from_port_ : port_number) () =
  ({ protocols = protocols_; to_port = to_port_; from_port = from_port_ }
    : custom_routing_destination_configuration)

let make_create_custom_routing_endpoint_group_request
    ~idempotency_token:(idempotency_token_ : idempotency_token)
    ~destination_configurations:
      (destination_configurations_ : custom_routing_destination_configurations)
    ~endpoint_group_region:(endpoint_group_region_ : generic_string)
    ~listener_arn:(listener_arn_ : generic_string) () =
  ({
     idempotency_token = idempotency_token_;
     destination_configurations = destination_configurations_;
     endpoint_group_region = endpoint_group_region_;
     listener_arn = listener_arn_;
   }
    : create_custom_routing_endpoint_group_request)

let make_create_custom_routing_accelerator_response
    ?accelerator:(accelerator_ : custom_routing_accelerator option) () =
  ({ accelerator = accelerator_ } : create_custom_routing_accelerator_response)

let make_create_custom_routing_accelerator_request ?tags:(tags_ : tags option)
    ?enabled:(enabled_ : generic_boolean option) ?ip_addresses:(ip_addresses_ : ip_addresses option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ~idempotency_token:(idempotency_token_ : idempotency_token) ~name:(name_ : generic_string) () =
  ({
     tags = tags_;
     idempotency_token = idempotency_token_;
     enabled = enabled_;
     ip_addresses = ip_addresses_;
     ip_address_type = ip_address_type_;
     name = name_;
   }
    : create_custom_routing_accelerator_request)

let make_create_cross_account_attachment_response
    ?cross_account_attachment:(cross_account_attachment_ : attachment option) () =
  ({ cross_account_attachment = cross_account_attachment_ }
    : create_cross_account_attachment_response)

let make_create_cross_account_attachment_request ?tags:(tags_ : tags option)
    ?resources:(resources_ : resources option) ?principals:(principals_ : principals option)
    ~idempotency_token:(idempotency_token_ : idempotency_token) ~name:(name_ : attachment_name) () =
  ({
     tags = tags_;
     idempotency_token = idempotency_token_;
     resources = resources_;
     principals = principals_;
     name = name_;
   }
    : create_cross_account_attachment_request)

let make_create_accelerator_response ?accelerator:(accelerator_ : accelerator option) () =
  ({ accelerator = accelerator_ } : create_accelerator_response)

let make_create_accelerator_request ?tags:(tags_ : tags option)
    ?enabled:(enabled_ : generic_boolean option) ?ip_addresses:(ip_addresses_ : ip_addresses option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ~idempotency_token:(idempotency_token_ : idempotency_token) ~name:(name_ : generic_string) () =
  ({
     tags = tags_;
     idempotency_token = idempotency_token_;
     enabled = enabled_;
     ip_addresses = ip_addresses_;
     ip_address_type = ip_address_type_;
     name = name_;
   }
    : create_accelerator_request)

let make_allow_custom_routing_traffic_request
    ?allow_all_traffic_to_endpoint:(allow_all_traffic_to_endpoint_ : generic_boolean option)
    ?destination_ports:(destination_ports_ : destination_ports option)
    ?destination_addresses:(destination_addresses_ : destination_addresses option)
    ~endpoint_id:(endpoint_id_ : generic_string)
    ~endpoint_group_arn:(endpoint_group_arn_ : generic_string) () =
  ({
     allow_all_traffic_to_endpoint = allow_all_traffic_to_endpoint_;
     destination_ports = destination_ports_;
     destination_addresses = destination_addresses_;
     endpoint_id = endpoint_id_;
     endpoint_group_arn = endpoint_group_arn_;
   }
    : allow_custom_routing_traffic_request)

let make_advertise_byoip_cidr_response ?byoip_cidr:(byoip_cidr_ : byoip_cidr option) () =
  ({ byoip_cidr = byoip_cidr_ } : advertise_byoip_cidr_response)

let make_advertise_byoip_cidr_request ~cidr:(cidr_ : generic_string) () =
  ({ cidr = cidr_ } : advertise_byoip_cidr_request)

let make_add_endpoints_response ?endpoint_group_arn:(endpoint_group_arn_ : generic_string option)
    ?endpoint_descriptions:(endpoint_descriptions_ : endpoint_descriptions option) () =
  ({ endpoint_group_arn = endpoint_group_arn_; endpoint_descriptions = endpoint_descriptions_ }
    : add_endpoints_response)

let make_add_endpoints_request ~endpoint_group_arn:(endpoint_group_arn_ : generic_string)
    ~endpoint_configurations:(endpoint_configurations_ : endpoint_configurations) () =
  ({ endpoint_group_arn = endpoint_group_arn_; endpoint_configurations = endpoint_configurations_ }
    : add_endpoints_request)

let make_add_custom_routing_endpoints_response
    ?endpoint_group_arn:(endpoint_group_arn_ : generic_string option)
    ?endpoint_descriptions:(endpoint_descriptions_ : custom_routing_endpoint_descriptions option) ()
    =
  ({ endpoint_group_arn = endpoint_group_arn_; endpoint_descriptions = endpoint_descriptions_ }
    : add_custom_routing_endpoints_response)

let make_custom_routing_endpoint_configuration
    ?attachment_arn:(attachment_arn_ : generic_string option)
    ?endpoint_id:(endpoint_id_ : generic_string option) () =
  ({ attachment_arn = attachment_arn_; endpoint_id = endpoint_id_ }
    : custom_routing_endpoint_configuration)

let make_add_custom_routing_endpoints_request
    ~endpoint_group_arn:(endpoint_group_arn_ : generic_string)
    ~endpoint_configurations:(endpoint_configurations_ : custom_routing_endpoint_configurations) ()
    =
  ({ endpoint_group_arn = endpoint_group_arn_; endpoint_configurations = endpoint_configurations_ }
    : add_custom_routing_endpoints_request)
