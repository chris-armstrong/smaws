(** Cost Optimization Hub client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_usage :
  ?unit_:Smaws_Lib.Smithy_api.Types.string_ ->
  ?product_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?operation:Smaws_Lib.Smithy_api.Types.string_ ->
  ?usage_amount:Smaws_Lib.Smithy_api.Types.double ->
  ?usage_type:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  usage

val make_estimated_discounts :
  ?other_discount:Smaws_Lib.Smithy_api.Types.double ->
  ?reserved_instances_discount:Smaws_Lib.Smithy_api.Types.double ->
  ?savings_plans_discount:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  estimated_discounts

val make_resource_pricing :
  ?estimated_cost_after_discounts:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_discounts:estimated_discounts ->
  ?estimated_net_unused_amortized_commitments:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_cost_before_discounts:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  resource_pricing

val make_resource_cost_calculation :
  ?pricing:resource_pricing -> ?usages:usage_list -> unit -> resource_cost_calculation

val make_work_spaces : ?cost_calculation:resource_cost_calculation -> unit -> work_spaces

val make_validation_exception_detail :
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  field_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_detail

val make_preferred_commitment :
  ?payment_option:payment_option -> ?term:term -> unit -> preferred_commitment

val make_update_preferences_response :
  ?preferred_commitment:preferred_commitment ->
  ?member_account_discount_visibility:member_account_discount_visibility ->
  ?savings_estimation_mode:savings_estimation_mode ->
  unit ->
  update_preferences_response

val make_update_preferences_request :
  ?preferred_commitment:preferred_commitment ->
  ?member_account_discount_visibility:member_account_discount_visibility ->
  ?savings_estimation_mode:savings_estimation_mode ->
  unit ->
  update_preferences_request

val make_update_enrollment_status_response :
  ?status:Smaws_Lib.Smithy_api.Types.string_ -> unit -> update_enrollment_status_response

val make_update_enrollment_status_request :
  ?include_member_accounts:Smaws_Lib.Smithy_api.Types.boolean_ ->
  status:enrollment_status ->
  unit ->
  update_enrollment_status_request

val make_time_period :
  end_:Smaws_Lib.Smithy_api.Types.string_ ->
  start:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  time_period

val make_tag :
  ?value:Smaws_Lib.Smithy_api.Types.string_ ->
  ?key:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  tag

val make_storage_configuration :
  ?size_in_gb:Smaws_Lib.Smithy_api.Types.double ->
  ?type_:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  storage_configuration

val make_savings_plans_pricing :
  ?estimated_on_demand_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?savings_percentage:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_monthly_commitment:Smaws_Lib.Smithy_api.Types.double ->
  ?monthly_savings_plans_eligible_cost:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  savings_plans_pricing

val make_savings_plans_cost_calculation :
  ?pricing:savings_plans_pricing -> unit -> savings_plans_cost_calculation

val make_sage_maker_savings_plans_configuration :
  ?hourly_commitment:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  sage_maker_savings_plans_configuration

val make_sage_maker_savings_plans :
  ?cost_calculation:savings_plans_cost_calculation ->
  ?configuration:sage_maker_savings_plans_configuration ->
  unit ->
  sage_maker_savings_plans

val make_sage_maker_endpoint :
  ?cost_calculation:resource_cost_calculation -> unit -> sage_maker_endpoint

val make_compute_configuration :
  ?platform:Smaws_Lib.Smithy_api.Types.string_ ->
  ?architecture:Smaws_Lib.Smithy_api.Types.string_ ->
  ?memory_size_in_m_b:Smaws_Lib.Smithy_api.Types.integer ->
  ?v_cpu:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  compute_configuration

val make_lambda_function_configuration :
  ?compute:compute_configuration -> unit -> lambda_function_configuration

val make_lambda_function :
  ?cost_calculation:resource_cost_calculation ->
  ?configuration:lambda_function_configuration ->
  unit ->
  lambda_function

val make_ecs_service_configuration :
  ?compute:compute_configuration -> unit -> ecs_service_configuration

val make_ecs_service :
  ?cost_calculation:resource_cost_calculation ->
  ?configuration:ecs_service_configuration ->
  unit ->
  ecs_service

val make_instance_configuration :
  ?type_:Smaws_Lib.Smithy_api.Types.string_ -> unit -> instance_configuration

val make_ec2_instance_configuration :
  ?instance:instance_configuration -> unit -> ec2_instance_configuration

val make_ec2_instance :
  ?cost_calculation:resource_cost_calculation ->
  ?configuration:ec2_instance_configuration ->
  unit ->
  ec2_instance

val make_block_storage_performance_configuration :
  ?throughput:Smaws_Lib.Smithy_api.Types.double ->
  ?iops:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  block_storage_performance_configuration

val make_ebs_volume_configuration :
  ?attachment_state:Smaws_Lib.Smithy_api.Types.string_ ->
  ?performance:block_storage_performance_configuration ->
  ?storage:storage_configuration ->
  unit ->
  ebs_volume_configuration

val make_ebs_volume :
  ?cost_calculation:resource_cost_calculation ->
  ?configuration:ebs_volume_configuration ->
  unit ->
  ebs_volume

val make_mixed_instance_configuration :
  ?type_:Smaws_Lib.Smithy_api.Types.string_ -> unit -> mixed_instance_configuration

val make_ec2_auto_scaling_group_configuration :
  ?allocation_strategy:allocation_strategy ->
  ?type_:ec2_auto_scaling_group_type ->
  ?mixed_instances:mixed_instance_configuration_list ->
  ?instance:instance_configuration ->
  unit ->
  ec2_auto_scaling_group_configuration

val make_ec2_auto_scaling_group :
  ?cost_calculation:resource_cost_calculation ->
  ?configuration:ec2_auto_scaling_group_configuration ->
  unit ->
  ec2_auto_scaling_group

val make_ec2_reserved_instances_configuration :
  ?size_flex_eligible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?tenancy:Smaws_Lib.Smithy_api.Types.string_ ->
  ?platform:Smaws_Lib.Smithy_api.Types.string_ ->
  ?current_generation:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_family:Smaws_Lib.Smithy_api.Types.string_ ->
  ?offering_class:Smaws_Lib.Smithy_api.Types.string_ ->
  ?number_of_instances_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?normalized_units_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_recurring_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?upfront_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reserved_instances_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  ec2_reserved_instances_configuration

val make_reserved_instances_pricing :
  ?estimated_monthly_amortized_reservation_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?savings_percentage:Smaws_Lib.Smithy_api.Types.double ->
  ?monthly_reservation_eligible_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_on_demand_cost:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  reserved_instances_pricing

val make_reserved_instances_cost_calculation :
  ?pricing:reserved_instances_pricing -> unit -> reserved_instances_cost_calculation

val make_ec2_reserved_instances :
  ?cost_calculation:reserved_instances_cost_calculation ->
  ?configuration:ec2_reserved_instances_configuration ->
  unit ->
  ec2_reserved_instances

val make_rds_reserved_instances_configuration :
  ?deployment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?database_engine:Smaws_Lib.Smithy_api.Types.string_ ->
  ?database_edition:Smaws_Lib.Smithy_api.Types.string_ ->
  ?license_model:Smaws_Lib.Smithy_api.Types.string_ ->
  ?current_generation:Smaws_Lib.Smithy_api.Types.string_ ->
  ?size_flex_eligible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?instance_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_family:Smaws_Lib.Smithy_api.Types.string_ ->
  ?number_of_instances_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?normalized_units_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_recurring_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?upfront_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reserved_instances_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  rds_reserved_instances_configuration

val make_rds_reserved_instances :
  ?cost_calculation:reserved_instances_cost_calculation ->
  ?configuration:rds_reserved_instances_configuration ->
  unit ->
  rds_reserved_instances

val make_elasti_cache_reserved_instances_configuration :
  ?size_flex_eligible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?current_generation:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_family:Smaws_Lib.Smithy_api.Types.string_ ->
  ?number_of_instances_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?normalized_units_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_recurring_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?upfront_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reserved_instances_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  elasti_cache_reserved_instances_configuration

val make_elasti_cache_reserved_instances :
  ?cost_calculation:reserved_instances_cost_calculation ->
  ?configuration:elasti_cache_reserved_instances_configuration ->
  unit ->
  elasti_cache_reserved_instances

val make_open_search_reserved_instances_configuration :
  ?size_flex_eligible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?current_generation:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?number_of_instances_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?normalized_units_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_recurring_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?upfront_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reserved_instances_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  open_search_reserved_instances_configuration

val make_open_search_reserved_instances :
  ?cost_calculation:reserved_instances_cost_calculation ->
  ?configuration:open_search_reserved_instances_configuration ->
  unit ->
  open_search_reserved_instances

val make_redshift_reserved_instances_configuration :
  ?current_generation:Smaws_Lib.Smithy_api.Types.string_ ->
  ?size_flex_eligible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?instance_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_family:Smaws_Lib.Smithy_api.Types.string_ ->
  ?number_of_instances_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?normalized_units_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_recurring_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?upfront_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reserved_instances_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  redshift_reserved_instances_configuration

val make_redshift_reserved_instances :
  ?cost_calculation:reserved_instances_cost_calculation ->
  ?configuration:redshift_reserved_instances_configuration ->
  unit ->
  redshift_reserved_instances

val make_ec2_instance_savings_plans_configuration :
  ?savings_plans_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_family:Smaws_Lib.Smithy_api.Types.string_ ->
  ?hourly_commitment:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  ec2_instance_savings_plans_configuration

val make_ec2_instance_savings_plans :
  ?cost_calculation:savings_plans_cost_calculation ->
  ?configuration:ec2_instance_savings_plans_configuration ->
  unit ->
  ec2_instance_savings_plans

val make_compute_savings_plans_configuration :
  ?hourly_commitment:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  compute_savings_plans_configuration

val make_compute_savings_plans :
  ?cost_calculation:savings_plans_cost_calculation ->
  ?configuration:compute_savings_plans_configuration ->
  unit ->
  compute_savings_plans

val make_db_instance_configuration :
  ?db_instance_class:Smaws_Lib.Smithy_api.Types.string_ -> unit -> db_instance_configuration

val make_rds_db_instance_configuration :
  ?instance:db_instance_configuration -> unit -> rds_db_instance_configuration

val make_rds_db_instance :
  ?cost_calculation:resource_cost_calculation ->
  ?configuration:rds_db_instance_configuration ->
  unit ->
  rds_db_instance

val make_rds_db_instance_storage_configuration :
  ?storage_throughput:Smaws_Lib.Smithy_api.Types.double ->
  ?iops:Smaws_Lib.Smithy_api.Types.double ->
  ?allocated_storage_in_gb:Smaws_Lib.Smithy_api.Types.double ->
  ?storage_type:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  rds_db_instance_storage_configuration

val make_rds_db_instance_storage :
  ?cost_calculation:resource_cost_calculation ->
  ?configuration:rds_db_instance_storage_configuration ->
  unit ->
  rds_db_instance_storage

val make_aurora_db_cluster_storage_configuration :
  ?storage_type:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  aurora_db_cluster_storage_configuration

val make_aurora_db_cluster_storage :
  ?cost_calculation:resource_cost_calculation ->
  ?configuration:aurora_db_cluster_storage_configuration ->
  unit ->
  aurora_db_cluster_storage

val make_dynamo_db_reserved_capacity_configuration :
  ?capacity_units:Smaws_Lib.Smithy_api.Types.string_ ->
  ?number_of_capacity_units_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_recurring_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?upfront_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reserved_instances_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  dynamo_db_reserved_capacity_configuration

val make_dynamo_db_reserved_capacity :
  ?cost_calculation:reserved_instances_cost_calculation ->
  ?configuration:dynamo_db_reserved_capacity_configuration ->
  unit ->
  dynamo_db_reserved_capacity

val make_memory_db_reserved_instances_configuration :
  ?current_generation:Smaws_Lib.Smithy_api.Types.string_ ->
  ?size_flex_eligible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?instance_family:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?number_of_instances_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?normalized_units_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_recurring_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?upfront_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reserved_instances_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  memory_db_reserved_instances_configuration

val make_memory_db_reserved_instances :
  ?cost_calculation:reserved_instances_cost_calculation ->
  ?configuration:memory_db_reserved_instances_configuration ->
  unit ->
  memory_db_reserved_instances

val make_nat_gateway_configuration :
  ?packets_in_from_destination:Smaws_Lib.Smithy_api.Types.long ->
  ?packets_in_from_source:Smaws_Lib.Smithy_api.Types.long ->
  ?active_connection_count:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  nat_gateway_configuration

val make_nat_gateway :
  ?cost_calculation:resource_cost_calculation ->
  ?configuration:nat_gateway_configuration ->
  unit ->
  nat_gateway

val make_dynamo_db_table : ?cost_calculation:resource_cost_calculation -> unit -> dynamo_db_table

val make_elasti_cache_cluster :
  ?cost_calculation:resource_cost_calculation -> unit -> elasti_cache_cluster

val make_memory_db_cluster :
  ?cost_calculation:resource_cost_calculation -> unit -> memory_db_cluster

val make_document_db_cluster :
  ?cost_calculation:resource_cost_calculation -> unit -> document_db_cluster

val make_recommendation_summary :
  ?recommendation_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?estimated_monthly_savings:Smaws_Lib.Smithy_api.Types.double ->
  ?group:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  recommendation_summary

val make_recommendation :
  ?tags:tag_list ->
  ?source:source ->
  ?recommendation_lookback_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?last_refresh_timestamp:datetime ->
  ?recommended_resource_summary:Smaws_Lib.Smithy_api.Types.string_ ->
  ?current_resource_summary:Smaws_Lib.Smithy_api.Types.string_ ->
  ?rollback_possible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?action_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?restart_needed:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?implementation_effort:Smaws_Lib.Smithy_api.Types.string_ ->
  ?currency_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?estimated_monthly_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_savings_percentage:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_monthly_savings:Smaws_Lib.Smithy_api.Types.double ->
  ?recommended_resource_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?current_resource_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recommendation_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  recommendation

val make_order_by :
  ?order:order -> ?dimension:Smaws_Lib.Smithy_api.Types.string_ -> unit -> order_by

val make_metrics_by_time :
  ?timestamp:Smaws_Lib.Smithy_api.Types.string_ ->
  ?spend:Smaws_Lib.Smithy_api.Types.double ->
  ?savings:Smaws_Lib.Smithy_api.Types.double ->
  ?score:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  metrics_by_time

val make_list_recommendations_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?items:recommendation_list ->
  unit ->
  list_recommendations_response

val make_filter :
  ?recommendation_ids:recommendation_id_list ->
  ?resource_arns:resource_arn_list ->
  ?resource_ids:resource_id_list ->
  ?tags:tag_list ->
  ?action_types:action_type_list ->
  ?resource_types:resource_type_list ->
  ?regions:region_list ->
  ?account_ids:account_id_list ->
  ?implementation_efforts:implementation_effort_list ->
  ?rollback_possible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?restart_needed:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  filter

val make_list_recommendations_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:max_results ->
  ?include_all_recommendations:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?order_by:order_by ->
  ?filter:filter ->
  unit ->
  list_recommendations_request

val make_list_recommendation_summaries_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?metrics:summary_metrics_result ->
  ?currency_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?group_by:Smaws_Lib.Smithy_api.Types.string_ ->
  ?items:recommendation_summaries_list ->
  ?estimated_total_deduped_savings:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  list_recommendation_summaries_response

val make_list_recommendation_summaries_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?metrics:summary_metrics_list ->
  ?max_results:max_results ->
  ?filter:filter ->
  group_by:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_recommendation_summaries_request

val make_account_enrollment_status :
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:enrollment_status ->
  ?account_id:account_id ->
  unit ->
  account_enrollment_status

val make_list_enrollment_statuses_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?include_member_accounts:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?items:account_enrollment_statuses ->
  unit ->
  list_enrollment_statuses_response

val make_list_enrollment_statuses_request :
  ?max_results:max_results ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_id:account_id ->
  ?include_organization_info:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  unit ->
  list_enrollment_statuses_request

val make_efficiency_metrics_by_group :
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?group:Smaws_Lib.Smithy_api.Types.string_ ->
  ?metrics_by_time:metrics_by_time_list ->
  unit ->
  efficiency_metrics_by_group

val make_list_efficiency_metrics_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?efficiency_metrics_by_group:efficiency_metrics_by_group_list ->
  unit ->
  list_efficiency_metrics_response

val make_list_efficiency_metrics_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?order_by:order_by ->
  ?max_results:max_results ->
  ?group_by:Smaws_Lib.Smithy_api.Types.string_ ->
  time_period:time_period ->
  granularity:granularity_type ->
  unit ->
  list_efficiency_metrics_request

val make_get_recommendation_response :
  ?tags:tag_list ->
  ?recommended_resource_details:resource_details ->
  ?current_resource_details:resource_details ->
  ?rollback_possible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?action_type:action_type ->
  ?restart_needed:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?implementation_effort:implementation_effort ->
  ?estimated_monthly_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_monthly_savings:Smaws_Lib.Smithy_api.Types.double ->
  ?last_refresh_timestamp:datetime ->
  ?source:source ->
  ?region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recommended_resource_type:resource_type ->
  ?current_resource_type:resource_type ->
  ?estimated_savings_over_cost_calculation_lookback_period:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_savings_percentage:Smaws_Lib.Smithy_api.Types.double ->
  ?cost_calculation_lookback_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?recommendation_lookback_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?currency_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recommendation_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  get_recommendation_response

val make_get_recommendation_request :
  recommendation_id:Smaws_Lib.Smithy_api.Types.string_ -> unit -> get_recommendation_request

val make_get_preferences_response :
  ?preferred_commitment:preferred_commitment ->
  ?member_account_discount_visibility:member_account_discount_visibility ->
  ?savings_estimation_mode:savings_estimation_mode ->
  unit ->
  get_preferences_response

val make_get_preferences_request : unit -> unit
(** {1:operations Operations} *)

module GetPreferences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_preferences_request ->
    ( get_preferences_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_preferences_request ->
    ( get_preferences_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a set of preferences for an account in order to add account-specific preferences into \
   the service. These preferences impact how the savings associated with recommendations are \
   presented\226\128\148estimated savings after discounts or estimated savings before discounts, \
   for example.\n"]

module GetRecommendation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_recommendation_request ->
    ( get_recommendation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_recommendation_request ->
    ( get_recommendation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns both the current and recommended resource configuration and the estimated cost impact \
   for a recommendation.\n\n\
  \ The [recommendationId] is only valid for up to a maximum of 24 hours as recommendations are \
   refreshed daily. To retrieve the [recommendationId], use the [ListRecommendations] API.\n\
  \ "]

module ListEfficiencyMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_efficiency_metrics_request ->
    ( list_efficiency_metrics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_efficiency_metrics_request ->
    ( list_efficiency_metrics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns cost efficiency metrics aggregated over time and optionally grouped by a specified \
   dimension. The metrics provide insights into your cost optimization progress by tracking \
   estimated savings, spending, and measures how effectively you're optimizing your Cloud \
   resources.\n\n\
  \ The operation supports both daily and monthly time granularities and allows grouping results \
   by account ID, Amazon Web Services Region. Results are returned as time-series data, enabling \
   you to analyze trends in your cost optimization performance over the specified time period.\n\
  \ "]

module ListEnrollmentStatuses : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_enrollment_statuses_request ->
    ( list_enrollment_statuses_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_enrollment_statuses_request ->
    ( list_enrollment_statuses_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the enrollment status for an account. It can also return the list of accounts that \
   are enrolled under the organization.\n"]

module ListRecommendationSummaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_recommendation_summaries_request ->
    ( list_recommendation_summaries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_recommendation_summaries_request ->
    ( list_recommendation_summaries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a concise representation of savings estimates for resources. Also returns de-duped \
   savings across different types of recommendations.\n\n\
  \  The following filters are not supported for this API: [recommendationIds], [resourceArns], \
   and [resourceIds].\n\
  \  \n\
  \   "]

module ListRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_recommendations_request ->
    ( list_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_recommendations_request ->
    ( list_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of recommendations.\n"]

module UpdateEnrollmentStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_enrollment_status_request ->
    ( update_enrollment_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_enrollment_status_request ->
    ( update_enrollment_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the enrollment (opt in and opt out) status of an account to the Cost Optimization Hub \
   service.\n\n\
  \ If the account is a management account of an organization, this action can also be used to \
   enroll member accounts of the organization.\n\
  \ \n\
  \  You must have the appropriate permissions to opt in to Cost Optimization Hub and to view its \
   recommendations. When you opt in, Cost Optimization Hub automatically creates a service-linked \
   role in your account to access its data.\n\
  \  "]

(** {1:Serialization and Deserialization} *)
module UpdatePreferences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_preferences_request ->
    ( update_preferences_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_preferences_request ->
    ( update_preferences_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a set of preferences for an account in order to add account-specific preferences into \
   the service. These preferences impact how the savings associated with recommendations are \
   presented.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
