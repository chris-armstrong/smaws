open Types

let make_update_auto_management_response () = (() : unit)

let make_update_auto_management_request ?exclusion_list:(exclusion_list_ : exclusion_list option)
    ?notification_arn:(notification_arn_ : amazon_resource_name option)
    ?opt_in_type:(opt_in_type_ : opt_in_type option) () =
  ({
     exclusion_list = exclusion_list_;
     notification_arn = notification_arn_;
     opt_in_type = opt_in_type_;
   }
    : update_auto_management_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : input_tag_keys)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : input_tags)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_stop_auto_management_response () = (() : unit)
let make_stop_auto_management_request () = (() : unit)

let make_start_quota_utilization_report_response ?message:(message_ : report_message option)
    ?status:(status_ : report_status option) ?report_id:(report_id_ : report_id option) () =
  ({ message = message_; status = status_; report_id = report_id_ }
    : start_quota_utilization_report_response)

let make_start_quota_utilization_report_request () = (() : unit)
let make_start_auto_management_response () = (() : unit)

let make_start_auto_management_request ?exclusion_list:(exclusion_list_ : exclusion_list option)
    ?notification_arn:(notification_arn_ : amazon_resource_name option)
    ~opt_in_type:(opt_in_type_ : opt_in_type) ~opt_in_level:(opt_in_level_ : opt_in_level) () =
  ({
     exclusion_list = exclusion_list_;
     notification_arn = notification_arn_;
     opt_in_type = opt_in_type_;
     opt_in_level = opt_in_level_;
   }
    : start_auto_management_request)

let make_quota_context_info ?context_id:(context_id_ : quota_context_id option)
    ?context_scope_type:(context_scope_type_ : quota_context_scope_type option)
    ?context_scope:(context_scope_ : quota_context_scope option) () =
  ({
     context_id = context_id_;
     context_scope_type = context_scope_type_;
     context_scope = context_scope_;
   }
    : quota_context_info)

let make_requested_service_quota_change ?quota_context:(quota_context_ : quota_context_info option)
    ?quota_requested_at_level:(quota_requested_at_level_ : applied_level_enum option)
    ?unit_:(unit__ : quota_unit option) ?global_quota:(global_quota_ : global_quota option)
    ?quota_arn:(quota_arn_ : quota_arn option) ?requester:(requester_ : requester option)
    ?last_updated:(last_updated_ : date_time option) ?created:(created_ : date_time option)
    ?status:(status_ : request_status option) ?desired_value:(desired_value_ : quota_value option)
    ?quota_name:(quota_name_ : quota_name option) ?quota_code:(quota_code_ : quota_code option)
    ?service_name:(service_name_ : service_name option)
    ?service_code:(service_code_ : service_code option)
    ?case_id:(case_id_ : customer_service_engagement_id option)
    ?request_type:(request_type_ : request_type option) ?id:(id_ : request_id option) () =
  ({
     quota_context = quota_context_;
     quota_requested_at_level = quota_requested_at_level_;
     unit_ = unit__;
     global_quota = global_quota_;
     quota_arn = quota_arn_;
     requester = requester_;
     last_updated = last_updated_;
     created = created_;
     status = status_;
     desired_value = desired_value_;
     quota_name = quota_name_;
     quota_code = quota_code_;
     service_name = service_name_;
     service_code = service_code_;
     case_id = case_id_;
     request_type = request_type_;
     id = id_;
   }
    : requested_service_quota_change)

let make_request_service_quota_increase_response
    ?requested_quota:(requested_quota_ : requested_service_quota_change option) () =
  ({ requested_quota = requested_quota_ } : request_service_quota_increase_response)

let make_request_service_quota_increase_request
    ?support_case_allowed:(support_case_allowed_ : support_case_allowed option)
    ?context_id:(context_id_ : quota_context_id option)
    ~desired_value:(desired_value_ : quota_value) ~quota_code:(quota_code_ : quota_code)
    ~service_code:(service_code_ : service_code) () =
  ({
     support_case_allowed = support_case_allowed_;
     context_id = context_id_;
     desired_value = desired_value_;
     quota_code = quota_code_;
     service_code = service_code_;
   }
    : request_service_quota_increase_request)

let make_service_quota_increase_request_in_template
    ?global_quota:(global_quota_ : global_quota option) ?unit_:(unit__ : quota_unit option)
    ?aws_region:(aws_region_ : aws_region option)
    ?desired_value:(desired_value_ : quota_value option)
    ?quota_name:(quota_name_ : quota_name option) ?quota_code:(quota_code_ : quota_code option)
    ?service_name:(service_name_ : service_name option)
    ?service_code:(service_code_ : service_code option) () =
  ({
     global_quota = global_quota_;
     unit_ = unit__;
     aws_region = aws_region_;
     desired_value = desired_value_;
     quota_name = quota_name_;
     quota_code = quota_code_;
     service_name = service_name_;
     service_code = service_code_;
   }
    : service_quota_increase_request_in_template)

let make_put_service_quota_increase_request_into_template_response
    ?service_quota_increase_request_in_template:
      (service_quota_increase_request_in_template_ :
         service_quota_increase_request_in_template option) () =
  ({ service_quota_increase_request_in_template = service_quota_increase_request_in_template_ }
    : put_service_quota_increase_request_into_template_response)

let make_put_service_quota_increase_request_into_template_request
    ~desired_value:(desired_value_ : quota_value) ~aws_region:(aws_region_ : aws_region)
    ~service_code:(service_code_ : service_code) ~quota_code:(quota_code_ : quota_code) () =
  ({
     desired_value = desired_value_;
     aws_region = aws_region_;
     service_code = service_code_;
     quota_code = quota_code_;
   }
    : put_service_quota_increase_request_into_template_request)

let make_list_tags_for_resource_response ?tags:(tags_ : output_tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_service_info ?service_name:(service_name_ : service_name option)
    ?service_code:(service_code_ : service_code option) () =
  ({ service_name = service_name_; service_code = service_code_ } : service_info)

let make_list_services_response ?services:(services_ : service_info_list_definition option)
    ?next_token:(next_token_ : next_token option) () =
  ({ services = services_; next_token = next_token_ } : list_services_response)

let make_list_services_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_services_request)

let make_metric_info
    ?metric_statistic_recommendation:(metric_statistic_recommendation_ : statistic option)
    ?metric_dimensions:(metric_dimensions_ : metric_dimensions_map_definition option)
    ?metric_name:(metric_name_ : quota_metric_name option)
    ?metric_namespace:(metric_namespace_ : quota_metric_namespace option) () =
  ({
     metric_statistic_recommendation = metric_statistic_recommendation_;
     metric_dimensions = metric_dimensions_;
     metric_name = metric_name_;
     metric_namespace = metric_namespace_;
   }
    : metric_info)

let make_quota_period ?period_unit:(period_unit_ : period_unit option)
    ?period_value:(period_value_ : period_value option) () =
  ({ period_unit = period_unit_; period_value = period_value_ } : quota_period)

let make_error_reason ?error_message:(error_message_ : error_message option)
    ?error_code:(error_code_ : error_code option) () =
  ({ error_message = error_message_; error_code = error_code_ } : error_reason)

let make_service_quota ?description:(description_ : quota_description option)
    ?quota_context:(quota_context_ : quota_context_info option)
    ?quota_applied_at_level:(quota_applied_at_level_ : applied_level_enum option)
    ?error_reason:(error_reason_ : error_reason option) ?period:(period_ : quota_period option)
    ?usage_metric:(usage_metric_ : metric_info option)
    ?global_quota:(global_quota_ : global_quota option)
    ?adjustable:(adjustable_ : quota_adjustable option) ?unit_:(unit__ : quota_unit option)
    ?value:(value_ : quota_value option) ?quota_name:(quota_name_ : quota_name option)
    ?quota_code:(quota_code_ : quota_code option) ?quota_arn:(quota_arn_ : quota_arn option)
    ?service_name:(service_name_ : service_name option)
    ?service_code:(service_code_ : service_code option) () =
  ({
     description = description_;
     quota_context = quota_context_;
     quota_applied_at_level = quota_applied_at_level_;
     error_reason = error_reason_;
     period = period_;
     usage_metric = usage_metric_;
     global_quota = global_quota_;
     adjustable = adjustable_;
     unit_ = unit__;
     value = value_;
     quota_name = quota_name_;
     quota_code = quota_code_;
     quota_arn = quota_arn_;
     service_name = service_name_;
     service_code = service_code_;
   }
    : service_quota)

let make_list_service_quotas_response ?quotas:(quotas_ : service_quota_list_definition option)
    ?next_token:(next_token_ : next_token option) () =
  ({ quotas = quotas_; next_token = next_token_ } : list_service_quotas_response)

let make_list_service_quotas_request
    ?quota_applied_at_level:(quota_applied_at_level_ : applied_level_enum option)
    ?quota_code:(quota_code_ : quota_code option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~service_code:(service_code_ : service_code) () =
  ({
     quota_applied_at_level = quota_applied_at_level_;
     quota_code = quota_code_;
     max_results = max_results_;
     next_token = next_token_;
     service_code = service_code_;
   }
    : list_service_quotas_request)

let make_list_service_quota_increase_requests_in_template_response
    ?next_token:(next_token_ : next_token option)
    ?service_quota_increase_request_in_template_list:
      (service_quota_increase_request_in_template_list_ :
         service_quota_increase_request_in_template_list option) () =
  ({
     next_token = next_token_;
     service_quota_increase_request_in_template_list =
       service_quota_increase_request_in_template_list_;
   }
    : list_service_quota_increase_requests_in_template_response)

let make_list_service_quota_increase_requests_in_template_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?aws_region:(aws_region_ : aws_region option)
    ?service_code:(service_code_ : service_code option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     aws_region = aws_region_;
     service_code = service_code_;
   }
    : list_service_quota_increase_requests_in_template_request)

let make_list_requested_service_quota_change_history_by_quota_response
    ?requested_quotas:
      (requested_quotas_ : requested_service_quota_change_history_list_definition option)
    ?next_token:(next_token_ : next_token option) () =
  ({ requested_quotas = requested_quotas_; next_token = next_token_ }
    : list_requested_service_quota_change_history_by_quota_response)

let make_list_requested_service_quota_change_history_by_quota_request
    ?quota_requested_at_level:(quota_requested_at_level_ : applied_level_enum option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?status:(status_ : request_status option) ~quota_code:(quota_code_ : quota_code)
    ~service_code:(service_code_ : service_code) () =
  ({
     quota_requested_at_level = quota_requested_at_level_;
     max_results = max_results_;
     next_token = next_token_;
     status = status_;
     quota_code = quota_code_;
     service_code = service_code_;
   }
    : list_requested_service_quota_change_history_by_quota_request)

let make_list_requested_service_quota_change_history_response
    ?requested_quotas:
      (requested_quotas_ : requested_service_quota_change_history_list_definition option)
    ?next_token:(next_token_ : next_token option) () =
  ({ requested_quotas = requested_quotas_; next_token = next_token_ }
    : list_requested_service_quota_change_history_response)

let make_list_requested_service_quota_change_history_request
    ?quota_requested_at_level:(quota_requested_at_level_ : applied_level_enum option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?status:(status_ : request_status option) ?service_code:(service_code_ : service_code option) ()
    =
  ({
     quota_requested_at_level = quota_requested_at_level_;
     max_results = max_results_;
     next_token = next_token_;
     status = status_;
     service_code = service_code_;
   }
    : list_requested_service_quota_change_history_request)

let make_list_aws_default_service_quotas_response
    ?quotas:(quotas_ : service_quota_list_definition option)
    ?next_token:(next_token_ : next_token option) () =
  ({ quotas = quotas_; next_token = next_token_ } : list_aws_default_service_quotas_response)

let make_list_aws_default_service_quotas_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~service_code:(service_code_ : service_code) () =
  ({ max_results = max_results_; next_token = next_token_; service_code = service_code_ }
    : list_aws_default_service_quotas_request)

let make_get_service_quota_increase_request_from_template_response
    ?service_quota_increase_request_in_template:
      (service_quota_increase_request_in_template_ :
         service_quota_increase_request_in_template option) () =
  ({ service_quota_increase_request_in_template = service_quota_increase_request_in_template_ }
    : get_service_quota_increase_request_from_template_response)

let make_get_service_quota_increase_request_from_template_request
    ~aws_region:(aws_region_ : aws_region) ~quota_code:(quota_code_ : quota_code)
    ~service_code:(service_code_ : service_code) () =
  ({ aws_region = aws_region_; quota_code = quota_code_; service_code = service_code_ }
    : get_service_quota_increase_request_from_template_request)

let make_get_service_quota_response ?quota:(quota_ : service_quota option) () =
  ({ quota = quota_ } : get_service_quota_response)

let make_get_service_quota_request ?context_id:(context_id_ : quota_context_id option)
    ~quota_code:(quota_code_ : quota_code) ~service_code:(service_code_ : service_code) () =
  ({ context_id = context_id_; quota_code = quota_code_; service_code = service_code_ }
    : get_service_quota_request)

let make_get_requested_service_quota_change_response
    ?requested_quota:(requested_quota_ : requested_service_quota_change option) () =
  ({ requested_quota = requested_quota_ } : get_requested_service_quota_change_response)

let make_get_requested_service_quota_change_request ~request_id:(request_id_ : request_id) () =
  ({ request_id = request_id_ } : get_requested_service_quota_change_request)

let make_quota_utilization_info ?adjustable:(adjustable_ : quota_adjustable option)
    ?service_name:(service_name_ : service_name option)
    ?applied_value:(applied_value_ : applied_value option)
    ?default_value:(default_value_ : default_value option)
    ?utilization:(utilization_ : utilization_pct option)
    ?namespace:(namespace_ : quota_metric_namespace option)
    ?quota_name:(quota_name_ : quota_name option)
    ?service_code:(service_code_ : service_code option)
    ?quota_code:(quota_code_ : quota_code option) () =
  ({
     adjustable = adjustable_;
     service_name = service_name_;
     applied_value = applied_value_;
     default_value = default_value_;
     utilization = utilization_;
     namespace = namespace_;
     quota_name = quota_name_;
     service_code = service_code_;
     quota_code = quota_code_;
   }
    : quota_utilization_info)

let make_get_quota_utilization_report_response
    ?error_message:(error_message_ : report_error_message option)
    ?error_code:(error_code_ : report_error_code option)
    ?next_token:(next_token_ : next_token option)
    ?quotas:(quotas_ : quota_utilization_info_list option)
    ?total_count:(total_count_ : total_count option)
    ?generated_at:(generated_at_ : date_time option) ?status:(status_ : report_status option)
    ?report_id:(report_id_ : report_id option) () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     next_token = next_token_;
     quotas = quotas_;
     total_count = total_count_;
     generated_at = generated_at_;
     status = status_;
     report_id = report_id_;
   }
    : get_quota_utilization_report_response)

let make_get_quota_utilization_report_request
    ?max_results:(max_results_ : max_results_utilization option)
    ?next_token:(next_token_ : next_token option) ~report_id:(report_id_ : report_id) () =
  ({ max_results = max_results_; next_token = next_token_; report_id = report_id_ }
    : get_quota_utilization_report_request)

let make_get_aws_default_service_quota_response ?quota:(quota_ : service_quota option) () =
  ({ quota = quota_ } : get_aws_default_service_quota_response)

let make_get_aws_default_service_quota_request ~quota_code:(quota_code_ : quota_code)
    ~service_code:(service_code_ : service_code) () =
  ({ quota_code = quota_code_; service_code = service_code_ }
    : get_aws_default_service_quota_request)

let make_quota_info ?quota_name:(quota_name_ : quota_name option)
    ?quota_code:(quota_code_ : quota_code option) () =
  ({ quota_name = quota_name_; quota_code = quota_code_ } : quota_info)

let make_get_auto_management_configuration_response
    ?exclusion_list:(exclusion_list_ : exclusion_quota_list option)
    ?opt_in_status:(opt_in_status_ : opt_in_status option)
    ?notification_arn:(notification_arn_ : amazon_resource_name option)
    ?opt_in_type:(opt_in_type_ : opt_in_type option)
    ?opt_in_level:(opt_in_level_ : opt_in_level option) () =
  ({
     exclusion_list = exclusion_list_;
     opt_in_status = opt_in_status_;
     notification_arn = notification_arn_;
     opt_in_type = opt_in_type_;
     opt_in_level = opt_in_level_;
   }
    : get_auto_management_configuration_response)

let make_get_auto_management_configuration_request () = (() : unit)

let make_get_association_for_service_quota_template_response
    ?service_quota_template_association_status:
      (service_quota_template_association_status_ : service_quota_template_association_status option)
    () =
  ({ service_quota_template_association_status = service_quota_template_association_status_ }
    : get_association_for_service_quota_template_response)

let make_get_association_for_service_quota_template_request () = (() : unit)
let make_disassociate_service_quota_template_response () = (() : unit)
let make_disassociate_service_quota_template_request () = (() : unit)
let make_delete_service_quota_increase_request_from_template_response () = (() : unit)

let make_delete_service_quota_increase_request_from_template_request
    ~aws_region:(aws_region_ : aws_region) ~quota_code:(quota_code_ : quota_code)
    ~service_code:(service_code_ : service_code) () =
  ({ aws_region = aws_region_; quota_code = quota_code_; service_code = service_code_ }
    : delete_service_quota_increase_request_from_template_request)

let make_create_support_case_response () = (() : unit)

let make_create_support_case_request ~request_id:(request_id_ : request_id) () =
  ({ request_id = request_id_ } : create_support_case_request)

let make_associate_service_quota_template_response () = (() : unit)
let make_associate_service_quota_template_request () = (() : unit)
