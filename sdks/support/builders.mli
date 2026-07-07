open Types

val make_trusted_advisor_resources_summary :
  resources_suppressed:long ->
  resources_ignored:long ->
  resources_flagged:long ->
  resources_processed:long ->
  unit ->
  trusted_advisor_resources_summary

val make_trusted_advisor_resource_detail :
  ?is_suppressed:boolean_ ->
  ?region:string_ ->
  metadata:string_list ->
  resource_id:string_ ->
  status:string_ ->
  unit ->
  trusted_advisor_resource_detail

val make_trusted_advisor_cost_optimizing_summary :
  estimated_percent_monthly_savings:double ->
  estimated_monthly_savings:double ->
  unit ->
  trusted_advisor_cost_optimizing_summary

val make_trusted_advisor_category_specific_summary :
  ?cost_optimizing:trusted_advisor_cost_optimizing_summary ->
  unit ->
  trusted_advisor_category_specific_summary

val make_trusted_advisor_check_summary :
  ?has_flagged_resources:boolean_ ->
  category_specific_summary:trusted_advisor_category_specific_summary ->
  resources_summary:trusted_advisor_resources_summary ->
  status:string_ ->
  timestamp:string_ ->
  check_id:string_ ->
  unit ->
  trusted_advisor_check_summary

val make_trusted_advisor_check_refresh_status :
  millis_until_next_refreshable:long ->
  status:string_ ->
  check_id:string_ ->
  unit ->
  trusted_advisor_check_refresh_status

val make_trusted_advisor_check_description :
  metadata:string_list ->
  category:string_ ->
  description:string_ ->
  name:string_ ->
  id:string_ ->
  unit ->
  trusted_advisor_check_description

val make_supported_language :
  ?display:display -> ?language:language -> ?code:code -> unit -> supported_language

val make_supported_hour : ?end_time:end_time -> ?start_time:start_time -> unit -> supported_hour

val make_severity_level :
  ?name:severity_level_name -> ?code:severity_level_code -> unit -> severity_level

val make_category : ?name:category_name -> ?code:category_code -> unit -> category

val make_service :
  ?categories:category_list -> ?name:service_name -> ?code:service_code -> unit -> service

val make_resolve_case_response :
  ?final_case_status:case_status ->
  ?initial_case_status:case_status ->
  unit ->
  resolve_case_response

val make_resolve_case_request : ?case_id:case_id -> unit -> resolve_case_request

val make_refresh_trusted_advisor_check_response :
  status:trusted_advisor_check_refresh_status -> unit -> refresh_trusted_advisor_check_response

val make_refresh_trusted_advisor_check_request :
  check_id:string_ -> unit -> refresh_trusted_advisor_check_request

val make_attachment_details :
  ?file_name:file_name -> ?attachment_id:attachment_id -> unit -> attachment_details

val make_communication :
  ?attachment_set:attachment_set ->
  ?time_created:time_created ->
  ?submitted_by:submitted_by ->
  ?body:validated_communication_body ->
  ?case_id:case_id ->
  unit ->
  communication

val make_recent_case_communications :
  ?next_token:next_token -> ?communications:communication_list -> unit -> recent_case_communications

val make_describe_trusted_advisor_checks_response :
  checks:trusted_advisor_check_list -> unit -> describe_trusted_advisor_checks_response

val make_describe_trusted_advisor_checks_request :
  language:string_ -> unit -> describe_trusted_advisor_checks_request

val make_describe_trusted_advisor_check_summaries_response :
  summaries:trusted_advisor_check_summary_list ->
  unit ->
  describe_trusted_advisor_check_summaries_response

val make_describe_trusted_advisor_check_summaries_request :
  check_ids:string_list -> unit -> describe_trusted_advisor_check_summaries_request

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

val make_describe_supported_languages_response :
  ?supported_languages:supported_languages_list -> unit -> describe_supported_languages_response

val make_describe_supported_languages_request :
  category_code:validated_category_code ->
  service_code:validated_service_code ->
  issue_type:validated_issue_type_string ->
  unit ->
  describe_supported_languages_request

val make_describe_severity_levels_response :
  ?severity_levels:severity_levels_list -> unit -> describe_severity_levels_response

val make_describe_severity_levels_request :
  ?language:language -> unit -> describe_severity_levels_request

val make_describe_services_response : ?services:service_list -> unit -> describe_services_response

val make_describe_services_request :
  ?language:language -> ?service_code_list:service_code_list -> unit -> describe_services_request

val make_date_interval :
  ?end_date_time:validated_date_time ->
  ?start_date_time:validated_date_time ->
  unit ->
  date_interval

val make_communication_type_options :
  ?dates_without_support:dates_without_support_list ->
  ?supported_hours:supported_hours_list ->
  ?type_:type_ ->
  unit ->
  communication_type_options

val make_describe_create_case_options_response :
  ?communication_types:communication_type_options_list ->
  ?language_availability:validated_language_availability ->
  unit ->
  describe_create_case_options_response

val make_describe_create_case_options_request :
  category_code:category_code ->
  language:language ->
  service_code:service_code2 ->
  issue_type:issue_type ->
  unit ->
  describe_create_case_options_request

val make_describe_communications_response :
  ?next_token:next_token ->
  ?communications:communication_list ->
  unit ->
  describe_communications_response

val make_describe_communications_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?after_time:after_time ->
  ?before_time:before_time ->
  case_id:case_id ->
  unit ->
  describe_communications_request

val make_case_details :
  ?language:language ->
  ?cc_email_addresses:cc_email_address_list ->
  ?recent_communications:recent_case_communications ->
  ?time_created:time_created ->
  ?submitted_by:submitted_by ->
  ?severity_code:severity_code ->
  ?category_code:category_code ->
  ?service_code:service_code ->
  ?status:status ->
  ?subject:subject ->
  ?display_id:display_id ->
  ?case_id:case_id ->
  unit ->
  case_details

val make_describe_cases_response :
  ?next_token:next_token -> ?cases:case_list -> unit -> describe_cases_response

val make_describe_cases_request :
  ?include_communications:include_communications ->
  ?language:language ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?include_resolved_cases:include_resolved_cases ->
  ?before_time:before_time ->
  ?after_time:after_time ->
  ?display_id:display_id ->
  ?case_id_list:case_id_list ->
  unit ->
  describe_cases_request

val make_attachment : ?data:data -> ?file_name:file_name -> unit -> attachment

val make_describe_attachment_response :
  ?attachment:attachment -> unit -> describe_attachment_response

val make_describe_attachment_request :
  attachment_id:attachment_id -> unit -> describe_attachment_request

val make_create_case_response : ?case_id:case_id -> unit -> create_case_response

val make_create_case_request :
  ?attachment_set_id:attachment_set_id ->
  ?issue_type:issue_type ->
  ?language:language ->
  ?cc_email_addresses:cc_email_address_list ->
  ?category_code:category_code ->
  ?severity_code:severity_code ->
  ?service_code:service_code2 ->
  communication_body:communication_body ->
  subject:subject ->
  unit ->
  create_case_request

val make_add_communication_to_case_response :
  ?result_:result_ -> unit -> add_communication_to_case_response

val make_add_communication_to_case_request :
  ?attachment_set_id:attachment_set_id ->
  ?cc_email_addresses:cc_email_address_list ->
  ?case_id:case_id ->
  communication_body:communication_body ->
  unit ->
  add_communication_to_case_request

val make_add_attachments_to_set_response :
  ?expiry_time:expiry_time ->
  ?attachment_set_id:attachment_set_id ->
  unit ->
  add_attachments_to_set_response

val make_add_attachments_to_set_request :
  ?attachment_set_id:attachment_set_id ->
  attachments:attachments ->
  unit ->
  add_attachments_to_set_request
