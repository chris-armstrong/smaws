open Types

val make_resolve_case_response :
  ?initial_case_status:case_status ->
  ?final_case_status:case_status ->
  unit ->
  resolve_case_response

val make_resolve_case_request : ?case_id:case_id -> unit -> resolve_case_request

val make_trusted_advisor_check_refresh_status :
  check_id:string_ ->
  status:string_ ->
  millis_until_next_refreshable:long ->
  unit ->
  trusted_advisor_check_refresh_status

val make_refresh_trusted_advisor_check_response :
  status:trusted_advisor_check_refresh_status -> unit -> refresh_trusted_advisor_check_response

val make_refresh_trusted_advisor_check_request :
  check_id:string_ -> unit -> refresh_trusted_advisor_check_request

val make_trusted_advisor_cost_optimizing_summary :
  estimated_monthly_savings:double ->
  estimated_percent_monthly_savings:double ->
  unit ->
  trusted_advisor_cost_optimizing_summary

val make_trusted_advisor_category_specific_summary :
  ?cost_optimizing:trusted_advisor_cost_optimizing_summary ->
  unit ->
  trusted_advisor_category_specific_summary

val make_trusted_advisor_resources_summary :
  resources_processed:long ->
  resources_flagged:long ->
  resources_ignored:long ->
  resources_suppressed:long ->
  unit ->
  trusted_advisor_resources_summary

val make_trusted_advisor_check_summary :
  ?has_flagged_resources:boolean_ ->
  check_id:string_ ->
  timestamp:string_ ->
  status:string_ ->
  resources_summary:trusted_advisor_resources_summary ->
  category_specific_summary:trusted_advisor_category_specific_summary ->
  unit ->
  trusted_advisor_check_summary

val make_describe_trusted_advisor_check_summaries_response :
  summaries:trusted_advisor_check_summary_list ->
  unit ->
  describe_trusted_advisor_check_summaries_response

val make_describe_trusted_advisor_check_summaries_request :
  check_ids:string_list -> unit -> describe_trusted_advisor_check_summaries_request

val make_trusted_advisor_check_description :
  id:string_ ->
  name:string_ ->
  description:string_ ->
  category:string_ ->
  metadata:string_list ->
  unit ->
  trusted_advisor_check_description

val make_describe_trusted_advisor_checks_response :
  checks:trusted_advisor_check_list -> unit -> describe_trusted_advisor_checks_response

val make_describe_trusted_advisor_checks_request :
  language:string_ -> unit -> describe_trusted_advisor_checks_request

val make_trusted_advisor_resource_detail :
  ?region:string_ ->
  ?is_suppressed:boolean_ ->
  status:string_ ->
  resource_id:string_ ->
  metadata:string_list ->
  unit ->
  trusted_advisor_resource_detail

val make_describe_trusted_advisor_check_result_response :
  ?result_:trusted_advisor_check_result -> unit -> describe_trusted_advisor_check_result_response

val make_describe_trusted_advisor_check_result_request :
  ?language:string_ -> check_id:string_ -> unit -> describe_trusted_advisor_check_result_request

val make_describe_trusted_advisor_check_refresh_statuses_response :
  statuses:trusted_advisor_check_refresh_status_list ->
  unit ->
  describe_trusted_advisor_check_refresh_statuses_response

val make_describe_trusted_advisor_check_refresh_statuses_request :
  check_ids:string_list -> unit -> describe_trusted_advisor_check_refresh_statuses_request

val make_supported_language :
  ?code:code -> ?language:language -> ?display:display -> unit -> supported_language

val make_describe_supported_languages_response :
  ?supported_languages:supported_languages_list -> unit -> describe_supported_languages_response

val make_describe_supported_languages_request :
  issue_type:validated_issue_type_string ->
  service_code:validated_service_code ->
  category_code:validated_category_code ->
  unit ->
  describe_supported_languages_request

val make_severity_level :
  ?code:severity_level_code -> ?name:severity_level_name -> unit -> severity_level

val make_describe_severity_levels_response :
  ?severity_levels:severity_levels_list -> unit -> describe_severity_levels_response

val make_describe_severity_levels_request :
  ?language:language -> unit -> describe_severity_levels_request

val make_category : ?code:category_code -> ?name:category_name -> unit -> category

val make_service :
  ?code:service_code -> ?name:service_name -> ?categories:category_list -> unit -> service

val make_describe_services_response : ?services:service_list -> unit -> describe_services_response

val make_describe_services_request :
  ?service_code_list:service_code_list -> ?language:language -> unit -> describe_services_request

val make_date_interval :
  ?start_date_time:validated_date_time ->
  ?end_date_time:validated_date_time ->
  unit ->
  date_interval

val make_supported_hour : ?start_time:start_time -> ?end_time:end_time -> unit -> supported_hour

val make_communication_type_options :
  ?type_:type_ ->
  ?supported_hours:supported_hours_list ->
  ?dates_without_support:dates_without_support_list ->
  unit ->
  communication_type_options

val make_describe_create_case_options_response :
  ?language_availability:validated_language_availability ->
  ?communication_types:communication_type_options_list ->
  unit ->
  describe_create_case_options_response

val make_describe_create_case_options_request :
  issue_type:issue_type ->
  service_code:service_code2 ->
  language:language ->
  category_code:category_code ->
  unit ->
  describe_create_case_options_request

val make_attachment_details :
  ?attachment_id:attachment_id -> ?file_name:file_name -> unit -> attachment_details

val make_communication :
  ?case_id:case_id ->
  ?body:validated_communication_body ->
  ?submitted_by:submitted_by ->
  ?time_created:time_created ->
  ?attachment_set:attachment_set ->
  unit ->
  communication

val make_describe_communications_response :
  ?communications:communication_list ->
  ?next_token:next_token ->
  unit ->
  describe_communications_response

val make_describe_communications_request :
  ?before_time:before_time ->
  ?after_time:after_time ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  case_id:case_id ->
  unit ->
  describe_communications_request

val make_recent_case_communications :
  ?communications:communication_list -> ?next_token:next_token -> unit -> recent_case_communications

val make_case_details :
  ?case_id:case_id ->
  ?display_id:display_id ->
  ?subject:subject ->
  ?status:status ->
  ?service_code:service_code ->
  ?category_code:category_code ->
  ?severity_code:severity_code ->
  ?submitted_by:submitted_by ->
  ?time_created:time_created ->
  ?recent_communications:recent_case_communications ->
  ?cc_email_addresses:cc_email_address_list ->
  ?language:language ->
  unit ->
  case_details

val make_describe_cases_response :
  ?cases:case_list -> ?next_token:next_token -> unit -> describe_cases_response

val make_describe_cases_request :
  ?case_id_list:case_id_list ->
  ?display_id:display_id ->
  ?after_time:after_time ->
  ?before_time:before_time ->
  ?include_resolved_cases:include_resolved_cases ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?language:language ->
  ?include_communications:include_communications ->
  unit ->
  describe_cases_request

val make_attachment : ?file_name:file_name -> ?data:data -> unit -> attachment

val make_describe_attachment_response :
  ?attachment:attachment -> unit -> describe_attachment_response

val make_describe_attachment_request :
  attachment_id:attachment_id -> unit -> describe_attachment_request

val make_create_case_response : ?case_id:case_id -> unit -> create_case_response

val make_create_case_request :
  ?service_code:service_code2 ->
  ?severity_code:severity_code ->
  ?category_code:category_code ->
  ?cc_email_addresses:cc_email_address_list ->
  ?language:language ->
  ?issue_type:issue_type ->
  ?attachment_set_id:attachment_set_id ->
  subject:subject ->
  communication_body:communication_body ->
  unit ->
  create_case_request

val make_add_communication_to_case_response :
  ?result_:result_ -> unit -> add_communication_to_case_response

val make_add_communication_to_case_request :
  ?case_id:case_id ->
  ?cc_email_addresses:cc_email_address_list ->
  ?attachment_set_id:attachment_set_id ->
  communication_body:communication_body ->
  unit ->
  add_communication_to_case_request

val make_add_attachments_to_set_response :
  ?attachment_set_id:attachment_set_id ->
  ?expiry_time:expiry_time ->
  unit ->
  add_attachments_to_set_response

val make_add_attachments_to_set_request :
  ?attachment_set_id:attachment_set_id ->
  attachments:attachments ->
  unit ->
  add_attachments_to_set_request
