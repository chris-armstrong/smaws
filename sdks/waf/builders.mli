open Types
val make_field_to_match :
  ?data:match_field_data -> type_:match_field_type -> unit -> field_to_match
val make_xss_match_tuple :
  text_transformation:text_transformation ->
    field_to_match:field_to_match -> unit -> xss_match_tuple
val make_xss_match_set_update :
  xss_match_tuple:xss_match_tuple ->
    action:change_action -> unit -> xss_match_set_update
val make_xss_match_set_summary :
  name:resource_name ->
    xss_match_set_id:resource_id -> unit -> xss_match_set_summary
val make_xss_match_set :
  ?name:resource_name ->
    xss_match_tuples:xss_match_tuples ->
      xss_match_set_id:resource_id -> unit -> xss_match_set
val make_waf_action : type_:waf_action_type -> unit -> waf_action
val make_waf_override_action :
  type_:waf_override_action_type -> unit -> waf_override_action
val make_excluded_rule : rule_id:resource_id -> unit -> excluded_rule
val make_activated_rule :
  ?excluded_rules:excluded_rules ->
    ?type_:waf_rule_type ->
      ?override_action:waf_override_action ->
        ?action:waf_action ->
          rule_id:resource_id ->
            priority:rule_priority -> unit -> activated_rule
val make_web_acl_update :
  activated_rule:activated_rule ->
    action:change_action -> unit -> web_acl_update
val make_web_acl_summary :
  name:resource_name -> web_acl_id:resource_id -> unit -> web_acl_summary
val make_web_ac_l :
  ?web_acl_arn:resource_arn ->
    ?metric_name:metric_name ->
      ?name:resource_name ->
        rules:activated_rules ->
          default_action:waf_action ->
            web_acl_id:resource_id -> unit -> web_ac_l
val make_update_xss_match_set_response :
  ?change_token:change_token -> unit -> update_xss_match_set_response
val make_update_xss_match_set_request :
  updates:xss_match_set_updates ->
    change_token:change_token ->
      xss_match_set_id:resource_id -> unit -> update_xss_match_set_request
val make_update_web_acl_response :
  ?change_token:change_token -> unit -> update_web_acl_response
val make_update_web_acl_request :
  ?default_action:waf_action ->
    ?updates:web_acl_updates ->
      change_token:change_token ->
        web_acl_id:resource_id -> unit -> update_web_acl_request
val make_update_sql_injection_match_set_response :
  ?change_token:change_token ->
    unit -> update_sql_injection_match_set_response
val make_sql_injection_match_tuple :
  text_transformation:text_transformation ->
    field_to_match:field_to_match -> unit -> sql_injection_match_tuple
val make_sql_injection_match_set_update :
  sql_injection_match_tuple:sql_injection_match_tuple ->
    action:change_action -> unit -> sql_injection_match_set_update
val make_update_sql_injection_match_set_request :
  updates:sql_injection_match_set_updates ->
    change_token:change_token ->
      sql_injection_match_set_id:resource_id ->
        unit -> update_sql_injection_match_set_request
val make_update_size_constraint_set_response :
  ?change_token:change_token -> unit -> update_size_constraint_set_response
val make_size_constraint :
  size:size ->
    comparison_operator:comparison_operator ->
      text_transformation:text_transformation ->
        field_to_match:field_to_match -> unit -> size_constraint
val make_size_constraint_set_update :
  size_constraint:size_constraint ->
    action:change_action -> unit -> size_constraint_set_update
val make_update_size_constraint_set_request :
  updates:size_constraint_set_updates ->
    change_token:change_token ->
      size_constraint_set_id:resource_id ->
        unit -> update_size_constraint_set_request
val make_update_rule_response :
  ?change_token:change_token -> unit -> update_rule_response
val make_predicate :
  data_id:resource_id ->
    type_:predicate_type -> negated:negated -> unit -> predicate
val make_rule_update :
  predicate:predicate -> action:change_action -> unit -> rule_update
val make_update_rule_request :
  updates:rule_updates ->
    change_token:change_token ->
      rule_id:resource_id -> unit -> update_rule_request
val make_update_rule_group_response :
  ?change_token:change_token -> unit -> update_rule_group_response
val make_rule_group_update :
  activated_rule:activated_rule ->
    action:change_action -> unit -> rule_group_update
val make_update_rule_group_request :
  change_token:change_token ->
    updates:rule_group_updates ->
      rule_group_id:resource_id -> unit -> update_rule_group_request
val make_update_regex_pattern_set_response :
  ?change_token:change_token -> unit -> update_regex_pattern_set_response
val make_regex_pattern_set_update :
  regex_pattern_string:regex_pattern_string ->
    action:change_action -> unit -> regex_pattern_set_update
val make_update_regex_pattern_set_request :
  change_token:change_token ->
    updates:regex_pattern_set_updates ->
      regex_pattern_set_id:resource_id ->
        unit -> update_regex_pattern_set_request
val make_update_regex_match_set_response :
  ?change_token:change_token -> unit -> update_regex_match_set_response
val make_regex_match_tuple :
  regex_pattern_set_id:resource_id ->
    text_transformation:text_transformation ->
      field_to_match:field_to_match -> unit -> regex_match_tuple
val make_regex_match_set_update :
  regex_match_tuple:regex_match_tuple ->
    action:change_action -> unit -> regex_match_set_update
val make_update_regex_match_set_request :
  change_token:change_token ->
    updates:regex_match_set_updates ->
      regex_match_set_id:resource_id ->
        unit -> update_regex_match_set_request
val make_update_rate_based_rule_response :
  ?change_token:change_token -> unit -> update_rate_based_rule_response
val make_update_rate_based_rule_request :
  rate_limit:rate_limit ->
    updates:rule_updates ->
      change_token:change_token ->
        rule_id:resource_id -> unit -> update_rate_based_rule_request
val make_update_ip_set_response :
  ?change_token:change_token -> unit -> update_ip_set_response
val make_ip_set_descriptor :
  value:ip_set_descriptor_value ->
    type_:ip_set_descriptor_type -> unit -> ip_set_descriptor
val make_ip_set_update :
  ip_set_descriptor:ip_set_descriptor ->
    action:change_action -> unit -> ip_set_update
val make_update_ip_set_request :
  updates:ip_set_updates ->
    change_token:change_token ->
      ip_set_id:resource_id -> unit -> update_ip_set_request
val make_update_geo_match_set_response :
  ?change_token:change_token -> unit -> update_geo_match_set_response
val make_geo_match_constraint :
  value:geo_match_constraint_value ->
    type_:geo_match_constraint_type -> unit -> geo_match_constraint
val make_geo_match_set_update :
  geo_match_constraint:geo_match_constraint ->
    action:change_action -> unit -> geo_match_set_update
val make_update_geo_match_set_request :
  updates:geo_match_set_updates ->
    change_token:change_token ->
      geo_match_set_id:resource_id -> unit -> update_geo_match_set_request
val make_update_byte_match_set_response :
  ?change_token:change_token -> unit -> update_byte_match_set_response
val make_byte_match_tuple :
  positional_constraint:positional_constraint ->
    text_transformation:text_transformation ->
      target_string:byte_match_target_string ->
        field_to_match:field_to_match -> unit -> byte_match_tuple
val make_byte_match_set_update :
  byte_match_tuple:byte_match_tuple ->
    action:change_action -> unit -> byte_match_set_update
val make_update_byte_match_set_request :
  updates:byte_match_set_updates ->
    change_token:change_token ->
      byte_match_set_id:resource_id -> unit -> update_byte_match_set_request
val make_untag_resource_response : unit -> unit
val make_untag_resource_request :
  tag_keys:tag_key_list ->
    resource_ar_n:resource_arn -> unit -> untag_resource_request
val make_time_window :
  end_time:timestamp -> start_time:timestamp -> unit -> time_window
val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:resource_arn -> unit -> tag_resource_request
val make_tag_info_for_resource :
  ?tag_list:tag_list ->
    ?resource_ar_n:resource_arn -> unit -> tag_info_for_resource
val make_subscribed_rule_group_summary :
  metric_name:metric_name ->
    name:resource_name ->
      rule_group_id:resource_id -> unit -> subscribed_rule_group_summary
val make_sql_injection_match_set_summary :
  name:resource_name ->
    sql_injection_match_set_id:resource_id ->
      unit -> sql_injection_match_set_summary
val make_sql_injection_match_set :
  ?name:resource_name ->
    sql_injection_match_tuples:sql_injection_match_tuples ->
      sql_injection_match_set_id:resource_id ->
        unit -> sql_injection_match_set
val make_size_constraint_set_summary :
  name:resource_name ->
    size_constraint_set_id:resource_id -> unit -> size_constraint_set_summary
val make_size_constraint_set :
  ?name:resource_name ->
    size_constraints:size_constraints ->
      size_constraint_set_id:resource_id -> unit -> size_constraint_set
val make_http_header :
  ?value:header_value -> ?name:header_name -> unit -> http_header
val make_http_request :
  ?headers:http_headers ->
    ?http_version:http_version ->
      ?method_:http_method ->
        ?ur_i:uri_string ->
          ?country:country -> ?client_i_p:ip_string -> unit -> http_request
val make_sampled_http_request :
  ?rule_within_rule_group:resource_id ->
    ?action:action ->
      ?timestamp:timestamp ->
        weight:sample_weight ->
          request:http_request -> unit -> sampled_http_request
val make_rule_summary :
  name:resource_name -> rule_id:resource_id -> unit -> rule_summary
val make_rule_group_summary :
  name:resource_name ->
    rule_group_id:resource_id -> unit -> rule_group_summary
val make_rule_group :
  ?metric_name:metric_name ->
    ?name:resource_name -> rule_group_id:resource_id -> unit -> rule_group
val make_rule :
  ?metric_name:metric_name ->
    ?name:resource_name ->
      predicates:predicates -> rule_id:resource_id -> unit -> rule
val make_regex_pattern_set_summary :
  name:resource_name ->
    regex_pattern_set_id:resource_id -> unit -> regex_pattern_set_summary
val make_regex_pattern_set :
  ?name:resource_name ->
    regex_pattern_strings:regex_pattern_strings ->
      regex_pattern_set_id:resource_id -> unit -> regex_pattern_set
val make_regex_match_set_summary :
  name:resource_name ->
    regex_match_set_id:resource_id -> unit -> regex_match_set_summary
val make_regex_match_set :
  ?regex_match_tuples:regex_match_tuples ->
    ?name:resource_name ->
      ?regex_match_set_id:resource_id -> unit -> regex_match_set
val make_rate_based_rule :
  ?metric_name:metric_name ->
    ?name:resource_name ->
      rate_limit:rate_limit ->
        rate_key:rate_key ->
          match_predicates:predicates ->
            rule_id:resource_id -> unit -> rate_based_rule
val make_put_permission_policy_response : unit -> unit
val make_put_permission_policy_request :
  policy:policy_string ->
    resource_arn:resource_arn -> unit -> put_permission_policy_request
val make_logging_configuration :
  ?redacted_fields:redacted_fields ->
    log_destination_configs:log_destination_configs ->
      resource_arn:resource_arn -> unit -> logging_configuration
val make_put_logging_configuration_response :
  ?logging_configuration:logging_configuration ->
    unit -> put_logging_configuration_response
val make_put_logging_configuration_request :
  logging_configuration:logging_configuration ->
    unit -> put_logging_configuration_request
val make_list_xss_match_sets_response :
  ?xss_match_sets:xss_match_set_summaries ->
    ?next_marker:next_marker -> unit -> list_xss_match_sets_response
val make_list_xss_match_sets_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> unit -> list_xss_match_sets_request
val make_list_web_ac_ls_response :
  ?web_ac_ls:web_acl_summaries ->
    ?next_marker:next_marker -> unit -> list_web_ac_ls_response
val make_list_web_ac_ls_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> unit -> list_web_ac_ls_request
val make_list_tags_for_resource_response :
  ?tag_info_for_resource:tag_info_for_resource ->
    ?next_marker:next_marker -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker ->
      resource_ar_n:resource_arn -> unit -> list_tags_for_resource_request
val make_list_subscribed_rule_groups_response :
  ?rule_groups:subscribed_rule_group_summaries ->
    ?next_marker:next_marker -> unit -> list_subscribed_rule_groups_response
val make_list_subscribed_rule_groups_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> unit -> list_subscribed_rule_groups_request
val make_list_sql_injection_match_sets_response :
  ?sql_injection_match_sets:sql_injection_match_set_summaries ->
    ?next_marker:next_marker ->
      unit -> list_sql_injection_match_sets_response
val make_list_sql_injection_match_sets_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> unit -> list_sql_injection_match_sets_request
val make_list_size_constraint_sets_response :
  ?size_constraint_sets:size_constraint_set_summaries ->
    ?next_marker:next_marker -> unit -> list_size_constraint_sets_response
val make_list_size_constraint_sets_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> unit -> list_size_constraint_sets_request
val make_list_rules_response :
  ?rules:rule_summaries ->
    ?next_marker:next_marker -> unit -> list_rules_response
val make_list_rules_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> unit -> list_rules_request
val make_list_rule_groups_response :
  ?rule_groups:rule_group_summaries ->
    ?next_marker:next_marker -> unit -> list_rule_groups_response
val make_list_rule_groups_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> unit -> list_rule_groups_request
val make_list_regex_pattern_sets_response :
  ?regex_pattern_sets:regex_pattern_set_summaries ->
    ?next_marker:next_marker -> unit -> list_regex_pattern_sets_response
val make_list_regex_pattern_sets_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> unit -> list_regex_pattern_sets_request
val make_list_regex_match_sets_response :
  ?regex_match_sets:regex_match_set_summaries ->
    ?next_marker:next_marker -> unit -> list_regex_match_sets_response
val make_list_regex_match_sets_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> unit -> list_regex_match_sets_request
val make_list_rate_based_rules_response :
  ?rules:rule_summaries ->
    ?next_marker:next_marker -> unit -> list_rate_based_rules_response
val make_list_rate_based_rules_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> unit -> list_rate_based_rules_request
val make_list_logging_configurations_response :
  ?next_marker:next_marker ->
    ?logging_configurations:logging_configurations ->
      unit -> list_logging_configurations_response
val make_list_logging_configurations_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> unit -> list_logging_configurations_request
val make_ip_set_summary :
  name:resource_name -> ip_set_id:resource_id -> unit -> ip_set_summary
val make_list_ip_sets_response :
  ?ip_sets:ip_set_summaries ->
    ?next_marker:next_marker -> unit -> list_ip_sets_response
val make_list_ip_sets_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> unit -> list_ip_sets_request
val make_geo_match_set_summary :
  name:resource_name ->
    geo_match_set_id:resource_id -> unit -> geo_match_set_summary
val make_list_geo_match_sets_response :
  ?geo_match_sets:geo_match_set_summaries ->
    ?next_marker:next_marker -> unit -> list_geo_match_sets_response
val make_list_geo_match_sets_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> unit -> list_geo_match_sets_request
val make_byte_match_set_summary :
  name:resource_name ->
    byte_match_set_id:resource_id -> unit -> byte_match_set_summary
val make_list_byte_match_sets_response :
  ?byte_match_sets:byte_match_set_summaries ->
    ?next_marker:next_marker -> unit -> list_byte_match_sets_response
val make_list_byte_match_sets_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker -> unit -> list_byte_match_sets_request
val make_list_activated_rules_in_rule_group_response :
  ?activated_rules:activated_rules ->
    ?next_marker:next_marker ->
      unit -> list_activated_rules_in_rule_group_response
val make_list_activated_rules_in_rule_group_request :
  ?limit:pagination_limit ->
    ?next_marker:next_marker ->
      ?rule_group_id:resource_id ->
        unit -> list_activated_rules_in_rule_group_request
val make_ip_set :
  ?name:resource_name ->
    ip_set_descriptors:ip_set_descriptors ->
      ip_set_id:resource_id -> unit -> ip_set
val make_get_xss_match_set_response :
  ?xss_match_set:xss_match_set -> unit -> get_xss_match_set_response
val make_get_xss_match_set_request :
  xss_match_set_id:resource_id -> unit -> get_xss_match_set_request
val make_get_web_acl_response :
  ?web_ac_l:web_ac_l -> unit -> get_web_acl_response
val make_get_web_acl_request :
  web_acl_id:resource_id -> unit -> get_web_acl_request
val make_get_sql_injection_match_set_response :
  ?sql_injection_match_set:sql_injection_match_set ->
    unit -> get_sql_injection_match_set_response
val make_get_sql_injection_match_set_request :
  sql_injection_match_set_id:resource_id ->
    unit -> get_sql_injection_match_set_request
val make_get_size_constraint_set_response :
  ?size_constraint_set:size_constraint_set ->
    unit -> get_size_constraint_set_response
val make_get_size_constraint_set_request :
  size_constraint_set_id:resource_id ->
    unit -> get_size_constraint_set_request
val make_get_sampled_requests_response :
  ?time_window:time_window ->
    ?population_size:population_size ->
      ?sampled_requests:sampled_http_requests ->
        unit -> get_sampled_requests_response
val make_get_sampled_requests_request :
  max_items:get_sampled_requests_max_items ->
    time_window:time_window ->
      rule_id:resource_id ->
        web_acl_id:resource_id -> unit -> get_sampled_requests_request
val make_get_rule_response : ?rule:rule -> unit -> get_rule_response
val make_get_rule_request : rule_id:resource_id -> unit -> get_rule_request
val make_get_rule_group_response :
  ?rule_group:rule_group -> unit -> get_rule_group_response
val make_get_rule_group_request :
  rule_group_id:resource_id -> unit -> get_rule_group_request
val make_get_regex_pattern_set_response :
  ?regex_pattern_set:regex_pattern_set ->
    unit -> get_regex_pattern_set_response
val make_get_regex_pattern_set_request :
  regex_pattern_set_id:resource_id -> unit -> get_regex_pattern_set_request
val make_get_regex_match_set_response :
  ?regex_match_set:regex_match_set -> unit -> get_regex_match_set_response
val make_get_regex_match_set_request :
  regex_match_set_id:resource_id -> unit -> get_regex_match_set_request
val make_get_rate_based_rule_response :
  ?rule:rate_based_rule -> unit -> get_rate_based_rule_response
val make_get_rate_based_rule_request :
  rule_id:resource_id -> unit -> get_rate_based_rule_request
val make_get_rate_based_rule_managed_keys_response :
  ?next_marker:next_marker ->
    ?managed_keys:managed_keys ->
      unit -> get_rate_based_rule_managed_keys_response
val make_get_rate_based_rule_managed_keys_request :
  ?next_marker:next_marker ->
    rule_id:resource_id -> unit -> get_rate_based_rule_managed_keys_request
val make_get_permission_policy_response :
  ?policy:policy_string -> unit -> get_permission_policy_response
val make_get_permission_policy_request :
  resource_arn:resource_arn -> unit -> get_permission_policy_request
val make_get_logging_configuration_response :
  ?logging_configuration:logging_configuration ->
    unit -> get_logging_configuration_response
val make_get_logging_configuration_request :
  resource_arn:resource_arn -> unit -> get_logging_configuration_request
val make_get_ip_set_response : ?ip_set:ip_set -> unit -> get_ip_set_response
val make_get_ip_set_request :
  ip_set_id:resource_id -> unit -> get_ip_set_request
val make_geo_match_set :
  ?name:resource_name ->
    geo_match_constraints:geo_match_constraints ->
      geo_match_set_id:resource_id -> unit -> geo_match_set
val make_get_geo_match_set_response :
  ?geo_match_set:geo_match_set -> unit -> get_geo_match_set_response
val make_get_geo_match_set_request :
  geo_match_set_id:resource_id -> unit -> get_geo_match_set_request
val make_get_change_token_status_response :
  ?change_token_status:change_token_status ->
    unit -> get_change_token_status_response
val make_get_change_token_status_request :
  change_token:change_token -> unit -> get_change_token_status_request
val make_get_change_token_response :
  ?change_token:change_token -> unit -> get_change_token_response
val make_get_change_token_request : unit -> unit
val make_byte_match_set :
  ?name:resource_name ->
    byte_match_tuples:byte_match_tuples ->
      byte_match_set_id:resource_id -> unit -> byte_match_set
val make_get_byte_match_set_response :
  ?byte_match_set:byte_match_set -> unit -> get_byte_match_set_response
val make_get_byte_match_set_request :
  byte_match_set_id:resource_id -> unit -> get_byte_match_set_request
val make_delete_xss_match_set_response :
  ?change_token:change_token -> unit -> delete_xss_match_set_response
val make_delete_xss_match_set_request :
  change_token:change_token ->
    xss_match_set_id:resource_id -> unit -> delete_xss_match_set_request
val make_delete_web_acl_response :
  ?change_token:change_token -> unit -> delete_web_acl_response
val make_delete_web_acl_request :
  change_token:change_token ->
    web_acl_id:resource_id -> unit -> delete_web_acl_request
val make_delete_sql_injection_match_set_response :
  ?change_token:change_token ->
    unit -> delete_sql_injection_match_set_response
val make_delete_sql_injection_match_set_request :
  change_token:change_token ->
    sql_injection_match_set_id:resource_id ->
      unit -> delete_sql_injection_match_set_request
val make_delete_size_constraint_set_response :
  ?change_token:change_token -> unit -> delete_size_constraint_set_response
val make_delete_size_constraint_set_request :
  change_token:change_token ->
    size_constraint_set_id:resource_id ->
      unit -> delete_size_constraint_set_request
val make_delete_rule_response :
  ?change_token:change_token -> unit -> delete_rule_response
val make_delete_rule_request :
  change_token:change_token ->
    rule_id:resource_id -> unit -> delete_rule_request
val make_delete_rule_group_response :
  ?change_token:change_token -> unit -> delete_rule_group_response
val make_delete_rule_group_request :
  change_token:change_token ->
    rule_group_id:resource_id -> unit -> delete_rule_group_request
val make_delete_regex_pattern_set_response :
  ?change_token:change_token -> unit -> delete_regex_pattern_set_response
val make_delete_regex_pattern_set_request :
  change_token:change_token ->
    regex_pattern_set_id:resource_id ->
      unit -> delete_regex_pattern_set_request
val make_delete_regex_match_set_response :
  ?change_token:change_token -> unit -> delete_regex_match_set_response
val make_delete_regex_match_set_request :
  change_token:change_token ->
    regex_match_set_id:resource_id -> unit -> delete_regex_match_set_request
val make_delete_rate_based_rule_response :
  ?change_token:change_token -> unit -> delete_rate_based_rule_response
val make_delete_rate_based_rule_request :
  change_token:change_token ->
    rule_id:resource_id -> unit -> delete_rate_based_rule_request
val make_delete_permission_policy_response : unit -> unit
val make_delete_permission_policy_request :
  resource_arn:resource_arn -> unit -> delete_permission_policy_request
val make_delete_logging_configuration_response : unit -> unit
val make_delete_logging_configuration_request :
  resource_arn:resource_arn -> unit -> delete_logging_configuration_request
val make_delete_ip_set_response :
  ?change_token:change_token -> unit -> delete_ip_set_response
val make_delete_ip_set_request :
  change_token:change_token ->
    ip_set_id:resource_id -> unit -> delete_ip_set_request
val make_delete_geo_match_set_response :
  ?change_token:change_token -> unit -> delete_geo_match_set_response
val make_delete_geo_match_set_request :
  change_token:change_token ->
    geo_match_set_id:resource_id -> unit -> delete_geo_match_set_request
val make_delete_byte_match_set_response :
  ?change_token:change_token -> unit -> delete_byte_match_set_response
val make_delete_byte_match_set_request :
  change_token:change_token ->
    byte_match_set_id:resource_id -> unit -> delete_byte_match_set_request
val make_create_xss_match_set_response :
  ?change_token:change_token ->
    ?xss_match_set:xss_match_set -> unit -> create_xss_match_set_response
val make_create_xss_match_set_request :
  change_token:change_token ->
    name:resource_name -> unit -> create_xss_match_set_request
val make_create_web_acl_response :
  ?change_token:change_token ->
    ?web_ac_l:web_ac_l -> unit -> create_web_acl_response
val make_create_web_acl_request :
  ?tags:tag_list ->
    change_token:change_token ->
      default_action:waf_action ->
        metric_name:metric_name ->
          name:resource_name -> unit -> create_web_acl_request
val make_create_web_acl_migration_stack_response :
  s3_object_url:s3_object_url ->
    unit -> create_web_acl_migration_stack_response
val make_create_web_acl_migration_stack_request :
  ignore_unsupported_type:ignore_unsupported_type ->
    s3_bucket_name:s3_bucket_name ->
      web_acl_id:resource_id ->
        unit -> create_web_acl_migration_stack_request
val make_create_sql_injection_match_set_response :
  ?change_token:change_token ->
    ?sql_injection_match_set:sql_injection_match_set ->
      unit -> create_sql_injection_match_set_response
val make_create_sql_injection_match_set_request :
  change_token:change_token ->
    name:resource_name -> unit -> create_sql_injection_match_set_request
val make_create_size_constraint_set_response :
  ?change_token:change_token ->
    ?size_constraint_set:size_constraint_set ->
      unit -> create_size_constraint_set_response
val make_create_size_constraint_set_request :
  change_token:change_token ->
    name:resource_name -> unit -> create_size_constraint_set_request
val make_create_rule_response :
  ?change_token:change_token -> ?rule:rule -> unit -> create_rule_response
val make_create_rule_request :
  ?tags:tag_list ->
    change_token:change_token ->
      metric_name:metric_name ->
        name:resource_name -> unit -> create_rule_request
val make_create_rule_group_response :
  ?change_token:change_token ->
    ?rule_group:rule_group -> unit -> create_rule_group_response
val make_create_rule_group_request :
  ?tags:tag_list ->
    change_token:change_token ->
      metric_name:metric_name ->
        name:resource_name -> unit -> create_rule_group_request
val make_create_regex_pattern_set_response :
  ?change_token:change_token ->
    ?regex_pattern_set:regex_pattern_set ->
      unit -> create_regex_pattern_set_response
val make_create_regex_pattern_set_request :
  change_token:change_token ->
    name:resource_name -> unit -> create_regex_pattern_set_request
val make_create_regex_match_set_response :
  ?change_token:change_token ->
    ?regex_match_set:regex_match_set ->
      unit -> create_regex_match_set_response
val make_create_regex_match_set_request :
  change_token:change_token ->
    name:resource_name -> unit -> create_regex_match_set_request
val make_create_rate_based_rule_response :
  ?change_token:change_token ->
    ?rule:rate_based_rule -> unit -> create_rate_based_rule_response
val make_create_rate_based_rule_request :
  ?tags:tag_list ->
    change_token:change_token ->
      rate_limit:rate_limit ->
        rate_key:rate_key ->
          metric_name:metric_name ->
            name:resource_name -> unit -> create_rate_based_rule_request
val make_create_ip_set_response :
  ?change_token:change_token ->
    ?ip_set:ip_set -> unit -> create_ip_set_response
val make_create_ip_set_request :
  change_token:change_token ->
    name:resource_name -> unit -> create_ip_set_request
val make_create_geo_match_set_response :
  ?change_token:change_token ->
    ?geo_match_set:geo_match_set -> unit -> create_geo_match_set_response
val make_create_geo_match_set_request :
  change_token:change_token ->
    name:resource_name -> unit -> create_geo_match_set_request
val make_create_byte_match_set_response :
  ?change_token:change_token ->
    ?byte_match_set:byte_match_set -> unit -> create_byte_match_set_response
val make_create_byte_match_set_request :
  change_token:change_token ->
    name:resource_name -> unit -> create_byte_match_set_request