open Types

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_label_schema
    ?unlabeled_events_treatment:(unlabeled_events_treatment_ : unlabeled_events_treatment option)
    ?label_mapper:(label_mapper_ : label_mapper option) () =
  ({ unlabeled_events_treatment = unlabeled_events_treatment_; label_mapper = label_mapper_ }
    : label_schema)

let make_training_data_schema ?label_schema:(label_schema_ : label_schema option)
    ~model_variables:(model_variables_ : list_of_strings) () =
  ({ label_schema = label_schema_; model_variables = model_variables_ } : training_data_schema)

let make_external_events_detail ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~data_location:(data_location_ : s3_bucket_location) () =
  ({ data_access_role_arn = data_access_role_arn_; data_location = data_location_ }
    : external_events_detail)

let make_ingested_events_time_window ~end_time:(end_time_ : time) ~start_time:(start_time_ : time)
    () =
  ({ end_time = end_time_; start_time = start_time_ } : ingested_events_time_window)

let make_ingested_events_detail
    ~ingested_events_time_window:(ingested_events_time_window_ : ingested_events_time_window) () =
  ({ ingested_events_time_window = ingested_events_time_window_ } : ingested_events_detail)

let make_file_validation_message ?type_:(type__ : string_ option)
    ?content:(content_ : string_ option) ?title:(title_ : string_ option) () =
  ({ type_ = type__; content = content_; title = title_ } : file_validation_message)

let make_field_validation_message ?type_:(type__ : string_ option)
    ?content:(content_ : string_ option) ?title:(title_ : string_ option)
    ?identifier:(identifier_ : string_ option) ?field_name:(field_name_ : string_ option) () =
  ({
     type_ = type__;
     content = content_;
     title = title_;
     identifier = identifier_;
     field_name = field_name_;
   }
    : field_validation_message)

let make_data_validation_metrics
    ?field_level_messages:(field_level_messages_ : field_validation_message_list option)
    ?file_level_messages:(file_level_messages_ : file_validation_message_list option) () =
  ({ field_level_messages = field_level_messages_; file_level_messages = file_level_messages_ }
    : data_validation_metrics)

let make_metric_data_point ?threshold:(threshold_ : float_ option) ?tpr:(tpr_ : float_ option)
    ?precision:(precision_ : float_ option) ?fpr:(fpr_ : float_ option) () =
  ({ threshold = threshold_; tpr = tpr_; precision = precision_; fpr = fpr_ } : metric_data_point)

let make_training_metrics ?metric_data_points:(metric_data_points_ : metric_data_points_list option)
    ?auc:(auc_ : float_ option) () =
  ({ metric_data_points = metric_data_points_; auc = auc_ } : training_metrics)

let make_log_odds_metric ~variable_importance:(variable_importance_ : float_)
    ~variable_type:(variable_type_ : string_) ~variable_name:(variable_name_ : string_) () =
  ({
     variable_importance = variable_importance_;
     variable_type = variable_type_;
     variable_name = variable_name_;
   }
    : log_odds_metric)

let make_variable_importance_metrics
    ?log_odds_metrics:(log_odds_metrics_ : list_of_log_odds_metrics option) () =
  ({ log_odds_metrics = log_odds_metrics_ } : variable_importance_metrics)

let make_ofi_metric_data_point ?threshold:(threshold_ : float_ option) ?tpr:(tpr_ : float_ option)
    ?precision:(precision_ : float_ option) ?fpr:(fpr_ : float_ option) () =
  ({ threshold = threshold_; tpr = tpr_; precision = precision_; fpr = fpr_ }
    : ofi_metric_data_point)

let make_uncertainty_range ~upper_bound_value:(upper_bound_value_ : float_)
    ~lower_bound_value:(lower_bound_value_ : float_) () =
  ({ upper_bound_value = upper_bound_value_; lower_bound_value = lower_bound_value_ }
    : uncertainty_range)

let make_ofi_model_performance ?uncertainty_range:(uncertainty_range_ : uncertainty_range option)
    ?auc:(auc_ : float_ option) () =
  ({ uncertainty_range = uncertainty_range_; auc = auc_ } : ofi_model_performance)

let make_ofi_training_metrics_value
    ?model_performance:(model_performance_ : ofi_model_performance option)
    ?metric_data_points:(metric_data_points_ : ofi_metric_data_points_list option) () =
  ({ model_performance = model_performance_; metric_data_points = metric_data_points_ }
    : ofi_training_metrics_value)

let make_tfi_metric_data_point ?threshold:(threshold_ : float_ option) ?tpr:(tpr_ : float_ option)
    ?precision:(precision_ : float_ option) ?fpr:(fpr_ : float_ option) () =
  ({ threshold = threshold_; tpr = tpr_; precision = precision_; fpr = fpr_ }
    : tfi_metric_data_point)

let make_tfi_model_performance ?uncertainty_range:(uncertainty_range_ : uncertainty_range option)
    ?auc:(auc_ : float_ option) () =
  ({ uncertainty_range = uncertainty_range_; auc = auc_ } : tfi_model_performance)

let make_tfi_training_metrics_value
    ?model_performance:(model_performance_ : tfi_model_performance option)
    ?metric_data_points:(metric_data_points_ : tfi_metric_data_points_list option) () =
  ({ model_performance = model_performance_; metric_data_points = metric_data_points_ }
    : tfi_training_metrics_value)

let make_ati_metric_data_point ?atodr:(atodr_ : float_ option)
    ?threshold:(threshold_ : float_ option) ?adr:(adr_ : float_ option) ?cr:(cr_ : float_ option) ()
    =
  ({ atodr = atodr_; threshold = threshold_; adr = adr_; cr = cr_ } : ati_metric_data_point)

let make_ati_model_performance ?asi:(asi_ : float_ option) () =
  ({ asi = asi_ } : ati_model_performance)

let make_ati_training_metrics_value
    ?model_performance:(model_performance_ : ati_model_performance option)
    ?metric_data_points:(metric_data_points_ : ati_metric_data_points_list option) () =
  ({ model_performance = model_performance_; metric_data_points = metric_data_points_ }
    : ati_training_metrics_value)

let make_training_metrics_v2 ?ati:(ati_ : ati_training_metrics_value option)
    ?tfi:(tfi_ : tfi_training_metrics_value option) ?ofi:(ofi_ : ofi_training_metrics_value option)
    () =
  ({ ati = ati_; tfi = tfi_; ofi = ofi_ } : training_metrics_v2)

let make_aggregated_log_odds_metric
    ~aggregated_variables_importance:(aggregated_variables_importance_ : float_)
    ~variable_names:(variable_names_ : list_of_strings) () =
  ({
     aggregated_variables_importance = aggregated_variables_importance_;
     variable_names = variable_names_;
   }
    : aggregated_log_odds_metric)

let make_aggregated_variables_importance_metrics
    ?log_odds_metrics:(log_odds_metrics_ : list_of_aggregated_log_odds_metrics option) () =
  ({ log_odds_metrics = log_odds_metrics_ } : aggregated_variables_importance_metrics)

let make_training_result_v2
    ?aggregated_variables_importance_metrics:
      (aggregated_variables_importance_metrics_ : aggregated_variables_importance_metrics option)
    ?variable_importance_metrics:(variable_importance_metrics_ : variable_importance_metrics option)
    ?training_metrics_v2:(training_metrics_v2_ : training_metrics_v2 option)
    ?data_validation_metrics:(data_validation_metrics_ : data_validation_metrics option) () =
  ({
     aggregated_variables_importance_metrics = aggregated_variables_importance_metrics_;
     variable_importance_metrics = variable_importance_metrics_;
     training_metrics_v2 = training_metrics_v2_;
     data_validation_metrics = data_validation_metrics_;
   }
    : training_result_v2)

let make_model_version_detail ?training_result_v2:(training_result_v2_ : training_result_v2 option)
    ?arn:(arn_ : fraud_detector_arn option) ?created_time:(created_time_ : time option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?training_result:(training_result_ : training_result option)
    ?ingested_events_detail:(ingested_events_detail_ : ingested_events_detail option)
    ?external_events_detail:(external_events_detail_ : external_events_detail option)
    ?training_data_schema:(training_data_schema_ : training_data_schema option)
    ?training_data_source:(training_data_source_ : training_data_source_enum option)
    ?status:(status_ : string_ option)
    ?model_version_number:(model_version_number_ : float_version_string option)
    ?model_type:(model_type_ : model_type_enum option)
    ?model_id:(model_id_ : model_identifier option) () =
  ({
     training_result_v2 = training_result_v2_;
     arn = arn_;
     created_time = created_time_;
     last_updated_time = last_updated_time_;
     training_result = training_result_;
     ingested_events_detail = ingested_events_detail_;
     external_events_detail = external_events_detail_;
     training_data_schema = training_data_schema_;
     training_data_source = training_data_source_;
     status = status_;
     model_version_number = model_version_number_;
     model_type = model_type_;
     model_id = model_id_;
   }
    : model_version_detail)

let make_model ?arn:(arn_ : fraud_detector_arn option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?created_time:(created_time_ : time option) ?event_type_name:(event_type_name_ : string_ option)
    ?description:(description_ : description option)
    ?model_type:(model_type_ : model_type_enum option)
    ?model_id:(model_id_ : model_identifier option) () =
  ({
     arn = arn_;
     last_updated_time = last_updated_time_;
     created_time = created_time_;
     event_type_name = event_type_name_;
     description = description_;
     model_type = model_type_;
     model_id = model_id_;
   }
    : model)

let make_variable_impact_explanation ?log_odds_impact:(log_odds_impact_ : float_ option)
    ?relative_impact:(relative_impact_ : string_ option)
    ?event_variable_name:(event_variable_name_ : string_ option) () =
  ({
     log_odds_impact = log_odds_impact_;
     relative_impact = relative_impact_;
     event_variable_name = event_variable_name_;
   }
    : variable_impact_explanation)

let make_entity ~entity_id:(entity_id_ : entity_restricted_string)
    ~entity_type:(entity_type_ : string_) () =
  ({ entity_id = entity_id_; entity_type = entity_type_ } : entity)

let make_label ?arn:(arn_ : fraud_detector_arn option) ?created_time:(created_time_ : time option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?description:(description_ : description option) ?name:(name_ : string_ option) () =
  ({
     arn = arn_;
     created_time = created_time_;
     last_updated_time = last_updated_time_;
     description = description_;
     name = name_;
   }
    : label)

let make_ingested_event_statistics ?last_updated_time:(last_updated_time_ : time option)
    ?most_recent_event:(most_recent_event_ : time option)
    ?least_recent_event:(least_recent_event_ : time option)
    ?event_data_size_in_bytes:(event_data_size_in_bytes_ : long option)
    ?number_of_events:(number_of_events_ : long option) () =
  ({
     last_updated_time = last_updated_time_;
     most_recent_event = most_recent_event_;
     least_recent_event = least_recent_event_;
     event_data_size_in_bytes = event_data_size_in_bytes_;
     number_of_events = number_of_events_;
   }
    : ingested_event_statistics)

let make_event_orchestration ~event_bridge_enabled:(event_bridge_enabled_ : boolean_) () =
  ({ event_bridge_enabled = event_bridge_enabled_ } : event_orchestration)

let make_event_type ?event_orchestration:(event_orchestration_ : event_orchestration option)
    ?arn:(arn_ : fraud_detector_arn option) ?created_time:(created_time_ : time option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?ingested_event_statistics:(ingested_event_statistics_ : ingested_event_statistics option)
    ?event_ingestion:(event_ingestion_ : event_ingestion option)
    ?entity_types:(entity_types_ : non_empty_list_of_strings option)
    ?labels:(labels_ : list_of_strings option)
    ?event_variables:(event_variables_ : list_of_strings option)
    ?description:(description_ : description option) ?name:(name_ : string_ option) () =
  ({
     event_orchestration = event_orchestration_;
     arn = arn_;
     created_time = created_time_;
     last_updated_time = last_updated_time_;
     ingested_event_statistics = ingested_event_statistics_;
     event_ingestion = event_ingestion_;
     entity_types = entity_types_;
     labels = labels_;
     event_variables = event_variables_;
     description = description_;
     name = name_;
   }
    : event_type)

let make_entity_type ?arn:(arn_ : fraud_detector_arn option)
    ?created_time:(created_time_ : time option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?description:(description_ : description option) ?name:(name_ : string_ option) () =
  ({
     arn = arn_;
     created_time = created_time_;
     last_updated_time = last_updated_time_;
     description = description_;
     name = name_;
   }
    : entity_type)

let make_variable ?arn:(arn_ : fraud_detector_arn option)
    ?created_time:(created_time_ : time option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?variable_type:(variable_type_ : string_ option) ?description:(description_ : string_ option)
    ?default_value:(default_value_ : string_ option)
    ?data_source:(data_source_ : data_source option) ?data_type:(data_type_ : data_type option)
    ?name:(name_ : string_ option) () =
  ({
     arn = arn_;
     created_time = created_time_;
     last_updated_time = last_updated_time_;
     variable_type = variable_type_;
     description = description_;
     default_value = default_value_;
     data_source = data_source_;
     data_type = data_type_;
     name = name_;
   }
    : variable)

let make_variable_entry ?variable_type:(variable_type_ : string_ option)
    ?description:(description_ : string_ option) ?default_value:(default_value_ : string_ option)
    ?data_source:(data_source_ : string_ option) ?data_type:(data_type_ : string_ option)
    ?name:(name_ : string_ option) () =
  ({
     variable_type = variable_type_;
     description = description_;
     default_value = default_value_;
     data_source = data_source_;
     data_type = data_type_;
     name = name_;
   }
    : variable_entry)

let make_update_variable_request ?variable_type:(variable_type_ : string_ option)
    ?description:(description_ : string_ option) ?default_value:(default_value_ : string_ option)
    ~name:(name_ : string_) () =
  ({
     variable_type = variable_type_;
     description = description_;
     default_value = default_value_;
     name = name_;
   }
    : update_variable_request)

let make_rule ~rule_version:(rule_version_ : whole_number_version_string)
    ~rule_id:(rule_id_ : identifier) ~detector_id:(detector_id_ : identifier) () =
  ({ rule_version = rule_version_; rule_id = rule_id_; detector_id = detector_id_ } : rule)

let make_update_rule_version_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option)
    ~outcomes:(outcomes_ : non_empty_list_of_strings) ~language:(language_ : language)
    ~expression:(expression_ : rule_expression) ~rule:(rule_ : rule) () =
  ({
     tags = tags_;
     outcomes = outcomes_;
     language = language_;
     expression = expression_;
     description = description_;
     rule = rule_;
   }
    : update_rule_version_request)

let make_update_rule_metadata_request ~description:(description_ : description) ~rule:(rule_ : rule)
    () =
  ({ description = description_; rule = rule_ } : update_rule_metadata_request)

let make_update_model_version_status_request ~status:(status_ : model_version_status)
    ~model_version_number:(model_version_number_ : float_version_string)
    ~model_type:(model_type_ : model_type_enum) ~model_id:(model_id_ : model_identifier) () =
  ({
     status = status_;
     model_version_number = model_version_number_;
     model_type = model_type_;
     model_id = model_id_;
   }
    : update_model_version_status_request)

let make_update_model_version_request ?tags:(tags_ : tag_list option)
    ?ingested_events_detail:(ingested_events_detail_ : ingested_events_detail option)
    ?external_events_detail:(external_events_detail_ : external_events_detail option)
    ~major_version_number:(major_version_number_ : whole_number_version_string)
    ~model_type:(model_type_ : model_type_enum) ~model_id:(model_id_ : model_identifier) () =
  ({
     tags = tags_;
     ingested_events_detail = ingested_events_detail_;
     external_events_detail = external_events_detail_;
     major_version_number = major_version_number_;
     model_type = model_type_;
     model_id = model_id_;
   }
    : update_model_version_request)

let make_update_model_request ?description:(description_ : description option)
    ~model_type:(model_type_ : model_type_enum) ~model_id:(model_id_ : model_identifier) () =
  ({ description = description_; model_type = model_type_; model_id = model_id_ }
    : update_model_request)

let make_update_list_request ?variable_type:(variable_type_ : variable_type option)
    ?update_mode:(update_mode_ : list_update_mode option)
    ?description:(description_ : description option) ?elements:(elements_ : elements_list option)
    ~name:(name_ : no_dash_identifier) () =
  ({
     variable_type = variable_type_;
     update_mode = update_mode_;
     description = description_;
     elements = elements_;
     name = name_;
   }
    : update_list_request)

let make_update_event_label_request ~label_timestamp:(label_timestamp_ : utc_timestamp_is_o8601)
    ~assigned_label:(assigned_label_ : identifier) ~event_type_name:(event_type_name_ : identifier)
    ~event_id:(event_id_ : identifier) () =
  ({
     label_timestamp = label_timestamp_;
     assigned_label = assigned_label_;
     event_type_name = event_type_name_;
     event_id = event_id_;
   }
    : update_event_label_request)

let make_update_detector_version_status_request ~status:(status_ : detector_version_status)
    ~detector_version_id:(detector_version_id_ : whole_number_version_string)
    ~detector_id:(detector_id_ : identifier) () =
  ({ status = status_; detector_version_id = detector_version_id_; detector_id = detector_id_ }
    : update_detector_version_status_request)

let make_model_version ?arn:(arn_ : fraud_detector_arn option)
    ~model_version_number:(model_version_number_ : float_version_string)
    ~model_type:(model_type_ : model_type_enum) ~model_id:(model_id_ : model_identifier) () =
  ({
     arn = arn_;
     model_version_number = model_version_number_;
     model_type = model_type_;
     model_id = model_id_;
   }
    : model_version)

let make_update_detector_version_request
    ?rule_execution_mode:(rule_execution_mode_ : rule_execution_mode option)
    ?model_versions:(model_versions_ : list_of_model_versions option)
    ?description:(description_ : description option) ~rules:(rules_ : rule_list)
    ~external_model_endpoints:(external_model_endpoints_ : list_of_strings)
    ~detector_version_id:(detector_version_id_ : whole_number_version_string)
    ~detector_id:(detector_id_ : identifier) () =
  ({
     rule_execution_mode = rule_execution_mode_;
     model_versions = model_versions_;
     description = description_;
     rules = rules_;
     external_model_endpoints = external_model_endpoints_;
     detector_version_id = detector_version_id_;
     detector_id = detector_id_;
   }
    : update_detector_version_request)

let make_update_detector_version_metadata_request ~description:(description_ : description)
    ~detector_version_id:(detector_version_id_ : whole_number_version_string)
    ~detector_id:(detector_id_ : identifier) () =
  ({
     description = description_;
     detector_version_id = detector_version_id_;
     detector_id = detector_id_;
   }
    : update_detector_version_metadata_request)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : fraud_detector_arn) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : fraud_detector_arn) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_send_event_request ?label_timestamp:(label_timestamp_ : utc_timestamp_is_o8601 option)
    ?assigned_label:(assigned_label_ : identifier option) ~entities:(entities_ : list_of_entities)
    ~event_variables:(event_variables_ : event_variable_map)
    ~event_timestamp:(event_timestamp_ : utc_timestamp_is_o8601)
    ~event_type_name:(event_type_name_ : identifier) ~event_id:(event_id_ : identifier) () =
  ({
     entities = entities_;
     label_timestamp = label_timestamp_;
     assigned_label = assigned_label_;
     event_variables = event_variables_;
     event_timestamp = event_timestamp_;
     event_type_name = event_type_name_;
     event_id = event_id_;
   }
    : send_event_request)

let make_rule_detail ?arn:(arn_ : fraud_detector_arn option)
    ?created_time:(created_time_ : time option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?outcomes:(outcomes_ : non_empty_list_of_strings option) ?language:(language_ : language option)
    ?expression:(expression_ : rule_expression option)
    ?rule_version:(rule_version_ : whole_number_version_string option)
    ?detector_id:(detector_id_ : identifier option) ?description:(description_ : description option)
    ?rule_id:(rule_id_ : identifier option) () =
  ({
     arn = arn_;
     created_time = created_time_;
     last_updated_time = last_updated_time_;
     outcomes = outcomes_;
     language = language_;
     expression = expression_;
     rule_version = rule_version_;
     detector_id = detector_id_;
     description = description_;
     rule_id = rule_id_;
   }
    : rule_detail)

let make_put_outcome_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option) ~name:(name_ : identifier) () =
  ({ tags = tags_; description = description_; name = name_ } : put_outcome_request)

let make_put_label_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option) ~name:(name_ : identifier) () =
  ({ tags = tags_; description = description_; name = name_ } : put_label_request)

let make_put_kms_encryption_key_request
    ~kms_encryption_key_arn:(kms_encryption_key_arn_ : kms_encryption_key_arn) () =
  ({ kms_encryption_key_arn = kms_encryption_key_arn_ } : put_kms_encryption_key_request)

let make_model_input_configuration
    ?csv_input_template:(csv_input_template_ : model_input_template option)
    ?json_input_template:(json_input_template_ : model_input_template option)
    ?format:(format_ : model_input_data_format option)
    ?event_type_name:(event_type_name_ : identifier option)
    ~use_event_variables:(use_event_variables_ : use_event_variables) () =
  ({
     csv_input_template = csv_input_template_;
     json_input_template = json_input_template_;
     use_event_variables = use_event_variables_;
     format = format_;
     event_type_name = event_type_name_;
   }
    : model_input_configuration)

let make_model_output_configuration
    ?csv_index_to_variable_map:(csv_index_to_variable_map_ : csv_index_to_variable_map option)
    ?json_key_to_variable_map:(json_key_to_variable_map_ : json_key_to_variable_map option)
    ~format:(format_ : model_output_data_format) () =
  ({
     csv_index_to_variable_map = csv_index_to_variable_map_;
     json_key_to_variable_map = json_key_to_variable_map_;
     format = format_;
   }
    : model_output_configuration)

let make_put_external_model_request ?tags:(tags_ : tag_list option)
    ~model_endpoint_status:(model_endpoint_status_ : model_endpoint_status)
    ~output_configuration:(output_configuration_ : model_output_configuration)
    ~input_configuration:(input_configuration_ : model_input_configuration)
    ~invoke_model_endpoint_role_arn:(invoke_model_endpoint_role_arn_ : string_)
    ~model_source:(model_source_ : model_source)
    ~model_endpoint:(model_endpoint_ : sage_maker_endpoint_identifier) () =
  ({
     tags = tags_;
     model_endpoint_status = model_endpoint_status_;
     output_configuration = output_configuration_;
     input_configuration = input_configuration_;
     invoke_model_endpoint_role_arn = invoke_model_endpoint_role_arn_;
     model_source = model_source_;
     model_endpoint = model_endpoint_;
   }
    : put_external_model_request)

let make_put_event_type_request
    ?event_orchestration:(event_orchestration_ : event_orchestration option)
    ?tags:(tags_ : tag_list option) ?event_ingestion:(event_ingestion_ : event_ingestion option)
    ?labels:(labels_ : list_of_strings option) ?description:(description_ : description option)
    ~entity_types:(entity_types_ : non_empty_list_of_strings)
    ~event_variables:(event_variables_ : non_empty_list_of_strings) ~name:(name_ : identifier) () =
  ({
     event_orchestration = event_orchestration_;
     tags = tags_;
     event_ingestion = event_ingestion_;
     entity_types = entity_types_;
     labels = labels_;
     event_variables = event_variables_;
     description = description_;
     name = name_;
   }
    : put_event_type_request)

let make_put_entity_type_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option) ~name:(name_ : identifier) () =
  ({ tags = tags_; description = description_; name = name_ } : put_entity_type_request)

let make_put_detector_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option)
    ~event_type_name:(event_type_name_ : identifier) ~detector_id:(detector_id_ : identifier) () =
  ({
     tags = tags_;
     event_type_name = event_type_name_;
     description = description_;
     detector_id = detector_id_;
   }
    : put_detector_request)

let make_prediction_time_range ~end_time:(end_time_ : time) ~start_time:(start_time_ : time) () =
  ({ end_time = end_time_; start_time = start_time_ } : prediction_time_range)

let make_aggregated_variables_impact_explanation ?log_odds_impact:(log_odds_impact_ : float_ option)
    ?relative_impact:(relative_impact_ : string_ option)
    ?event_variable_names:(event_variable_names_ : list_of_strings option) () =
  ({
     log_odds_impact = log_odds_impact_;
     relative_impact = relative_impact_;
     event_variable_names = event_variable_names_;
   }
    : aggregated_variables_impact_explanation)

let make_prediction_explanations
    ?aggregated_variables_impact_explanations:
      (aggregated_variables_impact_explanations_ :
         list_of_aggregated_variables_impact_explanations option)
    ?variable_impact_explanations:
      (variable_impact_explanations_ : list_of_variable_impact_explanations option) () =
  ({
     aggregated_variables_impact_explanations = aggregated_variables_impact_explanations_;
     variable_impact_explanations = variable_impact_explanations_;
   }
    : prediction_explanations)

let make_outcome ?arn:(arn_ : fraud_detector_arn option) ?created_time:(created_time_ : time option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?description:(description_ : description option) ?name:(name_ : identifier option) () =
  ({
     arn = arn_;
     created_time = created_time_;
     last_updated_time = last_updated_time_;
     description = description_;
     name = name_;
   }
    : outcome)

let make_model_version_evaluation
    ?prediction_explanations:(prediction_explanations_ : prediction_explanations option)
    ?evaluation_score:(evaluation_score_ : string_ option)
    ?output_variable_name:(output_variable_name_ : string_ option) () =
  ({
     prediction_explanations = prediction_explanations_;
     evaluation_score = evaluation_score_;
     output_variable_name = output_variable_name_;
   }
    : model_version_evaluation)

let make_model_scores ?scores:(scores_ : model_prediction_map option)
    ?model_version:(model_version_ : model_version option) () =
  ({ scores = scores_; model_version = model_version_ } : model_scores)

let make_model_endpoint_data_blob ?content_type:(content_type_ : content_type option)
    ?byte_buffer:(byte_buffer_ : blob option) () =
  ({ content_type = content_type_; byte_buffer = byte_buffer_ } : model_endpoint_data_blob)

let make_list_tags_for_resource_request ?max_results:(max_results_ : tags_max_results option)
    ?next_token:(next_token_ : string_ option) ~resource_ar_n:(resource_ar_n_ : fraud_detector_arn)
    () =
  ({ max_results = max_results_; next_token = next_token_; resource_ar_n = resource_ar_n_ }
    : list_tags_for_resource_request)

let make_external_model_summary ?model_source:(model_source_ : model_source option)
    ?model_endpoint:(model_endpoint_ : string_ option) () =
  ({ model_source = model_source_; model_endpoint = model_endpoint_ } : external_model_summary)

let make_external_model_outputs ?outputs:(outputs_ : external_model_prediction_map option)
    ?external_model:(external_model_ : external_model_summary option) () =
  ({ outputs = outputs_; external_model = external_model_ } : external_model_outputs)

let make_event_variable_summary ?source:(source_ : sensitive_string option)
    ?value:(value_ : sensitive_string option) ?name:(name_ : sensitive_string option) () =
  ({ source = source_; value = value_; name = name_ } : event_variable_summary)

let make_event_prediction_summary
    ?detector_version_id:(detector_version_id_ : whole_number_version_string option)
    ?detector_id:(detector_id_ : identifier option)
    ?prediction_timestamp:(prediction_timestamp_ : time option)
    ?event_timestamp:(event_timestamp_ : time option)
    ?event_type_name:(event_type_name_ : identifier option)
    ?event_id:(event_id_ : identifier option) () =
  ({
     detector_version_id = detector_version_id_;
     detector_id = detector_id_;
     prediction_timestamp = prediction_timestamp_;
     event_timestamp = event_timestamp_;
     event_type_name = event_type_name_;
     event_id = event_id_;
   }
    : event_prediction_summary)

let make_evaluated_model_version
    ?evaluations:(evaluations_ : list_of_model_version_evaluations option)
    ?model_type:(model_type_ : string_ option) ?model_version:(model_version_ : string_ option)
    ?model_id:(model_id_ : string_ option) () =
  ({
     evaluations = evaluations_;
     model_type = model_type_;
     model_version = model_version_;
     model_id = model_id_;
   }
    : evaluated_model_version)

let make_evaluated_external_model ?output_variables:(output_variables_ : map_of_strings option)
    ?input_variables:(input_variables_ : map_of_strings option)
    ?use_event_variables:(use_event_variables_ : boolean_ option)
    ?model_endpoint:(model_endpoint_ : string_ option) () =
  ({
     output_variables = output_variables_;
     input_variables = input_variables_;
     use_event_variables = use_event_variables_;
     model_endpoint = model_endpoint_;
   }
    : evaluated_external_model)

let make_filter_condition ?value:(value_ : filter_string option) () =
  ({ value = value_ } : filter_condition)

let make_list_event_predictions_request
    ?max_results:(max_results_ : event_predictions_max_results option)
    ?next_token:(next_token_ : string_ option)
    ?prediction_time_range:(prediction_time_range_ : prediction_time_range option)
    ?detector_version_id:(detector_version_id_ : filter_condition option)
    ?detector_id:(detector_id_ : filter_condition option)
    ?event_type:(event_type_ : filter_condition option)
    ?event_id:(event_id_ : filter_condition option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     prediction_time_range = prediction_time_range_;
     detector_version_id = detector_version_id_;
     detector_id = detector_id_;
     event_type = event_type_;
     event_id = event_id_;
   }
    : list_event_predictions_request)

let make_kms_key ?kms_encryption_key_arn:(kms_encryption_key_arn_ : kms_encryption_key_arn option)
    () =
  ({ kms_encryption_key_arn = kms_encryption_key_arn_ } : kms_key)

let make_get_variables_request ?max_results:(max_results_ : variables_max_results option)
    ?next_token:(next_token_ : string_ option) ?name:(name_ : string_ option) () =
  ({ max_results = max_results_; next_token = next_token_; name = name_ } : get_variables_request)

let make_get_rules_request ?max_results:(max_results_ : rules_max_results option)
    ?next_token:(next_token_ : string_ option)
    ?rule_version:(rule_version_ : whole_number_version_string option)
    ?rule_id:(rule_id_ : identifier option) ~detector_id:(detector_id_ : identifier) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     rule_version = rule_version_;
     detector_id = detector_id_;
     rule_id = rule_id_;
   }
    : get_rules_request)

let make_get_outcomes_request ?max_results:(max_results_ : outcomes_max_results option)
    ?next_token:(next_token_ : string_ option) ?name:(name_ : identifier option) () =
  ({ max_results = max_results_; next_token = next_token_; name = name_ } : get_outcomes_request)

let make_get_models_request ?max_results:(max_results_ : models_max_page_size option)
    ?next_token:(next_token_ : string_ option) ?model_type:(model_type_ : model_type_enum option)
    ?model_id:(model_id_ : model_identifier option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     model_type = model_type_;
     model_id = model_id_;
   }
    : get_models_request)

let make_get_model_version_request
    ~model_version_number:(model_version_number_ : float_version_string)
    ~model_type:(model_type_ : model_type_enum) ~model_id:(model_id_ : model_identifier) () =
  ({ model_version_number = model_version_number_; model_type = model_type_; model_id = model_id_ }
    : get_model_version_request)

let make_allow_deny_list ?arn:(arn_ : fraud_detector_arn option)
    ?updated_time:(updated_time_ : time option) ?created_time:(created_time_ : time option)
    ?variable_type:(variable_type_ : variable_type option)
    ?description:(description_ : description option) ~name:(name_ : no_dash_identifier) () =
  ({
     arn = arn_;
     updated_time = updated_time_;
     created_time = created_time_;
     variable_type = variable_type_;
     description = description_;
     name = name_;
   }
    : allow_deny_list)

let make_get_lists_metadata_request ?max_results:(max_results_ : lists_metadata_max_results option)
    ?next_token:(next_token_ : next_token option) ?name:(name_ : no_dash_identifier option) () =
  ({ max_results = max_results_; next_token = next_token_; name = name_ }
    : get_lists_metadata_request)

let make_get_list_elements_request ?max_results:(max_results_ : lists_elements_max_results option)
    ?next_token:(next_token_ : next_token option) ~name:(name_ : no_dash_identifier) () =
  ({ max_results = max_results_; next_token = next_token_; name = name_ }
    : get_list_elements_request)

let make_get_labels_request ?max_results:(max_results_ : labels_max_results option)
    ?next_token:(next_token_ : string_ option) ?name:(name_ : identifier option) () =
  ({ max_results = max_results_; next_token = next_token_; name = name_ } : get_labels_request)

let make_external_model ?arn:(arn_ : fraud_detector_arn option)
    ?created_time:(created_time_ : time option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?model_endpoint_status:(model_endpoint_status_ : model_endpoint_status option)
    ?output_configuration:(output_configuration_ : model_output_configuration option)
    ?input_configuration:(input_configuration_ : model_input_configuration option)
    ?invoke_model_endpoint_role_arn:(invoke_model_endpoint_role_arn_ : string_ option)
    ?model_source:(model_source_ : model_source option)
    ?model_endpoint:(model_endpoint_ : string_ option) () =
  ({
     arn = arn_;
     created_time = created_time_;
     last_updated_time = last_updated_time_;
     model_endpoint_status = model_endpoint_status_;
     output_configuration = output_configuration_;
     input_configuration = input_configuration_;
     invoke_model_endpoint_role_arn = invoke_model_endpoint_role_arn_;
     model_source = model_source_;
     model_endpoint = model_endpoint_;
   }
    : external_model)

let make_get_external_models_request
    ?max_results:(max_results_ : external_models_max_results option)
    ?next_token:(next_token_ : string_ option) ?model_endpoint:(model_endpoint_ : string_ option) ()
    =
  ({ max_results = max_results_; next_token = next_token_; model_endpoint = model_endpoint_ }
    : get_external_models_request)

let make_get_event_types_request ?max_results:(max_results_ : event_types_max_results option)
    ?next_token:(next_token_ : string_ option) ?name:(name_ : identifier option) () =
  ({ max_results = max_results_; next_token = next_token_; name = name_ } : get_event_types_request)

let make_event ?entities:(entities_ : list_of_entities option)
    ?label_timestamp:(label_timestamp_ : string_ option)
    ?current_label:(current_label_ : string_ option)
    ?event_variables:(event_variables_ : event_attribute_map option)
    ?event_timestamp:(event_timestamp_ : string_ option)
    ?event_type_name:(event_type_name_ : string_ option) ?event_id:(event_id_ : string_ option) () =
  ({
     entities = entities_;
     label_timestamp = label_timestamp_;
     current_label = current_label_;
     event_variables = event_variables_;
     event_timestamp = event_timestamp_;
     event_type_name = event_type_name_;
     event_id = event_id_;
   }
    : event)

let make_get_event_request ~event_type_name:(event_type_name_ : string_)
    ~event_id:(event_id_ : string_) () =
  ({ event_type_name = event_type_name_; event_id = event_id_ } : get_event_request)

let make_get_event_prediction_request
    ?external_model_endpoint_data_blobs:
      (external_model_endpoint_data_blobs_ : external_model_endpoint_data_blob_map option)
    ?detector_version_id:(detector_version_id_ : whole_number_version_string option)
    ~event_variables:(event_variables_ : event_variable_map)
    ~event_timestamp:(event_timestamp_ : utc_timestamp_is_o8601)
    ~entities:(entities_ : list_of_entities) ~event_type_name:(event_type_name_ : string_)
    ~event_id:(event_id_ : string_) ~detector_id:(detector_id_ : string_) () =
  ({
     external_model_endpoint_data_blobs = external_model_endpoint_data_blobs_;
     event_variables = event_variables_;
     event_timestamp = event_timestamp_;
     entities = entities_;
     event_type_name = event_type_name_;
     event_id = event_id_;
     detector_version_id = detector_version_id_;
     detector_id = detector_id_;
   }
    : get_event_prediction_request)

let make_evaluated_rule ?matched:(matched_ : boolean_ option)
    ?evaluated:(evaluated_ : boolean_ option) ?outcomes:(outcomes_ : list_of_strings option)
    ?expression_with_values:(expression_with_values_ : sensitive_string option)
    ?expression:(expression_ : sensitive_string option)
    ?rule_version:(rule_version_ : whole_number_version_string option)
    ?rule_id:(rule_id_ : identifier option) () =
  ({
     matched = matched_;
     evaluated = evaluated_;
     outcomes = outcomes_;
     expression_with_values = expression_with_values_;
     expression = expression_;
     rule_version = rule_version_;
     rule_id = rule_id_;
   }
    : evaluated_rule)

let make_get_event_prediction_metadata_request ~prediction_timestamp:(prediction_timestamp_ : time)
    ~detector_version_id:(detector_version_id_ : whole_number_version_string)
    ~detector_id:(detector_id_ : identifier) ~event_type_name:(event_type_name_ : identifier)
    ~event_id:(event_id_ : identifier) () =
  ({
     prediction_timestamp = prediction_timestamp_;
     detector_version_id = detector_version_id_;
     detector_id = detector_id_;
     event_type_name = event_type_name_;
     event_id = event_id_;
   }
    : get_event_prediction_metadata_request)

let make_get_entity_types_request ?max_results:(max_results_ : entity_types_max_results option)
    ?next_token:(next_token_ : string_ option) ?name:(name_ : identifier option) () =
  ({ max_results = max_results_; next_token = next_token_; name = name_ }
    : get_entity_types_request)

let make_detector ?arn:(arn_ : fraud_detector_arn option)
    ?created_time:(created_time_ : time option)
    ?last_updated_time:(last_updated_time_ : time option)
    ?event_type_name:(event_type_name_ : identifier option)
    ?description:(description_ : description option) ?detector_id:(detector_id_ : identifier option)
    () =
  ({
     arn = arn_;
     created_time = created_time_;
     last_updated_time = last_updated_time_;
     event_type_name = event_type_name_;
     description = description_;
     detector_id = detector_id_;
   }
    : detector)

let make_get_detectors_request ?max_results:(max_results_ : detectors_max_results option)
    ?next_token:(next_token_ : string_ option) ?detector_id:(detector_id_ : identifier option) () =
  ({ max_results = max_results_; next_token = next_token_; detector_id = detector_id_ }
    : get_detectors_request)

let make_get_detector_version_request
    ~detector_version_id:(detector_version_id_ : whole_number_version_string)
    ~detector_id:(detector_id_ : identifier) () =
  ({ detector_version_id = detector_version_id_; detector_id = detector_id_ }
    : get_detector_version_request)

let make_get_delete_events_by_event_type_status_request
    ~event_type_name:(event_type_name_ : identifier) () =
  ({ event_type_name = event_type_name_ } : get_delete_events_by_event_type_status_request)

let make_batch_prediction ?total_records_count:(total_records_count_ : integer option)
    ?processed_records_count:(processed_records_count_ : integer option)
    ?arn:(arn_ : fraud_detector_arn option) ?iam_role_arn:(iam_role_arn_ : iam_role_arn option)
    ?detector_version:(detector_version_ : float_version_string option)
    ?detector_name:(detector_name_ : identifier option)
    ?event_type_name:(event_type_name_ : identifier option)
    ?output_path:(output_path_ : s3_bucket_location option)
    ?input_path:(input_path_ : s3_bucket_location option)
    ?last_heartbeat_time:(last_heartbeat_time_ : time option)
    ?completion_time:(completion_time_ : time option) ?start_time:(start_time_ : time option)
    ?failure_reason:(failure_reason_ : string_ option) ?status:(status_ : async_job_status option)
    ?job_id:(job_id_ : identifier option) () =
  ({
     total_records_count = total_records_count_;
     processed_records_count = processed_records_count_;
     arn = arn_;
     iam_role_arn = iam_role_arn_;
     detector_version = detector_version_;
     detector_name = detector_name_;
     event_type_name = event_type_name_;
     output_path = output_path_;
     input_path = input_path_;
     last_heartbeat_time = last_heartbeat_time_;
     completion_time = completion_time_;
     start_time = start_time_;
     failure_reason = failure_reason_;
     status = status_;
     job_id = job_id_;
   }
    : batch_prediction)

let make_get_batch_prediction_jobs_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : batch_predictions_max_page_size option)
    ?job_id:(job_id_ : identifier option) () =
  ({ next_token = next_token_; max_results = max_results_; job_id = job_id_ }
    : get_batch_prediction_jobs_request)

let make_batch_import ?total_records_count:(total_records_count_ : integer option)
    ?failed_records_count:(failed_records_count_ : integer option)
    ?processed_records_count:(processed_records_count_ : integer option)
    ?arn:(arn_ : fraud_detector_arn option) ?iam_role_arn:(iam_role_arn_ : iam_role_arn option)
    ?event_type_name:(event_type_name_ : identifier option)
    ?output_path:(output_path_ : s3_bucket_location option)
    ?input_path:(input_path_ : s3_bucket_location option)
    ?completion_time:(completion_time_ : time option) ?start_time:(start_time_ : time option)
    ?failure_reason:(failure_reason_ : string_ option) ?status:(status_ : async_job_status option)
    ?job_id:(job_id_ : identifier option) () =
  ({
     total_records_count = total_records_count_;
     failed_records_count = failed_records_count_;
     processed_records_count = processed_records_count_;
     arn = arn_;
     iam_role_arn = iam_role_arn_;
     event_type_name = event_type_name_;
     output_path = output_path_;
     input_path = input_path_;
     completion_time = completion_time_;
     start_time = start_time_;
     failure_reason = failure_reason_;
     status = status_;
     job_id = job_id_;
   }
    : batch_import)

let make_get_batch_import_jobs_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : batch_imports_max_page_size option)
    ?job_id:(job_id_ : identifier option) () =
  ({ next_token = next_token_; max_results = max_results_; job_id = job_id_ }
    : get_batch_import_jobs_request)

let make_detector_version_summary ?last_updated_time:(last_updated_time_ : time option)
    ?description:(description_ : description option)
    ?status:(status_ : detector_version_status option)
    ?detector_version_id:(detector_version_id_ : whole_number_version_string option) () =
  ({
     last_updated_time = last_updated_time_;
     description = description_;
     status = status_;
     detector_version_id = detector_version_id_;
   }
    : detector_version_summary)

let make_describe_model_versions_request ?max_results:(max_results_ : models_max_page_size option)
    ?next_token:(next_token_ : string_ option) ?model_type:(model_type_ : model_type_enum option)
    ?model_version_number:(model_version_number_ : float_version_string option)
    ?model_id:(model_id_ : model_identifier option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     model_type = model_type_;
     model_version_number = model_version_number_;
     model_id = model_id_;
   }
    : describe_model_versions_request)

let make_describe_detector_request ?max_results:(max_results_ : detector_version_max_results option)
    ?next_token:(next_token_ : string_ option) ~detector_id:(detector_id_ : identifier) () =
  ({ max_results = max_results_; next_token = next_token_; detector_id = detector_id_ }
    : describe_detector_request)

let make_delete_variable_request ~name:(name_ : string_) () =
  ({ name = name_ } : delete_variable_request)

let make_delete_rule_request ~rule:(rule_ : rule) () = ({ rule = rule_ } : delete_rule_request)

let make_delete_outcome_request ~name:(name_ : identifier) () =
  ({ name = name_ } : delete_outcome_request)

let make_delete_model_version_request
    ~model_version_number:(model_version_number_ : float_version_string)
    ~model_type:(model_type_ : model_type_enum) ~model_id:(model_id_ : model_identifier) () =
  ({ model_version_number = model_version_number_; model_type = model_type_; model_id = model_id_ }
    : delete_model_version_request)

let make_delete_model_request ~model_type:(model_type_ : model_type_enum)
    ~model_id:(model_id_ : model_identifier) () =
  ({ model_type = model_type_; model_id = model_id_ } : delete_model_request)

let make_delete_list_request ~name:(name_ : no_dash_identifier) () =
  ({ name = name_ } : delete_list_request)

let make_delete_label_request ~name:(name_ : identifier) () =
  ({ name = name_ } : delete_label_request)

let make_delete_external_model_request
    ~model_endpoint:(model_endpoint_ : sage_maker_endpoint_identifier) () =
  ({ model_endpoint = model_endpoint_ } : delete_external_model_request)

let make_delete_events_by_event_type_request ~event_type_name:(event_type_name_ : identifier) () =
  ({ event_type_name = event_type_name_ } : delete_events_by_event_type_request)

let make_delete_event_type_request ~name:(name_ : identifier) () =
  ({ name = name_ } : delete_event_type_request)

let make_delete_event_request
    ?delete_audit_history:(delete_audit_history_ : delete_audit_history option)
    ~event_type_name:(event_type_name_ : identifier) ~event_id:(event_id_ : identifier) () =
  ({
     delete_audit_history = delete_audit_history_;
     event_type_name = event_type_name_;
     event_id = event_id_;
   }
    : delete_event_request)

let make_delete_entity_type_request ~name:(name_ : identifier) () =
  ({ name = name_ } : delete_entity_type_request)

let make_delete_detector_version_request
    ~detector_version_id:(detector_version_id_ : whole_number_version_string)
    ~detector_id:(detector_id_ : identifier) () =
  ({ detector_version_id = detector_version_id_; detector_id = detector_id_ }
    : delete_detector_version_request)

let make_delete_detector_request ~detector_id:(detector_id_ : identifier) () =
  ({ detector_id = detector_id_ } : delete_detector_request)

let make_delete_batch_prediction_job_request ~job_id:(job_id_ : identifier) () =
  ({ job_id = job_id_ } : delete_batch_prediction_job_request)

let make_delete_batch_import_job_request ~job_id:(job_id_ : identifier) () =
  ({ job_id = job_id_ } : delete_batch_import_job_request)

let make_create_variable_request ?tags:(tags_ : tag_list option)
    ?variable_type:(variable_type_ : string_ option) ?description:(description_ : string_ option)
    ~default_value:(default_value_ : string_) ~data_source:(data_source_ : data_source)
    ~data_type:(data_type_ : data_type) ~name:(name_ : string_) () =
  ({
     tags = tags_;
     variable_type = variable_type_;
     description = description_;
     default_value = default_value_;
     data_source = data_source_;
     data_type = data_type_;
     name = name_;
   }
    : create_variable_request)

let make_create_rule_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option)
    ~outcomes:(outcomes_ : non_empty_list_of_strings) ~language:(language_ : language)
    ~expression:(expression_ : rule_expression) ~detector_id:(detector_id_ : identifier)
    ~rule_id:(rule_id_ : identifier) () =
  ({
     tags = tags_;
     outcomes = outcomes_;
     language = language_;
     expression = expression_;
     description = description_;
     detector_id = detector_id_;
     rule_id = rule_id_;
   }
    : create_rule_request)

let make_create_model_version_request ?tags:(tags_ : tag_list option)
    ?ingested_events_detail:(ingested_events_detail_ : ingested_events_detail option)
    ?external_events_detail:(external_events_detail_ : external_events_detail option)
    ~training_data_schema:(training_data_schema_ : training_data_schema)
    ~training_data_source:(training_data_source_ : training_data_source_enum)
    ~model_type:(model_type_ : model_type_enum) ~model_id:(model_id_ : model_identifier) () =
  ({
     tags = tags_;
     ingested_events_detail = ingested_events_detail_;
     external_events_detail = external_events_detail_;
     training_data_schema = training_data_schema_;
     training_data_source = training_data_source_;
     model_type = model_type_;
     model_id = model_id_;
   }
    : create_model_version_request)

let make_create_model_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option) ~event_type_name:(event_type_name_ : string_)
    ~model_type:(model_type_ : model_type_enum) ~model_id:(model_id_ : model_identifier) () =
  ({
     tags = tags_;
     event_type_name = event_type_name_;
     description = description_;
     model_type = model_type_;
     model_id = model_id_;
   }
    : create_model_request)

let make_create_list_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option)
    ?variable_type:(variable_type_ : variable_type option)
    ?elements:(elements_ : elements_list option) ~name:(name_ : no_dash_identifier) () =
  ({
     tags = tags_;
     description = description_;
     variable_type = variable_type_;
     elements = elements_;
     name = name_;
   }
    : create_list_request)

let make_create_detector_version_request ?tags:(tags_ : tag_list option)
    ?rule_execution_mode:(rule_execution_mode_ : rule_execution_mode option)
    ?model_versions:(model_versions_ : list_of_model_versions option)
    ?external_model_endpoints:(external_model_endpoints_ : list_of_strings option)
    ?description:(description_ : description option) ~rules:(rules_ : rule_list)
    ~detector_id:(detector_id_ : identifier) () =
  ({
     tags = tags_;
     rule_execution_mode = rule_execution_mode_;
     model_versions = model_versions_;
     rules = rules_;
     external_model_endpoints = external_model_endpoints_;
     description = description_;
     detector_id = detector_id_;
   }
    : create_detector_version_request)

let make_create_batch_prediction_job_request ?tags:(tags_ : tag_list option)
    ?detector_version:(detector_version_ : whole_number_version_string option)
    ~iam_role_arn:(iam_role_arn_ : iam_role_arn) ~detector_name:(detector_name_ : identifier)
    ~event_type_name:(event_type_name_ : identifier)
    ~output_path:(output_path_ : s3_bucket_location) ~input_path:(input_path_ : s3_bucket_location)
    ~job_id:(job_id_ : identifier) () =
  ({
     tags = tags_;
     iam_role_arn = iam_role_arn_;
     detector_version = detector_version_;
     detector_name = detector_name_;
     event_type_name = event_type_name_;
     output_path = output_path_;
     input_path = input_path_;
     job_id = job_id_;
   }
    : create_batch_prediction_job_request)

let make_create_batch_import_job_request ?tags:(tags_ : tag_list option)
    ~iam_role_arn:(iam_role_arn_ : iam_role_arn) ~event_type_name:(event_type_name_ : identifier)
    ~output_path:(output_path_ : s3_bucket_location) ~input_path:(input_path_ : s3_bucket_location)
    ~job_id:(job_id_ : identifier) () =
  ({
     tags = tags_;
     iam_role_arn = iam_role_arn_;
     event_type_name = event_type_name_;
     output_path = output_path_;
     input_path = input_path_;
     job_id = job_id_;
   }
    : create_batch_import_job_request)

let make_cancel_batch_prediction_job_request ~job_id:(job_id_ : identifier) () =
  ({ job_id = job_id_ } : cancel_batch_prediction_job_request)

let make_cancel_batch_import_job_request ~job_id:(job_id_ : identifier) () =
  ({ job_id = job_id_ } : cancel_batch_import_job_request)

let make_batch_get_variable_error ?message:(message_ : string_ option)
    ?code:(code_ : integer2 option) ?name:(name_ : string_ option) () =
  ({ message = message_; code = code_; name = name_ } : batch_get_variable_error)

let make_batch_get_variable_request ~names:(names_ : name_list) () =
  ({ names = names_ } : batch_get_variable_request)

let make_batch_create_variable_error ?message:(message_ : string_ option)
    ?code:(code_ : integer2 option) ?name:(name_ : string_ option) () =
  ({ message = message_; code = code_; name = name_ } : batch_create_variable_error)

let make_batch_create_variable_request ?tags:(tags_ : tag_list option)
    ~variable_entries:(variable_entries_ : variable_entry_list) () =
  ({ tags = tags_; variable_entries = variable_entries_ } : batch_create_variable_request)
