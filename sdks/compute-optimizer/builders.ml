open Types

let make_account_enrollment_status ?account_id:(account_id_ : account_id option)
    ?status:(status_ : status option) ?status_reason:(status_reason_ : status_reason option)
    ?last_updated_timestamp:(last_updated_timestamp_ : last_updated_timestamp option) () =
  ({
     account_id = account_id_;
     status = status_;
     status_reason = status_reason_;
     last_updated_timestamp = last_updated_timestamp_;
   }
    : account_enrollment_status)

let make_auto_scaling_group_configuration
    ?desired_capacity:(desired_capacity_ : desired_capacity option)
    ?min_size:(min_size_ : min_size option) ?max_size:(max_size_ : max_size option)
    ?instance_type:(instance_type_ : nullable_instance_type option)
    ?allocation_strategy:(allocation_strategy_ : allocation_strategy option)
    ?estimated_instance_hour_reduction_percentage:
      (estimated_instance_hour_reduction_percentage_ :
         nullable_estimated_instance_hour_reduction_percentage option)
    ?type_:(type__ : asg_type option)
    ?mixed_instance_types:(mixed_instance_types_ : mixed_instance_types option) () =
  ({
     desired_capacity = desired_capacity_;
     min_size = min_size_;
     max_size = max_size_;
     instance_type = instance_type_;
     allocation_strategy = allocation_strategy_;
     estimated_instance_hour_reduction_percentage = estimated_instance_hour_reduction_percentage_;
     type_ = type__;
     mixed_instance_types = mixed_instance_types_;
   }
    : auto_scaling_group_configuration)

let make_auto_scaling_group_estimated_monthly_savings ?currency:(currency_ : currency option)
    ?value:(value_ : value option) () =
  ({ currency = currency_; value = value_ } : auto_scaling_group_estimated_monthly_savings)

let make_instance_savings_estimation_mode
    ?source:(source_ : instance_savings_estimation_mode_source option) () =
  ({ source = source_ } : instance_savings_estimation_mode)

let make_effective_preferred_resource ?name:(name_ : preferred_resource_name option)
    ?include_list:(include_list_ : preferred_resource_values option)
    ?effective_include_list:(effective_include_list_ : preferred_resource_values option)
    ?exclude_list:(exclude_list_ : preferred_resource_values option) () =
  ({
     name = name_;
     include_list = include_list_;
     effective_include_list = effective_include_list_;
     exclude_list = exclude_list_;
   }
    : effective_preferred_resource)

let make_customizable_metric_parameters
    ?threshold:(threshold_ : customizable_metric_threshold option)
    ?headroom:(headroom_ : customizable_metric_headroom option) () =
  ({ threshold = threshold_; headroom = headroom_ } : customizable_metric_parameters)

let make_utilization_preference ?metric_name:(metric_name_ : customizable_metric_name option)
    ?metric_parameters:(metric_parameters_ : customizable_metric_parameters option) () =
  ({ metric_name = metric_name_; metric_parameters = metric_parameters_ } : utilization_preference)

let make_external_metrics_preference ?source:(source_ : external_metrics_source option) () =
  ({ source = source_ } : external_metrics_preference)

let make_effective_recommendation_preferences
    ?cpu_vendor_architectures:(cpu_vendor_architectures_ : cpu_vendor_architectures option)
    ?enhanced_infrastructure_metrics:
      (enhanced_infrastructure_metrics_ : enhanced_infrastructure_metrics option)
    ?inferred_workload_types:(inferred_workload_types_ : inferred_workload_types_preference option)
    ?external_metrics_preference:(external_metrics_preference_ : external_metrics_preference option)
    ?look_back_period:(look_back_period_ : look_back_period_preference option)
    ?utilization_preferences:(utilization_preferences_ : utilization_preferences option)
    ?preferred_resources:(preferred_resources_ : effective_preferred_resources option)
    ?savings_estimation_mode:(savings_estimation_mode_ : instance_savings_estimation_mode option) ()
    =
  ({
     cpu_vendor_architectures = cpu_vendor_architectures_;
     enhanced_infrastructure_metrics = enhanced_infrastructure_metrics_;
     inferred_workload_types = inferred_workload_types_;
     external_metrics_preference = external_metrics_preference_;
     look_back_period = look_back_period_;
     utilization_preferences = utilization_preferences_;
     preferred_resources = preferred_resources_;
     savings_estimation_mode = savings_estimation_mode_;
   }
    : effective_recommendation_preferences)

let make_auto_scaling_group_savings_opportunity_after_discounts
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option)
    ?estimated_monthly_savings:
      (estimated_monthly_savings_ : auto_scaling_group_estimated_monthly_savings option) () =
  ({
     savings_opportunity_percentage = savings_opportunity_percentage_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : auto_scaling_group_savings_opportunity_after_discounts)

let make_estimated_monthly_savings ?currency:(currency_ : currency option)
    ?value:(value_ : value option) () =
  ({ currency = currency_; value = value_ } : estimated_monthly_savings)

let make_savings_opportunity
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings option) () =
  ({
     savings_opportunity_percentage = savings_opportunity_percentage_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : savings_opportunity)

let make_utilization_metric ?name:(name_ : metric_name option)
    ?statistic:(statistic_ : metric_statistic option) ?value:(value_ : metric_value option) () =
  ({ name = name_; statistic = statistic_; value = value_ } : utilization_metric)

let make_gpu ?gpu_count:(gpu_count_ : gpu_count option)
    ?gpu_memory_size_in_mi_b:(gpu_memory_size_in_mi_b_ : gpu_memory_size_in_mi_b option) () =
  ({ gpu_count = gpu_count_; gpu_memory_size_in_mi_b = gpu_memory_size_in_mi_b_ } : gpu)

let make_gpu_info ?gpus:(gpus_ : gpus option) () = ({ gpus = gpus_ } : gpu_info)

let make_auto_scaling_group_recommendation_option
    ?configuration:(configuration_ : auto_scaling_group_configuration option)
    ?instance_gpu_info:(instance_gpu_info_ : gpu_info option)
    ?projected_utilization_metrics:
      (projected_utilization_metrics_ : projected_utilization_metrics option)
    ?performance_risk:(performance_risk_ : performance_risk option) ?rank:(rank_ : rank option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?savings_opportunity_after_discounts:
      (savings_opportunity_after_discounts_ :
         auto_scaling_group_savings_opportunity_after_discounts option)
    ?migration_effort:(migration_effort_ : migration_effort option) () =
  ({
     configuration = configuration_;
     instance_gpu_info = instance_gpu_info_;
     projected_utilization_metrics = projected_utilization_metrics_;
     performance_risk = performance_risk_;
     rank = rank_;
     savings_opportunity = savings_opportunity_;
     savings_opportunity_after_discounts = savings_opportunity_after_discounts_;
     migration_effort = migration_effort_;
   }
    : auto_scaling_group_recommendation_option)

let make_auto_scaling_group_recommendation ?account_id:(account_id_ : account_id option)
    ?auto_scaling_group_arn:(auto_scaling_group_arn_ : auto_scaling_group_arn option)
    ?auto_scaling_group_name:(auto_scaling_group_name_ : auto_scaling_group_name option)
    ?finding:(finding_ : finding option)
    ?utilization_metrics:(utilization_metrics_ : utilization_metrics option)
    ?look_back_period_in_days:(look_back_period_in_days_ : look_back_period_in_days option)
    ?current_configuration:(current_configuration_ : auto_scaling_group_configuration option)
    ?current_instance_gpu_info:(current_instance_gpu_info_ : gpu_info option)
    ?recommendation_options:
      (recommendation_options_ : auto_scaling_group_recommendation_options option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : last_refresh_timestamp option)
    ?current_performance_risk:(current_performance_risk_ : current_performance_risk option)
    ?effective_recommendation_preferences:
      (effective_recommendation_preferences_ : effective_recommendation_preferences option)
    ?inferred_workload_types:(inferred_workload_types_ : inferred_workload_types option) () =
  ({
     account_id = account_id_;
     auto_scaling_group_arn = auto_scaling_group_arn_;
     auto_scaling_group_name = auto_scaling_group_name_;
     finding = finding_;
     utilization_metrics = utilization_metrics_;
     look_back_period_in_days = look_back_period_in_days_;
     current_configuration = current_configuration_;
     current_instance_gpu_info = current_instance_gpu_info_;
     recommendation_options = recommendation_options_;
     last_refresh_timestamp = last_refresh_timestamp_;
     current_performance_risk = current_performance_risk_;
     effective_recommendation_preferences = effective_recommendation_preferences_;
     inferred_workload_types = inferred_workload_types_;
   }
    : auto_scaling_group_recommendation)

let make_update_enrollment_status_response ?status:(status_ : status option)
    ?status_reason:(status_reason_ : status_reason option) () =
  ({ status = status_; status_reason = status_reason_ } : update_enrollment_status_response)

let make_update_enrollment_status_request
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ~status:(status_ : status) () =
  ({ status = status_; include_member_accounts = include_member_accounts_ }
    : update_enrollment_status_request)

let make_put_recommendation_preferences_response () = (() : unit)

let make_preferred_resource ?name:(name_ : preferred_resource_name option)
    ?include_list:(include_list_ : preferred_resource_values option)
    ?exclude_list:(exclude_list_ : preferred_resource_values option) () =
  ({ name = name_; include_list = include_list_; exclude_list = exclude_list_ }
    : preferred_resource)

let make_scope ?name:(name_ : scope_name option) ?value:(value_ : scope_value option) () =
  ({ name = name_; value = value_ } : scope)

let make_put_recommendation_preferences_request ?scope:(scope_ : scope option)
    ?enhanced_infrastructure_metrics:
      (enhanced_infrastructure_metrics_ : enhanced_infrastructure_metrics option)
    ?inferred_workload_types:(inferred_workload_types_ : inferred_workload_types_preference option)
    ?external_metrics_preference:(external_metrics_preference_ : external_metrics_preference option)
    ?look_back_period:(look_back_period_ : look_back_period_preference option)
    ?utilization_preferences:(utilization_preferences_ : utilization_preferences option)
    ?preferred_resources:(preferred_resources_ : preferred_resources option)
    ?savings_estimation_mode:(savings_estimation_mode_ : savings_estimation_mode option)
    ~resource_type:(resource_type_ : resource_type) () =
  ({
     resource_type = resource_type_;
     scope = scope_;
     enhanced_infrastructure_metrics = enhanced_infrastructure_metrics_;
     inferred_workload_types = inferred_workload_types_;
     external_metrics_preference = external_metrics_preference_;
     look_back_period = look_back_period_;
     utilization_preferences = utilization_preferences_;
     preferred_resources = preferred_resources_;
     savings_estimation_mode = savings_estimation_mode_;
   }
    : put_recommendation_preferences_request)

let make_inferred_workload_saving
    ?inferred_workload_types:(inferred_workload_types_ : inferred_workload_types option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings option) () =
  ({
     inferred_workload_types = inferred_workload_types_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : inferred_workload_saving)

let make_current_performance_risk_ratings ?high:(high_ : high option)
    ?medium:(medium_ : medium option) ?low:(low_ : low option)
    ?very_low:(very_low_ : very_low option) () =
  ({ high = high_; medium = medium_; low = low_; very_low = very_low_ }
    : current_performance_risk_ratings)

let make_idle_summary ?name:(name_ : idle_finding option) ?value:(value_ : summary_value option) ()
    =
  ({ name = name_; value = value_ } : idle_summary)

let make_reason_code_summary ?name:(name_ : finding_reason_code option)
    ?value:(value_ : summary_value option) () =
  ({ name = name_; value = value_ } : reason_code_summary)

let make_summary ?name:(name_ : finding option) ?value:(value_ : summary_value option)
    ?reason_code_summaries:(reason_code_summaries_ : reason_code_summaries option) () =
  ({ name = name_; value = value_; reason_code_summaries = reason_code_summaries_ } : summary)

let make_recommendation_summary ?summaries:(summaries_ : summaries option)
    ?idle_summaries:(idle_summaries_ : idle_summaries option)
    ?recommendation_resource_type:
      (recommendation_resource_type_ : recommendation_source_type option)
    ?account_id:(account_id_ : account_id option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?idle_savings_opportunity:(idle_savings_opportunity_ : savings_opportunity option)
    ?aggregated_savings_opportunity:(aggregated_savings_opportunity_ : savings_opportunity option)
    ?current_performance_risk_ratings:
      (current_performance_risk_ratings_ : current_performance_risk_ratings option)
    ?inferred_workload_savings:(inferred_workload_savings_ : inferred_workload_savings option) () =
  ({
     summaries = summaries_;
     idle_summaries = idle_summaries_;
     recommendation_resource_type = recommendation_resource_type_;
     account_id = account_id_;
     savings_opportunity = savings_opportunity_;
     idle_savings_opportunity = idle_savings_opportunity_;
     aggregated_savings_opportunity = aggregated_savings_opportunity_;
     current_performance_risk_ratings = current_performance_risk_ratings_;
     inferred_workload_savings = inferred_workload_savings_;
   }
    : recommendation_summary)

let make_get_recommendation_summaries_response ?next_token:(next_token_ : next_token option)
    ?recommendation_summaries:(recommendation_summaries_ : recommendation_summaries option) () =
  ({ next_token = next_token_; recommendation_summaries = recommendation_summaries_ }
    : get_recommendation_summaries_response)

let make_get_recommendation_summaries_request ?account_ids:(account_ids_ : account_ids option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ account_ids = account_ids_; next_token = next_token_; max_results = max_results_ }
    : get_recommendation_summaries_request)

let make_recommendation_preferences_detail ?scope:(scope_ : scope option)
    ?resource_type:(resource_type_ : resource_type option)
    ?enhanced_infrastructure_metrics:
      (enhanced_infrastructure_metrics_ : enhanced_infrastructure_metrics option)
    ?inferred_workload_types:(inferred_workload_types_ : inferred_workload_types_preference option)
    ?external_metrics_preference:(external_metrics_preference_ : external_metrics_preference option)
    ?look_back_period:(look_back_period_ : look_back_period_preference option)
    ?utilization_preferences:(utilization_preferences_ : utilization_preferences option)
    ?preferred_resources:(preferred_resources_ : effective_preferred_resources option)
    ?savings_estimation_mode:(savings_estimation_mode_ : savings_estimation_mode option) () =
  ({
     scope = scope_;
     resource_type = resource_type_;
     enhanced_infrastructure_metrics = enhanced_infrastructure_metrics_;
     inferred_workload_types = inferred_workload_types_;
     external_metrics_preference = external_metrics_preference_;
     look_back_period = look_back_period_;
     utilization_preferences = utilization_preferences_;
     preferred_resources = preferred_resources_;
     savings_estimation_mode = savings_estimation_mode_;
   }
    : recommendation_preferences_detail)

let make_get_recommendation_preferences_response ?next_token:(next_token_ : next_token option)
    ?recommendation_preferences_details:
      (recommendation_preferences_details_ : recommendation_preferences_details option) () =
  ({
     next_token = next_token_;
     recommendation_preferences_details = recommendation_preferences_details_;
   }
    : get_recommendation_preferences_response)

let make_get_recommendation_preferences_request ?scope:(scope_ : scope option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~resource_type:(resource_type_ : resource_type) () =
  ({
     resource_type = resource_type_;
     scope = scope_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_recommendation_preferences_request)

let make_get_recommendation_error ?identifier:(identifier_ : identifier option)
    ?code:(code_ : code option) ?message:(message_ : message option) () =
  ({ identifier = identifier_; code = code_; message = message_ } : get_recommendation_error)

let make_tag ?key:(key_ : tag_key option) ?value:(value_ : tag_value option) () =
  ({ key = key_; value = value_ } : tag)

let make_rds_savings_estimation_mode ?source:(source_ : rds_savings_estimation_mode_source option)
    () =
  ({ source = source_ } : rds_savings_estimation_mode)

let make_rds_effective_recommendation_preferences
    ?cpu_vendor_architectures:(cpu_vendor_architectures_ : cpu_vendor_architectures option)
    ?enhanced_infrastructure_metrics:
      (enhanced_infrastructure_metrics_ : enhanced_infrastructure_metrics option)
    ?look_back_period:(look_back_period_ : look_back_period_preference option)
    ?savings_estimation_mode:(savings_estimation_mode_ : rds_savings_estimation_mode option) () =
  ({
     cpu_vendor_architectures = cpu_vendor_architectures_;
     enhanced_infrastructure_metrics = enhanced_infrastructure_metrics_;
     look_back_period = look_back_period_;
     savings_estimation_mode = savings_estimation_mode_;
   }
    : rds_effective_recommendation_preferences)

let make_rdsdb_utilization_metric ?name:(name_ : rdsdb_metric_name option)
    ?statistic:(statistic_ : rdsdb_metric_statistic option) ?value:(value_ : metric_value option) ()
    =
  ({ name = name_; statistic = statistic_; value = value_ } : rdsdb_utilization_metric)

let make_rds_storage_estimated_monthly_savings ?currency:(currency_ : currency option)
    ?value:(value_ : value option) () =
  ({ currency = currency_; value = value_ } : rds_storage_estimated_monthly_savings)

let make_rds_storage_savings_opportunity_after_discounts
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option)
    ?estimated_monthly_savings:
      (estimated_monthly_savings_ : rds_storage_estimated_monthly_savings option) () =
  ({
     savings_opportunity_percentage = savings_opportunity_percentage_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : rds_storage_savings_opportunity_after_discounts)

let make_db_storage_configuration ?storage_type:(storage_type_ : storage_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?iops:(iops_ : nullable_iop_s option)
    ?max_allocated_storage:(max_allocated_storage_ : nullable_max_allocated_storage option)
    ?storage_throughput:(storage_throughput_ : nullable_storage_throughput option) () =
  ({
     storage_type = storage_type_;
     allocated_storage = allocated_storage_;
     iops = iops_;
     max_allocated_storage = max_allocated_storage_;
     storage_throughput = storage_throughput_;
   }
    : db_storage_configuration)

let make_rdsdb_storage_recommendation_option
    ?storage_configuration:(storage_configuration_ : db_storage_configuration option)
    ?rank:(rank_ : rank option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?savings_opportunity_after_discounts:
      (savings_opportunity_after_discounts_ : rds_storage_savings_opportunity_after_discounts option)
    ?estimated_monthly_volume_io_ps_cost_variation:
      (estimated_monthly_volume_io_ps_cost_variation_ :
         rds_estimated_monthly_volume_io_ps_cost_variation option) () =
  ({
     storage_configuration = storage_configuration_;
     rank = rank_;
     savings_opportunity = savings_opportunity_;
     savings_opportunity_after_discounts = savings_opportunity_after_discounts_;
     estimated_monthly_volume_io_ps_cost_variation = estimated_monthly_volume_io_ps_cost_variation_;
   }
    : rdsdb_storage_recommendation_option)

let make_rds_instance_estimated_monthly_savings ?currency:(currency_ : currency option)
    ?value:(value_ : value option) () =
  ({ currency = currency_; value = value_ } : rds_instance_estimated_monthly_savings)

let make_rds_instance_savings_opportunity_after_discounts
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option)
    ?estimated_monthly_savings:
      (estimated_monthly_savings_ : rds_instance_estimated_monthly_savings option) () =
  ({
     savings_opportunity_percentage = savings_opportunity_percentage_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : rds_instance_savings_opportunity_after_discounts)

let make_rdsdb_instance_recommendation_option
    ?db_instance_class:(db_instance_class_ : db_instance_class option)
    ?projected_utilization_metrics:
      (projected_utilization_metrics_ : rdsdb_projected_utilization_metrics option)
    ?performance_risk:(performance_risk_ : performance_risk option) ?rank:(rank_ : rank option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?savings_opportunity_after_discounts:
      (savings_opportunity_after_discounts_ :
         rds_instance_savings_opportunity_after_discounts option) () =
  ({
     db_instance_class = db_instance_class_;
     projected_utilization_metrics = projected_utilization_metrics_;
     performance_risk = performance_risk_;
     rank = rank_;
     savings_opportunity = savings_opportunity_;
     savings_opportunity_after_discounts = savings_opportunity_after_discounts_;
   }
    : rdsdb_instance_recommendation_option)

let make_rdsdb_recommendation ?resource_arn:(resource_arn_ : resource_arn option)
    ?account_id:(account_id_ : account_id option) ?engine:(engine_ : engine option)
    ?engine_version:(engine_version_ : engine_version option)
    ?promotion_tier:(promotion_tier_ : promotion_tier option)
    ?current_db_instance_class:(current_db_instance_class_ : current_db_instance_class option)
    ?current_storage_configuration:
      (current_storage_configuration_ : db_storage_configuration option)
    ?db_cluster_identifier:(db_cluster_identifier_ : db_cluster_identifier option)
    ?idle:(idle_ : idle option) ?instance_finding:(instance_finding_ : rds_instance_finding option)
    ?storage_finding:(storage_finding_ : rds_storage_finding option)
    ?instance_finding_reason_codes:
      (instance_finding_reason_codes_ : rds_instance_finding_reason_codes option)
    ?current_instance_performance_risk:
      (current_instance_performance_risk_ : rds_current_instance_performance_risk option)
    ?current_storage_estimated_monthly_volume_io_ps_cost_variation:
      (current_storage_estimated_monthly_volume_io_ps_cost_variation_ :
         rds_estimated_monthly_volume_io_ps_cost_variation option)
    ?storage_finding_reason_codes:
      (storage_finding_reason_codes_ : rds_storage_finding_reason_codes option)
    ?instance_recommendation_options:
      (instance_recommendation_options_ : rdsdb_instance_recommendation_options option)
    ?storage_recommendation_options:
      (storage_recommendation_options_ : rdsdb_storage_recommendation_options option)
    ?utilization_metrics:(utilization_metrics_ : rdsdb_utilization_metrics option)
    ?effective_recommendation_preferences:
      (effective_recommendation_preferences_ : rds_effective_recommendation_preferences option)
    ?lookback_period_in_days:(lookback_period_in_days_ : look_back_period_in_days option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : last_refresh_timestamp option)
    ?tags:(tags_ : tags option) () =
  ({
     resource_arn = resource_arn_;
     account_id = account_id_;
     engine = engine_;
     engine_version = engine_version_;
     promotion_tier = promotion_tier_;
     current_db_instance_class = current_db_instance_class_;
     current_storage_configuration = current_storage_configuration_;
     db_cluster_identifier = db_cluster_identifier_;
     idle = idle_;
     instance_finding = instance_finding_;
     storage_finding = storage_finding_;
     instance_finding_reason_codes = instance_finding_reason_codes_;
     current_instance_performance_risk = current_instance_performance_risk_;
     current_storage_estimated_monthly_volume_io_ps_cost_variation =
       current_storage_estimated_monthly_volume_io_ps_cost_variation_;
     storage_finding_reason_codes = storage_finding_reason_codes_;
     instance_recommendation_options = instance_recommendation_options_;
     storage_recommendation_options = storage_recommendation_options_;
     utilization_metrics = utilization_metrics_;
     effective_recommendation_preferences = effective_recommendation_preferences_;
     lookback_period_in_days = lookback_period_in_days_;
     last_refresh_timestamp = last_refresh_timestamp_;
     tags = tags_;
   }
    : rdsdb_recommendation)

let make_get_rds_database_recommendations_response ?next_token:(next_token_ : next_token option)
    ?rds_db_recommendations:(rds_db_recommendations_ : rdsdb_recommendations option)
    ?errors:(errors_ : get_recommendation_errors option) () =
  ({ next_token = next_token_; rds_db_recommendations = rds_db_recommendations_; errors = errors_ }
    : get_rds_database_recommendations_response)

let make_recommendation_preferences
    ?cpu_vendor_architectures:(cpu_vendor_architectures_ : cpu_vendor_architectures option) () =
  ({ cpu_vendor_architectures = cpu_vendor_architectures_ } : recommendation_preferences)

let make_rdsdb_recommendation_filter ?name:(name_ : rdsdb_recommendation_filter_name option)
    ?values:(values_ : filter_values option) () =
  ({ name = name_; values = values_ } : rdsdb_recommendation_filter)

let make_get_rds_database_recommendations_request
    ?resource_arns:(resource_arns_ : resource_arns option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?filters:(filters_ : rdsdb_recommendation_filters option)
    ?account_ids:(account_ids_ : account_ids option)
    ?recommendation_preferences:(recommendation_preferences_ : recommendation_preferences option) ()
    =
  ({
     resource_arns = resource_arns_;
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     account_ids = account_ids_;
     recommendation_preferences = recommendation_preferences_;
   }
    : get_rds_database_recommendations_request)

let make_rds_database_projected_metric ?name:(name_ : rdsdb_metric_name option)
    ?timestamps:(timestamps_ : timestamps option) ?values:(values_ : metric_values option) () =
  ({ name = name_; timestamps = timestamps_; values = values_ } : rds_database_projected_metric)

let make_rds_database_recommended_option_projected_metric
    ?recommended_db_instance_class:
      (recommended_db_instance_class_ : recommended_db_instance_class option)
    ?rank:(rank_ : rank option)
    ?projected_metrics:(projected_metrics_ : rds_database_projected_metrics option) () =
  ({
     recommended_db_instance_class = recommended_db_instance_class_;
     rank = rank_;
     projected_metrics = projected_metrics_;
   }
    : rds_database_recommended_option_projected_metric)

let make_get_rds_database_recommendation_projected_metrics_response
    ?recommended_option_projected_metrics:
      (recommended_option_projected_metrics_ :
         rds_database_recommended_option_projected_metrics option) () =
  ({ recommended_option_projected_metrics = recommended_option_projected_metrics_ }
    : get_rds_database_recommendation_projected_metrics_response)

let make_get_rds_database_recommendation_projected_metrics_request
    ?recommendation_preferences:(recommendation_preferences_ : recommendation_preferences option)
    ~resource_arn:(resource_arn_ : resource_arn) ~stat:(stat_ : metric_statistic)
    ~period:(period_ : period) ~start_time:(start_time_ : timestamp)
    ~end_time:(end_time_ : timestamp) () =
  ({
     resource_arn = resource_arn_;
     stat = stat_;
     period = period_;
     start_time = start_time_;
     end_time = end_time_;
     recommendation_preferences = recommendation_preferences_;
   }
    : get_rds_database_recommendation_projected_metrics_request)

let make_license_recommendation_option ?rank:(rank_ : rank option)
    ?operating_system:(operating_system_ : operating_system option)
    ?license_edition:(license_edition_ : license_edition option)
    ?license_model:(license_model_ : license_model option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option) () =
  ({
     rank = rank_;
     operating_system = operating_system_;
     license_edition = license_edition_;
     license_model = license_model_;
     savings_opportunity = savings_opportunity_;
   }
    : license_recommendation_option)

let make_metric_source ?provider:(provider_ : metric_source_provider option)
    ?provider_arn:(provider_arn_ : metric_provider_arn option) () =
  ({ provider = provider_; provider_arn = provider_arn_ } : metric_source)

let make_license_configuration ?number_of_cores:(number_of_cores_ : number_of_cores option)
    ?instance_type:(instance_type_ : instance_type option)
    ?operating_system:(operating_system_ : operating_system option)
    ?license_edition:(license_edition_ : license_edition option)
    ?license_name:(license_name_ : license_name option)
    ?license_model:(license_model_ : license_model option)
    ?license_version:(license_version_ : license_version option)
    ?metrics_source:(metrics_source_ : metrics_source option) () =
  ({
     number_of_cores = number_of_cores_;
     instance_type = instance_type_;
     operating_system = operating_system_;
     license_edition = license_edition_;
     license_name = license_name_;
     license_model = license_model_;
     license_version = license_version_;
     metrics_source = metrics_source_;
   }
    : license_configuration)

let make_license_recommendation ?resource_arn:(resource_arn_ : resource_arn option)
    ?account_id:(account_id_ : account_id option)
    ?current_license_configuration:(current_license_configuration_ : license_configuration option)
    ?lookback_period_in_days:(lookback_period_in_days_ : look_back_period_in_days option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : last_refresh_timestamp option)
    ?finding:(finding_ : license_finding option)
    ?finding_reason_codes:(finding_reason_codes_ : license_finding_reason_codes option)
    ?license_recommendation_options:
      (license_recommendation_options_ : license_recommendation_options option)
    ?tags:(tags_ : tags option) () =
  ({
     resource_arn = resource_arn_;
     account_id = account_id_;
     current_license_configuration = current_license_configuration_;
     lookback_period_in_days = lookback_period_in_days_;
     last_refresh_timestamp = last_refresh_timestamp_;
     finding = finding_;
     finding_reason_codes = finding_reason_codes_;
     license_recommendation_options = license_recommendation_options_;
     tags = tags_;
   }
    : license_recommendation)

let make_get_license_recommendations_response ?next_token:(next_token_ : next_token option)
    ?license_recommendations:(license_recommendations_ : license_recommendations option)
    ?errors:(errors_ : get_recommendation_errors option) () =
  ({
     next_token = next_token_;
     license_recommendations = license_recommendations_;
     errors = errors_;
   }
    : get_license_recommendations_response)

let make_license_recommendation_filter ?name:(name_ : license_recommendation_filter_name option)
    ?values:(values_ : filter_values option) () =
  ({ name = name_; values = values_ } : license_recommendation_filter)

let make_get_license_recommendations_request ?resource_arns:(resource_arns_ : resource_arns option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?filters:(filters_ : license_recommendation_filters option)
    ?account_ids:(account_ids_ : account_ids option) () =
  ({
     resource_arns = resource_arns_;
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     account_ids = account_ids_;
   }
    : get_license_recommendations_request)

let make_lambda_savings_estimation_mode
    ?source:(source_ : lambda_savings_estimation_mode_source option) () =
  ({ source = source_ } : lambda_savings_estimation_mode)

let make_lambda_effective_recommendation_preferences
    ?savings_estimation_mode:(savings_estimation_mode_ : lambda_savings_estimation_mode option) () =
  ({ savings_estimation_mode = savings_estimation_mode_ }
    : lambda_effective_recommendation_preferences)

let make_lambda_estimated_monthly_savings ?currency:(currency_ : currency option)
    ?value:(value_ : value option) () =
  ({ currency = currency_; value = value_ } : lambda_estimated_monthly_savings)

let make_lambda_savings_opportunity_after_discounts
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option)
    ?estimated_monthly_savings:
      (estimated_monthly_savings_ : lambda_estimated_monthly_savings option) () =
  ({
     savings_opportunity_percentage = savings_opportunity_percentage_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : lambda_savings_opportunity_after_discounts)

let make_lambda_function_memory_projected_metric
    ?name:(name_ : lambda_function_memory_metric_name option)
    ?statistic:(statistic_ : lambda_function_memory_metric_statistic option)
    ?value:(value_ : metric_value option) () =
  ({ name = name_; statistic = statistic_; value = value_ }
    : lambda_function_memory_projected_metric)

let make_lambda_function_memory_recommendation_option ?rank:(rank_ : rank option)
    ?memory_size:(memory_size_ : memory_size option)
    ?projected_utilization_metrics:
      (projected_utilization_metrics_ : lambda_function_memory_projected_metrics option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?savings_opportunity_after_discounts:
      (savings_opportunity_after_discounts_ : lambda_savings_opportunity_after_discounts option) ()
    =
  ({
     rank = rank_;
     memory_size = memory_size_;
     projected_utilization_metrics = projected_utilization_metrics_;
     savings_opportunity = savings_opportunity_;
     savings_opportunity_after_discounts = savings_opportunity_after_discounts_;
   }
    : lambda_function_memory_recommendation_option)

let make_lambda_function_utilization_metric ?name:(name_ : lambda_function_metric_name option)
    ?statistic:(statistic_ : lambda_function_metric_statistic option)
    ?value:(value_ : metric_value option) () =
  ({ name = name_; statistic = statistic_; value = value_ } : lambda_function_utilization_metric)

let make_lambda_function_recommendation ?function_arn:(function_arn_ : function_arn option)
    ?function_version:(function_version_ : function_version option)
    ?account_id:(account_id_ : account_id option)
    ?current_memory_size:(current_memory_size_ : memory_size option)
    ?number_of_invocations:(number_of_invocations_ : number_of_invocations option)
    ?utilization_metrics:(utilization_metrics_ : lambda_function_utilization_metrics option)
    ?lookback_period_in_days:(lookback_period_in_days_ : look_back_period_in_days option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : last_refresh_timestamp option)
    ?finding:(finding_ : lambda_function_recommendation_finding option)
    ?finding_reason_codes:
      (finding_reason_codes_ : lambda_function_recommendation_finding_reason_codes option)
    ?memory_size_recommendation_options:
      (memory_size_recommendation_options_ : lambda_function_memory_recommendation_options option)
    ?current_performance_risk:(current_performance_risk_ : current_performance_risk option)
    ?effective_recommendation_preferences:
      (effective_recommendation_preferences_ : lambda_effective_recommendation_preferences option)
    ?tags:(tags_ : tags option) () =
  ({
     function_arn = function_arn_;
     function_version = function_version_;
     account_id = account_id_;
     current_memory_size = current_memory_size_;
     number_of_invocations = number_of_invocations_;
     utilization_metrics = utilization_metrics_;
     lookback_period_in_days = lookback_period_in_days_;
     last_refresh_timestamp = last_refresh_timestamp_;
     finding = finding_;
     finding_reason_codes = finding_reason_codes_;
     memory_size_recommendation_options = memory_size_recommendation_options_;
     current_performance_risk = current_performance_risk_;
     effective_recommendation_preferences = effective_recommendation_preferences_;
     tags = tags_;
   }
    : lambda_function_recommendation)

let make_get_lambda_function_recommendations_response ?next_token:(next_token_ : next_token option)
    ?lambda_function_recommendations:
      (lambda_function_recommendations_ : lambda_function_recommendations option) () =
  ({ next_token = next_token_; lambda_function_recommendations = lambda_function_recommendations_ }
    : get_lambda_function_recommendations_response)

let make_lambda_function_recommendation_filter
    ?name:(name_ : lambda_function_recommendation_filter_name option)
    ?values:(values_ : filter_values option) () =
  ({ name = name_; values = values_ } : lambda_function_recommendation_filter)

let make_get_lambda_function_recommendations_request
    ?function_arns:(function_arns_ : function_arns option)
    ?account_ids:(account_ids_ : account_ids option)
    ?filters:(filters_ : lambda_function_recommendation_filters option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     function_arns = function_arns_;
     account_ids = account_ids_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_lambda_function_recommendations_request)

let make_idle_recommendation_error ?identifier:(identifier_ : identifier option)
    ?code:(code_ : code option) ?message:(message_ : message option)
    ?resource_type:(resource_type_ : idle_recommendation_resource_type option) () =
  ({ identifier = identifier_; code = code_; message = message_; resource_type = resource_type_ }
    : idle_recommendation_error)

let make_idle_dimension ?key:(key_ : idle_dimension_key option)
    ?values:(values_ : idle_dimension_values option) () =
  ({ key = key_; values = values_ } : idle_dimension)

let make_idle_utilization_metric ?name:(name_ : idle_metric_name option)
    ?statistic:(statistic_ : metric_statistic option) ?value:(value_ : metric_value option)
    ?dimensions:(dimensions_ : idle_dimensions option) () =
  ({ name = name_; statistic = statistic_; value = value_; dimensions = dimensions_ }
    : idle_utilization_metric)

let make_idle_estimated_monthly_savings ?currency:(currency_ : currency option)
    ?value:(value_ : value option) () =
  ({ currency = currency_; value = value_ } : idle_estimated_monthly_savings)

let make_idle_savings_opportunity_after_discounts
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : idle_estimated_monthly_savings option)
    () =
  ({
     savings_opportunity_percentage = savings_opportunity_percentage_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : idle_savings_opportunity_after_discounts)

let make_idle_savings_opportunity
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : idle_estimated_monthly_savings option)
    () =
  ({
     savings_opportunity_percentage = savings_opportunity_percentage_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : idle_savings_opportunity)

let make_idle_recommendation ?resource_arn:(resource_arn_ : resource_arn option)
    ?resource_id:(resource_id_ : resource_id option)
    ?resource_type:(resource_type_ : idle_recommendation_resource_type option)
    ?account_id:(account_id_ : account_id option) ?finding:(finding_ : idle_finding option)
    ?finding_description:(finding_description_ : idle_finding_description option)
    ?savings_opportunity:(savings_opportunity_ : idle_savings_opportunity option)
    ?savings_opportunity_after_discounts:
      (savings_opportunity_after_discounts_ : idle_savings_opportunity_after_discounts option)
    ?utilization_metrics:(utilization_metrics_ : idle_utilization_metrics option)
    ?look_back_period_in_days:(look_back_period_in_days_ : look_back_period_in_days option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : last_refresh_timestamp option)
    ?tags:(tags_ : tags option) () =
  ({
     resource_arn = resource_arn_;
     resource_id = resource_id_;
     resource_type = resource_type_;
     account_id = account_id_;
     finding = finding_;
     finding_description = finding_description_;
     savings_opportunity = savings_opportunity_;
     savings_opportunity_after_discounts = savings_opportunity_after_discounts_;
     utilization_metrics = utilization_metrics_;
     look_back_period_in_days = look_back_period_in_days_;
     last_refresh_timestamp = last_refresh_timestamp_;
     tags = tags_;
   }
    : idle_recommendation)

let make_get_idle_recommendations_response ?next_token:(next_token_ : next_token option)
    ?idle_recommendations:(idle_recommendations_ : idle_recommendations option)
    ?errors:(errors_ : idle_recommendation_errors option) () =
  ({ next_token = next_token_; idle_recommendations = idle_recommendations_; errors = errors_ }
    : get_idle_recommendations_response)

let make_order_by ?dimension:(dimension_ : dimension option) ?order:(order_ : order option) () =
  ({ dimension = dimension_; order = order_ } : order_by)

let make_idle_recommendation_filter ?name:(name_ : idle_recommendation_filter_name option)
    ?values:(values_ : filter_values option) () =
  ({ name = name_; values = values_ } : idle_recommendation_filter)

let make_get_idle_recommendations_request ?resource_arns:(resource_arns_ : resource_arns option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : idle_max_results option)
    ?filters:(filters_ : idle_recommendation_filters option)
    ?account_ids:(account_ids_ : account_ids option) ?order_by:(order_by_ : order_by option) () =
  ({
     resource_arns = resource_arns_;
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     account_ids = account_ids_;
     order_by = order_by_;
   }
    : get_idle_recommendations_request)

let make_get_enrollment_statuses_for_organization_response
    ?account_enrollment_statuses:(account_enrollment_statuses_ : account_enrollment_statuses option)
    ?next_token:(next_token_ : next_token option) () =
  ({ account_enrollment_statuses = account_enrollment_statuses_; next_token = next_token_ }
    : get_enrollment_statuses_for_organization_response)

let make_enrollment_filter ?name:(name_ : enrollment_filter_name option)
    ?values:(values_ : filter_values option) () =
  ({ name = name_; values = values_ } : enrollment_filter)

let make_get_enrollment_statuses_for_organization_request
    ?filters:(filters_ : enrollment_filters option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_ }
    : get_enrollment_statuses_for_organization_request)

let make_get_enrollment_status_response ?status:(status_ : status option)
    ?status_reason:(status_reason_ : status_reason option)
    ?member_accounts_enrolled:(member_accounts_enrolled_ : member_accounts_enrolled option)
    ?last_updated_timestamp:(last_updated_timestamp_ : last_updated_timestamp option)
    ?number_of_member_accounts_opted_in:
      (number_of_member_accounts_opted_in_ : number_of_member_accounts_opted_in option) () =
  ({
     status = status_;
     status_reason = status_reason_;
     member_accounts_enrolled = member_accounts_enrolled_;
     last_updated_timestamp = last_updated_timestamp_;
     number_of_member_accounts_opted_in = number_of_member_accounts_opted_in_;
   }
    : get_enrollment_status_response)

let make_get_enrollment_status_request () = (() : unit)

let make_get_effective_recommendation_preferences_response
    ?enhanced_infrastructure_metrics:
      (enhanced_infrastructure_metrics_ : enhanced_infrastructure_metrics option)
    ?external_metrics_preference:(external_metrics_preference_ : external_metrics_preference option)
    ?look_back_period:(look_back_period_ : look_back_period_preference option)
    ?utilization_preferences:(utilization_preferences_ : utilization_preferences option)
    ?preferred_resources:(preferred_resources_ : effective_preferred_resources option) () =
  ({
     enhanced_infrastructure_metrics = enhanced_infrastructure_metrics_;
     external_metrics_preference = external_metrics_preference_;
     look_back_period = look_back_period_;
     utilization_preferences = utilization_preferences_;
     preferred_resources = preferred_resources_;
   }
    : get_effective_recommendation_preferences_response)

let make_get_effective_recommendation_preferences_request
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_effective_recommendation_preferences_request)

let make_ecs_savings_estimation_mode ?source:(source_ : ecs_savings_estimation_mode_source option)
    () =
  ({ source = source_ } : ecs_savings_estimation_mode)

let make_ecs_effective_recommendation_preferences
    ?savings_estimation_mode:(savings_estimation_mode_ : ecs_savings_estimation_mode option)
    ?look_back_period:(look_back_period_ : look_back_period_preference option) () =
  ({ savings_estimation_mode = savings_estimation_mode_; look_back_period = look_back_period_ }
    : ecs_effective_recommendation_preferences)

let make_memory_size_configuration ?memory:(memory_ : nullable_memory option)
    ?memory_reservation:(memory_reservation_ : nullable_memory_reservation option) () =
  ({ memory = memory_; memory_reservation = memory_reservation_ } : memory_size_configuration)

let make_container_recommendation ?container_name:(container_name_ : container_name option)
    ?memory_size_configuration:(memory_size_configuration_ : memory_size_configuration option)
    ?cpu:(cpu_ : nullable_cpu option) () =
  ({
     container_name = container_name_;
     memory_size_configuration = memory_size_configuration_;
     cpu = cpu_;
   }
    : container_recommendation)

let make_ecs_service_projected_utilization_metric ?name:(name_ : ecs_service_metric_name option)
    ?statistic:(statistic_ : ecs_service_metric_statistic option)
    ?lower_bound_value:(lower_bound_value_ : lower_bound_value option)
    ?upper_bound_value:(upper_bound_value_ : upper_bound_value option) () =
  ({
     name = name_;
     statistic = statistic_;
     lower_bound_value = lower_bound_value_;
     upper_bound_value = upper_bound_value_;
   }
    : ecs_service_projected_utilization_metric)

let make_ecs_estimated_monthly_savings ?currency:(currency_ : currency option)
    ?value:(value_ : value option) () =
  ({ currency = currency_; value = value_ } : ecs_estimated_monthly_savings)

let make_ecs_savings_opportunity_after_discounts
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : ecs_estimated_monthly_savings option)
    () =
  ({
     savings_opportunity_percentage = savings_opportunity_percentage_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : ecs_savings_opportunity_after_discounts)

let make_ecs_service_recommendation_option ?memory:(memory_ : nullable_memory option)
    ?cpu:(cpu_ : nullable_cpu option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?savings_opportunity_after_discounts:
      (savings_opportunity_after_discounts_ : ecs_savings_opportunity_after_discounts option)
    ?projected_utilization_metrics:
      (projected_utilization_metrics_ : ecs_service_projected_utilization_metrics option)
    ?container_recommendations:(container_recommendations_ : container_recommendations option) () =
  ({
     memory = memory_;
     cpu = cpu_;
     savings_opportunity = savings_opportunity_;
     savings_opportunity_after_discounts = savings_opportunity_after_discounts_;
     projected_utilization_metrics = projected_utilization_metrics_;
     container_recommendations = container_recommendations_;
   }
    : ecs_service_recommendation_option)

let make_ecs_service_utilization_metric ?name:(name_ : ecs_service_metric_name option)
    ?statistic:(statistic_ : ecs_service_metric_statistic option)
    ?value:(value_ : metric_value option) () =
  ({ name = name_; statistic = statistic_; value = value_ } : ecs_service_utilization_metric)

let make_container_configuration ?container_name:(container_name_ : container_name option)
    ?memory_size_configuration:(memory_size_configuration_ : memory_size_configuration option)
    ?cpu:(cpu_ : nullable_cpu option) () =
  ({
     container_name = container_name_;
     memory_size_configuration = memory_size_configuration_;
     cpu = cpu_;
   }
    : container_configuration)

let make_service_configuration ?memory:(memory_ : nullable_memory option)
    ?cpu:(cpu_ : nullable_cpu option)
    ?container_configurations:(container_configurations_ : container_configurations option)
    ?auto_scaling_configuration:(auto_scaling_configuration_ : auto_scaling_configuration option)
    ?task_definition_arn:(task_definition_arn_ : task_definition_arn option) () =
  ({
     memory = memory_;
     cpu = cpu_;
     container_configurations = container_configurations_;
     auto_scaling_configuration = auto_scaling_configuration_;
     task_definition_arn = task_definition_arn_;
   }
    : service_configuration)

let make_ecs_service_recommendation ?service_arn:(service_arn_ : service_arn option)
    ?account_id:(account_id_ : account_id option)
    ?current_service_configuration:(current_service_configuration_ : service_configuration option)
    ?utilization_metrics:(utilization_metrics_ : ecs_service_utilization_metrics option)
    ?lookback_period_in_days:(lookback_period_in_days_ : look_back_period_in_days option)
    ?launch_type:(launch_type_ : ecs_service_launch_type option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : last_refresh_timestamp option)
    ?finding:(finding_ : ecs_service_recommendation_finding option)
    ?finding_reason_codes:
      (finding_reason_codes_ : ecs_service_recommendation_finding_reason_codes option)
    ?service_recommendation_options:
      (service_recommendation_options_ : ecs_service_recommendation_options option)
    ?current_performance_risk:(current_performance_risk_ : current_performance_risk option)
    ?effective_recommendation_preferences:
      (effective_recommendation_preferences_ : ecs_effective_recommendation_preferences option)
    ?tags:(tags_ : tags option) () =
  ({
     service_arn = service_arn_;
     account_id = account_id_;
     current_service_configuration = current_service_configuration_;
     utilization_metrics = utilization_metrics_;
     lookback_period_in_days = lookback_period_in_days_;
     launch_type = launch_type_;
     last_refresh_timestamp = last_refresh_timestamp_;
     finding = finding_;
     finding_reason_codes = finding_reason_codes_;
     service_recommendation_options = service_recommendation_options_;
     current_performance_risk = current_performance_risk_;
     effective_recommendation_preferences = effective_recommendation_preferences_;
     tags = tags_;
   }
    : ecs_service_recommendation)

let make_get_ecs_service_recommendations_response ?next_token:(next_token_ : next_token option)
    ?ecs_service_recommendations:(ecs_service_recommendations_ : ecs_service_recommendations option)
    ?errors:(errors_ : get_recommendation_errors option) () =
  ({
     next_token = next_token_;
     ecs_service_recommendations = ecs_service_recommendations_;
     errors = errors_;
   }
    : get_ecs_service_recommendations_response)

let make_ecs_service_recommendation_filter
    ?name:(name_ : ecs_service_recommendation_filter_name option)
    ?values:(values_ : filter_values option) () =
  ({ name = name_; values = values_ } : ecs_service_recommendation_filter)

let make_get_ecs_service_recommendations_request ?service_arns:(service_arns_ : service_arns option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?filters:(filters_ : ecs_service_recommendation_filters option)
    ?account_ids:(account_ids_ : account_ids option) () =
  ({
     service_arns = service_arns_;
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     account_ids = account_ids_;
   }
    : get_ecs_service_recommendations_request)

let make_ecs_service_projected_metric ?name:(name_ : ecs_service_metric_name option)
    ?timestamps:(timestamps_ : timestamps option)
    ?upper_bound_values:(upper_bound_values_ : metric_values option)
    ?lower_bound_values:(lower_bound_values_ : metric_values option) () =
  ({
     name = name_;
     timestamps = timestamps_;
     upper_bound_values = upper_bound_values_;
     lower_bound_values = lower_bound_values_;
   }
    : ecs_service_projected_metric)

let make_ecs_service_recommended_option_projected_metric
    ?recommended_cpu_units:(recommended_cpu_units_ : cpu_size option)
    ?recommended_memory_size:(recommended_memory_size_ : memory_size option)
    ?projected_metrics:(projected_metrics_ : ecs_service_projected_metrics option) () =
  ({
     recommended_cpu_units = recommended_cpu_units_;
     recommended_memory_size = recommended_memory_size_;
     projected_metrics = projected_metrics_;
   }
    : ecs_service_recommended_option_projected_metric)

let make_get_ecs_service_recommendation_projected_metrics_response
    ?recommended_option_projected_metrics:
      (recommended_option_projected_metrics_ :
         ecs_service_recommended_option_projected_metrics option) () =
  ({ recommended_option_projected_metrics = recommended_option_projected_metrics_ }
    : get_ecs_service_recommendation_projected_metrics_response)

let make_get_ecs_service_recommendation_projected_metrics_request
    ~service_arn:(service_arn_ : service_arn) ~stat:(stat_ : metric_statistic)
    ~period:(period_ : period) ~start_time:(start_time_ : timestamp)
    ~end_time:(end_time_ : timestamp) () =
  ({
     service_arn = service_arn_;
     stat = stat_;
     period = period_;
     start_time = start_time_;
     end_time = end_time_;
   }
    : get_ecs_service_recommendation_projected_metrics_request)

let make_projected_metric ?name:(name_ : metric_name option)
    ?timestamps:(timestamps_ : timestamps option) ?values:(values_ : metric_values option) () =
  ({ name = name_; timestamps = timestamps_; values = values_ } : projected_metric)

let make_recommended_option_projected_metric
    ?recommended_instance_type:(recommended_instance_type_ : recommended_instance_type option)
    ?rank:(rank_ : rank option) ?projected_metrics:(projected_metrics_ : projected_metrics option)
    () =
  ({
     recommended_instance_type = recommended_instance_type_;
     rank = rank_;
     projected_metrics = projected_metrics_;
   }
    : recommended_option_projected_metric)

let make_get_ec2_recommendation_projected_metrics_response
    ?recommended_option_projected_metrics:
      (recommended_option_projected_metrics_ : recommended_option_projected_metrics option) () =
  ({ recommended_option_projected_metrics = recommended_option_projected_metrics_ }
    : get_ec2_recommendation_projected_metrics_response)

let make_get_ec2_recommendation_projected_metrics_request
    ?recommendation_preferences:(recommendation_preferences_ : recommendation_preferences option)
    ~instance_arn:(instance_arn_ : instance_arn) ~stat:(stat_ : metric_statistic)
    ~period:(period_ : period) ~start_time:(start_time_ : timestamp)
    ~end_time:(end_time_ : timestamp) () =
  ({
     instance_arn = instance_arn_;
     stat = stat_;
     period = period_;
     start_time = start_time_;
     end_time = end_time_;
     recommendation_preferences = recommendation_preferences_;
   }
    : get_ec2_recommendation_projected_metrics_request)

let make_external_metric_status ?status_code:(status_code_ : external_metric_status_code option)
    ?status_reason:(status_reason_ : external_metric_status_reason option) () =
  ({ status_code = status_code_; status_reason = status_reason_ } : external_metric_status)

let make_recommendation_source
    ?recommendation_source_arn:(recommendation_source_arn_ : recommendation_source_arn option)
    ?recommendation_source_type:(recommendation_source_type_ : recommendation_source_type option) ()
    =
  ({
     recommendation_source_arn = recommendation_source_arn_;
     recommendation_source_type = recommendation_source_type_;
   }
    : recommendation_source)

let make_instance_estimated_monthly_savings ?currency:(currency_ : currency option)
    ?value:(value_ : value option) () =
  ({ currency = currency_; value = value_ } : instance_estimated_monthly_savings)

let make_instance_savings_opportunity_after_discounts
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option)
    ?estimated_monthly_savings:
      (estimated_monthly_savings_ : instance_estimated_monthly_savings option) () =
  ({
     savings_opportunity_percentage = savings_opportunity_percentage_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : instance_savings_opportunity_after_discounts)

let make_instance_recommendation_option ?instance_type:(instance_type_ : instance_type option)
    ?instance_gpu_info:(instance_gpu_info_ : gpu_info option)
    ?projected_utilization_metrics:
      (projected_utilization_metrics_ : projected_utilization_metrics option)
    ?platform_differences:(platform_differences_ : platform_differences option)
    ?performance_risk:(performance_risk_ : performance_risk option) ?rank:(rank_ : rank option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?savings_opportunity_after_discounts:
      (savings_opportunity_after_discounts_ : instance_savings_opportunity_after_discounts option)
    ?migration_effort:(migration_effort_ : migration_effort option) () =
  ({
     instance_type = instance_type_;
     instance_gpu_info = instance_gpu_info_;
     projected_utilization_metrics = projected_utilization_metrics_;
     platform_differences = platform_differences_;
     performance_risk = performance_risk_;
     rank = rank_;
     savings_opportunity = savings_opportunity_;
     savings_opportunity_after_discounts = savings_opportunity_after_discounts_;
     migration_effort = migration_effort_;
   }
    : instance_recommendation_option)

let make_instance_recommendation ?instance_arn:(instance_arn_ : instance_arn option)
    ?account_id:(account_id_ : account_id option)
    ?instance_name:(instance_name_ : instance_name option)
    ?current_instance_type:(current_instance_type_ : current_instance_type option)
    ?finding:(finding_ : finding option)
    ?finding_reason_codes:
      (finding_reason_codes_ : instance_recommendation_finding_reason_codes option)
    ?utilization_metrics:(utilization_metrics_ : utilization_metrics option)
    ?look_back_period_in_days:(look_back_period_in_days_ : look_back_period_in_days option)
    ?recommendation_options:(recommendation_options_ : recommendation_options option)
    ?recommendation_sources:(recommendation_sources_ : recommendation_sources option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : last_refresh_timestamp option)
    ?current_performance_risk:(current_performance_risk_ : current_performance_risk option)
    ?effective_recommendation_preferences:
      (effective_recommendation_preferences_ : effective_recommendation_preferences option)
    ?inferred_workload_types:(inferred_workload_types_ : inferred_workload_types option)
    ?instance_state:(instance_state_ : instance_state option) ?tags:(tags_ : tags option)
    ?external_metric_status:(external_metric_status_ : external_metric_status option)
    ?current_instance_gpu_info:(current_instance_gpu_info_ : gpu_info option)
    ?idle:(idle_ : instance_idle option) () =
  ({
     instance_arn = instance_arn_;
     account_id = account_id_;
     instance_name = instance_name_;
     current_instance_type = current_instance_type_;
     finding = finding_;
     finding_reason_codes = finding_reason_codes_;
     utilization_metrics = utilization_metrics_;
     look_back_period_in_days = look_back_period_in_days_;
     recommendation_options = recommendation_options_;
     recommendation_sources = recommendation_sources_;
     last_refresh_timestamp = last_refresh_timestamp_;
     current_performance_risk = current_performance_risk_;
     effective_recommendation_preferences = effective_recommendation_preferences_;
     inferred_workload_types = inferred_workload_types_;
     instance_state = instance_state_;
     tags = tags_;
     external_metric_status = external_metric_status_;
     current_instance_gpu_info = current_instance_gpu_info_;
     idle = idle_;
   }
    : instance_recommendation)

let make_get_ec2_instance_recommendations_response ?next_token:(next_token_ : next_token option)
    ?instance_recommendations:(instance_recommendations_ : instance_recommendations option)
    ?errors:(errors_ : get_recommendation_errors option) () =
  ({
     next_token = next_token_;
     instance_recommendations = instance_recommendations_;
     errors = errors_;
   }
    : get_ec2_instance_recommendations_response)

let make_filter ?name:(name_ : filter_name option) ?values:(values_ : filter_values option) () =
  ({ name = name_; values = values_ } : filter)

let make_get_ec2_instance_recommendations_request
    ?instance_arns:(instance_arns_ : instance_arns option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?filters:(filters_ : filters option) ?account_ids:(account_ids_ : account_ids option)
    ?recommendation_preferences:(recommendation_preferences_ : recommendation_preferences option) ()
    =
  ({
     instance_arns = instance_arns_;
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     account_ids = account_ids_;
     recommendation_preferences = recommendation_preferences_;
   }
    : get_ec2_instance_recommendations_request)

let make_ebs_savings_estimation_mode ?source:(source_ : ebs_savings_estimation_mode_source option)
    () =
  ({ source = source_ } : ebs_savings_estimation_mode)

let make_ebs_effective_recommendation_preferences
    ?savings_estimation_mode:(savings_estimation_mode_ : ebs_savings_estimation_mode option)
    ?look_back_period:(look_back_period_ : look_back_period_preference option) () =
  ({ savings_estimation_mode = savings_estimation_mode_; look_back_period = look_back_period_ }
    : ebs_effective_recommendation_preferences)

let make_ebs_estimated_monthly_savings ?currency:(currency_ : currency option)
    ?value:(value_ : value option) () =
  ({ currency = currency_; value = value_ } : ebs_estimated_monthly_savings)

let make_ebs_savings_opportunity_after_discounts
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : ebs_estimated_monthly_savings option)
    () =
  ({
     savings_opportunity_percentage = savings_opportunity_percentage_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : ebs_savings_opportunity_after_discounts)

let make_volume_configuration ?volume_type:(volume_type_ : volume_type option)
    ?volume_size:(volume_size_ : volume_size option)
    ?volume_baseline_iop_s:(volume_baseline_iop_s_ : volume_baseline_iop_s option)
    ?volume_burst_iop_s:(volume_burst_iop_s_ : volume_burst_iop_s option)
    ?volume_baseline_throughput:(volume_baseline_throughput_ : volume_baseline_throughput option)
    ?volume_burst_throughput:(volume_burst_throughput_ : volume_burst_throughput option)
    ?root_volume:(root_volume_ : root_volume option) () =
  ({
     volume_type = volume_type_;
     volume_size = volume_size_;
     volume_baseline_iop_s = volume_baseline_iop_s_;
     volume_burst_iop_s = volume_burst_iop_s_;
     volume_baseline_throughput = volume_baseline_throughput_;
     volume_burst_throughput = volume_burst_throughput_;
     root_volume = root_volume_;
   }
    : volume_configuration)

let make_volume_recommendation_option ?configuration:(configuration_ : volume_configuration option)
    ?performance_risk:(performance_risk_ : performance_risk option) ?rank:(rank_ : rank option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?savings_opportunity_after_discounts:
      (savings_opportunity_after_discounts_ : ebs_savings_opportunity_after_discounts option) () =
  ({
     configuration = configuration_;
     performance_risk = performance_risk_;
     rank = rank_;
     savings_opportunity = savings_opportunity_;
     savings_opportunity_after_discounts = savings_opportunity_after_discounts_;
   }
    : volume_recommendation_option)

let make_ebs_utilization_metric ?name:(name_ : ebs_metric_name option)
    ?statistic:(statistic_ : metric_statistic option) ?value:(value_ : metric_value option) () =
  ({ name = name_; statistic = statistic_; value = value_ } : ebs_utilization_metric)

let make_volume_recommendation ?volume_arn:(volume_arn_ : volume_arn option)
    ?account_id:(account_id_ : account_id option)
    ?current_configuration:(current_configuration_ : volume_configuration option)
    ?finding:(finding_ : ebs_finding option)
    ?utilization_metrics:(utilization_metrics_ : ebs_utilization_metrics option)
    ?look_back_period_in_days:(look_back_period_in_days_ : look_back_period_in_days option)
    ?volume_recommendation_options:
      (volume_recommendation_options_ : volume_recommendation_options option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : last_refresh_timestamp option)
    ?current_performance_risk:(current_performance_risk_ : current_performance_risk option)
    ?effective_recommendation_preferences:
      (effective_recommendation_preferences_ : ebs_effective_recommendation_preferences option)
    ?tags:(tags_ : tags option) () =
  ({
     volume_arn = volume_arn_;
     account_id = account_id_;
     current_configuration = current_configuration_;
     finding = finding_;
     utilization_metrics = utilization_metrics_;
     look_back_period_in_days = look_back_period_in_days_;
     volume_recommendation_options = volume_recommendation_options_;
     last_refresh_timestamp = last_refresh_timestamp_;
     current_performance_risk = current_performance_risk_;
     effective_recommendation_preferences = effective_recommendation_preferences_;
     tags = tags_;
   }
    : volume_recommendation)

let make_get_ebs_volume_recommendations_response ?next_token:(next_token_ : next_token option)
    ?volume_recommendations:(volume_recommendations_ : volume_recommendations option)
    ?errors:(errors_ : get_recommendation_errors option) () =
  ({ next_token = next_token_; volume_recommendations = volume_recommendations_; errors = errors_ }
    : get_ebs_volume_recommendations_response)

let make_ebs_filter ?name:(name_ : ebs_filter_name option) ?values:(values_ : filter_values option)
    () =
  ({ name = name_; values = values_ } : ebs_filter)

let make_get_ebs_volume_recommendations_request ?volume_arns:(volume_arns_ : volume_arns option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?filters:(filters_ : ebs_filters option) ?account_ids:(account_ids_ : account_ids option) () =
  ({
     volume_arns = volume_arns_;
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     account_ids = account_ids_;
   }
    : get_ebs_volume_recommendations_request)

let make_get_auto_scaling_group_recommendations_response
    ?next_token:(next_token_ : next_token option)
    ?auto_scaling_group_recommendations:
      (auto_scaling_group_recommendations_ : auto_scaling_group_recommendations option)
    ?errors:(errors_ : get_recommendation_errors option) () =
  ({
     next_token = next_token_;
     auto_scaling_group_recommendations = auto_scaling_group_recommendations_;
     errors = errors_;
   }
    : get_auto_scaling_group_recommendations_response)

let make_get_auto_scaling_group_recommendations_request
    ?account_ids:(account_ids_ : account_ids option)
    ?auto_scaling_group_arns:(auto_scaling_group_arns_ : auto_scaling_group_arns option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?filters:(filters_ : filters option)
    ?recommendation_preferences:(recommendation_preferences_ : recommendation_preferences option) ()
    =
  ({
     account_ids = account_ids_;
     auto_scaling_group_arns = auto_scaling_group_arns_;
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     recommendation_preferences = recommendation_preferences_;
   }
    : get_auto_scaling_group_recommendations_request)

let make_s3_destination ?bucket:(bucket_ : destination_bucket option)
    ?key:(key_ : destination_key option) ?metadata_key:(metadata_key_ : metadata_key option) () =
  ({ bucket = bucket_; key = key_; metadata_key = metadata_key_ } : s3_destination)

let make_export_rds_database_recommendations_response ?job_id:(job_id_ : job_id option)
    ?s3_destination:(s3_destination_ : s3_destination option) () =
  ({ job_id = job_id_; s3_destination = s3_destination_ }
    : export_rds_database_recommendations_response)

let make_s3_destination_config ?bucket:(bucket_ : destination_bucket option)
    ?key_prefix:(key_prefix_ : destination_key_prefix option) () =
  ({ bucket = bucket_; key_prefix = key_prefix_ } : s3_destination_config)

let make_export_rds_database_recommendations_request
    ?account_ids:(account_ids_ : account_ids option)
    ?filters:(filters_ : rdsdb_recommendation_filters option)
    ?fields_to_export:(fields_to_export_ : exportable_rdsdb_fields option)
    ?file_format:(file_format_ : file_format option)
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ?recommendation_preferences:(recommendation_preferences_ : recommendation_preferences option)
    ~s3_destination_config:(s3_destination_config_ : s3_destination_config) () =
  ({
     account_ids = account_ids_;
     filters = filters_;
     fields_to_export = fields_to_export_;
     s3_destination_config = s3_destination_config_;
     file_format = file_format_;
     include_member_accounts = include_member_accounts_;
     recommendation_preferences = recommendation_preferences_;
   }
    : export_rds_database_recommendations_request)

let make_export_license_recommendations_response ?job_id:(job_id_ : job_id option)
    ?s3_destination:(s3_destination_ : s3_destination option) () =
  ({ job_id = job_id_; s3_destination = s3_destination_ } : export_license_recommendations_response)

let make_export_license_recommendations_request ?account_ids:(account_ids_ : account_ids option)
    ?filters:(filters_ : license_recommendation_filters option)
    ?fields_to_export:(fields_to_export_ : exportable_license_fields option)
    ?file_format:(file_format_ : file_format option)
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ~s3_destination_config:(s3_destination_config_ : s3_destination_config) () =
  ({
     account_ids = account_ids_;
     filters = filters_;
     fields_to_export = fields_to_export_;
     s3_destination_config = s3_destination_config_;
     file_format = file_format_;
     include_member_accounts = include_member_accounts_;
   }
    : export_license_recommendations_request)

let make_export_lambda_function_recommendations_response ?job_id:(job_id_ : job_id option)
    ?s3_destination:(s3_destination_ : s3_destination option) () =
  ({ job_id = job_id_; s3_destination = s3_destination_ }
    : export_lambda_function_recommendations_response)

let make_export_lambda_function_recommendations_request
    ?account_ids:(account_ids_ : account_ids option)
    ?filters:(filters_ : lambda_function_recommendation_filters option)
    ?fields_to_export:(fields_to_export_ : exportable_lambda_function_fields option)
    ?file_format:(file_format_ : file_format option)
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ~s3_destination_config:(s3_destination_config_ : s3_destination_config) () =
  ({
     account_ids = account_ids_;
     filters = filters_;
     fields_to_export = fields_to_export_;
     s3_destination_config = s3_destination_config_;
     file_format = file_format_;
     include_member_accounts = include_member_accounts_;
   }
    : export_lambda_function_recommendations_request)

let make_export_idle_recommendations_response ?job_id:(job_id_ : job_id option)
    ?s3_destination:(s3_destination_ : s3_destination option) () =
  ({ job_id = job_id_; s3_destination = s3_destination_ } : export_idle_recommendations_response)

let make_export_idle_recommendations_request ?account_ids:(account_ids_ : account_ids option)
    ?filters:(filters_ : idle_recommendation_filters option)
    ?fields_to_export:(fields_to_export_ : exportable_idle_fields option)
    ?file_format:(file_format_ : file_format option)
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ~s3_destination_config:(s3_destination_config_ : s3_destination_config) () =
  ({
     account_ids = account_ids_;
     filters = filters_;
     fields_to_export = fields_to_export_;
     s3_destination_config = s3_destination_config_;
     file_format = file_format_;
     include_member_accounts = include_member_accounts_;
   }
    : export_idle_recommendations_request)

let make_export_ecs_service_recommendations_response ?job_id:(job_id_ : job_id option)
    ?s3_destination:(s3_destination_ : s3_destination option) () =
  ({ job_id = job_id_; s3_destination = s3_destination_ }
    : export_ecs_service_recommendations_response)

let make_export_ecs_service_recommendations_request ?account_ids:(account_ids_ : account_ids option)
    ?filters:(filters_ : ecs_service_recommendation_filters option)
    ?fields_to_export:(fields_to_export_ : exportable_ecs_service_fields option)
    ?file_format:(file_format_ : file_format option)
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ~s3_destination_config:(s3_destination_config_ : s3_destination_config) () =
  ({
     account_ids = account_ids_;
     filters = filters_;
     fields_to_export = fields_to_export_;
     s3_destination_config = s3_destination_config_;
     file_format = file_format_;
     include_member_accounts = include_member_accounts_;
   }
    : export_ecs_service_recommendations_request)

let make_export_ec2_instance_recommendations_response ?job_id:(job_id_ : job_id option)
    ?s3_destination:(s3_destination_ : s3_destination option) () =
  ({ job_id = job_id_; s3_destination = s3_destination_ }
    : export_ec2_instance_recommendations_response)

let make_export_ec2_instance_recommendations_request
    ?account_ids:(account_ids_ : account_ids option) ?filters:(filters_ : filters option)
    ?fields_to_export:(fields_to_export_ : exportable_instance_fields option)
    ?file_format:(file_format_ : file_format option)
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ?recommendation_preferences:(recommendation_preferences_ : recommendation_preferences option)
    ~s3_destination_config:(s3_destination_config_ : s3_destination_config) () =
  ({
     account_ids = account_ids_;
     filters = filters_;
     fields_to_export = fields_to_export_;
     s3_destination_config = s3_destination_config_;
     file_format = file_format_;
     include_member_accounts = include_member_accounts_;
     recommendation_preferences = recommendation_preferences_;
   }
    : export_ec2_instance_recommendations_request)

let make_export_ebs_volume_recommendations_response ?job_id:(job_id_ : job_id option)
    ?s3_destination:(s3_destination_ : s3_destination option) () =
  ({ job_id = job_id_; s3_destination = s3_destination_ }
    : export_ebs_volume_recommendations_response)

let make_export_ebs_volume_recommendations_request ?account_ids:(account_ids_ : account_ids option)
    ?filters:(filters_ : ebs_filters option)
    ?fields_to_export:(fields_to_export_ : exportable_volume_fields option)
    ?file_format:(file_format_ : file_format option)
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ~s3_destination_config:(s3_destination_config_ : s3_destination_config) () =
  ({
     account_ids = account_ids_;
     filters = filters_;
     fields_to_export = fields_to_export_;
     s3_destination_config = s3_destination_config_;
     file_format = file_format_;
     include_member_accounts = include_member_accounts_;
   }
    : export_ebs_volume_recommendations_request)

let make_export_auto_scaling_group_recommendations_response ?job_id:(job_id_ : job_id option)
    ?s3_destination:(s3_destination_ : s3_destination option) () =
  ({ job_id = job_id_; s3_destination = s3_destination_ }
    : export_auto_scaling_group_recommendations_response)

let make_export_auto_scaling_group_recommendations_request
    ?account_ids:(account_ids_ : account_ids option) ?filters:(filters_ : filters option)
    ?fields_to_export:(fields_to_export_ : exportable_auto_scaling_group_fields option)
    ?file_format:(file_format_ : file_format option)
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ?recommendation_preferences:(recommendation_preferences_ : recommendation_preferences option)
    ~s3_destination_config:(s3_destination_config_ : s3_destination_config) () =
  ({
     account_ids = account_ids_;
     filters = filters_;
     fields_to_export = fields_to_export_;
     s3_destination_config = s3_destination_config_;
     file_format = file_format_;
     include_member_accounts = include_member_accounts_;
     recommendation_preferences = recommendation_preferences_;
   }
    : export_auto_scaling_group_recommendations_request)

let make_export_destination ?s3:(s3_ : s3_destination option) () =
  ({ s3 = s3_ } : export_destination)

let make_recommendation_export_job ?job_id:(job_id_ : job_id option)
    ?destination:(destination_ : export_destination option)
    ?resource_type:(resource_type_ : resource_type option) ?status:(status_ : job_status option)
    ?creation_timestamp:(creation_timestamp_ : creation_timestamp option)
    ?last_updated_timestamp:(last_updated_timestamp_ : last_updated_timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     job_id = job_id_;
     destination = destination_;
     resource_type = resource_type_;
     status = status_;
     creation_timestamp = creation_timestamp_;
     last_updated_timestamp = last_updated_timestamp_;
     failure_reason = failure_reason_;
   }
    : recommendation_export_job)

let make_describe_recommendation_export_jobs_response
    ?recommendation_export_jobs:(recommendation_export_jobs_ : recommendation_export_jobs option)
    ?next_token:(next_token_ : next_token option) () =
  ({ recommendation_export_jobs = recommendation_export_jobs_; next_token = next_token_ }
    : describe_recommendation_export_jobs_response)

let make_job_filter ?name:(name_ : job_filter_name option) ?values:(values_ : filter_values option)
    () =
  ({ name = name_; values = values_ } : job_filter)

let make_describe_recommendation_export_jobs_request ?job_ids:(job_ids_ : job_ids option)
    ?filters:(filters_ : job_filters option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ job_ids = job_ids_; filters = filters_; next_token = next_token_; max_results = max_results_ }
    : describe_recommendation_export_jobs_request)

let make_delete_recommendation_preferences_response () = (() : unit)

let make_delete_recommendation_preferences_request ?scope:(scope_ : scope option)
    ~resource_type:(resource_type_ : resource_type)
    ~recommendation_preference_names:
      (recommendation_preference_names_ : recommendation_preference_names) () =
  ({
     resource_type = resource_type_;
     scope = scope_;
     recommendation_preference_names = recommendation_preference_names_;
   }
    : delete_recommendation_preferences_request)
