open Types

val make_access_log :
  ?s3_bucket_name:s3_bucket_name ->
  ?emit_interval:access_log_interval ->
  ?s3_bucket_prefix:access_log_prefix ->
  enabled:access_log_enabled ->
  unit ->
  access_log

val make_add_availability_zones_input :
  load_balancer_name:access_point_name ->
  availability_zones:availability_zones ->
  unit ->
  add_availability_zones_input

val make_add_availability_zones_output :
  ?availability_zones:availability_zones -> unit -> add_availability_zones_output

val make_add_tags_output : unit -> unit
val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_add_tags_input :
  load_balancer_names:load_balancer_names -> tags:tag_list -> unit -> add_tags_input

val make_additional_attribute :
  ?key:additional_attribute_key -> ?value:additional_attribute_value -> unit -> additional_attribute

val make_app_cookie_stickiness_policy :
  ?policy_name:policy_name -> ?cookie_name:cookie_name -> unit -> app_cookie_stickiness_policy

val make_apply_security_groups_to_load_balancer_output :
  ?security_groups:security_groups -> unit -> apply_security_groups_to_load_balancer_output

val make_apply_security_groups_to_load_balancer_input :
  load_balancer_name:access_point_name ->
  security_groups:security_groups ->
  unit ->
  apply_security_groups_to_load_balancer_input

val make_attach_load_balancer_to_subnets_output :
  ?subnets:subnets -> unit -> attach_load_balancer_to_subnets_output

val make_attach_load_balancer_to_subnets_input :
  load_balancer_name:access_point_name ->
  subnets:subnets ->
  unit ->
  attach_load_balancer_to_subnets_input

val make_backend_server_description :
  ?instance_port:instance_port -> ?policy_names:policy_names -> unit -> backend_server_description

val make_health_check :
  target:health_check_target ->
  interval:health_check_interval ->
  timeout:health_check_timeout ->
  unhealthy_threshold:unhealthy_threshold ->
  healthy_threshold:healthy_threshold ->
  unit ->
  health_check

val make_configure_health_check_output :
  ?health_check:health_check -> unit -> configure_health_check_output

val make_configure_health_check_input :
  load_balancer_name:access_point_name ->
  health_check:health_check ->
  unit ->
  configure_health_check_input

val make_connection_draining :
  ?timeout:connection_draining_timeout ->
  enabled:connection_draining_enabled ->
  unit ->
  connection_draining

val make_connection_settings : idle_timeout:idle_timeout -> unit -> connection_settings

val make_listener :
  ?instance_protocol:protocol ->
  ?ssl_certificate_id:ssl_certificate_id ->
  protocol:protocol ->
  load_balancer_port:access_point_port ->
  instance_port:instance_port ->
  unit ->
  listener

val make_create_access_point_input :
  ?availability_zones:availability_zones ->
  ?subnets:subnets ->
  ?security_groups:security_groups ->
  ?scheme:load_balancer_scheme ->
  ?tags:tag_list ->
  load_balancer_name:access_point_name ->
  listeners:listeners ->
  unit ->
  create_access_point_input

val make_create_access_point_output : ?dns_name:dns_name -> unit -> create_access_point_output
val make_create_app_cookie_stickiness_policy_output : unit -> unit

val make_create_app_cookie_stickiness_policy_input :
  load_balancer_name:access_point_name ->
  policy_name:policy_name ->
  cookie_name:cookie_name ->
  unit ->
  create_app_cookie_stickiness_policy_input

val make_create_lb_cookie_stickiness_policy_output : unit -> unit

val make_create_lb_cookie_stickiness_policy_input :
  ?cookie_expiration_period:cookie_expiration_period ->
  load_balancer_name:access_point_name ->
  policy_name:policy_name ->
  unit ->
  create_lb_cookie_stickiness_policy_input

val make_create_load_balancer_listener_input :
  load_balancer_name:access_point_name ->
  listeners:listeners ->
  unit ->
  create_load_balancer_listener_input

val make_create_load_balancer_listener_output : unit -> unit
val make_create_load_balancer_policy_output : unit -> unit

val make_policy_attribute :
  ?attribute_name:attribute_name -> ?attribute_value:attribute_value -> unit -> policy_attribute

val make_create_load_balancer_policy_input :
  ?policy_attributes:policy_attributes ->
  load_balancer_name:access_point_name ->
  policy_name:policy_name ->
  policy_type_name:policy_type_name ->
  unit ->
  create_load_balancer_policy_input

val make_cross_zone_load_balancing :
  enabled:cross_zone_load_balancing_enabled -> unit -> cross_zone_load_balancing

val make_delete_access_point_input :
  load_balancer_name:access_point_name -> unit -> delete_access_point_input

val make_delete_access_point_output : unit -> unit

val make_delete_load_balancer_listener_input :
  load_balancer_name:access_point_name ->
  load_balancer_ports:ports ->
  unit ->
  delete_load_balancer_listener_input

val make_delete_load_balancer_listener_output : unit -> unit
val make_delete_load_balancer_policy_output : unit -> unit

val make_delete_load_balancer_policy_input :
  load_balancer_name:access_point_name ->
  policy_name:policy_name ->
  unit ->
  delete_load_balancer_policy_input

val make_instance : ?instance_id:instance_id -> unit -> instance

val make_deregister_end_points_input :
  load_balancer_name:access_point_name -> instances:instances -> unit -> deregister_end_points_input

val make_deregister_end_points_output : ?instances:instances -> unit -> deregister_end_points_output

val make_describe_access_points_input :
  ?load_balancer_names:load_balancer_names ->
  ?marker:marker ->
  ?page_size:page_size ->
  unit ->
  describe_access_points_input

val make_source_security_group :
  ?owner_alias:security_group_owner_alias ->
  ?group_name:security_group_name ->
  unit ->
  source_security_group

val make_lb_cookie_stickiness_policy :
  ?policy_name:policy_name ->
  ?cookie_expiration_period:cookie_expiration_period ->
  unit ->
  lb_cookie_stickiness_policy

val make_policies :
  ?app_cookie_stickiness_policies:app_cookie_stickiness_policies ->
  ?lb_cookie_stickiness_policies:lb_cookie_stickiness_policies ->
  ?other_policies:policy_names ->
  unit ->
  policies

val make_listener_description :
  ?listener:listener -> ?policy_names:policy_names -> unit -> listener_description

val make_load_balancer_description :
  ?load_balancer_name:access_point_name ->
  ?dns_name:dns_name ->
  ?canonical_hosted_zone_name:dns_name ->
  ?canonical_hosted_zone_name_i_d:dns_name ->
  ?listener_descriptions:listener_descriptions ->
  ?policies:policies ->
  ?backend_server_descriptions:backend_server_descriptions ->
  ?availability_zones:availability_zones ->
  ?subnets:subnets ->
  ?vpc_id:vpc_id ->
  ?instances:instances ->
  ?health_check:health_check ->
  ?source_security_group:source_security_group ->
  ?security_groups:security_groups ->
  ?created_time:created_time ->
  ?scheme:load_balancer_scheme ->
  unit ->
  load_balancer_description

val make_describe_access_points_output :
  ?load_balancer_descriptions:load_balancer_descriptions ->
  ?next_marker:marker ->
  unit ->
  describe_access_points_output

val make_limit : ?name:name -> ?max:max -> unit -> limit

val make_describe_account_limits_output :
  ?limits:limits -> ?next_marker:marker -> unit -> describe_account_limits_output

val make_describe_account_limits_input :
  ?marker:marker -> ?page_size:page_size -> unit -> describe_account_limits_input

val make_describe_end_point_state_input :
  ?instances:instances ->
  load_balancer_name:access_point_name ->
  unit ->
  describe_end_point_state_input

val make_instance_state :
  ?instance_id:instance_id ->
  ?state:state ->
  ?reason_code:reason_code ->
  ?description:description ->
  unit ->
  instance_state

val make_describe_end_point_state_output :
  ?instance_states:instance_states -> unit -> describe_end_point_state_output

val make_load_balancer_attributes :
  ?cross_zone_load_balancing:cross_zone_load_balancing ->
  ?access_log:access_log ->
  ?connection_draining:connection_draining ->
  ?connection_settings:connection_settings ->
  ?additional_attributes:additional_attributes ->
  unit ->
  load_balancer_attributes

val make_describe_load_balancer_attributes_output :
  ?load_balancer_attributes:load_balancer_attributes ->
  unit ->
  describe_load_balancer_attributes_output

val make_describe_load_balancer_attributes_input :
  load_balancer_name:access_point_name -> unit -> describe_load_balancer_attributes_input

val make_policy_attribute_description :
  ?attribute_name:attribute_name ->
  ?attribute_value:attribute_value ->
  unit ->
  policy_attribute_description

val make_policy_description :
  ?policy_name:policy_name ->
  ?policy_type_name:policy_type_name ->
  ?policy_attribute_descriptions:policy_attribute_descriptions ->
  unit ->
  policy_description

val make_describe_load_balancer_policies_output :
  ?policy_descriptions:policy_descriptions -> unit -> describe_load_balancer_policies_output

val make_describe_load_balancer_policies_input :
  ?load_balancer_name:access_point_name ->
  ?policy_names:policy_names ->
  unit ->
  describe_load_balancer_policies_input

val make_policy_attribute_type_description :
  ?attribute_name:attribute_name ->
  ?attribute_type:attribute_type ->
  ?description:description ->
  ?default_value:default_value ->
  ?cardinality:cardinality ->
  unit ->
  policy_attribute_type_description

val make_policy_type_description :
  ?policy_type_name:policy_type_name ->
  ?description:description ->
  ?policy_attribute_type_descriptions:policy_attribute_type_descriptions ->
  unit ->
  policy_type_description

val make_describe_load_balancer_policy_types_output :
  ?policy_type_descriptions:policy_type_descriptions ->
  unit ->
  describe_load_balancer_policy_types_output

val make_describe_load_balancer_policy_types_input :
  ?policy_type_names:policy_type_names -> unit -> describe_load_balancer_policy_types_input

val make_tag_description :
  ?load_balancer_name:access_point_name -> ?tags:tag_list -> unit -> tag_description

val make_describe_tags_output : ?tag_descriptions:tag_descriptions -> unit -> describe_tags_output

val make_describe_tags_input :
  load_balancer_names:load_balancer_names_max20 -> unit -> describe_tags_input

val make_detach_load_balancer_from_subnets_output :
  ?subnets:subnets -> unit -> detach_load_balancer_from_subnets_output

val make_detach_load_balancer_from_subnets_input :
  load_balancer_name:access_point_name ->
  subnets:subnets ->
  unit ->
  detach_load_balancer_from_subnets_input

val make_remove_availability_zones_output :
  ?availability_zones:availability_zones -> unit -> remove_availability_zones_output

val make_remove_availability_zones_input :
  load_balancer_name:access_point_name ->
  availability_zones:availability_zones ->
  unit ->
  remove_availability_zones_input

val make_set_load_balancer_policies_of_listener_output : unit -> unit

val make_set_load_balancer_policies_of_listener_input :
  load_balancer_name:access_point_name ->
  load_balancer_port:access_point_port ->
  policy_names:policy_names ->
  unit ->
  set_load_balancer_policies_of_listener_input

val make_set_load_balancer_policies_for_backend_server_output : unit -> unit

val make_set_load_balancer_policies_for_backend_server_input :
  load_balancer_name:access_point_name ->
  instance_port:end_point_port ->
  policy_names:policy_names ->
  unit ->
  set_load_balancer_policies_for_backend_server_input

val make_set_load_balancer_listener_ssl_certificate_output : unit -> unit

val make_set_load_balancer_listener_ssl_certificate_input :
  load_balancer_name:access_point_name ->
  load_balancer_port:access_point_port ->
  ssl_certificate_id:ssl_certificate_id ->
  unit ->
  set_load_balancer_listener_ssl_certificate_input

val make_remove_tags_output : unit -> unit
val make_tag_key_only : ?key:tag_key -> unit -> tag_key_only

val make_remove_tags_input :
  load_balancer_names:load_balancer_names -> tags:tag_key_list -> unit -> remove_tags_input

val make_register_end_points_output : ?instances:instances -> unit -> register_end_points_output

val make_register_end_points_input :
  load_balancer_name:access_point_name -> instances:instances -> unit -> register_end_points_input

val make_modify_load_balancer_attributes_output :
  ?load_balancer_name:access_point_name ->
  ?load_balancer_attributes:load_balancer_attributes ->
  unit ->
  modify_load_balancer_attributes_output

val make_modify_load_balancer_attributes_input :
  load_balancer_name:access_point_name ->
  load_balancer_attributes:load_balancer_attributes ->
  unit ->
  modify_load_balancer_attributes_input
