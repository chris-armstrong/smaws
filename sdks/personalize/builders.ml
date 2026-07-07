open Types

let make_update_solution_response ?solution_arn:(solution_arn_ : arn option) () =
  ({ solution_arn = solution_arn_ } : update_solution_response)

let make_auto_training_config
    ?scheduling_expression:(scheduling_expression_ : scheduling_expression option) () =
  ({ scheduling_expression = scheduling_expression_ } : auto_training_config)

let make_event_parameters ?weight:(weight_ : event_type_weight option)
    ?event_value_threshold:(event_value_threshold_ : event_type_threshold_value option)
    ?event_type:(event_type_ : event_type option) () =
  ({ weight = weight_; event_value_threshold = event_value_threshold_; event_type = event_type_ }
    : event_parameters)

let make_events_config
    ?event_parameters_list:(event_parameters_list_ : event_parameters_list option) () =
  ({ event_parameters_list = event_parameters_list_ } : events_config)

let make_solution_update_config ?events_config:(events_config_ : events_config option)
    ?auto_training_config:(auto_training_config_ : auto_training_config option) () =
  ({ events_config = events_config_; auto_training_config = auto_training_config_ }
    : solution_update_config)

let make_update_solution_request
    ?solution_update_config:(solution_update_config_ : solution_update_config option)
    ?perform_incremental_update:(perform_incremental_update_ : perform_incremental_update option)
    ?perform_auto_training:(perform_auto_training_ : perform_auto_training option)
    ~solution_arn:(solution_arn_ : arn) () =
  ({
     solution_update_config = solution_update_config_;
     perform_incremental_update = perform_incremental_update_;
     perform_auto_training = perform_auto_training_;
     solution_arn = solution_arn_;
   }
    : update_solution_request)

let make_update_recommender_response ?recommender_arn:(recommender_arn_ : arn option) () =
  ({ recommender_arn = recommender_arn_ } : update_recommender_response)

let make_training_data_config
    ?included_dataset_columns:(included_dataset_columns_ : included_dataset_columns option)
    ?excluded_dataset_columns:(excluded_dataset_columns_ : excluded_dataset_columns option) () =
  ({
     included_dataset_columns = included_dataset_columns_;
     excluded_dataset_columns = excluded_dataset_columns_;
   }
    : training_data_config)

let make_recommender_config
    ?enable_metadata_with_recommendations:(enable_metadata_with_recommendations_ : boolean_ option)
    ?training_data_config:(training_data_config_ : training_data_config option)
    ?min_recommendation_requests_per_second:
      (min_recommendation_requests_per_second_ : transactions_per_second option)
    ?item_exploration_config:(item_exploration_config_ : hyper_parameters option) () =
  ({
     enable_metadata_with_recommendations = enable_metadata_with_recommendations_;
     training_data_config = training_data_config_;
     min_recommendation_requests_per_second = min_recommendation_requests_per_second_;
     item_exploration_config = item_exploration_config_;
   }
    : recommender_config)

let make_update_recommender_request ~recommender_config:(recommender_config_ : recommender_config)
    ~recommender_arn:(recommender_arn_ : arn) () =
  ({ recommender_config = recommender_config_; recommender_arn = recommender_arn_ }
    : update_recommender_request)

let make_update_metric_attribution_response
    ?metric_attribution_arn:(metric_attribution_arn_ : arn option) () =
  ({ metric_attribution_arn = metric_attribution_arn_ } : update_metric_attribution_response)

let make_metric_attribute ~expression:(expression_ : metric_expression)
    ~metric_name:(metric_name_ : metric_name) ~event_type:(event_type_ : event_type) () =
  ({ expression = expression_; metric_name = metric_name_; event_type = event_type_ }
    : metric_attribute)

let make_s3_data_config ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ~path:(path_ : s3_location)
    () =
  ({ kms_key_arn = kms_key_arn_; path = path_ } : s3_data_config)

let make_metric_attribution_output
    ?s3_data_destination:(s3_data_destination_ : s3_data_config option)
    ~role_arn:(role_arn_ : role_arn) () =
  ({ role_arn = role_arn_; s3_data_destination = s3_data_destination_ } : metric_attribution_output)

let make_update_metric_attribution_request
    ?metric_attribution_arn:(metric_attribution_arn_ : arn option)
    ?metrics_output_config:(metrics_output_config_ : metric_attribution_output option)
    ?remove_metrics:(remove_metrics_ : metric_attributes_names_list option)
    ?add_metrics:(add_metrics_ : metric_attributes option) () =
  ({
     metric_attribution_arn = metric_attribution_arn_;
     metrics_output_config = metrics_output_config_;
     remove_metrics = remove_metrics_;
     add_metrics = add_metrics_;
   }
    : update_metric_attribution_request)

let make_update_dataset_response ?dataset_arn:(dataset_arn_ : arn option) () =
  ({ dataset_arn = dataset_arn_ } : update_dataset_response)

let make_update_dataset_request ~schema_arn:(schema_arn_ : arn) ~dataset_arn:(dataset_arn_ : arn) ()
    =
  ({ schema_arn = schema_arn_; dataset_arn = dataset_arn_ } : update_dataset_request)

let make_update_campaign_response ?campaign_arn:(campaign_arn_ : arn option) () =
  ({ campaign_arn = campaign_arn_ } : update_campaign_response)

let make_campaign_config ?ranking_influence:(ranking_influence_ : ranking_influence option)
    ?sync_with_latest_solution_version:(sync_with_latest_solution_version_ : boolean_ option)
    ?enable_metadata_with_recommendations:(enable_metadata_with_recommendations_ : boolean_ option)
    ?item_exploration_config:(item_exploration_config_ : hyper_parameters option) () =
  ({
     ranking_influence = ranking_influence_;
     sync_with_latest_solution_version = sync_with_latest_solution_version_;
     enable_metadata_with_recommendations = enable_metadata_with_recommendations_;
     item_exploration_config = item_exploration_config_;
   }
    : campaign_config)

let make_update_campaign_request ?campaign_config:(campaign_config_ : campaign_config option)
    ?min_provisioned_tp_s:(min_provisioned_tp_s_ : transactions_per_second option)
    ?solution_version_arn:(solution_version_arn_ : arn option) ~campaign_arn:(campaign_arn_ : arn)
    () =
  ({
     campaign_config = campaign_config_;
     min_provisioned_tp_s = min_provisioned_tp_s_;
     solution_version_arn = solution_version_arn_;
     campaign_arn = campaign_arn_;
   }
    : update_campaign_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_keys) ~resource_arn:(resource_arn_ : arn)
    () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_tuned_hpo_params
    ?algorithm_hyper_parameters:(algorithm_hyper_parameters_ : hyper_parameters option) () =
  ({ algorithm_hyper_parameters = algorithm_hyper_parameters_ } : tuned_hpo_params)

let make_fields_for_theme_generation ~item_name:(item_name_ : column_name) () =
  ({ item_name = item_name_ } : fields_for_theme_generation)

let make_theme_generation_config
    ~fields_for_theme_generation:(fields_for_theme_generation_ : fields_for_theme_generation) () =
  ({ fields_for_theme_generation = fields_for_theme_generation_ } : theme_generation_config)

let make_tag ~tag_value:(tag_value_ : tag_value) ~tag_key:(tag_key_ : tag_key) () =
  ({ tag_value = tag_value_; tag_key = tag_key_ } : tag)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tags) ~resource_arn:(resource_arn_ : arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

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

let make_solution_summary ?recipe_arn:(recipe_arn_ : arn option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?solution_arn:(solution_arn_ : arn option) ?name:(name_ : name option) () =
  ({
     recipe_arn = recipe_arn_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     solution_arn = solution_arn_;
     name = name_;
   }
    : solution_summary)

let make_solution_version_summary ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?training_type:(training_type_ : training_type option)
    ?training_mode:(training_mode_ : training_mode option) ?status:(status_ : status option)
    ?solution_version_arn:(solution_version_arn_ : arn option) () =
  ({
     failure_reason = failure_reason_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     training_type = training_type_;
     training_mode = training_mode_;
     status = status_;
     solution_version_arn = solution_version_arn_;
   }
    : solution_version_summary)

let make_hpo_objective ?metric_regex:(metric_regex_ : metric_regex option)
    ?metric_name:(metric_name_ : metric_name option) ?type_:(type__ : hpo_objective_type option) ()
    =
  ({ metric_regex = metric_regex_; metric_name = metric_name_; type_ = type__ } : hpo_objective)

let make_hpo_resource_config
    ?max_parallel_training_jobs:(max_parallel_training_jobs_ : hpo_resource option)
    ?max_number_of_training_jobs:(max_number_of_training_jobs_ : hpo_resource option) () =
  ({
     max_parallel_training_jobs = max_parallel_training_jobs_;
     max_number_of_training_jobs = max_number_of_training_jobs_;
   }
    : hpo_resource_config)

let make_integer_hyper_parameter_range ?max_value:(max_value_ : integer_max_value option)
    ?min_value:(min_value_ : integer_min_value option) ?name:(name_ : parameter_name option) () =
  ({ max_value = max_value_; min_value = min_value_; name = name_ } : integer_hyper_parameter_range)

let make_continuous_hyper_parameter_range ?max_value:(max_value_ : continuous_max_value option)
    ?min_value:(min_value_ : continuous_min_value option) ?name:(name_ : parameter_name option) () =
  ({ max_value = max_value_; min_value = min_value_; name = name_ }
    : continuous_hyper_parameter_range)

let make_categorical_hyper_parameter_range ?values:(values_ : categorical_values option)
    ?name:(name_ : parameter_name option) () =
  ({ values = values_; name = name_ } : categorical_hyper_parameter_range)

let make_hyper_parameter_ranges
    ?categorical_hyper_parameter_ranges:
      (categorical_hyper_parameter_ranges_ : categorical_hyper_parameter_ranges option)
    ?continuous_hyper_parameter_ranges:
      (continuous_hyper_parameter_ranges_ : continuous_hyper_parameter_ranges option)
    ?integer_hyper_parameter_ranges:
      (integer_hyper_parameter_ranges_ : integer_hyper_parameter_ranges option) () =
  ({
     categorical_hyper_parameter_ranges = categorical_hyper_parameter_ranges_;
     continuous_hyper_parameter_ranges = continuous_hyper_parameter_ranges_;
     integer_hyper_parameter_ranges = integer_hyper_parameter_ranges_;
   }
    : hyper_parameter_ranges)

let make_hpo_config
    ?algorithm_hyper_parameter_ranges:
      (algorithm_hyper_parameter_ranges_ : hyper_parameter_ranges option)
    ?hpo_resource_config:(hpo_resource_config_ : hpo_resource_config option)
    ?hpo_objective:(hpo_objective_ : hpo_objective option) () =
  ({
     algorithm_hyper_parameter_ranges = algorithm_hyper_parameter_ranges_;
     hpo_resource_config = hpo_resource_config_;
     hpo_objective = hpo_objective_;
   }
    : hpo_config)

let make_auto_ml_config ?recipe_list:(recipe_list_ : arn_list option)
    ?metric_name:(metric_name_ : metric_name option) () =
  ({ recipe_list = recipe_list_; metric_name = metric_name_ } : auto_ml_config)

let make_optimization_objective
    ?objective_sensitivity:(objective_sensitivity_ : objective_sensitivity option)
    ?item_attribute:(item_attribute_ : item_attribute option) () =
  ({ objective_sensitivity = objective_sensitivity_; item_attribute = item_attribute_ }
    : optimization_objective)

let make_solution_config ?auto_training_config:(auto_training_config_ : auto_training_config option)
    ?training_data_config:(training_data_config_ : training_data_config option)
    ?optimization_objective:(optimization_objective_ : optimization_objective option)
    ?events_config:(events_config_ : events_config option)
    ?auto_ml_config:(auto_ml_config_ : auto_ml_config option)
    ?feature_transformation_parameters:
      (feature_transformation_parameters_ : feature_transformation_parameters option)
    ?algorithm_hyper_parameters:(algorithm_hyper_parameters_ : hyper_parameters option)
    ?hpo_config:(hpo_config_ : hpo_config option)
    ?event_value_threshold:(event_value_threshold_ : event_value_threshold option) () =
  ({
     auto_training_config = auto_training_config_;
     training_data_config = training_data_config_;
     optimization_objective = optimization_objective_;
     events_config = events_config_;
     auto_ml_config = auto_ml_config_;
     feature_transformation_parameters = feature_transformation_parameters_;
     algorithm_hyper_parameters = algorithm_hyper_parameters_;
     hpo_config = hpo_config_;
     event_value_threshold = event_value_threshold_;
   }
    : solution_config)

let make_solution_version ?training_type:(training_type_ : training_type option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option) ?status:(status_ : status option)
    ?tuned_hpo_params:(tuned_hpo_params_ : tuned_hpo_params option)
    ?training_mode:(training_mode_ : training_mode option)
    ?training_hours:(training_hours_ : training_hours option)
    ?solution_config:(solution_config_ : solution_config option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?event_type:(event_type_ : event_type option) ?recipe_arn:(recipe_arn_ : arn option)
    ?perform_incremental_update:(perform_incremental_update_ : perform_incremental_update option)
    ?perform_auto_m_l:(perform_auto_m_l_ : perform_auto_m_l option)
    ?perform_hp_o:(perform_hp_o_ : perform_hp_o option) ?solution_arn:(solution_arn_ : arn option)
    ?solution_version_arn:(solution_version_arn_ : arn option) ?name:(name_ : name option) () =
  ({
     training_type = training_type_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     failure_reason = failure_reason_;
     status = status_;
     tuned_hpo_params = tuned_hpo_params_;
     training_mode = training_mode_;
     training_hours = training_hours_;
     solution_config = solution_config_;
     dataset_group_arn = dataset_group_arn_;
     event_type = event_type_;
     recipe_arn = recipe_arn_;
     perform_incremental_update = perform_incremental_update_;
     perform_auto_m_l = perform_auto_m_l_;
     perform_hp_o = perform_hp_o_;
     solution_arn = solution_arn_;
     solution_version_arn = solution_version_arn_;
     name = name_;
   }
    : solution_version)

let make_solution_update_summary ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?perform_incremental_update:(perform_incremental_update_ : perform_incremental_update option)
    ?perform_auto_training:(perform_auto_training_ : perform_auto_training option)
    ?status:(status_ : status option)
    ?solution_update_config:(solution_update_config_ : solution_update_config option) () =
  ({
     failure_reason = failure_reason_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     perform_incremental_update = perform_incremental_update_;
     perform_auto_training = perform_auto_training_;
     status = status_;
     solution_update_config = solution_update_config_;
   }
    : solution_update_summary)

let make_solution ?latest_solution_update:(latest_solution_update_ : solution_update_summary option)
    ?latest_solution_version:(latest_solution_version_ : solution_version_summary option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?auto_ml_result:(auto_ml_result_ : auto_ml_result option)
    ?solution_config:(solution_config_ : solution_config option)
    ?event_type:(event_type_ : event_type option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) ?recipe_arn:(recipe_arn_ : arn option)
    ?perform_incremental_update:(perform_incremental_update_ : perform_incremental_update option)
    ?perform_auto_training:(perform_auto_training_ : perform_auto_training option)
    ?perform_auto_m_l:(perform_auto_m_l_ : perform_auto_m_l option)
    ?perform_hp_o:(perform_hp_o_ : perform_hp_o option) ?solution_arn:(solution_arn_ : arn option)
    ?name:(name_ : name option) () =
  ({
     latest_solution_update = latest_solution_update_;
     latest_solution_version = latest_solution_version_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     auto_ml_result = auto_ml_result_;
     solution_config = solution_config_;
     event_type = event_type_;
     dataset_group_arn = dataset_group_arn_;
     recipe_arn = recipe_arn_;
     perform_incremental_update = perform_incremental_update_;
     perform_auto_training = perform_auto_training_;
     perform_auto_m_l = perform_auto_m_l_;
     perform_hp_o = perform_hp_o_;
     solution_arn = solution_arn_;
     name = name_;
   }
    : solution)

let make_dataset_schema_summary ?domain:(domain_ : domain option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?schema_arn:(schema_arn_ : arn option)
    ?name:(name_ : name option) () =
  ({
     domain = domain_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     schema_arn = schema_arn_;
     name = name_;
   }
    : dataset_schema_summary)

let make_recommender_summary ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?recommender_config:(recommender_config_ : recommender_config option)
    ?recipe_arn:(recipe_arn_ : arn option) ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?recommender_arn:(recommender_arn_ : arn option) ?name:(name_ : name option) () =
  ({
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     recommender_config = recommender_config_;
     recipe_arn = recipe_arn_;
     dataset_group_arn = dataset_group_arn_;
     recommender_arn = recommender_arn_;
     name = name_;
   }
    : recommender_summary)

let make_recommender_update_summary ?failure_reason:(failure_reason_ : failure_reason option)
    ?status:(status_ : status option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?recommender_config:(recommender_config_ : recommender_config option) () =
  ({
     failure_reason = failure_reason_;
     status = status_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     recommender_config = recommender_config_;
   }
    : recommender_update_summary)

let make_recommender ?model_metrics:(model_metrics_ : metrics option)
    ?latest_recommender_update:(latest_recommender_update_ : recommender_update_summary option)
    ?failure_reason:(failure_reason_ : failure_reason option) ?status:(status_ : status option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?recommender_config:(recommender_config_ : recommender_config option)
    ?recipe_arn:(recipe_arn_ : arn option) ?name:(name_ : name option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?recommender_arn:(recommender_arn_ : arn option) () =
  ({
     model_metrics = model_metrics_;
     latest_recommender_update = latest_recommender_update_;
     failure_reason = failure_reason_;
     status = status_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     recommender_config = recommender_config_;
     recipe_arn = recipe_arn_;
     name = name_;
     dataset_group_arn = dataset_group_arn_;
     recommender_arn = recommender_arn_;
   }
    : recommender)

let make_recipe_summary ?domain:(domain_ : domain option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?recipe_arn:(recipe_arn_ : arn option) ?name:(name_ : name option) () =
  ({
     domain = domain_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     recipe_arn = recipe_arn_;
     name = name_;
   }
    : recipe_summary)

let make_recipe ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?recipe_type:(recipe_type_ : recipe_type option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?description:(description_ : description option) ?status:(status_ : status option)
    ?feature_transformation_arn:(feature_transformation_arn_ : arn option)
    ?algorithm_arn:(algorithm_arn_ : arn option) ?recipe_arn:(recipe_arn_ : arn option)
    ?name:(name_ : name option) () =
  ({
     last_updated_date_time = last_updated_date_time_;
     recipe_type = recipe_type_;
     creation_date_time = creation_date_time_;
     description = description_;
     status = status_;
     feature_transformation_arn = feature_transformation_arn_;
     algorithm_arn = algorithm_arn_;
     recipe_arn = recipe_arn_;
     name = name_;
   }
    : recipe)

let make_metric_attribution_summary ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?metric_attribution_arn:(metric_attribution_arn_ : arn option) ?name:(name_ : name option) () =
  ({
     failure_reason = failure_reason_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     metric_attribution_arn = metric_attribution_arn_;
     name = name_;
   }
    : metric_attribution_summary)

let make_metric_attribution ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?metrics_output_config:(metrics_output_config_ : metric_attribution_output option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?metric_attribution_arn:(metric_attribution_arn_ : arn option) ?name:(name_ : name option) () =
  ({
     failure_reason = failure_reason_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     metrics_output_config = metrics_output_config_;
     dataset_group_arn = dataset_group_arn_;
     metric_attribution_arn = metric_attribution_arn_;
     name = name_;
   }
    : metric_attribution)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_solutions_response ?next_token:(next_token_ : next_token option)
    ?solutions:(solutions_ : solutions option) () =
  ({ next_token = next_token_; solutions = solutions_ } : list_solutions_response)

let make_list_solutions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) () =
  ({ max_results = max_results_; next_token = next_token_; dataset_group_arn = dataset_group_arn_ }
    : list_solutions_request)

let make_list_solution_versions_response ?next_token:(next_token_ : next_token option)
    ?solution_versions:(solution_versions_ : solution_versions option) () =
  ({ next_token = next_token_; solution_versions = solution_versions_ }
    : list_solution_versions_response)

let make_list_solution_versions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?solution_arn:(solution_arn_ : arn option) () =
  ({ max_results = max_results_; next_token = next_token_; solution_arn = solution_arn_ }
    : list_solution_versions_request)

let make_list_schemas_response ?next_token:(next_token_ : next_token option)
    ?schemas:(schemas_ : schemas option) () =
  ({ next_token = next_token_; schemas = schemas_ } : list_schemas_response)

let make_list_schemas_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_schemas_request)

let make_list_recommenders_response ?next_token:(next_token_ : next_token option)
    ?recommenders:(recommenders_ : recommenders option) () =
  ({ next_token = next_token_; recommenders = recommenders_ } : list_recommenders_response)

let make_list_recommenders_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) () =
  ({ max_results = max_results_; next_token = next_token_; dataset_group_arn = dataset_group_arn_ }
    : list_recommenders_request)

let make_list_recipes_response ?next_token:(next_token_ : next_token option)
    ?recipes:(recipes_ : recipes option) () =
  ({ next_token = next_token_; recipes = recipes_ } : list_recipes_response)

let make_list_recipes_request ?domain:(domain_ : domain option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?recipe_provider:(recipe_provider_ : recipe_provider option) () =
  ({
     domain = domain_;
     max_results = max_results_;
     next_token = next_token_;
     recipe_provider = recipe_provider_;
   }
    : list_recipes_request)

let make_list_metric_attributions_response ?next_token:(next_token_ : next_token option)
    ?metric_attributions:(metric_attributions_ : metric_attributions option) () =
  ({ next_token = next_token_; metric_attributions = metric_attributions_ }
    : list_metric_attributions_response)

let make_list_metric_attributions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) () =
  ({ max_results = max_results_; next_token = next_token_; dataset_group_arn = dataset_group_arn_ }
    : list_metric_attributions_request)

let make_list_metric_attribution_metrics_response ?next_token:(next_token_ : next_token option)
    ?metrics:(metrics_ : metric_attributes option) () =
  ({ next_token = next_token_; metrics = metrics_ } : list_metric_attribution_metrics_response)

let make_list_metric_attribution_metrics_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?metric_attribution_arn:(metric_attribution_arn_ : arn option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     metric_attribution_arn = metric_attribution_arn_;
   }
    : list_metric_attribution_metrics_request)

let make_filter_summary ?status:(status_ : status option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?filter_arn:(filter_arn_ : arn option)
    ?name:(name_ : name option) () =
  ({
     status = status_;
     failure_reason = failure_reason_;
     dataset_group_arn = dataset_group_arn_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     filter_arn = filter_arn_;
     name = name_;
   }
    : filter_summary)

let make_list_filters_response ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : filters option) () =
  ({ next_token = next_token_; filters = filters_ } : list_filters_response)

let make_list_filters_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) () =
  ({ max_results = max_results_; next_token = next_token_; dataset_group_arn = dataset_group_arn_ }
    : list_filters_request)

let make_event_tracker_summary ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?event_tracker_arn:(event_tracker_arn_ : arn option) ?name:(name_ : name option) () =
  ({
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     event_tracker_arn = event_tracker_arn_;
     name = name_;
   }
    : event_tracker_summary)

let make_list_event_trackers_response ?next_token:(next_token_ : next_token option)
    ?event_trackers:(event_trackers_ : event_trackers option) () =
  ({ next_token = next_token_; event_trackers = event_trackers_ } : list_event_trackers_response)

let make_list_event_trackers_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) () =
  ({ max_results = max_results_; next_token = next_token_; dataset_group_arn = dataset_group_arn_ }
    : list_event_trackers_request)

let make_dataset_summary ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?dataset_type:(dataset_type_ : dataset_type option) ?dataset_arn:(dataset_arn_ : arn option)
    ?name:(name_ : name option) () =
  ({
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     dataset_type = dataset_type_;
     dataset_arn = dataset_arn_;
     name = name_;
   }
    : dataset_summary)

let make_list_datasets_response ?next_token:(next_token_ : next_token option)
    ?datasets:(datasets_ : datasets option) () =
  ({ next_token = next_token_; datasets = datasets_ } : list_datasets_response)

let make_list_datasets_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) () =
  ({ max_results = max_results_; next_token = next_token_; dataset_group_arn = dataset_group_arn_ }
    : list_datasets_request)

let make_dataset_import_job_summary ?import_mode:(import_mode_ : import_mode option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?job_name:(job_name_ : name option)
    ?dataset_import_job_arn:(dataset_import_job_arn_ : arn option) () =
  ({
     import_mode = import_mode_;
     failure_reason = failure_reason_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     job_name = job_name_;
     dataset_import_job_arn = dataset_import_job_arn_;
   }
    : dataset_import_job_summary)

let make_list_dataset_import_jobs_response ?next_token:(next_token_ : next_token option)
    ?dataset_import_jobs:(dataset_import_jobs_ : dataset_import_jobs option) () =
  ({ next_token = next_token_; dataset_import_jobs = dataset_import_jobs_ }
    : list_dataset_import_jobs_response)

let make_list_dataset_import_jobs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?dataset_arn:(dataset_arn_ : arn option) () =
  ({ max_results = max_results_; next_token = next_token_; dataset_arn = dataset_arn_ }
    : list_dataset_import_jobs_request)

let make_dataset_group_summary ?domain:(domain_ : domain option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) ?name:(name_ : name option) () =
  ({
     domain = domain_;
     failure_reason = failure_reason_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     dataset_group_arn = dataset_group_arn_;
     name = name_;
   }
    : dataset_group_summary)

let make_list_dataset_groups_response ?next_token:(next_token_ : next_token option)
    ?dataset_groups:(dataset_groups_ : dataset_groups option) () =
  ({ next_token = next_token_; dataset_groups = dataset_groups_ } : list_dataset_groups_response)

let make_list_dataset_groups_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_dataset_groups_request)

let make_dataset_export_job_summary ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?job_name:(job_name_ : name option)
    ?dataset_export_job_arn:(dataset_export_job_arn_ : arn option) () =
  ({
     failure_reason = failure_reason_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     job_name = job_name_;
     dataset_export_job_arn = dataset_export_job_arn_;
   }
    : dataset_export_job_summary)

let make_list_dataset_export_jobs_response ?next_token:(next_token_ : next_token option)
    ?dataset_export_jobs:(dataset_export_jobs_ : dataset_export_jobs option) () =
  ({ next_token = next_token_; dataset_export_jobs = dataset_export_jobs_ }
    : list_dataset_export_jobs_response)

let make_list_dataset_export_jobs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?dataset_arn:(dataset_arn_ : arn option) () =
  ({ max_results = max_results_; next_token = next_token_; dataset_arn = dataset_arn_ }
    : list_dataset_export_jobs_request)

let make_data_deletion_job_summary ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?job_name:(job_name_ : name option) ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?data_deletion_job_arn:(data_deletion_job_arn_ : arn option) () =
  ({
     failure_reason = failure_reason_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     job_name = job_name_;
     dataset_group_arn = dataset_group_arn_;
     data_deletion_job_arn = data_deletion_job_arn_;
   }
    : data_deletion_job_summary)

let make_list_data_deletion_jobs_response ?next_token:(next_token_ : next_token option)
    ?data_deletion_jobs:(data_deletion_jobs_ : data_deletion_jobs option) () =
  ({ next_token = next_token_; data_deletion_jobs = data_deletion_jobs_ }
    : list_data_deletion_jobs_response)

let make_list_data_deletion_jobs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) () =
  ({ max_results = max_results_; next_token = next_token_; dataset_group_arn = dataset_group_arn_ }
    : list_data_deletion_jobs_request)

let make_campaign_summary ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?campaign_arn:(campaign_arn_ : arn option) ?name:(name_ : name option) () =
  ({
     failure_reason = failure_reason_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     campaign_arn = campaign_arn_;
     name = name_;
   }
    : campaign_summary)

let make_list_campaigns_response ?next_token:(next_token_ : next_token option)
    ?campaigns:(campaigns_ : campaigns option) () =
  ({ next_token = next_token_; campaigns = campaigns_ } : list_campaigns_response)

let make_list_campaigns_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?solution_arn:(solution_arn_ : arn option) () =
  ({ max_results = max_results_; next_token = next_token_; solution_arn = solution_arn_ }
    : list_campaigns_request)

let make_batch_segment_job_summary ?solution_version_arn:(solution_version_arn_ : arn option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?job_name:(job_name_ : name option) ?batch_segment_job_arn:(batch_segment_job_arn_ : arn option)
    () =
  ({
     solution_version_arn = solution_version_arn_;
     failure_reason = failure_reason_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     job_name = job_name_;
     batch_segment_job_arn = batch_segment_job_arn_;
   }
    : batch_segment_job_summary)

let make_list_batch_segment_jobs_response ?next_token:(next_token_ : next_token option)
    ?batch_segment_jobs:(batch_segment_jobs_ : batch_segment_jobs option) () =
  ({ next_token = next_token_; batch_segment_jobs = batch_segment_jobs_ }
    : list_batch_segment_jobs_response)

let make_list_batch_segment_jobs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?solution_version_arn:(solution_version_arn_ : arn option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     solution_version_arn = solution_version_arn_;
   }
    : list_batch_segment_jobs_request)

let make_batch_inference_job_summary
    ?batch_inference_job_mode:(batch_inference_job_mode_ : batch_inference_job_mode option)
    ?solution_version_arn:(solution_version_arn_ : arn option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?job_name:(job_name_ : name option)
    ?batch_inference_job_arn:(batch_inference_job_arn_ : arn option) () =
  ({
     batch_inference_job_mode = batch_inference_job_mode_;
     solution_version_arn = solution_version_arn_;
     failure_reason = failure_reason_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     job_name = job_name_;
     batch_inference_job_arn = batch_inference_job_arn_;
   }
    : batch_inference_job_summary)

let make_list_batch_inference_jobs_response ?next_token:(next_token_ : next_token option)
    ?batch_inference_jobs:(batch_inference_jobs_ : batch_inference_jobs option) () =
  ({ next_token = next_token_; batch_inference_jobs = batch_inference_jobs_ }
    : list_batch_inference_jobs_response)

let make_list_batch_inference_jobs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?solution_version_arn:(solution_version_arn_ : arn option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     solution_version_arn = solution_version_arn_;
   }
    : list_batch_inference_jobs_request)

let make_get_solution_metrics_response ?metrics:(metrics_ : metrics option)
    ?solution_version_arn:(solution_version_arn_ : arn option) () =
  ({ metrics = metrics_; solution_version_arn = solution_version_arn_ }
    : get_solution_metrics_response)

let make_get_solution_metrics_request ~solution_version_arn:(solution_version_arn_ : arn) () =
  ({ solution_version_arn = solution_version_arn_ } : get_solution_metrics_request)

let make_filter ?status:(status_ : status option)
    ?filter_expression:(filter_expression_ : filter_expression option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?filter_arn:(filter_arn_ : arn option)
    ?name:(name_ : name option) () =
  ({
     status = status_;
     filter_expression = filter_expression_;
     failure_reason = failure_reason_;
     dataset_group_arn = dataset_group_arn_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     filter_arn = filter_arn_;
     name = name_;
   }
    : filter)

let make_feature_transformation ?status:(status_ : status option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?default_parameters:(default_parameters_ : featurization_parameters option)
    ?feature_transformation_arn:(feature_transformation_arn_ : arn option)
    ?name:(name_ : name option) () =
  ({
     status = status_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     default_parameters = default_parameters_;
     feature_transformation_arn = feature_transformation_arn_;
     name = name_;
   }
    : feature_transformation)

let make_event_tracker ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?tracking_id:(tracking_id_ : tracking_id option) ?account_id:(account_id_ : account_id option)
    ?event_tracker_arn:(event_tracker_arn_ : arn option) ?name:(name_ : name option) () =
  ({
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     dataset_group_arn = dataset_group_arn_;
     tracking_id = tracking_id_;
     account_id = account_id_;
     event_tracker_arn = event_tracker_arn_;
     name = name_;
   }
    : event_tracker)

let make_describe_solution_version_response
    ?solution_version:(solution_version_ : solution_version option) () =
  ({ solution_version = solution_version_ } : describe_solution_version_response)

let make_describe_solution_version_request ~solution_version_arn:(solution_version_arn_ : arn) () =
  ({ solution_version_arn = solution_version_arn_ } : describe_solution_version_request)

let make_describe_solution_response ?solution:(solution_ : solution option) () =
  ({ solution = solution_ } : describe_solution_response)

let make_describe_solution_request ~solution_arn:(solution_arn_ : arn) () =
  ({ solution_arn = solution_arn_ } : describe_solution_request)

let make_dataset_schema ?domain:(domain_ : domain option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?schema:(schema_ : avro_schema option)
    ?schema_arn:(schema_arn_ : arn option) ?name:(name_ : name option) () =
  ({
     domain = domain_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     schema = schema_;
     schema_arn = schema_arn_;
     name = name_;
   }
    : dataset_schema)

let make_describe_schema_response ?schema:(schema_ : dataset_schema option) () =
  ({ schema = schema_ } : describe_schema_response)

let make_describe_schema_request ~schema_arn:(schema_arn_ : arn) () =
  ({ schema_arn = schema_arn_ } : describe_schema_request)

let make_describe_recommender_response ?recommender:(recommender_ : recommender option) () =
  ({ recommender = recommender_ } : describe_recommender_response)

let make_describe_recommender_request ~recommender_arn:(recommender_arn_ : arn) () =
  ({ recommender_arn = recommender_arn_ } : describe_recommender_request)

let make_describe_recipe_response ?recipe:(recipe_ : recipe option) () =
  ({ recipe = recipe_ } : describe_recipe_response)

let make_describe_recipe_request ~recipe_arn:(recipe_arn_ : arn) () =
  ({ recipe_arn = recipe_arn_ } : describe_recipe_request)

let make_describe_metric_attribution_response
    ?metric_attribution:(metric_attribution_ : metric_attribution option) () =
  ({ metric_attribution = metric_attribution_ } : describe_metric_attribution_response)

let make_describe_metric_attribution_request ~metric_attribution_arn:(metric_attribution_arn_ : arn)
    () =
  ({ metric_attribution_arn = metric_attribution_arn_ } : describe_metric_attribution_request)

let make_describe_filter_response ?filter:(filter_ : filter option) () =
  ({ filter = filter_ } : describe_filter_response)

let make_describe_filter_request ~filter_arn:(filter_arn_ : arn) () =
  ({ filter_arn = filter_arn_ } : describe_filter_request)

let make_describe_feature_transformation_response
    ?feature_transformation:(feature_transformation_ : feature_transformation option) () =
  ({ feature_transformation = feature_transformation_ } : describe_feature_transformation_response)

let make_describe_feature_transformation_request
    ~feature_transformation_arn:(feature_transformation_arn_ : arn) () =
  ({ feature_transformation_arn = feature_transformation_arn_ }
    : describe_feature_transformation_request)

let make_describe_event_tracker_response ?event_tracker:(event_tracker_ : event_tracker option) () =
  ({ event_tracker = event_tracker_ } : describe_event_tracker_response)

let make_describe_event_tracker_request ~event_tracker_arn:(event_tracker_arn_ : arn) () =
  ({ event_tracker_arn = event_tracker_arn_ } : describe_event_tracker_request)

let make_dataset_update_summary ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option) ?status:(status_ : status option)
    ?schema_arn:(schema_arn_ : arn option) () =
  ({
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     failure_reason = failure_reason_;
     status = status_;
     schema_arn = schema_arn_;
   }
    : dataset_update_summary)

let make_dataset ?tracking_id:(tracking_id_ : tracking_id option)
    ?latest_dataset_update:(latest_dataset_update_ : dataset_update_summary option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?schema_arn:(schema_arn_ : arn option) ?dataset_type:(dataset_type_ : dataset_type option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) ?dataset_arn:(dataset_arn_ : arn option)
    ?name:(name_ : name option) () =
  ({
     tracking_id = tracking_id_;
     latest_dataset_update = latest_dataset_update_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     schema_arn = schema_arn_;
     dataset_type = dataset_type_;
     dataset_group_arn = dataset_group_arn_;
     dataset_arn = dataset_arn_;
     name = name_;
   }
    : dataset)

let make_describe_dataset_response ?dataset:(dataset_ : dataset option) () =
  ({ dataset = dataset_ } : describe_dataset_response)

let make_describe_dataset_request ~dataset_arn:(dataset_arn_ : arn) () =
  ({ dataset_arn = dataset_arn_ } : describe_dataset_request)

let make_data_source ?data_location:(data_location_ : s3_location option) () =
  ({ data_location = data_location_ } : data_source)

let make_dataset_import_job
    ?publish_attribution_metrics_to_s3:(publish_attribution_metrics_to_s3_ : boolean_ option)
    ?import_mode:(import_mode_ : import_mode option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?role_arn:(role_arn_ : arn option) ?data_source:(data_source_ : data_source option)
    ?dataset_arn:(dataset_arn_ : arn option)
    ?dataset_import_job_arn:(dataset_import_job_arn_ : arn option)
    ?job_name:(job_name_ : name option) () =
  ({
     publish_attribution_metrics_to_s3 = publish_attribution_metrics_to_s3_;
     import_mode = import_mode_;
     failure_reason = failure_reason_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     role_arn = role_arn_;
     data_source = data_source_;
     dataset_arn = dataset_arn_;
     dataset_import_job_arn = dataset_import_job_arn_;
     job_name = job_name_;
   }
    : dataset_import_job)

let make_describe_dataset_import_job_response
    ?dataset_import_job:(dataset_import_job_ : dataset_import_job option) () =
  ({ dataset_import_job = dataset_import_job_ } : describe_dataset_import_job_response)

let make_describe_dataset_import_job_request ~dataset_import_job_arn:(dataset_import_job_arn_ : arn)
    () =
  ({ dataset_import_job_arn = dataset_import_job_arn_ } : describe_dataset_import_job_request)

let make_dataset_group ?domain:(domain_ : domain option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ?role_arn:(role_arn_ : role_arn option)
    ?status:(status_ : status option) ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?name:(name_ : name option) () =
  ({
     domain = domain_;
     failure_reason = failure_reason_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     kms_key_arn = kms_key_arn_;
     role_arn = role_arn_;
     status = status_;
     dataset_group_arn = dataset_group_arn_;
     name = name_;
   }
    : dataset_group)

let make_describe_dataset_group_response ?dataset_group:(dataset_group_ : dataset_group option) () =
  ({ dataset_group = dataset_group_ } : describe_dataset_group_response)

let make_describe_dataset_group_request ~dataset_group_arn:(dataset_group_arn_ : arn) () =
  ({ dataset_group_arn = dataset_group_arn_ } : describe_dataset_group_request)

let make_dataset_export_job_output ~s3_data_destination:(s3_data_destination_ : s3_data_config) () =
  ({ s3_data_destination = s3_data_destination_ } : dataset_export_job_output)

let make_dataset_export_job ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?job_output:(job_output_ : dataset_export_job_output option) ?status:(status_ : status option)
    ?role_arn:(role_arn_ : arn option) ?ingestion_mode:(ingestion_mode_ : ingestion_mode option)
    ?dataset_arn:(dataset_arn_ : arn option)
    ?dataset_export_job_arn:(dataset_export_job_arn_ : arn option)
    ?job_name:(job_name_ : name option) () =
  ({
     failure_reason = failure_reason_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     job_output = job_output_;
     status = status_;
     role_arn = role_arn_;
     ingestion_mode = ingestion_mode_;
     dataset_arn = dataset_arn_;
     dataset_export_job_arn = dataset_export_job_arn_;
     job_name = job_name_;
   }
    : dataset_export_job)

let make_describe_dataset_export_job_response
    ?dataset_export_job:(dataset_export_job_ : dataset_export_job option) () =
  ({ dataset_export_job = dataset_export_job_ } : describe_dataset_export_job_response)

let make_describe_dataset_export_job_request ~dataset_export_job_arn:(dataset_export_job_arn_ : arn)
    () =
  ({ dataset_export_job_arn = dataset_export_job_arn_ } : describe_dataset_export_job_request)

let make_data_deletion_job ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?num_deleted:(num_deleted_ : integer option) ?status:(status_ : status option)
    ?role_arn:(role_arn_ : role_arn option) ?data_source:(data_source_ : data_source option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?data_deletion_job_arn:(data_deletion_job_arn_ : arn option) ?job_name:(job_name_ : name option)
    () =
  ({
     failure_reason = failure_reason_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     num_deleted = num_deleted_;
     status = status_;
     role_arn = role_arn_;
     data_source = data_source_;
     dataset_group_arn = dataset_group_arn_;
     data_deletion_job_arn = data_deletion_job_arn_;
     job_name = job_name_;
   }
    : data_deletion_job)

let make_describe_data_deletion_job_response
    ?data_deletion_job:(data_deletion_job_ : data_deletion_job option) () =
  ({ data_deletion_job = data_deletion_job_ } : describe_data_deletion_job_response)

let make_describe_data_deletion_job_request ~data_deletion_job_arn:(data_deletion_job_arn_ : arn) ()
    =
  ({ data_deletion_job_arn = data_deletion_job_arn_ } : describe_data_deletion_job_request)

let make_campaign_update_summary ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option) ?status:(status_ : status option)
    ?campaign_config:(campaign_config_ : campaign_config option)
    ?min_provisioned_tp_s:(min_provisioned_tp_s_ : transactions_per_second option)
    ?solution_version_arn:(solution_version_arn_ : arn option) () =
  ({
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     failure_reason = failure_reason_;
     status = status_;
     campaign_config = campaign_config_;
     min_provisioned_tp_s = min_provisioned_tp_s_;
     solution_version_arn = solution_version_arn_;
   }
    : campaign_update_summary)

let make_campaign ?latest_campaign_update:(latest_campaign_update_ : campaign_update_summary option)
    ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?failure_reason:(failure_reason_ : failure_reason option) ?status:(status_ : status option)
    ?campaign_config:(campaign_config_ : campaign_config option)
    ?min_provisioned_tp_s:(min_provisioned_tp_s_ : transactions_per_second option)
    ?solution_version_arn:(solution_version_arn_ : arn option)
    ?campaign_arn:(campaign_arn_ : arn option) ?name:(name_ : name option) () =
  ({
     latest_campaign_update = latest_campaign_update_;
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     failure_reason = failure_reason_;
     status = status_;
     campaign_config = campaign_config_;
     min_provisioned_tp_s = min_provisioned_tp_s_;
     solution_version_arn = solution_version_arn_;
     campaign_arn = campaign_arn_;
     name = name_;
   }
    : campaign)

let make_describe_campaign_response ?campaign:(campaign_ : campaign option) () =
  ({ campaign = campaign_ } : describe_campaign_response)

let make_describe_campaign_request ~campaign_arn:(campaign_arn_ : arn) () =
  ({ campaign_arn = campaign_arn_ } : describe_campaign_request)

let make_batch_segment_job_input ~s3_data_source:(s3_data_source_ : s3_data_config) () =
  ({ s3_data_source = s3_data_source_ } : batch_segment_job_input)

let make_batch_segment_job_output ~s3_data_destination:(s3_data_destination_ : s3_data_config) () =
  ({ s3_data_destination = s3_data_destination_ } : batch_segment_job_output)

let make_batch_segment_job ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?role_arn:(role_arn_ : role_arn option)
    ?job_output:(job_output_ : batch_segment_job_output option)
    ?job_input:(job_input_ : batch_segment_job_input option)
    ?num_results:(num_results_ : num_batch_results option)
    ?solution_version_arn:(solution_version_arn_ : arn option)
    ?failure_reason:(failure_reason_ : failure_reason option) ?filter_arn:(filter_arn_ : arn option)
    ?batch_segment_job_arn:(batch_segment_job_arn_ : arn option) ?job_name:(job_name_ : name option)
    () =
  ({
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     role_arn = role_arn_;
     job_output = job_output_;
     job_input = job_input_;
     num_results = num_results_;
     solution_version_arn = solution_version_arn_;
     failure_reason = failure_reason_;
     filter_arn = filter_arn_;
     batch_segment_job_arn = batch_segment_job_arn_;
     job_name = job_name_;
   }
    : batch_segment_job)

let make_describe_batch_segment_job_response
    ?batch_segment_job:(batch_segment_job_ : batch_segment_job option) () =
  ({ batch_segment_job = batch_segment_job_ } : describe_batch_segment_job_response)

let make_describe_batch_segment_job_request ~batch_segment_job_arn:(batch_segment_job_arn_ : arn) ()
    =
  ({ batch_segment_job_arn = batch_segment_job_arn_ } : describe_batch_segment_job_request)

let make_batch_inference_job_input ~s3_data_source:(s3_data_source_ : s3_data_config) () =
  ({ s3_data_source = s3_data_source_ } : batch_inference_job_input)

let make_batch_inference_job_output ~s3_data_destination:(s3_data_destination_ : s3_data_config) ()
    =
  ({ s3_data_destination = s3_data_destination_ } : batch_inference_job_output)

let make_batch_inference_job_config
    ?ranking_influence:(ranking_influence_ : ranking_influence option)
    ?item_exploration_config:(item_exploration_config_ : hyper_parameters option) () =
  ({ ranking_influence = ranking_influence_; item_exploration_config = item_exploration_config_ }
    : batch_inference_job_config)

let make_batch_inference_job ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?status:(status_ : status option)
    ?theme_generation_config:(theme_generation_config_ : theme_generation_config option)
    ?batch_inference_job_mode:(batch_inference_job_mode_ : batch_inference_job_mode option)
    ?role_arn:(role_arn_ : role_arn option)
    ?batch_inference_job_config:(batch_inference_job_config_ : batch_inference_job_config option)
    ?job_output:(job_output_ : batch_inference_job_output option)
    ?job_input:(job_input_ : batch_inference_job_input option)
    ?num_results:(num_results_ : num_batch_results option)
    ?solution_version_arn:(solution_version_arn_ : arn option)
    ?failure_reason:(failure_reason_ : failure_reason option) ?filter_arn:(filter_arn_ : arn option)
    ?batch_inference_job_arn:(batch_inference_job_arn_ : arn option)
    ?job_name:(job_name_ : name option) () =
  ({
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     status = status_;
     theme_generation_config = theme_generation_config_;
     batch_inference_job_mode = batch_inference_job_mode_;
     role_arn = role_arn_;
     batch_inference_job_config = batch_inference_job_config_;
     job_output = job_output_;
     job_input = job_input_;
     num_results = num_results_;
     solution_version_arn = solution_version_arn_;
     failure_reason = failure_reason_;
     filter_arn = filter_arn_;
     batch_inference_job_arn = batch_inference_job_arn_;
     job_name = job_name_;
   }
    : batch_inference_job)

let make_describe_batch_inference_job_response
    ?batch_inference_job:(batch_inference_job_ : batch_inference_job option) () =
  ({ batch_inference_job = batch_inference_job_ } : describe_batch_inference_job_response)

let make_describe_batch_inference_job_request
    ~batch_inference_job_arn:(batch_inference_job_arn_ : arn) () =
  ({ batch_inference_job_arn = batch_inference_job_arn_ } : describe_batch_inference_job_request)

let make_algorithm_image ?name:(name_ : name option) ~docker_ur_i:(docker_ur_i_ : docker_ur_i) () =
  ({ docker_ur_i = docker_ur_i_; name = name_ } : algorithm_image)

let make_default_integer_hyper_parameter_range ?is_tunable:(is_tunable_ : tunable option)
    ?max_value:(max_value_ : integer_max_value option)
    ?min_value:(min_value_ : integer_min_value option) ?name:(name_ : parameter_name option) () =
  ({ is_tunable = is_tunable_; max_value = max_value_; min_value = min_value_; name = name_ }
    : default_integer_hyper_parameter_range)

let make_default_continuous_hyper_parameter_range ?is_tunable:(is_tunable_ : tunable option)
    ?max_value:(max_value_ : continuous_max_value option)
    ?min_value:(min_value_ : continuous_min_value option) ?name:(name_ : parameter_name option) () =
  ({ is_tunable = is_tunable_; max_value = max_value_; min_value = min_value_; name = name_ }
    : default_continuous_hyper_parameter_range)

let make_default_categorical_hyper_parameter_range ?is_tunable:(is_tunable_ : tunable option)
    ?values:(values_ : categorical_values option) ?name:(name_ : parameter_name option) () =
  ({ is_tunable = is_tunable_; values = values_; name = name_ }
    : default_categorical_hyper_parameter_range)

let make_default_hyper_parameter_ranges
    ?categorical_hyper_parameter_ranges:
      (categorical_hyper_parameter_ranges_ : default_categorical_hyper_parameter_ranges option)
    ?continuous_hyper_parameter_ranges:
      (continuous_hyper_parameter_ranges_ : default_continuous_hyper_parameter_ranges option)
    ?integer_hyper_parameter_ranges:
      (integer_hyper_parameter_ranges_ : default_integer_hyper_parameter_ranges option) () =
  ({
     categorical_hyper_parameter_ranges = categorical_hyper_parameter_ranges_;
     continuous_hyper_parameter_ranges = continuous_hyper_parameter_ranges_;
     integer_hyper_parameter_ranges = integer_hyper_parameter_ranges_;
   }
    : default_hyper_parameter_ranges)

let make_algorithm ?last_updated_date_time:(last_updated_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) ?role_arn:(role_arn_ : arn option)
    ?training_input_mode:(training_input_mode_ : training_input_mode option)
    ?default_resource_config:(default_resource_config_ : resource_config option)
    ?default_hyper_parameter_ranges:
      (default_hyper_parameter_ranges_ : default_hyper_parameter_ranges option)
    ?default_hyper_parameters:(default_hyper_parameters_ : hyper_parameters option)
    ?algorithm_image:(algorithm_image_ : algorithm_image option)
    ?algorithm_arn:(algorithm_arn_ : arn option) ?name:(name_ : name option) () =
  ({
     last_updated_date_time = last_updated_date_time_;
     creation_date_time = creation_date_time_;
     role_arn = role_arn_;
     training_input_mode = training_input_mode_;
     default_resource_config = default_resource_config_;
     default_hyper_parameter_ranges = default_hyper_parameter_ranges_;
     default_hyper_parameters = default_hyper_parameters_;
     algorithm_image = algorithm_image_;
     algorithm_arn = algorithm_arn_;
     name = name_;
   }
    : algorithm)

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

let make_delete_dataset_request ~dataset_arn:(dataset_arn_ : arn) () =
  ({ dataset_arn = dataset_arn_ } : delete_dataset_request)

let make_delete_dataset_group_request ~dataset_group_arn:(dataset_group_arn_ : arn) () =
  ({ dataset_group_arn = dataset_group_arn_ } : delete_dataset_group_request)

let make_delete_campaign_request ~campaign_arn:(campaign_arn_ : arn) () =
  ({ campaign_arn = campaign_arn_ } : delete_campaign_request)

let make_create_solution_version_response ?solution_version_arn:(solution_version_arn_ : arn option)
    () =
  ({ solution_version_arn = solution_version_arn_ } : create_solution_version_response)

let make_create_solution_version_request ?tags:(tags_ : tags option)
    ?training_mode:(training_mode_ : training_mode option) ?name:(name_ : name option)
    ~solution_arn:(solution_arn_ : arn) () =
  ({ tags = tags_; training_mode = training_mode_; solution_arn = solution_arn_; name = name_ }
    : create_solution_version_request)

let make_create_solution_response ?solution_arn:(solution_arn_ : arn option) () =
  ({ solution_arn = solution_arn_ } : create_solution_response)

let make_create_solution_request ?tags:(tags_ : tags option)
    ?solution_config:(solution_config_ : solution_config option)
    ?event_type:(event_type_ : event_type option) ?recipe_arn:(recipe_arn_ : arn option)
    ?perform_incremental_update:(perform_incremental_update_ : perform_incremental_update option)
    ?perform_auto_training:(perform_auto_training_ : perform_auto_training option)
    ?perform_auto_m_l:(perform_auto_m_l_ : perform_auto_m_l option)
    ?perform_hp_o:(perform_hp_o_ : boolean_ option) ~dataset_group_arn:(dataset_group_arn_ : arn)
    ~name:(name_ : name) () =
  ({
     tags = tags_;
     solution_config = solution_config_;
     event_type = event_type_;
     dataset_group_arn = dataset_group_arn_;
     recipe_arn = recipe_arn_;
     perform_incremental_update = perform_incremental_update_;
     perform_auto_training = perform_auto_training_;
     perform_auto_m_l = perform_auto_m_l_;
     perform_hp_o = perform_hp_o_;
     name = name_;
   }
    : create_solution_request)

let make_create_schema_response ?schema_arn:(schema_arn_ : arn option) () =
  ({ schema_arn = schema_arn_ } : create_schema_response)

let make_create_schema_request ?domain:(domain_ : domain option) ~schema:(schema_ : avro_schema)
    ~name:(name_ : name) () =
  ({ domain = domain_; schema = schema_; name = name_ } : create_schema_request)

let make_create_recommender_response ?recommender_arn:(recommender_arn_ : arn option) () =
  ({ recommender_arn = recommender_arn_ } : create_recommender_response)

let make_create_recommender_request ?tags:(tags_ : tags option)
    ?recommender_config:(recommender_config_ : recommender_config option)
    ~recipe_arn:(recipe_arn_ : arn) ~dataset_group_arn:(dataset_group_arn_ : arn)
    ~name:(name_ : name) () =
  ({
     tags = tags_;
     recommender_config = recommender_config_;
     recipe_arn = recipe_arn_;
     dataset_group_arn = dataset_group_arn_;
     name = name_;
   }
    : create_recommender_request)

let make_create_metric_attribution_response
    ?metric_attribution_arn:(metric_attribution_arn_ : arn option) () =
  ({ metric_attribution_arn = metric_attribution_arn_ } : create_metric_attribution_response)

let make_create_metric_attribution_request
    ~metrics_output_config:(metrics_output_config_ : metric_attribution_output)
    ~metrics:(metrics_ : metric_attributes) ~dataset_group_arn:(dataset_group_arn_ : arn)
    ~name:(name_ : name) () =
  ({
     metrics_output_config = metrics_output_config_;
     metrics = metrics_;
     dataset_group_arn = dataset_group_arn_;
     name = name_;
   }
    : create_metric_attribution_request)

let make_create_filter_response ?filter_arn:(filter_arn_ : arn option) () =
  ({ filter_arn = filter_arn_ } : create_filter_response)

let make_create_filter_request ?tags:(tags_ : tags option)
    ~filter_expression:(filter_expression_ : filter_expression)
    ~dataset_group_arn:(dataset_group_arn_ : arn) ~name:(name_ : name) () =
  ({
     tags = tags_;
     filter_expression = filter_expression_;
     dataset_group_arn = dataset_group_arn_;
     name = name_;
   }
    : create_filter_request)

let make_create_event_tracker_response ?tracking_id:(tracking_id_ : tracking_id option)
    ?event_tracker_arn:(event_tracker_arn_ : arn option) () =
  ({ tracking_id = tracking_id_; event_tracker_arn = event_tracker_arn_ }
    : create_event_tracker_response)

let make_create_event_tracker_request ?tags:(tags_ : tags option)
    ~dataset_group_arn:(dataset_group_arn_ : arn) ~name:(name_ : name) () =
  ({ tags = tags_; dataset_group_arn = dataset_group_arn_; name = name_ }
    : create_event_tracker_request)

let make_create_dataset_response ?dataset_arn:(dataset_arn_ : arn option) () =
  ({ dataset_arn = dataset_arn_ } : create_dataset_response)

let make_create_dataset_request ?tags:(tags_ : tags option)
    ~dataset_type:(dataset_type_ : dataset_type) ~dataset_group_arn:(dataset_group_arn_ : arn)
    ~schema_arn:(schema_arn_ : arn) ~name:(name_ : name) () =
  ({
     tags = tags_;
     dataset_type = dataset_type_;
     dataset_group_arn = dataset_group_arn_;
     schema_arn = schema_arn_;
     name = name_;
   }
    : create_dataset_request)

let make_create_dataset_import_job_response
    ?dataset_import_job_arn:(dataset_import_job_arn_ : arn option) () =
  ({ dataset_import_job_arn = dataset_import_job_arn_ } : create_dataset_import_job_response)

let make_create_dataset_import_job_request
    ?publish_attribution_metrics_to_s3:(publish_attribution_metrics_to_s3_ : boolean_ option)
    ?import_mode:(import_mode_ : import_mode option) ?tags:(tags_ : tags option)
    ?role_arn:(role_arn_ : role_arn option) ~data_source:(data_source_ : data_source)
    ~dataset_arn:(dataset_arn_ : arn) ~job_name:(job_name_ : name) () =
  ({
     publish_attribution_metrics_to_s3 = publish_attribution_metrics_to_s3_;
     import_mode = import_mode_;
     tags = tags_;
     role_arn = role_arn_;
     data_source = data_source_;
     dataset_arn = dataset_arn_;
     job_name = job_name_;
   }
    : create_dataset_import_job_request)

let make_create_dataset_group_response ?domain:(domain_ : domain option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) () =
  ({ domain = domain_; dataset_group_arn = dataset_group_arn_ } : create_dataset_group_response)

let make_create_dataset_group_request ?tags:(tags_ : tags option) ?domain:(domain_ : domain option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ?role_arn:(role_arn_ : role_arn option)
    ~name:(name_ : name) () =
  ({
     tags = tags_;
     domain = domain_;
     kms_key_arn = kms_key_arn_;
     role_arn = role_arn_;
     name = name_;
   }
    : create_dataset_group_request)

let make_create_dataset_export_job_response
    ?dataset_export_job_arn:(dataset_export_job_arn_ : arn option) () =
  ({ dataset_export_job_arn = dataset_export_job_arn_ } : create_dataset_export_job_response)

let make_create_dataset_export_job_request ?tags:(tags_ : tags option)
    ?ingestion_mode:(ingestion_mode_ : ingestion_mode option)
    ~job_output:(job_output_ : dataset_export_job_output) ~role_arn:(role_arn_ : role_arn)
    ~dataset_arn:(dataset_arn_ : arn) ~job_name:(job_name_ : name) () =
  ({
     tags = tags_;
     job_output = job_output_;
     role_arn = role_arn_;
     ingestion_mode = ingestion_mode_;
     dataset_arn = dataset_arn_;
     job_name = job_name_;
   }
    : create_dataset_export_job_request)

let make_create_data_deletion_job_response
    ?data_deletion_job_arn:(data_deletion_job_arn_ : arn option) () =
  ({ data_deletion_job_arn = data_deletion_job_arn_ } : create_data_deletion_job_response)

let make_create_data_deletion_job_request ?tags:(tags_ : tags option)
    ~role_arn:(role_arn_ : role_arn) ~data_source:(data_source_ : data_source)
    ~dataset_group_arn:(dataset_group_arn_ : arn) ~job_name:(job_name_ : name) () =
  ({
     tags = tags_;
     role_arn = role_arn_;
     data_source = data_source_;
     dataset_group_arn = dataset_group_arn_;
     job_name = job_name_;
   }
    : create_data_deletion_job_request)

let make_create_campaign_response ?campaign_arn:(campaign_arn_ : arn option) () =
  ({ campaign_arn = campaign_arn_ } : create_campaign_response)

let make_create_campaign_request ?tags:(tags_ : tags option)
    ?campaign_config:(campaign_config_ : campaign_config option)
    ?min_provisioned_tp_s:(min_provisioned_tp_s_ : transactions_per_second option)
    ~solution_version_arn:(solution_version_arn_ : arn) ~name:(name_ : name) () =
  ({
     tags = tags_;
     campaign_config = campaign_config_;
     min_provisioned_tp_s = min_provisioned_tp_s_;
     solution_version_arn = solution_version_arn_;
     name = name_;
   }
    : create_campaign_request)

let make_create_batch_segment_job_response
    ?batch_segment_job_arn:(batch_segment_job_arn_ : arn option) () =
  ({ batch_segment_job_arn = batch_segment_job_arn_ } : create_batch_segment_job_response)

let make_create_batch_segment_job_request ?tags:(tags_ : tags option)
    ?num_results:(num_results_ : num_batch_results option) ?filter_arn:(filter_arn_ : arn option)
    ~role_arn:(role_arn_ : role_arn) ~job_output:(job_output_ : batch_segment_job_output)
    ~job_input:(job_input_ : batch_segment_job_input)
    ~solution_version_arn:(solution_version_arn_ : arn) ~job_name:(job_name_ : name) () =
  ({
     tags = tags_;
     role_arn = role_arn_;
     job_output = job_output_;
     job_input = job_input_;
     num_results = num_results_;
     filter_arn = filter_arn_;
     solution_version_arn = solution_version_arn_;
     job_name = job_name_;
   }
    : create_batch_segment_job_request)

let make_create_batch_inference_job_response
    ?batch_inference_job_arn:(batch_inference_job_arn_ : arn option) () =
  ({ batch_inference_job_arn = batch_inference_job_arn_ } : create_batch_inference_job_response)

let make_create_batch_inference_job_request
    ?theme_generation_config:(theme_generation_config_ : theme_generation_config option)
    ?batch_inference_job_mode:(batch_inference_job_mode_ : batch_inference_job_mode option)
    ?tags:(tags_ : tags option)
    ?batch_inference_job_config:(batch_inference_job_config_ : batch_inference_job_config option)
    ?num_results:(num_results_ : num_batch_results option) ?filter_arn:(filter_arn_ : arn option)
    ~role_arn:(role_arn_ : role_arn) ~job_output:(job_output_ : batch_inference_job_output)
    ~job_input:(job_input_ : batch_inference_job_input)
    ~solution_version_arn:(solution_version_arn_ : arn) ~job_name:(job_name_ : name) () =
  ({
     theme_generation_config = theme_generation_config_;
     batch_inference_job_mode = batch_inference_job_mode_;
     tags = tags_;
     batch_inference_job_config = batch_inference_job_config_;
     role_arn = role_arn_;
     job_output = job_output_;
     job_input = job_input_;
     num_results = num_results_;
     filter_arn = filter_arn_;
     solution_version_arn = solution_version_arn_;
     job_name = job_name_;
   }
    : create_batch_inference_job_request)
