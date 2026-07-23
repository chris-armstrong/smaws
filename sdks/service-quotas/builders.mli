open Types

val make_associate_service_quota_template_response : unit -> unit
val make_associate_service_quota_template_request : unit -> unit
val make_create_support_case_response : unit -> unit
val make_create_support_case_request : request_id:request_id -> unit -> create_support_case_request
val make_delete_service_quota_increase_request_from_template_response : unit -> unit

val make_delete_service_quota_increase_request_from_template_request :
  service_code:service_code ->
  quota_code:quota_code ->
  aws_region:aws_region ->
  unit ->
  delete_service_quota_increase_request_from_template_request

val make_disassociate_service_quota_template_response : unit -> unit
val make_disassociate_service_quota_template_request : unit -> unit

val make_error_reason :
  ?error_code:error_code -> ?error_message:error_message -> unit -> error_reason

val make_quota_info : ?quota_code:quota_code -> ?quota_name:quota_name -> unit -> quota_info

val make_quota_context_info :
  ?context_scope:quota_context_scope ->
  ?context_scope_type:quota_context_scope_type ->
  ?context_id:quota_context_id ->
  unit ->
  quota_context_info

val make_quota_period :
  ?period_value:period_value -> ?period_unit:period_unit -> unit -> quota_period

val make_metric_info :
  ?metric_namespace:quota_metric_namespace ->
  ?metric_name:quota_metric_name ->
  ?metric_dimensions:metric_dimensions_map_definition ->
  ?metric_statistic_recommendation:statistic ->
  unit ->
  metric_info

val make_service_quota :
  ?service_code:service_code ->
  ?service_name:service_name ->
  ?quota_arn:quota_arn ->
  ?quota_code:quota_code ->
  ?quota_name:quota_name ->
  ?value:quota_value ->
  ?unit_:quota_unit ->
  ?adjustable:quota_adjustable ->
  ?global_quota:global_quota ->
  ?usage_metric:metric_info ->
  ?period:quota_period ->
  ?error_reason:error_reason ->
  ?quota_applied_at_level:applied_level_enum ->
  ?quota_context:quota_context_info ->
  ?description:quota_description ->
  unit ->
  service_quota

val make_get_aws_default_service_quota_response :
  ?quota:service_quota -> unit -> get_aws_default_service_quota_response

val make_get_aws_default_service_quota_request :
  service_code:service_code ->
  quota_code:quota_code ->
  unit ->
  get_aws_default_service_quota_request

val make_get_association_for_service_quota_template_response :
  ?service_quota_template_association_status:service_quota_template_association_status ->
  unit ->
  get_association_for_service_quota_template_response

val make_get_association_for_service_quota_template_request : unit -> unit

val make_get_auto_management_configuration_response :
  ?opt_in_level:opt_in_level ->
  ?opt_in_type:opt_in_type ->
  ?notification_arn:amazon_resource_name ->
  ?opt_in_status:opt_in_status ->
  ?exclusion_list:exclusion_quota_list ->
  unit ->
  get_auto_management_configuration_response

val make_get_auto_management_configuration_request : unit -> unit

val make_quota_utilization_info :
  ?quota_code:quota_code ->
  ?service_code:service_code ->
  ?quota_name:quota_name ->
  ?namespace:quota_metric_namespace ->
  ?utilization:utilization_pct ->
  ?default_value:default_value ->
  ?applied_value:applied_value ->
  ?service_name:service_name ->
  ?adjustable:quota_adjustable ->
  unit ->
  quota_utilization_info

val make_get_quota_utilization_report_response :
  ?report_id:report_id ->
  ?status:report_status ->
  ?generated_at:date_time ->
  ?total_count:total_count ->
  ?quotas:quota_utilization_info_list ->
  ?next_token:next_token ->
  ?error_code:report_error_code ->
  ?error_message:report_error_message ->
  unit ->
  get_quota_utilization_report_response

val make_get_quota_utilization_report_request :
  ?next_token:next_token ->
  ?max_results:max_results_utilization ->
  report_id:report_id ->
  unit ->
  get_quota_utilization_report_request

val make_requested_service_quota_change :
  ?id:request_id ->
  ?request_type:request_type ->
  ?case_id:customer_service_engagement_id ->
  ?service_code:service_code ->
  ?service_name:service_name ->
  ?quota_code:quota_code ->
  ?quota_name:quota_name ->
  ?desired_value:quota_value ->
  ?status:request_status ->
  ?created:date_time ->
  ?last_updated:date_time ->
  ?requester:requester ->
  ?quota_arn:quota_arn ->
  ?global_quota:global_quota ->
  ?unit_:quota_unit ->
  ?quota_requested_at_level:applied_level_enum ->
  ?quota_context:quota_context_info ->
  unit ->
  requested_service_quota_change

val make_get_requested_service_quota_change_response :
  ?requested_quota:requested_service_quota_change ->
  unit ->
  get_requested_service_quota_change_response

val make_get_requested_service_quota_change_request :
  request_id:request_id -> unit -> get_requested_service_quota_change_request

val make_get_service_quota_response : ?quota:service_quota -> unit -> get_service_quota_response

val make_get_service_quota_request :
  ?context_id:quota_context_id ->
  service_code:service_code ->
  quota_code:quota_code ->
  unit ->
  get_service_quota_request

val make_service_quota_increase_request_in_template :
  ?service_code:service_code ->
  ?service_name:service_name ->
  ?quota_code:quota_code ->
  ?quota_name:quota_name ->
  ?desired_value:quota_value ->
  ?aws_region:aws_region ->
  ?unit_:quota_unit ->
  ?global_quota:global_quota ->
  unit ->
  service_quota_increase_request_in_template

val make_get_service_quota_increase_request_from_template_response :
  ?service_quota_increase_request_in_template:service_quota_increase_request_in_template ->
  unit ->
  get_service_quota_increase_request_from_template_response

val make_get_service_quota_increase_request_from_template_request :
  service_code:service_code ->
  quota_code:quota_code ->
  aws_region:aws_region ->
  unit ->
  get_service_quota_increase_request_from_template_request

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_list_aws_default_service_quotas_response :
  ?next_token:next_token ->
  ?quotas:service_quota_list_definition ->
  unit ->
  list_aws_default_service_quotas_response

val make_list_aws_default_service_quotas_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  service_code:service_code ->
  unit ->
  list_aws_default_service_quotas_request

val make_list_requested_service_quota_change_history_response :
  ?next_token:next_token ->
  ?requested_quotas:requested_service_quota_change_history_list_definition ->
  unit ->
  list_requested_service_quota_change_history_response

val make_list_requested_service_quota_change_history_request :
  ?service_code:service_code ->
  ?status:request_status ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?quota_requested_at_level:applied_level_enum ->
  unit ->
  list_requested_service_quota_change_history_request

val make_list_requested_service_quota_change_history_by_quota_response :
  ?next_token:next_token ->
  ?requested_quotas:requested_service_quota_change_history_list_definition ->
  unit ->
  list_requested_service_quota_change_history_by_quota_response

val make_list_requested_service_quota_change_history_by_quota_request :
  ?status:request_status ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?quota_requested_at_level:applied_level_enum ->
  service_code:service_code ->
  quota_code:quota_code ->
  unit ->
  list_requested_service_quota_change_history_by_quota_request

val make_list_service_quota_increase_requests_in_template_response :
  ?service_quota_increase_request_in_template_list:service_quota_increase_request_in_template_list ->
  ?next_token:next_token ->
  unit ->
  list_service_quota_increase_requests_in_template_response

val make_list_service_quota_increase_requests_in_template_request :
  ?service_code:service_code ->
  ?aws_region:aws_region ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_service_quota_increase_requests_in_template_request

val make_list_service_quotas_response :
  ?next_token:next_token ->
  ?quotas:service_quota_list_definition ->
  unit ->
  list_service_quotas_response

val make_list_service_quotas_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?quota_code:quota_code ->
  ?quota_applied_at_level:applied_level_enum ->
  service_code:service_code ->
  unit ->
  list_service_quotas_request

val make_service_info :
  ?service_code:service_code -> ?service_name:service_name -> unit -> service_info

val make_list_services_response :
  ?next_token:next_token -> ?services:service_info_list_definition -> unit -> list_services_response

val make_list_services_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_services_request

val make_list_tags_for_resource_response :
  ?tags:output_tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_put_service_quota_increase_request_into_template_response :
  ?service_quota_increase_request_in_template:service_quota_increase_request_in_template ->
  unit ->
  put_service_quota_increase_request_into_template_response

val make_put_service_quota_increase_request_into_template_request :
  quota_code:quota_code ->
  service_code:service_code ->
  aws_region:aws_region ->
  desired_value:quota_value ->
  unit ->
  put_service_quota_increase_request_into_template_request

val make_request_service_quota_increase_response :
  ?requested_quota:requested_service_quota_change -> unit -> request_service_quota_increase_response

val make_request_service_quota_increase_request :
  ?context_id:quota_context_id ->
  ?support_case_allowed:support_case_allowed ->
  service_code:service_code ->
  quota_code:quota_code ->
  desired_value:quota_value ->
  unit ->
  request_service_quota_increase_request

val make_update_auto_management_response : unit -> unit

val make_update_auto_management_request :
  ?opt_in_type:opt_in_type ->
  ?notification_arn:amazon_resource_name ->
  ?exclusion_list:exclusion_list ->
  unit ->
  update_auto_management_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:input_tag_keys -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:input_tags -> unit -> tag_resource_request

val make_stop_auto_management_response : unit -> unit
val make_stop_auto_management_request : unit -> unit

val make_start_quota_utilization_report_response :
  ?report_id:report_id ->
  ?status:report_status ->
  ?message:report_message ->
  unit ->
  start_quota_utilization_report_response

val make_start_quota_utilization_report_request : unit -> unit
val make_start_auto_management_response : unit -> unit

val make_start_auto_management_request :
  ?notification_arn:amazon_resource_name ->
  ?exclusion_list:exclusion_list ->
  opt_in_level:opt_in_level ->
  opt_in_type:opt_in_type ->
  unit ->
  start_auto_management_request
