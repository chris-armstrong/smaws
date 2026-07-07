open Types

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag
val make_tag_key_only : ?key:tag_key -> unit -> tag_key_only

val make_tag_description :
  ?tags:tag_list -> ?load_balancer_name:access_point_name -> unit -> tag_description

val make_source_security_group :
  ?group_name:security_group_name ->
  ?owner_alias:security_group_owner_alias ->
  unit ->
  source_security_group

val make_set_load_balancer_policies_of_listener_output : unit -> unit

val make_set_load_balancer_policies_of_listener_input :
  policy_names:policy_names ->
  load_balancer_port:access_point_port ->
  load_balancer_name:access_point_name ->
  unit ->
  set_load_balancer_policies_of_listener_input

val make_set_load_balancer_policies_for_backend_server_output : unit -> unit

val make_set_load_balancer_policies_for_backend_server_input :
  policy_names:policy_names ->
  instance_port:end_point_port ->
  load_balancer_name:access_point_name ->
  unit ->
  set_load_balancer_policies_for_backend_server_input

val make_set_load_balancer_listener_ssl_certificate_output : unit -> unit

val make_set_load_balancer_listener_ssl_certificate_input :
  ssl_certificate_id:ssl_certificate_id ->
  load_balancer_port:access_point_port ->
  load_balancer_name:access_point_name ->
  unit ->
  set_load_balancer_listener_ssl_certificate_input

val make_remove_tags_output : unit -> unit

val make_remove_tags_input :
  tags:tag_key_list -> load_balancer_names:load_balancer_names -> unit -> remove_tags_input

val make_remove_availability_zones_output :
  ?availability_zones:availability_zones -> unit -> remove_availability_zones_output

val make_remove_availability_zones_input :
  availability_zones:availability_zones ->
  load_balancer_name:access_point_name ->
  unit ->
  remove_availability_zones_input

val make_instance : ?instance_id:instance_id -> unit -> instance
val make_register_end_points_output : ?instances:instances -> unit -> register_end_points_output

val make_register_end_points_input :
  instances:instances -> load_balancer_name:access_point_name -> unit -> register_end_points_input

val make_policy_attribute_type_description :
  ?cardinality:cardinality ->
  ?default_value:default_value ->
  ?description:description ->
  ?attribute_type:attribute_type ->
  ?attribute_name:attribute_name ->
  unit ->
  policy_attribute_type_description

val make_policy_type_description :
  ?policy_attribute_type_descriptions:policy_attribute_type_descriptions ->
  ?description:description ->
  ?policy_type_name:policy_type_name ->
  unit ->
  policy_type_description

val make_policy_attribute_description :
  ?attribute_value:attribute_value ->
  ?attribute_name:attribute_name ->
  unit ->
  policy_attribute_description

val make_policy_description :
  ?policy_attribute_descriptions:policy_attribute_descriptions ->
  ?policy_type_name:policy_type_name ->
  ?policy_name:policy_name ->
  unit ->
  policy_description

val make_policy_attribute :
  ?attribute_value:attribute_value -> ?attribute_name:attribute_name -> unit -> policy_attribute

val make_app_cookie_stickiness_policy :
  ?cookie_name:cookie_name -> ?policy_name:policy_name -> unit -> app_cookie_stickiness_policy

val make_lb_cookie_stickiness_policy :
  ?cookie_expiration_period:cookie_expiration_period ->
  ?policy_name:policy_name ->
  unit ->
  lb_cookie_stickiness_policy

val make_policies :
  ?other_policies:policy_names ->
  ?lb_cookie_stickiness_policies:lb_cookie_stickiness_policies ->
  ?app_cookie_stickiness_policies:app_cookie_stickiness_policies ->
  unit ->
  policies

val make_cross_zone_load_balancing :
  enabled:cross_zone_load_balancing_enabled -> unit -> cross_zone_load_balancing

val make_access_log :
  ?s3_bucket_prefix:access_log_prefix ->
  ?emit_interval:access_log_interval ->
  ?s3_bucket_name:s3_bucket_name ->
  enabled:access_log_enabled ->
  unit ->
  access_log

val make_connection_draining :
  ?timeout:connection_draining_timeout ->
  enabled:connection_draining_enabled ->
  unit ->
  connection_draining

val make_connection_settings : idle_timeout:idle_timeout -> unit -> connection_settings

val make_additional_attribute :
  ?value:additional_attribute_value -> ?key:additional_attribute_key -> unit -> additional_attribute

val make_load_balancer_attributes :
  ?additional_attributes:additional_attributes ->
  ?connection_settings:connection_settings ->
  ?connection_draining:connection_draining ->
  ?access_log:access_log ->
  ?cross_zone_load_balancing:cross_zone_load_balancing ->
  unit ->
  load_balancer_attributes

val make_modify_load_balancer_attributes_output :
  ?load_balancer_attributes:load_balancer_attributes ->
  ?load_balancer_name:access_point_name ->
  unit ->
  modify_load_balancer_attributes_output

val make_modify_load_balancer_attributes_input :
  load_balancer_attributes:load_balancer_attributes ->
  load_balancer_name:access_point_name ->
  unit ->
  modify_load_balancer_attributes_input

val make_listener :
  ?ssl_certificate_id:ssl_certificate_id ->
  ?instance_protocol:protocol ->
  instance_port:instance_port ->
  load_balancer_port:access_point_port ->
  protocol:protocol ->
  unit ->
  listener

val make_listener_description :
  ?policy_names:policy_names -> ?listener:listener -> unit -> listener_description

val make_backend_server_description :
  ?policy_names:policy_names -> ?instance_port:instance_port -> unit -> backend_server_description

val make_health_check :
  healthy_threshold:healthy_threshold ->
  unhealthy_threshold:unhealthy_threshold ->
  timeout:health_check_timeout ->
  interval:health_check_interval ->
  target:health_check_target ->
  unit ->
  health_check

val make_load_balancer_description :
  ?scheme:load_balancer_scheme ->
  ?created_time:created_time ->
  ?security_groups:security_groups ->
  ?source_security_group:source_security_group ->
  ?health_check:health_check ->
  ?instances:instances ->
  ?vpc_id:vpc_id ->
  ?subnets:subnets ->
  ?availability_zones:availability_zones ->
  ?backend_server_descriptions:backend_server_descriptions ->
  ?policies:policies ->
  ?listener_descriptions:listener_descriptions ->
  ?canonical_hosted_zone_name_i_d:dns_name ->
  ?canonical_hosted_zone_name:dns_name ->
  ?dns_name:dns_name ->
  ?load_balancer_name:access_point_name ->
  unit ->
  load_balancer_description

val make_limit : ?max:max -> ?name:name -> unit -> limit

val make_instance_state :
  ?description:description ->
  ?reason_code:reason_code ->
  ?state:state ->
  ?instance_id:instance_id ->
  unit ->
  instance_state

val make_add_availability_zones_output :
  ?availability_zones:availability_zones -> unit -> add_availability_zones_output

val make_add_availability_zones_input :
  availability_zones:availability_zones ->
  load_balancer_name:access_point_name ->
  unit ->
  add_availability_zones_input

val make_detach_load_balancer_from_subnets_output :
  ?subnets:subnets -> unit -> detach_load_balancer_from_subnets_output

val make_detach_load_balancer_from_subnets_input :
  subnets:subnets ->
  load_balancer_name:access_point_name ->
  unit ->
  detach_load_balancer_from_subnets_input

val make_describe_tags_output : ?tag_descriptions:tag_descriptions -> unit -> describe_tags_output

val make_describe_tags_input :
  load_balancer_names:load_balancer_names_max20 -> unit -> describe_tags_input

val make_describe_access_points_output :
  ?next_marker:marker ->
  ?load_balancer_descriptions:load_balancer_descriptions ->
  unit ->
  describe_access_points_output

val make_describe_access_points_input :
  ?page_size:page_size ->
  ?marker:marker ->
  ?load_balancer_names:load_balancer_names ->
  unit ->
  describe_access_points_input

val make_describe_load_balancer_policy_types_output :
  ?policy_type_descriptions:policy_type_descriptions ->
  unit ->
  describe_load_balancer_policy_types_output

val make_describe_load_balancer_policy_types_input :
  ?policy_type_names:policy_type_names -> unit -> describe_load_balancer_policy_types_input

val make_describe_load_balancer_policies_output :
  ?policy_descriptions:policy_descriptions -> unit -> describe_load_balancer_policies_output

val make_describe_load_balancer_policies_input :
  ?policy_names:policy_names ->
  ?load_balancer_name:access_point_name ->
  unit ->
  describe_load_balancer_policies_input

val make_describe_load_balancer_attributes_output :
  ?load_balancer_attributes:load_balancer_attributes ->
  unit ->
  describe_load_balancer_attributes_output

val make_describe_load_balancer_attributes_input :
  load_balancer_name:access_point_name -> unit -> describe_load_balancer_attributes_input

val make_describe_end_point_state_output :
  ?instance_states:instance_states -> unit -> describe_end_point_state_output

val make_describe_end_point_state_input :
  ?instances:instances ->
  load_balancer_name:access_point_name ->
  unit ->
  describe_end_point_state_input

val make_describe_account_limits_output :
  ?next_marker:marker -> ?limits:limits -> unit -> describe_account_limits_output

val make_describe_account_limits_input :
  ?page_size:page_size -> ?marker:marker -> unit -> describe_account_limits_input

val make_deregister_end_points_output : ?instances:instances -> unit -> deregister_end_points_output

val make_deregister_end_points_input :
  instances:instances -> load_balancer_name:access_point_name -> unit -> deregister_end_points_input

val make_delete_load_balancer_policy_output : unit -> unit

val make_delete_load_balancer_policy_input :
  policy_name:policy_name ->
  load_balancer_name:access_point_name ->
  unit ->
  delete_load_balancer_policy_input

val make_delete_load_balancer_listener_output : unit -> unit

val make_delete_load_balancer_listener_input :
  load_balancer_ports:ports ->
  load_balancer_name:access_point_name ->
  unit ->
  delete_load_balancer_listener_input

val make_delete_access_point_output : unit -> unit

val make_delete_access_point_input :
  load_balancer_name:access_point_name -> unit -> delete_access_point_input

val make_create_load_balancer_policy_output : unit -> unit

val make_create_load_balancer_policy_input :
  ?policy_attributes:policy_attributes ->
  policy_type_name:policy_type_name ->
  policy_name:policy_name ->
  load_balancer_name:access_point_name ->
  unit ->
  create_load_balancer_policy_input

val make_create_load_balancer_listener_output : unit -> unit

val make_create_load_balancer_listener_input :
  listeners:listeners ->
  load_balancer_name:access_point_name ->
  unit ->
  create_load_balancer_listener_input

val make_create_access_point_output : ?dns_name:dns_name -> unit -> create_access_point_output

val make_create_access_point_input :
  ?tags:tag_list ->
  ?scheme:load_balancer_scheme ->
  ?security_groups:security_groups ->
  ?subnets:subnets ->
  ?availability_zones:availability_zones ->
  listeners:listeners ->
  load_balancer_name:access_point_name ->
  unit ->
  create_access_point_input

val make_create_lb_cookie_stickiness_policy_output : unit -> unit

val make_create_lb_cookie_stickiness_policy_input :
  ?cookie_expiration_period:cookie_expiration_period ->
  policy_name:policy_name ->
  load_balancer_name:access_point_name ->
  unit ->
  create_lb_cookie_stickiness_policy_input

val make_create_app_cookie_stickiness_policy_output : unit -> unit

val make_create_app_cookie_stickiness_policy_input :
  cookie_name:cookie_name ->
  policy_name:policy_name ->
  load_balancer_name:access_point_name ->
  unit ->
  create_app_cookie_stickiness_policy_input

val make_configure_health_check_output :
  ?health_check:health_check -> unit -> configure_health_check_output

val make_configure_health_check_input :
  health_check:health_check ->
  load_balancer_name:access_point_name ->
  unit ->
  configure_health_check_input

val make_attach_load_balancer_to_subnets_output :
  ?subnets:subnets -> unit -> attach_load_balancer_to_subnets_output

val make_attach_load_balancer_to_subnets_input :
  subnets:subnets ->
  load_balancer_name:access_point_name ->
  unit ->
  attach_load_balancer_to_subnets_input

val make_apply_security_groups_to_load_balancer_output :
  ?security_groups:security_groups -> unit -> apply_security_groups_to_load_balancer_output

val make_apply_security_groups_to_load_balancer_input :
  security_groups:security_groups ->
  load_balancer_name:access_point_name ->
  unit ->
  apply_security_groups_to_load_balancer_input

val make_add_tags_output : unit -> unit

val make_add_tags_input :
  tags:tag_list -> load_balancer_names:load_balancer_names -> unit -> add_tags_input
