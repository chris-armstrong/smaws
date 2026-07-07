(** LookoutEquipment client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_update_retraining_scheduler_request :
  ?promote_mode:model_promote_mode ->
  ?lookback_window:lookback_window ->
  ?retraining_frequency:retraining_frequency ->
  ?retraining_start_date:timestamp ->
  model_name:model_name ->
  unit ->
  update_retraining_scheduler_request

val make_labels_s3_input_configuration :
  ?prefix:s3_prefix -> bucket:s3_bucket -> unit -> labels_s3_input_configuration

val make_labels_input_configuration :
  ?label_group_name:label_group_name ->
  ?s3_input_configuration:labels_s3_input_configuration ->
  unit ->
  labels_input_configuration

val make_model_diagnostics_s3_output_configuration :
  ?prefix:s3_prefix -> bucket:s3_bucket -> unit -> model_diagnostics_s3_output_configuration

val make_model_diagnostics_output_configuration :
  ?kms_key_id:name_or_arn ->
  s3_output_configuration:model_diagnostics_s3_output_configuration ->
  unit ->
  model_diagnostics_output_configuration

val make_update_model_request :
  ?model_diagnostics_output_configuration:model_diagnostics_output_configuration ->
  ?role_arn:iam_role_arn ->
  ?labels_input_configuration:labels_input_configuration ->
  model_name:model_name ->
  unit ->
  update_model_request

val make_update_label_group_request :
  ?fault_codes:fault_codes ->
  label_group_name:label_group_name ->
  unit ->
  update_label_group_request

val make_inference_s3_input_configuration :
  ?prefix:s3_prefix -> bucket:s3_bucket -> unit -> inference_s3_input_configuration

val make_inference_input_name_configuration :
  ?component_timestamp_delimiter:component_timestamp_delimiter ->
  ?timestamp_format:file_name_timestamp_format ->
  unit ->
  inference_input_name_configuration

val make_inference_input_configuration :
  ?inference_input_name_configuration:inference_input_name_configuration ->
  ?input_time_zone_offset:time_zone_offset ->
  ?s3_input_configuration:inference_s3_input_configuration ->
  unit ->
  inference_input_configuration

val make_inference_s3_output_configuration :
  ?prefix:s3_prefix -> bucket:s3_bucket -> unit -> inference_s3_output_configuration

val make_inference_output_configuration :
  ?kms_key_id:name_or_arn ->
  s3_output_configuration:inference_s3_output_configuration ->
  unit ->
  inference_output_configuration

val make_update_inference_scheduler_request :
  ?role_arn:iam_role_arn ->
  ?data_output_configuration:inference_output_configuration ->
  ?data_input_configuration:inference_input_configuration ->
  ?data_upload_frequency:data_upload_frequency ->
  ?data_delay_offset_in_minutes:data_delay_offset_in_minutes ->
  inference_scheduler_name:inference_scheduler_identifier ->
  unit ->
  update_inference_scheduler_request

val make_update_active_model_version_response :
  ?previous_active_version_arn:model_version_arn ->
  ?current_active_version_arn:model_version_arn ->
  ?previous_active_version:model_version ->
  ?current_active_version:model_version ->
  ?model_arn:model_arn ->
  ?model_name:model_name ->
  unit ->
  update_active_model_version_response

val make_update_active_model_version_request :
  model_version:model_version ->
  model_name:model_name ->
  unit ->
  update_active_model_version_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:amazon_resource_arn -> unit -> untag_resource_request

val make_unsupported_timestamps :
  total_number_of_unsupported_timestamps:integer -> unit -> unsupported_timestamps

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_arn:amazon_resource_arn -> unit -> tag_resource_request

val make_stop_retraining_scheduler_response :
  ?status:retraining_scheduler_status ->
  ?model_arn:model_arn ->
  ?model_name:model_name ->
  unit ->
  stop_retraining_scheduler_response

val make_stop_retraining_scheduler_request :
  model_name:model_name -> unit -> stop_retraining_scheduler_request

val make_stop_inference_scheduler_response :
  ?status:inference_scheduler_status ->
  ?inference_scheduler_arn:inference_scheduler_arn ->
  ?inference_scheduler_name:inference_scheduler_name ->
  ?model_name:model_name ->
  ?model_arn:model_arn ->
  unit ->
  stop_inference_scheduler_response

val make_stop_inference_scheduler_request :
  inference_scheduler_name:inference_scheduler_identifier ->
  unit ->
  stop_inference_scheduler_request

val make_start_retraining_scheduler_response :
  ?status:retraining_scheduler_status ->
  ?model_arn:model_arn ->
  ?model_name:model_name ->
  unit ->
  start_retraining_scheduler_response

val make_start_retraining_scheduler_request :
  model_name:model_name -> unit -> start_retraining_scheduler_request

val make_start_inference_scheduler_response :
  ?status:inference_scheduler_status ->
  ?inference_scheduler_arn:inference_scheduler_arn ->
  ?inference_scheduler_name:inference_scheduler_name ->
  ?model_name:model_name ->
  ?model_arn:model_arn ->
  unit ->
  start_inference_scheduler_response

val make_start_inference_scheduler_request :
  inference_scheduler_name:inference_scheduler_identifier ->
  unit ->
  start_inference_scheduler_request

val make_start_data_ingestion_job_response :
  ?status:ingestion_job_status ->
  ?job_id:ingestion_job_id ->
  unit ->
  start_data_ingestion_job_response

val make_ingestion_s3_input_configuration :
  ?key_pattern:key_pattern ->
  ?prefix:s3_prefix ->
  bucket:s3_bucket ->
  unit ->
  ingestion_s3_input_configuration

val make_ingestion_input_configuration :
  s3_input_configuration:ingestion_s3_input_configuration -> unit -> ingestion_input_configuration

val make_start_data_ingestion_job_request :
  client_token:idempotence_token ->
  role_arn:iam_role_arn ->
  ingestion_input_configuration:ingestion_input_configuration ->
  dataset_name:dataset_identifier ->
  unit ->
  start_data_ingestion_job_request

val make_sensors_with_short_date_range :
  affected_sensor_count:integer -> unit -> sensors_with_short_date_range

val make_count_percent : percentage:float_ -> count:integer -> unit -> count_percent

val make_categorical_values :
  ?number_of_category:integer -> status:statistical_issue_status -> unit -> categorical_values

val make_multiple_operating_modes :
  status:statistical_issue_status -> unit -> multiple_operating_modes

val make_large_timestamp_gaps :
  ?max_timestamp_gap_in_days:integer ->
  ?number_of_large_timestamp_gaps:integer ->
  status:statistical_issue_status ->
  unit ->
  large_timestamp_gaps

val make_monotonic_values :
  ?monotonicity:monotonicity -> status:statistical_issue_status -> unit -> monotonic_values

val make_sensor_statistics_summary :
  ?data_end_time:timestamp ->
  ?data_start_time:timestamp ->
  ?monotonic_values:monotonic_values ->
  ?large_timestamp_gaps:large_timestamp_gaps ->
  ?multiple_operating_modes:multiple_operating_modes ->
  ?categorical_values:categorical_values ->
  ?duplicate_timestamps:count_percent ->
  ?invalid_date_entries:count_percent ->
  ?invalid_values:count_percent ->
  ?missing_values:count_percent ->
  ?data_exists:boolean_ ->
  ?sensor_name:sensor_name ->
  ?component_name:component_name ->
  unit ->
  sensor_statistics_summary

val make_s3_object : key:s3_key -> bucket:s3_bucket -> unit -> s3_object

val make_retraining_scheduler_summary :
  ?lookback_window:lookback_window ->
  ?retraining_frequency:retraining_frequency ->
  ?retraining_start_date:timestamp ->
  ?status:retraining_scheduler_status ->
  ?model_arn:model_arn ->
  ?model_name:model_name ->
  unit ->
  retraining_scheduler_summary

val make_put_resource_policy_response :
  ?policy_revision_id:policy_revision_id ->
  ?resource_arn:resource_arn ->
  unit ->
  put_resource_policy_response

val make_put_resource_policy_request :
  ?policy_revision_id:policy_revision_id ->
  client_token:idempotence_token ->
  resource_policy:policy ->
  resource_arn:resource_arn ->
  unit ->
  put_resource_policy_request

val make_model_version_summary :
  ?model_quality:model_quality ->
  ?source_type:model_version_source_type ->
  ?status:model_version_status ->
  ?created_at:timestamp ->
  ?model_version_arn:model_version_arn ->
  ?model_version:model_version ->
  ?model_arn:model_arn ->
  ?model_name:model_name ->
  unit ->
  model_version_summary

val make_model_summary :
  ?model_quality:model_quality ->
  ?model_diagnostics_output_configuration:model_diagnostics_output_configuration ->
  ?retraining_scheduler_status:retraining_scheduler_status ->
  ?next_scheduled_retraining_start_date:timestamp ->
  ?latest_scheduled_retraining_start_time:timestamp ->
  ?latest_scheduled_retraining_model_version:model_version ->
  ?latest_scheduled_retraining_status:model_version_status ->
  ?active_model_version_arn:model_version_arn ->
  ?active_model_version:model_version ->
  ?created_at:timestamp ->
  ?status:model_status ->
  ?dataset_arn:dataset_arn ->
  ?dataset_name:dataset_name ->
  ?model_arn:model_arn ->
  ?model_name:model_name ->
  unit ->
  model_summary

val make_missing_sensor_data :
  total_number_of_missing_values:integer ->
  affected_sensor_count:integer ->
  unit ->
  missing_sensor_data

val make_missing_complete_sensor_data :
  affected_sensor_count:integer -> unit -> missing_complete_sensor_data

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:amazon_resource_arn -> unit -> list_tags_for_resource_request

val make_list_sensor_statistics_response :
  ?next_token:next_token ->
  ?sensor_statistics_summaries:sensor_statistics_summaries ->
  unit ->
  list_sensor_statistics_response

val make_list_sensor_statistics_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?ingestion_job_id:ingestion_job_id ->
  dataset_name:dataset_name ->
  unit ->
  list_sensor_statistics_request

val make_list_retraining_schedulers_response :
  ?next_token:next_token ->
  ?retraining_scheduler_summaries:retraining_scheduler_summaries ->
  unit ->
  list_retraining_schedulers_response

val make_list_retraining_schedulers_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?status:retraining_scheduler_status ->
  ?model_name_begins_with:model_name ->
  unit ->
  list_retraining_schedulers_request

val make_list_models_response :
  ?model_summaries:model_summaries -> ?next_token:next_token -> unit -> list_models_response

val make_list_models_request :
  ?dataset_name_begins_with:dataset_name ->
  ?model_name_begins_with:model_name ->
  ?status:model_status ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_models_request

val make_list_model_versions_response :
  ?model_version_summaries:model_version_summaries ->
  ?next_token:next_token ->
  unit ->
  list_model_versions_response

val make_list_model_versions_request :
  ?min_model_version:model_version ->
  ?max_model_version:model_version ->
  ?created_at_start_time:timestamp ->
  ?created_at_end_time:timestamp ->
  ?source_type:model_version_source_type ->
  ?status:model_version_status ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  model_name:model_name ->
  unit ->
  list_model_versions_request

val make_label_summary :
  ?created_at:timestamp ->
  ?equipment:equipment ->
  ?fault_code:fault_code ->
  ?rating:label_rating ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?label_group_arn:label_group_arn ->
  ?label_id:label_id ->
  ?label_group_name:label_group_name ->
  unit ->
  label_summary

val make_list_labels_response :
  ?label_summaries:label_summaries -> ?next_token:next_token -> unit -> list_labels_response

val make_list_labels_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?equipment:equipment ->
  ?fault_code:fault_code ->
  ?interval_end_time:timestamp ->
  ?interval_start_time:timestamp ->
  label_group_name:label_group_name ->
  unit ->
  list_labels_request

val make_label_group_summary :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?label_group_arn:label_group_arn ->
  ?label_group_name:label_group_name ->
  unit ->
  label_group_summary

val make_list_label_groups_response :
  ?label_group_summaries:label_group_summaries ->
  ?next_token:next_token ->
  unit ->
  list_label_groups_response

val make_list_label_groups_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?label_group_name_begins_with:label_group_name ->
  unit ->
  list_label_groups_request

val make_inference_scheduler_summary :
  ?latest_inference_result:latest_inference_result ->
  ?data_upload_frequency:data_upload_frequency ->
  ?data_delay_offset_in_minutes:data_delay_offset_in_minutes ->
  ?status:inference_scheduler_status ->
  ?inference_scheduler_arn:inference_scheduler_arn ->
  ?inference_scheduler_name:inference_scheduler_name ->
  ?model_arn:model_arn ->
  ?model_name:model_name ->
  unit ->
  inference_scheduler_summary

val make_list_inference_schedulers_response :
  ?inference_scheduler_summaries:inference_scheduler_summaries ->
  ?next_token:next_token ->
  unit ->
  list_inference_schedulers_response

val make_list_inference_schedulers_request :
  ?status:inference_scheduler_status ->
  ?model_name:model_name ->
  ?inference_scheduler_name_begins_with:inference_scheduler_identifier ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_inference_schedulers_request

val make_inference_execution_summary :
  ?model_version_arn:model_version_arn ->
  ?model_version:model_version ->
  ?failed_reason:bounded_length_string ->
  ?status:inference_execution_status ->
  ?customer_result_object:s3_object ->
  ?data_output_configuration:inference_output_configuration ->
  ?data_input_configuration:inference_input_configuration ->
  ?data_end_time:timestamp ->
  ?data_start_time:timestamp ->
  ?scheduled_start_time:timestamp ->
  ?inference_scheduler_arn:inference_scheduler_arn ->
  ?inference_scheduler_name:inference_scheduler_name ->
  ?model_arn:model_arn ->
  ?model_name:model_name ->
  unit ->
  inference_execution_summary

val make_list_inference_executions_response :
  ?inference_execution_summaries:inference_execution_summaries ->
  ?next_token:next_token ->
  unit ->
  list_inference_executions_response

val make_list_inference_executions_request :
  ?status:inference_execution_status ->
  ?data_end_time_before:timestamp ->
  ?data_start_time_after:timestamp ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  inference_scheduler_name:inference_scheduler_identifier ->
  unit ->
  list_inference_executions_request

val make_inference_event_summary :
  ?event_duration_in_seconds:event_duration_in_seconds ->
  ?diagnostics:model_metrics ->
  ?event_end_time:timestamp ->
  ?event_start_time:timestamp ->
  ?inference_scheduler_name:inference_scheduler_name ->
  ?inference_scheduler_arn:inference_scheduler_arn ->
  unit ->
  inference_event_summary

val make_list_inference_events_response :
  ?inference_event_summaries:inference_event_summaries ->
  ?next_token:next_token ->
  unit ->
  list_inference_events_response

val make_list_inference_events_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  interval_end_time:timestamp ->
  interval_start_time:timestamp ->
  inference_scheduler_name:inference_scheduler_identifier ->
  unit ->
  list_inference_events_request

val make_dataset_summary :
  ?created_at:timestamp ->
  ?status:dataset_status ->
  ?dataset_arn:dataset_arn ->
  ?dataset_name:dataset_name ->
  unit ->
  dataset_summary

val make_list_datasets_response :
  ?dataset_summaries:dataset_summaries -> ?next_token:next_token -> unit -> list_datasets_response

val make_list_datasets_request :
  ?dataset_name_begins_with:dataset_name ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_datasets_request

val make_data_ingestion_job_summary :
  ?status:ingestion_job_status ->
  ?ingestion_input_configuration:ingestion_input_configuration ->
  ?dataset_arn:dataset_arn ->
  ?dataset_name:dataset_name ->
  ?job_id:ingestion_job_id ->
  unit ->
  data_ingestion_job_summary

val make_list_data_ingestion_jobs_response :
  ?data_ingestion_job_summaries:data_ingestion_job_summaries ->
  ?next_token:next_token ->
  unit ->
  list_data_ingestion_jobs_response

val make_list_data_ingestion_jobs_request :
  ?status:ingestion_job_status ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?dataset_name:dataset_name ->
  unit ->
  list_data_ingestion_jobs_request

val make_invalid_sensor_data :
  total_number_of_invalid_values:integer ->
  affected_sensor_count:integer ->
  unit ->
  invalid_sensor_data

val make_insufficient_sensor_data :
  sensors_with_short_date_range:sensors_with_short_date_range ->
  missing_complete_sensor_data:missing_complete_sensor_data ->
  unit ->
  insufficient_sensor_data

val make_ingested_files_summary :
  ?discarded_files:list_of_discarded_files ->
  ingested_number_of_files:integer ->
  total_number_of_files:integer ->
  unit ->
  ingested_files_summary

val make_import_model_version_response :
  ?status:model_version_status ->
  ?model_version:model_version ->
  ?model_version_arn:model_version_arn ->
  ?model_arn:model_arn ->
  ?model_name:model_name ->
  unit ->
  import_model_version_response

val make_import_model_version_request :
  ?inference_data_import_strategy:inference_data_import_strategy ->
  ?tags:tag_list ->
  ?server_side_kms_key_id:name_or_arn ->
  ?role_arn:iam_role_arn ->
  ?labels_input_configuration:labels_input_configuration ->
  ?model_name:model_name ->
  client_token:idempotence_token ->
  dataset_name:dataset_identifier ->
  source_model_version_arn:model_version_arn ->
  unit ->
  import_model_version_request

val make_import_dataset_response :
  ?job_id:ingestion_job_id ->
  ?status:dataset_status ->
  ?dataset_arn:dataset_arn ->
  ?dataset_name:dataset_name ->
  unit ->
  import_dataset_response

val make_import_dataset_request :
  ?tags:tag_list ->
  ?server_side_kms_key_id:name_or_arn ->
  ?dataset_name:dataset_name ->
  client_token:idempotence_token ->
  source_dataset_arn:dataset_arn ->
  unit ->
  import_dataset_request

val make_duplicate_timestamps :
  total_number_of_duplicate_timestamps:integer -> unit -> duplicate_timestamps

val make_describe_retraining_scheduler_response :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?promote_mode:model_promote_mode ->
  ?status:retraining_scheduler_status ->
  ?lookback_window:lookback_window ->
  ?retraining_frequency:retraining_frequency ->
  ?retraining_start_date:timestamp ->
  ?model_arn:model_arn ->
  ?model_name:model_name ->
  unit ->
  describe_retraining_scheduler_response

val make_describe_retraining_scheduler_request :
  model_name:model_name -> unit -> describe_retraining_scheduler_request

val make_describe_resource_policy_response :
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?resource_policy:policy ->
  ?policy_revision_id:policy_revision_id ->
  unit ->
  describe_resource_policy_response

val make_describe_resource_policy_request :
  resource_arn:resource_arn -> unit -> describe_resource_policy_request

val make_data_pre_processing_configuration :
  ?target_sampling_rate:target_sampling_rate -> unit -> data_pre_processing_configuration

val make_describe_model_version_response :
  ?model_quality:model_quality ->
  ?model_diagnostics_results_object:s3_object ->
  ?model_diagnostics_output_configuration:model_diagnostics_output_configuration ->
  ?auto_promotion_result_reason:auto_promotion_result_reason ->
  ?auto_promotion_result:auto_promotion_result ->
  ?retraining_available_data_in_days:integer ->
  ?prior_model_metrics:model_metrics ->
  ?imported_data_size_in_bytes:data_size_in_bytes ->
  ?import_job_end_time:timestamp ->
  ?import_job_start_time:timestamp ->
  ?source_model_version_arn:model_version_arn ->
  ?off_condition:off_condition ->
  ?server_side_kms_key_id:kms_key_arn ->
  ?created_at:timestamp ->
  ?last_updated_time:timestamp ->
  ?model_metrics:model_metrics ->
  ?failed_reason:bounded_length_string ->
  ?training_execution_end_time:timestamp ->
  ?training_execution_start_time:timestamp ->
  ?data_pre_processing_configuration:data_pre_processing_configuration ->
  ?role_arn:iam_role_arn ->
  ?evaluation_data_end_time:timestamp ->
  ?evaluation_data_start_time:timestamp ->
  ?training_data_end_time:timestamp ->
  ?training_data_start_time:timestamp ->
  ?labels_input_configuration:labels_input_configuration ->
  ?schema:inline_data_schema ->
  ?dataset_arn:dataset_arn ->
  ?dataset_name:dataset_name ->
  ?source_type:model_version_source_type ->
  ?status:model_version_status ->
  ?model_version_arn:model_version_arn ->
  ?model_version:model_version ->
  ?model_arn:model_arn ->
  ?model_name:model_name ->
  unit ->
  describe_model_version_response

val make_describe_model_version_request :
  model_version:model_version -> model_name:model_name -> unit -> describe_model_version_request

val make_describe_model_response :
  ?model_quality:model_quality ->
  ?model_diagnostics_output_configuration:model_diagnostics_output_configuration ->
  ?retraining_scheduler_status:retraining_scheduler_status ->
  ?accumulated_inference_data_end_time:timestamp ->
  ?accumulated_inference_data_start_time:timestamp ->
  ?next_scheduled_retraining_start_date:timestamp ->
  ?latest_scheduled_retraining_available_data_in_days:integer ->
  ?latest_scheduled_retraining_start_time:timestamp ->
  ?latest_scheduled_retraining_model_version:model_version ->
  ?latest_scheduled_retraining_status:model_version_status ->
  ?latest_scheduled_retraining_failed_reason:bounded_length_string ->
  ?prior_model_metrics:synthesized_json_model_metrics ->
  ?previous_model_version_activated_at:timestamp ->
  ?previous_active_model_version_arn:model_version_arn ->
  ?previous_active_model_version:model_version ->
  ?model_version_activated_at:timestamp ->
  ?active_model_version_arn:model_version_arn ->
  ?active_model_version:model_version ->
  ?import_job_end_time:timestamp ->
  ?import_job_start_time:timestamp ->
  ?source_model_version_arn:model_version_arn ->
  ?off_condition:off_condition ->
  ?server_side_kms_key_id:kms_key_arn ->
  ?created_at:timestamp ->
  ?last_updated_time:timestamp ->
  ?model_metrics:synthesized_json_model_metrics ->
  ?failed_reason:bounded_length_string ->
  ?training_execution_end_time:timestamp ->
  ?training_execution_start_time:timestamp ->
  ?status:model_status ->
  ?data_pre_processing_configuration:data_pre_processing_configuration ->
  ?role_arn:iam_role_arn ->
  ?evaluation_data_end_time:timestamp ->
  ?evaluation_data_start_time:timestamp ->
  ?training_data_end_time:timestamp ->
  ?training_data_start_time:timestamp ->
  ?labels_input_configuration:labels_input_configuration ->
  ?schema:synthesized_json_inline_data_schema ->
  ?dataset_arn:dataset_arn ->
  ?dataset_name:dataset_name ->
  ?model_arn:model_arn ->
  ?model_name:model_name ->
  unit ->
  describe_model_response

val make_describe_model_request : model_name:model_name -> unit -> describe_model_request

val make_describe_label_response :
  ?created_at:timestamp ->
  ?equipment:equipment ->
  ?notes:comments ->
  ?fault_code:fault_code ->
  ?rating:label_rating ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?label_id:label_id ->
  ?label_group_arn:label_group_arn ->
  ?label_group_name:label_group_name ->
  unit ->
  describe_label_response

val make_describe_label_request :
  label_id:label_id -> label_group_name:label_group_name -> unit -> describe_label_request

val make_describe_label_group_response :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?fault_codes:fault_codes ->
  ?label_group_arn:label_group_arn ->
  ?label_group_name:label_group_name ->
  unit ->
  describe_label_group_response

val make_describe_label_group_request :
  label_group_name:label_group_name -> unit -> describe_label_group_request

val make_describe_inference_scheduler_response :
  ?latest_inference_result:latest_inference_result ->
  ?server_side_kms_key_id:kms_key_arn ->
  ?role_arn:iam_role_arn ->
  ?data_output_configuration:inference_output_configuration ->
  ?data_input_configuration:inference_input_configuration ->
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?data_upload_frequency:data_upload_frequency ->
  ?data_delay_offset_in_minutes:data_delay_offset_in_minutes ->
  ?status:inference_scheduler_status ->
  ?inference_scheduler_arn:inference_scheduler_arn ->
  ?inference_scheduler_name:inference_scheduler_name ->
  ?model_name:model_name ->
  ?model_arn:model_arn ->
  unit ->
  describe_inference_scheduler_response

val make_describe_inference_scheduler_request :
  inference_scheduler_name:inference_scheduler_identifier ->
  unit ->
  describe_inference_scheduler_request

val make_data_quality_summary :
  duplicate_timestamps:duplicate_timestamps ->
  unsupported_timestamps:unsupported_timestamps ->
  invalid_sensor_data:invalid_sensor_data ->
  missing_sensor_data:missing_sensor_data ->
  insufficient_sensor_data:insufficient_sensor_data ->
  unit ->
  data_quality_summary

val make_describe_dataset_response :
  ?source_dataset_arn:dataset_arn ->
  ?data_end_time:timestamp ->
  ?data_start_time:timestamp ->
  ?role_arn:iam_role_arn ->
  ?ingested_files_summary:ingested_files_summary ->
  ?data_quality_summary:data_quality_summary ->
  ?ingestion_input_configuration:ingestion_input_configuration ->
  ?server_side_kms_key_id:kms_key_arn ->
  ?schema:synthesized_json_inline_data_schema ->
  ?status:dataset_status ->
  ?last_updated_at:timestamp ->
  ?created_at:timestamp ->
  ?dataset_arn:dataset_arn ->
  ?dataset_name:dataset_name ->
  unit ->
  describe_dataset_response

val make_describe_dataset_request :
  dataset_name:dataset_identifier -> unit -> describe_dataset_request

val make_describe_data_ingestion_job_response :
  ?source_dataset_arn:dataset_arn ->
  ?data_end_time:timestamp ->
  ?data_start_time:timestamp ->
  ?ingested_data_size:data_size_in_bytes ->
  ?status_detail:bounded_length_string ->
  ?ingested_files_summary:ingested_files_summary ->
  ?data_quality_summary:data_quality_summary ->
  ?failed_reason:bounded_length_string ->
  ?status:ingestion_job_status ->
  ?created_at:timestamp ->
  ?role_arn:iam_role_arn ->
  ?ingestion_input_configuration:ingestion_input_configuration ->
  ?dataset_arn:dataset_arn ->
  ?job_id:ingestion_job_id ->
  unit ->
  describe_data_ingestion_job_response

val make_describe_data_ingestion_job_request :
  job_id:ingestion_job_id -> unit -> describe_data_ingestion_job_request

val make_delete_retraining_scheduler_request :
  model_name:model_name -> unit -> delete_retraining_scheduler_request

val make_delete_resource_policy_request :
  resource_arn:resource_arn -> unit -> delete_resource_policy_request

val make_delete_model_request : model_name:model_name -> unit -> delete_model_request

val make_delete_label_request :
  label_id:label_id -> label_group_name:label_group_name -> unit -> delete_label_request

val make_delete_label_group_request :
  label_group_name:label_group_name -> unit -> delete_label_group_request

val make_delete_inference_scheduler_request :
  inference_scheduler_name:inference_scheduler_identifier ->
  unit ->
  delete_inference_scheduler_request

val make_delete_dataset_request : dataset_name:dataset_identifier -> unit -> delete_dataset_request

val make_dataset_schema :
  ?inline_data_schema:synthesized_json_inline_data_schema -> unit -> dataset_schema

val make_create_retraining_scheduler_response :
  ?status:retraining_scheduler_status ->
  ?model_arn:model_arn ->
  ?model_name:model_name ->
  unit ->
  create_retraining_scheduler_response

val make_create_retraining_scheduler_request :
  ?promote_mode:model_promote_mode ->
  ?retraining_start_date:timestamp ->
  client_token:idempotence_token ->
  lookback_window:lookback_window ->
  retraining_frequency:retraining_frequency ->
  model_name:model_name ->
  unit ->
  create_retraining_scheduler_request

val make_create_model_response :
  ?status:model_status -> ?model_arn:model_arn -> unit -> create_model_response

val make_create_model_request :
  ?model_diagnostics_output_configuration:model_diagnostics_output_configuration ->
  ?off_condition:off_condition ->
  ?tags:tag_list ->
  ?server_side_kms_key_id:name_or_arn ->
  ?data_pre_processing_configuration:data_pre_processing_configuration ->
  ?role_arn:iam_role_arn ->
  ?evaluation_data_end_time:timestamp ->
  ?evaluation_data_start_time:timestamp ->
  ?training_data_end_time:timestamp ->
  ?training_data_start_time:timestamp ->
  ?labels_input_configuration:labels_input_configuration ->
  ?dataset_schema:dataset_schema ->
  client_token:idempotence_token ->
  dataset_name:dataset_identifier ->
  model_name:model_name ->
  unit ->
  create_model_request

val make_create_label_response : ?label_id:label_id -> unit -> create_label_response

val make_create_label_request :
  ?equipment:equipment ->
  ?notes:comments ->
  ?fault_code:fault_code ->
  client_token:idempotence_token ->
  rating:label_rating ->
  end_time:timestamp ->
  start_time:timestamp ->
  label_group_name:label_group_name ->
  unit ->
  create_label_request

val make_create_label_group_response :
  ?label_group_arn:label_group_arn ->
  ?label_group_name:label_group_name ->
  unit ->
  create_label_group_response

val make_create_label_group_request :
  ?tags:tag_list ->
  ?fault_codes:fault_codes ->
  client_token:idempotence_token ->
  label_group_name:label_group_name ->
  unit ->
  create_label_group_request

val make_create_inference_scheduler_response :
  ?model_quality:model_quality ->
  ?status:inference_scheduler_status ->
  ?inference_scheduler_name:inference_scheduler_name ->
  ?inference_scheduler_arn:inference_scheduler_arn ->
  unit ->
  create_inference_scheduler_response

val make_create_inference_scheduler_request :
  ?tags:tag_list ->
  ?server_side_kms_key_id:name_or_arn ->
  ?data_delay_offset_in_minutes:data_delay_offset_in_minutes ->
  client_token:idempotence_token ->
  role_arn:iam_role_arn ->
  data_output_configuration:inference_output_configuration ->
  data_input_configuration:inference_input_configuration ->
  data_upload_frequency:data_upload_frequency ->
  inference_scheduler_name:inference_scheduler_name ->
  model_name:model_name ->
  unit ->
  create_inference_scheduler_request

val make_create_dataset_response :
  ?status:dataset_status ->
  ?dataset_arn:dataset_arn ->
  ?dataset_name:dataset_name ->
  unit ->
  create_dataset_response

val make_create_dataset_request :
  ?tags:tag_list ->
  ?server_side_kms_key_id:name_or_arn ->
  ?dataset_schema:dataset_schema ->
  client_token:idempotence_token ->
  dataset_name:dataset_name ->
  unit ->
  create_dataset_request
(** {1:operations Operations} *)

module CreateDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_request ->
    ( create_dataset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_request ->
    ( create_dataset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a container for a collection of data being ingested for analysis. The dataset contains \
   the metadata describing where the data is and what the data actually looks like. For example, \
   it contains the location of the data source, the data schema, and other information. A dataset \
   also contains any tags associated with the ingested data. \n"]

module CreateInferenceScheduler : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_inference_scheduler_request ->
    ( create_inference_scheduler_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_inference_scheduler_request ->
    ( create_inference_scheduler_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Creates a scheduled inference. Scheduling an inference is setting up a continuous real-time \
   inference plan to analyze new measurement data. When setting up the schedule, you provide an S3 \
   bucket location for the input data, assign it a delimiter between separate entries in the data, \
   set an offset delay if desired, and set the frequency of inferencing. You must also provide an \
   S3 bucket location for the output data. \n"]

module CreateLabel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_label_request ->
    ( create_label_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_label_request ->
    ( create_label_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Creates a label for an event. \n"]

module CreateLabelGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_label_group_request ->
    ( create_label_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_label_group_request ->
    ( create_label_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Creates a group of labels. \n"]

module CreateModel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_model_request ->
    ( create_model_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_model_request ->
    ( create_model_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a machine learning model for data inference. \n\n\
  \ A machine-learning (ML) model is a mathematical model that finds patterns in your data. In \
   Amazon Lookout for Equipment, the model learns the patterns of normal behavior and detects \
   abnormal behavior that could be potential equipment failure (or maintenance events). The models \
   are made by analyzing normal data and abnormalities in machine behavior that have already \
   occurred.\n\
  \ \n\
  \  Your model is trained using a portion of the data from your dataset and uses that data to \
   learn patterns of normal behavior and abnormal patterns that lead to equipment failure. Another \
   portion of the data is used to evaluate the model's accuracy. \n\
  \  "]

module CreateRetrainingScheduler : sig
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
    create_retraining_scheduler_request ->
    ( create_retraining_scheduler_response,
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
    create_retraining_scheduler_request ->
    ( create_retraining_scheduler_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Creates a retraining scheduler on the specified model. \n"]

module DeleteDataset : sig
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
    delete_dataset_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    delete_dataset_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
  " Deletes a dataset and associated artifacts. The operation will check to see if any inference \
   scheduler or data ingestion job is currently using the dataset, and if there isn't, the \
   dataset, its metadata, and any associated data stored in S3 will be deleted. This does not \
   affect any models that used this dataset for training and evaluation, but does prevent it from \
   being used in the future. \n"]

module DeleteInferenceScheduler : sig
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
    delete_inference_scheduler_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    delete_inference_scheduler_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
  "Deletes an inference scheduler that has been set up. Prior inference results will not be deleted.\n"]

module DeleteLabel : sig
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
    delete_label_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    delete_label_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
[@@ocaml.doc " Deletes a label. \n"]

module DeleteLabelGroup : sig
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
    delete_label_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    delete_label_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
[@@ocaml.doc " Deletes a group of labels. \n"]

module DeleteModel : sig
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
    delete_model_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    delete_model_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
  "Deletes a machine learning model currently available for Amazon Lookout for Equipment. This \
   will prevent it from being used with an inference scheduler, even one that is already set up. \n"]

module DeleteResourcePolicy : sig
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
    delete_resource_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    delete_resource_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
[@@ocaml.doc "Deletes the resource policy attached to the resource.\n"]

module DeleteRetrainingScheduler : sig
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
    delete_retraining_scheduler_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    delete_retraining_scheduler_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
  "Deletes a retraining scheduler from a model. The retraining scheduler must be in the [STOPPED] \
   status. \n"]

module DescribeDataIngestionJob : sig
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
    describe_data_ingestion_job_request ->
    ( describe_data_ingestion_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_data_ingestion_job_request ->
    ( describe_data_ingestion_job_response Smaws_Lib.Response.t,
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
  "Provides information on a specific data ingestion job such as creation time, dataset ARN, and \
   status.\n"]

module DescribeDataset : sig
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
    describe_dataset_request ->
    ( describe_dataset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_request ->
    ( describe_dataset_response Smaws_Lib.Response.t,
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
  "Provides a JSON description of the data in each time series dataset, including names, column \
   names, and data types.\n"]

module DescribeInferenceScheduler : sig
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
    describe_inference_scheduler_request ->
    ( describe_inference_scheduler_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_inference_scheduler_request ->
    ( describe_inference_scheduler_response Smaws_Lib.Response.t,
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
  " Specifies information about the inference scheduler being used, including name, model, status, \
   and associated metadata \n"]

module DescribeLabel : sig
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
    describe_label_request ->
    ( describe_label_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_label_request ->
    ( describe_label_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Returns the name of the label. \n"]

module DescribeLabelGroup : sig
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
    describe_label_group_request ->
    ( describe_label_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_label_group_request ->
    ( describe_label_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Returns information about the label group. \n"]

module DescribeModel : sig
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
    describe_model_request ->
    ( describe_model_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_model_request ->
    ( describe_model_response Smaws_Lib.Response.t,
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
  "Provides a JSON containing the overall information about a specific machine learning model, \
   including model name and ARN, dataset, training and evaluation information, status, and so on. \n"]

module DescribeModelVersion : sig
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
    describe_model_version_request ->
    ( describe_model_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_model_version_request ->
    ( describe_model_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about a specific machine learning model version.\n"]

module DescribeResourcePolicy : sig
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
    describe_resource_policy_request ->
    ( describe_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_policy_request ->
    ( describe_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides the details of a resource policy attached to a resource.\n"]

module DescribeRetrainingScheduler : sig
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
    describe_retraining_scheduler_request ->
    ( describe_retraining_scheduler_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_retraining_scheduler_request ->
    ( describe_retraining_scheduler_response Smaws_Lib.Response.t,
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
  "Provides a description of the retraining scheduler, including information such as the model \
   name and retraining parameters. \n"]

module ImportDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_dataset_request ->
    ( import_dataset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_dataset_request ->
    ( import_dataset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Imports a dataset.\n"]

module ImportModelVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_model_version_request ->
    ( import_model_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_model_version_request ->
    ( import_model_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Imports a model that has been trained successfully.\n"]

module ListDataIngestionJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_ingestion_jobs_request ->
    ( list_data_ingestion_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_ingestion_jobs_request ->
    ( list_data_ingestion_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a list of all data ingestion jobs, including dataset name and ARN, S3 location of the \
   input data, status, and so on. \n"]

module ListDatasets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_datasets_request ->
    ( list_datasets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_datasets_request ->
    ( list_datasets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all datasets currently available in your account, filtering on the dataset name. \n"]

module ListInferenceEvents : sig
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
    list_inference_events_request ->
    ( list_inference_events_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_inference_events_request ->
    ( list_inference_events_response Smaws_Lib.Response.t,
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
  " Lists all inference events that have been found for the specified inference scheduler. \n"]

module ListInferenceExecutions : sig
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
    list_inference_executions_request ->
    ( list_inference_executions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_inference_executions_request ->
    ( list_inference_executions_response Smaws_Lib.Response.t,
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
  " Lists all inference executions that have been performed by the specified inference scheduler. \n"]

module ListInferenceSchedulers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_inference_schedulers_request ->
    ( list_inference_schedulers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_inference_schedulers_request ->
    ( list_inference_schedulers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of all inference schedulers currently available for your account. \n"]

module ListLabelGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_label_groups_request ->
    ( list_label_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_label_groups_request ->
    ( list_label_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Returns a list of the label groups. \n"]

module ListLabels : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_labels_request ->
    ( list_labels_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_labels_request ->
    ( list_labels_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Provides a list of labels. \n"]

module ListModelVersions : sig
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
    list_model_versions_request ->
    ( list_model_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_model_versions_request ->
    ( list_model_versions_response Smaws_Lib.Response.t,
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
  "Generates a list of all model versions for a given model, including the model version, model \
   version ARN, and status. To list a subset of versions, use the [MaxModelVersion] and \
   [MinModelVersion] fields.\n"]

module ListModels : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_models_request ->
    ( list_models_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_models_request ->
    ( list_models_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates a list of all models in the account, including model name and ARN, dataset, and \
   status. \n"]

module ListRetrainingSchedulers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_retraining_schedulers_request ->
    ( list_retraining_schedulers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_retraining_schedulers_request ->
    ( list_retraining_schedulers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all retraining schedulers in your account, filtering by model name prefix and status. \n"]

module ListSensorStatistics : sig
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
    list_sensor_statistics_request ->
    ( list_sensor_statistics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_sensor_statistics_request ->
    ( list_sensor_statistics_response Smaws_Lib.Response.t,
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
  " Lists statistics about the data collected for each of the sensors that have been successfully \
   ingested in the particular dataset. Can also be used to retreive Sensor Statistics for a \
   previous ingestion job. \n"]

module ListTagsForResource : sig
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
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all the tags for a specified resource, including key and value. \n"]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a resource control policy for a given resource.\n"]

module StartDataIngestionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_data_ingestion_job_request ->
    ( start_data_ingestion_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_data_ingestion_job_request ->
    ( start_data_ingestion_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a data ingestion job. Amazon Lookout for Equipment returns the job status. \n"]

module StartInferenceScheduler : sig
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
    start_inference_scheduler_request ->
    ( start_inference_scheduler_response,
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
    start_inference_scheduler_request ->
    ( start_inference_scheduler_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Starts an inference scheduler. \n"]

module StartRetrainingScheduler : sig
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
    start_retraining_scheduler_request ->
    ( start_retraining_scheduler_response,
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
    start_retraining_scheduler_request ->
    ( start_retraining_scheduler_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Starts a retraining scheduler. \n"]

module StopInferenceScheduler : sig
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
    stop_inference_scheduler_request ->
    ( stop_inference_scheduler_response,
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
    stop_inference_scheduler_request ->
    ( stop_inference_scheduler_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Stops an inference scheduler. \n"]

module StopRetrainingScheduler : sig
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
    stop_retraining_scheduler_request ->
    ( stop_retraining_scheduler_response,
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
    stop_retraining_scheduler_request ->
    ( stop_retraining_scheduler_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Stops a retraining scheduler. \n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a given tag to a resource in your account. A tag is a key-value pair which can be \
   added to an Amazon Lookout for Equipment resource as metadata. Tags can be used for organizing \
   your resources as well as helping you to search and filter by tag. Multiple tags can be added \
   to a resource, either when you create it, or later. Up to 50 tags can be associated with each \
   resource. \n"]

module UntagResource : sig
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
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a specific tag from a given resource. The tag is specified by its key. \n"]

module UpdateActiveModelVersion : sig
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
    update_active_model_version_request ->
    ( update_active_model_version_response,
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
    update_active_model_version_request ->
    ( update_active_model_version_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Sets the active model version for a given machine learning model.\n"]

module UpdateInferenceScheduler : sig
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
    update_inference_scheduler_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    update_inference_scheduler_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
[@@ocaml.doc "Updates an inference scheduler. \n"]

module UpdateLabelGroup : sig
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
    update_label_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    update_label_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
[@@ocaml.doc " Updates the label group. \n"]

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
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
[@@ocaml.doc "Updates a model in the account.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateRetrainingScheduler : sig
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
    update_retraining_scheduler_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    update_retraining_scheduler_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
[@@ocaml.doc "Updates a retraining scheduler. \n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
