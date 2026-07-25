(** Cost Explorer client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_update_cost_category_definition_response :
  ?cost_category_arn:arn ->
  ?effective_start:zoned_date_time ->
  unit ->
  update_cost_category_definition_response

val make_cost_category_split_charge_rule_parameter :
  type_:cost_category_split_charge_rule_parameter_type ->
  values:cost_category_split_charge_rule_parameter_values_list ->
  unit ->
  cost_category_split_charge_rule_parameter

val make_cost_category_split_charge_rule :
  ?parameters:cost_category_split_charge_rule_parameters_list ->
  source:generic_string ->
  targets:cost_category_split_charge_rule_targets_list ->
  method_:cost_category_split_charge_method ->
  unit ->
  cost_category_split_charge_rule

val make_cost_category_inherited_value_dimension :
  ?dimension_name:cost_category_inherited_value_dimension_name ->
  ?dimension_key:generic_string ->
  unit ->
  cost_category_inherited_value_dimension

val make_cost_category_values :
  ?key:cost_category_name ->
  ?values:values ->
  ?match_options:match_options ->
  unit ->
  cost_category_values

val make_tag_values :
  ?key:tag_key -> ?values:values -> ?match_options:match_options -> unit -> tag_values

val make_dimension_values :
  ?key:dimension -> ?values:values -> ?match_options:match_options -> unit -> dimension_values

val make_expression :
  ?\#or:expressions ->
  ?and_:expressions ->
  ?not:expression ->
  ?dimensions:dimension_values ->
  ?tags:tag_values ->
  ?cost_categories:cost_category_values ->
  unit ->
  expression

val make_cost_category_rule :
  ?value:cost_category_value ->
  ?rule:expression ->
  ?inherited_value:cost_category_inherited_value_dimension ->
  ?type_:cost_category_rule_type ->
  unit ->
  cost_category_rule

val make_update_cost_category_definition_request :
  ?effective_start:zoned_date_time ->
  ?default_value:cost_category_value ->
  ?split_charge_rules:cost_category_split_charge_rules_list ->
  cost_category_arn:arn ->
  rule_version:cost_category_rule_version ->
  rules:cost_category_rules_list ->
  unit ->
  update_cost_category_definition_request

val make_update_cost_allocation_tags_status_error :
  ?tag_key:tag_key ->
  ?code:generic_string ->
  ?message:error_message ->
  unit ->
  update_cost_allocation_tags_status_error

val make_update_cost_allocation_tags_status_response :
  ?errors:update_cost_allocation_tags_status_errors ->
  unit ->
  update_cost_allocation_tags_status_response

val make_cost_allocation_tag_status_entry :
  tag_key:tag_key -> status:cost_allocation_tag_status -> unit -> cost_allocation_tag_status_entry

val make_update_cost_allocation_tags_status_request :
  cost_allocation_tags_status:cost_allocation_tag_status_list ->
  unit ->
  update_cost_allocation_tags_status_request

val make_update_anomaly_subscription_response :
  subscription_arn:generic_string -> unit -> update_anomaly_subscription_response

val make_subscriber :
  ?address:subscriber_address ->
  ?type_:subscriber_type ->
  ?status:subscriber_status ->
  unit ->
  subscriber

val make_update_anomaly_subscription_request :
  ?threshold:nullable_non_negative_double ->
  ?frequency:anomaly_subscription_frequency ->
  ?monitor_arn_list:monitor_arn_list ->
  ?subscribers:subscribers ->
  ?subscription_name:generic_string ->
  ?threshold_expression:expression ->
  subscription_arn:generic_string ->
  unit ->
  update_anomaly_subscription_request

val make_update_anomaly_monitor_response :
  monitor_arn:generic_string -> unit -> update_anomaly_monitor_response

val make_update_anomaly_monitor_request :
  ?monitor_name:generic_string ->
  monitor_arn:generic_string ->
  unit ->
  update_anomaly_monitor_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:arn -> resource_tag_keys:resource_tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_resource_tag : key:resource_tag_key -> value:resource_tag_value -> unit -> resource_tag

val make_tag_resource_request :
  resource_arn:arn -> resource_tags:resource_tag_list -> unit -> tag_resource_request

val make_start_savings_plans_purchase_recommendation_generation_response :
  ?recommendation_id:recommendation_id ->
  ?generation_started_time:zoned_date_time ->
  ?estimated_completion_time:zoned_date_time ->
  unit ->
  start_savings_plans_purchase_recommendation_generation_response

val make_start_savings_plans_purchase_recommendation_generation_request : unit -> unit

val make_cost_allocation_tag_backfill_request :
  ?backfill_from:zoned_date_time ->
  ?requested_at:zoned_date_time ->
  ?completed_at:zoned_date_time ->
  ?backfill_status:cost_allocation_tag_backfill_status ->
  ?last_updated_at:zoned_date_time ->
  unit ->
  cost_allocation_tag_backfill_request

val make_start_cost_allocation_tag_backfill_response :
  ?backfill_request:cost_allocation_tag_backfill_request ->
  unit ->
  start_cost_allocation_tag_backfill_response

val make_start_cost_allocation_tag_backfill_request :
  backfill_from:zoned_date_time -> unit -> start_cost_allocation_tag_backfill_request

val make_start_commitment_purchase_analysis_response :
  analysis_id:analysis_id ->
  analysis_started_time:zoned_date_time ->
  estimated_completion_time:zoned_date_time ->
  unit ->
  start_commitment_purchase_analysis_response

val make_date_interval : start:year_month_day -> end_:year_month_day -> unit -> date_interval

val make_savings_plans :
  ?payment_option:payment_option ->
  ?savings_plans_type:supported_savings_plans_type ->
  ?region:generic_string ->
  ?instance_family:generic_string ->
  ?term_in_years:term_in_years ->
  ?savings_plans_commitment:savings_plans_commitment ->
  ?offering_id:generic_string ->
  unit ->
  savings_plans

val make_savings_plans_purchase_analysis_configuration :
  ?account_scope:account_scope ->
  ?account_id:account_id ->
  ?savings_plans_to_exclude:savings_plans_to_exclude ->
  ?savings_plans_target_coverage:savings_plans_target_coverage ->
  analysis_type:analysis_type ->
  savings_plans_to_add:savings_plans_to_add ->
  look_back_time_period:date_interval ->
  unit ->
  savings_plans_purchase_analysis_configuration

val make_commitment_purchase_analysis_configuration :
  ?savings_plans_purchase_analysis_configuration:savings_plans_purchase_analysis_configuration ->
  unit ->
  commitment_purchase_analysis_configuration

val make_start_commitment_purchase_analysis_request :
  commitment_purchase_analysis_configuration:commitment_purchase_analysis_configuration ->
  unit ->
  start_commitment_purchase_analysis_request

val make_provide_anomaly_feedback_response :
  anomaly_id:generic_string -> unit -> provide_anomaly_feedback_response

val make_provide_anomaly_feedback_request :
  anomaly_id:generic_string ->
  feedback:anomaly_feedback_type ->
  unit ->
  provide_anomaly_feedback_request

val make_list_tags_for_resource_response :
  ?resource_tags:resource_tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_generation_summary :
  ?recommendation_id:recommendation_id ->
  ?generation_status:generation_status ->
  ?generation_started_time:zoned_date_time ->
  ?generation_completion_time:zoned_date_time ->
  ?estimated_completion_time:zoned_date_time ->
  unit ->
  generation_summary

val make_list_savings_plans_purchase_recommendation_generation_response :
  ?generation_summary_list:generation_summary_list ->
  ?next_page_token:next_page_token ->
  unit ->
  list_savings_plans_purchase_recommendation_generation_response

val make_list_savings_plans_purchase_recommendation_generation_request :
  ?generation_status:generation_status ->
  ?recommendation_ids:recommendation_id_list ->
  ?page_size:recommendations_page_size ->
  ?next_page_token:next_page_token ->
  unit ->
  list_savings_plans_purchase_recommendation_generation_request

val make_cost_category_resource_association :
  ?resource_arn:generic_arn ->
  ?cost_category_name:cost_category_name ->
  ?cost_category_arn:arn ->
  unit ->
  cost_category_resource_association

val make_list_cost_category_resource_associations_response :
  ?cost_category_resource_associations:cost_category_resource_associations ->
  ?next_token:next_page_token ->
  unit ->
  list_cost_category_resource_associations_response

val make_list_cost_category_resource_associations_request :
  ?cost_category_arn:arn ->
  ?next_token:next_page_token ->
  ?max_results:cost_category_max_results ->
  unit ->
  list_cost_category_resource_associations_request

val make_cost_category_processing_status :
  ?component:cost_category_status_component ->
  ?status:cost_category_status ->
  unit ->
  cost_category_processing_status

val make_cost_category_reference :
  ?cost_category_arn:arn ->
  ?name:cost_category_name ->
  ?effective_start:zoned_date_time ->
  ?effective_end:zoned_date_time ->
  ?number_of_rules:non_negative_integer ->
  ?processing_status:cost_category_processing_status_list ->
  ?values:cost_category_values_list ->
  ?default_value:cost_category_value ->
  ?supported_resource_types:resource_types ->
  unit ->
  cost_category_reference

val make_list_cost_category_definitions_response :
  ?cost_category_references:cost_category_references_list ->
  ?next_token:next_page_token ->
  unit ->
  list_cost_category_definitions_response

val make_list_cost_category_definitions_request :
  ?effective_on:zoned_date_time ->
  ?next_token:next_page_token ->
  ?max_results:cost_category_max_results ->
  ?supported_resource_types:resource_types_filter_input ->
  unit ->
  list_cost_category_definitions_request

val make_cost_allocation_tag :
  ?last_updated_date:zoned_date_time ->
  ?last_used_date:zoned_date_time ->
  tag_key:tag_key ->
  type_:cost_allocation_tag_type ->
  status:cost_allocation_tag_status ->
  unit ->
  cost_allocation_tag

val make_list_cost_allocation_tags_response :
  ?cost_allocation_tags:cost_allocation_tag_list ->
  ?next_token:next_page_token ->
  unit ->
  list_cost_allocation_tags_response

val make_list_cost_allocation_tags_request :
  ?status:cost_allocation_tag_status ->
  ?tag_keys:cost_allocation_tag_key_list ->
  ?type_:cost_allocation_tag_type ->
  ?next_token:next_page_token ->
  ?max_results:cost_allocation_tags_max_results ->
  unit ->
  list_cost_allocation_tags_request

val make_list_cost_allocation_tag_backfill_history_response :
  ?backfill_requests:cost_allocation_tag_backfill_request_list ->
  ?next_token:next_page_token ->
  unit ->
  list_cost_allocation_tag_backfill_history_response

val make_list_cost_allocation_tag_backfill_history_request :
  ?next_token:next_page_token ->
  ?max_results:cost_allocation_tags_max_results ->
  unit ->
  list_cost_allocation_tag_backfill_history_request

val make_analysis_summary :
  ?estimated_completion_time:zoned_date_time ->
  ?analysis_completion_time:zoned_date_time ->
  ?analysis_started_time:zoned_date_time ->
  ?analysis_status:analysis_status ->
  ?error_code:error_code ->
  ?analysis_id:analysis_id ->
  ?commitment_purchase_analysis_configuration:commitment_purchase_analysis_configuration ->
  unit ->
  analysis_summary

val make_list_commitment_purchase_analyses_response :
  ?analysis_summary_list:analysis_summary_list ->
  ?next_page_token:next_page_token ->
  unit ->
  list_commitment_purchase_analyses_response

val make_list_commitment_purchase_analyses_request :
  ?analysis_status:analysis_status ->
  ?next_page_token:next_page_token ->
  ?page_size:analyses_page_size ->
  ?analysis_ids:analysis_ids ->
  unit ->
  list_commitment_purchase_analyses_request

val make_metric_value : ?amount:metric_amount -> ?unit_:metric_unit -> unit -> metric_value

val make_get_usage_forecast_response :
  ?total:metric_value ->
  ?forecast_results_by_time:forecast_results_by_time ->
  unit ->
  get_usage_forecast_response

val make_get_usage_forecast_request :
  ?filter:expression ->
  ?billing_view_arn:billing_view_arn ->
  ?prediction_interval_level:prediction_interval_level ->
  time_period:date_interval ->
  metric:metric ->
  granularity:granularity ->
  unit ->
  get_usage_forecast_request

val make_get_tags_response :
  ?next_page_token:next_page_token ->
  tags:tag_list ->
  return_size:page_size ->
  total_size:page_size ->
  unit ->
  get_tags_response

val make_sort_definition :
  ?sort_order:sort_order -> key:sort_definition_key -> unit -> sort_definition

val make_get_tags_request :
  ?search_string:search_string ->
  ?tag_key:tag_key ->
  ?filter:expression ->
  ?sort_by:sort_definitions ->
  ?billing_view_arn:billing_view_arn ->
  ?max_results:max_results ->
  ?next_page_token:next_page_token ->
  time_period:date_interval ->
  unit ->
  get_tags_request

val make_savings_plans_amortized_commitment :
  ?amortized_recurring_commitment:generic_string ->
  ?amortized_upfront_commitment:generic_string ->
  ?total_amortized_commitment:generic_string ->
  unit ->
  savings_plans_amortized_commitment

val make_savings_plans_savings :
  ?net_savings:generic_string ->
  ?on_demand_cost_equivalent:generic_string ->
  unit ->
  savings_plans_savings

val make_savings_plans_utilization :
  ?total_commitment:generic_string ->
  ?used_commitment:generic_string ->
  ?unused_commitment:generic_string ->
  ?utilization_percentage:generic_string ->
  unit ->
  savings_plans_utilization

val make_savings_plans_utilization_aggregates :
  ?savings:savings_plans_savings ->
  ?amortized_commitment:savings_plans_amortized_commitment ->
  utilization:savings_plans_utilization ->
  unit ->
  savings_plans_utilization_aggregates

val make_savings_plans_utilization_detail :
  ?savings_plan_arn:savings_plan_arn ->
  ?attributes:attributes ->
  ?utilization:savings_plans_utilization ->
  ?savings:savings_plans_savings ->
  ?amortized_commitment:savings_plans_amortized_commitment ->
  unit ->
  savings_plans_utilization_detail

val make_get_savings_plans_utilization_details_response :
  ?total:savings_plans_utilization_aggregates ->
  ?next_token:next_page_token ->
  savings_plans_utilization_details:savings_plans_utilization_details ->
  time_period:date_interval ->
  unit ->
  get_savings_plans_utilization_details_response

val make_get_savings_plans_utilization_details_request :
  ?filter:expression ->
  ?data_type:savings_plans_data_types ->
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  ?sort_by:sort_definition ->
  time_period:date_interval ->
  unit ->
  get_savings_plans_utilization_details_request

val make_savings_plans_utilization_by_time :
  ?savings:savings_plans_savings ->
  ?amortized_commitment:savings_plans_amortized_commitment ->
  time_period:date_interval ->
  utilization:savings_plans_utilization ->
  unit ->
  savings_plans_utilization_by_time

val make_get_savings_plans_utilization_response :
  ?savings_plans_utilizations_by_time:savings_plans_utilizations_by_time ->
  total:savings_plans_utilization_aggregates ->
  unit ->
  get_savings_plans_utilization_response

val make_get_savings_plans_utilization_request :
  ?granularity:granularity ->
  ?filter:expression ->
  ?sort_by:sort_definition ->
  time_period:date_interval ->
  unit ->
  get_savings_plans_utilization_request

val make_savings_plans_purchase_recommendation_summary :
  ?estimated_ro_i:generic_string ->
  ?currency_code:generic_string ->
  ?estimated_total_cost:generic_string ->
  ?current_on_demand_spend:generic_string ->
  ?estimated_savings_amount:generic_string ->
  ?total_recommendation_count:generic_string ->
  ?daily_commitment_to_purchase:generic_string ->
  ?hourly_commitment_to_purchase:generic_string ->
  ?estimated_savings_percentage:generic_string ->
  ?estimated_monthly_savings_amount:generic_string ->
  ?estimated_on_demand_cost_with_current_commitment:generic_string ->
  unit ->
  savings_plans_purchase_recommendation_summary

val make_savings_plans_details :
  ?region:generic_string ->
  ?instance_family:generic_string ->
  ?offering_id:generic_string ->
  unit ->
  savings_plans_details

val make_savings_plans_purchase_recommendation_detail :
  ?savings_plans_details:savings_plans_details ->
  ?account_id:generic_string ->
  ?upfront_cost:generic_string ->
  ?estimated_ro_i:generic_string ->
  ?currency_code:generic_string ->
  ?estimated_sp_cost:generic_string ->
  ?estimated_on_demand_cost:generic_string ->
  ?estimated_on_demand_cost_with_current_commitment:generic_string ->
  ?estimated_savings_amount:generic_string ->
  ?estimated_savings_percentage:generic_string ->
  ?hourly_commitment_to_purchase:generic_string ->
  ?estimated_average_utilization:generic_string ->
  ?estimated_monthly_savings_amount:generic_string ->
  ?current_minimum_hourly_on_demand_spend:generic_string ->
  ?current_maximum_hourly_on_demand_spend:generic_string ->
  ?current_average_hourly_on_demand_spend:generic_string ->
  ?recommendation_detail_id:recommendation_detail_id ->
  unit ->
  savings_plans_purchase_recommendation_detail

val make_savings_plans_purchase_recommendation :
  ?account_scope:account_scope ->
  ?savings_plans_type:supported_savings_plans_type ->
  ?term_in_years:term_in_years ->
  ?payment_option:payment_option ->
  ?lookback_period_in_days:lookback_period_in_days ->
  ?savings_plans_purchase_recommendation_details:savings_plans_purchase_recommendation_detail_list ->
  ?savings_plans_purchase_recommendation_summary:savings_plans_purchase_recommendation_summary ->
  unit ->
  savings_plans_purchase_recommendation

val make_savings_plans_purchase_recommendation_metadata :
  ?recommendation_id:generic_string ->
  ?generation_timestamp:generic_string ->
  ?additional_metadata:generic_string ->
  unit ->
  savings_plans_purchase_recommendation_metadata

val make_get_savings_plans_purchase_recommendation_response :
  ?metadata:savings_plans_purchase_recommendation_metadata ->
  ?savings_plans_purchase_recommendation:savings_plans_purchase_recommendation ->
  ?next_page_token:next_page_token ->
  unit ->
  get_savings_plans_purchase_recommendation_response

val make_get_savings_plans_purchase_recommendation_request :
  ?account_scope:account_scope ->
  ?next_page_token:next_page_token ->
  ?page_size:recommendations_page_size ->
  ?filter:expression ->
  savings_plans_type:supported_savings_plans_type ->
  term_in_years:term_in_years ->
  payment_option:payment_option ->
  lookback_period_in_days:lookback_period_in_days ->
  unit ->
  get_savings_plans_purchase_recommendation_request

val make_savings_plans_coverage_data :
  ?spend_covered_by_savings_plans:generic_string ->
  ?on_demand_cost:generic_string ->
  ?total_cost:generic_string ->
  ?coverage_percentage:generic_string ->
  unit ->
  savings_plans_coverage_data

val make_savings_plans_coverage :
  ?attributes:attributes ->
  ?coverage:savings_plans_coverage_data ->
  ?time_period:date_interval ->
  unit ->
  savings_plans_coverage

val make_get_savings_plans_coverage_response :
  ?next_token:next_page_token ->
  savings_plans_coverages:savings_plans_coverages ->
  unit ->
  get_savings_plans_coverage_response

val make_group_definition :
  ?type_:group_definition_type -> ?key:group_definition_key -> unit -> group_definition

val make_get_savings_plans_coverage_request :
  ?group_by:group_definitions ->
  ?granularity:granularity ->
  ?filter:expression ->
  ?metrics:metric_names ->
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  ?sort_by:sort_definition ->
  time_period:date_interval ->
  unit ->
  get_savings_plans_coverage_request

val make_recommendation_detail_hourly_metrics :
  ?start_time:zoned_date_time ->
  ?estimated_on_demand_cost:generic_string ->
  ?current_coverage:generic_string ->
  ?estimated_coverage:generic_string ->
  ?estimated_new_commitment_utilization:generic_string ->
  unit ->
  recommendation_detail_hourly_metrics

val make_recommendation_detail_data :
  ?account_scope:account_scope ->
  ?lookback_period_in_days:lookback_period_in_days ->
  ?savings_plans_type:supported_savings_plans_type ->
  ?term_in_years:term_in_years ->
  ?payment_option:payment_option ->
  ?account_id:generic_string ->
  ?currency_code:generic_string ->
  ?instance_family:generic_string ->
  ?region:generic_string ->
  ?offering_id:generic_string ->
  ?generation_timestamp:zoned_date_time ->
  ?latest_usage_timestamp:zoned_date_time ->
  ?current_average_hourly_on_demand_spend:generic_string ->
  ?current_maximum_hourly_on_demand_spend:generic_string ->
  ?current_minimum_hourly_on_demand_spend:generic_string ->
  ?estimated_average_utilization:generic_string ->
  ?estimated_monthly_savings_amount:generic_string ->
  ?estimated_on_demand_cost:generic_string ->
  ?estimated_on_demand_cost_with_current_commitment:generic_string ->
  ?estimated_ro_i:generic_string ->
  ?estimated_sp_cost:generic_string ->
  ?estimated_savings_amount:generic_string ->
  ?estimated_savings_percentage:generic_string ->
  ?existing_hourly_commitment:generic_string ->
  ?hourly_commitment_to_purchase:generic_string ->
  ?upfront_cost:generic_string ->
  ?current_average_coverage:generic_string ->
  ?estimated_average_coverage:generic_string ->
  ?metrics_over_lookback_period:metrics_over_lookback_period ->
  unit ->
  recommendation_detail_data

val make_get_savings_plan_purchase_recommendation_details_response :
  ?recommendation_detail_id:recommendation_detail_id ->
  ?recommendation_detail_data:recommendation_detail_data ->
  unit ->
  get_savings_plan_purchase_recommendation_details_response

val make_get_savings_plan_purchase_recommendation_details_request :
  recommendation_detail_id:recommendation_detail_id ->
  unit ->
  get_savings_plan_purchase_recommendation_details_request

val make_rightsizing_recommendation_configuration :
  recommendation_target:recommendation_target ->
  benefits_considered:generic_boolean ->
  unit ->
  rightsizing_recommendation_configuration

val make_terminate_recommendation_detail :
  ?estimated_monthly_savings:generic_string ->
  ?currency_code:generic_string ->
  unit ->
  terminate_recommendation_detail

val make_network_resource_utilization :
  ?network_in_bytes_per_second:generic_string ->
  ?network_out_bytes_per_second:generic_string ->
  ?network_packets_in_per_second:generic_string ->
  ?network_packets_out_per_second:generic_string ->
  unit ->
  network_resource_utilization

val make_disk_resource_utilization :
  ?disk_read_ops_per_second:generic_string ->
  ?disk_write_ops_per_second:generic_string ->
  ?disk_read_bytes_per_second:generic_string ->
  ?disk_write_bytes_per_second:generic_string ->
  unit ->
  disk_resource_utilization

val make_ebs_resource_utilization :
  ?ebs_read_ops_per_second:generic_string ->
  ?ebs_write_ops_per_second:generic_string ->
  ?ebs_read_bytes_per_second:generic_string ->
  ?ebs_write_bytes_per_second:generic_string ->
  unit ->
  ebs_resource_utilization

val make_ec2_resource_utilization :
  ?max_cpu_utilization_percentage:generic_string ->
  ?max_memory_utilization_percentage:generic_string ->
  ?max_storage_utilization_percentage:generic_string ->
  ?ebs_resource_utilization:ebs_resource_utilization ->
  ?disk_resource_utilization:disk_resource_utilization ->
  ?network_resource_utilization:network_resource_utilization ->
  unit ->
  ec2_resource_utilization

val make_resource_utilization :
  ?ec2_resource_utilization:ec2_resource_utilization -> unit -> resource_utilization

val make_ec2_resource_details :
  ?hourly_on_demand_rate:generic_string ->
  ?instance_type:generic_string ->
  ?platform:generic_string ->
  ?region:generic_string ->
  ?sku:generic_string ->
  ?memory:generic_string ->
  ?network_performance:generic_string ->
  ?storage:generic_string ->
  ?vcpu:generic_string ->
  unit ->
  ec2_resource_details

val make_resource_details : ?ec2_resource_details:ec2_resource_details -> unit -> resource_details

val make_target_instance :
  ?estimated_monthly_cost:generic_string ->
  ?estimated_monthly_savings:generic_string ->
  ?currency_code:generic_string ->
  ?default_target_instance:generic_boolean ->
  ?resource_details:resource_details ->
  ?expected_resource_utilization:resource_utilization ->
  ?platform_differences:platform_differences ->
  unit ->
  target_instance

val make_modify_recommendation_detail :
  ?target_instances:target_instances_list -> unit -> modify_recommendation_detail

val make_current_instance :
  ?resource_id:generic_string ->
  ?instance_name:generic_string ->
  ?tags:tag_values_list ->
  ?resource_details:resource_details ->
  ?resource_utilization:resource_utilization ->
  ?reservation_covered_hours_in_lookback_period:generic_string ->
  ?savings_plans_covered_hours_in_lookback_period:generic_string ->
  ?on_demand_hours_in_lookback_period:generic_string ->
  ?total_running_hours_in_lookback_period:generic_string ->
  ?monthly_cost:generic_string ->
  ?currency_code:generic_string ->
  unit ->
  current_instance

val make_rightsizing_recommendation :
  ?account_id:generic_string ->
  ?current_instance:current_instance ->
  ?rightsizing_type:rightsizing_type ->
  ?modify_recommendation_detail:modify_recommendation_detail ->
  ?terminate_recommendation_detail:terminate_recommendation_detail ->
  ?finding_reason_codes:finding_reason_codes ->
  unit ->
  rightsizing_recommendation

val make_rightsizing_recommendation_summary :
  ?total_recommendation_count:generic_string ->
  ?estimated_total_monthly_savings_amount:generic_string ->
  ?savings_currency_code:generic_string ->
  ?savings_percentage:generic_string ->
  unit ->
  rightsizing_recommendation_summary

val make_rightsizing_recommendation_metadata :
  ?recommendation_id:generic_string ->
  ?generation_timestamp:generic_string ->
  ?lookback_period_in_days:lookback_period_in_days ->
  ?additional_metadata:generic_string ->
  unit ->
  rightsizing_recommendation_metadata

val make_get_rightsizing_recommendation_response :
  ?metadata:rightsizing_recommendation_metadata ->
  ?summary:rightsizing_recommendation_summary ->
  ?rightsizing_recommendations:rightsizing_recommendation_list ->
  ?next_page_token:next_page_token ->
  ?configuration:rightsizing_recommendation_configuration ->
  unit ->
  get_rightsizing_recommendation_response

val make_get_rightsizing_recommendation_request :
  ?filter:expression ->
  ?configuration:rightsizing_recommendation_configuration ->
  ?page_size:recommendations_page_size ->
  ?next_page_token:next_page_token ->
  service:generic_string ->
  unit ->
  get_rightsizing_recommendation_request

val make_reservation_aggregates :
  ?utilization_percentage:utilization_percentage ->
  ?utilization_percentage_in_units:utilization_percentage_in_units ->
  ?purchased_hours:purchased_hours ->
  ?purchased_units:purchased_units ->
  ?total_actual_hours:total_actual_hours ->
  ?total_actual_units:total_actual_units ->
  ?unused_hours:unused_hours ->
  ?unused_units:unused_units ->
  ?on_demand_cost_of_ri_hours_used:on_demand_cost_of_ri_hours_used ->
  ?net_ri_savings:net_ri_savings ->
  ?total_potential_ri_savings:total_potential_ri_savings ->
  ?amortized_upfront_fee:amortized_upfront_fee ->
  ?amortized_recurring_fee:amortized_recurring_fee ->
  ?total_amortized_fee:total_amortized_fee ->
  ?ri_cost_for_unused_hours:ri_cost_for_unused_hours ->
  ?realized_savings:realized_savings ->
  ?unrealized_savings:unrealized_savings ->
  unit ->
  reservation_aggregates

val make_reservation_utilization_group :
  ?key:reservation_group_key ->
  ?value:reservation_group_value ->
  ?attributes:attributes ->
  ?utilization:reservation_aggregates ->
  unit ->
  reservation_utilization_group

val make_utilization_by_time :
  ?time_period:date_interval ->
  ?groups:reservation_utilization_groups ->
  ?total:reservation_aggregates ->
  unit ->
  utilization_by_time

val make_get_reservation_utilization_response :
  ?total:reservation_aggregates ->
  ?next_page_token:next_page_token ->
  utilizations_by_time:utilizations_by_time ->
  unit ->
  get_reservation_utilization_response

val make_get_reservation_utilization_request :
  ?group_by:group_definitions ->
  ?granularity:granularity ->
  ?filter:expression ->
  ?sort_by:sort_definition ->
  ?next_page_token:next_page_token ->
  ?max_results:max_results ->
  time_period:date_interval ->
  unit ->
  get_reservation_utilization_request

val make_reservation_purchase_recommendation_summary :
  ?total_estimated_monthly_savings_amount:generic_string ->
  ?total_estimated_monthly_savings_percentage:generic_string ->
  ?currency_code:generic_string ->
  unit ->
  reservation_purchase_recommendation_summary

val make_dynamo_db_capacity_details :
  ?capacity_units:generic_string -> ?region:generic_string -> unit -> dynamo_db_capacity_details

val make_reserved_capacity_details :
  ?dynamo_db_capacity_details:dynamo_db_capacity_details -> unit -> reserved_capacity_details

val make_memory_db_instance_details :
  ?family:generic_string ->
  ?node_type:generic_string ->
  ?region:generic_string ->
  ?current_generation:generic_boolean ->
  ?size_flex_eligible:generic_boolean ->
  unit ->
  memory_db_instance_details

val make_es_instance_details :
  ?instance_class:generic_string ->
  ?instance_size:generic_string ->
  ?region:generic_string ->
  ?current_generation:generic_boolean ->
  ?size_flex_eligible:generic_boolean ->
  unit ->
  es_instance_details

val make_elasti_cache_instance_details :
  ?family:generic_string ->
  ?node_type:generic_string ->
  ?region:generic_string ->
  ?product_description:generic_string ->
  ?current_generation:generic_boolean ->
  ?size_flex_eligible:generic_boolean ->
  unit ->
  elasti_cache_instance_details

val make_redshift_instance_details :
  ?family:generic_string ->
  ?node_type:generic_string ->
  ?region:generic_string ->
  ?current_generation:generic_boolean ->
  ?size_flex_eligible:generic_boolean ->
  unit ->
  redshift_instance_details

val make_rds_instance_details :
  ?family:generic_string ->
  ?instance_type:generic_string ->
  ?region:generic_string ->
  ?database_engine:generic_string ->
  ?database_edition:generic_string ->
  ?deployment_option:generic_string ->
  ?license_model:generic_string ->
  ?current_generation:generic_boolean ->
  ?size_flex_eligible:generic_boolean ->
  ?deployment_model:generic_string ->
  unit ->
  rds_instance_details

val make_ec2_instance_details :
  ?family:generic_string ->
  ?instance_type:generic_string ->
  ?region:generic_string ->
  ?availability_zone:generic_string ->
  ?platform:generic_string ->
  ?tenancy:generic_string ->
  ?current_generation:generic_boolean ->
  ?size_flex_eligible:generic_boolean ->
  unit ->
  ec2_instance_details

val make_instance_details :
  ?ec2_instance_details:ec2_instance_details ->
  ?rds_instance_details:rds_instance_details ->
  ?redshift_instance_details:redshift_instance_details ->
  ?elasti_cache_instance_details:elasti_cache_instance_details ->
  ?es_instance_details:es_instance_details ->
  ?memory_db_instance_details:memory_db_instance_details ->
  unit ->
  instance_details

val make_reservation_purchase_recommendation_detail :
  ?account_id:generic_string ->
  ?instance_details:instance_details ->
  ?recommended_number_of_instances_to_purchase:generic_string ->
  ?recommended_normalized_units_to_purchase:generic_string ->
  ?minimum_number_of_instances_used_per_hour:generic_string ->
  ?minimum_normalized_units_used_per_hour:generic_string ->
  ?maximum_number_of_instances_used_per_hour:generic_string ->
  ?maximum_normalized_units_used_per_hour:generic_string ->
  ?average_number_of_instances_used_per_hour:generic_string ->
  ?average_normalized_units_used_per_hour:generic_string ->
  ?average_utilization:generic_string ->
  ?estimated_break_even_in_months:generic_string ->
  ?currency_code:generic_string ->
  ?estimated_monthly_savings_amount:generic_string ->
  ?estimated_monthly_savings_percentage:generic_string ->
  ?estimated_monthly_on_demand_cost:generic_string ->
  ?estimated_reservation_cost_for_lookback_period:generic_string ->
  ?upfront_cost:generic_string ->
  ?recurring_standard_monthly_cost:generic_string ->
  ?reserved_capacity_details:reserved_capacity_details ->
  ?recommended_number_of_capacity_units_to_purchase:generic_string ->
  ?minimum_number_of_capacity_units_used_per_hour:generic_string ->
  ?maximum_number_of_capacity_units_used_per_hour:generic_string ->
  ?average_number_of_capacity_units_used_per_hour:generic_string ->
  unit ->
  reservation_purchase_recommendation_detail

val make_ec2_specification : ?offering_class:offering_class -> unit -> ec2_specification

val make_service_specification :
  ?ec2_specification:ec2_specification -> unit -> service_specification

val make_reservation_purchase_recommendation :
  ?account_scope:account_scope ->
  ?lookback_period_in_days:lookback_period_in_days ->
  ?term_in_years:term_in_years ->
  ?payment_option:payment_option ->
  ?service_specification:service_specification ->
  ?recommendation_details:reservation_purchase_recommendation_details ->
  ?recommendation_summary:reservation_purchase_recommendation_summary ->
  unit ->
  reservation_purchase_recommendation

val make_reservation_purchase_recommendation_metadata :
  ?recommendation_id:generic_string ->
  ?generation_timestamp:generic_string ->
  ?additional_metadata:generic_string ->
  unit ->
  reservation_purchase_recommendation_metadata

val make_get_reservation_purchase_recommendation_response :
  ?metadata:reservation_purchase_recommendation_metadata ->
  ?recommendations:reservation_purchase_recommendations ->
  ?next_page_token:next_page_token ->
  unit ->
  get_reservation_purchase_recommendation_response

val make_get_reservation_purchase_recommendation_request :
  ?account_id:generic_string ->
  ?filter:expression ->
  ?account_scope:account_scope ->
  ?lookback_period_in_days:lookback_period_in_days ->
  ?term_in_years:term_in_years ->
  ?payment_option:payment_option ->
  ?service_specification:service_specification ->
  ?page_size:recommendations_page_size ->
  ?next_page_token:next_page_token ->
  service:generic_string ->
  unit ->
  get_reservation_purchase_recommendation_request

val make_coverage_cost : ?on_demand_cost:on_demand_cost -> unit -> coverage_cost

val make_coverage_normalized_units :
  ?on_demand_normalized_units:on_demand_normalized_units ->
  ?reserved_normalized_units:reserved_normalized_units ->
  ?total_running_normalized_units:total_running_normalized_units ->
  ?coverage_normalized_units_percentage:coverage_normalized_units_percentage ->
  unit ->
  coverage_normalized_units

val make_coverage_hours :
  ?on_demand_hours:on_demand_hours ->
  ?reserved_hours:reserved_hours ->
  ?total_running_hours:total_running_hours ->
  ?coverage_hours_percentage:coverage_hours_percentage ->
  unit ->
  coverage_hours

val make_coverage :
  ?coverage_hours:coverage_hours ->
  ?coverage_normalized_units:coverage_normalized_units ->
  ?coverage_cost:coverage_cost ->
  unit ->
  coverage

val make_reservation_coverage_group :
  ?attributes:attributes -> ?coverage:coverage -> unit -> reservation_coverage_group

val make_coverage_by_time :
  ?time_period:date_interval ->
  ?groups:reservation_coverage_groups ->
  ?total:coverage ->
  unit ->
  coverage_by_time

val make_get_reservation_coverage_response :
  ?total:coverage ->
  ?next_page_token:next_page_token ->
  coverages_by_time:coverages_by_time ->
  unit ->
  get_reservation_coverage_response

val make_get_reservation_coverage_request :
  ?group_by:group_definitions ->
  ?granularity:granularity ->
  ?filter:expression ->
  ?metrics:metric_names ->
  ?next_page_token:next_page_token ->
  ?sort_by:sort_definition ->
  ?max_results:max_results ->
  time_period:date_interval ->
  unit ->
  get_reservation_coverage_request

val make_dimension_values_with_attributes :
  ?value:value -> ?attributes:attributes -> unit -> dimension_values_with_attributes

val make_get_dimension_values_response :
  ?next_page_token:next_page_token ->
  dimension_values:dimension_values_with_attributes_list ->
  return_size:page_size ->
  total_size:page_size ->
  unit ->
  get_dimension_values_response

val make_get_dimension_values_request :
  ?search_string:search_string ->
  ?context:context ->
  ?filter:expression ->
  ?sort_by:sort_definitions ->
  ?billing_view_arn:billing_view_arn ->
  ?max_results:max_results ->
  ?next_page_token:next_page_token ->
  time_period:date_interval ->
  dimension:dimension ->
  unit ->
  get_dimension_values_request

val make_get_cost_forecast_response :
  ?total:metric_value ->
  ?forecast_results_by_time:forecast_results_by_time ->
  unit ->
  get_cost_forecast_response

val make_get_cost_forecast_request :
  ?filter:expression ->
  ?billing_view_arn:billing_view_arn ->
  ?prediction_interval_level:prediction_interval_level ->
  time_period:date_interval ->
  metric:metric ->
  granularity:granularity ->
  unit ->
  get_cost_forecast_request

val make_comparison_metric_value :
  ?baseline_time_period_amount:generic_string ->
  ?comparison_time_period_amount:generic_string ->
  ?difference:generic_string ->
  ?unit_:generic_string ->
  unit ->
  comparison_metric_value

val make_cost_driver :
  ?type_:generic_string ->
  ?name:generic_string ->
  ?metrics:comparison_metrics ->
  unit ->
  cost_driver

val make_cost_comparison_driver :
  ?cost_selector:expression ->
  ?metrics:comparison_metrics ->
  ?cost_drivers:cost_drivers ->
  unit ->
  cost_comparison_driver

val make_get_cost_comparison_drivers_response :
  ?cost_comparison_drivers:cost_comparison_drivers ->
  ?next_page_token:next_page_token ->
  unit ->
  get_cost_comparison_drivers_response

val make_get_cost_comparison_drivers_request :
  ?billing_view_arn:billing_view_arn ->
  ?filter:expression ->
  ?group_by:group_definitions ->
  ?max_results:cost_comparison_drivers_max_results ->
  ?next_page_token:next_page_token ->
  baseline_time_period:date_interval ->
  comparison_time_period:date_interval ->
  metric_for_comparison:metric_name ->
  unit ->
  get_cost_comparison_drivers_request

val make_get_cost_categories_response :
  ?next_page_token:next_page_token ->
  ?cost_category_names:cost_category_names_list ->
  ?cost_category_values:cost_category_values_list ->
  return_size:page_size ->
  total_size:page_size ->
  unit ->
  get_cost_categories_response

val make_get_cost_categories_request :
  ?search_string:search_string ->
  ?cost_category_name:cost_category_name ->
  ?filter:expression ->
  ?sort_by:sort_definitions ->
  ?billing_view_arn:billing_view_arn ->
  ?max_results:max_results ->
  ?next_page_token:next_page_token ->
  time_period:date_interval ->
  unit ->
  get_cost_categories_request

val make_group : ?keys:keys -> ?metrics:metrics -> unit -> group

val make_result_by_time :
  ?time_period:date_interval ->
  ?total:metrics ->
  ?groups:groups ->
  ?estimated:estimated ->
  unit ->
  result_by_time

val make_get_cost_and_usage_with_resources_response :
  ?next_page_token:next_page_token ->
  ?group_definitions:group_definitions ->
  ?results_by_time:results_by_time ->
  ?dimension_value_attributes:dimension_values_with_attributes_list ->
  unit ->
  get_cost_and_usage_with_resources_response

val make_get_cost_and_usage_with_resources_request :
  ?metrics:metric_names ->
  ?group_by:group_definitions ->
  ?billing_view_arn:billing_view_arn ->
  ?next_page_token:next_page_token ->
  time_period:date_interval ->
  granularity:granularity ->
  filter:expression ->
  unit ->
  get_cost_and_usage_with_resources_request

val make_cost_and_usage_comparison :
  ?cost_and_usage_selector:expression ->
  ?metrics:comparison_metrics ->
  unit ->
  cost_and_usage_comparison

val make_get_cost_and_usage_comparisons_response :
  ?cost_and_usage_comparisons:cost_and_usage_comparisons ->
  ?total_cost_and_usage:comparison_metrics ->
  ?next_page_token:next_page_token ->
  unit ->
  get_cost_and_usage_comparisons_response

val make_get_cost_and_usage_comparisons_request :
  ?billing_view_arn:billing_view_arn ->
  ?filter:expression ->
  ?group_by:group_definitions ->
  ?max_results:cost_and_usage_comparisons_max_results ->
  ?next_page_token:next_page_token ->
  baseline_time_period:date_interval ->
  comparison_time_period:date_interval ->
  metric_for_comparison:metric_name ->
  unit ->
  get_cost_and_usage_comparisons_request

val make_get_cost_and_usage_response :
  ?next_page_token:next_page_token ->
  ?group_definitions:group_definitions ->
  ?results_by_time:results_by_time ->
  ?dimension_value_attributes:dimension_values_with_attributes_list ->
  unit ->
  get_cost_and_usage_response

val make_get_cost_and_usage_request :
  ?filter:expression ->
  ?group_by:group_definitions ->
  ?billing_view_arn:billing_view_arn ->
  ?next_page_token:next_page_token ->
  time_period:date_interval ->
  granularity:granularity ->
  metrics:metric_names ->
  unit ->
  get_cost_and_usage_request

val make_savings_plans_purchase_analysis_details :
  ?currency_code:generic_string ->
  ?lookback_period_in_hours:generic_string ->
  ?current_average_coverage:generic_string ->
  ?current_average_hourly_on_demand_spend:generic_string ->
  ?current_maximum_hourly_on_demand_spend:generic_string ->
  ?current_minimum_hourly_on_demand_spend:generic_string ->
  ?current_on_demand_spend:generic_string ->
  ?existing_hourly_commitment:generic_string ->
  ?hourly_commitment_to_purchase:generic_string ->
  ?estimated_average_coverage:generic_string ->
  ?estimated_average_utilization:generic_string ->
  ?estimated_monthly_savings_amount:generic_string ->
  ?estimated_on_demand_cost:generic_string ->
  ?estimated_on_demand_cost_with_current_commitment:generic_string ->
  ?estimated_ro_i:generic_string ->
  ?estimated_savings_amount:generic_string ->
  ?estimated_savings_percentage:generic_string ->
  ?estimated_commitment_cost:generic_string ->
  ?latest_usage_timestamp:generic_string ->
  ?upfront_cost:generic_string ->
  ?additional_metadata:generic_string ->
  ?metrics_over_lookback_period:metrics_over_lookback_period ->
  unit ->
  savings_plans_purchase_analysis_details

val make_analysis_details :
  ?savings_plans_purchase_analysis_details:savings_plans_purchase_analysis_details ->
  unit ->
  analysis_details

val make_get_commitment_purchase_analysis_response :
  ?analysis_completion_time:zoned_date_time ->
  ?error_code:error_code ->
  ?analysis_details:analysis_details ->
  estimated_completion_time:zoned_date_time ->
  analysis_started_time:zoned_date_time ->
  analysis_id:analysis_id ->
  analysis_status:analysis_status ->
  commitment_purchase_analysis_configuration:commitment_purchase_analysis_configuration ->
  unit ->
  get_commitment_purchase_analysis_response

val make_get_commitment_purchase_analysis_request :
  analysis_id:analysis_id -> unit -> get_commitment_purchase_analysis_request

val make_get_approximate_usage_records_response :
  ?services:approximate_usage_records_per_service ->
  ?total_records:non_negative_long ->
  ?lookback_period:date_interval ->
  unit ->
  get_approximate_usage_records_response

val make_get_approximate_usage_records_request :
  ?services:usage_services ->
  granularity:granularity ->
  approximation_dimension:approximation_dimension ->
  unit ->
  get_approximate_usage_records_request

val make_anomaly_subscription :
  ?subscription_arn:generic_string ->
  ?account_id:generic_string ->
  ?threshold:nullable_non_negative_double ->
  ?threshold_expression:expression ->
  monitor_arn_list:monitor_arn_list ->
  subscribers:subscribers ->
  frequency:anomaly_subscription_frequency ->
  subscription_name:generic_string ->
  unit ->
  anomaly_subscription

val make_get_anomaly_subscriptions_response :
  ?next_page_token:next_page_token ->
  anomaly_subscriptions:anomaly_subscriptions ->
  unit ->
  get_anomaly_subscriptions_response

val make_get_anomaly_subscriptions_request :
  ?subscription_arn_list:values ->
  ?monitor_arn:generic_string ->
  ?next_page_token:next_page_token ->
  ?max_results:page_size ->
  unit ->
  get_anomaly_subscriptions_request

val make_anomaly_monitor :
  ?monitor_arn:generic_string ->
  ?creation_date:year_month_day ->
  ?last_updated_date:year_month_day ->
  ?last_evaluated_date:year_month_day ->
  ?monitor_dimension:monitor_dimension ->
  ?monitor_specification:expression ->
  ?dimensional_value_count:non_negative_integer ->
  monitor_name:generic_string ->
  monitor_type:monitor_type ->
  unit ->
  anomaly_monitor

val make_get_anomaly_monitors_response :
  ?next_page_token:next_page_token ->
  anomaly_monitors:anomaly_monitors ->
  unit ->
  get_anomaly_monitors_response

val make_get_anomaly_monitors_request :
  ?monitor_arn_list:values ->
  ?next_page_token:next_page_token ->
  ?max_results:page_size ->
  unit ->
  get_anomaly_monitors_request

val make_impact :
  ?total_impact:generic_double ->
  ?total_actual_spend:nullable_non_negative_double ->
  ?total_expected_spend:nullable_non_negative_double ->
  ?total_impact_percentage:nullable_non_negative_double ->
  max_impact:generic_double ->
  unit ->
  impact

val make_anomaly_score :
  max_score:generic_double -> current_score:generic_double -> unit -> anomaly_score

val make_root_cause_impact : contribution:generic_double -> unit -> root_cause_impact

val make_root_cause :
  ?service:generic_string ->
  ?region:generic_string ->
  ?linked_account:generic_string ->
  ?linked_account_name:generic_string ->
  ?usage_type:generic_string ->
  ?impact:root_cause_impact ->
  unit ->
  root_cause

val make_anomaly :
  ?anomaly_start_date:year_month_day ->
  ?anomaly_end_date:year_month_day ->
  ?dimension_value:generic_string ->
  ?root_causes:root_causes ->
  ?feedback:anomaly_feedback_type ->
  anomaly_id:generic_string ->
  anomaly_score:anomaly_score ->
  impact:impact ->
  monitor_arn:generic_string ->
  unit ->
  anomaly

val make_get_anomalies_response :
  ?next_page_token:next_page_token -> anomalies:anomalies -> unit -> get_anomalies_response

val make_total_impact_filter :
  ?end_value:generic_double ->
  numeric_operator:numeric_operator ->
  start_value:generic_double ->
  unit ->
  total_impact_filter

val make_anomaly_date_interval :
  ?end_date:year_month_day -> start_date:year_month_day -> unit -> anomaly_date_interval

val make_get_anomalies_request :
  ?monitor_arn:generic_string ->
  ?feedback:anomaly_feedback_type ->
  ?total_impact:total_impact_filter ->
  ?next_page_token:next_page_token ->
  ?max_results:page_size ->
  date_interval:anomaly_date_interval ->
  unit ->
  get_anomalies_request

val make_cost_category :
  ?effective_end:zoned_date_time ->
  ?split_charge_rules:cost_category_split_charge_rules_list ->
  ?processing_status:cost_category_processing_status_list ->
  ?default_value:cost_category_value ->
  cost_category_arn:arn ->
  effective_start:zoned_date_time ->
  name:cost_category_name ->
  rule_version:cost_category_rule_version ->
  rules:cost_category_rules_list ->
  unit ->
  cost_category

val make_describe_cost_category_definition_response :
  ?cost_category:cost_category -> unit -> describe_cost_category_definition_response

val make_describe_cost_category_definition_request :
  ?effective_on:zoned_date_time ->
  cost_category_arn:arn ->
  unit ->
  describe_cost_category_definition_request

val make_delete_cost_category_definition_response :
  ?cost_category_arn:arn ->
  ?effective_end:zoned_date_time ->
  unit ->
  delete_cost_category_definition_response

val make_delete_cost_category_definition_request :
  cost_category_arn:arn -> unit -> delete_cost_category_definition_request

val make_delete_anomaly_subscription_response : unit -> unit

val make_delete_anomaly_subscription_request :
  subscription_arn:generic_string -> unit -> delete_anomaly_subscription_request

val make_delete_anomaly_monitor_response : unit -> unit

val make_delete_anomaly_monitor_request :
  monitor_arn:generic_string -> unit -> delete_anomaly_monitor_request

val make_create_cost_category_definition_response :
  ?cost_category_arn:arn ->
  ?effective_start:zoned_date_time ->
  unit ->
  create_cost_category_definition_response

val make_create_cost_category_definition_request :
  ?effective_start:zoned_date_time ->
  ?default_value:cost_category_value ->
  ?split_charge_rules:cost_category_split_charge_rules_list ->
  ?resource_tags:resource_tag_list ->
  name:cost_category_name ->
  rule_version:cost_category_rule_version ->
  rules:cost_category_rules_list ->
  unit ->
  create_cost_category_definition_request

val make_create_anomaly_subscription_response :
  subscription_arn:generic_string -> unit -> create_anomaly_subscription_response

val make_create_anomaly_subscription_request :
  ?resource_tags:resource_tag_list ->
  anomaly_subscription:anomaly_subscription ->
  unit ->
  create_anomaly_subscription_request

val make_create_anomaly_monitor_response :
  monitor_arn:generic_string -> unit -> create_anomaly_monitor_response

val make_create_anomaly_monitor_request :
  ?resource_tags:resource_tag_list ->
  anomaly_monitor:anomaly_monitor ->
  unit ->
  create_anomaly_monitor_request
(** {1:operations Operations} *)

module CreateAnomalyMonitor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_anomaly_monitor_request ->
    ( create_anomaly_monitor_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_anomaly_monitor_request ->
    ( create_anomaly_monitor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new cost anomaly detection monitor with the requested type and monitor specification. \n"]

module CreateAnomalySubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `UnknownMonitorException of unknown_monitor_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_anomaly_subscription_request ->
    ( create_anomaly_subscription_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_anomaly_subscription_request ->
    ( create_anomaly_subscription_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds an alert subscription to a cost anomaly detection monitor. You can use each subscription \
   to define subscribers with email or SNS notifications. Email subscribers can set an absolute or \
   percentage threshold and a time frequency for receiving notifications. \n"]

module CreateCostCategoryDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cost_category_definition_request ->
    ( create_cost_category_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cost_category_definition_request ->
    ( create_cost_category_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new cost category with the requested name and rules.\n"]

module DeleteAnomalyMonitor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `UnknownMonitorException of unknown_monitor_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_anomaly_monitor_request ->
    ( delete_anomaly_monitor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_anomaly_monitor_request ->
    ( delete_anomaly_monitor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a cost anomaly monitor. \n"]

module DeleteAnomalySubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `UnknownSubscriptionException of unknown_subscription_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_anomaly_subscription_request ->
    ( delete_anomaly_subscription_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownSubscriptionException of unknown_subscription_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_anomaly_subscription_request ->
    ( delete_anomaly_subscription_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownSubscriptionException of unknown_subscription_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a cost anomaly subscription. \n"]

module DeleteCostCategoryDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cost_category_definition_request ->
    ( delete_cost_category_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cost_category_definition_request ->
    ( delete_cost_category_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a cost category. Expenses from this month going forward will no longer be categorized \
   with this cost category.\n"]

module DescribeCostCategoryDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cost_category_definition_request ->
    ( describe_cost_category_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cost_category_definition_request ->
    ( describe_cost_category_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the name, Amazon Resource Name (ARN), rules, definition, and effective dates of a cost \
   category that's defined in the account.\n\n\
  \ You have the option to use [EffectiveOn] to return a cost category that's active on a specific \
   date. If there's no [EffectiveOn] specified, you see a Cost Category that's effective on the \
   current date. If cost category is still effective, [EffectiveEnd] is omitted in the response. \n\
  \ "]

module GetAnomalies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_anomalies_request ->
    ( get_anomalies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_anomalies_request ->
    ( get_anomalies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves all of the cost anomalies detected on your account during the time period that's \
   specified by the [DateInterval] object. Anomalies are available for up to 90 days.\n"]

module GetAnomalyMonitors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `UnknownMonitorException of unknown_monitor_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_anomaly_monitors_request ->
    ( get_anomaly_monitors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_anomaly_monitors_request ->
    ( get_anomaly_monitors_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the cost anomaly monitor definitions for your account. You can filter using a list of \
   cost anomaly monitor Amazon Resource Names (ARNs). \n"]

module GetAnomalySubscriptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `UnknownSubscriptionException of unknown_subscription_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_anomaly_subscriptions_request ->
    ( get_anomaly_subscriptions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownSubscriptionException of unknown_subscription_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_anomaly_subscriptions_request ->
    ( get_anomaly_subscriptions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownSubscriptionException of unknown_subscription_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the cost anomaly subscription objects for your account. You can filter using a list \
   of cost anomaly monitor Amazon Resource Names (ARNs). \n"]

module GetApproximateUsageRecords : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_approximate_usage_records_request ->
    ( get_approximate_usage_records_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_approximate_usage_records_request ->
    ( get_approximate_usage_records_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves estimated usage records for hourly granularity or resource-level data at daily \
   granularity.\n"]

module GetCommitmentPurchaseAnalysis : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AnalysisNotFoundException of analysis_not_found_exception
    | `DataUnavailableException of data_unavailable_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_commitment_purchase_analysis_request ->
    ( get_commitment_purchase_analysis_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AnalysisNotFoundException of analysis_not_found_exception
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_commitment_purchase_analysis_request ->
    ( get_commitment_purchase_analysis_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AnalysisNotFoundException of analysis_not_found_exception
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a commitment purchase analysis result based on the [AnalysisId].\n"]

module GetCostAndUsage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillExpirationException of bill_expiration_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RequestChangedException of request_changed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cost_and_usage_request ->
    ( get_cost_and_usage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cost_and_usage_request ->
    ( get_cost_and_usage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves cost and usage metrics for your account. You can specify which cost and usage-related \
   metric that you want the request to return. For example, you can specify [BlendedCosts] or \
   [UsageQuantity]. You can also filter and group your data by various dimensions, such as \
   [SERVICE] or [AZ], in a specific time range. For a complete list of valid dimensions, see the \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetDimensionValues.html}GetDimensionValues} \
   operation. Management account in an organization in Organizations have access to all member \
   accounts.\n\n\
  \ For information about filter limitations, see \
   {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-limits.html}Quotas and \
   restrictions} in the {i Billing and Cost Management User Guide}.\n\
  \ "]

module GetCostAndUsageComparisons : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cost_and_usage_comparisons_request ->
    ( get_cost_and_usage_comparisons_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cost_and_usage_comparisons_request ->
    ( get_cost_and_usage_comparisons_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves cost and usage comparisons for your account between two periods within the last 13 \
   months. If you have enabled multi-year data at monthly granularity, you can go back up to 38 \
   months.\n"]

module GetCostAndUsageWithResources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillExpirationException of bill_expiration_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RequestChangedException of request_changed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cost_and_usage_with_resources_request ->
    ( get_cost_and_usage_with_resources_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cost_and_usage_with_resources_request ->
    ( get_cost_and_usage_with_resources_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves cost and usage metrics with resources for your account. You can specify which cost \
   and usage-related metric, such as [BlendedCosts] or [UsageQuantity], that you want the request \
   to return. You can also filter and group your data by various dimensions, such as [SERVICE] or \
   [AZ], in a specific time range. For a complete list of valid dimensions, see the \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetDimensionValues.html}GetDimensionValues} \
   operation. Management account in an organization in Organizations have access to all member \
   accounts.\n\n\
  \ Hourly granularity is only available for EC2-Instances (Elastic Compute Cloud) resource-level \
   data. All other resource-level data is available at daily granularity.\n\
  \ \n\
  \   This is an opt-in only feature. You can enable this feature from the Cost Explorer Settings \
   page. For information about how to access the Settings page, see \
   {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-access.html}Controlling \
   Access for Cost Explorer} in the {i Billing and Cost Management User Guide}.\n\
  \   \n\
  \    "]

module GetCostCategories : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillExpirationException of bill_expiration_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RequestChangedException of request_changed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cost_categories_request ->
    ( get_cost_categories_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cost_categories_request ->
    ( get_cost_categories_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves an array of cost category names and values incurred cost.\n\n\
  \  If some cost category names and values are not associated with any cost, they will not be \
   returned by this API.\n\
  \  \n\
  \   "]

module GetCostComparisonDrivers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cost_comparison_drivers_request ->
    ( get_cost_comparison_drivers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cost_comparison_drivers_request ->
    ( get_cost_comparison_drivers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves key factors driving cost changes between two time periods within the last 13 months, \
   such as usage changes, discount changes, and commitment-based savings. If you have enabled \
   multi-year data at monthly granularity, you can go back up to 38 months.\n"]

module GetCostForecast : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cost_forecast_request ->
    ( get_cost_forecast_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cost_forecast_request ->
    ( get_cost_forecast_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a forecast for how much Amazon Web Services predicts that you will spend over the \
   forecast time period that you select, based on your past costs. \n"]

module GetDimensionValues : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillExpirationException of bill_expiration_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RequestChangedException of request_changed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_dimension_values_request ->
    ( get_dimension_values_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_dimension_values_request ->
    ( get_dimension_values_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves all available filter values for a specified filter over a period of time. You can \
   search the dimension values for an arbitrary string. \n"]

module GetReservationCoverage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_coverage_request ->
    ( get_reservation_coverage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_coverage_request ->
    ( get_reservation_coverage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the reservation coverage for your account, which you can use to see how much of your \
   Amazon Elastic Compute Cloud, Amazon ElastiCache, Amazon Relational Database Service, or Amazon \
   Redshift usage is covered by a reservation. An organization's management account can see the \
   coverage of the associated member accounts. This supports dimensions, cost categories, and \
   nested expressions. For any time period, you can filter data about reservation usage by the \
   following dimensions:\n\n\
  \ {ul\n\
  \       {-  AZ\n\
  \           \n\
  \            }\n\
  \       {-  CACHE_ENGINE\n\
  \           \n\
  \            }\n\
  \       {-  DATABASE_ENGINE\n\
  \           \n\
  \            }\n\
  \       {-  DEPLOYMENT_OPTION\n\
  \           \n\
  \            }\n\
  \       {-  INSTANCE_TYPE\n\
  \           \n\
  \            }\n\
  \       {-  LINKED_ACCOUNT\n\
  \           \n\
  \            }\n\
  \       {-  OPERATING_SYSTEM\n\
  \           \n\
  \            }\n\
  \       {-  PLATFORM\n\
  \           \n\
  \            }\n\
  \       {-  REGION\n\
  \           \n\
  \            }\n\
  \       {-  SERVICE\n\
  \           \n\
  \            }\n\
  \       {-  TAG\n\
  \           \n\
  \            }\n\
  \       {-  TENANCY\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   To determine valid values for a dimension, use the [GetDimensionValues] operation. \n\
  \   "]

module GetReservationPurchaseRecommendation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_purchase_recommendation_request ->
    ( get_reservation_purchase_recommendation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_purchase_recommendation_request ->
    ( get_reservation_purchase_recommendation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets recommendations for reservation purchases. These recommendations might help you to reduce \
   your costs. Reservations provide a discounted hourly rate (up to 75%) compared to On-Demand \
   pricing.\n\n\
  \ Amazon Web Services generates your recommendations by identifying your On-Demand usage during \
   a specific time period and collecting your usage into categories that are eligible for a \
   reservation. After Amazon Web Services has these categories, it simulates every combination of \
   reservations in each category of usage to identify the best number of each type of Reserved \
   Instance (RI) to purchase to maximize your estimated savings. \n\
  \ \n\
  \  For example, Amazon Web Services automatically aggregates your Amazon EC2 Linux, shared \
   tenancy, and c4 family usage in the US West (Oregon) Region and recommends that you buy \
   size-flexible regional reservations to apply to the c4 family usage. Amazon Web Services \
   recommends the smallest size instance in an instance family. This makes it easier to purchase a \
   size-flexible Reserved Instance (RI). Amazon Web Services also shows the equal number of \
   normalized units. This way, you can purchase any instance size that you want. For this example, \
   your RI recommendation is for [c4.large] because that is the smallest size instance in the c4 \
   instance family.\n\
  \  "]

module GetReservationUtilization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_utilization_request ->
    ( get_reservation_utilization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_utilization_request ->
    ( get_reservation_utilization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the reservation utilization for your account. Management account in an organization \
   have access to member accounts. You can filter data by dimensions in a time period. You can use \
   [GetDimensionValues] to determine the possible dimension values. Currently, you can group only \
   by [SUBSCRIPTION_ID]. \n"]

module GetRightsizingRecommendation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_rightsizing_recommendation_request ->
    ( get_rightsizing_recommendation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_rightsizing_recommendation_request ->
    ( get_rightsizing_recommendation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates recommendations that help you save cost by identifying idle and underutilized Amazon \
   EC2 instances.\n\n\
  \ Recommendations are generated to either downsize or terminate instances, along with providing \
   savings detail and metrics. For more information about calculation and function, see \
   {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-rightsizing.html}Optimizing \
   Your Cost with Rightsizing Recommendations} in the {i Billing and Cost Management User Guide}.\n\
  \ "]

module GetSavingsPlanPurchaseRecommendationDetails : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plan_purchase_recommendation_details_request ->
    ( get_savings_plan_purchase_recommendation_details_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plan_purchase_recommendation_details_request ->
    ( get_savings_plan_purchase_recommendation_details_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the details for a Savings Plan recommendation. These details include the hourly \
   data-points that construct the cost, coverage, and utilization charts.\n"]

module GetSavingsPlansCoverage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plans_coverage_request ->
    ( get_savings_plans_coverage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plans_coverage_request ->
    ( get_savings_plans_coverage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the Savings Plans covered for your account. This enables you to see how much of your \
   cost is covered by a Savings Plan. An organization\226\128\153s management account can see the \
   coverage of the associated member accounts. This supports dimensions, cost categories, and \
   nested expressions. For any time period, you can filter data for Savings Plans usage with the \
   following dimensions:\n\n\
  \ {ul\n\
  \       {-   [LINKED_ACCOUNT] \n\
  \           \n\
  \            }\n\
  \       {-   [REGION] \n\
  \           \n\
  \            }\n\
  \       {-   [SERVICE] \n\
  \           \n\
  \            }\n\
  \       {-   [INSTANCE_FAMILY] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \   To determine valid values for a dimension, use the [GetDimensionValues] operation.\n\
  \   "]

module GetSavingsPlansPurchaseRecommendation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plans_purchase_recommendation_request ->
    ( get_savings_plans_purchase_recommendation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plans_purchase_recommendation_request ->
    ( get_savings_plans_purchase_recommendation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the Savings Plans recommendations for your account. First use \
   [StartSavingsPlansPurchaseRecommendationGeneration] to generate a new set of recommendations, \
   and then use [GetSavingsPlansPurchaseRecommendation] to retrieve them.\n"]

module GetSavingsPlansUtilization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plans_utilization_request ->
    ( get_savings_plans_utilization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plans_utilization_request ->
    ( get_savings_plans_utilization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the Savings Plans utilization for your account across date ranges with daily or \
   monthly granularity. Management account in an organization have access to member accounts. You \
   can use [GetDimensionValues] in [SAVINGS_PLANS] to determine the possible dimension values.\n\n\
  \  You can't group by any dimension values for [GetSavingsPlansUtilization].\n\
  \  \n\
  \   "]

module GetSavingsPlansUtilizationDetails : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plans_utilization_details_request ->
    ( get_savings_plans_utilization_details_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plans_utilization_details_request ->
    ( get_savings_plans_utilization_details_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves attribute data along with aggregate utilization and savings data for a given time \
   period. This doesn't support granular or grouped data (daily/monthly) in response. You can't \
   retrieve data by dates in a single response similar to [GetSavingsPlanUtilization], but you \
   have the option to make multiple calls to [GetSavingsPlanUtilizationDetails] by providing \
   individual dates. You can use [GetDimensionValues] in [SAVINGS_PLANS] to determine the possible \
   dimension values.\n\n\
  \   [GetSavingsPlanUtilizationDetails] internally groups data by [SavingsPlansArn].\n\
  \  \n\
  \   "]

module GetTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillExpirationException of bill_expiration_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RequestChangedException of request_changed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_tags_request ->
    ( get_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_tags_request ->
    ( get_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Queries for available tag keys and tag values for a specified period. You can search the tag \
   values for an arbitrary string. \n"]

module GetUsageForecast : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnresolvableUsageUnitException of unresolvable_usage_unit_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_usage_forecast_request ->
    ( get_usage_forecast_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnresolvableUsageUnitException of unresolvable_usage_unit_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_usage_forecast_request ->
    ( get_usage_forecast_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnresolvableUsageUnitException of unresolvable_usage_unit_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a forecast for how much Amazon Web Services predicts that you will use over the \
   forecast time period that you select, based on your past usage. \n"]

module ListCommitmentPurchaseAnalyses : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_commitment_purchase_analyses_request ->
    ( list_commitment_purchase_analyses_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_commitment_purchase_analyses_request ->
    ( list_commitment_purchase_analyses_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the commitment purchase analyses for your account.\n"]

module ListCostAllocationTagBackfillHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cost_allocation_tag_backfill_history_request ->
    ( list_cost_allocation_tag_backfill_history_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cost_allocation_tag_backfill_history_request ->
    ( list_cost_allocation_tag_backfill_history_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Retrieves a list of your historical cost allocation tag backfill requests. \n"]

module ListCostAllocationTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cost_allocation_tags_request ->
    ( list_cost_allocation_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cost_allocation_tags_request ->
    ( list_cost_allocation_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Get a list of cost allocation tags. All inputs in the API are optional and serve as filters. By \
   default, all cost allocation tags are returned. \n"]

module ListCostCategoryDefinitions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cost_category_definitions_request ->
    ( list_cost_category_definitions_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cost_category_definitions_request ->
    ( list_cost_category_definitions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the name, Amazon Resource Name (ARN), [NumberOfRules] and effective dates of all cost \
   categories defined in the account. You have the option to use [EffectiveOn] and \
   [SupportedResourceTypes] to return a list of cost categories that were active on a specific \
   date. If there is no [EffectiveOn] specified, you\226\128\153ll see cost categories that are \
   effective on the current date. If cost category is still effective, [EffectiveEnd] is omitted \
   in the response. [ListCostCategoryDefinitions] supports pagination. The request can have a \
   [MaxResults] range up to 100.\n"]

module ListCostCategoryResourceAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cost_category_resource_associations_request ->
    ( list_cost_category_resource_associations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cost_category_resource_associations_request ->
    ( list_cost_category_resource_associations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns resource associations of all cost categories defined in the account. You have the \
   option to use [CostCategoryArn] to get the association for a specific cost category. \
   [ListCostCategoryResourceAssociations] supports pagination. The request can have a [MaxResults] \
   range up to 100. \n"]

module ListSavingsPlansPurchaseRecommendationGeneration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_savings_plans_purchase_recommendation_generation_request ->
    ( list_savings_plans_purchase_recommendation_generation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_savings_plans_purchase_recommendation_generation_request ->
    ( list_savings_plans_purchase_recommendation_generation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of your historical recommendation generations within the past 30 days.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of resource tags associated with the resource specified by the Amazon Resource \
   Name (ARN). \n"]

module ProvideAnomalyFeedback : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    provide_anomaly_feedback_request ->
    ( provide_anomaly_feedback_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    provide_anomaly_feedback_request ->
    ( provide_anomaly_feedback_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the feedback property of a given cost anomaly. \n"]

module StartCommitmentPurchaseAnalysis : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `GenerationExistsException of generation_exists_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_commitment_purchase_analysis_request ->
    ( start_commitment_purchase_analysis_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `GenerationExistsException of generation_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_commitment_purchase_analysis_request ->
    ( start_commitment_purchase_analysis_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `GenerationExistsException of generation_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Specifies the parameters of a planned commitment purchase and starts the generation of the \
   analysis. This enables you to estimate the cost, coverage, and utilization impact of your \
   planned commitment purchases.\n"]

module StartCostAllocationTagBackfill : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BackfillLimitExceededException of backfill_limit_exceeded_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_cost_allocation_tag_backfill_request ->
    ( start_cost_allocation_tag_backfill_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackfillLimitExceededException of backfill_limit_exceeded_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_cost_allocation_tag_backfill_request ->
    ( start_cost_allocation_tag_backfill_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackfillLimitExceededException of backfill_limit_exceeded_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Request a cost allocation tag backfill. This will backfill the activation status (either \
   [active] or [inactive]) for all tag keys from [para:BackfillFrom] up to the time this request \
   is made.\n\n\
  \ You can request a backfill once every 24 hours. \n\
  \ "]

module StartSavingsPlansPurchaseRecommendationGeneration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `GenerationExistsException of generation_exists_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_savings_plans_purchase_recommendation_generation_request ->
    ( start_savings_plans_purchase_recommendation_generation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `GenerationExistsException of generation_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_savings_plans_purchase_recommendation_generation_request ->
    ( start_savings_plans_purchase_recommendation_generation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `GenerationExistsException of generation_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Requests a Savings Plans recommendation generation. This enables you to calculate a fresh set \
   of Savings Plans recommendations that takes your latest usage data and current Savings Plans \
   inventory into account. You can refresh Savings Plans recommendations up to three times daily \
   for a consolidated billing family.\n\n\
  \   [StartSavingsPlansPurchaseRecommendationGeneration] has no request syntax because no input \
   parameters are needed to support this operation.\n\
  \  \n\
  \   "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "An API operation for adding one or more tags (key-value pairs) to a resource.\n\n\
  \ You can use the [TagResource] operation with a resource that already has tags. If you specify \
   a new tag key for the resource, this tag is appended to the list of tags associated with the \
   resource. If you specify a tag key that is already associated with the resource, the new tag \
   value you specify replaces the previous value for that tag.\n\
  \ \n\
  \  Although the maximum number of array members is 200, user-tag maximum is 50. The remaining \
   are reserved for Amazon Web Services use.\n\
  \  "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes one or more tags from a resource. Specify only tag keys in your request. Don't specify \
   the value. \n"]

module UpdateAnomalyMonitor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `UnknownMonitorException of unknown_monitor_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_anomaly_monitor_request ->
    ( update_anomaly_monitor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_anomaly_monitor_request ->
    ( update_anomaly_monitor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing cost anomaly monitor. The changes made are applied going forward, and \
   doesn't change anomalies detected in the past. \n"]

module UpdateAnomalySubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `UnknownMonitorException of unknown_monitor_exception
    | `UnknownSubscriptionException of unknown_subscription_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_anomaly_subscription_request ->
    ( update_anomaly_subscription_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception
      | `UnknownSubscriptionException of unknown_subscription_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_anomaly_subscription_request ->
    ( update_anomaly_subscription_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception
      | `UnknownSubscriptionException of unknown_subscription_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing cost anomaly subscription. Specify the fields that you want to update. \
   Omitted fields are unchanged.\n\n\
  \  The JSON below describes the generic construct for each type. See \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_UpdateAnomalySubscription.html#API_UpdateAnomalySubscription_RequestParameters}Request \
   Parameters} for possible values as they apply to [AnomalySubscription].\n\
  \  \n\
  \   "]

module UpdateCostAllocationTagsStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_cost_allocation_tags_status_request ->
    ( update_cost_allocation_tags_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_cost_allocation_tags_status_request ->
    ( update_cost_allocation_tags_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates status for cost allocation tags in bulk, with maximum batch size of 20. If the tag \
   status that's updated is the same as the existing tag status, the request doesn't fail. \
   Instead, it doesn't have any effect on the tag status (for example, activating the active tag). \n"]

(** {1:Serialization and Deserialization} *)
module UpdateCostCategoryDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_cost_category_definition_request ->
    ( update_cost_category_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_cost_category_definition_request ->
    ( update_cost_category_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing cost category. Changes made to the cost category rules will be used to \
   categorize the current month\226\128\153s expenses and future expenses. This won\226\128\153t \
   change categorization for the previous months.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
