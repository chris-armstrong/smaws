(** WAFV2 client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_api_key_summary :
  ?token_domains:token_domains ->
  ?api_key:api_key ->
  ?creation_timestamp:timestamp ->
  ?version:api_key_version ->
  unit ->
  api_key_summary

val make_response_inspection_json :
  identifier:field_identifier ->
  success_values:response_inspection_json_success_values ->
  failure_values:response_inspection_json_failure_values ->
  unit ->
  response_inspection_json

val make_response_inspection_body_contains :
  success_strings:response_inspection_body_contains_success_strings ->
  failure_strings:response_inspection_body_contains_failure_strings ->
  unit ->
  response_inspection_body_contains

val make_response_inspection_header :
  name:response_inspection_header_name ->
  success_values:response_inspection_header_success_values ->
  failure_values:response_inspection_header_failure_values ->
  unit ->
  response_inspection_header

val make_response_inspection_status_code :
  success_codes:response_inspection_status_code_success_codes ->
  failure_codes:response_inspection_status_code_failure_codes ->
  unit ->
  response_inspection_status_code

val make_response_inspection :
  ?status_code:response_inspection_status_code ->
  ?header:response_inspection_header ->
  ?body_contains:response_inspection_body_contains ->
  ?json:response_inspection_json ->
  unit ->
  response_inspection

val make_address_field : identifier:field_identifier -> unit -> address_field
val make_phone_number_field : identifier:field_identifier -> unit -> phone_number_field
val make_email_field : identifier:field_identifier -> unit -> email_field
val make_password_field : identifier:field_identifier -> unit -> password_field
val make_username_field : identifier:field_identifier -> unit -> username_field

val make_request_inspection_acf_p :
  ?username_field:username_field ->
  ?password_field:password_field ->
  ?email_field:email_field ->
  ?phone_number_fields:phone_number_fields ->
  ?address_fields:address_fields ->
  payload_type:payload_type ->
  unit ->
  request_inspection_acf_p

val make_aws_managed_rules_acfp_rule_set :
  ?response_inspection:response_inspection ->
  ?enable_regex_in_path:boolean_ ->
  creation_path:creation_path_string ->
  registration_page_path:registration_page_path_string ->
  request_inspection:request_inspection_acf_p ->
  unit ->
  aws_managed_rules_acfp_rule_set

val make_request_inspection :
  payload_type:payload_type ->
  username_field:username_field ->
  password_field:password_field ->
  unit ->
  request_inspection

val make_aws_managed_rules_atp_rule_set :
  ?request_inspection:request_inspection ->
  ?response_inspection:response_inspection ->
  ?enable_regex_in_path:boolean_ ->
  login_path:string_ ->
  unit ->
  aws_managed_rules_atp_rule_set

val make_regex : ?regex_string:regex_pattern_string -> unit -> regex

val make_client_side_action :
  ?sensitivity:sensitivity_to_act ->
  ?exempt_uri_regular_expressions:regular_expression_list ->
  usage_of_action:usage_of_action ->
  unit ->
  client_side_action

val make_client_side_action_config :
  challenge:client_side_action -> unit -> client_side_action_config

val make_aws_managed_rules_anti_d_do_s_rule_set :
  ?sensitivity_to_block:sensitivity_to_act ->
  client_side_action_config:client_side_action_config ->
  unit ->
  aws_managed_rules_anti_d_do_s_rule_set

val make_aws_managed_rules_bot_control_rule_set :
  ?enable_machine_learning:enable_machine_learning ->
  inspection_level:inspection_level ->
  unit ->
  aws_managed_rules_bot_control_rule_set

val make_disallowed_feature :
  ?feature:pricing_plan_feature_name ->
  ?required_pricing_plan:required_pricing_plan_name ->
  unit ->
  disallowed_feature

val make_update_web_acl_response : ?next_lock_token:lock_token -> unit -> update_web_acl_response
val make_price : amount:price_amount -> currency:crypto_currency -> unit -> price

val make_payment_network :
  chain:blockchain_chain ->
  wallet_address:wallet_address ->
  prices:prices ->
  unit ->
  payment_network

val make_crypto_config : payment_networks:payment_networks -> unit -> crypto_config

val make_monetization_config :
  ?crypto_config:crypto_config -> ?currency_mode:currency_mode -> unit -> monetization_config

val make_application_attribute :
  ?name:attribute_name -> ?values:attribute_values -> unit -> application_attribute

val make_application_config : ?attributes:application_attributes -> unit -> application_config

val make_on_source_d_do_s_protection_config :
  alb_low_reputation_mode:low_reputation_mode -> unit -> on_source_d_do_s_protection_config

val make_request_body_associated_resource_type_config :
  default_size_inspection_limit:size_inspection_limit ->
  unit ->
  request_body_associated_resource_type_config

val make_association_config : ?request_body:request_body -> unit -> association_config
val make_immunity_time_property : immunity_time:time_window_second -> unit -> immunity_time_property

val make_challenge_config :
  ?immunity_time_property:immunity_time_property -> unit -> challenge_config

val make_captcha_config : ?immunity_time_property:immunity_time_property -> unit -> captcha_config

val make_custom_response_body :
  content_type:response_content_type -> content:response_content -> unit -> custom_response_body

val make_field_to_protect :
  ?field_keys:field_to_protect_keys -> field_type:field_to_protect_type -> unit -> field_to_protect

val make_data_protection :
  ?exclude_rule_match_details:boolean_ ->
  ?exclude_rate_based_details:boolean_ ->
  field:field_to_protect ->
  action:data_protection_action ->
  unit ->
  data_protection

val make_data_protection_config :
  data_protections:data_protections -> unit -> data_protection_config

val make_visibility_config :
  sampled_requests_enabled:boolean_ ->
  cloud_watch_metrics_enabled:boolean_ ->
  metric_name:metric_name ->
  unit ->
  visibility_config

val make_label : name:label_name -> unit -> label
val make_none_action : unit -> unit

val make_custom_http_header :
  name:custom_http_header_name -> value:custom_http_header_value -> unit -> custom_http_header

val make_custom_request_handling :
  insert_headers:custom_http_headers -> unit -> custom_request_handling

val make_count_action : ?custom_request_handling:custom_request_handling -> unit -> count_action
val make_override_action : ?count:count_action -> ?none:none_action -> unit -> override_action
val make_monetize_action : ?price_multiplier:price_multiplier -> unit -> monetize_action

val make_challenge_action :
  ?custom_request_handling:custom_request_handling -> unit -> challenge_action

val make_captcha_action : ?custom_request_handling:custom_request_handling -> unit -> captcha_action
val make_allow_action : ?custom_request_handling:custom_request_handling -> unit -> allow_action

val make_custom_response :
  ?custom_response_body_key:entity_name ->
  ?response_headers:custom_http_headers ->
  response_code:response_status_code ->
  unit ->
  custom_response

val make_block_action : ?custom_response:custom_response -> unit -> block_action

val make_rule_action :
  ?block:block_action ->
  ?allow:allow_action ->
  ?count:count_action ->
  ?captcha:captcha_action ->
  ?challenge:challenge_action ->
  ?monetize:monetize_action ->
  unit ->
  rule_action

val make_forwarded_ip_config :
  header_name:forwarded_ip_header_name ->
  fallback_behavior:fallback_behavior ->
  unit ->
  forwarded_ip_config

val make_asn_match_statement :
  ?forwarded_ip_config:forwarded_ip_config -> asn_list:asn_list -> unit -> asn_match_statement

val make_text_transformation :
  priority:text_transformation_priority ->
  type_:text_transformation_type ->
  unit ->
  text_transformation

val make_uri_fragment : ?fallback_behavior:fallback_behavior -> unit -> uri_fragment
val make_ja4_fingerprint : fallback_behavior:fallback_behavior -> unit -> ja4_fingerprint
val make_ja3_fingerprint : fallback_behavior:fallback_behavior -> unit -> ja3_fingerprint
val make_header_order : oversize_handling:oversize_handling -> unit -> header_order
val make_all : unit -> unit

val make_cookie_match_pattern :
  ?all:all ->
  ?included_cookies:cookie_names ->
  ?excluded_cookies:cookie_names ->
  unit ->
  cookie_match_pattern

val make_cookies :
  match_pattern:cookie_match_pattern ->
  match_scope:map_match_scope ->
  oversize_handling:oversize_handling ->
  unit ->
  cookies

val make_header_match_pattern :
  ?all:all ->
  ?included_headers:header_names ->
  ?excluded_headers:header_names ->
  unit ->
  header_match_pattern

val make_headers :
  match_pattern:header_match_pattern ->
  match_scope:map_match_scope ->
  oversize_handling:oversize_handling ->
  unit ->
  headers

val make_json_match_pattern :
  ?all:all -> ?included_paths:json_pointer_paths -> unit -> json_match_pattern

val make_json_body :
  ?invalid_fallback_behavior:body_parsing_fallback_behavior ->
  ?oversize_handling:oversize_handling ->
  match_pattern:json_match_pattern ->
  match_scope:json_match_scope ->
  unit ->
  json_body

val make_method_ : unit -> unit
val make_body : ?oversize_handling:oversize_handling -> unit -> body
val make_query_string : unit -> unit
val make_uri_path : unit -> unit
val make_all_query_arguments : unit -> unit
val make_single_query_argument : name:field_to_match_data -> unit -> single_query_argument
val make_single_header : name:field_to_match_data -> unit -> single_header

val make_field_to_match :
  ?single_header:single_header ->
  ?single_query_argument:single_query_argument ->
  ?all_query_arguments:all_query_arguments ->
  ?uri_path:uri_path ->
  ?query_string:query_string ->
  ?body:body ->
  ?method_:method_ ->
  ?json_body:json_body ->
  ?headers:headers ->
  ?cookies:cookies ->
  ?header_order:header_order ->
  ?ja3_fingerprint:ja3_fingerprint ->
  ?ja4_fingerprint:ja4_fingerprint ->
  ?uri_fragment:uri_fragment ->
  unit ->
  field_to_match

val make_regex_match_statement :
  regex_string:regex_pattern_string ->
  field_to_match:field_to_match ->
  text_transformations:text_transformations ->
  unit ->
  regex_match_statement

val make_label_match_statement :
  scope:label_match_scope -> key:label_match_key -> unit -> label_match_statement

val make_rule_action_override :
  name:entity_name -> action_to_use:rule_action -> unit -> rule_action_override

val make_managed_rule_group_config :
  ?login_path:login_path_string ->
  ?payload_type:payload_type ->
  ?username_field:username_field ->
  ?password_field:password_field ->
  ?aws_managed_rules_bot_control_rule_set:aws_managed_rules_bot_control_rule_set ->
  ?aws_managed_rules_atp_rule_set:aws_managed_rules_atp_rule_set ->
  ?aws_managed_rules_acfp_rule_set:aws_managed_rules_acfp_rule_set ->
  ?aws_managed_rules_anti_d_do_s_rule_set:aws_managed_rules_anti_d_do_s_rule_set ->
  unit ->
  managed_rule_group_config

val make_excluded_rule : name:entity_name -> unit -> excluded_rule
val make_rate_limit_asn : unit -> unit

val make_rate_limit_ja4_fingerprint :
  fallback_behavior:fallback_behavior -> unit -> rate_limit_ja4_fingerprint

val make_rate_limit_ja3_fingerprint :
  fallback_behavior:fallback_behavior -> unit -> rate_limit_ja3_fingerprint

val make_rate_limit_uri_path :
  text_transformations:text_transformations -> unit -> rate_limit_uri_path

val make_rate_limit_label_namespace :
  namespace:label_namespace -> unit -> rate_limit_label_namespace

val make_rate_limit_i_p : unit -> unit
val make_rate_limit_forwarded_i_p : unit -> unit
val make_rate_limit_http_method : unit -> unit

val make_rate_limit_query_string :
  text_transformations:text_transformations -> unit -> rate_limit_query_string

val make_rate_limit_query_argument :
  name:field_to_match_data ->
  text_transformations:text_transformations ->
  unit ->
  rate_limit_query_argument

val make_rate_limit_cookie :
  name:field_to_match_data -> text_transformations:text_transformations -> unit -> rate_limit_cookie

val make_rate_limit_header :
  name:field_to_match_data -> text_transformations:text_transformations -> unit -> rate_limit_header

val make_rate_based_statement_custom_key :
  ?header:rate_limit_header ->
  ?cookie:rate_limit_cookie ->
  ?query_argument:rate_limit_query_argument ->
  ?query_string:rate_limit_query_string ->
  ?http_method:rate_limit_http_method ->
  ?forwarded_i_p:rate_limit_forwarded_i_p ->
  ?i_p:rate_limit_i_p ->
  ?label_namespace:rate_limit_label_namespace ->
  ?uri_path:rate_limit_uri_path ->
  ?ja3_fingerprint:rate_limit_ja3_fingerprint ->
  ?ja4_fingerprint:rate_limit_ja4_fingerprint ->
  ?as_n:rate_limit_asn ->
  unit ->
  rate_based_statement_custom_key

val make_regex_pattern_set_reference_statement :
  ar_n:resource_arn ->
  field_to_match:field_to_match ->
  text_transformations:text_transformations ->
  unit ->
  regex_pattern_set_reference_statement

val make_ip_set_forwarded_ip_config :
  header_name:forwarded_ip_header_name ->
  fallback_behavior:fallback_behavior ->
  position:forwarded_ip_position ->
  unit ->
  ip_set_forwarded_ip_config

val make_ip_set_reference_statement :
  ?ip_set_forwarded_ip_config:ip_set_forwarded_ip_config ->
  ar_n:resource_arn ->
  unit ->
  ip_set_reference_statement

val make_rule_group_reference_statement :
  ?excluded_rules:excluded_rules ->
  ?rule_action_overrides:rule_action_overrides ->
  ar_n:resource_arn ->
  unit ->
  rule_group_reference_statement

val make_geo_match_statement :
  ?country_codes:country_codes ->
  ?forwarded_ip_config:forwarded_ip_config ->
  unit ->
  geo_match_statement

val make_size_constraint_statement :
  field_to_match:field_to_match ->
  comparison_operator:comparison_operator ->
  size:size ->
  text_transformations:text_transformations ->
  unit ->
  size_constraint_statement

val make_xss_match_statement :
  field_to_match:field_to_match ->
  text_transformations:text_transformations ->
  unit ->
  xss_match_statement

val make_sqli_match_statement :
  ?sensitivity_level:sensitivity_level ->
  field_to_match:field_to_match ->
  text_transformations:text_transformations ->
  unit ->
  sqli_match_statement

val make_byte_match_statement :
  search_string:search_string ->
  field_to_match:field_to_match ->
  text_transformations:text_transformations ->
  positional_constraint:positional_constraint ->
  unit ->
  byte_match_statement

val make_statement :
  ?byte_match_statement:byte_match_statement ->
  ?sqli_match_statement:sqli_match_statement ->
  ?xss_match_statement:xss_match_statement ->
  ?size_constraint_statement:size_constraint_statement ->
  ?geo_match_statement:geo_match_statement ->
  ?rule_group_reference_statement:rule_group_reference_statement ->
  ?ip_set_reference_statement:ip_set_reference_statement ->
  ?regex_pattern_set_reference_statement:regex_pattern_set_reference_statement ->
  ?rate_based_statement:rate_based_statement ->
  ?and_statement:and_statement ->
  ?or_statement:or_statement ->
  ?not_statement:not_statement ->
  ?managed_rule_group_statement:managed_rule_group_statement ->
  ?label_match_statement:label_match_statement ->
  ?regex_match_statement:regex_match_statement ->
  ?asn_match_statement:asn_match_statement ->
  unit ->
  statement

val make_rate_based_statement :
  ?evaluation_window_sec:evaluation_window_sec ->
  ?scope_down_statement:statement ->
  ?forwarded_ip_config:forwarded_ip_config ->
  ?custom_keys:rate_based_statement_custom_keys ->
  limit:rate_limit ->
  aggregate_key_type:rate_based_statement_aggregate_key_type ->
  unit ->
  rate_based_statement

val make_or_statement : statements:statements -> unit -> or_statement
val make_not_statement : statement:statement -> unit -> not_statement

val make_managed_rule_group_statement :
  ?version:version_key_string ->
  ?excluded_rules:excluded_rules ->
  ?scope_down_statement:statement ->
  ?managed_rule_group_configs:managed_rule_group_configs ->
  ?rule_action_overrides:rule_action_overrides ->
  vendor_name:vendor_name ->
  name:entity_name ->
  unit ->
  managed_rule_group_statement

val make_and_statement : statements:statements -> unit -> and_statement

val make_rule :
  ?action:rule_action ->
  ?override_action:override_action ->
  ?rule_labels:labels ->
  ?captcha_config:captcha_config ->
  ?challenge_config:challenge_config ->
  name:entity_name ->
  priority:rule_priority ->
  statement:statement ->
  visibility_config:visibility_config ->
  unit ->
  rule

val make_default_action : ?block:block_action -> ?allow:allow_action -> unit -> default_action

val make_update_web_acl_request :
  ?description:entity_description ->
  ?rules:rules ->
  ?data_protection_config:data_protection_config ->
  ?custom_response_bodies:custom_response_bodies ->
  ?captcha_config:captcha_config ->
  ?challenge_config:challenge_config ->
  ?token_domains:token_domains ->
  ?association_config:association_config ->
  ?on_source_d_do_s_protection_config:on_source_d_do_s_protection_config ->
  ?application_config:application_config ->
  ?monetization_config:monetization_config ->
  name:entity_name ->
  scope:scope ->
  id:entity_id ->
  default_action:default_action ->
  visibility_config:visibility_config ->
  lock_token:lock_token ->
  unit ->
  update_web_acl_request

val make_update_rule_group_response :
  ?next_lock_token:lock_token -> unit -> update_rule_group_response

val make_update_rule_group_request :
  ?description:entity_description ->
  ?rules:rules ->
  ?custom_response_bodies:custom_response_bodies ->
  ?monetization_config:monetization_config ->
  name:entity_name ->
  scope:scope ->
  id:entity_id ->
  visibility_config:visibility_config ->
  lock_token:lock_token ->
  unit ->
  update_rule_group_request

val make_update_regex_pattern_set_response :
  ?next_lock_token:lock_token -> unit -> update_regex_pattern_set_response

val make_update_regex_pattern_set_request :
  ?description:entity_description ->
  name:entity_name ->
  scope:scope ->
  id:entity_id ->
  regular_expression_list:regular_expression_list ->
  lock_token:lock_token ->
  unit ->
  update_regex_pattern_set_request

val make_update_managed_rule_set_version_expiry_date_response :
  ?expiring_version:version_key_string ->
  ?expiry_timestamp:timestamp ->
  ?next_lock_token:lock_token ->
  unit ->
  update_managed_rule_set_version_expiry_date_response

val make_update_managed_rule_set_version_expiry_date_request :
  name:entity_name ->
  scope:scope ->
  id:entity_id ->
  lock_token:lock_token ->
  version_to_expire:version_key_string ->
  expiry_timestamp:timestamp ->
  unit ->
  update_managed_rule_set_version_expiry_date_request

val make_update_ip_set_response : ?next_lock_token:lock_token -> unit -> update_ip_set_response

val make_update_ip_set_request :
  ?description:entity_description ->
  name:entity_name ->
  scope:scope ->
  id:entity_id ->
  addresses:ip_addresses ->
  lock_token:lock_token ->
  unit ->
  update_ip_set_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:resource_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_tag_resource_request :
  resource_ar_n:resource_arn -> tags:tag_list -> unit -> tag_resource_request

val make_put_permission_policy_response : unit -> unit

val make_put_permission_policy_request :
  resource_arn:resource_arn -> policy:policy_string -> unit -> put_permission_policy_request

val make_put_managed_rule_set_versions_response :
  ?next_lock_token:lock_token -> unit -> put_managed_rule_set_versions_response

val make_version_to_publish :
  ?associated_rule_group_arn:resource_arn ->
  ?forecasted_lifetime:time_window_day ->
  unit ->
  version_to_publish

val make_put_managed_rule_set_versions_request :
  ?recommended_version:version_key_string ->
  ?versions_to_publish:versions_to_publish ->
  name:entity_name ->
  scope:scope ->
  id:entity_id ->
  lock_token:lock_token ->
  unit ->
  put_managed_rule_set_versions_request

val make_label_name_condition : label_name:label_name -> unit -> label_name_condition
val make_action_condition : action:action_value -> unit -> action_condition

val make_condition :
  ?action_condition:action_condition ->
  ?label_name_condition:label_name_condition ->
  unit ->
  condition

val make_filter :
  behavior:filter_behavior ->
  requirement:filter_requirement ->
  conditions:conditions ->
  unit ->
  filter

val make_logging_filter :
  filters:filters -> default_behavior:filter_behavior -> unit -> logging_filter

val make_logging_configuration :
  ?redacted_fields:redacted_fields ->
  ?managed_by_firewall_manager:boolean_ ->
  ?logging_filter:logging_filter ->
  ?log_type:log_type ->
  ?log_scope:log_scope ->
  resource_arn:resource_arn ->
  log_destination_configs:log_destination_configs ->
  unit ->
  logging_configuration

val make_put_logging_configuration_response :
  ?logging_configuration:logging_configuration -> unit -> put_logging_configuration_response

val make_put_logging_configuration_request :
  logging_configuration:logging_configuration -> unit -> put_logging_configuration_request

val make_web_acl_summary :
  ?name:entity_name ->
  ?id:entity_id ->
  ?description:entity_description ->
  ?lock_token:lock_token ->
  ?ar_n:resource_arn ->
  unit ->
  web_acl_summary

val make_list_web_ac_ls_response :
  ?next_marker:next_marker -> ?web_ac_ls:web_acl_summaries -> unit -> list_web_ac_ls_response

val make_list_web_ac_ls_request :
  ?next_marker:next_marker ->
  ?limit:pagination_limit ->
  scope:scope ->
  unit ->
  list_web_ac_ls_request

val make_tag_info_for_resource :
  ?resource_ar_n:resource_arn -> ?tag_list:tag_list -> unit -> tag_info_for_resource

val make_list_tags_for_resource_response :
  ?next_marker:next_marker ->
  ?tag_info_for_resource:tag_info_for_resource ->
  unit ->
  list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?next_marker:next_marker ->
  ?limit:pagination_limit ->
  resource_ar_n:resource_arn ->
  unit ->
  list_tags_for_resource_request

val make_settlement_record :
  ?payer_address:settlement_filter_string ->
  ?wallet_address:settlement_filter_string ->
  ?currency:currency ->
  ?network:settlement_filter_string ->
  ?transaction_id:settlement_id_string ->
  ?request_id:settlement_filter_string ->
  ?source_name:filter_string ->
  ?organization:filter_string ->
  ?source_category:filter_string ->
  ?intent:filter_string ->
  ?verified:verified_status ->
  ?content_path:filter_string ->
  ?web_acl_arn:resource_arn ->
  ?request_timestamp:timestamp ->
  timestamp:timestamp ->
  status:settlement_status ->
  amount:monetization_amount_value ->
  unit ->
  settlement_record

val make_list_settlement_records_response :
  ?settlements:settlement_record_list ->
  ?next_marker:next_marker ->
  unit ->
  list_settlement_records_response

val make_monetization_filter :
  name:monetization_filter_name ->
  values:monetization_filter_value_list ->
  unit ->
  monetization_filter

val make_time_window : start_time:timestamp -> end_time:timestamp -> unit -> time_window

val make_list_settlement_records_request :
  ?filters:monetization_filter_list ->
  ?sort_by:settlement_sort_by ->
  ?sort_order:sort_order ->
  ?limit:settlement_record_limit ->
  ?next_marker:next_marker ->
  time_window:time_window ->
  scope:scope ->
  currency:currency ->
  unit ->
  list_settlement_records_request

val make_rule_group_summary :
  ?name:entity_name ->
  ?id:entity_id ->
  ?description:entity_description ->
  ?lock_token:lock_token ->
  ?ar_n:resource_arn ->
  unit ->
  rule_group_summary

val make_list_rule_groups_response :
  ?next_marker:next_marker -> ?rule_groups:rule_group_summaries -> unit -> list_rule_groups_response

val make_list_rule_groups_request :
  ?next_marker:next_marker ->
  ?limit:pagination_limit ->
  scope:scope ->
  unit ->
  list_rule_groups_request

val make_list_resources_for_web_acl_response :
  ?resource_arns:resource_arns -> unit -> list_resources_for_web_acl_response

val make_list_resources_for_web_acl_request :
  ?resource_type:resource_type ->
  web_acl_arn:resource_arn ->
  unit ->
  list_resources_for_web_acl_request

val make_regex_pattern_set_summary :
  ?name:entity_name ->
  ?id:entity_id ->
  ?description:entity_description ->
  ?lock_token:lock_token ->
  ?ar_n:resource_arn ->
  unit ->
  regex_pattern_set_summary

val make_list_regex_pattern_sets_response :
  ?next_marker:next_marker ->
  ?regex_pattern_sets:regex_pattern_set_summaries ->
  unit ->
  list_regex_pattern_sets_response

val make_list_regex_pattern_sets_request :
  ?next_marker:next_marker ->
  ?limit:pagination_limit ->
  scope:scope ->
  unit ->
  list_regex_pattern_sets_request

val make_release_summary :
  ?release_version:version_key_string -> ?timestamp:timestamp -> unit -> release_summary

val make_list_mobile_sdk_releases_response :
  ?release_summaries:release_summaries ->
  ?next_marker:next_marker ->
  unit ->
  list_mobile_sdk_releases_response

val make_list_mobile_sdk_releases_request :
  ?next_marker:next_marker ->
  ?limit:pagination_limit ->
  platform:platform ->
  unit ->
  list_mobile_sdk_releases_request

val make_managed_rule_set_summary :
  ?name:entity_name ->
  ?id:entity_id ->
  ?description:entity_description ->
  ?lock_token:lock_token ->
  ?ar_n:resource_arn ->
  ?label_namespace:label_name ->
  unit ->
  managed_rule_set_summary

val make_list_managed_rule_sets_response :
  ?next_marker:next_marker ->
  ?managed_rule_sets:managed_rule_set_summaries ->
  unit ->
  list_managed_rule_sets_response

val make_list_managed_rule_sets_request :
  ?next_marker:next_marker ->
  ?limit:pagination_limit ->
  scope:scope ->
  unit ->
  list_managed_rule_sets_request

val make_list_logging_configurations_response :
  ?logging_configurations:logging_configurations ->
  ?next_marker:next_marker ->
  unit ->
  list_logging_configurations_response

val make_list_logging_configurations_request :
  ?next_marker:next_marker ->
  ?limit:pagination_limit ->
  ?log_scope:log_scope ->
  scope:scope ->
  unit ->
  list_logging_configurations_request

val make_ip_set_summary :
  ?name:entity_name ->
  ?id:entity_id ->
  ?description:entity_description ->
  ?lock_token:lock_token ->
  ?ar_n:resource_arn ->
  unit ->
  ip_set_summary

val make_list_ip_sets_response :
  ?next_marker:next_marker -> ?ip_sets:ip_set_summaries -> unit -> list_ip_sets_response

val make_list_ip_sets_request :
  ?next_marker:next_marker -> ?limit:pagination_limit -> scope:scope -> unit -> list_ip_sets_request

val make_managed_rule_group_version :
  ?name:version_key_string -> ?last_update_timestamp:timestamp -> unit -> managed_rule_group_version

val make_list_available_managed_rule_group_versions_response :
  ?next_marker:next_marker ->
  ?versions:managed_rule_group_versions ->
  ?current_default_version:version_key_string ->
  unit ->
  list_available_managed_rule_group_versions_response

val make_list_available_managed_rule_group_versions_request :
  ?next_marker:next_marker ->
  ?limit:pagination_limit ->
  vendor_name:vendor_name ->
  name:entity_name ->
  scope:scope ->
  unit ->
  list_available_managed_rule_group_versions_request

val make_managed_rule_group_summary :
  ?vendor_name:vendor_name ->
  ?name:entity_name ->
  ?versioning_supported:boolean_ ->
  ?description:entity_description ->
  unit ->
  managed_rule_group_summary

val make_list_available_managed_rule_groups_response :
  ?next_marker:next_marker ->
  ?managed_rule_groups:managed_rule_group_summaries ->
  unit ->
  list_available_managed_rule_groups_response

val make_list_available_managed_rule_groups_request :
  ?next_marker:next_marker ->
  ?limit:pagination_limit ->
  scope:scope ->
  unit ->
  list_available_managed_rule_groups_request

val make_list_api_keys_response :
  ?next_marker:next_marker ->
  ?api_key_summaries:api_key_summaries ->
  ?application_integration_ur_l:output_url ->
  unit ->
  list_api_keys_response

val make_list_api_keys_request :
  ?next_marker:next_marker ->
  ?limit:pagination_limit ->
  scope:scope ->
  unit ->
  list_api_keys_request

val make_firewall_manager_statement :
  ?managed_rule_group_statement:managed_rule_group_statement ->
  ?rule_group_reference_statement:rule_group_reference_statement ->
  unit ->
  firewall_manager_statement

val make_firewall_manager_rule_group :
  name:entity_name ->
  priority:rule_priority ->
  firewall_manager_statement:firewall_manager_statement ->
  override_action:override_action ->
  visibility_config:visibility_config ->
  unit ->
  firewall_manager_rule_group

val make_web_ac_l :
  ?description:entity_description ->
  ?rules:rules ->
  ?data_protection_config:data_protection_config ->
  ?capacity:consumed_capacity ->
  ?pre_process_firewall_manager_rule_groups:firewall_manager_rule_groups ->
  ?post_process_firewall_manager_rule_groups:firewall_manager_rule_groups ->
  ?managed_by_firewall_manager:boolean_ ->
  ?label_namespace:label_name ->
  ?custom_response_bodies:custom_response_bodies ->
  ?captcha_config:captcha_config ->
  ?challenge_config:challenge_config ->
  ?token_domains:token_domains ->
  ?association_config:association_config ->
  ?retrofitted_by_firewall_manager:boolean_ ->
  ?on_source_d_do_s_protection_config:on_source_d_do_s_protection_config ->
  ?application_config:application_config ->
  ?monetization_config:monetization_config ->
  name:entity_name ->
  id:entity_id ->
  ar_n:resource_arn ->
  default_action:default_action ->
  visibility_config:visibility_config ->
  unit ->
  web_ac_l

val make_get_web_acl_for_resource_response :
  ?web_ac_l:web_ac_l -> unit -> get_web_acl_for_resource_response

val make_get_web_acl_for_resource_request :
  resource_arn:resource_arn -> unit -> get_web_acl_for_resource_request

val make_get_web_acl_response :
  ?web_ac_l:web_ac_l ->
  ?lock_token:lock_token ->
  ?application_integration_ur_l:output_url ->
  unit ->
  get_web_acl_response

val make_get_web_acl_request :
  ?name:entity_name ->
  ?scope:scope ->
  ?id:entity_id ->
  ?ar_n:resource_arn ->
  unit ->
  get_web_acl_request

val make_bot_statistics :
  bot_name:filter_string ->
  request_count:request_count ->
  percentage:percentage_value ->
  unit ->
  bot_statistics

val make_filter_source :
  ?bot_category:filter_string ->
  ?bot_organization:filter_string ->
  ?bot_name:filter_string ->
  unit ->
  filter_source

val make_path_statistics :
  ?source:filter_source ->
  ?top_bots:bot_statistics_list ->
  path:path_string ->
  request_count:request_count ->
  percentage:percentage_value ->
  unit ->
  path_statistics

val make_get_top_path_statistics_by_traffic_response :
  ?next_marker:next_marker ->
  ?top_categories:path_statistics_list ->
  path_statistics:path_statistics_list ->
  total_request_count:request_count ->
  unit ->
  get_top_path_statistics_by_traffic_response

val make_get_top_path_statistics_by_traffic_request :
  ?uri_path_prefix:uri_path_prefix_string ->
  ?bot_category:filter_string ->
  ?bot_organization:filter_string ->
  ?bot_name:filter_string ->
  ?next_marker:next_marker ->
  web_acl_arn:resource_arn ->
  scope:scope ->
  time_window:time_window ->
  limit:path_statistics_limit ->
  number_of_top_traffic_bots_per_path:number_of_top_traffic_bots_per_path ->
  unit ->
  get_top_path_statistics_by_traffic_request

val make_challenge_response :
  ?response_code:response_code ->
  ?solve_timestamp:solve_timestamp ->
  ?failure_reason:failure_reason ->
  unit ->
  challenge_response

val make_captcha_response :
  ?response_code:response_code ->
  ?solve_timestamp:solve_timestamp ->
  ?failure_reason:failure_reason ->
  unit ->
  captcha_response

val make_http_header : ?name:header_name -> ?value:header_value -> unit -> http_header

val make_http_request :
  ?client_i_p:ip_string ->
  ?country:country ->
  ?ur_i:uri_string ->
  ?method_:http_method ->
  ?http_version:http_version ->
  ?headers:http_headers ->
  unit ->
  http_request

val make_sampled_http_request :
  ?timestamp:timestamp ->
  ?action:action ->
  ?rule_name_within_rule_group:entity_name ->
  ?request_headers_inserted:http_headers ->
  ?response_code_sent:response_status_code ->
  ?labels:labels ->
  ?captcha_response:captcha_response ->
  ?challenge_response:challenge_response ->
  ?overridden_action:action ->
  request:http_request ->
  weight:sample_weight ->
  unit ->
  sampled_http_request

val make_get_sampled_requests_response :
  ?sampled_requests:sampled_http_requests ->
  ?population_size:population_size ->
  ?time_window:time_window ->
  unit ->
  get_sampled_requests_response

val make_get_sampled_requests_request :
  web_acl_arn:resource_arn ->
  rule_metric_name:metric_name ->
  scope:scope ->
  time_window:time_window ->
  max_items:list_max_items ->
  unit ->
  get_sampled_requests_request

val make_label_summary : ?name:label_name -> unit -> label_summary

val make_rule_group :
  ?description:entity_description ->
  ?rules:rules ->
  ?label_namespace:label_name ->
  ?custom_response_bodies:custom_response_bodies ->
  ?available_labels:label_summaries ->
  ?consumed_labels:label_summaries ->
  ?monetization_config:monetization_config ->
  name:entity_name ->
  id:entity_id ->
  capacity:capacity_unit ->
  ar_n:resource_arn ->
  visibility_config:visibility_config ->
  unit ->
  rule_group

val make_get_rule_group_response :
  ?rule_group:rule_group -> ?lock_token:lock_token -> unit -> get_rule_group_response

val make_get_rule_group_request :
  ?name:entity_name ->
  ?scope:scope ->
  ?id:entity_id ->
  ?ar_n:resource_arn ->
  unit ->
  get_rule_group_request

val make_data_point_entry :
  ?date:timestamp ->
  ?monetize_served_count:request_count ->
  ?settled_count:request_count ->
  ?total_amount:monetization_amount_value ->
  ?category:filter_string ->
  ?intent:filter_string ->
  ?group_by_value:filter_string ->
  unit ->
  data_point_entry

val make_get_revenue_statistics_time_series_response :
  ?data_points:data_points_list ->
  ?next_marker:next_marker ->
  unit ->
  get_revenue_statistics_time_series_response

val make_get_revenue_statistics_time_series_request :
  ?group_by:group_by_type ->
  ?filters:monetization_filter_list ->
  ?limit:max_data_points ->
  ?next_marker:next_marker ->
  statistic_type:time_series_statistic_type ->
  time_window:time_window ->
  scope:scope ->
  interval:interval_type ->
  currency:currency ->
  unit ->
  get_revenue_statistics_time_series_request

val make_revenue_breakdown :
  ?total_amount:monetization_amount_value ->
  ?verified_amount:monetization_amount_value ->
  ?unverified_amount:monetization_amount_value ->
  ?currency:currency ->
  ?total_settled:request_count ->
  ?total_monetize_served:request_count ->
  unit ->
  revenue_breakdown

val make_get_revenue_statistics_summary_response :
  ?revenue_breakdown:revenue_breakdown -> unit -> get_revenue_statistics_summary_response

val make_get_revenue_statistics_summary_request :
  ?filters:monetization_filter_list ->
  time_window:time_window ->
  scope:scope ->
  currency:currency ->
  unit ->
  get_revenue_statistics_summary_request

val make_revenue_path_statistics :
  path:path_string ->
  percentage:percentage_value ->
  amount:monetization_amount_value ->
  request_count:request_count ->
  unit ->
  revenue_path_statistics

val make_source_statistics :
  ?source_category:filter_string ->
  ?intent:filter_string ->
  ?organization:filter_string ->
  ?verified:verified_status ->
  ?group_by_value:filter_string ->
  source_name:filter_string ->
  percentage:percentage_value ->
  amount:monetization_amount_value ->
  request_count:request_count ->
  unit ->
  source_statistics

val make_get_revenue_statistics_response :
  ?source_statistics:source_statistics_list ->
  ?revenue_path_statistics:revenue_path_statistics_list ->
  ?next_marker:next_marker ->
  unit ->
  get_revenue_statistics_response

val make_get_revenue_statistics_request :
  ?group_by:group_by_type ->
  ?filters:monetization_filter_list ->
  ?next_marker:next_marker ->
  ?limit:path_statistics_limit ->
  ?sort_by:ranking_sort_by ->
  ?sort_order:sort_order ->
  statistic_type:ranking_statistic_type ->
  time_window:time_window ->
  scope:scope ->
  currency:currency ->
  unit ->
  get_revenue_statistics_request

val make_regex_pattern_set :
  ?name:entity_name ->
  ?id:entity_id ->
  ?ar_n:resource_arn ->
  ?description:entity_description ->
  ?regular_expression_list:regular_expression_list ->
  unit ->
  regex_pattern_set

val make_get_regex_pattern_set_response :
  ?regex_pattern_set:regex_pattern_set ->
  ?lock_token:lock_token ->
  unit ->
  get_regex_pattern_set_response

val make_get_regex_pattern_set_request :
  name:entity_name -> scope:scope -> id:entity_id -> unit -> get_regex_pattern_set_request

val make_rate_based_statement_managed_keys_ip_set :
  ?ip_address_version:ip_address_version ->
  ?addresses:ip_addresses ->
  unit ->
  rate_based_statement_managed_keys_ip_set

val make_get_rate_based_statement_managed_keys_response :
  ?managed_keys_ip_v4:rate_based_statement_managed_keys_ip_set ->
  ?managed_keys_ip_v6:rate_based_statement_managed_keys_ip_set ->
  unit ->
  get_rate_based_statement_managed_keys_response

val make_get_rate_based_statement_managed_keys_request :
  ?rule_group_rule_name:entity_name ->
  scope:scope ->
  web_acl_name:entity_name ->
  web_acl_id:entity_id ->
  rule_name:entity_name ->
  unit ->
  get_rate_based_statement_managed_keys_request

val make_get_permission_policy_response :
  ?policy:policy_string -> unit -> get_permission_policy_response

val make_get_permission_policy_request :
  resource_arn:resource_arn -> unit -> get_permission_policy_request

val make_mobile_sdk_release :
  ?release_version:version_key_string ->
  ?timestamp:timestamp ->
  ?release_notes:release_notes ->
  ?tags:tag_list ->
  unit ->
  mobile_sdk_release

val make_get_mobile_sdk_release_response :
  ?mobile_sdk_release:mobile_sdk_release -> unit -> get_mobile_sdk_release_response

val make_get_mobile_sdk_release_request :
  platform:platform -> release_version:version_key_string -> unit -> get_mobile_sdk_release_request

val make_managed_rule_set_version :
  ?associated_rule_group_arn:resource_arn ->
  ?capacity:capacity_unit ->
  ?forecasted_lifetime:time_window_day ->
  ?publish_timestamp:timestamp ->
  ?last_update_timestamp:timestamp ->
  ?expiry_timestamp:timestamp ->
  unit ->
  managed_rule_set_version

val make_managed_rule_set :
  ?description:entity_description ->
  ?published_versions:published_versions ->
  ?recommended_version:version_key_string ->
  ?label_namespace:label_name ->
  name:entity_name ->
  id:entity_id ->
  ar_n:resource_arn ->
  unit ->
  managed_rule_set

val make_get_managed_rule_set_response :
  ?managed_rule_set:managed_rule_set ->
  ?lock_token:lock_token ->
  unit ->
  get_managed_rule_set_response

val make_get_managed_rule_set_request :
  name:entity_name -> scope:scope -> id:entity_id -> unit -> get_managed_rule_set_request

val make_get_logging_configuration_response :
  ?logging_configuration:logging_configuration -> unit -> get_logging_configuration_response

val make_get_logging_configuration_request :
  ?log_type:log_type ->
  ?log_scope:log_scope ->
  resource_arn:resource_arn ->
  unit ->
  get_logging_configuration_request

val make_ip_set :
  ?description:entity_description ->
  name:entity_name ->
  id:entity_id ->
  ar_n:resource_arn ->
  ip_address_version:ip_address_version ->
  addresses:ip_addresses ->
  unit ->
  ip_set

val make_get_ip_set_response :
  ?ip_set:ip_set -> ?lock_token:lock_token -> unit -> get_ip_set_response

val make_get_ip_set_request :
  name:entity_name -> scope:scope -> id:entity_id -> unit -> get_ip_set_request

val make_get_decrypted_api_key_response :
  ?token_domains:token_domains ->
  ?creation_timestamp:timestamp ->
  unit ->
  get_decrypted_api_key_response

val make_get_decrypted_api_key_request :
  scope:scope -> api_key:api_key -> unit -> get_decrypted_api_key_request

val make_generate_mobile_sdk_release_url_response :
  ?url:download_url -> unit -> generate_mobile_sdk_release_url_response

val make_generate_mobile_sdk_release_url_request :
  platform:platform ->
  release_version:version_key_string ->
  unit ->
  generate_mobile_sdk_release_url_request

val make_disassociate_web_acl_response : unit -> unit

val make_disassociate_web_acl_request :
  resource_arn:resource_arn -> unit -> disassociate_web_acl_request

val make_rule_summary : ?name:entity_name -> ?action:rule_action -> unit -> rule_summary

val make_describe_managed_rule_group_response :
  ?version_name:version_key_string ->
  ?sns_topic_arn:resource_arn ->
  ?capacity:capacity_unit ->
  ?rules:rule_summaries ->
  ?label_namespace:label_name ->
  ?available_labels:label_summaries ->
  ?consumed_labels:label_summaries ->
  unit ->
  describe_managed_rule_group_response

val make_describe_managed_rule_group_request :
  ?version_name:version_key_string ->
  vendor_name:vendor_name ->
  name:entity_name ->
  scope:scope ->
  unit ->
  describe_managed_rule_group_request

val make_managed_product_descriptor :
  ?vendor_name:vendor_name ->
  ?managed_rule_set_name:entity_name ->
  ?product_id:product_id ->
  ?product_link:product_link ->
  ?product_title:product_title ->
  ?product_description:product_description ->
  ?sns_topic_arn:resource_arn ->
  ?is_versioning_supported:boolean_ ->
  ?is_advanced_managed_rule_set:boolean_ ->
  unit ->
  managed_product_descriptor

val make_describe_managed_products_by_vendor_response :
  ?managed_products:managed_product_descriptors ->
  unit ->
  describe_managed_products_by_vendor_response

val make_describe_managed_products_by_vendor_request :
  vendor_name:vendor_name -> scope:scope -> unit -> describe_managed_products_by_vendor_request

val make_describe_all_managed_products_response :
  ?managed_products:managed_product_descriptors -> unit -> describe_all_managed_products_response

val make_describe_all_managed_products_request :
  scope:scope -> unit -> describe_all_managed_products_request

val make_delete_web_acl_response : unit -> unit

val make_delete_web_acl_request :
  name:entity_name ->
  scope:scope ->
  id:entity_id ->
  lock_token:lock_token ->
  unit ->
  delete_web_acl_request

val make_delete_rule_group_response : unit -> unit

val make_delete_rule_group_request :
  name:entity_name ->
  scope:scope ->
  id:entity_id ->
  lock_token:lock_token ->
  unit ->
  delete_rule_group_request

val make_delete_regex_pattern_set_response : unit -> unit

val make_delete_regex_pattern_set_request :
  name:entity_name ->
  scope:scope ->
  id:entity_id ->
  lock_token:lock_token ->
  unit ->
  delete_regex_pattern_set_request

val make_delete_permission_policy_response : unit -> unit

val make_delete_permission_policy_request :
  resource_arn:resource_arn -> unit -> delete_permission_policy_request

val make_delete_logging_configuration_response : unit -> unit

val make_delete_logging_configuration_request :
  ?log_type:log_type ->
  ?log_scope:log_scope ->
  resource_arn:resource_arn ->
  unit ->
  delete_logging_configuration_request

val make_delete_ip_set_response : unit -> unit

val make_delete_ip_set_request :
  name:entity_name ->
  scope:scope ->
  id:entity_id ->
  lock_token:lock_token ->
  unit ->
  delete_ip_set_request

val make_delete_firewall_manager_rule_groups_response :
  ?next_web_acl_lock_token:lock_token -> unit -> delete_firewall_manager_rule_groups_response

val make_delete_firewall_manager_rule_groups_request :
  web_acl_arn:resource_arn ->
  web_acl_lock_token:lock_token ->
  unit ->
  delete_firewall_manager_rule_groups_request

val make_delete_api_key_response : unit -> unit
val make_delete_api_key_request : scope:scope -> api_key:api_key -> unit -> delete_api_key_request
val make_create_web_acl_response : ?summary:web_acl_summary -> unit -> create_web_acl_response

val make_create_web_acl_request :
  ?description:entity_description ->
  ?rules:rules ->
  ?data_protection_config:data_protection_config ->
  ?tags:tag_list ->
  ?custom_response_bodies:custom_response_bodies ->
  ?captcha_config:captcha_config ->
  ?challenge_config:challenge_config ->
  ?token_domains:token_domains ->
  ?association_config:association_config ->
  ?on_source_d_do_s_protection_config:on_source_d_do_s_protection_config ->
  ?application_config:application_config ->
  ?monetization_config:monetization_config ->
  name:entity_name ->
  scope:scope ->
  default_action:default_action ->
  visibility_config:visibility_config ->
  unit ->
  create_web_acl_request

val make_create_rule_group_response :
  ?summary:rule_group_summary -> unit -> create_rule_group_response

val make_create_rule_group_request :
  ?description:entity_description ->
  ?rules:rules ->
  ?tags:tag_list ->
  ?custom_response_bodies:custom_response_bodies ->
  ?monetization_config:monetization_config ->
  name:entity_name ->
  scope:scope ->
  capacity:capacity_unit ->
  visibility_config:visibility_config ->
  unit ->
  create_rule_group_request

val make_create_regex_pattern_set_response :
  ?summary:regex_pattern_set_summary -> unit -> create_regex_pattern_set_response

val make_create_regex_pattern_set_request :
  ?description:entity_description ->
  ?tags:tag_list ->
  name:entity_name ->
  scope:scope ->
  regular_expression_list:regular_expression_list ->
  unit ->
  create_regex_pattern_set_request

val make_create_ip_set_response : ?summary:ip_set_summary -> unit -> create_ip_set_response

val make_create_ip_set_request :
  ?description:entity_description ->
  ?tags:tag_list ->
  name:entity_name ->
  scope:scope ->
  ip_address_version:ip_address_version ->
  addresses:ip_addresses ->
  unit ->
  create_ip_set_request

val make_create_api_key_response : ?api_key:api_key -> unit -> create_api_key_response

val make_create_api_key_request :
  scope:scope -> token_domains:api_key_token_domains -> unit -> create_api_key_request

val make_check_capacity_response : ?capacity:consumed_capacity -> unit -> check_capacity_response
val make_check_capacity_request : scope:scope -> rules:rules -> unit -> check_capacity_request
val make_associate_web_acl_response : unit -> unit

val make_associate_web_acl_request :
  web_acl_arn:resource_arn -> resource_arn:resource_arn -> unit -> associate_web_acl_request
(** {1:operations Operations} *)

module AssociateWebACL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFFeatureNotIncludedInPricingPlanException of
      waf_feature_not_included_in_pricing_plan_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFLimitsExceededException of waf_limits_exceeded_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFUnavailableEntityException of waf_unavailable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_web_acl_request ->
    ( associate_web_acl_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFFeatureNotIncludedInPricingPlanException of
        waf_feature_not_included_in_pricing_plan_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFUnavailableEntityException of waf_unavailable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_web_acl_request ->
    ( associate_web_acl_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFFeatureNotIncludedInPricingPlanException of
        waf_feature_not_included_in_pricing_plan_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFUnavailableEntityException of waf_unavailable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a web ACL with a resource, to protect the resource. \n\n\
  \ Use this for all resource types except for Amazon CloudFront distributions. For Amazon \
   CloudFront, call [UpdateDistribution] for the distribution and provide the Amazon Resource Name \
   (ARN) of the web ACL in the web ACL ID. For information, see \
   {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html}UpdateDistribution} \
   in the {i Amazon CloudFront Developer Guide}. \n\
  \ \n\
  \   {b Required permissions for customer-managed IAM policies} \n\
  \  \n\
  \   This call requires permissions that are specific to the protected resource type. For \
   details, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/security_iam_service-with-iam.html#security_iam_action-AssociateWebACL}Permissions \
   for AssociateWebACL} in the {i WAF Developer Guide}. \n\
  \   \n\
  \     {b Temporary inconsistencies during updates} \n\
  \    \n\
  \     When you create or change a web ACL or other WAF resources, the changes take a small \
   amount of time to propagate to all areas where the resources are stored. The propagation time \
   can be from a few seconds to a number of minutes. \n\
  \     \n\
  \      The following are examples of the temporary inconsistencies that you might notice during \
   change propagation: \n\
  \      \n\
  \       {ul\n\
  \             {-  After you create a web ACL, if you try to associate it with a resource, you \
   might get an exception indicating that the web ACL is unavailable. \n\
  \                 \n\
  \                  }\n\
  \             {-  After you add a rule group to a web ACL, the new rule group rules might be in \
   effect in one area where the web ACL is used and not in another.\n\
  \                 \n\
  \                  }\n\
  \             {-  After you change a rule action setting, you might see the old action in some \
   places and the new action in others. \n\
  \                 \n\
  \                  }\n\
  \             {-  After you add an IP address to an IP set that is in use in a blocking rule, \
   the new address might be blocked in one area while still allowed in another.\n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \  "]

module CheckCapacity : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFExpiredManagedRuleGroupVersionException of
      waf_expired_managed_rule_group_version_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFInvalidResourceException of waf_invalid_resource_exception
    | `WAFLimitsExceededException of waf_limits_exceeded_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
    | `WAFUnavailableEntityException of waf_unavailable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    check_capacity_request ->
    ( check_capacity_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFExpiredManagedRuleGroupVersionException of
        waf_expired_managed_rule_group_version_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFInvalidResourceException of waf_invalid_resource_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
      | `WAFUnavailableEntityException of waf_unavailable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    check_capacity_request ->
    ( check_capacity_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFExpiredManagedRuleGroupVersionException of
        waf_expired_managed_rule_group_version_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFInvalidResourceException of waf_invalid_resource_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
      | `WAFUnavailableEntityException of waf_unavailable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the web ACL capacity unit (WCU) requirements for a specified scope and set of rules. \
   You can use this to check the capacity requirements for the rules you want to use in a \
   [RuleGroup] or [WebACL]. \n\n\
  \ WAF uses WCUs to calculate and control the operating resources that are used to run your \
   rules, rule groups, and web ACLs. WAF calculates capacity differently for each rule type, to \
   reflect the relative cost of each rule. Simple rules that cost little to run use fewer WCUs \
   than more complex rules that use more processing power. Rule group capacity is fixed at \
   creation, which helps users plan their web ACL WCU usage when they use a rule group. For more \
   information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html}WAF web \
   ACL capacity units (WCU)} in the {i WAF Developer Guide}. \n\
  \ "]

module CreateAPIKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFLimitsExceededException of waf_limits_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_api_key_request ->
    ( create_api_key_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_api_key_request ->
    ( create_api_key_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an API key that contains a set of token domains.\n\n\
  \ API keys are required for the integration of the CAPTCHA API in your JavaScript client \
   applications. The API lets you customize the placement and characteristics of the CAPTCHA \
   puzzle for your end users. For more information about the CAPTCHA JavaScript integration, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF \
   client application integration} in the {i WAF Developer Guide}.\n\
  \ \n\
  \  You can use a single key for up to 5 domains. After you generate a key, you can copy it for \
   use in your JavaScript integration. \n\
  \  "]

module CreateIPSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFDuplicateItemException of waf_duplicate_item_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFLimitsExceededException of waf_limits_exceeded_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception
    | `WAFTagOperationException of waf_tag_operation_exception
    | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_ip_set_request ->
    ( create_ip_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFDuplicateItemException of waf_duplicate_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_ip_set_request ->
    ( create_ip_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFDuplicateItemException of waf_duplicate_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an [IPSet], which you use to identify web requests that originate from specific IP \
   addresses or ranges of IP addresses. For example, if you're receiving a lot of requests from a \
   ranges of IP addresses, you can configure WAF to block them using an IPSet that lists those IP \
   addresses. \n"]

module CreateRegexPatternSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFDuplicateItemException of waf_duplicate_item_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFLimitsExceededException of waf_limits_exceeded_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception
    | `WAFTagOperationException of waf_tag_operation_exception
    | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_regex_pattern_set_request ->
    ( create_regex_pattern_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFDuplicateItemException of waf_duplicate_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_regex_pattern_set_request ->
    ( create_regex_pattern_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFDuplicateItemException of waf_duplicate_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a [RegexPatternSet], which you reference in a [RegexPatternSetReferenceStatement], to \
   have WAF inspect a web request component for the specified patterns.\n"]

module CreateRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFDuplicateItemException of waf_duplicate_item_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFLimitsExceededException of waf_limits_exceeded_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception
    | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
    | `WAFTagOperationException of waf_tag_operation_exception
    | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
    | `WAFUnavailableEntityException of waf_unavailable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_rule_group_request ->
    ( create_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFDuplicateItemException of waf_duplicate_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
      | `WAFUnavailableEntityException of waf_unavailable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_rule_group_request ->
    ( create_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFDuplicateItemException of waf_duplicate_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
      | `WAFUnavailableEntityException of waf_unavailable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a [RuleGroup] per the specifications provided. \n\n\
  \  A rule group defines a collection of rules to inspect and control web requests that you can \
   use in a [WebACL]. When you create a rule group, you define an immutable capacity limit. If you \
   update a rule group, you must stay within the capacity. This allows others to reuse the rule \
   group with confidence in its capacity requirements. \n\
  \ "]

module CreateWebACL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFConfigurationWarningException of waf_configuration_warning_exception
    | `WAFDuplicateItemException of waf_duplicate_item_exception
    | `WAFExpiredManagedRuleGroupVersionException of
      waf_expired_managed_rule_group_version_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFInvalidResourceException of waf_invalid_resource_exception
    | `WAFLimitsExceededException of waf_limits_exceeded_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception
    | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
    | `WAFTagOperationException of waf_tag_operation_exception
    | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
    | `WAFUnavailableEntityException of waf_unavailable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_web_acl_request ->
    ( create_web_acl_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFConfigurationWarningException of waf_configuration_warning_exception
      | `WAFDuplicateItemException of waf_duplicate_item_exception
      | `WAFExpiredManagedRuleGroupVersionException of
        waf_expired_managed_rule_group_version_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFInvalidResourceException of waf_invalid_resource_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
      | `WAFUnavailableEntityException of waf_unavailable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_web_acl_request ->
    ( create_web_acl_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFConfigurationWarningException of waf_configuration_warning_exception
      | `WAFDuplicateItemException of waf_duplicate_item_exception
      | `WAFExpiredManagedRuleGroupVersionException of
        waf_expired_managed_rule_group_version_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFInvalidResourceException of waf_invalid_resource_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
      | `WAFUnavailableEntityException of waf_unavailable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a [WebACL] per the specifications provided.\n\n\
  \  A web ACL defines a collection of rules to use to inspect and control web requests. Each rule \
   has a statement that defines what to look for in web requests and an action that WAF applies to \
   requests that match the statement. In the web ACL, you assign a default action to take (allow, \
   block) for any request that does not match any of the rules. The rules in a web ACL can be a \
   combination of the types [Rule], [RuleGroup], and managed rule group. You can associate a web \
   ACL with one or more Amazon Web Services resources to protect. The resource types include \
   Amazon CloudFront distribution, Amazon API Gateway REST API, Application Load Balancer, AppSync \
   GraphQL API, Amazon Cognito user pool, App Runner service, Amplify application, and Amazon Web \
   Services Verified Access instance. \n\
  \ "]

module DeleteAPIKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_api_key_request ->
    ( delete_api_key_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_api_key_request ->
    ( delete_api_key_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified API key. \n\n\
  \ After you delete a key, it can take up to 24 hours for WAF to disallow use of the key in all \
   regions. \n\
  \ "]

module DeleteFirewallManagerRuleGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_firewall_manager_rule_groups_request ->
    ( delete_firewall_manager_rule_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_firewall_manager_rule_groups_request ->
    ( delete_firewall_manager_rule_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes all rule groups that are managed by Firewall Manager from the specified [WebACL]. \n\n\
  \ You can only use this if [ManagedByFirewallManager] and [RetrofittedByFirewallManager] are \
   both false in the web ACL. \n\
  \ "]

module DeleteIPSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFAssociatedItemException of waf_associated_item_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception
    | `WAFTagOperationException of waf_tag_operation_exception
    | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_ip_set_request ->
    ( delete_ip_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFAssociatedItemException of waf_associated_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_ip_set_request ->
    ( delete_ip_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFAssociatedItemException of waf_associated_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified [IPSet]. \n"]

module DeleteLoggingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_logging_configuration_request ->
    ( delete_logging_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_logging_configuration_request ->
    ( delete_logging_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the [LoggingConfiguration] from the specified web ACL.\n"]

module DeletePermissionPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_permission_policy_request ->
    ( delete_permission_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_permission_policy_request ->
    ( delete_permission_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Permanently deletes an IAM policy from the specified rule group.\n\n\
  \ You must be the owner of the rule group to perform this operation.\n\
  \ "]

module DeleteRegexPatternSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFAssociatedItemException of waf_associated_item_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception
    | `WAFTagOperationException of waf_tag_operation_exception
    | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_regex_pattern_set_request ->
    ( delete_regex_pattern_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFAssociatedItemException of waf_associated_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_regex_pattern_set_request ->
    ( delete_regex_pattern_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFAssociatedItemException of waf_associated_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified [RegexPatternSet].\n"]

module DeleteRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFAssociatedItemException of waf_associated_item_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception
    | `WAFTagOperationException of waf_tag_operation_exception
    | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_rule_group_request ->
    ( delete_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFAssociatedItemException of waf_associated_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_rule_group_request ->
    ( delete_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFAssociatedItemException of waf_associated_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified [RuleGroup].\n"]

module DeleteWebACL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFAssociatedItemException of waf_associated_item_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception
    | `WAFTagOperationException of waf_tag_operation_exception
    | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_web_acl_request ->
    ( delete_web_acl_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFAssociatedItemException of waf_associated_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_web_acl_request ->
    ( delete_web_acl_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFAssociatedItemException of waf_associated_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified [WebACL]. \n\n\
  \ You can only use this if [ManagedByFirewallManager] is false in the web ACL. \n\
  \ \n\
  \   Before deleting any web ACL, first disassociate it from all resources.\n\
  \   \n\
  \    {ul\n\
  \          {-  To retrieve a list of the resources that are associated with a web ACL, use the \
   following calls:\n\
  \              \n\
  \               {ul\n\
  \                     {-  For Amazon CloudFront distributions, use the CloudFront call \
   [ListDistributionsByWebACLId]. For information, see \
   {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_ListDistributionsByWebACLId.html}ListDistributionsByWebACLId} \
   in the {i Amazon CloudFront API Reference}. \n\
  \                         \n\
  \                          }\n\
  \                     {-  For all other resources, call [ListResourcesForWebACL].\n\
  \                         \n\
  \                          }\n\
  \                     \n\
  \           }\n\
  \            }\n\
  \          {-  To disassociate a resource from a web ACL, use the following calls:\n\
  \              \n\
  \               {ul\n\
  \                     {-  For Amazon CloudFront distributions, provide an empty web ACL ID in \
   the CloudFront call [UpdateDistribution]. For information, see \
   {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html}UpdateDistribution} \
   in the {i Amazon CloudFront API Reference}. \n\
  \                         \n\
  \                          }\n\
  \                     {-  For all other resources, call [DisassociateWebACL].\n\
  \                         \n\
  \                          }\n\
  \                     \n\
  \           }\n\
  \            }\n\
  \          }\n\
  \   "]

module DescribeAllManagedProducts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_all_managed_products_request ->
    ( describe_all_managed_products_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_all_managed_products_request ->
    ( describe_all_managed_products_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides high-level information for the Amazon Web Services Managed Rules rule groups and \
   Amazon Web Services Marketplace managed rule groups. \n"]

module DescribeManagedProductsByVendor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_managed_products_by_vendor_request ->
    ( describe_managed_products_by_vendor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_managed_products_by_vendor_request ->
    ( describe_managed_products_by_vendor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides high-level information for the managed rule groups owned by a specific vendor. \n"]

module DescribeManagedRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFExpiredManagedRuleGroupVersionException of
      waf_expired_managed_rule_group_version_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFInvalidResourceException of waf_invalid_resource_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_managed_rule_group_request ->
    ( describe_managed_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFExpiredManagedRuleGroupVersionException of
        waf_expired_managed_rule_group_version_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFInvalidResourceException of waf_invalid_resource_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_managed_rule_group_request ->
    ( describe_managed_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFExpiredManagedRuleGroupVersionException of
        waf_expired_managed_rule_group_version_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFInvalidResourceException of waf_invalid_resource_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides high-level information for a managed rule group, including descriptions of the rules. \n"]

module DisassociateWebACL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_web_acl_request ->
    ( disassociate_web_acl_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_web_acl_request ->
    ( disassociate_web_acl_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates the specified resource from its web ACL association, if it has one. \n\n\
  \ Use this for all resource types except for Amazon CloudFront distributions. For Amazon \
   CloudFront, call [UpdateDistribution] for the distribution and provide an empty web ACL ID. For \
   information, see \
   {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html}UpdateDistribution} \
   in the {i Amazon CloudFront API Reference}. \n\
  \ \n\
  \   {b Required permissions for customer-managed IAM policies} \n\
  \  \n\
  \   This call requires permissions that are specific to the protected resource type. For \
   details, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/security_iam_service-with-iam.html#security_iam_action-DisassociateWebACL}Permissions \
   for DisassociateWebACL} in the {i WAF Developer Guide}.\n\
  \   "]

module GenerateMobileSdkReleaseUrl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    generate_mobile_sdk_release_url_request ->
    ( generate_mobile_sdk_release_url_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    generate_mobile_sdk_release_url_request ->
    ( generate_mobile_sdk_release_url_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates a presigned download URL for the specified release of the mobile SDK.\n\n\
  \ The mobile SDK is not generally available. Customers who have access to the mobile SDK can use \
   it to establish and manage WAF tokens for use in HTTP(S) requests from a mobile device to WAF. \
   For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF \
   client application integration} in the {i WAF Developer Guide}.\n\
  \ "]

module GetDecryptedAPIKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFInvalidResourceException of waf_invalid_resource_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_decrypted_api_key_request ->
    ( get_decrypted_api_key_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFInvalidResourceException of waf_invalid_resource_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_decrypted_api_key_request ->
    ( get_decrypted_api_key_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFInvalidResourceException of waf_invalid_resource_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns your API key in decrypted form. Use this to check the token domains that you have \
   defined for the key. \n\n\
  \ API keys are required for the integration of the CAPTCHA API in your JavaScript client \
   applications. The API lets you customize the placement and characteristics of the CAPTCHA \
   puzzle for your end users. For more information about the CAPTCHA JavaScript integration, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF \
   client application integration} in the {i WAF Developer Guide}.\n\
  \ "]

module GetIPSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ip_set_request ->
    ( get_ip_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ip_set_request ->
    ( get_ip_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the specified [IPSet].\n"]

module GetLoggingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_logging_configuration_request ->
    ( get_logging_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_logging_configuration_request ->
    ( get_logging_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the [LoggingConfiguration] for the specified web ACL.\n"]

module GetManagedRuleSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_managed_rule_set_request ->
    ( get_managed_rule_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_managed_rule_set_request ->
    ( get_managed_rule_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the specified managed rule set. \n\n\
  \  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web \
   Services and Amazon Web Services Marketplace sellers. \n\
  \  \n\
  \   Vendors, you can use the managed rule set APIs to provide controlled rollout of your \
   versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], \
   [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n\
  \   \n\
  \    "]

module GetMobileSdkRelease : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_mobile_sdk_release_request ->
    ( get_mobile_sdk_release_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_mobile_sdk_release_request ->
    ( get_mobile_sdk_release_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information for the specified mobile SDK release, including release notes and tags.\n\n\
  \ The mobile SDK is not generally available. Customers who have access to the mobile SDK can use \
   it to establish and manage WAF tokens for use in HTTP(S) requests from a mobile device to WAF. \
   For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF \
   client application integration} in the {i WAF Developer Guide}.\n\
  \ "]

module GetPermissionPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_permission_policy_request ->
    ( get_permission_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_permission_policy_request ->
    ( get_permission_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the IAM policy that is attached to the specified rule group.\n\n\
  \ You must be the owner of the rule group to perform this operation.\n\
  \ "]

module GetRateBasedStatementManagedKeys : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFUnsupportedAggregateKeyTypeException of waf_unsupported_aggregate_key_type_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_rate_based_statement_managed_keys_request ->
    ( get_rate_based_statement_managed_keys_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFUnsupportedAggregateKeyTypeException of waf_unsupported_aggregate_key_type_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_rate_based_statement_managed_keys_request ->
    ( get_rate_based_statement_managed_keys_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFUnsupportedAggregateKeyTypeException of waf_unsupported_aggregate_key_type_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the IP addresses that are currently blocked by a rate-based rule instance. This is \
   only available for rate-based rules that aggregate solely on the IP address or on the forwarded \
   IP address. \n\n\
  \ The maximum number of addresses that can be blocked for a single rate-based rule instance is \
   10,000. If more than 10,000 addresses exceed the rate limit, those with the highest rates are \
   blocked.\n\
  \ \n\
  \  For a rate-based rule that you've defined inside a rule group, provide the name of the rule \
   group reference statement in your request, in addition to the rate-based rule name and the web \
   ACL name. \n\
  \  \n\
  \   WAF monitors web requests and manages keys independently for each unique combination of web \
   ACL, optional rule group, and rate-based rule. For example, if you define a rate-based rule \
   inside a rule group, and then use the rule group in a web ACL, WAF monitors web requests and \
   manages keys for that web ACL, rule group reference statement, and rate-based rule instance. If \
   you use the same rule group in a second web ACL, WAF monitors web requests and manages keys for \
   this second usage completely independent of your first. \n\
  \   "]

module GetRegexPatternSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_regex_pattern_set_request ->
    ( get_regex_pattern_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_regex_pattern_set_request ->
    ( get_regex_pattern_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the specified [RegexPatternSet].\n"]

module GetRevenueStatistics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_revenue_statistics_request ->
    ( get_revenue_statistics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_revenue_statistics_request ->
    ( get_revenue_statistics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves ranked monetization statistics. Use the [StatisticType] parameter to specify the \
   ranking: [TOP_SOURCES_BY_REVENUE] for top sources by revenue, or [TOP_PATHS_BY_REVENUE] for top \
   content paths by revenue. This operation is only available for [CLOUDFRONT] scope. The maximum \
   supported time window is 90 days. When no [CurrencyMode] filter is provided, results default to \
   [REAL]. To retrieve test data, include a [CurrencyMode] filter with the value [TEST].\n"]

module GetRevenueStatisticsSummary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_revenue_statistics_summary_request ->
    ( get_revenue_statistics_summary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_revenue_statistics_summary_request ->
    ( get_revenue_statistics_summary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a summary of monetization revenue for the specified time window. Returns total \
   revenue, revenue by verification tier, total settlements, and total HTTP 402 responses served. \
   This operation is only available for [CLOUDFRONT] scope. The maximum supported time window is \
   90 days. When no [CurrencyMode] filter is provided, results default to [REAL]. To retrieve test \
   data, include a [CurrencyMode] filter with the value [TEST].\n"]

module GetRevenueStatisticsTimeSeries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_revenue_statistics_time_series_request ->
    ( get_revenue_statistics_time_series_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_revenue_statistics_time_series_request ->
    ( get_revenue_statistics_time_series_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves time series data for monetization revenue. Returns data points aggregated at the \
   specified interval for the given time window. This operation is only available for [CLOUDFRONT] \
   scope. The maximum supported time window is 90 days. When no [CurrencyMode] filter is provided, \
   results default to [REAL]. To retrieve test data, include a [CurrencyMode] filter with the \
   value [TEST].\n"]

module GetRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_rule_group_request ->
    ( get_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_rule_group_request ->
    ( get_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the specified [RuleGroup].\n"]

module GetSampledRequests : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_sampled_requests_request ->
    ( get_sampled_requests_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_sampled_requests_request ->
    ( get_sampled_requests_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets detailed information about a specified number of requests--a sample--that WAF randomly \
   selects from among the first 5,000 requests that your Amazon Web Services resource received \
   during a time range that you choose. You can specify a sample size of up to 500 requests, and \
   you can specify any time range in the previous three hours.\n\n\
  \  [GetSampledRequests] returns a time range, which is usually the time range that you \
   specified. However, if your resource (such as a CloudFront distribution) received 5,000 \
   requests before the specified time range elapsed, [GetSampledRequests] returns an updated time \
   range. This new time range indicates the actual period during which WAF selected the requests \
   in the sample.\n\
  \ "]

module GetTopPathStatisticsByTraffic : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFFeatureNotIncludedInPricingPlanException of
      waf_feature_not_included_in_pricing_plan_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_top_path_statistics_by_traffic_request ->
    ( get_top_path_statistics_by_traffic_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFFeatureNotIncludedInPricingPlanException of
        waf_feature_not_included_in_pricing_plan_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_top_path_statistics_by_traffic_request ->
    ( get_top_path_statistics_by_traffic_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFFeatureNotIncludedInPricingPlanException of
        waf_feature_not_included_in_pricing_plan_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves aggregated statistics about the top URI paths accessed by bot traffic for a specified \
   web ACL and time window. You can use this operation to analyze which paths on your web \
   application receive the most bot traffic and identify the specific bots accessing those paths. \
   The operation supports filtering by bot category, organization, or name, and allows you to \
   drill down into specific path prefixes to view detailed URI-level statistics.\n"]

module GetWebACL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_web_acl_request ->
    ( get_web_acl_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_web_acl_request ->
    ( get_web_acl_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the specified [WebACL].\n"]

module GetWebACLForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFUnavailableEntityException of waf_unavailable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_web_acl_for_resource_request ->
    ( get_web_acl_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFUnavailableEntityException of waf_unavailable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_web_acl_for_resource_request ->
    ( get_web_acl_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFUnavailableEntityException of waf_unavailable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the [WebACL] for the specified resource. \n\n\
  \ This call uses [GetWebACL], to verify that your account has permission to access the retrieved \
   web ACL. If you get an error that indicates that your account isn't authorized to perform \
   [wafv2:GetWebACL] on the resource, that error won't be included in your CloudTrail event \
   history. \n\
  \ \n\
  \  For Amazon CloudFront, don't use this call. Instead, call the CloudFront action \
   [GetDistributionConfig]. For information, see \
   {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_GetDistributionConfig.html}GetDistributionConfig} \
   in the {i Amazon CloudFront API Reference}. \n\
  \  \n\
  \    {b Required permissions for customer-managed IAM policies} \n\
  \   \n\
  \    This call requires permissions that are specific to the protected resource type. For \
   details, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/security_iam_service-with-iam.html#security_iam_action-GetWebACLForResource}Permissions \
   for GetWebACLForResource} in the {i WAF Developer Guide}.\n\
  \    "]

module ListAPIKeys : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFInvalidResourceException of waf_invalid_resource_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_api_keys_request ->
    ( list_api_keys_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFInvalidResourceException of waf_invalid_resource_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_api_keys_request ->
    ( list_api_keys_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFInvalidResourceException of waf_invalid_resource_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of the API keys that you've defined for the specified scope. \n\n\
  \ API keys are required for the integration of the CAPTCHA API in your JavaScript client \
   applications. The API lets you customize the placement and characteristics of the CAPTCHA \
   puzzle for your end users. For more information about the CAPTCHA JavaScript integration, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF \
   client application integration} in the {i WAF Developer Guide}.\n\
  \ "]

module ListAvailableManagedRuleGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_available_managed_rule_groups_request ->
    ( list_available_managed_rule_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_available_managed_rule_groups_request ->
    ( list_available_managed_rule_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves an array of managed rule groups that are available for you to use. This list includes \
   all Amazon Web Services Managed Rules rule groups and all of the Amazon Web Services \
   Marketplace managed rule groups that you're subscribed to.\n"]

module ListAvailableManagedRuleGroupVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_available_managed_rule_group_versions_request ->
    ( list_available_managed_rule_group_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_available_managed_rule_group_versions_request ->
    ( list_available_managed_rule_group_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of the available versions for the specified managed rule group. \n"]

module ListIPSets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_ip_sets_request ->
    ( list_ip_sets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_ip_sets_request ->
    ( list_ip_sets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves an array of [IPSetSummary] objects for the IP sets that you manage.\n"]

module ListLoggingConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_logging_configurations_request ->
    ( list_logging_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_logging_configurations_request ->
    ( list_logging_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves an array of your [LoggingConfiguration] objects.\n"]

module ListManagedRuleSets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_managed_rule_sets_request ->
    ( list_managed_rule_sets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_managed_rule_sets_request ->
    ( list_managed_rule_sets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the managed rule sets that you own. \n\n\
  \  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web \
   Services and Amazon Web Services Marketplace sellers. \n\
  \  \n\
  \   Vendors, you can use the managed rule set APIs to provide controlled rollout of your \
   versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], \
   [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n\
  \   \n\
  \    "]

module ListMobileSdkReleases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_mobile_sdk_releases_request ->
    ( list_mobile_sdk_releases_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_mobile_sdk_releases_request ->
    ( list_mobile_sdk_releases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of the available releases for the mobile SDK and the specified device \
   platform. \n\n\
  \ The mobile SDK is not generally available. Customers who have access to the mobile SDK can use \
   it to establish and manage WAF tokens for use in HTTP(S) requests from a mobile device to WAF. \
   For more information, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF \
   client application integration} in the {i WAF Developer Guide}.\n\
  \ "]

module ListRegexPatternSets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_regex_pattern_sets_request ->
    ( list_regex_pattern_sets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_regex_pattern_sets_request ->
    ( list_regex_pattern_sets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves an array of [RegexPatternSetSummary] objects for the regex pattern sets that you \
   manage.\n"]

module ListResourcesForWebACL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resources_for_web_acl_request ->
    ( list_resources_for_web_acl_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resources_for_web_acl_request ->
    ( list_resources_for_web_acl_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves an array of the Amazon Resource Names (ARNs) for the resources that are associated \
   with the specified web ACL. \n\n\
  \ For Amazon CloudFront, don't use this call. Instead, use the CloudFront call \
   [ListDistributionsByWebACLId]. For information, see \
   {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_ListDistributionsByWebACLId.html}ListDistributionsByWebACLId} \
   in the {i Amazon CloudFront API Reference}. \n\
  \ \n\
  \   {b Required permissions for customer-managed IAM policies} \n\
  \  \n\
  \   This call requires permissions that are specific to the protected resource type. For \
   details, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/security_iam_service-with-iam.html#security_iam_action-ListResourcesForWebACL}Permissions \
   for ListResourcesForWebACL} in the {i WAF Developer Guide}.\n\
  \   "]

module ListRuleGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_rule_groups_request ->
    ( list_rule_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_rule_groups_request ->
    ( list_rule_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves an array of [RuleGroupSummary] objects for the rule groups that you manage. \n"]

module ListSettlementRecords : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_settlement_records_request ->
    ( list_settlement_records_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_settlement_records_request ->
    ( list_settlement_records_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves individual settlement transaction records for monetization. Each record represents a \
   single payment transaction between a client and your protected resource. This operation is only \
   available for [CLOUDFRONT] scope. The maximum supported time window is 90 days. When no \
   [CurrencyMode] filter is provided, results default to [REAL]. To retrieve test data, include a \
   [CurrencyMode] filter with the value [TEST].\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFTagOperationException of waf_tag_operation_exception
    | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the [TagInfoForResource] for the specified resource. Tags are key:value pairs that \
   you can use to categorize and manage your resources, for purposes like billing. For example, \
   you might set the tag key to \"customer\" and the value to the customer name or ID. You can \
   specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a \
   resource.\n\n\
  \ You can tag the Amazon Web Services resources that you manage through WAF: web ACLs, rule \
   groups, IP sets, and regex pattern sets. You can't manage or view tags through the WAF console. \n\
  \ "]

module ListWebACLs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_web_ac_ls_request ->
    ( list_web_ac_ls_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_web_ac_ls_request ->
    ( list_web_ac_ls_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves an array of [WebACLSummary] objects for the web ACLs that you manage.\n"]

module PutLoggingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFFeatureNotIncludedInPricingPlanException of
      waf_feature_not_included_in_pricing_plan_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFLimitsExceededException of waf_limits_exceeded_exception
    | `WAFLogDestinationPermissionIssueException of waf_log_destination_permission_issue_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception
    | `WAFServiceLinkedRoleErrorException of waf_service_linked_role_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_logging_configuration_request ->
    ( put_logging_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFFeatureNotIncludedInPricingPlanException of
        waf_feature_not_included_in_pricing_plan_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFLogDestinationPermissionIssueException of waf_log_destination_permission_issue_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFServiceLinkedRoleErrorException of waf_service_linked_role_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_logging_configuration_request ->
    ( put_logging_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFFeatureNotIncludedInPricingPlanException of
        waf_feature_not_included_in_pricing_plan_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFLogDestinationPermissionIssueException of waf_log_destination_permission_issue_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFServiceLinkedRoleErrorException of waf_service_linked_role_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables the specified [LoggingConfiguration], to start logging from a web ACL, according to the \
   configuration provided. \n\n\
  \ If you configure data protection for the web ACL, the protection applies to the data that WAF \
   sends to the logs. \n\
  \ \n\
  \   This operation completely replaces any mutable specifications that you already have for a \
   logging configuration with the ones that you provide to this call. \n\
  \   \n\
  \    To modify an existing logging configuration, do the following: \n\
  \    \n\
  \     {ol\n\
  \           {-  Retrieve it by calling [GetLoggingConfiguration] \n\
  \               \n\
  \                }\n\
  \           {-  Update its settings as needed\n\
  \               \n\
  \                }\n\
  \           {-  Provide the complete logging configuration specification to this call\n\
  \               \n\
  \                }\n\
  \           }\n\
  \     You can define one logging destination per web ACL.\n\
  \     \n\
  \       You can access information about the traffic that WAF inspects using the following steps:\n\
  \       \n\
  \        {ol\n\
  \              {-  Create your logging destination. You can use an Amazon CloudWatch Logs log \
   group, an Amazon Simple Storage Service (Amazon S3) bucket, or an Amazon Kinesis Data Firehose. \n\
  \                  \n\
  \                   The name that you give the destination must start with [aws-waf-logs-]. \
   Depending on the type of destination, you might need to configure additional settings or \
   permissions. \n\
  \                   \n\
  \                    For configuration requirements and pricing information for each destination \
   type, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging web ACL \
   traffic} in the {i WAF Developer Guide}.\n\
  \                    \n\
  \                     }\n\
  \              {-  Associate your logging destination to your web ACL using a \
   [PutLoggingConfiguration] request.\n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \   When you successfully enable logging using a [PutLoggingConfiguration] request, WAF creates \
   an additional role or policy that is required to write logs to the logging destination. For an \
   Amazon CloudWatch Logs log group, WAF creates a resource policy on the log group. For an Amazon \
   S3 bucket, WAF creates a bucket policy. For an Amazon Kinesis Data Firehose, WAF creates a \
   service-linked role.\n\
  \   \n\
  \    For additional information about web ACL logging, see \
   {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging web ACL traffic \
   information} in the {i WAF Developer Guide}.\n\
  \    "]

module PutManagedRuleSetVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_managed_rule_set_versions_request ->
    ( put_managed_rule_set_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_managed_rule_set_versions_request ->
    ( put_managed_rule_set_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Defines the versions of your managed rule set that you are offering to the customers. Customers \
   see your offerings as managed rule groups with versioning.\n\n\
  \  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web \
   Services and Amazon Web Services Marketplace sellers. \n\
  \  \n\
  \   Vendors, you can use the managed rule set APIs to provide controlled rollout of your \
   versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], \
   [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n\
  \   \n\
  \     Customers retrieve their managed rule group list by calling \
   [ListAvailableManagedRuleGroups]. The name that you provide here for your managed rule set is \
   the name the customer sees for the corresponding managed rule group. Customers can retrieve the \
   available versions for a managed rule group by calling [ListAvailableManagedRuleGroupVersions]. \
   You provide a rule group specification for each version. For each managed rule set, you must \
   specify a version that you recommend using. \n\
  \     \n\
  \      To initiate the expiration of a managed rule group version, use \
   [UpdateManagedRuleSetVersionExpiryDate].\n\
  \      "]

module PutPermissionPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFInvalidPermissionPolicyException of waf_invalid_permission_policy_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_permission_policy_request ->
    ( put_permission_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFInvalidPermissionPolicyException of waf_invalid_permission_policy_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_permission_policy_request ->
    ( put_permission_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFInvalidPermissionPolicyException of waf_invalid_permission_policy_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this to share a rule group with other accounts.\n\n\
  \ This action attaches an IAM policy to the specified resource. You must be the owner of the \
   rule group to perform this operation.\n\
  \ \n\
  \  This action is subject to the following restrictions:\n\
  \  \n\
  \   {ul\n\
  \         {-  You can attach only one policy with each [PutPermissionPolicy] request.\n\
  \             \n\
  \              }\n\
  \         {-  The ARN in the request must be a valid WAF [RuleGroup] ARN and the rule group must \
   exist in the same Region.\n\
  \             \n\
  \              }\n\
  \         {-  The user making the request must be the owner of the rule group.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   If a rule group has been shared with your account, you can access it through the call \
   [GetRuleGroup], and you can reference it in [CreateWebACL] and [UpdateWebACL]. Rule groups that \
   are shared with you don't appear in your WAF console rule groups listing. \n\
  \   "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFLimitsExceededException of waf_limits_exceeded_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFTagOperationException of waf_tag_operation_exception
    | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates tags with the specified Amazon Web Services resource. Tags are key:value pairs that \
   you can use to categorize and manage your resources, for purposes like billing. For example, \
   you might set the tag key to \"customer\" and the value to the customer name or ID. You can \
   specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a \
   resource.\n\n\
  \ You can tag the Amazon Web Services resources that you manage through WAF: web ACLs, rule \
   groups, IP sets, and regex pattern sets. You can't manage or view tags through the WAF console. \n\
  \ "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFTagOperationException of waf_tag_operation_exception
    | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFTagOperationException of waf_tag_operation_exception
      | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates tags from an Amazon Web Services resource. Tags are key:value pairs that you can \
   associate with Amazon Web Services resources. For example, the tag key might be \"customer\" \
   and the tag value might be \"companyA.\" You can specify one or more tags to add to each \
   container. You can add up to 50 tags to each Amazon Web Services resource.\n"]

module UpdateIPSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFDuplicateItemException of waf_duplicate_item_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFLimitsExceededException of waf_limits_exceeded_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_ip_set_request ->
    ( update_ip_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFDuplicateItemException of waf_duplicate_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_ip_set_request ->
    ( update_ip_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFDuplicateItemException of waf_duplicate_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified [IPSet]. \n\n\
  \  This operation completely replaces the mutable specifications that you already have for the \
   IP set with the ones that you provide to this call. \n\
  \  \n\
  \   To modify an IP set, do the following: \n\
  \   \n\
  \    {ol\n\
  \          {-  Retrieve it by calling [GetIPSet] \n\
  \              \n\
  \               }\n\
  \          {-  Update its settings as needed\n\
  \              \n\
  \               }\n\
  \          {-  Provide the complete IP set specification to this call\n\
  \              \n\
  \               }\n\
  \          }\n\
  \     {b Temporary inconsistencies during updates} \n\
  \    \n\
  \     When you create or change a web ACL or other WAF resources, the changes take a small \
   amount of time to propagate to all areas where the resources are stored. The propagation time \
   can be from a few seconds to a number of minutes. \n\
  \     \n\
  \      The following are examples of the temporary inconsistencies that you might notice during \
   change propagation: \n\
  \      \n\
  \       {ul\n\
  \             {-  After you create a web ACL, if you try to associate it with a resource, you \
   might get an exception indicating that the web ACL is unavailable. \n\
  \                 \n\
  \                  }\n\
  \             {-  After you add a rule group to a web ACL, the new rule group rules might be in \
   effect in one area where the web ACL is used and not in another.\n\
  \                 \n\
  \                  }\n\
  \             {-  After you change a rule action setting, you might see the old action in some \
   places and the new action in others. \n\
  \                 \n\
  \                  }\n\
  \             {-  After you add an IP address to an IP set that is in use in a blocking rule, \
   the new address might be blocked in one area while still allowed in another.\n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \  "]

module UpdateManagedRuleSetVersionExpiryDate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_managed_rule_set_version_expiry_date_request ->
    ( update_managed_rule_set_version_expiry_date_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_managed_rule_set_version_expiry_date_request ->
    ( update_managed_rule_set_version_expiry_date_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the expiration information for your managed rule set. Use this to initiate the \
   expiration of a managed rule group version. After you initiate expiration for a version, WAF \
   excludes it from the response to [ListAvailableManagedRuleGroupVersions] for the managed rule \
   group. \n\n\
  \  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web \
   Services and Amazon Web Services Marketplace sellers. \n\
  \  \n\
  \   Vendors, you can use the managed rule set APIs to provide controlled rollout of your \
   versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], \
   [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n\
  \   \n\
  \    "]

module UpdateRegexPatternSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFDuplicateItemException of waf_duplicate_item_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFLimitsExceededException of waf_limits_exceeded_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_regex_pattern_set_request ->
    ( update_regex_pattern_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFDuplicateItemException of waf_duplicate_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_regex_pattern_set_request ->
    ( update_regex_pattern_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFDuplicateItemException of waf_duplicate_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified [RegexPatternSet].\n\n\
  \  This operation completely replaces the mutable specifications that you already have for the \
   regex pattern set with the ones that you provide to this call. \n\
  \  \n\
  \   To modify a regex pattern set, do the following: \n\
  \   \n\
  \    {ol\n\
  \          {-  Retrieve it by calling [GetRegexPatternSet] \n\
  \              \n\
  \               }\n\
  \          {-  Update its settings as needed\n\
  \              \n\
  \               }\n\
  \          {-  Provide the complete regex pattern set specification to this call\n\
  \              \n\
  \               }\n\
  \          }\n\
  \     {b Temporary inconsistencies during updates} \n\
  \    \n\
  \     When you create or change a web ACL or other WAF resources, the changes take a small \
   amount of time to propagate to all areas where the resources are stored. The propagation time \
   can be from a few seconds to a number of minutes. \n\
  \     \n\
  \      The following are examples of the temporary inconsistencies that you might notice during \
   change propagation: \n\
  \      \n\
  \       {ul\n\
  \             {-  After you create a web ACL, if you try to associate it with a resource, you \
   might get an exception indicating that the web ACL is unavailable. \n\
  \                 \n\
  \                  }\n\
  \             {-  After you add a rule group to a web ACL, the new rule group rules might be in \
   effect in one area where the web ACL is used and not in another.\n\
  \                 \n\
  \                  }\n\
  \             {-  After you change a rule action setting, you might see the old action in some \
   places and the new action in others. \n\
  \                 \n\
  \                  }\n\
  \             {-  After you add an IP address to an IP set that is in use in a blocking rule, \
   the new address might be blocked in one area while still allowed in another.\n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \  "]

module UpdateRuleGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFConfigurationWarningException of waf_configuration_warning_exception
    | `WAFDuplicateItemException of waf_duplicate_item_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFLimitsExceededException of waf_limits_exceeded_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception
    | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
    | `WAFUnavailableEntityException of waf_unavailable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_rule_group_request ->
    ( update_rule_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFConfigurationWarningException of waf_configuration_warning_exception
      | `WAFDuplicateItemException of waf_duplicate_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
      | `WAFUnavailableEntityException of waf_unavailable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_rule_group_request ->
    ( update_rule_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFConfigurationWarningException of waf_configuration_warning_exception
      | `WAFDuplicateItemException of waf_duplicate_item_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
      | `WAFUnavailableEntityException of waf_unavailable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified [RuleGroup].\n\n\
  \  This operation completely replaces the mutable specifications that you already have for the \
   rule group with the ones that you provide to this call. \n\
  \  \n\
  \   To modify a rule group, do the following: \n\
  \   \n\
  \    {ol\n\
  \          {-  Retrieve it by calling [GetRuleGroup] \n\
  \              \n\
  \               }\n\
  \          {-  Update its settings as needed\n\
  \              \n\
  \               }\n\
  \          {-  Provide the complete rule group specification to this call\n\
  \              \n\
  \               }\n\
  \          }\n\
  \     A rule group defines a collection of rules to inspect and control web requests that you \
   can use in a [WebACL]. When you create a rule group, you define an immutable capacity limit. If \
   you update a rule group, you must stay within the capacity. This allows others to reuse the \
   rule group with confidence in its capacity requirements. \n\
  \    \n\
  \      {b Temporary inconsistencies during updates} \n\
  \     \n\
  \      When you create or change a web ACL or other WAF resources, the changes take a small \
   amount of time to propagate to all areas where the resources are stored. The propagation time \
   can be from a few seconds to a number of minutes. \n\
  \      \n\
  \       The following are examples of the temporary inconsistencies that you might notice during \
   change propagation: \n\
  \       \n\
  \        {ul\n\
  \              {-  After you create a web ACL, if you try to associate it with a resource, you \
   might get an exception indicating that the web ACL is unavailable. \n\
  \                  \n\
  \                   }\n\
  \              {-  After you add a rule group to a web ACL, the new rule group rules might be in \
   effect in one area where the web ACL is used and not in another.\n\
  \                  \n\
  \                   }\n\
  \              {-  After you change a rule action setting, you might see the old action in some \
   places and the new action in others. \n\
  \                  \n\
  \                   }\n\
  \              {-  After you add an IP address to an IP set that is in use in a blocking rule, \
   the new address might be blocked in one area while still allowed in another.\n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \  "]

(** {1:Serialization and Deserialization} *)
module UpdateWebACL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `WAFConfigurationWarningException of waf_configuration_warning_exception
    | `WAFDuplicateItemException of waf_duplicate_item_exception
    | `WAFExpiredManagedRuleGroupVersionException of
      waf_expired_managed_rule_group_version_exception
    | `WAFFeatureNotIncludedInPricingPlanException of
      waf_feature_not_included_in_pricing_plan_exception
    | `WAFInternalErrorException of waf_internal_error_exception
    | `WAFInvalidOperationException of waf_invalid_operation_exception
    | `WAFInvalidParameterException of waf_invalid_parameter_exception
    | `WAFInvalidResourceException of waf_invalid_resource_exception
    | `WAFLimitsExceededException of waf_limits_exceeded_exception
    | `WAFNonexistentItemException of waf_nonexistent_item_exception
    | `WAFOptimisticLockException of waf_optimistic_lock_exception
    | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
    | `WAFUnavailableEntityException of waf_unavailable_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_web_acl_request ->
    ( update_web_acl_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFConfigurationWarningException of waf_configuration_warning_exception
      | `WAFDuplicateItemException of waf_duplicate_item_exception
      | `WAFExpiredManagedRuleGroupVersionException of
        waf_expired_managed_rule_group_version_exception
      | `WAFFeatureNotIncludedInPricingPlanException of
        waf_feature_not_included_in_pricing_plan_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFInvalidResourceException of waf_invalid_resource_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
      | `WAFUnavailableEntityException of waf_unavailable_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_web_acl_request ->
    ( update_web_acl_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `WAFConfigurationWarningException of waf_configuration_warning_exception
      | `WAFDuplicateItemException of waf_duplicate_item_exception
      | `WAFExpiredManagedRuleGroupVersionException of
        waf_expired_managed_rule_group_version_exception
      | `WAFFeatureNotIncludedInPricingPlanException of
        waf_feature_not_included_in_pricing_plan_exception
      | `WAFInternalErrorException of waf_internal_error_exception
      | `WAFInvalidOperationException of waf_invalid_operation_exception
      | `WAFInvalidParameterException of waf_invalid_parameter_exception
      | `WAFInvalidResourceException of waf_invalid_resource_exception
      | `WAFLimitsExceededException of waf_limits_exceeded_exception
      | `WAFNonexistentItemException of waf_nonexistent_item_exception
      | `WAFOptimisticLockException of waf_optimistic_lock_exception
      | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
      | `WAFUnavailableEntityException of waf_unavailable_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified [WebACL]. While updating a web ACL, WAF provides continuous coverage to \
   the resources that you have associated with the web ACL. \n\n\
  \  This operation completely replaces the mutable specifications that you already have for the \
   web ACL with the ones that you provide to this call. \n\
  \  \n\
  \   To modify a web ACL, do the following: \n\
  \   \n\
  \    {ol\n\
  \          {-  Retrieve it by calling [GetWebACL] \n\
  \              \n\
  \               }\n\
  \          {-  Update its settings as needed\n\
  \              \n\
  \               }\n\
  \          {-  Provide the complete web ACL specification to this call\n\
  \              \n\
  \               }\n\
  \          }\n\
  \     A web ACL defines a collection of rules to use to inspect and control web requests. Each \
   rule has a statement that defines what to look for in web requests and an action that WAF \
   applies to requests that match the statement. In the web ACL, you assign a default action to \
   take (allow, block) for any request that does not match any of the rules. The rules in a web \
   ACL can be a combination of the types [Rule], [RuleGroup], and managed rule group. You can \
   associate a web ACL with one or more Amazon Web Services resources to protect. The resource \
   types include Amazon CloudFront distribution, Amazon API Gateway REST API, Application Load \
   Balancer, AppSync GraphQL API, Amazon Cognito user pool, App Runner service, Amplify \
   application, and Amazon Web Services Verified Access instance. \n\
  \    \n\
  \      {b Temporary inconsistencies during updates} \n\
  \     \n\
  \      When you create or change a web ACL or other WAF resources, the changes take a small \
   amount of time to propagate to all areas where the resources are stored. The propagation time \
   can be from a few seconds to a number of minutes. \n\
  \      \n\
  \       The following are examples of the temporary inconsistencies that you might notice during \
   change propagation: \n\
  \       \n\
  \        {ul\n\
  \              {-  After you create a web ACL, if you try to associate it with a resource, you \
   might get an exception indicating that the web ACL is unavailable. \n\
  \                  \n\
  \                   }\n\
  \              {-  After you add a rule group to a web ACL, the new rule group rules might be in \
   effect in one area where the web ACL is used and not in another.\n\
  \                  \n\
  \                   }\n\
  \              {-  After you change a rule action setting, you might see the old action in some \
   places and the new action in others. \n\
  \                  \n\
  \                   }\n\
  \              {-  After you add an IP address to an IP set that is in use in a blocking rule, \
   the new address might be blocked in one area while still allowed in another.\n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \  "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
