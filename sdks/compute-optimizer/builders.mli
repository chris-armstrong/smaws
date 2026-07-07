open Types

val make_volume_configuration :
  ?root_volume:root_volume ->
  ?volume_burst_throughput:volume_burst_throughput ->
  ?volume_baseline_throughput:volume_baseline_throughput ->
  ?volume_burst_iop_s:volume_burst_iop_s ->
  ?volume_baseline_iop_s:volume_baseline_iop_s ->
  ?volume_size:volume_size ->
  ?volume_type:volume_type ->
  unit ->
  volume_configuration

val make_ebs_utilization_metric :
  ?value:metric_value ->
  ?statistic:metric_statistic ->
  ?name:ebs_metric_name ->
  unit ->
  ebs_utilization_metric

val make_estimated_monthly_savings :
  ?value:value -> ?currency:currency -> unit -> estimated_monthly_savings

val make_savings_opportunity :
  ?estimated_monthly_savings:estimated_monthly_savings ->
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  unit ->
  savings_opportunity

val make_ebs_estimated_monthly_savings :
  ?value:value -> ?currency:currency -> unit -> ebs_estimated_monthly_savings

val make_ebs_savings_opportunity_after_discounts :
  ?estimated_monthly_savings:ebs_estimated_monthly_savings ->
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  unit ->
  ebs_savings_opportunity_after_discounts

val make_volume_recommendation_option :
  ?savings_opportunity_after_discounts:ebs_savings_opportunity_after_discounts ->
  ?savings_opportunity:savings_opportunity ->
  ?rank:rank ->
  ?performance_risk:performance_risk ->
  ?configuration:volume_configuration ->
  unit ->
  volume_recommendation_option

val make_ebs_savings_estimation_mode :
  ?source:ebs_savings_estimation_mode_source -> unit -> ebs_savings_estimation_mode

val make_ebs_effective_recommendation_preferences :
  ?look_back_period:look_back_period_preference ->
  ?savings_estimation_mode:ebs_savings_estimation_mode ->
  unit ->
  ebs_effective_recommendation_preferences

val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag

val make_volume_recommendation :
  ?tags:tags ->
  ?effective_recommendation_preferences:ebs_effective_recommendation_preferences ->
  ?current_performance_risk:current_performance_risk ->
  ?last_refresh_timestamp:last_refresh_timestamp ->
  ?volume_recommendation_options:volume_recommendation_options ->
  ?look_back_period_in_days:look_back_period_in_days ->
  ?utilization_metrics:ebs_utilization_metrics ->
  ?finding:ebs_finding ->
  ?current_configuration:volume_configuration ->
  ?account_id:account_id ->
  ?volume_arn:volume_arn ->
  unit ->
  volume_recommendation

val make_customizable_metric_parameters :
  ?headroom:customizable_metric_headroom ->
  ?threshold:customizable_metric_threshold ->
  unit ->
  customizable_metric_parameters

val make_utilization_preference :
  ?metric_parameters:customizable_metric_parameters ->
  ?metric_name:customizable_metric_name ->
  unit ->
  utilization_preference

val make_utilization_metric :
  ?value:metric_value ->
  ?statistic:metric_statistic ->
  ?name:metric_name ->
  unit ->
  utilization_metric

val make_update_enrollment_status_response :
  ?status_reason:status_reason -> ?status:status -> unit -> update_enrollment_status_response

val make_update_enrollment_status_request :
  ?include_member_accounts:include_member_accounts ->
  status:status ->
  unit ->
  update_enrollment_status_request

val make_reason_code_summary :
  ?value:summary_value -> ?name:finding_reason_code -> unit -> reason_code_summary

val make_summary :
  ?reason_code_summaries:reason_code_summaries ->
  ?value:summary_value ->
  ?name:finding ->
  unit ->
  summary

val make_memory_size_configuration :
  ?memory_reservation:nullable_memory_reservation ->
  ?memory:nullable_memory ->
  unit ->
  memory_size_configuration

val make_container_configuration :
  ?cpu:nullable_cpu ->
  ?memory_size_configuration:memory_size_configuration ->
  ?container_name:container_name ->
  unit ->
  container_configuration

val make_service_configuration :
  ?task_definition_arn:task_definition_arn ->
  ?auto_scaling_configuration:auto_scaling_configuration ->
  ?container_configurations:container_configurations ->
  ?cpu:nullable_cpu ->
  ?memory:nullable_memory ->
  unit ->
  service_configuration

val make_scope : ?value:scope_value -> ?name:scope_name -> unit -> scope

val make_s3_destination_config :
  ?key_prefix:destination_key_prefix -> ?bucket:destination_bucket -> unit -> s3_destination_config

val make_s3_destination :
  ?metadata_key:metadata_key ->
  ?key:destination_key ->
  ?bucket:destination_bucket ->
  unit ->
  s3_destination

val make_projected_metric :
  ?values:metric_values -> ?timestamps:timestamps -> ?name:metric_name -> unit -> projected_metric

val make_recommended_option_projected_metric :
  ?projected_metrics:projected_metrics ->
  ?rank:rank ->
  ?recommended_instance_type:recommended_instance_type ->
  unit ->
  recommended_option_projected_metric

val make_idle_summary : ?value:summary_value -> ?name:idle_finding -> unit -> idle_summary

val make_current_performance_risk_ratings :
  ?very_low:very_low ->
  ?low:low ->
  ?medium:medium ->
  ?high:high ->
  unit ->
  current_performance_risk_ratings

val make_inferred_workload_saving :
  ?estimated_monthly_savings:estimated_monthly_savings ->
  ?inferred_workload_types:inferred_workload_types ->
  unit ->
  inferred_workload_saving

val make_recommendation_summary :
  ?inferred_workload_savings:inferred_workload_savings ->
  ?current_performance_risk_ratings:current_performance_risk_ratings ->
  ?aggregated_savings_opportunity:savings_opportunity ->
  ?idle_savings_opportunity:savings_opportunity ->
  ?savings_opportunity:savings_opportunity ->
  ?account_id:account_id ->
  ?recommendation_resource_type:recommendation_source_type ->
  ?idle_summaries:idle_summaries ->
  ?summaries:summaries ->
  unit ->
  recommendation_summary

val make_recommendation_source :
  ?recommendation_source_type:recommendation_source_type ->
  ?recommendation_source_arn:recommendation_source_arn ->
  unit ->
  recommendation_source

val make_external_metrics_preference :
  ?source:external_metrics_source -> unit -> external_metrics_preference

val make_effective_preferred_resource :
  ?exclude_list:preferred_resource_values ->
  ?effective_include_list:preferred_resource_values ->
  ?include_list:preferred_resource_values ->
  ?name:preferred_resource_name ->
  unit ->
  effective_preferred_resource

val make_recommendation_preferences_detail :
  ?savings_estimation_mode:savings_estimation_mode ->
  ?preferred_resources:effective_preferred_resources ->
  ?utilization_preferences:utilization_preferences ->
  ?look_back_period:look_back_period_preference ->
  ?external_metrics_preference:external_metrics_preference ->
  ?inferred_workload_types:inferred_workload_types_preference ->
  ?enhanced_infrastructure_metrics:enhanced_infrastructure_metrics ->
  ?resource_type:resource_type ->
  ?scope:scope ->
  unit ->
  recommendation_preferences_detail

val make_recommendation_preferences :
  ?cpu_vendor_architectures:cpu_vendor_architectures -> unit -> recommendation_preferences

val make_gpu :
  ?gpu_memory_size_in_mi_b:gpu_memory_size_in_mi_b -> ?gpu_count:gpu_count -> unit -> gpu

val make_gpu_info : ?gpus:gpus -> unit -> gpu_info

val make_instance_estimated_monthly_savings :
  ?value:value -> ?currency:currency -> unit -> instance_estimated_monthly_savings

val make_instance_savings_opportunity_after_discounts :
  ?estimated_monthly_savings:instance_estimated_monthly_savings ->
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  unit ->
  instance_savings_opportunity_after_discounts

val make_instance_recommendation_option :
  ?migration_effort:migration_effort ->
  ?savings_opportunity_after_discounts:instance_savings_opportunity_after_discounts ->
  ?savings_opportunity:savings_opportunity ->
  ?rank:rank ->
  ?performance_risk:performance_risk ->
  ?platform_differences:platform_differences ->
  ?projected_utilization_metrics:projected_utilization_metrics ->
  ?instance_gpu_info:gpu_info ->
  ?instance_type:instance_type ->
  unit ->
  instance_recommendation_option

val make_export_destination : ?s3:s3_destination -> unit -> export_destination

val make_recommendation_export_job :
  ?failure_reason:failure_reason ->
  ?last_updated_timestamp:last_updated_timestamp ->
  ?creation_timestamp:creation_timestamp ->
  ?status:job_status ->
  ?resource_type:resource_type ->
  ?destination:export_destination ->
  ?job_id:job_id ->
  unit ->
  recommendation_export_job

val make_rds_storage_estimated_monthly_savings :
  ?value:value -> ?currency:currency -> unit -> rds_storage_estimated_monthly_savings

val make_rds_storage_savings_opportunity_after_discounts :
  ?estimated_monthly_savings:rds_storage_estimated_monthly_savings ->
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  unit ->
  rds_storage_savings_opportunity_after_discounts

val make_rds_savings_estimation_mode :
  ?source:rds_savings_estimation_mode_source -> unit -> rds_savings_estimation_mode

val make_rds_instance_estimated_monthly_savings :
  ?value:value -> ?currency:currency -> unit -> rds_instance_estimated_monthly_savings

val make_rds_instance_savings_opportunity_after_discounts :
  ?estimated_monthly_savings:rds_instance_estimated_monthly_savings ->
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  unit ->
  rds_instance_savings_opportunity_after_discounts

val make_rds_effective_recommendation_preferences :
  ?savings_estimation_mode:rds_savings_estimation_mode ->
  ?look_back_period:look_back_period_preference ->
  ?enhanced_infrastructure_metrics:enhanced_infrastructure_metrics ->
  ?cpu_vendor_architectures:cpu_vendor_architectures ->
  unit ->
  rds_effective_recommendation_preferences

val make_rds_database_projected_metric :
  ?values:metric_values ->
  ?timestamps:timestamps ->
  ?name:rdsdb_metric_name ->
  unit ->
  rds_database_projected_metric

val make_rds_database_recommended_option_projected_metric :
  ?projected_metrics:rds_database_projected_metrics ->
  ?rank:rank ->
  ?recommended_db_instance_class:recommended_db_instance_class ->
  unit ->
  rds_database_recommended_option_projected_metric

val make_rdsdb_utilization_metric :
  ?value:metric_value ->
  ?statistic:rdsdb_metric_statistic ->
  ?name:rdsdb_metric_name ->
  unit ->
  rdsdb_utilization_metric

val make_db_storage_configuration :
  ?storage_throughput:nullable_storage_throughput ->
  ?max_allocated_storage:nullable_max_allocated_storage ->
  ?iops:nullable_iop_s ->
  ?allocated_storage:allocated_storage ->
  ?storage_type:storage_type ->
  unit ->
  db_storage_configuration

val make_rdsdb_storage_recommendation_option :
  ?estimated_monthly_volume_io_ps_cost_variation:rds_estimated_monthly_volume_io_ps_cost_variation ->
  ?savings_opportunity_after_discounts:rds_storage_savings_opportunity_after_discounts ->
  ?savings_opportunity:savings_opportunity ->
  ?rank:rank ->
  ?storage_configuration:db_storage_configuration ->
  unit ->
  rdsdb_storage_recommendation_option

val make_rdsdb_instance_recommendation_option :
  ?savings_opportunity_after_discounts:rds_instance_savings_opportunity_after_discounts ->
  ?savings_opportunity:savings_opportunity ->
  ?rank:rank ->
  ?performance_risk:performance_risk ->
  ?projected_utilization_metrics:rdsdb_projected_utilization_metrics ->
  ?db_instance_class:db_instance_class ->
  unit ->
  rdsdb_instance_recommendation_option

val make_rdsdb_recommendation :
  ?tags:tags ->
  ?last_refresh_timestamp:last_refresh_timestamp ->
  ?lookback_period_in_days:look_back_period_in_days ->
  ?effective_recommendation_preferences:rds_effective_recommendation_preferences ->
  ?utilization_metrics:rdsdb_utilization_metrics ->
  ?storage_recommendation_options:rdsdb_storage_recommendation_options ->
  ?instance_recommendation_options:rdsdb_instance_recommendation_options ->
  ?storage_finding_reason_codes:rds_storage_finding_reason_codes ->
  ?current_storage_estimated_monthly_volume_io_ps_cost_variation:
    rds_estimated_monthly_volume_io_ps_cost_variation ->
  ?current_instance_performance_risk:rds_current_instance_performance_risk ->
  ?instance_finding_reason_codes:rds_instance_finding_reason_codes ->
  ?storage_finding:rds_storage_finding ->
  ?instance_finding:rds_instance_finding ->
  ?idle:idle ->
  ?db_cluster_identifier:db_cluster_identifier ->
  ?current_storage_configuration:db_storage_configuration ->
  ?current_db_instance_class:current_db_instance_class ->
  ?promotion_tier:promotion_tier ->
  ?engine_version:engine_version ->
  ?engine:engine ->
  ?account_id:account_id ->
  ?resource_arn:resource_arn ->
  unit ->
  rdsdb_recommendation

val make_rdsdb_recommendation_filter :
  ?values:filter_values ->
  ?name:rdsdb_recommendation_filter_name ->
  unit ->
  rdsdb_recommendation_filter

val make_put_recommendation_preferences_response : unit -> unit

val make_preferred_resource :
  ?exclude_list:preferred_resource_values ->
  ?include_list:preferred_resource_values ->
  ?name:preferred_resource_name ->
  unit ->
  preferred_resource

val make_put_recommendation_preferences_request :
  ?savings_estimation_mode:savings_estimation_mode ->
  ?preferred_resources:preferred_resources ->
  ?utilization_preferences:utilization_preferences ->
  ?look_back_period:look_back_period_preference ->
  ?external_metrics_preference:external_metrics_preference ->
  ?inferred_workload_types:inferred_workload_types_preference ->
  ?enhanced_infrastructure_metrics:enhanced_infrastructure_metrics ->
  ?scope:scope ->
  resource_type:resource_type ->
  unit ->
  put_recommendation_preferences_request

val make_order_by : ?order:order -> ?dimension:dimension -> unit -> order_by

val make_metric_source :
  ?provider_arn:metric_provider_arn -> ?provider:metric_source_provider -> unit -> metric_source

val make_license_configuration :
  ?metrics_source:metrics_source ->
  ?license_version:license_version ->
  ?license_model:license_model ->
  ?license_name:license_name ->
  ?license_edition:license_edition ->
  ?operating_system:operating_system ->
  ?instance_type:instance_type ->
  ?number_of_cores:number_of_cores ->
  unit ->
  license_configuration

val make_license_recommendation_option :
  ?savings_opportunity:savings_opportunity ->
  ?license_model:license_model ->
  ?license_edition:license_edition ->
  ?operating_system:operating_system ->
  ?rank:rank ->
  unit ->
  license_recommendation_option

val make_license_recommendation :
  ?tags:tags ->
  ?license_recommendation_options:license_recommendation_options ->
  ?finding_reason_codes:license_finding_reason_codes ->
  ?finding:license_finding ->
  ?last_refresh_timestamp:last_refresh_timestamp ->
  ?lookback_period_in_days:look_back_period_in_days ->
  ?current_license_configuration:license_configuration ->
  ?account_id:account_id ->
  ?resource_arn:resource_arn ->
  unit ->
  license_recommendation

val make_license_recommendation_filter :
  ?values:filter_values ->
  ?name:license_recommendation_filter_name ->
  unit ->
  license_recommendation_filter

val make_lambda_estimated_monthly_savings :
  ?value:value -> ?currency:currency -> unit -> lambda_estimated_monthly_savings

val make_lambda_savings_opportunity_after_discounts :
  ?estimated_monthly_savings:lambda_estimated_monthly_savings ->
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  unit ->
  lambda_savings_opportunity_after_discounts

val make_lambda_savings_estimation_mode :
  ?source:lambda_savings_estimation_mode_source -> unit -> lambda_savings_estimation_mode

val make_lambda_function_utilization_metric :
  ?value:metric_value ->
  ?statistic:lambda_function_metric_statistic ->
  ?name:lambda_function_metric_name ->
  unit ->
  lambda_function_utilization_metric

val make_lambda_function_memory_projected_metric :
  ?value:metric_value ->
  ?statistic:lambda_function_memory_metric_statistic ->
  ?name:lambda_function_memory_metric_name ->
  unit ->
  lambda_function_memory_projected_metric

val make_lambda_function_memory_recommendation_option :
  ?savings_opportunity_after_discounts:lambda_savings_opportunity_after_discounts ->
  ?savings_opportunity:savings_opportunity ->
  ?projected_utilization_metrics:lambda_function_memory_projected_metrics ->
  ?memory_size:memory_size ->
  ?rank:rank ->
  unit ->
  lambda_function_memory_recommendation_option

val make_lambda_effective_recommendation_preferences :
  ?savings_estimation_mode:lambda_savings_estimation_mode ->
  unit ->
  lambda_effective_recommendation_preferences

val make_lambda_function_recommendation :
  ?tags:tags ->
  ?effective_recommendation_preferences:lambda_effective_recommendation_preferences ->
  ?current_performance_risk:current_performance_risk ->
  ?memory_size_recommendation_options:lambda_function_memory_recommendation_options ->
  ?finding_reason_codes:lambda_function_recommendation_finding_reason_codes ->
  ?finding:lambda_function_recommendation_finding ->
  ?last_refresh_timestamp:last_refresh_timestamp ->
  ?lookback_period_in_days:look_back_period_in_days ->
  ?utilization_metrics:lambda_function_utilization_metrics ->
  ?number_of_invocations:number_of_invocations ->
  ?current_memory_size:memory_size ->
  ?account_id:account_id ->
  ?function_version:function_version ->
  ?function_arn:function_arn ->
  unit ->
  lambda_function_recommendation

val make_lambda_function_recommendation_filter :
  ?values:filter_values ->
  ?name:lambda_function_recommendation_filter_name ->
  unit ->
  lambda_function_recommendation_filter

val make_job_filter : ?values:filter_values -> ?name:job_filter_name -> unit -> job_filter

val make_instance_savings_estimation_mode :
  ?source:instance_savings_estimation_mode_source -> unit -> instance_savings_estimation_mode

val make_effective_recommendation_preferences :
  ?savings_estimation_mode:instance_savings_estimation_mode ->
  ?preferred_resources:effective_preferred_resources ->
  ?utilization_preferences:utilization_preferences ->
  ?look_back_period:look_back_period_preference ->
  ?external_metrics_preference:external_metrics_preference ->
  ?inferred_workload_types:inferred_workload_types_preference ->
  ?enhanced_infrastructure_metrics:enhanced_infrastructure_metrics ->
  ?cpu_vendor_architectures:cpu_vendor_architectures ->
  unit ->
  effective_recommendation_preferences

val make_external_metric_status :
  ?status_reason:external_metric_status_reason ->
  ?status_code:external_metric_status_code ->
  unit ->
  external_metric_status

val make_instance_recommendation :
  ?idle:instance_idle ->
  ?current_instance_gpu_info:gpu_info ->
  ?external_metric_status:external_metric_status ->
  ?tags:tags ->
  ?instance_state:instance_state ->
  ?inferred_workload_types:inferred_workload_types ->
  ?effective_recommendation_preferences:effective_recommendation_preferences ->
  ?current_performance_risk:current_performance_risk ->
  ?last_refresh_timestamp:last_refresh_timestamp ->
  ?recommendation_sources:recommendation_sources ->
  ?recommendation_options:recommendation_options ->
  ?look_back_period_in_days:look_back_period_in_days ->
  ?utilization_metrics:utilization_metrics ->
  ?finding_reason_codes:instance_recommendation_finding_reason_codes ->
  ?finding:finding ->
  ?current_instance_type:current_instance_type ->
  ?instance_name:instance_name ->
  ?account_id:account_id ->
  ?instance_arn:instance_arn ->
  unit ->
  instance_recommendation

val make_idle_dimension :
  ?values:idle_dimension_values -> ?key:idle_dimension_key -> unit -> idle_dimension

val make_idle_utilization_metric :
  ?dimensions:idle_dimensions ->
  ?value:metric_value ->
  ?statistic:metric_statistic ->
  ?name:idle_metric_name ->
  unit ->
  idle_utilization_metric

val make_idle_estimated_monthly_savings :
  ?value:value -> ?currency:currency -> unit -> idle_estimated_monthly_savings

val make_idle_savings_opportunity_after_discounts :
  ?estimated_monthly_savings:idle_estimated_monthly_savings ->
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  unit ->
  idle_savings_opportunity_after_discounts

val make_idle_savings_opportunity :
  ?estimated_monthly_savings:idle_estimated_monthly_savings ->
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  unit ->
  idle_savings_opportunity

val make_idle_recommendation :
  ?tags:tags ->
  ?last_refresh_timestamp:last_refresh_timestamp ->
  ?look_back_period_in_days:look_back_period_in_days ->
  ?utilization_metrics:idle_utilization_metrics ->
  ?savings_opportunity_after_discounts:idle_savings_opportunity_after_discounts ->
  ?savings_opportunity:idle_savings_opportunity ->
  ?finding_description:idle_finding_description ->
  ?finding:idle_finding ->
  ?account_id:account_id ->
  ?resource_type:idle_recommendation_resource_type ->
  ?resource_id:resource_id ->
  ?resource_arn:resource_arn ->
  unit ->
  idle_recommendation

val make_idle_recommendation_filter :
  ?values:filter_values ->
  ?name:idle_recommendation_filter_name ->
  unit ->
  idle_recommendation_filter

val make_idle_recommendation_error :
  ?resource_type:idle_recommendation_resource_type ->
  ?message:message ->
  ?code:code ->
  ?identifier:identifier ->
  unit ->
  idle_recommendation_error

val make_get_recommendation_summaries_response :
  ?recommendation_summaries:recommendation_summaries ->
  ?next_token:next_token ->
  unit ->
  get_recommendation_summaries_response

val make_get_recommendation_summaries_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?account_ids:account_ids ->
  unit ->
  get_recommendation_summaries_request

val make_get_recommendation_preferences_response :
  ?recommendation_preferences_details:recommendation_preferences_details ->
  ?next_token:next_token ->
  unit ->
  get_recommendation_preferences_response

val make_get_recommendation_preferences_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?scope:scope ->
  resource_type:resource_type ->
  unit ->
  get_recommendation_preferences_request

val make_get_recommendation_error :
  ?message:message -> ?code:code -> ?identifier:identifier -> unit -> get_recommendation_error

val make_get_rds_database_recommendations_response :
  ?errors:get_recommendation_errors ->
  ?rds_db_recommendations:rdsdb_recommendations ->
  ?next_token:next_token ->
  unit ->
  get_rds_database_recommendations_response

val make_get_rds_database_recommendations_request :
  ?recommendation_preferences:recommendation_preferences ->
  ?account_ids:account_ids ->
  ?filters:rdsdb_recommendation_filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?resource_arns:resource_arns ->
  unit ->
  get_rds_database_recommendations_request

val make_get_rds_database_recommendation_projected_metrics_response :
  ?recommended_option_projected_metrics:rds_database_recommended_option_projected_metrics ->
  unit ->
  get_rds_database_recommendation_projected_metrics_response

val make_get_rds_database_recommendation_projected_metrics_request :
  ?recommendation_preferences:recommendation_preferences ->
  end_time:timestamp ->
  start_time:timestamp ->
  period:period ->
  stat:metric_statistic ->
  resource_arn:resource_arn ->
  unit ->
  get_rds_database_recommendation_projected_metrics_request

val make_get_license_recommendations_response :
  ?errors:get_recommendation_errors ->
  ?license_recommendations:license_recommendations ->
  ?next_token:next_token ->
  unit ->
  get_license_recommendations_response

val make_get_license_recommendations_request :
  ?account_ids:account_ids ->
  ?filters:license_recommendation_filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?resource_arns:resource_arns ->
  unit ->
  get_license_recommendations_request

val make_get_lambda_function_recommendations_response :
  ?lambda_function_recommendations:lambda_function_recommendations ->
  ?next_token:next_token ->
  unit ->
  get_lambda_function_recommendations_response

val make_get_lambda_function_recommendations_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:lambda_function_recommendation_filters ->
  ?account_ids:account_ids ->
  ?function_arns:function_arns ->
  unit ->
  get_lambda_function_recommendations_request

val make_get_idle_recommendations_response :
  ?errors:idle_recommendation_errors ->
  ?idle_recommendations:idle_recommendations ->
  ?next_token:next_token ->
  unit ->
  get_idle_recommendations_response

val make_get_idle_recommendations_request :
  ?order_by:order_by ->
  ?account_ids:account_ids ->
  ?filters:idle_recommendation_filters ->
  ?max_results:idle_max_results ->
  ?next_token:next_token ->
  ?resource_arns:resource_arns ->
  unit ->
  get_idle_recommendations_request

val make_account_enrollment_status :
  ?last_updated_timestamp:last_updated_timestamp ->
  ?status_reason:status_reason ->
  ?status:status ->
  ?account_id:account_id ->
  unit ->
  account_enrollment_status

val make_get_enrollment_statuses_for_organization_response :
  ?next_token:next_token ->
  ?account_enrollment_statuses:account_enrollment_statuses ->
  unit ->
  get_enrollment_statuses_for_organization_response

val make_enrollment_filter :
  ?values:filter_values -> ?name:enrollment_filter_name -> unit -> enrollment_filter

val make_get_enrollment_statuses_for_organization_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:enrollment_filters ->
  unit ->
  get_enrollment_statuses_for_organization_request

val make_get_enrollment_status_response :
  ?number_of_member_accounts_opted_in:number_of_member_accounts_opted_in ->
  ?last_updated_timestamp:last_updated_timestamp ->
  ?member_accounts_enrolled:member_accounts_enrolled ->
  ?status_reason:status_reason ->
  ?status:status ->
  unit ->
  get_enrollment_status_response

val make_get_enrollment_status_request : unit -> unit

val make_get_effective_recommendation_preferences_response :
  ?preferred_resources:effective_preferred_resources ->
  ?utilization_preferences:utilization_preferences ->
  ?look_back_period:look_back_period_preference ->
  ?external_metrics_preference:external_metrics_preference ->
  ?enhanced_infrastructure_metrics:enhanced_infrastructure_metrics ->
  unit ->
  get_effective_recommendation_preferences_response

val make_get_effective_recommendation_preferences_request :
  resource_arn:resource_arn -> unit -> get_effective_recommendation_preferences_request

val make_ecs_service_utilization_metric :
  ?value:metric_value ->
  ?statistic:ecs_service_metric_statistic ->
  ?name:ecs_service_metric_name ->
  unit ->
  ecs_service_utilization_metric

val make_ecs_estimated_monthly_savings :
  ?value:value -> ?currency:currency -> unit -> ecs_estimated_monthly_savings

val make_ecs_savings_opportunity_after_discounts :
  ?estimated_monthly_savings:ecs_estimated_monthly_savings ->
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  unit ->
  ecs_savings_opportunity_after_discounts

val make_ecs_service_projected_utilization_metric :
  ?upper_bound_value:upper_bound_value ->
  ?lower_bound_value:lower_bound_value ->
  ?statistic:ecs_service_metric_statistic ->
  ?name:ecs_service_metric_name ->
  unit ->
  ecs_service_projected_utilization_metric

val make_container_recommendation :
  ?cpu:nullable_cpu ->
  ?memory_size_configuration:memory_size_configuration ->
  ?container_name:container_name ->
  unit ->
  container_recommendation

val make_ecs_service_recommendation_option :
  ?container_recommendations:container_recommendations ->
  ?projected_utilization_metrics:ecs_service_projected_utilization_metrics ->
  ?savings_opportunity_after_discounts:ecs_savings_opportunity_after_discounts ->
  ?savings_opportunity:savings_opportunity ->
  ?cpu:nullable_cpu ->
  ?memory:nullable_memory ->
  unit ->
  ecs_service_recommendation_option

val make_ecs_savings_estimation_mode :
  ?source:ecs_savings_estimation_mode_source -> unit -> ecs_savings_estimation_mode

val make_ecs_effective_recommendation_preferences :
  ?look_back_period:look_back_period_preference ->
  ?savings_estimation_mode:ecs_savings_estimation_mode ->
  unit ->
  ecs_effective_recommendation_preferences

val make_ecs_service_recommendation :
  ?tags:tags ->
  ?effective_recommendation_preferences:ecs_effective_recommendation_preferences ->
  ?current_performance_risk:current_performance_risk ->
  ?service_recommendation_options:ecs_service_recommendation_options ->
  ?finding_reason_codes:ecs_service_recommendation_finding_reason_codes ->
  ?finding:ecs_service_recommendation_finding ->
  ?last_refresh_timestamp:last_refresh_timestamp ->
  ?launch_type:ecs_service_launch_type ->
  ?lookback_period_in_days:look_back_period_in_days ->
  ?utilization_metrics:ecs_service_utilization_metrics ->
  ?current_service_configuration:service_configuration ->
  ?account_id:account_id ->
  ?service_arn:service_arn ->
  unit ->
  ecs_service_recommendation

val make_get_ecs_service_recommendations_response :
  ?errors:get_recommendation_errors ->
  ?ecs_service_recommendations:ecs_service_recommendations ->
  ?next_token:next_token ->
  unit ->
  get_ecs_service_recommendations_response

val make_ecs_service_recommendation_filter :
  ?values:filter_values ->
  ?name:ecs_service_recommendation_filter_name ->
  unit ->
  ecs_service_recommendation_filter

val make_get_ecs_service_recommendations_request :
  ?account_ids:account_ids ->
  ?filters:ecs_service_recommendation_filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?service_arns:service_arns ->
  unit ->
  get_ecs_service_recommendations_request

val make_ecs_service_projected_metric :
  ?lower_bound_values:metric_values ->
  ?upper_bound_values:metric_values ->
  ?timestamps:timestamps ->
  ?name:ecs_service_metric_name ->
  unit ->
  ecs_service_projected_metric

val make_ecs_service_recommended_option_projected_metric :
  ?projected_metrics:ecs_service_projected_metrics ->
  ?recommended_memory_size:memory_size ->
  ?recommended_cpu_units:cpu_size ->
  unit ->
  ecs_service_recommended_option_projected_metric

val make_get_ecs_service_recommendation_projected_metrics_response :
  ?recommended_option_projected_metrics:ecs_service_recommended_option_projected_metrics ->
  unit ->
  get_ecs_service_recommendation_projected_metrics_response

val make_get_ecs_service_recommendation_projected_metrics_request :
  end_time:timestamp ->
  start_time:timestamp ->
  period:period ->
  stat:metric_statistic ->
  service_arn:service_arn ->
  unit ->
  get_ecs_service_recommendation_projected_metrics_request

val make_get_ec2_recommendation_projected_metrics_response :
  ?recommended_option_projected_metrics:recommended_option_projected_metrics ->
  unit ->
  get_ec2_recommendation_projected_metrics_response

val make_get_ec2_recommendation_projected_metrics_request :
  ?recommendation_preferences:recommendation_preferences ->
  end_time:timestamp ->
  start_time:timestamp ->
  period:period ->
  stat:metric_statistic ->
  instance_arn:instance_arn ->
  unit ->
  get_ec2_recommendation_projected_metrics_request

val make_get_ec2_instance_recommendations_response :
  ?errors:get_recommendation_errors ->
  ?instance_recommendations:instance_recommendations ->
  ?next_token:next_token ->
  unit ->
  get_ec2_instance_recommendations_response

val make_filter : ?values:filter_values -> ?name:filter_name -> unit -> filter

val make_get_ec2_instance_recommendations_request :
  ?recommendation_preferences:recommendation_preferences ->
  ?account_ids:account_ids ->
  ?filters:filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?instance_arns:instance_arns ->
  unit ->
  get_ec2_instance_recommendations_request

val make_get_ebs_volume_recommendations_response :
  ?errors:get_recommendation_errors ->
  ?volume_recommendations:volume_recommendations ->
  ?next_token:next_token ->
  unit ->
  get_ebs_volume_recommendations_response

val make_ebs_filter : ?values:filter_values -> ?name:ebs_filter_name -> unit -> ebs_filter

val make_get_ebs_volume_recommendations_request :
  ?account_ids:account_ids ->
  ?filters:ebs_filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?volume_arns:volume_arns ->
  unit ->
  get_ebs_volume_recommendations_request

val make_auto_scaling_group_configuration :
  ?mixed_instance_types:mixed_instance_types ->
  ?type_:asg_type ->
  ?estimated_instance_hour_reduction_percentage:
    nullable_estimated_instance_hour_reduction_percentage ->
  ?allocation_strategy:allocation_strategy ->
  ?instance_type:nullable_instance_type ->
  ?max_size:max_size ->
  ?min_size:min_size ->
  ?desired_capacity:desired_capacity ->
  unit ->
  auto_scaling_group_configuration

val make_auto_scaling_group_estimated_monthly_savings :
  ?value:value -> ?currency:currency -> unit -> auto_scaling_group_estimated_monthly_savings

val make_auto_scaling_group_savings_opportunity_after_discounts :
  ?estimated_monthly_savings:auto_scaling_group_estimated_monthly_savings ->
  ?savings_opportunity_percentage:savings_opportunity_percentage ->
  unit ->
  auto_scaling_group_savings_opportunity_after_discounts

val make_auto_scaling_group_recommendation_option :
  ?migration_effort:migration_effort ->
  ?savings_opportunity_after_discounts:auto_scaling_group_savings_opportunity_after_discounts ->
  ?savings_opportunity:savings_opportunity ->
  ?rank:rank ->
  ?performance_risk:performance_risk ->
  ?projected_utilization_metrics:projected_utilization_metrics ->
  ?instance_gpu_info:gpu_info ->
  ?configuration:auto_scaling_group_configuration ->
  unit ->
  auto_scaling_group_recommendation_option

val make_auto_scaling_group_recommendation :
  ?inferred_workload_types:inferred_workload_types ->
  ?effective_recommendation_preferences:effective_recommendation_preferences ->
  ?current_performance_risk:current_performance_risk ->
  ?last_refresh_timestamp:last_refresh_timestamp ->
  ?recommendation_options:auto_scaling_group_recommendation_options ->
  ?current_instance_gpu_info:gpu_info ->
  ?current_configuration:auto_scaling_group_configuration ->
  ?look_back_period_in_days:look_back_period_in_days ->
  ?utilization_metrics:utilization_metrics ->
  ?finding:finding ->
  ?auto_scaling_group_name:auto_scaling_group_name ->
  ?auto_scaling_group_arn:auto_scaling_group_arn ->
  ?account_id:account_id ->
  unit ->
  auto_scaling_group_recommendation

val make_get_auto_scaling_group_recommendations_response :
  ?errors:get_recommendation_errors ->
  ?auto_scaling_group_recommendations:auto_scaling_group_recommendations ->
  ?next_token:next_token ->
  unit ->
  get_auto_scaling_group_recommendations_response

val make_get_auto_scaling_group_recommendations_request :
  ?recommendation_preferences:recommendation_preferences ->
  ?filters:filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?auto_scaling_group_arns:auto_scaling_group_arns ->
  ?account_ids:account_ids ->
  unit ->
  get_auto_scaling_group_recommendations_request

val make_export_rds_database_recommendations_response :
  ?s3_destination:s3_destination ->
  ?job_id:job_id ->
  unit ->
  export_rds_database_recommendations_response

val make_export_rds_database_recommendations_request :
  ?recommendation_preferences:recommendation_preferences ->
  ?include_member_accounts:include_member_accounts ->
  ?file_format:file_format ->
  ?fields_to_export:exportable_rdsdb_fields ->
  ?filters:rdsdb_recommendation_filters ->
  ?account_ids:account_ids ->
  s3_destination_config:s3_destination_config ->
  unit ->
  export_rds_database_recommendations_request

val make_export_license_recommendations_response :
  ?s3_destination:s3_destination ->
  ?job_id:job_id ->
  unit ->
  export_license_recommendations_response

val make_export_license_recommendations_request :
  ?include_member_accounts:include_member_accounts ->
  ?file_format:file_format ->
  ?fields_to_export:exportable_license_fields ->
  ?filters:license_recommendation_filters ->
  ?account_ids:account_ids ->
  s3_destination_config:s3_destination_config ->
  unit ->
  export_license_recommendations_request

val make_export_lambda_function_recommendations_response :
  ?s3_destination:s3_destination ->
  ?job_id:job_id ->
  unit ->
  export_lambda_function_recommendations_response

val make_export_lambda_function_recommendations_request :
  ?include_member_accounts:include_member_accounts ->
  ?file_format:file_format ->
  ?fields_to_export:exportable_lambda_function_fields ->
  ?filters:lambda_function_recommendation_filters ->
  ?account_ids:account_ids ->
  s3_destination_config:s3_destination_config ->
  unit ->
  export_lambda_function_recommendations_request

val make_export_idle_recommendations_response :
  ?s3_destination:s3_destination -> ?job_id:job_id -> unit -> export_idle_recommendations_response

val make_export_idle_recommendations_request :
  ?include_member_accounts:include_member_accounts ->
  ?file_format:file_format ->
  ?fields_to_export:exportable_idle_fields ->
  ?filters:idle_recommendation_filters ->
  ?account_ids:account_ids ->
  s3_destination_config:s3_destination_config ->
  unit ->
  export_idle_recommendations_request

val make_export_ecs_service_recommendations_response :
  ?s3_destination:s3_destination ->
  ?job_id:job_id ->
  unit ->
  export_ecs_service_recommendations_response

val make_export_ecs_service_recommendations_request :
  ?include_member_accounts:include_member_accounts ->
  ?file_format:file_format ->
  ?fields_to_export:exportable_ecs_service_fields ->
  ?filters:ecs_service_recommendation_filters ->
  ?account_ids:account_ids ->
  s3_destination_config:s3_destination_config ->
  unit ->
  export_ecs_service_recommendations_request

val make_export_ec2_instance_recommendations_response :
  ?s3_destination:s3_destination ->
  ?job_id:job_id ->
  unit ->
  export_ec2_instance_recommendations_response

val make_export_ec2_instance_recommendations_request :
  ?recommendation_preferences:recommendation_preferences ->
  ?include_member_accounts:include_member_accounts ->
  ?file_format:file_format ->
  ?fields_to_export:exportable_instance_fields ->
  ?filters:filters ->
  ?account_ids:account_ids ->
  s3_destination_config:s3_destination_config ->
  unit ->
  export_ec2_instance_recommendations_request

val make_export_ebs_volume_recommendations_response :
  ?s3_destination:s3_destination ->
  ?job_id:job_id ->
  unit ->
  export_ebs_volume_recommendations_response

val make_export_ebs_volume_recommendations_request :
  ?include_member_accounts:include_member_accounts ->
  ?file_format:file_format ->
  ?fields_to_export:exportable_volume_fields ->
  ?filters:ebs_filters ->
  ?account_ids:account_ids ->
  s3_destination_config:s3_destination_config ->
  unit ->
  export_ebs_volume_recommendations_request

val make_export_auto_scaling_group_recommendations_response :
  ?s3_destination:s3_destination ->
  ?job_id:job_id ->
  unit ->
  export_auto_scaling_group_recommendations_response

val make_export_auto_scaling_group_recommendations_request :
  ?recommendation_preferences:recommendation_preferences ->
  ?include_member_accounts:include_member_accounts ->
  ?file_format:file_format ->
  ?fields_to_export:exportable_auto_scaling_group_fields ->
  ?filters:filters ->
  ?account_ids:account_ids ->
  s3_destination_config:s3_destination_config ->
  unit ->
  export_auto_scaling_group_recommendations_request

val make_describe_recommendation_export_jobs_response :
  ?next_token:next_token ->
  ?recommendation_export_jobs:recommendation_export_jobs ->
  unit ->
  describe_recommendation_export_jobs_response

val make_describe_recommendation_export_jobs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:job_filters ->
  ?job_ids:job_ids ->
  unit ->
  describe_recommendation_export_jobs_request

val make_delete_recommendation_preferences_response : unit -> unit

val make_delete_recommendation_preferences_request :
  ?scope:scope ->
  recommendation_preference_names:recommendation_preference_names ->
  resource_type:resource_type ->
  unit ->
  delete_recommendation_preferences_request
