open Types

let make_trusted_advisor_resources_summary ~resources_suppressed:(resources_suppressed_ : long)
    ~resources_ignored:(resources_ignored_ : long) ~resources_flagged:(resources_flagged_ : long)
    ~resources_processed:(resources_processed_ : long) () =
  ({
     resources_suppressed = resources_suppressed_;
     resources_ignored = resources_ignored_;
     resources_flagged = resources_flagged_;
     resources_processed = resources_processed_;
   }
    : trusted_advisor_resources_summary)

let make_trusted_advisor_resource_detail ?is_suppressed:(is_suppressed_ : boolean_ option)
    ?region:(region_ : string_ option) ~metadata:(metadata_ : string_list)
    ~resource_id:(resource_id_ : string_) ~status:(status_ : string_) () =
  ({
     metadata = metadata_;
     is_suppressed = is_suppressed_;
     resource_id = resource_id_;
     region = region_;
     status = status_;
   }
    : trusted_advisor_resource_detail)

let make_trusted_advisor_cost_optimizing_summary
    ~estimated_percent_monthly_savings:(estimated_percent_monthly_savings_ : double)
    ~estimated_monthly_savings:(estimated_monthly_savings_ : double) () =
  ({
     estimated_percent_monthly_savings = estimated_percent_monthly_savings_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : trusted_advisor_cost_optimizing_summary)

let make_trusted_advisor_category_specific_summary
    ?cost_optimizing:(cost_optimizing_ : trusted_advisor_cost_optimizing_summary option) () =
  ({ cost_optimizing = cost_optimizing_ } : trusted_advisor_category_specific_summary)

let make_trusted_advisor_check_summary
    ?has_flagged_resources:(has_flagged_resources_ : boolean_ option)
    ~category_specific_summary:
      (category_specific_summary_ : trusted_advisor_category_specific_summary)
    ~resources_summary:(resources_summary_ : trusted_advisor_resources_summary)
    ~status:(status_ : string_) ~timestamp:(timestamp_ : string_) ~check_id:(check_id_ : string_) ()
    =
  ({
     category_specific_summary = category_specific_summary_;
     resources_summary = resources_summary_;
     has_flagged_resources = has_flagged_resources_;
     status = status_;
     timestamp = timestamp_;
     check_id = check_id_;
   }
    : trusted_advisor_check_summary)

let make_trusted_advisor_check_refresh_status
    ~millis_until_next_refreshable:(millis_until_next_refreshable_ : long)
    ~status:(status_ : string_) ~check_id:(check_id_ : string_) () =
  ({
     millis_until_next_refreshable = millis_until_next_refreshable_;
     status = status_;
     check_id = check_id_;
   }
    : trusted_advisor_check_refresh_status)

let make_trusted_advisor_check_description ~metadata:(metadata_ : string_list)
    ~category:(category_ : string_) ~description:(description_ : string_) ~name:(name_ : string_)
    ~id:(id_ : string_) () =
  ({
     metadata = metadata_;
     category = category_;
     description = description_;
     name = name_;
     id = id_;
   }
    : trusted_advisor_check_description)

let make_supported_language ?display:(display_ : display option)
    ?language:(language_ : language option) ?code:(code_ : code option) () =
  ({ display = display_; language = language_; code = code_ } : supported_language)

let make_supported_hour ?end_time:(end_time_ : end_time option)
    ?start_time:(start_time_ : start_time option) () =
  ({ end_time = end_time_; start_time = start_time_ } : supported_hour)

let make_severity_level ?name:(name_ : severity_level_name option)
    ?code:(code_ : severity_level_code option) () =
  ({ name = name_; code = code_ } : severity_level)

let make_category ?name:(name_ : category_name option) ?code:(code_ : category_code option) () =
  ({ name = name_; code = code_ } : category)

let make_service ?categories:(categories_ : category_list option)
    ?name:(name_ : service_name option) ?code:(code_ : service_code option) () =
  ({ categories = categories_; name = name_; code = code_ } : service)

let make_resolve_case_response ?final_case_status:(final_case_status_ : case_status option)
    ?initial_case_status:(initial_case_status_ : case_status option) () =
  ({ final_case_status = final_case_status_; initial_case_status = initial_case_status_ }
    : resolve_case_response)

let make_resolve_case_request ?case_id:(case_id_ : case_id option) () =
  ({ case_id = case_id_ } : resolve_case_request)

let make_refresh_trusted_advisor_check_response
    ~status:(status_ : trusted_advisor_check_refresh_status) () =
  ({ status = status_ } : refresh_trusted_advisor_check_response)

let make_refresh_trusted_advisor_check_request ~check_id:(check_id_ : string_) () =
  ({ check_id = check_id_ } : refresh_trusted_advisor_check_request)

let make_attachment_details ?file_name:(file_name_ : file_name option)
    ?attachment_id:(attachment_id_ : attachment_id option) () =
  ({ file_name = file_name_; attachment_id = attachment_id_ } : attachment_details)

let make_communication ?attachment_set:(attachment_set_ : attachment_set option)
    ?time_created:(time_created_ : time_created option)
    ?submitted_by:(submitted_by_ : submitted_by option)
    ?body:(body_ : validated_communication_body option) ?case_id:(case_id_ : case_id option) () =
  ({
     attachment_set = attachment_set_;
     time_created = time_created_;
     submitted_by = submitted_by_;
     body = body_;
     case_id = case_id_;
   }
    : communication)

let make_recent_case_communications ?next_token:(next_token_ : next_token option)
    ?communications:(communications_ : communication_list option) () =
  ({ next_token = next_token_; communications = communications_ } : recent_case_communications)

let make_describe_trusted_advisor_checks_response ~checks:(checks_ : trusted_advisor_check_list) ()
    =
  ({ checks = checks_ } : describe_trusted_advisor_checks_response)

let make_describe_trusted_advisor_checks_request ~language:(language_ : string_) () =
  ({ language = language_ } : describe_trusted_advisor_checks_request)

let make_describe_trusted_advisor_check_summaries_response
    ~summaries:(summaries_ : trusted_advisor_check_summary_list) () =
  ({ summaries = summaries_ } : describe_trusted_advisor_check_summaries_response)

let make_describe_trusted_advisor_check_summaries_request ~check_ids:(check_ids_ : string_list) () =
  ({ check_ids = check_ids_ } : describe_trusted_advisor_check_summaries_request)

let make_describe_trusted_advisor_check_result_response
    ?result_:(result__ : trusted_advisor_check_result option) () =
  ({ result_ = result__ } : describe_trusted_advisor_check_result_response)

let make_describe_trusted_advisor_check_result_request ?language:(language_ : string_ option)
    ~check_id:(check_id_ : string_) () =
  ({ language = language_; check_id = check_id_ } : describe_trusted_advisor_check_result_request)

let make_describe_trusted_advisor_check_refresh_statuses_response
    ~statuses:(statuses_ : trusted_advisor_check_refresh_status_list) () =
  ({ statuses = statuses_ } : describe_trusted_advisor_check_refresh_statuses_response)

let make_describe_trusted_advisor_check_refresh_statuses_request
    ~check_ids:(check_ids_ : string_list) () =
  ({ check_ids = check_ids_ } : describe_trusted_advisor_check_refresh_statuses_request)

let make_describe_supported_languages_response
    ?supported_languages:(supported_languages_ : supported_languages_list option) () =
  ({ supported_languages = supported_languages_ } : describe_supported_languages_response)

let make_describe_supported_languages_request
    ~category_code:(category_code_ : validated_category_code)
    ~service_code:(service_code_ : validated_service_code)
    ~issue_type:(issue_type_ : validated_issue_type_string) () =
  ({ category_code = category_code_; service_code = service_code_; issue_type = issue_type_ }
    : describe_supported_languages_request)

let make_describe_severity_levels_response
    ?severity_levels:(severity_levels_ : severity_levels_list option) () =
  ({ severity_levels = severity_levels_ } : describe_severity_levels_response)

let make_describe_severity_levels_request ?language:(language_ : language option) () =
  ({ language = language_ } : describe_severity_levels_request)

let make_describe_services_response ?services:(services_ : service_list option) () =
  ({ services = services_ } : describe_services_response)

let make_describe_services_request ?language:(language_ : language option)
    ?service_code_list:(service_code_list_ : service_code_list option) () =
  ({ language = language_; service_code_list = service_code_list_ } : describe_services_request)

let make_date_interval ?end_date_time:(end_date_time_ : validated_date_time option)
    ?start_date_time:(start_date_time_ : validated_date_time option) () =
  ({ end_date_time = end_date_time_; start_date_time = start_date_time_ } : date_interval)

let make_communication_type_options
    ?dates_without_support:(dates_without_support_ : dates_without_support_list option)
    ?supported_hours:(supported_hours_ : supported_hours_list option) ?type_:(type__ : type_ option)
    () =
  ({
     dates_without_support = dates_without_support_;
     supported_hours = supported_hours_;
     type_ = type__;
   }
    : communication_type_options)

let make_describe_create_case_options_response
    ?communication_types:(communication_types_ : communication_type_options_list option)
    ?language_availability:(language_availability_ : validated_language_availability option) () =
  ({ communication_types = communication_types_; language_availability = language_availability_ }
    : describe_create_case_options_response)

let make_describe_create_case_options_request ~category_code:(category_code_ : category_code)
    ~language:(language_ : language) ~service_code:(service_code_ : service_code2)
    ~issue_type:(issue_type_ : issue_type) () =
  ({
     category_code = category_code_;
     language = language_;
     service_code = service_code_;
     issue_type = issue_type_;
   }
    : describe_create_case_options_request)

let make_describe_communications_response ?next_token:(next_token_ : next_token option)
    ?communications:(communications_ : communication_list option) () =
  ({ next_token = next_token_; communications = communications_ }
    : describe_communications_response)

let make_describe_communications_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?after_time:(after_time_ : after_time option)
    ?before_time:(before_time_ : before_time option) ~case_id:(case_id_ : case_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     after_time = after_time_;
     before_time = before_time_;
     case_id = case_id_;
   }
    : describe_communications_request)

let make_case_details ?language:(language_ : language option)
    ?cc_email_addresses:(cc_email_addresses_ : cc_email_address_list option)
    ?recent_communications:(recent_communications_ : recent_case_communications option)
    ?time_created:(time_created_ : time_created option)
    ?submitted_by:(submitted_by_ : submitted_by option)
    ?severity_code:(severity_code_ : severity_code option)
    ?category_code:(category_code_ : category_code option)
    ?service_code:(service_code_ : service_code option) ?status:(status_ : status option)
    ?subject:(subject_ : subject option) ?display_id:(display_id_ : display_id option)
    ?case_id:(case_id_ : case_id option) () =
  ({
     language = language_;
     cc_email_addresses = cc_email_addresses_;
     recent_communications = recent_communications_;
     time_created = time_created_;
     submitted_by = submitted_by_;
     severity_code = severity_code_;
     category_code = category_code_;
     service_code = service_code_;
     status = status_;
     subject = subject_;
     display_id = display_id_;
     case_id = case_id_;
   }
    : case_details)

let make_describe_cases_response ?next_token:(next_token_ : next_token option)
    ?cases:(cases_ : case_list option) () =
  ({ next_token = next_token_; cases = cases_ } : describe_cases_response)

let make_describe_cases_request
    ?include_communications:(include_communications_ : include_communications option)
    ?language:(language_ : language option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?include_resolved_cases:(include_resolved_cases_ : include_resolved_cases option)
    ?before_time:(before_time_ : before_time option) ?after_time:(after_time_ : after_time option)
    ?display_id:(display_id_ : display_id option)
    ?case_id_list:(case_id_list_ : case_id_list option) () =
  ({
     include_communications = include_communications_;
     language = language_;
     max_results = max_results_;
     next_token = next_token_;
     include_resolved_cases = include_resolved_cases_;
     before_time = before_time_;
     after_time = after_time_;
     display_id = display_id_;
     case_id_list = case_id_list_;
   }
    : describe_cases_request)

let make_attachment ?data:(data_ : data option) ?file_name:(file_name_ : file_name option) () =
  ({ data = data_; file_name = file_name_ } : attachment)

let make_describe_attachment_response ?attachment:(attachment_ : attachment option) () =
  ({ attachment = attachment_ } : describe_attachment_response)

let make_describe_attachment_request ~attachment_id:(attachment_id_ : attachment_id) () =
  ({ attachment_id = attachment_id_ } : describe_attachment_request)

let make_create_case_response ?case_id:(case_id_ : case_id option) () =
  ({ case_id = case_id_ } : create_case_response)

let make_create_case_request ?attachment_set_id:(attachment_set_id_ : attachment_set_id option)
    ?issue_type:(issue_type_ : issue_type option) ?language:(language_ : language option)
    ?cc_email_addresses:(cc_email_addresses_ : cc_email_address_list option)
    ?category_code:(category_code_ : category_code option)
    ?severity_code:(severity_code_ : severity_code option)
    ?service_code:(service_code_ : service_code2 option)
    ~communication_body:(communication_body_ : communication_body) ~subject:(subject_ : subject) ()
    =
  ({
     attachment_set_id = attachment_set_id_;
     issue_type = issue_type_;
     language = language_;
     cc_email_addresses = cc_email_addresses_;
     communication_body = communication_body_;
     category_code = category_code_;
     severity_code = severity_code_;
     service_code = service_code_;
     subject = subject_;
   }
    : create_case_request)

let make_add_communication_to_case_response ?result_:(result__ : result_ option) () =
  ({ result_ = result__ } : add_communication_to_case_response)

let make_add_communication_to_case_request
    ?attachment_set_id:(attachment_set_id_ : attachment_set_id option)
    ?cc_email_addresses:(cc_email_addresses_ : cc_email_address_list option)
    ?case_id:(case_id_ : case_id option)
    ~communication_body:(communication_body_ : communication_body) () =
  ({
     attachment_set_id = attachment_set_id_;
     cc_email_addresses = cc_email_addresses_;
     communication_body = communication_body_;
     case_id = case_id_;
   }
    : add_communication_to_case_request)

let make_add_attachments_to_set_response ?expiry_time:(expiry_time_ : expiry_time option)
    ?attachment_set_id:(attachment_set_id_ : attachment_set_id option) () =
  ({ expiry_time = expiry_time_; attachment_set_id = attachment_set_id_ }
    : add_attachments_to_set_response)

let make_add_attachments_to_set_request
    ?attachment_set_id:(attachment_set_id_ : attachment_set_id option)
    ~attachments:(attachments_ : attachments) () =
  ({ attachments = attachments_; attachment_set_id = attachment_set_id_ }
    : add_attachments_to_set_request)
