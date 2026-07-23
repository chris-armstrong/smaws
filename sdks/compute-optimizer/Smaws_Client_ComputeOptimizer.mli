(** Compute Optimizer client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_account_enrollment_status :
  ?account_id:account_id ->
  ?status:status ->
  ?status_reason:status_reason ->
  ?last_updated_timestamp:last_updated_timestamp ->
  unit ->
  account_enrollment_status

val make_auto_scaling_group_configuration :
  ?desired_capacity:desired_capacity ->
  ?min_size:min_size ->
  ?max_size:max_size ->
  ?instance_type:nullable_instance_type ->
  ?allocation_strategy:allocation_strategy ->
  ?estimated_instance_hour_reduction_percentage:
    nullable_estimated_instance_hour_reduction_percentage ->
  ?type_:asg_type ->
  ?mixed_instance_types:mixed_instance_types ->
  unit ->
  auto_scaling_group_configuration

val make_auto_scaling_group_estimated_monthly_savings :
  ?currency:currency -> ?value:value -> unit -> auto_scaling_group_estimated_monthly_savings

val make_instance_savings_estimation_mode :
  ?source:instance_savings_estimation_mode_source -> unit -> instance_savings_estimation_mode

val make_effective_preferred_resource :
  ?name:preferred_resource_name ->
  ?include_list:preferred_resource_values ->
  ?effective_include_list:preferred_resource_values ->
  ?exclude_list:preferred_resource_values ->
  unit ->
  effective_preferred_resource

val make_customizable_metric_parameters :
  ?threshold:customizable_metric_threshold ->
  ?headroom:customizable_metric_headroom ->
  unit ->
  customizable_metric_parameters

val make_utilization_preference :
  ?metric_name:customizable_metric_name ->
  ?metric_parameters:customizable_metric_parameters ->
  unit ->
  utilization_preference

val make_external_metrics_preference :
  ?source:external_metrics_source -> unit -> external_metrics_preference

val make_effective_recommendation_preferences :
  ?cpu_vendor_architectures:cpu_vendor_architectures ->
  ?enhanced_infrastructure_metrics:enhanced_infrastructure_metrics ->
  ?inferred_workload_types:inferred_workload_types_preference ->
  ?external_metrics_preference:external_metrics_preference ->
  ?look_back_period:look_back_period_preference ->
  ?utilization_preferences:utilization_preferences ->
  ?preferred_resources:effective_preferred_resources ->
  ?savings_estimation_mode:instance_savings_estimation_mode ->
  unit ->
  effective_recommendation_preferences

val make_auto_scaling_group_savings_opportunity_after_discounts :
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  ?estimated_monthly_savings:auto_scaling_group_estimated_monthly_savings ->
  unit ->
  auto_scaling_group_savings_opportunity_after_discounts

val make_estimated_monthly_savings :
  ?currency:currency -> ?value:value -> unit -> estimated_monthly_savings

val make_savings_opportunity :
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  ?estimated_monthly_savings:estimated_monthly_savings ->
  unit ->
  savings_opportunity

val make_utilization_metric :
  ?name:metric_name ->
  ?statistic:metric_statistic ->
  ?value:metric_value ->
  unit ->
  utilization_metric

val make_gpu :
  ?gpu_count:gpu_count -> ?gpu_memory_size_in_mi_b:gpu_memory_size_in_mi_b -> unit -> gpu

val make_gpu_info : ?gpus:gpus -> unit -> gpu_info

val make_auto_scaling_group_recommendation_option :
  ?configuration:auto_scaling_group_configuration ->
  ?instance_gpu_info:gpu_info ->
  ?projected_utilization_metrics:projected_utilization_metrics ->
  ?performance_risk:performance_risk ->
  ?rank:rank ->
  ?savings_opportunity:savings_opportunity ->
  ?savings_opportunity_after_discounts:auto_scaling_group_savings_opportunity_after_discounts ->
  ?migration_effort:migration_effort ->
  unit ->
  auto_scaling_group_recommendation_option

val make_auto_scaling_group_recommendation :
  ?account_id:account_id ->
  ?auto_scaling_group_arn:auto_scaling_group_arn ->
  ?auto_scaling_group_name:auto_scaling_group_name ->
  ?finding:finding ->
  ?utilization_metrics:utilization_metrics ->
  ?look_back_period_in_days:look_back_period_in_days ->
  ?current_configuration:auto_scaling_group_configuration ->
  ?current_instance_gpu_info:gpu_info ->
  ?recommendation_options:auto_scaling_group_recommendation_options ->
  ?last_refresh_timestamp:last_refresh_timestamp ->
  ?current_performance_risk:current_performance_risk ->
  ?effective_recommendation_preferences:effective_recommendation_preferences ->
  ?inferred_workload_types:inferred_workload_types ->
  unit ->
  auto_scaling_group_recommendation

val make_update_enrollment_status_response :
  ?status:status -> ?status_reason:status_reason -> unit -> update_enrollment_status_response

val make_update_enrollment_status_request :
  ?include_member_accounts:include_member_accounts ->
  status:status ->
  unit ->
  update_enrollment_status_request

val make_put_recommendation_preferences_response : unit -> unit

val make_preferred_resource :
  ?name:preferred_resource_name ->
  ?include_list:preferred_resource_values ->
  ?exclude_list:preferred_resource_values ->
  unit ->
  preferred_resource

val make_scope : ?name:scope_name -> ?value:scope_value -> unit -> scope

val make_put_recommendation_preferences_request :
  ?scope:scope ->
  ?enhanced_infrastructure_metrics:enhanced_infrastructure_metrics ->
  ?inferred_workload_types:inferred_workload_types_preference ->
  ?external_metrics_preference:external_metrics_preference ->
  ?look_back_period:look_back_period_preference ->
  ?utilization_preferences:utilization_preferences ->
  ?preferred_resources:preferred_resources ->
  ?savings_estimation_mode:savings_estimation_mode ->
  resource_type:resource_type ->
  unit ->
  put_recommendation_preferences_request

val make_inferred_workload_saving :
  ?inferred_workload_types:inferred_workload_types ->
  ?estimated_monthly_savings:estimated_monthly_savings ->
  unit ->
  inferred_workload_saving

val make_current_performance_risk_ratings :
  ?high:high ->
  ?medium:medium ->
  ?low:low ->
  ?very_low:very_low ->
  unit ->
  current_performance_risk_ratings

val make_idle_summary : ?name:idle_finding -> ?value:summary_value -> unit -> idle_summary

val make_reason_code_summary :
  ?name:finding_reason_code -> ?value:summary_value -> unit -> reason_code_summary

val make_summary :
  ?name:finding ->
  ?value:summary_value ->
  ?reason_code_summaries:reason_code_summaries ->
  unit ->
  summary

val make_recommendation_summary :
  ?summaries:summaries ->
  ?idle_summaries:idle_summaries ->
  ?recommendation_resource_type:recommendation_source_type ->
  ?account_id:account_id ->
  ?savings_opportunity:savings_opportunity ->
  ?idle_savings_opportunity:savings_opportunity ->
  ?aggregated_savings_opportunity:savings_opportunity ->
  ?current_performance_risk_ratings:current_performance_risk_ratings ->
  ?inferred_workload_savings:inferred_workload_savings ->
  unit ->
  recommendation_summary

val make_get_recommendation_summaries_response :
  ?next_token:next_token ->
  ?recommendation_summaries:recommendation_summaries ->
  unit ->
  get_recommendation_summaries_response

val make_get_recommendation_summaries_request :
  ?account_ids:account_ids ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  get_recommendation_summaries_request

val make_recommendation_preferences_detail :
  ?scope:scope ->
  ?resource_type:resource_type ->
  ?enhanced_infrastructure_metrics:enhanced_infrastructure_metrics ->
  ?inferred_workload_types:inferred_workload_types_preference ->
  ?external_metrics_preference:external_metrics_preference ->
  ?look_back_period:look_back_period_preference ->
  ?utilization_preferences:utilization_preferences ->
  ?preferred_resources:effective_preferred_resources ->
  ?savings_estimation_mode:savings_estimation_mode ->
  unit ->
  recommendation_preferences_detail

val make_get_recommendation_preferences_response :
  ?next_token:next_token ->
  ?recommendation_preferences_details:recommendation_preferences_details ->
  unit ->
  get_recommendation_preferences_response

val make_get_recommendation_preferences_request :
  ?scope:scope ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  resource_type:resource_type ->
  unit ->
  get_recommendation_preferences_request

val make_get_recommendation_error :
  ?identifier:identifier -> ?code:code -> ?message:message -> unit -> get_recommendation_error

val make_tag : ?key:tag_key -> ?value:tag_value -> unit -> tag

val make_rds_savings_estimation_mode :
  ?source:rds_savings_estimation_mode_source -> unit -> rds_savings_estimation_mode

val make_rds_effective_recommendation_preferences :
  ?cpu_vendor_architectures:cpu_vendor_architectures ->
  ?enhanced_infrastructure_metrics:enhanced_infrastructure_metrics ->
  ?look_back_period:look_back_period_preference ->
  ?savings_estimation_mode:rds_savings_estimation_mode ->
  unit ->
  rds_effective_recommendation_preferences

val make_rdsdb_utilization_metric :
  ?name:rdsdb_metric_name ->
  ?statistic:rdsdb_metric_statistic ->
  ?value:metric_value ->
  unit ->
  rdsdb_utilization_metric

val make_rds_storage_estimated_monthly_savings :
  ?currency:currency -> ?value:value -> unit -> rds_storage_estimated_monthly_savings

val make_rds_storage_savings_opportunity_after_discounts :
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  ?estimated_monthly_savings:rds_storage_estimated_monthly_savings ->
  unit ->
  rds_storage_savings_opportunity_after_discounts

val make_db_storage_configuration :
  ?storage_type:storage_type ->
  ?allocated_storage:allocated_storage ->
  ?iops:nullable_iop_s ->
  ?max_allocated_storage:nullable_max_allocated_storage ->
  ?storage_throughput:nullable_storage_throughput ->
  unit ->
  db_storage_configuration

val make_rdsdb_storage_recommendation_option :
  ?storage_configuration:db_storage_configuration ->
  ?rank:rank ->
  ?savings_opportunity:savings_opportunity ->
  ?savings_opportunity_after_discounts:rds_storage_savings_opportunity_after_discounts ->
  ?estimated_monthly_volume_io_ps_cost_variation:rds_estimated_monthly_volume_io_ps_cost_variation ->
  unit ->
  rdsdb_storage_recommendation_option

val make_rds_instance_estimated_monthly_savings :
  ?currency:currency -> ?value:value -> unit -> rds_instance_estimated_monthly_savings

val make_rds_instance_savings_opportunity_after_discounts :
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  ?estimated_monthly_savings:rds_instance_estimated_monthly_savings ->
  unit ->
  rds_instance_savings_opportunity_after_discounts

val make_rdsdb_instance_recommendation_option :
  ?db_instance_class:db_instance_class ->
  ?projected_utilization_metrics:rdsdb_projected_utilization_metrics ->
  ?performance_risk:performance_risk ->
  ?rank:rank ->
  ?savings_opportunity:savings_opportunity ->
  ?savings_opportunity_after_discounts:rds_instance_savings_opportunity_after_discounts ->
  unit ->
  rdsdb_instance_recommendation_option

val make_rdsdb_recommendation :
  ?resource_arn:resource_arn ->
  ?account_id:account_id ->
  ?engine:engine ->
  ?engine_version:engine_version ->
  ?promotion_tier:promotion_tier ->
  ?current_db_instance_class:current_db_instance_class ->
  ?current_storage_configuration:db_storage_configuration ->
  ?db_cluster_identifier:db_cluster_identifier ->
  ?idle:idle ->
  ?instance_finding:rds_instance_finding ->
  ?storage_finding:rds_storage_finding ->
  ?instance_finding_reason_codes:rds_instance_finding_reason_codes ->
  ?current_instance_performance_risk:rds_current_instance_performance_risk ->
  ?current_storage_estimated_monthly_volume_io_ps_cost_variation:
    rds_estimated_monthly_volume_io_ps_cost_variation ->
  ?storage_finding_reason_codes:rds_storage_finding_reason_codes ->
  ?instance_recommendation_options:rdsdb_instance_recommendation_options ->
  ?storage_recommendation_options:rdsdb_storage_recommendation_options ->
  ?utilization_metrics:rdsdb_utilization_metrics ->
  ?effective_recommendation_preferences:rds_effective_recommendation_preferences ->
  ?lookback_period_in_days:look_back_period_in_days ->
  ?last_refresh_timestamp:last_refresh_timestamp ->
  ?tags:tags ->
  unit ->
  rdsdb_recommendation

val make_get_rds_database_recommendations_response :
  ?next_token:next_token ->
  ?rds_db_recommendations:rdsdb_recommendations ->
  ?errors:get_recommendation_errors ->
  unit ->
  get_rds_database_recommendations_response

val make_recommendation_preferences :
  ?cpu_vendor_architectures:cpu_vendor_architectures -> unit -> recommendation_preferences

val make_rdsdb_recommendation_filter :
  ?name:rdsdb_recommendation_filter_name ->
  ?values:filter_values ->
  unit ->
  rdsdb_recommendation_filter

val make_get_rds_database_recommendations_request :
  ?resource_arns:resource_arns ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:rdsdb_recommendation_filters ->
  ?account_ids:account_ids ->
  ?recommendation_preferences:recommendation_preferences ->
  unit ->
  get_rds_database_recommendations_request

val make_rds_database_projected_metric :
  ?name:rdsdb_metric_name ->
  ?timestamps:timestamps ->
  ?values:metric_values ->
  unit ->
  rds_database_projected_metric

val make_rds_database_recommended_option_projected_metric :
  ?recommended_db_instance_class:recommended_db_instance_class ->
  ?rank:rank ->
  ?projected_metrics:rds_database_projected_metrics ->
  unit ->
  rds_database_recommended_option_projected_metric

val make_get_rds_database_recommendation_projected_metrics_response :
  ?recommended_option_projected_metrics:rds_database_recommended_option_projected_metrics ->
  unit ->
  get_rds_database_recommendation_projected_metrics_response

val make_get_rds_database_recommendation_projected_metrics_request :
  ?recommendation_preferences:recommendation_preferences ->
  resource_arn:resource_arn ->
  stat:metric_statistic ->
  period:period ->
  start_time:timestamp ->
  end_time:timestamp ->
  unit ->
  get_rds_database_recommendation_projected_metrics_request

val make_license_recommendation_option :
  ?rank:rank ->
  ?operating_system:operating_system ->
  ?license_edition:license_edition ->
  ?license_model:license_model ->
  ?savings_opportunity:savings_opportunity ->
  unit ->
  license_recommendation_option

val make_metric_source :
  ?provider:metric_source_provider -> ?provider_arn:metric_provider_arn -> unit -> metric_source

val make_license_configuration :
  ?number_of_cores:number_of_cores ->
  ?instance_type:instance_type ->
  ?operating_system:operating_system ->
  ?license_edition:license_edition ->
  ?license_name:license_name ->
  ?license_model:license_model ->
  ?license_version:license_version ->
  ?metrics_source:metrics_source ->
  unit ->
  license_configuration

val make_license_recommendation :
  ?resource_arn:resource_arn ->
  ?account_id:account_id ->
  ?current_license_configuration:license_configuration ->
  ?lookback_period_in_days:look_back_period_in_days ->
  ?last_refresh_timestamp:last_refresh_timestamp ->
  ?finding:license_finding ->
  ?finding_reason_codes:license_finding_reason_codes ->
  ?license_recommendation_options:license_recommendation_options ->
  ?tags:tags ->
  unit ->
  license_recommendation

val make_get_license_recommendations_response :
  ?next_token:next_token ->
  ?license_recommendations:license_recommendations ->
  ?errors:get_recommendation_errors ->
  unit ->
  get_license_recommendations_response

val make_license_recommendation_filter :
  ?name:license_recommendation_filter_name ->
  ?values:filter_values ->
  unit ->
  license_recommendation_filter

val make_get_license_recommendations_request :
  ?resource_arns:resource_arns ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:license_recommendation_filters ->
  ?account_ids:account_ids ->
  unit ->
  get_license_recommendations_request

val make_lambda_savings_estimation_mode :
  ?source:lambda_savings_estimation_mode_source -> unit -> lambda_savings_estimation_mode

val make_lambda_effective_recommendation_preferences :
  ?savings_estimation_mode:lambda_savings_estimation_mode ->
  unit ->
  lambda_effective_recommendation_preferences

val make_lambda_estimated_monthly_savings :
  ?currency:currency -> ?value:value -> unit -> lambda_estimated_monthly_savings

val make_lambda_savings_opportunity_after_discounts :
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  ?estimated_monthly_savings:lambda_estimated_monthly_savings ->
  unit ->
  lambda_savings_opportunity_after_discounts

val make_lambda_function_memory_projected_metric :
  ?name:lambda_function_memory_metric_name ->
  ?statistic:lambda_function_memory_metric_statistic ->
  ?value:metric_value ->
  unit ->
  lambda_function_memory_projected_metric

val make_lambda_function_memory_recommendation_option :
  ?rank:rank ->
  ?memory_size:memory_size ->
  ?projected_utilization_metrics:lambda_function_memory_projected_metrics ->
  ?savings_opportunity:savings_opportunity ->
  ?savings_opportunity_after_discounts:lambda_savings_opportunity_after_discounts ->
  unit ->
  lambda_function_memory_recommendation_option

val make_lambda_function_utilization_metric :
  ?name:lambda_function_metric_name ->
  ?statistic:lambda_function_metric_statistic ->
  ?value:metric_value ->
  unit ->
  lambda_function_utilization_metric

val make_lambda_function_recommendation :
  ?function_arn:function_arn ->
  ?function_version:function_version ->
  ?account_id:account_id ->
  ?current_memory_size:memory_size ->
  ?number_of_invocations:number_of_invocations ->
  ?utilization_metrics:lambda_function_utilization_metrics ->
  ?lookback_period_in_days:look_back_period_in_days ->
  ?last_refresh_timestamp:last_refresh_timestamp ->
  ?finding:lambda_function_recommendation_finding ->
  ?finding_reason_codes:lambda_function_recommendation_finding_reason_codes ->
  ?memory_size_recommendation_options:lambda_function_memory_recommendation_options ->
  ?current_performance_risk:current_performance_risk ->
  ?effective_recommendation_preferences:lambda_effective_recommendation_preferences ->
  ?tags:tags ->
  unit ->
  lambda_function_recommendation

val make_get_lambda_function_recommendations_response :
  ?next_token:next_token ->
  ?lambda_function_recommendations:lambda_function_recommendations ->
  unit ->
  get_lambda_function_recommendations_response

val make_lambda_function_recommendation_filter :
  ?name:lambda_function_recommendation_filter_name ->
  ?values:filter_values ->
  unit ->
  lambda_function_recommendation_filter

val make_get_lambda_function_recommendations_request :
  ?function_arns:function_arns ->
  ?account_ids:account_ids ->
  ?filters:lambda_function_recommendation_filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  get_lambda_function_recommendations_request

val make_idle_recommendation_error :
  ?identifier:identifier ->
  ?code:code ->
  ?message:message ->
  ?resource_type:idle_recommendation_resource_type ->
  unit ->
  idle_recommendation_error

val make_idle_dimension :
  ?key:idle_dimension_key -> ?values:idle_dimension_values -> unit -> idle_dimension

val make_idle_utilization_metric :
  ?name:idle_metric_name ->
  ?statistic:metric_statistic ->
  ?value:metric_value ->
  ?dimensions:idle_dimensions ->
  unit ->
  idle_utilization_metric

val make_idle_estimated_monthly_savings :
  ?currency:currency -> ?value:value -> unit -> idle_estimated_monthly_savings

val make_idle_savings_opportunity_after_discounts :
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  ?estimated_monthly_savings:idle_estimated_monthly_savings ->
  unit ->
  idle_savings_opportunity_after_discounts

val make_idle_savings_opportunity :
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  ?estimated_monthly_savings:idle_estimated_monthly_savings ->
  unit ->
  idle_savings_opportunity

val make_idle_recommendation :
  ?resource_arn:resource_arn ->
  ?resource_id:resource_id ->
  ?resource_type:idle_recommendation_resource_type ->
  ?account_id:account_id ->
  ?finding:idle_finding ->
  ?finding_description:idle_finding_description ->
  ?savings_opportunity:idle_savings_opportunity ->
  ?savings_opportunity_after_discounts:idle_savings_opportunity_after_discounts ->
  ?utilization_metrics:idle_utilization_metrics ->
  ?look_back_period_in_days:look_back_period_in_days ->
  ?last_refresh_timestamp:last_refresh_timestamp ->
  ?tags:tags ->
  unit ->
  idle_recommendation

val make_get_idle_recommendations_response :
  ?next_token:next_token ->
  ?idle_recommendations:idle_recommendations ->
  ?errors:idle_recommendation_errors ->
  unit ->
  get_idle_recommendations_response

val make_order_by : ?dimension:dimension -> ?order:order -> unit -> order_by

val make_idle_recommendation_filter :
  ?name:idle_recommendation_filter_name ->
  ?values:filter_values ->
  unit ->
  idle_recommendation_filter

val make_get_idle_recommendations_request :
  ?resource_arns:resource_arns ->
  ?next_token:next_token ->
  ?max_results:idle_max_results ->
  ?filters:idle_recommendation_filters ->
  ?account_ids:account_ids ->
  ?order_by:order_by ->
  unit ->
  get_idle_recommendations_request

val make_get_enrollment_statuses_for_organization_response :
  ?account_enrollment_statuses:account_enrollment_statuses ->
  ?next_token:next_token ->
  unit ->
  get_enrollment_statuses_for_organization_response

val make_enrollment_filter :
  ?name:enrollment_filter_name -> ?values:filter_values -> unit -> enrollment_filter

val make_get_enrollment_statuses_for_organization_request :
  ?filters:enrollment_filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  get_enrollment_statuses_for_organization_request

val make_get_enrollment_status_response :
  ?status:status ->
  ?status_reason:status_reason ->
  ?member_accounts_enrolled:member_accounts_enrolled ->
  ?last_updated_timestamp:last_updated_timestamp ->
  ?number_of_member_accounts_opted_in:number_of_member_accounts_opted_in ->
  unit ->
  get_enrollment_status_response

val make_get_enrollment_status_request : unit -> unit

val make_get_effective_recommendation_preferences_response :
  ?enhanced_infrastructure_metrics:enhanced_infrastructure_metrics ->
  ?external_metrics_preference:external_metrics_preference ->
  ?look_back_period:look_back_period_preference ->
  ?utilization_preferences:utilization_preferences ->
  ?preferred_resources:effective_preferred_resources ->
  unit ->
  get_effective_recommendation_preferences_response

val make_get_effective_recommendation_preferences_request :
  resource_arn:resource_arn -> unit -> get_effective_recommendation_preferences_request

val make_ecs_savings_estimation_mode :
  ?source:ecs_savings_estimation_mode_source -> unit -> ecs_savings_estimation_mode

val make_ecs_effective_recommendation_preferences :
  ?savings_estimation_mode:ecs_savings_estimation_mode ->
  ?look_back_period:look_back_period_preference ->
  unit ->
  ecs_effective_recommendation_preferences

val make_memory_size_configuration :
  ?memory:nullable_memory ->
  ?memory_reservation:nullable_memory_reservation ->
  unit ->
  memory_size_configuration

val make_container_recommendation :
  ?container_name:container_name ->
  ?memory_size_configuration:memory_size_configuration ->
  ?cpu:nullable_cpu ->
  unit ->
  container_recommendation

val make_ecs_service_projected_utilization_metric :
  ?name:ecs_service_metric_name ->
  ?statistic:ecs_service_metric_statistic ->
  ?lower_bound_value:lower_bound_value ->
  ?upper_bound_value:upper_bound_value ->
  unit ->
  ecs_service_projected_utilization_metric

val make_ecs_estimated_monthly_savings :
  ?currency:currency -> ?value:value -> unit -> ecs_estimated_monthly_savings

val make_ecs_savings_opportunity_after_discounts :
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  ?estimated_monthly_savings:ecs_estimated_monthly_savings ->
  unit ->
  ecs_savings_opportunity_after_discounts

val make_ecs_service_recommendation_option :
  ?memory:nullable_memory ->
  ?cpu:nullable_cpu ->
  ?savings_opportunity:savings_opportunity ->
  ?savings_opportunity_after_discounts:ecs_savings_opportunity_after_discounts ->
  ?projected_utilization_metrics:ecs_service_projected_utilization_metrics ->
  ?container_recommendations:container_recommendations ->
  unit ->
  ecs_service_recommendation_option

val make_ecs_service_utilization_metric :
  ?name:ecs_service_metric_name ->
  ?statistic:ecs_service_metric_statistic ->
  ?value:metric_value ->
  unit ->
  ecs_service_utilization_metric

val make_container_configuration :
  ?container_name:container_name ->
  ?memory_size_configuration:memory_size_configuration ->
  ?cpu:nullable_cpu ->
  unit ->
  container_configuration

val make_service_configuration :
  ?memory:nullable_memory ->
  ?cpu:nullable_cpu ->
  ?container_configurations:container_configurations ->
  ?auto_scaling_configuration:auto_scaling_configuration ->
  ?task_definition_arn:task_definition_arn ->
  unit ->
  service_configuration

val make_ecs_service_recommendation :
  ?service_arn:service_arn ->
  ?account_id:account_id ->
  ?current_service_configuration:service_configuration ->
  ?utilization_metrics:ecs_service_utilization_metrics ->
  ?lookback_period_in_days:look_back_period_in_days ->
  ?launch_type:ecs_service_launch_type ->
  ?last_refresh_timestamp:last_refresh_timestamp ->
  ?finding:ecs_service_recommendation_finding ->
  ?finding_reason_codes:ecs_service_recommendation_finding_reason_codes ->
  ?service_recommendation_options:ecs_service_recommendation_options ->
  ?current_performance_risk:current_performance_risk ->
  ?effective_recommendation_preferences:ecs_effective_recommendation_preferences ->
  ?tags:tags ->
  unit ->
  ecs_service_recommendation

val make_get_ecs_service_recommendations_response :
  ?next_token:next_token ->
  ?ecs_service_recommendations:ecs_service_recommendations ->
  ?errors:get_recommendation_errors ->
  unit ->
  get_ecs_service_recommendations_response

val make_ecs_service_recommendation_filter :
  ?name:ecs_service_recommendation_filter_name ->
  ?values:filter_values ->
  unit ->
  ecs_service_recommendation_filter

val make_get_ecs_service_recommendations_request :
  ?service_arns:service_arns ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:ecs_service_recommendation_filters ->
  ?account_ids:account_ids ->
  unit ->
  get_ecs_service_recommendations_request

val make_ecs_service_projected_metric :
  ?name:ecs_service_metric_name ->
  ?timestamps:timestamps ->
  ?upper_bound_values:metric_values ->
  ?lower_bound_values:metric_values ->
  unit ->
  ecs_service_projected_metric

val make_ecs_service_recommended_option_projected_metric :
  ?recommended_cpu_units:cpu_size ->
  ?recommended_memory_size:memory_size ->
  ?projected_metrics:ecs_service_projected_metrics ->
  unit ->
  ecs_service_recommended_option_projected_metric

val make_get_ecs_service_recommendation_projected_metrics_response :
  ?recommended_option_projected_metrics:ecs_service_recommended_option_projected_metrics ->
  unit ->
  get_ecs_service_recommendation_projected_metrics_response

val make_get_ecs_service_recommendation_projected_metrics_request :
  service_arn:service_arn ->
  stat:metric_statistic ->
  period:period ->
  start_time:timestamp ->
  end_time:timestamp ->
  unit ->
  get_ecs_service_recommendation_projected_metrics_request

val make_projected_metric :
  ?name:metric_name -> ?timestamps:timestamps -> ?values:metric_values -> unit -> projected_metric

val make_recommended_option_projected_metric :
  ?recommended_instance_type:recommended_instance_type ->
  ?rank:rank ->
  ?projected_metrics:projected_metrics ->
  unit ->
  recommended_option_projected_metric

val make_get_ec2_recommendation_projected_metrics_response :
  ?recommended_option_projected_metrics:recommended_option_projected_metrics ->
  unit ->
  get_ec2_recommendation_projected_metrics_response

val make_get_ec2_recommendation_projected_metrics_request :
  ?recommendation_preferences:recommendation_preferences ->
  instance_arn:instance_arn ->
  stat:metric_statistic ->
  period:period ->
  start_time:timestamp ->
  end_time:timestamp ->
  unit ->
  get_ec2_recommendation_projected_metrics_request

val make_external_metric_status :
  ?status_code:external_metric_status_code ->
  ?status_reason:external_metric_status_reason ->
  unit ->
  external_metric_status

val make_recommendation_source :
  ?recommendation_source_arn:recommendation_source_arn ->
  ?recommendation_source_type:recommendation_source_type ->
  unit ->
  recommendation_source

val make_instance_estimated_monthly_savings :
  ?currency:currency -> ?value:value -> unit -> instance_estimated_monthly_savings

val make_instance_savings_opportunity_after_discounts :
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  ?estimated_monthly_savings:instance_estimated_monthly_savings ->
  unit ->
  instance_savings_opportunity_after_discounts

val make_instance_recommendation_option :
  ?instance_type:instance_type ->
  ?instance_gpu_info:gpu_info ->
  ?projected_utilization_metrics:projected_utilization_metrics ->
  ?platform_differences:platform_differences ->
  ?performance_risk:performance_risk ->
  ?rank:rank ->
  ?savings_opportunity:savings_opportunity ->
  ?savings_opportunity_after_discounts:instance_savings_opportunity_after_discounts ->
  ?migration_effort:migration_effort ->
  unit ->
  instance_recommendation_option

val make_instance_recommendation :
  ?instance_arn:instance_arn ->
  ?account_id:account_id ->
  ?instance_name:instance_name ->
  ?current_instance_type:current_instance_type ->
  ?finding:finding ->
  ?finding_reason_codes:instance_recommendation_finding_reason_codes ->
  ?utilization_metrics:utilization_metrics ->
  ?look_back_period_in_days:look_back_period_in_days ->
  ?recommendation_options:recommendation_options ->
  ?recommendation_sources:recommendation_sources ->
  ?last_refresh_timestamp:last_refresh_timestamp ->
  ?current_performance_risk:current_performance_risk ->
  ?effective_recommendation_preferences:effective_recommendation_preferences ->
  ?inferred_workload_types:inferred_workload_types ->
  ?instance_state:instance_state ->
  ?tags:tags ->
  ?external_metric_status:external_metric_status ->
  ?current_instance_gpu_info:gpu_info ->
  ?idle:instance_idle ->
  unit ->
  instance_recommendation

val make_get_ec2_instance_recommendations_response :
  ?next_token:next_token ->
  ?instance_recommendations:instance_recommendations ->
  ?errors:get_recommendation_errors ->
  unit ->
  get_ec2_instance_recommendations_response

val make_filter : ?name:filter_name -> ?values:filter_values -> unit -> filter

val make_get_ec2_instance_recommendations_request :
  ?instance_arns:instance_arns ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:filters ->
  ?account_ids:account_ids ->
  ?recommendation_preferences:recommendation_preferences ->
  unit ->
  get_ec2_instance_recommendations_request

val make_ebs_savings_estimation_mode :
  ?source:ebs_savings_estimation_mode_source -> unit -> ebs_savings_estimation_mode

val make_ebs_effective_recommendation_preferences :
  ?savings_estimation_mode:ebs_savings_estimation_mode ->
  ?look_back_period:look_back_period_preference ->
  unit ->
  ebs_effective_recommendation_preferences

val make_ebs_estimated_monthly_savings :
  ?currency:currency -> ?value:value -> unit -> ebs_estimated_monthly_savings

val make_ebs_savings_opportunity_after_discounts :
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  ?estimated_monthly_savings:ebs_estimated_monthly_savings ->
  unit ->
  ebs_savings_opportunity_after_discounts

val make_volume_configuration :
  ?volume_type:volume_type ->
  ?volume_size:volume_size ->
  ?volume_baseline_iop_s:volume_baseline_iop_s ->
  ?volume_burst_iop_s:volume_burst_iop_s ->
  ?volume_baseline_throughput:volume_baseline_throughput ->
  ?volume_burst_throughput:volume_burst_throughput ->
  ?root_volume:root_volume ->
  unit ->
  volume_configuration

val make_volume_recommendation_option :
  ?configuration:volume_configuration ->
  ?performance_risk:performance_risk ->
  ?rank:rank ->
  ?savings_opportunity:savings_opportunity ->
  ?savings_opportunity_after_discounts:ebs_savings_opportunity_after_discounts ->
  unit ->
  volume_recommendation_option

val make_ebs_utilization_metric :
  ?name:ebs_metric_name ->
  ?statistic:metric_statistic ->
  ?value:metric_value ->
  unit ->
  ebs_utilization_metric

val make_volume_recommendation :
  ?volume_arn:volume_arn ->
  ?account_id:account_id ->
  ?current_configuration:volume_configuration ->
  ?finding:ebs_finding ->
  ?utilization_metrics:ebs_utilization_metrics ->
  ?look_back_period_in_days:look_back_period_in_days ->
  ?volume_recommendation_options:volume_recommendation_options ->
  ?last_refresh_timestamp:last_refresh_timestamp ->
  ?current_performance_risk:current_performance_risk ->
  ?effective_recommendation_preferences:ebs_effective_recommendation_preferences ->
  ?tags:tags ->
  unit ->
  volume_recommendation

val make_get_ebs_volume_recommendations_response :
  ?next_token:next_token ->
  ?volume_recommendations:volume_recommendations ->
  ?errors:get_recommendation_errors ->
  unit ->
  get_ebs_volume_recommendations_response

val make_ebs_filter : ?name:ebs_filter_name -> ?values:filter_values -> unit -> ebs_filter

val make_get_ebs_volume_recommendations_request :
  ?volume_arns:volume_arns ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:ebs_filters ->
  ?account_ids:account_ids ->
  unit ->
  get_ebs_volume_recommendations_request

val make_get_auto_scaling_group_recommendations_response :
  ?next_token:next_token ->
  ?auto_scaling_group_recommendations:auto_scaling_group_recommendations ->
  ?errors:get_recommendation_errors ->
  unit ->
  get_auto_scaling_group_recommendations_response

val make_get_auto_scaling_group_recommendations_request :
  ?account_ids:account_ids ->
  ?auto_scaling_group_arns:auto_scaling_group_arns ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:filters ->
  ?recommendation_preferences:recommendation_preferences ->
  unit ->
  get_auto_scaling_group_recommendations_request

val make_s3_destination :
  ?bucket:destination_bucket ->
  ?key:destination_key ->
  ?metadata_key:metadata_key ->
  unit ->
  s3_destination

val make_export_rds_database_recommendations_response :
  ?job_id:job_id ->
  ?s3_destination:s3_destination ->
  unit ->
  export_rds_database_recommendations_response

val make_s3_destination_config :
  ?bucket:destination_bucket -> ?key_prefix:destination_key_prefix -> unit -> s3_destination_config

val make_export_rds_database_recommendations_request :
  ?account_ids:account_ids ->
  ?filters:rdsdb_recommendation_filters ->
  ?fields_to_export:exportable_rdsdb_fields ->
  ?file_format:file_format ->
  ?include_member_accounts:include_member_accounts ->
  ?recommendation_preferences:recommendation_preferences ->
  s3_destination_config:s3_destination_config ->
  unit ->
  export_rds_database_recommendations_request

val make_export_license_recommendations_response :
  ?job_id:job_id ->
  ?s3_destination:s3_destination ->
  unit ->
  export_license_recommendations_response

val make_export_license_recommendations_request :
  ?account_ids:account_ids ->
  ?filters:license_recommendation_filters ->
  ?fields_to_export:exportable_license_fields ->
  ?file_format:file_format ->
  ?include_member_accounts:include_member_accounts ->
  s3_destination_config:s3_destination_config ->
  unit ->
  export_license_recommendations_request

val make_export_lambda_function_recommendations_response :
  ?job_id:job_id ->
  ?s3_destination:s3_destination ->
  unit ->
  export_lambda_function_recommendations_response

val make_export_lambda_function_recommendations_request :
  ?account_ids:account_ids ->
  ?filters:lambda_function_recommendation_filters ->
  ?fields_to_export:exportable_lambda_function_fields ->
  ?file_format:file_format ->
  ?include_member_accounts:include_member_accounts ->
  s3_destination_config:s3_destination_config ->
  unit ->
  export_lambda_function_recommendations_request

val make_export_idle_recommendations_response :
  ?job_id:job_id -> ?s3_destination:s3_destination -> unit -> export_idle_recommendations_response

val make_export_idle_recommendations_request :
  ?account_ids:account_ids ->
  ?filters:idle_recommendation_filters ->
  ?fields_to_export:exportable_idle_fields ->
  ?file_format:file_format ->
  ?include_member_accounts:include_member_accounts ->
  s3_destination_config:s3_destination_config ->
  unit ->
  export_idle_recommendations_request

val make_export_ecs_service_recommendations_response :
  ?job_id:job_id ->
  ?s3_destination:s3_destination ->
  unit ->
  export_ecs_service_recommendations_response

val make_export_ecs_service_recommendations_request :
  ?account_ids:account_ids ->
  ?filters:ecs_service_recommendation_filters ->
  ?fields_to_export:exportable_ecs_service_fields ->
  ?file_format:file_format ->
  ?include_member_accounts:include_member_accounts ->
  s3_destination_config:s3_destination_config ->
  unit ->
  export_ecs_service_recommendations_request

val make_export_ec2_instance_recommendations_response :
  ?job_id:job_id ->
  ?s3_destination:s3_destination ->
  unit ->
  export_ec2_instance_recommendations_response

val make_export_ec2_instance_recommendations_request :
  ?account_ids:account_ids ->
  ?filters:filters ->
  ?fields_to_export:exportable_instance_fields ->
  ?file_format:file_format ->
  ?include_member_accounts:include_member_accounts ->
  ?recommendation_preferences:recommendation_preferences ->
  s3_destination_config:s3_destination_config ->
  unit ->
  export_ec2_instance_recommendations_request

val make_export_ebs_volume_recommendations_response :
  ?job_id:job_id ->
  ?s3_destination:s3_destination ->
  unit ->
  export_ebs_volume_recommendations_response

val make_export_ebs_volume_recommendations_request :
  ?account_ids:account_ids ->
  ?filters:ebs_filters ->
  ?fields_to_export:exportable_volume_fields ->
  ?file_format:file_format ->
  ?include_member_accounts:include_member_accounts ->
  s3_destination_config:s3_destination_config ->
  unit ->
  export_ebs_volume_recommendations_request

val make_export_auto_scaling_group_recommendations_response :
  ?job_id:job_id ->
  ?s3_destination:s3_destination ->
  unit ->
  export_auto_scaling_group_recommendations_response

val make_export_auto_scaling_group_recommendations_request :
  ?account_ids:account_ids ->
  ?filters:filters ->
  ?fields_to_export:exportable_auto_scaling_group_fields ->
  ?file_format:file_format ->
  ?include_member_accounts:include_member_accounts ->
  ?recommendation_preferences:recommendation_preferences ->
  s3_destination_config:s3_destination_config ->
  unit ->
  export_auto_scaling_group_recommendations_request

val make_export_destination : ?s3:s3_destination -> unit -> export_destination

val make_recommendation_export_job :
  ?job_id:job_id ->
  ?destination:export_destination ->
  ?resource_type:resource_type ->
  ?status:job_status ->
  ?creation_timestamp:creation_timestamp ->
  ?last_updated_timestamp:last_updated_timestamp ->
  ?failure_reason:failure_reason ->
  unit ->
  recommendation_export_job

val make_describe_recommendation_export_jobs_response :
  ?recommendation_export_jobs:recommendation_export_jobs ->
  ?next_token:next_token ->
  unit ->
  describe_recommendation_export_jobs_response

val make_job_filter : ?name:job_filter_name -> ?values:filter_values -> unit -> job_filter

val make_describe_recommendation_export_jobs_request :
  ?job_ids:job_ids ->
  ?filters:job_filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  describe_recommendation_export_jobs_request

val make_delete_recommendation_preferences_response : unit -> unit

val make_delete_recommendation_preferences_request :
  ?scope:scope ->
  resource_type:resource_type ->
  recommendation_preference_names:recommendation_preference_names ->
  unit ->
  delete_recommendation_preferences_request
(** {1:operations Operations} *)

module DeleteRecommendationPreferences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_recommendation_preferences_request ->
    ( delete_recommendation_preferences_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_recommendation_preferences_request ->
    ( delete_recommendation_preferences_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a recommendation preference, such as enhanced infrastructure metrics.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html}Activating \
   enhanced infrastructure metrics} in the {i Compute Optimizer User Guide}.\n\
  \ "]

module DescribeRecommendationExportJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_recommendation_export_jobs_request ->
    ( describe_recommendation_export_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_recommendation_export_jobs_request ->
    ( describe_recommendation_export_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes recommendation export jobs created in the last seven days.\n\n\
  \ Use the [ExportAutoScalingGroupRecommendations] or [ExportEC2InstanceRecommendations] actions \
   to request an export of your recommendations. Then use the [DescribeRecommendationExportJobs] \
   action to view your export jobs.\n\
  \ "]

module ExportAutoScalingGroupRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_auto_scaling_group_recommendations_request ->
    ( export_auto_scaling_group_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_auto_scaling_group_recommendations_request ->
    ( export_auto_scaling_group_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Exports optimization recommendations for Auto Scaling groups.\n\n\
  \ Recommendations are exported in a comma-separated values (.csv) file, and its metadata in a \
   JavaScript Object Notation (JSON) (.json) file, to an existing Amazon Simple Storage Service \
   (Amazon S3) bucket that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html}Exporting \
   Recommendations} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \  You can have only one Auto Scaling group export job in progress per Amazon Web Services Region.\n\
  \  "]

module ExportEBSVolumeRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_ebs_volume_recommendations_request ->
    ( export_ebs_volume_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_ebs_volume_recommendations_request ->
    ( export_ebs_volume_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Exports optimization recommendations for Amazon EBS volumes.\n\n\
  \ Recommendations are exported in a comma-separated values (.csv) file, and its metadata in a \
   JavaScript Object Notation (JSON) (.json) file, to an existing Amazon Simple Storage Service \
   (Amazon S3) bucket that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html}Exporting \
   Recommendations} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \  You can have only one Amazon EBS volume export job in progress per Amazon Web Services Region.\n\
  \  "]

module ExportEC2InstanceRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_ec2_instance_recommendations_request ->
    ( export_ec2_instance_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_ec2_instance_recommendations_request ->
    ( export_ec2_instance_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Exports optimization recommendations for Amazon EC2 instances.\n\n\
  \ Recommendations are exported in a comma-separated values (.csv) file, and its metadata in a \
   JavaScript Object Notation (JSON) (.json) file, to an existing Amazon Simple Storage Service \
   (Amazon S3) bucket that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html}Exporting \
   Recommendations} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \  You can have only one Amazon EC2 instance export job in progress per Amazon Web Services \
   Region.\n\
  \  "]

module ExportECSServiceRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_ecs_service_recommendations_request ->
    ( export_ecs_service_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_ecs_service_recommendations_request ->
    ( export_ecs_service_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Exports optimization recommendations for Amazon ECS services on Fargate. \n\n\
  \ Recommendations are exported in a CSV file, and its metadata in a JSON file, to an existing \
   Amazon Simple Storage Service (Amazon S3) bucket that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html}Exporting \
   Recommendations} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \  You can only have one Amazon ECS service export job in progress per Amazon Web Services Region.\n\
  \  "]

module ExportIdleRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_idle_recommendations_request ->
    ( export_idle_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_idle_recommendations_request ->
    ( export_idle_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Export optimization recommendations for your idle resources. \n\n\
  \ Recommendations are exported in a comma-separated values (CSV) file, and its metadata in a \
   JavaScript Object Notation (JSON) file, to an existing Amazon Simple Storage Service (Amazon \
   S3) bucket that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html}Exporting \
   Recommendations} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \  You can have only one idle resource export job in progress per Amazon Web Services Region.\n\
  \  "]

module ExportLambdaFunctionRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_lambda_function_recommendations_request ->
    ( export_lambda_function_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_lambda_function_recommendations_request ->
    ( export_lambda_function_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Exports optimization recommendations for Lambda functions.\n\n\
  \ Recommendations are exported in a comma-separated values (.csv) file, and its metadata in a \
   JavaScript Object Notation (JSON) (.json) file, to an existing Amazon Simple Storage Service \
   (Amazon S3) bucket that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html}Exporting \
   Recommendations} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \  You can have only one Lambda function export job in progress per Amazon Web Services Region.\n\
  \  "]

module ExportLicenseRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_license_recommendations_request ->
    ( export_license_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_license_recommendations_request ->
    ( export_license_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Export optimization recommendations for your licenses. \n\n\
  \ Recommendations are exported in a comma-separated values (CSV) file, and its metadata in a \
   JavaScript Object Notation (JSON) file, to an existing Amazon Simple Storage Service (Amazon \
   S3) bucket that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html}Exporting \
   Recommendations} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \  You can have only one license export job in progress per Amazon Web Services Region.\n\
  \  "]

module ExportRDSDatabaseRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_rds_database_recommendations_request ->
    ( export_rds_database_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_rds_database_recommendations_request ->
    ( export_rds_database_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Export optimization recommendations for your Amazon Aurora and Amazon Relational Database \
   Service (Amazon RDS) databases. \n\n\
  \ Recommendations are exported in a comma-separated values (CSV) file, and its metadata in a \
   JavaScript Object Notation (JSON) file, to an existing Amazon Simple Storage Service (Amazon \
   S3) bucket that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html}Exporting \
   Recommendations} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \  You can have only one Amazon Aurora or RDS export job in progress per Amazon Web Services \
   Region.\n\
  \  "]

module GetAutoScalingGroupRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_auto_scaling_group_recommendations_request ->
    ( get_auto_scaling_group_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_auto_scaling_group_recommendations_request ->
    ( get_auto_scaling_group_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns Auto Scaling group recommendations.\n\n\
  \ Compute Optimizer generates recommendations for Amazon EC2 Auto Scaling groups that meet a \
   specific set of requirements. For more information, see the \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Supported \
   resources and requirements} in the {i Compute Optimizer User Guide}.\n\
  \ "]

module GetEBSVolumeRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ebs_volume_recommendations_request ->
    ( get_ebs_volume_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ebs_volume_recommendations_request ->
    ( get_ebs_volume_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns Amazon Elastic Block Store (Amazon EBS) volume recommendations.\n\n\
  \ Compute Optimizer generates recommendations for Amazon EBS volumes that meet a specific set of \
   requirements. For more information, see the \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Supported \
   resources and requirements} in the {i Compute Optimizer User Guide}.\n\
  \ "]

module GetEC2InstanceRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ec2_instance_recommendations_request ->
    ( get_ec2_instance_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ec2_instance_recommendations_request ->
    ( get_ec2_instance_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns Amazon EC2 instance recommendations.\n\n\
  \ Compute Optimizer generates recommendations for Amazon Elastic Compute Cloud (Amazon EC2) \
   instances that meet a specific set of requirements. For more information, see the \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Supported \
   resources and requirements} in the {i Compute Optimizer User Guide}.\n\
  \ "]

module GetEC2RecommendationProjectedMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ec2_recommendation_projected_metrics_request ->
    ( get_ec2_recommendation_projected_metrics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ec2_recommendation_projected_metrics_request ->
    ( get_ec2_recommendation_projected_metrics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the projected utilization metrics of Amazon EC2 instance recommendations.\n\n\
  \  The [Cpu] and [Memory] metrics are the only projected utilization metrics returned when you \
   run this action. Additionally, the [Memory] metric is returned only for resources that have the \
   unified CloudWatch agent installed on them. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent}Enabling \
   Memory Utilization with the CloudWatch Agent}.\n\
  \  \n\
  \   "]

module GetECSServiceRecommendationProjectedMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ecs_service_recommendation_projected_metrics_request ->
    ( get_ecs_service_recommendation_projected_metrics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ecs_service_recommendation_projected_metrics_request ->
    ( get_ecs_service_recommendation_projected_metrics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Returns the projected metrics of Amazon ECS service recommendations. \n"]

module GetECSServiceRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ecs_service_recommendations_request ->
    ( get_ecs_service_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ecs_service_recommendations_request ->
    ( get_ecs_service_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Returns Amazon ECS service recommendations. \n\n\
  \  Compute Optimizer generates recommendations for Amazon ECS services on Fargate that meet a \
   specific set of requirements. For more information, see the \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Supported \
   resources and requirements} in the {i Compute Optimizer User Guide}. \n\
  \ "]

module GetEffectiveRecommendationPreferences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_effective_recommendation_preferences_request ->
    ( get_effective_recommendation_preferences_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_effective_recommendation_preferences_request ->
    ( get_effective_recommendation_preferences_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the recommendation preferences that are in effect for a given resource, such as \
   enhanced infrastructure metrics. Considers all applicable preferences that you might have set \
   at the resource, account, and organization level.\n\n\
  \ When you create a recommendation preference, you can set its status to [Active] or [Inactive]. \
   Use this action to view the recommendation preferences that are in effect, or [Active].\n\
  \ "]

module GetEnrollmentStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_enrollment_status_request ->
    ( get_enrollment_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_enrollment_status_request ->
    ( get_enrollment_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the enrollment (opt in) status of an account to the Compute Optimizer service.\n\n\
  \ If the account is the management account of an organization, this action also confirms the \
   enrollment status of member accounts of the organization. Use the \
   [GetEnrollmentStatusesForOrganization] action to get detailed information about the enrollment \
   status of member accounts of an organization.\n\
  \ "]

module GetEnrollmentStatusesForOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_enrollment_statuses_for_organization_request ->
    ( get_enrollment_statuses_for_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_enrollment_statuses_for_organization_request ->
    ( get_enrollment_statuses_for_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the Compute Optimizer enrollment (opt-in) status of organization member accounts, if \
   your account is an organization management account.\n\n\
  \ To get the enrollment status of standalone accounts, use the [GetEnrollmentStatus] action.\n\
  \ "]

module GetIdleRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_idle_recommendations_request ->
    ( get_idle_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_idle_recommendations_request ->
    ( get_idle_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns idle resource recommendations. Compute Optimizer generates recommendations for idle \
   resources that meet a specific set of requirements. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Resource \
   requirements} in the {i Compute Optimizer User Guide} \n"]

module GetLambdaFunctionRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_lambda_function_recommendations_request ->
    ( get_lambda_function_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_lambda_function_recommendations_request ->
    ( get_lambda_function_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns Lambda function recommendations.\n\n\
  \ Compute Optimizer generates recommendations for functions that meet a specific set of \
   requirements. For more information, see the \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Supported \
   resources and requirements} in the {i Compute Optimizer User Guide}.\n\
  \ "]

module GetLicenseRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_license_recommendations_request ->
    ( get_license_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_license_recommendations_request ->
    ( get_license_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns license recommendations for Amazon EC2 instances that run on a specific license.\n\n\
  \ Compute Optimizer generates recommendations for licenses that meet a specific set of \
   requirements. For more information, see the \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Supported \
   resources and requirements} in the {i Compute Optimizer User Guide}.\n\
  \ "]

module GetRDSDatabaseRecommendationProjectedMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_rds_database_recommendation_projected_metrics_request ->
    ( get_rds_database_recommendation_projected_metrics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_rds_database_recommendation_projected_metrics_request ->
    ( get_rds_database_recommendation_projected_metrics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Returns the projected metrics of Aurora and RDS database recommendations. \n"]

module GetRDSDatabaseRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_rds_database_recommendations_request ->
    ( get_rds_database_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_rds_database_recommendations_request ->
    ( get_rds_database_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Returns Amazon Aurora and RDS database recommendations. \n\n\
  \ Compute Optimizer generates recommendations for Amazon Aurora and RDS databases that meet a \
   specific set of requirements. For more information, see the \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Supported \
   resources and requirements} in the {i Compute Optimizer User Guide}.\n\
  \ "]

module GetRecommendationPreferences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_recommendation_preferences_request ->
    ( get_recommendation_preferences_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_recommendation_preferences_request ->
    ( get_recommendation_preferences_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns existing recommendation preferences, such as enhanced infrastructure metrics.\n\n\
  \ Use the [scope] parameter to specify which preferences to return. You can specify to return \
   preferences for an organization, a specific account ID, or a specific EC2 instance or Auto \
   Scaling group Amazon Resource Name (ARN).\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html}Activating \
   enhanced infrastructure metrics} in the {i Compute Optimizer User Guide}.\n\
  \  "]

module GetRecommendationSummaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_recommendation_summaries_request ->
    ( get_recommendation_summaries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_recommendation_summaries_request ->
    ( get_recommendation_summaries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the optimization findings for an account.\n\n\
  \ It returns the number of:\n\
  \ \n\
  \  {ul\n\
  \        {-  Amazon EC2 instances in an account that are [Underprovisioned], [Overprovisioned], \
   or [Optimized].\n\
  \            \n\
  \             }\n\
  \        {-  EC2Auto Scaling groups in an account that are [NotOptimized], or [Optimized].\n\
  \            \n\
  \             }\n\
  \        {-  Amazon EBS volumes in an account that are [NotOptimized], or [Optimized].\n\
  \            \n\
  \             }\n\
  \        {-  Lambda functions in an account that are [NotOptimized], or [Optimized].\n\
  \            \n\
  \             }\n\
  \        {-  Amazon ECS services in an account that are [Underprovisioned], [Overprovisioned], \
   or [Optimized].\n\
  \            \n\
  \             }\n\
  \        {-  Commercial software licenses in an account that are [InsufficientMetrics], \
   [NotOptimized] or [Optimized].\n\
  \            \n\
  \             }\n\
  \        {-  Amazon Aurora and Amazon RDS databases in an account that are [Underprovisioned], \
   [Overprovisioned], [Optimized], or [NotOptimized].\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module PutRecommendationPreferences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_recommendation_preferences_request ->
    ( put_recommendation_preferences_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_recommendation_preferences_request ->
    ( put_recommendation_preferences_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new recommendation preference or updates an existing recommendation preference, such \
   as enhanced infrastructure metrics.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html}Activating \
   enhanced infrastructure metrics} in the {i Compute Optimizer User Guide}.\n\
  \ "]

(** {1:Serialization and Deserialization} *)
module UpdateEnrollmentStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_enrollment_status_request ->
    ( update_enrollment_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_enrollment_status_request ->
    ( update_enrollment_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the enrollment (opt in and opt out) status of an account to the Compute Optimizer \
   service.\n\n\
  \ If the account is a management account of an organization, this action can also be used to \
   enroll member accounts of the organization.\n\
  \ \n\
  \  You must have the appropriate permissions to opt in to Compute Optimizer, to view its \
   recommendations, and to opt out. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html}Controlling access \
   with Amazon Web Services Identity and Access Management} in the {i Compute Optimizer User \
   Guide}.\n\
  \  \n\
  \   When you opt in, Compute Optimizer automatically creates a service-linked role in your \
   account to access its data. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/using-service-linked-roles.html}Using \
   Service-Linked Roles for Compute Optimizer} in the {i Compute Optimizer User Guide}.\n\
  \   "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
