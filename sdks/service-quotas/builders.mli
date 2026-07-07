open Types

val make_update_auto_management_response : unit -> unit

val make_update_auto_management_request :
  ?exclusion_list:exclusion_list ->
  ?notification_arn:amazon_resource_name ->
  ?opt_in_type:opt_in_type ->
  unit ->
  update_auto_management_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:input_tag_keys -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:input_tags -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_request

val make_stop_auto_management_response : unit -> unit
val make_stop_auto_management_request : unit -> unit

val make_start_quota_utilization_report_response :
  ?message:report_message ->
  ?status:report_status ->
  ?report_id:report_id ->
  unit ->
  start_quota_utilization_report_response

val make_start_quota_utilization_report_request : unit -> unit
val make_start_auto_management_response : unit -> unit

val make_start_auto_management_request :
  ?exclusion_list:exclusion_list ->
  ?notification_arn:amazon_resource_name ->
  opt_in_type:opt_in_type ->
  opt_in_level:opt_in_level ->
  unit ->
  start_auto_management_request

val make_quota_context_info :
  ?context_id:quota_context_id ->
  ?context_scope_type:quota_context_scope_type ->
  ?context_scope:quota_context_scope ->
  unit ->
  quota_context_info

val make_requested_service_quota_change :
  ?quota_context:quota_context_info ->
  ?quota_requested_at_level:applied_level_enum ->
  ?unit_:quota_unit ->
  ?global_quota:global_quota ->
  ?quota_arn:quota_arn ->
  ?requester:requester ->
  ?last_updated:date_time ->
  ?created:date_time ->
  ?status:request_status ->
  ?desired_value:quota_value ->
  ?quota_name:quota_name ->
  ?quota_code:quota_code ->
  ?service_name:service_name ->
  ?service_code:service_code ->
  ?case_id:customer_service_engagement_id ->
  ?request_type:request_type ->
  ?id:request_id ->
  unit ->
  requested_service_quota_change

val make_request_service_quota_increase_response :
  ?requested_quota:requested_service_quota_change -> unit -> request_service_quota_increase_response

val make_request_service_quota_increase_request :
  ?support_case_allowed:support_case_allowed ->
  ?context_id:quota_context_id ->
  desired_value:quota_value ->
  quota_code:quota_code ->
  service_code:service_code ->
  unit ->
  request_service_quota_increase_request

val make_service_quota_increase_request_in_template :
  ?global_quota:global_quota ->
  ?unit_:quota_unit ->
  ?aws_region:aws_region ->
  ?desired_value:quota_value ->
  ?quota_name:quota_name ->
  ?quota_code:quota_code ->
  ?service_name:service_name ->
  ?service_code:service_code ->
  unit ->
  service_quota_increase_request_in_template

val make_put_service_quota_increase_request_into_template_response :
  ?service_quota_increase_request_in_template:service_quota_increase_request_in_template ->
  unit ->
  put_service_quota_increase_request_into_template_response

val make_put_service_quota_increase_request_into_template_request :
  desired_value:quota_value ->
  aws_region:aws_region ->
  service_code:service_code ->
  quota_code:quota_code ->
  unit ->
  put_service_quota_increase_request_into_template_request

val make_list_tags_for_resource_response :
  ?tags:output_tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_service_info :
  ?service_name:service_name -> ?service_code:service_code -> unit -> service_info

val make_list_services_response :
  ?services:service_info_list_definition -> ?next_token:next_token -> unit -> list_services_response

val make_list_services_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_services_request

val make_metric_info :
  ?metric_statistic_recommendation:statistic ->
  ?metric_dimensions:metric_dimensions_map_definition ->
  ?metric_name:quota_metric_name ->
  ?metric_namespace:quota_metric_namespace ->
  unit ->
  metric_info

val make_quota_period :
  ?period_unit:period_unit -> ?period_value:period_value -> unit -> quota_period

val make_error_reason :
  ?error_message:error_message -> ?error_code:error_code -> unit -> error_reason

val make_service_quota :
  ?description:quota_description ->
  ?quota_context:quota_context_info ->
  ?quota_applied_at_level:applied_level_enum ->
  ?error_reason:error_reason ->
  ?period:quota_period ->
  ?usage_metric:metric_info ->
  ?global_quota:global_quota ->
  ?adjustable:quota_adjustable ->
  ?unit_:quota_unit ->
  ?value:quota_value ->
  ?quota_name:quota_name ->
  ?quota_code:quota_code ->
  ?quota_arn:quota_arn ->
  ?service_name:service_name ->
  ?service_code:service_code ->
  unit ->
  service_quota

val make_list_service_quotas_response :
  ?quotas:service_quota_list_definition ->
  ?next_token:next_token ->
  unit ->
  list_service_quotas_response

val make_list_service_quotas_request :
  ?quota_applied_at_level:applied_level_enum ->
  ?quota_code:quota_code ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  service_code:service_code ->
  unit ->
  list_service_quotas_request

val make_list_service_quota_increase_requests_in_template_response :
  ?next_token:next_token ->
  ?service_quota_increase_request_in_template_list:service_quota_increase_request_in_template_list ->
  unit ->
  list_service_quota_increase_requests_in_template_response

val make_list_service_quota_increase_requests_in_template_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?aws_region:aws_region ->
  ?service_code:service_code ->
  unit ->
  list_service_quota_increase_requests_in_template_request

val make_list_requested_service_quota_change_history_by_quota_response :
  ?requested_quotas:requested_service_quota_change_history_list_definition ->
  ?next_token:next_token ->
  unit ->
  list_requested_service_quota_change_history_by_quota_response

val make_list_requested_service_quota_change_history_by_quota_request :
  ?quota_requested_at_level:applied_level_enum ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?status:request_status ->
  quota_code:quota_code ->
  service_code:service_code ->
  unit ->
  list_requested_service_quota_change_history_by_quota_request

val make_list_requested_service_quota_change_history_response :
  ?requested_quotas:requested_service_quota_change_history_list_definition ->
  ?next_token:next_token ->
  unit ->
  list_requested_service_quota_change_history_response

val make_list_requested_service_quota_change_history_request :
  ?quota_requested_at_level:applied_level_enum ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?status:request_status ->
  ?service_code:service_code ->
  unit ->
  list_requested_service_quota_change_history_request

val make_list_aws_default_service_quotas_response :
  ?quotas:service_quota_list_definition ->
  ?next_token:next_token ->
  unit ->
  list_aws_default_service_quotas_response

val make_list_aws_default_service_quotas_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  service_code:service_code ->
  unit ->
  list_aws_default_service_quotas_request

val make_get_service_quota_increase_request_from_template_response :
  ?service_quota_increase_request_in_template:service_quota_increase_request_in_template ->
  unit ->
  get_service_quota_increase_request_from_template_response

val make_get_service_quota_increase_request_from_template_request :
  aws_region:aws_region ->
  quota_code:quota_code ->
  service_code:service_code ->
  unit ->
  get_service_quota_increase_request_from_template_request

val make_get_service_quota_response : ?quota:service_quota -> unit -> get_service_quota_response

val make_get_service_quota_request :
  ?context_id:quota_context_id ->
  quota_code:quota_code ->
  service_code:service_code ->
  unit ->
  get_service_quota_request

val make_get_requested_service_quota_change_response :
  ?requested_quota:requested_service_quota_change ->
  unit ->
  get_requested_service_quota_change_response

val make_get_requested_service_quota_change_request :
  request_id:request_id -> unit -> get_requested_service_quota_change_request

val make_quota_utilization_info :
  ?adjustable:quota_adjustable ->
  ?service_name:service_name ->
  ?applied_value:applied_value ->
  ?default_value:default_value ->
  ?utilization:utilization_pct ->
  ?namespace:quota_metric_namespace ->
  ?quota_name:quota_name ->
  ?service_code:service_code ->
  ?quota_code:quota_code ->
  unit ->
  quota_utilization_info

val make_get_quota_utilization_report_response :
  ?error_message:report_error_message ->
  ?error_code:report_error_code ->
  ?next_token:next_token ->
  ?quotas:quota_utilization_info_list ->
  ?total_count:total_count ->
  ?generated_at:date_time ->
  ?status:report_status ->
  ?report_id:report_id ->
  unit ->
  get_quota_utilization_report_response

val make_get_quota_utilization_report_request :
  ?max_results:max_results_utilization ->
  ?next_token:next_token ->
  report_id:report_id ->
  unit ->
  get_quota_utilization_report_request

val make_get_aws_default_service_quota_response :
  ?quota:service_quota -> unit -> get_aws_default_service_quota_response

val make_get_aws_default_service_quota_request :
  quota_code:quota_code ->
  service_code:service_code ->
  unit ->
  get_aws_default_service_quota_request

val make_quota_info : ?quota_name:quota_name -> ?quota_code:quota_code -> unit -> quota_info

val make_get_auto_management_configuration_response :
  ?exclusion_list:exclusion_quota_list ->
  ?opt_in_status:opt_in_status ->
  ?notification_arn:amazon_resource_name ->
  ?opt_in_type:opt_in_type ->
  ?opt_in_level:opt_in_level ->
  unit ->
  get_auto_management_configuration_response

val make_get_auto_management_configuration_request : unit -> unit

val make_get_association_for_service_quota_template_response :
  ?service_quota_template_association_status:service_quota_template_association_status ->
  unit ->
  get_association_for_service_quota_template_response

val make_get_association_for_service_quota_template_request : unit -> unit
val make_disassociate_service_quota_template_response : unit -> unit
val make_disassociate_service_quota_template_request : unit -> unit
val make_delete_service_quota_increase_request_from_template_response : unit -> unit

val make_delete_service_quota_increase_request_from_template_request :
  aws_region:aws_region ->
  quota_code:quota_code ->
  service_code:service_code ->
  unit ->
  delete_service_quota_increase_request_from_template_request

val make_create_support_case_response : unit -> unit
val make_create_support_case_request : request_id:request_id -> unit -> create_support_case_request
val make_associate_service_quota_template_response : unit -> unit
val make_associate_service_quota_template_request : unit -> unit
