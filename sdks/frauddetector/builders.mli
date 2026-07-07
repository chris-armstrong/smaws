open Types

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_label_schema :
  ?unlabeled_events_treatment:unlabeled_events_treatment ->
  ?label_mapper:label_mapper ->
  unit ->
  label_schema

val make_training_data_schema :
  ?label_schema:label_schema -> model_variables:list_of_strings -> unit -> training_data_schema

val make_external_events_detail :
  data_access_role_arn:iam_role_arn ->
  data_location:s3_bucket_location ->
  unit ->
  external_events_detail

val make_ingested_events_time_window :
  end_time:time -> start_time:time -> unit -> ingested_events_time_window

val make_ingested_events_detail :
  ingested_events_time_window:ingested_events_time_window -> unit -> ingested_events_detail

val make_file_validation_message :
  ?type_:string_ -> ?content:string_ -> ?title:string_ -> unit -> file_validation_message

val make_field_validation_message :
  ?type_:string_ ->
  ?content:string_ ->
  ?title:string_ ->
  ?identifier:string_ ->
  ?field_name:string_ ->
  unit ->
  field_validation_message

val make_data_validation_metrics :
  ?field_level_messages:field_validation_message_list ->
  ?file_level_messages:file_validation_message_list ->
  unit ->
  data_validation_metrics

val make_metric_data_point :
  ?threshold:float_ -> ?tpr:float_ -> ?precision:float_ -> ?fpr:float_ -> unit -> metric_data_point

val make_training_metrics :
  ?metric_data_points:metric_data_points_list -> ?auc:float_ -> unit -> training_metrics

val make_log_odds_metric :
  variable_importance:float_ ->
  variable_type:string_ ->
  variable_name:string_ ->
  unit ->
  log_odds_metric

val make_variable_importance_metrics :
  ?log_odds_metrics:list_of_log_odds_metrics -> unit -> variable_importance_metrics

val make_ofi_metric_data_point :
  ?threshold:float_ ->
  ?tpr:float_ ->
  ?precision:float_ ->
  ?fpr:float_ ->
  unit ->
  ofi_metric_data_point

val make_uncertainty_range :
  upper_bound_value:float_ -> lower_bound_value:float_ -> unit -> uncertainty_range

val make_ofi_model_performance :
  ?uncertainty_range:uncertainty_range -> ?auc:float_ -> unit -> ofi_model_performance

val make_ofi_training_metrics_value :
  ?model_performance:ofi_model_performance ->
  ?metric_data_points:ofi_metric_data_points_list ->
  unit ->
  ofi_training_metrics_value

val make_tfi_metric_data_point :
  ?threshold:float_ ->
  ?tpr:float_ ->
  ?precision:float_ ->
  ?fpr:float_ ->
  unit ->
  tfi_metric_data_point

val make_tfi_model_performance :
  ?uncertainty_range:uncertainty_range -> ?auc:float_ -> unit -> tfi_model_performance

val make_tfi_training_metrics_value :
  ?model_performance:tfi_model_performance ->
  ?metric_data_points:tfi_metric_data_points_list ->
  unit ->
  tfi_training_metrics_value

val make_ati_metric_data_point :
  ?atodr:float_ -> ?threshold:float_ -> ?adr:float_ -> ?cr:float_ -> unit -> ati_metric_data_point

val make_ati_model_performance : ?asi:float_ -> unit -> ati_model_performance

val make_ati_training_metrics_value :
  ?model_performance:ati_model_performance ->
  ?metric_data_points:ati_metric_data_points_list ->
  unit ->
  ati_training_metrics_value

val make_training_metrics_v2 :
  ?ati:ati_training_metrics_value ->
  ?tfi:tfi_training_metrics_value ->
  ?ofi:ofi_training_metrics_value ->
  unit ->
  training_metrics_v2

val make_aggregated_log_odds_metric :
  aggregated_variables_importance:float_ ->
  variable_names:list_of_strings ->
  unit ->
  aggregated_log_odds_metric

val make_aggregated_variables_importance_metrics :
  ?log_odds_metrics:list_of_aggregated_log_odds_metrics ->
  unit ->
  aggregated_variables_importance_metrics

val make_training_result_v2 :
  ?aggregated_variables_importance_metrics:aggregated_variables_importance_metrics ->
  ?variable_importance_metrics:variable_importance_metrics ->
  ?training_metrics_v2:training_metrics_v2 ->
  ?data_validation_metrics:data_validation_metrics ->
  unit ->
  training_result_v2

val make_model_version_detail :
  ?training_result_v2:training_result_v2 ->
  ?arn:fraud_detector_arn ->
  ?created_time:time ->
  ?last_updated_time:time ->
  ?training_result:training_result ->
  ?ingested_events_detail:ingested_events_detail ->
  ?external_events_detail:external_events_detail ->
  ?training_data_schema:training_data_schema ->
  ?training_data_source:training_data_source_enum ->
  ?status:string_ ->
  ?model_version_number:float_version_string ->
  ?model_type:model_type_enum ->
  ?model_id:model_identifier ->
  unit ->
  model_version_detail

val make_model :
  ?arn:fraud_detector_arn ->
  ?last_updated_time:time ->
  ?created_time:time ->
  ?event_type_name:string_ ->
  ?description:description ->
  ?model_type:model_type_enum ->
  ?model_id:model_identifier ->
  unit ->
  model

val make_variable_impact_explanation :
  ?log_odds_impact:float_ ->
  ?relative_impact:string_ ->
  ?event_variable_name:string_ ->
  unit ->
  variable_impact_explanation

val make_entity : entity_id:entity_restricted_string -> entity_type:string_ -> unit -> entity

val make_label :
  ?arn:fraud_detector_arn ->
  ?created_time:time ->
  ?last_updated_time:time ->
  ?description:description ->
  ?name:string_ ->
  unit ->
  label

val make_ingested_event_statistics :
  ?last_updated_time:time ->
  ?most_recent_event:time ->
  ?least_recent_event:time ->
  ?event_data_size_in_bytes:long ->
  ?number_of_events:long ->
  unit ->
  ingested_event_statistics

val make_event_orchestration : event_bridge_enabled:boolean_ -> unit -> event_orchestration

val make_event_type :
  ?event_orchestration:event_orchestration ->
  ?arn:fraud_detector_arn ->
  ?created_time:time ->
  ?last_updated_time:time ->
  ?ingested_event_statistics:ingested_event_statistics ->
  ?event_ingestion:event_ingestion ->
  ?entity_types:non_empty_list_of_strings ->
  ?labels:list_of_strings ->
  ?event_variables:list_of_strings ->
  ?description:description ->
  ?name:string_ ->
  unit ->
  event_type

val make_entity_type :
  ?arn:fraud_detector_arn ->
  ?created_time:time ->
  ?last_updated_time:time ->
  ?description:description ->
  ?name:string_ ->
  unit ->
  entity_type

val make_variable :
  ?arn:fraud_detector_arn ->
  ?created_time:time ->
  ?last_updated_time:time ->
  ?variable_type:string_ ->
  ?description:string_ ->
  ?default_value:string_ ->
  ?data_source:data_source ->
  ?data_type:data_type ->
  ?name:string_ ->
  unit ->
  variable

val make_variable_entry :
  ?variable_type:string_ ->
  ?description:string_ ->
  ?default_value:string_ ->
  ?data_source:string_ ->
  ?data_type:string_ ->
  ?name:string_ ->
  unit ->
  variable_entry

val make_update_variable_request :
  ?variable_type:string_ ->
  ?description:string_ ->
  ?default_value:string_ ->
  name:string_ ->
  unit ->
  update_variable_request

val make_rule :
  rule_version:whole_number_version_string ->
  rule_id:identifier ->
  detector_id:identifier ->
  unit ->
  rule

val make_update_rule_version_request :
  ?tags:tag_list ->
  ?description:description ->
  outcomes:non_empty_list_of_strings ->
  language:language ->
  expression:rule_expression ->
  rule:rule ->
  unit ->
  update_rule_version_request

val make_update_rule_metadata_request :
  description:description -> rule:rule -> unit -> update_rule_metadata_request

val make_update_model_version_status_request :
  status:model_version_status ->
  model_version_number:float_version_string ->
  model_type:model_type_enum ->
  model_id:model_identifier ->
  unit ->
  update_model_version_status_request

val make_update_model_version_request :
  ?tags:tag_list ->
  ?ingested_events_detail:ingested_events_detail ->
  ?external_events_detail:external_events_detail ->
  major_version_number:whole_number_version_string ->
  model_type:model_type_enum ->
  model_id:model_identifier ->
  unit ->
  update_model_version_request

val make_update_model_request :
  ?description:description ->
  model_type:model_type_enum ->
  model_id:model_identifier ->
  unit ->
  update_model_request

val make_update_list_request :
  ?variable_type:variable_type ->
  ?update_mode:list_update_mode ->
  ?description:description ->
  ?elements:elements_list ->
  name:no_dash_identifier ->
  unit ->
  update_list_request

val make_update_event_label_request :
  label_timestamp:utc_timestamp_is_o8601 ->
  assigned_label:identifier ->
  event_type_name:identifier ->
  event_id:identifier ->
  unit ->
  update_event_label_request

val make_update_detector_version_status_request :
  status:detector_version_status ->
  detector_version_id:whole_number_version_string ->
  detector_id:identifier ->
  unit ->
  update_detector_version_status_request

val make_model_version :
  ?arn:fraud_detector_arn ->
  model_version_number:float_version_string ->
  model_type:model_type_enum ->
  model_id:model_identifier ->
  unit ->
  model_version

val make_update_detector_version_request :
  ?rule_execution_mode:rule_execution_mode ->
  ?model_versions:list_of_model_versions ->
  ?description:description ->
  rules:rule_list ->
  external_model_endpoints:list_of_strings ->
  detector_version_id:whole_number_version_string ->
  detector_id:identifier ->
  unit ->
  update_detector_version_request

val make_update_detector_version_metadata_request :
  description:description ->
  detector_version_id:whole_number_version_string ->
  detector_id:identifier ->
  unit ->
  update_detector_version_metadata_request

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:fraud_detector_arn -> unit -> untag_resource_request

val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:fraud_detector_arn -> unit -> tag_resource_request

val make_send_event_request :
  ?label_timestamp:utc_timestamp_is_o8601 ->
  ?assigned_label:identifier ->
  entities:list_of_entities ->
  event_variables:event_variable_map ->
  event_timestamp:utc_timestamp_is_o8601 ->
  event_type_name:identifier ->
  event_id:identifier ->
  unit ->
  send_event_request

val make_rule_detail :
  ?arn:fraud_detector_arn ->
  ?created_time:time ->
  ?last_updated_time:time ->
  ?outcomes:non_empty_list_of_strings ->
  ?language:language ->
  ?expression:rule_expression ->
  ?rule_version:whole_number_version_string ->
  ?detector_id:identifier ->
  ?description:description ->
  ?rule_id:identifier ->
  unit ->
  rule_detail

val make_put_outcome_request :
  ?tags:tag_list -> ?description:description -> name:identifier -> unit -> put_outcome_request

val make_put_label_request :
  ?tags:tag_list -> ?description:description -> name:identifier -> unit -> put_label_request

val make_put_kms_encryption_key_request :
  kms_encryption_key_arn:kms_encryption_key_arn -> unit -> put_kms_encryption_key_request

val make_model_input_configuration :
  ?csv_input_template:model_input_template ->
  ?json_input_template:model_input_template ->
  ?format:model_input_data_format ->
  ?event_type_name:identifier ->
  use_event_variables:use_event_variables ->
  unit ->
  model_input_configuration

val make_model_output_configuration :
  ?csv_index_to_variable_map:csv_index_to_variable_map ->
  ?json_key_to_variable_map:json_key_to_variable_map ->
  format:model_output_data_format ->
  unit ->
  model_output_configuration

val make_put_external_model_request :
  ?tags:tag_list ->
  model_endpoint_status:model_endpoint_status ->
  output_configuration:model_output_configuration ->
  input_configuration:model_input_configuration ->
  invoke_model_endpoint_role_arn:string_ ->
  model_source:model_source ->
  model_endpoint:sage_maker_endpoint_identifier ->
  unit ->
  put_external_model_request

val make_put_event_type_request :
  ?event_orchestration:event_orchestration ->
  ?tags:tag_list ->
  ?event_ingestion:event_ingestion ->
  ?labels:list_of_strings ->
  ?description:description ->
  entity_types:non_empty_list_of_strings ->
  event_variables:non_empty_list_of_strings ->
  name:identifier ->
  unit ->
  put_event_type_request

val make_put_entity_type_request :
  ?tags:tag_list -> ?description:description -> name:identifier -> unit -> put_entity_type_request

val make_put_detector_request :
  ?tags:tag_list ->
  ?description:description ->
  event_type_name:identifier ->
  detector_id:identifier ->
  unit ->
  put_detector_request

val make_prediction_time_range : end_time:time -> start_time:time -> unit -> prediction_time_range

val make_aggregated_variables_impact_explanation :
  ?log_odds_impact:float_ ->
  ?relative_impact:string_ ->
  ?event_variable_names:list_of_strings ->
  unit ->
  aggregated_variables_impact_explanation

val make_prediction_explanations :
  ?aggregated_variables_impact_explanations:list_of_aggregated_variables_impact_explanations ->
  ?variable_impact_explanations:list_of_variable_impact_explanations ->
  unit ->
  prediction_explanations

val make_outcome :
  ?arn:fraud_detector_arn ->
  ?created_time:time ->
  ?last_updated_time:time ->
  ?description:description ->
  ?name:identifier ->
  unit ->
  outcome

val make_model_version_evaluation :
  ?prediction_explanations:prediction_explanations ->
  ?evaluation_score:string_ ->
  ?output_variable_name:string_ ->
  unit ->
  model_version_evaluation

val make_model_scores :
  ?scores:model_prediction_map -> ?model_version:model_version -> unit -> model_scores

val make_model_endpoint_data_blob :
  ?content_type:content_type -> ?byte_buffer:blob -> unit -> model_endpoint_data_blob

val make_list_tags_for_resource_request :
  ?max_results:tags_max_results ->
  ?next_token:string_ ->
  resource_ar_n:fraud_detector_arn ->
  unit ->
  list_tags_for_resource_request

val make_external_model_summary :
  ?model_source:model_source -> ?model_endpoint:string_ -> unit -> external_model_summary

val make_external_model_outputs :
  ?outputs:external_model_prediction_map ->
  ?external_model:external_model_summary ->
  unit ->
  external_model_outputs

val make_event_variable_summary :
  ?source:sensitive_string ->
  ?value:sensitive_string ->
  ?name:sensitive_string ->
  unit ->
  event_variable_summary

val make_event_prediction_summary :
  ?detector_version_id:whole_number_version_string ->
  ?detector_id:identifier ->
  ?prediction_timestamp:time ->
  ?event_timestamp:time ->
  ?event_type_name:identifier ->
  ?event_id:identifier ->
  unit ->
  event_prediction_summary

val make_evaluated_model_version :
  ?evaluations:list_of_model_version_evaluations ->
  ?model_type:string_ ->
  ?model_version:string_ ->
  ?model_id:string_ ->
  unit ->
  evaluated_model_version

val make_evaluated_external_model :
  ?output_variables:map_of_strings ->
  ?input_variables:map_of_strings ->
  ?use_event_variables:boolean_ ->
  ?model_endpoint:string_ ->
  unit ->
  evaluated_external_model

val make_filter_condition : ?value:filter_string -> unit -> filter_condition

val make_list_event_predictions_request :
  ?max_results:event_predictions_max_results ->
  ?next_token:string_ ->
  ?prediction_time_range:prediction_time_range ->
  ?detector_version_id:filter_condition ->
  ?detector_id:filter_condition ->
  ?event_type:filter_condition ->
  ?event_id:filter_condition ->
  unit ->
  list_event_predictions_request

val make_kms_key : ?kms_encryption_key_arn:kms_encryption_key_arn -> unit -> kms_key

val make_get_variables_request :
  ?max_results:variables_max_results ->
  ?next_token:string_ ->
  ?name:string_ ->
  unit ->
  get_variables_request

val make_get_rules_request :
  ?max_results:rules_max_results ->
  ?next_token:string_ ->
  ?rule_version:whole_number_version_string ->
  ?rule_id:identifier ->
  detector_id:identifier ->
  unit ->
  get_rules_request

val make_get_outcomes_request :
  ?max_results:outcomes_max_results ->
  ?next_token:string_ ->
  ?name:identifier ->
  unit ->
  get_outcomes_request

val make_get_models_request :
  ?max_results:models_max_page_size ->
  ?next_token:string_ ->
  ?model_type:model_type_enum ->
  ?model_id:model_identifier ->
  unit ->
  get_models_request

val make_get_model_version_request :
  model_version_number:float_version_string ->
  model_type:model_type_enum ->
  model_id:model_identifier ->
  unit ->
  get_model_version_request

val make_allow_deny_list :
  ?arn:fraud_detector_arn ->
  ?updated_time:time ->
  ?created_time:time ->
  ?variable_type:variable_type ->
  ?description:description ->
  name:no_dash_identifier ->
  unit ->
  allow_deny_list

val make_get_lists_metadata_request :
  ?max_results:lists_metadata_max_results ->
  ?next_token:next_token ->
  ?name:no_dash_identifier ->
  unit ->
  get_lists_metadata_request

val make_get_list_elements_request :
  ?max_results:lists_elements_max_results ->
  ?next_token:next_token ->
  name:no_dash_identifier ->
  unit ->
  get_list_elements_request

val make_get_labels_request :
  ?max_results:labels_max_results ->
  ?next_token:string_ ->
  ?name:identifier ->
  unit ->
  get_labels_request

val make_external_model :
  ?arn:fraud_detector_arn ->
  ?created_time:time ->
  ?last_updated_time:time ->
  ?model_endpoint_status:model_endpoint_status ->
  ?output_configuration:model_output_configuration ->
  ?input_configuration:model_input_configuration ->
  ?invoke_model_endpoint_role_arn:string_ ->
  ?model_source:model_source ->
  ?model_endpoint:string_ ->
  unit ->
  external_model

val make_get_external_models_request :
  ?max_results:external_models_max_results ->
  ?next_token:string_ ->
  ?model_endpoint:string_ ->
  unit ->
  get_external_models_request

val make_get_event_types_request :
  ?max_results:event_types_max_results ->
  ?next_token:string_ ->
  ?name:identifier ->
  unit ->
  get_event_types_request

val make_event :
  ?entities:list_of_entities ->
  ?label_timestamp:string_ ->
  ?current_label:string_ ->
  ?event_variables:event_attribute_map ->
  ?event_timestamp:string_ ->
  ?event_type_name:string_ ->
  ?event_id:string_ ->
  unit ->
  event

val make_get_event_request :
  event_type_name:string_ -> event_id:string_ -> unit -> get_event_request

val make_get_event_prediction_request :
  ?external_model_endpoint_data_blobs:external_model_endpoint_data_blob_map ->
  ?detector_version_id:whole_number_version_string ->
  event_variables:event_variable_map ->
  event_timestamp:utc_timestamp_is_o8601 ->
  entities:list_of_entities ->
  event_type_name:string_ ->
  event_id:string_ ->
  detector_id:string_ ->
  unit ->
  get_event_prediction_request

val make_evaluated_rule :
  ?matched:boolean_ ->
  ?evaluated:boolean_ ->
  ?outcomes:list_of_strings ->
  ?expression_with_values:sensitive_string ->
  ?expression:sensitive_string ->
  ?rule_version:whole_number_version_string ->
  ?rule_id:identifier ->
  unit ->
  evaluated_rule

val make_get_event_prediction_metadata_request :
  prediction_timestamp:time ->
  detector_version_id:whole_number_version_string ->
  detector_id:identifier ->
  event_type_name:identifier ->
  event_id:identifier ->
  unit ->
  get_event_prediction_metadata_request

val make_get_entity_types_request :
  ?max_results:entity_types_max_results ->
  ?next_token:string_ ->
  ?name:identifier ->
  unit ->
  get_entity_types_request

val make_detector :
  ?arn:fraud_detector_arn ->
  ?created_time:time ->
  ?last_updated_time:time ->
  ?event_type_name:identifier ->
  ?description:description ->
  ?detector_id:identifier ->
  unit ->
  detector

val make_get_detectors_request :
  ?max_results:detectors_max_results ->
  ?next_token:string_ ->
  ?detector_id:identifier ->
  unit ->
  get_detectors_request

val make_get_detector_version_request :
  detector_version_id:whole_number_version_string ->
  detector_id:identifier ->
  unit ->
  get_detector_version_request

val make_get_delete_events_by_event_type_status_request :
  event_type_name:identifier -> unit -> get_delete_events_by_event_type_status_request

val make_batch_prediction :
  ?total_records_count:integer ->
  ?processed_records_count:integer ->
  ?arn:fraud_detector_arn ->
  ?iam_role_arn:iam_role_arn ->
  ?detector_version:float_version_string ->
  ?detector_name:identifier ->
  ?event_type_name:identifier ->
  ?output_path:s3_bucket_location ->
  ?input_path:s3_bucket_location ->
  ?last_heartbeat_time:time ->
  ?completion_time:time ->
  ?start_time:time ->
  ?failure_reason:string_ ->
  ?status:async_job_status ->
  ?job_id:identifier ->
  unit ->
  batch_prediction

val make_get_batch_prediction_jobs_request :
  ?next_token:string_ ->
  ?max_results:batch_predictions_max_page_size ->
  ?job_id:identifier ->
  unit ->
  get_batch_prediction_jobs_request

val make_batch_import :
  ?total_records_count:integer ->
  ?failed_records_count:integer ->
  ?processed_records_count:integer ->
  ?arn:fraud_detector_arn ->
  ?iam_role_arn:iam_role_arn ->
  ?event_type_name:identifier ->
  ?output_path:s3_bucket_location ->
  ?input_path:s3_bucket_location ->
  ?completion_time:time ->
  ?start_time:time ->
  ?failure_reason:string_ ->
  ?status:async_job_status ->
  ?job_id:identifier ->
  unit ->
  batch_import

val make_get_batch_import_jobs_request :
  ?next_token:string_ ->
  ?max_results:batch_imports_max_page_size ->
  ?job_id:identifier ->
  unit ->
  get_batch_import_jobs_request

val make_detector_version_summary :
  ?last_updated_time:time ->
  ?description:description ->
  ?status:detector_version_status ->
  ?detector_version_id:whole_number_version_string ->
  unit ->
  detector_version_summary

val make_describe_model_versions_request :
  ?max_results:models_max_page_size ->
  ?next_token:string_ ->
  ?model_type:model_type_enum ->
  ?model_version_number:float_version_string ->
  ?model_id:model_identifier ->
  unit ->
  describe_model_versions_request

val make_describe_detector_request :
  ?max_results:detector_version_max_results ->
  ?next_token:string_ ->
  detector_id:identifier ->
  unit ->
  describe_detector_request

val make_delete_variable_request : name:string_ -> unit -> delete_variable_request
val make_delete_rule_request : rule:rule -> unit -> delete_rule_request
val make_delete_outcome_request : name:identifier -> unit -> delete_outcome_request

val make_delete_model_version_request :
  model_version_number:float_version_string ->
  model_type:model_type_enum ->
  model_id:model_identifier ->
  unit ->
  delete_model_version_request

val make_delete_model_request :
  model_type:model_type_enum -> model_id:model_identifier -> unit -> delete_model_request

val make_delete_list_request : name:no_dash_identifier -> unit -> delete_list_request
val make_delete_label_request : name:identifier -> unit -> delete_label_request

val make_delete_external_model_request :
  model_endpoint:sage_maker_endpoint_identifier -> unit -> delete_external_model_request

val make_delete_events_by_event_type_request :
  event_type_name:identifier -> unit -> delete_events_by_event_type_request

val make_delete_event_type_request : name:identifier -> unit -> delete_event_type_request

val make_delete_event_request :
  ?delete_audit_history:delete_audit_history ->
  event_type_name:identifier ->
  event_id:identifier ->
  unit ->
  delete_event_request

val make_delete_entity_type_request : name:identifier -> unit -> delete_entity_type_request

val make_delete_detector_version_request :
  detector_version_id:whole_number_version_string ->
  detector_id:identifier ->
  unit ->
  delete_detector_version_request

val make_delete_detector_request : detector_id:identifier -> unit -> delete_detector_request

val make_delete_batch_prediction_job_request :
  job_id:identifier -> unit -> delete_batch_prediction_job_request

val make_delete_batch_import_job_request :
  job_id:identifier -> unit -> delete_batch_import_job_request

val make_create_variable_request :
  ?tags:tag_list ->
  ?variable_type:string_ ->
  ?description:string_ ->
  default_value:string_ ->
  data_source:data_source ->
  data_type:data_type ->
  name:string_ ->
  unit ->
  create_variable_request

val make_create_rule_request :
  ?tags:tag_list ->
  ?description:description ->
  outcomes:non_empty_list_of_strings ->
  language:language ->
  expression:rule_expression ->
  detector_id:identifier ->
  rule_id:identifier ->
  unit ->
  create_rule_request

val make_create_model_version_request :
  ?tags:tag_list ->
  ?ingested_events_detail:ingested_events_detail ->
  ?external_events_detail:external_events_detail ->
  training_data_schema:training_data_schema ->
  training_data_source:training_data_source_enum ->
  model_type:model_type_enum ->
  model_id:model_identifier ->
  unit ->
  create_model_version_request

val make_create_model_request :
  ?tags:tag_list ->
  ?description:description ->
  event_type_name:string_ ->
  model_type:model_type_enum ->
  model_id:model_identifier ->
  unit ->
  create_model_request

val make_create_list_request :
  ?tags:tag_list ->
  ?description:description ->
  ?variable_type:variable_type ->
  ?elements:elements_list ->
  name:no_dash_identifier ->
  unit ->
  create_list_request

val make_create_detector_version_request :
  ?tags:tag_list ->
  ?rule_execution_mode:rule_execution_mode ->
  ?model_versions:list_of_model_versions ->
  ?external_model_endpoints:list_of_strings ->
  ?description:description ->
  rules:rule_list ->
  detector_id:identifier ->
  unit ->
  create_detector_version_request

val make_create_batch_prediction_job_request :
  ?tags:tag_list ->
  ?detector_version:whole_number_version_string ->
  iam_role_arn:iam_role_arn ->
  detector_name:identifier ->
  event_type_name:identifier ->
  output_path:s3_bucket_location ->
  input_path:s3_bucket_location ->
  job_id:identifier ->
  unit ->
  create_batch_prediction_job_request

val make_create_batch_import_job_request :
  ?tags:tag_list ->
  iam_role_arn:iam_role_arn ->
  event_type_name:identifier ->
  output_path:s3_bucket_location ->
  input_path:s3_bucket_location ->
  job_id:identifier ->
  unit ->
  create_batch_import_job_request

val make_cancel_batch_prediction_job_request :
  job_id:identifier -> unit -> cancel_batch_prediction_job_request

val make_cancel_batch_import_job_request :
  job_id:identifier -> unit -> cancel_batch_import_job_request

val make_batch_get_variable_error :
  ?message:string_ -> ?code:integer2 -> ?name:string_ -> unit -> batch_get_variable_error

val make_batch_get_variable_request : names:name_list -> unit -> batch_get_variable_request

val make_batch_create_variable_error :
  ?message:string_ -> ?code:integer2 -> ?name:string_ -> unit -> batch_create_variable_error

val make_batch_create_variable_request :
  ?tags:tag_list -> variable_entries:variable_entry_list -> unit -> batch_create_variable_request
