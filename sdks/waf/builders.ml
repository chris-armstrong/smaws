open Types

let make_update_xss_match_set_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_xss_match_set_response)

let make_field_to_match ?data:(data_ : match_field_data option) ~type_:(type__ : match_field_type)
    () =
  ({ type_ = type__; data = data_ } : field_to_match)

let make_xss_match_tuple ~field_to_match:(field_to_match_ : field_to_match)
    ~text_transformation:(text_transformation_ : text_transformation) () =
  ({ field_to_match = field_to_match_; text_transformation = text_transformation_ }
    : xss_match_tuple)

let make_xss_match_set_update ~action:(action_ : change_action)
    ~xss_match_tuple:(xss_match_tuple_ : xss_match_tuple) () =
  ({ action = action_; xss_match_tuple = xss_match_tuple_ } : xss_match_set_update)

let make_update_xss_match_set_request ~xss_match_set_id:(xss_match_set_id_ : resource_id)
    ~change_token:(change_token_ : change_token) ~updates:(updates_ : xss_match_set_updates) () =
  ({ xss_match_set_id = xss_match_set_id_; change_token = change_token_; updates = updates_ }
    : update_xss_match_set_request)

let make_update_web_acl_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_web_acl_response)

let make_waf_action ~type_:(type__ : waf_action_type) () = ({ type_ = type__ } : waf_action)

let make_excluded_rule ~rule_id:(rule_id_ : resource_id) () =
  ({ rule_id = rule_id_ } : excluded_rule)

let make_waf_override_action ~type_:(type__ : waf_override_action_type) () =
  ({ type_ = type__ } : waf_override_action)

let make_activated_rule ?action:(action_ : waf_action option)
    ?override_action:(override_action_ : waf_override_action option)
    ?type_:(type__ : waf_rule_type option) ?excluded_rules:(excluded_rules_ : excluded_rules option)
    ~priority:(priority_ : rule_priority) ~rule_id:(rule_id_ : resource_id) () =
  ({
     priority = priority_;
     rule_id = rule_id_;
     action = action_;
     override_action = override_action_;
     type_ = type__;
     excluded_rules = excluded_rules_;
   }
    : activated_rule)

let make_web_acl_update ~action:(action_ : change_action)
    ~activated_rule:(activated_rule_ : activated_rule) () =
  ({ action = action_; activated_rule = activated_rule_ } : web_acl_update)

let make_update_web_acl_request ?updates:(updates_ : web_acl_updates option)
    ?default_action:(default_action_ : waf_action option) ~web_acl_id:(web_acl_id_ : resource_id)
    ~change_token:(change_token_ : change_token) () =
  ({
     web_acl_id = web_acl_id_;
     change_token = change_token_;
     updates = updates_;
     default_action = default_action_;
   }
    : update_web_acl_request)

let make_update_sql_injection_match_set_response ?change_token:(change_token_ : change_token option)
    () =
  ({ change_token = change_token_ } : update_sql_injection_match_set_response)

let make_sql_injection_match_tuple ~field_to_match:(field_to_match_ : field_to_match)
    ~text_transformation:(text_transformation_ : text_transformation) () =
  ({ field_to_match = field_to_match_; text_transformation = text_transformation_ }
    : sql_injection_match_tuple)

let make_sql_injection_match_set_update ~action:(action_ : change_action)
    ~sql_injection_match_tuple:(sql_injection_match_tuple_ : sql_injection_match_tuple) () =
  ({ action = action_; sql_injection_match_tuple = sql_injection_match_tuple_ }
    : sql_injection_match_set_update)

let make_update_sql_injection_match_set_request
    ~sql_injection_match_set_id:(sql_injection_match_set_id_ : resource_id)
    ~change_token:(change_token_ : change_token)
    ~updates:(updates_ : sql_injection_match_set_updates) () =
  ({
     sql_injection_match_set_id = sql_injection_match_set_id_;
     change_token = change_token_;
     updates = updates_;
   }
    : update_sql_injection_match_set_request)

let make_update_size_constraint_set_response ?change_token:(change_token_ : change_token option) ()
    =
  ({ change_token = change_token_ } : update_size_constraint_set_response)

let make_size_constraint ~field_to_match:(field_to_match_ : field_to_match)
    ~text_transformation:(text_transformation_ : text_transformation)
    ~comparison_operator:(comparison_operator_ : comparison_operator) ~size:(size_ : size) () =
  ({
     field_to_match = field_to_match_;
     text_transformation = text_transformation_;
     comparison_operator = comparison_operator_;
     size = size_;
   }
    : size_constraint)

let make_size_constraint_set_update ~action:(action_ : change_action)
    ~size_constraint:(size_constraint_ : size_constraint) () =
  ({ action = action_; size_constraint = size_constraint_ } : size_constraint_set_update)

let make_update_size_constraint_set_request
    ~size_constraint_set_id:(size_constraint_set_id_ : resource_id)
    ~change_token:(change_token_ : change_token) ~updates:(updates_ : size_constraint_set_updates)
    () =
  ({
     size_constraint_set_id = size_constraint_set_id_;
     change_token = change_token_;
     updates = updates_;
   }
    : update_size_constraint_set_request)

let make_update_rule_group_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_rule_group_response)

let make_rule_group_update ~action:(action_ : change_action)
    ~activated_rule:(activated_rule_ : activated_rule) () =
  ({ action = action_; activated_rule = activated_rule_ } : rule_group_update)

let make_update_rule_group_request ~rule_group_id:(rule_group_id_ : resource_id)
    ~updates:(updates_ : rule_group_updates) ~change_token:(change_token_ : change_token) () =
  ({ rule_group_id = rule_group_id_; updates = updates_; change_token = change_token_ }
    : update_rule_group_request)

let make_update_rule_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_rule_response)

let make_predicate ~negated:(negated_ : negated) ~type_:(type__ : predicate_type)
    ~data_id:(data_id_ : resource_id) () =
  ({ negated = negated_; type_ = type__; data_id = data_id_ } : predicate)

let make_rule_update ~action:(action_ : change_action) ~predicate:(predicate_ : predicate) () =
  ({ action = action_; predicate = predicate_ } : rule_update)

let make_update_rule_request ~rule_id:(rule_id_ : resource_id)
    ~change_token:(change_token_ : change_token) ~updates:(updates_ : rule_updates) () =
  ({ rule_id = rule_id_; change_token = change_token_; updates = updates_ } : update_rule_request)

let make_update_regex_pattern_set_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_regex_pattern_set_response)

let make_regex_pattern_set_update ~action:(action_ : change_action)
    ~regex_pattern_string:(regex_pattern_string_ : regex_pattern_string) () =
  ({ action = action_; regex_pattern_string = regex_pattern_string_ } : regex_pattern_set_update)

let make_update_regex_pattern_set_request
    ~regex_pattern_set_id:(regex_pattern_set_id_ : resource_id)
    ~updates:(updates_ : regex_pattern_set_updates) ~change_token:(change_token_ : change_token) ()
    =
  ({
     regex_pattern_set_id = regex_pattern_set_id_;
     updates = updates_;
     change_token = change_token_;
   }
    : update_regex_pattern_set_request)

let make_update_regex_match_set_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_regex_match_set_response)

let make_regex_match_tuple ~field_to_match:(field_to_match_ : field_to_match)
    ~text_transformation:(text_transformation_ : text_transformation)
    ~regex_pattern_set_id:(regex_pattern_set_id_ : resource_id) () =
  ({
     field_to_match = field_to_match_;
     text_transformation = text_transformation_;
     regex_pattern_set_id = regex_pattern_set_id_;
   }
    : regex_match_tuple)

let make_regex_match_set_update ~action:(action_ : change_action)
    ~regex_match_tuple:(regex_match_tuple_ : regex_match_tuple) () =
  ({ action = action_; regex_match_tuple = regex_match_tuple_ } : regex_match_set_update)

let make_update_regex_match_set_request ~regex_match_set_id:(regex_match_set_id_ : resource_id)
    ~updates:(updates_ : regex_match_set_updates) ~change_token:(change_token_ : change_token) () =
  ({ regex_match_set_id = regex_match_set_id_; updates = updates_; change_token = change_token_ }
    : update_regex_match_set_request)

let make_update_rate_based_rule_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_rate_based_rule_response)

let make_update_rate_based_rule_request ~rule_id:(rule_id_ : resource_id)
    ~change_token:(change_token_ : change_token) ~updates:(updates_ : rule_updates)
    ~rate_limit:(rate_limit_ : rate_limit) () =
  ({
     rule_id = rule_id_;
     change_token = change_token_;
     updates = updates_;
     rate_limit = rate_limit_;
   }
    : update_rate_based_rule_request)

let make_update_ip_set_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_ip_set_response)

let make_ip_set_descriptor ~type_:(type__ : ip_set_descriptor_type)
    ~value:(value_ : ip_set_descriptor_value) () =
  ({ type_ = type__; value = value_ } : ip_set_descriptor)

let make_ip_set_update ~action:(action_ : change_action)
    ~ip_set_descriptor:(ip_set_descriptor_ : ip_set_descriptor) () =
  ({ action = action_; ip_set_descriptor = ip_set_descriptor_ } : ip_set_update)

let make_update_ip_set_request ~ip_set_id:(ip_set_id_ : resource_id)
    ~change_token:(change_token_ : change_token) ~updates:(updates_ : ip_set_updates) () =
  ({ ip_set_id = ip_set_id_; change_token = change_token_; updates = updates_ }
    : update_ip_set_request)

let make_update_geo_match_set_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_geo_match_set_response)

let make_geo_match_constraint ~type_:(type__ : geo_match_constraint_type)
    ~value:(value_ : geo_match_constraint_value) () =
  ({ type_ = type__; value = value_ } : geo_match_constraint)

let make_geo_match_set_update ~action:(action_ : change_action)
    ~geo_match_constraint:(geo_match_constraint_ : geo_match_constraint) () =
  ({ action = action_; geo_match_constraint = geo_match_constraint_ } : geo_match_set_update)

let make_update_geo_match_set_request ~geo_match_set_id:(geo_match_set_id_ : resource_id)
    ~change_token:(change_token_ : change_token) ~updates:(updates_ : geo_match_set_updates) () =
  ({ geo_match_set_id = geo_match_set_id_; change_token = change_token_; updates = updates_ }
    : update_geo_match_set_request)

let make_update_byte_match_set_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : update_byte_match_set_response)

let make_byte_match_tuple ~field_to_match:(field_to_match_ : field_to_match)
    ~target_string:(target_string_ : byte_match_target_string)
    ~text_transformation:(text_transformation_ : text_transformation)
    ~positional_constraint:(positional_constraint_ : positional_constraint) () =
  ({
     field_to_match = field_to_match_;
     target_string = target_string_;
     text_transformation = text_transformation_;
     positional_constraint = positional_constraint_;
   }
    : byte_match_tuple)

let make_byte_match_set_update ~action:(action_ : change_action)
    ~byte_match_tuple:(byte_match_tuple_ : byte_match_tuple) () =
  ({ action = action_; byte_match_tuple = byte_match_tuple_ } : byte_match_set_update)

let make_update_byte_match_set_request ~byte_match_set_id:(byte_match_set_id_ : resource_id)
    ~change_token:(change_token_ : change_token) ~updates:(updates_ : byte_match_set_updates) () =
  ({ byte_match_set_id = byte_match_set_id_; change_token = change_token_; updates = updates_ }
    : update_byte_match_set_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : resource_arn)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_put_permission_policy_response () = (() : unit)

let make_put_permission_policy_request ~resource_arn:(resource_arn_ : resource_arn)
    ~policy:(policy_ : policy_string) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : put_permission_policy_request)

let make_logging_configuration ?redacted_fields:(redacted_fields_ : redacted_fields option)
    ~resource_arn:(resource_arn_ : resource_arn)
    ~log_destination_configs:(log_destination_configs_ : log_destination_configs) () =
  ({
     resource_arn = resource_arn_;
     log_destination_configs = log_destination_configs_;
     redacted_fields = redacted_fields_;
   }
    : logging_configuration)

let make_put_logging_configuration_response
    ?logging_configuration:(logging_configuration_ : logging_configuration option) () =
  ({ logging_configuration = logging_configuration_ } : put_logging_configuration_response)

let make_put_logging_configuration_request
    ~logging_configuration:(logging_configuration_ : logging_configuration) () =
  ({ logging_configuration = logging_configuration_ } : put_logging_configuration_request)

let make_xss_match_set_summary ~xss_match_set_id:(xss_match_set_id_ : resource_id)
    ~name:(name_ : resource_name) () =
  ({ xss_match_set_id = xss_match_set_id_; name = name_ } : xss_match_set_summary)

let make_list_xss_match_sets_response ?next_marker:(next_marker_ : next_marker option)
    ?xss_match_sets:(xss_match_sets_ : xss_match_set_summaries option) () =
  ({ next_marker = next_marker_; xss_match_sets = xss_match_sets_ } : list_xss_match_sets_response)

let make_list_xss_match_sets_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) () =
  ({ next_marker = next_marker_; limit = limit_ } : list_xss_match_sets_request)

let make_web_acl_summary ~web_acl_id:(web_acl_id_ : resource_id) ~name:(name_ : resource_name) () =
  ({ web_acl_id = web_acl_id_; name = name_ } : web_acl_summary)

let make_list_web_ac_ls_response ?next_marker:(next_marker_ : next_marker option)
    ?web_ac_ls:(web_ac_ls_ : web_acl_summaries option) () =
  ({ next_marker = next_marker_; web_ac_ls = web_ac_ls_ } : list_web_ac_ls_response)

let make_list_web_ac_ls_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) () =
  ({ next_marker = next_marker_; limit = limit_ } : list_web_ac_ls_request)

let make_tag_info_for_resource ?resource_ar_n:(resource_ar_n_ : resource_arn option)
    ?tag_list:(tag_list_ : tag_list option) () =
  ({ resource_ar_n = resource_ar_n_; tag_list = tag_list_ } : tag_info_for_resource)

let make_list_tags_for_resource_response ?next_marker:(next_marker_ : next_marker option)
    ?tag_info_for_resource:(tag_info_for_resource_ : tag_info_for_resource option) () =
  ({ next_marker = next_marker_; tag_info_for_resource = tag_info_for_resource_ }
    : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) ~resource_ar_n:(resource_ar_n_ : resource_arn) () =
  ({ next_marker = next_marker_; limit = limit_; resource_ar_n = resource_ar_n_ }
    : list_tags_for_resource_request)

let make_subscribed_rule_group_summary ~rule_group_id:(rule_group_id_ : resource_id)
    ~name:(name_ : resource_name) ~metric_name:(metric_name_ : metric_name) () =
  ({ rule_group_id = rule_group_id_; name = name_; metric_name = metric_name_ }
    : subscribed_rule_group_summary)

let make_list_subscribed_rule_groups_response ?next_marker:(next_marker_ : next_marker option)
    ?rule_groups:(rule_groups_ : subscribed_rule_group_summaries option) () =
  ({ next_marker = next_marker_; rule_groups = rule_groups_ }
    : list_subscribed_rule_groups_response)

let make_list_subscribed_rule_groups_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) () =
  ({ next_marker = next_marker_; limit = limit_ } : list_subscribed_rule_groups_request)

let make_sql_injection_match_set_summary
    ~sql_injection_match_set_id:(sql_injection_match_set_id_ : resource_id)
    ~name:(name_ : resource_name) () =
  ({ sql_injection_match_set_id = sql_injection_match_set_id_; name = name_ }
    : sql_injection_match_set_summary)

let make_list_sql_injection_match_sets_response ?next_marker:(next_marker_ : next_marker option)
    ?sql_injection_match_sets:(sql_injection_match_sets_ : sql_injection_match_set_summaries option)
    () =
  ({ next_marker = next_marker_; sql_injection_match_sets = sql_injection_match_sets_ }
    : list_sql_injection_match_sets_response)

let make_list_sql_injection_match_sets_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) () =
  ({ next_marker = next_marker_; limit = limit_ } : list_sql_injection_match_sets_request)

let make_size_constraint_set_summary ~size_constraint_set_id:(size_constraint_set_id_ : resource_id)
    ~name:(name_ : resource_name) () =
  ({ size_constraint_set_id = size_constraint_set_id_; name = name_ } : size_constraint_set_summary)

let make_list_size_constraint_sets_response ?next_marker:(next_marker_ : next_marker option)
    ?size_constraint_sets:(size_constraint_sets_ : size_constraint_set_summaries option) () =
  ({ next_marker = next_marker_; size_constraint_sets = size_constraint_sets_ }
    : list_size_constraint_sets_response)

let make_list_size_constraint_sets_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) () =
  ({ next_marker = next_marker_; limit = limit_ } : list_size_constraint_sets_request)

let make_rule_summary ~rule_id:(rule_id_ : resource_id) ~name:(name_ : resource_name) () =
  ({ rule_id = rule_id_; name = name_ } : rule_summary)

let make_list_rules_response ?next_marker:(next_marker_ : next_marker option)
    ?rules:(rules_ : rule_summaries option) () =
  ({ next_marker = next_marker_; rules = rules_ } : list_rules_response)

let make_list_rules_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) () =
  ({ next_marker = next_marker_; limit = limit_ } : list_rules_request)

let make_rule_group_summary ~rule_group_id:(rule_group_id_ : resource_id)
    ~name:(name_ : resource_name) () =
  ({ rule_group_id = rule_group_id_; name = name_ } : rule_group_summary)

let make_list_rule_groups_response ?next_marker:(next_marker_ : next_marker option)
    ?rule_groups:(rule_groups_ : rule_group_summaries option) () =
  ({ next_marker = next_marker_; rule_groups = rule_groups_ } : list_rule_groups_response)

let make_list_rule_groups_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) () =
  ({ next_marker = next_marker_; limit = limit_ } : list_rule_groups_request)

let make_regex_pattern_set_summary ~regex_pattern_set_id:(regex_pattern_set_id_ : resource_id)
    ~name:(name_ : resource_name) () =
  ({ regex_pattern_set_id = regex_pattern_set_id_; name = name_ } : regex_pattern_set_summary)

let make_list_regex_pattern_sets_response ?next_marker:(next_marker_ : next_marker option)
    ?regex_pattern_sets:(regex_pattern_sets_ : regex_pattern_set_summaries option) () =
  ({ next_marker = next_marker_; regex_pattern_sets = regex_pattern_sets_ }
    : list_regex_pattern_sets_response)

let make_list_regex_pattern_sets_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) () =
  ({ next_marker = next_marker_; limit = limit_ } : list_regex_pattern_sets_request)

let make_regex_match_set_summary ~regex_match_set_id:(regex_match_set_id_ : resource_id)
    ~name:(name_ : resource_name) () =
  ({ regex_match_set_id = regex_match_set_id_; name = name_ } : regex_match_set_summary)

let make_list_regex_match_sets_response ?next_marker:(next_marker_ : next_marker option)
    ?regex_match_sets:(regex_match_sets_ : regex_match_set_summaries option) () =
  ({ next_marker = next_marker_; regex_match_sets = regex_match_sets_ }
    : list_regex_match_sets_response)

let make_list_regex_match_sets_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) () =
  ({ next_marker = next_marker_; limit = limit_ } : list_regex_match_sets_request)

let make_list_rate_based_rules_response ?next_marker:(next_marker_ : next_marker option)
    ?rules:(rules_ : rule_summaries option) () =
  ({ next_marker = next_marker_; rules = rules_ } : list_rate_based_rules_response)

let make_list_rate_based_rules_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) () =
  ({ next_marker = next_marker_; limit = limit_ } : list_rate_based_rules_request)

let make_list_logging_configurations_response
    ?logging_configurations:(logging_configurations_ : logging_configurations option)
    ?next_marker:(next_marker_ : next_marker option) () =
  ({ logging_configurations = logging_configurations_; next_marker = next_marker_ }
    : list_logging_configurations_response)

let make_list_logging_configurations_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) () =
  ({ next_marker = next_marker_; limit = limit_ } : list_logging_configurations_request)

let make_ip_set_summary ~ip_set_id:(ip_set_id_ : resource_id) ~name:(name_ : resource_name) () =
  ({ ip_set_id = ip_set_id_; name = name_ } : ip_set_summary)

let make_list_ip_sets_response ?next_marker:(next_marker_ : next_marker option)
    ?ip_sets:(ip_sets_ : ip_set_summaries option) () =
  ({ next_marker = next_marker_; ip_sets = ip_sets_ } : list_ip_sets_response)

let make_list_ip_sets_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) () =
  ({ next_marker = next_marker_; limit = limit_ } : list_ip_sets_request)

let make_geo_match_set_summary ~geo_match_set_id:(geo_match_set_id_ : resource_id)
    ~name:(name_ : resource_name) () =
  ({ geo_match_set_id = geo_match_set_id_; name = name_ } : geo_match_set_summary)

let make_list_geo_match_sets_response ?next_marker:(next_marker_ : next_marker option)
    ?geo_match_sets:(geo_match_sets_ : geo_match_set_summaries option) () =
  ({ next_marker = next_marker_; geo_match_sets = geo_match_sets_ } : list_geo_match_sets_response)

let make_list_geo_match_sets_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) () =
  ({ next_marker = next_marker_; limit = limit_ } : list_geo_match_sets_request)

let make_byte_match_set_summary ~byte_match_set_id:(byte_match_set_id_ : resource_id)
    ~name:(name_ : resource_name) () =
  ({ byte_match_set_id = byte_match_set_id_; name = name_ } : byte_match_set_summary)

let make_list_byte_match_sets_response ?next_marker:(next_marker_ : next_marker option)
    ?byte_match_sets:(byte_match_sets_ : byte_match_set_summaries option) () =
  ({ next_marker = next_marker_; byte_match_sets = byte_match_sets_ }
    : list_byte_match_sets_response)

let make_list_byte_match_sets_request ?next_marker:(next_marker_ : next_marker option)
    ?limit:(limit_ : pagination_limit option) () =
  ({ next_marker = next_marker_; limit = limit_ } : list_byte_match_sets_request)

let make_list_activated_rules_in_rule_group_response
    ?next_marker:(next_marker_ : next_marker option)
    ?activated_rules:(activated_rules_ : activated_rules option) () =
  ({ next_marker = next_marker_; activated_rules = activated_rules_ }
    : list_activated_rules_in_rule_group_response)

let make_list_activated_rules_in_rule_group_request
    ?rule_group_id:(rule_group_id_ : resource_id option)
    ?next_marker:(next_marker_ : next_marker option) ?limit:(limit_ : pagination_limit option) () =
  ({ rule_group_id = rule_group_id_; next_marker = next_marker_; limit = limit_ }
    : list_activated_rules_in_rule_group_request)

let make_xss_match_set ?name:(name_ : resource_name option)
    ~xss_match_set_id:(xss_match_set_id_ : resource_id)
    ~xss_match_tuples:(xss_match_tuples_ : xss_match_tuples) () =
  ({ xss_match_set_id = xss_match_set_id_; name = name_; xss_match_tuples = xss_match_tuples_ }
    : xss_match_set)

let make_get_xss_match_set_response ?xss_match_set:(xss_match_set_ : xss_match_set option) () =
  ({ xss_match_set = xss_match_set_ } : get_xss_match_set_response)

let make_get_xss_match_set_request ~xss_match_set_id:(xss_match_set_id_ : resource_id) () =
  ({ xss_match_set_id = xss_match_set_id_ } : get_xss_match_set_request)

let make_web_ac_l ?name:(name_ : resource_name option)
    ?metric_name:(metric_name_ : metric_name option)
    ?web_acl_arn:(web_acl_arn_ : resource_arn option) ~web_acl_id:(web_acl_id_ : resource_id)
    ~default_action:(default_action_ : waf_action) ~rules:(rules_ : activated_rules) () =
  ({
     web_acl_id = web_acl_id_;
     name = name_;
     metric_name = metric_name_;
     default_action = default_action_;
     rules = rules_;
     web_acl_arn = web_acl_arn_;
   }
    : web_ac_l)

let make_get_web_acl_response ?web_ac_l:(web_ac_l_ : web_ac_l option) () =
  ({ web_ac_l = web_ac_l_ } : get_web_acl_response)

let make_get_web_acl_request ~web_acl_id:(web_acl_id_ : resource_id) () =
  ({ web_acl_id = web_acl_id_ } : get_web_acl_request)

let make_sql_injection_match_set ?name:(name_ : resource_name option)
    ~sql_injection_match_set_id:(sql_injection_match_set_id_ : resource_id)
    ~sql_injection_match_tuples:(sql_injection_match_tuples_ : sql_injection_match_tuples) () =
  ({
     sql_injection_match_set_id = sql_injection_match_set_id_;
     name = name_;
     sql_injection_match_tuples = sql_injection_match_tuples_;
   }
    : sql_injection_match_set)

let make_get_sql_injection_match_set_response
    ?sql_injection_match_set:(sql_injection_match_set_ : sql_injection_match_set option) () =
  ({ sql_injection_match_set = sql_injection_match_set_ } : get_sql_injection_match_set_response)

let make_get_sql_injection_match_set_request
    ~sql_injection_match_set_id:(sql_injection_match_set_id_ : resource_id) () =
  ({ sql_injection_match_set_id = sql_injection_match_set_id_ }
    : get_sql_injection_match_set_request)

let make_size_constraint_set ?name:(name_ : resource_name option)
    ~size_constraint_set_id:(size_constraint_set_id_ : resource_id)
    ~size_constraints:(size_constraints_ : size_constraints) () =
  ({
     size_constraint_set_id = size_constraint_set_id_;
     name = name_;
     size_constraints = size_constraints_;
   }
    : size_constraint_set)

let make_get_size_constraint_set_response
    ?size_constraint_set:(size_constraint_set_ : size_constraint_set option) () =
  ({ size_constraint_set = size_constraint_set_ } : get_size_constraint_set_response)

let make_get_size_constraint_set_request
    ~size_constraint_set_id:(size_constraint_set_id_ : resource_id) () =
  ({ size_constraint_set_id = size_constraint_set_id_ } : get_size_constraint_set_request)

let make_time_window ~start_time:(start_time_ : timestamp) ~end_time:(end_time_ : timestamp) () =
  ({ start_time = start_time_; end_time = end_time_ } : time_window)

let make_http_header ?name:(name_ : header_name option) ?value:(value_ : header_value option) () =
  ({ name = name_; value = value_ } : http_header)

let make_http_request ?client_i_p:(client_i_p_ : ip_string option)
    ?country:(country_ : country option) ?ur_i:(ur_i_ : uri_string option)
    ?method_:(method__ : http_method option) ?http_version:(http_version_ : http_version option)
    ?headers:(headers_ : http_headers option) () =
  ({
     client_i_p = client_i_p_;
     country = country_;
     ur_i = ur_i_;
     method_ = method__;
     http_version = http_version_;
     headers = headers_;
   }
    : http_request)

let make_sampled_http_request ?timestamp:(timestamp_ : timestamp option)
    ?action:(action_ : action option)
    ?rule_within_rule_group:(rule_within_rule_group_ : resource_id option)
    ~request:(request_ : http_request) ~weight:(weight_ : sample_weight) () =
  ({
     request = request_;
     weight = weight_;
     timestamp = timestamp_;
     action = action_;
     rule_within_rule_group = rule_within_rule_group_;
   }
    : sampled_http_request)

let make_get_sampled_requests_response
    ?sampled_requests:(sampled_requests_ : sampled_http_requests option)
    ?population_size:(population_size_ : population_size option)
    ?time_window:(time_window_ : time_window option) () =
  ({
     sampled_requests = sampled_requests_;
     population_size = population_size_;
     time_window = time_window_;
   }
    : get_sampled_requests_response)

let make_get_sampled_requests_request ~web_acl_id:(web_acl_id_ : resource_id)
    ~rule_id:(rule_id_ : resource_id) ~time_window:(time_window_ : time_window)
    ~max_items:(max_items_ : get_sampled_requests_max_items) () =
  ({
     web_acl_id = web_acl_id_;
     rule_id = rule_id_;
     time_window = time_window_;
     max_items = max_items_;
   }
    : get_sampled_requests_request)

let make_rule_group ?name:(name_ : resource_name option)
    ?metric_name:(metric_name_ : metric_name option) ~rule_group_id:(rule_group_id_ : resource_id)
    () =
  ({ rule_group_id = rule_group_id_; name = name_; metric_name = metric_name_ } : rule_group)

let make_get_rule_group_response ?rule_group:(rule_group_ : rule_group option) () =
  ({ rule_group = rule_group_ } : get_rule_group_response)

let make_get_rule_group_request ~rule_group_id:(rule_group_id_ : resource_id) () =
  ({ rule_group_id = rule_group_id_ } : get_rule_group_request)

let make_rule ?name:(name_ : resource_name option) ?metric_name:(metric_name_ : metric_name option)
    ~rule_id:(rule_id_ : resource_id) ~predicates:(predicates_ : predicates) () =
  ({ rule_id = rule_id_; name = name_; metric_name = metric_name_; predicates = predicates_ }
    : rule)

let make_get_rule_response ?rule:(rule_ : rule option) () = ({ rule = rule_ } : get_rule_response)

let make_get_rule_request ~rule_id:(rule_id_ : resource_id) () =
  ({ rule_id = rule_id_ } : get_rule_request)

let make_regex_pattern_set ?name:(name_ : resource_name option)
    ~regex_pattern_set_id:(regex_pattern_set_id_ : resource_id)
    ~regex_pattern_strings:(regex_pattern_strings_ : regex_pattern_strings) () =
  ({
     regex_pattern_set_id = regex_pattern_set_id_;
     name = name_;
     regex_pattern_strings = regex_pattern_strings_;
   }
    : regex_pattern_set)

let make_get_regex_pattern_set_response
    ?regex_pattern_set:(regex_pattern_set_ : regex_pattern_set option) () =
  ({ regex_pattern_set = regex_pattern_set_ } : get_regex_pattern_set_response)

let make_get_regex_pattern_set_request ~regex_pattern_set_id:(regex_pattern_set_id_ : resource_id)
    () =
  ({ regex_pattern_set_id = regex_pattern_set_id_ } : get_regex_pattern_set_request)

let make_regex_match_set ?regex_match_set_id:(regex_match_set_id_ : resource_id option)
    ?name:(name_ : resource_name option)
    ?regex_match_tuples:(regex_match_tuples_ : regex_match_tuples option) () =
  ({
     regex_match_set_id = regex_match_set_id_;
     name = name_;
     regex_match_tuples = regex_match_tuples_;
   }
    : regex_match_set)

let make_get_regex_match_set_response ?regex_match_set:(regex_match_set_ : regex_match_set option)
    () =
  ({ regex_match_set = regex_match_set_ } : get_regex_match_set_response)

let make_get_regex_match_set_request ~regex_match_set_id:(regex_match_set_id_ : resource_id) () =
  ({ regex_match_set_id = regex_match_set_id_ } : get_regex_match_set_request)

let make_get_rate_based_rule_managed_keys_response
    ?managed_keys:(managed_keys_ : managed_keys option)
    ?next_marker:(next_marker_ : next_marker option) () =
  ({ managed_keys = managed_keys_; next_marker = next_marker_ }
    : get_rate_based_rule_managed_keys_response)

let make_get_rate_based_rule_managed_keys_request ?next_marker:(next_marker_ : next_marker option)
    ~rule_id:(rule_id_ : resource_id) () =
  ({ rule_id = rule_id_; next_marker = next_marker_ } : get_rate_based_rule_managed_keys_request)

let make_rate_based_rule ?name:(name_ : resource_name option)
    ?metric_name:(metric_name_ : metric_name option) ~rule_id:(rule_id_ : resource_id)
    ~match_predicates:(match_predicates_ : predicates) ~rate_key:(rate_key_ : rate_key)
    ~rate_limit:(rate_limit_ : rate_limit) () =
  ({
     rule_id = rule_id_;
     name = name_;
     metric_name = metric_name_;
     match_predicates = match_predicates_;
     rate_key = rate_key_;
     rate_limit = rate_limit_;
   }
    : rate_based_rule)

let make_get_rate_based_rule_response ?rule:(rule_ : rate_based_rule option) () =
  ({ rule = rule_ } : get_rate_based_rule_response)

let make_get_rate_based_rule_request ~rule_id:(rule_id_ : resource_id) () =
  ({ rule_id = rule_id_ } : get_rate_based_rule_request)

let make_get_permission_policy_response ?policy:(policy_ : policy_string option) () =
  ({ policy = policy_ } : get_permission_policy_response)

let make_get_permission_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_permission_policy_request)

let make_get_logging_configuration_response
    ?logging_configuration:(logging_configuration_ : logging_configuration option) () =
  ({ logging_configuration = logging_configuration_ } : get_logging_configuration_response)

let make_get_logging_configuration_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_logging_configuration_request)

let make_ip_set ?name:(name_ : resource_name option) ~ip_set_id:(ip_set_id_ : resource_id)
    ~ip_set_descriptors:(ip_set_descriptors_ : ip_set_descriptors) () =
  ({ ip_set_id = ip_set_id_; name = name_; ip_set_descriptors = ip_set_descriptors_ } : ip_set)

let make_get_ip_set_response ?ip_set:(ip_set_ : ip_set option) () =
  ({ ip_set = ip_set_ } : get_ip_set_response)

let make_get_ip_set_request ~ip_set_id:(ip_set_id_ : resource_id) () =
  ({ ip_set_id = ip_set_id_ } : get_ip_set_request)

let make_geo_match_set ?name:(name_ : resource_name option)
    ~geo_match_set_id:(geo_match_set_id_ : resource_id)
    ~geo_match_constraints:(geo_match_constraints_ : geo_match_constraints) () =
  ({
     geo_match_set_id = geo_match_set_id_;
     name = name_;
     geo_match_constraints = geo_match_constraints_;
   }
    : geo_match_set)

let make_get_geo_match_set_response ?geo_match_set:(geo_match_set_ : geo_match_set option) () =
  ({ geo_match_set = geo_match_set_ } : get_geo_match_set_response)

let make_get_geo_match_set_request ~geo_match_set_id:(geo_match_set_id_ : resource_id) () =
  ({ geo_match_set_id = geo_match_set_id_ } : get_geo_match_set_request)

let make_get_change_token_status_response
    ?change_token_status:(change_token_status_ : change_token_status option) () =
  ({ change_token_status = change_token_status_ } : get_change_token_status_response)

let make_get_change_token_status_request ~change_token:(change_token_ : change_token) () =
  ({ change_token = change_token_ } : get_change_token_status_request)

let make_get_change_token_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : get_change_token_response)

let make_get_change_token_request () = (() : unit)

let make_byte_match_set ?name:(name_ : resource_name option)
    ~byte_match_set_id:(byte_match_set_id_ : resource_id)
    ~byte_match_tuples:(byte_match_tuples_ : byte_match_tuples) () =
  ({ byte_match_set_id = byte_match_set_id_; name = name_; byte_match_tuples = byte_match_tuples_ }
    : byte_match_set)

let make_get_byte_match_set_response ?byte_match_set:(byte_match_set_ : byte_match_set option) () =
  ({ byte_match_set = byte_match_set_ } : get_byte_match_set_response)

let make_get_byte_match_set_request ~byte_match_set_id:(byte_match_set_id_ : resource_id) () =
  ({ byte_match_set_id = byte_match_set_id_ } : get_byte_match_set_request)

let make_delete_xss_match_set_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_xss_match_set_response)

let make_delete_xss_match_set_request ~xss_match_set_id:(xss_match_set_id_ : resource_id)
    ~change_token:(change_token_ : change_token) () =
  ({ xss_match_set_id = xss_match_set_id_; change_token = change_token_ }
    : delete_xss_match_set_request)

let make_delete_web_acl_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_web_acl_response)

let make_delete_web_acl_request ~web_acl_id:(web_acl_id_ : resource_id)
    ~change_token:(change_token_ : change_token) () =
  ({ web_acl_id = web_acl_id_; change_token = change_token_ } : delete_web_acl_request)

let make_delete_sql_injection_match_set_response ?change_token:(change_token_ : change_token option)
    () =
  ({ change_token = change_token_ } : delete_sql_injection_match_set_response)

let make_delete_sql_injection_match_set_request
    ~sql_injection_match_set_id:(sql_injection_match_set_id_ : resource_id)
    ~change_token:(change_token_ : change_token) () =
  ({ sql_injection_match_set_id = sql_injection_match_set_id_; change_token = change_token_ }
    : delete_sql_injection_match_set_request)

let make_delete_size_constraint_set_response ?change_token:(change_token_ : change_token option) ()
    =
  ({ change_token = change_token_ } : delete_size_constraint_set_response)

let make_delete_size_constraint_set_request
    ~size_constraint_set_id:(size_constraint_set_id_ : resource_id)
    ~change_token:(change_token_ : change_token) () =
  ({ size_constraint_set_id = size_constraint_set_id_; change_token = change_token_ }
    : delete_size_constraint_set_request)

let make_delete_rule_group_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_rule_group_response)

let make_delete_rule_group_request ~rule_group_id:(rule_group_id_ : resource_id)
    ~change_token:(change_token_ : change_token) () =
  ({ rule_group_id = rule_group_id_; change_token = change_token_ } : delete_rule_group_request)

let make_delete_rule_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_rule_response)

let make_delete_rule_request ~rule_id:(rule_id_ : resource_id)
    ~change_token:(change_token_ : change_token) () =
  ({ rule_id = rule_id_; change_token = change_token_ } : delete_rule_request)

let make_delete_regex_pattern_set_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_regex_pattern_set_response)

let make_delete_regex_pattern_set_request
    ~regex_pattern_set_id:(regex_pattern_set_id_ : resource_id)
    ~change_token:(change_token_ : change_token) () =
  ({ regex_pattern_set_id = regex_pattern_set_id_; change_token = change_token_ }
    : delete_regex_pattern_set_request)

let make_delete_regex_match_set_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_regex_match_set_response)

let make_delete_regex_match_set_request ~regex_match_set_id:(regex_match_set_id_ : resource_id)
    ~change_token:(change_token_ : change_token) () =
  ({ regex_match_set_id = regex_match_set_id_; change_token = change_token_ }
    : delete_regex_match_set_request)

let make_delete_rate_based_rule_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_rate_based_rule_response)

let make_delete_rate_based_rule_request ~rule_id:(rule_id_ : resource_id)
    ~change_token:(change_token_ : change_token) () =
  ({ rule_id = rule_id_; change_token = change_token_ } : delete_rate_based_rule_request)

let make_delete_permission_policy_response () = (() : unit)

let make_delete_permission_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : delete_permission_policy_request)

let make_delete_logging_configuration_response () = (() : unit)

let make_delete_logging_configuration_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : delete_logging_configuration_request)

let make_delete_ip_set_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_ip_set_response)

let make_delete_ip_set_request ~ip_set_id:(ip_set_id_ : resource_id)
    ~change_token:(change_token_ : change_token) () =
  ({ ip_set_id = ip_set_id_; change_token = change_token_ } : delete_ip_set_request)

let make_delete_geo_match_set_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_geo_match_set_response)

let make_delete_geo_match_set_request ~geo_match_set_id:(geo_match_set_id_ : resource_id)
    ~change_token:(change_token_ : change_token) () =
  ({ geo_match_set_id = geo_match_set_id_; change_token = change_token_ }
    : delete_geo_match_set_request)

let make_delete_byte_match_set_response ?change_token:(change_token_ : change_token option) () =
  ({ change_token = change_token_ } : delete_byte_match_set_response)

let make_delete_byte_match_set_request ~byte_match_set_id:(byte_match_set_id_ : resource_id)
    ~change_token:(change_token_ : change_token) () =
  ({ byte_match_set_id = byte_match_set_id_; change_token = change_token_ }
    : delete_byte_match_set_request)

let make_create_xss_match_set_response ?xss_match_set:(xss_match_set_ : xss_match_set option)
    ?change_token:(change_token_ : change_token option) () =
  ({ xss_match_set = xss_match_set_; change_token = change_token_ } : create_xss_match_set_response)

let make_create_xss_match_set_request ~name:(name_ : resource_name)
    ~change_token:(change_token_ : change_token) () =
  ({ name = name_; change_token = change_token_ } : create_xss_match_set_request)

let make_create_web_acl_migration_stack_response ~s3_object_url:(s3_object_url_ : s3_object_url) ()
    =
  ({ s3_object_url = s3_object_url_ } : create_web_acl_migration_stack_response)

let make_create_web_acl_migration_stack_request ~web_acl_id:(web_acl_id_ : resource_id)
    ~s3_bucket_name:(s3_bucket_name_ : s3_bucket_name)
    ~ignore_unsupported_type:(ignore_unsupported_type_ : ignore_unsupported_type) () =
  ({
     web_acl_id = web_acl_id_;
     s3_bucket_name = s3_bucket_name_;
     ignore_unsupported_type = ignore_unsupported_type_;
   }
    : create_web_acl_migration_stack_request)

let make_create_web_acl_response ?web_ac_l:(web_ac_l_ : web_ac_l option)
    ?change_token:(change_token_ : change_token option) () =
  ({ web_ac_l = web_ac_l_; change_token = change_token_ } : create_web_acl_response)

let make_create_web_acl_request ?tags:(tags_ : tag_list option) ~name:(name_ : resource_name)
    ~metric_name:(metric_name_ : metric_name) ~default_action:(default_action_ : waf_action)
    ~change_token:(change_token_ : change_token) () =
  ({
     name = name_;
     metric_name = metric_name_;
     default_action = default_action_;
     change_token = change_token_;
     tags = tags_;
   }
    : create_web_acl_request)

let make_create_sql_injection_match_set_response
    ?sql_injection_match_set:(sql_injection_match_set_ : sql_injection_match_set option)
    ?change_token:(change_token_ : change_token option) () =
  ({ sql_injection_match_set = sql_injection_match_set_; change_token = change_token_ }
    : create_sql_injection_match_set_response)

let make_create_sql_injection_match_set_request ~name:(name_ : resource_name)
    ~change_token:(change_token_ : change_token) () =
  ({ name = name_; change_token = change_token_ } : create_sql_injection_match_set_request)

let make_create_size_constraint_set_response
    ?size_constraint_set:(size_constraint_set_ : size_constraint_set option)
    ?change_token:(change_token_ : change_token option) () =
  ({ size_constraint_set = size_constraint_set_; change_token = change_token_ }
    : create_size_constraint_set_response)

let make_create_size_constraint_set_request ~name:(name_ : resource_name)
    ~change_token:(change_token_ : change_token) () =
  ({ name = name_; change_token = change_token_ } : create_size_constraint_set_request)

let make_create_rule_group_response ?rule_group:(rule_group_ : rule_group option)
    ?change_token:(change_token_ : change_token option) () =
  ({ rule_group = rule_group_; change_token = change_token_ } : create_rule_group_response)

let make_create_rule_group_request ?tags:(tags_ : tag_list option) ~name:(name_ : resource_name)
    ~metric_name:(metric_name_ : metric_name) ~change_token:(change_token_ : change_token) () =
  ({ name = name_; metric_name = metric_name_; change_token = change_token_; tags = tags_ }
    : create_rule_group_request)

let make_create_rule_response ?rule:(rule_ : rule option)
    ?change_token:(change_token_ : change_token option) () =
  ({ rule = rule_; change_token = change_token_ } : create_rule_response)

let make_create_rule_request ?tags:(tags_ : tag_list option) ~name:(name_ : resource_name)
    ~metric_name:(metric_name_ : metric_name) ~change_token:(change_token_ : change_token) () =
  ({ name = name_; metric_name = metric_name_; change_token = change_token_; tags = tags_ }
    : create_rule_request)

let make_create_regex_pattern_set_response
    ?regex_pattern_set:(regex_pattern_set_ : regex_pattern_set option)
    ?change_token:(change_token_ : change_token option) () =
  ({ regex_pattern_set = regex_pattern_set_; change_token = change_token_ }
    : create_regex_pattern_set_response)

let make_create_regex_pattern_set_request ~name:(name_ : resource_name)
    ~change_token:(change_token_ : change_token) () =
  ({ name = name_; change_token = change_token_ } : create_regex_pattern_set_request)

let make_create_regex_match_set_response
    ?regex_match_set:(regex_match_set_ : regex_match_set option)
    ?change_token:(change_token_ : change_token option) () =
  ({ regex_match_set = regex_match_set_; change_token = change_token_ }
    : create_regex_match_set_response)

let make_create_regex_match_set_request ~name:(name_ : resource_name)
    ~change_token:(change_token_ : change_token) () =
  ({ name = name_; change_token = change_token_ } : create_regex_match_set_request)

let make_create_rate_based_rule_response ?rule:(rule_ : rate_based_rule option)
    ?change_token:(change_token_ : change_token option) () =
  ({ rule = rule_; change_token = change_token_ } : create_rate_based_rule_response)

let make_create_rate_based_rule_request ?tags:(tags_ : tag_list option)
    ~name:(name_ : resource_name) ~metric_name:(metric_name_ : metric_name)
    ~rate_key:(rate_key_ : rate_key) ~rate_limit:(rate_limit_ : rate_limit)
    ~change_token:(change_token_ : change_token) () =
  ({
     name = name_;
     metric_name = metric_name_;
     rate_key = rate_key_;
     rate_limit = rate_limit_;
     change_token = change_token_;
     tags = tags_;
   }
    : create_rate_based_rule_request)

let make_create_ip_set_response ?ip_set:(ip_set_ : ip_set option)
    ?change_token:(change_token_ : change_token option) () =
  ({ ip_set = ip_set_; change_token = change_token_ } : create_ip_set_response)

let make_create_ip_set_request ~name:(name_ : resource_name)
    ~change_token:(change_token_ : change_token) () =
  ({ name = name_; change_token = change_token_ } : create_ip_set_request)

let make_create_geo_match_set_response ?geo_match_set:(geo_match_set_ : geo_match_set option)
    ?change_token:(change_token_ : change_token option) () =
  ({ geo_match_set = geo_match_set_; change_token = change_token_ } : create_geo_match_set_response)

let make_create_geo_match_set_request ~name:(name_ : resource_name)
    ~change_token:(change_token_ : change_token) () =
  ({ name = name_; change_token = change_token_ } : create_geo_match_set_request)

let make_create_byte_match_set_response ?byte_match_set:(byte_match_set_ : byte_match_set option)
    ?change_token:(change_token_ : change_token option) () =
  ({ byte_match_set = byte_match_set_; change_token = change_token_ }
    : create_byte_match_set_response)

let make_create_byte_match_set_request ~name:(name_ : resource_name)
    ~change_token:(change_token_ : change_token) () =
  ({ name = name_; change_token = change_token_ } : create_byte_match_set_request)
