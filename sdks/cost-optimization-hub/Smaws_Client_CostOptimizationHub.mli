(** Cost Optimization Hub client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_account_enrollment_status :
  ?account_id:account_id ->
  ?status:enrollment_status ->
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  account_enrollment_status

val make_estimated_discounts :
  ?savings_plans_discount:Smaws_Lib.Smithy_api.Types.double ->
  ?reserved_instances_discount:Smaws_Lib.Smithy_api.Types.double ->
  ?other_discount:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  estimated_discounts

val make_resource_pricing :
  ?estimated_cost_before_discounts:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_net_unused_amortized_commitments:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_discounts:estimated_discounts ->
  ?estimated_cost_after_discounts:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  resource_pricing

val make_usage :
  ?usage_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?usage_amount:Smaws_Lib.Smithy_api.Types.double ->
  ?operation:Smaws_Lib.Smithy_api.Types.string_ ->
  ?product_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?unit_:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  usage

val make_resource_cost_calculation :
  ?usages:usage_list -> ?pricing:resource_pricing -> unit -> resource_cost_calculation

val make_aurora_db_cluster_storage_configuration :
  ?storage_type:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  aurora_db_cluster_storage_configuration

val make_aurora_db_cluster_storage :
  ?configuration:aurora_db_cluster_storage_configuration ->
  ?cost_calculation:resource_cost_calculation ->
  unit ->
  aurora_db_cluster_storage

val make_block_storage_performance_configuration :
  ?iops:Smaws_Lib.Smithy_api.Types.double ->
  ?throughput:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  block_storage_performance_configuration

val make_compute_configuration :
  ?v_cpu:Smaws_Lib.Smithy_api.Types.double ->
  ?memory_size_in_m_b:Smaws_Lib.Smithy_api.Types.integer ->
  ?architecture:Smaws_Lib.Smithy_api.Types.string_ ->
  ?platform:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  compute_configuration

val make_savings_plans_pricing :
  ?monthly_savings_plans_eligible_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_monthly_commitment:Smaws_Lib.Smithy_api.Types.double ->
  ?savings_percentage:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_on_demand_cost:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  savings_plans_pricing

val make_savings_plans_cost_calculation :
  ?pricing:savings_plans_pricing -> unit -> savings_plans_cost_calculation

val make_compute_savings_plans_configuration :
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?hourly_commitment:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  compute_savings_plans_configuration

val make_compute_savings_plans :
  ?configuration:compute_savings_plans_configuration ->
  ?cost_calculation:savings_plans_cost_calculation ->
  unit ->
  compute_savings_plans

val make_validation_exception_detail :
  field_name:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_detail

val make_preferred_commitment :
  ?term:term -> ?payment_option:payment_option -> unit -> preferred_commitment

val make_update_preferences_response :
  ?savings_estimation_mode:savings_estimation_mode ->
  ?member_account_discount_visibility:member_account_discount_visibility ->
  ?preferred_commitment:preferred_commitment ->
  unit ->
  update_preferences_response

val make_update_preferences_request :
  ?savings_estimation_mode:savings_estimation_mode ->
  ?member_account_discount_visibility:member_account_discount_visibility ->
  ?preferred_commitment:preferred_commitment ->
  unit ->
  update_preferences_request

val make_update_enrollment_status_response :
  ?status:Smaws_Lib.Smithy_api.Types.string_ -> unit -> update_enrollment_status_response

val make_update_enrollment_status_request :
  ?include_member_accounts:Smaws_Lib.Smithy_api.Types.boolean_ ->
  status:enrollment_status ->
  unit ->
  update_enrollment_status_request

val make_recommendation_summary :
  ?group:Smaws_Lib.Smithy_api.Types.string_ ->
  ?estimated_monthly_savings:Smaws_Lib.Smithy_api.Types.double ->
  ?recommendation_count:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  recommendation_summary

val make_list_recommendation_summaries_response :
  ?estimated_total_deduped_savings:Smaws_Lib.Smithy_api.Types.double ->
  ?items:recommendation_summaries_list ->
  ?group_by:Smaws_Lib.Smithy_api.Types.string_ ->
  ?currency_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?metrics:summary_metrics_result ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_recommendation_summaries_response

val make_tag :
  ?key:Smaws_Lib.Smithy_api.Types.string_ ->
  ?value:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  tag

val make_filter :
  ?restart_needed:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?rollback_possible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?implementation_efforts:implementation_effort_list ->
  ?account_ids:account_id_list ->
  ?regions:region_list ->
  ?resource_types:resource_type_list ->
  ?action_types:action_type_list ->
  ?tags:tag_list ->
  ?resource_ids:resource_id_list ->
  ?resource_arns:resource_arn_list ->
  ?recommendation_ids:recommendation_id_list ->
  unit ->
  filter

val make_list_recommendation_summaries_request :
  ?filter:filter ->
  ?max_results:max_results ->
  ?metrics:summary_metrics_list ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  group_by:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_recommendation_summaries_request

val make_recommendation :
  ?recommendation_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?current_resource_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recommended_resource_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?estimated_monthly_savings:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_savings_percentage:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_monthly_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?currency_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?implementation_effort:Smaws_Lib.Smithy_api.Types.string_ ->
  ?restart_needed:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?action_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?rollback_possible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?current_resource_summary:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recommended_resource_summary:Smaws_Lib.Smithy_api.Types.string_ ->
  ?last_refresh_timestamp:datetime ->
  ?recommendation_lookback_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?source:source ->
  ?tags:tag_list ->
  unit ->
  recommendation

val make_list_recommendations_response :
  ?items:recommendation_list ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_recommendations_response

val make_order_by :
  ?dimension:Smaws_Lib.Smithy_api.Types.string_ -> ?order:order -> unit -> order_by

val make_list_recommendations_request :
  ?filter:filter ->
  ?order_by:order_by ->
  ?include_all_recommendations:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?max_results:max_results ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_recommendations_request

val make_list_enrollment_statuses_response :
  ?items:account_enrollment_statuses ->
  ?include_member_accounts:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_enrollment_statuses_response

val make_list_enrollment_statuses_request :
  ?include_organization_info:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?account_id:account_id ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:max_results ->
  unit ->
  list_enrollment_statuses_request

val make_metrics_by_time :
  ?score:Smaws_Lib.Smithy_api.Types.double ->
  ?savings:Smaws_Lib.Smithy_api.Types.double ->
  ?spend:Smaws_Lib.Smithy_api.Types.double ->
  ?timestamp:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  metrics_by_time

val make_efficiency_metrics_by_group :
  ?metrics_by_time:metrics_by_time_list ->
  ?group:Smaws_Lib.Smithy_api.Types.string_ ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  efficiency_metrics_by_group

val make_list_efficiency_metrics_response :
  ?efficiency_metrics_by_group:efficiency_metrics_by_group_list ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_efficiency_metrics_response

val make_time_period :
  start:Smaws_Lib.Smithy_api.Types.string_ ->
  end_:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  time_period

val make_list_efficiency_metrics_request :
  ?group_by:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:max_results ->
  ?order_by:order_by ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  granularity:granularity_type ->
  time_period:time_period ->
  unit ->
  list_efficiency_metrics_request

val make_sage_maker_endpoint :
  ?cost_calculation:resource_cost_calculation -> unit -> sage_maker_endpoint

val make_work_spaces : ?cost_calculation:resource_cost_calculation -> unit -> work_spaces

val make_document_db_cluster :
  ?cost_calculation:resource_cost_calculation -> unit -> document_db_cluster

val make_memory_db_cluster :
  ?cost_calculation:resource_cost_calculation -> unit -> memory_db_cluster

val make_elasti_cache_cluster :
  ?cost_calculation:resource_cost_calculation -> unit -> elasti_cache_cluster

val make_dynamo_db_table : ?cost_calculation:resource_cost_calculation -> unit -> dynamo_db_table

val make_nat_gateway_configuration :
  ?active_connection_count:Smaws_Lib.Smithy_api.Types.long ->
  ?packets_in_from_source:Smaws_Lib.Smithy_api.Types.long ->
  ?packets_in_from_destination:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  nat_gateway_configuration

val make_nat_gateway :
  ?configuration:nat_gateway_configuration ->
  ?cost_calculation:resource_cost_calculation ->
  unit ->
  nat_gateway

val make_reserved_instances_pricing :
  ?estimated_on_demand_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?monthly_reservation_eligible_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?savings_percentage:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_monthly_amortized_reservation_cost:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  reserved_instances_pricing

val make_reserved_instances_cost_calculation :
  ?pricing:reserved_instances_pricing -> unit -> reserved_instances_cost_calculation

val make_memory_db_reserved_instances_configuration :
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reserved_instances_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?upfront_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_recurring_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?normalized_units_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?number_of_instances_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_family:Smaws_Lib.Smithy_api.Types.string_ ->
  ?size_flex_eligible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?current_generation:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  memory_db_reserved_instances_configuration

val make_memory_db_reserved_instances :
  ?configuration:memory_db_reserved_instances_configuration ->
  ?cost_calculation:reserved_instances_cost_calculation ->
  unit ->
  memory_db_reserved_instances

val make_dynamo_db_reserved_capacity_configuration :
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reserved_instances_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?upfront_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_recurring_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?number_of_capacity_units_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?capacity_units:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  dynamo_db_reserved_capacity_configuration

val make_dynamo_db_reserved_capacity :
  ?configuration:dynamo_db_reserved_capacity_configuration ->
  ?cost_calculation:reserved_instances_cost_calculation ->
  unit ->
  dynamo_db_reserved_capacity

val make_rds_db_instance_storage_configuration :
  ?storage_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?allocated_storage_in_gb:Smaws_Lib.Smithy_api.Types.double ->
  ?iops:Smaws_Lib.Smithy_api.Types.double ->
  ?storage_throughput:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  rds_db_instance_storage_configuration

val make_rds_db_instance_storage :
  ?configuration:rds_db_instance_storage_configuration ->
  ?cost_calculation:resource_cost_calculation ->
  unit ->
  rds_db_instance_storage

val make_db_instance_configuration :
  ?db_instance_class:Smaws_Lib.Smithy_api.Types.string_ -> unit -> db_instance_configuration

val make_rds_db_instance_configuration :
  ?instance:db_instance_configuration -> unit -> rds_db_instance_configuration

val make_rds_db_instance :
  ?configuration:rds_db_instance_configuration ->
  ?cost_calculation:resource_cost_calculation ->
  unit ->
  rds_db_instance

val make_sage_maker_savings_plans_configuration :
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?hourly_commitment:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  sage_maker_savings_plans_configuration

val make_sage_maker_savings_plans :
  ?configuration:sage_maker_savings_plans_configuration ->
  ?cost_calculation:savings_plans_cost_calculation ->
  unit ->
  sage_maker_savings_plans

val make_ec2_instance_savings_plans_configuration :
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?hourly_commitment:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_family:Smaws_Lib.Smithy_api.Types.string_ ->
  ?savings_plans_region:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  ec2_instance_savings_plans_configuration

val make_ec2_instance_savings_plans :
  ?configuration:ec2_instance_savings_plans_configuration ->
  ?cost_calculation:savings_plans_cost_calculation ->
  unit ->
  ec2_instance_savings_plans

val make_redshift_reserved_instances_configuration :
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reserved_instances_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?upfront_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_recurring_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?normalized_units_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?number_of_instances_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_family:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?size_flex_eligible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?current_generation:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  redshift_reserved_instances_configuration

val make_redshift_reserved_instances :
  ?configuration:redshift_reserved_instances_configuration ->
  ?cost_calculation:reserved_instances_cost_calculation ->
  unit ->
  redshift_reserved_instances

val make_open_search_reserved_instances_configuration :
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reserved_instances_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?upfront_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_recurring_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?normalized_units_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?number_of_instances_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?current_generation:Smaws_Lib.Smithy_api.Types.string_ ->
  ?size_flex_eligible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  open_search_reserved_instances_configuration

val make_open_search_reserved_instances :
  ?configuration:open_search_reserved_instances_configuration ->
  ?cost_calculation:reserved_instances_cost_calculation ->
  unit ->
  open_search_reserved_instances

val make_elasti_cache_reserved_instances_configuration :
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reserved_instances_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?upfront_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_recurring_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?normalized_units_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?number_of_instances_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_family:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?current_generation:Smaws_Lib.Smithy_api.Types.string_ ->
  ?size_flex_eligible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  elasti_cache_reserved_instances_configuration

val make_elasti_cache_reserved_instances :
  ?configuration:elasti_cache_reserved_instances_configuration ->
  ?cost_calculation:reserved_instances_cost_calculation ->
  unit ->
  elasti_cache_reserved_instances

val make_rds_reserved_instances_configuration :
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reserved_instances_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?upfront_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_recurring_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?normalized_units_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?number_of_instances_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_family:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?size_flex_eligible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?current_generation:Smaws_Lib.Smithy_api.Types.string_ ->
  ?license_model:Smaws_Lib.Smithy_api.Types.string_ ->
  ?database_edition:Smaws_Lib.Smithy_api.Types.string_ ->
  ?database_engine:Smaws_Lib.Smithy_api.Types.string_ ->
  ?deployment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  rds_reserved_instances_configuration

val make_rds_reserved_instances :
  ?configuration:rds_reserved_instances_configuration ->
  ?cost_calculation:reserved_instances_cost_calculation ->
  unit ->
  rds_reserved_instances

val make_ec2_reserved_instances_configuration :
  ?account_scope:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reserved_instances_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?upfront_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_recurring_cost:Smaws_Lib.Smithy_api.Types.string_ ->
  ?normalized_units_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?number_of_instances_to_purchase:Smaws_Lib.Smithy_api.Types.string_ ->
  ?offering_class:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_family:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?current_generation:Smaws_Lib.Smithy_api.Types.string_ ->
  ?platform:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tenancy:Smaws_Lib.Smithy_api.Types.string_ ->
  ?size_flex_eligible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  ec2_reserved_instances_configuration

val make_ec2_reserved_instances :
  ?configuration:ec2_reserved_instances_configuration ->
  ?cost_calculation:reserved_instances_cost_calculation ->
  unit ->
  ec2_reserved_instances

val make_mixed_instance_configuration :
  ?type_:Smaws_Lib.Smithy_api.Types.string_ -> unit -> mixed_instance_configuration

val make_instance_configuration :
  ?type_:Smaws_Lib.Smithy_api.Types.string_ -> unit -> instance_configuration

val make_ec2_auto_scaling_group_configuration :
  ?instance:instance_configuration ->
  ?mixed_instances:mixed_instance_configuration_list ->
  ?type_:ec2_auto_scaling_group_type ->
  ?allocation_strategy:allocation_strategy ->
  unit ->
  ec2_auto_scaling_group_configuration

val make_ec2_auto_scaling_group :
  ?configuration:ec2_auto_scaling_group_configuration ->
  ?cost_calculation:resource_cost_calculation ->
  unit ->
  ec2_auto_scaling_group

val make_storage_configuration :
  ?type_:Smaws_Lib.Smithy_api.Types.string_ ->
  ?size_in_gb:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  storage_configuration

val make_ebs_volume_configuration :
  ?storage:storage_configuration ->
  ?performance:block_storage_performance_configuration ->
  ?attachment_state:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  ebs_volume_configuration

val make_ebs_volume :
  ?configuration:ebs_volume_configuration ->
  ?cost_calculation:resource_cost_calculation ->
  unit ->
  ebs_volume

val make_ec2_instance_configuration :
  ?instance:instance_configuration -> unit -> ec2_instance_configuration

val make_ec2_instance :
  ?configuration:ec2_instance_configuration ->
  ?cost_calculation:resource_cost_calculation ->
  unit ->
  ec2_instance

val make_ecs_service_configuration :
  ?compute:compute_configuration -> unit -> ecs_service_configuration

val make_ecs_service :
  ?configuration:ecs_service_configuration ->
  ?cost_calculation:resource_cost_calculation ->
  unit ->
  ecs_service

val make_lambda_function_configuration :
  ?compute:compute_configuration -> unit -> lambda_function_configuration

val make_lambda_function :
  ?configuration:lambda_function_configuration ->
  ?cost_calculation:resource_cost_calculation ->
  unit ->
  lambda_function

val make_get_recommendation_response :
  ?recommendation_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?currency_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recommendation_lookback_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?cost_calculation_lookback_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?estimated_savings_percentage:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_savings_over_cost_calculation_lookback_period:Smaws_Lib.Smithy_api.Types.double ->
  ?current_resource_type:resource_type ->
  ?recommended_resource_type:resource_type ->
  ?region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?source:source ->
  ?last_refresh_timestamp:datetime ->
  ?estimated_monthly_savings:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_monthly_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?implementation_effort:implementation_effort ->
  ?restart_needed:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?action_type:action_type ->
  ?rollback_possible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?current_resource_details:resource_details ->
  ?recommended_resource_details:resource_details ->
  ?tags:tag_list ->
  unit ->
  get_recommendation_response

val make_get_recommendation_request :
  recommendation_id:Smaws_Lib.Smithy_api.Types.string_ -> unit -> get_recommendation_request

val make_get_preferences_response :
  ?savings_estimation_mode:savings_estimation_mode ->
  ?member_account_discount_visibility:member_account_discount_visibility ->
  ?preferred_commitment:preferred_commitment ->
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
