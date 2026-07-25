open Types

let make_accelerator_event ?message:(message_ : generic_string option)
    ?timestamp:(timestamp_ : timestamp option) () =
  ({ message = message_; timestamp = timestamp_ } : accelerator_event)

let make_ip_set ?ip_family:(ip_family_ : generic_string option)
    ?ip_addresses:(ip_addresses_ : ip_addresses option)
    ?ip_address_family:(ip_address_family_ : ip_address_family option) () =
  ({ ip_family = ip_family_; ip_addresses = ip_addresses_; ip_address_family = ip_address_family_ }
    : ip_set)

let make_accelerator ?accelerator_arn:(accelerator_arn_ : generic_string option)
    ?name:(name_ : generic_string option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?enabled:(enabled_ : generic_boolean option) ?ip_sets:(ip_sets_ : ip_sets option)
    ?dns_name:(dns_name_ : generic_string option) ?status:(status_ : accelerator_status option)
    ?created_time:(created_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?dual_stack_dns_name:(dual_stack_dns_name_ : generic_string option)
    ?events:(events_ : accelerator_events option) () =
  ({
     accelerator_arn = accelerator_arn_;
     name = name_;
     ip_address_type = ip_address_type_;
     enabled = enabled_;
     ip_sets = ip_sets_;
     dns_name = dns_name_;
     status = status_;
     created_time = created_time_;
     last_modified_time = last_modified_time_;
     dual_stack_dns_name = dual_stack_dns_name_;
     events = events_;
   }
    : accelerator)

let make_accelerator_attributes ?flow_logs_enabled:(flow_logs_enabled_ : generic_boolean option)
    ?flow_logs_s3_bucket:(flow_logs_s3_bucket_ : generic_string option)
    ?flow_logs_s3_prefix:(flow_logs_s3_prefix_ : generic_string option) () =
  ({
     flow_logs_enabled = flow_logs_enabled_;
     flow_logs_s3_bucket = flow_logs_s3_bucket_;
     flow_logs_s3_prefix = flow_logs_s3_prefix_;
   }
    : accelerator_attributes)

let make_custom_routing_endpoint_description ?endpoint_id:(endpoint_id_ : generic_string option) ()
    =
  ({ endpoint_id = endpoint_id_ } : custom_routing_endpoint_description)

let make_add_custom_routing_endpoints_response
    ?endpoint_descriptions:(endpoint_descriptions_ : custom_routing_endpoint_descriptions option)
    ?endpoint_group_arn:(endpoint_group_arn_ : generic_string option) () =
  ({ endpoint_descriptions = endpoint_descriptions_; endpoint_group_arn = endpoint_group_arn_ }
    : add_custom_routing_endpoints_response)

let make_custom_routing_endpoint_configuration ?endpoint_id:(endpoint_id_ : generic_string option)
    ?attachment_arn:(attachment_arn_ : generic_string option) () =
  ({ endpoint_id = endpoint_id_; attachment_arn = attachment_arn_ }
    : custom_routing_endpoint_configuration)

let make_add_custom_routing_endpoints_request
    ~endpoint_configurations:(endpoint_configurations_ : custom_routing_endpoint_configurations)
    ~endpoint_group_arn:(endpoint_group_arn_ : generic_string) () =
  ({ endpoint_configurations = endpoint_configurations_; endpoint_group_arn = endpoint_group_arn_ }
    : add_custom_routing_endpoints_request)

let make_endpoint_description ?endpoint_id:(endpoint_id_ : generic_string option)
    ?weight:(weight_ : endpoint_weight option) ?health_state:(health_state_ : health_state option)
    ?health_reason:(health_reason_ : generic_string option)
    ?client_ip_preservation_enabled:(client_ip_preservation_enabled_ : generic_boolean option) () =
  ({
     endpoint_id = endpoint_id_;
     weight = weight_;
     health_state = health_state_;
     health_reason = health_reason_;
     client_ip_preservation_enabled = client_ip_preservation_enabled_;
   }
    : endpoint_description)

let make_add_endpoints_response
    ?endpoint_descriptions:(endpoint_descriptions_ : endpoint_descriptions option)
    ?endpoint_group_arn:(endpoint_group_arn_ : generic_string option) () =
  ({ endpoint_descriptions = endpoint_descriptions_; endpoint_group_arn = endpoint_group_arn_ }
    : add_endpoints_response)

let make_endpoint_configuration ?endpoint_id:(endpoint_id_ : generic_string option)
    ?weight:(weight_ : endpoint_weight option)
    ?client_ip_preservation_enabled:(client_ip_preservation_enabled_ : generic_boolean option)
    ?attachment_arn:(attachment_arn_ : generic_string option) () =
  ({
     endpoint_id = endpoint_id_;
     weight = weight_;
     client_ip_preservation_enabled = client_ip_preservation_enabled_;
     attachment_arn = attachment_arn_;
   }
    : endpoint_configuration)

let make_add_endpoints_request
    ~endpoint_configurations:(endpoint_configurations_ : endpoint_configurations)
    ~endpoint_group_arn:(endpoint_group_arn_ : generic_string) () =
  ({ endpoint_configurations = endpoint_configurations_; endpoint_group_arn = endpoint_group_arn_ }
    : add_endpoints_request)

let make_byoip_cidr_event ?message:(message_ : generic_string option)
    ?timestamp:(timestamp_ : timestamp option) () =
  ({ message = message_; timestamp = timestamp_ } : byoip_cidr_event)

let make_byoip_cidr ?cidr:(cidr_ : generic_string option) ?state:(state_ : byoip_cidr_state option)
    ?events:(events_ : byoip_cidr_events option) () =
  ({ cidr = cidr_; state = state_; events = events_ } : byoip_cidr)

let make_advertise_byoip_cidr_response ?byoip_cidr:(byoip_cidr_ : byoip_cidr option) () =
  ({ byoip_cidr = byoip_cidr_ } : advertise_byoip_cidr_response)

let make_advertise_byoip_cidr_request ~cidr:(cidr_ : generic_string) () =
  ({ cidr = cidr_ } : advertise_byoip_cidr_request)

let make_allow_custom_routing_traffic_request
    ?destination_addresses:(destination_addresses_ : destination_addresses option)
    ?destination_ports:(destination_ports_ : destination_ports option)
    ?allow_all_traffic_to_endpoint:(allow_all_traffic_to_endpoint_ : generic_boolean option)
    ~endpoint_group_arn:(endpoint_group_arn_ : generic_string)
    ~endpoint_id:(endpoint_id_ : generic_string) () =
  ({
     endpoint_group_arn = endpoint_group_arn_;
     endpoint_id = endpoint_id_;
     destination_addresses = destination_addresses_;
     destination_ports = destination_ports_;
     allow_all_traffic_to_endpoint = allow_all_traffic_to_endpoint_;
   }
    : allow_custom_routing_traffic_request)

let make_resource ?endpoint_id:(endpoint_id_ : generic_string option)
    ?cidr:(cidr_ : generic_string option) ?region:(region_ : generic_string option) () =
  ({ endpoint_id = endpoint_id_; cidr = cidr_; region = region_ } : resource)

let make_attachment ?attachment_arn:(attachment_arn_ : generic_string option)
    ?name:(name_ : attachment_name option) ?principals:(principals_ : principals option)
    ?resources:(resources_ : resources option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_time:(created_time_ : timestamp option) () =
  ({
     attachment_arn = attachment_arn_;
     name = name_;
     principals = principals_;
     resources = resources_;
     last_modified_time = last_modified_time_;
     created_time = created_time_;
   }
    : attachment)

let make_cidr_authorization_context ~message:(message_ : generic_string)
    ~signature:(signature_ : generic_string) () =
  ({ message = message_; signature = signature_ } : cidr_authorization_context)

let make_create_accelerator_response ?accelerator:(accelerator_ : accelerator option) () =
  ({ accelerator = accelerator_ } : create_accelerator_response)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_create_accelerator_request ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?ip_addresses:(ip_addresses_ : ip_addresses option) ?enabled:(enabled_ : generic_boolean option)
    ?tags:(tags_ : tags option) ~name:(name_ : generic_string)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     name = name_;
     ip_address_type = ip_address_type_;
     ip_addresses = ip_addresses_;
     enabled = enabled_;
     idempotency_token = idempotency_token_;
     tags = tags_;
   }
    : create_accelerator_request)

let make_create_cross_account_attachment_response
    ?cross_account_attachment:(cross_account_attachment_ : attachment option) () =
  ({ cross_account_attachment = cross_account_attachment_ }
    : create_cross_account_attachment_response)

let make_create_cross_account_attachment_request ?principals:(principals_ : principals option)
    ?resources:(resources_ : resources option) ?tags:(tags_ : tags option)
    ~name:(name_ : attachment_name) ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     name = name_;
     principals = principals_;
     resources = resources_;
     idempotency_token = idempotency_token_;
     tags = tags_;
   }
    : create_cross_account_attachment_request)

let make_custom_routing_accelerator ?accelerator_arn:(accelerator_arn_ : generic_string option)
    ?name:(name_ : generic_string option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?enabled:(enabled_ : generic_boolean option) ?ip_sets:(ip_sets_ : ip_sets option)
    ?dns_name:(dns_name_ : generic_string option)
    ?status:(status_ : custom_routing_accelerator_status option)
    ?created_time:(created_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option) () =
  ({
     accelerator_arn = accelerator_arn_;
     name = name_;
     ip_address_type = ip_address_type_;
     enabled = enabled_;
     ip_sets = ip_sets_;
     dns_name = dns_name_;
     status = status_;
     created_time = created_time_;
     last_modified_time = last_modified_time_;
   }
    : custom_routing_accelerator)

let make_create_custom_routing_accelerator_response
    ?accelerator:(accelerator_ : custom_routing_accelerator option) () =
  ({ accelerator = accelerator_ } : create_custom_routing_accelerator_response)

let make_create_custom_routing_accelerator_request
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?ip_addresses:(ip_addresses_ : ip_addresses option) ?enabled:(enabled_ : generic_boolean option)
    ?tags:(tags_ : tags option) ~name:(name_ : generic_string)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     name = name_;
     ip_address_type = ip_address_type_;
     ip_addresses = ip_addresses_;
     enabled = enabled_;
     idempotency_token = idempotency_token_;
     tags = tags_;
   }
    : create_custom_routing_accelerator_request)

let make_custom_routing_destination_description ?from_port:(from_port_ : port_number option)
    ?to_port:(to_port_ : port_number option) ?protocols:(protocols_ : protocols option) () =
  ({ from_port = from_port_; to_port = to_port_; protocols = protocols_ }
    : custom_routing_destination_description)

let make_custom_routing_endpoint_group
    ?endpoint_group_arn:(endpoint_group_arn_ : generic_string option)
    ?endpoint_group_region:(endpoint_group_region_ : generic_string option)
    ?destination_descriptions:
      (destination_descriptions_ : custom_routing_destination_descriptions option)
    ?endpoint_descriptions:(endpoint_descriptions_ : custom_routing_endpoint_descriptions option) ()
    =
  ({
     endpoint_group_arn = endpoint_group_arn_;
     endpoint_group_region = endpoint_group_region_;
     destination_descriptions = destination_descriptions_;
     endpoint_descriptions = endpoint_descriptions_;
   }
    : custom_routing_endpoint_group)

let make_create_custom_routing_endpoint_group_response
    ?endpoint_group:(endpoint_group_ : custom_routing_endpoint_group option) () =
  ({ endpoint_group = endpoint_group_ } : create_custom_routing_endpoint_group_response)

let make_custom_routing_destination_configuration ~from_port:(from_port_ : port_number)
    ~to_port:(to_port_ : port_number) ~protocols:(protocols_ : custom_routing_protocols) () =
  ({ from_port = from_port_; to_port = to_port_; protocols = protocols_ }
    : custom_routing_destination_configuration)

let make_create_custom_routing_endpoint_group_request ~listener_arn:(listener_arn_ : generic_string)
    ~endpoint_group_region:(endpoint_group_region_ : generic_string)
    ~destination_configurations:
      (destination_configurations_ : custom_routing_destination_configurations)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     listener_arn = listener_arn_;
     endpoint_group_region = endpoint_group_region_;
     destination_configurations = destination_configurations_;
     idempotency_token = idempotency_token_;
   }
    : create_custom_routing_endpoint_group_request)

let make_port_range ?from_port:(from_port_ : port_number option)
    ?to_port:(to_port_ : port_number option) () =
  ({ from_port = from_port_; to_port = to_port_ } : port_range)

let make_custom_routing_listener ?listener_arn:(listener_arn_ : generic_string option)
    ?port_ranges:(port_ranges_ : port_ranges option) () =
  ({ listener_arn = listener_arn_; port_ranges = port_ranges_ } : custom_routing_listener)

let make_create_custom_routing_listener_response
    ?listener:(listener_ : custom_routing_listener option) () =
  ({ listener = listener_ } : create_custom_routing_listener_response)

let make_create_custom_routing_listener_request ~accelerator_arn:(accelerator_arn_ : generic_string)
    ~port_ranges:(port_ranges_ : port_ranges)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     accelerator_arn = accelerator_arn_;
     port_ranges = port_ranges_;
     idempotency_token = idempotency_token_;
   }
    : create_custom_routing_listener_request)

let make_port_override ?listener_port:(listener_port_ : port_number option)
    ?endpoint_port:(endpoint_port_ : port_number option) () =
  ({ listener_port = listener_port_; endpoint_port = endpoint_port_ } : port_override)

let make_endpoint_group ?endpoint_group_arn:(endpoint_group_arn_ : generic_string option)
    ?endpoint_group_region:(endpoint_group_region_ : generic_string option)
    ?endpoint_descriptions:(endpoint_descriptions_ : endpoint_descriptions option)
    ?traffic_dial_percentage:(traffic_dial_percentage_ : traffic_dial_percentage option)
    ?health_check_port:(health_check_port_ : health_check_port option)
    ?health_check_protocol:(health_check_protocol_ : health_check_protocol option)
    ?health_check_path:(health_check_path_ : health_check_path option)
    ?health_check_interval_seconds:
      (health_check_interval_seconds_ : health_check_interval_seconds option)
    ?threshold_count:(threshold_count_ : threshold_count option)
    ?port_overrides:(port_overrides_ : port_overrides option) () =
  ({
     endpoint_group_arn = endpoint_group_arn_;
     endpoint_group_region = endpoint_group_region_;
     endpoint_descriptions = endpoint_descriptions_;
     traffic_dial_percentage = traffic_dial_percentage_;
     health_check_port = health_check_port_;
     health_check_protocol = health_check_protocol_;
     health_check_path = health_check_path_;
     health_check_interval_seconds = health_check_interval_seconds_;
     threshold_count = threshold_count_;
     port_overrides = port_overrides_;
   }
    : endpoint_group)

let make_create_endpoint_group_response ?endpoint_group:(endpoint_group_ : endpoint_group option) ()
    =
  ({ endpoint_group = endpoint_group_ } : create_endpoint_group_response)

let make_create_endpoint_group_request
    ?endpoint_configurations:(endpoint_configurations_ : endpoint_configurations option)
    ?traffic_dial_percentage:(traffic_dial_percentage_ : traffic_dial_percentage option)
    ?health_check_port:(health_check_port_ : health_check_port option)
    ?health_check_protocol:(health_check_protocol_ : health_check_protocol option)
    ?health_check_path:(health_check_path_ : health_check_path option)
    ?health_check_interval_seconds:
      (health_check_interval_seconds_ : health_check_interval_seconds option)
    ?threshold_count:(threshold_count_ : threshold_count option)
    ?port_overrides:(port_overrides_ : port_overrides option)
    ~listener_arn:(listener_arn_ : generic_string)
    ~endpoint_group_region:(endpoint_group_region_ : generic_string)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     listener_arn = listener_arn_;
     endpoint_group_region = endpoint_group_region_;
     endpoint_configurations = endpoint_configurations_;
     traffic_dial_percentage = traffic_dial_percentage_;
     health_check_port = health_check_port_;
     health_check_protocol = health_check_protocol_;
     health_check_path = health_check_path_;
     health_check_interval_seconds = health_check_interval_seconds_;
     threshold_count = threshold_count_;
     idempotency_token = idempotency_token_;
     port_overrides = port_overrides_;
   }
    : create_endpoint_group_request)

let make_listener ?listener_arn:(listener_arn_ : generic_string option)
    ?port_ranges:(port_ranges_ : port_ranges option) ?protocol:(protocol_ : protocol option)
    ?client_affinity:(client_affinity_ : client_affinity option) () =
  ({
     listener_arn = listener_arn_;
     port_ranges = port_ranges_;
     protocol = protocol_;
     client_affinity = client_affinity_;
   }
    : listener)

let make_create_listener_response ?listener:(listener_ : listener option) () =
  ({ listener = listener_ } : create_listener_response)

let make_create_listener_request ?client_affinity:(client_affinity_ : client_affinity option)
    ~accelerator_arn:(accelerator_arn_ : generic_string) ~port_ranges:(port_ranges_ : port_ranges)
    ~protocol:(protocol_ : protocol) ~idempotency_token:(idempotency_token_ : idempotency_token) ()
    =
  ({
     accelerator_arn = accelerator_arn_;
     port_ranges = port_ranges_;
     protocol = protocol_;
     client_affinity = client_affinity_;
     idempotency_token = idempotency_token_;
   }
    : create_listener_request)

let make_cross_account_resource ?endpoint_id:(endpoint_id_ : generic_string option)
    ?cidr:(cidr_ : generic_string option) ?attachment_arn:(attachment_arn_ : generic_string option)
    () =
  ({ endpoint_id = endpoint_id_; cidr = cidr_; attachment_arn = attachment_arn_ }
    : cross_account_resource)

let make_custom_routing_accelerator_attributes
    ?flow_logs_enabled:(flow_logs_enabled_ : generic_boolean option)
    ?flow_logs_s3_bucket:(flow_logs_s3_bucket_ : generic_string option)
    ?flow_logs_s3_prefix:(flow_logs_s3_prefix_ : generic_string option) () =
  ({
     flow_logs_enabled = flow_logs_enabled_;
     flow_logs_s3_bucket = flow_logs_s3_bucket_;
     flow_logs_s3_prefix = flow_logs_s3_prefix_;
   }
    : custom_routing_accelerator_attributes)

let make_delete_accelerator_request ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({ accelerator_arn = accelerator_arn_ } : delete_accelerator_request)

let make_delete_cross_account_attachment_request ~attachment_arn:(attachment_arn_ : generic_string)
    () =
  ({ attachment_arn = attachment_arn_ } : delete_cross_account_attachment_request)

let make_delete_custom_routing_accelerator_request
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({ accelerator_arn = accelerator_arn_ } : delete_custom_routing_accelerator_request)

let make_delete_custom_routing_endpoint_group_request
    ~endpoint_group_arn:(endpoint_group_arn_ : generic_string) () =
  ({ endpoint_group_arn = endpoint_group_arn_ } : delete_custom_routing_endpoint_group_request)

let make_delete_custom_routing_listener_request ~listener_arn:(listener_arn_ : generic_string) () =
  ({ listener_arn = listener_arn_ } : delete_custom_routing_listener_request)

let make_delete_endpoint_group_request ~endpoint_group_arn:(endpoint_group_arn_ : generic_string) ()
    =
  ({ endpoint_group_arn = endpoint_group_arn_ } : delete_endpoint_group_request)

let make_delete_listener_request ~listener_arn:(listener_arn_ : generic_string) () =
  ({ listener_arn = listener_arn_ } : delete_listener_request)

let make_deny_custom_routing_traffic_request
    ?destination_addresses:(destination_addresses_ : destination_addresses option)
    ?destination_ports:(destination_ports_ : destination_ports option)
    ?deny_all_traffic_to_endpoint:(deny_all_traffic_to_endpoint_ : generic_boolean option)
    ~endpoint_group_arn:(endpoint_group_arn_ : generic_string)
    ~endpoint_id:(endpoint_id_ : generic_string) () =
  ({
     endpoint_group_arn = endpoint_group_arn_;
     endpoint_id = endpoint_id_;
     destination_addresses = destination_addresses_;
     destination_ports = destination_ports_;
     deny_all_traffic_to_endpoint = deny_all_traffic_to_endpoint_;
   }
    : deny_custom_routing_traffic_request)

let make_deprovision_byoip_cidr_response ?byoip_cidr:(byoip_cidr_ : byoip_cidr option) () =
  ({ byoip_cidr = byoip_cidr_ } : deprovision_byoip_cidr_response)

let make_deprovision_byoip_cidr_request ~cidr:(cidr_ : generic_string) () =
  ({ cidr = cidr_ } : deprovision_byoip_cidr_request)

let make_describe_accelerator_response ?accelerator:(accelerator_ : accelerator option) () =
  ({ accelerator = accelerator_ } : describe_accelerator_response)

let make_describe_accelerator_request ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({ accelerator_arn = accelerator_arn_ } : describe_accelerator_request)

let make_describe_accelerator_attributes_response
    ?accelerator_attributes:(accelerator_attributes_ : accelerator_attributes option) () =
  ({ accelerator_attributes = accelerator_attributes_ } : describe_accelerator_attributes_response)

let make_describe_accelerator_attributes_request
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({ accelerator_arn = accelerator_arn_ } : describe_accelerator_attributes_request)

let make_describe_cross_account_attachment_response
    ?cross_account_attachment:(cross_account_attachment_ : attachment option) () =
  ({ cross_account_attachment = cross_account_attachment_ }
    : describe_cross_account_attachment_response)

let make_describe_cross_account_attachment_request
    ~attachment_arn:(attachment_arn_ : generic_string) () =
  ({ attachment_arn = attachment_arn_ } : describe_cross_account_attachment_request)

let make_describe_custom_routing_accelerator_response
    ?accelerator:(accelerator_ : custom_routing_accelerator option) () =
  ({ accelerator = accelerator_ } : describe_custom_routing_accelerator_response)

let make_describe_custom_routing_accelerator_request
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({ accelerator_arn = accelerator_arn_ } : describe_custom_routing_accelerator_request)

let make_describe_custom_routing_accelerator_attributes_response
    ?accelerator_attributes:(accelerator_attributes_ : custom_routing_accelerator_attributes option)
    () =
  ({ accelerator_attributes = accelerator_attributes_ }
    : describe_custom_routing_accelerator_attributes_response)

let make_describe_custom_routing_accelerator_attributes_request
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({ accelerator_arn = accelerator_arn_ } : describe_custom_routing_accelerator_attributes_request)

let make_describe_custom_routing_endpoint_group_response
    ?endpoint_group:(endpoint_group_ : custom_routing_endpoint_group option) () =
  ({ endpoint_group = endpoint_group_ } : describe_custom_routing_endpoint_group_response)

let make_describe_custom_routing_endpoint_group_request
    ~endpoint_group_arn:(endpoint_group_arn_ : generic_string) () =
  ({ endpoint_group_arn = endpoint_group_arn_ } : describe_custom_routing_endpoint_group_request)

let make_describe_custom_routing_listener_response
    ?listener:(listener_ : custom_routing_listener option) () =
  ({ listener = listener_ } : describe_custom_routing_listener_response)

let make_describe_custom_routing_listener_request ~listener_arn:(listener_arn_ : generic_string) ()
    =
  ({ listener_arn = listener_arn_ } : describe_custom_routing_listener_request)

let make_describe_endpoint_group_response ?endpoint_group:(endpoint_group_ : endpoint_group option)
    () =
  ({ endpoint_group = endpoint_group_ } : describe_endpoint_group_response)

let make_describe_endpoint_group_request ~endpoint_group_arn:(endpoint_group_arn_ : generic_string)
    () =
  ({ endpoint_group_arn = endpoint_group_arn_ } : describe_endpoint_group_request)

let make_describe_listener_response ?listener:(listener_ : listener option) () =
  ({ listener = listener_ } : describe_listener_response)

let make_describe_listener_request ~listener_arn:(listener_arn_ : generic_string) () =
  ({ listener_arn = listener_arn_ } : describe_listener_request)

let make_socket_address ?ip_address:(ip_address_ : generic_string option)
    ?port:(port_ : port_number option) () =
  ({ ip_address = ip_address_; port = port_ } : socket_address)

let make_destination_port_mapping ?accelerator_arn:(accelerator_arn_ : generic_string option)
    ?accelerator_socket_addresses:(accelerator_socket_addresses_ : socket_addresses option)
    ?endpoint_group_arn:(endpoint_group_arn_ : generic_string option)
    ?endpoint_id:(endpoint_id_ : generic_string option)
    ?endpoint_group_region:(endpoint_group_region_ : generic_string option)
    ?destination_socket_address:(destination_socket_address_ : socket_address option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?destination_traffic_state:
      (destination_traffic_state_ : custom_routing_destination_traffic_state option) () =
  ({
     accelerator_arn = accelerator_arn_;
     accelerator_socket_addresses = accelerator_socket_addresses_;
     endpoint_group_arn = endpoint_group_arn_;
     endpoint_id = endpoint_id_;
     endpoint_group_region = endpoint_group_region_;
     destination_socket_address = destination_socket_address_;
     ip_address_type = ip_address_type_;
     destination_traffic_state = destination_traffic_state_;
   }
    : destination_port_mapping)

let make_endpoint_identifier
    ?client_ip_preservation_enabled:(client_ip_preservation_enabled_ : generic_boolean option)
    ~endpoint_id:(endpoint_id_ : generic_string) () =
  ({ endpoint_id = endpoint_id_; client_ip_preservation_enabled = client_ip_preservation_enabled_ }
    : endpoint_identifier)

let make_withdraw_byoip_cidr_response ?byoip_cidr:(byoip_cidr_ : byoip_cidr option) () =
  ({ byoip_cidr = byoip_cidr_ } : withdraw_byoip_cidr_response)

let make_withdraw_byoip_cidr_request ~cidr:(cidr_ : generic_string) () =
  ({ cidr = cidr_ } : withdraw_byoip_cidr_request)

let make_update_listener_response ?listener:(listener_ : listener option) () =
  ({ listener = listener_ } : update_listener_response)

let make_update_listener_request ?port_ranges:(port_ranges_ : port_ranges option)
    ?protocol:(protocol_ : protocol option)
    ?client_affinity:(client_affinity_ : client_affinity option)
    ~listener_arn:(listener_arn_ : generic_string) () =
  ({
     listener_arn = listener_arn_;
     port_ranges = port_ranges_;
     protocol = protocol_;
     client_affinity = client_affinity_;
   }
    : update_listener_request)

let make_update_endpoint_group_response ?endpoint_group:(endpoint_group_ : endpoint_group option) ()
    =
  ({ endpoint_group = endpoint_group_ } : update_endpoint_group_response)

let make_update_endpoint_group_request
    ?endpoint_configurations:(endpoint_configurations_ : endpoint_configurations option)
    ?traffic_dial_percentage:(traffic_dial_percentage_ : traffic_dial_percentage option)
    ?health_check_port:(health_check_port_ : health_check_port option)
    ?health_check_protocol:(health_check_protocol_ : health_check_protocol option)
    ?health_check_path:(health_check_path_ : health_check_path option)
    ?health_check_interval_seconds:
      (health_check_interval_seconds_ : health_check_interval_seconds option)
    ?threshold_count:(threshold_count_ : threshold_count option)
    ?port_overrides:(port_overrides_ : port_overrides option)
    ~endpoint_group_arn:(endpoint_group_arn_ : generic_string) () =
  ({
     endpoint_group_arn = endpoint_group_arn_;
     endpoint_configurations = endpoint_configurations_;
     traffic_dial_percentage = traffic_dial_percentage_;
     health_check_port = health_check_port_;
     health_check_protocol = health_check_protocol_;
     health_check_path = health_check_path_;
     health_check_interval_seconds = health_check_interval_seconds_;
     threshold_count = threshold_count_;
     port_overrides = port_overrides_;
   }
    : update_endpoint_group_request)

let make_update_custom_routing_listener_response
    ?listener:(listener_ : custom_routing_listener option) () =
  ({ listener = listener_ } : update_custom_routing_listener_response)

let make_update_custom_routing_listener_request ~listener_arn:(listener_arn_ : generic_string)
    ~port_ranges:(port_ranges_ : port_ranges) () =
  ({ listener_arn = listener_arn_; port_ranges = port_ranges_ }
    : update_custom_routing_listener_request)

let make_update_custom_routing_accelerator_attributes_response
    ?accelerator_attributes:(accelerator_attributes_ : custom_routing_accelerator_attributes option)
    () =
  ({ accelerator_attributes = accelerator_attributes_ }
    : update_custom_routing_accelerator_attributes_response)

let make_update_custom_routing_accelerator_attributes_request
    ?flow_logs_enabled:(flow_logs_enabled_ : generic_boolean option)
    ?flow_logs_s3_bucket:(flow_logs_s3_bucket_ : generic_string option)
    ?flow_logs_s3_prefix:(flow_logs_s3_prefix_ : generic_string option)
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({
     accelerator_arn = accelerator_arn_;
     flow_logs_enabled = flow_logs_enabled_;
     flow_logs_s3_bucket = flow_logs_s3_bucket_;
     flow_logs_s3_prefix = flow_logs_s3_prefix_;
   }
    : update_custom_routing_accelerator_attributes_request)

let make_update_custom_routing_accelerator_response
    ?accelerator:(accelerator_ : custom_routing_accelerator option) () =
  ({ accelerator = accelerator_ } : update_custom_routing_accelerator_response)

let make_update_custom_routing_accelerator_request ?name:(name_ : generic_string option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?ip_addresses:(ip_addresses_ : ip_addresses option) ?enabled:(enabled_ : generic_boolean option)
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({
     accelerator_arn = accelerator_arn_;
     name = name_;
     ip_address_type = ip_address_type_;
     ip_addresses = ip_addresses_;
     enabled = enabled_;
   }
    : update_custom_routing_accelerator_request)

let make_update_cross_account_attachment_response
    ?cross_account_attachment:(cross_account_attachment_ : attachment option) () =
  ({ cross_account_attachment = cross_account_attachment_ }
    : update_cross_account_attachment_response)

let make_update_cross_account_attachment_request ?name:(name_ : attachment_name option)
    ?add_principals:(add_principals_ : principals option)
    ?remove_principals:(remove_principals_ : principals option)
    ?add_resources:(add_resources_ : resources option)
    ?remove_resources:(remove_resources_ : resources option)
    ~attachment_arn:(attachment_arn_ : generic_string) () =
  ({
     attachment_arn = attachment_arn_;
     name = name_;
     add_principals = add_principals_;
     remove_principals = remove_principals_;
     add_resources = add_resources_;
     remove_resources = remove_resources_;
   }
    : update_cross_account_attachment_request)

let make_update_accelerator_attributes_response
    ?accelerator_attributes:(accelerator_attributes_ : accelerator_attributes option) () =
  ({ accelerator_attributes = accelerator_attributes_ } : update_accelerator_attributes_response)

let make_update_accelerator_attributes_request
    ?flow_logs_enabled:(flow_logs_enabled_ : generic_boolean option)
    ?flow_logs_s3_bucket:(flow_logs_s3_bucket_ : generic_string option)
    ?flow_logs_s3_prefix:(flow_logs_s3_prefix_ : generic_string option)
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({
     accelerator_arn = accelerator_arn_;
     flow_logs_enabled = flow_logs_enabled_;
     flow_logs_s3_bucket = flow_logs_s3_bucket_;
     flow_logs_s3_prefix = flow_logs_s3_prefix_;
   }
    : update_accelerator_attributes_request)

let make_update_accelerator_response ?accelerator:(accelerator_ : accelerator option) () =
  ({ accelerator = accelerator_ } : update_accelerator_response)

let make_update_accelerator_request ?name:(name_ : generic_string option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?ip_addresses:(ip_addresses_ : ip_addresses option) ?enabled:(enabled_ : generic_boolean option)
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({
     accelerator_arn = accelerator_arn_;
     name = name_;
     ip_address_type = ip_address_type_;
     ip_addresses = ip_addresses_;
     enabled = enabled_;
   }
    : update_accelerator_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : resource_arn)
    ~tag_keys:(tag_keys_ : tag_keys) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : resource_arn) ~tags:(tags_ : tags) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_remove_endpoints_request
    ~endpoint_identifiers:(endpoint_identifiers_ : endpoint_identifiers)
    ~endpoint_group_arn:(endpoint_group_arn_ : generic_string) () =
  ({ endpoint_identifiers = endpoint_identifiers_; endpoint_group_arn = endpoint_group_arn_ }
    : remove_endpoints_request)

let make_remove_custom_routing_endpoints_request ~endpoint_ids:(endpoint_ids_ : endpoint_ids)
    ~endpoint_group_arn:(endpoint_group_arn_ : generic_string) () =
  ({ endpoint_ids = endpoint_ids_; endpoint_group_arn = endpoint_group_arn_ }
    : remove_custom_routing_endpoints_request)

let make_provision_byoip_cidr_response ?byoip_cidr:(byoip_cidr_ : byoip_cidr option) () =
  ({ byoip_cidr = byoip_cidr_ } : provision_byoip_cidr_response)

let make_provision_byoip_cidr_request ~cidr:(cidr_ : generic_string)
    ~cidr_authorization_context:(cidr_authorization_context_ : cidr_authorization_context) () =
  ({ cidr = cidr_; cidr_authorization_context = cidr_authorization_context_ }
    : provision_byoip_cidr_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_listeners_response ?listeners:(listeners_ : listeners option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ listeners = listeners_; next_token = next_token_ } : list_listeners_response)

let make_list_listeners_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : generic_string option)
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({ accelerator_arn = accelerator_arn_; max_results = max_results_; next_token = next_token_ }
    : list_listeners_request)

let make_list_endpoint_groups_response ?endpoint_groups:(endpoint_groups_ : endpoint_groups option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ endpoint_groups = endpoint_groups_; next_token = next_token_ } : list_endpoint_groups_response)

let make_list_endpoint_groups_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : generic_string option) ~listener_arn:(listener_arn_ : generic_string)
    () =
  ({ listener_arn = listener_arn_; max_results = max_results_; next_token = next_token_ }
    : list_endpoint_groups_request)

let make_list_custom_routing_port_mappings_by_destination_response
    ?destination_port_mappings:(destination_port_mappings_ : destination_port_mappings option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ destination_port_mappings = destination_port_mappings_; next_token = next_token_ }
    : list_custom_routing_port_mappings_by_destination_response)

let make_list_custom_routing_port_mappings_by_destination_request
    ?max_results:(max_results_ : port_mappings_max_results option)
    ?next_token:(next_token_ : generic_string option) ~endpoint_id:(endpoint_id_ : generic_string)
    ~destination_address:(destination_address_ : generic_string) () =
  ({
     endpoint_id = endpoint_id_;
     destination_address = destination_address_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_custom_routing_port_mappings_by_destination_request)

let make_port_mapping ?accelerator_port:(accelerator_port_ : port_number option)
    ?endpoint_group_arn:(endpoint_group_arn_ : generic_string option)
    ?endpoint_id:(endpoint_id_ : generic_string option)
    ?destination_socket_address:(destination_socket_address_ : socket_address option)
    ?protocols:(protocols_ : custom_routing_protocols option)
    ?destination_traffic_state:
      (destination_traffic_state_ : custom_routing_destination_traffic_state option) () =
  ({
     accelerator_port = accelerator_port_;
     endpoint_group_arn = endpoint_group_arn_;
     endpoint_id = endpoint_id_;
     destination_socket_address = destination_socket_address_;
     protocols = protocols_;
     destination_traffic_state = destination_traffic_state_;
   }
    : port_mapping)

let make_list_custom_routing_port_mappings_response
    ?port_mappings:(port_mappings_ : port_mappings option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ port_mappings = port_mappings_; next_token = next_token_ }
    : list_custom_routing_port_mappings_response)

let make_list_custom_routing_port_mappings_request
    ?endpoint_group_arn:(endpoint_group_arn_ : generic_string option)
    ?max_results:(max_results_ : port_mappings_max_results option)
    ?next_token:(next_token_ : generic_string option)
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({
     accelerator_arn = accelerator_arn_;
     endpoint_group_arn = endpoint_group_arn_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_custom_routing_port_mappings_request)

let make_list_custom_routing_listeners_response
    ?listeners:(listeners_ : custom_routing_listeners option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ listeners = listeners_; next_token = next_token_ } : list_custom_routing_listeners_response)

let make_list_custom_routing_listeners_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : generic_string option)
    ~accelerator_arn:(accelerator_arn_ : generic_string) () =
  ({ accelerator_arn = accelerator_arn_; max_results = max_results_; next_token = next_token_ }
    : list_custom_routing_listeners_request)

let make_list_custom_routing_endpoint_groups_response
    ?endpoint_groups:(endpoint_groups_ : custom_routing_endpoint_groups option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ endpoint_groups = endpoint_groups_; next_token = next_token_ }
    : list_custom_routing_endpoint_groups_response)

let make_list_custom_routing_endpoint_groups_request
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : generic_string option) ~listener_arn:(listener_arn_ : generic_string)
    () =
  ({ listener_arn = listener_arn_; max_results = max_results_; next_token = next_token_ }
    : list_custom_routing_endpoint_groups_request)

let make_list_custom_routing_accelerators_response
    ?accelerators:(accelerators_ : custom_routing_accelerators option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ accelerators = accelerators_; next_token = next_token_ }
    : list_custom_routing_accelerators_response)

let make_list_custom_routing_accelerators_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ max_results = max_results_; next_token = next_token_ }
    : list_custom_routing_accelerators_request)

let make_list_cross_account_resources_response
    ?cross_account_resources:(cross_account_resources_ : cross_account_resources option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ cross_account_resources = cross_account_resources_; next_token = next_token_ }
    : list_cross_account_resources_response)

let make_list_cross_account_resources_request
    ?accelerator_arn:(accelerator_arn_ : generic_string option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : generic_string option)
    ~resource_owner_aws_account_id:(resource_owner_aws_account_id_ : aws_account_id) () =
  ({
     accelerator_arn = accelerator_arn_;
     resource_owner_aws_account_id = resource_owner_aws_account_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_cross_account_resources_request)

let make_list_cross_account_resource_accounts_response
    ?resource_owner_aws_account_ids:(resource_owner_aws_account_ids_ : aws_account_ids option) () =
  ({ resource_owner_aws_account_ids = resource_owner_aws_account_ids_ }
    : list_cross_account_resource_accounts_response)

let make_list_cross_account_resource_accounts_request () = (() : unit)

let make_list_cross_account_attachments_response
    ?cross_account_attachments:(cross_account_attachments_ : attachments option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ cross_account_attachments = cross_account_attachments_; next_token = next_token_ }
    : list_cross_account_attachments_response)

let make_list_cross_account_attachments_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ max_results = max_results_; next_token = next_token_ }
    : list_cross_account_attachments_request)

let make_list_byoip_cidrs_response ?byoip_cidrs:(byoip_cidrs_ : byoip_cidrs option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ byoip_cidrs = byoip_cidrs_; next_token = next_token_ } : list_byoip_cidrs_response)

let make_list_byoip_cidrs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_byoip_cidrs_request)

let make_list_accelerators_response ?accelerators:(accelerators_ : accelerators option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ accelerators = accelerators_; next_token = next_token_ } : list_accelerators_response)

let make_list_accelerators_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_accelerators_request)
