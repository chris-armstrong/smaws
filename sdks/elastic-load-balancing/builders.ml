open Types

let make_access_log ?s3_bucket_name:(s3_bucket_name_ : s3_bucket_name option)
    ?emit_interval:(emit_interval_ : access_log_interval option)
    ?s3_bucket_prefix:(s3_bucket_prefix_ : access_log_prefix option)
    ~enabled:(enabled_ : access_log_enabled) () =
  ({
     enabled = enabled_;
     s3_bucket_name = s3_bucket_name_;
     emit_interval = emit_interval_;
     s3_bucket_prefix = s3_bucket_prefix_;
   }
    : access_log)

let make_add_availability_zones_input ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~availability_zones:(availability_zones_ : availability_zones) () =
  ({ load_balancer_name = load_balancer_name_; availability_zones = availability_zones_ }
    : add_availability_zones_input)

let make_add_availability_zones_output
    ?availability_zones:(availability_zones_ : availability_zones option) () =
  ({ availability_zones = availability_zones_ } : add_availability_zones_output)

let make_add_tags_output () = (() : unit)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ key = key_; value = value_ } : tag)

let make_add_tags_input ~load_balancer_names:(load_balancer_names_ : load_balancer_names)
    ~tags:(tags_ : tag_list) () =
  ({ load_balancer_names = load_balancer_names_; tags = tags_ } : add_tags_input)

let make_additional_attribute ?key:(key_ : additional_attribute_key option)
    ?value:(value_ : additional_attribute_value option) () =
  ({ key = key_; value = value_ } : additional_attribute)

let make_app_cookie_stickiness_policy ?policy_name:(policy_name_ : policy_name option)
    ?cookie_name:(cookie_name_ : cookie_name option) () =
  ({ policy_name = policy_name_; cookie_name = cookie_name_ } : app_cookie_stickiness_policy)

let make_apply_security_groups_to_load_balancer_output
    ?security_groups:(security_groups_ : security_groups option) () =
  ({ security_groups = security_groups_ } : apply_security_groups_to_load_balancer_output)

let make_apply_security_groups_to_load_balancer_input
    ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~security_groups:(security_groups_ : security_groups) () =
  ({ load_balancer_name = load_balancer_name_; security_groups = security_groups_ }
    : apply_security_groups_to_load_balancer_input)

let make_attach_load_balancer_to_subnets_output ?subnets:(subnets_ : subnets option) () =
  ({ subnets = subnets_ } : attach_load_balancer_to_subnets_output)

let make_attach_load_balancer_to_subnets_input
    ~load_balancer_name:(load_balancer_name_ : access_point_name) ~subnets:(subnets_ : subnets) () =
  ({ load_balancer_name = load_balancer_name_; subnets = subnets_ }
    : attach_load_balancer_to_subnets_input)

let make_backend_server_description ?instance_port:(instance_port_ : instance_port option)
    ?policy_names:(policy_names_ : policy_names option) () =
  ({ instance_port = instance_port_; policy_names = policy_names_ } : backend_server_description)

let make_health_check ~target:(target_ : health_check_target)
    ~interval:(interval_ : health_check_interval) ~timeout:(timeout_ : health_check_timeout)
    ~unhealthy_threshold:(unhealthy_threshold_ : unhealthy_threshold)
    ~healthy_threshold:(healthy_threshold_ : healthy_threshold) () =
  ({
     target = target_;
     interval = interval_;
     timeout = timeout_;
     unhealthy_threshold = unhealthy_threshold_;
     healthy_threshold = healthy_threshold_;
   }
    : health_check)

let make_configure_health_check_output ?health_check:(health_check_ : health_check option) () =
  ({ health_check = health_check_ } : configure_health_check_output)

let make_configure_health_check_input ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~health_check:(health_check_ : health_check) () =
  ({ load_balancer_name = load_balancer_name_; health_check = health_check_ }
    : configure_health_check_input)

let make_connection_draining ?timeout:(timeout_ : connection_draining_timeout option)
    ~enabled:(enabled_ : connection_draining_enabled) () =
  ({ enabled = enabled_; timeout = timeout_ } : connection_draining)

let make_connection_settings ~idle_timeout:(idle_timeout_ : idle_timeout) () =
  ({ idle_timeout = idle_timeout_ } : connection_settings)

let make_listener ?instance_protocol:(instance_protocol_ : protocol option)
    ?ssl_certificate_id:(ssl_certificate_id_ : ssl_certificate_id option)
    ~protocol:(protocol_ : protocol) ~load_balancer_port:(load_balancer_port_ : access_point_port)
    ~instance_port:(instance_port_ : instance_port) () =
  ({
     protocol = protocol_;
     load_balancer_port = load_balancer_port_;
     instance_protocol = instance_protocol_;
     instance_port = instance_port_;
     ssl_certificate_id = ssl_certificate_id_;
   }
    : listener)

let make_create_access_point_input
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?subnets:(subnets_ : subnets option)
    ?security_groups:(security_groups_ : security_groups option)
    ?scheme:(scheme_ : load_balancer_scheme option) ?tags:(tags_ : tag_list option)
    ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~listeners:(listeners_ : listeners) () =
  ({
     load_balancer_name = load_balancer_name_;
     listeners = listeners_;
     availability_zones = availability_zones_;
     subnets = subnets_;
     security_groups = security_groups_;
     scheme = scheme_;
     tags = tags_;
   }
    : create_access_point_input)

let make_create_access_point_output ?dns_name:(dns_name_ : dns_name option) () =
  ({ dns_name = dns_name_ } : create_access_point_output)

let make_create_app_cookie_stickiness_policy_output () = (() : unit)

let make_create_app_cookie_stickiness_policy_input
    ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~policy_name:(policy_name_ : policy_name) ~cookie_name:(cookie_name_ : cookie_name) () =
  ({
     load_balancer_name = load_balancer_name_;
     policy_name = policy_name_;
     cookie_name = cookie_name_;
   }
    : create_app_cookie_stickiness_policy_input)

let make_create_lb_cookie_stickiness_policy_output () = (() : unit)

let make_create_lb_cookie_stickiness_policy_input
    ?cookie_expiration_period:(cookie_expiration_period_ : cookie_expiration_period option)
    ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~policy_name:(policy_name_ : policy_name) () =
  ({
     load_balancer_name = load_balancer_name_;
     policy_name = policy_name_;
     cookie_expiration_period = cookie_expiration_period_;
   }
    : create_lb_cookie_stickiness_policy_input)

let make_create_load_balancer_listener_input
    ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~listeners:(listeners_ : listeners) () =
  ({ load_balancer_name = load_balancer_name_; listeners = listeners_ }
    : create_load_balancer_listener_input)

let make_create_load_balancer_listener_output () = (() : unit)
let make_create_load_balancer_policy_output () = (() : unit)

let make_policy_attribute ?attribute_name:(attribute_name_ : attribute_name option)
    ?attribute_value:(attribute_value_ : attribute_value option) () =
  ({ attribute_name = attribute_name_; attribute_value = attribute_value_ } : policy_attribute)

let make_create_load_balancer_policy_input
    ?policy_attributes:(policy_attributes_ : policy_attributes option)
    ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~policy_name:(policy_name_ : policy_name)
    ~policy_type_name:(policy_type_name_ : policy_type_name) () =
  ({
     load_balancer_name = load_balancer_name_;
     policy_name = policy_name_;
     policy_type_name = policy_type_name_;
     policy_attributes = policy_attributes_;
   }
    : create_load_balancer_policy_input)

let make_cross_zone_load_balancing ~enabled:(enabled_ : cross_zone_load_balancing_enabled) () =
  ({ enabled = enabled_ } : cross_zone_load_balancing)

let make_delete_access_point_input ~load_balancer_name:(load_balancer_name_ : access_point_name) ()
    =
  ({ load_balancer_name = load_balancer_name_ } : delete_access_point_input)

let make_delete_access_point_output () = (() : unit)

let make_delete_load_balancer_listener_input
    ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~load_balancer_ports:(load_balancer_ports_ : ports) () =
  ({ load_balancer_name = load_balancer_name_; load_balancer_ports = load_balancer_ports_ }
    : delete_load_balancer_listener_input)

let make_delete_load_balancer_listener_output () = (() : unit)
let make_delete_load_balancer_policy_output () = (() : unit)

let make_delete_load_balancer_policy_input
    ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~policy_name:(policy_name_ : policy_name) () =
  ({ load_balancer_name = load_balancer_name_; policy_name = policy_name_ }
    : delete_load_balancer_policy_input)

let make_instance ?instance_id:(instance_id_ : instance_id option) () =
  ({ instance_id = instance_id_ } : instance)

let make_deregister_end_points_input ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~instances:(instances_ : instances) () =
  ({ load_balancer_name = load_balancer_name_; instances = instances_ }
    : deregister_end_points_input)

let make_deregister_end_points_output ?instances:(instances_ : instances option) () =
  ({ instances = instances_ } : deregister_end_points_output)

let make_describe_access_points_input
    ?load_balancer_names:(load_balancer_names_ : load_balancer_names option)
    ?marker:(marker_ : marker option) ?page_size:(page_size_ : page_size option) () =
  ({ load_balancer_names = load_balancer_names_; marker = marker_; page_size = page_size_ }
    : describe_access_points_input)

let make_source_security_group ?owner_alias:(owner_alias_ : security_group_owner_alias option)
    ?group_name:(group_name_ : security_group_name option) () =
  ({ owner_alias = owner_alias_; group_name = group_name_ } : source_security_group)

let make_lb_cookie_stickiness_policy ?policy_name:(policy_name_ : policy_name option)
    ?cookie_expiration_period:(cookie_expiration_period_ : cookie_expiration_period option) () =
  ({ policy_name = policy_name_; cookie_expiration_period = cookie_expiration_period_ }
    : lb_cookie_stickiness_policy)

let make_policies
    ?app_cookie_stickiness_policies:
      (app_cookie_stickiness_policies_ : app_cookie_stickiness_policies option)
    ?lb_cookie_stickiness_policies:
      (lb_cookie_stickiness_policies_ : lb_cookie_stickiness_policies option)
    ?other_policies:(other_policies_ : policy_names option) () =
  ({
     app_cookie_stickiness_policies = app_cookie_stickiness_policies_;
     lb_cookie_stickiness_policies = lb_cookie_stickiness_policies_;
     other_policies = other_policies_;
   }
    : policies)

let make_listener_description ?listener:(listener_ : listener option)
    ?policy_names:(policy_names_ : policy_names option) () =
  ({ listener = listener_; policy_names = policy_names_ } : listener_description)

let make_load_balancer_description
    ?load_balancer_name:(load_balancer_name_ : access_point_name option)
    ?dns_name:(dns_name_ : dns_name option)
    ?canonical_hosted_zone_name:(canonical_hosted_zone_name_ : dns_name option)
    ?canonical_hosted_zone_name_i_d:(canonical_hosted_zone_name_i_d_ : dns_name option)
    ?listener_descriptions:(listener_descriptions_ : listener_descriptions option)
    ?policies:(policies_ : policies option)
    ?backend_server_descriptions:(backend_server_descriptions_ : backend_server_descriptions option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?subnets:(subnets_ : subnets option) ?vpc_id:(vpc_id_ : vpc_id option)
    ?instances:(instances_ : instances option) ?health_check:(health_check_ : health_check option)
    ?source_security_group:(source_security_group_ : source_security_group option)
    ?security_groups:(security_groups_ : security_groups option)
    ?created_time:(created_time_ : created_time option)
    ?scheme:(scheme_ : load_balancer_scheme option) () =
  ({
     load_balancer_name = load_balancer_name_;
     dns_name = dns_name_;
     canonical_hosted_zone_name = canonical_hosted_zone_name_;
     canonical_hosted_zone_name_i_d = canonical_hosted_zone_name_i_d_;
     listener_descriptions = listener_descriptions_;
     policies = policies_;
     backend_server_descriptions = backend_server_descriptions_;
     availability_zones = availability_zones_;
     subnets = subnets_;
     vpc_id = vpc_id_;
     instances = instances_;
     health_check = health_check_;
     source_security_group = source_security_group_;
     security_groups = security_groups_;
     created_time = created_time_;
     scheme = scheme_;
   }
    : load_balancer_description)

let make_describe_access_points_output
    ?load_balancer_descriptions:(load_balancer_descriptions_ : load_balancer_descriptions option)
    ?next_marker:(next_marker_ : marker option) () =
  ({ load_balancer_descriptions = load_balancer_descriptions_; next_marker = next_marker_ }
    : describe_access_points_output)

let make_limit ?name:(name_ : name option) ?max:(max_ : max option) () =
  ({ name = name_; max = max_ } : limit)

let make_describe_account_limits_output ?limits:(limits_ : limits option)
    ?next_marker:(next_marker_ : marker option) () =
  ({ limits = limits_; next_marker = next_marker_ } : describe_account_limits_output)

let make_describe_account_limits_input ?marker:(marker_ : marker option)
    ?page_size:(page_size_ : page_size option) () =
  ({ marker = marker_; page_size = page_size_ } : describe_account_limits_input)

let make_describe_end_point_state_input ?instances:(instances_ : instances option)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({ load_balancer_name = load_balancer_name_; instances = instances_ }
    : describe_end_point_state_input)

let make_instance_state ?instance_id:(instance_id_ : instance_id option)
    ?state:(state_ : state option) ?reason_code:(reason_code_ : reason_code option)
    ?description:(description_ : description option) () =
  ({
     instance_id = instance_id_;
     state = state_;
     reason_code = reason_code_;
     description = description_;
   }
    : instance_state)

let make_describe_end_point_state_output
    ?instance_states:(instance_states_ : instance_states option) () =
  ({ instance_states = instance_states_ } : describe_end_point_state_output)

let make_load_balancer_attributes
    ?cross_zone_load_balancing:(cross_zone_load_balancing_ : cross_zone_load_balancing option)
    ?access_log:(access_log_ : access_log option)
    ?connection_draining:(connection_draining_ : connection_draining option)
    ?connection_settings:(connection_settings_ : connection_settings option)
    ?additional_attributes:(additional_attributes_ : additional_attributes option) () =
  ({
     cross_zone_load_balancing = cross_zone_load_balancing_;
     access_log = access_log_;
     connection_draining = connection_draining_;
     connection_settings = connection_settings_;
     additional_attributes = additional_attributes_;
   }
    : load_balancer_attributes)

let make_describe_load_balancer_attributes_output
    ?load_balancer_attributes:(load_balancer_attributes_ : load_balancer_attributes option) () =
  ({ load_balancer_attributes = load_balancer_attributes_ }
    : describe_load_balancer_attributes_output)

let make_describe_load_balancer_attributes_input
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({ load_balancer_name = load_balancer_name_ } : describe_load_balancer_attributes_input)

let make_policy_attribute_description ?attribute_name:(attribute_name_ : attribute_name option)
    ?attribute_value:(attribute_value_ : attribute_value option) () =
  ({ attribute_name = attribute_name_; attribute_value = attribute_value_ }
    : policy_attribute_description)

let make_policy_description ?policy_name:(policy_name_ : policy_name option)
    ?policy_type_name:(policy_type_name_ : policy_type_name option)
    ?policy_attribute_descriptions:
      (policy_attribute_descriptions_ : policy_attribute_descriptions option) () =
  ({
     policy_name = policy_name_;
     policy_type_name = policy_type_name_;
     policy_attribute_descriptions = policy_attribute_descriptions_;
   }
    : policy_description)

let make_describe_load_balancer_policies_output
    ?policy_descriptions:(policy_descriptions_ : policy_descriptions option) () =
  ({ policy_descriptions = policy_descriptions_ } : describe_load_balancer_policies_output)

let make_describe_load_balancer_policies_input
    ?load_balancer_name:(load_balancer_name_ : access_point_name option)
    ?policy_names:(policy_names_ : policy_names option) () =
  ({ load_balancer_name = load_balancer_name_; policy_names = policy_names_ }
    : describe_load_balancer_policies_input)

let make_policy_attribute_type_description ?attribute_name:(attribute_name_ : attribute_name option)
    ?attribute_type:(attribute_type_ : attribute_type option)
    ?description:(description_ : description option)
    ?default_value:(default_value_ : default_value option)
    ?cardinality:(cardinality_ : cardinality option) () =
  ({
     attribute_name = attribute_name_;
     attribute_type = attribute_type_;
     description = description_;
     default_value = default_value_;
     cardinality = cardinality_;
   }
    : policy_attribute_type_description)

let make_policy_type_description ?policy_type_name:(policy_type_name_ : policy_type_name option)
    ?description:(description_ : description option)
    ?policy_attribute_type_descriptions:
      (policy_attribute_type_descriptions_ : policy_attribute_type_descriptions option) () =
  ({
     policy_type_name = policy_type_name_;
     description = description_;
     policy_attribute_type_descriptions = policy_attribute_type_descriptions_;
   }
    : policy_type_description)

let make_describe_load_balancer_policy_types_output
    ?policy_type_descriptions:(policy_type_descriptions_ : policy_type_descriptions option) () =
  ({ policy_type_descriptions = policy_type_descriptions_ }
    : describe_load_balancer_policy_types_output)

let make_describe_load_balancer_policy_types_input
    ?policy_type_names:(policy_type_names_ : policy_type_names option) () =
  ({ policy_type_names = policy_type_names_ } : describe_load_balancer_policy_types_input)

let make_tag_description ?load_balancer_name:(load_balancer_name_ : access_point_name option)
    ?tags:(tags_ : tag_list option) () =
  ({ load_balancer_name = load_balancer_name_; tags = tags_ } : tag_description)

let make_describe_tags_output ?tag_descriptions:(tag_descriptions_ : tag_descriptions option) () =
  ({ tag_descriptions = tag_descriptions_ } : describe_tags_output)

let make_describe_tags_input ~load_balancer_names:(load_balancer_names_ : load_balancer_names_max20)
    () =
  ({ load_balancer_names = load_balancer_names_ } : describe_tags_input)

let make_detach_load_balancer_from_subnets_output ?subnets:(subnets_ : subnets option) () =
  ({ subnets = subnets_ } : detach_load_balancer_from_subnets_output)

let make_detach_load_balancer_from_subnets_input
    ~load_balancer_name:(load_balancer_name_ : access_point_name) ~subnets:(subnets_ : subnets) () =
  ({ load_balancer_name = load_balancer_name_; subnets = subnets_ }
    : detach_load_balancer_from_subnets_input)

let make_remove_availability_zones_output
    ?availability_zones:(availability_zones_ : availability_zones option) () =
  ({ availability_zones = availability_zones_ } : remove_availability_zones_output)

let make_remove_availability_zones_input
    ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~availability_zones:(availability_zones_ : availability_zones) () =
  ({ load_balancer_name = load_balancer_name_; availability_zones = availability_zones_ }
    : remove_availability_zones_input)

let make_set_load_balancer_policies_of_listener_output () = (() : unit)

let make_set_load_balancer_policies_of_listener_input
    ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~load_balancer_port:(load_balancer_port_ : access_point_port)
    ~policy_names:(policy_names_ : policy_names) () =
  ({
     load_balancer_name = load_balancer_name_;
     load_balancer_port = load_balancer_port_;
     policy_names = policy_names_;
   }
    : set_load_balancer_policies_of_listener_input)

let make_set_load_balancer_policies_for_backend_server_output () = (() : unit)

let make_set_load_balancer_policies_for_backend_server_input
    ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~instance_port:(instance_port_ : end_point_port) ~policy_names:(policy_names_ : policy_names) ()
    =
  ({
     load_balancer_name = load_balancer_name_;
     instance_port = instance_port_;
     policy_names = policy_names_;
   }
    : set_load_balancer_policies_for_backend_server_input)

let make_set_load_balancer_listener_ssl_certificate_output () = (() : unit)

let make_set_load_balancer_listener_ssl_certificate_input
    ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~load_balancer_port:(load_balancer_port_ : access_point_port)
    ~ssl_certificate_id:(ssl_certificate_id_ : ssl_certificate_id) () =
  ({
     load_balancer_name = load_balancer_name_;
     load_balancer_port = load_balancer_port_;
     ssl_certificate_id = ssl_certificate_id_;
   }
    : set_load_balancer_listener_ssl_certificate_input)

let make_remove_tags_output () = (() : unit)
let make_tag_key_only ?key:(key_ : tag_key option) () = ({ key = key_ } : tag_key_only)

let make_remove_tags_input ~load_balancer_names:(load_balancer_names_ : load_balancer_names)
    ~tags:(tags_ : tag_key_list) () =
  ({ load_balancer_names = load_balancer_names_; tags = tags_ } : remove_tags_input)

let make_register_end_points_output ?instances:(instances_ : instances option) () =
  ({ instances = instances_ } : register_end_points_output)

let make_register_end_points_input ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~instances:(instances_ : instances) () =
  ({ load_balancer_name = load_balancer_name_; instances = instances_ } : register_end_points_input)

let make_modify_load_balancer_attributes_output
    ?load_balancer_name:(load_balancer_name_ : access_point_name option)
    ?load_balancer_attributes:(load_balancer_attributes_ : load_balancer_attributes option) () =
  ({
     load_balancer_name = load_balancer_name_;
     load_balancer_attributes = load_balancer_attributes_;
   }
    : modify_load_balancer_attributes_output)

let make_modify_load_balancer_attributes_input
    ~load_balancer_name:(load_balancer_name_ : access_point_name)
    ~load_balancer_attributes:(load_balancer_attributes_ : load_balancer_attributes) () =
  ({
     load_balancer_name = load_balancer_name_;
     load_balancer_attributes = load_balancer_attributes_;
   }
    : modify_load_balancer_attributes_input)
