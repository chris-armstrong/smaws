open Types

let make_ati_metric_data_point ?cr:(cr_ : float_ option) ?adr:(adr_ : float_ option)
    ?threshold:(threshold_ : float_ option) ?atodr:(atodr_ : float_ option) () =
  ({ cr = cr_; adr = adr_; threshold = threshold_; atodr = atodr_ } : ati_metric_data_point)

let make_ati_model_performance ?asi:(asi_ : float_ option) () =
  ({ asi = asi_ } : ati_model_performance)

let make_ati_training_metrics_value
    ?metric_data_points:(metric_data_points_ : ati_metric_data_points_list option)
    ?model_performance:(model_performance_ : ati_model_performance option) () =
  ({ metric_data_points = metric_data_points_; model_performance = model_performance_ }
    : ati_training_metrics_value)

let make_update_variable_request ?default_value:(default_value_ : string_ option)
    ?description:(description_ : string_ option) ?variable_type:(variable_type_ : string_ option)
    ~name:(name_ : string_) () =
  ({
     name = name_;
     default_value = default_value_;
     description = description_;
     variable_type = variable_type_;
   }
    : update_variable_request)

let make_rule ~detector_id:(detector_id_ : identifier) ~rule_id:(rule_id_ : identifier)
    ~rule_version:(rule_version_ : whole_number_version_string) () =
  ({ detector_id = detector_id_; rule_id = rule_id_; rule_version = rule_version_ } : rule)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_update_rule_version_request ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option) ~rule:(rule_ : rule) ~expression:(expression_ : rule_expression)
    ~language:(language_ : language) ~outcomes:(outcomes_ : non_empty_list_of_strings) () =
  ({
     rule = rule_;
     description = description_;
     expression = expression_;
     language = language_;
     outcomes = outcomes_;
     tags = tags_;
   }
    : update_rule_version_request)

let make_update_rule_metadata_request ~rule:(rule_ : rule) ~description:(description_ : description)
    () =
  ({ rule = rule_; description = description_ } : update_rule_metadata_request)

let make_update_model_version_status_request ~model_id:(model_id_ : model_identifier)
    ~model_type:(model_type_ : model_type_enum)
    ~model_version_number:(model_version_number_ : float_version_string)
    ~status:(status_ : model_version_status) () =
  ({
     model_id = model_id_;
     model_type = model_type_;
     model_version_number = model_version_number_;
     status = status_;
   }
    : update_model_version_status_request)

let make_ingested_events_time_window ~start_time:(start_time_ : time) ~end_time:(end_time_ : time)
    () =
  ({ start_time = start_time_; end_time = end_time_ } : ingested_events_time_window)

let make_ingested_events_detail
    ~ingested_events_time_window:(ingested_events_time_window_ : ingested_events_time_window) () =
  ({ ingested_events_time_window = ingested_events_time_window_ } : ingested_events_detail)

let make_external_events_detail ~data_location:(data_location_ : s3_bucket_location)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn) () =
  ({ data_location = data_location_; data_access_role_arn = data_access_role_arn_ }
    : external_events_detail)

let make_update_model_version_request
    ?external_events_detail:(external_events_detail_ : external_events_detail option)
    ?ingested_events_detail:(ingested_events_detail_ : ingested_events_detail option)
    ?tags:(tags_ : tag_list option) ~model_id:(model_id_ : model_identifier)
    ~model_type:(model_type_ : model_type_enum)
    ~major_version_number:(major_version_number_ : whole_number_version_string) () =
  ({
     model_id = model_id_;
     model_type = model_type_;
     major_version_number = major_version_number_;
     external_events_detail = external_events_detail_;
     ingested_events_detail = ingested_events_detail_;
     tags = tags_;
   }
    : update_model_version_request)

let make_update_model_request ?description:(description_ : description option)
    ~model_id:(model_id_ : model_identifier) ~model_type:(model_type_ : model_type_enum) () =
  ({ model_id = model_id_; model_type = model_type_; description = description_ }
    : update_model_request)

let make_update_list_request ?elements:(elements_ : elements_list option)
    ?description:(description_ : description option)
    ?update_mode:(update_mode_ : list_update_mode option)
    ?variable_type:(variable_type_ : variable_type option) ~name:(name_ : no_dash_identifier) () =
  ({
     name = name_;
     elements = elements_;
     description = description_;
     update_mode = update_mode_;
     variable_type = variable_type_;
   }
    : update_list_request)

let make_update_event_label_request ~event_id:(event_id_ : identifier)
    ~event_type_name:(event_type_name_ : identifier) ~assigned_label:(assigned_label_ : identifier)
    ~label_timestamp:(label_timestamp_ : utc_timestamp_is_o8601) () =
  ({
     event_id = event_id_;
     event_type_name = event_type_name_;
     assigned_label = assigned_label_;
     label_timestamp = label_timestamp_;
   }
    : update_event_label_request)

let make_update_detector_version_status_request ~detector_id:(detector_id_ : identifier)
    ~detector_version_id:(detector_version_id_ : whole_number_version_string)
    ~status:(status_ : detector_version_status) () =
  ({ detector_id = detector_id_; detector_version_id = detector_version_id_; status = status_ }
    : update_detector_version_status_request)

let make_update_detector_version_metadata_request ~detector_id:(detector_id_ : identifier)
    ~detector_version_id:(detector_version_id_ : whole_number_version_string)
    ~description:(description_ : description) () =
  ({
     detector_id = detector_id_;
     detector_version_id = detector_version_id_;
     description = description_;
   }
    : update_detector_version_metadata_request)

let make_model_version ?arn:(arn_ : fraud_detector_arn option)
    ~model_id:(model_id_ : model_identifier) ~model_type:(model_type_ : model_type_enum)
    ~model_version_number:(model_version_number_ : float_version_string) () =
  ({
     model_id = model_id_;
     model_type = model_type_;
     model_version_number = model_version_number_;
     arn = arn_;
   }
    : model_version)

let make_update_detector_version_request ?description:(description_ : description option)
    ?model_versions:(model_versions_ : list_of_model_versions option)
    ?rule_execution_mode:(rule_execution_mode_ : rule_execution_mode option)
    ~detector_id:(detector_id_ : identifier)
    ~detector_version_id:(detector_version_id_ : whole_number_version_string)
    ~external_model_endpoints:(external_model_endpoints_ : list_of_strings)
    ~rules:(rules_ : rule_list) () =
  ({
     detector_id = detector_id_;
     detector_version_id = detector_version_id_;
     external_model_endpoints = external_model_endpoints_;
     rules = rules_;
     description = description_;
     model_versions = model_versions_;
     rule_execution_mode = rule_execution_mode_;
   }
    : update_detector_version_request)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : fraud_detector_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : fraud_detector_arn)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_entity ~entity_type:(entity_type_ : string_)
    ~entity_id:(entity_id_ : entity_restricted_string) () =
  ({ entity_type = entity_type_; entity_id = entity_id_ } : entity)

let make_send_event_request ?assigned_label:(assigned_label_ : identifier option)
    ?label_timestamp:(label_timestamp_ : utc_timestamp_is_o8601 option)
    ~event_id:(event_id_ : identifier) ~event_type_name:(event_type_name_ : identifier)
    ~event_timestamp:(event_timestamp_ : utc_timestamp_is_o8601)
    ~event_variables:(event_variables_ : event_variable_map)
    ~entities:(entities_ : list_of_entities) () =
  ({
     event_id = event_id_;
     event_type_name = event_type_name_;
     event_timestamp = event_timestamp_;
     event_variables = event_variables_;
     assigned_label = assigned_label_;
     label_timestamp = label_timestamp_;
     entities = entities_;
   }
    : send_event_request)

let make_put_outcome_request ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : identifier) () =
  ({ name = name_; description = description_; tags = tags_ } : put_outcome_request)

let make_put_label_request ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : identifier) () =
  ({ name = name_; description = description_; tags = tags_ } : put_label_request)

let make_put_kms_encryption_key_request
    ~kms_encryption_key_arn:(kms_encryption_key_arn_ : kms_encryption_key_arn) () =
  ({ kms_encryption_key_arn = kms_encryption_key_arn_ } : put_kms_encryption_key_request)

let make_model_output_configuration
    ?json_key_to_variable_map:(json_key_to_variable_map_ : json_key_to_variable_map option)
    ?csv_index_to_variable_map:(csv_index_to_variable_map_ : csv_index_to_variable_map option)
    ~format:(format_ : model_output_data_format) () =
  ({
     format = format_;
     json_key_to_variable_map = json_key_to_variable_map_;
     csv_index_to_variable_map = csv_index_to_variable_map_;
   }
    : model_output_configuration)

let make_model_input_configuration ?event_type_name:(event_type_name_ : identifier option)
    ?format:(format_ : model_input_data_format option)
    ?json_input_template:(json_input_template_ : model_input_template option)
    ?csv_input_template:(csv_input_template_ : model_input_template option)
    ~use_event_variables:(use_event_variables_ : use_event_variables) () =
  ({
     event_type_name = event_type_name_;
     format = format_;
     use_event_variables = use_event_variables_;
     json_input_template = json_input_template_;
     csv_input_template = csv_input_template_;
   }
    : model_input_configuration)

let make_put_external_model_request ?tags:(tags_ : tag_list option)
    ~model_endpoint:(model_endpoint_ : sage_maker_endpoint_identifier)
    ~model_source:(model_source_ : model_source)
    ~invoke_model_endpoint_role_arn:(invoke_model_endpoint_role_arn_ : string_)
    ~input_configuration:(input_configuration_ : model_input_configuration)
    ~output_configuration:(output_configuration_ : model_output_configuration)
    ~model_endpoint_status:(model_endpoint_status_ : model_endpoint_status) () =
  ({
     model_endpoint = model_endpoint_;
     model_source = model_source_;
     invoke_model_endpoint_role_arn = invoke_model_endpoint_role_arn_;
     input_configuration = input_configuration_;
     output_configuration = output_configuration_;
     model_endpoint_status = model_endpoint_status_;
     tags = tags_;
   }
    : put_external_model_request)

let make_event_orchestration ~event_bridge_enabled:(event_bridge_enabled_ : boolean_) () =
  ({ event_bridge_enabled = event_bridge_enabled_ } : event_orchestration)

let make_put_event_type_request ?description:(description_ : description option)
    ?labels:(labels_ : list_of_strings option)
    ?event_ingestion:(event_ingestion_ : event_ingestion option) ?tags:(tags_ : tag_list option)
    ?event_orchestration:(event_orchestration_ : event_orchestration option)
    ~name:(name_ : identifier) ~event_variables:(event_variables_ : non_empty_list_of_strings)
    ~entity_types:(entity_types_ : non_empty_list_of_strings) () =
  ({
     name = name_;
     description = description_;
     event_variables = event_variables_;
     labels = labels_;
     entity_types = entity_types_;
     event_ingestion = event_ingestion_;
     tags = tags_;
     event_orchestration = event_orchestration_;
   }
    : put_event_type_request)

let make_put_entity_type_request ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : identifier) () =
  ({ name = name_; description = description_; tags = tags_ } : put_entity_type_request)

let make_put_detector_request ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option) ~detector_id:(detector_id_ : identifier)
    ~event_type_name:(event_type_name_ : identifier) () =
  ({
     detector_id = detector_id_;
     description = description_;
     event_type_name = event_type_name_;
     tags = tags_;
   }
    : put_detector_request)

let make_list_tags_for_resource_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : tags_max_results option)
    ~resource_ar_n:(resource_ar_n_ : fraud_detector_arn) () =
  ({ resource_ar_n = resource_ar_n_; next_token = next_token_; max_results = max_results_ }
    : list_tags_for_resource_request)

let make_event_prediction_summary ?event_id:(event_id_ : identifier option)
    ?event_type_name:(event_type_name_ : identifier option)
    ?event_timestamp:(event_timestamp_ : time option)
    ?prediction_timestamp:(prediction_timestamp_ : time option)
    ?detector_id:(detector_id_ : identifier option)
    ?detector_version_id:(detector_version_id_ : whole_number_version_string option) () =
  ({
     event_id = event_id_;
     event_type_name = event_type_name_;
     event_timestamp = event_timestamp_;
     prediction_timestamp = prediction_timestamp_;
     detector_id = detector_id_;
     detector_version_id = detector_version_id_;
   }
    : event_prediction_summary)

let make_prediction_time_range ~start_time:(start_time_ : time) ~end_time:(end_time_ : time) () =
  ({ start_time = start_time_; end_time = end_time_ } : prediction_time_range)

let make_filter_condition ?value:(value_ : filter_string option) () =
  ({ value = value_ } : filter_condition)

let make_list_event_predictions_request ?event_id:(event_id_ : filter_condition option)
    ?event_type:(event_type_ : filter_condition option)
    ?detector_id:(detector_id_ : filter_condition option)
    ?detector_version_id:(detector_version_id_ : filter_condition option)
    ?prediction_time_range:(prediction_time_range_ : prediction_time_range option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : event_predictions_max_results option) () =
  ({
     event_id = event_id_;
     event_type = event_type_;
     detector_id = detector_id_;
     detector_version_id = detector_version_id_;
     prediction_time_range = prediction_time_range_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_event_predictions_request)

let make_variable ?name:(name_ : string_ option) ?data_type:(data_type_ : data_type option)
    ?data_source:(data_source_ : data_source option)
    ?default_value:(default_value_ : string_ option) ?description:(description_ : string_ option)
    ?variable_type:(variable_type_ : string_ option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?created_time:(created_time_ : time option) ?arn:(arn_ : fraud_detector_arn option) () =
  ({
     name = name_;
     data_type = data_type_;
     data_source = data_source_;
     default_value = default_value_;
     description = description_;
     variable_type = variable_type_;
     last_updated_time = last_updated_time_;
     created_time = created_time_;
     arn = arn_;
   }
    : variable)

let make_get_variables_request ?name:(name_ : string_ option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : variables_max_results option) () =
  ({ name = name_; next_token = next_token_; max_results = max_results_ } : get_variables_request)

let make_rule_detail ?rule_id:(rule_id_ : identifier option)
    ?description:(description_ : description option) ?detector_id:(detector_id_ : identifier option)
    ?rule_version:(rule_version_ : whole_number_version_string option)
    ?expression:(expression_ : rule_expression option) ?language:(language_ : language option)
    ?outcomes:(outcomes_ : non_empty_list_of_strings option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?created_time:(created_time_ : time option) ?arn:(arn_ : fraud_detector_arn option) () =
  ({
     rule_id = rule_id_;
     description = description_;
     detector_id = detector_id_;
     rule_version = rule_version_;
     expression = expression_;
     language = language_;
     outcomes = outcomes_;
     last_updated_time = last_updated_time_;
     created_time = created_time_;
     arn = arn_;
   }
    : rule_detail)

let make_get_rules_request ?rule_id:(rule_id_ : identifier option)
    ?rule_version:(rule_version_ : whole_number_version_string option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : rules_max_results option) ~detector_id:(detector_id_ : identifier)
    () =
  ({
     rule_id = rule_id_;
     detector_id = detector_id_;
     rule_version = rule_version_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_rules_request)

let make_outcome ?name:(name_ : identifier option) ?description:(description_ : description option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?created_time:(created_time_ : time option) ?arn:(arn_ : fraud_detector_arn option) () =
  ({
     name = name_;
     description = description_;
     last_updated_time = last_updated_time_;
     created_time = created_time_;
     arn = arn_;
   }
    : outcome)

let make_get_outcomes_request ?name:(name_ : identifier option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : outcomes_max_results option) () =
  ({ name = name_; next_token = next_token_; max_results = max_results_ } : get_outcomes_request)

let make_label_schema ?label_mapper:(label_mapper_ : label_mapper option)
    ?unlabeled_events_treatment:(unlabeled_events_treatment_ : unlabeled_events_treatment option) ()
    =
  ({ label_mapper = label_mapper_; unlabeled_events_treatment = unlabeled_events_treatment_ }
    : label_schema)

let make_training_data_schema ?label_schema:(label_schema_ : label_schema option)
    ~model_variables:(model_variables_ : list_of_strings) () =
  ({ model_variables = model_variables_; label_schema = label_schema_ } : training_data_schema)

let make_get_model_version_request ~model_id:(model_id_ : model_identifier)
    ~model_type:(model_type_ : model_type_enum)
    ~model_version_number:(model_version_number_ : float_version_string) () =
  ({ model_id = model_id_; model_type = model_type_; model_version_number = model_version_number_ }
    : get_model_version_request)

let make_model ?model_id:(model_id_ : model_identifier option)
    ?model_type:(model_type_ : model_type_enum option)
    ?description:(description_ : description option)
    ?event_type_name:(event_type_name_ : string_ option) ?created_time:(created_time_ : time option)
    ?last_updated_time:(last_updated_time_ : time option) ?arn:(arn_ : fraud_detector_arn option) ()
    =
  ({
     model_id = model_id_;
     model_type = model_type_;
     description = description_;
     event_type_name = event_type_name_;
     created_time = created_time_;
     last_updated_time = last_updated_time_;
     arn = arn_;
   }
    : model)

let make_get_models_request ?model_id:(model_id_ : model_identifier option)
    ?model_type:(model_type_ : model_type_enum option) ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : models_max_page_size option) () =
  ({
     model_id = model_id_;
     model_type = model_type_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_models_request)

let make_allow_deny_list ?description:(description_ : description option)
    ?variable_type:(variable_type_ : variable_type option)
    ?created_time:(created_time_ : time option) ?updated_time:(updated_time_ : time option)
    ?arn:(arn_ : fraud_detector_arn option) ~name:(name_ : no_dash_identifier) () =
  ({
     name = name_;
     description = description_;
     variable_type = variable_type_;
     created_time = created_time_;
     updated_time = updated_time_;
     arn = arn_;
   }
    : allow_deny_list)

let make_get_lists_metadata_request ?name:(name_ : no_dash_identifier option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : lists_metadata_max_results option) () =
  ({ name = name_; next_token = next_token_; max_results = max_results_ }
    : get_lists_metadata_request)

let make_get_list_elements_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : lists_elements_max_results option)
    ~name:(name_ : no_dash_identifier) () =
  ({ name = name_; next_token = next_token_; max_results = max_results_ }
    : get_list_elements_request)

let make_label ?name:(name_ : string_ option) ?description:(description_ : description option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?created_time:(created_time_ : time option) ?arn:(arn_ : fraud_detector_arn option) () =
  ({
     name = name_;
     description = description_;
     last_updated_time = last_updated_time_;
     created_time = created_time_;
     arn = arn_;
   }
    : label)

let make_get_labels_request ?name:(name_ : identifier option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : labels_max_results option) () =
  ({ name = name_; next_token = next_token_; max_results = max_results_ } : get_labels_request)

let make_kms_key ?kms_encryption_key_arn:(kms_encryption_key_arn_ : kms_encryption_key_arn option)
    () =
  ({ kms_encryption_key_arn = kms_encryption_key_arn_ } : kms_key)

let make_external_model ?model_endpoint:(model_endpoint_ : string_ option)
    ?model_source:(model_source_ : model_source option)
    ?invoke_model_endpoint_role_arn:(invoke_model_endpoint_role_arn_ : string_ option)
    ?input_configuration:(input_configuration_ : model_input_configuration option)
    ?output_configuration:(output_configuration_ : model_output_configuration option)
    ?model_endpoint_status:(model_endpoint_status_ : model_endpoint_status option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?created_time:(created_time_ : time option) ?arn:(arn_ : fraud_detector_arn option) () =
  ({
     model_endpoint = model_endpoint_;
     model_source = model_source_;
     invoke_model_endpoint_role_arn = invoke_model_endpoint_role_arn_;
     input_configuration = input_configuration_;
     output_configuration = output_configuration_;
     model_endpoint_status = model_endpoint_status_;
     last_updated_time = last_updated_time_;
     created_time = created_time_;
     arn = arn_;
   }
    : external_model)

let make_get_external_models_request ?model_endpoint:(model_endpoint_ : string_ option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : external_models_max_results option) () =
  ({ model_endpoint = model_endpoint_; next_token = next_token_; max_results = max_results_ }
    : get_external_models_request)

let make_ingested_event_statistics ?number_of_events:(number_of_events_ : long option)
    ?event_data_size_in_bytes:(event_data_size_in_bytes_ : long option)
    ?least_recent_event:(least_recent_event_ : time option)
    ?most_recent_event:(most_recent_event_ : time option)
    ?last_updated_time:(last_updated_time_ : time option) () =
  ({
     number_of_events = number_of_events_;
     event_data_size_in_bytes = event_data_size_in_bytes_;
     least_recent_event = least_recent_event_;
     most_recent_event = most_recent_event_;
     last_updated_time = last_updated_time_;
   }
    : ingested_event_statistics)

let make_event_type ?name:(name_ : string_ option) ?description:(description_ : description option)
    ?event_variables:(event_variables_ : list_of_strings option)
    ?labels:(labels_ : list_of_strings option)
    ?entity_types:(entity_types_ : non_empty_list_of_strings option)
    ?event_ingestion:(event_ingestion_ : event_ingestion option)
    ?ingested_event_statistics:(ingested_event_statistics_ : ingested_event_statistics option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?created_time:(created_time_ : time option) ?arn:(arn_ : fraud_detector_arn option)
    ?event_orchestration:(event_orchestration_ : event_orchestration option) () =
  ({
     name = name_;
     description = description_;
     event_variables = event_variables_;
     labels = labels_;
     entity_types = entity_types_;
     event_ingestion = event_ingestion_;
     ingested_event_statistics = ingested_event_statistics_;
     last_updated_time = last_updated_time_;
     created_time = created_time_;
     arn = arn_;
     event_orchestration = event_orchestration_;
   }
    : event_type)

let make_get_event_types_request ?name:(name_ : identifier option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : event_types_max_results option) () =
  ({ name = name_; next_token = next_token_; max_results = max_results_ } : get_event_types_request)

let make_evaluated_external_model ?model_endpoint:(model_endpoint_ : string_ option)
    ?use_event_variables:(use_event_variables_ : boolean_ option)
    ?input_variables:(input_variables_ : map_of_strings option)
    ?output_variables:(output_variables_ : map_of_strings option) () =
  ({
     model_endpoint = model_endpoint_;
     use_event_variables = use_event_variables_;
     input_variables = input_variables_;
     output_variables = output_variables_;
   }
    : evaluated_external_model)

let make_aggregated_variables_impact_explanation
    ?event_variable_names:(event_variable_names_ : list_of_strings option)
    ?relative_impact:(relative_impact_ : string_ option)
    ?log_odds_impact:(log_odds_impact_ : float_ option) () =
  ({
     event_variable_names = event_variable_names_;
     relative_impact = relative_impact_;
     log_odds_impact = log_odds_impact_;
   }
    : aggregated_variables_impact_explanation)

let make_variable_impact_explanation ?event_variable_name:(event_variable_name_ : string_ option)
    ?relative_impact:(relative_impact_ : string_ option)
    ?log_odds_impact:(log_odds_impact_ : float_ option) () =
  ({
     event_variable_name = event_variable_name_;
     relative_impact = relative_impact_;
     log_odds_impact = log_odds_impact_;
   }
    : variable_impact_explanation)

let make_prediction_explanations
    ?variable_impact_explanations:
      (variable_impact_explanations_ : list_of_variable_impact_explanations option)
    ?aggregated_variables_impact_explanations:
      (aggregated_variables_impact_explanations_ :
         list_of_aggregated_variables_impact_explanations option) () =
  ({
     variable_impact_explanations = variable_impact_explanations_;
     aggregated_variables_impact_explanations = aggregated_variables_impact_explanations_;
   }
    : prediction_explanations)

let make_model_version_evaluation ?output_variable_name:(output_variable_name_ : string_ option)
    ?evaluation_score:(evaluation_score_ : string_ option)
    ?prediction_explanations:(prediction_explanations_ : prediction_explanations option) () =
  ({
     output_variable_name = output_variable_name_;
     evaluation_score = evaluation_score_;
     prediction_explanations = prediction_explanations_;
   }
    : model_version_evaluation)

let make_evaluated_model_version ?model_id:(model_id_ : string_ option)
    ?model_version:(model_version_ : string_ option) ?model_type:(model_type_ : string_ option)
    ?evaluations:(evaluations_ : list_of_model_version_evaluations option) () =
  ({
     model_id = model_id_;
     model_version = model_version_;
     model_type = model_type_;
     evaluations = evaluations_;
   }
    : evaluated_model_version)

let make_evaluated_rule ?rule_id:(rule_id_ : identifier option)
    ?rule_version:(rule_version_ : whole_number_version_string option)
    ?expression:(expression_ : sensitive_string option)
    ?expression_with_values:(expression_with_values_ : sensitive_string option)
    ?outcomes:(outcomes_ : list_of_strings option) ?evaluated:(evaluated_ : boolean_ option)
    ?matched:(matched_ : boolean_ option) () =
  ({
     rule_id = rule_id_;
     rule_version = rule_version_;
     expression = expression_;
     expression_with_values = expression_with_values_;
     outcomes = outcomes_;
     evaluated = evaluated_;
     matched = matched_;
   }
    : evaluated_rule)

let make_event_variable_summary ?name:(name_ : sensitive_string option)
    ?value:(value_ : sensitive_string option) ?source:(source_ : sensitive_string option) () =
  ({ name = name_; value = value_; source = source_ } : event_variable_summary)

let make_get_event_prediction_metadata_request ~event_id:(event_id_ : identifier)
    ~event_type_name:(event_type_name_ : identifier) ~detector_id:(detector_id_ : identifier)
    ~detector_version_id:(detector_version_id_ : whole_number_version_string)
    ~prediction_timestamp:(prediction_timestamp_ : time) () =
  ({
     event_id = event_id_;
     event_type_name = event_type_name_;
     detector_id = detector_id_;
     detector_version_id = detector_version_id_;
     prediction_timestamp = prediction_timestamp_;
   }
    : get_event_prediction_metadata_request)

let make_external_model_summary ?model_endpoint:(model_endpoint_ : string_ option)
    ?model_source:(model_source_ : model_source option) () =
  ({ model_endpoint = model_endpoint_; model_source = model_source_ } : external_model_summary)

let make_external_model_outputs ?external_model:(external_model_ : external_model_summary option)
    ?outputs:(outputs_ : external_model_prediction_map option) () =
  ({ external_model = external_model_; outputs = outputs_ } : external_model_outputs)

let make_model_scores ?model_version:(model_version_ : model_version option)
    ?scores:(scores_ : model_prediction_map option) () =
  ({ model_version = model_version_; scores = scores_ } : model_scores)

let make_model_endpoint_data_blob ?byte_buffer:(byte_buffer_ : blob option)
    ?content_type:(content_type_ : content_type option) () =
  ({ byte_buffer = byte_buffer_; content_type = content_type_ } : model_endpoint_data_blob)

let make_get_event_prediction_request
    ?detector_version_id:(detector_version_id_ : whole_number_version_string option)
    ?external_model_endpoint_data_blobs:
      (external_model_endpoint_data_blobs_ : external_model_endpoint_data_blob_map option)
    ~detector_id:(detector_id_ : string_) ~event_id:(event_id_ : string_)
    ~event_type_name:(event_type_name_ : string_) ~entities:(entities_ : list_of_entities)
    ~event_timestamp:(event_timestamp_ : utc_timestamp_is_o8601)
    ~event_variables:(event_variables_ : event_variable_map) () =
  ({
     detector_id = detector_id_;
     detector_version_id = detector_version_id_;
     event_id = event_id_;
     event_type_name = event_type_name_;
     entities = entities_;
     event_timestamp = event_timestamp_;
     event_variables = event_variables_;
     external_model_endpoint_data_blobs = external_model_endpoint_data_blobs_;
   }
    : get_event_prediction_request)

let make_event ?event_id:(event_id_ : string_ option)
    ?event_type_name:(event_type_name_ : string_ option)
    ?event_timestamp:(event_timestamp_ : string_ option)
    ?event_variables:(event_variables_ : event_attribute_map option)
    ?current_label:(current_label_ : string_ option)
    ?label_timestamp:(label_timestamp_ : string_ option)
    ?entities:(entities_ : list_of_entities option) () =
  ({
     event_id = event_id_;
     event_type_name = event_type_name_;
     event_timestamp = event_timestamp_;
     event_variables = event_variables_;
     current_label = current_label_;
     label_timestamp = label_timestamp_;
     entities = entities_;
   }
    : event)

let make_get_event_request ~event_id:(event_id_ : string_)
    ~event_type_name:(event_type_name_ : string_) () =
  ({ event_id = event_id_; event_type_name = event_type_name_ } : get_event_request)

let make_entity_type ?name:(name_ : string_ option) ?description:(description_ : description option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?created_time:(created_time_ : time option) ?arn:(arn_ : fraud_detector_arn option) () =
  ({
     name = name_;
     description = description_;
     last_updated_time = last_updated_time_;
     created_time = created_time_;
     arn = arn_;
   }
    : entity_type)

let make_get_entity_types_request ?name:(name_ : identifier option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : entity_types_max_results option) () =
  ({ name = name_; next_token = next_token_; max_results = max_results_ }
    : get_entity_types_request)

let make_get_detector_version_request ~detector_id:(detector_id_ : identifier)
    ~detector_version_id:(detector_version_id_ : whole_number_version_string) () =
  ({ detector_id = detector_id_; detector_version_id = detector_version_id_ }
    : get_detector_version_request)

let make_detector ?detector_id:(detector_id_ : identifier option)
    ?description:(description_ : description option)
    ?event_type_name:(event_type_name_ : identifier option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?created_time:(created_time_ : time option) ?arn:(arn_ : fraud_detector_arn option) () =
  ({
     detector_id = detector_id_;
     description = description_;
     event_type_name = event_type_name_;
     last_updated_time = last_updated_time_;
     created_time = created_time_;
     arn = arn_;
   }
    : detector)

let make_get_detectors_request ?detector_id:(detector_id_ : identifier option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : detectors_max_results option) () =
  ({ detector_id = detector_id_; next_token = next_token_; max_results = max_results_ }
    : get_detectors_request)

let make_get_delete_events_by_event_type_status_request
    ~event_type_name:(event_type_name_ : identifier) () =
  ({ event_type_name = event_type_name_ } : get_delete_events_by_event_type_status_request)

let make_batch_prediction ?job_id:(job_id_ : identifier option)
    ?status:(status_ : async_job_status option) ?failure_reason:(failure_reason_ : string_ option)
    ?start_time:(start_time_ : time option) ?completion_time:(completion_time_ : time option)
    ?last_heartbeat_time:(last_heartbeat_time_ : time option)
    ?input_path:(input_path_ : s3_bucket_location option)
    ?output_path:(output_path_ : s3_bucket_location option)
    ?event_type_name:(event_type_name_ : identifier option)
    ?detector_name:(detector_name_ : identifier option)
    ?detector_version:(detector_version_ : float_version_string option)
    ?iam_role_arn:(iam_role_arn_ : iam_role_arn option) ?arn:(arn_ : fraud_detector_arn option)
    ?processed_records_count:(processed_records_count_ : integer option)
    ?total_records_count:(total_records_count_ : integer option) () =
  ({
     job_id = job_id_;
     status = status_;
     failure_reason = failure_reason_;
     start_time = start_time_;
     completion_time = completion_time_;
     last_heartbeat_time = last_heartbeat_time_;
     input_path = input_path_;
     output_path = output_path_;
     event_type_name = event_type_name_;
     detector_name = detector_name_;
     detector_version = detector_version_;
     iam_role_arn = iam_role_arn_;
     arn = arn_;
     processed_records_count = processed_records_count_;
     total_records_count = total_records_count_;
   }
    : batch_prediction)

let make_get_batch_prediction_jobs_request ?job_id:(job_id_ : identifier option)
    ?max_results:(max_results_ : batch_predictions_max_page_size option)
    ?next_token:(next_token_ : string_ option) () =
  ({ job_id = job_id_; max_results = max_results_; next_token = next_token_ }
    : get_batch_prediction_jobs_request)

let make_batch_import ?job_id:(job_id_ : identifier option)
    ?status:(status_ : async_job_status option) ?failure_reason:(failure_reason_ : string_ option)
    ?start_time:(start_time_ : time option) ?completion_time:(completion_time_ : time option)
    ?input_path:(input_path_ : s3_bucket_location option)
    ?output_path:(output_path_ : s3_bucket_location option)
    ?event_type_name:(event_type_name_ : identifier option)
    ?iam_role_arn:(iam_role_arn_ : iam_role_arn option) ?arn:(arn_ : fraud_detector_arn option)
    ?processed_records_count:(processed_records_count_ : integer option)
    ?failed_records_count:(failed_records_count_ : integer option)
    ?total_records_count:(total_records_count_ : integer option) () =
  ({
     job_id = job_id_;
     status = status_;
     failure_reason = failure_reason_;
     start_time = start_time_;
     completion_time = completion_time_;
     input_path = input_path_;
     output_path = output_path_;
     event_type_name = event_type_name_;
     iam_role_arn = iam_role_arn_;
     arn = arn_;
     processed_records_count = processed_records_count_;
     failed_records_count = failed_records_count_;
     total_records_count = total_records_count_;
   }
    : batch_import)

let make_get_batch_import_jobs_request ?job_id:(job_id_ : identifier option)
    ?max_results:(max_results_ : batch_imports_max_page_size option)
    ?next_token:(next_token_ : string_ option) () =
  ({ job_id = job_id_; max_results = max_results_; next_token = next_token_ }
    : get_batch_import_jobs_request)

let make_aggregated_log_odds_metric ~variable_names:(variable_names_ : list_of_strings)
    ~aggregated_variables_importance:(aggregated_variables_importance_ : float_) () =
  ({
     variable_names = variable_names_;
     aggregated_variables_importance = aggregated_variables_importance_;
   }
    : aggregated_log_odds_metric)

let make_aggregated_variables_importance_metrics
    ?log_odds_metrics:(log_odds_metrics_ : list_of_aggregated_log_odds_metrics option) () =
  ({ log_odds_metrics = log_odds_metrics_ } : aggregated_variables_importance_metrics)

let make_log_odds_metric ~variable_name:(variable_name_ : string_)
    ~variable_type:(variable_type_ : string_) ~variable_importance:(variable_importance_ : float_)
    () =
  ({
     variable_name = variable_name_;
     variable_type = variable_type_;
     variable_importance = variable_importance_;
   }
    : log_odds_metric)

let make_variable_importance_metrics
    ?log_odds_metrics:(log_odds_metrics_ : list_of_log_odds_metrics option) () =
  ({ log_odds_metrics = log_odds_metrics_ } : variable_importance_metrics)

let make_uncertainty_range ~lower_bound_value:(lower_bound_value_ : float_)
    ~upper_bound_value:(upper_bound_value_ : float_) () =
  ({ lower_bound_value = lower_bound_value_; upper_bound_value = upper_bound_value_ }
    : uncertainty_range)

let make_tfi_model_performance ?auc:(auc_ : float_ option)
    ?uncertainty_range:(uncertainty_range_ : uncertainty_range option) () =
  ({ auc = auc_; uncertainty_range = uncertainty_range_ } : tfi_model_performance)

let make_tfi_metric_data_point ?fpr:(fpr_ : float_ option) ?precision:(precision_ : float_ option)
    ?tpr:(tpr_ : float_ option) ?threshold:(threshold_ : float_ option) () =
  ({ fpr = fpr_; precision = precision_; tpr = tpr_; threshold = threshold_ }
    : tfi_metric_data_point)

let make_tfi_training_metrics_value
    ?metric_data_points:(metric_data_points_ : tfi_metric_data_points_list option)
    ?model_performance:(model_performance_ : tfi_model_performance option) () =
  ({ metric_data_points = metric_data_points_; model_performance = model_performance_ }
    : tfi_training_metrics_value)

let make_ofi_model_performance ?auc:(auc_ : float_ option)
    ?uncertainty_range:(uncertainty_range_ : uncertainty_range option) () =
  ({ auc = auc_; uncertainty_range = uncertainty_range_ } : ofi_model_performance)

let make_ofi_metric_data_point ?fpr:(fpr_ : float_ option) ?precision:(precision_ : float_ option)
    ?tpr:(tpr_ : float_ option) ?threshold:(threshold_ : float_ option) () =
  ({ fpr = fpr_; precision = precision_; tpr = tpr_; threshold = threshold_ }
    : ofi_metric_data_point)

let make_ofi_training_metrics_value
    ?metric_data_points:(metric_data_points_ : ofi_metric_data_points_list option)
    ?model_performance:(model_performance_ : ofi_model_performance option) () =
  ({ metric_data_points = metric_data_points_; model_performance = model_performance_ }
    : ofi_training_metrics_value)

let make_training_metrics_v2 ?ofi:(ofi_ : ofi_training_metrics_value option)
    ?tfi:(tfi_ : tfi_training_metrics_value option) ?ati:(ati_ : ati_training_metrics_value option)
    () =
  ({ ofi = ofi_; tfi = tfi_; ati = ati_ } : training_metrics_v2)

let make_field_validation_message ?field_name:(field_name_ : string_ option)
    ?identifier:(identifier_ : string_ option) ?title:(title_ : string_ option)
    ?content:(content_ : string_ option) ?type_:(type__ : string_ option) () =
  ({
     field_name = field_name_;
     identifier = identifier_;
     title = title_;
     content = content_;
     type_ = type__;
   }
    : field_validation_message)

let make_file_validation_message ?title:(title_ : string_ option)
    ?content:(content_ : string_ option) ?type_:(type__ : string_ option) () =
  ({ title = title_; content = content_; type_ = type__ } : file_validation_message)

let make_data_validation_metrics
    ?file_level_messages:(file_level_messages_ : file_validation_message_list option)
    ?field_level_messages:(field_level_messages_ : field_validation_message_list option) () =
  ({ file_level_messages = file_level_messages_; field_level_messages = field_level_messages_ }
    : data_validation_metrics)

let make_training_result_v2
    ?data_validation_metrics:(data_validation_metrics_ : data_validation_metrics option)
    ?training_metrics_v2:(training_metrics_v2_ : training_metrics_v2 option)
    ?variable_importance_metrics:(variable_importance_metrics_ : variable_importance_metrics option)
    ?aggregated_variables_importance_metrics:
      (aggregated_variables_importance_metrics_ : aggregated_variables_importance_metrics option) ()
    =
  ({
     data_validation_metrics = data_validation_metrics_;
     training_metrics_v2 = training_metrics_v2_;
     variable_importance_metrics = variable_importance_metrics_;
     aggregated_variables_importance_metrics = aggregated_variables_importance_metrics_;
   }
    : training_result_v2)

let make_metric_data_point ?fpr:(fpr_ : float_ option) ?precision:(precision_ : float_ option)
    ?tpr:(tpr_ : float_ option) ?threshold:(threshold_ : float_ option) () =
  ({ fpr = fpr_; precision = precision_; tpr = tpr_; threshold = threshold_ } : metric_data_point)

let make_training_metrics ?auc:(auc_ : float_ option)
    ?metric_data_points:(metric_data_points_ : metric_data_points_list option) () =
  ({ auc = auc_; metric_data_points = metric_data_points_ } : training_metrics)

let make_model_version_detail ?model_id:(model_id_ : model_identifier option)
    ?model_type:(model_type_ : model_type_enum option)
    ?model_version_number:(model_version_number_ : float_version_string option)
    ?status:(status_ : string_ option)
    ?training_data_source:(training_data_source_ : training_data_source_enum option)
    ?training_data_schema:(training_data_schema_ : training_data_schema option)
    ?external_events_detail:(external_events_detail_ : external_events_detail option)
    ?ingested_events_detail:(ingested_events_detail_ : ingested_events_detail option)
    ?training_result:(training_result_ : training_result option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?created_time:(created_time_ : time option) ?arn:(arn_ : fraud_detector_arn option)
    ?training_result_v2:(training_result_v2_ : training_result_v2 option) () =
  ({
     model_id = model_id_;
     model_type = model_type_;
     model_version_number = model_version_number_;
     status = status_;
     training_data_source = training_data_source_;
     training_data_schema = training_data_schema_;
     external_events_detail = external_events_detail_;
     ingested_events_detail = ingested_events_detail_;
     training_result = training_result_;
     last_updated_time = last_updated_time_;
     created_time = created_time_;
     arn = arn_;
     training_result_v2 = training_result_v2_;
   }
    : model_version_detail)

let make_describe_model_versions_request ?model_id:(model_id_ : model_identifier option)
    ?model_version_number:(model_version_number_ : float_version_string option)
    ?model_type:(model_type_ : model_type_enum option) ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : models_max_page_size option) () =
  ({
     model_id = model_id_;
     model_version_number = model_version_number_;
     model_type = model_type_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_model_versions_request)

let make_detector_version_summary
    ?detector_version_id:(detector_version_id_ : whole_number_version_string option)
    ?status:(status_ : detector_version_status option)
    ?description:(description_ : description option)
    ?last_updated_time:(last_updated_time_ : time option) () =
  ({
     detector_version_id = detector_version_id_;
     status = status_;
     description = description_;
     last_updated_time = last_updated_time_;
   }
    : detector_version_summary)

let make_describe_detector_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : detector_version_max_results option)
    ~detector_id:(detector_id_ : identifier) () =
  ({ detector_id = detector_id_; next_token = next_token_; max_results = max_results_ }
    : describe_detector_request)

let make_delete_variable_request ~name:(name_ : string_) () =
  ({ name = name_ } : delete_variable_request)

let make_delete_rule_request ~rule:(rule_ : rule) () = ({ rule = rule_ } : delete_rule_request)

let make_delete_outcome_request ~name:(name_ : identifier) () =
  ({ name = name_ } : delete_outcome_request)

let make_delete_model_version_request ~model_id:(model_id_ : model_identifier)
    ~model_type:(model_type_ : model_type_enum)
    ~model_version_number:(model_version_number_ : float_version_string) () =
  ({ model_id = model_id_; model_type = model_type_; model_version_number = model_version_number_ }
    : delete_model_version_request)

let make_delete_model_request ~model_id:(model_id_ : model_identifier)
    ~model_type:(model_type_ : model_type_enum) () =
  ({ model_id = model_id_; model_type = model_type_ } : delete_model_request)

let make_delete_list_request ~name:(name_ : no_dash_identifier) () =
  ({ name = name_ } : delete_list_request)

let make_delete_label_request ~name:(name_ : identifier) () =
  ({ name = name_ } : delete_label_request)

let make_delete_external_model_request
    ~model_endpoint:(model_endpoint_ : sage_maker_endpoint_identifier) () =
  ({ model_endpoint = model_endpoint_ } : delete_external_model_request)

let make_delete_event_type_request ~name:(name_ : identifier) () =
  ({ name = name_ } : delete_event_type_request)

let make_delete_events_by_event_type_request ~event_type_name:(event_type_name_ : identifier) () =
  ({ event_type_name = event_type_name_ } : delete_events_by_event_type_request)

let make_delete_event_request
    ?delete_audit_history:(delete_audit_history_ : delete_audit_history option)
    ~event_id:(event_id_ : identifier) ~event_type_name:(event_type_name_ : identifier) () =
  ({
     event_id = event_id_;
     event_type_name = event_type_name_;
     delete_audit_history = delete_audit_history_;
   }
    : delete_event_request)

let make_delete_entity_type_request ~name:(name_ : identifier) () =
  ({ name = name_ } : delete_entity_type_request)

let make_delete_detector_version_request ~detector_id:(detector_id_ : identifier)
    ~detector_version_id:(detector_version_id_ : whole_number_version_string) () =
  ({ detector_id = detector_id_; detector_version_id = detector_version_id_ }
    : delete_detector_version_request)

let make_delete_detector_request ~detector_id:(detector_id_ : identifier) () =
  ({ detector_id = detector_id_ } : delete_detector_request)

let make_delete_batch_prediction_job_request ~job_id:(job_id_ : identifier) () =
  ({ job_id = job_id_ } : delete_batch_prediction_job_request)

let make_delete_batch_import_job_request ~job_id:(job_id_ : identifier) () =
  ({ job_id = job_id_ } : delete_batch_import_job_request)

let make_create_variable_request ?description:(description_ : string_ option)
    ?variable_type:(variable_type_ : string_ option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : string_) ~data_type:(data_type_ : data_type)
    ~data_source:(data_source_ : data_source) ~default_value:(default_value_ : string_) () =
  ({
     name = name_;
     data_type = data_type_;
     data_source = data_source_;
     default_value = default_value_;
     description = description_;
     variable_type = variable_type_;
     tags = tags_;
   }
    : create_variable_request)

let make_create_rule_request ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option) ~rule_id:(rule_id_ : identifier)
    ~detector_id:(detector_id_ : identifier) ~expression:(expression_ : rule_expression)
    ~language:(language_ : language) ~outcomes:(outcomes_ : non_empty_list_of_strings) () =
  ({
     rule_id = rule_id_;
     detector_id = detector_id_;
     description = description_;
     expression = expression_;
     language = language_;
     outcomes = outcomes_;
     tags = tags_;
   }
    : create_rule_request)

let make_create_model_version_request
    ?external_events_detail:(external_events_detail_ : external_events_detail option)
    ?ingested_events_detail:(ingested_events_detail_ : ingested_events_detail option)
    ?tags:(tags_ : tag_list option) ~model_id:(model_id_ : model_identifier)
    ~model_type:(model_type_ : model_type_enum)
    ~training_data_source:(training_data_source_ : training_data_source_enum)
    ~training_data_schema:(training_data_schema_ : training_data_schema) () =
  ({
     model_id = model_id_;
     model_type = model_type_;
     training_data_source = training_data_source_;
     training_data_schema = training_data_schema_;
     external_events_detail = external_events_detail_;
     ingested_events_detail = ingested_events_detail_;
     tags = tags_;
   }
    : create_model_version_request)

let make_create_model_request ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option) ~model_id:(model_id_ : model_identifier)
    ~model_type:(model_type_ : model_type_enum) ~event_type_name:(event_type_name_ : string_) () =
  ({
     model_id = model_id_;
     model_type = model_type_;
     description = description_;
     event_type_name = event_type_name_;
     tags = tags_;
   }
    : create_model_request)

let make_create_list_request ?elements:(elements_ : elements_list option)
    ?variable_type:(variable_type_ : variable_type option)
    ?description:(description_ : description option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : no_dash_identifier) () =
  ({
     name = name_;
     elements = elements_;
     variable_type = variable_type_;
     description = description_;
     tags = tags_;
   }
    : create_list_request)

let make_create_detector_version_request ?description:(description_ : description option)
    ?external_model_endpoints:(external_model_endpoints_ : list_of_strings option)
    ?model_versions:(model_versions_ : list_of_model_versions option)
    ?rule_execution_mode:(rule_execution_mode_ : rule_execution_mode option)
    ?tags:(tags_ : tag_list option) ~detector_id:(detector_id_ : identifier)
    ~rules:(rules_ : rule_list) () =
  ({
     detector_id = detector_id_;
     description = description_;
     external_model_endpoints = external_model_endpoints_;
     rules = rules_;
     model_versions = model_versions_;
     rule_execution_mode = rule_execution_mode_;
     tags = tags_;
   }
    : create_detector_version_request)

let make_create_batch_prediction_job_request
    ?detector_version:(detector_version_ : whole_number_version_string option)
    ?tags:(tags_ : tag_list option) ~job_id:(job_id_ : identifier)
    ~input_path:(input_path_ : s3_bucket_location) ~output_path:(output_path_ : s3_bucket_location)
    ~event_type_name:(event_type_name_ : identifier) ~detector_name:(detector_name_ : identifier)
    ~iam_role_arn:(iam_role_arn_ : iam_role_arn) () =
  ({
     job_id = job_id_;
     input_path = input_path_;
     output_path = output_path_;
     event_type_name = event_type_name_;
     detector_name = detector_name_;
     detector_version = detector_version_;
     iam_role_arn = iam_role_arn_;
     tags = tags_;
   }
    : create_batch_prediction_job_request)

let make_create_batch_import_job_request ?tags:(tags_ : tag_list option)
    ~job_id:(job_id_ : identifier) ~input_path:(input_path_ : s3_bucket_location)
    ~output_path:(output_path_ : s3_bucket_location)
    ~event_type_name:(event_type_name_ : identifier) ~iam_role_arn:(iam_role_arn_ : iam_role_arn) ()
    =
  ({
     job_id = job_id_;
     input_path = input_path_;
     output_path = output_path_;
     event_type_name = event_type_name_;
     iam_role_arn = iam_role_arn_;
     tags = tags_;
   }
    : create_batch_import_job_request)

let make_cancel_batch_prediction_job_request ~job_id:(job_id_ : identifier) () =
  ({ job_id = job_id_ } : cancel_batch_prediction_job_request)

let make_cancel_batch_import_job_request ~job_id:(job_id_ : identifier) () =
  ({ job_id = job_id_ } : cancel_batch_import_job_request)

let make_batch_get_variable_error ?name:(name_ : string_ option) ?code:(code_ : integer2 option)
    ?message:(message_ : string_ option) () =
  ({ name = name_; code = code_; message = message_ } : batch_get_variable_error)

let make_batch_get_variable_request ~names:(names_ : name_list) () =
  ({ names = names_ } : batch_get_variable_request)

let make_batch_create_variable_error ?name:(name_ : string_ option) ?code:(code_ : integer2 option)
    ?message:(message_ : string_ option) () =
  ({ name = name_; code = code_; message = message_ } : batch_create_variable_error)

let make_variable_entry ?name:(name_ : string_ option) ?data_type:(data_type_ : string_ option)
    ?data_source:(data_source_ : string_ option) ?default_value:(default_value_ : string_ option)
    ?description:(description_ : string_ option) ?variable_type:(variable_type_ : string_ option) ()
    =
  ({
     name = name_;
     data_type = data_type_;
     data_source = data_source_;
     default_value = default_value_;
     description = description_;
     variable_type = variable_type_;
   }
    : variable_entry)

let make_batch_create_variable_request ?tags:(tags_ : tag_list option)
    ~variable_entries:(variable_entries_ : variable_entry_list) () =
  ({ variable_entries = variable_entries_; tags = tags_ } : batch_create_variable_request)
