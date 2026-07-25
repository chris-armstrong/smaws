open Types

let make_resolve_case_response ?initial_case_status:(initial_case_status_ : case_status option)
    ?final_case_status:(final_case_status_ : case_status option) () =
  ({ initial_case_status = initial_case_status_; final_case_status = final_case_status_ }
    : resolve_case_response)

let make_resolve_case_request ?case_id:(case_id_ : case_id option) () =
  ({ case_id = case_id_ } : resolve_case_request)

let make_trusted_advisor_check_refresh_status ~check_id:(check_id_ : string_)
    ~status:(status_ : string_)
    ~millis_until_next_refreshable:(millis_until_next_refreshable_ : long) () =
  ({
     check_id = check_id_;
     status = status_;
     millis_until_next_refreshable = millis_until_next_refreshable_;
   }
    : trusted_advisor_check_refresh_status)

let make_refresh_trusted_advisor_check_response
    ~status:(status_ : trusted_advisor_check_refresh_status) () =
  ({ status = status_ } : refresh_trusted_advisor_check_response)

let make_refresh_trusted_advisor_check_request ~check_id:(check_id_ : string_) () =
  ({ check_id = check_id_ } : refresh_trusted_advisor_check_request)

let make_trusted_advisor_cost_optimizing_summary
    ~estimated_monthly_savings:(estimated_monthly_savings_ : double)
    ~estimated_percent_monthly_savings:(estimated_percent_monthly_savings_ : double) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     estimated_percent_monthly_savings = estimated_percent_monthly_savings_;
   }
    : trusted_advisor_cost_optimizing_summary)

let make_trusted_advisor_category_specific_summary
    ?cost_optimizing:(cost_optimizing_ : trusted_advisor_cost_optimizing_summary option) () =
  ({ cost_optimizing = cost_optimizing_ } : trusted_advisor_category_specific_summary)

let make_trusted_advisor_resources_summary ~resources_processed:(resources_processed_ : long)
    ~resources_flagged:(resources_flagged_ : long) ~resources_ignored:(resources_ignored_ : long)
    ~resources_suppressed:(resources_suppressed_ : long) () =
  ({
     resources_processed = resources_processed_;
     resources_flagged = resources_flagged_;
     resources_ignored = resources_ignored_;
     resources_suppressed = resources_suppressed_;
   }
    : trusted_advisor_resources_summary)

let make_trusted_advisor_check_summary
    ?has_flagged_resources:(has_flagged_resources_ : boolean_ option)
    ~check_id:(check_id_ : string_) ~timestamp:(timestamp_ : string_) ~status:(status_ : string_)
    ~resources_summary:(resources_summary_ : trusted_advisor_resources_summary)
    ~category_specific_summary:
      (category_specific_summary_ : trusted_advisor_category_specific_summary) () =
  ({
     check_id = check_id_;
     timestamp = timestamp_;
     status = status_;
     has_flagged_resources = has_flagged_resources_;
     resources_summary = resources_summary_;
     category_specific_summary = category_specific_summary_;
   }
    : trusted_advisor_check_summary)

let make_describe_trusted_advisor_check_summaries_response
    ~summaries:(summaries_ : trusted_advisor_check_summary_list) () =
  ({ summaries = summaries_ } : describe_trusted_advisor_check_summaries_response)

let make_describe_trusted_advisor_check_summaries_request ~check_ids:(check_ids_ : string_list) () =
  ({ check_ids = check_ids_ } : describe_trusted_advisor_check_summaries_request)

let make_trusted_advisor_check_description ~id:(id_ : string_) ~name:(name_ : string_)
    ~description:(description_ : string_) ~category:(category_ : string_)
    ~metadata:(metadata_ : string_list) () =
  ({
     id = id_;
     name = name_;
     description = description_;
     category = category_;
     metadata = metadata_;
   }
    : trusted_advisor_check_description)

let make_describe_trusted_advisor_checks_response ~checks:(checks_ : trusted_advisor_check_list) ()
    =
  ({ checks = checks_ } : describe_trusted_advisor_checks_response)

let make_describe_trusted_advisor_checks_request ~language:(language_ : string_) () =
  ({ language = language_ } : describe_trusted_advisor_checks_request)

let make_trusted_advisor_resource_detail ?region:(region_ : string_ option)
    ?is_suppressed:(is_suppressed_ : boolean_ option) ~status:(status_ : string_)
    ~resource_id:(resource_id_ : string_) ~metadata:(metadata_ : string_list) () =
  ({
     status = status_;
     region = region_;
     resource_id = resource_id_;
     is_suppressed = is_suppressed_;
     metadata = metadata_;
   }
    : trusted_advisor_resource_detail)

let make_describe_trusted_advisor_check_result_response
    ?result_:(result__ : trusted_advisor_check_result option) () =
  ({ result_ = result__ } : describe_trusted_advisor_check_result_response)

let make_describe_trusted_advisor_check_result_request ?language:(language_ : string_ option)
    ~check_id:(check_id_ : string_) () =
  ({ check_id = check_id_; language = language_ } : describe_trusted_advisor_check_result_request)

let make_describe_trusted_advisor_check_refresh_statuses_response
    ~statuses:(statuses_ : trusted_advisor_check_refresh_status_list) () =
  ({ statuses = statuses_ } : describe_trusted_advisor_check_refresh_statuses_response)

let make_describe_trusted_advisor_check_refresh_statuses_request
    ~check_ids:(check_ids_ : string_list) () =
  ({ check_ids = check_ids_ } : describe_trusted_advisor_check_refresh_statuses_request)

let make_supported_language ?code:(code_ : code option) ?language:(language_ : language option)
    ?display:(display_ : display option) () =
  ({ code = code_; language = language_; display = display_ } : supported_language)

let make_describe_supported_languages_response
    ?supported_languages:(supported_languages_ : supported_languages_list option) () =
  ({ supported_languages = supported_languages_ } : describe_supported_languages_response)

let make_describe_supported_languages_request
    ~issue_type:(issue_type_ : validated_issue_type_string)
    ~service_code:(service_code_ : validated_service_code)
    ~category_code:(category_code_ : validated_category_code) () =
  ({ issue_type = issue_type_; service_code = service_code_; category_code = category_code_ }
    : describe_supported_languages_request)

let make_severity_level ?code:(code_ : severity_level_code option)
    ?name:(name_ : severity_level_name option) () =
  ({ code = code_; name = name_ } : severity_level)

let make_describe_severity_levels_response
    ?severity_levels:(severity_levels_ : severity_levels_list option) () =
  ({ severity_levels = severity_levels_ } : describe_severity_levels_response)

let make_describe_severity_levels_request ?language:(language_ : language option) () =
  ({ language = language_ } : describe_severity_levels_request)

let make_category ?code:(code_ : category_code option) ?name:(name_ : category_name option) () =
  ({ code = code_; name = name_ } : category)

let make_service ?code:(code_ : service_code option) ?name:(name_ : service_name option)
    ?categories:(categories_ : category_list option) () =
  ({ code = code_; name = name_; categories = categories_ } : service)

let make_describe_services_response ?services:(services_ : service_list option) () =
  ({ services = services_ } : describe_services_response)

let make_describe_services_request
    ?service_code_list:(service_code_list_ : service_code_list option)
    ?language:(language_ : language option) () =
  ({ service_code_list = service_code_list_; language = language_ } : describe_services_request)

let make_date_interval ?start_date_time:(start_date_time_ : validated_date_time option)
    ?end_date_time:(end_date_time_ : validated_date_time option) () =
  ({ start_date_time = start_date_time_; end_date_time = end_date_time_ } : date_interval)

let make_supported_hour ?start_time:(start_time_ : start_time option)
    ?end_time:(end_time_ : end_time option) () =
  ({ start_time = start_time_; end_time = end_time_ } : supported_hour)

let make_communication_type_options ?type_:(type__ : type_ option)
    ?supported_hours:(supported_hours_ : supported_hours_list option)
    ?dates_without_support:(dates_without_support_ : dates_without_support_list option) () =
  ({
     type_ = type__;
     supported_hours = supported_hours_;
     dates_without_support = dates_without_support_;
   }
    : communication_type_options)

let make_describe_create_case_options_response
    ?language_availability:(language_availability_ : validated_language_availability option)
    ?communication_types:(communication_types_ : communication_type_options_list option) () =
  ({ language_availability = language_availability_; communication_types = communication_types_ }
    : describe_create_case_options_response)

let make_describe_create_case_options_request ~issue_type:(issue_type_ : issue_type)
    ~service_code:(service_code_ : service_code2) ~language:(language_ : language)
    ~category_code:(category_code_ : category_code) () =
  ({
     issue_type = issue_type_;
     service_code = service_code_;
     language = language_;
     category_code = category_code_;
   }
    : describe_create_case_options_request)

let make_attachment_details ?attachment_id:(attachment_id_ : attachment_id option)
    ?file_name:(file_name_ : file_name option) () =
  ({ attachment_id = attachment_id_; file_name = file_name_ } : attachment_details)

let make_communication ?case_id:(case_id_ : case_id option)
    ?body:(body_ : validated_communication_body option)
    ?submitted_by:(submitted_by_ : submitted_by option)
    ?time_created:(time_created_ : time_created option)
    ?attachment_set:(attachment_set_ : attachment_set option) () =
  ({
     case_id = case_id_;
     body = body_;
     submitted_by = submitted_by_;
     time_created = time_created_;
     attachment_set = attachment_set_;
   }
    : communication)

let make_describe_communications_response
    ?communications:(communications_ : communication_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ communications = communications_; next_token = next_token_ }
    : describe_communications_response)

let make_describe_communications_request ?before_time:(before_time_ : before_time option)
    ?after_time:(after_time_ : after_time option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~case_id:(case_id_ : case_id) () =
  ({
     case_id = case_id_;
     before_time = before_time_;
     after_time = after_time_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_communications_request)

let make_recent_case_communications ?communications:(communications_ : communication_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ communications = communications_; next_token = next_token_ } : recent_case_communications)

let make_case_details ?case_id:(case_id_ : case_id option)
    ?display_id:(display_id_ : display_id option) ?subject:(subject_ : subject option)
    ?status:(status_ : status option) ?service_code:(service_code_ : service_code option)
    ?category_code:(category_code_ : category_code option)
    ?severity_code:(severity_code_ : severity_code option)
    ?submitted_by:(submitted_by_ : submitted_by option)
    ?time_created:(time_created_ : time_created option)
    ?recent_communications:(recent_communications_ : recent_case_communications option)
    ?cc_email_addresses:(cc_email_addresses_ : cc_email_address_list option)
    ?language:(language_ : language option) () =
  ({
     case_id = case_id_;
     display_id = display_id_;
     subject = subject_;
     status = status_;
     service_code = service_code_;
     category_code = category_code_;
     severity_code = severity_code_;
     submitted_by = submitted_by_;
     time_created = time_created_;
     recent_communications = recent_communications_;
     cc_email_addresses = cc_email_addresses_;
     language = language_;
   }
    : case_details)

let make_describe_cases_response ?cases:(cases_ : case_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ cases = cases_; next_token = next_token_ } : describe_cases_response)

let make_describe_cases_request ?case_id_list:(case_id_list_ : case_id_list option)
    ?display_id:(display_id_ : display_id option) ?after_time:(after_time_ : after_time option)
    ?before_time:(before_time_ : before_time option)
    ?include_resolved_cases:(include_resolved_cases_ : include_resolved_cases option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?language:(language_ : language option)
    ?include_communications:(include_communications_ : include_communications option) () =
  ({
     case_id_list = case_id_list_;
     display_id = display_id_;
     after_time = after_time_;
     before_time = before_time_;
     include_resolved_cases = include_resolved_cases_;
     next_token = next_token_;
     max_results = max_results_;
     language = language_;
     include_communications = include_communications_;
   }
    : describe_cases_request)

let make_attachment ?file_name:(file_name_ : file_name option) ?data:(data_ : data option) () =
  ({ file_name = file_name_; data = data_ } : attachment)

let make_describe_attachment_response ?attachment:(attachment_ : attachment option) () =
  ({ attachment = attachment_ } : describe_attachment_response)

let make_describe_attachment_request ~attachment_id:(attachment_id_ : attachment_id) () =
  ({ attachment_id = attachment_id_ } : describe_attachment_request)

let make_create_case_response ?case_id:(case_id_ : case_id option) () =
  ({ case_id = case_id_ } : create_case_response)

let make_create_case_request ?service_code:(service_code_ : service_code2 option)
    ?severity_code:(severity_code_ : severity_code option)
    ?category_code:(category_code_ : category_code option)
    ?cc_email_addresses:(cc_email_addresses_ : cc_email_address_list option)
    ?language:(language_ : language option) ?issue_type:(issue_type_ : issue_type option)
    ?attachment_set_id:(attachment_set_id_ : attachment_set_id option) ~subject:(subject_ : subject)
    ~communication_body:(communication_body_ : communication_body) () =
  ({
     subject = subject_;
     service_code = service_code_;
     severity_code = severity_code_;
     category_code = category_code_;
     communication_body = communication_body_;
     cc_email_addresses = cc_email_addresses_;
     language = language_;
     issue_type = issue_type_;
     attachment_set_id = attachment_set_id_;
   }
    : create_case_request)

let make_add_communication_to_case_response ?result_:(result__ : result_ option) () =
  ({ result_ = result__ } : add_communication_to_case_response)

let make_add_communication_to_case_request ?case_id:(case_id_ : case_id option)
    ?cc_email_addresses:(cc_email_addresses_ : cc_email_address_list option)
    ?attachment_set_id:(attachment_set_id_ : attachment_set_id option)
    ~communication_body:(communication_body_ : communication_body) () =
  ({
     case_id = case_id_;
     communication_body = communication_body_;
     cc_email_addresses = cc_email_addresses_;
     attachment_set_id = attachment_set_id_;
   }
    : add_communication_to_case_request)

let make_add_attachments_to_set_response
    ?attachment_set_id:(attachment_set_id_ : attachment_set_id option)
    ?expiry_time:(expiry_time_ : expiry_time option) () =
  ({ attachment_set_id = attachment_set_id_; expiry_time = expiry_time_ }
    : add_attachments_to_set_response)

let make_add_attachments_to_set_request
    ?attachment_set_id:(attachment_set_id_ : attachment_set_id option)
    ~attachments:(attachments_ : attachments) () =
  ({ attachment_set_id = attachment_set_id_; attachments = attachments_ }
    : add_attachments_to_set_request)
