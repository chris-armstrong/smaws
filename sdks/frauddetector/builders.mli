open Types

val make_ati_metric_data_point :
  ?cr:float_ -> ?adr:float_ -> ?threshold:float_ -> ?atodr:float_ -> unit -> ati_metric_data_point

val make_ati_model_performance : ?asi:float_ -> unit -> ati_model_performance

val make_ati_training_metrics_value :
  ?metric_data_points:ati_metric_data_points_list ->
  ?model_performance:ati_model_performance ->
  unit ->
  ati_training_metrics_value

val make_update_variable_request :
  ?default_value:string_ ->
  ?description:string_ ->
  ?variable_type:string_ ->
  name:string_ ->
  unit ->
  update_variable_request

val make_rule :
  detector_id:identifier ->
  rule_id:identifier ->
  rule_version:whole_number_version_string ->
  unit ->
  rule

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_update_rule_version_request :
  ?description:description ->
  ?tags:tag_list ->
  rule:rule ->
  expression:rule_expression ->
  language:language ->
  outcomes:non_empty_list_of_strings ->
  unit ->
  update_rule_version_request

val make_update_rule_metadata_request :
  rule:rule -> description:description -> unit -> update_rule_metadata_request

val make_update_model_version_status_request :
  model_id:model_identifier ->
  model_type:model_type_enum ->
  model_version_number:float_version_string ->
  status:model_version_status ->
  unit ->
  update_model_version_status_request

val make_ingested_events_time_window :
  start_time:time -> end_time:time -> unit -> ingested_events_time_window

val make_ingested_events_detail :
  ingested_events_time_window:ingested_events_time_window -> unit -> ingested_events_detail

val make_external_events_detail :
  data_location:s3_bucket_location ->
  data_access_role_arn:iam_role_arn ->
  unit ->
  external_events_detail

val make_update_model_version_request :
  ?external_events_detail:external_events_detail ->
  ?ingested_events_detail:ingested_events_detail ->
  ?tags:tag_list ->
  model_id:model_identifier ->
  model_type:model_type_enum ->
  major_version_number:whole_number_version_string ->
  unit ->
  update_model_version_request

val make_update_model_request :
  ?description:description ->
  model_id:model_identifier ->
  model_type:model_type_enum ->
  unit ->
  update_model_request

val make_update_list_request :
  ?elements:elements_list ->
  ?description:description ->
  ?update_mode:list_update_mode ->
  ?variable_type:variable_type ->
  name:no_dash_identifier ->
  unit ->
  update_list_request

val make_update_event_label_request :
  event_id:identifier ->
  event_type_name:identifier ->
  assigned_label:identifier ->
  label_timestamp:utc_timestamp_is_o8601 ->
  unit ->
  update_event_label_request

val make_update_detector_version_status_request :
  detector_id:identifier ->
  detector_version_id:whole_number_version_string ->
  status:detector_version_status ->
  unit ->
  update_detector_version_status_request

val make_update_detector_version_metadata_request :
  detector_id:identifier ->
  detector_version_id:whole_number_version_string ->
  description:description ->
  unit ->
  update_detector_version_metadata_request

val make_model_version :
  ?arn:fraud_detector_arn ->
  model_id:model_identifier ->
  model_type:model_type_enum ->
  model_version_number:float_version_string ->
  unit ->
  model_version

val make_update_detector_version_request :
  ?description:description ->
  ?model_versions:list_of_model_versions ->
  ?rule_execution_mode:rule_execution_mode ->
  detector_id:identifier ->
  detector_version_id:whole_number_version_string ->
  external_model_endpoints:list_of_strings ->
  rules:rule_list ->
  unit ->
  update_detector_version_request

val make_untag_resource_request :
  resource_ar_n:fraud_detector_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_request :
  resource_ar_n:fraud_detector_arn -> tags:tag_list -> unit -> tag_resource_request

val make_entity : entity_type:string_ -> entity_id:entity_restricted_string -> unit -> entity

val make_send_event_request :
  ?assigned_label:identifier ->
  ?label_timestamp:utc_timestamp_is_o8601 ->
  event_id:identifier ->
  event_type_name:identifier ->
  event_timestamp:utc_timestamp_is_o8601 ->
  event_variables:event_variable_map ->
  entities:list_of_entities ->
  unit ->
  send_event_request

val make_put_outcome_request :
  ?description:description -> ?tags:tag_list -> name:identifier -> unit -> put_outcome_request

val make_put_label_request :
  ?description:description -> ?tags:tag_list -> name:identifier -> unit -> put_label_request

val make_put_kms_encryption_key_request :
  kms_encryption_key_arn:kms_encryption_key_arn -> unit -> put_kms_encryption_key_request

val make_model_output_configuration :
  ?json_key_to_variable_map:json_key_to_variable_map ->
  ?csv_index_to_variable_map:csv_index_to_variable_map ->
  format:model_output_data_format ->
  unit ->
  model_output_configuration

val make_model_input_configuration :
  ?event_type_name:identifier ->
  ?format:model_input_data_format ->
  ?json_input_template:model_input_template ->
  ?csv_input_template:model_input_template ->
  use_event_variables:use_event_variables ->
  unit ->
  model_input_configuration

val make_put_external_model_request :
  ?tags:tag_list ->
  model_endpoint:sage_maker_endpoint_identifier ->
  model_source:model_source ->
  invoke_model_endpoint_role_arn:string_ ->
  input_configuration:model_input_configuration ->
  output_configuration:model_output_configuration ->
  model_endpoint_status:model_endpoint_status ->
  unit ->
  put_external_model_request

val make_event_orchestration : event_bridge_enabled:boolean_ -> unit -> event_orchestration

val make_put_event_type_request :
  ?description:description ->
  ?labels:list_of_strings ->
  ?event_ingestion:event_ingestion ->
  ?tags:tag_list ->
  ?event_orchestration:event_orchestration ->
  name:identifier ->
  event_variables:non_empty_list_of_strings ->
  entity_types:non_empty_list_of_strings ->
  unit ->
  put_event_type_request

val make_put_entity_type_request :
  ?description:description -> ?tags:tag_list -> name:identifier -> unit -> put_entity_type_request

val make_put_detector_request :
  ?description:description ->
  ?tags:tag_list ->
  detector_id:identifier ->
  event_type_name:identifier ->
  unit ->
  put_detector_request

val make_list_tags_for_resource_request :
  ?next_token:string_ ->
  ?max_results:tags_max_results ->
  resource_ar_n:fraud_detector_arn ->
  unit ->
  list_tags_for_resource_request

val make_event_prediction_summary :
  ?event_id:identifier ->
  ?event_type_name:identifier ->
  ?event_timestamp:time ->
  ?prediction_timestamp:time ->
  ?detector_id:identifier ->
  ?detector_version_id:whole_number_version_string ->
  unit ->
  event_prediction_summary

val make_prediction_time_range : start_time:time -> end_time:time -> unit -> prediction_time_range
val make_filter_condition : ?value:filter_string -> unit -> filter_condition

val make_list_event_predictions_request :
  ?event_id:filter_condition ->
  ?event_type:filter_condition ->
  ?detector_id:filter_condition ->
  ?detector_version_id:filter_condition ->
  ?prediction_time_range:prediction_time_range ->
  ?next_token:string_ ->
  ?max_results:event_predictions_max_results ->
  unit ->
  list_event_predictions_request

val make_variable :
  ?name:string_ ->
  ?data_type:data_type ->
  ?data_source:data_source ->
  ?default_value:string_ ->
  ?description:string_ ->
  ?variable_type:string_ ->
  ?last_updated_time:time ->
  ?created_time:time ->
  ?arn:fraud_detector_arn ->
  unit ->
  variable

val make_get_variables_request :
  ?name:string_ ->
  ?next_token:string_ ->
  ?max_results:variables_max_results ->
  unit ->
  get_variables_request

val make_rule_detail :
  ?rule_id:identifier ->
  ?description:description ->
  ?detector_id:identifier ->
  ?rule_version:whole_number_version_string ->
  ?expression:rule_expression ->
  ?language:language ->
  ?outcomes:non_empty_list_of_strings ->
  ?last_updated_time:time ->
  ?created_time:time ->
  ?arn:fraud_detector_arn ->
  unit ->
  rule_detail

val make_get_rules_request :
  ?rule_id:identifier ->
  ?rule_version:whole_number_version_string ->
  ?next_token:string_ ->
  ?max_results:rules_max_results ->
  detector_id:identifier ->
  unit ->
  get_rules_request

val make_outcome :
  ?name:identifier ->
  ?description:description ->
  ?last_updated_time:time ->
  ?created_time:time ->
  ?arn:fraud_detector_arn ->
  unit ->
  outcome

val make_get_outcomes_request :
  ?name:identifier ->
  ?next_token:string_ ->
  ?max_results:outcomes_max_results ->
  unit ->
  get_outcomes_request

val make_label_schema :
  ?label_mapper:label_mapper ->
  ?unlabeled_events_treatment:unlabeled_events_treatment ->
  unit ->
  label_schema

val make_training_data_schema :
  ?label_schema:label_schema -> model_variables:list_of_strings -> unit -> training_data_schema

val make_get_model_version_request :
  model_id:model_identifier ->
  model_type:model_type_enum ->
  model_version_number:float_version_string ->
  unit ->
  get_model_version_request

val make_model :
  ?model_id:model_identifier ->
  ?model_type:model_type_enum ->
  ?description:description ->
  ?event_type_name:string_ ->
  ?created_time:time ->
  ?last_updated_time:time ->
  ?arn:fraud_detector_arn ->
  unit ->
  model

val make_get_models_request :
  ?model_id:model_identifier ->
  ?model_type:model_type_enum ->
  ?next_token:string_ ->
  ?max_results:models_max_page_size ->
  unit ->
  get_models_request

val make_allow_deny_list :
  ?description:description ->
  ?variable_type:variable_type ->
  ?created_time:time ->
  ?updated_time:time ->
  ?arn:fraud_detector_arn ->
  name:no_dash_identifier ->
  unit ->
  allow_deny_list

val make_get_lists_metadata_request :
  ?name:no_dash_identifier ->
  ?next_token:next_token ->
  ?max_results:lists_metadata_max_results ->
  unit ->
  get_lists_metadata_request

val make_get_list_elements_request :
  ?next_token:next_token ->
  ?max_results:lists_elements_max_results ->
  name:no_dash_identifier ->
  unit ->
  get_list_elements_request

val make_label :
  ?name:string_ ->
  ?description:description ->
  ?last_updated_time:time ->
  ?created_time:time ->
  ?arn:fraud_detector_arn ->
  unit ->
  label

val make_get_labels_request :
  ?name:identifier ->
  ?next_token:string_ ->
  ?max_results:labels_max_results ->
  unit ->
  get_labels_request

val make_kms_key : ?kms_encryption_key_arn:kms_encryption_key_arn -> unit -> kms_key

val make_external_model :
  ?model_endpoint:string_ ->
  ?model_source:model_source ->
  ?invoke_model_endpoint_role_arn:string_ ->
  ?input_configuration:model_input_configuration ->
  ?output_configuration:model_output_configuration ->
  ?model_endpoint_status:model_endpoint_status ->
  ?last_updated_time:time ->
  ?created_time:time ->
  ?arn:fraud_detector_arn ->
  unit ->
  external_model

val make_get_external_models_request :
  ?model_endpoint:string_ ->
  ?next_token:string_ ->
  ?max_results:external_models_max_results ->
  unit ->
  get_external_models_request

val make_ingested_event_statistics :
  ?number_of_events:long ->
  ?event_data_size_in_bytes:long ->
  ?least_recent_event:time ->
  ?most_recent_event:time ->
  ?last_updated_time:time ->
  unit ->
  ingested_event_statistics

val make_event_type :
  ?name:string_ ->
  ?description:description ->
  ?event_variables:list_of_strings ->
  ?labels:list_of_strings ->
  ?entity_types:non_empty_list_of_strings ->
  ?event_ingestion:event_ingestion ->
  ?ingested_event_statistics:ingested_event_statistics ->
  ?last_updated_time:time ->
  ?created_time:time ->
  ?arn:fraud_detector_arn ->
  ?event_orchestration:event_orchestration ->
  unit ->
  event_type

val make_get_event_types_request :
  ?name:identifier ->
  ?next_token:string_ ->
  ?max_results:event_types_max_results ->
  unit ->
  get_event_types_request

val make_evaluated_external_model :
  ?model_endpoint:string_ ->
  ?use_event_variables:boolean_ ->
  ?input_variables:map_of_strings ->
  ?output_variables:map_of_strings ->
  unit ->
  evaluated_external_model

val make_aggregated_variables_impact_explanation :
  ?event_variable_names:list_of_strings ->
  ?relative_impact:string_ ->
  ?log_odds_impact:float_ ->
  unit ->
  aggregated_variables_impact_explanation

val make_variable_impact_explanation :
  ?event_variable_name:string_ ->
  ?relative_impact:string_ ->
  ?log_odds_impact:float_ ->
  unit ->
  variable_impact_explanation

val make_prediction_explanations :
  ?variable_impact_explanations:list_of_variable_impact_explanations ->
  ?aggregated_variables_impact_explanations:list_of_aggregated_variables_impact_explanations ->
  unit ->
  prediction_explanations

val make_model_version_evaluation :
  ?output_variable_name:string_ ->
  ?evaluation_score:string_ ->
  ?prediction_explanations:prediction_explanations ->
  unit ->
  model_version_evaluation

val make_evaluated_model_version :
  ?model_id:string_ ->
  ?model_version:string_ ->
  ?model_type:string_ ->
  ?evaluations:list_of_model_version_evaluations ->
  unit ->
  evaluated_model_version

val make_evaluated_rule :
  ?rule_id:identifier ->
  ?rule_version:whole_number_version_string ->
  ?expression:sensitive_string ->
  ?expression_with_values:sensitive_string ->
  ?outcomes:list_of_strings ->
  ?evaluated:boolean_ ->
  ?matched:boolean_ ->
  unit ->
  evaluated_rule

val make_event_variable_summary :
  ?name:sensitive_string ->
  ?value:sensitive_string ->
  ?source:sensitive_string ->
  unit ->
  event_variable_summary

val make_get_event_prediction_metadata_request :
  event_id:identifier ->
  event_type_name:identifier ->
  detector_id:identifier ->
  detector_version_id:whole_number_version_string ->
  prediction_timestamp:time ->
  unit ->
  get_event_prediction_metadata_request

val make_external_model_summary :
  ?model_endpoint:string_ -> ?model_source:model_source -> unit -> external_model_summary

val make_external_model_outputs :
  ?external_model:external_model_summary ->
  ?outputs:external_model_prediction_map ->
  unit ->
  external_model_outputs

val make_model_scores :
  ?model_version:model_version -> ?scores:model_prediction_map -> unit -> model_scores

val make_model_endpoint_data_blob :
  ?byte_buffer:blob -> ?content_type:content_type -> unit -> model_endpoint_data_blob

val make_get_event_prediction_request :
  ?detector_version_id:whole_number_version_string ->
  ?external_model_endpoint_data_blobs:external_model_endpoint_data_blob_map ->
  detector_id:string_ ->
  event_id:string_ ->
  event_type_name:string_ ->
  entities:list_of_entities ->
  event_timestamp:utc_timestamp_is_o8601 ->
  event_variables:event_variable_map ->
  unit ->
  get_event_prediction_request

val make_event :
  ?event_id:string_ ->
  ?event_type_name:string_ ->
  ?event_timestamp:string_ ->
  ?event_variables:event_attribute_map ->
  ?current_label:string_ ->
  ?label_timestamp:string_ ->
  ?entities:list_of_entities ->
  unit ->
  event

val make_get_event_request :
  event_id:string_ -> event_type_name:string_ -> unit -> get_event_request

val make_entity_type :
  ?name:string_ ->
  ?description:description ->
  ?last_updated_time:time ->
  ?created_time:time ->
  ?arn:fraud_detector_arn ->
  unit ->
  entity_type

val make_get_entity_types_request :
  ?name:identifier ->
  ?next_token:string_ ->
  ?max_results:entity_types_max_results ->
  unit ->
  get_entity_types_request

val make_get_detector_version_request :
  detector_id:identifier ->
  detector_version_id:whole_number_version_string ->
  unit ->
  get_detector_version_request

val make_detector :
  ?detector_id:identifier ->
  ?description:description ->
  ?event_type_name:identifier ->
  ?last_updated_time:time ->
  ?created_time:time ->
  ?arn:fraud_detector_arn ->
  unit ->
  detector

val make_get_detectors_request :
  ?detector_id:identifier ->
  ?next_token:string_ ->
  ?max_results:detectors_max_results ->
  unit ->
  get_detectors_request

val make_get_delete_events_by_event_type_status_request :
  event_type_name:identifier -> unit -> get_delete_events_by_event_type_status_request

val make_batch_prediction :
  ?job_id:identifier ->
  ?status:async_job_status ->
  ?failure_reason:string_ ->
  ?start_time:time ->
  ?completion_time:time ->
  ?last_heartbeat_time:time ->
  ?input_path:s3_bucket_location ->
  ?output_path:s3_bucket_location ->
  ?event_type_name:identifier ->
  ?detector_name:identifier ->
  ?detector_version:float_version_string ->
  ?iam_role_arn:iam_role_arn ->
  ?arn:fraud_detector_arn ->
  ?processed_records_count:integer ->
  ?total_records_count:integer ->
  unit ->
  batch_prediction

val make_get_batch_prediction_jobs_request :
  ?job_id:identifier ->
  ?max_results:batch_predictions_max_page_size ->
  ?next_token:string_ ->
  unit ->
  get_batch_prediction_jobs_request

val make_batch_import :
  ?job_id:identifier ->
  ?status:async_job_status ->
  ?failure_reason:string_ ->
  ?start_time:time ->
  ?completion_time:time ->
  ?input_path:s3_bucket_location ->
  ?output_path:s3_bucket_location ->
  ?event_type_name:identifier ->
  ?iam_role_arn:iam_role_arn ->
  ?arn:fraud_detector_arn ->
  ?processed_records_count:integer ->
  ?failed_records_count:integer ->
  ?total_records_count:integer ->
  unit ->
  batch_import

val make_get_batch_import_jobs_request :
  ?job_id:identifier ->
  ?max_results:batch_imports_max_page_size ->
  ?next_token:string_ ->
  unit ->
  get_batch_import_jobs_request

val make_aggregated_log_odds_metric :
  variable_names:list_of_strings ->
  aggregated_variables_importance:float_ ->
  unit ->
  aggregated_log_odds_metric

val make_aggregated_variables_importance_metrics :
  ?log_odds_metrics:list_of_aggregated_log_odds_metrics ->
  unit ->
  aggregated_variables_importance_metrics

val make_log_odds_metric :
  variable_name:string_ ->
  variable_type:string_ ->
  variable_importance:float_ ->
  unit ->
  log_odds_metric

val make_variable_importance_metrics :
  ?log_odds_metrics:list_of_log_odds_metrics -> unit -> variable_importance_metrics

val make_uncertainty_range :
  lower_bound_value:float_ -> upper_bound_value:float_ -> unit -> uncertainty_range

val make_tfi_model_performance :
  ?auc:float_ -> ?uncertainty_range:uncertainty_range -> unit -> tfi_model_performance

val make_tfi_metric_data_point :
  ?fpr:float_ ->
  ?precision:float_ ->
  ?tpr:float_ ->
  ?threshold:float_ ->
  unit ->
  tfi_metric_data_point

val make_tfi_training_metrics_value :
  ?metric_data_points:tfi_metric_data_points_list ->
  ?model_performance:tfi_model_performance ->
  unit ->
  tfi_training_metrics_value

val make_ofi_model_performance :
  ?auc:float_ -> ?uncertainty_range:uncertainty_range -> unit -> ofi_model_performance

val make_ofi_metric_data_point :
  ?fpr:float_ ->
  ?precision:float_ ->
  ?tpr:float_ ->
  ?threshold:float_ ->
  unit ->
  ofi_metric_data_point

val make_ofi_training_metrics_value :
  ?metric_data_points:ofi_metric_data_points_list ->
  ?model_performance:ofi_model_performance ->
  unit ->
  ofi_training_metrics_value

val make_training_metrics_v2 :
  ?ofi:ofi_training_metrics_value ->
  ?tfi:tfi_training_metrics_value ->
  ?ati:ati_training_metrics_value ->
  unit ->
  training_metrics_v2

val make_field_validation_message :
  ?field_name:string_ ->
  ?identifier:string_ ->
  ?title:string_ ->
  ?content:string_ ->
  ?type_:string_ ->
  unit ->
  field_validation_message

val make_file_validation_message :
  ?title:string_ -> ?content:string_ -> ?type_:string_ -> unit -> file_validation_message

val make_data_validation_metrics :
  ?file_level_messages:file_validation_message_list ->
  ?field_level_messages:field_validation_message_list ->
  unit ->
  data_validation_metrics

val make_training_result_v2 :
  ?data_validation_metrics:data_validation_metrics ->
  ?training_metrics_v2:training_metrics_v2 ->
  ?variable_importance_metrics:variable_importance_metrics ->
  ?aggregated_variables_importance_metrics:aggregated_variables_importance_metrics ->
  unit ->
  training_result_v2

val make_metric_data_point :
  ?fpr:float_ -> ?precision:float_ -> ?tpr:float_ -> ?threshold:float_ -> unit -> metric_data_point

val make_training_metrics :
  ?auc:float_ -> ?metric_data_points:metric_data_points_list -> unit -> training_metrics

val make_model_version_detail :
  ?model_id:model_identifier ->
  ?model_type:model_type_enum ->
  ?model_version_number:float_version_string ->
  ?status:string_ ->
  ?training_data_source:training_data_source_enum ->
  ?training_data_schema:training_data_schema ->
  ?external_events_detail:external_events_detail ->
  ?ingested_events_detail:ingested_events_detail ->
  ?training_result:training_result ->
  ?last_updated_time:time ->
  ?created_time:time ->
  ?arn:fraud_detector_arn ->
  ?training_result_v2:training_result_v2 ->
  unit ->
  model_version_detail

val make_describe_model_versions_request :
  ?model_id:model_identifier ->
  ?model_version_number:float_version_string ->
  ?model_type:model_type_enum ->
  ?next_token:string_ ->
  ?max_results:models_max_page_size ->
  unit ->
  describe_model_versions_request

val make_detector_version_summary :
  ?detector_version_id:whole_number_version_string ->
  ?status:detector_version_status ->
  ?description:description ->
  ?last_updated_time:time ->
  unit ->
  detector_version_summary

val make_describe_detector_request :
  ?next_token:string_ ->
  ?max_results:detector_version_max_results ->
  detector_id:identifier ->
  unit ->
  describe_detector_request

val make_delete_variable_request : name:string_ -> unit -> delete_variable_request
val make_delete_rule_request : rule:rule -> unit -> delete_rule_request
val make_delete_outcome_request : name:identifier -> unit -> delete_outcome_request

val make_delete_model_version_request :
  model_id:model_identifier ->
  model_type:model_type_enum ->
  model_version_number:float_version_string ->
  unit ->
  delete_model_version_request

val make_delete_model_request :
  model_id:model_identifier -> model_type:model_type_enum -> unit -> delete_model_request

val make_delete_list_request : name:no_dash_identifier -> unit -> delete_list_request
val make_delete_label_request : name:identifier -> unit -> delete_label_request

val make_delete_external_model_request :
  model_endpoint:sage_maker_endpoint_identifier -> unit -> delete_external_model_request

val make_delete_event_type_request : name:identifier -> unit -> delete_event_type_request

val make_delete_events_by_event_type_request :
  event_type_name:identifier -> unit -> delete_events_by_event_type_request

val make_delete_event_request :
  ?delete_audit_history:delete_audit_history ->
  event_id:identifier ->
  event_type_name:identifier ->
  unit ->
  delete_event_request

val make_delete_entity_type_request : name:identifier -> unit -> delete_entity_type_request

val make_delete_detector_version_request :
  detector_id:identifier ->
  detector_version_id:whole_number_version_string ->
  unit ->
  delete_detector_version_request

val make_delete_detector_request : detector_id:identifier -> unit -> delete_detector_request

val make_delete_batch_prediction_job_request :
  job_id:identifier -> unit -> delete_batch_prediction_job_request

val make_delete_batch_import_job_request :
  job_id:identifier -> unit -> delete_batch_import_job_request

val make_create_variable_request :
  ?description:string_ ->
  ?variable_type:string_ ->
  ?tags:tag_list ->
  name:string_ ->
  data_type:data_type ->
  data_source:data_source ->
  default_value:string_ ->
  unit ->
  create_variable_request

val make_create_rule_request :
  ?description:description ->
  ?tags:tag_list ->
  rule_id:identifier ->
  detector_id:identifier ->
  expression:rule_expression ->
  language:language ->
  outcomes:non_empty_list_of_strings ->
  unit ->
  create_rule_request

val make_create_model_version_request :
  ?external_events_detail:external_events_detail ->
  ?ingested_events_detail:ingested_events_detail ->
  ?tags:tag_list ->
  model_id:model_identifier ->
  model_type:model_type_enum ->
  training_data_source:training_data_source_enum ->
  training_data_schema:training_data_schema ->
  unit ->
  create_model_version_request

val make_create_model_request :
  ?description:description ->
  ?tags:tag_list ->
  model_id:model_identifier ->
  model_type:model_type_enum ->
  event_type_name:string_ ->
  unit ->
  create_model_request

val make_create_list_request :
  ?elements:elements_list ->
  ?variable_type:variable_type ->
  ?description:description ->
  ?tags:tag_list ->
  name:no_dash_identifier ->
  unit ->
  create_list_request

val make_create_detector_version_request :
  ?description:description ->
  ?external_model_endpoints:list_of_strings ->
  ?model_versions:list_of_model_versions ->
  ?rule_execution_mode:rule_execution_mode ->
  ?tags:tag_list ->
  detector_id:identifier ->
  rules:rule_list ->
  unit ->
  create_detector_version_request

val make_create_batch_prediction_job_request :
  ?detector_version:whole_number_version_string ->
  ?tags:tag_list ->
  job_id:identifier ->
  input_path:s3_bucket_location ->
  output_path:s3_bucket_location ->
  event_type_name:identifier ->
  detector_name:identifier ->
  iam_role_arn:iam_role_arn ->
  unit ->
  create_batch_prediction_job_request

val make_create_batch_import_job_request :
  ?tags:tag_list ->
  job_id:identifier ->
  input_path:s3_bucket_location ->
  output_path:s3_bucket_location ->
  event_type_name:identifier ->
  iam_role_arn:iam_role_arn ->
  unit ->
  create_batch_import_job_request

val make_cancel_batch_prediction_job_request :
  job_id:identifier -> unit -> cancel_batch_prediction_job_request

val make_cancel_batch_import_job_request :
  job_id:identifier -> unit -> cancel_batch_import_job_request

val make_batch_get_variable_error :
  ?name:string_ -> ?code:integer2 -> ?message:string_ -> unit -> batch_get_variable_error

val make_batch_get_variable_request : names:name_list -> unit -> batch_get_variable_request

val make_batch_create_variable_error :
  ?name:string_ -> ?code:integer2 -> ?message:string_ -> unit -> batch_create_variable_error

val make_variable_entry :
  ?name:string_ ->
  ?data_type:string_ ->
  ?data_source:string_ ->
  ?default_value:string_ ->
  ?description:string_ ->
  ?variable_type:string_ ->
  unit ->
  variable_entry

val make_batch_create_variable_request :
  ?tags:tag_list -> variable_entries:variable_entry_list -> unit -> batch_create_variable_request
