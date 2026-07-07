open Types

val make_capacity_reservation_status :
  ?reason:state_reason ->
  ?code:capacity_reservation_state_enum ->
  unit ->
  capacity_reservation_status

val make_zonal_capacity_reservation_state :
  ?effective_capacity_units:capacity_units_double ->
  ?availability_zone:zone_name ->
  ?state:capacity_reservation_status ->
  unit ->
  zonal_capacity_reservation_state

val make_rewrite_config : replace:string_value -> regex:string_value -> unit -> rewrite_config
val make_url_rewrite_config : ?rewrites:rewrite_config_list -> unit -> url_rewrite_config

val make_trust_store :
  ?total_revoked_entries:total_revoked_entries ->
  ?number_of_ca_certificates:number_of_ca_certificates ->
  ?status:trust_store_status ->
  ?trust_store_arn:trust_store_arn ->
  ?name:trust_store_name ->
  unit ->
  trust_store

val make_trust_store_revocation :
  ?number_of_revoked_entries:number_of_revoked_entries ->
  ?revocation_type:revocation_type ->
  ?revocation_id:revocation_id ->
  ?trust_store_arn:trust_store_arn ->
  unit ->
  trust_store_revocation

val make_trust_store_association :
  ?resource_arn:trust_store_association_resource_arn -> unit -> trust_store_association

val make_target_description :
  ?quic_server_id:quic_server_id ->
  ?availability_zone:zone_name ->
  ?port:port ->
  id:target_id ->
  unit ->
  target_description

val make_target_health :
  ?description:description ->
  ?reason:target_health_reason_enum ->
  ?state:target_health_state_enum ->
  unit ->
  target_health

val make_anomaly_detection :
  ?mitigation_in_effect:mitigation_in_effect_enum ->
  ?result_:anomaly_result_enum ->
  unit ->
  anomaly_detection

val make_administrative_override :
  ?description:description ->
  ?reason:target_administrative_override_reason_enum ->
  ?state:target_administrative_override_state_enum ->
  unit ->
  administrative_override

val make_target_health_description :
  ?administrative_override:administrative_override ->
  ?anomaly_detection:anomaly_detection ->
  ?target_health:target_health ->
  ?health_check_port:health_check_port ->
  ?target:target_description ->
  unit ->
  target_health_description

val make_matcher : ?grpc_code:grpc_code -> ?http_code:http_code -> unit -> matcher

val make_target_group :
  ?target_control_port:target_control_port ->
  ?ip_address_type:target_group_ip_address_type_enum ->
  ?protocol_version:protocol_version ->
  ?target_type:target_type_enum ->
  ?load_balancer_arns:load_balancer_arns ->
  ?matcher:matcher ->
  ?health_check_path:path ->
  ?unhealthy_threshold_count:health_check_threshold_count ->
  ?healthy_threshold_count:health_check_threshold_count ->
  ?health_check_timeout_seconds:health_check_timeout_seconds ->
  ?health_check_interval_seconds:health_check_interval_seconds ->
  ?health_check_enabled:health_check_enabled ->
  ?health_check_port:health_check_port ->
  ?health_check_protocol:protocol_enum ->
  ?vpc_id:vpc_id ->
  ?port:port ->
  ?protocol:protocol_enum ->
  ?target_group_name:target_group_name ->
  ?target_group_arn:target_group_arn ->
  unit ->
  target_group

val make_target_group_tuple :
  ?weight:target_group_weight -> ?target_group_arn:target_group_arn -> unit -> target_group_tuple

val make_target_group_stickiness_config :
  ?duration_seconds:target_group_stickiness_duration_seconds ->
  ?enabled:target_group_stickiness_enabled ->
  unit ->
  target_group_stickiness_config

val make_target_group_attribute :
  ?value:target_group_attribute_value ->
  ?key:target_group_attribute_key ->
  unit ->
  target_group_attribute

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag
val make_tag_description : ?tags:tag_list -> ?resource_arn:resource_arn -> unit -> tag_description

val make_subnet_mapping :
  ?source_nat_ipv6_prefix:source_nat_ipv6_prefix ->
  ?i_pv6_address:i_pv6_address ->
  ?private_i_pv4_address:private_i_pv4_address ->
  ?allocation_id:allocation_id ->
  ?subnet_id:subnet_id ->
  unit ->
  subnet_mapping

val make_cipher : ?priority:cipher_priority -> ?name:cipher_name -> unit -> cipher

val make_ssl_policy :
  ?supported_load_balancer_types:list_of_string ->
  ?name:ssl_policy_name ->
  ?ciphers:ciphers ->
  ?ssl_protocols:ssl_protocols ->
  unit ->
  ssl_policy

val make_source_ip_condition_config : ?values:list_of_string -> unit -> source_ip_condition_config

val make_load_balancer_address :
  ?i_pv6_address:i_pv6_address ->
  ?private_i_pv4_address:private_i_pv4_address ->
  ?allocation_id:allocation_id ->
  ?ip_address:ip_address ->
  unit ->
  load_balancer_address

val make_availability_zone :
  ?source_nat_ipv6_prefixes:source_nat_ipv6_prefixes ->
  ?load_balancer_addresses:load_balancer_addresses ->
  ?outpost_id:outpost_id ->
  ?subnet_id:subnet_id ->
  ?zone_name:zone_name ->
  unit ->
  availability_zone

val make_set_subnets_output :
  ?enable_prefix_for_ipv6_source_nat:enable_prefix_for_ipv6_source_nat_enum ->
  ?ip_address_type:ip_address_type ->
  ?availability_zones:availability_zones ->
  unit ->
  set_subnets_output

val make_set_subnets_input :
  ?enable_prefix_for_ipv6_source_nat:enable_prefix_for_ipv6_source_nat_enum ->
  ?ip_address_type:ip_address_type ->
  ?subnet_mappings:subnet_mappings ->
  ?subnets:subnets ->
  load_balancer_arn:load_balancer_arn ->
  unit ->
  set_subnets_input

val make_set_security_groups_output :
  ?enforce_security_group_inbound_rules_on_private_link_traffic:
    enforce_security_group_inbound_rules_on_private_link_traffic_enum ->
  ?security_group_ids:security_groups ->
  unit ->
  set_security_groups_output

val make_set_security_groups_input :
  ?enforce_security_group_inbound_rules_on_private_link_traffic:
    enforce_security_group_inbound_rules_on_private_link_traffic_enum ->
  security_groups:security_groups ->
  load_balancer_arn:load_balancer_arn ->
  unit ->
  set_security_groups_input

val make_host_header_condition_config :
  ?regex_values:list_of_string -> ?values:list_of_string -> unit -> host_header_condition_config

val make_path_pattern_condition_config :
  ?regex_values:list_of_string -> ?values:list_of_string -> unit -> path_pattern_condition_config

val make_http_header_condition_config :
  ?regex_values:list_of_string ->
  ?values:list_of_string ->
  ?http_header_name:http_header_condition_name ->
  unit ->
  http_header_condition_config

val make_query_string_key_value_pair :
  ?value:string_value -> ?key:string_value -> unit -> query_string_key_value_pair

val make_query_string_condition_config :
  ?values:query_string_key_value_pair_list -> unit -> query_string_condition_config

val make_http_request_method_condition_config :
  ?values:list_of_string -> unit -> http_request_method_condition_config

val make_rule_condition :
  ?regex_values:list_of_string ->
  ?source_ip_config:source_ip_condition_config ->
  ?http_request_method_config:http_request_method_condition_config ->
  ?query_string_config:query_string_condition_config ->
  ?http_header_config:http_header_condition_config ->
  ?path_pattern_config:path_pattern_condition_config ->
  ?host_header_config:host_header_condition_config ->
  ?values:list_of_string ->
  ?field:condition_field_name ->
  unit ->
  rule_condition

val make_authenticate_oidc_action_config :
  ?use_existing_client_secret:authenticate_oidc_action_use_existing_client_secret ->
  ?on_unauthenticated_request:authenticate_oidc_action_conditional_behavior_enum ->
  ?authentication_request_extra_params:authenticate_oidc_action_authentication_request_extra_params ->
  ?session_timeout:authenticate_oidc_action_session_timeout ->
  ?scope:authenticate_oidc_action_scope ->
  ?session_cookie_name:authenticate_oidc_action_session_cookie_name ->
  ?client_secret:authenticate_oidc_action_client_secret ->
  client_id:authenticate_oidc_action_client_id ->
  user_info_endpoint:authenticate_oidc_action_user_info_endpoint ->
  token_endpoint:authenticate_oidc_action_token_endpoint ->
  authorization_endpoint:authenticate_oidc_action_authorization_endpoint ->
  issuer:authenticate_oidc_action_issuer ->
  unit ->
  authenticate_oidc_action_config

val make_authenticate_cognito_action_config :
  ?on_unauthenticated_request:authenticate_cognito_action_conditional_behavior_enum ->
  ?authentication_request_extra_params:
    authenticate_cognito_action_authentication_request_extra_params ->
  ?session_timeout:authenticate_cognito_action_session_timeout ->
  ?scope:authenticate_cognito_action_scope ->
  ?session_cookie_name:authenticate_cognito_action_session_cookie_name ->
  user_pool_domain:authenticate_cognito_action_user_pool_domain ->
  user_pool_client_id:authenticate_cognito_action_user_pool_client_id ->
  user_pool_arn:authenticate_cognito_action_user_pool_arn ->
  unit ->
  authenticate_cognito_action_config

val make_redirect_action_config :
  ?query:redirect_action_query ->
  ?path:redirect_action_path ->
  ?host:redirect_action_host ->
  ?port:redirect_action_port ->
  ?protocol:redirect_action_protocol ->
  status_code:redirect_action_status_code_enum ->
  unit ->
  redirect_action_config

val make_fixed_response_action_config :
  ?content_type:fixed_response_action_content_type ->
  ?message_body:fixed_response_action_message ->
  status_code:fixed_response_action_status_code ->
  unit ->
  fixed_response_action_config

val make_forward_action_config :
  ?target_group_stickiness_config:target_group_stickiness_config ->
  ?target_groups:target_group_list ->
  unit ->
  forward_action_config

val make_jwt_validation_action_additional_claim :
  values:jwt_validation_action_additional_claim_values ->
  name:jwt_validation_action_additional_claim_name ->
  format:jwt_validation_action_additional_claim_format_enum ->
  unit ->
  jwt_validation_action_additional_claim

val make_jwt_validation_action_config :
  ?additional_claims:jwt_validation_action_additional_claims ->
  issuer:jwt_validation_action_issuer ->
  jwks_endpoint:jwt_validation_action_jwks_endpoint ->
  unit ->
  jwt_validation_action_config

val make_action :
  ?jwt_validation_config:jwt_validation_action_config ->
  ?forward_config:forward_action_config ->
  ?fixed_response_config:fixed_response_action_config ->
  ?redirect_config:redirect_action_config ->
  ?order:action_order ->
  ?authenticate_cognito_config:authenticate_cognito_action_config ->
  ?authenticate_oidc_config:authenticate_oidc_action_config ->
  ?target_group_arn:target_group_arn ->
  type_:action_type_enum ->
  unit ->
  action

val make_host_header_rewrite_config :
  ?rewrites:rewrite_config_list -> unit -> host_header_rewrite_config

val make_rule_transform :
  ?url_rewrite_config:url_rewrite_config ->
  ?host_header_rewrite_config:host_header_rewrite_config ->
  type_:transform_type_enum ->
  unit ->
  rule_transform

val make_rule :
  ?transforms:rule_transform_list ->
  ?is_default:is_default ->
  ?actions:actions ->
  ?conditions:rule_condition_list ->
  ?priority:string_ ->
  ?rule_arn:rule_arn ->
  unit ->
  rule

val make_set_rule_priorities_output : ?rules:rules -> unit -> set_rule_priorities_output

val make_rule_priority_pair :
  ?priority:rule_priority -> ?rule_arn:rule_arn -> unit -> rule_priority_pair

val make_set_rule_priorities_input :
  rule_priorities:rule_priority_list -> unit -> set_rule_priorities_input

val make_set_ip_address_type_output :
  ?ip_address_type:ip_address_type -> unit -> set_ip_address_type_output

val make_set_ip_address_type_input :
  ip_address_type:ip_address_type ->
  load_balancer_arn:load_balancer_arn ->
  unit ->
  set_ip_address_type_input

val make_revocation_content :
  ?revocation_type:revocation_type ->
  ?s3_object_version:s3_object_version ->
  ?s3_key:s3_key ->
  ?s3_bucket:s3_bucket ->
  unit ->
  revocation_content

val make_remove_trust_store_revocations_output : unit -> unit

val make_remove_trust_store_revocations_input :
  revocation_ids:revocation_ids ->
  trust_store_arn:trust_store_arn ->
  unit ->
  remove_trust_store_revocations_input

val make_remove_tags_output : unit -> unit

val make_remove_tags_input :
  tag_keys:tag_keys -> resource_arns:resource_arns -> unit -> remove_tags_input

val make_remove_listener_certificates_output : unit -> unit

val make_certificate :
  ?is_default:default -> ?certificate_arn:certificate_arn -> unit -> certificate

val make_remove_listener_certificates_input :
  certificates:certificate_list ->
  listener_arn:listener_arn ->
  unit ->
  remove_listener_certificates_input

val make_register_targets_output : unit -> unit

val make_register_targets_input :
  targets:target_descriptions -> target_group_arn:target_group_arn -> unit -> register_targets_input

val make_mutual_authentication_attributes :
  ?advertise_trust_store_ca_names:advertise_trust_store_ca_names_enum ->
  ?trust_store_association_status:trust_store_association_status_enum ->
  ?ignore_client_certificate_expiry:ignore_client_certificate_expiry ->
  ?trust_store_arn:trust_store_arn ->
  ?mode:mode ->
  unit ->
  mutual_authentication_attributes

val make_modify_trust_store_output : ?trust_stores:trust_stores -> unit -> modify_trust_store_output

val make_modify_trust_store_input :
  ?ca_certificates_bundle_s3_object_version:s3_object_version ->
  ca_certificates_bundle_s3_key:s3_key ->
  ca_certificates_bundle_s3_bucket:s3_bucket ->
  trust_store_arn:trust_store_arn ->
  unit ->
  modify_trust_store_input

val make_modify_target_group_output :
  ?target_groups:target_groups -> unit -> modify_target_group_output

val make_modify_target_group_input :
  ?matcher:matcher ->
  ?unhealthy_threshold_count:health_check_threshold_count ->
  ?healthy_threshold_count:health_check_threshold_count ->
  ?health_check_timeout_seconds:health_check_timeout_seconds ->
  ?health_check_interval_seconds:health_check_interval_seconds ->
  ?health_check_enabled:health_check_enabled ->
  ?health_check_path:path ->
  ?health_check_port:health_check_port ->
  ?health_check_protocol:protocol_enum ->
  target_group_arn:target_group_arn ->
  unit ->
  modify_target_group_input

val make_modify_target_group_attributes_output :
  ?attributes:target_group_attributes -> unit -> modify_target_group_attributes_output

val make_modify_target_group_attributes_input :
  attributes:target_group_attributes ->
  target_group_arn:target_group_arn ->
  unit ->
  modify_target_group_attributes_input

val make_modify_rule_output : ?rules:rules -> unit -> modify_rule_output

val make_modify_rule_input :
  ?reset_transforms:reset_transforms ->
  ?transforms:rule_transform_list ->
  ?actions:actions ->
  ?conditions:rule_condition_list ->
  rule_arn:rule_arn ->
  unit ->
  modify_rule_input

val make_load_balancer_attribute :
  ?value:load_balancer_attribute_value ->
  ?key:load_balancer_attribute_key ->
  unit ->
  load_balancer_attribute

val make_modify_load_balancer_attributes_output :
  ?attributes:load_balancer_attributes -> unit -> modify_load_balancer_attributes_output

val make_modify_load_balancer_attributes_input :
  attributes:load_balancer_attributes ->
  load_balancer_arn:load_balancer_arn ->
  unit ->
  modify_load_balancer_attributes_input

val make_listener :
  ?mutual_authentication:mutual_authentication_attributes ->
  ?alpn_policy:alpn_policy_name ->
  ?default_actions:actions ->
  ?ssl_policy:ssl_policy_name ->
  ?certificates:certificate_list ->
  ?protocol:protocol_enum ->
  ?port:port ->
  ?load_balancer_arn:load_balancer_arn ->
  ?listener_arn:listener_arn ->
  unit ->
  listener

val make_modify_listener_output : ?listeners:listeners -> unit -> modify_listener_output

val make_modify_listener_input :
  ?mutual_authentication:mutual_authentication_attributes ->
  ?alpn_policy:alpn_policy_name ->
  ?default_actions:actions ->
  ?certificates:certificate_list ->
  ?ssl_policy:ssl_policy_name ->
  ?protocol:protocol_enum ->
  ?port:port ->
  listener_arn:listener_arn ->
  unit ->
  modify_listener_input

val make_listener_attribute :
  ?value:listener_attribute_value -> ?key:listener_attribute_key -> unit -> listener_attribute

val make_modify_listener_attributes_output :
  ?attributes:listener_attributes -> unit -> modify_listener_attributes_output

val make_modify_listener_attributes_input :
  attributes:listener_attributes ->
  listener_arn:listener_arn ->
  unit ->
  modify_listener_attributes_input

val make_ipam_pools : ?ipv4_ipam_pool_id:ipam_pool_id -> unit -> ipam_pools
val make_modify_ip_pools_output : ?ipam_pools:ipam_pools -> unit -> modify_ip_pools_output

val make_modify_ip_pools_input :
  ?remove_ipam_pools:remove_ipam_pools ->
  ?ipam_pools:ipam_pools ->
  load_balancer_arn:load_balancer_arn ->
  unit ->
  modify_ip_pools_input

val make_minimum_load_balancer_capacity :
  ?capacity_units:capacity_units -> unit -> minimum_load_balancer_capacity

val make_modify_capacity_reservation_output :
  ?capacity_reservation_state:zonal_capacity_reservation_states ->
  ?minimum_load_balancer_capacity:minimum_load_balancer_capacity ->
  ?decrease_requests_remaining:decrease_requests_remaining ->
  ?last_modified_time:last_modified_time ->
  unit ->
  modify_capacity_reservation_output

val make_modify_capacity_reservation_input :
  ?reset_capacity_reservation:reset_capacity_reservation ->
  ?minimum_load_balancer_capacity:minimum_load_balancer_capacity ->
  load_balancer_arn:load_balancer_arn ->
  unit ->
  modify_capacity_reservation_input

val make_load_balancer_state :
  ?reason:state_reason -> ?code:load_balancer_state_enum -> unit -> load_balancer_state

val make_load_balancer :
  ?ipam_pools:ipam_pools ->
  ?enable_prefix_for_ipv6_source_nat:enable_prefix_for_ipv6_source_nat_enum ->
  ?enforce_security_group_inbound_rules_on_private_link_traffic:
    enforce_security_group_inbound_rules_on_private_link_traffic ->
  ?customer_owned_ipv4_pool:customer_owned_ipv4_pool ->
  ?ip_address_type:ip_address_type ->
  ?security_groups:security_groups ->
  ?availability_zones:availability_zones ->
  ?type_:load_balancer_type_enum ->
  ?state:load_balancer_state ->
  ?vpc_id:vpc_id ->
  ?scheme:load_balancer_scheme_enum ->
  ?load_balancer_name:load_balancer_name ->
  ?created_time:created_time ->
  ?canonical_hosted_zone_id:canonical_hosted_zone_id ->
  ?dns_name:dns_name ->
  ?load_balancer_arn:load_balancer_arn ->
  unit ->
  load_balancer

val make_limit : ?max:max -> ?name:name -> unit -> limit

val make_get_trust_store_revocation_content_output :
  ?location:location -> unit -> get_trust_store_revocation_content_output

val make_get_trust_store_revocation_content_input :
  revocation_id:revocation_id ->
  trust_store_arn:trust_store_arn ->
  unit ->
  get_trust_store_revocation_content_input

val make_get_trust_store_ca_certificates_bundle_output :
  ?location:location -> unit -> get_trust_store_ca_certificates_bundle_output

val make_get_trust_store_ca_certificates_bundle_input :
  trust_store_arn:trust_store_arn -> unit -> get_trust_store_ca_certificates_bundle_input

val make_get_resource_policy_output : ?policy:policy -> unit -> get_resource_policy_output
val make_get_resource_policy_input : resource_arn:resource_arn -> unit -> get_resource_policy_input

val make_describe_trust_stores_output :
  ?next_marker:marker -> ?trust_stores:trust_stores -> unit -> describe_trust_stores_output

val make_describe_trust_stores_input :
  ?page_size:page_size ->
  ?marker:marker ->
  ?names:trust_store_names ->
  ?trust_store_arns:trust_store_arns ->
  unit ->
  describe_trust_stores_input

val make_describe_trust_store_revocation :
  ?number_of_revoked_entries:number_of_revoked_entries ->
  ?revocation_type:revocation_type ->
  ?revocation_id:revocation_id ->
  ?trust_store_arn:trust_store_arn ->
  unit ->
  describe_trust_store_revocation

val make_describe_trust_store_revocations_output :
  ?next_marker:marker ->
  ?trust_store_revocations:describe_trust_store_revocation_response ->
  unit ->
  describe_trust_store_revocations_output

val make_describe_trust_store_revocations_input :
  ?page_size:page_size ->
  ?marker:marker ->
  ?revocation_ids:revocation_ids ->
  trust_store_arn:trust_store_arn ->
  unit ->
  describe_trust_store_revocations_input

val make_describe_trust_store_associations_output :
  ?next_marker:marker ->
  ?trust_store_associations:trust_store_associations ->
  unit ->
  describe_trust_store_associations_output

val make_describe_trust_store_associations_input :
  ?page_size:page_size ->
  ?marker:marker ->
  trust_store_arn:trust_store_arn ->
  unit ->
  describe_trust_store_associations_input

val make_describe_target_health_output :
  ?target_health_descriptions:target_health_descriptions -> unit -> describe_target_health_output

val make_describe_target_health_input :
  ?include_:list_of_describe_target_health_include_options ->
  ?targets:target_descriptions ->
  target_group_arn:target_group_arn ->
  unit ->
  describe_target_health_input

val make_describe_target_groups_output :
  ?next_marker:marker -> ?target_groups:target_groups -> unit -> describe_target_groups_output

val make_describe_target_groups_input :
  ?page_size:page_size ->
  ?marker:marker ->
  ?names:target_group_names ->
  ?target_group_arns:target_group_arns ->
  ?load_balancer_arn:load_balancer_arn ->
  unit ->
  describe_target_groups_input

val make_describe_target_group_attributes_output :
  ?attributes:target_group_attributes -> unit -> describe_target_group_attributes_output

val make_describe_target_group_attributes_input :
  target_group_arn:target_group_arn -> unit -> describe_target_group_attributes_input

val make_describe_tags_output : ?tag_descriptions:tag_descriptions -> unit -> describe_tags_output
val make_describe_tags_input : resource_arns:resource_arns -> unit -> describe_tags_input

val make_describe_ssl_policies_output :
  ?next_marker:marker -> ?ssl_policies:ssl_policies -> unit -> describe_ssl_policies_output

val make_describe_ssl_policies_input :
  ?load_balancer_type:load_balancer_type_enum ->
  ?page_size:page_size ->
  ?marker:marker ->
  ?names:ssl_policy_names ->
  unit ->
  describe_ssl_policies_input

val make_describe_rules_output :
  ?next_marker:marker -> ?rules:rules -> unit -> describe_rules_output

val make_describe_rules_input :
  ?page_size:page_size ->
  ?marker:marker ->
  ?rule_arns:rule_arns ->
  ?listener_arn:listener_arn ->
  unit ->
  describe_rules_input

val make_describe_load_balancers_output :
  ?next_marker:marker -> ?load_balancers:load_balancers -> unit -> describe_load_balancers_output

val make_describe_load_balancers_input :
  ?page_size:page_size ->
  ?marker:marker ->
  ?names:load_balancer_names ->
  ?load_balancer_arns:load_balancer_arns ->
  unit ->
  describe_load_balancers_input

val make_describe_load_balancer_attributes_output :
  ?attributes:load_balancer_attributes -> unit -> describe_load_balancer_attributes_output

val make_describe_load_balancer_attributes_input :
  load_balancer_arn:load_balancer_arn -> unit -> describe_load_balancer_attributes_input

val make_describe_listeners_output :
  ?next_marker:marker -> ?listeners:listeners -> unit -> describe_listeners_output

val make_describe_listeners_input :
  ?page_size:page_size ->
  ?marker:marker ->
  ?listener_arns:listener_arns ->
  ?load_balancer_arn:load_balancer_arn ->
  unit ->
  describe_listeners_input

val make_describe_listener_certificates_output :
  ?next_marker:marker ->
  ?certificates:certificate_list ->
  unit ->
  describe_listener_certificates_output

val make_describe_listener_certificates_input :
  ?page_size:page_size ->
  ?marker:marker ->
  listener_arn:listener_arn ->
  unit ->
  describe_listener_certificates_input

val make_describe_listener_attributes_output :
  ?attributes:listener_attributes -> unit -> describe_listener_attributes_output

val make_describe_listener_attributes_input :
  listener_arn:listener_arn -> unit -> describe_listener_attributes_input

val make_describe_capacity_reservation_output :
  ?capacity_reservation_state:zonal_capacity_reservation_states ->
  ?minimum_load_balancer_capacity:minimum_load_balancer_capacity ->
  ?decrease_requests_remaining:decrease_requests_remaining ->
  ?last_modified_time:last_modified_time ->
  unit ->
  describe_capacity_reservation_output

val make_describe_capacity_reservation_input :
  load_balancer_arn:load_balancer_arn -> unit -> describe_capacity_reservation_input

val make_describe_account_limits_output :
  ?next_marker:marker -> ?limits:limits -> unit -> describe_account_limits_output

val make_describe_account_limits_input :
  ?page_size:page_size -> ?marker:marker -> unit -> describe_account_limits_input

val make_deregister_targets_output : unit -> unit

val make_deregister_targets_input :
  targets:target_descriptions ->
  target_group_arn:target_group_arn ->
  unit ->
  deregister_targets_input

val make_delete_trust_store_output : unit -> unit

val make_delete_trust_store_input :
  trust_store_arn:trust_store_arn -> unit -> delete_trust_store_input

val make_delete_target_group_output : unit -> unit

val make_delete_target_group_input :
  target_group_arn:target_group_arn -> unit -> delete_target_group_input

val make_delete_shared_trust_store_association_output : unit -> unit

val make_delete_shared_trust_store_association_input :
  resource_arn:resource_arn ->
  trust_store_arn:trust_store_arn ->
  unit ->
  delete_shared_trust_store_association_input

val make_delete_rule_output : unit -> unit
val make_delete_rule_input : rule_arn:rule_arn -> unit -> delete_rule_input
val make_delete_load_balancer_output : unit -> unit

val make_delete_load_balancer_input :
  load_balancer_arn:load_balancer_arn -> unit -> delete_load_balancer_input

val make_delete_listener_output : unit -> unit
val make_delete_listener_input : listener_arn:listener_arn -> unit -> delete_listener_input
val make_create_trust_store_output : ?trust_stores:trust_stores -> unit -> create_trust_store_output

val make_create_trust_store_input :
  ?tags:tag_list ->
  ?ca_certificates_bundle_s3_object_version:s3_object_version ->
  ca_certificates_bundle_s3_key:s3_key ->
  ca_certificates_bundle_s3_bucket:s3_bucket ->
  name:trust_store_name ->
  unit ->
  create_trust_store_input

val make_create_target_group_output :
  ?target_groups:target_groups -> unit -> create_target_group_output

val make_create_target_group_input :
  ?target_control_port:target_control_port ->
  ?ip_address_type:target_group_ip_address_type_enum ->
  ?tags:tag_list ->
  ?target_type:target_type_enum ->
  ?matcher:matcher ->
  ?unhealthy_threshold_count:health_check_threshold_count ->
  ?healthy_threshold_count:health_check_threshold_count ->
  ?health_check_timeout_seconds:health_check_timeout_seconds ->
  ?health_check_interval_seconds:health_check_interval_seconds ->
  ?health_check_path:path ->
  ?health_check_enabled:health_check_enabled ->
  ?health_check_port:health_check_port ->
  ?health_check_protocol:protocol_enum ->
  ?vpc_id:vpc_id ->
  ?port:port ->
  ?protocol_version:protocol_version ->
  ?protocol:protocol_enum ->
  name:target_group_name ->
  unit ->
  create_target_group_input

val make_create_rule_output : ?rules:rules -> unit -> create_rule_output

val make_create_rule_input :
  ?transforms:rule_transform_list ->
  ?tags:tag_list ->
  actions:actions ->
  priority:rule_priority ->
  conditions:rule_condition_list ->
  listener_arn:listener_arn ->
  unit ->
  create_rule_input

val make_create_load_balancer_output :
  ?load_balancers:load_balancers -> unit -> create_load_balancer_output

val make_create_load_balancer_input :
  ?ipam_pools:ipam_pools ->
  ?enable_prefix_for_ipv6_source_nat:enable_prefix_for_ipv6_source_nat_enum ->
  ?customer_owned_ipv4_pool:customer_owned_ipv4_pool ->
  ?ip_address_type:ip_address_type ->
  ?type_:load_balancer_type_enum ->
  ?tags:tag_list ->
  ?scheme:load_balancer_scheme_enum ->
  ?security_groups:security_groups ->
  ?subnet_mappings:subnet_mappings ->
  ?subnets:subnets ->
  name:load_balancer_name ->
  unit ->
  create_load_balancer_input

val make_create_listener_output : ?listeners:listeners -> unit -> create_listener_output

val make_create_listener_input :
  ?mutual_authentication:mutual_authentication_attributes ->
  ?tags:tag_list ->
  ?alpn_policy:alpn_policy_name ->
  ?certificates:certificate_list ->
  ?ssl_policy:ssl_policy_name ->
  ?port:port ->
  ?protocol:protocol_enum ->
  default_actions:actions ->
  load_balancer_arn:load_balancer_arn ->
  unit ->
  create_listener_input

val make_add_trust_store_revocations_output :
  ?trust_store_revocations:trust_store_revocations -> unit -> add_trust_store_revocations_output

val make_add_trust_store_revocations_input :
  ?revocation_contents:revocation_contents ->
  trust_store_arn:trust_store_arn ->
  unit ->
  add_trust_store_revocations_input

val make_add_tags_output : unit -> unit
val make_add_tags_input : tags:tag_list -> resource_arns:resource_arns -> unit -> add_tags_input

val make_add_listener_certificates_output :
  ?certificates:certificate_list -> unit -> add_listener_certificates_output

val make_add_listener_certificates_input :
  certificates:certificate_list ->
  listener_arn:listener_arn ->
  unit ->
  add_listener_certificates_input
