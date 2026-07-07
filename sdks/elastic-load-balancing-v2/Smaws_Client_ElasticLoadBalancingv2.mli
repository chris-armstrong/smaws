(** Elastic Load Balancing v2 client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module AddListenerCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CertificateNotFoundException of certificate_not_found_exception
    | `ListenerNotFoundException of listener_not_found_exception
    | `TooManyCertificatesException of too_many_certificates_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_listener_certificates_input ->
    ( add_listener_certificates_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CertificateNotFoundException of certificate_not_found_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `TooManyCertificatesException of too_many_certificates_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_listener_certificates_input ->
    ( add_listener_certificates_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CertificateNotFoundException of certificate_not_found_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `TooManyCertificatesException of too_many_certificates_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds the specified SSL server certificate to the certificate list for the specified HTTPS or \
   TLS listener.\n\n\
  \ If the certificate in already in the certificate list, the call is successful but the \
   certificate is not added again.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/https-listener-certificates.html}SSL \
   certificates} in the {i Application Load Balancers Guide} or \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/tls-listener-certificates.html}Server \
   certificates} in the {i Network Load Balancers Guide}.\n\
  \  "]

module AddTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `ListenerNotFoundException of listener_not_found_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `RuleNotFoundException of rule_not_found_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception
    | `TooManyTagsException of too_many_tags_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_input ->
    ( add_tags_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_input ->
    ( add_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds the specified tags to the specified Elastic Load Balancing resource. You can tag your \
   Application Load Balancers, Network Load Balancers, Gateway Load Balancers, target groups, \
   trust stores, listeners, and rules.\n\n\
  \ Each tag consists of a key and an optional value. If a resource already has a tag with the \
   same key, [AddTags] updates its value.\n\
  \ "]

module AddTrustStoreRevocations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidRevocationContentException of invalid_revocation_content_exception
    | `RevocationContentNotFoundException of revocation_content_not_found_exception
    | `TooManyTrustStoreRevocationEntriesException of
      too_many_trust_store_revocation_entries_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_trust_store_revocations_input ->
    ( add_trust_store_revocations_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidRevocationContentException of invalid_revocation_content_exception
      | `RevocationContentNotFoundException of revocation_content_not_found_exception
      | `TooManyTrustStoreRevocationEntriesException of
        too_many_trust_store_revocation_entries_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_trust_store_revocations_input ->
    ( add_trust_store_revocations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidRevocationContentException of invalid_revocation_content_exception
      | `RevocationContentNotFoundException of revocation_content_not_found_exception
      | `TooManyTrustStoreRevocationEntriesException of
        too_many_trust_store_revocation_entries_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds the specified revocation file to the specified trust store.\n"]

module CreateListener : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ALPNPolicyNotSupportedException of alpn_policy_not_supported_exception
    | `CertificateNotFoundException of certificate_not_found_exception
    | `DuplicateListenerException of duplicate_listener_exception
    | `IncompatibleProtocolsException of incompatible_protocols_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `SSLPolicyNotFoundException of ssl_policy_not_found_exception
    | `TargetGroupAssociationLimitException of target_group_association_limit_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception
    | `TooManyActionsException of too_many_actions_exception
    | `TooManyCertificatesException of too_many_certificates_exception
    | `TooManyListenersException of too_many_listeners_exception
    | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
    | `TooManyTagsException of too_many_tags_exception
    | `TooManyTargetsException of too_many_targets_exception
    | `TooManyUniqueTargetGroupsPerLoadBalancerException of
      too_many_unique_target_groups_per_load_balancer_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception
    | `TrustStoreNotReadyException of trust_store_not_ready_exception
    | `UnsupportedProtocolException of unsupported_protocol_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_listener_input ->
    ( create_listener_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ALPNPolicyNotSupportedException of alpn_policy_not_supported_exception
      | `CertificateNotFoundException of certificate_not_found_exception
      | `DuplicateListenerException of duplicate_listener_exception
      | `IncompatibleProtocolsException of incompatible_protocols_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `SSLPolicyNotFoundException of ssl_policy_not_found_exception
      | `TargetGroupAssociationLimitException of target_group_association_limit_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyActionsException of too_many_actions_exception
      | `TooManyCertificatesException of too_many_certificates_exception
      | `TooManyListenersException of too_many_listeners_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TooManyTargetsException of too_many_targets_exception
      | `TooManyUniqueTargetGroupsPerLoadBalancerException of
        too_many_unique_target_groups_per_load_balancer_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception
      | `TrustStoreNotReadyException of trust_store_not_ready_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_listener_input ->
    ( create_listener_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ALPNPolicyNotSupportedException of alpn_policy_not_supported_exception
      | `CertificateNotFoundException of certificate_not_found_exception
      | `DuplicateListenerException of duplicate_listener_exception
      | `IncompatibleProtocolsException of incompatible_protocols_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `SSLPolicyNotFoundException of ssl_policy_not_found_exception
      | `TargetGroupAssociationLimitException of target_group_association_limit_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyActionsException of too_many_actions_exception
      | `TooManyCertificatesException of too_many_certificates_exception
      | `TooManyListenersException of too_many_listeners_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TooManyTargetsException of too_many_targets_exception
      | `TooManyUniqueTargetGroupsPerLoadBalancerException of
        too_many_unique_target_groups_per_load_balancer_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception
      | `TrustStoreNotReadyException of trust_store_not_ready_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a listener for the specified Application Load Balancer, Network Load Balancer, or \
   Gateway Load Balancer.\n\n\
  \ For more information, see the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html}Listeners \
   for your Application Load Balancers} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-listeners.html}Listeners \
   for your Network Load Balancers} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-listeners.html}Listeners \
   for your Gateway Load Balancers} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   This operation is idempotent, which means that it completes at most one time. If you attempt \
   to create multiple listeners with the same settings, each call succeeds.\n\
  \   "]

module CreateLoadBalancer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AllocationIdNotFoundException of allocation_id_not_found_exception
    | `AvailabilityZoneNotSupportedException of availability_zone_not_supported_exception
    | `DuplicateLoadBalancerNameException of duplicate_load_balancer_name_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidSchemeException of invalid_scheme_exception
    | `InvalidSecurityGroupException of invalid_security_group_exception
    | `InvalidSubnetException of invalid_subnet_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `SubnetNotFoundException of subnet_not_found_exception
    | `TooManyLoadBalancersException of too_many_load_balancers_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_load_balancer_input ->
    ( create_load_balancer_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AllocationIdNotFoundException of allocation_id_not_found_exception
      | `AvailabilityZoneNotSupportedException of availability_zone_not_supported_exception
      | `DuplicateLoadBalancerNameException of duplicate_load_balancer_name_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSchemeException of invalid_scheme_exception
      | `InvalidSecurityGroupException of invalid_security_group_exception
      | `InvalidSubnetException of invalid_subnet_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `SubnetNotFoundException of subnet_not_found_exception
      | `TooManyLoadBalancersException of too_many_load_balancers_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_load_balancer_input ->
    ( create_load_balancer_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AllocationIdNotFoundException of allocation_id_not_found_exception
      | `AvailabilityZoneNotSupportedException of availability_zone_not_supported_exception
      | `DuplicateLoadBalancerNameException of duplicate_load_balancer_name_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSchemeException of invalid_scheme_exception
      | `InvalidSecurityGroupException of invalid_security_group_exception
      | `InvalidSubnetException of invalid_subnet_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `SubnetNotFoundException of subnet_not_found_exception
      | `TooManyLoadBalancersException of too_many_load_balancers_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Application Load Balancer, Network Load Balancer, or Gateway Load Balancer.\n\n\
  \ For more information, see the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html}Application \
   Load Balancers} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html}Network \
   Load Balancers} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-load-balancers.html}Gateway \
   Load Balancers} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   This operation is idempotent, which means that it completes at most one time. If you attempt \
   to create multiple load balancers with the same settings, each call succeeds.\n\
  \   "]

module CreateRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `IncompatibleProtocolsException of incompatible_protocols_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
    | `ListenerNotFoundException of listener_not_found_exception
    | `PriorityInUseException of priority_in_use_exception
    | `TargetGroupAssociationLimitException of target_group_association_limit_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception
    | `TooManyActionsException of too_many_actions_exception
    | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
    | `TooManyRulesException of too_many_rules_exception
    | `TooManyTagsException of too_many_tags_exception
    | `TooManyTargetGroupsException of too_many_target_groups_exception
    | `TooManyTargetsException of too_many_targets_exception
    | `TooManyUniqueTargetGroupsPerLoadBalancerException of
      too_many_unique_target_groups_per_load_balancer_exception
    | `UnsupportedProtocolException of unsupported_protocol_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_rule_input ->
    ( create_rule_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IncompatibleProtocolsException of incompatible_protocols_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `PriorityInUseException of priority_in_use_exception
      | `TargetGroupAssociationLimitException of target_group_association_limit_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyActionsException of too_many_actions_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyRulesException of too_many_rules_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TooManyTargetGroupsException of too_many_target_groups_exception
      | `TooManyTargetsException of too_many_targets_exception
      | `TooManyUniqueTargetGroupsPerLoadBalancerException of
        too_many_unique_target_groups_per_load_balancer_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_rule_input ->
    ( create_rule_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IncompatibleProtocolsException of incompatible_protocols_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `PriorityInUseException of priority_in_use_exception
      | `TargetGroupAssociationLimitException of target_group_association_limit_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyActionsException of too_many_actions_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyRulesException of too_many_rules_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TooManyTargetGroupsException of too_many_target_groups_exception
      | `TooManyTargetsException of too_many_targets_exception
      | `TooManyUniqueTargetGroupsPerLoadBalancerException of
        too_many_unique_target_groups_per_load_balancer_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a rule for the specified listener. The listener must be associated with an Application \
   Load Balancer.\n\n\
  \ Each rule consists of a priority, one or more actions, one or more conditions, and up to two \
   optional transforms. Rules are evaluated in priority order, from the lowest value to the \
   highest value. When the conditions for a rule are met, its actions are performed. If the \
   conditions for no rules are met, the actions for the default rule are performed. For more \
   information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#listener-rules}Listener \
   rules} in the {i Application Load Balancers Guide}.\n\
  \ "]

module CreateTargetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DuplicateTargetGroupNameException of duplicate_target_group_name_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `TooManyTagsException of too_many_tags_exception
    | `TooManyTargetGroupsException of too_many_target_groups_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_target_group_input ->
    ( create_target_group_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DuplicateTargetGroupNameException of duplicate_target_group_name_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TooManyTargetGroupsException of too_many_target_groups_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_target_group_input ->
    ( create_target_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DuplicateTargetGroupNameException of duplicate_target_group_name_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TooManyTargetGroupsException of too_many_target_groups_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a target group.\n\n\
  \ For more information, see the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html}Target \
   groups for your Application Load Balancers} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html}Target \
   groups for your Network Load Balancers} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-groups.html}Target \
   groups for your Gateway Load Balancers} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   This operation is idempotent, which means that it completes at most one time. If you attempt \
   to create multiple target groups with the same settings, each call succeeds.\n\
  \   "]

module CreateTrustStore : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CaCertificatesBundleNotFoundException of ca_certificates_bundle_not_found_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `DuplicateTrustStoreNameException of duplicate_trust_store_name_exception
    | `InvalidCaCertificatesBundleException of invalid_ca_certificates_bundle_exception
    | `TooManyTagsException of too_many_tags_exception
    | `TooManyTrustStoresException of too_many_trust_stores_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_trust_store_input ->
    ( create_trust_store_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CaCertificatesBundleNotFoundException of ca_certificates_bundle_not_found_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `DuplicateTrustStoreNameException of duplicate_trust_store_name_exception
      | `InvalidCaCertificatesBundleException of invalid_ca_certificates_bundle_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TooManyTrustStoresException of too_many_trust_stores_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_trust_store_input ->
    ( create_trust_store_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CaCertificatesBundleNotFoundException of ca_certificates_bundle_not_found_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `DuplicateTrustStoreNameException of duplicate_trust_store_name_exception
      | `InvalidCaCertificatesBundleException of invalid_ca_certificates_bundle_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TooManyTrustStoresException of too_many_trust_stores_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a trust store.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/mutual-authentication.html}Mutual \
   TLS for Application Load Balancers}.\n\
  \ "]

module DeleteListener : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ListenerNotFoundException of listener_not_found_exception
    | `ResourceInUseException of resource_in_use_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_listener_input ->
    ( delete_listener_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `ResourceInUseException of resource_in_use_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_listener_input ->
    ( delete_listener_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `ResourceInUseException of resource_in_use_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified listener.\n\n\
  \ Alternatively, your listener is deleted when you delete the load balancer to which it is \
   attached.\n\
  \ "]

module DeleteLoadBalancer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_load_balancer_input ->
    ( delete_load_balancer_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_load_balancer_input ->
    ( delete_load_balancer_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified Application Load Balancer, Network Load Balancer, or Gateway Load \
   Balancer. Deleting a load balancer also deletes its listeners.\n\n\
  \ You can't delete a load balancer if deletion protection is enabled. If the load balancer does \
   not exist or has already been deleted, the call succeeds.\n\
  \ \n\
  \  Deleting a load balancer does not affect its registered targets. For example, your EC2 \
   instances continue to run and are still registered to their target groups. If you no longer \
   need these EC2 instances, you can stop or terminate them.\n\
  \  "]

module DeleteRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RuleNotFoundException of rule_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_rule_input ->
    ( delete_rule_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RuleNotFoundException of rule_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_rule_input ->
    ( delete_rule_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RuleNotFoundException of rule_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified rule.\n\n You can't delete the default rule.\n "]

module DeleteSharedTrustStoreAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DeleteAssociationSameAccountException of delete_association_same_account_exception
    | `TrustStoreAssociationNotFoundException of trust_store_association_not_found_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_shared_trust_store_association_input ->
    ( delete_shared_trust_store_association_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DeleteAssociationSameAccountException of delete_association_same_account_exception
      | `TrustStoreAssociationNotFoundException of trust_store_association_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_shared_trust_store_association_input ->
    ( delete_shared_trust_store_association_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DeleteAssociationSameAccountException of delete_association_same_account_exception
      | `TrustStoreAssociationNotFoundException of trust_store_association_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a shared trust store association.\n"]

module DeleteTargetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceInUseException of resource_in_use_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_target_group_input ->
    ( delete_target_group_output,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceInUseException of resource_in_use_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_target_group_input ->
    ( delete_target_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceInUseException of resource_in_use_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified target group.\n\n\
  \ You can delete a target group if it is not referenced by any actions. Deleting a target group \
   also deletes any associated health checks. Deleting a target group does not affect its \
   registered targets. For example, any EC2 instances continue to run until you stop or terminate \
   them.\n\
  \ "]

module DeleteTrustStore : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `TrustStoreInUseException of trust_store_in_use_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_trust_store_input ->
    ( delete_trust_store_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TrustStoreInUseException of trust_store_in_use_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_trust_store_input ->
    ( delete_trust_store_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TrustStoreInUseException of trust_store_in_use_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a trust store.\n"]

module DeregisterTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidTargetException of invalid_target_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_targets_input ->
    ( deregister_targets_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTargetException of invalid_target_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_targets_input ->
    ( deregister_targets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTargetException of invalid_target_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deregisters the specified targets from the specified target group. After the targets are \
   deregistered, they no longer receive traffic from the load balancer.\n\n\
  \ The load balancer stops sending requests to targets that are deregistering, but uses \
   connection draining to ensure that in-flight traffic completes on the existing connections. \
   This deregistration delay is configured by default but can be updated for each target group.\n\
  \ \n\
  \  For more information, see the following:\n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/edit-target-group-attributes.html#deregistration-delay} \
   Deregistration delay} in the {i Application Load Balancers User Guide} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/edit-target-group-attributes.html#deregistration-delay} \
   Deregistration delay} in the {i Network Load Balancers User Guide} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/edit-target-group-attributes.html#deregistration-delay} \
   Deregistration delay} in the {i Gateway Load Balancers User Guide} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   Note: If the specified target does not exist, the action returns successfully.\n\
  \   "]

module DescribeAccountLimits : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_limits_input ->
    (describe_account_limits_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_limits_input ->
    ( describe_account_limits_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the current Elastic Load Balancing resource limits for your Amazon Web Services \
   account.\n\n\
  \ For more information, see the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html}Quotas \
   for your Application Load Balancers} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-limits.html}Quotas \
   for your Network Load Balancers} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/quotas-limits.html}Quotas \
   for your Gateway Load Balancers} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeCapacityReservation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_capacity_reservation_input ->
    ( describe_capacity_reservation_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_capacity_reservation_input ->
    ( describe_capacity_reservation_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the capacity reservation status for the specified load balancer.\n"]

module DescribeListenerAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_listener_attributes_input ->
    ( describe_listener_attributes_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_listener_attributes_input ->
    ( describe_listener_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the attributes for the specified listener.\n"]

module DescribeListenerCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_listener_certificates_input ->
    ( describe_listener_certificates_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_listener_certificates_input ->
    ( describe_listener_certificates_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the default certificate and the certificate list for the specified HTTPS or TLS \
   listener.\n\n\
  \ If the default certificate is also in the certificate list, it appears twice in the results \
   (once with [IsDefault] set to true and once with [IsDefault] set to false).\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/https-listener-certificates.html}SSL \
   certificates} in the {i Application Load Balancers Guide} or \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/tls-listener-certificates.html}Server \
   certificates} in the {i Network Load Balancers Guide}.\n\
  \  "]

module DescribeListeners : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ListenerNotFoundException of listener_not_found_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `UnsupportedProtocolException of unsupported_protocol_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_listeners_input ->
    ( describe_listeners_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_listeners_input ->
    ( describe_listeners_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified listeners or the listeners for the specified Application Load Balancer, \
   Network Load Balancer, or Gateway Load Balancer. You must specify either a load balancer or one \
   or more listeners.\n"]

module DescribeLoadBalancerAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancer_attributes_input ->
    ( describe_load_balancer_attributes_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancer_attributes_input ->
    ( describe_load_balancer_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the attributes for the specified Application Load Balancer, Network Load Balancer, or \
   Gateway Load Balancer.\n\n\
  \ For more information, see the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html#load-balancer-attributes}Load \
   balancer attributes} in the {i Application Load Balancers Guide} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html#load-balancer-attributes}Load \
   balancer attributes} in the {i Network Load Balancers Guide} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-load-balancers.html#load-balancer-attributes}Load \
   balancer attributes} in the {i Gateway Load Balancers Guide} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeLoadBalancers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancers_input ->
    ( describe_load_balancers_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancers_input ->
    ( describe_load_balancers_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified load balancers or all of your load balancers.\n"]

module DescribeRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ListenerNotFoundException of listener_not_found_exception
    | `RuleNotFoundException of rule_not_found_exception
    | `UnsupportedProtocolException of unsupported_protocol_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_rules_input ->
    ( describe_rules_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_rules_input ->
    ( describe_rules_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified rules or the rules for the specified listener. You must specify either \
   a listener or rules.\n"]

module DescribeSSLPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `SSLPolicyNotFoundException of ssl_policy_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_ssl_policies_input ->
    ( describe_ssl_policies_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `SSLPolicyNotFoundException of ssl_policy_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_ssl_policies_input ->
    ( describe_ssl_policies_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `SSLPolicyNotFoundException of ssl_policy_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified policies or all policies used for SSL negotiation.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/describe-ssl-policies.html}Security \
   policies} in the {i Application Load Balancers Guide} and \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/describe-ssl-policies.html}Security \
   policies} in the {i Network Load Balancers Guide}.\n\
  \ "]

module DescribeTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ListenerNotFoundException of listener_not_found_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `RuleNotFoundException of rule_not_found_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_input ->
    ( describe_tags_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_input ->
    ( describe_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the tags for the specified Elastic Load Balancing resources. You can describe the \
   tags for one or more Application Load Balancers, Network Load Balancers, Gateway Load \
   Balancers, target groups, listeners, or rules.\n"]

module DescribeTargetGroupAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `TargetGroupNotFoundException of target_group_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_target_group_attributes_input ->
    ( describe_target_group_attributes_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TargetGroupNotFoundException of target_group_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_target_group_attributes_input ->
    ( describe_target_group_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TargetGroupNotFoundException of target_group_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the attributes for the specified target group.\n\n\
  \ For more information, see the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html#target-group-attributes}Target \
   group attributes} in the {i Application Load Balancers Guide} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html#target-group-attributes}Target \
   group attributes} in the {i Network Load Balancers Guide} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-groups.html#target-group-attributes}Target \
   group attributes} in the {i Gateway Load Balancers Guide} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeTargetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_target_groups_input ->
    ( describe_target_groups_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_target_groups_input ->
    ( describe_target_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified target groups or all of your target groups. By default, all target \
   groups are described. Alternatively, you can specify one of the following to filter the \
   results: the ARN of the load balancer, the names of one or more target groups, or the ARNs of \
   one or more target groups.\n"]

module DescribeTargetHealth : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `HealthUnavailableException of health_unavailable_exception
    | `InvalidTargetException of invalid_target_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_target_health_input ->
    ( describe_target_health_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HealthUnavailableException of health_unavailable_exception
      | `InvalidTargetException of invalid_target_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_target_health_input ->
    ( describe_target_health_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HealthUnavailableException of health_unavailable_exception
      | `InvalidTargetException of invalid_target_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the health of the specified targets or all of your targets.\n"]

module DescribeTrustStoreAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_trust_store_associations_input ->
    ( describe_trust_store_associations_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_trust_store_associations_input ->
    ( describe_trust_store_associations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes all resources associated with the specified trust store.\n"]

module DescribeTrustStoreRevocations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `RevocationIdNotFoundException of revocation_id_not_found_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_trust_store_revocations_input ->
    ( describe_trust_store_revocations_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RevocationIdNotFoundException of revocation_id_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_trust_store_revocations_input ->
    ( describe_trust_store_revocations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RevocationIdNotFoundException of revocation_id_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the revocation files in use by the specified trust store or revocation files.\n"]

module DescribeTrustStores : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_trust_stores_input ->
    ( describe_trust_stores_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_trust_stores_input ->
    ( describe_trust_stores_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes all trust stores for the specified account.\n"]

module GetResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_input ->
    ( get_resource_policy_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_input ->
    ( get_resource_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the resource policy for a specified resource.\n"]

module GetTrustStoreCaCertificatesBundle : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_trust_store_ca_certificates_bundle_input ->
    ( get_trust_store_ca_certificates_bundle_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_trust_store_ca_certificates_bundle_input ->
    ( get_trust_store_ca_certificates_bundle_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the ca certificate bundle.\n\n\
  \ This action returns a pre-signed S3 URI which is active for ten minutes.\n\
  \ "]

module GetTrustStoreRevocationContent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `RevocationIdNotFoundException of revocation_id_not_found_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_trust_store_revocation_content_input ->
    ( get_trust_store_revocation_content_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RevocationIdNotFoundException of revocation_id_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_trust_store_revocation_content_input ->
    ( get_trust_store_revocation_content_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RevocationIdNotFoundException of revocation_id_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the specified revocation file.\n\n\
  \ This action returns a pre-signed S3 URI which is active for ten minutes.\n\
  \ "]

module ModifyCapacityReservation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CapacityDecreaseRequestsLimitExceededException of
      capacity_decrease_requests_limit_exceeded_exception
    | `CapacityReservationPendingException of capacity_reservation_pending_exception
    | `CapacityUnitsLimitExceededException of capacity_units_limit_exceeded_exception
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `PriorRequestNotCompleteException of prior_request_not_complete_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_capacity_reservation_input ->
    ( modify_capacity_reservation_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CapacityDecreaseRequestsLimitExceededException of
        capacity_decrease_requests_limit_exceeded_exception
      | `CapacityReservationPendingException of capacity_reservation_pending_exception
      | `CapacityUnitsLimitExceededException of capacity_units_limit_exceeded_exception
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `PriorRequestNotCompleteException of prior_request_not_complete_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_capacity_reservation_input ->
    ( modify_capacity_reservation_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CapacityDecreaseRequestsLimitExceededException of
        capacity_decrease_requests_limit_exceeded_exception
      | `CapacityReservationPendingException of capacity_reservation_pending_exception
      | `CapacityUnitsLimitExceededException of capacity_units_limit_exceeded_exception
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `PriorRequestNotCompleteException of prior_request_not_complete_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the capacity reservation of the specified load balancer.\n\n\
  \ When modifying capacity reservation, you must include at least one \
   [MinimumLoadBalancerCapacity] or [ResetCapacityReservation].\n\
  \ "]

module ModifyIpPools : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_ip_pools_input ->
    ( modify_ip_pools_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_ip_pools_input ->
    ( modify_ip_pools_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "\\[Application Load Balancers\\] Modify the IP pool associated to a load balancer.\n"]

module ModifyListener : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ALPNPolicyNotSupportedException of alpn_policy_not_supported_exception
    | `CertificateNotFoundException of certificate_not_found_exception
    | `DuplicateListenerException of duplicate_listener_exception
    | `IncompatibleProtocolsException of incompatible_protocols_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
    | `ListenerNotFoundException of listener_not_found_exception
    | `SSLPolicyNotFoundException of ssl_policy_not_found_exception
    | `TargetGroupAssociationLimitException of target_group_association_limit_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception
    | `TooManyActionsException of too_many_actions_exception
    | `TooManyCertificatesException of too_many_certificates_exception
    | `TooManyListenersException of too_many_listeners_exception
    | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
    | `TooManyTargetsException of too_many_targets_exception
    | `TooManyUniqueTargetGroupsPerLoadBalancerException of
      too_many_unique_target_groups_per_load_balancer_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception
    | `TrustStoreNotReadyException of trust_store_not_ready_exception
    | `UnsupportedProtocolException of unsupported_protocol_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_listener_input ->
    ( modify_listener_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ALPNPolicyNotSupportedException of alpn_policy_not_supported_exception
      | `CertificateNotFoundException of certificate_not_found_exception
      | `DuplicateListenerException of duplicate_listener_exception
      | `IncompatibleProtocolsException of incompatible_protocols_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `SSLPolicyNotFoundException of ssl_policy_not_found_exception
      | `TargetGroupAssociationLimitException of target_group_association_limit_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyActionsException of too_many_actions_exception
      | `TooManyCertificatesException of too_many_certificates_exception
      | `TooManyListenersException of too_many_listeners_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyTargetsException of too_many_targets_exception
      | `TooManyUniqueTargetGroupsPerLoadBalancerException of
        too_many_unique_target_groups_per_load_balancer_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception
      | `TrustStoreNotReadyException of trust_store_not_ready_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_listener_input ->
    ( modify_listener_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ALPNPolicyNotSupportedException of alpn_policy_not_supported_exception
      | `CertificateNotFoundException of certificate_not_found_exception
      | `DuplicateListenerException of duplicate_listener_exception
      | `IncompatibleProtocolsException of incompatible_protocols_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `SSLPolicyNotFoundException of ssl_policy_not_found_exception
      | `TargetGroupAssociationLimitException of target_group_association_limit_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyActionsException of too_many_actions_exception
      | `TooManyCertificatesException of too_many_certificates_exception
      | `TooManyListenersException of too_many_listeners_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyTargetsException of too_many_targets_exception
      | `TooManyUniqueTargetGroupsPerLoadBalancerException of
        too_many_unique_target_groups_per_load_balancer_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception
      | `TrustStoreNotReadyException of trust_store_not_ready_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Replaces the specified properties of the specified listener. Any properties that you do not \
   specify remain unchanged.\n\n\
  \ Changing the protocol from HTTPS to HTTP, or from TLS to TCP, removes the security policy and \
   default certificate properties. If you change the protocol from HTTP to HTTPS, or from TCP to \
   TLS, you must add the security policy and default certificate properties.\n\
  \ \n\
  \  To add an item to a list, remove an item from a list, or update an item in a list, you must \
   provide the entire list. For example, to add an action, specify a list with the current actions \
   plus the new action.\n\
  \  "]

module ModifyListenerAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_listener_attributes_input ->
    ( modify_listener_attributes_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_listener_attributes_input ->
    ( modify_listener_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the specified attributes of the specified listener.\n"]

module ModifyLoadBalancerAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_load_balancer_attributes_input ->
    ( modify_load_balancer_attributes_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_load_balancer_attributes_input ->
    ( modify_load_balancer_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the specified attributes of the specified Application Load Balancer, Network Load \
   Balancer, or Gateway Load Balancer.\n\n\
  \ If any of the specified attributes can't be modified as requested, the call fails. Any \
   existing attributes that you do not modify retain their current values.\n\
  \ "]

module ModifyRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `IncompatibleProtocolsException of incompatible_protocols_exception
    | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RuleNotFoundException of rule_not_found_exception
    | `TargetGroupAssociationLimitException of target_group_association_limit_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception
    | `TooManyActionsException of too_many_actions_exception
    | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
    | `TooManyTargetsException of too_many_targets_exception
    | `TooManyUniqueTargetGroupsPerLoadBalancerException of
      too_many_unique_target_groups_per_load_balancer_exception
    | `UnsupportedProtocolException of unsupported_protocol_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_rule_input ->
    ( modify_rule_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IncompatibleProtocolsException of incompatible_protocols_exception
      | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `TargetGroupAssociationLimitException of target_group_association_limit_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyActionsException of too_many_actions_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyTargetsException of too_many_targets_exception
      | `TooManyUniqueTargetGroupsPerLoadBalancerException of
        too_many_unique_target_groups_per_load_balancer_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_rule_input ->
    ( modify_rule_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IncompatibleProtocolsException of incompatible_protocols_exception
      | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `TargetGroupAssociationLimitException of target_group_association_limit_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyActionsException of too_many_actions_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyTargetsException of too_many_targets_exception
      | `TooManyUniqueTargetGroupsPerLoadBalancerException of
        too_many_unique_target_groups_per_load_balancer_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Replaces the specified properties of the specified rule. Any properties that you do not specify \
   are unchanged.\n\n\
  \ To add an item to a list, remove an item from a list, or update an item in a list, you must \
   provide the entire list. For example, to add an action, specify a list with the current actions \
   plus the new action.\n\
  \ "]

module ModifyTargetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_target_group_input ->
    ( modify_target_group_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_target_group_input ->
    ( modify_target_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the health checks used when evaluating the health state of the targets in the \
   specified target group.\n"]

module ModifyTargetGroupAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_target_group_attributes_input ->
    ( modify_target_group_attributes_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_target_group_attributes_input ->
    ( modify_target_group_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the specified attributes of the specified target group.\n"]

module ModifyTrustStore : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CaCertificatesBundleNotFoundException of ca_certificates_bundle_not_found_exception
    | `InvalidCaCertificatesBundleException of invalid_ca_certificates_bundle_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_trust_store_input ->
    ( modify_trust_store_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CaCertificatesBundleNotFoundException of ca_certificates_bundle_not_found_exception
      | `InvalidCaCertificatesBundleException of invalid_ca_certificates_bundle_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_trust_store_input ->
    ( modify_trust_store_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CaCertificatesBundleNotFoundException of ca_certificates_bundle_not_found_exception
      | `InvalidCaCertificatesBundleException of invalid_ca_certificates_bundle_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update the ca certificate bundle for the specified trust store.\n"]

module RegisterTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidTargetException of invalid_target_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception
    | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
    | `TooManyTargetsException of too_many_targets_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_targets_input ->
    ( register_targets_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTargetException of invalid_target_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyTargetsException of too_many_targets_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_targets_input ->
    ( register_targets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTargetException of invalid_target_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyTargetsException of too_many_targets_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers the specified targets with the specified target group.\n\n\
  \ If the target is an EC2 instance, it must be in the [running] state when you register it.\n\
  \ \n\
  \  By default, the load balancer routes requests to registered targets using the protocol and \
   port for the target group. Alternatively, you can override the port for a target when you \
   register it. You can register each EC2 instance or IP address with the same target group \
   multiple times using different ports.\n\
  \  \n\
  \   For more information, see the following:\n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/target-group-register-targets.html}Register \
   targets for your Application Load Balancer} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/target-group-register-targets.html}Register \
   targets for your Network Load Balancer} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-group-register-targets.html}Register \
   targets for your Gateway Load Balancer} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module RemoveListenerCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ListenerNotFoundException of listener_not_found_exception
    | `OperationNotPermittedException of operation_not_permitted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_listener_certificates_input ->
    ( remove_listener_certificates_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_listener_certificates_input ->
    ( remove_listener_certificates_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified certificate from the certificate list for the specified HTTPS or TLS \
   listener.\n"]

module RemoveTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ListenerNotFoundException of listener_not_found_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `RuleNotFoundException of rule_not_found_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception
    | `TooManyTagsException of too_many_tags_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_input ->
    ( remove_tags_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_input ->
    ( remove_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified tags from the specified Elastic Load Balancing resources. You can remove \
   the tags for one or more Application Load Balancers, Network Load Balancers, Gateway Load \
   Balancers, target groups, listeners, or rules.\n"]

module RemoveTrustStoreRevocations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `RevocationIdNotFoundException of revocation_id_not_found_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_trust_store_revocations_input ->
    ( remove_trust_store_revocations_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RevocationIdNotFoundException of revocation_id_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_trust_store_revocations_input ->
    ( remove_trust_store_revocations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RevocationIdNotFoundException of revocation_id_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes the specified revocation file from the specified trust store.\n"]

module SetIpAddressType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidSubnetException of invalid_subnet_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_ip_address_type_input ->
    ( set_ip_address_type_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSubnetException of invalid_subnet_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_ip_address_type_input ->
    ( set_ip_address_type_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSubnetException of invalid_subnet_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Sets the type of IP addresses used by the subnets of the specified load balancer.\n"]

module SetRulePriorities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `PriorityInUseException of priority_in_use_exception
    | `RuleNotFoundException of rule_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_rule_priorities_input ->
    ( set_rule_priorities_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `PriorityInUseException of priority_in_use_exception
      | `RuleNotFoundException of rule_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_rule_priorities_input ->
    ( set_rule_priorities_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `PriorityInUseException of priority_in_use_exception
      | `RuleNotFoundException of rule_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the priorities of the specified rules.\n\n\
  \ You can reorder the rules as long as there are no priority conflicts in the new order. Any \
   existing rules that you do not specify retain their current priority.\n\
  \ "]

module SetSecurityGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidSecurityGroupException of invalid_security_group_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_security_groups_input ->
    ( set_security_groups_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSecurityGroupException of invalid_security_group_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_security_groups_input ->
    ( set_security_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSecurityGroupException of invalid_security_group_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified security groups with the specified Application Load Balancer or \
   Network Load Balancer. The specified security groups override the previously associated \
   security groups.\n\n\
  \ You can't perform this operation on a Network Load Balancer unless you specified a security \
   group for the load balancer when you created it.\n\
  \ \n\
  \  You can't associate a security group with a Gateway Load Balancer.\n\
  \  "]

(** {1:Serialization and Deserialization} *)
module SetSubnets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AllocationIdNotFoundException of allocation_id_not_found_exception
    | `AvailabilityZoneNotSupportedException of availability_zone_not_supported_exception
    | `CapacityReservationPendingException of capacity_reservation_pending_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidSubnetException of invalid_subnet_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `SubnetNotFoundException of subnet_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_subnets_input ->
    ( set_subnets_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AllocationIdNotFoundException of allocation_id_not_found_exception
      | `AvailabilityZoneNotSupportedException of availability_zone_not_supported_exception
      | `CapacityReservationPendingException of capacity_reservation_pending_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSubnetException of invalid_subnet_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `SubnetNotFoundException of subnet_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_subnets_input ->
    ( set_subnets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AllocationIdNotFoundException of allocation_id_not_found_exception
      | `AvailabilityZoneNotSupportedException of availability_zone_not_supported_exception
      | `CapacityReservationPendingException of capacity_reservation_pending_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSubnetException of invalid_subnet_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `SubnetNotFoundException of subnet_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables the Availability Zones for the specified public subnets for the specified Application \
   Load Balancer, Network Load Balancer or Gateway Load Balancer. The specified subnets replace \
   the previously enabled subnets.\n"]

module Query_serializers = Query_serializers
module Query_deserializers = Query_deserializers
