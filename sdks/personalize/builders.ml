open Types

let make_default_categorical_hyper_parameter_range ?name:(name_ : parameter_name option)
    ?values:(values_ : categorical_values option) ?is_tunable:(is_tunable_ : tunable option) () =
  ({ name = name_; values = values_; is_tunable = is_tunable_ }
    : default_categorical_hyper_parameter_range)

let make_default_continuous_hyper_parameter_range ?name:(name_ : parameter_name option)
    ?min_value:(min_value_ : continuous_min_value option)
    ?max_value:(max_value_ : continuous_max_value option) ?is_tunable:(is_tunable_ : tunable option)
    () =
  ({ name = name_; min_value = min_value_; max_value = max_value_; is_tunable = is_tunable_ }
    : default_continuous_hyper_parameter_range)

let make_default_integer_hyper_parameter_range ?name:(name_ : parameter_name option)
    ?min_value:(min_value_ : integer_min_value option)
    ?max_value:(max_value_ : integer_max_value option) ?is_tunable:(is_tunable_ : tunable option) ()
    =
  ({ name = name_; min_value = min_value_; max_value = max_value_; is_tunable = is_tunable_ }
    : default_integer_hyper_parameter_range)

let make_default_hyper_parameter_ranges
    ?integer_hyper_parameter_ranges:
      (integer_hyper_parameter_ranges_ : default_integer_hyper_parameter_ranges option)
    ?continuous_hyper_parameter_ranges:
      (continuous_hyper_parameter_ranges_ : default_continuous_hyper_parameter_ranges option)
    ?categorical_hyper_parameter_ranges:
      (categorical_hyper_parameter_ranges_ : default_categorical_hyper_parameter_ranges option) () =
  ({
     integer_hyper_parameter_ranges = integer_hyper_parameter_ranges_;
     continuous_hyper_parameter_ranges = continuous_hyper_parameter_ranges_;
     categorical_hyper_parameter_ranges = categorical_hyper_parameter_ranges_;
   }
    : default_hyper_parameter_ranges)

let make_algorithm_image ?name:(name_ : name option) ~docker_ur_i:(docker_ur_i_ : docker_ur_i) () =
  ({ name = name_; docker_ur_i = docker_ur_i_ } : algorithm_image)

let make_algorithm ?name:(name_ : name option) ?algorithm_arn:(algorithm_arn_ : arn option)
    ?algorithm_image:(algorithm_image_ : algorithm_image option)
    ?default_hyper_parameters:(default_hyper_parameters_ : hyper_parameters option)
    ?default_hyper_parameter_ranges:
      (default_hyper_parameter_ranges_ : default_hyper_parameter_ranges option)
    ?default_resource_config:(default_resource_config_ : resource_config option)
    ?training_input_mode:(training_input_mode_ : training_input_mode option)
    ?role_arn:(role_arn_ : arn option) ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option) () =
  ({
     name = name_;
     algorithm_arn = algorithm_arn_;
     algorithm_image = algorithm_image_;
     default_hyper_parameters = default_hyper_parameters_;
     default_hyper_parameter_ranges = default_hyper_parameter_ranges_;
     default_resource_config = default_resource_config_;
     training_input_mode = training_input_mode_;
     role_arn = role_arn_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
   }
    : algorithm)

let make_update_solution_response ?solution_arn:(solution_arn_ : arn option) () =
  ({ solution_arn = solution_arn_ } : update_solution_response)

let make_event_parameters ?event_type:(event_type_ : event_type option)
    ?event_value_threshold:(event_value_threshold_ : event_type_threshold_value option)
    ?weight:(weight_ : event_type_weight option) () =
  ({ event_type = event_type_; event_value_threshold = event_value_threshold_; weight = weight_ }
    : event_parameters)

let make_events_config
    ?event_parameters_list:(event_parameters_list_ : event_parameters_list option) () =
  ({ event_parameters_list = event_parameters_list_ } : events_config)

let make_auto_training_config
    ?scheduling_expression:(scheduling_expression_ : scheduling_expression option) () =
  ({ scheduling_expression = scheduling_expression_ } : auto_training_config)

let make_solution_update_config
    ?auto_training_config:(auto_training_config_ : auto_training_config option)
    ?events_config:(events_config_ : events_config option) () =
  ({ auto_training_config = auto_training_config_; events_config = events_config_ }
    : solution_update_config)

let make_update_solution_request
    ?perform_auto_training:(perform_auto_training_ : perform_auto_training option)
    ?perform_incremental_update:(perform_incremental_update_ : perform_incremental_update option)
    ?solution_update_config:(solution_update_config_ : solution_update_config option)
    ~solution_arn:(solution_arn_ : arn) () =
  ({
     solution_arn = solution_arn_;
     perform_auto_training = perform_auto_training_;
     perform_incremental_update = perform_incremental_update_;
     solution_update_config = solution_update_config_;
   }
    : update_solution_request)

let make_update_recommender_response ?recommender_arn:(recommender_arn_ : arn option) () =
  ({ recommender_arn = recommender_arn_ } : update_recommender_response)

let make_training_data_config
    ?excluded_dataset_columns:(excluded_dataset_columns_ : excluded_dataset_columns option)
    ?included_dataset_columns:(included_dataset_columns_ : included_dataset_columns option) () =
  ({
     excluded_dataset_columns = excluded_dataset_columns_;
     included_dataset_columns = included_dataset_columns_;
   }
    : training_data_config)

let make_recommender_config
    ?item_exploration_config:(item_exploration_config_ : hyper_parameters option)
    ?min_recommendation_requests_per_second:
      (min_recommendation_requests_per_second_ : transactions_per_second option)
    ?training_data_config:(training_data_config_ : training_data_config option)
    ?enable_metadata_with_recommendations:(enable_metadata_with_recommendations_ : boolean_ option)
    () =
  ({
     item_exploration_config = item_exploration_config_;
     min_recommendation_requests_per_second = min_recommendation_requests_per_second_;
     training_data_config = training_data_config_;
     enable_metadata_with_recommendations = enable_metadata_with_recommendations_;
   }
    : recommender_config)

let make_update_recommender_request ~recommender_arn:(recommender_arn_ : arn)
    ~recommender_config:(recommender_config_ : recommender_config) () =
  ({ recommender_arn = recommender_arn_; recommender_config = recommender_config_ }
    : update_recommender_request)

let make_update_metric_attribution_response
    ?metric_attribution_arn:(metric_attribution_arn_ : arn option) () =
  ({ metric_attribution_arn = metric_attribution_arn_ } : update_metric_attribution_response)

let make_s3_data_config ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ~path:(path_ : s3_location)
    () =
  ({ path = path_; kms_key_arn = kms_key_arn_ } : s3_data_config)

let make_metric_attribution_output
    ?s3_data_destination:(s3_data_destination_ : s3_data_config option)
    ~role_arn:(role_arn_ : role_arn) () =
  ({ s3_data_destination = s3_data_destination_; role_arn = role_arn_ } : metric_attribution_output)

let make_metric_attribute ~event_type:(event_type_ : event_type)
    ~metric_name:(metric_name_ : metric_name) ~expression:(expression_ : metric_expression) () =
  ({ event_type = event_type_; metric_name = metric_name_; expression = expression_ }
    : metric_attribute)

let make_update_metric_attribution_request ?add_metrics:(add_metrics_ : metric_attributes option)
    ?remove_metrics:(remove_metrics_ : metric_attributes_names_list option)
    ?metrics_output_config:(metrics_output_config_ : metric_attribution_output option)
    ?metric_attribution_arn:(metric_attribution_arn_ : arn option) () =
  ({
     add_metrics = add_metrics_;
     remove_metrics = remove_metrics_;
     metrics_output_config = metrics_output_config_;
     metric_attribution_arn = metric_attribution_arn_;
   }
    : update_metric_attribution_request)

let make_update_dataset_response ?dataset_arn:(dataset_arn_ : arn option) () =
  ({ dataset_arn = dataset_arn_ } : update_dataset_response)

let make_update_dataset_request ~dataset_arn:(dataset_arn_ : arn) ~schema_arn:(schema_arn_ : arn) ()
    =
  ({ dataset_arn = dataset_arn_; schema_arn = schema_arn_ } : update_dataset_request)

let make_update_campaign_response ?campaign_arn:(campaign_arn_ : arn option) () =
  ({ campaign_arn = campaign_arn_ } : update_campaign_response)

let make_campaign_config
    ?item_exploration_config:(item_exploration_config_ : hyper_parameters option)
    ?enable_metadata_with_recommendations:(enable_metadata_with_recommendations_ : boolean_ option)
    ?sync_with_latest_solution_version:(sync_with_latest_solution_version_ : boolean_ option)
    ?ranking_influence:(ranking_influence_ : ranking_influence option) () =
  ({
     item_exploration_config = item_exploration_config_;
     enable_metadata_with_recommendations = enable_metadata_with_recommendations_;
     sync_with_latest_solution_version = sync_with_latest_solution_version_;
     ranking_influence = ranking_influence_;
   }
    : campaign_config)

let make_update_campaign_request ?solution_version_arn:(solution_version_arn_ : arn option)
    ?min_provisioned_tp_s:(min_provisioned_tp_s_ : transactions_per_second option)
    ?campaign_config:(campaign_config_ : campaign_config option) ~campaign_arn:(campaign_arn_ : arn)
    () =
  ({
     campaign_arn = campaign_arn_;
     solution_version_arn = solution_version_arn_;
     min_provisioned_tp_s = min_provisioned_tp_s_;
     campaign_config = campaign_config_;
   }
    : update_campaign_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : arn) ~tag_keys:(tag_keys_ : tag_keys)
    () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~tag_key:(tag_key_ : tag_key) ~tag_value:(tag_value_ : tag_value) () =
  ({ tag_key = tag_key_; tag_value = tag_value_ } : tag)

let make_tag_resource_request ~resource_arn:(resource_arn_ : arn) ~tags:(tags_ : tags) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_stop_solution_version_creation_request ~solution_version_arn:(solution_version_arn_ : arn)
    () =
  ({ solution_version_arn = solution_version_arn_ } : stop_solution_version_creation_request)

let make_stop_recommender_response ?recommender_arn:(recommender_arn_ : arn option) () =
  ({ recommender_arn = recommender_arn_ } : stop_recommender_response)

let make_stop_recommender_request ~recommender_arn:(recommender_arn_ : arn) () =
  ({ recommender_arn = recommender_arn_ } : stop_recommender_request)

let make_start_recommender_response ?recommender_arn:(recommender_arn_ : arn option) () =
  ({ recommender_arn = recommender_arn_ } : start_recommender_response)

let make_start_recommender_request ~recommender_arn:(recommender_arn_ : arn) () =
  ({ recommender_arn = recommender_arn_ } : start_recommender_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_solution_version_summary ?solution_version_arn:(solution_version_arn_ : arn option)
    ?status:(status_ : status option) ?training_mode:(training_mode_ : training_mode option)
    ?training_type:(training_type_ : training_type option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     solution_version_arn = solution_version_arn_;
     status = status_;
     training_mode = training_mode_;
     training_type = training_type_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     failure_reason = failure_reason_;
   }
    : solution_version_summary)

let make_list_solution_versions_response
    ?solution_versions:(solution_versions_ : solution_versions option)
    ?next_token:(next_token_ : next_token option) () =
  ({ solution_versions = solution_versions_; next_token = next_token_ }
    : list_solution_versions_response)

let make_list_solution_versions_request ?solution_arn:(solution_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ solution_arn = solution_arn_; next_token = next_token_; max_results = max_results_ }
    : list_solution_versions_request)

let make_solution_summary ?name:(name_ : name option) ?solution_arn:(solution_arn_ : arn option)
    ?status:(status_ : status option) ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?recipe_arn:(recipe_arn_ : arn option) () =
  ({
     name = name_;
     solution_arn = solution_arn_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     recipe_arn = recipe_arn_;
   }
    : solution_summary)

let make_list_solutions_response ?solutions:(solutions_ : solutions option)
    ?next_token:(next_token_ : next_token option) () =
  ({ solutions = solutions_; next_token = next_token_ } : list_solutions_response)

let make_list_solutions_request ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ dataset_group_arn = dataset_group_arn_; next_token = next_token_; max_results = max_results_ }
    : list_solutions_request)

let make_dataset_schema_summary ?name:(name_ : name option) ?schema_arn:(schema_arn_ : arn option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?domain:(domain_ : domain option) () =
  ({
     name = name_;
     schema_arn = schema_arn_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     domain = domain_;
   }
    : dataset_schema_summary)

let make_list_schemas_response ?schemas:(schemas_ : schemas option)
    ?next_token:(next_token_ : next_token option) () =
  ({ schemas = schemas_; next_token = next_token_ } : list_schemas_response)

let make_list_schemas_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_schemas_request)

let make_recommender_summary ?name:(name_ : name option)
    ?recommender_arn:(recommender_arn_ : arn option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) ?recipe_arn:(recipe_arn_ : arn option)
    ?recommender_config:(recommender_config_ : recommender_config option)
    ?status:(status_ : status option) ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option) () =
  ({
     name = name_;
     recommender_arn = recommender_arn_;
     dataset_group_arn = dataset_group_arn_;
     recipe_arn = recipe_arn_;
     recommender_config = recommender_config_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
   }
    : recommender_summary)

let make_list_recommenders_response ?recommenders:(recommenders_ : recommenders option)
    ?next_token:(next_token_ : next_token option) () =
  ({ recommenders = recommenders_; next_token = next_token_ } : list_recommenders_response)

let make_list_recommenders_request ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ dataset_group_arn = dataset_group_arn_; next_token = next_token_; max_results = max_results_ }
    : list_recommenders_request)

let make_recipe_summary ?name:(name_ : name option) ?recipe_arn:(recipe_arn_ : arn option)
    ?status:(status_ : status option) ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?domain:(domain_ : domain option) () =
  ({
     name = name_;
     recipe_arn = recipe_arn_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     domain = domain_;
   }
    : recipe_summary)

let make_list_recipes_response ?recipes:(recipes_ : recipes option)
    ?next_token:(next_token_ : next_token option) () =
  ({ recipes = recipes_; next_token = next_token_ } : list_recipes_response)

let make_list_recipes_request ?recipe_provider:(recipe_provider_ : recipe_provider option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?domain:(domain_ : domain option) () =
  ({
     recipe_provider = recipe_provider_;
     next_token = next_token_;
     max_results = max_results_;
     domain = domain_;
   }
    : list_recipes_request)

let make_metric_attribution_summary ?name:(name_ : name option)
    ?metric_attribution_arn:(metric_attribution_arn_ : arn option) ?status:(status_ : status option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     name = name_;
     metric_attribution_arn = metric_attribution_arn_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     failure_reason = failure_reason_;
   }
    : metric_attribution_summary)

let make_list_metric_attributions_response
    ?metric_attributions:(metric_attributions_ : metric_attributions option)
    ?next_token:(next_token_ : next_token option) () =
  ({ metric_attributions = metric_attributions_; next_token = next_token_ }
    : list_metric_attributions_response)

let make_list_metric_attributions_request ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ dataset_group_arn = dataset_group_arn_; next_token = next_token_; max_results = max_results_ }
    : list_metric_attributions_request)

let make_list_metric_attribution_metrics_response ?metrics:(metrics_ : metric_attributes option)
    ?next_token:(next_token_ : next_token option) () =
  ({ metrics = metrics_; next_token = next_token_ } : list_metric_attribution_metrics_response)

let make_list_metric_attribution_metrics_request
    ?metric_attribution_arn:(metric_attribution_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     metric_attribution_arn = metric_attribution_arn_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_metric_attribution_metrics_request)

let make_filter_summary ?name:(name_ : name option) ?filter_arn:(filter_arn_ : arn option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?failure_reason:(failure_reason_ : failure_reason option) ?status:(status_ : status option) () =
  ({
     name = name_;
     filter_arn = filter_arn_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     dataset_group_arn = dataset_group_arn_;
     failure_reason = failure_reason_;
     status = status_;
   }
    : filter_summary)

let make_list_filters_response ?filters:(filters_ : filters option)
    ?next_token:(next_token_ : next_token option) () =
  ({ filters = filters_; next_token = next_token_ } : list_filters_response)

let make_list_filters_request ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ dataset_group_arn = dataset_group_arn_; next_token = next_token_; max_results = max_results_ }
    : list_filters_request)

let make_event_tracker_summary ?name:(name_ : name option)
    ?event_tracker_arn:(event_tracker_arn_ : arn option) ?status:(status_ : status option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option) () =
  ({
     name = name_;
     event_tracker_arn = event_tracker_arn_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
   }
    : event_tracker_summary)

let make_list_event_trackers_response ?event_trackers:(event_trackers_ : event_trackers option)
    ?next_token:(next_token_ : next_token option) () =
  ({ event_trackers = event_trackers_; next_token = next_token_ } : list_event_trackers_response)

let make_list_event_trackers_request ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ dataset_group_arn = dataset_group_arn_; next_token = next_token_; max_results = max_results_ }
    : list_event_trackers_request)

let make_dataset_summary ?name:(name_ : name option) ?dataset_arn:(dataset_arn_ : arn option)
    ?dataset_type:(dataset_type_ : dataset_type option) ?status:(status_ : status option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option) () =
  ({
     name = name_;
     dataset_arn = dataset_arn_;
     dataset_type = dataset_type_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
   }
    : dataset_summary)

let make_list_datasets_response ?datasets:(datasets_ : datasets option)
    ?next_token:(next_token_ : next_token option) () =
  ({ datasets = datasets_; next_token = next_token_ } : list_datasets_response)

let make_list_datasets_request ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ dataset_group_arn = dataset_group_arn_; next_token = next_token_; max_results = max_results_ }
    : list_datasets_request)

let make_dataset_import_job_summary ?dataset_import_job_arn:(dataset_import_job_arn_ : arn option)
    ?job_name:(job_name_ : name option) ?status:(status_ : status option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?import_mode:(import_mode_ : import_mode option) () =
  ({
     dataset_import_job_arn = dataset_import_job_arn_;
     job_name = job_name_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     failure_reason = failure_reason_;
     import_mode = import_mode_;
   }
    : dataset_import_job_summary)

let make_list_dataset_import_jobs_response
    ?dataset_import_jobs:(dataset_import_jobs_ : dataset_import_jobs option)
    ?next_token:(next_token_ : next_token option) () =
  ({ dataset_import_jobs = dataset_import_jobs_; next_token = next_token_ }
    : list_dataset_import_jobs_response)

let make_list_dataset_import_jobs_request ?dataset_arn:(dataset_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ dataset_arn = dataset_arn_; next_token = next_token_; max_results = max_results_ }
    : list_dataset_import_jobs_request)

let make_dataset_group_summary ?name:(name_ : name option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) ?status:(status_ : status option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option) ?domain:(domain_ : domain option) () =
  ({
     name = name_;
     dataset_group_arn = dataset_group_arn_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     failure_reason = failure_reason_;
     domain = domain_;
   }
    : dataset_group_summary)

let make_list_dataset_groups_response ?dataset_groups:(dataset_groups_ : dataset_groups option)
    ?next_token:(next_token_ : next_token option) () =
  ({ dataset_groups = dataset_groups_; next_token = next_token_ } : list_dataset_groups_response)

let make_list_dataset_groups_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_dataset_groups_request)

let make_dataset_export_job_summary ?dataset_export_job_arn:(dataset_export_job_arn_ : arn option)
    ?job_name:(job_name_ : name option) ?status:(status_ : status option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     dataset_export_job_arn = dataset_export_job_arn_;
     job_name = job_name_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     failure_reason = failure_reason_;
   }
    : dataset_export_job_summary)

let make_list_dataset_export_jobs_response
    ?dataset_export_jobs:(dataset_export_jobs_ : dataset_export_jobs option)
    ?next_token:(next_token_ : next_token option) () =
  ({ dataset_export_jobs = dataset_export_jobs_; next_token = next_token_ }
    : list_dataset_export_jobs_response)

let make_list_dataset_export_jobs_request ?dataset_arn:(dataset_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ dataset_arn = dataset_arn_; next_token = next_token_; max_results = max_results_ }
    : list_dataset_export_jobs_request)

let make_data_deletion_job_summary ?data_deletion_job_arn:(data_deletion_job_arn_ : arn option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) ?job_name:(job_name_ : name option)
    ?status:(status_ : status option) ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     data_deletion_job_arn = data_deletion_job_arn_;
     dataset_group_arn = dataset_group_arn_;
     job_name = job_name_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     failure_reason = failure_reason_;
   }
    : data_deletion_job_summary)

let make_list_data_deletion_jobs_response
    ?data_deletion_jobs:(data_deletion_jobs_ : data_deletion_jobs option)
    ?next_token:(next_token_ : next_token option) () =
  ({ data_deletion_jobs = data_deletion_jobs_; next_token = next_token_ }
    : list_data_deletion_jobs_response)

let make_list_data_deletion_jobs_request ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ dataset_group_arn = dataset_group_arn_; next_token = next_token_; max_results = max_results_ }
    : list_data_deletion_jobs_request)

let make_campaign_summary ?name:(name_ : name option) ?campaign_arn:(campaign_arn_ : arn option)
    ?status:(status_ : status option) ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     name = name_;
     campaign_arn = campaign_arn_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     failure_reason = failure_reason_;
   }
    : campaign_summary)

let make_list_campaigns_response ?campaigns:(campaigns_ : campaigns option)
    ?next_token:(next_token_ : next_token option) () =
  ({ campaigns = campaigns_; next_token = next_token_ } : list_campaigns_response)

let make_list_campaigns_request ?solution_arn:(solution_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ solution_arn = solution_arn_; next_token = next_token_; max_results = max_results_ }
    : list_campaigns_request)

let make_batch_segment_job_summary ?batch_segment_job_arn:(batch_segment_job_arn_ : arn option)
    ?job_name:(job_name_ : name option) ?status:(status_ : status option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?solution_version_arn:(solution_version_arn_ : arn option) () =
  ({
     batch_segment_job_arn = batch_segment_job_arn_;
     job_name = job_name_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     failure_reason = failure_reason_;
     solution_version_arn = solution_version_arn_;
   }
    : batch_segment_job_summary)

let make_list_batch_segment_jobs_response
    ?batch_segment_jobs:(batch_segment_jobs_ : batch_segment_jobs option)
    ?next_token:(next_token_ : next_token option) () =
  ({ batch_segment_jobs = batch_segment_jobs_; next_token = next_token_ }
    : list_batch_segment_jobs_response)

let make_list_batch_segment_jobs_request ?solution_version_arn:(solution_version_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     solution_version_arn = solution_version_arn_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_batch_segment_jobs_request)

let make_batch_inference_job_summary
    ?batch_inference_job_arn:(batch_inference_job_arn_ : arn option)
    ?job_name:(job_name_ : name option) ?status:(status_ : status option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?solution_version_arn:(solution_version_arn_ : arn option)
    ?batch_inference_job_mode:(batch_inference_job_mode_ : batch_inference_job_mode option) () =
  ({
     batch_inference_job_arn = batch_inference_job_arn_;
     job_name = job_name_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     failure_reason = failure_reason_;
     solution_version_arn = solution_version_arn_;
     batch_inference_job_mode = batch_inference_job_mode_;
   }
    : batch_inference_job_summary)

let make_list_batch_inference_jobs_response
    ?batch_inference_jobs:(batch_inference_jobs_ : batch_inference_jobs option)
    ?next_token:(next_token_ : next_token option) () =
  ({ batch_inference_jobs = batch_inference_jobs_; next_token = next_token_ }
    : list_batch_inference_jobs_response)

let make_list_batch_inference_jobs_request
    ?solution_version_arn:(solution_version_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     solution_version_arn = solution_version_arn_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_batch_inference_jobs_request)

let make_get_solution_metrics_response ?solution_version_arn:(solution_version_arn_ : arn option)
    ?metrics:(metrics_ : metrics option) () =
  ({ solution_version_arn = solution_version_arn_; metrics = metrics_ }
    : get_solution_metrics_response)

let make_get_solution_metrics_request ~solution_version_arn:(solution_version_arn_ : arn) () =
  ({ solution_version_arn = solution_version_arn_ } : get_solution_metrics_request)

let make_tuned_hpo_params
    ?algorithm_hyper_parameters:(algorithm_hyper_parameters_ : hyper_parameters option) () =
  ({ algorithm_hyper_parameters = algorithm_hyper_parameters_ } : tuned_hpo_params)

let make_optimization_objective ?item_attribute:(item_attribute_ : item_attribute option)
    ?objective_sensitivity:(objective_sensitivity_ : objective_sensitivity option) () =
  ({ item_attribute = item_attribute_; objective_sensitivity = objective_sensitivity_ }
    : optimization_objective)

let make_auto_ml_config ?metric_name:(metric_name_ : metric_name option)
    ?recipe_list:(recipe_list_ : arn_list option) () =
  ({ metric_name = metric_name_; recipe_list = recipe_list_ } : auto_ml_config)

let make_categorical_hyper_parameter_range ?name:(name_ : parameter_name option)
    ?values:(values_ : categorical_values option) () =
  ({ name = name_; values = values_ } : categorical_hyper_parameter_range)

let make_continuous_hyper_parameter_range ?name:(name_ : parameter_name option)
    ?min_value:(min_value_ : continuous_min_value option)
    ?max_value:(max_value_ : continuous_max_value option) () =
  ({ name = name_; min_value = min_value_; max_value = max_value_ }
    : continuous_hyper_parameter_range)

let make_integer_hyper_parameter_range ?name:(name_ : parameter_name option)
    ?min_value:(min_value_ : integer_min_value option)
    ?max_value:(max_value_ : integer_max_value option) () =
  ({ name = name_; min_value = min_value_; max_value = max_value_ } : integer_hyper_parameter_range)

let make_hyper_parameter_ranges
    ?integer_hyper_parameter_ranges:
      (integer_hyper_parameter_ranges_ : integer_hyper_parameter_ranges option)
    ?continuous_hyper_parameter_ranges:
      (continuous_hyper_parameter_ranges_ : continuous_hyper_parameter_ranges option)
    ?categorical_hyper_parameter_ranges:
      (categorical_hyper_parameter_ranges_ : categorical_hyper_parameter_ranges option) () =
  ({
     integer_hyper_parameter_ranges = integer_hyper_parameter_ranges_;
     continuous_hyper_parameter_ranges = continuous_hyper_parameter_ranges_;
     categorical_hyper_parameter_ranges = categorical_hyper_parameter_ranges_;
   }
    : hyper_parameter_ranges)

let make_hpo_resource_config
    ?max_number_of_training_jobs:(max_number_of_training_jobs_ : hpo_resource option)
    ?max_parallel_training_jobs:(max_parallel_training_jobs_ : hpo_resource option) () =
  ({
     max_number_of_training_jobs = max_number_of_training_jobs_;
     max_parallel_training_jobs = max_parallel_training_jobs_;
   }
    : hpo_resource_config)

let make_hpo_objective ?type_:(type__ : hpo_objective_type option)
    ?metric_name:(metric_name_ : metric_name option)
    ?metric_regex:(metric_regex_ : metric_regex option) () =
  ({ type_ = type__; metric_name = metric_name_; metric_regex = metric_regex_ } : hpo_objective)

let make_hpo_config ?hpo_objective:(hpo_objective_ : hpo_objective option)
    ?hpo_resource_config:(hpo_resource_config_ : hpo_resource_config option)
    ?algorithm_hyper_parameter_ranges:
      (algorithm_hyper_parameter_ranges_ : hyper_parameter_ranges option) () =
  ({
     hpo_objective = hpo_objective_;
     hpo_resource_config = hpo_resource_config_;
     algorithm_hyper_parameter_ranges = algorithm_hyper_parameter_ranges_;
   }
    : hpo_config)

let make_solution_config
    ?event_value_threshold:(event_value_threshold_ : event_value_threshold option)
    ?hpo_config:(hpo_config_ : hpo_config option)
    ?algorithm_hyper_parameters:(algorithm_hyper_parameters_ : hyper_parameters option)
    ?feature_transformation_parameters:
      (feature_transformation_parameters_ : feature_transformation_parameters option)
    ?auto_ml_config:(auto_ml_config_ : auto_ml_config option)
    ?events_config:(events_config_ : events_config option)
    ?optimization_objective:(optimization_objective_ : optimization_objective option)
    ?training_data_config:(training_data_config_ : training_data_config option)
    ?auto_training_config:(auto_training_config_ : auto_training_config option) () =
  ({
     event_value_threshold = event_value_threshold_;
     hpo_config = hpo_config_;
     algorithm_hyper_parameters = algorithm_hyper_parameters_;
     feature_transformation_parameters = feature_transformation_parameters_;
     auto_ml_config = auto_ml_config_;
     events_config = events_config_;
     optimization_objective = optimization_objective_;
     training_data_config = training_data_config_;
     auto_training_config = auto_training_config_;
   }
    : solution_config)

let make_solution_version ?name:(name_ : name option)
    ?solution_version_arn:(solution_version_arn_ : arn option)
    ?solution_arn:(solution_arn_ : arn option) ?perform_hp_o:(perform_hp_o_ : perform_hp_o option)
    ?perform_auto_m_l:(perform_auto_m_l_ : perform_auto_m_l option)
    ?perform_incremental_update:(perform_incremental_update_ : perform_incremental_update option)
    ?recipe_arn:(recipe_arn_ : arn option) ?event_type:(event_type_ : event_type option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?solution_config:(solution_config_ : solution_config option)
    ?training_hours:(training_hours_ : training_hours option)
    ?training_mode:(training_mode_ : training_mode option)
    ?tuned_hpo_params:(tuned_hpo_params_ : tuned_hpo_params option)
    ?status:(status_ : status option) ?failure_reason:(failure_reason_ : failure_reason option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?training_type:(training_type_ : training_type option) () =
  ({
     name = name_;
     solution_version_arn = solution_version_arn_;
     solution_arn = solution_arn_;
     perform_hp_o = perform_hp_o_;
     perform_auto_m_l = perform_auto_m_l_;
     perform_incremental_update = perform_incremental_update_;
     recipe_arn = recipe_arn_;
     event_type = event_type_;
     dataset_group_arn = dataset_group_arn_;
     solution_config = solution_config_;
     training_hours = training_hours_;
     training_mode = training_mode_;
     tuned_hpo_params = tuned_hpo_params_;
     status = status_;
     failure_reason = failure_reason_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     training_type = training_type_;
   }
    : solution_version)

let make_describe_solution_version_response
    ?solution_version:(solution_version_ : solution_version option) () =
  ({ solution_version = solution_version_ } : describe_solution_version_response)

let make_describe_solution_version_request ~solution_version_arn:(solution_version_arn_ : arn) () =
  ({ solution_version_arn = solution_version_arn_ } : describe_solution_version_request)

let make_solution_update_summary
    ?solution_update_config:(solution_update_config_ : solution_update_config option)
    ?status:(status_ : status option)
    ?perform_auto_training:(perform_auto_training_ : perform_auto_training option)
    ?perform_incremental_update:(perform_incremental_update_ : perform_incremental_update option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     solution_update_config = solution_update_config_;
     status = status_;
     perform_auto_training = perform_auto_training_;
     perform_incremental_update = perform_incremental_update_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     failure_reason = failure_reason_;
   }
    : solution_update_summary)

let make_solution ?name:(name_ : name option) ?solution_arn:(solution_arn_ : arn option)
    ?perform_hp_o:(perform_hp_o_ : perform_hp_o option)
    ?perform_auto_m_l:(perform_auto_m_l_ : perform_auto_m_l option)
    ?perform_auto_training:(perform_auto_training_ : perform_auto_training option)
    ?perform_incremental_update:(perform_incremental_update_ : perform_incremental_update option)
    ?recipe_arn:(recipe_arn_ : arn option) ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?event_type:(event_type_ : event_type option)
    ?solution_config:(solution_config_ : solution_config option)
    ?auto_ml_result:(auto_ml_result_ : auto_ml_result option) ?status:(status_ : status option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?latest_solution_version:(latest_solution_version_ : solution_version_summary option)
    ?latest_solution_update:(latest_solution_update_ : solution_update_summary option) () =
  ({
     name = name_;
     solution_arn = solution_arn_;
     perform_hp_o = perform_hp_o_;
     perform_auto_m_l = perform_auto_m_l_;
     perform_auto_training = perform_auto_training_;
     perform_incremental_update = perform_incremental_update_;
     recipe_arn = recipe_arn_;
     dataset_group_arn = dataset_group_arn_;
     event_type = event_type_;
     solution_config = solution_config_;
     auto_ml_result = auto_ml_result_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     latest_solution_version = latest_solution_version_;
     latest_solution_update = latest_solution_update_;
   }
    : solution)

let make_describe_solution_response ?solution:(solution_ : solution option) () =
  ({ solution = solution_ } : describe_solution_response)

let make_describe_solution_request ~solution_arn:(solution_arn_ : arn) () =
  ({ solution_arn = solution_arn_ } : describe_solution_request)

let make_dataset_schema ?name:(name_ : name option) ?schema_arn:(schema_arn_ : arn option)
    ?schema:(schema_ : avro_schema option) ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?domain:(domain_ : domain option) () =
  ({
     name = name_;
     schema_arn = schema_arn_;
     schema = schema_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     domain = domain_;
   }
    : dataset_schema)

let make_describe_schema_response ?schema:(schema_ : dataset_schema option) () =
  ({ schema = schema_ } : describe_schema_response)

let make_describe_schema_request ~schema_arn:(schema_arn_ : arn) () =
  ({ schema_arn = schema_arn_ } : describe_schema_request)

let make_recommender_update_summary
    ?recommender_config:(recommender_config_ : recommender_config option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?status:(status_ : status option) ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     recommender_config = recommender_config_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     status = status_;
     failure_reason = failure_reason_;
   }
    : recommender_update_summary)

let make_recommender ?recommender_arn:(recommender_arn_ : arn option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) ?name:(name_ : name option)
    ?recipe_arn:(recipe_arn_ : arn option)
    ?recommender_config:(recommender_config_ : recommender_config option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?status:(status_ : status option) ?failure_reason:(failure_reason_ : failure_reason option)
    ?latest_recommender_update:(latest_recommender_update_ : recommender_update_summary option)
    ?model_metrics:(model_metrics_ : metrics option) () =
  ({
     recommender_arn = recommender_arn_;
     dataset_group_arn = dataset_group_arn_;
     name = name_;
     recipe_arn = recipe_arn_;
     recommender_config = recommender_config_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     status = status_;
     failure_reason = failure_reason_;
     latest_recommender_update = latest_recommender_update_;
     model_metrics = model_metrics_;
   }
    : recommender)

let make_describe_recommender_response ?recommender:(recommender_ : recommender option) () =
  ({ recommender = recommender_ } : describe_recommender_response)

let make_describe_recommender_request ~recommender_arn:(recommender_arn_ : arn) () =
  ({ recommender_arn = recommender_arn_ } : describe_recommender_request)

let make_recipe ?name:(name_ : name option) ?recipe_arn:(recipe_arn_ : arn option)
    ?algorithm_arn:(algorithm_arn_ : arn option)
    ?feature_transformation_arn:(feature_transformation_arn_ : arn option)
    ?status:(status_ : status option) ?description:(description_ : description option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?recipe_type:(recipe_type_ : recipe_type option)
    ?last_updated_date_time:(last_updated_date_time_ : date option) () =
  ({
     name = name_;
     recipe_arn = recipe_arn_;
     algorithm_arn = algorithm_arn_;
     feature_transformation_arn = feature_transformation_arn_;
     status = status_;
     description = description_;
     creation_date_time = creation_date_time_;
     recipe_type = recipe_type_;
     last_updated_date_time = last_updated_date_time_;
   }
    : recipe)

let make_describe_recipe_response ?recipe:(recipe_ : recipe option) () =
  ({ recipe = recipe_ } : describe_recipe_response)

let make_describe_recipe_request ~recipe_arn:(recipe_arn_ : arn) () =
  ({ recipe_arn = recipe_arn_ } : describe_recipe_request)

let make_metric_attribution ?name:(name_ : name option)
    ?metric_attribution_arn:(metric_attribution_arn_ : arn option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?metrics_output_config:(metrics_output_config_ : metric_attribution_output option)
    ?status:(status_ : status option) ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     name = name_;
     metric_attribution_arn = metric_attribution_arn_;
     dataset_group_arn = dataset_group_arn_;
     metrics_output_config = metrics_output_config_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     failure_reason = failure_reason_;
   }
    : metric_attribution)

let make_describe_metric_attribution_response
    ?metric_attribution:(metric_attribution_ : metric_attribution option) () =
  ({ metric_attribution = metric_attribution_ } : describe_metric_attribution_response)

let make_describe_metric_attribution_request ~metric_attribution_arn:(metric_attribution_arn_ : arn)
    () =
  ({ metric_attribution_arn = metric_attribution_arn_ } : describe_metric_attribution_request)

let make_filter ?name:(name_ : name option) ?filter_arn:(filter_arn_ : arn option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?filter_expression:(filter_expression_ : filter_expression option)
    ?status:(status_ : status option) () =
  ({
     name = name_;
     filter_arn = filter_arn_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     dataset_group_arn = dataset_group_arn_;
     failure_reason = failure_reason_;
     filter_expression = filter_expression_;
     status = status_;
   }
    : filter)

let make_describe_filter_response ?filter:(filter_ : filter option) () =
  ({ filter = filter_ } : describe_filter_response)

let make_describe_filter_request ~filter_arn:(filter_arn_ : arn) () =
  ({ filter_arn = filter_arn_ } : describe_filter_request)

let make_feature_transformation ?name:(name_ : name option)
    ?feature_transformation_arn:(feature_transformation_arn_ : arn option)
    ?default_parameters:(default_parameters_ : featurization_parameters option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?status:(status_ : status option) () =
  ({
     name = name_;
     feature_transformation_arn = feature_transformation_arn_;
     default_parameters = default_parameters_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     status = status_;
   }
    : feature_transformation)

let make_describe_feature_transformation_response
    ?feature_transformation:(feature_transformation_ : feature_transformation option) () =
  ({ feature_transformation = feature_transformation_ } : describe_feature_transformation_response)

let make_describe_feature_transformation_request
    ~feature_transformation_arn:(feature_transformation_arn_ : arn) () =
  ({ feature_transformation_arn = feature_transformation_arn_ }
    : describe_feature_transformation_request)

let make_event_tracker ?name:(name_ : name option)
    ?event_tracker_arn:(event_tracker_arn_ : arn option)
    ?account_id:(account_id_ : account_id option) ?tracking_id:(tracking_id_ : tracking_id option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) ?status:(status_ : status option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option) () =
  ({
     name = name_;
     event_tracker_arn = event_tracker_arn_;
     account_id = account_id_;
     tracking_id = tracking_id_;
     dataset_group_arn = dataset_group_arn_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
   }
    : event_tracker)

let make_describe_event_tracker_response ?event_tracker:(event_tracker_ : event_tracker option) () =
  ({ event_tracker = event_tracker_ } : describe_event_tracker_response)

let make_describe_event_tracker_request ~event_tracker_arn:(event_tracker_arn_ : arn) () =
  ({ event_tracker_arn = event_tracker_arn_ } : describe_event_tracker_request)

let make_data_source ?data_location:(data_location_ : s3_location option) () =
  ({ data_location = data_location_ } : data_source)

let make_dataset_import_job ?job_name:(job_name_ : name option)
    ?dataset_import_job_arn:(dataset_import_job_arn_ : arn option)
    ?dataset_arn:(dataset_arn_ : arn option) ?data_source:(data_source_ : data_source option)
    ?role_arn:(role_arn_ : arn option) ?status:(status_ : status option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?import_mode:(import_mode_ : import_mode option)
    ?publish_attribution_metrics_to_s3:(publish_attribution_metrics_to_s3_ : boolean_ option) () =
  ({
     job_name = job_name_;
     dataset_import_job_arn = dataset_import_job_arn_;
     dataset_arn = dataset_arn_;
     data_source = data_source_;
     role_arn = role_arn_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     failure_reason = failure_reason_;
     import_mode = import_mode_;
     publish_attribution_metrics_to_s3 = publish_attribution_metrics_to_s3_;
   }
    : dataset_import_job)

let make_describe_dataset_import_job_response
    ?dataset_import_job:(dataset_import_job_ : dataset_import_job option) () =
  ({ dataset_import_job = dataset_import_job_ } : describe_dataset_import_job_response)

let make_describe_dataset_import_job_request ~dataset_import_job_arn:(dataset_import_job_arn_ : arn)
    () =
  ({ dataset_import_job_arn = dataset_import_job_arn_ } : describe_dataset_import_job_request)

let make_dataset_group ?name:(name_ : name option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) ?status:(status_ : status option)
    ?role_arn:(role_arn_ : role_arn option) ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option) ?domain:(domain_ : domain option) () =
  ({
     name = name_;
     dataset_group_arn = dataset_group_arn_;
     status = status_;
     role_arn = role_arn_;
     kms_key_arn = kms_key_arn_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     failure_reason = failure_reason_;
     domain = domain_;
   }
    : dataset_group)

let make_describe_dataset_group_response ?dataset_group:(dataset_group_ : dataset_group option) () =
  ({ dataset_group = dataset_group_ } : describe_dataset_group_response)

let make_describe_dataset_group_request ~dataset_group_arn:(dataset_group_arn_ : arn) () =
  ({ dataset_group_arn = dataset_group_arn_ } : describe_dataset_group_request)

let make_dataset_export_job_output ~s3_data_destination:(s3_data_destination_ : s3_data_config) () =
  ({ s3_data_destination = s3_data_destination_ } : dataset_export_job_output)

let make_dataset_export_job ?job_name:(job_name_ : name option)
    ?dataset_export_job_arn:(dataset_export_job_arn_ : arn option)
    ?dataset_arn:(dataset_arn_ : arn option)
    ?ingestion_mode:(ingestion_mode_ : ingestion_mode option) ?role_arn:(role_arn_ : arn option)
    ?status:(status_ : status option) ?job_output:(job_output_ : dataset_export_job_output option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     job_name = job_name_;
     dataset_export_job_arn = dataset_export_job_arn_;
     dataset_arn = dataset_arn_;
     ingestion_mode = ingestion_mode_;
     role_arn = role_arn_;
     status = status_;
     job_output = job_output_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     failure_reason = failure_reason_;
   }
    : dataset_export_job)

let make_describe_dataset_export_job_response
    ?dataset_export_job:(dataset_export_job_ : dataset_export_job option) () =
  ({ dataset_export_job = dataset_export_job_ } : describe_dataset_export_job_response)

let make_describe_dataset_export_job_request ~dataset_export_job_arn:(dataset_export_job_arn_ : arn)
    () =
  ({ dataset_export_job_arn = dataset_export_job_arn_ } : describe_dataset_export_job_request)

let make_dataset_update_summary ?schema_arn:(schema_arn_ : arn option)
    ?status:(status_ : status option) ?failure_reason:(failure_reason_ : failure_reason option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option) () =
  ({
     schema_arn = schema_arn_;
     status = status_;
     failure_reason = failure_reason_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
   }
    : dataset_update_summary)

let make_dataset ?name:(name_ : name option) ?dataset_arn:(dataset_arn_ : arn option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?dataset_type:(dataset_type_ : dataset_type option) ?schema_arn:(schema_arn_ : arn option)
    ?status:(status_ : status option) ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?latest_dataset_update:(latest_dataset_update_ : dataset_update_summary option)
    ?tracking_id:(tracking_id_ : tracking_id option) () =
  ({
     name = name_;
     dataset_arn = dataset_arn_;
     dataset_group_arn = dataset_group_arn_;
     dataset_type = dataset_type_;
     schema_arn = schema_arn_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     latest_dataset_update = latest_dataset_update_;
     tracking_id = tracking_id_;
   }
    : dataset)

let make_describe_dataset_response ?dataset:(dataset_ : dataset option) () =
  ({ dataset = dataset_ } : describe_dataset_response)

let make_describe_dataset_request ~dataset_arn:(dataset_arn_ : arn) () =
  ({ dataset_arn = dataset_arn_ } : describe_dataset_request)

let make_data_deletion_job ?job_name:(job_name_ : name option)
    ?data_deletion_job_arn:(data_deletion_job_arn_ : arn option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?data_source:(data_source_ : data_source option) ?role_arn:(role_arn_ : role_arn option)
    ?status:(status_ : status option) ?num_deleted:(num_deleted_ : integer option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option) () =
  ({
     job_name = job_name_;
     data_deletion_job_arn = data_deletion_job_arn_;
     dataset_group_arn = dataset_group_arn_;
     data_source = data_source_;
     role_arn = role_arn_;
     status = status_;
     num_deleted = num_deleted_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     failure_reason = failure_reason_;
   }
    : data_deletion_job)

let make_describe_data_deletion_job_response
    ?data_deletion_job:(data_deletion_job_ : data_deletion_job option) () =
  ({ data_deletion_job = data_deletion_job_ } : describe_data_deletion_job_response)

let make_describe_data_deletion_job_request ~data_deletion_job_arn:(data_deletion_job_arn_ : arn) ()
    =
  ({ data_deletion_job_arn = data_deletion_job_arn_ } : describe_data_deletion_job_request)

let make_campaign_update_summary ?solution_version_arn:(solution_version_arn_ : arn option)
    ?min_provisioned_tp_s:(min_provisioned_tp_s_ : transactions_per_second option)
    ?campaign_config:(campaign_config_ : campaign_config option) ?status:(status_ : status option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option) () =
  ({
     solution_version_arn = solution_version_arn_;
     min_provisioned_tp_s = min_provisioned_tp_s_;
     campaign_config = campaign_config_;
     status = status_;
     failure_reason = failure_reason_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
   }
    : campaign_update_summary)

let make_campaign ?name:(name_ : name option) ?campaign_arn:(campaign_arn_ : arn option)
    ?solution_version_arn:(solution_version_arn_ : arn option)
    ?min_provisioned_tp_s:(min_provisioned_tp_s_ : transactions_per_second option)
    ?campaign_config:(campaign_config_ : campaign_config option) ?status:(status_ : status option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?latest_campaign_update:(latest_campaign_update_ : campaign_update_summary option) () =
  ({
     name = name_;
     campaign_arn = campaign_arn_;
     solution_version_arn = solution_version_arn_;
     min_provisioned_tp_s = min_provisioned_tp_s_;
     campaign_config = campaign_config_;
     status = status_;
     failure_reason = failure_reason_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
     latest_campaign_update = latest_campaign_update_;
   }
    : campaign)

let make_describe_campaign_response ?campaign:(campaign_ : campaign option) () =
  ({ campaign = campaign_ } : describe_campaign_response)

let make_describe_campaign_request ~campaign_arn:(campaign_arn_ : arn) () =
  ({ campaign_arn = campaign_arn_ } : describe_campaign_request)

let make_batch_segment_job_output ~s3_data_destination:(s3_data_destination_ : s3_data_config) () =
  ({ s3_data_destination = s3_data_destination_ } : batch_segment_job_output)

let make_batch_segment_job_input ~s3_data_source:(s3_data_source_ : s3_data_config) () =
  ({ s3_data_source = s3_data_source_ } : batch_segment_job_input)

let make_batch_segment_job ?job_name:(job_name_ : name option)
    ?batch_segment_job_arn:(batch_segment_job_arn_ : arn option)
    ?filter_arn:(filter_arn_ : arn option) ?failure_reason:(failure_reason_ : failure_reason option)
    ?solution_version_arn:(solution_version_arn_ : arn option)
    ?num_results:(num_results_ : num_batch_results option)
    ?job_input:(job_input_ : batch_segment_job_input option)
    ?job_output:(job_output_ : batch_segment_job_output option)
    ?role_arn:(role_arn_ : role_arn option) ?status:(status_ : status option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option) () =
  ({
     job_name = job_name_;
     batch_segment_job_arn = batch_segment_job_arn_;
     filter_arn = filter_arn_;
     failure_reason = failure_reason_;
     solution_version_arn = solution_version_arn_;
     num_results = num_results_;
     job_input = job_input_;
     job_output = job_output_;
     role_arn = role_arn_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
   }
    : batch_segment_job)

let make_describe_batch_segment_job_response
    ?batch_segment_job:(batch_segment_job_ : batch_segment_job option) () =
  ({ batch_segment_job = batch_segment_job_ } : describe_batch_segment_job_response)

let make_describe_batch_segment_job_request ~batch_segment_job_arn:(batch_segment_job_arn_ : arn) ()
    =
  ({ batch_segment_job_arn = batch_segment_job_arn_ } : describe_batch_segment_job_request)

let make_fields_for_theme_generation ~item_name:(item_name_ : column_name) () =
  ({ item_name = item_name_ } : fields_for_theme_generation)

let make_theme_generation_config
    ~fields_for_theme_generation:(fields_for_theme_generation_ : fields_for_theme_generation) () =
  ({ fields_for_theme_generation = fields_for_theme_generation_ } : theme_generation_config)

let make_batch_inference_job_config
    ?item_exploration_config:(item_exploration_config_ : hyper_parameters option)
    ?ranking_influence:(ranking_influence_ : ranking_influence option) () =
  ({ item_exploration_config = item_exploration_config_; ranking_influence = ranking_influence_ }
    : batch_inference_job_config)

let make_batch_inference_job_output ~s3_data_destination:(s3_data_destination_ : s3_data_config) ()
    =
  ({ s3_data_destination = s3_data_destination_ } : batch_inference_job_output)

let make_batch_inference_job_input ~s3_data_source:(s3_data_source_ : s3_data_config) () =
  ({ s3_data_source = s3_data_source_ } : batch_inference_job_input)

let make_batch_inference_job ?job_name:(job_name_ : name option)
    ?batch_inference_job_arn:(batch_inference_job_arn_ : arn option)
    ?filter_arn:(filter_arn_ : arn option) ?failure_reason:(failure_reason_ : failure_reason option)
    ?solution_version_arn:(solution_version_arn_ : arn option)
    ?num_results:(num_results_ : num_batch_results option)
    ?job_input:(job_input_ : batch_inference_job_input option)
    ?job_output:(job_output_ : batch_inference_job_output option)
    ?batch_inference_job_config:(batch_inference_job_config_ : batch_inference_job_config option)
    ?role_arn:(role_arn_ : role_arn option)
    ?batch_inference_job_mode:(batch_inference_job_mode_ : batch_inference_job_mode option)
    ?theme_generation_config:(theme_generation_config_ : theme_generation_config option)
    ?status:(status_ : status option) ?creation_date_time:(creation_date_time_ : date option)
    ?last_updated_date_time:(last_updated_date_time_ : date option) () =
  ({
     job_name = job_name_;
     batch_inference_job_arn = batch_inference_job_arn_;
     filter_arn = filter_arn_;
     failure_reason = failure_reason_;
     solution_version_arn = solution_version_arn_;
     num_results = num_results_;
     job_input = job_input_;
     job_output = job_output_;
     batch_inference_job_config = batch_inference_job_config_;
     role_arn = role_arn_;
     batch_inference_job_mode = batch_inference_job_mode_;
     theme_generation_config = theme_generation_config_;
     status = status_;
     creation_date_time = creation_date_time_;
     last_updated_date_time = last_updated_date_time_;
   }
    : batch_inference_job)

let make_describe_batch_inference_job_response
    ?batch_inference_job:(batch_inference_job_ : batch_inference_job option) () =
  ({ batch_inference_job = batch_inference_job_ } : describe_batch_inference_job_response)

let make_describe_batch_inference_job_request
    ~batch_inference_job_arn:(batch_inference_job_arn_ : arn) () =
  ({ batch_inference_job_arn = batch_inference_job_arn_ } : describe_batch_inference_job_request)

let make_describe_algorithm_response ?algorithm:(algorithm_ : algorithm option) () =
  ({ algorithm = algorithm_ } : describe_algorithm_response)

let make_describe_algorithm_request ~algorithm_arn:(algorithm_arn_ : arn) () =
  ({ algorithm_arn = algorithm_arn_ } : describe_algorithm_request)

let make_delete_solution_request ~solution_arn:(solution_arn_ : arn) () =
  ({ solution_arn = solution_arn_ } : delete_solution_request)

let make_delete_schema_request ~schema_arn:(schema_arn_ : arn) () =
  ({ schema_arn = schema_arn_ } : delete_schema_request)

let make_delete_recommender_request ~recommender_arn:(recommender_arn_ : arn) () =
  ({ recommender_arn = recommender_arn_ } : delete_recommender_request)

let make_delete_metric_attribution_request ~metric_attribution_arn:(metric_attribution_arn_ : arn)
    () =
  ({ metric_attribution_arn = metric_attribution_arn_ } : delete_metric_attribution_request)

let make_delete_filter_request ~filter_arn:(filter_arn_ : arn) () =
  ({ filter_arn = filter_arn_ } : delete_filter_request)

let make_delete_event_tracker_request ~event_tracker_arn:(event_tracker_arn_ : arn) () =
  ({ event_tracker_arn = event_tracker_arn_ } : delete_event_tracker_request)

let make_delete_dataset_group_request ~dataset_group_arn:(dataset_group_arn_ : arn) () =
  ({ dataset_group_arn = dataset_group_arn_ } : delete_dataset_group_request)

let make_delete_dataset_request ~dataset_arn:(dataset_arn_ : arn) () =
  ({ dataset_arn = dataset_arn_ } : delete_dataset_request)

let make_delete_campaign_request ~campaign_arn:(campaign_arn_ : arn) () =
  ({ campaign_arn = campaign_arn_ } : delete_campaign_request)

let make_create_solution_version_response ?solution_version_arn:(solution_version_arn_ : arn option)
    () =
  ({ solution_version_arn = solution_version_arn_ } : create_solution_version_response)

let make_create_solution_version_request ?name:(name_ : name option)
    ?training_mode:(training_mode_ : training_mode option) ?tags:(tags_ : tags option)
    ~solution_arn:(solution_arn_ : arn) () =
  ({ name = name_; solution_arn = solution_arn_; training_mode = training_mode_; tags = tags_ }
    : create_solution_version_request)

let make_create_solution_response ?solution_arn:(solution_arn_ : arn option) () =
  ({ solution_arn = solution_arn_ } : create_solution_response)

let make_create_solution_request ?perform_hp_o:(perform_hp_o_ : boolean_ option)
    ?perform_auto_m_l:(perform_auto_m_l_ : perform_auto_m_l option)
    ?perform_auto_training:(perform_auto_training_ : perform_auto_training option)
    ?perform_incremental_update:(perform_incremental_update_ : perform_incremental_update option)
    ?recipe_arn:(recipe_arn_ : arn option) ?event_type:(event_type_ : event_type option)
    ?solution_config:(solution_config_ : solution_config option) ?tags:(tags_ : tags option)
    ~name:(name_ : name) ~dataset_group_arn:(dataset_group_arn_ : arn) () =
  ({
     name = name_;
     perform_hp_o = perform_hp_o_;
     perform_auto_m_l = perform_auto_m_l_;
     perform_auto_training = perform_auto_training_;
     perform_incremental_update = perform_incremental_update_;
     recipe_arn = recipe_arn_;
     dataset_group_arn = dataset_group_arn_;
     event_type = event_type_;
     solution_config = solution_config_;
     tags = tags_;
   }
    : create_solution_request)

let make_create_schema_response ?schema_arn:(schema_arn_ : arn option) () =
  ({ schema_arn = schema_arn_ } : create_schema_response)

let make_create_schema_request ?domain:(domain_ : domain option) ~name:(name_ : name)
    ~schema:(schema_ : avro_schema) () =
  ({ name = name_; schema = schema_; domain = domain_ } : create_schema_request)

let make_create_recommender_response ?recommender_arn:(recommender_arn_ : arn option) () =
  ({ recommender_arn = recommender_arn_ } : create_recommender_response)

let make_create_recommender_request
    ?recommender_config:(recommender_config_ : recommender_config option)
    ?tags:(tags_ : tags option) ~name:(name_ : name) ~dataset_group_arn:(dataset_group_arn_ : arn)
    ~recipe_arn:(recipe_arn_ : arn) () =
  ({
     name = name_;
     dataset_group_arn = dataset_group_arn_;
     recipe_arn = recipe_arn_;
     recommender_config = recommender_config_;
     tags = tags_;
   }
    : create_recommender_request)

let make_create_metric_attribution_response
    ?metric_attribution_arn:(metric_attribution_arn_ : arn option) () =
  ({ metric_attribution_arn = metric_attribution_arn_ } : create_metric_attribution_response)

let make_create_metric_attribution_request ~name:(name_ : name)
    ~dataset_group_arn:(dataset_group_arn_ : arn) ~metrics:(metrics_ : metric_attributes)
    ~metrics_output_config:(metrics_output_config_ : metric_attribution_output) () =
  ({
     name = name_;
     dataset_group_arn = dataset_group_arn_;
     metrics = metrics_;
     metrics_output_config = metrics_output_config_;
   }
    : create_metric_attribution_request)

let make_create_filter_response ?filter_arn:(filter_arn_ : arn option) () =
  ({ filter_arn = filter_arn_ } : create_filter_response)

let make_create_filter_request ?tags:(tags_ : tags option) ~name:(name_ : name)
    ~dataset_group_arn:(dataset_group_arn_ : arn)
    ~filter_expression:(filter_expression_ : filter_expression) () =
  ({
     name = name_;
     dataset_group_arn = dataset_group_arn_;
     filter_expression = filter_expression_;
     tags = tags_;
   }
    : create_filter_request)

let make_create_event_tracker_response ?event_tracker_arn:(event_tracker_arn_ : arn option)
    ?tracking_id:(tracking_id_ : tracking_id option) () =
  ({ event_tracker_arn = event_tracker_arn_; tracking_id = tracking_id_ }
    : create_event_tracker_response)

let make_create_event_tracker_request ?tags:(tags_ : tags option) ~name:(name_ : name)
    ~dataset_group_arn:(dataset_group_arn_ : arn) () =
  ({ name = name_; dataset_group_arn = dataset_group_arn_; tags = tags_ }
    : create_event_tracker_request)

let make_create_dataset_import_job_response
    ?dataset_import_job_arn:(dataset_import_job_arn_ : arn option) () =
  ({ dataset_import_job_arn = dataset_import_job_arn_ } : create_dataset_import_job_response)

let make_create_dataset_import_job_request ?role_arn:(role_arn_ : role_arn option)
    ?tags:(tags_ : tags option) ?import_mode:(import_mode_ : import_mode option)
    ?publish_attribution_metrics_to_s3:(publish_attribution_metrics_to_s3_ : boolean_ option)
    ~job_name:(job_name_ : name) ~dataset_arn:(dataset_arn_ : arn)
    ~data_source:(data_source_ : data_source) () =
  ({
     job_name = job_name_;
     dataset_arn = dataset_arn_;
     data_source = data_source_;
     role_arn = role_arn_;
     tags = tags_;
     import_mode = import_mode_;
     publish_attribution_metrics_to_s3 = publish_attribution_metrics_to_s3_;
   }
    : create_dataset_import_job_request)

let make_create_dataset_group_response ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?domain:(domain_ : domain option) () =
  ({ dataset_group_arn = dataset_group_arn_; domain = domain_ } : create_dataset_group_response)

let make_create_dataset_group_request ?role_arn:(role_arn_ : role_arn option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ?domain:(domain_ : domain option)
    ?tags:(tags_ : tags option) ~name:(name_ : name) () =
  ({
     name = name_;
     role_arn = role_arn_;
     kms_key_arn = kms_key_arn_;
     domain = domain_;
     tags = tags_;
   }
    : create_dataset_group_request)

let make_create_dataset_export_job_response
    ?dataset_export_job_arn:(dataset_export_job_arn_ : arn option) () =
  ({ dataset_export_job_arn = dataset_export_job_arn_ } : create_dataset_export_job_response)

let make_create_dataset_export_job_request ?ingestion_mode:(ingestion_mode_ : ingestion_mode option)
    ?tags:(tags_ : tags option) ~job_name:(job_name_ : name) ~dataset_arn:(dataset_arn_ : arn)
    ~role_arn:(role_arn_ : role_arn) ~job_output:(job_output_ : dataset_export_job_output) () =
  ({
     job_name = job_name_;
     dataset_arn = dataset_arn_;
     ingestion_mode = ingestion_mode_;
     role_arn = role_arn_;
     job_output = job_output_;
     tags = tags_;
   }
    : create_dataset_export_job_request)

let make_create_dataset_response ?dataset_arn:(dataset_arn_ : arn option) () =
  ({ dataset_arn = dataset_arn_ } : create_dataset_response)

let make_create_dataset_request ?tags:(tags_ : tags option) ~name:(name_ : name)
    ~schema_arn:(schema_arn_ : arn) ~dataset_group_arn:(dataset_group_arn_ : arn)
    ~dataset_type:(dataset_type_ : dataset_type) () =
  ({
     name = name_;
     schema_arn = schema_arn_;
     dataset_group_arn = dataset_group_arn_;
     dataset_type = dataset_type_;
     tags = tags_;
   }
    : create_dataset_request)

let make_create_data_deletion_job_response
    ?data_deletion_job_arn:(data_deletion_job_arn_ : arn option) () =
  ({ data_deletion_job_arn = data_deletion_job_arn_ } : create_data_deletion_job_response)

let make_create_data_deletion_job_request ?tags:(tags_ : tags option) ~job_name:(job_name_ : name)
    ~dataset_group_arn:(dataset_group_arn_ : arn) ~data_source:(data_source_ : data_source)
    ~role_arn:(role_arn_ : role_arn) () =
  ({
     job_name = job_name_;
     dataset_group_arn = dataset_group_arn_;
     data_source = data_source_;
     role_arn = role_arn_;
     tags = tags_;
   }
    : create_data_deletion_job_request)

let make_create_campaign_response ?campaign_arn:(campaign_arn_ : arn option) () =
  ({ campaign_arn = campaign_arn_ } : create_campaign_response)

let make_create_campaign_request
    ?min_provisioned_tp_s:(min_provisioned_tp_s_ : transactions_per_second option)
    ?campaign_config:(campaign_config_ : campaign_config option) ?tags:(tags_ : tags option)
    ~name:(name_ : name) ~solution_version_arn:(solution_version_arn_ : arn) () =
  ({
     name = name_;
     solution_version_arn = solution_version_arn_;
     min_provisioned_tp_s = min_provisioned_tp_s_;
     campaign_config = campaign_config_;
     tags = tags_;
   }
    : create_campaign_request)

let make_create_batch_segment_job_response
    ?batch_segment_job_arn:(batch_segment_job_arn_ : arn option) () =
  ({ batch_segment_job_arn = batch_segment_job_arn_ } : create_batch_segment_job_response)

let make_create_batch_segment_job_request ?filter_arn:(filter_arn_ : arn option)
    ?num_results:(num_results_ : num_batch_results option) ?tags:(tags_ : tags option)
    ~job_name:(job_name_ : name) ~solution_version_arn:(solution_version_arn_ : arn)
    ~job_input:(job_input_ : batch_segment_job_input)
    ~job_output:(job_output_ : batch_segment_job_output) ~role_arn:(role_arn_ : role_arn) () =
  ({
     job_name = job_name_;
     solution_version_arn = solution_version_arn_;
     filter_arn = filter_arn_;
     num_results = num_results_;
     job_input = job_input_;
     job_output = job_output_;
     role_arn = role_arn_;
     tags = tags_;
   }
    : create_batch_segment_job_request)

let make_create_batch_inference_job_response
    ?batch_inference_job_arn:(batch_inference_job_arn_ : arn option) () =
  ({ batch_inference_job_arn = batch_inference_job_arn_ } : create_batch_inference_job_response)

let make_create_batch_inference_job_request ?filter_arn:(filter_arn_ : arn option)
    ?num_results:(num_results_ : num_batch_results option)
    ?batch_inference_job_config:(batch_inference_job_config_ : batch_inference_job_config option)
    ?tags:(tags_ : tags option)
    ?batch_inference_job_mode:(batch_inference_job_mode_ : batch_inference_job_mode option)
    ?theme_generation_config:(theme_generation_config_ : theme_generation_config option)
    ~job_name:(job_name_ : name) ~solution_version_arn:(solution_version_arn_ : arn)
    ~job_input:(job_input_ : batch_inference_job_input)
    ~job_output:(job_output_ : batch_inference_job_output) ~role_arn:(role_arn_ : role_arn) () =
  ({
     job_name = job_name_;
     solution_version_arn = solution_version_arn_;
     filter_arn = filter_arn_;
     num_results = num_results_;
     job_input = job_input_;
     job_output = job_output_;
     role_arn = role_arn_;
     batch_inference_job_config = batch_inference_job_config_;
     tags = tags_;
     batch_inference_job_mode = batch_inference_job_mode_;
     theme_generation_config = theme_generation_config_;
   }
    : create_batch_inference_job_request)
