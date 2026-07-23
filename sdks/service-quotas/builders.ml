open Types

let make_associate_service_quota_template_response () = (() : unit)
let make_associate_service_quota_template_request () = (() : unit)
let make_create_support_case_response () = (() : unit)

let make_create_support_case_request ~request_id:(request_id_ : request_id) () =
  ({ request_id = request_id_ } : create_support_case_request)

let make_delete_service_quota_increase_request_from_template_response () = (() : unit)

let make_delete_service_quota_increase_request_from_template_request
    ~service_code:(service_code_ : service_code) ~quota_code:(quota_code_ : quota_code)
    ~aws_region:(aws_region_ : aws_region) () =
  ({ service_code = service_code_; quota_code = quota_code_; aws_region = aws_region_ }
    : delete_service_quota_increase_request_from_template_request)

let make_disassociate_service_quota_template_response () = (() : unit)
let make_disassociate_service_quota_template_request () = (() : unit)

let make_error_reason ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({ error_code = error_code_; error_message = error_message_ } : error_reason)

let make_quota_info ?quota_code:(quota_code_ : quota_code option)
    ?quota_name:(quota_name_ : quota_name option) () =
  ({ quota_code = quota_code_; quota_name = quota_name_ } : quota_info)

let make_quota_context_info ?context_scope:(context_scope_ : quota_context_scope option)
    ?context_scope_type:(context_scope_type_ : quota_context_scope_type option)
    ?context_id:(context_id_ : quota_context_id option) () =
  ({
     context_scope = context_scope_;
     context_scope_type = context_scope_type_;
     context_id = context_id_;
   }
    : quota_context_info)

let make_quota_period ?period_value:(period_value_ : period_value option)
    ?period_unit:(period_unit_ : period_unit option) () =
  ({ period_value = period_value_; period_unit = period_unit_ } : quota_period)

let make_metric_info ?metric_namespace:(metric_namespace_ : quota_metric_namespace option)
    ?metric_name:(metric_name_ : quota_metric_name option)
    ?metric_dimensions:(metric_dimensions_ : metric_dimensions_map_definition option)
    ?metric_statistic_recommendation:(metric_statistic_recommendation_ : statistic option) () =
  ({
     metric_namespace = metric_namespace_;
     metric_name = metric_name_;
     metric_dimensions = metric_dimensions_;
     metric_statistic_recommendation = metric_statistic_recommendation_;
   }
    : metric_info)

let make_service_quota ?service_code:(service_code_ : service_code option)
    ?service_name:(service_name_ : service_name option) ?quota_arn:(quota_arn_ : quota_arn option)
    ?quota_code:(quota_code_ : quota_code option) ?quota_name:(quota_name_ : quota_name option)
    ?value:(value_ : quota_value option) ?unit_:(unit__ : quota_unit option)
    ?adjustable:(adjustable_ : quota_adjustable option)
    ?global_quota:(global_quota_ : global_quota option)
    ?usage_metric:(usage_metric_ : metric_info option) ?period:(period_ : quota_period option)
    ?error_reason:(error_reason_ : error_reason option)
    ?quota_applied_at_level:(quota_applied_at_level_ : applied_level_enum option)
    ?quota_context:(quota_context_ : quota_context_info option)
    ?description:(description_ : quota_description option) () =
  ({
     service_code = service_code_;
     service_name = service_name_;
     quota_arn = quota_arn_;
     quota_code = quota_code_;
     quota_name = quota_name_;
     value = value_;
     unit_ = unit__;
     adjustable = adjustable_;
     global_quota = global_quota_;
     usage_metric = usage_metric_;
     period = period_;
     error_reason = error_reason_;
     quota_applied_at_level = quota_applied_at_level_;
     quota_context = quota_context_;
     description = description_;
   }
    : service_quota)

let make_get_aws_default_service_quota_response ?quota:(quota_ : service_quota option) () =
  ({ quota = quota_ } : get_aws_default_service_quota_response)

let make_get_aws_default_service_quota_request ~service_code:(service_code_ : service_code)
    ~quota_code:(quota_code_ : quota_code) () =
  ({ service_code = service_code_; quota_code = quota_code_ }
    : get_aws_default_service_quota_request)

let make_get_association_for_service_quota_template_response
    ?service_quota_template_association_status:
      (service_quota_template_association_status_ : service_quota_template_association_status option)
    () =
  ({ service_quota_template_association_status = service_quota_template_association_status_ }
    : get_association_for_service_quota_template_response)

let make_get_association_for_service_quota_template_request () = (() : unit)

let make_get_auto_management_configuration_response
    ?opt_in_level:(opt_in_level_ : opt_in_level option)
    ?opt_in_type:(opt_in_type_ : opt_in_type option)
    ?notification_arn:(notification_arn_ : amazon_resource_name option)
    ?opt_in_status:(opt_in_status_ : opt_in_status option)
    ?exclusion_list:(exclusion_list_ : exclusion_quota_list option) () =
  ({
     opt_in_level = opt_in_level_;
     opt_in_type = opt_in_type_;
     notification_arn = notification_arn_;
     opt_in_status = opt_in_status_;
     exclusion_list = exclusion_list_;
   }
    : get_auto_management_configuration_response)

let make_get_auto_management_configuration_request () = (() : unit)

let make_quota_utilization_info ?quota_code:(quota_code_ : quota_code option)
    ?service_code:(service_code_ : service_code option)
    ?quota_name:(quota_name_ : quota_name option)
    ?namespace:(namespace_ : quota_metric_namespace option)
    ?utilization:(utilization_ : utilization_pct option)
    ?default_value:(default_value_ : default_value option)
    ?applied_value:(applied_value_ : applied_value option)
    ?service_name:(service_name_ : service_name option)
    ?adjustable:(adjustable_ : quota_adjustable option) () =
  ({
     quota_code = quota_code_;
     service_code = service_code_;
     quota_name = quota_name_;
     namespace = namespace_;
     utilization = utilization_;
     default_value = default_value_;
     applied_value = applied_value_;
     service_name = service_name_;
     adjustable = adjustable_;
   }
    : quota_utilization_info)

let make_get_quota_utilization_report_response ?report_id:(report_id_ : report_id option)
    ?status:(status_ : report_status option) ?generated_at:(generated_at_ : date_time option)
    ?total_count:(total_count_ : total_count option)
    ?quotas:(quotas_ : quota_utilization_info_list option)
    ?next_token:(next_token_ : next_token option)
    ?error_code:(error_code_ : report_error_code option)
    ?error_message:(error_message_ : report_error_message option) () =
  ({
     report_id = report_id_;
     status = status_;
     generated_at = generated_at_;
     total_count = total_count_;
     quotas = quotas_;
     next_token = next_token_;
     error_code = error_code_;
     error_message = error_message_;
   }
    : get_quota_utilization_report_response)

let make_get_quota_utilization_report_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_utilization option) ~report_id:(report_id_ : report_id)
    () =
  ({ report_id = report_id_; next_token = next_token_; max_results = max_results_ }
    : get_quota_utilization_report_request)

let make_requested_service_quota_change ?id:(id_ : request_id option)
    ?request_type:(request_type_ : request_type option)
    ?case_id:(case_id_ : customer_service_engagement_id option)
    ?service_code:(service_code_ : service_code option)
    ?service_name:(service_name_ : service_name option)
    ?quota_code:(quota_code_ : quota_code option) ?quota_name:(quota_name_ : quota_name option)
    ?desired_value:(desired_value_ : quota_value option) ?status:(status_ : request_status option)
    ?created:(created_ : date_time option) ?last_updated:(last_updated_ : date_time option)
    ?requester:(requester_ : requester option) ?quota_arn:(quota_arn_ : quota_arn option)
    ?global_quota:(global_quota_ : global_quota option) ?unit_:(unit__ : quota_unit option)
    ?quota_requested_at_level:(quota_requested_at_level_ : applied_level_enum option)
    ?quota_context:(quota_context_ : quota_context_info option) () =
  ({
     id = id_;
     request_type = request_type_;
     case_id = case_id_;
     service_code = service_code_;
     service_name = service_name_;
     quota_code = quota_code_;
     quota_name = quota_name_;
     desired_value = desired_value_;
     status = status_;
     created = created_;
     last_updated = last_updated_;
     requester = requester_;
     quota_arn = quota_arn_;
     global_quota = global_quota_;
     unit_ = unit__;
     quota_requested_at_level = quota_requested_at_level_;
     quota_context = quota_context_;
   }
    : requested_service_quota_change)

let make_get_requested_service_quota_change_response
    ?requested_quota:(requested_quota_ : requested_service_quota_change option) () =
  ({ requested_quota = requested_quota_ } : get_requested_service_quota_change_response)

let make_get_requested_service_quota_change_request ~request_id:(request_id_ : request_id) () =
  ({ request_id = request_id_ } : get_requested_service_quota_change_request)

let make_get_service_quota_response ?quota:(quota_ : service_quota option) () =
  ({ quota = quota_ } : get_service_quota_response)

let make_get_service_quota_request ?context_id:(context_id_ : quota_context_id option)
    ~service_code:(service_code_ : service_code) ~quota_code:(quota_code_ : quota_code) () =
  ({ service_code = service_code_; quota_code = quota_code_; context_id = context_id_ }
    : get_service_quota_request)

let make_service_quota_increase_request_in_template
    ?service_code:(service_code_ : service_code option)
    ?service_name:(service_name_ : service_name option)
    ?quota_code:(quota_code_ : quota_code option) ?quota_name:(quota_name_ : quota_name option)
    ?desired_value:(desired_value_ : quota_value option)
    ?aws_region:(aws_region_ : aws_region option) ?unit_:(unit__ : quota_unit option)
    ?global_quota:(global_quota_ : global_quota option) () =
  ({
     service_code = service_code_;
     service_name = service_name_;
     quota_code = quota_code_;
     quota_name = quota_name_;
     desired_value = desired_value_;
     aws_region = aws_region_;
     unit_ = unit__;
     global_quota = global_quota_;
   }
    : service_quota_increase_request_in_template)

let make_get_service_quota_increase_request_from_template_response
    ?service_quota_increase_request_in_template:
      (service_quota_increase_request_in_template_ :
         service_quota_increase_request_in_template option) () =
  ({ service_quota_increase_request_in_template = service_quota_increase_request_in_template_ }
    : get_service_quota_increase_request_from_template_response)

let make_get_service_quota_increase_request_from_template_request
    ~service_code:(service_code_ : service_code) ~quota_code:(quota_code_ : quota_code)
    ~aws_region:(aws_region_ : aws_region) () =
  ({ service_code = service_code_; quota_code = quota_code_; aws_region = aws_region_ }
    : get_service_quota_increase_request_from_template_request)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_list_aws_default_service_quotas_response ?next_token:(next_token_ : next_token option)
    ?quotas:(quotas_ : service_quota_list_definition option) () =
  ({ next_token = next_token_; quotas = quotas_ } : list_aws_default_service_quotas_response)

let make_list_aws_default_service_quotas_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~service_code:(service_code_ : service_code) ()
    =
  ({ service_code = service_code_; next_token = next_token_; max_results = max_results_ }
    : list_aws_default_service_quotas_request)

let make_list_requested_service_quota_change_history_response
    ?next_token:(next_token_ : next_token option)
    ?requested_quotas:
      (requested_quotas_ : requested_service_quota_change_history_list_definition option) () =
  ({ next_token = next_token_; requested_quotas = requested_quotas_ }
    : list_requested_service_quota_change_history_response)

let make_list_requested_service_quota_change_history_request
    ?service_code:(service_code_ : service_code option) ?status:(status_ : request_status option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?quota_requested_at_level:(quota_requested_at_level_ : applied_level_enum option) () =
  ({
     service_code = service_code_;
     status = status_;
     next_token = next_token_;
     max_results = max_results_;
     quota_requested_at_level = quota_requested_at_level_;
   }
    : list_requested_service_quota_change_history_request)

let make_list_requested_service_quota_change_history_by_quota_response
    ?next_token:(next_token_ : next_token option)
    ?requested_quotas:
      (requested_quotas_ : requested_service_quota_change_history_list_definition option) () =
  ({ next_token = next_token_; requested_quotas = requested_quotas_ }
    : list_requested_service_quota_change_history_by_quota_response)

let make_list_requested_service_quota_change_history_by_quota_request
    ?status:(status_ : request_status option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?quota_requested_at_level:(quota_requested_at_level_ : applied_level_enum option)
    ~service_code:(service_code_ : service_code) ~quota_code:(quota_code_ : quota_code) () =
  ({
     service_code = service_code_;
     quota_code = quota_code_;
     status = status_;
     next_token = next_token_;
     max_results = max_results_;
     quota_requested_at_level = quota_requested_at_level_;
   }
    : list_requested_service_quota_change_history_by_quota_request)

let make_list_service_quota_increase_requests_in_template_response
    ?service_quota_increase_request_in_template_list:
      (service_quota_increase_request_in_template_list_ :
         service_quota_increase_request_in_template_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     service_quota_increase_request_in_template_list =
       service_quota_increase_request_in_template_list_;
     next_token = next_token_;
   }
    : list_service_quota_increase_requests_in_template_response)

let make_list_service_quota_increase_requests_in_template_request
    ?service_code:(service_code_ : service_code option)
    ?aws_region:(aws_region_ : aws_region option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     service_code = service_code_;
     aws_region = aws_region_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_service_quota_increase_requests_in_template_request)

let make_list_service_quotas_response ?next_token:(next_token_ : next_token option)
    ?quotas:(quotas_ : service_quota_list_definition option) () =
  ({ next_token = next_token_; quotas = quotas_ } : list_service_quotas_response)

let make_list_service_quotas_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?quota_code:(quota_code_ : quota_code option)
    ?quota_applied_at_level:(quota_applied_at_level_ : applied_level_enum option)
    ~service_code:(service_code_ : service_code) () =
  ({
     service_code = service_code_;
     next_token = next_token_;
     max_results = max_results_;
     quota_code = quota_code_;
     quota_applied_at_level = quota_applied_at_level_;
   }
    : list_service_quotas_request)

let make_service_info ?service_code:(service_code_ : service_code option)
    ?service_name:(service_name_ : service_name option) () =
  ({ service_code = service_code_; service_name = service_name_ } : service_info)

let make_list_services_response ?next_token:(next_token_ : next_token option)
    ?services:(services_ : service_info_list_definition option) () =
  ({ next_token = next_token_; services = services_ } : list_services_response)

let make_list_services_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_services_request)

let make_list_tags_for_resource_response ?tags:(tags_ : output_tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_put_service_quota_increase_request_into_template_response
    ?service_quota_increase_request_in_template:
      (service_quota_increase_request_in_template_ :
         service_quota_increase_request_in_template option) () =
  ({ service_quota_increase_request_in_template = service_quota_increase_request_in_template_ }
    : put_service_quota_increase_request_into_template_response)

let make_put_service_quota_increase_request_into_template_request
    ~quota_code:(quota_code_ : quota_code) ~service_code:(service_code_ : service_code)
    ~aws_region:(aws_region_ : aws_region) ~desired_value:(desired_value_ : quota_value) () =
  ({
     quota_code = quota_code_;
     service_code = service_code_;
     aws_region = aws_region_;
     desired_value = desired_value_;
   }
    : put_service_quota_increase_request_into_template_request)

let make_request_service_quota_increase_response
    ?requested_quota:(requested_quota_ : requested_service_quota_change option) () =
  ({ requested_quota = requested_quota_ } : request_service_quota_increase_response)

let make_request_service_quota_increase_request ?context_id:(context_id_ : quota_context_id option)
    ?support_case_allowed:(support_case_allowed_ : support_case_allowed option)
    ~service_code:(service_code_ : service_code) ~quota_code:(quota_code_ : quota_code)
    ~desired_value:(desired_value_ : quota_value) () =
  ({
     service_code = service_code_;
     quota_code = quota_code_;
     desired_value = desired_value_;
     context_id = context_id_;
     support_case_allowed = support_case_allowed_;
   }
    : request_service_quota_increase_request)

let make_update_auto_management_response () = (() : unit)

let make_update_auto_management_request ?opt_in_type:(opt_in_type_ : opt_in_type option)
    ?notification_arn:(notification_arn_ : amazon_resource_name option)
    ?exclusion_list:(exclusion_list_ : exclusion_list option) () =
  ({
     opt_in_type = opt_in_type_;
     notification_arn = notification_arn_;
     exclusion_list = exclusion_list_;
   }
    : update_auto_management_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : input_tag_keys) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tags:(tags_ : input_tags) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_stop_auto_management_response () = (() : unit)
let make_stop_auto_management_request () = (() : unit)

let make_start_quota_utilization_report_response ?report_id:(report_id_ : report_id option)
    ?status:(status_ : report_status option) ?message:(message_ : report_message option) () =
  ({ report_id = report_id_; status = status_; message = message_ }
    : start_quota_utilization_report_response)

let make_start_quota_utilization_report_request () = (() : unit)
let make_start_auto_management_response () = (() : unit)

let make_start_auto_management_request
    ?notification_arn:(notification_arn_ : amazon_resource_name option)
    ?exclusion_list:(exclusion_list_ : exclusion_list option)
    ~opt_in_level:(opt_in_level_ : opt_in_level) ~opt_in_type:(opt_in_type_ : opt_in_type) () =
  ({
     opt_in_level = opt_in_level_;
     opt_in_type = opt_in_type_;
     notification_arn = notification_arn_;
     exclusion_list = exclusion_list_;
   }
    : start_auto_management_request)
