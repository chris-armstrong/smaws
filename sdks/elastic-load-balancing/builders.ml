open Types

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_key_only ?key:(key_ : tag_key option) () = ({ key = key_ } : tag_key_only)

let make_tag_description ?tags:(tags_ : tag_list option)
    ?load_balancer_name:(load_balancer_name_ : access_point_name option) () =
  ({ tags = tags_; load_balancer_name = load_balancer_name_ } : tag_description)

let make_source_security_group ?group_name:(group_name_ : security_group_name option)
    ?owner_alias:(owner_alias_ : security_group_owner_alias option) () =
  ({ group_name = group_name_; owner_alias = owner_alias_ } : source_security_group)

let make_set_load_balancer_policies_of_listener_output () = (() : unit)

let make_set_load_balancer_policies_of_listener_input ~policy_names:(policy_names_ : policy_names)
    ~load_balancer_port:(load_balancer_port_ : access_point_port)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({
     policy_names = policy_names_;
     load_balancer_port = load_balancer_port_;
     load_balancer_name = load_balancer_name_;
   }
    : set_load_balancer_policies_of_listener_input)

let make_set_load_balancer_policies_for_backend_server_output () = (() : unit)

let make_set_load_balancer_policies_for_backend_server_input
    ~policy_names:(policy_names_ : policy_names) ~instance_port:(instance_port_ : end_point_port)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({
     policy_names = policy_names_;
     instance_port = instance_port_;
     load_balancer_name = load_balancer_name_;
   }
    : set_load_balancer_policies_for_backend_server_input)

let make_set_load_balancer_listener_ssl_certificate_output () = (() : unit)

let make_set_load_balancer_listener_ssl_certificate_input
    ~ssl_certificate_id:(ssl_certificate_id_ : ssl_certificate_id)
    ~load_balancer_port:(load_balancer_port_ : access_point_port)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({
     ssl_certificate_id = ssl_certificate_id_;
     load_balancer_port = load_balancer_port_;
     load_balancer_name = load_balancer_name_;
   }
    : set_load_balancer_listener_ssl_certificate_input)

let make_remove_tags_output () = (() : unit)

let make_remove_tags_input ~tags:(tags_ : tag_key_list)
    ~load_balancer_names:(load_balancer_names_ : load_balancer_names) () =
  ({ tags = tags_; load_balancer_names = load_balancer_names_ } : remove_tags_input)

let make_remove_availability_zones_output
    ?availability_zones:(availability_zones_ : availability_zones option) () =
  ({ availability_zones = availability_zones_ } : remove_availability_zones_output)

let make_remove_availability_zones_input
    ~availability_zones:(availability_zones_ : availability_zones)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({ availability_zones = availability_zones_; load_balancer_name = load_balancer_name_ }
    : remove_availability_zones_input)

let make_instance ?instance_id:(instance_id_ : instance_id option) () =
  ({ instance_id = instance_id_ } : instance)

let make_register_end_points_output ?instances:(instances_ : instances option) () =
  ({ instances = instances_ } : register_end_points_output)

let make_register_end_points_input ~instances:(instances_ : instances)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({ instances = instances_; load_balancer_name = load_balancer_name_ } : register_end_points_input)

let make_policy_attribute_type_description ?cardinality:(cardinality_ : cardinality option)
    ?default_value:(default_value_ : default_value option)
    ?description:(description_ : description option)
    ?attribute_type:(attribute_type_ : attribute_type option)
    ?attribute_name:(attribute_name_ : attribute_name option) () =
  ({
     cardinality = cardinality_;
     default_value = default_value_;
     description = description_;
     attribute_type = attribute_type_;
     attribute_name = attribute_name_;
   }
    : policy_attribute_type_description)

let make_policy_type_description
    ?policy_attribute_type_descriptions:
      (policy_attribute_type_descriptions_ : policy_attribute_type_descriptions option)
    ?description:(description_ : description option)
    ?policy_type_name:(policy_type_name_ : policy_type_name option) () =
  ({
     policy_attribute_type_descriptions = policy_attribute_type_descriptions_;
     description = description_;
     policy_type_name = policy_type_name_;
   }
    : policy_type_description)

let make_policy_attribute_description ?attribute_value:(attribute_value_ : attribute_value option)
    ?attribute_name:(attribute_name_ : attribute_name option) () =
  ({ attribute_value = attribute_value_; attribute_name = attribute_name_ }
    : policy_attribute_description)

let make_policy_description
    ?policy_attribute_descriptions:
      (policy_attribute_descriptions_ : policy_attribute_descriptions option)
    ?policy_type_name:(policy_type_name_ : policy_type_name option)
    ?policy_name:(policy_name_ : policy_name option) () =
  ({
     policy_attribute_descriptions = policy_attribute_descriptions_;
     policy_type_name = policy_type_name_;
     policy_name = policy_name_;
   }
    : policy_description)

let make_policy_attribute ?attribute_value:(attribute_value_ : attribute_value option)
    ?attribute_name:(attribute_name_ : attribute_name option) () =
  ({ attribute_value = attribute_value_; attribute_name = attribute_name_ } : policy_attribute)

let make_app_cookie_stickiness_policy ?cookie_name:(cookie_name_ : cookie_name option)
    ?policy_name:(policy_name_ : policy_name option) () =
  ({ cookie_name = cookie_name_; policy_name = policy_name_ } : app_cookie_stickiness_policy)

let make_lb_cookie_stickiness_policy
    ?cookie_expiration_period:(cookie_expiration_period_ : cookie_expiration_period option)
    ?policy_name:(policy_name_ : policy_name option) () =
  ({ cookie_expiration_period = cookie_expiration_period_; policy_name = policy_name_ }
    : lb_cookie_stickiness_policy)

let make_policies ?other_policies:(other_policies_ : policy_names option)
    ?lb_cookie_stickiness_policies:
      (lb_cookie_stickiness_policies_ : lb_cookie_stickiness_policies option)
    ?app_cookie_stickiness_policies:
      (app_cookie_stickiness_policies_ : app_cookie_stickiness_policies option) () =
  ({
     other_policies = other_policies_;
     lb_cookie_stickiness_policies = lb_cookie_stickiness_policies_;
     app_cookie_stickiness_policies = app_cookie_stickiness_policies_;
   }
    : policies)

let make_cross_zone_load_balancing ~enabled:(enabled_ : cross_zone_load_balancing_enabled) () =
  ({ enabled = enabled_ } : cross_zone_load_balancing)

let make_access_log ?s3_bucket_prefix:(s3_bucket_prefix_ : access_log_prefix option)
    ?emit_interval:(emit_interval_ : access_log_interval option)
    ?s3_bucket_name:(s3_bucket_name_ : s3_bucket_name option)
    ~enabled:(enabled_ : access_log_enabled) () =
  ({
     s3_bucket_prefix = s3_bucket_prefix_;
     emit_interval = emit_interval_;
     s3_bucket_name = s3_bucket_name_;
     enabled = enabled_;
   }
    : access_log)

let make_connection_draining ?timeout:(timeout_ : connection_draining_timeout option)
    ~enabled:(enabled_ : connection_draining_enabled) () =
  ({ timeout = timeout_; enabled = enabled_ } : connection_draining)

let make_connection_settings ~idle_timeout:(idle_timeout_ : idle_timeout) () =
  ({ idle_timeout = idle_timeout_ } : connection_settings)

let make_additional_attribute ?value:(value_ : additional_attribute_value option)
    ?key:(key_ : additional_attribute_key option) () =
  ({ value = value_; key = key_ } : additional_attribute)

let make_load_balancer_attributes
    ?additional_attributes:(additional_attributes_ : additional_attributes option)
    ?connection_settings:(connection_settings_ : connection_settings option)
    ?connection_draining:(connection_draining_ : connection_draining option)
    ?access_log:(access_log_ : access_log option)
    ?cross_zone_load_balancing:(cross_zone_load_balancing_ : cross_zone_load_balancing option) () =
  ({
     additional_attributes = additional_attributes_;
     connection_settings = connection_settings_;
     connection_draining = connection_draining_;
     access_log = access_log_;
     cross_zone_load_balancing = cross_zone_load_balancing_;
   }
    : load_balancer_attributes)

let make_modify_load_balancer_attributes_output
    ?load_balancer_attributes:(load_balancer_attributes_ : load_balancer_attributes option)
    ?load_balancer_name:(load_balancer_name_ : access_point_name option) () =
  ({
     load_balancer_attributes = load_balancer_attributes_;
     load_balancer_name = load_balancer_name_;
   }
    : modify_load_balancer_attributes_output)

let make_modify_load_balancer_attributes_input
    ~load_balancer_attributes:(load_balancer_attributes_ : load_balancer_attributes)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({
     load_balancer_attributes = load_balancer_attributes_;
     load_balancer_name = load_balancer_name_;
   }
    : modify_load_balancer_attributes_input)

let make_listener ?ssl_certificate_id:(ssl_certificate_id_ : ssl_certificate_id option)
    ?instance_protocol:(instance_protocol_ : protocol option)
    ~instance_port:(instance_port_ : instance_port)
    ~load_balancer_port:(load_balancer_port_ : access_point_port) ~protocol:(protocol_ : protocol)
    () =
  ({
     ssl_certificate_id = ssl_certificate_id_;
     instance_port = instance_port_;
     instance_protocol = instance_protocol_;
     load_balancer_port = load_balancer_port_;
     protocol = protocol_;
   }
    : listener)

let make_listener_description ?policy_names:(policy_names_ : policy_names option)
    ?listener:(listener_ : listener option) () =
  ({ policy_names = policy_names_; listener = listener_ } : listener_description)

let make_backend_server_description ?policy_names:(policy_names_ : policy_names option)
    ?instance_port:(instance_port_ : instance_port option) () =
  ({ policy_names = policy_names_; instance_port = instance_port_ } : backend_server_description)

let make_health_check ~healthy_threshold:(healthy_threshold_ : healthy_threshold)
    ~unhealthy_threshold:(unhealthy_threshold_ : unhealthy_threshold)
    ~timeout:(timeout_ : health_check_timeout) ~interval:(interval_ : health_check_interval)
    ~target:(target_ : health_check_target) () =
  ({
     healthy_threshold = healthy_threshold_;
     unhealthy_threshold = unhealthy_threshold_;
     timeout = timeout_;
     interval = interval_;
     target = target_;
   }
    : health_check)

let make_load_balancer_description ?scheme:(scheme_ : load_balancer_scheme option)
    ?created_time:(created_time_ : created_time option)
    ?security_groups:(security_groups_ : security_groups option)
    ?source_security_group:(source_security_group_ : source_security_group option)
    ?health_check:(health_check_ : health_check option) ?instances:(instances_ : instances option)
    ?vpc_id:(vpc_id_ : vpc_id option) ?subnets:(subnets_ : subnets option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?backend_server_descriptions:(backend_server_descriptions_ : backend_server_descriptions option)
    ?policies:(policies_ : policies option)
    ?listener_descriptions:(listener_descriptions_ : listener_descriptions option)
    ?canonical_hosted_zone_name_i_d:(canonical_hosted_zone_name_i_d_ : dns_name option)
    ?canonical_hosted_zone_name:(canonical_hosted_zone_name_ : dns_name option)
    ?dns_name:(dns_name_ : dns_name option)
    ?load_balancer_name:(load_balancer_name_ : access_point_name option) () =
  ({
     scheme = scheme_;
     created_time = created_time_;
     security_groups = security_groups_;
     source_security_group = source_security_group_;
     health_check = health_check_;
     instances = instances_;
     vpc_id = vpc_id_;
     subnets = subnets_;
     availability_zones = availability_zones_;
     backend_server_descriptions = backend_server_descriptions_;
     policies = policies_;
     listener_descriptions = listener_descriptions_;
     canonical_hosted_zone_name_i_d = canonical_hosted_zone_name_i_d_;
     canonical_hosted_zone_name = canonical_hosted_zone_name_;
     dns_name = dns_name_;
     load_balancer_name = load_balancer_name_;
   }
    : load_balancer_description)

let make_limit ?max:(max_ : max option) ?name:(name_ : name option) () =
  ({ max = max_; name = name_ } : limit)

let make_instance_state ?description:(description_ : description option)
    ?reason_code:(reason_code_ : reason_code option) ?state:(state_ : state option)
    ?instance_id:(instance_id_ : instance_id option) () =
  ({
     description = description_;
     reason_code = reason_code_;
     state = state_;
     instance_id = instance_id_;
   }
    : instance_state)

let make_add_availability_zones_output
    ?availability_zones:(availability_zones_ : availability_zones option) () =
  ({ availability_zones = availability_zones_ } : add_availability_zones_output)

let make_add_availability_zones_input ~availability_zones:(availability_zones_ : availability_zones)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({ availability_zones = availability_zones_; load_balancer_name = load_balancer_name_ }
    : add_availability_zones_input)

let make_detach_load_balancer_from_subnets_output ?subnets:(subnets_ : subnets option) () =
  ({ subnets = subnets_ } : detach_load_balancer_from_subnets_output)

let make_detach_load_balancer_from_subnets_input ~subnets:(subnets_ : subnets)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({ subnets = subnets_; load_balancer_name = load_balancer_name_ }
    : detach_load_balancer_from_subnets_input)

let make_describe_tags_output ?tag_descriptions:(tag_descriptions_ : tag_descriptions option) () =
  ({ tag_descriptions = tag_descriptions_ } : describe_tags_output)

let make_describe_tags_input ~load_balancer_names:(load_balancer_names_ : load_balancer_names_max20)
    () =
  ({ load_balancer_names = load_balancer_names_ } : describe_tags_input)

let make_describe_access_points_output ?next_marker:(next_marker_ : marker option)
    ?load_balancer_descriptions:(load_balancer_descriptions_ : load_balancer_descriptions option) ()
    =
  ({ next_marker = next_marker_; load_balancer_descriptions = load_balancer_descriptions_ }
    : describe_access_points_output)

let make_describe_access_points_input ?page_size:(page_size_ : page_size option)
    ?marker:(marker_ : marker option)
    ?load_balancer_names:(load_balancer_names_ : load_balancer_names option) () =
  ({ page_size = page_size_; marker = marker_; load_balancer_names = load_balancer_names_ }
    : describe_access_points_input)

let make_describe_load_balancer_policy_types_output
    ?policy_type_descriptions:(policy_type_descriptions_ : policy_type_descriptions option) () =
  ({ policy_type_descriptions = policy_type_descriptions_ }
    : describe_load_balancer_policy_types_output)

let make_describe_load_balancer_policy_types_input
    ?policy_type_names:(policy_type_names_ : policy_type_names option) () =
  ({ policy_type_names = policy_type_names_ } : describe_load_balancer_policy_types_input)

let make_describe_load_balancer_policies_output
    ?policy_descriptions:(policy_descriptions_ : policy_descriptions option) () =
  ({ policy_descriptions = policy_descriptions_ } : describe_load_balancer_policies_output)

let make_describe_load_balancer_policies_input ?policy_names:(policy_names_ : policy_names option)
    ?load_balancer_name:(load_balancer_name_ : access_point_name option) () =
  ({ policy_names = policy_names_; load_balancer_name = load_balancer_name_ }
    : describe_load_balancer_policies_input)

let make_describe_load_balancer_attributes_output
    ?load_balancer_attributes:(load_balancer_attributes_ : load_balancer_attributes option) () =
  ({ load_balancer_attributes = load_balancer_attributes_ }
    : describe_load_balancer_attributes_output)

let make_describe_load_balancer_attributes_input
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({ load_balancer_name = load_balancer_name_ } : describe_load_balancer_attributes_input)

let make_describe_end_point_state_output
    ?instance_states:(instance_states_ : instance_states option) () =
  ({ instance_states = instance_states_ } : describe_end_point_state_output)

let make_describe_end_point_state_input ?instances:(instances_ : instances option)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({ instances = instances_; load_balancer_name = load_balancer_name_ }
    : describe_end_point_state_input)

let make_describe_account_limits_output ?next_marker:(next_marker_ : marker option)
    ?limits:(limits_ : limits option) () =
  ({ next_marker = next_marker_; limits = limits_ } : describe_account_limits_output)

let make_describe_account_limits_input ?page_size:(page_size_ : page_size option)
    ?marker:(marker_ : marker option) () =
  ({ page_size = page_size_; marker = marker_ } : describe_account_limits_input)

let make_deregister_end_points_output ?instances:(instances_ : instances option) () =
  ({ instances = instances_ } : deregister_end_points_output)

let make_deregister_end_points_input ~instances:(instances_ : instances)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({ instances = instances_; load_balancer_name = load_balancer_name_ }
    : deregister_end_points_input)

let make_delete_load_balancer_policy_output () = (() : unit)

let make_delete_load_balancer_policy_input ~policy_name:(policy_name_ : policy_name)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({ policy_name = policy_name_; load_balancer_name = load_balancer_name_ }
    : delete_load_balancer_policy_input)

let make_delete_load_balancer_listener_output () = (() : unit)

let make_delete_load_balancer_listener_input ~load_balancer_ports:(load_balancer_ports_ : ports)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({ load_balancer_ports = load_balancer_ports_; load_balancer_name = load_balancer_name_ }
    : delete_load_balancer_listener_input)

let make_delete_access_point_output () = (() : unit)

let make_delete_access_point_input ~load_balancer_name:(load_balancer_name_ : access_point_name) ()
    =
  ({ load_balancer_name = load_balancer_name_ } : delete_access_point_input)

let make_create_load_balancer_policy_output () = (() : unit)

let make_create_load_balancer_policy_input
    ?policy_attributes:(policy_attributes_ : policy_attributes option)
    ~policy_type_name:(policy_type_name_ : policy_type_name)
    ~policy_name:(policy_name_ : policy_name)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({
     policy_attributes = policy_attributes_;
     policy_type_name = policy_type_name_;
     policy_name = policy_name_;
     load_balancer_name = load_balancer_name_;
   }
    : create_load_balancer_policy_input)

let make_create_load_balancer_listener_output () = (() : unit)

let make_create_load_balancer_listener_input ~listeners:(listeners_ : listeners)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({ listeners = listeners_; load_balancer_name = load_balancer_name_ }
    : create_load_balancer_listener_input)

let make_create_access_point_output ?dns_name:(dns_name_ : dns_name option) () =
  ({ dns_name = dns_name_ } : create_access_point_output)

let make_create_access_point_input ?tags:(tags_ : tag_list option)
    ?scheme:(scheme_ : load_balancer_scheme option)
    ?security_groups:(security_groups_ : security_groups option)
    ?subnets:(subnets_ : subnets option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ~listeners:(listeners_ : listeners)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({
     tags = tags_;
     scheme = scheme_;
     security_groups = security_groups_;
     subnets = subnets_;
     availability_zones = availability_zones_;
     listeners = listeners_;
     load_balancer_name = load_balancer_name_;
   }
    : create_access_point_input)

let make_create_lb_cookie_stickiness_policy_output () = (() : unit)

let make_create_lb_cookie_stickiness_policy_input
    ?cookie_expiration_period:(cookie_expiration_period_ : cookie_expiration_period option)
    ~policy_name:(policy_name_ : policy_name)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({
     cookie_expiration_period = cookie_expiration_period_;
     policy_name = policy_name_;
     load_balancer_name = load_balancer_name_;
   }
    : create_lb_cookie_stickiness_policy_input)

let make_create_app_cookie_stickiness_policy_output () = (() : unit)

let make_create_app_cookie_stickiness_policy_input ~cookie_name:(cookie_name_ : cookie_name)
    ~policy_name:(policy_name_ : policy_name)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({
     cookie_name = cookie_name_;
     policy_name = policy_name_;
     load_balancer_name = load_balancer_name_;
   }
    : create_app_cookie_stickiness_policy_input)

let make_configure_health_check_output ?health_check:(health_check_ : health_check option) () =
  ({ health_check = health_check_ } : configure_health_check_output)

let make_configure_health_check_input ~health_check:(health_check_ : health_check)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({ health_check = health_check_; load_balancer_name = load_balancer_name_ }
    : configure_health_check_input)

let make_attach_load_balancer_to_subnets_output ?subnets:(subnets_ : subnets option) () =
  ({ subnets = subnets_ } : attach_load_balancer_to_subnets_output)

let make_attach_load_balancer_to_subnets_input ~subnets:(subnets_ : subnets)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({ subnets = subnets_; load_balancer_name = load_balancer_name_ }
    : attach_load_balancer_to_subnets_input)

let make_apply_security_groups_to_load_balancer_output
    ?security_groups:(security_groups_ : security_groups option) () =
  ({ security_groups = security_groups_ } : apply_security_groups_to_load_balancer_output)

let make_apply_security_groups_to_load_balancer_input
    ~security_groups:(security_groups_ : security_groups)
    ~load_balancer_name:(load_balancer_name_ : access_point_name) () =
  ({ security_groups = security_groups_; load_balancer_name = load_balancer_name_ }
    : apply_security_groups_to_load_balancer_input)

let make_add_tags_output () = (() : unit)

let make_add_tags_input ~tags:(tags_ : tag_list)
    ~load_balancer_names:(load_balancer_names_ : load_balancer_names) () =
  ({ tags = tags_; load_balancer_names = load_balancer_names_ } : add_tags_input)
