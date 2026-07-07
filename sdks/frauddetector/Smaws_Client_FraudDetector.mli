(** FraudDetector client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module BatchCreateVariable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_create_variable_request ->
    ( batch_create_variable_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_create_variable_request ->
    ( batch_create_variable_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a batch of variables.\n"]

module BatchGetVariable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_variable_request ->
    ( batch_get_variable_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_variable_request ->
    ( batch_get_variable_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a batch of variables.\n"]

module CancelBatchImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_batch_import_job_request ->
    ( cancel_batch_import_job_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_batch_import_job_request ->
    ( cancel_batch_import_job_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Cancels an in-progress batch import job.\n"]

module CancelBatchPredictionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_batch_prediction_job_request ->
    ( cancel_batch_prediction_job_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_batch_prediction_job_request ->
    ( cancel_batch_prediction_job_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Cancels the specified batch prediction job.\n"]

module CreateBatchImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_batch_import_job_request ->
    ( create_batch_import_job_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_batch_import_job_request ->
    ( create_batch_import_job_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a batch import job. \n"]

module CreateBatchPredictionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_batch_prediction_job_request ->
    ( create_batch_prediction_job_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_batch_prediction_job_request ->
    ( create_batch_prediction_job_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a batch prediction job.\n"]

module CreateDetectorVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_detector_version_request ->
    ( create_detector_version_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_detector_version_request ->
    ( create_detector_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a detector version. The detector version starts in a [DRAFT] status.\n"]

module CreateList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_list_request ->
    ( create_list_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_list_request ->
    ( create_list_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Creates a list. \n\n\
  \ List is a set of input data for a variable in your event dataset. You use the input data in a \
   rule that's associated with your detector. For more information, see \
   {{:https://docs.aws.amazon.com/frauddetector/latest/ug/lists.html}Lists}.\n\
  \ "]

module CreateModel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_model_request ->
    ( create_model_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_model_request ->
    ( create_model_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a model using the specified model type.\n"]

module CreateModelVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_model_version_request ->
    ( create_model_version_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_model_version_request ->
    ( create_model_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a version of the model using the specified model type and model id. \n"]

module CreateRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_rule_request ->
    ( create_rule_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_rule_request ->
    ( create_rule_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a rule for use with the specified detector. \n"]

module CreateVariable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_variable_request ->
    ( create_variable_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_variable_request ->
    ( create_variable_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a variable.\n"]

module DeleteBatchImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_batch_import_job_request ->
    ( delete_batch_import_job_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_batch_import_job_request ->
    ( delete_batch_import_job_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified batch import job ID record. This action does not delete the data that was \
   batch imported. \n"]

module DeleteBatchPredictionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_batch_prediction_job_request ->
    ( delete_batch_prediction_job_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_batch_prediction_job_request ->
    ( delete_batch_prediction_job_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a batch prediction job.\n"]

module DeleteDetector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_detector_request ->
    ( delete_detector_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_detector_request ->
    ( delete_detector_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the detector. Before deleting a detector, you must first delete all detector versions \
   and rule versions associated with the detector.\n\n\
  \ When you delete a detector, Amazon Fraud Detector permanently deletes the detector and the \
   data is no longer stored in Amazon Fraud Detector.\n\
  \ "]

module DeleteDetectorVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_detector_version_request ->
    ( delete_detector_version_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_detector_version_request ->
    ( delete_detector_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the detector version. You cannot delete detector versions that are in [ACTIVE] status.\n\n\
  \ When you delete a detector version, Amazon Fraud Detector permanently deletes the detector and \
   the data is no longer stored in Amazon Fraud Detector.\n\
  \ "]

module DeleteEntityType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_entity_type_request ->
    ( delete_entity_type_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_entity_type_request ->
    ( delete_entity_type_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an entity type.\n\n\
  \ You cannot delete an entity type that is included in an event type.\n\
  \ \n\
  \  When you delete an entity type, Amazon Fraud Detector permanently deletes that entity type \
   and the data is no longer stored in Amazon Fraud Detector.\n\
  \  "]

module DeleteEvent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_event_request ->
    ( delete_event_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_event_request ->
    ( delete_event_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified event.\n\n\
  \ When you delete an event, Amazon Fraud Detector permanently deletes that event and the event \
   data is no longer stored in Amazon Fraud Detector. If [deleteAuditHistory] is [True], event \
   data is available through search for up to 30 seconds after the delete operation is completed.\n\
  \ "]

module DeleteEventType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_event_type_request ->
    ( delete_event_type_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_event_type_request ->
    ( delete_event_type_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an event type.\n\n\
  \ You cannot delete an event type that is used in a detector or a model.\n\
  \ \n\
  \  When you delete an event type, Amazon Fraud Detector permanently deletes that event type and \
   the data is no longer stored in Amazon Fraud Detector.\n\
  \  "]

module DeleteEventsByEventType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_events_by_event_type_request ->
    ( delete_events_by_event_type_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_events_by_event_type_request ->
    ( delete_events_by_event_type_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes all events of a particular event type.\n"]

module DeleteExternalModel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_external_model_request ->
    ( delete_external_model_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_external_model_request ->
    ( delete_external_model_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes a SageMaker model from Amazon Fraud Detector.\n\n\
  \ You can remove an Amazon SageMaker model if it is not associated with a detector version. \
   Removing a SageMaker model disconnects it from Amazon Fraud Detector, but the model remains \
   available in SageMaker.\n\
  \ "]

module DeleteLabel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_label_request ->
    ( delete_label_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_label_request ->
    ( delete_label_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a label.\n\n\
  \ You cannot delete labels that are included in an event type in Amazon Fraud Detector.\n\
  \ \n\
  \  You cannot delete a label assigned to an event ID. You must first delete the relevant event ID.\n\
  \  \n\
  \   When you delete a label, Amazon Fraud Detector permanently deletes that label and the data \
   is no longer stored in Amazon Fraud Detector.\n\
  \   "]

module DeleteList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_list_request ->
    ( delete_list_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_list_request ->
    ( delete_list_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deletes the list, provided it is not used in a rule. \n\n\
  \  When you delete a list, Amazon Fraud Detector permanently deletes that list and the elements \
   in the list.\n\
  \ "]

module DeleteModel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_model_request ->
    ( delete_model_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_model_request ->
    ( delete_model_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a model.\n\n\
  \ You can delete models and model versions in Amazon Fraud Detector, provided that they are not \
   associated with a detector version.\n\
  \ \n\
  \   When you delete a model, Amazon Fraud Detector permanently deletes that model and the data \
   is no longer stored in Amazon Fraud Detector.\n\
  \  "]

module DeleteModelVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_model_version_request ->
    ( delete_model_version_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_model_version_request ->
    ( delete_model_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a model version.\n\n\
  \ You can delete models and model versions in Amazon Fraud Detector, provided that they are not \
   associated with a detector version.\n\
  \ \n\
  \   When you delete a model version, Amazon Fraud Detector permanently deletes that model \
   version and the data is no longer stored in Amazon Fraud Detector.\n\
  \  "]

module DeleteOutcome : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_outcome_request ->
    ( delete_outcome_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_outcome_request ->
    ( delete_outcome_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an outcome.\n\n\
  \ You cannot delete an outcome that is used in a rule version.\n\
  \ \n\
  \  When you delete an outcome, Amazon Fraud Detector permanently deletes that outcome and the \
   data is no longer stored in Amazon Fraud Detector.\n\
  \  "]

module DeleteRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_rule_request ->
    ( delete_rule_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_rule_request ->
    ( delete_rule_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the rule. You cannot delete a rule if it is used by an [ACTIVE] or [INACTIVE] detector \
   version.\n\n\
  \ When you delete a rule, Amazon Fraud Detector permanently deletes that rule and the data is no \
   longer stored in Amazon Fraud Detector.\n\
  \ "]

module DeleteVariable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_variable_request ->
    ( delete_variable_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_variable_request ->
    ( delete_variable_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a variable.\n\n\
  \ You can't delete variables that are included in an event type in Amazon Fraud Detector.\n\
  \ \n\
  \  Amazon Fraud Detector automatically deletes model output variables and SageMaker model output \
   variables when you delete the model. You can't delete these variables manually.\n\
  \  \n\
  \   When you delete a variable, Amazon Fraud Detector permanently deletes that variable and the \
   data is no longer stored in Amazon Fraud Detector.\n\
  \   "]

module DescribeDetector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_detector_request ->
    ( describe_detector_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_detector_request ->
    ( describe_detector_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets all versions for a specified detector.\n"]

module DescribeModelVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_model_versions_request ->
    ( describe_model_versions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_model_versions_request ->
    ( describe_model_versions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets all of the model versions for the specified model type or for the specified model type and \
   model ID. You can also get details for a single, specified model version. \n"]

module GetBatchImportJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_batch_import_jobs_request ->
    ( get_batch_import_jobs_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_batch_import_jobs_request ->
    ( get_batch_import_jobs_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets all batch import jobs or a specific job of the specified ID. This is a paginated API. If \
   you provide a null [maxResults], this action retrieves a maximum of 50 records per page. If you \
   provide a [maxResults], the value must be between 1 and 50. To get the next page results, \
   provide the pagination token from the [GetBatchImportJobsResponse] as part of your request. A \
   null pagination token fetches the records from the beginning.\n"]

module GetBatchPredictionJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_batch_prediction_jobs_request ->
    ( get_batch_prediction_jobs_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_batch_prediction_jobs_request ->
    ( get_batch_prediction_jobs_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets all batch prediction jobs or a specific job if you specify a job ID. This is a paginated \
   API. If you provide a null maxResults, this action retrieves a maximum of 50 records per page. \
   If you provide a maxResults, the value must be between 1 and 50. To get the next page results, \
   provide the pagination token from the GetBatchPredictionJobsResponse as part of your request. A \
   null pagination token fetches the records from the beginning.\n"]

module GetDeleteEventsByEventTypeStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_delete_events_by_event_type_status_request ->
    ( get_delete_events_by_event_type_status_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_delete_events_by_event_type_status_request ->
    ( get_delete_events_by_event_type_status_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the status of a [DeleteEventsByEventType] action.\n"]

module GetDetectorVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_detector_version_request ->
    ( get_detector_version_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_detector_version_request ->
    ( get_detector_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a particular detector version. \n"]

module GetDetectors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_detectors_request ->
    ( get_detectors_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_detectors_request ->
    ( get_detectors_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets all detectors or a single detector if a [detectorId] is specified. This is a paginated \
   API. If you provide a null [maxResults], this action retrieves a maximum of 10 records per \
   page. If you provide a [maxResults], the value must be between 5 and 10. To get the next page \
   results, provide the pagination token from the [GetDetectorsResponse] as part of your request. \
   A null pagination token fetches the records from the beginning. \n"]

module GetEntityTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_entity_types_request ->
    ( get_entity_types_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_entity_types_request ->
    ( get_entity_types_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets all entity types or a specific entity type if a name is specified. This is a paginated \
   API. If you provide a null [maxResults], this action retrieves a maximum of 10 records per \
   page. If you provide a [maxResults], the value must be between 5 and 10. To get the next page \
   results, provide the pagination token from the [GetEntityTypesResponse] as part of your \
   request. A null pagination token fetches the records from the beginning. \n"]

module GetEvent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_event_request ->
    ( get_event_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_event_request ->
    ( get_event_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves details of events stored with Amazon Fraud Detector. This action does not retrieve \
   prediction results.\n"]

module GetEventPrediction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_event_prediction_request ->
    ( get_event_prediction_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_event_prediction_request ->
    ( get_event_prediction_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Evaluates an event against a detector version. If a version ID is not provided, the \
   detector\226\128\153s ([ACTIVE]) version is used.\n"]

module GetEventPredictionMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_event_prediction_metadata_request ->
    ( get_event_prediction_metadata_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_event_prediction_metadata_request ->
    ( get_event_prediction_metadata_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Gets details of the past fraud predictions for the specified event ID, event type, detector \
   ID, and detector version ID that was generated in the specified time period. \n"]

module GetEventTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_event_types_request ->
    ( get_event_types_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_event_types_request ->
    ( get_event_types_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets all event types or a specific event type if name is provided. This is a paginated API. If \
   you provide a null [maxResults], this action retrieves a maximum of 10 records per page. If you \
   provide a [maxResults], the value must be between 5 and 10. To get the next page results, \
   provide the pagination token from the [GetEventTypesResponse] as part of your request. A null \
   pagination token fetches the records from the beginning. \n"]

module GetExternalModels : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_external_models_request ->
    ( get_external_models_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_external_models_request ->
    ( get_external_models_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the details for one or more Amazon SageMaker models that have been imported into the \
   service. This is a paginated API. If you provide a null [maxResults], this actions retrieves a \
   maximum of 10 records per page. If you provide a [maxResults], the value must be between 5 and \
   10. To get the next page results, provide the pagination token from the \
   [GetExternalModelsResult] as part of your request. A null pagination token fetches the records \
   from the beginning. \n"]

module GetKMSEncryptionKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( get_kms_encryption_key_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( get_kms_encryption_key_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the encryption key if a KMS key has been specified to be used to encrypt content in Amazon \
   Fraud Detector.\n"]

module GetLabels : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_labels_request ->
    ( get_labels_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_labels_request ->
    ( get_labels_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets all labels or a specific label if name is provided. This is a paginated API. If you \
   provide a null [maxResults], this action retrieves a maximum of 50 records per page. If you \
   provide a [maxResults], the value must be between 10 and 50. To get the next page results, \
   provide the pagination token from the [GetGetLabelsResponse] as part of your request. A null \
   pagination token fetches the records from the beginning. \n"]

module GetListElements : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_list_elements_request ->
    ( get_list_elements_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_list_elements_request ->
    ( get_list_elements_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Gets all the elements in the specified list. \n"]

module GetListsMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_lists_metadata_request ->
    ( get_lists_metadata_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_lists_metadata_request ->
    ( get_lists_metadata_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Gets the metadata of either all the lists under the account or the specified list. \n"]

module GetModelVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_model_version_request ->
    ( get_model_version_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_model_version_request ->
    ( get_model_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the details of the specified model version.\n"]

module GetModels : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_models_request ->
    ( get_models_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_models_request ->
    ( get_models_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets one or more models. Gets all models for the Amazon Web Services account if no model type \
   and no model id provided. Gets all models for the Amazon Web Services account and model type, \
   if the model type is specified but model id is not provided. Gets a specific model if (model \
   type, model id) tuple is specified. \n\n\
  \ This is a paginated API. If you provide a null [maxResults], this action retrieves a maximum \
   of 10 records per page. If you provide a [maxResults], the value must be between 1 and 10. To \
   get the next page results, provide the pagination token from the response as part of your \
   request. A null pagination token fetches the records from the beginning.\n\
  \ "]

module GetOutcomes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_outcomes_request ->
    ( get_outcomes_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_outcomes_request ->
    ( get_outcomes_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets one or more outcomes. This is a paginated API. If you provide a null [maxResults], this \
   actions retrieves a maximum of 100 records per page. If you provide a [maxResults], the value \
   must be between 50 and 100. To get the next page results, provide the pagination token from the \
   [GetOutcomesResult] as part of your request. A null pagination token fetches the records from \
   the beginning. \n"]

module GetRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_rules_request ->
    ( get_rules_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_rules_request ->
    ( get_rules_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Get all rules for a detector (paginated) if [ruleId] and [ruleVersion] are not specified. Gets \
   all rules for the detector and the [ruleId] if present (paginated). Gets a specific rule if \
   both the [ruleId] and the [ruleVersion] are specified.\n\n\
  \ This is a paginated API. Providing null maxResults results in retrieving maximum of 100 \
   records per page. If you provide maxResults the value must be between 50 and 100. To get the \
   next page result, a provide a pagination token from GetRulesResult as part of your request. \
   Null pagination token fetches the records from the beginning.\n\
  \ "]

module GetVariables : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_variables_request ->
    ( get_variables_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_variables_request ->
    ( get_variables_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets all of the variables or the specific variable. This is a paginated API. Providing null \
   [maxSizePerPage] results in retrieving maximum of 100 records per page. If you provide \
   [maxSizePerPage] the value must be between 50 and 100. To get the next page result, a provide a \
   pagination token from [GetVariablesResult] as part of your request. Null pagination token \
   fetches the records from the beginning. \n"]

module ListEventPredictions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_event_predictions_request ->
    ( list_event_predictions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_event_predictions_request ->
    ( list_event_predictions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of past predictions. The list can be filtered by detector ID, detector version ID, \
   event ID, event type, or by specifying a time period. If filter is not specified, the most \
   recent prediction is returned.\n\n\
  \ For example, the following filter lists all past predictions for [xyz] event type - [{ \n\
  \        \"eventType\":{\n\
  \        \"value\": \"xyz\" }\226\128\157 \n\
  \        }  ] \n\
  \ \n\
  \  This is a paginated API. If you provide a null [maxResults], this action will retrieve a \
   maximum of 10 records per page. If you provide a [maxResults], the value must be between 50 and \
   100. To get the next page results, provide the [nextToken] from the response as part of your \
   request. A null [nextToken] fetches the records from the beginning. \n\
  \  "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all tags associated with the resource. This is a paginated API. To get the next page \
   results, provide the pagination token from the response as part of your request. A null \
   pagination token fetches the records from the beginning. \n"]

module PutDetector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_detector_request ->
    ( put_detector_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_detector_request ->
    ( put_detector_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates or updates a detector. \n"]

module PutEntityType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_entity_type_request ->
    ( put_entity_type_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_entity_type_request ->
    ( put_entity_type_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an entity type. An entity represents who is performing the event. As part of \
   a fraud prediction, you pass the entity ID to indicate the specific entity who performed the \
   event. An entity type classifies the entity. Example classifications include customer, \
   merchant, or account.\n"]

module PutEventType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_event_type_request ->
    ( put_event_type_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_event_type_request ->
    ( put_event_type_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an event type. An event is a business activity that is evaluated for fraud \
   risk. With Amazon Fraud Detector, you generate fraud predictions for events. An event type \
   defines the structure for an event sent to Amazon Fraud Detector. This includes the variables \
   sent as part of the event, the entity performing the event (such as a customer), and the labels \
   that classify the event. Example event types include online payment transactions, account \
   registrations, and authentications.\n"]

module PutExternalModel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_external_model_request ->
    ( put_external_model_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_external_model_request ->
    ( put_external_model_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an Amazon SageMaker model endpoint. You can also use this action to update \
   the configuration of the model endpoint, including the IAM role and/or the mapped variables. \n"]

module PutKMSEncryptionKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_kms_encryption_key_request ->
    ( put_kms_encryption_key_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_kms_encryption_key_request ->
    ( put_kms_encryption_key_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Specifies the KMS key to be used to encrypt content in Amazon Fraud Detector.\n"]

module PutLabel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_label_request ->
    ( put_label_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_label_request ->
    ( put_label_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates label. A label classifies an event as fraudulent or legitimate. Labels are \
   associated with event types and used to train supervised machine learning models in Amazon \
   Fraud Detector. \n"]

module PutOutcome : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_outcome_request ->
    ( put_outcome_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_outcome_request ->
    ( put_outcome_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates or updates an outcome. \n"]

module SendEvent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_event_request ->
    ( send_event_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_event_request ->
    ( send_event_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stores events in Amazon Fraud Detector without generating fraud predictions for those events. \
   For example, you can use [SendEvent] to upload a historical dataset, which you can then later \
   use to train a model.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Assigns tags to a resource.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes tags from a resource.\n"]

module UpdateDetectorVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_detector_version_request ->
    ( update_detector_version_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_detector_version_request ->
    ( update_detector_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Updates a detector version. The detector version attributes that you can update include \
   models, external model endpoints, rules, rule execution mode, and description. You can only \
   update a [DRAFT] detector version.\n"]

module UpdateDetectorVersionMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_detector_version_metadata_request ->
    ( update_detector_version_metadata_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_detector_version_metadata_request ->
    ( update_detector_version_metadata_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the detector version's description. You can update the metadata for any detector \
   version ([DRAFT, ACTIVE,] or [INACTIVE]). \n"]

module UpdateDetectorVersionStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_detector_version_status_request ->
    ( update_detector_version_status_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_detector_version_status_request ->
    ( update_detector_version_status_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the detector version\226\128\153s status. You can perform the following promotions or \
   demotions using [UpdateDetectorVersionStatus]: [DRAFT] to [ACTIVE], [ACTIVE] to [INACTIVE], and \
   [INACTIVE] to [ACTIVE].\n"]

module UpdateEventLabel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_event_label_request ->
    ( update_event_label_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_event_label_request ->
    ( update_event_label_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified event with a new label.\n"]

module UpdateList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_list_request ->
    ( update_list_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_list_request ->
    ( update_list_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Updates a list. \n"]

module UpdateModel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_model_request ->
    ( update_model_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_model_request ->
    ( update_model_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates model description.\n"]

module UpdateModelVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_model_version_request ->
    ( update_model_version_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_model_version_request ->
    ( update_model_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a model version. Updating a model version retrains an existing model version using \
   updated training data and produces a new minor version of the model. You can update the \
   training data set location and data access role attributes using this action. This action \
   creates and trains a new minor version of the model, for example version 1.01, 1.02, 1.03.\n"]

module UpdateModelVersionStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_model_version_status_request ->
    ( update_model_version_status_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_model_version_status_request ->
    ( update_model_version_status_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the status of a model version.\n\n\
  \ You can perform the following status updates:\n\
  \ \n\
  \  {ol\n\
  \        {-  Change the [TRAINING_IN_PROGRESS] status to [TRAINING_CANCELLED].\n\
  \            \n\
  \             }\n\
  \        {-  Change the [TRAINING_COMPLETE] status to [ACTIVE].\n\
  \            \n\
  \             }\n\
  \        {-  Change [ACTIVE] to [INACTIVE].\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module UpdateRuleMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_rule_metadata_request ->
    ( update_rule_metadata_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_rule_metadata_request ->
    ( update_rule_metadata_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a rule's metadata. The description attribute can be updated.\n"]

module UpdateRuleVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_rule_version_request ->
    ( update_rule_version_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_rule_version_request ->
    ( update_rule_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a rule version resulting in a new rule version. Updates a rule version resulting in a \
   new rule version (version 1, 2, 3 ...). \n"]

(** {1:Serialization and Deserialization} *)
module UpdateVariable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_variable_request ->
    ( update_variable_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_variable_request ->
    ( update_variable_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a variable.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
