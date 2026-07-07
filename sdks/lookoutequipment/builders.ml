open Types

let make_update_retraining_scheduler_request
    ?promote_mode:(promote_mode_ : model_promote_mode option)
    ?lookback_window:(lookback_window_ : lookback_window option)
    ?retraining_frequency:(retraining_frequency_ : retraining_frequency option)
    ?retraining_start_date:(retraining_start_date_ : timestamp option)
    ~model_name:(model_name_ : model_name) () =
  ({
     promote_mode = promote_mode_;
     lookback_window = lookback_window_;
     retraining_frequency = retraining_frequency_;
     retraining_start_date = retraining_start_date_;
     model_name = model_name_;
   }
    : update_retraining_scheduler_request)

let make_labels_s3_input_configuration ?prefix:(prefix_ : s3_prefix option)
    ~bucket:(bucket_ : s3_bucket) () =
  ({ prefix = prefix_; bucket = bucket_ } : labels_s3_input_configuration)

let make_labels_input_configuration ?label_group_name:(label_group_name_ : label_group_name option)
    ?s3_input_configuration:(s3_input_configuration_ : labels_s3_input_configuration option) () =
  ({ label_group_name = label_group_name_; s3_input_configuration = s3_input_configuration_ }
    : labels_input_configuration)

let make_model_diagnostics_s3_output_configuration ?prefix:(prefix_ : s3_prefix option)
    ~bucket:(bucket_ : s3_bucket) () =
  ({ prefix = prefix_; bucket = bucket_ } : model_diagnostics_s3_output_configuration)

let make_model_diagnostics_output_configuration ?kms_key_id:(kms_key_id_ : name_or_arn option)
    ~s3_output_configuration:(s3_output_configuration_ : model_diagnostics_s3_output_configuration)
    () =
  ({ kms_key_id = kms_key_id_; s3_output_configuration = s3_output_configuration_ }
    : model_diagnostics_output_configuration)

let make_update_model_request
    ?model_diagnostics_output_configuration:
      (model_diagnostics_output_configuration_ : model_diagnostics_output_configuration option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?labels_input_configuration:(labels_input_configuration_ : labels_input_configuration option)
    ~model_name:(model_name_ : model_name) () =
  ({
     model_diagnostics_output_configuration = model_diagnostics_output_configuration_;
     role_arn = role_arn_;
     labels_input_configuration = labels_input_configuration_;
     model_name = model_name_;
   }
    : update_model_request)

let make_update_label_group_request ?fault_codes:(fault_codes_ : fault_codes option)
    ~label_group_name:(label_group_name_ : label_group_name) () =
  ({ fault_codes = fault_codes_; label_group_name = label_group_name_ }
    : update_label_group_request)

let make_inference_s3_input_configuration ?prefix:(prefix_ : s3_prefix option)
    ~bucket:(bucket_ : s3_bucket) () =
  ({ prefix = prefix_; bucket = bucket_ } : inference_s3_input_configuration)

let make_inference_input_name_configuration
    ?component_timestamp_delimiter:
      (component_timestamp_delimiter_ : component_timestamp_delimiter option)
    ?timestamp_format:(timestamp_format_ : file_name_timestamp_format option) () =
  ({
     component_timestamp_delimiter = component_timestamp_delimiter_;
     timestamp_format = timestamp_format_;
   }
    : inference_input_name_configuration)

let make_inference_input_configuration
    ?inference_input_name_configuration:
      (inference_input_name_configuration_ : inference_input_name_configuration option)
    ?input_time_zone_offset:(input_time_zone_offset_ : time_zone_offset option)
    ?s3_input_configuration:(s3_input_configuration_ : inference_s3_input_configuration option) () =
  ({
     inference_input_name_configuration = inference_input_name_configuration_;
     input_time_zone_offset = input_time_zone_offset_;
     s3_input_configuration = s3_input_configuration_;
   }
    : inference_input_configuration)

let make_inference_s3_output_configuration ?prefix:(prefix_ : s3_prefix option)
    ~bucket:(bucket_ : s3_bucket) () =
  ({ prefix = prefix_; bucket = bucket_ } : inference_s3_output_configuration)

let make_inference_output_configuration ?kms_key_id:(kms_key_id_ : name_or_arn option)
    ~s3_output_configuration:(s3_output_configuration_ : inference_s3_output_configuration) () =
  ({ kms_key_id = kms_key_id_; s3_output_configuration = s3_output_configuration_ }
    : inference_output_configuration)

let make_update_inference_scheduler_request ?role_arn:(role_arn_ : iam_role_arn option)
    ?data_output_configuration:(data_output_configuration_ : inference_output_configuration option)
    ?data_input_configuration:(data_input_configuration_ : inference_input_configuration option)
    ?data_upload_frequency:(data_upload_frequency_ : data_upload_frequency option)
    ?data_delay_offset_in_minutes:
      (data_delay_offset_in_minutes_ : data_delay_offset_in_minutes option)
    ~inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_identifier) () =
  ({
     role_arn = role_arn_;
     data_output_configuration = data_output_configuration_;
     data_input_configuration = data_input_configuration_;
     data_upload_frequency = data_upload_frequency_;
     data_delay_offset_in_minutes = data_delay_offset_in_minutes_;
     inference_scheduler_name = inference_scheduler_name_;
   }
    : update_inference_scheduler_request)

let make_update_active_model_version_response
    ?previous_active_version_arn:(previous_active_version_arn_ : model_version_arn option)
    ?current_active_version_arn:(current_active_version_arn_ : model_version_arn option)
    ?previous_active_version:(previous_active_version_ : model_version option)
    ?current_active_version:(current_active_version_ : model_version option)
    ?model_arn:(model_arn_ : model_arn option) ?model_name:(model_name_ : model_name option) () =
  ({
     previous_active_version_arn = previous_active_version_arn_;
     current_active_version_arn = current_active_version_arn_;
     previous_active_version = previous_active_version_;
     current_active_version = current_active_version_;
     model_arn = model_arn_;
     model_name = model_name_;
   }
    : update_active_model_version_response)

let make_update_active_model_version_request ~model_version:(model_version_ : model_version)
    ~model_name:(model_name_ : model_name) () =
  ({ model_version = model_version_; model_name = model_name_ }
    : update_active_model_version_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : amazon_resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_unsupported_timestamps
    ~total_number_of_unsupported_timestamps:(total_number_of_unsupported_timestamps_ : integer) () =
  ({ total_number_of_unsupported_timestamps = total_number_of_unsupported_timestamps_ }
    : unsupported_timestamps)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_arn:(resource_arn_ : amazon_resource_arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_stop_retraining_scheduler_response ?status:(status_ : retraining_scheduler_status option)
    ?model_arn:(model_arn_ : model_arn option) ?model_name:(model_name_ : model_name option) () =
  ({ status = status_; model_arn = model_arn_; model_name = model_name_ }
    : stop_retraining_scheduler_response)

let make_stop_retraining_scheduler_request ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : stop_retraining_scheduler_request)

let make_stop_inference_scheduler_response ?status:(status_ : inference_scheduler_status option)
    ?inference_scheduler_arn:(inference_scheduler_arn_ : inference_scheduler_arn option)
    ?inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_name option)
    ?model_name:(model_name_ : model_name option) ?model_arn:(model_arn_ : model_arn option) () =
  ({
     status = status_;
     inference_scheduler_arn = inference_scheduler_arn_;
     inference_scheduler_name = inference_scheduler_name_;
     model_name = model_name_;
     model_arn = model_arn_;
   }
    : stop_inference_scheduler_response)

let make_stop_inference_scheduler_request
    ~inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_identifier) () =
  ({ inference_scheduler_name = inference_scheduler_name_ } : stop_inference_scheduler_request)

let make_start_retraining_scheduler_response ?status:(status_ : retraining_scheduler_status option)
    ?model_arn:(model_arn_ : model_arn option) ?model_name:(model_name_ : model_name option) () =
  ({ status = status_; model_arn = model_arn_; model_name = model_name_ }
    : start_retraining_scheduler_response)

let make_start_retraining_scheduler_request ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : start_retraining_scheduler_request)

let make_start_inference_scheduler_response ?status:(status_ : inference_scheduler_status option)
    ?inference_scheduler_arn:(inference_scheduler_arn_ : inference_scheduler_arn option)
    ?inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_name option)
    ?model_name:(model_name_ : model_name option) ?model_arn:(model_arn_ : model_arn option) () =
  ({
     status = status_;
     inference_scheduler_arn = inference_scheduler_arn_;
     inference_scheduler_name = inference_scheduler_name_;
     model_name = model_name_;
     model_arn = model_arn_;
   }
    : start_inference_scheduler_response)

let make_start_inference_scheduler_request
    ~inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_identifier) () =
  ({ inference_scheduler_name = inference_scheduler_name_ } : start_inference_scheduler_request)

let make_start_data_ingestion_job_response ?status:(status_ : ingestion_job_status option)
    ?job_id:(job_id_ : ingestion_job_id option) () =
  ({ status = status_; job_id = job_id_ } : start_data_ingestion_job_response)

let make_ingestion_s3_input_configuration ?key_pattern:(key_pattern_ : key_pattern option)
    ?prefix:(prefix_ : s3_prefix option) ~bucket:(bucket_ : s3_bucket) () =
  ({ key_pattern = key_pattern_; prefix = prefix_; bucket = bucket_ }
    : ingestion_s3_input_configuration)

let make_ingestion_input_configuration
    ~s3_input_configuration:(s3_input_configuration_ : ingestion_s3_input_configuration) () =
  ({ s3_input_configuration = s3_input_configuration_ } : ingestion_input_configuration)

let make_start_data_ingestion_job_request ~client_token:(client_token_ : idempotence_token)
    ~role_arn:(role_arn_ : iam_role_arn)
    ~ingestion_input_configuration:(ingestion_input_configuration_ : ingestion_input_configuration)
    ~dataset_name:(dataset_name_ : dataset_identifier) () =
  ({
     client_token = client_token_;
     role_arn = role_arn_;
     ingestion_input_configuration = ingestion_input_configuration_;
     dataset_name = dataset_name_;
   }
    : start_data_ingestion_job_request)

let make_sensors_with_short_date_range ~affected_sensor_count:(affected_sensor_count_ : integer) ()
    =
  ({ affected_sensor_count = affected_sensor_count_ } : sensors_with_short_date_range)

let make_count_percent ~percentage:(percentage_ : float_) ~count:(count_ : integer) () =
  ({ percentage = percentage_; count = count_ } : count_percent)

let make_categorical_values ?number_of_category:(number_of_category_ : integer option)
    ~status:(status_ : statistical_issue_status) () =
  ({ number_of_category = number_of_category_; status = status_ } : categorical_values)

let make_multiple_operating_modes ~status:(status_ : statistical_issue_status) () =
  ({ status = status_ } : multiple_operating_modes)

let make_large_timestamp_gaps
    ?max_timestamp_gap_in_days:(max_timestamp_gap_in_days_ : integer option)
    ?number_of_large_timestamp_gaps:(number_of_large_timestamp_gaps_ : integer option)
    ~status:(status_ : statistical_issue_status) () =
  ({
     max_timestamp_gap_in_days = max_timestamp_gap_in_days_;
     number_of_large_timestamp_gaps = number_of_large_timestamp_gaps_;
     status = status_;
   }
    : large_timestamp_gaps)

let make_monotonic_values ?monotonicity:(monotonicity_ : monotonicity option)
    ~status:(status_ : statistical_issue_status) () =
  ({ monotonicity = monotonicity_; status = status_ } : monotonic_values)

let make_sensor_statistics_summary ?data_end_time:(data_end_time_ : timestamp option)
    ?data_start_time:(data_start_time_ : timestamp option)
    ?monotonic_values:(monotonic_values_ : monotonic_values option)
    ?large_timestamp_gaps:(large_timestamp_gaps_ : large_timestamp_gaps option)
    ?multiple_operating_modes:(multiple_operating_modes_ : multiple_operating_modes option)
    ?categorical_values:(categorical_values_ : categorical_values option)
    ?duplicate_timestamps:(duplicate_timestamps_ : count_percent option)
    ?invalid_date_entries:(invalid_date_entries_ : count_percent option)
    ?invalid_values:(invalid_values_ : count_percent option)
    ?missing_values:(missing_values_ : count_percent option)
    ?data_exists:(data_exists_ : boolean_ option) ?sensor_name:(sensor_name_ : sensor_name option)
    ?component_name:(component_name_ : component_name option) () =
  ({
     data_end_time = data_end_time_;
     data_start_time = data_start_time_;
     monotonic_values = monotonic_values_;
     large_timestamp_gaps = large_timestamp_gaps_;
     multiple_operating_modes = multiple_operating_modes_;
     categorical_values = categorical_values_;
     duplicate_timestamps = duplicate_timestamps_;
     invalid_date_entries = invalid_date_entries_;
     invalid_values = invalid_values_;
     missing_values = missing_values_;
     data_exists = data_exists_;
     sensor_name = sensor_name_;
     component_name = component_name_;
   }
    : sensor_statistics_summary)

let make_s3_object ~key:(key_ : s3_key) ~bucket:(bucket_ : s3_bucket) () =
  ({ key = key_; bucket = bucket_ } : s3_object)

let make_retraining_scheduler_summary ?lookback_window:(lookback_window_ : lookback_window option)
    ?retraining_frequency:(retraining_frequency_ : retraining_frequency option)
    ?retraining_start_date:(retraining_start_date_ : timestamp option)
    ?status:(status_ : retraining_scheduler_status option)
    ?model_arn:(model_arn_ : model_arn option) ?model_name:(model_name_ : model_name option) () =
  ({
     lookback_window = lookback_window_;
     retraining_frequency = retraining_frequency_;
     retraining_start_date = retraining_start_date_;
     status = status_;
     model_arn = model_arn_;
     model_name = model_name_;
   }
    : retraining_scheduler_summary)

let make_put_resource_policy_response
    ?policy_revision_id:(policy_revision_id_ : policy_revision_id option)
    ?resource_arn:(resource_arn_ : resource_arn option) () =
  ({ policy_revision_id = policy_revision_id_; resource_arn = resource_arn_ }
    : put_resource_policy_response)

let make_put_resource_policy_request
    ?policy_revision_id:(policy_revision_id_ : policy_revision_id option)
    ~client_token:(client_token_ : idempotence_token) ~resource_policy:(resource_policy_ : policy)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({
     client_token = client_token_;
     policy_revision_id = policy_revision_id_;
     resource_policy = resource_policy_;
     resource_arn = resource_arn_;
   }
    : put_resource_policy_request)

let make_model_version_summary ?model_quality:(model_quality_ : model_quality option)
    ?source_type:(source_type_ : model_version_source_type option)
    ?status:(status_ : model_version_status option) ?created_at:(created_at_ : timestamp option)
    ?model_version_arn:(model_version_arn_ : model_version_arn option)
    ?model_version:(model_version_ : model_version option)
    ?model_arn:(model_arn_ : model_arn option) ?model_name:(model_name_ : model_name option) () =
  ({
     model_quality = model_quality_;
     source_type = source_type_;
     status = status_;
     created_at = created_at_;
     model_version_arn = model_version_arn_;
     model_version = model_version_;
     model_arn = model_arn_;
     model_name = model_name_;
   }
    : model_version_summary)

let make_model_summary ?model_quality:(model_quality_ : model_quality option)
    ?model_diagnostics_output_configuration:
      (model_diagnostics_output_configuration_ : model_diagnostics_output_configuration option)
    ?retraining_scheduler_status:(retraining_scheduler_status_ : retraining_scheduler_status option)
    ?next_scheduled_retraining_start_date:(next_scheduled_retraining_start_date_ : timestamp option)
    ?latest_scheduled_retraining_start_time:
      (latest_scheduled_retraining_start_time_ : timestamp option)
    ?latest_scheduled_retraining_model_version:
      (latest_scheduled_retraining_model_version_ : model_version option)
    ?latest_scheduled_retraining_status:
      (latest_scheduled_retraining_status_ : model_version_status option)
    ?active_model_version_arn:(active_model_version_arn_ : model_version_arn option)
    ?active_model_version:(active_model_version_ : model_version option)
    ?created_at:(created_at_ : timestamp option) ?status:(status_ : model_status option)
    ?dataset_arn:(dataset_arn_ : dataset_arn option)
    ?dataset_name:(dataset_name_ : dataset_name option) ?model_arn:(model_arn_ : model_arn option)
    ?model_name:(model_name_ : model_name option) () =
  ({
     model_quality = model_quality_;
     model_diagnostics_output_configuration = model_diagnostics_output_configuration_;
     retraining_scheduler_status = retraining_scheduler_status_;
     next_scheduled_retraining_start_date = next_scheduled_retraining_start_date_;
     latest_scheduled_retraining_start_time = latest_scheduled_retraining_start_time_;
     latest_scheduled_retraining_model_version = latest_scheduled_retraining_model_version_;
     latest_scheduled_retraining_status = latest_scheduled_retraining_status_;
     active_model_version_arn = active_model_version_arn_;
     active_model_version = active_model_version_;
     created_at = created_at_;
     status = status_;
     dataset_arn = dataset_arn_;
     dataset_name = dataset_name_;
     model_arn = model_arn_;
     model_name = model_name_;
   }
    : model_summary)

let make_missing_sensor_data
    ~total_number_of_missing_values:(total_number_of_missing_values_ : integer)
    ~affected_sensor_count:(affected_sensor_count_ : integer) () =
  ({
     total_number_of_missing_values = total_number_of_missing_values_;
     affected_sensor_count = affected_sensor_count_;
   }
    : missing_sensor_data)

let make_missing_complete_sensor_data ~affected_sensor_count:(affected_sensor_count_ : integer) () =
  ({ affected_sensor_count = affected_sensor_count_ } : missing_complete_sensor_data)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : amazon_resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_sensor_statistics_response ?next_token:(next_token_ : next_token option)
    ?sensor_statistics_summaries:(sensor_statistics_summaries_ : sensor_statistics_summaries option)
    () =
  ({ next_token = next_token_; sensor_statistics_summaries = sensor_statistics_summaries_ }
    : list_sensor_statistics_response)

let make_list_sensor_statistics_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?ingestion_job_id:(ingestion_job_id_ : ingestion_job_id option)
    ~dataset_name:(dataset_name_ : dataset_name) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     ingestion_job_id = ingestion_job_id_;
     dataset_name = dataset_name_;
   }
    : list_sensor_statistics_request)

let make_list_retraining_schedulers_response ?next_token:(next_token_ : next_token option)
    ?retraining_scheduler_summaries:
      (retraining_scheduler_summaries_ : retraining_scheduler_summaries option) () =
  ({ next_token = next_token_; retraining_scheduler_summaries = retraining_scheduler_summaries_ }
    : list_retraining_schedulers_response)

let make_list_retraining_schedulers_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?status:(status_ : retraining_scheduler_status option)
    ?model_name_begins_with:(model_name_begins_with_ : model_name option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     status = status_;
     model_name_begins_with = model_name_begins_with_;
   }
    : list_retraining_schedulers_request)

let make_list_models_response ?model_summaries:(model_summaries_ : model_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ model_summaries = model_summaries_; next_token = next_token_ } : list_models_response)

let make_list_models_request
    ?dataset_name_begins_with:(dataset_name_begins_with_ : dataset_name option)
    ?model_name_begins_with:(model_name_begins_with_ : model_name option)
    ?status:(status_ : model_status option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     dataset_name_begins_with = dataset_name_begins_with_;
     model_name_begins_with = model_name_begins_with_;
     status = status_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_models_request)

let make_list_model_versions_response
    ?model_version_summaries:(model_version_summaries_ : model_version_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ model_version_summaries = model_version_summaries_; next_token = next_token_ }
    : list_model_versions_response)

let make_list_model_versions_request ?min_model_version:(min_model_version_ : model_version option)
    ?max_model_version:(max_model_version_ : model_version option)
    ?created_at_start_time:(created_at_start_time_ : timestamp option)
    ?created_at_end_time:(created_at_end_time_ : timestamp option)
    ?source_type:(source_type_ : model_version_source_type option)
    ?status:(status_ : model_version_status option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~model_name:(model_name_ : model_name) () =
  ({
     min_model_version = min_model_version_;
     max_model_version = max_model_version_;
     created_at_start_time = created_at_start_time_;
     created_at_end_time = created_at_end_time_;
     source_type = source_type_;
     status = status_;
     max_results = max_results_;
     next_token = next_token_;
     model_name = model_name_;
   }
    : list_model_versions_request)

let make_label_summary ?created_at:(created_at_ : timestamp option)
    ?equipment:(equipment_ : equipment option) ?fault_code:(fault_code_ : fault_code option)
    ?rating:(rating_ : label_rating option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option)
    ?label_group_arn:(label_group_arn_ : label_group_arn option)
    ?label_id:(label_id_ : label_id option)
    ?label_group_name:(label_group_name_ : label_group_name option) () =
  ({
     created_at = created_at_;
     equipment = equipment_;
     fault_code = fault_code_;
     rating = rating_;
     end_time = end_time_;
     start_time = start_time_;
     label_group_arn = label_group_arn_;
     label_id = label_id_;
     label_group_name = label_group_name_;
   }
    : label_summary)

let make_list_labels_response ?label_summaries:(label_summaries_ : label_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ label_summaries = label_summaries_; next_token = next_token_ } : list_labels_response)

let make_list_labels_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?equipment:(equipment_ : equipment option)
    ?fault_code:(fault_code_ : fault_code option)
    ?interval_end_time:(interval_end_time_ : timestamp option)
    ?interval_start_time:(interval_start_time_ : timestamp option)
    ~label_group_name:(label_group_name_ : label_group_name) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     equipment = equipment_;
     fault_code = fault_code_;
     interval_end_time = interval_end_time_;
     interval_start_time = interval_start_time_;
     label_group_name = label_group_name_;
   }
    : list_labels_request)

let make_label_group_summary ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?label_group_arn:(label_group_arn_ : label_group_arn option)
    ?label_group_name:(label_group_name_ : label_group_name option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     label_group_arn = label_group_arn_;
     label_group_name = label_group_name_;
   }
    : label_group_summary)

let make_list_label_groups_response
    ?label_group_summaries:(label_group_summaries_ : label_group_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ label_group_summaries = label_group_summaries_; next_token = next_token_ }
    : list_label_groups_response)

let make_list_label_groups_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?label_group_name_begins_with:(label_group_name_begins_with_ : label_group_name option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     label_group_name_begins_with = label_group_name_begins_with_;
   }
    : list_label_groups_request)

let make_inference_scheduler_summary
    ?latest_inference_result:(latest_inference_result_ : latest_inference_result option)
    ?data_upload_frequency:(data_upload_frequency_ : data_upload_frequency option)
    ?data_delay_offset_in_minutes:
      (data_delay_offset_in_minutes_ : data_delay_offset_in_minutes option)
    ?status:(status_ : inference_scheduler_status option)
    ?inference_scheduler_arn:(inference_scheduler_arn_ : inference_scheduler_arn option)
    ?inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_name option)
    ?model_arn:(model_arn_ : model_arn option) ?model_name:(model_name_ : model_name option) () =
  ({
     latest_inference_result = latest_inference_result_;
     data_upload_frequency = data_upload_frequency_;
     data_delay_offset_in_minutes = data_delay_offset_in_minutes_;
     status = status_;
     inference_scheduler_arn = inference_scheduler_arn_;
     inference_scheduler_name = inference_scheduler_name_;
     model_arn = model_arn_;
     model_name = model_name_;
   }
    : inference_scheduler_summary)

let make_list_inference_schedulers_response
    ?inference_scheduler_summaries:
      (inference_scheduler_summaries_ : inference_scheduler_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ inference_scheduler_summaries = inference_scheduler_summaries_; next_token = next_token_ }
    : list_inference_schedulers_response)

let make_list_inference_schedulers_request ?status:(status_ : inference_scheduler_status option)
    ?model_name:(model_name_ : model_name option)
    ?inference_scheduler_name_begins_with:
      (inference_scheduler_name_begins_with_ : inference_scheduler_identifier option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     status = status_;
     model_name = model_name_;
     inference_scheduler_name_begins_with = inference_scheduler_name_begins_with_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_inference_schedulers_request)

let make_inference_execution_summary
    ?model_version_arn:(model_version_arn_ : model_version_arn option)
    ?model_version:(model_version_ : model_version option)
    ?failed_reason:(failed_reason_ : bounded_length_string option)
    ?status:(status_ : inference_execution_status option)
    ?customer_result_object:(customer_result_object_ : s3_object option)
    ?data_output_configuration:(data_output_configuration_ : inference_output_configuration option)
    ?data_input_configuration:(data_input_configuration_ : inference_input_configuration option)
    ?data_end_time:(data_end_time_ : timestamp option)
    ?data_start_time:(data_start_time_ : timestamp option)
    ?scheduled_start_time:(scheduled_start_time_ : timestamp option)
    ?inference_scheduler_arn:(inference_scheduler_arn_ : inference_scheduler_arn option)
    ?inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_name option)
    ?model_arn:(model_arn_ : model_arn option) ?model_name:(model_name_ : model_name option) () =
  ({
     model_version_arn = model_version_arn_;
     model_version = model_version_;
     failed_reason = failed_reason_;
     status = status_;
     customer_result_object = customer_result_object_;
     data_output_configuration = data_output_configuration_;
     data_input_configuration = data_input_configuration_;
     data_end_time = data_end_time_;
     data_start_time = data_start_time_;
     scheduled_start_time = scheduled_start_time_;
     inference_scheduler_arn = inference_scheduler_arn_;
     inference_scheduler_name = inference_scheduler_name_;
     model_arn = model_arn_;
     model_name = model_name_;
   }
    : inference_execution_summary)

let make_list_inference_executions_response
    ?inference_execution_summaries:
      (inference_execution_summaries_ : inference_execution_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ inference_execution_summaries = inference_execution_summaries_; next_token = next_token_ }
    : list_inference_executions_response)

let make_list_inference_executions_request ?status:(status_ : inference_execution_status option)
    ?data_end_time_before:(data_end_time_before_ : timestamp option)
    ?data_start_time_after:(data_start_time_after_ : timestamp option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_identifier) () =
  ({
     status = status_;
     data_end_time_before = data_end_time_before_;
     data_start_time_after = data_start_time_after_;
     inference_scheduler_name = inference_scheduler_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_inference_executions_request)

let make_inference_event_summary
    ?event_duration_in_seconds:(event_duration_in_seconds_ : event_duration_in_seconds option)
    ?diagnostics:(diagnostics_ : model_metrics option)
    ?event_end_time:(event_end_time_ : timestamp option)
    ?event_start_time:(event_start_time_ : timestamp option)
    ?inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_name option)
    ?inference_scheduler_arn:(inference_scheduler_arn_ : inference_scheduler_arn option) () =
  ({
     event_duration_in_seconds = event_duration_in_seconds_;
     diagnostics = diagnostics_;
     event_end_time = event_end_time_;
     event_start_time = event_start_time_;
     inference_scheduler_name = inference_scheduler_name_;
     inference_scheduler_arn = inference_scheduler_arn_;
   }
    : inference_event_summary)

let make_list_inference_events_response
    ?inference_event_summaries:(inference_event_summaries_ : inference_event_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ inference_event_summaries = inference_event_summaries_; next_token = next_token_ }
    : list_inference_events_response)

let make_list_inference_events_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~interval_end_time:(interval_end_time_ : timestamp)
    ~interval_start_time:(interval_start_time_ : timestamp)
    ~inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_identifier) () =
  ({
     interval_end_time = interval_end_time_;
     interval_start_time = interval_start_time_;
     inference_scheduler_name = inference_scheduler_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_inference_events_request)

let make_dataset_summary ?created_at:(created_at_ : timestamp option)
    ?status:(status_ : dataset_status option) ?dataset_arn:(dataset_arn_ : dataset_arn option)
    ?dataset_name:(dataset_name_ : dataset_name option) () =
  ({
     created_at = created_at_;
     status = status_;
     dataset_arn = dataset_arn_;
     dataset_name = dataset_name_;
   }
    : dataset_summary)

let make_list_datasets_response ?dataset_summaries:(dataset_summaries_ : dataset_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ dataset_summaries = dataset_summaries_; next_token = next_token_ } : list_datasets_response)

let make_list_datasets_request
    ?dataset_name_begins_with:(dataset_name_begins_with_ : dataset_name option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     dataset_name_begins_with = dataset_name_begins_with_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_datasets_request)

let make_data_ingestion_job_summary ?status:(status_ : ingestion_job_status option)
    ?ingestion_input_configuration:
      (ingestion_input_configuration_ : ingestion_input_configuration option)
    ?dataset_arn:(dataset_arn_ : dataset_arn option)
    ?dataset_name:(dataset_name_ : dataset_name option) ?job_id:(job_id_ : ingestion_job_id option)
    () =
  ({
     status = status_;
     ingestion_input_configuration = ingestion_input_configuration_;
     dataset_arn = dataset_arn_;
     dataset_name = dataset_name_;
     job_id = job_id_;
   }
    : data_ingestion_job_summary)

let make_list_data_ingestion_jobs_response
    ?data_ingestion_job_summaries:
      (data_ingestion_job_summaries_ : data_ingestion_job_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ data_ingestion_job_summaries = data_ingestion_job_summaries_; next_token = next_token_ }
    : list_data_ingestion_jobs_response)

let make_list_data_ingestion_jobs_request ?status:(status_ : ingestion_job_status option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?dataset_name:(dataset_name_ : dataset_name option) () =
  ({
     status = status_;
     max_results = max_results_;
     next_token = next_token_;
     dataset_name = dataset_name_;
   }
    : list_data_ingestion_jobs_request)

let make_invalid_sensor_data
    ~total_number_of_invalid_values:(total_number_of_invalid_values_ : integer)
    ~affected_sensor_count:(affected_sensor_count_ : integer) () =
  ({
     total_number_of_invalid_values = total_number_of_invalid_values_;
     affected_sensor_count = affected_sensor_count_;
   }
    : invalid_sensor_data)

let make_insufficient_sensor_data
    ~sensors_with_short_date_range:(sensors_with_short_date_range_ : sensors_with_short_date_range)
    ~missing_complete_sensor_data:(missing_complete_sensor_data_ : missing_complete_sensor_data) ()
    =
  ({
     sensors_with_short_date_range = sensors_with_short_date_range_;
     missing_complete_sensor_data = missing_complete_sensor_data_;
   }
    : insufficient_sensor_data)

let make_ingested_files_summary ?discarded_files:(discarded_files_ : list_of_discarded_files option)
    ~ingested_number_of_files:(ingested_number_of_files_ : integer)
    ~total_number_of_files:(total_number_of_files_ : integer) () =
  ({
     discarded_files = discarded_files_;
     ingested_number_of_files = ingested_number_of_files_;
     total_number_of_files = total_number_of_files_;
   }
    : ingested_files_summary)

let make_import_model_version_response ?status:(status_ : model_version_status option)
    ?model_version:(model_version_ : model_version option)
    ?model_version_arn:(model_version_arn_ : model_version_arn option)
    ?model_arn:(model_arn_ : model_arn option) ?model_name:(model_name_ : model_name option) () =
  ({
     status = status_;
     model_version = model_version_;
     model_version_arn = model_version_arn_;
     model_arn = model_arn_;
     model_name = model_name_;
   }
    : import_model_version_response)

let make_import_model_version_request
    ?inference_data_import_strategy:
      (inference_data_import_strategy_ : inference_data_import_strategy option)
    ?tags:(tags_ : tag_list option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : name_or_arn option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?labels_input_configuration:(labels_input_configuration_ : labels_input_configuration option)
    ?model_name:(model_name_ : model_name option) ~client_token:(client_token_ : idempotence_token)
    ~dataset_name:(dataset_name_ : dataset_identifier)
    ~source_model_version_arn:(source_model_version_arn_ : model_version_arn) () =
  ({
     inference_data_import_strategy = inference_data_import_strategy_;
     tags = tags_;
     server_side_kms_key_id = server_side_kms_key_id_;
     role_arn = role_arn_;
     client_token = client_token_;
     labels_input_configuration = labels_input_configuration_;
     dataset_name = dataset_name_;
     model_name = model_name_;
     source_model_version_arn = source_model_version_arn_;
   }
    : import_model_version_request)

let make_import_dataset_response ?job_id:(job_id_ : ingestion_job_id option)
    ?status:(status_ : dataset_status option) ?dataset_arn:(dataset_arn_ : dataset_arn option)
    ?dataset_name:(dataset_name_ : dataset_name option) () =
  ({ job_id = job_id_; status = status_; dataset_arn = dataset_arn_; dataset_name = dataset_name_ }
    : import_dataset_response)

let make_import_dataset_request ?tags:(tags_ : tag_list option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : name_or_arn option)
    ?dataset_name:(dataset_name_ : dataset_name option)
    ~client_token:(client_token_ : idempotence_token)
    ~source_dataset_arn:(source_dataset_arn_ : dataset_arn) () =
  ({
     tags = tags_;
     server_side_kms_key_id = server_side_kms_key_id_;
     client_token = client_token_;
     dataset_name = dataset_name_;
     source_dataset_arn = source_dataset_arn_;
   }
    : import_dataset_request)

let make_duplicate_timestamps
    ~total_number_of_duplicate_timestamps:(total_number_of_duplicate_timestamps_ : integer) () =
  ({ total_number_of_duplicate_timestamps = total_number_of_duplicate_timestamps_ }
    : duplicate_timestamps)

let make_describe_retraining_scheduler_response ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?promote_mode:(promote_mode_ : model_promote_mode option)
    ?status:(status_ : retraining_scheduler_status option)
    ?lookback_window:(lookback_window_ : lookback_window option)
    ?retraining_frequency:(retraining_frequency_ : retraining_frequency option)
    ?retraining_start_date:(retraining_start_date_ : timestamp option)
    ?model_arn:(model_arn_ : model_arn option) ?model_name:(model_name_ : model_name option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     promote_mode = promote_mode_;
     status = status_;
     lookback_window = lookback_window_;
     retraining_frequency = retraining_frequency_;
     retraining_start_date = retraining_start_date_;
     model_arn = model_arn_;
     model_name = model_name_;
   }
    : describe_retraining_scheduler_response)

let make_describe_retraining_scheduler_request ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : describe_retraining_scheduler_request)

let make_describe_resource_policy_response
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?resource_policy:(resource_policy_ : policy option)
    ?policy_revision_id:(policy_revision_id_ : policy_revision_id option) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     resource_policy = resource_policy_;
     policy_revision_id = policy_revision_id_;
   }
    : describe_resource_policy_response)

let make_describe_resource_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : describe_resource_policy_request)

let make_data_pre_processing_configuration
    ?target_sampling_rate:(target_sampling_rate_ : target_sampling_rate option) () =
  ({ target_sampling_rate = target_sampling_rate_ } : data_pre_processing_configuration)

let make_describe_model_version_response ?model_quality:(model_quality_ : model_quality option)
    ?model_diagnostics_results_object:(model_diagnostics_results_object_ : s3_object option)
    ?model_diagnostics_output_configuration:
      (model_diagnostics_output_configuration_ : model_diagnostics_output_configuration option)
    ?auto_promotion_result_reason:
      (auto_promotion_result_reason_ : auto_promotion_result_reason option)
    ?auto_promotion_result:(auto_promotion_result_ : auto_promotion_result option)
    ?retraining_available_data_in_days:(retraining_available_data_in_days_ : integer option)
    ?prior_model_metrics:(prior_model_metrics_ : model_metrics option)
    ?imported_data_size_in_bytes:(imported_data_size_in_bytes_ : data_size_in_bytes option)
    ?import_job_end_time:(import_job_end_time_ : timestamp option)
    ?import_job_start_time:(import_job_start_time_ : timestamp option)
    ?source_model_version_arn:(source_model_version_arn_ : model_version_arn option)
    ?off_condition:(off_condition_ : off_condition option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : kms_key_arn option)
    ?created_at:(created_at_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?model_metrics:(model_metrics_ : model_metrics option)
    ?failed_reason:(failed_reason_ : bounded_length_string option)
    ?training_execution_end_time:(training_execution_end_time_ : timestamp option)
    ?training_execution_start_time:(training_execution_start_time_ : timestamp option)
    ?data_pre_processing_configuration:
      (data_pre_processing_configuration_ : data_pre_processing_configuration option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?evaluation_data_end_time:(evaluation_data_end_time_ : timestamp option)
    ?evaluation_data_start_time:(evaluation_data_start_time_ : timestamp option)
    ?training_data_end_time:(training_data_end_time_ : timestamp option)
    ?training_data_start_time:(training_data_start_time_ : timestamp option)
    ?labels_input_configuration:(labels_input_configuration_ : labels_input_configuration option)
    ?schema:(schema_ : inline_data_schema option) ?dataset_arn:(dataset_arn_ : dataset_arn option)
    ?dataset_name:(dataset_name_ : dataset_name option)
    ?source_type:(source_type_ : model_version_source_type option)
    ?status:(status_ : model_version_status option)
    ?model_version_arn:(model_version_arn_ : model_version_arn option)
    ?model_version:(model_version_ : model_version option)
    ?model_arn:(model_arn_ : model_arn option) ?model_name:(model_name_ : model_name option) () =
  ({
     model_quality = model_quality_;
     model_diagnostics_results_object = model_diagnostics_results_object_;
     model_diagnostics_output_configuration = model_diagnostics_output_configuration_;
     auto_promotion_result_reason = auto_promotion_result_reason_;
     auto_promotion_result = auto_promotion_result_;
     retraining_available_data_in_days = retraining_available_data_in_days_;
     prior_model_metrics = prior_model_metrics_;
     imported_data_size_in_bytes = imported_data_size_in_bytes_;
     import_job_end_time = import_job_end_time_;
     import_job_start_time = import_job_start_time_;
     source_model_version_arn = source_model_version_arn_;
     off_condition = off_condition_;
     server_side_kms_key_id = server_side_kms_key_id_;
     created_at = created_at_;
     last_updated_time = last_updated_time_;
     model_metrics = model_metrics_;
     failed_reason = failed_reason_;
     training_execution_end_time = training_execution_end_time_;
     training_execution_start_time = training_execution_start_time_;
     data_pre_processing_configuration = data_pre_processing_configuration_;
     role_arn = role_arn_;
     evaluation_data_end_time = evaluation_data_end_time_;
     evaluation_data_start_time = evaluation_data_start_time_;
     training_data_end_time = training_data_end_time_;
     training_data_start_time = training_data_start_time_;
     labels_input_configuration = labels_input_configuration_;
     schema = schema_;
     dataset_arn = dataset_arn_;
     dataset_name = dataset_name_;
     source_type = source_type_;
     status = status_;
     model_version_arn = model_version_arn_;
     model_version = model_version_;
     model_arn = model_arn_;
     model_name = model_name_;
   }
    : describe_model_version_response)

let make_describe_model_version_request ~model_version:(model_version_ : model_version)
    ~model_name:(model_name_ : model_name) () =
  ({ model_version = model_version_; model_name = model_name_ } : describe_model_version_request)

let make_describe_model_response ?model_quality:(model_quality_ : model_quality option)
    ?model_diagnostics_output_configuration:
      (model_diagnostics_output_configuration_ : model_diagnostics_output_configuration option)
    ?retraining_scheduler_status:(retraining_scheduler_status_ : retraining_scheduler_status option)
    ?accumulated_inference_data_end_time:(accumulated_inference_data_end_time_ : timestamp option)
    ?accumulated_inference_data_start_time:
      (accumulated_inference_data_start_time_ : timestamp option)
    ?next_scheduled_retraining_start_date:(next_scheduled_retraining_start_date_ : timestamp option)
    ?latest_scheduled_retraining_available_data_in_days:
      (latest_scheduled_retraining_available_data_in_days_ : integer option)
    ?latest_scheduled_retraining_start_time:
      (latest_scheduled_retraining_start_time_ : timestamp option)
    ?latest_scheduled_retraining_model_version:
      (latest_scheduled_retraining_model_version_ : model_version option)
    ?latest_scheduled_retraining_status:
      (latest_scheduled_retraining_status_ : model_version_status option)
    ?latest_scheduled_retraining_failed_reason:
      (latest_scheduled_retraining_failed_reason_ : bounded_length_string option)
    ?prior_model_metrics:(prior_model_metrics_ : synthesized_json_model_metrics option)
    ?previous_model_version_activated_at:(previous_model_version_activated_at_ : timestamp option)
    ?previous_active_model_version_arn:
      (previous_active_model_version_arn_ : model_version_arn option)
    ?previous_active_model_version:(previous_active_model_version_ : model_version option)
    ?model_version_activated_at:(model_version_activated_at_ : timestamp option)
    ?active_model_version_arn:(active_model_version_arn_ : model_version_arn option)
    ?active_model_version:(active_model_version_ : model_version option)
    ?import_job_end_time:(import_job_end_time_ : timestamp option)
    ?import_job_start_time:(import_job_start_time_ : timestamp option)
    ?source_model_version_arn:(source_model_version_arn_ : model_version_arn option)
    ?off_condition:(off_condition_ : off_condition option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : kms_key_arn option)
    ?created_at:(created_at_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?model_metrics:(model_metrics_ : synthesized_json_model_metrics option)
    ?failed_reason:(failed_reason_ : bounded_length_string option)
    ?training_execution_end_time:(training_execution_end_time_ : timestamp option)
    ?training_execution_start_time:(training_execution_start_time_ : timestamp option)
    ?status:(status_ : model_status option)
    ?data_pre_processing_configuration:
      (data_pre_processing_configuration_ : data_pre_processing_configuration option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?evaluation_data_end_time:(evaluation_data_end_time_ : timestamp option)
    ?evaluation_data_start_time:(evaluation_data_start_time_ : timestamp option)
    ?training_data_end_time:(training_data_end_time_ : timestamp option)
    ?training_data_start_time:(training_data_start_time_ : timestamp option)
    ?labels_input_configuration:(labels_input_configuration_ : labels_input_configuration option)
    ?schema:(schema_ : synthesized_json_inline_data_schema option)
    ?dataset_arn:(dataset_arn_ : dataset_arn option)
    ?dataset_name:(dataset_name_ : dataset_name option) ?model_arn:(model_arn_ : model_arn option)
    ?model_name:(model_name_ : model_name option) () =
  ({
     model_quality = model_quality_;
     model_diagnostics_output_configuration = model_diagnostics_output_configuration_;
     retraining_scheduler_status = retraining_scheduler_status_;
     accumulated_inference_data_end_time = accumulated_inference_data_end_time_;
     accumulated_inference_data_start_time = accumulated_inference_data_start_time_;
     next_scheduled_retraining_start_date = next_scheduled_retraining_start_date_;
     latest_scheduled_retraining_available_data_in_days =
       latest_scheduled_retraining_available_data_in_days_;
     latest_scheduled_retraining_start_time = latest_scheduled_retraining_start_time_;
     latest_scheduled_retraining_model_version = latest_scheduled_retraining_model_version_;
     latest_scheduled_retraining_status = latest_scheduled_retraining_status_;
     latest_scheduled_retraining_failed_reason = latest_scheduled_retraining_failed_reason_;
     prior_model_metrics = prior_model_metrics_;
     previous_model_version_activated_at = previous_model_version_activated_at_;
     previous_active_model_version_arn = previous_active_model_version_arn_;
     previous_active_model_version = previous_active_model_version_;
     model_version_activated_at = model_version_activated_at_;
     active_model_version_arn = active_model_version_arn_;
     active_model_version = active_model_version_;
     import_job_end_time = import_job_end_time_;
     import_job_start_time = import_job_start_time_;
     source_model_version_arn = source_model_version_arn_;
     off_condition = off_condition_;
     server_side_kms_key_id = server_side_kms_key_id_;
     created_at = created_at_;
     last_updated_time = last_updated_time_;
     model_metrics = model_metrics_;
     failed_reason = failed_reason_;
     training_execution_end_time = training_execution_end_time_;
     training_execution_start_time = training_execution_start_time_;
     status = status_;
     data_pre_processing_configuration = data_pre_processing_configuration_;
     role_arn = role_arn_;
     evaluation_data_end_time = evaluation_data_end_time_;
     evaluation_data_start_time = evaluation_data_start_time_;
     training_data_end_time = training_data_end_time_;
     training_data_start_time = training_data_start_time_;
     labels_input_configuration = labels_input_configuration_;
     schema = schema_;
     dataset_arn = dataset_arn_;
     dataset_name = dataset_name_;
     model_arn = model_arn_;
     model_name = model_name_;
   }
    : describe_model_response)

let make_describe_model_request ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : describe_model_request)

let make_describe_label_response ?created_at:(created_at_ : timestamp option)
    ?equipment:(equipment_ : equipment option) ?notes:(notes_ : comments option)
    ?fault_code:(fault_code_ : fault_code option) ?rating:(rating_ : label_rating option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?label_id:(label_id_ : label_id option)
    ?label_group_arn:(label_group_arn_ : label_group_arn option)
    ?label_group_name:(label_group_name_ : label_group_name option) () =
  ({
     created_at = created_at_;
     equipment = equipment_;
     notes = notes_;
     fault_code = fault_code_;
     rating = rating_;
     end_time = end_time_;
     start_time = start_time_;
     label_id = label_id_;
     label_group_arn = label_group_arn_;
     label_group_name = label_group_name_;
   }
    : describe_label_response)

let make_describe_label_request ~label_id:(label_id_ : label_id)
    ~label_group_name:(label_group_name_ : label_group_name) () =
  ({ label_id = label_id_; label_group_name = label_group_name_ } : describe_label_request)

let make_describe_label_group_response ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option) ?fault_codes:(fault_codes_ : fault_codes option)
    ?label_group_arn:(label_group_arn_ : label_group_arn option)
    ?label_group_name:(label_group_name_ : label_group_name option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     fault_codes = fault_codes_;
     label_group_arn = label_group_arn_;
     label_group_name = label_group_name_;
   }
    : describe_label_group_response)

let make_describe_label_group_request ~label_group_name:(label_group_name_ : label_group_name) () =
  ({ label_group_name = label_group_name_ } : describe_label_group_request)

let make_describe_inference_scheduler_response
    ?latest_inference_result:(latest_inference_result_ : latest_inference_result option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : kms_key_arn option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?data_output_configuration:(data_output_configuration_ : inference_output_configuration option)
    ?data_input_configuration:(data_input_configuration_ : inference_input_configuration option)
    ?updated_at:(updated_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?data_upload_frequency:(data_upload_frequency_ : data_upload_frequency option)
    ?data_delay_offset_in_minutes:
      (data_delay_offset_in_minutes_ : data_delay_offset_in_minutes option)
    ?status:(status_ : inference_scheduler_status option)
    ?inference_scheduler_arn:(inference_scheduler_arn_ : inference_scheduler_arn option)
    ?inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_name option)
    ?model_name:(model_name_ : model_name option) ?model_arn:(model_arn_ : model_arn option) () =
  ({
     latest_inference_result = latest_inference_result_;
     server_side_kms_key_id = server_side_kms_key_id_;
     role_arn = role_arn_;
     data_output_configuration = data_output_configuration_;
     data_input_configuration = data_input_configuration_;
     updated_at = updated_at_;
     created_at = created_at_;
     data_upload_frequency = data_upload_frequency_;
     data_delay_offset_in_minutes = data_delay_offset_in_minutes_;
     status = status_;
     inference_scheduler_arn = inference_scheduler_arn_;
     inference_scheduler_name = inference_scheduler_name_;
     model_name = model_name_;
     model_arn = model_arn_;
   }
    : describe_inference_scheduler_response)

let make_describe_inference_scheduler_request
    ~inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_identifier) () =
  ({ inference_scheduler_name = inference_scheduler_name_ } : describe_inference_scheduler_request)

let make_data_quality_summary ~duplicate_timestamps:(duplicate_timestamps_ : duplicate_timestamps)
    ~unsupported_timestamps:(unsupported_timestamps_ : unsupported_timestamps)
    ~invalid_sensor_data:(invalid_sensor_data_ : invalid_sensor_data)
    ~missing_sensor_data:(missing_sensor_data_ : missing_sensor_data)
    ~insufficient_sensor_data:(insufficient_sensor_data_ : insufficient_sensor_data) () =
  ({
     duplicate_timestamps = duplicate_timestamps_;
     unsupported_timestamps = unsupported_timestamps_;
     invalid_sensor_data = invalid_sensor_data_;
     missing_sensor_data = missing_sensor_data_;
     insufficient_sensor_data = insufficient_sensor_data_;
   }
    : data_quality_summary)

let make_describe_dataset_response ?source_dataset_arn:(source_dataset_arn_ : dataset_arn option)
    ?data_end_time:(data_end_time_ : timestamp option)
    ?data_start_time:(data_start_time_ : timestamp option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?ingested_files_summary:(ingested_files_summary_ : ingested_files_summary option)
    ?data_quality_summary:(data_quality_summary_ : data_quality_summary option)
    ?ingestion_input_configuration:
      (ingestion_input_configuration_ : ingestion_input_configuration option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : kms_key_arn option)
    ?schema:(schema_ : synthesized_json_inline_data_schema option)
    ?status:(status_ : dataset_status option) ?last_updated_at:(last_updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option) ?dataset_arn:(dataset_arn_ : dataset_arn option)
    ?dataset_name:(dataset_name_ : dataset_name option) () =
  ({
     source_dataset_arn = source_dataset_arn_;
     data_end_time = data_end_time_;
     data_start_time = data_start_time_;
     role_arn = role_arn_;
     ingested_files_summary = ingested_files_summary_;
     data_quality_summary = data_quality_summary_;
     ingestion_input_configuration = ingestion_input_configuration_;
     server_side_kms_key_id = server_side_kms_key_id_;
     schema = schema_;
     status = status_;
     last_updated_at = last_updated_at_;
     created_at = created_at_;
     dataset_arn = dataset_arn_;
     dataset_name = dataset_name_;
   }
    : describe_dataset_response)

let make_describe_dataset_request ~dataset_name:(dataset_name_ : dataset_identifier) () =
  ({ dataset_name = dataset_name_ } : describe_dataset_request)

let make_describe_data_ingestion_job_response
    ?source_dataset_arn:(source_dataset_arn_ : dataset_arn option)
    ?data_end_time:(data_end_time_ : timestamp option)
    ?data_start_time:(data_start_time_ : timestamp option)
    ?ingested_data_size:(ingested_data_size_ : data_size_in_bytes option)
    ?status_detail:(status_detail_ : bounded_length_string option)
    ?ingested_files_summary:(ingested_files_summary_ : ingested_files_summary option)
    ?data_quality_summary:(data_quality_summary_ : data_quality_summary option)
    ?failed_reason:(failed_reason_ : bounded_length_string option)
    ?status:(status_ : ingestion_job_status option) ?created_at:(created_at_ : timestamp option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?ingestion_input_configuration:
      (ingestion_input_configuration_ : ingestion_input_configuration option)
    ?dataset_arn:(dataset_arn_ : dataset_arn option) ?job_id:(job_id_ : ingestion_job_id option) ()
    =
  ({
     source_dataset_arn = source_dataset_arn_;
     data_end_time = data_end_time_;
     data_start_time = data_start_time_;
     ingested_data_size = ingested_data_size_;
     status_detail = status_detail_;
     ingested_files_summary = ingested_files_summary_;
     data_quality_summary = data_quality_summary_;
     failed_reason = failed_reason_;
     status = status_;
     created_at = created_at_;
     role_arn = role_arn_;
     ingestion_input_configuration = ingestion_input_configuration_;
     dataset_arn = dataset_arn_;
     job_id = job_id_;
   }
    : describe_data_ingestion_job_response)

let make_describe_data_ingestion_job_request ~job_id:(job_id_ : ingestion_job_id) () =
  ({ job_id = job_id_ } : describe_data_ingestion_job_request)

let make_delete_retraining_scheduler_request ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : delete_retraining_scheduler_request)

let make_delete_resource_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : delete_resource_policy_request)

let make_delete_model_request ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : delete_model_request)

let make_delete_label_request ~label_id:(label_id_ : label_id)
    ~label_group_name:(label_group_name_ : label_group_name) () =
  ({ label_id = label_id_; label_group_name = label_group_name_ } : delete_label_request)

let make_delete_label_group_request ~label_group_name:(label_group_name_ : label_group_name) () =
  ({ label_group_name = label_group_name_ } : delete_label_group_request)

let make_delete_inference_scheduler_request
    ~inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_identifier) () =
  ({ inference_scheduler_name = inference_scheduler_name_ } : delete_inference_scheduler_request)

let make_delete_dataset_request ~dataset_name:(dataset_name_ : dataset_identifier) () =
  ({ dataset_name = dataset_name_ } : delete_dataset_request)

let make_dataset_schema
    ?inline_data_schema:(inline_data_schema_ : synthesized_json_inline_data_schema option) () =
  ({ inline_data_schema = inline_data_schema_ } : dataset_schema)

let make_create_retraining_scheduler_response ?status:(status_ : retraining_scheduler_status option)
    ?model_arn:(model_arn_ : model_arn option) ?model_name:(model_name_ : model_name option) () =
  ({ status = status_; model_arn = model_arn_; model_name = model_name_ }
    : create_retraining_scheduler_response)

let make_create_retraining_scheduler_request
    ?promote_mode:(promote_mode_ : model_promote_mode option)
    ?retraining_start_date:(retraining_start_date_ : timestamp option)
    ~client_token:(client_token_ : idempotence_token)
    ~lookback_window:(lookback_window_ : lookback_window)
    ~retraining_frequency:(retraining_frequency_ : retraining_frequency)
    ~model_name:(model_name_ : model_name) () =
  ({
     client_token = client_token_;
     promote_mode = promote_mode_;
     lookback_window = lookback_window_;
     retraining_frequency = retraining_frequency_;
     retraining_start_date = retraining_start_date_;
     model_name = model_name_;
   }
    : create_retraining_scheduler_request)

let make_create_model_response ?status:(status_ : model_status option)
    ?model_arn:(model_arn_ : model_arn option) () =
  ({ status = status_; model_arn = model_arn_ } : create_model_response)

let make_create_model_request
    ?model_diagnostics_output_configuration:
      (model_diagnostics_output_configuration_ : model_diagnostics_output_configuration option)
    ?off_condition:(off_condition_ : off_condition option) ?tags:(tags_ : tag_list option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : name_or_arn option)
    ?data_pre_processing_configuration:
      (data_pre_processing_configuration_ : data_pre_processing_configuration option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?evaluation_data_end_time:(evaluation_data_end_time_ : timestamp option)
    ?evaluation_data_start_time:(evaluation_data_start_time_ : timestamp option)
    ?training_data_end_time:(training_data_end_time_ : timestamp option)
    ?training_data_start_time:(training_data_start_time_ : timestamp option)
    ?labels_input_configuration:(labels_input_configuration_ : labels_input_configuration option)
    ?dataset_schema:(dataset_schema_ : dataset_schema option)
    ~client_token:(client_token_ : idempotence_token)
    ~dataset_name:(dataset_name_ : dataset_identifier) ~model_name:(model_name_ : model_name) () =
  ({
     model_diagnostics_output_configuration = model_diagnostics_output_configuration_;
     off_condition = off_condition_;
     tags = tags_;
     server_side_kms_key_id = server_side_kms_key_id_;
     data_pre_processing_configuration = data_pre_processing_configuration_;
     role_arn = role_arn_;
     evaluation_data_end_time = evaluation_data_end_time_;
     evaluation_data_start_time = evaluation_data_start_time_;
     training_data_end_time = training_data_end_time_;
     training_data_start_time = training_data_start_time_;
     client_token = client_token_;
     labels_input_configuration = labels_input_configuration_;
     dataset_schema = dataset_schema_;
     dataset_name = dataset_name_;
     model_name = model_name_;
   }
    : create_model_request)

let make_create_label_response ?label_id:(label_id_ : label_id option) () =
  ({ label_id = label_id_ } : create_label_response)

let make_create_label_request ?equipment:(equipment_ : equipment option)
    ?notes:(notes_ : comments option) ?fault_code:(fault_code_ : fault_code option)
    ~client_token:(client_token_ : idempotence_token) ~rating:(rating_ : label_rating)
    ~end_time:(end_time_ : timestamp) ~start_time:(start_time_ : timestamp)
    ~label_group_name:(label_group_name_ : label_group_name) () =
  ({
     client_token = client_token_;
     equipment = equipment_;
     notes = notes_;
     fault_code = fault_code_;
     rating = rating_;
     end_time = end_time_;
     start_time = start_time_;
     label_group_name = label_group_name_;
   }
    : create_label_request)

let make_create_label_group_response ?label_group_arn:(label_group_arn_ : label_group_arn option)
    ?label_group_name:(label_group_name_ : label_group_name option) () =
  ({ label_group_arn = label_group_arn_; label_group_name = label_group_name_ }
    : create_label_group_response)

let make_create_label_group_request ?tags:(tags_ : tag_list option)
    ?fault_codes:(fault_codes_ : fault_codes option)
    ~client_token:(client_token_ : idempotence_token)
    ~label_group_name:(label_group_name_ : label_group_name) () =
  ({
     tags = tags_;
     client_token = client_token_;
     fault_codes = fault_codes_;
     label_group_name = label_group_name_;
   }
    : create_label_group_request)

let make_create_inference_scheduler_response ?model_quality:(model_quality_ : model_quality option)
    ?status:(status_ : inference_scheduler_status option)
    ?inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_name option)
    ?inference_scheduler_arn:(inference_scheduler_arn_ : inference_scheduler_arn option) () =
  ({
     model_quality = model_quality_;
     status = status_;
     inference_scheduler_name = inference_scheduler_name_;
     inference_scheduler_arn = inference_scheduler_arn_;
   }
    : create_inference_scheduler_response)

let make_create_inference_scheduler_request ?tags:(tags_ : tag_list option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : name_or_arn option)
    ?data_delay_offset_in_minutes:
      (data_delay_offset_in_minutes_ : data_delay_offset_in_minutes option)
    ~client_token:(client_token_ : idempotence_token) ~role_arn:(role_arn_ : iam_role_arn)
    ~data_output_configuration:(data_output_configuration_ : inference_output_configuration)
    ~data_input_configuration:(data_input_configuration_ : inference_input_configuration)
    ~data_upload_frequency:(data_upload_frequency_ : data_upload_frequency)
    ~inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_name)
    ~model_name:(model_name_ : model_name) () =
  ({
     tags = tags_;
     client_token = client_token_;
     server_side_kms_key_id = server_side_kms_key_id_;
     role_arn = role_arn_;
     data_output_configuration = data_output_configuration_;
     data_input_configuration = data_input_configuration_;
     data_upload_frequency = data_upload_frequency_;
     data_delay_offset_in_minutes = data_delay_offset_in_minutes_;
     inference_scheduler_name = inference_scheduler_name_;
     model_name = model_name_;
   }
    : create_inference_scheduler_request)

let make_create_dataset_response ?status:(status_ : dataset_status option)
    ?dataset_arn:(dataset_arn_ : dataset_arn option)
    ?dataset_name:(dataset_name_ : dataset_name option) () =
  ({ status = status_; dataset_arn = dataset_arn_; dataset_name = dataset_name_ }
    : create_dataset_response)

let make_create_dataset_request ?tags:(tags_ : tag_list option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : name_or_arn option)
    ?dataset_schema:(dataset_schema_ : dataset_schema option)
    ~client_token:(client_token_ : idempotence_token) ~dataset_name:(dataset_name_ : dataset_name)
    () =
  ({
     tags = tags_;
     client_token = client_token_;
     server_side_kms_key_id = server_side_kms_key_id_;
     dataset_schema = dataset_schema_;
     dataset_name = dataset_name_;
   }
    : create_dataset_request)
