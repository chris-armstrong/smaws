open Types

let make_volume_configuration ?root_volume:(root_volume_ : root_volume option)
    ?volume_burst_throughput:(volume_burst_throughput_ : volume_burst_throughput option)
    ?volume_baseline_throughput:(volume_baseline_throughput_ : volume_baseline_throughput option)
    ?volume_burst_iop_s:(volume_burst_iop_s_ : volume_burst_iop_s option)
    ?volume_baseline_iop_s:(volume_baseline_iop_s_ : volume_baseline_iop_s option)
    ?volume_size:(volume_size_ : volume_size option)
    ?volume_type:(volume_type_ : volume_type option) () =
  ({
     root_volume = root_volume_;
     volume_burst_throughput = volume_burst_throughput_;
     volume_baseline_throughput = volume_baseline_throughput_;
     volume_burst_iop_s = volume_burst_iop_s_;
     volume_baseline_iop_s = volume_baseline_iop_s_;
     volume_size = volume_size_;
     volume_type = volume_type_;
   }
    : volume_configuration)

let make_ebs_utilization_metric ?value:(value_ : metric_value option)
    ?statistic:(statistic_ : metric_statistic option) ?name:(name_ : ebs_metric_name option) () =
  ({ value = value_; statistic = statistic_; name = name_ } : ebs_utilization_metric)

let make_estimated_monthly_savings ?value:(value_ : value option)
    ?currency:(currency_ : currency option) () =
  ({ value = value_; currency = currency_ } : estimated_monthly_savings)

let make_savings_opportunity
    ?estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings option)
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     savings_opportunity_percentage = savings_opportunity_percentage_;
   }
    : savings_opportunity)

let make_ebs_estimated_monthly_savings ?value:(value_ : value option)
    ?currency:(currency_ : currency option) () =
  ({ value = value_; currency = currency_ } : ebs_estimated_monthly_savings)

let make_ebs_savings_opportunity_after_discounts
    ?estimated_monthly_savings:(estimated_monthly_savings_ : ebs_estimated_monthly_savings option)
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     savings_opportunity_percentage = savings_opportunity_percentage_;
   }
    : ebs_savings_opportunity_after_discounts)

let make_volume_recommendation_option
    ?savings_opportunity_after_discounts:
      (savings_opportunity_after_discounts_ : ebs_savings_opportunity_after_discounts option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?rank:(rank_ : rank option) ?performance_risk:(performance_risk_ : performance_risk option)
    ?configuration:(configuration_ : volume_configuration option) () =
  ({
     savings_opportunity_after_discounts = savings_opportunity_after_discounts_;
     savings_opportunity = savings_opportunity_;
     rank = rank_;
     performance_risk = performance_risk_;
     configuration = configuration_;
   }
    : volume_recommendation_option)

let make_ebs_savings_estimation_mode ?source:(source_ : ebs_savings_estimation_mode_source option)
    () =
  ({ source = source_ } : ebs_savings_estimation_mode)

let make_ebs_effective_recommendation_preferences
    ?look_back_period:(look_back_period_ : look_back_period_preference option)
    ?savings_estimation_mode:(savings_estimation_mode_ : ebs_savings_estimation_mode option) () =
  ({ look_back_period = look_back_period_; savings_estimation_mode = savings_estimation_mode_ }
    : ebs_effective_recommendation_preferences)

let make_tag ?value:(value_ : tag_value option) ?key:(key_ : tag_key option) () =
  ({ value = value_; key = key_ } : tag)

let make_volume_recommendation ?tags:(tags_ : tags option)
    ?effective_recommendation_preferences:
      (effective_recommendation_preferences_ : ebs_effective_recommendation_preferences option)
    ?current_performance_risk:(current_performance_risk_ : current_performance_risk option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : last_refresh_timestamp option)
    ?volume_recommendation_options:
      (volume_recommendation_options_ : volume_recommendation_options option)
    ?look_back_period_in_days:(look_back_period_in_days_ : look_back_period_in_days option)
    ?utilization_metrics:(utilization_metrics_ : ebs_utilization_metrics option)
    ?finding:(finding_ : ebs_finding option)
    ?current_configuration:(current_configuration_ : volume_configuration option)
    ?account_id:(account_id_ : account_id option) ?volume_arn:(volume_arn_ : volume_arn option) () =
  ({
     tags = tags_;
     effective_recommendation_preferences = effective_recommendation_preferences_;
     current_performance_risk = current_performance_risk_;
     last_refresh_timestamp = last_refresh_timestamp_;
     volume_recommendation_options = volume_recommendation_options_;
     look_back_period_in_days = look_back_period_in_days_;
     utilization_metrics = utilization_metrics_;
     finding = finding_;
     current_configuration = current_configuration_;
     account_id = account_id_;
     volume_arn = volume_arn_;
   }
    : volume_recommendation)

let make_customizable_metric_parameters ?headroom:(headroom_ : customizable_metric_headroom option)
    ?threshold:(threshold_ : customizable_metric_threshold option) () =
  ({ headroom = headroom_; threshold = threshold_ } : customizable_metric_parameters)

let make_utilization_preference
    ?metric_parameters:(metric_parameters_ : customizable_metric_parameters option)
    ?metric_name:(metric_name_ : customizable_metric_name option) () =
  ({ metric_parameters = metric_parameters_; metric_name = metric_name_ } : utilization_preference)

let make_utilization_metric ?value:(value_ : metric_value option)
    ?statistic:(statistic_ : metric_statistic option) ?name:(name_ : metric_name option) () =
  ({ value = value_; statistic = statistic_; name = name_ } : utilization_metric)

let make_update_enrollment_status_response ?status_reason:(status_reason_ : status_reason option)
    ?status:(status_ : status option) () =
  ({ status_reason = status_reason_; status = status_ } : update_enrollment_status_response)

let make_update_enrollment_status_request
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ~status:(status_ : status) () =
  ({ include_member_accounts = include_member_accounts_; status = status_ }
    : update_enrollment_status_request)

let make_reason_code_summary ?value:(value_ : summary_value option)
    ?name:(name_ : finding_reason_code option) () =
  ({ value = value_; name = name_ } : reason_code_summary)

let make_summary ?reason_code_summaries:(reason_code_summaries_ : reason_code_summaries option)
    ?value:(value_ : summary_value option) ?name:(name_ : finding option) () =
  ({ reason_code_summaries = reason_code_summaries_; value = value_; name = name_ } : summary)

let make_memory_size_configuration
    ?memory_reservation:(memory_reservation_ : nullable_memory_reservation option)
    ?memory:(memory_ : nullable_memory option) () =
  ({ memory_reservation = memory_reservation_; memory = memory_ } : memory_size_configuration)

let make_container_configuration ?cpu:(cpu_ : nullable_cpu option)
    ?memory_size_configuration:(memory_size_configuration_ : memory_size_configuration option)
    ?container_name:(container_name_ : container_name option) () =
  ({
     cpu = cpu_;
     memory_size_configuration = memory_size_configuration_;
     container_name = container_name_;
   }
    : container_configuration)

let make_service_configuration
    ?task_definition_arn:(task_definition_arn_ : task_definition_arn option)
    ?auto_scaling_configuration:(auto_scaling_configuration_ : auto_scaling_configuration option)
    ?container_configurations:(container_configurations_ : container_configurations option)
    ?cpu:(cpu_ : nullable_cpu option) ?memory:(memory_ : nullable_memory option) () =
  ({
     task_definition_arn = task_definition_arn_;
     auto_scaling_configuration = auto_scaling_configuration_;
     container_configurations = container_configurations_;
     cpu = cpu_;
     memory = memory_;
   }
    : service_configuration)

let make_scope ?value:(value_ : scope_value option) ?name:(name_ : scope_name option) () =
  ({ value = value_; name = name_ } : scope)

let make_s3_destination_config ?key_prefix:(key_prefix_ : destination_key_prefix option)
    ?bucket:(bucket_ : destination_bucket option) () =
  ({ key_prefix = key_prefix_; bucket = bucket_ } : s3_destination_config)

let make_s3_destination ?metadata_key:(metadata_key_ : metadata_key option)
    ?key:(key_ : destination_key option) ?bucket:(bucket_ : destination_bucket option) () =
  ({ metadata_key = metadata_key_; key = key_; bucket = bucket_ } : s3_destination)

let make_projected_metric ?values:(values_ : metric_values option)
    ?timestamps:(timestamps_ : timestamps option) ?name:(name_ : metric_name option) () =
  ({ values = values_; timestamps = timestamps_; name = name_ } : projected_metric)

let make_recommended_option_projected_metric
    ?projected_metrics:(projected_metrics_ : projected_metrics option) ?rank:(rank_ : rank option)
    ?recommended_instance_type:(recommended_instance_type_ : recommended_instance_type option) () =
  ({
     projected_metrics = projected_metrics_;
     rank = rank_;
     recommended_instance_type = recommended_instance_type_;
   }
    : recommended_option_projected_metric)

let make_idle_summary ?value:(value_ : summary_value option) ?name:(name_ : idle_finding option) ()
    =
  ({ value = value_; name = name_ } : idle_summary)

let make_current_performance_risk_ratings ?very_low:(very_low_ : very_low option)
    ?low:(low_ : low option) ?medium:(medium_ : medium option) ?high:(high_ : high option) () =
  ({ very_low = very_low_; low = low_; medium = medium_; high = high_ }
    : current_performance_risk_ratings)

let make_inferred_workload_saving
    ?estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings option)
    ?inferred_workload_types:(inferred_workload_types_ : inferred_workload_types option) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     inferred_workload_types = inferred_workload_types_;
   }
    : inferred_workload_saving)

let make_recommendation_summary
    ?inferred_workload_savings:(inferred_workload_savings_ : inferred_workload_savings option)
    ?current_performance_risk_ratings:
      (current_performance_risk_ratings_ : current_performance_risk_ratings option)
    ?aggregated_savings_opportunity:(aggregated_savings_opportunity_ : savings_opportunity option)
    ?idle_savings_opportunity:(idle_savings_opportunity_ : savings_opportunity option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?account_id:(account_id_ : account_id option)
    ?recommendation_resource_type:
      (recommendation_resource_type_ : recommendation_source_type option)
    ?idle_summaries:(idle_summaries_ : idle_summaries option)
    ?summaries:(summaries_ : summaries option) () =
  ({
     inferred_workload_savings = inferred_workload_savings_;
     current_performance_risk_ratings = current_performance_risk_ratings_;
     aggregated_savings_opportunity = aggregated_savings_opportunity_;
     idle_savings_opportunity = idle_savings_opportunity_;
     savings_opportunity = savings_opportunity_;
     account_id = account_id_;
     recommendation_resource_type = recommendation_resource_type_;
     idle_summaries = idle_summaries_;
     summaries = summaries_;
   }
    : recommendation_summary)

let make_recommendation_source
    ?recommendation_source_type:(recommendation_source_type_ : recommendation_source_type option)
    ?recommendation_source_arn:(recommendation_source_arn_ : recommendation_source_arn option) () =
  ({
     recommendation_source_type = recommendation_source_type_;
     recommendation_source_arn = recommendation_source_arn_;
   }
    : recommendation_source)

let make_external_metrics_preference ?source:(source_ : external_metrics_source option) () =
  ({ source = source_ } : external_metrics_preference)

let make_effective_preferred_resource
    ?exclude_list:(exclude_list_ : preferred_resource_values option)
    ?effective_include_list:(effective_include_list_ : preferred_resource_values option)
    ?include_list:(include_list_ : preferred_resource_values option)
    ?name:(name_ : preferred_resource_name option) () =
  ({
     exclude_list = exclude_list_;
     effective_include_list = effective_include_list_;
     include_list = include_list_;
     name = name_;
   }
    : effective_preferred_resource)

let make_recommendation_preferences_detail
    ?savings_estimation_mode:(savings_estimation_mode_ : savings_estimation_mode option)
    ?preferred_resources:(preferred_resources_ : effective_preferred_resources option)
    ?utilization_preferences:(utilization_preferences_ : utilization_preferences option)
    ?look_back_period:(look_back_period_ : look_back_period_preference option)
    ?external_metrics_preference:(external_metrics_preference_ : external_metrics_preference option)
    ?inferred_workload_types:(inferred_workload_types_ : inferred_workload_types_preference option)
    ?enhanced_infrastructure_metrics:
      (enhanced_infrastructure_metrics_ : enhanced_infrastructure_metrics option)
    ?resource_type:(resource_type_ : resource_type option) ?scope:(scope_ : scope option) () =
  ({
     savings_estimation_mode = savings_estimation_mode_;
     preferred_resources = preferred_resources_;
     utilization_preferences = utilization_preferences_;
     look_back_period = look_back_period_;
     external_metrics_preference = external_metrics_preference_;
     inferred_workload_types = inferred_workload_types_;
     enhanced_infrastructure_metrics = enhanced_infrastructure_metrics_;
     resource_type = resource_type_;
     scope = scope_;
   }
    : recommendation_preferences_detail)

let make_recommendation_preferences
    ?cpu_vendor_architectures:(cpu_vendor_architectures_ : cpu_vendor_architectures option) () =
  ({ cpu_vendor_architectures = cpu_vendor_architectures_ } : recommendation_preferences)

let make_gpu ?gpu_memory_size_in_mi_b:(gpu_memory_size_in_mi_b_ : gpu_memory_size_in_mi_b option)
    ?gpu_count:(gpu_count_ : gpu_count option) () =
  ({ gpu_memory_size_in_mi_b = gpu_memory_size_in_mi_b_; gpu_count = gpu_count_ } : gpu)

let make_gpu_info ?gpus:(gpus_ : gpus option) () = ({ gpus = gpus_ } : gpu_info)

let make_instance_estimated_monthly_savings ?value:(value_ : value option)
    ?currency:(currency_ : currency option) () =
  ({ value = value_; currency = currency_ } : instance_estimated_monthly_savings)

let make_instance_savings_opportunity_after_discounts
    ?estimated_monthly_savings:
      (estimated_monthly_savings_ : instance_estimated_monthly_savings option)
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     savings_opportunity_percentage = savings_opportunity_percentage_;
   }
    : instance_savings_opportunity_after_discounts)

let make_instance_recommendation_option
    ?migration_effort:(migration_effort_ : migration_effort option)
    ?savings_opportunity_after_discounts:
      (savings_opportunity_after_discounts_ : instance_savings_opportunity_after_discounts option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?rank:(rank_ : rank option) ?performance_risk:(performance_risk_ : performance_risk option)
    ?platform_differences:(platform_differences_ : platform_differences option)
    ?projected_utilization_metrics:
      (projected_utilization_metrics_ : projected_utilization_metrics option)
    ?instance_gpu_info:(instance_gpu_info_ : gpu_info option)
    ?instance_type:(instance_type_ : instance_type option) () =
  ({
     migration_effort = migration_effort_;
     savings_opportunity_after_discounts = savings_opportunity_after_discounts_;
     savings_opportunity = savings_opportunity_;
     rank = rank_;
     performance_risk = performance_risk_;
     platform_differences = platform_differences_;
     projected_utilization_metrics = projected_utilization_metrics_;
     instance_gpu_info = instance_gpu_info_;
     instance_type = instance_type_;
   }
    : instance_recommendation_option)

let make_export_destination ?s3:(s3_ : s3_destination option) () =
  ({ s3 = s3_ } : export_destination)

let make_recommendation_export_job ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_updated_timestamp:(last_updated_timestamp_ : last_updated_timestamp option)
    ?creation_timestamp:(creation_timestamp_ : creation_timestamp option)
    ?status:(status_ : job_status option) ?resource_type:(resource_type_ : resource_type option)
    ?destination:(destination_ : export_destination option) ?job_id:(job_id_ : job_id option) () =
  ({
     failure_reason = failure_reason_;
     last_updated_timestamp = last_updated_timestamp_;
     creation_timestamp = creation_timestamp_;
     status = status_;
     resource_type = resource_type_;
     destination = destination_;
     job_id = job_id_;
   }
    : recommendation_export_job)

let make_rds_storage_estimated_monthly_savings ?value:(value_ : value option)
    ?currency:(currency_ : currency option) () =
  ({ value = value_; currency = currency_ } : rds_storage_estimated_monthly_savings)

let make_rds_storage_savings_opportunity_after_discounts
    ?estimated_monthly_savings:
      (estimated_monthly_savings_ : rds_storage_estimated_monthly_savings option)
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     savings_opportunity_percentage = savings_opportunity_percentage_;
   }
    : rds_storage_savings_opportunity_after_discounts)

let make_rds_savings_estimation_mode ?source:(source_ : rds_savings_estimation_mode_source option)
    () =
  ({ source = source_ } : rds_savings_estimation_mode)

let make_rds_instance_estimated_monthly_savings ?value:(value_ : value option)
    ?currency:(currency_ : currency option) () =
  ({ value = value_; currency = currency_ } : rds_instance_estimated_monthly_savings)

let make_rds_instance_savings_opportunity_after_discounts
    ?estimated_monthly_savings:
      (estimated_monthly_savings_ : rds_instance_estimated_monthly_savings option)
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     savings_opportunity_percentage = savings_opportunity_percentage_;
   }
    : rds_instance_savings_opportunity_after_discounts)

let make_rds_effective_recommendation_preferences
    ?savings_estimation_mode:(savings_estimation_mode_ : rds_savings_estimation_mode option)
    ?look_back_period:(look_back_period_ : look_back_period_preference option)
    ?enhanced_infrastructure_metrics:
      (enhanced_infrastructure_metrics_ : enhanced_infrastructure_metrics option)
    ?cpu_vendor_architectures:(cpu_vendor_architectures_ : cpu_vendor_architectures option) () =
  ({
     savings_estimation_mode = savings_estimation_mode_;
     look_back_period = look_back_period_;
     enhanced_infrastructure_metrics = enhanced_infrastructure_metrics_;
     cpu_vendor_architectures = cpu_vendor_architectures_;
   }
    : rds_effective_recommendation_preferences)

let make_rds_database_projected_metric ?values:(values_ : metric_values option)
    ?timestamps:(timestamps_ : timestamps option) ?name:(name_ : rdsdb_metric_name option) () =
  ({ values = values_; timestamps = timestamps_; name = name_ } : rds_database_projected_metric)

let make_rds_database_recommended_option_projected_metric
    ?projected_metrics:(projected_metrics_ : rds_database_projected_metrics option)
    ?rank:(rank_ : rank option)
    ?recommended_db_instance_class:
      (recommended_db_instance_class_ : recommended_db_instance_class option) () =
  ({
     projected_metrics = projected_metrics_;
     rank = rank_;
     recommended_db_instance_class = recommended_db_instance_class_;
   }
    : rds_database_recommended_option_projected_metric)

let make_rdsdb_utilization_metric ?value:(value_ : metric_value option)
    ?statistic:(statistic_ : rdsdb_metric_statistic option) ?name:(name_ : rdsdb_metric_name option)
    () =
  ({ value = value_; statistic = statistic_; name = name_ } : rdsdb_utilization_metric)

let make_db_storage_configuration
    ?storage_throughput:(storage_throughput_ : nullable_storage_throughput option)
    ?max_allocated_storage:(max_allocated_storage_ : nullable_max_allocated_storage option)
    ?iops:(iops_ : nullable_iop_s option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?storage_type:(storage_type_ : storage_type option) () =
  ({
     storage_throughput = storage_throughput_;
     max_allocated_storage = max_allocated_storage_;
     iops = iops_;
     allocated_storage = allocated_storage_;
     storage_type = storage_type_;
   }
    : db_storage_configuration)

let make_rdsdb_storage_recommendation_option
    ?estimated_monthly_volume_io_ps_cost_variation:
      (estimated_monthly_volume_io_ps_cost_variation_ :
         rds_estimated_monthly_volume_io_ps_cost_variation option)
    ?savings_opportunity_after_discounts:
      (savings_opportunity_after_discounts_ : rds_storage_savings_opportunity_after_discounts option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?rank:(rank_ : rank option)
    ?storage_configuration:(storage_configuration_ : db_storage_configuration option) () =
  ({
     estimated_monthly_volume_io_ps_cost_variation = estimated_monthly_volume_io_ps_cost_variation_;
     savings_opportunity_after_discounts = savings_opportunity_after_discounts_;
     savings_opportunity = savings_opportunity_;
     rank = rank_;
     storage_configuration = storage_configuration_;
   }
    : rdsdb_storage_recommendation_option)

let make_rdsdb_instance_recommendation_option
    ?savings_opportunity_after_discounts:
      (savings_opportunity_after_discounts_ :
         rds_instance_savings_opportunity_after_discounts option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?rank:(rank_ : rank option) ?performance_risk:(performance_risk_ : performance_risk option)
    ?projected_utilization_metrics:
      (projected_utilization_metrics_ : rdsdb_projected_utilization_metrics option)
    ?db_instance_class:(db_instance_class_ : db_instance_class option) () =
  ({
     savings_opportunity_after_discounts = savings_opportunity_after_discounts_;
     savings_opportunity = savings_opportunity_;
     rank = rank_;
     performance_risk = performance_risk_;
     projected_utilization_metrics = projected_utilization_metrics_;
     db_instance_class = db_instance_class_;
   }
    : rdsdb_instance_recommendation_option)

let make_rdsdb_recommendation ?tags:(tags_ : tags option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : last_refresh_timestamp option)
    ?lookback_period_in_days:(lookback_period_in_days_ : look_back_period_in_days option)
    ?effective_recommendation_preferences:
      (effective_recommendation_preferences_ : rds_effective_recommendation_preferences option)
    ?utilization_metrics:(utilization_metrics_ : rdsdb_utilization_metrics option)
    ?storage_recommendation_options:
      (storage_recommendation_options_ : rdsdb_storage_recommendation_options option)
    ?instance_recommendation_options:
      (instance_recommendation_options_ : rdsdb_instance_recommendation_options option)
    ?storage_finding_reason_codes:
      (storage_finding_reason_codes_ : rds_storage_finding_reason_codes option)
    ?current_storage_estimated_monthly_volume_io_ps_cost_variation:
      (current_storage_estimated_monthly_volume_io_ps_cost_variation_ :
         rds_estimated_monthly_volume_io_ps_cost_variation option)
    ?current_instance_performance_risk:
      (current_instance_performance_risk_ : rds_current_instance_performance_risk option)
    ?instance_finding_reason_codes:
      (instance_finding_reason_codes_ : rds_instance_finding_reason_codes option)
    ?storage_finding:(storage_finding_ : rds_storage_finding option)
    ?instance_finding:(instance_finding_ : rds_instance_finding option) ?idle:(idle_ : idle option)
    ?db_cluster_identifier:(db_cluster_identifier_ : db_cluster_identifier option)
    ?current_storage_configuration:
      (current_storage_configuration_ : db_storage_configuration option)
    ?current_db_instance_class:(current_db_instance_class_ : current_db_instance_class option)
    ?promotion_tier:(promotion_tier_ : promotion_tier option)
    ?engine_version:(engine_version_ : engine_version option) ?engine:(engine_ : engine option)
    ?account_id:(account_id_ : account_id option)
    ?resource_arn:(resource_arn_ : resource_arn option) () =
  ({
     tags = tags_;
     last_refresh_timestamp = last_refresh_timestamp_;
     lookback_period_in_days = lookback_period_in_days_;
     effective_recommendation_preferences = effective_recommendation_preferences_;
     utilization_metrics = utilization_metrics_;
     storage_recommendation_options = storage_recommendation_options_;
     instance_recommendation_options = instance_recommendation_options_;
     storage_finding_reason_codes = storage_finding_reason_codes_;
     current_storage_estimated_monthly_volume_io_ps_cost_variation =
       current_storage_estimated_monthly_volume_io_ps_cost_variation_;
     current_instance_performance_risk = current_instance_performance_risk_;
     instance_finding_reason_codes = instance_finding_reason_codes_;
     storage_finding = storage_finding_;
     instance_finding = instance_finding_;
     idle = idle_;
     db_cluster_identifier = db_cluster_identifier_;
     current_storage_configuration = current_storage_configuration_;
     current_db_instance_class = current_db_instance_class_;
     promotion_tier = promotion_tier_;
     engine_version = engine_version_;
     engine = engine_;
     account_id = account_id_;
     resource_arn = resource_arn_;
   }
    : rdsdb_recommendation)

let make_rdsdb_recommendation_filter ?values:(values_ : filter_values option)
    ?name:(name_ : rdsdb_recommendation_filter_name option) () =
  ({ values = values_; name = name_ } : rdsdb_recommendation_filter)

let make_put_recommendation_preferences_response () = (() : unit)

let make_preferred_resource ?exclude_list:(exclude_list_ : preferred_resource_values option)
    ?include_list:(include_list_ : preferred_resource_values option)
    ?name:(name_ : preferred_resource_name option) () =
  ({ exclude_list = exclude_list_; include_list = include_list_; name = name_ }
    : preferred_resource)

let make_put_recommendation_preferences_request
    ?savings_estimation_mode:(savings_estimation_mode_ : savings_estimation_mode option)
    ?preferred_resources:(preferred_resources_ : preferred_resources option)
    ?utilization_preferences:(utilization_preferences_ : utilization_preferences option)
    ?look_back_period:(look_back_period_ : look_back_period_preference option)
    ?external_metrics_preference:(external_metrics_preference_ : external_metrics_preference option)
    ?inferred_workload_types:(inferred_workload_types_ : inferred_workload_types_preference option)
    ?enhanced_infrastructure_metrics:
      (enhanced_infrastructure_metrics_ : enhanced_infrastructure_metrics option)
    ?scope:(scope_ : scope option) ~resource_type:(resource_type_ : resource_type) () =
  ({
     savings_estimation_mode = savings_estimation_mode_;
     preferred_resources = preferred_resources_;
     utilization_preferences = utilization_preferences_;
     look_back_period = look_back_period_;
     external_metrics_preference = external_metrics_preference_;
     inferred_workload_types = inferred_workload_types_;
     enhanced_infrastructure_metrics = enhanced_infrastructure_metrics_;
     scope = scope_;
     resource_type = resource_type_;
   }
    : put_recommendation_preferences_request)

let make_order_by ?order:(order_ : order option) ?dimension:(dimension_ : dimension option) () =
  ({ order = order_; dimension = dimension_ } : order_by)

let make_metric_source ?provider_arn:(provider_arn_ : metric_provider_arn option)
    ?provider:(provider_ : metric_source_provider option) () =
  ({ provider_arn = provider_arn_; provider = provider_ } : metric_source)

let make_license_configuration ?metrics_source:(metrics_source_ : metrics_source option)
    ?license_version:(license_version_ : license_version option)
    ?license_model:(license_model_ : license_model option)
    ?license_name:(license_name_ : license_name option)
    ?license_edition:(license_edition_ : license_edition option)
    ?operating_system:(operating_system_ : operating_system option)
    ?instance_type:(instance_type_ : instance_type option)
    ?number_of_cores:(number_of_cores_ : number_of_cores option) () =
  ({
     metrics_source = metrics_source_;
     license_version = license_version_;
     license_model = license_model_;
     license_name = license_name_;
     license_edition = license_edition_;
     operating_system = operating_system_;
     instance_type = instance_type_;
     number_of_cores = number_of_cores_;
   }
    : license_configuration)

let make_license_recommendation_option
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?license_model:(license_model_ : license_model option)
    ?license_edition:(license_edition_ : license_edition option)
    ?operating_system:(operating_system_ : operating_system option) ?rank:(rank_ : rank option) () =
  ({
     savings_opportunity = savings_opportunity_;
     license_model = license_model_;
     license_edition = license_edition_;
     operating_system = operating_system_;
     rank = rank_;
   }
    : license_recommendation_option)

let make_license_recommendation ?tags:(tags_ : tags option)
    ?license_recommendation_options:
      (license_recommendation_options_ : license_recommendation_options option)
    ?finding_reason_codes:(finding_reason_codes_ : license_finding_reason_codes option)
    ?finding:(finding_ : license_finding option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : last_refresh_timestamp option)
    ?lookback_period_in_days:(lookback_period_in_days_ : look_back_period_in_days option)
    ?current_license_configuration:(current_license_configuration_ : license_configuration option)
    ?account_id:(account_id_ : account_id option)
    ?resource_arn:(resource_arn_ : resource_arn option) () =
  ({
     tags = tags_;
     license_recommendation_options = license_recommendation_options_;
     finding_reason_codes = finding_reason_codes_;
     finding = finding_;
     last_refresh_timestamp = last_refresh_timestamp_;
     lookback_period_in_days = lookback_period_in_days_;
     current_license_configuration = current_license_configuration_;
     account_id = account_id_;
     resource_arn = resource_arn_;
   }
    : license_recommendation)

let make_license_recommendation_filter ?values:(values_ : filter_values option)
    ?name:(name_ : license_recommendation_filter_name option) () =
  ({ values = values_; name = name_ } : license_recommendation_filter)

let make_lambda_estimated_monthly_savings ?value:(value_ : value option)
    ?currency:(currency_ : currency option) () =
  ({ value = value_; currency = currency_ } : lambda_estimated_monthly_savings)

let make_lambda_savings_opportunity_after_discounts
    ?estimated_monthly_savings:
      (estimated_monthly_savings_ : lambda_estimated_monthly_savings option)
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     savings_opportunity_percentage = savings_opportunity_percentage_;
   }
    : lambda_savings_opportunity_after_discounts)

let make_lambda_savings_estimation_mode
    ?source:(source_ : lambda_savings_estimation_mode_source option) () =
  ({ source = source_ } : lambda_savings_estimation_mode)

let make_lambda_function_utilization_metric ?value:(value_ : metric_value option)
    ?statistic:(statistic_ : lambda_function_metric_statistic option)
    ?name:(name_ : lambda_function_metric_name option) () =
  ({ value = value_; statistic = statistic_; name = name_ } : lambda_function_utilization_metric)

let make_lambda_function_memory_projected_metric ?value:(value_ : metric_value option)
    ?statistic:(statistic_ : lambda_function_memory_metric_statistic option)
    ?name:(name_ : lambda_function_memory_metric_name option) () =
  ({ value = value_; statistic = statistic_; name = name_ }
    : lambda_function_memory_projected_metric)

let make_lambda_function_memory_recommendation_option
    ?savings_opportunity_after_discounts:
      (savings_opportunity_after_discounts_ : lambda_savings_opportunity_after_discounts option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?projected_utilization_metrics:
      (projected_utilization_metrics_ : lambda_function_memory_projected_metrics option)
    ?memory_size:(memory_size_ : memory_size option) ?rank:(rank_ : rank option) () =
  ({
     savings_opportunity_after_discounts = savings_opportunity_after_discounts_;
     savings_opportunity = savings_opportunity_;
     projected_utilization_metrics = projected_utilization_metrics_;
     memory_size = memory_size_;
     rank = rank_;
   }
    : lambda_function_memory_recommendation_option)

let make_lambda_effective_recommendation_preferences
    ?savings_estimation_mode:(savings_estimation_mode_ : lambda_savings_estimation_mode option) () =
  ({ savings_estimation_mode = savings_estimation_mode_ }
    : lambda_effective_recommendation_preferences)

let make_lambda_function_recommendation ?tags:(tags_ : tags option)
    ?effective_recommendation_preferences:
      (effective_recommendation_preferences_ : lambda_effective_recommendation_preferences option)
    ?current_performance_risk:(current_performance_risk_ : current_performance_risk option)
    ?memory_size_recommendation_options:
      (memory_size_recommendation_options_ : lambda_function_memory_recommendation_options option)
    ?finding_reason_codes:
      (finding_reason_codes_ : lambda_function_recommendation_finding_reason_codes option)
    ?finding:(finding_ : lambda_function_recommendation_finding option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : last_refresh_timestamp option)
    ?lookback_period_in_days:(lookback_period_in_days_ : look_back_period_in_days option)
    ?utilization_metrics:(utilization_metrics_ : lambda_function_utilization_metrics option)
    ?number_of_invocations:(number_of_invocations_ : number_of_invocations option)
    ?current_memory_size:(current_memory_size_ : memory_size option)
    ?account_id:(account_id_ : account_id option)
    ?function_version:(function_version_ : function_version option)
    ?function_arn:(function_arn_ : function_arn option) () =
  ({
     tags = tags_;
     effective_recommendation_preferences = effective_recommendation_preferences_;
     current_performance_risk = current_performance_risk_;
     memory_size_recommendation_options = memory_size_recommendation_options_;
     finding_reason_codes = finding_reason_codes_;
     finding = finding_;
     last_refresh_timestamp = last_refresh_timestamp_;
     lookback_period_in_days = lookback_period_in_days_;
     utilization_metrics = utilization_metrics_;
     number_of_invocations = number_of_invocations_;
     current_memory_size = current_memory_size_;
     account_id = account_id_;
     function_version = function_version_;
     function_arn = function_arn_;
   }
    : lambda_function_recommendation)

let make_lambda_function_recommendation_filter ?values:(values_ : filter_values option)
    ?name:(name_ : lambda_function_recommendation_filter_name option) () =
  ({ values = values_; name = name_ } : lambda_function_recommendation_filter)

let make_job_filter ?values:(values_ : filter_values option) ?name:(name_ : job_filter_name option)
    () =
  ({ values = values_; name = name_ } : job_filter)

let make_instance_savings_estimation_mode
    ?source:(source_ : instance_savings_estimation_mode_source option) () =
  ({ source = source_ } : instance_savings_estimation_mode)

let make_effective_recommendation_preferences
    ?savings_estimation_mode:(savings_estimation_mode_ : instance_savings_estimation_mode option)
    ?preferred_resources:(preferred_resources_ : effective_preferred_resources option)
    ?utilization_preferences:(utilization_preferences_ : utilization_preferences option)
    ?look_back_period:(look_back_period_ : look_back_period_preference option)
    ?external_metrics_preference:(external_metrics_preference_ : external_metrics_preference option)
    ?inferred_workload_types:(inferred_workload_types_ : inferred_workload_types_preference option)
    ?enhanced_infrastructure_metrics:
      (enhanced_infrastructure_metrics_ : enhanced_infrastructure_metrics option)
    ?cpu_vendor_architectures:(cpu_vendor_architectures_ : cpu_vendor_architectures option) () =
  ({
     savings_estimation_mode = savings_estimation_mode_;
     preferred_resources = preferred_resources_;
     utilization_preferences = utilization_preferences_;
     look_back_period = look_back_period_;
     external_metrics_preference = external_metrics_preference_;
     inferred_workload_types = inferred_workload_types_;
     enhanced_infrastructure_metrics = enhanced_infrastructure_metrics_;
     cpu_vendor_architectures = cpu_vendor_architectures_;
   }
    : effective_recommendation_preferences)

let make_external_metric_status
    ?status_reason:(status_reason_ : external_metric_status_reason option)
    ?status_code:(status_code_ : external_metric_status_code option) () =
  ({ status_reason = status_reason_; status_code = status_code_ } : external_metric_status)

let make_instance_recommendation ?idle:(idle_ : instance_idle option)
    ?current_instance_gpu_info:(current_instance_gpu_info_ : gpu_info option)
    ?external_metric_status:(external_metric_status_ : external_metric_status option)
    ?tags:(tags_ : tags option) ?instance_state:(instance_state_ : instance_state option)
    ?inferred_workload_types:(inferred_workload_types_ : inferred_workload_types option)
    ?effective_recommendation_preferences:
      (effective_recommendation_preferences_ : effective_recommendation_preferences option)
    ?current_performance_risk:(current_performance_risk_ : current_performance_risk option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : last_refresh_timestamp option)
    ?recommendation_sources:(recommendation_sources_ : recommendation_sources option)
    ?recommendation_options:(recommendation_options_ : recommendation_options option)
    ?look_back_period_in_days:(look_back_period_in_days_ : look_back_period_in_days option)
    ?utilization_metrics:(utilization_metrics_ : utilization_metrics option)
    ?finding_reason_codes:
      (finding_reason_codes_ : instance_recommendation_finding_reason_codes option)
    ?finding:(finding_ : finding option)
    ?current_instance_type:(current_instance_type_ : current_instance_type option)
    ?instance_name:(instance_name_ : instance_name option)
    ?account_id:(account_id_ : account_id option)
    ?instance_arn:(instance_arn_ : instance_arn option) () =
  ({
     idle = idle_;
     current_instance_gpu_info = current_instance_gpu_info_;
     external_metric_status = external_metric_status_;
     tags = tags_;
     instance_state = instance_state_;
     inferred_workload_types = inferred_workload_types_;
     effective_recommendation_preferences = effective_recommendation_preferences_;
     current_performance_risk = current_performance_risk_;
     last_refresh_timestamp = last_refresh_timestamp_;
     recommendation_sources = recommendation_sources_;
     recommendation_options = recommendation_options_;
     look_back_period_in_days = look_back_period_in_days_;
     utilization_metrics = utilization_metrics_;
     finding_reason_codes = finding_reason_codes_;
     finding = finding_;
     current_instance_type = current_instance_type_;
     instance_name = instance_name_;
     account_id = account_id_;
     instance_arn = instance_arn_;
   }
    : instance_recommendation)

let make_idle_dimension ?values:(values_ : idle_dimension_values option)
    ?key:(key_ : idle_dimension_key option) () =
  ({ values = values_; key = key_ } : idle_dimension)

let make_idle_utilization_metric ?dimensions:(dimensions_ : idle_dimensions option)
    ?value:(value_ : metric_value option) ?statistic:(statistic_ : metric_statistic option)
    ?name:(name_ : idle_metric_name option) () =
  ({ dimensions = dimensions_; value = value_; statistic = statistic_; name = name_ }
    : idle_utilization_metric)

let make_idle_estimated_monthly_savings ?value:(value_ : value option)
    ?currency:(currency_ : currency option) () =
  ({ value = value_; currency = currency_ } : idle_estimated_monthly_savings)

let make_idle_savings_opportunity_after_discounts
    ?estimated_monthly_savings:(estimated_monthly_savings_ : idle_estimated_monthly_savings option)
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     savings_opportunity_percentage = savings_opportunity_percentage_;
   }
    : idle_savings_opportunity_after_discounts)

let make_idle_savings_opportunity
    ?estimated_monthly_savings:(estimated_monthly_savings_ : idle_estimated_monthly_savings option)
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     savings_opportunity_percentage = savings_opportunity_percentage_;
   }
    : idle_savings_opportunity)

let make_idle_recommendation ?tags:(tags_ : tags option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : last_refresh_timestamp option)
    ?look_back_period_in_days:(look_back_period_in_days_ : look_back_period_in_days option)
    ?utilization_metrics:(utilization_metrics_ : idle_utilization_metrics option)
    ?savings_opportunity_after_discounts:
      (savings_opportunity_after_discounts_ : idle_savings_opportunity_after_discounts option)
    ?savings_opportunity:(savings_opportunity_ : idle_savings_opportunity option)
    ?finding_description:(finding_description_ : idle_finding_description option)
    ?finding:(finding_ : idle_finding option) ?account_id:(account_id_ : account_id option)
    ?resource_type:(resource_type_ : idle_recommendation_resource_type option)
    ?resource_id:(resource_id_ : resource_id option)
    ?resource_arn:(resource_arn_ : resource_arn option) () =
  ({
     tags = tags_;
     last_refresh_timestamp = last_refresh_timestamp_;
     look_back_period_in_days = look_back_period_in_days_;
     utilization_metrics = utilization_metrics_;
     savings_opportunity_after_discounts = savings_opportunity_after_discounts_;
     savings_opportunity = savings_opportunity_;
     finding_description = finding_description_;
     finding = finding_;
     account_id = account_id_;
     resource_type = resource_type_;
     resource_id = resource_id_;
     resource_arn = resource_arn_;
   }
    : idle_recommendation)

let make_idle_recommendation_filter ?values:(values_ : filter_values option)
    ?name:(name_ : idle_recommendation_filter_name option) () =
  ({ values = values_; name = name_ } : idle_recommendation_filter)

let make_idle_recommendation_error
    ?resource_type:(resource_type_ : idle_recommendation_resource_type option)
    ?message:(message_ : message option) ?code:(code_ : code option)
    ?identifier:(identifier_ : identifier option) () =
  ({ resource_type = resource_type_; message = message_; code = code_; identifier = identifier_ }
    : idle_recommendation_error)

let make_get_recommendation_summaries_response
    ?recommendation_summaries:(recommendation_summaries_ : recommendation_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ recommendation_summaries = recommendation_summaries_; next_token = next_token_ }
    : get_recommendation_summaries_response)

let make_get_recommendation_summaries_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?account_ids:(account_ids_ : account_ids option)
    () =
  ({ max_results = max_results_; next_token = next_token_; account_ids = account_ids_ }
    : get_recommendation_summaries_request)

let make_get_recommendation_preferences_response
    ?recommendation_preferences_details:
      (recommendation_preferences_details_ : recommendation_preferences_details option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     recommendation_preferences_details = recommendation_preferences_details_;
     next_token = next_token_;
   }
    : get_recommendation_preferences_response)

let make_get_recommendation_preferences_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?scope:(scope_ : scope option)
    ~resource_type:(resource_type_ : resource_type) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     scope = scope_;
     resource_type = resource_type_;
   }
    : get_recommendation_preferences_request)

let make_get_recommendation_error ?message:(message_ : message option) ?code:(code_ : code option)
    ?identifier:(identifier_ : identifier option) () =
  ({ message = message_; code = code_; identifier = identifier_ } : get_recommendation_error)

let make_get_rds_database_recommendations_response
    ?errors:(errors_ : get_recommendation_errors option)
    ?rds_db_recommendations:(rds_db_recommendations_ : rdsdb_recommendations option)
    ?next_token:(next_token_ : next_token option) () =
  ({ errors = errors_; rds_db_recommendations = rds_db_recommendations_; next_token = next_token_ }
    : get_rds_database_recommendations_response)

let make_get_rds_database_recommendations_request
    ?recommendation_preferences:(recommendation_preferences_ : recommendation_preferences option)
    ?account_ids:(account_ids_ : account_ids option)
    ?filters:(filters_ : rdsdb_recommendation_filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?resource_arns:(resource_arns_ : resource_arns option) () =
  ({
     recommendation_preferences = recommendation_preferences_;
     account_ids = account_ids_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     resource_arns = resource_arns_;
   }
    : get_rds_database_recommendations_request)

let make_get_rds_database_recommendation_projected_metrics_response
    ?recommended_option_projected_metrics:
      (recommended_option_projected_metrics_ :
         rds_database_recommended_option_projected_metrics option) () =
  ({ recommended_option_projected_metrics = recommended_option_projected_metrics_ }
    : get_rds_database_recommendation_projected_metrics_response)

let make_get_rds_database_recommendation_projected_metrics_request
    ?recommendation_preferences:(recommendation_preferences_ : recommendation_preferences option)
    ~end_time:(end_time_ : timestamp) ~start_time:(start_time_ : timestamp)
    ~period:(period_ : period) ~stat:(stat_ : metric_statistic)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({
     recommendation_preferences = recommendation_preferences_;
     end_time = end_time_;
     start_time = start_time_;
     period = period_;
     stat = stat_;
     resource_arn = resource_arn_;
   }
    : get_rds_database_recommendation_projected_metrics_request)

let make_get_license_recommendations_response ?errors:(errors_ : get_recommendation_errors option)
    ?license_recommendations:(license_recommendations_ : license_recommendations option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     errors = errors_;
     license_recommendations = license_recommendations_;
     next_token = next_token_;
   }
    : get_license_recommendations_response)

let make_get_license_recommendations_request ?account_ids:(account_ids_ : account_ids option)
    ?filters:(filters_ : license_recommendation_filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?resource_arns:(resource_arns_ : resource_arns option) () =
  ({
     account_ids = account_ids_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     resource_arns = resource_arns_;
   }
    : get_license_recommendations_request)

let make_get_lambda_function_recommendations_response
    ?lambda_function_recommendations:
      (lambda_function_recommendations_ : lambda_function_recommendations option)
    ?next_token:(next_token_ : next_token option) () =
  ({ lambda_function_recommendations = lambda_function_recommendations_; next_token = next_token_ }
    : get_lambda_function_recommendations_response)

let make_get_lambda_function_recommendations_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : lambda_function_recommendation_filters option)
    ?account_ids:(account_ids_ : account_ids option)
    ?function_arns:(function_arns_ : function_arns option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     account_ids = account_ids_;
     function_arns = function_arns_;
   }
    : get_lambda_function_recommendations_request)

let make_get_idle_recommendations_response ?errors:(errors_ : idle_recommendation_errors option)
    ?idle_recommendations:(idle_recommendations_ : idle_recommendations option)
    ?next_token:(next_token_ : next_token option) () =
  ({ errors = errors_; idle_recommendations = idle_recommendations_; next_token = next_token_ }
    : get_idle_recommendations_response)

let make_get_idle_recommendations_request ?order_by:(order_by_ : order_by option)
    ?account_ids:(account_ids_ : account_ids option)
    ?filters:(filters_ : idle_recommendation_filters option)
    ?max_results:(max_results_ : idle_max_results option)
    ?next_token:(next_token_ : next_token option)
    ?resource_arns:(resource_arns_ : resource_arns option) () =
  ({
     order_by = order_by_;
     account_ids = account_ids_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     resource_arns = resource_arns_;
   }
    : get_idle_recommendations_request)

let make_account_enrollment_status
    ?last_updated_timestamp:(last_updated_timestamp_ : last_updated_timestamp option)
    ?status_reason:(status_reason_ : status_reason option) ?status:(status_ : status option)
    ?account_id:(account_id_ : account_id option) () =
  ({
     last_updated_timestamp = last_updated_timestamp_;
     status_reason = status_reason_;
     status = status_;
     account_id = account_id_;
   }
    : account_enrollment_status)

let make_get_enrollment_statuses_for_organization_response
    ?next_token:(next_token_ : next_token option)
    ?account_enrollment_statuses:(account_enrollment_statuses_ : account_enrollment_statuses option)
    () =
  ({ next_token = next_token_; account_enrollment_statuses = account_enrollment_statuses_ }
    : get_enrollment_statuses_for_organization_response)

let make_enrollment_filter ?values:(values_ : filter_values option)
    ?name:(name_ : enrollment_filter_name option) () =
  ({ values = values_; name = name_ } : enrollment_filter)

let make_get_enrollment_statuses_for_organization_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : enrollment_filters option) () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_ }
    : get_enrollment_statuses_for_organization_request)

let make_get_enrollment_status_response
    ?number_of_member_accounts_opted_in:
      (number_of_member_accounts_opted_in_ : number_of_member_accounts_opted_in option)
    ?last_updated_timestamp:(last_updated_timestamp_ : last_updated_timestamp option)
    ?member_accounts_enrolled:(member_accounts_enrolled_ : member_accounts_enrolled option)
    ?status_reason:(status_reason_ : status_reason option) ?status:(status_ : status option) () =
  ({
     number_of_member_accounts_opted_in = number_of_member_accounts_opted_in_;
     last_updated_timestamp = last_updated_timestamp_;
     member_accounts_enrolled = member_accounts_enrolled_;
     status_reason = status_reason_;
     status = status_;
   }
    : get_enrollment_status_response)

let make_get_enrollment_status_request () = (() : unit)

let make_get_effective_recommendation_preferences_response
    ?preferred_resources:(preferred_resources_ : effective_preferred_resources option)
    ?utilization_preferences:(utilization_preferences_ : utilization_preferences option)
    ?look_back_period:(look_back_period_ : look_back_period_preference option)
    ?external_metrics_preference:(external_metrics_preference_ : external_metrics_preference option)
    ?enhanced_infrastructure_metrics:
      (enhanced_infrastructure_metrics_ : enhanced_infrastructure_metrics option) () =
  ({
     preferred_resources = preferred_resources_;
     utilization_preferences = utilization_preferences_;
     look_back_period = look_back_period_;
     external_metrics_preference = external_metrics_preference_;
     enhanced_infrastructure_metrics = enhanced_infrastructure_metrics_;
   }
    : get_effective_recommendation_preferences_response)

let make_get_effective_recommendation_preferences_request
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_effective_recommendation_preferences_request)

let make_ecs_service_utilization_metric ?value:(value_ : metric_value option)
    ?statistic:(statistic_ : ecs_service_metric_statistic option)
    ?name:(name_ : ecs_service_metric_name option) () =
  ({ value = value_; statistic = statistic_; name = name_ } : ecs_service_utilization_metric)

let make_ecs_estimated_monthly_savings ?value:(value_ : value option)
    ?currency:(currency_ : currency option) () =
  ({ value = value_; currency = currency_ } : ecs_estimated_monthly_savings)

let make_ecs_savings_opportunity_after_discounts
    ?estimated_monthly_savings:(estimated_monthly_savings_ : ecs_estimated_monthly_savings option)
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     savings_opportunity_percentage = savings_opportunity_percentage_;
   }
    : ecs_savings_opportunity_after_discounts)

let make_ecs_service_projected_utilization_metric
    ?upper_bound_value:(upper_bound_value_ : upper_bound_value option)
    ?lower_bound_value:(lower_bound_value_ : lower_bound_value option)
    ?statistic:(statistic_ : ecs_service_metric_statistic option)
    ?name:(name_ : ecs_service_metric_name option) () =
  ({
     upper_bound_value = upper_bound_value_;
     lower_bound_value = lower_bound_value_;
     statistic = statistic_;
     name = name_;
   }
    : ecs_service_projected_utilization_metric)

let make_container_recommendation ?cpu:(cpu_ : nullable_cpu option)
    ?memory_size_configuration:(memory_size_configuration_ : memory_size_configuration option)
    ?container_name:(container_name_ : container_name option) () =
  ({
     cpu = cpu_;
     memory_size_configuration = memory_size_configuration_;
     container_name = container_name_;
   }
    : container_recommendation)

let make_ecs_service_recommendation_option
    ?container_recommendations:(container_recommendations_ : container_recommendations option)
    ?projected_utilization_metrics:
      (projected_utilization_metrics_ : ecs_service_projected_utilization_metrics option)
    ?savings_opportunity_after_discounts:
      (savings_opportunity_after_discounts_ : ecs_savings_opportunity_after_discounts option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?cpu:(cpu_ : nullable_cpu option) ?memory:(memory_ : nullable_memory option) () =
  ({
     container_recommendations = container_recommendations_;
     projected_utilization_metrics = projected_utilization_metrics_;
     savings_opportunity_after_discounts = savings_opportunity_after_discounts_;
     savings_opportunity = savings_opportunity_;
     cpu = cpu_;
     memory = memory_;
   }
    : ecs_service_recommendation_option)

let make_ecs_savings_estimation_mode ?source:(source_ : ecs_savings_estimation_mode_source option)
    () =
  ({ source = source_ } : ecs_savings_estimation_mode)

let make_ecs_effective_recommendation_preferences
    ?look_back_period:(look_back_period_ : look_back_period_preference option)
    ?savings_estimation_mode:(savings_estimation_mode_ : ecs_savings_estimation_mode option) () =
  ({ look_back_period = look_back_period_; savings_estimation_mode = savings_estimation_mode_ }
    : ecs_effective_recommendation_preferences)

let make_ecs_service_recommendation ?tags:(tags_ : tags option)
    ?effective_recommendation_preferences:
      (effective_recommendation_preferences_ : ecs_effective_recommendation_preferences option)
    ?current_performance_risk:(current_performance_risk_ : current_performance_risk option)
    ?service_recommendation_options:
      (service_recommendation_options_ : ecs_service_recommendation_options option)
    ?finding_reason_codes:
      (finding_reason_codes_ : ecs_service_recommendation_finding_reason_codes option)
    ?finding:(finding_ : ecs_service_recommendation_finding option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : last_refresh_timestamp option)
    ?launch_type:(launch_type_ : ecs_service_launch_type option)
    ?lookback_period_in_days:(lookback_period_in_days_ : look_back_period_in_days option)
    ?utilization_metrics:(utilization_metrics_ : ecs_service_utilization_metrics option)
    ?current_service_configuration:(current_service_configuration_ : service_configuration option)
    ?account_id:(account_id_ : account_id option) ?service_arn:(service_arn_ : service_arn option)
    () =
  ({
     tags = tags_;
     effective_recommendation_preferences = effective_recommendation_preferences_;
     current_performance_risk = current_performance_risk_;
     service_recommendation_options = service_recommendation_options_;
     finding_reason_codes = finding_reason_codes_;
     finding = finding_;
     last_refresh_timestamp = last_refresh_timestamp_;
     launch_type = launch_type_;
     lookback_period_in_days = lookback_period_in_days_;
     utilization_metrics = utilization_metrics_;
     current_service_configuration = current_service_configuration_;
     account_id = account_id_;
     service_arn = service_arn_;
   }
    : ecs_service_recommendation)

let make_get_ecs_service_recommendations_response
    ?errors:(errors_ : get_recommendation_errors option)
    ?ecs_service_recommendations:(ecs_service_recommendations_ : ecs_service_recommendations option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     errors = errors_;
     ecs_service_recommendations = ecs_service_recommendations_;
     next_token = next_token_;
   }
    : get_ecs_service_recommendations_response)

let make_ecs_service_recommendation_filter ?values:(values_ : filter_values option)
    ?name:(name_ : ecs_service_recommendation_filter_name option) () =
  ({ values = values_; name = name_ } : ecs_service_recommendation_filter)

let make_get_ecs_service_recommendations_request ?account_ids:(account_ids_ : account_ids option)
    ?filters:(filters_ : ecs_service_recommendation_filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?service_arns:(service_arns_ : service_arns option) () =
  ({
     account_ids = account_ids_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     service_arns = service_arns_;
   }
    : get_ecs_service_recommendations_request)

let make_ecs_service_projected_metric
    ?lower_bound_values:(lower_bound_values_ : metric_values option)
    ?upper_bound_values:(upper_bound_values_ : metric_values option)
    ?timestamps:(timestamps_ : timestamps option) ?name:(name_ : ecs_service_metric_name option) ()
    =
  ({
     lower_bound_values = lower_bound_values_;
     upper_bound_values = upper_bound_values_;
     timestamps = timestamps_;
     name = name_;
   }
    : ecs_service_projected_metric)

let make_ecs_service_recommended_option_projected_metric
    ?projected_metrics:(projected_metrics_ : ecs_service_projected_metrics option)
    ?recommended_memory_size:(recommended_memory_size_ : memory_size option)
    ?recommended_cpu_units:(recommended_cpu_units_ : cpu_size option) () =
  ({
     projected_metrics = projected_metrics_;
     recommended_memory_size = recommended_memory_size_;
     recommended_cpu_units = recommended_cpu_units_;
   }
    : ecs_service_recommended_option_projected_metric)

let make_get_ecs_service_recommendation_projected_metrics_response
    ?recommended_option_projected_metrics:
      (recommended_option_projected_metrics_ :
         ecs_service_recommended_option_projected_metrics option) () =
  ({ recommended_option_projected_metrics = recommended_option_projected_metrics_ }
    : get_ecs_service_recommendation_projected_metrics_response)

let make_get_ecs_service_recommendation_projected_metrics_request ~end_time:(end_time_ : timestamp)
    ~start_time:(start_time_ : timestamp) ~period:(period_ : period)
    ~stat:(stat_ : metric_statistic) ~service_arn:(service_arn_ : service_arn) () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     period = period_;
     stat = stat_;
     service_arn = service_arn_;
   }
    : get_ecs_service_recommendation_projected_metrics_request)

let make_get_ec2_recommendation_projected_metrics_response
    ?recommended_option_projected_metrics:
      (recommended_option_projected_metrics_ : recommended_option_projected_metrics option) () =
  ({ recommended_option_projected_metrics = recommended_option_projected_metrics_ }
    : get_ec2_recommendation_projected_metrics_response)

let make_get_ec2_recommendation_projected_metrics_request
    ?recommendation_preferences:(recommendation_preferences_ : recommendation_preferences option)
    ~end_time:(end_time_ : timestamp) ~start_time:(start_time_ : timestamp)
    ~period:(period_ : period) ~stat:(stat_ : metric_statistic)
    ~instance_arn:(instance_arn_ : instance_arn) () =
  ({
     recommendation_preferences = recommendation_preferences_;
     end_time = end_time_;
     start_time = start_time_;
     period = period_;
     stat = stat_;
     instance_arn = instance_arn_;
   }
    : get_ec2_recommendation_projected_metrics_request)

let make_get_ec2_instance_recommendations_response
    ?errors:(errors_ : get_recommendation_errors option)
    ?instance_recommendations:(instance_recommendations_ : instance_recommendations option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     errors = errors_;
     instance_recommendations = instance_recommendations_;
     next_token = next_token_;
   }
    : get_ec2_instance_recommendations_response)

let make_filter ?values:(values_ : filter_values option) ?name:(name_ : filter_name option) () =
  ({ values = values_; name = name_ } : filter)

let make_get_ec2_instance_recommendations_request
    ?recommendation_preferences:(recommendation_preferences_ : recommendation_preferences option)
    ?account_ids:(account_ids_ : account_ids option) ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?instance_arns:(instance_arns_ : instance_arns option) () =
  ({
     recommendation_preferences = recommendation_preferences_;
     account_ids = account_ids_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     instance_arns = instance_arns_;
   }
    : get_ec2_instance_recommendations_request)

let make_get_ebs_volume_recommendations_response
    ?errors:(errors_ : get_recommendation_errors option)
    ?volume_recommendations:(volume_recommendations_ : volume_recommendations option)
    ?next_token:(next_token_ : next_token option) () =
  ({ errors = errors_; volume_recommendations = volume_recommendations_; next_token = next_token_ }
    : get_ebs_volume_recommendations_response)

let make_ebs_filter ?values:(values_ : filter_values option) ?name:(name_ : ebs_filter_name option)
    () =
  ({ values = values_; name = name_ } : ebs_filter)

let make_get_ebs_volume_recommendations_request ?account_ids:(account_ids_ : account_ids option)
    ?filters:(filters_ : ebs_filters option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?volume_arns:(volume_arns_ : volume_arns option)
    () =
  ({
     account_ids = account_ids_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     volume_arns = volume_arns_;
   }
    : get_ebs_volume_recommendations_request)

let make_auto_scaling_group_configuration
    ?mixed_instance_types:(mixed_instance_types_ : mixed_instance_types option)
    ?type_:(type__ : asg_type option)
    ?estimated_instance_hour_reduction_percentage:
      (estimated_instance_hour_reduction_percentage_ :
         nullable_estimated_instance_hour_reduction_percentage option)
    ?allocation_strategy:(allocation_strategy_ : allocation_strategy option)
    ?instance_type:(instance_type_ : nullable_instance_type option)
    ?max_size:(max_size_ : max_size option) ?min_size:(min_size_ : min_size option)
    ?desired_capacity:(desired_capacity_ : desired_capacity option) () =
  ({
     mixed_instance_types = mixed_instance_types_;
     type_ = type__;
     estimated_instance_hour_reduction_percentage = estimated_instance_hour_reduction_percentage_;
     allocation_strategy = allocation_strategy_;
     instance_type = instance_type_;
     max_size = max_size_;
     min_size = min_size_;
     desired_capacity = desired_capacity_;
   }
    : auto_scaling_group_configuration)

let make_auto_scaling_group_estimated_monthly_savings ?value:(value_ : value option)
    ?currency:(currency_ : currency option) () =
  ({ value = value_; currency = currency_ } : auto_scaling_group_estimated_monthly_savings)

let make_auto_scaling_group_savings_opportunity_after_discounts
    ?estimated_monthly_savings:
      (estimated_monthly_savings_ : auto_scaling_group_estimated_monthly_savings option)
    ?savings_opportunity_percentage:
      (savings_opportunity_percentage_ : savings_opportunity_percentage option) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     savings_opportunity_percentage = savings_opportunity_percentage_;
   }
    : auto_scaling_group_savings_opportunity_after_discounts)

let make_auto_scaling_group_recommendation_option
    ?migration_effort:(migration_effort_ : migration_effort option)
    ?savings_opportunity_after_discounts:
      (savings_opportunity_after_discounts_ :
         auto_scaling_group_savings_opportunity_after_discounts option)
    ?savings_opportunity:(savings_opportunity_ : savings_opportunity option)
    ?rank:(rank_ : rank option) ?performance_risk:(performance_risk_ : performance_risk option)
    ?projected_utilization_metrics:
      (projected_utilization_metrics_ : projected_utilization_metrics option)
    ?instance_gpu_info:(instance_gpu_info_ : gpu_info option)
    ?configuration:(configuration_ : auto_scaling_group_configuration option) () =
  ({
     migration_effort = migration_effort_;
     savings_opportunity_after_discounts = savings_opportunity_after_discounts_;
     savings_opportunity = savings_opportunity_;
     rank = rank_;
     performance_risk = performance_risk_;
     projected_utilization_metrics = projected_utilization_metrics_;
     instance_gpu_info = instance_gpu_info_;
     configuration = configuration_;
   }
    : auto_scaling_group_recommendation_option)

let make_auto_scaling_group_recommendation
    ?inferred_workload_types:(inferred_workload_types_ : inferred_workload_types option)
    ?effective_recommendation_preferences:
      (effective_recommendation_preferences_ : effective_recommendation_preferences option)
    ?current_performance_risk:(current_performance_risk_ : current_performance_risk option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : last_refresh_timestamp option)
    ?recommendation_options:
      (recommendation_options_ : auto_scaling_group_recommendation_options option)
    ?current_instance_gpu_info:(current_instance_gpu_info_ : gpu_info option)
    ?current_configuration:(current_configuration_ : auto_scaling_group_configuration option)
    ?look_back_period_in_days:(look_back_period_in_days_ : look_back_period_in_days option)
    ?utilization_metrics:(utilization_metrics_ : utilization_metrics option)
    ?finding:(finding_ : finding option)
    ?auto_scaling_group_name:(auto_scaling_group_name_ : auto_scaling_group_name option)
    ?auto_scaling_group_arn:(auto_scaling_group_arn_ : auto_scaling_group_arn option)
    ?account_id:(account_id_ : account_id option) () =
  ({
     inferred_workload_types = inferred_workload_types_;
     effective_recommendation_preferences = effective_recommendation_preferences_;
     current_performance_risk = current_performance_risk_;
     last_refresh_timestamp = last_refresh_timestamp_;
     recommendation_options = recommendation_options_;
     current_instance_gpu_info = current_instance_gpu_info_;
     current_configuration = current_configuration_;
     look_back_period_in_days = look_back_period_in_days_;
     utilization_metrics = utilization_metrics_;
     finding = finding_;
     auto_scaling_group_name = auto_scaling_group_name_;
     auto_scaling_group_arn = auto_scaling_group_arn_;
     account_id = account_id_;
   }
    : auto_scaling_group_recommendation)

let make_get_auto_scaling_group_recommendations_response
    ?errors:(errors_ : get_recommendation_errors option)
    ?auto_scaling_group_recommendations:
      (auto_scaling_group_recommendations_ : auto_scaling_group_recommendations option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     errors = errors_;
     auto_scaling_group_recommendations = auto_scaling_group_recommendations_;
     next_token = next_token_;
   }
    : get_auto_scaling_group_recommendations_response)

let make_get_auto_scaling_group_recommendations_request
    ?recommendation_preferences:(recommendation_preferences_ : recommendation_preferences option)
    ?filters:(filters_ : filters option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?auto_scaling_group_arns:(auto_scaling_group_arns_ : auto_scaling_group_arns option)
    ?account_ids:(account_ids_ : account_ids option) () =
  ({
     recommendation_preferences = recommendation_preferences_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     auto_scaling_group_arns = auto_scaling_group_arns_;
     account_ids = account_ids_;
   }
    : get_auto_scaling_group_recommendations_request)

let make_export_rds_database_recommendations_response
    ?s3_destination:(s3_destination_ : s3_destination option) ?job_id:(job_id_ : job_id option) () =
  ({ s3_destination = s3_destination_; job_id = job_id_ }
    : export_rds_database_recommendations_response)

let make_export_rds_database_recommendations_request
    ?recommendation_preferences:(recommendation_preferences_ : recommendation_preferences option)
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ?file_format:(file_format_ : file_format option)
    ?fields_to_export:(fields_to_export_ : exportable_rdsdb_fields option)
    ?filters:(filters_ : rdsdb_recommendation_filters option)
    ?account_ids:(account_ids_ : account_ids option)
    ~s3_destination_config:(s3_destination_config_ : s3_destination_config) () =
  ({
     recommendation_preferences = recommendation_preferences_;
     include_member_accounts = include_member_accounts_;
     file_format = file_format_;
     s3_destination_config = s3_destination_config_;
     fields_to_export = fields_to_export_;
     filters = filters_;
     account_ids = account_ids_;
   }
    : export_rds_database_recommendations_request)

let make_export_license_recommendations_response
    ?s3_destination:(s3_destination_ : s3_destination option) ?job_id:(job_id_ : job_id option) () =
  ({ s3_destination = s3_destination_; job_id = job_id_ } : export_license_recommendations_response)

let make_export_license_recommendations_request
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ?file_format:(file_format_ : file_format option)
    ?fields_to_export:(fields_to_export_ : exportable_license_fields option)
    ?filters:(filters_ : license_recommendation_filters option)
    ?account_ids:(account_ids_ : account_ids option)
    ~s3_destination_config:(s3_destination_config_ : s3_destination_config) () =
  ({
     include_member_accounts = include_member_accounts_;
     file_format = file_format_;
     s3_destination_config = s3_destination_config_;
     fields_to_export = fields_to_export_;
     filters = filters_;
     account_ids = account_ids_;
   }
    : export_license_recommendations_request)

let make_export_lambda_function_recommendations_response
    ?s3_destination:(s3_destination_ : s3_destination option) ?job_id:(job_id_ : job_id option) () =
  ({ s3_destination = s3_destination_; job_id = job_id_ }
    : export_lambda_function_recommendations_response)

let make_export_lambda_function_recommendations_request
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ?file_format:(file_format_ : file_format option)
    ?fields_to_export:(fields_to_export_ : exportable_lambda_function_fields option)
    ?filters:(filters_ : lambda_function_recommendation_filters option)
    ?account_ids:(account_ids_ : account_ids option)
    ~s3_destination_config:(s3_destination_config_ : s3_destination_config) () =
  ({
     include_member_accounts = include_member_accounts_;
     file_format = file_format_;
     s3_destination_config = s3_destination_config_;
     fields_to_export = fields_to_export_;
     filters = filters_;
     account_ids = account_ids_;
   }
    : export_lambda_function_recommendations_request)

let make_export_idle_recommendations_response
    ?s3_destination:(s3_destination_ : s3_destination option) ?job_id:(job_id_ : job_id option) () =
  ({ s3_destination = s3_destination_; job_id = job_id_ } : export_idle_recommendations_response)

let make_export_idle_recommendations_request
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ?file_format:(file_format_ : file_format option)
    ?fields_to_export:(fields_to_export_ : exportable_idle_fields option)
    ?filters:(filters_ : idle_recommendation_filters option)
    ?account_ids:(account_ids_ : account_ids option)
    ~s3_destination_config:(s3_destination_config_ : s3_destination_config) () =
  ({
     include_member_accounts = include_member_accounts_;
     file_format = file_format_;
     s3_destination_config = s3_destination_config_;
     fields_to_export = fields_to_export_;
     filters = filters_;
     account_ids = account_ids_;
   }
    : export_idle_recommendations_request)

let make_export_ecs_service_recommendations_response
    ?s3_destination:(s3_destination_ : s3_destination option) ?job_id:(job_id_ : job_id option) () =
  ({ s3_destination = s3_destination_; job_id = job_id_ }
    : export_ecs_service_recommendations_response)

let make_export_ecs_service_recommendations_request
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ?file_format:(file_format_ : file_format option)
    ?fields_to_export:(fields_to_export_ : exportable_ecs_service_fields option)
    ?filters:(filters_ : ecs_service_recommendation_filters option)
    ?account_ids:(account_ids_ : account_ids option)
    ~s3_destination_config:(s3_destination_config_ : s3_destination_config) () =
  ({
     include_member_accounts = include_member_accounts_;
     file_format = file_format_;
     s3_destination_config = s3_destination_config_;
     fields_to_export = fields_to_export_;
     filters = filters_;
     account_ids = account_ids_;
   }
    : export_ecs_service_recommendations_request)

let make_export_ec2_instance_recommendations_response
    ?s3_destination:(s3_destination_ : s3_destination option) ?job_id:(job_id_ : job_id option) () =
  ({ s3_destination = s3_destination_; job_id = job_id_ }
    : export_ec2_instance_recommendations_response)

let make_export_ec2_instance_recommendations_request
    ?recommendation_preferences:(recommendation_preferences_ : recommendation_preferences option)
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ?file_format:(file_format_ : file_format option)
    ?fields_to_export:(fields_to_export_ : exportable_instance_fields option)
    ?filters:(filters_ : filters option) ?account_ids:(account_ids_ : account_ids option)
    ~s3_destination_config:(s3_destination_config_ : s3_destination_config) () =
  ({
     recommendation_preferences = recommendation_preferences_;
     include_member_accounts = include_member_accounts_;
     file_format = file_format_;
     s3_destination_config = s3_destination_config_;
     fields_to_export = fields_to_export_;
     filters = filters_;
     account_ids = account_ids_;
   }
    : export_ec2_instance_recommendations_request)

let make_export_ebs_volume_recommendations_response
    ?s3_destination:(s3_destination_ : s3_destination option) ?job_id:(job_id_ : job_id option) () =
  ({ s3_destination = s3_destination_; job_id = job_id_ }
    : export_ebs_volume_recommendations_response)

let make_export_ebs_volume_recommendations_request
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ?file_format:(file_format_ : file_format option)
    ?fields_to_export:(fields_to_export_ : exportable_volume_fields option)
    ?filters:(filters_ : ebs_filters option) ?account_ids:(account_ids_ : account_ids option)
    ~s3_destination_config:(s3_destination_config_ : s3_destination_config) () =
  ({
     include_member_accounts = include_member_accounts_;
     file_format = file_format_;
     s3_destination_config = s3_destination_config_;
     fields_to_export = fields_to_export_;
     filters = filters_;
     account_ids = account_ids_;
   }
    : export_ebs_volume_recommendations_request)

let make_export_auto_scaling_group_recommendations_response
    ?s3_destination:(s3_destination_ : s3_destination option) ?job_id:(job_id_ : job_id option) () =
  ({ s3_destination = s3_destination_; job_id = job_id_ }
    : export_auto_scaling_group_recommendations_response)

let make_export_auto_scaling_group_recommendations_request
    ?recommendation_preferences:(recommendation_preferences_ : recommendation_preferences option)
    ?include_member_accounts:(include_member_accounts_ : include_member_accounts option)
    ?file_format:(file_format_ : file_format option)
    ?fields_to_export:(fields_to_export_ : exportable_auto_scaling_group_fields option)
    ?filters:(filters_ : filters option) ?account_ids:(account_ids_ : account_ids option)
    ~s3_destination_config:(s3_destination_config_ : s3_destination_config) () =
  ({
     recommendation_preferences = recommendation_preferences_;
     include_member_accounts = include_member_accounts_;
     file_format = file_format_;
     s3_destination_config = s3_destination_config_;
     fields_to_export = fields_to_export_;
     filters = filters_;
     account_ids = account_ids_;
   }
    : export_auto_scaling_group_recommendations_request)

let make_describe_recommendation_export_jobs_response ?next_token:(next_token_ : next_token option)
    ?recommendation_export_jobs:(recommendation_export_jobs_ : recommendation_export_jobs option) ()
    =
  ({ next_token = next_token_; recommendation_export_jobs = recommendation_export_jobs_ }
    : describe_recommendation_export_jobs_response)

let make_describe_recommendation_export_jobs_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : job_filters option) ?job_ids:(job_ids_ : job_ids option) () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_; job_ids = job_ids_ }
    : describe_recommendation_export_jobs_request)

let make_delete_recommendation_preferences_response () = (() : unit)

let make_delete_recommendation_preferences_request ?scope:(scope_ : scope option)
    ~recommendation_preference_names:
      (recommendation_preference_names_ : recommendation_preference_names)
    ~resource_type:(resource_type_ : resource_type) () =
  ({
     recommendation_preference_names = recommendation_preference_names_;
     scope = scope_;
     resource_type = resource_type_;
   }
    : delete_recommendation_preferences_request)
