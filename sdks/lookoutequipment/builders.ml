open Types

let make_update_retraining_scheduler_request
    ?retraining_start_date:(retraining_start_date_ : timestamp option)
    ?retraining_frequency:(retraining_frequency_ : retraining_frequency option)
    ?lookback_window:(lookback_window_ : lookback_window option)
    ?promote_mode:(promote_mode_ : model_promote_mode option) ~model_name:(model_name_ : model_name)
    () =
  ({
     model_name = model_name_;
     retraining_start_date = retraining_start_date_;
     retraining_frequency = retraining_frequency_;
     lookback_window = lookback_window_;
     promote_mode = promote_mode_;
   }
    : update_retraining_scheduler_request)

let make_model_diagnostics_s3_output_configuration ?prefix:(prefix_ : s3_prefix option)
    ~bucket:(bucket_ : s3_bucket) () =
  ({ bucket = bucket_; prefix = prefix_ } : model_diagnostics_s3_output_configuration)

let make_model_diagnostics_output_configuration ?kms_key_id:(kms_key_id_ : name_or_arn option)
    ~s3_output_configuration:(s3_output_configuration_ : model_diagnostics_s3_output_configuration)
    () =
  ({ s3_output_configuration = s3_output_configuration_; kms_key_id = kms_key_id_ }
    : model_diagnostics_output_configuration)

let make_labels_s3_input_configuration ?prefix:(prefix_ : s3_prefix option)
    ~bucket:(bucket_ : s3_bucket) () =
  ({ bucket = bucket_; prefix = prefix_ } : labels_s3_input_configuration)

let make_labels_input_configuration
    ?s3_input_configuration:(s3_input_configuration_ : labels_s3_input_configuration option)
    ?label_group_name:(label_group_name_ : label_group_name option) () =
  ({ s3_input_configuration = s3_input_configuration_; label_group_name = label_group_name_ }
    : labels_input_configuration)

let make_update_model_request
    ?labels_input_configuration:(labels_input_configuration_ : labels_input_configuration option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?model_diagnostics_output_configuration:
      (model_diagnostics_output_configuration_ : model_diagnostics_output_configuration option)
    ~model_name:(model_name_ : model_name) () =
  ({
     model_name = model_name_;
     labels_input_configuration = labels_input_configuration_;
     role_arn = role_arn_;
     model_diagnostics_output_configuration = model_diagnostics_output_configuration_;
   }
    : update_model_request)

let make_update_label_group_request ?fault_codes:(fault_codes_ : fault_codes option)
    ~label_group_name:(label_group_name_ : label_group_name) () =
  ({ label_group_name = label_group_name_; fault_codes = fault_codes_ }
    : update_label_group_request)

let make_inference_s3_output_configuration ?prefix:(prefix_ : s3_prefix option)
    ~bucket:(bucket_ : s3_bucket) () =
  ({ bucket = bucket_; prefix = prefix_ } : inference_s3_output_configuration)

let make_inference_output_configuration ?kms_key_id:(kms_key_id_ : name_or_arn option)
    ~s3_output_configuration:(s3_output_configuration_ : inference_s3_output_configuration) () =
  ({ s3_output_configuration = s3_output_configuration_; kms_key_id = kms_key_id_ }
    : inference_output_configuration)

let make_inference_input_name_configuration
    ?timestamp_format:(timestamp_format_ : file_name_timestamp_format option)
    ?component_timestamp_delimiter:
      (component_timestamp_delimiter_ : component_timestamp_delimiter option) () =
  ({
     timestamp_format = timestamp_format_;
     component_timestamp_delimiter = component_timestamp_delimiter_;
   }
    : inference_input_name_configuration)

let make_inference_s3_input_configuration ?prefix:(prefix_ : s3_prefix option)
    ~bucket:(bucket_ : s3_bucket) () =
  ({ bucket = bucket_; prefix = prefix_ } : inference_s3_input_configuration)

let make_inference_input_configuration
    ?s3_input_configuration:(s3_input_configuration_ : inference_s3_input_configuration option)
    ?input_time_zone_offset:(input_time_zone_offset_ : time_zone_offset option)
    ?inference_input_name_configuration:
      (inference_input_name_configuration_ : inference_input_name_configuration option) () =
  ({
     s3_input_configuration = s3_input_configuration_;
     input_time_zone_offset = input_time_zone_offset_;
     inference_input_name_configuration = inference_input_name_configuration_;
   }
    : inference_input_configuration)

let make_update_inference_scheduler_request
    ?data_delay_offset_in_minutes:
      (data_delay_offset_in_minutes_ : data_delay_offset_in_minutes option)
    ?data_upload_frequency:(data_upload_frequency_ : data_upload_frequency option)
    ?data_input_configuration:(data_input_configuration_ : inference_input_configuration option)
    ?data_output_configuration:(data_output_configuration_ : inference_output_configuration option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ~inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_identifier) () =
  ({
     inference_scheduler_name = inference_scheduler_name_;
     data_delay_offset_in_minutes = data_delay_offset_in_minutes_;
     data_upload_frequency = data_upload_frequency_;
     data_input_configuration = data_input_configuration_;
     data_output_configuration = data_output_configuration_;
     role_arn = role_arn_;
   }
    : update_inference_scheduler_request)

let make_update_active_model_version_response ?model_name:(model_name_ : model_name option)
    ?model_arn:(model_arn_ : model_arn option)
    ?current_active_version:(current_active_version_ : model_version option)
    ?previous_active_version:(previous_active_version_ : model_version option)
    ?current_active_version_arn:(current_active_version_arn_ : model_version_arn option)
    ?previous_active_version_arn:(previous_active_version_arn_ : model_version_arn option) () =
  ({
     model_name = model_name_;
     model_arn = model_arn_;
     current_active_version = current_active_version_;
     previous_active_version = previous_active_version_;
     current_active_version_arn = current_active_version_arn_;
     previous_active_version_arn = previous_active_version_arn_;
   }
    : update_active_model_version_response)

let make_update_active_model_version_request ~model_name:(model_name_ : model_name)
    ~model_version:(model_version_ : model_version) () =
  ({ model_name = model_name_; model_version = model_version_ }
    : update_active_model_version_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : amazon_resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_arn:(resource_arn_ : amazon_resource_arn)
    ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_stop_retraining_scheduler_response ?model_name:(model_name_ : model_name option)
    ?model_arn:(model_arn_ : model_arn option)
    ?status:(status_ : retraining_scheduler_status option) () =
  ({ model_name = model_name_; model_arn = model_arn_; status = status_ }
    : stop_retraining_scheduler_response)

let make_stop_retraining_scheduler_request ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : stop_retraining_scheduler_request)

let make_stop_inference_scheduler_response ?model_arn:(model_arn_ : model_arn option)
    ?model_name:(model_name_ : model_name option)
    ?inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_name option)
    ?inference_scheduler_arn:(inference_scheduler_arn_ : inference_scheduler_arn option)
    ?status:(status_ : inference_scheduler_status option) () =
  ({
     model_arn = model_arn_;
     model_name = model_name_;
     inference_scheduler_name = inference_scheduler_name_;
     inference_scheduler_arn = inference_scheduler_arn_;
     status = status_;
   }
    : stop_inference_scheduler_response)

let make_stop_inference_scheduler_request
    ~inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_identifier) () =
  ({ inference_scheduler_name = inference_scheduler_name_ } : stop_inference_scheduler_request)

let make_start_retraining_scheduler_response ?model_name:(model_name_ : model_name option)
    ?model_arn:(model_arn_ : model_arn option)
    ?status:(status_ : retraining_scheduler_status option) () =
  ({ model_name = model_name_; model_arn = model_arn_; status = status_ }
    : start_retraining_scheduler_response)

let make_start_retraining_scheduler_request ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : start_retraining_scheduler_request)

let make_start_inference_scheduler_response ?model_arn:(model_arn_ : model_arn option)
    ?model_name:(model_name_ : model_name option)
    ?inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_name option)
    ?inference_scheduler_arn:(inference_scheduler_arn_ : inference_scheduler_arn option)
    ?status:(status_ : inference_scheduler_status option) () =
  ({
     model_arn = model_arn_;
     model_name = model_name_;
     inference_scheduler_name = inference_scheduler_name_;
     inference_scheduler_arn = inference_scheduler_arn_;
     status = status_;
   }
    : start_inference_scheduler_response)

let make_start_inference_scheduler_request
    ~inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_identifier) () =
  ({ inference_scheduler_name = inference_scheduler_name_ } : start_inference_scheduler_request)

let make_start_data_ingestion_job_response ?job_id:(job_id_ : ingestion_job_id option)
    ?status:(status_ : ingestion_job_status option) () =
  ({ job_id = job_id_; status = status_ } : start_data_ingestion_job_response)

let make_ingestion_s3_input_configuration ?prefix:(prefix_ : s3_prefix option)
    ?key_pattern:(key_pattern_ : key_pattern option) ~bucket:(bucket_ : s3_bucket) () =
  ({ bucket = bucket_; prefix = prefix_; key_pattern = key_pattern_ }
    : ingestion_s3_input_configuration)

let make_ingestion_input_configuration
    ~s3_input_configuration:(s3_input_configuration_ : ingestion_s3_input_configuration) () =
  ({ s3_input_configuration = s3_input_configuration_ } : ingestion_input_configuration)

let make_start_data_ingestion_job_request ~dataset_name:(dataset_name_ : dataset_identifier)
    ~ingestion_input_configuration:(ingestion_input_configuration_ : ingestion_input_configuration)
    ~role_arn:(role_arn_ : iam_role_arn) ~client_token:(client_token_ : idempotence_token) () =
  ({
     dataset_name = dataset_name_;
     ingestion_input_configuration = ingestion_input_configuration_;
     role_arn = role_arn_;
     client_token = client_token_;
   }
    : start_data_ingestion_job_request)

let make_put_resource_policy_response ?resource_arn:(resource_arn_ : resource_arn option)
    ?policy_revision_id:(policy_revision_id_ : policy_revision_id option) () =
  ({ resource_arn = resource_arn_; policy_revision_id = policy_revision_id_ }
    : put_resource_policy_response)

let make_put_resource_policy_request
    ?policy_revision_id:(policy_revision_id_ : policy_revision_id option)
    ~resource_arn:(resource_arn_ : resource_arn) ~resource_policy:(resource_policy_ : policy)
    ~client_token:(client_token_ : idempotence_token) () =
  ({
     resource_arn = resource_arn_;
     resource_policy = resource_policy_;
     policy_revision_id = policy_revision_id_;
     client_token = client_token_;
   }
    : put_resource_policy_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : amazon_resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_monotonic_values ?monotonicity:(monotonicity_ : monotonicity option)
    ~status:(status_ : statistical_issue_status) () =
  ({ status = status_; monotonicity = monotonicity_ } : monotonic_values)

let make_large_timestamp_gaps
    ?number_of_large_timestamp_gaps:(number_of_large_timestamp_gaps_ : integer option)
    ?max_timestamp_gap_in_days:(max_timestamp_gap_in_days_ : integer option)
    ~status:(status_ : statistical_issue_status) () =
  ({
     status = status_;
     number_of_large_timestamp_gaps = number_of_large_timestamp_gaps_;
     max_timestamp_gap_in_days = max_timestamp_gap_in_days_;
   }
    : large_timestamp_gaps)

let make_multiple_operating_modes ~status:(status_ : statistical_issue_status) () =
  ({ status = status_ } : multiple_operating_modes)

let make_categorical_values ?number_of_category:(number_of_category_ : integer option)
    ~status:(status_ : statistical_issue_status) () =
  ({ status = status_; number_of_category = number_of_category_ } : categorical_values)

let make_count_percent ~count:(count_ : integer) ~percentage:(percentage_ : float_) () =
  ({ count = count_; percentage = percentage_ } : count_percent)

let make_sensor_statistics_summary ?component_name:(component_name_ : component_name option)
    ?sensor_name:(sensor_name_ : sensor_name option) ?data_exists:(data_exists_ : boolean_ option)
    ?missing_values:(missing_values_ : count_percent option)
    ?invalid_values:(invalid_values_ : count_percent option)
    ?invalid_date_entries:(invalid_date_entries_ : count_percent option)
    ?duplicate_timestamps:(duplicate_timestamps_ : count_percent option)
    ?categorical_values:(categorical_values_ : categorical_values option)
    ?multiple_operating_modes:(multiple_operating_modes_ : multiple_operating_modes option)
    ?large_timestamp_gaps:(large_timestamp_gaps_ : large_timestamp_gaps option)
    ?monotonic_values:(monotonic_values_ : monotonic_values option)
    ?data_start_time:(data_start_time_ : timestamp option)
    ?data_end_time:(data_end_time_ : timestamp option) () =
  ({
     component_name = component_name_;
     sensor_name = sensor_name_;
     data_exists = data_exists_;
     missing_values = missing_values_;
     invalid_values = invalid_values_;
     invalid_date_entries = invalid_date_entries_;
     duplicate_timestamps = duplicate_timestamps_;
     categorical_values = categorical_values_;
     multiple_operating_modes = multiple_operating_modes_;
     large_timestamp_gaps = large_timestamp_gaps_;
     monotonic_values = monotonic_values_;
     data_start_time = data_start_time_;
     data_end_time = data_end_time_;
   }
    : sensor_statistics_summary)

let make_list_sensor_statistics_response
    ?sensor_statistics_summaries:(sensor_statistics_summaries_ : sensor_statistics_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ sensor_statistics_summaries = sensor_statistics_summaries_; next_token = next_token_ }
    : list_sensor_statistics_response)

let make_list_sensor_statistics_request
    ?ingestion_job_id:(ingestion_job_id_ : ingestion_job_id option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~dataset_name:(dataset_name_ : dataset_name) () =
  ({
     dataset_name = dataset_name_;
     ingestion_job_id = ingestion_job_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_sensor_statistics_request)

let make_retraining_scheduler_summary ?model_name:(model_name_ : model_name option)
    ?model_arn:(model_arn_ : model_arn option)
    ?status:(status_ : retraining_scheduler_status option)
    ?retraining_start_date:(retraining_start_date_ : timestamp option)
    ?retraining_frequency:(retraining_frequency_ : retraining_frequency option)
    ?lookback_window:(lookback_window_ : lookback_window option) () =
  ({
     model_name = model_name_;
     model_arn = model_arn_;
     status = status_;
     retraining_start_date = retraining_start_date_;
     retraining_frequency = retraining_frequency_;
     lookback_window = lookback_window_;
   }
    : retraining_scheduler_summary)

let make_list_retraining_schedulers_response
    ?retraining_scheduler_summaries:
      (retraining_scheduler_summaries_ : retraining_scheduler_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ retraining_scheduler_summaries = retraining_scheduler_summaries_; next_token = next_token_ }
    : list_retraining_schedulers_response)

let make_list_retraining_schedulers_request
    ?model_name_begins_with:(model_name_begins_with_ : model_name option)
    ?status:(status_ : retraining_scheduler_status option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     model_name_begins_with = model_name_begins_with_;
     status = status_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_retraining_schedulers_request)

let make_model_version_summary ?model_name:(model_name_ : model_name option)
    ?model_arn:(model_arn_ : model_arn option)
    ?model_version:(model_version_ : model_version option)
    ?model_version_arn:(model_version_arn_ : model_version_arn option)
    ?created_at:(created_at_ : timestamp option) ?status:(status_ : model_version_status option)
    ?source_type:(source_type_ : model_version_source_type option)
    ?model_quality:(model_quality_ : model_quality option) () =
  ({
     model_name = model_name_;
     model_arn = model_arn_;
     model_version = model_version_;
     model_version_arn = model_version_arn_;
     created_at = created_at_;
     status = status_;
     source_type = source_type_;
     model_quality = model_quality_;
   }
    : model_version_summary)

let make_list_model_versions_response ?next_token:(next_token_ : next_token option)
    ?model_version_summaries:(model_version_summaries_ : model_version_summaries option) () =
  ({ next_token = next_token_; model_version_summaries = model_version_summaries_ }
    : list_model_versions_response)

let make_list_model_versions_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?status:(status_ : model_version_status option)
    ?source_type:(source_type_ : model_version_source_type option)
    ?created_at_end_time:(created_at_end_time_ : timestamp option)
    ?created_at_start_time:(created_at_start_time_ : timestamp option)
    ?max_model_version:(max_model_version_ : model_version option)
    ?min_model_version:(min_model_version_ : model_version option)
    ~model_name:(model_name_ : model_name) () =
  ({
     model_name = model_name_;
     next_token = next_token_;
     max_results = max_results_;
     status = status_;
     source_type = source_type_;
     created_at_end_time = created_at_end_time_;
     created_at_start_time = created_at_start_time_;
     max_model_version = max_model_version_;
     min_model_version = min_model_version_;
   }
    : list_model_versions_request)

let make_model_summary ?model_name:(model_name_ : model_name option)
    ?model_arn:(model_arn_ : model_arn option) ?dataset_name:(dataset_name_ : dataset_name option)
    ?dataset_arn:(dataset_arn_ : dataset_arn option) ?status:(status_ : model_status option)
    ?created_at:(created_at_ : timestamp option)
    ?active_model_version:(active_model_version_ : model_version option)
    ?active_model_version_arn:(active_model_version_arn_ : model_version_arn option)
    ?latest_scheduled_retraining_status:
      (latest_scheduled_retraining_status_ : model_version_status option)
    ?latest_scheduled_retraining_model_version:
      (latest_scheduled_retraining_model_version_ : model_version option)
    ?latest_scheduled_retraining_start_time:
      (latest_scheduled_retraining_start_time_ : timestamp option)
    ?next_scheduled_retraining_start_date:(next_scheduled_retraining_start_date_ : timestamp option)
    ?retraining_scheduler_status:(retraining_scheduler_status_ : retraining_scheduler_status option)
    ?model_diagnostics_output_configuration:
      (model_diagnostics_output_configuration_ : model_diagnostics_output_configuration option)
    ?model_quality:(model_quality_ : model_quality option) () =
  ({
     model_name = model_name_;
     model_arn = model_arn_;
     dataset_name = dataset_name_;
     dataset_arn = dataset_arn_;
     status = status_;
     created_at = created_at_;
     active_model_version = active_model_version_;
     active_model_version_arn = active_model_version_arn_;
     latest_scheduled_retraining_status = latest_scheduled_retraining_status_;
     latest_scheduled_retraining_model_version = latest_scheduled_retraining_model_version_;
     latest_scheduled_retraining_start_time = latest_scheduled_retraining_start_time_;
     next_scheduled_retraining_start_date = next_scheduled_retraining_start_date_;
     retraining_scheduler_status = retraining_scheduler_status_;
     model_diagnostics_output_configuration = model_diagnostics_output_configuration_;
     model_quality = model_quality_;
   }
    : model_summary)

let make_list_models_response ?next_token:(next_token_ : next_token option)
    ?model_summaries:(model_summaries_ : model_summaries option) () =
  ({ next_token = next_token_; model_summaries = model_summaries_ } : list_models_response)

let make_list_models_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?status:(status_ : model_status option)
    ?model_name_begins_with:(model_name_begins_with_ : model_name option)
    ?dataset_name_begins_with:(dataset_name_begins_with_ : dataset_name option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     status = status_;
     model_name_begins_with = model_name_begins_with_;
     dataset_name_begins_with = dataset_name_begins_with_;
   }
    : list_models_request)

let make_label_summary ?label_group_name:(label_group_name_ : label_group_name option)
    ?label_id:(label_id_ : label_id option)
    ?label_group_arn:(label_group_arn_ : label_group_arn option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?rating:(rating_ : label_rating option) ?fault_code:(fault_code_ : fault_code option)
    ?equipment:(equipment_ : equipment option) ?created_at:(created_at_ : timestamp option) () =
  ({
     label_group_name = label_group_name_;
     label_id = label_id_;
     label_group_arn = label_group_arn_;
     start_time = start_time_;
     end_time = end_time_;
     rating = rating_;
     fault_code = fault_code_;
     equipment = equipment_;
     created_at = created_at_;
   }
    : label_summary)

let make_list_labels_response ?next_token:(next_token_ : next_token option)
    ?label_summaries:(label_summaries_ : label_summaries option) () =
  ({ next_token = next_token_; label_summaries = label_summaries_ } : list_labels_response)

let make_list_labels_request ?interval_start_time:(interval_start_time_ : timestamp option)
    ?interval_end_time:(interval_end_time_ : timestamp option)
    ?fault_code:(fault_code_ : fault_code option) ?equipment:(equipment_ : equipment option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~label_group_name:(label_group_name_ : label_group_name) () =
  ({
     label_group_name = label_group_name_;
     interval_start_time = interval_start_time_;
     interval_end_time = interval_end_time_;
     fault_code = fault_code_;
     equipment = equipment_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_labels_request)

let make_label_group_summary ?label_group_name:(label_group_name_ : label_group_name option)
    ?label_group_arn:(label_group_arn_ : label_group_arn option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option) () =
  ({
     label_group_name = label_group_name_;
     label_group_arn = label_group_arn_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : label_group_summary)

let make_list_label_groups_response ?next_token:(next_token_ : next_token option)
    ?label_group_summaries:(label_group_summaries_ : label_group_summaries option) () =
  ({ next_token = next_token_; label_group_summaries = label_group_summaries_ }
    : list_label_groups_response)

let make_list_label_groups_request
    ?label_group_name_begins_with:(label_group_name_begins_with_ : label_group_name option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     label_group_name_begins_with = label_group_name_begins_with_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_label_groups_request)

let make_inference_scheduler_summary ?model_name:(model_name_ : model_name option)
    ?model_arn:(model_arn_ : model_arn option)
    ?inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_name option)
    ?inference_scheduler_arn:(inference_scheduler_arn_ : inference_scheduler_arn option)
    ?status:(status_ : inference_scheduler_status option)
    ?data_delay_offset_in_minutes:
      (data_delay_offset_in_minutes_ : data_delay_offset_in_minutes option)
    ?data_upload_frequency:(data_upload_frequency_ : data_upload_frequency option)
    ?latest_inference_result:(latest_inference_result_ : latest_inference_result option) () =
  ({
     model_name = model_name_;
     model_arn = model_arn_;
     inference_scheduler_name = inference_scheduler_name_;
     inference_scheduler_arn = inference_scheduler_arn_;
     status = status_;
     data_delay_offset_in_minutes = data_delay_offset_in_minutes_;
     data_upload_frequency = data_upload_frequency_;
     latest_inference_result = latest_inference_result_;
   }
    : inference_scheduler_summary)

let make_list_inference_schedulers_response ?next_token:(next_token_ : next_token option)
    ?inference_scheduler_summaries:
      (inference_scheduler_summaries_ : inference_scheduler_summaries option) () =
  ({ next_token = next_token_; inference_scheduler_summaries = inference_scheduler_summaries_ }
    : list_inference_schedulers_response)

let make_list_inference_schedulers_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?inference_scheduler_name_begins_with:
      (inference_scheduler_name_begins_with_ : inference_scheduler_identifier option)
    ?model_name:(model_name_ : model_name option)
    ?status:(status_ : inference_scheduler_status option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     inference_scheduler_name_begins_with = inference_scheduler_name_begins_with_;
     model_name = model_name_;
     status = status_;
   }
    : list_inference_schedulers_request)

let make_s3_object ~bucket:(bucket_ : s3_bucket) ~key:(key_ : s3_key) () =
  ({ bucket = bucket_; key = key_ } : s3_object)

let make_inference_execution_summary ?model_name:(model_name_ : model_name option)
    ?model_arn:(model_arn_ : model_arn option)
    ?inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_name option)
    ?inference_scheduler_arn:(inference_scheduler_arn_ : inference_scheduler_arn option)
    ?scheduled_start_time:(scheduled_start_time_ : timestamp option)
    ?data_start_time:(data_start_time_ : timestamp option)
    ?data_end_time:(data_end_time_ : timestamp option)
    ?data_input_configuration:(data_input_configuration_ : inference_input_configuration option)
    ?data_output_configuration:(data_output_configuration_ : inference_output_configuration option)
    ?customer_result_object:(customer_result_object_ : s3_object option)
    ?status:(status_ : inference_execution_status option)
    ?failed_reason:(failed_reason_ : bounded_length_string option)
    ?model_version:(model_version_ : model_version option)
    ?model_version_arn:(model_version_arn_ : model_version_arn option) () =
  ({
     model_name = model_name_;
     model_arn = model_arn_;
     inference_scheduler_name = inference_scheduler_name_;
     inference_scheduler_arn = inference_scheduler_arn_;
     scheduled_start_time = scheduled_start_time_;
     data_start_time = data_start_time_;
     data_end_time = data_end_time_;
     data_input_configuration = data_input_configuration_;
     data_output_configuration = data_output_configuration_;
     customer_result_object = customer_result_object_;
     status = status_;
     failed_reason = failed_reason_;
     model_version = model_version_;
     model_version_arn = model_version_arn_;
   }
    : inference_execution_summary)

let make_list_inference_executions_response ?next_token:(next_token_ : next_token option)
    ?inference_execution_summaries:
      (inference_execution_summaries_ : inference_execution_summaries option) () =
  ({ next_token = next_token_; inference_execution_summaries = inference_execution_summaries_ }
    : list_inference_executions_response)

let make_list_inference_executions_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?data_start_time_after:(data_start_time_after_ : timestamp option)
    ?data_end_time_before:(data_end_time_before_ : timestamp option)
    ?status:(status_ : inference_execution_status option)
    ~inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_identifier) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     inference_scheduler_name = inference_scheduler_name_;
     data_start_time_after = data_start_time_after_;
     data_end_time_before = data_end_time_before_;
     status = status_;
   }
    : list_inference_executions_request)

let make_inference_event_summary
    ?inference_scheduler_arn:(inference_scheduler_arn_ : inference_scheduler_arn option)
    ?inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_name option)
    ?event_start_time:(event_start_time_ : timestamp option)
    ?event_end_time:(event_end_time_ : timestamp option)
    ?diagnostics:(diagnostics_ : model_metrics option)
    ?event_duration_in_seconds:(event_duration_in_seconds_ : event_duration_in_seconds option) () =
  ({
     inference_scheduler_arn = inference_scheduler_arn_;
     inference_scheduler_name = inference_scheduler_name_;
     event_start_time = event_start_time_;
     event_end_time = event_end_time_;
     diagnostics = diagnostics_;
     event_duration_in_seconds = event_duration_in_seconds_;
   }
    : inference_event_summary)

let make_list_inference_events_response ?next_token:(next_token_ : next_token option)
    ?inference_event_summaries:(inference_event_summaries_ : inference_event_summaries option) () =
  ({ next_token = next_token_; inference_event_summaries = inference_event_summaries_ }
    : list_inference_events_response)

let make_list_inference_events_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_identifier)
    ~interval_start_time:(interval_start_time_ : timestamp)
    ~interval_end_time:(interval_end_time_ : timestamp) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     inference_scheduler_name = inference_scheduler_name_;
     interval_start_time = interval_start_time_;
     interval_end_time = interval_end_time_;
   }
    : list_inference_events_request)

let make_dataset_summary ?dataset_name:(dataset_name_ : dataset_name option)
    ?dataset_arn:(dataset_arn_ : dataset_arn option) ?status:(status_ : dataset_status option)
    ?created_at:(created_at_ : timestamp option) () =
  ({
     dataset_name = dataset_name_;
     dataset_arn = dataset_arn_;
     status = status_;
     created_at = created_at_;
   }
    : dataset_summary)

let make_list_datasets_response ?next_token:(next_token_ : next_token option)
    ?dataset_summaries:(dataset_summaries_ : dataset_summaries option) () =
  ({ next_token = next_token_; dataset_summaries = dataset_summaries_ } : list_datasets_response)

let make_list_datasets_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?dataset_name_begins_with:(dataset_name_begins_with_ : dataset_name option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     dataset_name_begins_with = dataset_name_begins_with_;
   }
    : list_datasets_request)

let make_data_ingestion_job_summary ?job_id:(job_id_ : ingestion_job_id option)
    ?dataset_name:(dataset_name_ : dataset_name option)
    ?dataset_arn:(dataset_arn_ : dataset_arn option)
    ?ingestion_input_configuration:
      (ingestion_input_configuration_ : ingestion_input_configuration option)
    ?status:(status_ : ingestion_job_status option) () =
  ({
     job_id = job_id_;
     dataset_name = dataset_name_;
     dataset_arn = dataset_arn_;
     ingestion_input_configuration = ingestion_input_configuration_;
     status = status_;
   }
    : data_ingestion_job_summary)

let make_list_data_ingestion_jobs_response ?next_token:(next_token_ : next_token option)
    ?data_ingestion_job_summaries:
      (data_ingestion_job_summaries_ : data_ingestion_job_summaries option) () =
  ({ next_token = next_token_; data_ingestion_job_summaries = data_ingestion_job_summaries_ }
    : list_data_ingestion_jobs_response)

let make_list_data_ingestion_jobs_request ?dataset_name:(dataset_name_ : dataset_name option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?status:(status_ : ingestion_job_status option) () =
  ({
     dataset_name = dataset_name_;
     next_token = next_token_;
     max_results = max_results_;
     status = status_;
   }
    : list_data_ingestion_jobs_request)

let make_import_model_version_response ?model_name:(model_name_ : model_name option)
    ?model_arn:(model_arn_ : model_arn option)
    ?model_version_arn:(model_version_arn_ : model_version_arn option)
    ?model_version:(model_version_ : model_version option)
    ?status:(status_ : model_version_status option) () =
  ({
     model_name = model_name_;
     model_arn = model_arn_;
     model_version_arn = model_version_arn_;
     model_version = model_version_;
     status = status_;
   }
    : import_model_version_response)

let make_import_model_version_request ?model_name:(model_name_ : model_name option)
    ?labels_input_configuration:(labels_input_configuration_ : labels_input_configuration option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : name_or_arn option)
    ?tags:(tags_ : tag_list option)
    ?inference_data_import_strategy:
      (inference_data_import_strategy_ : inference_data_import_strategy option)
    ~source_model_version_arn:(source_model_version_arn_ : model_version_arn)
    ~dataset_name:(dataset_name_ : dataset_identifier)
    ~client_token:(client_token_ : idempotence_token) () =
  ({
     source_model_version_arn = source_model_version_arn_;
     model_name = model_name_;
     dataset_name = dataset_name_;
     labels_input_configuration = labels_input_configuration_;
     client_token = client_token_;
     role_arn = role_arn_;
     server_side_kms_key_id = server_side_kms_key_id_;
     tags = tags_;
     inference_data_import_strategy = inference_data_import_strategy_;
   }
    : import_model_version_request)

let make_import_dataset_response ?dataset_name:(dataset_name_ : dataset_name option)
    ?dataset_arn:(dataset_arn_ : dataset_arn option) ?status:(status_ : dataset_status option)
    ?job_id:(job_id_ : ingestion_job_id option) () =
  ({ dataset_name = dataset_name_; dataset_arn = dataset_arn_; status = status_; job_id = job_id_ }
    : import_dataset_response)

let make_import_dataset_request ?dataset_name:(dataset_name_ : dataset_name option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : name_or_arn option)
    ?tags:(tags_ : tag_list option) ~source_dataset_arn:(source_dataset_arn_ : dataset_arn)
    ~client_token:(client_token_ : idempotence_token) () =
  ({
     source_dataset_arn = source_dataset_arn_;
     dataset_name = dataset_name_;
     client_token = client_token_;
     server_side_kms_key_id = server_side_kms_key_id_;
     tags = tags_;
   }
    : import_dataset_request)

let make_describe_retraining_scheduler_response ?model_name:(model_name_ : model_name option)
    ?model_arn:(model_arn_ : model_arn option)
    ?retraining_start_date:(retraining_start_date_ : timestamp option)
    ?retraining_frequency:(retraining_frequency_ : retraining_frequency option)
    ?lookback_window:(lookback_window_ : lookback_window option)
    ?status:(status_ : retraining_scheduler_status option)
    ?promote_mode:(promote_mode_ : model_promote_mode option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option) () =
  ({
     model_name = model_name_;
     model_arn = model_arn_;
     retraining_start_date = retraining_start_date_;
     retraining_frequency = retraining_frequency_;
     lookback_window = lookback_window_;
     status = status_;
     promote_mode = promote_mode_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : describe_retraining_scheduler_response)

let make_describe_retraining_scheduler_request ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : describe_retraining_scheduler_request)

let make_describe_resource_policy_response
    ?policy_revision_id:(policy_revision_id_ : policy_revision_id option)
    ?resource_policy:(resource_policy_ : policy option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option) () =
  ({
     policy_revision_id = policy_revision_id_;
     resource_policy = resource_policy_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : describe_resource_policy_response)

let make_describe_resource_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : describe_resource_policy_request)

let make_data_pre_processing_configuration
    ?target_sampling_rate:(target_sampling_rate_ : target_sampling_rate option) () =
  ({ target_sampling_rate = target_sampling_rate_ } : data_pre_processing_configuration)

let make_describe_model_version_response ?model_name:(model_name_ : model_name option)
    ?model_arn:(model_arn_ : model_arn option)
    ?model_version:(model_version_ : model_version option)
    ?model_version_arn:(model_version_arn_ : model_version_arn option)
    ?status:(status_ : model_version_status option)
    ?source_type:(source_type_ : model_version_source_type option)
    ?dataset_name:(dataset_name_ : dataset_name option)
    ?dataset_arn:(dataset_arn_ : dataset_arn option) ?schema:(schema_ : inline_data_schema option)
    ?labels_input_configuration:(labels_input_configuration_ : labels_input_configuration option)
    ?training_data_start_time:(training_data_start_time_ : timestamp option)
    ?training_data_end_time:(training_data_end_time_ : timestamp option)
    ?evaluation_data_start_time:(evaluation_data_start_time_ : timestamp option)
    ?evaluation_data_end_time:(evaluation_data_end_time_ : timestamp option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?data_pre_processing_configuration:
      (data_pre_processing_configuration_ : data_pre_processing_configuration option)
    ?training_execution_start_time:(training_execution_start_time_ : timestamp option)
    ?training_execution_end_time:(training_execution_end_time_ : timestamp option)
    ?failed_reason:(failed_reason_ : bounded_length_string option)
    ?model_metrics:(model_metrics_ : model_metrics option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : kms_key_arn option)
    ?off_condition:(off_condition_ : off_condition option)
    ?source_model_version_arn:(source_model_version_arn_ : model_version_arn option)
    ?import_job_start_time:(import_job_start_time_ : timestamp option)
    ?import_job_end_time:(import_job_end_time_ : timestamp option)
    ?imported_data_size_in_bytes:(imported_data_size_in_bytes_ : data_size_in_bytes option)
    ?prior_model_metrics:(prior_model_metrics_ : model_metrics option)
    ?retraining_available_data_in_days:(retraining_available_data_in_days_ : integer option)
    ?auto_promotion_result:(auto_promotion_result_ : auto_promotion_result option)
    ?auto_promotion_result_reason:
      (auto_promotion_result_reason_ : auto_promotion_result_reason option)
    ?model_diagnostics_output_configuration:
      (model_diagnostics_output_configuration_ : model_diagnostics_output_configuration option)
    ?model_diagnostics_results_object:(model_diagnostics_results_object_ : s3_object option)
    ?model_quality:(model_quality_ : model_quality option) () =
  ({
     model_name = model_name_;
     model_arn = model_arn_;
     model_version = model_version_;
     model_version_arn = model_version_arn_;
     status = status_;
     source_type = source_type_;
     dataset_name = dataset_name_;
     dataset_arn = dataset_arn_;
     schema = schema_;
     labels_input_configuration = labels_input_configuration_;
     training_data_start_time = training_data_start_time_;
     training_data_end_time = training_data_end_time_;
     evaluation_data_start_time = evaluation_data_start_time_;
     evaluation_data_end_time = evaluation_data_end_time_;
     role_arn = role_arn_;
     data_pre_processing_configuration = data_pre_processing_configuration_;
     training_execution_start_time = training_execution_start_time_;
     training_execution_end_time = training_execution_end_time_;
     failed_reason = failed_reason_;
     model_metrics = model_metrics_;
     last_updated_time = last_updated_time_;
     created_at = created_at_;
     server_side_kms_key_id = server_side_kms_key_id_;
     off_condition = off_condition_;
     source_model_version_arn = source_model_version_arn_;
     import_job_start_time = import_job_start_time_;
     import_job_end_time = import_job_end_time_;
     imported_data_size_in_bytes = imported_data_size_in_bytes_;
     prior_model_metrics = prior_model_metrics_;
     retraining_available_data_in_days = retraining_available_data_in_days_;
     auto_promotion_result = auto_promotion_result_;
     auto_promotion_result_reason = auto_promotion_result_reason_;
     model_diagnostics_output_configuration = model_diagnostics_output_configuration_;
     model_diagnostics_results_object = model_diagnostics_results_object_;
     model_quality = model_quality_;
   }
    : describe_model_version_response)

let make_describe_model_version_request ~model_name:(model_name_ : model_name)
    ~model_version:(model_version_ : model_version) () =
  ({ model_name = model_name_; model_version = model_version_ } : describe_model_version_request)

let make_describe_model_response ?model_name:(model_name_ : model_name option)
    ?model_arn:(model_arn_ : model_arn option) ?dataset_name:(dataset_name_ : dataset_name option)
    ?dataset_arn:(dataset_arn_ : dataset_arn option)
    ?schema:(schema_ : synthesized_json_inline_data_schema option)
    ?labels_input_configuration:(labels_input_configuration_ : labels_input_configuration option)
    ?training_data_start_time:(training_data_start_time_ : timestamp option)
    ?training_data_end_time:(training_data_end_time_ : timestamp option)
    ?evaluation_data_start_time:(evaluation_data_start_time_ : timestamp option)
    ?evaluation_data_end_time:(evaluation_data_end_time_ : timestamp option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?data_pre_processing_configuration:
      (data_pre_processing_configuration_ : data_pre_processing_configuration option)
    ?status:(status_ : model_status option)
    ?training_execution_start_time:(training_execution_start_time_ : timestamp option)
    ?training_execution_end_time:(training_execution_end_time_ : timestamp option)
    ?failed_reason:(failed_reason_ : bounded_length_string option)
    ?model_metrics:(model_metrics_ : synthesized_json_model_metrics option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : kms_key_arn option)
    ?off_condition:(off_condition_ : off_condition option)
    ?source_model_version_arn:(source_model_version_arn_ : model_version_arn option)
    ?import_job_start_time:(import_job_start_time_ : timestamp option)
    ?import_job_end_time:(import_job_end_time_ : timestamp option)
    ?active_model_version:(active_model_version_ : model_version option)
    ?active_model_version_arn:(active_model_version_arn_ : model_version_arn option)
    ?model_version_activated_at:(model_version_activated_at_ : timestamp option)
    ?previous_active_model_version:(previous_active_model_version_ : model_version option)
    ?previous_active_model_version_arn:
      (previous_active_model_version_arn_ : model_version_arn option)
    ?previous_model_version_activated_at:(previous_model_version_activated_at_ : timestamp option)
    ?prior_model_metrics:(prior_model_metrics_ : synthesized_json_model_metrics option)
    ?latest_scheduled_retraining_failed_reason:
      (latest_scheduled_retraining_failed_reason_ : bounded_length_string option)
    ?latest_scheduled_retraining_status:
      (latest_scheduled_retraining_status_ : model_version_status option)
    ?latest_scheduled_retraining_model_version:
      (latest_scheduled_retraining_model_version_ : model_version option)
    ?latest_scheduled_retraining_start_time:
      (latest_scheduled_retraining_start_time_ : timestamp option)
    ?latest_scheduled_retraining_available_data_in_days:
      (latest_scheduled_retraining_available_data_in_days_ : integer option)
    ?next_scheduled_retraining_start_date:(next_scheduled_retraining_start_date_ : timestamp option)
    ?accumulated_inference_data_start_time:
      (accumulated_inference_data_start_time_ : timestamp option)
    ?accumulated_inference_data_end_time:(accumulated_inference_data_end_time_ : timestamp option)
    ?retraining_scheduler_status:(retraining_scheduler_status_ : retraining_scheduler_status option)
    ?model_diagnostics_output_configuration:
      (model_diagnostics_output_configuration_ : model_diagnostics_output_configuration option)
    ?model_quality:(model_quality_ : model_quality option) () =
  ({
     model_name = model_name_;
     model_arn = model_arn_;
     dataset_name = dataset_name_;
     dataset_arn = dataset_arn_;
     schema = schema_;
     labels_input_configuration = labels_input_configuration_;
     training_data_start_time = training_data_start_time_;
     training_data_end_time = training_data_end_time_;
     evaluation_data_start_time = evaluation_data_start_time_;
     evaluation_data_end_time = evaluation_data_end_time_;
     role_arn = role_arn_;
     data_pre_processing_configuration = data_pre_processing_configuration_;
     status = status_;
     training_execution_start_time = training_execution_start_time_;
     training_execution_end_time = training_execution_end_time_;
     failed_reason = failed_reason_;
     model_metrics = model_metrics_;
     last_updated_time = last_updated_time_;
     created_at = created_at_;
     server_side_kms_key_id = server_side_kms_key_id_;
     off_condition = off_condition_;
     source_model_version_arn = source_model_version_arn_;
     import_job_start_time = import_job_start_time_;
     import_job_end_time = import_job_end_time_;
     active_model_version = active_model_version_;
     active_model_version_arn = active_model_version_arn_;
     model_version_activated_at = model_version_activated_at_;
     previous_active_model_version = previous_active_model_version_;
     previous_active_model_version_arn = previous_active_model_version_arn_;
     previous_model_version_activated_at = previous_model_version_activated_at_;
     prior_model_metrics = prior_model_metrics_;
     latest_scheduled_retraining_failed_reason = latest_scheduled_retraining_failed_reason_;
     latest_scheduled_retraining_status = latest_scheduled_retraining_status_;
     latest_scheduled_retraining_model_version = latest_scheduled_retraining_model_version_;
     latest_scheduled_retraining_start_time = latest_scheduled_retraining_start_time_;
     latest_scheduled_retraining_available_data_in_days =
       latest_scheduled_retraining_available_data_in_days_;
     next_scheduled_retraining_start_date = next_scheduled_retraining_start_date_;
     accumulated_inference_data_start_time = accumulated_inference_data_start_time_;
     accumulated_inference_data_end_time = accumulated_inference_data_end_time_;
     retraining_scheduler_status = retraining_scheduler_status_;
     model_diagnostics_output_configuration = model_diagnostics_output_configuration_;
     model_quality = model_quality_;
   }
    : describe_model_response)

let make_describe_model_request ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : describe_model_request)

let make_describe_label_group_response
    ?label_group_name:(label_group_name_ : label_group_name option)
    ?label_group_arn:(label_group_arn_ : label_group_arn option)
    ?fault_codes:(fault_codes_ : fault_codes option) ?created_at:(created_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option) () =
  ({
     label_group_name = label_group_name_;
     label_group_arn = label_group_arn_;
     fault_codes = fault_codes_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : describe_label_group_response)

let make_describe_label_group_request ~label_group_name:(label_group_name_ : label_group_name) () =
  ({ label_group_name = label_group_name_ } : describe_label_group_request)

let make_describe_label_response ?label_group_name:(label_group_name_ : label_group_name option)
    ?label_group_arn:(label_group_arn_ : label_group_arn option)
    ?label_id:(label_id_ : label_id option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?rating:(rating_ : label_rating option)
    ?fault_code:(fault_code_ : fault_code option) ?notes:(notes_ : comments option)
    ?equipment:(equipment_ : equipment option) ?created_at:(created_at_ : timestamp option) () =
  ({
     label_group_name = label_group_name_;
     label_group_arn = label_group_arn_;
     label_id = label_id_;
     start_time = start_time_;
     end_time = end_time_;
     rating = rating_;
     fault_code = fault_code_;
     notes = notes_;
     equipment = equipment_;
     created_at = created_at_;
   }
    : describe_label_response)

let make_describe_label_request ~label_group_name:(label_group_name_ : label_group_name)
    ~label_id:(label_id_ : label_id) () =
  ({ label_group_name = label_group_name_; label_id = label_id_ } : describe_label_request)

let make_describe_inference_scheduler_response ?model_arn:(model_arn_ : model_arn option)
    ?model_name:(model_name_ : model_name option)
    ?inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_name option)
    ?inference_scheduler_arn:(inference_scheduler_arn_ : inference_scheduler_arn option)
    ?status:(status_ : inference_scheduler_status option)
    ?data_delay_offset_in_minutes:
      (data_delay_offset_in_minutes_ : data_delay_offset_in_minutes option)
    ?data_upload_frequency:(data_upload_frequency_ : data_upload_frequency option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?data_input_configuration:(data_input_configuration_ : inference_input_configuration option)
    ?data_output_configuration:(data_output_configuration_ : inference_output_configuration option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : kms_key_arn option)
    ?latest_inference_result:(latest_inference_result_ : latest_inference_result option) () =
  ({
     model_arn = model_arn_;
     model_name = model_name_;
     inference_scheduler_name = inference_scheduler_name_;
     inference_scheduler_arn = inference_scheduler_arn_;
     status = status_;
     data_delay_offset_in_minutes = data_delay_offset_in_minutes_;
     data_upload_frequency = data_upload_frequency_;
     created_at = created_at_;
     updated_at = updated_at_;
     data_input_configuration = data_input_configuration_;
     data_output_configuration = data_output_configuration_;
     role_arn = role_arn_;
     server_side_kms_key_id = server_side_kms_key_id_;
     latest_inference_result = latest_inference_result_;
   }
    : describe_inference_scheduler_response)

let make_describe_inference_scheduler_request
    ~inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_identifier) () =
  ({ inference_scheduler_name = inference_scheduler_name_ } : describe_inference_scheduler_request)

let make_ingested_files_summary ?discarded_files:(discarded_files_ : list_of_discarded_files option)
    ~total_number_of_files:(total_number_of_files_ : integer)
    ~ingested_number_of_files:(ingested_number_of_files_ : integer) () =
  ({
     total_number_of_files = total_number_of_files_;
     ingested_number_of_files = ingested_number_of_files_;
     discarded_files = discarded_files_;
   }
    : ingested_files_summary)

let make_duplicate_timestamps
    ~total_number_of_duplicate_timestamps:(total_number_of_duplicate_timestamps_ : integer) () =
  ({ total_number_of_duplicate_timestamps = total_number_of_duplicate_timestamps_ }
    : duplicate_timestamps)

let make_unsupported_timestamps
    ~total_number_of_unsupported_timestamps:(total_number_of_unsupported_timestamps_ : integer) () =
  ({ total_number_of_unsupported_timestamps = total_number_of_unsupported_timestamps_ }
    : unsupported_timestamps)

let make_invalid_sensor_data ~affected_sensor_count:(affected_sensor_count_ : integer)
    ~total_number_of_invalid_values:(total_number_of_invalid_values_ : integer) () =
  ({
     affected_sensor_count = affected_sensor_count_;
     total_number_of_invalid_values = total_number_of_invalid_values_;
   }
    : invalid_sensor_data)

let make_missing_sensor_data ~affected_sensor_count:(affected_sensor_count_ : integer)
    ~total_number_of_missing_values:(total_number_of_missing_values_ : integer) () =
  ({
     affected_sensor_count = affected_sensor_count_;
     total_number_of_missing_values = total_number_of_missing_values_;
   }
    : missing_sensor_data)

let make_sensors_with_short_date_range ~affected_sensor_count:(affected_sensor_count_ : integer) ()
    =
  ({ affected_sensor_count = affected_sensor_count_ } : sensors_with_short_date_range)

let make_missing_complete_sensor_data ~affected_sensor_count:(affected_sensor_count_ : integer) () =
  ({ affected_sensor_count = affected_sensor_count_ } : missing_complete_sensor_data)

let make_insufficient_sensor_data
    ~missing_complete_sensor_data:(missing_complete_sensor_data_ : missing_complete_sensor_data)
    ~sensors_with_short_date_range:(sensors_with_short_date_range_ : sensors_with_short_date_range)
    () =
  ({
     missing_complete_sensor_data = missing_complete_sensor_data_;
     sensors_with_short_date_range = sensors_with_short_date_range_;
   }
    : insufficient_sensor_data)

let make_data_quality_summary
    ~insufficient_sensor_data:(insufficient_sensor_data_ : insufficient_sensor_data)
    ~missing_sensor_data:(missing_sensor_data_ : missing_sensor_data)
    ~invalid_sensor_data:(invalid_sensor_data_ : invalid_sensor_data)
    ~unsupported_timestamps:(unsupported_timestamps_ : unsupported_timestamps)
    ~duplicate_timestamps:(duplicate_timestamps_ : duplicate_timestamps) () =
  ({
     insufficient_sensor_data = insufficient_sensor_data_;
     missing_sensor_data = missing_sensor_data_;
     invalid_sensor_data = invalid_sensor_data_;
     unsupported_timestamps = unsupported_timestamps_;
     duplicate_timestamps = duplicate_timestamps_;
   }
    : data_quality_summary)

let make_describe_dataset_response ?dataset_name:(dataset_name_ : dataset_name option)
    ?dataset_arn:(dataset_arn_ : dataset_arn option) ?created_at:(created_at_ : timestamp option)
    ?last_updated_at:(last_updated_at_ : timestamp option) ?status:(status_ : dataset_status option)
    ?schema:(schema_ : synthesized_json_inline_data_schema option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : kms_key_arn option)
    ?ingestion_input_configuration:
      (ingestion_input_configuration_ : ingestion_input_configuration option)
    ?data_quality_summary:(data_quality_summary_ : data_quality_summary option)
    ?ingested_files_summary:(ingested_files_summary_ : ingested_files_summary option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?data_start_time:(data_start_time_ : timestamp option)
    ?data_end_time:(data_end_time_ : timestamp option)
    ?source_dataset_arn:(source_dataset_arn_ : dataset_arn option) () =
  ({
     dataset_name = dataset_name_;
     dataset_arn = dataset_arn_;
     created_at = created_at_;
     last_updated_at = last_updated_at_;
     status = status_;
     schema = schema_;
     server_side_kms_key_id = server_side_kms_key_id_;
     ingestion_input_configuration = ingestion_input_configuration_;
     data_quality_summary = data_quality_summary_;
     ingested_files_summary = ingested_files_summary_;
     role_arn = role_arn_;
     data_start_time = data_start_time_;
     data_end_time = data_end_time_;
     source_dataset_arn = source_dataset_arn_;
   }
    : describe_dataset_response)

let make_describe_dataset_request ~dataset_name:(dataset_name_ : dataset_identifier) () =
  ({ dataset_name = dataset_name_ } : describe_dataset_request)

let make_describe_data_ingestion_job_response ?job_id:(job_id_ : ingestion_job_id option)
    ?dataset_arn:(dataset_arn_ : dataset_arn option)
    ?ingestion_input_configuration:
      (ingestion_input_configuration_ : ingestion_input_configuration option)
    ?role_arn:(role_arn_ : iam_role_arn option) ?created_at:(created_at_ : timestamp option)
    ?status:(status_ : ingestion_job_status option)
    ?failed_reason:(failed_reason_ : bounded_length_string option)
    ?data_quality_summary:(data_quality_summary_ : data_quality_summary option)
    ?ingested_files_summary:(ingested_files_summary_ : ingested_files_summary option)
    ?status_detail:(status_detail_ : bounded_length_string option)
    ?ingested_data_size:(ingested_data_size_ : data_size_in_bytes option)
    ?data_start_time:(data_start_time_ : timestamp option)
    ?data_end_time:(data_end_time_ : timestamp option)
    ?source_dataset_arn:(source_dataset_arn_ : dataset_arn option) () =
  ({
     job_id = job_id_;
     dataset_arn = dataset_arn_;
     ingestion_input_configuration = ingestion_input_configuration_;
     role_arn = role_arn_;
     created_at = created_at_;
     status = status_;
     failed_reason = failed_reason_;
     data_quality_summary = data_quality_summary_;
     ingested_files_summary = ingested_files_summary_;
     status_detail = status_detail_;
     ingested_data_size = ingested_data_size_;
     data_start_time = data_start_time_;
     data_end_time = data_end_time_;
     source_dataset_arn = source_dataset_arn_;
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

let make_delete_label_group_request ~label_group_name:(label_group_name_ : label_group_name) () =
  ({ label_group_name = label_group_name_ } : delete_label_group_request)

let make_delete_label_request ~label_group_name:(label_group_name_ : label_group_name)
    ~label_id:(label_id_ : label_id) () =
  ({ label_group_name = label_group_name_; label_id = label_id_ } : delete_label_request)

let make_delete_inference_scheduler_request
    ~inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_identifier) () =
  ({ inference_scheduler_name = inference_scheduler_name_ } : delete_inference_scheduler_request)

let make_delete_dataset_request ~dataset_name:(dataset_name_ : dataset_identifier) () =
  ({ dataset_name = dataset_name_ } : delete_dataset_request)

let make_create_retraining_scheduler_response ?model_name:(model_name_ : model_name option)
    ?model_arn:(model_arn_ : model_arn option)
    ?status:(status_ : retraining_scheduler_status option) () =
  ({ model_name = model_name_; model_arn = model_arn_; status = status_ }
    : create_retraining_scheduler_response)

let make_create_retraining_scheduler_request
    ?retraining_start_date:(retraining_start_date_ : timestamp option)
    ?promote_mode:(promote_mode_ : model_promote_mode option) ~model_name:(model_name_ : model_name)
    ~retraining_frequency:(retraining_frequency_ : retraining_frequency)
    ~lookback_window:(lookback_window_ : lookback_window)
    ~client_token:(client_token_ : idempotence_token) () =
  ({
     model_name = model_name_;
     retraining_start_date = retraining_start_date_;
     retraining_frequency = retraining_frequency_;
     lookback_window = lookback_window_;
     promote_mode = promote_mode_;
     client_token = client_token_;
   }
    : create_retraining_scheduler_request)

let make_create_model_response ?model_arn:(model_arn_ : model_arn option)
    ?status:(status_ : model_status option) () =
  ({ model_arn = model_arn_; status = status_ } : create_model_response)

let make_dataset_schema
    ?inline_data_schema:(inline_data_schema_ : synthesized_json_inline_data_schema option) () =
  ({ inline_data_schema = inline_data_schema_ } : dataset_schema)

let make_create_model_request ?dataset_schema:(dataset_schema_ : dataset_schema option)
    ?labels_input_configuration:(labels_input_configuration_ : labels_input_configuration option)
    ?training_data_start_time:(training_data_start_time_ : timestamp option)
    ?training_data_end_time:(training_data_end_time_ : timestamp option)
    ?evaluation_data_start_time:(evaluation_data_start_time_ : timestamp option)
    ?evaluation_data_end_time:(evaluation_data_end_time_ : timestamp option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?data_pre_processing_configuration:
      (data_pre_processing_configuration_ : data_pre_processing_configuration option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : name_or_arn option)
    ?tags:(tags_ : tag_list option) ?off_condition:(off_condition_ : off_condition option)
    ?model_diagnostics_output_configuration:
      (model_diagnostics_output_configuration_ : model_diagnostics_output_configuration option)
    ~model_name:(model_name_ : model_name) ~dataset_name:(dataset_name_ : dataset_identifier)
    ~client_token:(client_token_ : idempotence_token) () =
  ({
     model_name = model_name_;
     dataset_name = dataset_name_;
     dataset_schema = dataset_schema_;
     labels_input_configuration = labels_input_configuration_;
     client_token = client_token_;
     training_data_start_time = training_data_start_time_;
     training_data_end_time = training_data_end_time_;
     evaluation_data_start_time = evaluation_data_start_time_;
     evaluation_data_end_time = evaluation_data_end_time_;
     role_arn = role_arn_;
     data_pre_processing_configuration = data_pre_processing_configuration_;
     server_side_kms_key_id = server_side_kms_key_id_;
     tags = tags_;
     off_condition = off_condition_;
     model_diagnostics_output_configuration = model_diagnostics_output_configuration_;
   }
    : create_model_request)

let make_create_label_group_response ?label_group_name:(label_group_name_ : label_group_name option)
    ?label_group_arn:(label_group_arn_ : label_group_arn option) () =
  ({ label_group_name = label_group_name_; label_group_arn = label_group_arn_ }
    : create_label_group_response)

let make_create_label_group_request ?fault_codes:(fault_codes_ : fault_codes option)
    ?tags:(tags_ : tag_list option) ~label_group_name:(label_group_name_ : label_group_name)
    ~client_token:(client_token_ : idempotence_token) () =
  ({
     label_group_name = label_group_name_;
     fault_codes = fault_codes_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_label_group_request)

let make_create_label_response ?label_id:(label_id_ : label_id option) () =
  ({ label_id = label_id_ } : create_label_response)

let make_create_label_request ?fault_code:(fault_code_ : fault_code option)
    ?notes:(notes_ : comments option) ?equipment:(equipment_ : equipment option)
    ~label_group_name:(label_group_name_ : label_group_name) ~start_time:(start_time_ : timestamp)
    ~end_time:(end_time_ : timestamp) ~rating:(rating_ : label_rating)
    ~client_token:(client_token_ : idempotence_token) () =
  ({
     label_group_name = label_group_name_;
     start_time = start_time_;
     end_time = end_time_;
     rating = rating_;
     fault_code = fault_code_;
     notes = notes_;
     equipment = equipment_;
     client_token = client_token_;
   }
    : create_label_request)

let make_create_inference_scheduler_response
    ?inference_scheduler_arn:(inference_scheduler_arn_ : inference_scheduler_arn option)
    ?inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_name option)
    ?status:(status_ : inference_scheduler_status option)
    ?model_quality:(model_quality_ : model_quality option) () =
  ({
     inference_scheduler_arn = inference_scheduler_arn_;
     inference_scheduler_name = inference_scheduler_name_;
     status = status_;
     model_quality = model_quality_;
   }
    : create_inference_scheduler_response)

let make_create_inference_scheduler_request
    ?data_delay_offset_in_minutes:
      (data_delay_offset_in_minutes_ : data_delay_offset_in_minutes option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : name_or_arn option)
    ?tags:(tags_ : tag_list option) ~model_name:(model_name_ : model_name)
    ~inference_scheduler_name:(inference_scheduler_name_ : inference_scheduler_name)
    ~data_upload_frequency:(data_upload_frequency_ : data_upload_frequency)
    ~data_input_configuration:(data_input_configuration_ : inference_input_configuration)
    ~data_output_configuration:(data_output_configuration_ : inference_output_configuration)
    ~role_arn:(role_arn_ : iam_role_arn) ~client_token:(client_token_ : idempotence_token) () =
  ({
     model_name = model_name_;
     inference_scheduler_name = inference_scheduler_name_;
     data_delay_offset_in_minutes = data_delay_offset_in_minutes_;
     data_upload_frequency = data_upload_frequency_;
     data_input_configuration = data_input_configuration_;
     data_output_configuration = data_output_configuration_;
     role_arn = role_arn_;
     server_side_kms_key_id = server_side_kms_key_id_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_inference_scheduler_request)

let make_create_dataset_response ?dataset_name:(dataset_name_ : dataset_name option)
    ?dataset_arn:(dataset_arn_ : dataset_arn option) ?status:(status_ : dataset_status option) () =
  ({ dataset_name = dataset_name_; dataset_arn = dataset_arn_; status = status_ }
    : create_dataset_response)

let make_create_dataset_request ?dataset_schema:(dataset_schema_ : dataset_schema option)
    ?server_side_kms_key_id:(server_side_kms_key_id_ : name_or_arn option)
    ?tags:(tags_ : tag_list option) ~dataset_name:(dataset_name_ : dataset_name)
    ~client_token:(client_token_ : idempotence_token) () =
  ({
     dataset_name = dataset_name_;
     dataset_schema = dataset_schema_;
     server_side_kms_key_id = server_side_kms_key_id_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_dataset_request)
