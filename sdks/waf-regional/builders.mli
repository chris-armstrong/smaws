open Types

val make_update_xss_match_set_response :
  ?change_token:change_token -> unit -> update_xss_match_set_response

val make_field_to_match : ?data:match_field_data -> type_:match_field_type -> unit -> field_to_match

val make_xss_match_tuple :
  field_to_match:field_to_match ->
  text_transformation:text_transformation ->
  unit ->
  xss_match_tuple

val make_xss_match_set_update :
  action:change_action -> xss_match_tuple:xss_match_tuple -> unit -> xss_match_set_update

val make_update_xss_match_set_request :
  xss_match_set_id:resource_id ->
  change_token:change_token ->
  updates:xss_match_set_updates ->
  unit ->
  update_xss_match_set_request

val make_update_web_acl_response : ?change_token:change_token -> unit -> update_web_acl_response
val make_waf_action : type_:waf_action_type -> unit -> waf_action
val make_excluded_rule : rule_id:resource_id -> unit -> excluded_rule
val make_waf_override_action : type_:waf_override_action_type -> unit -> waf_override_action

val make_activated_rule :
  ?action:waf_action ->
  ?override_action:waf_override_action ->
  ?type_:waf_rule_type ->
  ?excluded_rules:excluded_rules ->
  priority:rule_priority ->
  rule_id:resource_id ->
  unit ->
  activated_rule

val make_web_acl_update :
  action:change_action -> activated_rule:activated_rule -> unit -> web_acl_update

val make_update_web_acl_request :
  ?updates:web_acl_updates ->
  ?default_action:waf_action ->
  web_acl_id:resource_id ->
  change_token:change_token ->
  unit ->
  update_web_acl_request

val make_update_sql_injection_match_set_response :
  ?change_token:change_token -> unit -> update_sql_injection_match_set_response

val make_sql_injection_match_tuple :
  field_to_match:field_to_match ->
  text_transformation:text_transformation ->
  unit ->
  sql_injection_match_tuple

val make_sql_injection_match_set_update :
  action:change_action ->
  sql_injection_match_tuple:sql_injection_match_tuple ->
  unit ->
  sql_injection_match_set_update

val make_update_sql_injection_match_set_request :
  sql_injection_match_set_id:resource_id ->
  change_token:change_token ->
  updates:sql_injection_match_set_updates ->
  unit ->
  update_sql_injection_match_set_request

val make_update_size_constraint_set_response :
  ?change_token:change_token -> unit -> update_size_constraint_set_response

val make_size_constraint :
  field_to_match:field_to_match ->
  text_transformation:text_transformation ->
  comparison_operator:comparison_operator ->
  size:size ->
  unit ->
  size_constraint

val make_size_constraint_set_update :
  action:change_action -> size_constraint:size_constraint -> unit -> size_constraint_set_update

val make_update_size_constraint_set_request :
  size_constraint_set_id:resource_id ->
  change_token:change_token ->
  updates:size_constraint_set_updates ->
  unit ->
  update_size_constraint_set_request

val make_update_rule_group_response :
  ?change_token:change_token -> unit -> update_rule_group_response

val make_rule_group_update :
  action:change_action -> activated_rule:activated_rule -> unit -> rule_group_update

val make_update_rule_group_request :
  rule_group_id:resource_id ->
  updates:rule_group_updates ->
  change_token:change_token ->
  unit ->
  update_rule_group_request

val make_update_rule_response : ?change_token:change_token -> unit -> update_rule_response

val make_predicate :
  negated:negated -> type_:predicate_type -> data_id:resource_id -> unit -> predicate

val make_rule_update : action:change_action -> predicate:predicate -> unit -> rule_update

val make_update_rule_request :
  rule_id:resource_id ->
  change_token:change_token ->
  updates:rule_updates ->
  unit ->
  update_rule_request

val make_update_regex_pattern_set_response :
  ?change_token:change_token -> unit -> update_regex_pattern_set_response

val make_regex_pattern_set_update :
  action:change_action ->
  regex_pattern_string:regex_pattern_string ->
  unit ->
  regex_pattern_set_update

val make_update_regex_pattern_set_request :
  regex_pattern_set_id:resource_id ->
  updates:regex_pattern_set_updates ->
  change_token:change_token ->
  unit ->
  update_regex_pattern_set_request

val make_update_regex_match_set_response :
  ?change_token:change_token -> unit -> update_regex_match_set_response

val make_regex_match_tuple :
  field_to_match:field_to_match ->
  text_transformation:text_transformation ->
  regex_pattern_set_id:resource_id ->
  unit ->
  regex_match_tuple

val make_regex_match_set_update :
  action:change_action -> regex_match_tuple:regex_match_tuple -> unit -> regex_match_set_update

val make_update_regex_match_set_request :
  regex_match_set_id:resource_id ->
  updates:regex_match_set_updates ->
  change_token:change_token ->
  unit ->
  update_regex_match_set_request

val make_update_rate_based_rule_response :
  ?change_token:change_token -> unit -> update_rate_based_rule_response

val make_update_rate_based_rule_request :
  rule_id:resource_id ->
  change_token:change_token ->
  updates:rule_updates ->
  rate_limit:rate_limit ->
  unit ->
  update_rate_based_rule_request

val make_update_ip_set_response : ?change_token:change_token -> unit -> update_ip_set_response

val make_ip_set_descriptor :
  type_:ip_set_descriptor_type -> value:ip_set_descriptor_value -> unit -> ip_set_descriptor

val make_ip_set_update :
  action:change_action -> ip_set_descriptor:ip_set_descriptor -> unit -> ip_set_update

val make_update_ip_set_request :
  ip_set_id:resource_id ->
  change_token:change_token ->
  updates:ip_set_updates ->
  unit ->
  update_ip_set_request

val make_update_geo_match_set_response :
  ?change_token:change_token -> unit -> update_geo_match_set_response

val make_geo_match_constraint :
  type_:geo_match_constraint_type ->
  value:geo_match_constraint_value ->
  unit ->
  geo_match_constraint

val make_geo_match_set_update :
  action:change_action -> geo_match_constraint:geo_match_constraint -> unit -> geo_match_set_update

val make_update_geo_match_set_request :
  geo_match_set_id:resource_id ->
  change_token:change_token ->
  updates:geo_match_set_updates ->
  unit ->
  update_geo_match_set_request

val make_update_byte_match_set_response :
  ?change_token:change_token -> unit -> update_byte_match_set_response

val make_byte_match_tuple :
  field_to_match:field_to_match ->
  target_string:byte_match_target_string ->
  text_transformation:text_transformation ->
  positional_constraint:positional_constraint ->
  unit ->
  byte_match_tuple

val make_byte_match_set_update :
  action:change_action -> byte_match_tuple:byte_match_tuple -> unit -> byte_match_set_update

val make_update_byte_match_set_request :
  byte_match_set_id:resource_id ->
  change_token:change_token ->
  updates:byte_match_set_updates ->
  unit ->
  update_byte_match_set_request

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

val make_logging_configuration :
  ?redacted_fields:redacted_fields ->
  resource_arn:resource_arn ->
  log_destination_configs:log_destination_configs ->
  unit ->
  logging_configuration

val make_put_logging_configuration_response :
  ?logging_configuration:logging_configuration -> unit -> put_logging_configuration_response

val make_put_logging_configuration_request :
  logging_configuration:logging_configuration -> unit -> put_logging_configuration_request

val make_xss_match_set_summary :
  xss_match_set_id:resource_id -> name:resource_name -> unit -> xss_match_set_summary

val make_list_xss_match_sets_response :
  ?next_marker:next_marker ->
  ?xss_match_sets:xss_match_set_summaries ->
  unit ->
  list_xss_match_sets_response

val make_list_xss_match_sets_request :
  ?next_marker:next_marker -> ?limit:pagination_limit -> unit -> list_xss_match_sets_request

val make_web_acl_summary : web_acl_id:resource_id -> name:resource_name -> unit -> web_acl_summary

val make_list_web_ac_ls_response :
  ?next_marker:next_marker -> ?web_ac_ls:web_acl_summaries -> unit -> list_web_ac_ls_response

val make_list_web_ac_ls_request :
  ?next_marker:next_marker -> ?limit:pagination_limit -> unit -> list_web_ac_ls_request

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

val make_subscribed_rule_group_summary :
  rule_group_id:resource_id ->
  name:resource_name ->
  metric_name:metric_name ->
  unit ->
  subscribed_rule_group_summary

val make_list_subscribed_rule_groups_response :
  ?next_marker:next_marker ->
  ?rule_groups:subscribed_rule_group_summaries ->
  unit ->
  list_subscribed_rule_groups_response

val make_list_subscribed_rule_groups_request :
  ?next_marker:next_marker -> ?limit:pagination_limit -> unit -> list_subscribed_rule_groups_request

val make_sql_injection_match_set_summary :
  sql_injection_match_set_id:resource_id ->
  name:resource_name ->
  unit ->
  sql_injection_match_set_summary

val make_list_sql_injection_match_sets_response :
  ?next_marker:next_marker ->
  ?sql_injection_match_sets:sql_injection_match_set_summaries ->
  unit ->
  list_sql_injection_match_sets_response

val make_list_sql_injection_match_sets_request :
  ?next_marker:next_marker ->
  ?limit:pagination_limit ->
  unit ->
  list_sql_injection_match_sets_request

val make_size_constraint_set_summary :
  size_constraint_set_id:resource_id -> name:resource_name -> unit -> size_constraint_set_summary

val make_list_size_constraint_sets_response :
  ?next_marker:next_marker ->
  ?size_constraint_sets:size_constraint_set_summaries ->
  unit ->
  list_size_constraint_sets_response

val make_list_size_constraint_sets_request :
  ?next_marker:next_marker -> ?limit:pagination_limit -> unit -> list_size_constraint_sets_request

val make_rule_summary : rule_id:resource_id -> name:resource_name -> unit -> rule_summary

val make_list_rules_response :
  ?next_marker:next_marker -> ?rules:rule_summaries -> unit -> list_rules_response

val make_list_rules_request :
  ?next_marker:next_marker -> ?limit:pagination_limit -> unit -> list_rules_request

val make_rule_group_summary :
  rule_group_id:resource_id -> name:resource_name -> unit -> rule_group_summary

val make_list_rule_groups_response :
  ?next_marker:next_marker -> ?rule_groups:rule_group_summaries -> unit -> list_rule_groups_response

val make_list_rule_groups_request :
  ?next_marker:next_marker -> ?limit:pagination_limit -> unit -> list_rule_groups_request

val make_list_resources_for_web_acl_response :
  ?resource_arns:resource_arns -> unit -> list_resources_for_web_acl_response

val make_list_resources_for_web_acl_request :
  ?resource_type:resource_type ->
  web_acl_id:resource_id ->
  unit ->
  list_resources_for_web_acl_request

val make_regex_pattern_set_summary :
  regex_pattern_set_id:resource_id -> name:resource_name -> unit -> regex_pattern_set_summary

val make_list_regex_pattern_sets_response :
  ?next_marker:next_marker ->
  ?regex_pattern_sets:regex_pattern_set_summaries ->
  unit ->
  list_regex_pattern_sets_response

val make_list_regex_pattern_sets_request :
  ?next_marker:next_marker -> ?limit:pagination_limit -> unit -> list_regex_pattern_sets_request

val make_regex_match_set_summary :
  regex_match_set_id:resource_id -> name:resource_name -> unit -> regex_match_set_summary

val make_list_regex_match_sets_response :
  ?next_marker:next_marker ->
  ?regex_match_sets:regex_match_set_summaries ->
  unit ->
  list_regex_match_sets_response

val make_list_regex_match_sets_request :
  ?next_marker:next_marker -> ?limit:pagination_limit -> unit -> list_regex_match_sets_request

val make_list_rate_based_rules_response :
  ?next_marker:next_marker -> ?rules:rule_summaries -> unit -> list_rate_based_rules_response

val make_list_rate_based_rules_request :
  ?next_marker:next_marker -> ?limit:pagination_limit -> unit -> list_rate_based_rules_request

val make_list_logging_configurations_response :
  ?logging_configurations:logging_configurations ->
  ?next_marker:next_marker ->
  unit ->
  list_logging_configurations_response

val make_list_logging_configurations_request :
  ?next_marker:next_marker -> ?limit:pagination_limit -> unit -> list_logging_configurations_request

val make_ip_set_summary : ip_set_id:resource_id -> name:resource_name -> unit -> ip_set_summary

val make_list_ip_sets_response :
  ?next_marker:next_marker -> ?ip_sets:ip_set_summaries -> unit -> list_ip_sets_response

val make_list_ip_sets_request :
  ?next_marker:next_marker -> ?limit:pagination_limit -> unit -> list_ip_sets_request

val make_geo_match_set_summary :
  geo_match_set_id:resource_id -> name:resource_name -> unit -> geo_match_set_summary

val make_list_geo_match_sets_response :
  ?next_marker:next_marker ->
  ?geo_match_sets:geo_match_set_summaries ->
  unit ->
  list_geo_match_sets_response

val make_list_geo_match_sets_request :
  ?next_marker:next_marker -> ?limit:pagination_limit -> unit -> list_geo_match_sets_request

val make_byte_match_set_summary :
  byte_match_set_id:resource_id -> name:resource_name -> unit -> byte_match_set_summary

val make_list_byte_match_sets_response :
  ?next_marker:next_marker ->
  ?byte_match_sets:byte_match_set_summaries ->
  unit ->
  list_byte_match_sets_response

val make_list_byte_match_sets_request :
  ?next_marker:next_marker -> ?limit:pagination_limit -> unit -> list_byte_match_sets_request

val make_list_activated_rules_in_rule_group_response :
  ?next_marker:next_marker ->
  ?activated_rules:activated_rules ->
  unit ->
  list_activated_rules_in_rule_group_response

val make_list_activated_rules_in_rule_group_request :
  ?rule_group_id:resource_id ->
  ?next_marker:next_marker ->
  ?limit:pagination_limit ->
  unit ->
  list_activated_rules_in_rule_group_request

val make_xss_match_set :
  ?name:resource_name ->
  xss_match_set_id:resource_id ->
  xss_match_tuples:xss_match_tuples ->
  unit ->
  xss_match_set

val make_get_xss_match_set_response :
  ?xss_match_set:xss_match_set -> unit -> get_xss_match_set_response

val make_get_xss_match_set_request :
  xss_match_set_id:resource_id -> unit -> get_xss_match_set_request

val make_get_web_acl_for_resource_response :
  ?web_acl_summary:web_acl_summary -> unit -> get_web_acl_for_resource_response

val make_get_web_acl_for_resource_request :
  resource_arn:resource_arn -> unit -> get_web_acl_for_resource_request

val make_web_ac_l :
  ?name:resource_name ->
  ?metric_name:metric_name ->
  ?web_acl_arn:resource_arn ->
  web_acl_id:resource_id ->
  default_action:waf_action ->
  rules:activated_rules ->
  unit ->
  web_ac_l

val make_get_web_acl_response : ?web_ac_l:web_ac_l -> unit -> get_web_acl_response
val make_get_web_acl_request : web_acl_id:resource_id -> unit -> get_web_acl_request

val make_sql_injection_match_set :
  ?name:resource_name ->
  sql_injection_match_set_id:resource_id ->
  sql_injection_match_tuples:sql_injection_match_tuples ->
  unit ->
  sql_injection_match_set

val make_get_sql_injection_match_set_response :
  ?sql_injection_match_set:sql_injection_match_set -> unit -> get_sql_injection_match_set_response

val make_get_sql_injection_match_set_request :
  sql_injection_match_set_id:resource_id -> unit -> get_sql_injection_match_set_request

val make_size_constraint_set :
  ?name:resource_name ->
  size_constraint_set_id:resource_id ->
  size_constraints:size_constraints ->
  unit ->
  size_constraint_set

val make_get_size_constraint_set_response :
  ?size_constraint_set:size_constraint_set -> unit -> get_size_constraint_set_response

val make_get_size_constraint_set_request :
  size_constraint_set_id:resource_id -> unit -> get_size_constraint_set_request

val make_time_window : start_time:timestamp -> end_time:timestamp -> unit -> time_window
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
  ?rule_within_rule_group:resource_id ->
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
  web_acl_id:resource_id ->
  rule_id:resource_id ->
  time_window:time_window ->
  max_items:get_sampled_requests_max_items ->
  unit ->
  get_sampled_requests_request

val make_rule_group :
  ?name:resource_name -> ?metric_name:metric_name -> rule_group_id:resource_id -> unit -> rule_group

val make_get_rule_group_response : ?rule_group:rule_group -> unit -> get_rule_group_response
val make_get_rule_group_request : rule_group_id:resource_id -> unit -> get_rule_group_request

val make_rule :
  ?name:resource_name ->
  ?metric_name:metric_name ->
  rule_id:resource_id ->
  predicates:predicates ->
  unit ->
  rule

val make_get_rule_response : ?rule:rule -> unit -> get_rule_response
val make_get_rule_request : rule_id:resource_id -> unit -> get_rule_request

val make_regex_pattern_set :
  ?name:resource_name ->
  regex_pattern_set_id:resource_id ->
  regex_pattern_strings:regex_pattern_strings ->
  unit ->
  regex_pattern_set

val make_get_regex_pattern_set_response :
  ?regex_pattern_set:regex_pattern_set -> unit -> get_regex_pattern_set_response

val make_get_regex_pattern_set_request :
  regex_pattern_set_id:resource_id -> unit -> get_regex_pattern_set_request

val make_regex_match_set :
  ?regex_match_set_id:resource_id ->
  ?name:resource_name ->
  ?regex_match_tuples:regex_match_tuples ->
  unit ->
  regex_match_set

val make_get_regex_match_set_response :
  ?regex_match_set:regex_match_set -> unit -> get_regex_match_set_response

val make_get_regex_match_set_request :
  regex_match_set_id:resource_id -> unit -> get_regex_match_set_request

val make_get_rate_based_rule_managed_keys_response :
  ?managed_keys:managed_keys ->
  ?next_marker:next_marker ->
  unit ->
  get_rate_based_rule_managed_keys_response

val make_get_rate_based_rule_managed_keys_request :
  ?next_marker:next_marker ->
  rule_id:resource_id ->
  unit ->
  get_rate_based_rule_managed_keys_request

val make_rate_based_rule :
  ?name:resource_name ->
  ?metric_name:metric_name ->
  rule_id:resource_id ->
  match_predicates:predicates ->
  rate_key:rate_key ->
  rate_limit:rate_limit ->
  unit ->
  rate_based_rule

val make_get_rate_based_rule_response :
  ?rule:rate_based_rule -> unit -> get_rate_based_rule_response

val make_get_rate_based_rule_request : rule_id:resource_id -> unit -> get_rate_based_rule_request

val make_get_permission_policy_response :
  ?policy:policy_string -> unit -> get_permission_policy_response

val make_get_permission_policy_request :
  resource_arn:resource_arn -> unit -> get_permission_policy_request

val make_get_logging_configuration_response :
  ?logging_configuration:logging_configuration -> unit -> get_logging_configuration_response

val make_get_logging_configuration_request :
  resource_arn:resource_arn -> unit -> get_logging_configuration_request

val make_ip_set :
  ?name:resource_name ->
  ip_set_id:resource_id ->
  ip_set_descriptors:ip_set_descriptors ->
  unit ->
  ip_set

val make_get_ip_set_response : ?ip_set:ip_set -> unit -> get_ip_set_response
val make_get_ip_set_request : ip_set_id:resource_id -> unit -> get_ip_set_request

val make_geo_match_set :
  ?name:resource_name ->
  geo_match_set_id:resource_id ->
  geo_match_constraints:geo_match_constraints ->
  unit ->
  geo_match_set

val make_get_geo_match_set_response :
  ?geo_match_set:geo_match_set -> unit -> get_geo_match_set_response

val make_get_geo_match_set_request :
  geo_match_set_id:resource_id -> unit -> get_geo_match_set_request

val make_get_change_token_status_response :
  ?change_token_status:change_token_status -> unit -> get_change_token_status_response

val make_get_change_token_status_request :
  change_token:change_token -> unit -> get_change_token_status_request

val make_get_change_token_response : ?change_token:change_token -> unit -> get_change_token_response
val make_get_change_token_request : unit -> unit

val make_byte_match_set :
  ?name:resource_name ->
  byte_match_set_id:resource_id ->
  byte_match_tuples:byte_match_tuples ->
  unit ->
  byte_match_set

val make_get_byte_match_set_response :
  ?byte_match_set:byte_match_set -> unit -> get_byte_match_set_response

val make_get_byte_match_set_request :
  byte_match_set_id:resource_id -> unit -> get_byte_match_set_request

val make_disassociate_web_acl_response : unit -> unit

val make_disassociate_web_acl_request :
  resource_arn:resource_arn -> unit -> disassociate_web_acl_request

val make_delete_xss_match_set_response :
  ?change_token:change_token -> unit -> delete_xss_match_set_response

val make_delete_xss_match_set_request :
  xss_match_set_id:resource_id -> change_token:change_token -> unit -> delete_xss_match_set_request

val make_delete_web_acl_response : ?change_token:change_token -> unit -> delete_web_acl_response

val make_delete_web_acl_request :
  web_acl_id:resource_id -> change_token:change_token -> unit -> delete_web_acl_request

val make_delete_sql_injection_match_set_response :
  ?change_token:change_token -> unit -> delete_sql_injection_match_set_response

val make_delete_sql_injection_match_set_request :
  sql_injection_match_set_id:resource_id ->
  change_token:change_token ->
  unit ->
  delete_sql_injection_match_set_request

val make_delete_size_constraint_set_response :
  ?change_token:change_token -> unit -> delete_size_constraint_set_response

val make_delete_size_constraint_set_request :
  size_constraint_set_id:resource_id ->
  change_token:change_token ->
  unit ->
  delete_size_constraint_set_request

val make_delete_rule_group_response :
  ?change_token:change_token -> unit -> delete_rule_group_response

val make_delete_rule_group_request :
  rule_group_id:resource_id -> change_token:change_token -> unit -> delete_rule_group_request

val make_delete_rule_response : ?change_token:change_token -> unit -> delete_rule_response

val make_delete_rule_request :
  rule_id:resource_id -> change_token:change_token -> unit -> delete_rule_request

val make_delete_regex_pattern_set_response :
  ?change_token:change_token -> unit -> delete_regex_pattern_set_response

val make_delete_regex_pattern_set_request :
  regex_pattern_set_id:resource_id ->
  change_token:change_token ->
  unit ->
  delete_regex_pattern_set_request

val make_delete_regex_match_set_response :
  ?change_token:change_token -> unit -> delete_regex_match_set_response

val make_delete_regex_match_set_request :
  regex_match_set_id:resource_id ->
  change_token:change_token ->
  unit ->
  delete_regex_match_set_request

val make_delete_rate_based_rule_response :
  ?change_token:change_token -> unit -> delete_rate_based_rule_response

val make_delete_rate_based_rule_request :
  rule_id:resource_id -> change_token:change_token -> unit -> delete_rate_based_rule_request

val make_delete_permission_policy_response : unit -> unit

val make_delete_permission_policy_request :
  resource_arn:resource_arn -> unit -> delete_permission_policy_request

val make_delete_logging_configuration_response : unit -> unit

val make_delete_logging_configuration_request :
  resource_arn:resource_arn -> unit -> delete_logging_configuration_request

val make_delete_ip_set_response : ?change_token:change_token -> unit -> delete_ip_set_response

val make_delete_ip_set_request :
  ip_set_id:resource_id -> change_token:change_token -> unit -> delete_ip_set_request

val make_delete_geo_match_set_response :
  ?change_token:change_token -> unit -> delete_geo_match_set_response

val make_delete_geo_match_set_request :
  geo_match_set_id:resource_id -> change_token:change_token -> unit -> delete_geo_match_set_request

val make_delete_byte_match_set_response :
  ?change_token:change_token -> unit -> delete_byte_match_set_response

val make_delete_byte_match_set_request :
  byte_match_set_id:resource_id ->
  change_token:change_token ->
  unit ->
  delete_byte_match_set_request

val make_create_xss_match_set_response :
  ?xss_match_set:xss_match_set ->
  ?change_token:change_token ->
  unit ->
  create_xss_match_set_response

val make_create_xss_match_set_request :
  name:resource_name -> change_token:change_token -> unit -> create_xss_match_set_request

val make_create_web_acl_migration_stack_response :
  s3_object_url:s3_object_url -> unit -> create_web_acl_migration_stack_response

val make_create_web_acl_migration_stack_request :
  web_acl_id:resource_id ->
  s3_bucket_name:s3_bucket_name ->
  ignore_unsupported_type:ignore_unsupported_type ->
  unit ->
  create_web_acl_migration_stack_request

val make_create_web_acl_response :
  ?web_ac_l:web_ac_l -> ?change_token:change_token -> unit -> create_web_acl_response

val make_create_web_acl_request :
  ?tags:tag_list ->
  name:resource_name ->
  metric_name:metric_name ->
  default_action:waf_action ->
  change_token:change_token ->
  unit ->
  create_web_acl_request

val make_create_sql_injection_match_set_response :
  ?sql_injection_match_set:sql_injection_match_set ->
  ?change_token:change_token ->
  unit ->
  create_sql_injection_match_set_response

val make_create_sql_injection_match_set_request :
  name:resource_name -> change_token:change_token -> unit -> create_sql_injection_match_set_request

val make_create_size_constraint_set_response :
  ?size_constraint_set:size_constraint_set ->
  ?change_token:change_token ->
  unit ->
  create_size_constraint_set_response

val make_create_size_constraint_set_request :
  name:resource_name -> change_token:change_token -> unit -> create_size_constraint_set_request

val make_create_rule_group_response :
  ?rule_group:rule_group -> ?change_token:change_token -> unit -> create_rule_group_response

val make_create_rule_group_request :
  ?tags:tag_list ->
  name:resource_name ->
  metric_name:metric_name ->
  change_token:change_token ->
  unit ->
  create_rule_group_request

val make_create_rule_response :
  ?rule:rule -> ?change_token:change_token -> unit -> create_rule_response

val make_create_rule_request :
  ?tags:tag_list ->
  name:resource_name ->
  metric_name:metric_name ->
  change_token:change_token ->
  unit ->
  create_rule_request

val make_create_regex_pattern_set_response :
  ?regex_pattern_set:regex_pattern_set ->
  ?change_token:change_token ->
  unit ->
  create_regex_pattern_set_response

val make_create_regex_pattern_set_request :
  name:resource_name -> change_token:change_token -> unit -> create_regex_pattern_set_request

val make_create_regex_match_set_response :
  ?regex_match_set:regex_match_set ->
  ?change_token:change_token ->
  unit ->
  create_regex_match_set_response

val make_create_regex_match_set_request :
  name:resource_name -> change_token:change_token -> unit -> create_regex_match_set_request

val make_create_rate_based_rule_response :
  ?rule:rate_based_rule -> ?change_token:change_token -> unit -> create_rate_based_rule_response

val make_create_rate_based_rule_request :
  ?tags:tag_list ->
  name:resource_name ->
  metric_name:metric_name ->
  rate_key:rate_key ->
  rate_limit:rate_limit ->
  change_token:change_token ->
  unit ->
  create_rate_based_rule_request

val make_create_ip_set_response :
  ?ip_set:ip_set -> ?change_token:change_token -> unit -> create_ip_set_response

val make_create_ip_set_request :
  name:resource_name -> change_token:change_token -> unit -> create_ip_set_request

val make_create_geo_match_set_response :
  ?geo_match_set:geo_match_set ->
  ?change_token:change_token ->
  unit ->
  create_geo_match_set_response

val make_create_geo_match_set_request :
  name:resource_name -> change_token:change_token -> unit -> create_geo_match_set_request

val make_create_byte_match_set_response :
  ?byte_match_set:byte_match_set ->
  ?change_token:change_token ->
  unit ->
  create_byte_match_set_response

val make_create_byte_match_set_request :
  name:resource_name -> change_token:change_token -> unit -> create_byte_match_set_request

val make_associate_web_acl_response : unit -> unit

val make_associate_web_acl_request :
  web_acl_id:resource_id -> resource_arn:resource_arn -> unit -> associate_web_acl_request
