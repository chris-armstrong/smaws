open Types

val make_jwt_validation_action_additional_claim :
  format:jwt_validation_action_additional_claim_format_enum ->
  name:jwt_validation_action_additional_claim_name ->
  values:jwt_validation_action_additional_claim_values ->
  unit ->
  jwt_validation_action_additional_claim

val make_jwt_validation_action_config :
  ?additional_claims:jwt_validation_action_additional_claims ->
  jwks_endpoint:jwt_validation_action_jwks_endpoint ->
  issuer:jwt_validation_action_issuer ->
  unit ->
  jwt_validation_action_config

val make_target_group_stickiness_config :
  ?enabled:target_group_stickiness_enabled ->
  ?duration_seconds:target_group_stickiness_duration_seconds ->
  unit ->
  target_group_stickiness_config

val make_target_group_tuple :
  ?target_group_arn:target_group_arn -> ?weight:target_group_weight -> unit -> target_group_tuple

val make_forward_action_config :
  ?target_groups:target_group_list ->
  ?target_group_stickiness_config:target_group_stickiness_config ->
  unit ->
  forward_action_config

val make_fixed_response_action_config :
  ?message_body:fixed_response_action_message ->
  ?content_type:fixed_response_action_content_type ->
  status_code:fixed_response_action_status_code ->
  unit ->
  fixed_response_action_config

val make_redirect_action_config :
  ?protocol:redirect_action_protocol ->
  ?port:redirect_action_port ->
  ?host:redirect_action_host ->
  ?path:redirect_action_path ->
  ?query:redirect_action_query ->
  status_code:redirect_action_status_code_enum ->
  unit ->
  redirect_action_config

val make_authenticate_cognito_action_config :
  ?session_cookie_name:authenticate_cognito_action_session_cookie_name ->
  ?scope:authenticate_cognito_action_scope ->
  ?session_timeout:authenticate_cognito_action_session_timeout ->
  ?authentication_request_extra_params:
    authenticate_cognito_action_authentication_request_extra_params ->
  ?on_unauthenticated_request:authenticate_cognito_action_conditional_behavior_enum ->
  user_pool_arn:authenticate_cognito_action_user_pool_arn ->
  user_pool_client_id:authenticate_cognito_action_user_pool_client_id ->
  user_pool_domain:authenticate_cognito_action_user_pool_domain ->
  unit ->
  authenticate_cognito_action_config

val make_authenticate_oidc_action_config :
  ?client_secret:authenticate_oidc_action_client_secret ->
  ?session_cookie_name:authenticate_oidc_action_session_cookie_name ->
  ?scope:authenticate_oidc_action_scope ->
  ?session_timeout:authenticate_oidc_action_session_timeout ->
  ?authentication_request_extra_params:authenticate_oidc_action_authentication_request_extra_params ->
  ?on_unauthenticated_request:authenticate_oidc_action_conditional_behavior_enum ->
  ?use_existing_client_secret:authenticate_oidc_action_use_existing_client_secret ->
  issuer:authenticate_oidc_action_issuer ->
  authorization_endpoint:authenticate_oidc_action_authorization_endpoint ->
  token_endpoint:authenticate_oidc_action_token_endpoint ->
  user_info_endpoint:authenticate_oidc_action_user_info_endpoint ->
  client_id:authenticate_oidc_action_client_id ->
  unit ->
  authenticate_oidc_action_config

val make_action :
  ?target_group_arn:target_group_arn ->
  ?authenticate_oidc_config:authenticate_oidc_action_config ->
  ?authenticate_cognito_config:authenticate_cognito_action_config ->
  ?order:action_order ->
  ?redirect_config:redirect_action_config ->
  ?fixed_response_config:fixed_response_action_config ->
  ?forward_config:forward_action_config ->
  ?jwt_validation_config:jwt_validation_action_config ->
  type_:action_type_enum ->
  unit ->
  action

val make_certificate :
  ?certificate_arn:certificate_arn -> ?is_default:default -> unit -> certificate

val make_add_listener_certificates_output :
  ?certificates:certificate_list -> unit -> add_listener_certificates_output

val make_add_listener_certificates_input :
  listener_arn:listener_arn ->
  certificates:certificate_list ->
  unit ->
  add_listener_certificates_input

val make_add_tags_output : unit -> unit
val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag
val make_add_tags_input : resource_arns:resource_arns -> tags:tag_list -> unit -> add_tags_input

val make_trust_store_revocation :
  ?trust_store_arn:trust_store_arn ->
  ?revocation_id:revocation_id ->
  ?revocation_type:revocation_type ->
  ?number_of_revoked_entries:number_of_revoked_entries ->
  unit ->
  trust_store_revocation

val make_add_trust_store_revocations_output :
  ?trust_store_revocations:trust_store_revocations -> unit -> add_trust_store_revocations_output

val make_revocation_content :
  ?s3_bucket:s3_bucket ->
  ?s3_key:s3_key ->
  ?s3_object_version:s3_object_version ->
  ?revocation_type:revocation_type ->
  unit ->
  revocation_content

val make_add_trust_store_revocations_input :
  ?revocation_contents:revocation_contents ->
  trust_store_arn:trust_store_arn ->
  unit ->
  add_trust_store_revocations_input

val make_administrative_override :
  ?state:target_administrative_override_state_enum ->
  ?reason:target_administrative_override_reason_enum ->
  ?description:description ->
  unit ->
  administrative_override

val make_anomaly_detection :
  ?result_:anomaly_result_enum ->
  ?mitigation_in_effect:mitigation_in_effect_enum ->
  unit ->
  anomaly_detection

val make_load_balancer_address :
  ?ip_address:ip_address ->
  ?allocation_id:allocation_id ->
  ?private_i_pv4_address:private_i_pv4_address ->
  ?i_pv6_address:i_pv6_address ->
  unit ->
  load_balancer_address

val make_availability_zone :
  ?zone_name:zone_name ->
  ?subnet_id:subnet_id ->
  ?outpost_id:outpost_id ->
  ?load_balancer_addresses:load_balancer_addresses ->
  ?source_nat_ipv6_prefixes:source_nat_ipv6_prefixes ->
  unit ->
  availability_zone

val make_capacity_reservation_status :
  ?code:capacity_reservation_state_enum ->
  ?reason:state_reason ->
  unit ->
  capacity_reservation_status

val make_cipher : ?name:cipher_name -> ?priority:cipher_priority -> unit -> cipher

val make_mutual_authentication_attributes :
  ?mode:mode ->
  ?trust_store_arn:trust_store_arn ->
  ?ignore_client_certificate_expiry:ignore_client_certificate_expiry ->
  ?trust_store_association_status:trust_store_association_status_enum ->
  ?advertise_trust_store_ca_names:advertise_trust_store_ca_names_enum ->
  unit ->
  mutual_authentication_attributes

val make_listener :
  ?listener_arn:listener_arn ->
  ?load_balancer_arn:load_balancer_arn ->
  ?port:port ->
  ?protocol:protocol_enum ->
  ?certificates:certificate_list ->
  ?ssl_policy:ssl_policy_name ->
  ?default_actions:actions ->
  ?alpn_policy:alpn_policy_name ->
  ?mutual_authentication:mutual_authentication_attributes ->
  unit ->
  listener

val make_create_listener_output : ?listeners:listeners -> unit -> create_listener_output

val make_create_listener_input :
  ?protocol:protocol_enum ->
  ?port:port ->
  ?ssl_policy:ssl_policy_name ->
  ?certificates:certificate_list ->
  ?alpn_policy:alpn_policy_name ->
  ?tags:tag_list ->
  ?mutual_authentication:mutual_authentication_attributes ->
  load_balancer_arn:load_balancer_arn ->
  default_actions:actions ->
  unit ->
  create_listener_input

val make_ipam_pools : ?ipv4_ipam_pool_id:ipam_pool_id -> unit -> ipam_pools

val make_load_balancer_state :
  ?code:load_balancer_state_enum -> ?reason:state_reason -> unit -> load_balancer_state

val make_load_balancer :
  ?load_balancer_arn:load_balancer_arn ->
  ?dns_name:dns_name ->
  ?canonical_hosted_zone_id:canonical_hosted_zone_id ->
  ?created_time:created_time ->
  ?load_balancer_name:load_balancer_name ->
  ?scheme:load_balancer_scheme_enum ->
  ?vpc_id:vpc_id ->
  ?state:load_balancer_state ->
  ?type_:load_balancer_type_enum ->
  ?availability_zones:availability_zones ->
  ?security_groups:security_groups ->
  ?ip_address_type:ip_address_type ->
  ?customer_owned_ipv4_pool:customer_owned_ipv4_pool ->
  ?enforce_security_group_inbound_rules_on_private_link_traffic:
    enforce_security_group_inbound_rules_on_private_link_traffic ->
  ?enable_prefix_for_ipv6_source_nat:enable_prefix_for_ipv6_source_nat_enum ->
  ?ipam_pools:ipam_pools ->
  unit ->
  load_balancer

val make_create_load_balancer_output :
  ?load_balancers:load_balancers -> unit -> create_load_balancer_output

val make_subnet_mapping :
  ?subnet_id:subnet_id ->
  ?allocation_id:allocation_id ->
  ?private_i_pv4_address:private_i_pv4_address ->
  ?i_pv6_address:i_pv6_address ->
  ?source_nat_ipv6_prefix:source_nat_ipv6_prefix ->
  unit ->
  subnet_mapping

val make_create_load_balancer_input :
  ?subnets:subnets ->
  ?subnet_mappings:subnet_mappings ->
  ?security_groups:security_groups ->
  ?scheme:load_balancer_scheme_enum ->
  ?tags:tag_list ->
  ?type_:load_balancer_type_enum ->
  ?ip_address_type:ip_address_type ->
  ?customer_owned_ipv4_pool:customer_owned_ipv4_pool ->
  ?enable_prefix_for_ipv6_source_nat:enable_prefix_for_ipv6_source_nat_enum ->
  ?ipam_pools:ipam_pools ->
  name:load_balancer_name ->
  unit ->
  create_load_balancer_input

val make_rewrite_config : regex:string_value -> replace:string_value -> unit -> rewrite_config
val make_url_rewrite_config : ?rewrites:rewrite_config_list -> unit -> url_rewrite_config

val make_host_header_rewrite_config :
  ?rewrites:rewrite_config_list -> unit -> host_header_rewrite_config

val make_rule_transform :
  ?host_header_rewrite_config:host_header_rewrite_config ->
  ?url_rewrite_config:url_rewrite_config ->
  type_:transform_type_enum ->
  unit ->
  rule_transform

val make_source_ip_condition_config : ?values:list_of_string -> unit -> source_ip_condition_config

val make_http_request_method_condition_config :
  ?values:list_of_string -> unit -> http_request_method_condition_config

val make_query_string_key_value_pair :
  ?key:string_value -> ?value:string_value -> unit -> query_string_key_value_pair

val make_query_string_condition_config :
  ?values:query_string_key_value_pair_list -> unit -> query_string_condition_config

val make_http_header_condition_config :
  ?http_header_name:http_header_condition_name ->
  ?values:list_of_string ->
  ?regex_values:list_of_string ->
  unit ->
  http_header_condition_config

val make_path_pattern_condition_config :
  ?values:list_of_string -> ?regex_values:list_of_string -> unit -> path_pattern_condition_config

val make_host_header_condition_config :
  ?values:list_of_string -> ?regex_values:list_of_string -> unit -> host_header_condition_config

val make_rule_condition :
  ?field:condition_field_name ->
  ?values:list_of_string ->
  ?host_header_config:host_header_condition_config ->
  ?path_pattern_config:path_pattern_condition_config ->
  ?http_header_config:http_header_condition_config ->
  ?query_string_config:query_string_condition_config ->
  ?http_request_method_config:http_request_method_condition_config ->
  ?source_ip_config:source_ip_condition_config ->
  ?regex_values:list_of_string ->
  unit ->
  rule_condition

val make_rule :
  ?rule_arn:rule_arn ->
  ?priority:string_ ->
  ?conditions:rule_condition_list ->
  ?actions:actions ->
  ?is_default:is_default ->
  ?transforms:rule_transform_list ->
  unit ->
  rule

val make_create_rule_output : ?rules:rules -> unit -> create_rule_output

val make_create_rule_input :
  ?tags:tag_list ->
  ?transforms:rule_transform_list ->
  listener_arn:listener_arn ->
  conditions:rule_condition_list ->
  priority:rule_priority ->
  actions:actions ->
  unit ->
  create_rule_input

val make_matcher : ?http_code:http_code -> ?grpc_code:grpc_code -> unit -> matcher

val make_target_group :
  ?target_group_arn:target_group_arn ->
  ?target_group_name:target_group_name ->
  ?protocol:protocol_enum ->
  ?port:port ->
  ?vpc_id:vpc_id ->
  ?health_check_protocol:protocol_enum ->
  ?health_check_port:health_check_port ->
  ?health_check_enabled:health_check_enabled ->
  ?health_check_interval_seconds:health_check_interval_seconds ->
  ?health_check_timeout_seconds:health_check_timeout_seconds ->
  ?healthy_threshold_count:health_check_threshold_count ->
  ?unhealthy_threshold_count:health_check_threshold_count ->
  ?health_check_path:path ->
  ?matcher:matcher ->
  ?load_balancer_arns:load_balancer_arns ->
  ?target_type:target_type_enum ->
  ?protocol_version:protocol_version ->
  ?ip_address_type:target_group_ip_address_type_enum ->
  ?target_control_port:target_control_port ->
  unit ->
  target_group

val make_create_target_group_output :
  ?target_groups:target_groups -> unit -> create_target_group_output

val make_create_target_group_input :
  ?protocol:protocol_enum ->
  ?protocol_version:protocol_version ->
  ?port:port ->
  ?vpc_id:vpc_id ->
  ?health_check_protocol:protocol_enum ->
  ?health_check_port:health_check_port ->
  ?health_check_enabled:health_check_enabled ->
  ?health_check_path:path ->
  ?health_check_interval_seconds:health_check_interval_seconds ->
  ?health_check_timeout_seconds:health_check_timeout_seconds ->
  ?healthy_threshold_count:health_check_threshold_count ->
  ?unhealthy_threshold_count:health_check_threshold_count ->
  ?matcher:matcher ->
  ?target_type:target_type_enum ->
  ?tags:tag_list ->
  ?ip_address_type:target_group_ip_address_type_enum ->
  ?target_control_port:target_control_port ->
  name:target_group_name ->
  unit ->
  create_target_group_input

val make_trust_store :
  ?name:trust_store_name ->
  ?trust_store_arn:trust_store_arn ->
  ?status:trust_store_status ->
  ?number_of_ca_certificates:number_of_ca_certificates ->
  ?total_revoked_entries:total_revoked_entries ->
  unit ->
  trust_store

val make_create_trust_store_output : ?trust_stores:trust_stores -> unit -> create_trust_store_output

val make_create_trust_store_input :
  ?ca_certificates_bundle_s3_object_version:s3_object_version ->
  ?tags:tag_list ->
  name:trust_store_name ->
  ca_certificates_bundle_s3_bucket:s3_bucket ->
  ca_certificates_bundle_s3_key:s3_key ->
  unit ->
  create_trust_store_input

val make_delete_listener_output : unit -> unit
val make_delete_listener_input : listener_arn:listener_arn -> unit -> delete_listener_input
val make_delete_load_balancer_output : unit -> unit

val make_delete_load_balancer_input :
  load_balancer_arn:load_balancer_arn -> unit -> delete_load_balancer_input

val make_delete_rule_output : unit -> unit
val make_delete_rule_input : rule_arn:rule_arn -> unit -> delete_rule_input
val make_delete_shared_trust_store_association_output : unit -> unit

val make_delete_shared_trust_store_association_input :
  trust_store_arn:trust_store_arn ->
  resource_arn:resource_arn ->
  unit ->
  delete_shared_trust_store_association_input

val make_delete_target_group_output : unit -> unit

val make_delete_target_group_input :
  target_group_arn:target_group_arn -> unit -> delete_target_group_input

val make_delete_trust_store_output : unit -> unit

val make_delete_trust_store_input :
  trust_store_arn:trust_store_arn -> unit -> delete_trust_store_input

val make_deregister_targets_output : unit -> unit

val make_target_description :
  ?port:port ->
  ?availability_zone:zone_name ->
  ?quic_server_id:quic_server_id ->
  id:target_id ->
  unit ->
  target_description

val make_deregister_targets_input :
  target_group_arn:target_group_arn ->
  targets:target_descriptions ->
  unit ->
  deregister_targets_input

val make_limit : ?name:name -> ?max:max -> unit -> limit

val make_describe_account_limits_output :
  ?limits:limits -> ?next_marker:marker -> unit -> describe_account_limits_output

val make_describe_account_limits_input :
  ?marker:marker -> ?page_size:page_size -> unit -> describe_account_limits_input

val make_zonal_capacity_reservation_state :
  ?state:capacity_reservation_status ->
  ?availability_zone:zone_name ->
  ?effective_capacity_units:capacity_units_double ->
  unit ->
  zonal_capacity_reservation_state

val make_minimum_load_balancer_capacity :
  ?capacity_units:capacity_units -> unit -> minimum_load_balancer_capacity

val make_describe_capacity_reservation_output :
  ?last_modified_time:last_modified_time ->
  ?decrease_requests_remaining:decrease_requests_remaining ->
  ?minimum_load_balancer_capacity:minimum_load_balancer_capacity ->
  ?capacity_reservation_state:zonal_capacity_reservation_states ->
  unit ->
  describe_capacity_reservation_output

val make_describe_capacity_reservation_input :
  load_balancer_arn:load_balancer_arn -> unit -> describe_capacity_reservation_input

val make_listener_attribute :
  ?key:listener_attribute_key -> ?value:listener_attribute_value -> unit -> listener_attribute

val make_describe_listener_attributes_output :
  ?attributes:listener_attributes -> unit -> describe_listener_attributes_output

val make_describe_listener_attributes_input :
  listener_arn:listener_arn -> unit -> describe_listener_attributes_input

val make_describe_listener_certificates_output :
  ?certificates:certificate_list ->
  ?next_marker:marker ->
  unit ->
  describe_listener_certificates_output

val make_describe_listener_certificates_input :
  ?marker:marker ->
  ?page_size:page_size ->
  listener_arn:listener_arn ->
  unit ->
  describe_listener_certificates_input

val make_describe_listeners_output :
  ?listeners:listeners -> ?next_marker:marker -> unit -> describe_listeners_output

val make_describe_listeners_input :
  ?load_balancer_arn:load_balancer_arn ->
  ?listener_arns:listener_arns ->
  ?marker:marker ->
  ?page_size:page_size ->
  unit ->
  describe_listeners_input

val make_load_balancer_attribute :
  ?key:load_balancer_attribute_key ->
  ?value:load_balancer_attribute_value ->
  unit ->
  load_balancer_attribute

val make_describe_load_balancer_attributes_output :
  ?attributes:load_balancer_attributes -> unit -> describe_load_balancer_attributes_output

val make_describe_load_balancer_attributes_input :
  load_balancer_arn:load_balancer_arn -> unit -> describe_load_balancer_attributes_input

val make_describe_load_balancers_output :
  ?load_balancers:load_balancers -> ?next_marker:marker -> unit -> describe_load_balancers_output

val make_describe_load_balancers_input :
  ?load_balancer_arns:load_balancer_arns ->
  ?names:load_balancer_names ->
  ?marker:marker ->
  ?page_size:page_size ->
  unit ->
  describe_load_balancers_input

val make_describe_rules_output :
  ?rules:rules -> ?next_marker:marker -> unit -> describe_rules_output

val make_describe_rules_input :
  ?listener_arn:listener_arn ->
  ?rule_arns:rule_arns ->
  ?marker:marker ->
  ?page_size:page_size ->
  unit ->
  describe_rules_input

val make_ssl_policy :
  ?ssl_protocols:ssl_protocols ->
  ?ciphers:ciphers ->
  ?name:ssl_policy_name ->
  ?supported_load_balancer_types:list_of_string ->
  unit ->
  ssl_policy

val make_describe_ssl_policies_output :
  ?ssl_policies:ssl_policies -> ?next_marker:marker -> unit -> describe_ssl_policies_output

val make_describe_ssl_policies_input :
  ?names:ssl_policy_names ->
  ?marker:marker ->
  ?page_size:page_size ->
  ?load_balancer_type:load_balancer_type_enum ->
  unit ->
  describe_ssl_policies_input

val make_tag_description : ?resource_arn:resource_arn -> ?tags:tag_list -> unit -> tag_description
val make_describe_tags_output : ?tag_descriptions:tag_descriptions -> unit -> describe_tags_output
val make_describe_tags_input : resource_arns:resource_arns -> unit -> describe_tags_input

val make_target_group_attribute :
  ?key:target_group_attribute_key ->
  ?value:target_group_attribute_value ->
  unit ->
  target_group_attribute

val make_describe_target_group_attributes_output :
  ?attributes:target_group_attributes -> unit -> describe_target_group_attributes_output

val make_describe_target_group_attributes_input :
  target_group_arn:target_group_arn -> unit -> describe_target_group_attributes_input

val make_describe_target_groups_output :
  ?target_groups:target_groups -> ?next_marker:marker -> unit -> describe_target_groups_output

val make_describe_target_groups_input :
  ?load_balancer_arn:load_balancer_arn ->
  ?target_group_arns:target_group_arns ->
  ?names:target_group_names ->
  ?marker:marker ->
  ?page_size:page_size ->
  unit ->
  describe_target_groups_input

val make_target_health :
  ?state:target_health_state_enum ->
  ?reason:target_health_reason_enum ->
  ?description:description ->
  unit ->
  target_health

val make_target_health_description :
  ?target:target_description ->
  ?health_check_port:health_check_port ->
  ?target_health:target_health ->
  ?anomaly_detection:anomaly_detection ->
  ?administrative_override:administrative_override ->
  unit ->
  target_health_description

val make_describe_target_health_output :
  ?target_health_descriptions:target_health_descriptions -> unit -> describe_target_health_output

val make_describe_target_health_input :
  ?targets:target_descriptions ->
  ?include_:list_of_describe_target_health_include_options ->
  target_group_arn:target_group_arn ->
  unit ->
  describe_target_health_input

val make_trust_store_association :
  ?resource_arn:trust_store_association_resource_arn -> unit -> trust_store_association

val make_describe_trust_store_associations_output :
  ?trust_store_associations:trust_store_associations ->
  ?next_marker:marker ->
  unit ->
  describe_trust_store_associations_output

val make_describe_trust_store_associations_input :
  ?marker:marker ->
  ?page_size:page_size ->
  trust_store_arn:trust_store_arn ->
  unit ->
  describe_trust_store_associations_input

val make_describe_trust_store_revocation :
  ?trust_store_arn:trust_store_arn ->
  ?revocation_id:revocation_id ->
  ?revocation_type:revocation_type ->
  ?number_of_revoked_entries:number_of_revoked_entries ->
  unit ->
  describe_trust_store_revocation

val make_describe_trust_store_revocations_output :
  ?trust_store_revocations:describe_trust_store_revocation_response ->
  ?next_marker:marker ->
  unit ->
  describe_trust_store_revocations_output

val make_describe_trust_store_revocations_input :
  ?revocation_ids:revocation_ids ->
  ?marker:marker ->
  ?page_size:page_size ->
  trust_store_arn:trust_store_arn ->
  unit ->
  describe_trust_store_revocations_input

val make_describe_trust_stores_output :
  ?trust_stores:trust_stores -> ?next_marker:marker -> unit -> describe_trust_stores_output

val make_describe_trust_stores_input :
  ?trust_store_arns:trust_store_arns ->
  ?names:trust_store_names ->
  ?marker:marker ->
  ?page_size:page_size ->
  unit ->
  describe_trust_stores_input

val make_set_subnets_output :
  ?availability_zones:availability_zones ->
  ?ip_address_type:ip_address_type ->
  ?enable_prefix_for_ipv6_source_nat:enable_prefix_for_ipv6_source_nat_enum ->
  unit ->
  set_subnets_output

val make_set_subnets_input :
  ?subnets:subnets ->
  ?subnet_mappings:subnet_mappings ->
  ?ip_address_type:ip_address_type ->
  ?enable_prefix_for_ipv6_source_nat:enable_prefix_for_ipv6_source_nat_enum ->
  load_balancer_arn:load_balancer_arn ->
  unit ->
  set_subnets_input

val make_set_security_groups_output :
  ?security_group_ids:security_groups ->
  ?enforce_security_group_inbound_rules_on_private_link_traffic:
    enforce_security_group_inbound_rules_on_private_link_traffic_enum ->
  unit ->
  set_security_groups_output

val make_set_security_groups_input :
  ?enforce_security_group_inbound_rules_on_private_link_traffic:
    enforce_security_group_inbound_rules_on_private_link_traffic_enum ->
  load_balancer_arn:load_balancer_arn ->
  security_groups:security_groups ->
  unit ->
  set_security_groups_input

val make_set_rule_priorities_output : ?rules:rules -> unit -> set_rule_priorities_output

val make_rule_priority_pair :
  ?rule_arn:rule_arn -> ?priority:rule_priority -> unit -> rule_priority_pair

val make_set_rule_priorities_input :
  rule_priorities:rule_priority_list -> unit -> set_rule_priorities_input

val make_set_ip_address_type_output :
  ?ip_address_type:ip_address_type -> unit -> set_ip_address_type_output

val make_set_ip_address_type_input :
  load_balancer_arn:load_balancer_arn ->
  ip_address_type:ip_address_type ->
  unit ->
  set_ip_address_type_input

val make_remove_trust_store_revocations_output : unit -> unit

val make_remove_trust_store_revocations_input :
  trust_store_arn:trust_store_arn ->
  revocation_ids:revocation_ids ->
  unit ->
  remove_trust_store_revocations_input

val make_remove_tags_output : unit -> unit

val make_remove_tags_input :
  resource_arns:resource_arns -> tag_keys:tag_keys -> unit -> remove_tags_input

val make_remove_listener_certificates_output : unit -> unit

val make_remove_listener_certificates_input :
  listener_arn:listener_arn ->
  certificates:certificate_list ->
  unit ->
  remove_listener_certificates_input

val make_register_targets_output : unit -> unit

val make_register_targets_input :
  target_group_arn:target_group_arn -> targets:target_descriptions -> unit -> register_targets_input

val make_modify_trust_store_output : ?trust_stores:trust_stores -> unit -> modify_trust_store_output

val make_modify_trust_store_input :
  ?ca_certificates_bundle_s3_object_version:s3_object_version ->
  trust_store_arn:trust_store_arn ->
  ca_certificates_bundle_s3_bucket:s3_bucket ->
  ca_certificates_bundle_s3_key:s3_key ->
  unit ->
  modify_trust_store_input

val make_modify_target_group_attributes_output :
  ?attributes:target_group_attributes -> unit -> modify_target_group_attributes_output

val make_modify_target_group_attributes_input :
  target_group_arn:target_group_arn ->
  attributes:target_group_attributes ->
  unit ->
  modify_target_group_attributes_input

val make_modify_target_group_output :
  ?target_groups:target_groups -> unit -> modify_target_group_output

val make_modify_target_group_input :
  ?health_check_protocol:protocol_enum ->
  ?health_check_port:health_check_port ->
  ?health_check_path:path ->
  ?health_check_enabled:health_check_enabled ->
  ?health_check_interval_seconds:health_check_interval_seconds ->
  ?health_check_timeout_seconds:health_check_timeout_seconds ->
  ?healthy_threshold_count:health_check_threshold_count ->
  ?unhealthy_threshold_count:health_check_threshold_count ->
  ?matcher:matcher ->
  target_group_arn:target_group_arn ->
  unit ->
  modify_target_group_input

val make_modify_rule_output : ?rules:rules -> unit -> modify_rule_output

val make_modify_rule_input :
  ?conditions:rule_condition_list ->
  ?actions:actions ->
  ?transforms:rule_transform_list ->
  ?reset_transforms:reset_transforms ->
  rule_arn:rule_arn ->
  unit ->
  modify_rule_input

val make_modify_load_balancer_attributes_output :
  ?attributes:load_balancer_attributes -> unit -> modify_load_balancer_attributes_output

val make_modify_load_balancer_attributes_input :
  load_balancer_arn:load_balancer_arn ->
  attributes:load_balancer_attributes ->
  unit ->
  modify_load_balancer_attributes_input

val make_modify_listener_attributes_output :
  ?attributes:listener_attributes -> unit -> modify_listener_attributes_output

val make_modify_listener_attributes_input :
  listener_arn:listener_arn ->
  attributes:listener_attributes ->
  unit ->
  modify_listener_attributes_input

val make_modify_listener_output : ?listeners:listeners -> unit -> modify_listener_output

val make_modify_listener_input :
  ?port:port ->
  ?protocol:protocol_enum ->
  ?ssl_policy:ssl_policy_name ->
  ?certificates:certificate_list ->
  ?default_actions:actions ->
  ?alpn_policy:alpn_policy_name ->
  ?mutual_authentication:mutual_authentication_attributes ->
  listener_arn:listener_arn ->
  unit ->
  modify_listener_input

val make_modify_ip_pools_output : ?ipam_pools:ipam_pools -> unit -> modify_ip_pools_output

val make_modify_ip_pools_input :
  ?ipam_pools:ipam_pools ->
  ?remove_ipam_pools:remove_ipam_pools ->
  load_balancer_arn:load_balancer_arn ->
  unit ->
  modify_ip_pools_input

val make_modify_capacity_reservation_output :
  ?last_modified_time:last_modified_time ->
  ?decrease_requests_remaining:decrease_requests_remaining ->
  ?minimum_load_balancer_capacity:minimum_load_balancer_capacity ->
  ?capacity_reservation_state:zonal_capacity_reservation_states ->
  unit ->
  modify_capacity_reservation_output

val make_modify_capacity_reservation_input :
  ?minimum_load_balancer_capacity:minimum_load_balancer_capacity ->
  ?reset_capacity_reservation:reset_capacity_reservation ->
  load_balancer_arn:load_balancer_arn ->
  unit ->
  modify_capacity_reservation_input

val make_get_trust_store_revocation_content_output :
  ?location:location -> unit -> get_trust_store_revocation_content_output

val make_get_trust_store_revocation_content_input :
  trust_store_arn:trust_store_arn ->
  revocation_id:revocation_id ->
  unit ->
  get_trust_store_revocation_content_input

val make_get_trust_store_ca_certificates_bundle_output :
  ?location:location -> unit -> get_trust_store_ca_certificates_bundle_output

val make_get_trust_store_ca_certificates_bundle_input :
  trust_store_arn:trust_store_arn -> unit -> get_trust_store_ca_certificates_bundle_input

val make_get_resource_policy_output : ?policy:policy -> unit -> get_resource_policy_output
val make_get_resource_policy_input : resource_arn:resource_arn -> unit -> get_resource_policy_input
