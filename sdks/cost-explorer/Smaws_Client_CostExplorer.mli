(** Cost Explorer client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_date_interval : end_:year_month_day -> start:year_month_day -> unit -> date_interval

val make_reservation_aggregates :
  ?unrealized_savings:unrealized_savings ->
  ?realized_savings:realized_savings ->
  ?ri_cost_for_unused_hours:ri_cost_for_unused_hours ->
  ?total_amortized_fee:total_amortized_fee ->
  ?amortized_recurring_fee:amortized_recurring_fee ->
  ?amortized_upfront_fee:amortized_upfront_fee ->
  ?total_potential_ri_savings:total_potential_ri_savings ->
  ?net_ri_savings:net_ri_savings ->
  ?on_demand_cost_of_ri_hours_used:on_demand_cost_of_ri_hours_used ->
  ?unused_units:unused_units ->
  ?unused_hours:unused_hours ->
  ?total_actual_units:total_actual_units ->
  ?total_actual_hours:total_actual_hours ->
  ?purchased_units:purchased_units ->
  ?purchased_hours:purchased_hours ->
  ?utilization_percentage_in_units:utilization_percentage_in_units ->
  ?utilization_percentage:utilization_percentage ->
  unit ->
  reservation_aggregates

val make_reservation_utilization_group :
  ?utilization:reservation_aggregates ->
  ?attributes:attributes ->
  ?value:reservation_group_value ->
  ?key:reservation_group_key ->
  unit ->
  reservation_utilization_group

val make_utilization_by_time :
  ?total:reservation_aggregates ->
  ?groups:reservation_utilization_groups ->
  ?time_period:date_interval ->
  unit ->
  utilization_by_time

val make_update_cost_category_definition_response :
  ?effective_start:zoned_date_time ->
  ?cost_category_arn:arn ->
  unit ->
  update_cost_category_definition_response

val make_dimension_values :
  ?match_options:match_options -> ?values:values -> ?key:dimension -> unit -> dimension_values

val make_tag_values :
  ?match_options:match_options -> ?values:values -> ?key:tag_key -> unit -> tag_values

val make_cost_category_values :
  ?match_options:match_options ->
  ?values:values ->
  ?key:cost_category_name ->
  unit ->
  cost_category_values

val make_expression :
  ?cost_categories:cost_category_values ->
  ?tags:tag_values ->
  ?dimensions:dimension_values ->
  ?not:expression ->
  ?and_:expressions ->
  ?\#or:expressions ->
  unit ->
  expression

val make_cost_category_inherited_value_dimension :
  ?dimension_key:generic_string ->
  ?dimension_name:cost_category_inherited_value_dimension_name ->
  unit ->
  cost_category_inherited_value_dimension

val make_cost_category_rule :
  ?type_:cost_category_rule_type ->
  ?inherited_value:cost_category_inherited_value_dimension ->
  ?rule:expression ->
  ?value:cost_category_value ->
  unit ->
  cost_category_rule

val make_cost_category_split_charge_rule_parameter :
  values:cost_category_split_charge_rule_parameter_values_list ->
  type_:cost_category_split_charge_rule_parameter_type ->
  unit ->
  cost_category_split_charge_rule_parameter

val make_cost_category_split_charge_rule :
  ?parameters:cost_category_split_charge_rule_parameters_list ->
  method_:cost_category_split_charge_method ->
  targets:cost_category_split_charge_rule_targets_list ->
  source:generic_string ->
  unit ->
  cost_category_split_charge_rule

val make_update_cost_category_definition_request :
  ?split_charge_rules:cost_category_split_charge_rules_list ->
  ?default_value:cost_category_value ->
  ?effective_start:zoned_date_time ->
  rules:cost_category_rules_list ->
  rule_version:cost_category_rule_version ->
  cost_category_arn:arn ->
  unit ->
  update_cost_category_definition_request

val make_update_cost_allocation_tags_status_error :
  ?message:error_message ->
  ?code:generic_string ->
  ?tag_key:tag_key ->
  unit ->
  update_cost_allocation_tags_status_error

val make_update_cost_allocation_tags_status_response :
  ?errors:update_cost_allocation_tags_status_errors ->
  unit ->
  update_cost_allocation_tags_status_response

val make_cost_allocation_tag_status_entry :
  status:cost_allocation_tag_status -> tag_key:tag_key -> unit -> cost_allocation_tag_status_entry

val make_update_cost_allocation_tags_status_request :
  cost_allocation_tags_status:cost_allocation_tag_status_list ->
  unit ->
  update_cost_allocation_tags_status_request

val make_update_anomaly_subscription_response :
  subscription_arn:generic_string -> unit -> update_anomaly_subscription_response

val make_subscriber :
  ?status:subscriber_status ->
  ?type_:subscriber_type ->
  ?address:subscriber_address ->
  unit ->
  subscriber

val make_update_anomaly_subscription_request :
  ?threshold_expression:expression ->
  ?subscription_name:generic_string ->
  ?subscribers:subscribers ->
  ?monitor_arn_list:monitor_arn_list ->
  ?frequency:anomaly_subscription_frequency ->
  ?threshold:nullable_non_negative_double ->
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
  resource_tag_keys:resource_tag_key_list -> resource_arn:arn -> unit -> untag_resource_request

val make_total_impact_filter :
  ?end_value:generic_double ->
  start_value:generic_double ->
  numeric_operator:numeric_operator ->
  unit ->
  total_impact_filter

val make_terminate_recommendation_detail :
  ?currency_code:generic_string ->
  ?estimated_monthly_savings:generic_string ->
  unit ->
  terminate_recommendation_detail

val make_ec2_resource_details :
  ?vcpu:generic_string ->
  ?storage:generic_string ->
  ?network_performance:generic_string ->
  ?memory:generic_string ->
  ?sku:generic_string ->
  ?region:generic_string ->
  ?platform:generic_string ->
  ?instance_type:generic_string ->
  ?hourly_on_demand_rate:generic_string ->
  unit ->
  ec2_resource_details

val make_resource_details : ?ec2_resource_details:ec2_resource_details -> unit -> resource_details

val make_ebs_resource_utilization :
  ?ebs_write_bytes_per_second:generic_string ->
  ?ebs_read_bytes_per_second:generic_string ->
  ?ebs_write_ops_per_second:generic_string ->
  ?ebs_read_ops_per_second:generic_string ->
  unit ->
  ebs_resource_utilization

val make_disk_resource_utilization :
  ?disk_write_bytes_per_second:generic_string ->
  ?disk_read_bytes_per_second:generic_string ->
  ?disk_write_ops_per_second:generic_string ->
  ?disk_read_ops_per_second:generic_string ->
  unit ->
  disk_resource_utilization

val make_network_resource_utilization :
  ?network_packets_out_per_second:generic_string ->
  ?network_packets_in_per_second:generic_string ->
  ?network_out_bytes_per_second:generic_string ->
  ?network_in_bytes_per_second:generic_string ->
  unit ->
  network_resource_utilization

val make_ec2_resource_utilization :
  ?network_resource_utilization:network_resource_utilization ->
  ?disk_resource_utilization:disk_resource_utilization ->
  ?ebs_resource_utilization:ebs_resource_utilization ->
  ?max_storage_utilization_percentage:generic_string ->
  ?max_memory_utilization_percentage:generic_string ->
  ?max_cpu_utilization_percentage:generic_string ->
  unit ->
  ec2_resource_utilization

val make_resource_utilization :
  ?ec2_resource_utilization:ec2_resource_utilization -> unit -> resource_utilization

val make_target_instance :
  ?platform_differences:platform_differences ->
  ?expected_resource_utilization:resource_utilization ->
  ?resource_details:resource_details ->
  ?default_target_instance:generic_boolean ->
  ?currency_code:generic_string ->
  ?estimated_monthly_savings:generic_string ->
  ?estimated_monthly_cost:generic_string ->
  unit ->
  target_instance

val make_tag_resource_response : unit -> unit
val make_resource_tag : value:resource_tag_value -> key:resource_tag_key -> unit -> resource_tag

val make_tag_resource_request :
  resource_tags:resource_tag_list -> resource_arn:arn -> unit -> tag_resource_request

val make_start_savings_plans_purchase_recommendation_generation_response :
  ?estimated_completion_time:zoned_date_time ->
  ?generation_started_time:zoned_date_time ->
  ?recommendation_id:recommendation_id ->
  unit ->
  start_savings_plans_purchase_recommendation_generation_response

val make_start_savings_plans_purchase_recommendation_generation_request : unit -> unit

val make_cost_allocation_tag_backfill_request :
  ?last_updated_at:zoned_date_time ->
  ?backfill_status:cost_allocation_tag_backfill_status ->
  ?completed_at:zoned_date_time ->
  ?requested_at:zoned_date_time ->
  ?backfill_from:zoned_date_time ->
  unit ->
  cost_allocation_tag_backfill_request

val make_start_cost_allocation_tag_backfill_response :
  ?backfill_request:cost_allocation_tag_backfill_request ->
  unit ->
  start_cost_allocation_tag_backfill_response

val make_start_cost_allocation_tag_backfill_request :
  backfill_from:zoned_date_time -> unit -> start_cost_allocation_tag_backfill_request

val make_start_commitment_purchase_analysis_response :
  estimated_completion_time:zoned_date_time ->
  analysis_started_time:zoned_date_time ->
  analysis_id:analysis_id ->
  unit ->
  start_commitment_purchase_analysis_response

val make_savings_plans :
  ?offering_id:generic_string ->
  ?savings_plans_commitment:savings_plans_commitment ->
  ?term_in_years:term_in_years ->
  ?instance_family:generic_string ->
  ?region:generic_string ->
  ?savings_plans_type:supported_savings_plans_type ->
  ?payment_option:payment_option ->
  unit ->
  savings_plans

val make_savings_plans_purchase_analysis_configuration :
  ?savings_plans_target_coverage:savings_plans_target_coverage ->
  ?savings_plans_to_exclude:savings_plans_to_exclude ->
  ?account_id:account_id ->
  ?account_scope:account_scope ->
  look_back_time_period:date_interval ->
  savings_plans_to_add:savings_plans_to_add ->
  analysis_type:analysis_type ->
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

val make_sort_definition :
  ?sort_order:sort_order -> key:sort_definition_key -> unit -> sort_definition

val make_ec2_specification : ?offering_class:offering_class -> unit -> ec2_specification

val make_service_specification :
  ?ec2_specification:ec2_specification -> unit -> service_specification

val make_savings_plans_utilization :
  ?utilization_percentage:generic_string ->
  ?unused_commitment:generic_string ->
  ?used_commitment:generic_string ->
  ?total_commitment:generic_string ->
  unit ->
  savings_plans_utilization

val make_savings_plans_savings :
  ?on_demand_cost_equivalent:generic_string ->
  ?net_savings:generic_string ->
  unit ->
  savings_plans_savings

val make_savings_plans_amortized_commitment :
  ?total_amortized_commitment:generic_string ->
  ?amortized_upfront_commitment:generic_string ->
  ?amortized_recurring_commitment:generic_string ->
  unit ->
  savings_plans_amortized_commitment

val make_savings_plans_utilization_by_time :
  ?amortized_commitment:savings_plans_amortized_commitment ->
  ?savings:savings_plans_savings ->
  utilization:savings_plans_utilization ->
  time_period:date_interval ->
  unit ->
  savings_plans_utilization_by_time

val make_savings_plans_utilization_detail :
  ?amortized_commitment:savings_plans_amortized_commitment ->
  ?savings:savings_plans_savings ->
  ?utilization:savings_plans_utilization ->
  ?attributes:attributes ->
  ?savings_plan_arn:savings_plan_arn ->
  unit ->
  savings_plans_utilization_detail

val make_savings_plans_utilization_aggregates :
  ?amortized_commitment:savings_plans_amortized_commitment ->
  ?savings:savings_plans_savings ->
  utilization:savings_plans_utilization ->
  unit ->
  savings_plans_utilization_aggregates

val make_savings_plans_purchase_recommendation_summary :
  ?estimated_on_demand_cost_with_current_commitment:generic_string ->
  ?estimated_monthly_savings_amount:generic_string ->
  ?estimated_savings_percentage:generic_string ->
  ?hourly_commitment_to_purchase:generic_string ->
  ?daily_commitment_to_purchase:generic_string ->
  ?total_recommendation_count:generic_string ->
  ?estimated_savings_amount:generic_string ->
  ?current_on_demand_spend:generic_string ->
  ?estimated_total_cost:generic_string ->
  ?currency_code:generic_string ->
  ?estimated_ro_i:generic_string ->
  unit ->
  savings_plans_purchase_recommendation_summary

val make_savings_plans_purchase_recommendation_metadata :
  ?additional_metadata:generic_string ->
  ?generation_timestamp:generic_string ->
  ?recommendation_id:generic_string ->
  unit ->
  savings_plans_purchase_recommendation_metadata

val make_savings_plans_details :
  ?offering_id:generic_string ->
  ?instance_family:generic_string ->
  ?region:generic_string ->
  unit ->
  savings_plans_details

val make_savings_plans_purchase_recommendation_detail :
  ?recommendation_detail_id:recommendation_detail_id ->
  ?current_average_hourly_on_demand_spend:generic_string ->
  ?current_maximum_hourly_on_demand_spend:generic_string ->
  ?current_minimum_hourly_on_demand_spend:generic_string ->
  ?estimated_monthly_savings_amount:generic_string ->
  ?estimated_average_utilization:generic_string ->
  ?hourly_commitment_to_purchase:generic_string ->
  ?estimated_savings_percentage:generic_string ->
  ?estimated_savings_amount:generic_string ->
  ?estimated_on_demand_cost_with_current_commitment:generic_string ->
  ?estimated_on_demand_cost:generic_string ->
  ?estimated_sp_cost:generic_string ->
  ?currency_code:generic_string ->
  ?estimated_ro_i:generic_string ->
  ?upfront_cost:generic_string ->
  ?account_id:generic_string ->
  ?savings_plans_details:savings_plans_details ->
  unit ->
  savings_plans_purchase_recommendation_detail

val make_savings_plans_purchase_recommendation :
  ?savings_plans_purchase_recommendation_summary:savings_plans_purchase_recommendation_summary ->
  ?savings_plans_purchase_recommendation_details:savings_plans_purchase_recommendation_detail_list ->
  ?lookback_period_in_days:lookback_period_in_days ->
  ?payment_option:payment_option ->
  ?term_in_years:term_in_years ->
  ?savings_plans_type:supported_savings_plans_type ->
  ?account_scope:account_scope ->
  unit ->
  savings_plans_purchase_recommendation

val make_recommendation_detail_hourly_metrics :
  ?estimated_new_commitment_utilization:generic_string ->
  ?estimated_coverage:generic_string ->
  ?current_coverage:generic_string ->
  ?estimated_on_demand_cost:generic_string ->
  ?start_time:zoned_date_time ->
  unit ->
  recommendation_detail_hourly_metrics

val make_savings_plans_purchase_analysis_details :
  ?metrics_over_lookback_period:metrics_over_lookback_period ->
  ?additional_metadata:generic_string ->
  ?upfront_cost:generic_string ->
  ?latest_usage_timestamp:generic_string ->
  ?estimated_commitment_cost:generic_string ->
  ?estimated_savings_percentage:generic_string ->
  ?estimated_savings_amount:generic_string ->
  ?estimated_ro_i:generic_string ->
  ?estimated_on_demand_cost_with_current_commitment:generic_string ->
  ?estimated_on_demand_cost:generic_string ->
  ?estimated_monthly_savings_amount:generic_string ->
  ?estimated_average_utilization:generic_string ->
  ?estimated_average_coverage:generic_string ->
  ?hourly_commitment_to_purchase:generic_string ->
  ?existing_hourly_commitment:generic_string ->
  ?current_on_demand_spend:generic_string ->
  ?current_minimum_hourly_on_demand_spend:generic_string ->
  ?current_maximum_hourly_on_demand_spend:generic_string ->
  ?current_average_hourly_on_demand_spend:generic_string ->
  ?current_average_coverage:generic_string ->
  ?lookback_period_in_hours:generic_string ->
  ?currency_code:generic_string ->
  unit ->
  savings_plans_purchase_analysis_details

val make_savings_plans_coverage_data :
  ?coverage_percentage:generic_string ->
  ?total_cost:generic_string ->
  ?on_demand_cost:generic_string ->
  ?spend_covered_by_savings_plans:generic_string ->
  unit ->
  savings_plans_coverage_data

val make_savings_plans_coverage :
  ?time_period:date_interval ->
  ?coverage:savings_plans_coverage_data ->
  ?attributes:attributes ->
  unit ->
  savings_plans_coverage

val make_root_cause_impact : contribution:generic_double -> unit -> root_cause_impact

val make_root_cause :
  ?impact:root_cause_impact ->
  ?usage_type:generic_string ->
  ?linked_account_name:generic_string ->
  ?linked_account:generic_string ->
  ?region:generic_string ->
  ?service:generic_string ->
  unit ->
  root_cause

val make_rightsizing_recommendation_summary :
  ?savings_percentage:generic_string ->
  ?savings_currency_code:generic_string ->
  ?estimated_total_monthly_savings_amount:generic_string ->
  ?total_recommendation_count:generic_string ->
  unit ->
  rightsizing_recommendation_summary

val make_rightsizing_recommendation_metadata :
  ?additional_metadata:generic_string ->
  ?lookback_period_in_days:lookback_period_in_days ->
  ?generation_timestamp:generic_string ->
  ?recommendation_id:generic_string ->
  unit ->
  rightsizing_recommendation_metadata

val make_current_instance :
  ?currency_code:generic_string ->
  ?monthly_cost:generic_string ->
  ?total_running_hours_in_lookback_period:generic_string ->
  ?on_demand_hours_in_lookback_period:generic_string ->
  ?savings_plans_covered_hours_in_lookback_period:generic_string ->
  ?reservation_covered_hours_in_lookback_period:generic_string ->
  ?resource_utilization:resource_utilization ->
  ?resource_details:resource_details ->
  ?tags:tag_values_list ->
  ?instance_name:generic_string ->
  ?resource_id:generic_string ->
  unit ->
  current_instance

val make_modify_recommendation_detail :
  ?target_instances:target_instances_list -> unit -> modify_recommendation_detail

val make_rightsizing_recommendation :
  ?finding_reason_codes:finding_reason_codes ->
  ?terminate_recommendation_detail:terminate_recommendation_detail ->
  ?modify_recommendation_detail:modify_recommendation_detail ->
  ?rightsizing_type:rightsizing_type ->
  ?current_instance:current_instance ->
  ?account_id:generic_string ->
  unit ->
  rightsizing_recommendation

val make_rightsizing_recommendation_configuration :
  benefits_considered:generic_boolean ->
  recommendation_target:recommendation_target ->
  unit ->
  rightsizing_recommendation_configuration

val make_metric_value : ?unit_:metric_unit -> ?amount:metric_amount -> unit -> metric_value
val make_group : ?metrics:metrics -> ?keys:keys -> unit -> group

val make_result_by_time :
  ?estimated:estimated ->
  ?groups:groups ->
  ?total:metrics ->
  ?time_period:date_interval ->
  unit ->
  result_by_time

val make_dynamo_db_capacity_details :
  ?region:generic_string -> ?capacity_units:generic_string -> unit -> dynamo_db_capacity_details

val make_reserved_capacity_details :
  ?dynamo_db_capacity_details:dynamo_db_capacity_details -> unit -> reserved_capacity_details

val make_ec2_instance_details :
  ?size_flex_eligible:generic_boolean ->
  ?current_generation:generic_boolean ->
  ?tenancy:generic_string ->
  ?platform:generic_string ->
  ?availability_zone:generic_string ->
  ?region:generic_string ->
  ?instance_type:generic_string ->
  ?family:generic_string ->
  unit ->
  ec2_instance_details

val make_rds_instance_details :
  ?deployment_model:generic_string ->
  ?size_flex_eligible:generic_boolean ->
  ?current_generation:generic_boolean ->
  ?license_model:generic_string ->
  ?deployment_option:generic_string ->
  ?database_edition:generic_string ->
  ?database_engine:generic_string ->
  ?region:generic_string ->
  ?instance_type:generic_string ->
  ?family:generic_string ->
  unit ->
  rds_instance_details

val make_redshift_instance_details :
  ?size_flex_eligible:generic_boolean ->
  ?current_generation:generic_boolean ->
  ?region:generic_string ->
  ?node_type:generic_string ->
  ?family:generic_string ->
  unit ->
  redshift_instance_details

val make_elasti_cache_instance_details :
  ?size_flex_eligible:generic_boolean ->
  ?current_generation:generic_boolean ->
  ?product_description:generic_string ->
  ?region:generic_string ->
  ?node_type:generic_string ->
  ?family:generic_string ->
  unit ->
  elasti_cache_instance_details

val make_es_instance_details :
  ?size_flex_eligible:generic_boolean ->
  ?current_generation:generic_boolean ->
  ?region:generic_string ->
  ?instance_size:generic_string ->
  ?instance_class:generic_string ->
  unit ->
  es_instance_details

val make_memory_db_instance_details :
  ?size_flex_eligible:generic_boolean ->
  ?current_generation:generic_boolean ->
  ?region:generic_string ->
  ?node_type:generic_string ->
  ?family:generic_string ->
  unit ->
  memory_db_instance_details

val make_instance_details :
  ?memory_db_instance_details:memory_db_instance_details ->
  ?es_instance_details:es_instance_details ->
  ?elasti_cache_instance_details:elasti_cache_instance_details ->
  ?redshift_instance_details:redshift_instance_details ->
  ?rds_instance_details:rds_instance_details ->
  ?ec2_instance_details:ec2_instance_details ->
  unit ->
  instance_details

val make_reservation_purchase_recommendation_detail :
  ?average_number_of_capacity_units_used_per_hour:generic_string ->
  ?maximum_number_of_capacity_units_used_per_hour:generic_string ->
  ?minimum_number_of_capacity_units_used_per_hour:generic_string ->
  ?recommended_number_of_capacity_units_to_purchase:generic_string ->
  ?reserved_capacity_details:reserved_capacity_details ->
  ?recurring_standard_monthly_cost:generic_string ->
  ?upfront_cost:generic_string ->
  ?estimated_reservation_cost_for_lookback_period:generic_string ->
  ?estimated_monthly_on_demand_cost:generic_string ->
  ?estimated_monthly_savings_percentage:generic_string ->
  ?estimated_monthly_savings_amount:generic_string ->
  ?currency_code:generic_string ->
  ?estimated_break_even_in_months:generic_string ->
  ?average_utilization:generic_string ->
  ?average_normalized_units_used_per_hour:generic_string ->
  ?average_number_of_instances_used_per_hour:generic_string ->
  ?maximum_normalized_units_used_per_hour:generic_string ->
  ?maximum_number_of_instances_used_per_hour:generic_string ->
  ?minimum_normalized_units_used_per_hour:generic_string ->
  ?minimum_number_of_instances_used_per_hour:generic_string ->
  ?recommended_normalized_units_to_purchase:generic_string ->
  ?recommended_number_of_instances_to_purchase:generic_string ->
  ?instance_details:instance_details ->
  ?account_id:generic_string ->
  unit ->
  reservation_purchase_recommendation_detail

val make_reservation_purchase_recommendation_summary :
  ?currency_code:generic_string ->
  ?total_estimated_monthly_savings_percentage:generic_string ->
  ?total_estimated_monthly_savings_amount:generic_string ->
  unit ->
  reservation_purchase_recommendation_summary

val make_reservation_purchase_recommendation :
  ?recommendation_summary:reservation_purchase_recommendation_summary ->
  ?recommendation_details:reservation_purchase_recommendation_details ->
  ?service_specification:service_specification ->
  ?payment_option:payment_option ->
  ?term_in_years:term_in_years ->
  ?lookback_period_in_days:lookback_period_in_days ->
  ?account_scope:account_scope ->
  unit ->
  reservation_purchase_recommendation

val make_reservation_purchase_recommendation_metadata :
  ?additional_metadata:generic_string ->
  ?generation_timestamp:generic_string ->
  ?recommendation_id:generic_string ->
  unit ->
  reservation_purchase_recommendation_metadata

val make_coverage_hours :
  ?coverage_hours_percentage:coverage_hours_percentage ->
  ?total_running_hours:total_running_hours ->
  ?reserved_hours:reserved_hours ->
  ?on_demand_hours:on_demand_hours ->
  unit ->
  coverage_hours

val make_coverage_normalized_units :
  ?coverage_normalized_units_percentage:coverage_normalized_units_percentage ->
  ?total_running_normalized_units:total_running_normalized_units ->
  ?reserved_normalized_units:reserved_normalized_units ->
  ?on_demand_normalized_units:on_demand_normalized_units ->
  unit ->
  coverage_normalized_units

val make_coverage_cost : ?on_demand_cost:on_demand_cost -> unit -> coverage_cost

val make_coverage :
  ?coverage_cost:coverage_cost ->
  ?coverage_normalized_units:coverage_normalized_units ->
  ?coverage_hours:coverage_hours ->
  unit ->
  coverage

val make_reservation_coverage_group :
  ?coverage:coverage -> ?attributes:attributes -> unit -> reservation_coverage_group

val make_recommendation_detail_data :
  ?metrics_over_lookback_period:metrics_over_lookback_period ->
  ?estimated_average_coverage:generic_string ->
  ?current_average_coverage:generic_string ->
  ?upfront_cost:generic_string ->
  ?hourly_commitment_to_purchase:generic_string ->
  ?existing_hourly_commitment:generic_string ->
  ?estimated_savings_percentage:generic_string ->
  ?estimated_savings_amount:generic_string ->
  ?estimated_sp_cost:generic_string ->
  ?estimated_ro_i:generic_string ->
  ?estimated_on_demand_cost_with_current_commitment:generic_string ->
  ?estimated_on_demand_cost:generic_string ->
  ?estimated_monthly_savings_amount:generic_string ->
  ?estimated_average_utilization:generic_string ->
  ?current_minimum_hourly_on_demand_spend:generic_string ->
  ?current_maximum_hourly_on_demand_spend:generic_string ->
  ?current_average_hourly_on_demand_spend:generic_string ->
  ?latest_usage_timestamp:zoned_date_time ->
  ?generation_timestamp:zoned_date_time ->
  ?offering_id:generic_string ->
  ?region:generic_string ->
  ?instance_family:generic_string ->
  ?currency_code:generic_string ->
  ?account_id:generic_string ->
  ?payment_option:payment_option ->
  ?term_in_years:term_in_years ->
  ?savings_plans_type:supported_savings_plans_type ->
  ?lookback_period_in_days:lookback_period_in_days ->
  ?account_scope:account_scope ->
  unit ->
  recommendation_detail_data

val make_provide_anomaly_feedback_response :
  anomaly_id:generic_string -> unit -> provide_anomaly_feedback_response

val make_provide_anomaly_feedback_request :
  feedback:anomaly_feedback_type ->
  anomaly_id:generic_string ->
  unit ->
  provide_anomaly_feedback_request

val make_list_tags_for_resource_response :
  ?resource_tags:resource_tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_generation_summary :
  ?estimated_completion_time:zoned_date_time ->
  ?generation_completion_time:zoned_date_time ->
  ?generation_started_time:zoned_date_time ->
  ?generation_status:generation_status ->
  ?recommendation_id:recommendation_id ->
  unit ->
  generation_summary

val make_list_savings_plans_purchase_recommendation_generation_response :
  ?next_page_token:next_page_token ->
  ?generation_summary_list:generation_summary_list ->
  unit ->
  list_savings_plans_purchase_recommendation_generation_response

val make_list_savings_plans_purchase_recommendation_generation_request :
  ?next_page_token:next_page_token ->
  ?page_size:recommendations_page_size ->
  ?recommendation_ids:recommendation_id_list ->
  ?generation_status:generation_status ->
  unit ->
  list_savings_plans_purchase_recommendation_generation_request

val make_cost_category_resource_association :
  ?cost_category_arn:arn ->
  ?cost_category_name:cost_category_name ->
  ?resource_arn:generic_arn ->
  unit ->
  cost_category_resource_association

val make_list_cost_category_resource_associations_response :
  ?next_token:next_page_token ->
  ?cost_category_resource_associations:cost_category_resource_associations ->
  unit ->
  list_cost_category_resource_associations_response

val make_list_cost_category_resource_associations_request :
  ?max_results:cost_category_max_results ->
  ?next_token:next_page_token ->
  ?cost_category_arn:arn ->
  unit ->
  list_cost_category_resource_associations_request

val make_cost_category_processing_status :
  ?status:cost_category_status ->
  ?component:cost_category_status_component ->
  unit ->
  cost_category_processing_status

val make_cost_category_reference :
  ?supported_resource_types:resource_types ->
  ?default_value:cost_category_value ->
  ?values:cost_category_values_list ->
  ?processing_status:cost_category_processing_status_list ->
  ?number_of_rules:non_negative_integer ->
  ?effective_end:zoned_date_time ->
  ?effective_start:zoned_date_time ->
  ?name:cost_category_name ->
  ?cost_category_arn:arn ->
  unit ->
  cost_category_reference

val make_list_cost_category_definitions_response :
  ?next_token:next_page_token ->
  ?cost_category_references:cost_category_references_list ->
  unit ->
  list_cost_category_definitions_response

val make_list_cost_category_definitions_request :
  ?supported_resource_types:resource_types_filter_input ->
  ?max_results:cost_category_max_results ->
  ?next_token:next_page_token ->
  ?effective_on:zoned_date_time ->
  unit ->
  list_cost_category_definitions_request

val make_cost_allocation_tag :
  ?last_used_date:zoned_date_time ->
  ?last_updated_date:zoned_date_time ->
  status:cost_allocation_tag_status ->
  type_:cost_allocation_tag_type ->
  tag_key:tag_key ->
  unit ->
  cost_allocation_tag

val make_list_cost_allocation_tags_response :
  ?next_token:next_page_token ->
  ?cost_allocation_tags:cost_allocation_tag_list ->
  unit ->
  list_cost_allocation_tags_response

val make_list_cost_allocation_tags_request :
  ?max_results:cost_allocation_tags_max_results ->
  ?next_token:next_page_token ->
  ?type_:cost_allocation_tag_type ->
  ?tag_keys:cost_allocation_tag_key_list ->
  ?status:cost_allocation_tag_status ->
  unit ->
  list_cost_allocation_tags_request

val make_list_cost_allocation_tag_backfill_history_response :
  ?next_token:next_page_token ->
  ?backfill_requests:cost_allocation_tag_backfill_request_list ->
  unit ->
  list_cost_allocation_tag_backfill_history_response

val make_list_cost_allocation_tag_backfill_history_request :
  ?max_results:cost_allocation_tags_max_results ->
  ?next_token:next_page_token ->
  unit ->
  list_cost_allocation_tag_backfill_history_request

val make_analysis_summary :
  ?commitment_purchase_analysis_configuration:commitment_purchase_analysis_configuration ->
  ?analysis_id:analysis_id ->
  ?error_code:error_code ->
  ?analysis_status:analysis_status ->
  ?analysis_started_time:zoned_date_time ->
  ?analysis_completion_time:zoned_date_time ->
  ?estimated_completion_time:zoned_date_time ->
  unit ->
  analysis_summary

val make_list_commitment_purchase_analyses_response :
  ?next_page_token:next_page_token ->
  ?analysis_summary_list:analysis_summary_list ->
  unit ->
  list_commitment_purchase_analyses_response

val make_list_commitment_purchase_analyses_request :
  ?analysis_ids:analysis_ids ->
  ?page_size:analyses_page_size ->
  ?next_page_token:next_page_token ->
  ?analysis_status:analysis_status ->
  unit ->
  list_commitment_purchase_analyses_request

val make_impact :
  ?total_impact_percentage:nullable_non_negative_double ->
  ?total_expected_spend:nullable_non_negative_double ->
  ?total_actual_spend:nullable_non_negative_double ->
  ?total_impact:generic_double ->
  max_impact:generic_double ->
  unit ->
  impact

val make_group_definition :
  ?key:group_definition_key -> ?type_:group_definition_type -> unit -> group_definition

val make_get_usage_forecast_response :
  ?forecast_results_by_time:forecast_results_by_time ->
  ?total:metric_value ->
  unit ->
  get_usage_forecast_response

val make_get_usage_forecast_request :
  ?prediction_interval_level:prediction_interval_level ->
  ?billing_view_arn:billing_view_arn ->
  ?filter:expression ->
  granularity:granularity ->
  metric:metric ->
  time_period:date_interval ->
  unit ->
  get_usage_forecast_request

val make_get_tags_response :
  ?next_page_token:next_page_token ->
  total_size:page_size ->
  return_size:page_size ->
  tags:tag_list ->
  unit ->
  get_tags_response

val make_get_tags_request :
  ?next_page_token:next_page_token ->
  ?max_results:max_results ->
  ?billing_view_arn:billing_view_arn ->
  ?sort_by:sort_definitions ->
  ?filter:expression ->
  ?tag_key:tag_key ->
  ?search_string:search_string ->
  time_period:date_interval ->
  unit ->
  get_tags_request

val make_get_savings_plans_utilization_response :
  ?savings_plans_utilizations_by_time:savings_plans_utilizations_by_time ->
  total:savings_plans_utilization_aggregates ->
  unit ->
  get_savings_plans_utilization_response

val make_get_savings_plans_utilization_request :
  ?sort_by:sort_definition ->
  ?filter:expression ->
  ?granularity:granularity ->
  time_period:date_interval ->
  unit ->
  get_savings_plans_utilization_request

val make_get_savings_plans_utilization_details_response :
  ?next_token:next_page_token ->
  ?total:savings_plans_utilization_aggregates ->
  time_period:date_interval ->
  savings_plans_utilization_details:savings_plans_utilization_details ->
  unit ->
  get_savings_plans_utilization_details_response

val make_get_savings_plans_utilization_details_request :
  ?sort_by:sort_definition ->
  ?max_results:max_results ->
  ?next_token:next_page_token ->
  ?data_type:savings_plans_data_types ->
  ?filter:expression ->
  time_period:date_interval ->
  unit ->
  get_savings_plans_utilization_details_request

val make_get_savings_plans_purchase_recommendation_response :
  ?next_page_token:next_page_token ->
  ?savings_plans_purchase_recommendation:savings_plans_purchase_recommendation ->
  ?metadata:savings_plans_purchase_recommendation_metadata ->
  unit ->
  get_savings_plans_purchase_recommendation_response

val make_get_savings_plans_purchase_recommendation_request :
  ?filter:expression ->
  ?page_size:recommendations_page_size ->
  ?next_page_token:next_page_token ->
  ?account_scope:account_scope ->
  lookback_period_in_days:lookback_period_in_days ->
  payment_option:payment_option ->
  term_in_years:term_in_years ->
  savings_plans_type:supported_savings_plans_type ->
  unit ->
  get_savings_plans_purchase_recommendation_request

val make_get_savings_plans_coverage_response :
  ?next_token:next_page_token ->
  savings_plans_coverages:savings_plans_coverages ->
  unit ->
  get_savings_plans_coverage_response

val make_get_savings_plans_coverage_request :
  ?sort_by:sort_definition ->
  ?max_results:max_results ->
  ?next_token:next_page_token ->
  ?metrics:metric_names ->
  ?filter:expression ->
  ?granularity:granularity ->
  ?group_by:group_definitions ->
  time_period:date_interval ->
  unit ->
  get_savings_plans_coverage_request

val make_get_savings_plan_purchase_recommendation_details_response :
  ?recommendation_detail_data:recommendation_detail_data ->
  ?recommendation_detail_id:recommendation_detail_id ->
  unit ->
  get_savings_plan_purchase_recommendation_details_response

val make_get_savings_plan_purchase_recommendation_details_request :
  recommendation_detail_id:recommendation_detail_id ->
  unit ->
  get_savings_plan_purchase_recommendation_details_request

val make_get_rightsizing_recommendation_response :
  ?configuration:rightsizing_recommendation_configuration ->
  ?next_page_token:next_page_token ->
  ?rightsizing_recommendations:rightsizing_recommendation_list ->
  ?summary:rightsizing_recommendation_summary ->
  ?metadata:rightsizing_recommendation_metadata ->
  unit ->
  get_rightsizing_recommendation_response

val make_get_rightsizing_recommendation_request :
  ?next_page_token:next_page_token ->
  ?page_size:recommendations_page_size ->
  ?configuration:rightsizing_recommendation_configuration ->
  ?filter:expression ->
  service:generic_string ->
  unit ->
  get_rightsizing_recommendation_request

val make_get_reservation_utilization_response :
  ?next_page_token:next_page_token ->
  ?total:reservation_aggregates ->
  utilizations_by_time:utilizations_by_time ->
  unit ->
  get_reservation_utilization_response

val make_get_reservation_utilization_request :
  ?max_results:max_results ->
  ?next_page_token:next_page_token ->
  ?sort_by:sort_definition ->
  ?filter:expression ->
  ?granularity:granularity ->
  ?group_by:group_definitions ->
  time_period:date_interval ->
  unit ->
  get_reservation_utilization_request

val make_get_reservation_purchase_recommendation_response :
  ?next_page_token:next_page_token ->
  ?recommendations:reservation_purchase_recommendations ->
  ?metadata:reservation_purchase_recommendation_metadata ->
  unit ->
  get_reservation_purchase_recommendation_response

val make_get_reservation_purchase_recommendation_request :
  ?next_page_token:next_page_token ->
  ?page_size:recommendations_page_size ->
  ?service_specification:service_specification ->
  ?payment_option:payment_option ->
  ?term_in_years:term_in_years ->
  ?lookback_period_in_days:lookback_period_in_days ->
  ?account_scope:account_scope ->
  ?filter:expression ->
  ?account_id:generic_string ->
  service:generic_string ->
  unit ->
  get_reservation_purchase_recommendation_request

val make_coverage_by_time :
  ?total:coverage ->
  ?groups:reservation_coverage_groups ->
  ?time_period:date_interval ->
  unit ->
  coverage_by_time

val make_get_reservation_coverage_response :
  ?next_page_token:next_page_token ->
  ?total:coverage ->
  coverages_by_time:coverages_by_time ->
  unit ->
  get_reservation_coverage_response

val make_get_reservation_coverage_request :
  ?max_results:max_results ->
  ?sort_by:sort_definition ->
  ?next_page_token:next_page_token ->
  ?metrics:metric_names ->
  ?filter:expression ->
  ?granularity:granularity ->
  ?group_by:group_definitions ->
  time_period:date_interval ->
  unit ->
  get_reservation_coverage_request

val make_dimension_values_with_attributes :
  ?attributes:attributes -> ?value:value -> unit -> dimension_values_with_attributes

val make_get_dimension_values_response :
  ?next_page_token:next_page_token ->
  total_size:page_size ->
  return_size:page_size ->
  dimension_values:dimension_values_with_attributes_list ->
  unit ->
  get_dimension_values_response

val make_get_dimension_values_request :
  ?next_page_token:next_page_token ->
  ?max_results:max_results ->
  ?billing_view_arn:billing_view_arn ->
  ?sort_by:sort_definitions ->
  ?filter:expression ->
  ?context:context ->
  ?search_string:search_string ->
  dimension:dimension ->
  time_period:date_interval ->
  unit ->
  get_dimension_values_request

val make_get_cost_forecast_response :
  ?forecast_results_by_time:forecast_results_by_time ->
  ?total:metric_value ->
  unit ->
  get_cost_forecast_response

val make_get_cost_forecast_request :
  ?prediction_interval_level:prediction_interval_level ->
  ?billing_view_arn:billing_view_arn ->
  ?filter:expression ->
  granularity:granularity ->
  metric:metric ->
  time_period:date_interval ->
  unit ->
  get_cost_forecast_request

val make_comparison_metric_value :
  ?unit_:generic_string ->
  ?difference:generic_string ->
  ?comparison_time_period_amount:generic_string ->
  ?baseline_time_period_amount:generic_string ->
  unit ->
  comparison_metric_value

val make_cost_driver :
  ?metrics:comparison_metrics ->
  ?name:generic_string ->
  ?type_:generic_string ->
  unit ->
  cost_driver

val make_cost_comparison_driver :
  ?cost_drivers:cost_drivers ->
  ?metrics:comparison_metrics ->
  ?cost_selector:expression ->
  unit ->
  cost_comparison_driver

val make_get_cost_comparison_drivers_response :
  ?next_page_token:next_page_token ->
  ?cost_comparison_drivers:cost_comparison_drivers ->
  unit ->
  get_cost_comparison_drivers_response

val make_get_cost_comparison_drivers_request :
  ?next_page_token:next_page_token ->
  ?max_results:cost_comparison_drivers_max_results ->
  ?group_by:group_definitions ->
  ?filter:expression ->
  ?billing_view_arn:billing_view_arn ->
  metric_for_comparison:metric_name ->
  comparison_time_period:date_interval ->
  baseline_time_period:date_interval ->
  unit ->
  get_cost_comparison_drivers_request

val make_get_cost_categories_response :
  ?cost_category_values:cost_category_values_list ->
  ?cost_category_names:cost_category_names_list ->
  ?next_page_token:next_page_token ->
  total_size:page_size ->
  return_size:page_size ->
  unit ->
  get_cost_categories_response

val make_get_cost_categories_request :
  ?next_page_token:next_page_token ->
  ?max_results:max_results ->
  ?billing_view_arn:billing_view_arn ->
  ?sort_by:sort_definitions ->
  ?filter:expression ->
  ?cost_category_name:cost_category_name ->
  ?search_string:search_string ->
  time_period:date_interval ->
  unit ->
  get_cost_categories_request

val make_get_cost_and_usage_with_resources_response :
  ?dimension_value_attributes:dimension_values_with_attributes_list ->
  ?results_by_time:results_by_time ->
  ?group_definitions:group_definitions ->
  ?next_page_token:next_page_token ->
  unit ->
  get_cost_and_usage_with_resources_response

val make_get_cost_and_usage_with_resources_request :
  ?next_page_token:next_page_token ->
  ?billing_view_arn:billing_view_arn ->
  ?group_by:group_definitions ->
  ?metrics:metric_names ->
  filter:expression ->
  granularity:granularity ->
  time_period:date_interval ->
  unit ->
  get_cost_and_usage_with_resources_request

val make_get_cost_and_usage_response :
  ?dimension_value_attributes:dimension_values_with_attributes_list ->
  ?results_by_time:results_by_time ->
  ?group_definitions:group_definitions ->
  ?next_page_token:next_page_token ->
  unit ->
  get_cost_and_usage_response

val make_get_cost_and_usage_request :
  ?next_page_token:next_page_token ->
  ?billing_view_arn:billing_view_arn ->
  ?group_by:group_definitions ->
  ?filter:expression ->
  metrics:metric_names ->
  granularity:granularity ->
  time_period:date_interval ->
  unit ->
  get_cost_and_usage_request

val make_cost_and_usage_comparison :
  ?metrics:comparison_metrics ->
  ?cost_and_usage_selector:expression ->
  unit ->
  cost_and_usage_comparison

val make_get_cost_and_usage_comparisons_response :
  ?next_page_token:next_page_token ->
  ?total_cost_and_usage:comparison_metrics ->
  ?cost_and_usage_comparisons:cost_and_usage_comparisons ->
  unit ->
  get_cost_and_usage_comparisons_response

val make_get_cost_and_usage_comparisons_request :
  ?next_page_token:next_page_token ->
  ?max_results:cost_and_usage_comparisons_max_results ->
  ?group_by:group_definitions ->
  ?filter:expression ->
  ?billing_view_arn:billing_view_arn ->
  metric_for_comparison:metric_name ->
  comparison_time_period:date_interval ->
  baseline_time_period:date_interval ->
  unit ->
  get_cost_and_usage_comparisons_request

val make_analysis_details :
  ?savings_plans_purchase_analysis_details:savings_plans_purchase_analysis_details ->
  unit ->
  analysis_details

val make_get_commitment_purchase_analysis_response :
  ?analysis_details:analysis_details ->
  ?error_code:error_code ->
  ?analysis_completion_time:zoned_date_time ->
  commitment_purchase_analysis_configuration:commitment_purchase_analysis_configuration ->
  analysis_status:analysis_status ->
  analysis_id:analysis_id ->
  analysis_started_time:zoned_date_time ->
  estimated_completion_time:zoned_date_time ->
  unit ->
  get_commitment_purchase_analysis_response

val make_get_commitment_purchase_analysis_request :
  analysis_id:analysis_id -> unit -> get_commitment_purchase_analysis_request

val make_get_approximate_usage_records_response :
  ?lookback_period:date_interval ->
  ?total_records:non_negative_long ->
  ?services:approximate_usage_records_per_service ->
  unit ->
  get_approximate_usage_records_response

val make_get_approximate_usage_records_request :
  ?services:usage_services ->
  approximation_dimension:approximation_dimension ->
  granularity:granularity ->
  unit ->
  get_approximate_usage_records_request

val make_anomaly_subscription :
  ?threshold_expression:expression ->
  ?threshold:nullable_non_negative_double ->
  ?account_id:generic_string ->
  ?subscription_arn:generic_string ->
  subscription_name:generic_string ->
  frequency:anomaly_subscription_frequency ->
  subscribers:subscribers ->
  monitor_arn_list:monitor_arn_list ->
  unit ->
  anomaly_subscription

val make_get_anomaly_subscriptions_response :
  ?next_page_token:next_page_token ->
  anomaly_subscriptions:anomaly_subscriptions ->
  unit ->
  get_anomaly_subscriptions_response

val make_get_anomaly_subscriptions_request :
  ?max_results:page_size ->
  ?next_page_token:next_page_token ->
  ?monitor_arn:generic_string ->
  ?subscription_arn_list:values ->
  unit ->
  get_anomaly_subscriptions_request

val make_anomaly_monitor :
  ?dimensional_value_count:non_negative_integer ->
  ?monitor_specification:expression ->
  ?monitor_dimension:monitor_dimension ->
  ?last_evaluated_date:year_month_day ->
  ?last_updated_date:year_month_day ->
  ?creation_date:year_month_day ->
  ?monitor_arn:generic_string ->
  monitor_type:monitor_type ->
  monitor_name:generic_string ->
  unit ->
  anomaly_monitor

val make_get_anomaly_monitors_response :
  ?next_page_token:next_page_token ->
  anomaly_monitors:anomaly_monitors ->
  unit ->
  get_anomaly_monitors_response

val make_get_anomaly_monitors_request :
  ?max_results:page_size ->
  ?next_page_token:next_page_token ->
  ?monitor_arn_list:values ->
  unit ->
  get_anomaly_monitors_request

val make_anomaly_score :
  current_score:generic_double -> max_score:generic_double -> unit -> anomaly_score

val make_anomaly :
  ?feedback:anomaly_feedback_type ->
  ?root_causes:root_causes ->
  ?dimension_value:generic_string ->
  ?anomaly_end_date:year_month_day ->
  ?anomaly_start_date:year_month_day ->
  monitor_arn:generic_string ->
  impact:impact ->
  anomaly_score:anomaly_score ->
  anomaly_id:generic_string ->
  unit ->
  anomaly

val make_get_anomalies_response :
  ?next_page_token:next_page_token -> anomalies:anomalies -> unit -> get_anomalies_response

val make_anomaly_date_interval :
  ?end_date:year_month_day -> start_date:year_month_day -> unit -> anomaly_date_interval

val make_get_anomalies_request :
  ?max_results:page_size ->
  ?next_page_token:next_page_token ->
  ?total_impact:total_impact_filter ->
  ?feedback:anomaly_feedback_type ->
  ?monitor_arn:generic_string ->
  date_interval:anomaly_date_interval ->
  unit ->
  get_anomalies_request

val make_cost_category :
  ?default_value:cost_category_value ->
  ?processing_status:cost_category_processing_status_list ->
  ?split_charge_rules:cost_category_split_charge_rules_list ->
  ?effective_end:zoned_date_time ->
  rules:cost_category_rules_list ->
  rule_version:cost_category_rule_version ->
  name:cost_category_name ->
  effective_start:zoned_date_time ->
  cost_category_arn:arn ->
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
  ?effective_end:zoned_date_time ->
  ?cost_category_arn:arn ->
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
  ?effective_start:zoned_date_time ->
  ?cost_category_arn:arn ->
  unit ->
  create_cost_category_definition_response

val make_create_cost_category_definition_request :
  ?resource_tags:resource_tag_list ->
  ?split_charge_rules:cost_category_split_charge_rules_list ->
  ?default_value:cost_category_value ->
  ?effective_start:zoned_date_time ->
  rules:cost_category_rules_list ->
  rule_version:cost_category_rule_version ->
  name:cost_category_name ->
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
