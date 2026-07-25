open Types

let make_account_quota ?account_quota_name:(account_quota_name_ : string_ option)
    ?used:(used_ : long option) ?max:(max_ : long option) () =
  ({ account_quota_name = account_quota_name_; used = used_; max = max_ } : account_quota)

let make_add_tags_to_resource_response () = (() : unit)

let make_tag ?key:(key_ : string_ option) ?value:(value_ : string_ option)
    ?resource_arn:(resource_arn_ : string_ option) () =
  ({ key = key_; value = value_; resource_arn = resource_arn_ } : tag)

let make_add_tags_to_resource_message ~resource_arn:(resource_arn_ : string_)
    ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : add_tags_to_resource_message)

let make_update_subscriptions_to_event_bridge_response ?result_:(result__ : string_ option) () =
  ({ result_ = result__ } : update_subscriptions_to_event_bridge_response)

let make_update_subscriptions_to_event_bridge_message
    ?force_move:(force_move_ : boolean_optional option) () =
  ({ force_move = force_move_ } : update_subscriptions_to_event_bridge_message)

let make_connection ?replication_instance_arn:(replication_instance_arn_ : string_ option)
    ?endpoint_arn:(endpoint_arn_ : string_ option) ?status:(status_ : string_ option)
    ?last_failure_message:(last_failure_message_ : string_ option)
    ?endpoint_identifier:(endpoint_identifier_ : string_ option)
    ?replication_instance_identifier:(replication_instance_identifier_ : string_ option) () =
  ({
     replication_instance_arn = replication_instance_arn_;
     endpoint_arn = endpoint_arn_;
     status = status_;
     last_failure_message = last_failure_message_;
     endpoint_identifier = endpoint_identifier_;
     replication_instance_identifier = replication_instance_identifier_;
   }
    : connection)

let make_test_connection_response ?connection:(connection_ : connection option) () =
  ({ connection = connection_ } : test_connection_response)

let make_test_connection_message ~replication_instance_arn:(replication_instance_arn_ : string_)
    ~endpoint_arn:(endpoint_arn_ : string_) () =
  ({ replication_instance_arn = replication_instance_arn_; endpoint_arn = endpoint_arn_ }
    : test_connection_message)

let make_replication_task_stats
    ?full_load_progress_percent:(full_load_progress_percent_ : integer option)
    ?elapsed_time_millis:(elapsed_time_millis_ : long option)
    ?tables_loaded:(tables_loaded_ : integer option)
    ?tables_loading:(tables_loading_ : integer option)
    ?tables_queued:(tables_queued_ : integer option)
    ?tables_errored:(tables_errored_ : integer option)
    ?fresh_start_date:(fresh_start_date_ : t_stamp option)
    ?start_date:(start_date_ : t_stamp option) ?stop_date:(stop_date_ : t_stamp option)
    ?full_load_start_date:(full_load_start_date_ : t_stamp option)
    ?full_load_finish_date:(full_load_finish_date_ : t_stamp option) () =
  ({
     full_load_progress_percent = full_load_progress_percent_;
     elapsed_time_millis = elapsed_time_millis_;
     tables_loaded = tables_loaded_;
     tables_loading = tables_loading_;
     tables_queued = tables_queued_;
     tables_errored = tables_errored_;
     fresh_start_date = fresh_start_date_;
     start_date = start_date_;
     stop_date = stop_date_;
     full_load_start_date = full_load_start_date_;
     full_load_finish_date = full_load_finish_date_;
   }
    : replication_task_stats)

let make_replication_task
    ?replication_task_identifier:(replication_task_identifier_ : string_ option)
    ?source_endpoint_arn:(source_endpoint_arn_ : string_ option)
    ?target_endpoint_arn:(target_endpoint_arn_ : string_ option)
    ?replication_instance_arn:(replication_instance_arn_ : string_ option)
    ?migration_type:(migration_type_ : migration_type_value option)
    ?table_mappings:(table_mappings_ : string_ option)
    ?replication_task_settings:(replication_task_settings_ : string_ option)
    ?status:(status_ : string_ option)
    ?last_failure_message:(last_failure_message_ : string_ option)
    ?stop_reason:(stop_reason_ : string_ option)
    ?replication_task_creation_date:(replication_task_creation_date_ : t_stamp option)
    ?replication_task_start_date:(replication_task_start_date_ : t_stamp option)
    ?cdc_start_position:(cdc_start_position_ : string_ option)
    ?cdc_stop_position:(cdc_stop_position_ : string_ option)
    ?recovery_checkpoint:(recovery_checkpoint_ : string_ option)
    ?replication_task_arn:(replication_task_arn_ : string_ option)
    ?replication_task_stats:(replication_task_stats_ : replication_task_stats option)
    ?task_data:(task_data_ : string_ option)
    ?target_replication_instance_arn:(target_replication_instance_arn_ : string_ option) () =
  ({
     replication_task_identifier = replication_task_identifier_;
     source_endpoint_arn = source_endpoint_arn_;
     target_endpoint_arn = target_endpoint_arn_;
     replication_instance_arn = replication_instance_arn_;
     migration_type = migration_type_;
     table_mappings = table_mappings_;
     replication_task_settings = replication_task_settings_;
     status = status_;
     last_failure_message = last_failure_message_;
     stop_reason = stop_reason_;
     replication_task_creation_date = replication_task_creation_date_;
     replication_task_start_date = replication_task_start_date_;
     cdc_start_position = cdc_start_position_;
     cdc_stop_position = cdc_stop_position_;
     recovery_checkpoint = recovery_checkpoint_;
     replication_task_arn = replication_task_arn_;
     replication_task_stats = replication_task_stats_;
     task_data = task_data_;
     target_replication_instance_arn = target_replication_instance_arn_;
   }
    : replication_task)

let make_stop_replication_task_response
    ?replication_task:(replication_task_ : replication_task option) () =
  ({ replication_task = replication_task_ } : stop_replication_task_response)

let make_stop_replication_task_message ~replication_task_arn:(replication_task_arn_ : string_) () =
  ({ replication_task_arn = replication_task_arn_ } : stop_replication_task_message)

let make_replication_stats
    ?full_load_progress_percent:(full_load_progress_percent_ : integer option)
    ?elapsed_time_millis:(elapsed_time_millis_ : long option)
    ?tables_loaded:(tables_loaded_ : integer option)
    ?tables_loading:(tables_loading_ : integer option)
    ?tables_queued:(tables_queued_ : integer option)
    ?tables_errored:(tables_errored_ : integer option)
    ?fresh_start_date:(fresh_start_date_ : t_stamp option)
    ?start_date:(start_date_ : t_stamp option) ?stop_date:(stop_date_ : t_stamp option)
    ?full_load_start_date:(full_load_start_date_ : t_stamp option)
    ?full_load_finish_date:(full_load_finish_date_ : t_stamp option) () =
  ({
     full_load_progress_percent = full_load_progress_percent_;
     elapsed_time_millis = elapsed_time_millis_;
     tables_loaded = tables_loaded_;
     tables_loading = tables_loading_;
     tables_queued = tables_queued_;
     tables_errored = tables_errored_;
     fresh_start_date = fresh_start_date_;
     start_date = start_date_;
     stop_date = stop_date_;
     full_load_start_date = full_load_start_date_;
     full_load_finish_date = full_load_finish_date_;
   }
    : replication_stats)

let make_replication_task_assessment_run_result_statistic ?passed:(passed_ : integer option)
    ?failed:(failed_ : integer option) ?error:(error_ : integer option)
    ?warning:(warning_ : integer option) ?cancelled:(cancelled_ : integer option)
    ?skipped:(skipped_ : integer option) () =
  ({
     passed = passed_;
     failed = failed_;
     error = error_;
     warning = warning_;
     cancelled = cancelled_;
     skipped = skipped_;
   }
    : replication_task_assessment_run_result_statistic)

let make_replication_task_assessment_run_progress
    ?individual_assessment_count:(individual_assessment_count_ : integer option)
    ?individual_assessment_completed_count:(individual_assessment_completed_count_ : integer option)
    () =
  ({
     individual_assessment_count = individual_assessment_count_;
     individual_assessment_completed_count = individual_assessment_completed_count_;
   }
    : replication_task_assessment_run_progress)

let make_premigration_assessment_status
    ?premigration_assessment_run_arn:(premigration_assessment_run_arn_ : string_ option)
    ?fail_on_assessment_failure:(fail_on_assessment_failure_ : boolean_ option)
    ?status:(status_ : string_ option)
    ?premigration_assessment_run_creation_date:
      (premigration_assessment_run_creation_date_ : t_stamp option)
    ?assessment_progress:(assessment_progress_ : replication_task_assessment_run_progress option)
    ?last_failure_message:(last_failure_message_ : string_ option)
    ?result_location_bucket:(result_location_bucket_ : string_ option)
    ?result_location_folder:(result_location_folder_ : string_ option)
    ?result_encryption_mode:(result_encryption_mode_ : string_ option)
    ?result_kms_key_arn:(result_kms_key_arn_ : string_ option)
    ?result_statistic:(result_statistic_ : replication_task_assessment_run_result_statistic option)
    () =
  ({
     premigration_assessment_run_arn = premigration_assessment_run_arn_;
     fail_on_assessment_failure = fail_on_assessment_failure_;
     status = status_;
     premigration_assessment_run_creation_date = premigration_assessment_run_creation_date_;
     assessment_progress = assessment_progress_;
     last_failure_message = last_failure_message_;
     result_location_bucket = result_location_bucket_;
     result_location_folder = result_location_folder_;
     result_encryption_mode = result_encryption_mode_;
     result_kms_key_arn = result_kms_key_arn_;
     result_statistic = result_statistic_;
   }
    : premigration_assessment_status)

let make_provision_data ?provision_state:(provision_state_ : string_ option)
    ?provisioned_capacity_units:(provisioned_capacity_units_ : integer option)
    ?date_provisioned:(date_provisioned_ : t_stamp option)
    ?is_new_provisioning_available:(is_new_provisioning_available_ : boolean_ option)
    ?date_new_provisioning_data_available:(date_new_provisioning_data_available_ : t_stamp option)
    ?reason_for_new_provisioning_data:(reason_for_new_provisioning_data_ : string_ option) () =
  ({
     provision_state = provision_state_;
     provisioned_capacity_units = provisioned_capacity_units_;
     date_provisioned = date_provisioned_;
     is_new_provisioning_available = is_new_provisioning_available_;
     date_new_provisioning_data_available = date_new_provisioning_data_available_;
     reason_for_new_provisioning_data = reason_for_new_provisioning_data_;
   }
    : provision_data)

let make_replication
    ?replication_config_identifier:(replication_config_identifier_ : string_ option)
    ?replication_config_arn:(replication_config_arn_ : string_ option)
    ?source_endpoint_arn:(source_endpoint_arn_ : string_ option)
    ?target_endpoint_arn:(target_endpoint_arn_ : string_ option)
    ?replication_type:(replication_type_ : migration_type_value option)
    ?status:(status_ : string_ option) ?provision_data:(provision_data_ : provision_data option)
    ?premigration_assessment_statuses:
      (premigration_assessment_statuses_ : premigration_assessment_status_list option)
    ?stop_reason:(stop_reason_ : string_ option)
    ?failure_messages:(failure_messages_ : string_list option)
    ?replication_stats:(replication_stats_ : replication_stats option)
    ?start_replication_type:(start_replication_type_ : string_ option)
    ?cdc_start_time:(cdc_start_time_ : t_stamp option)
    ?cdc_start_position:(cdc_start_position_ : string_ option)
    ?cdc_stop_position:(cdc_stop_position_ : string_ option)
    ?recovery_checkpoint:(recovery_checkpoint_ : string_ option)
    ?replication_create_time:(replication_create_time_ : t_stamp option)
    ?replication_update_time:(replication_update_time_ : t_stamp option)
    ?replication_last_stop_time:(replication_last_stop_time_ : t_stamp option)
    ?replication_deprovision_time:(replication_deprovision_time_ : t_stamp option)
    ?is_read_only:(is_read_only_ : boolean_optional option) () =
  ({
     replication_config_identifier = replication_config_identifier_;
     replication_config_arn = replication_config_arn_;
     source_endpoint_arn = source_endpoint_arn_;
     target_endpoint_arn = target_endpoint_arn_;
     replication_type = replication_type_;
     status = status_;
     provision_data = provision_data_;
     premigration_assessment_statuses = premigration_assessment_statuses_;
     stop_reason = stop_reason_;
     failure_messages = failure_messages_;
     replication_stats = replication_stats_;
     start_replication_type = start_replication_type_;
     cdc_start_time = cdc_start_time_;
     cdc_start_position = cdc_start_position_;
     cdc_stop_position = cdc_stop_position_;
     recovery_checkpoint = recovery_checkpoint_;
     replication_create_time = replication_create_time_;
     replication_update_time = replication_update_time_;
     replication_last_stop_time = replication_last_stop_time_;
     replication_deprovision_time = replication_deprovision_time_;
     is_read_only = is_read_only_;
   }
    : replication)

let make_stop_replication_response ?replication:(replication_ : replication option) () =
  ({ replication = replication_ } : stop_replication_response)

let make_stop_replication_message ~replication_config_arn:(replication_config_arn_ : string_) () =
  ({ replication_config_arn = replication_config_arn_ } : stop_replication_message)

let make_data_migration_statistics ?tables_loaded:(tables_loaded_ : integer option)
    ?elapsed_time_millis:(elapsed_time_millis_ : long option)
    ?tables_loading:(tables_loading_ : integer option)
    ?full_load_percentage:(full_load_percentage_ : integer option)
    ?cdc_latency:(cdc_latency_ : integer option) ?tables_queued:(tables_queued_ : integer option)
    ?tables_errored:(tables_errored_ : integer option)
    ?start_time:(start_time_ : iso8601_date_time option)
    ?stop_time:(stop_time_ : iso8601_date_time option) () =
  ({
     tables_loaded = tables_loaded_;
     elapsed_time_millis = elapsed_time_millis_;
     tables_loading = tables_loading_;
     full_load_percentage = full_load_percentage_;
     cdc_latency = cdc_latency_;
     tables_queued = tables_queued_;
     tables_errored = tables_errored_;
     start_time = start_time_;
     stop_time = stop_time_;
   }
    : data_migration_statistics)

let make_target_data_setting
    ?table_preparation_mode:(table_preparation_mode_ : table_preparation_mode option) () =
  ({ table_preparation_mode = table_preparation_mode_ } : target_data_setting)

let make_source_data_setting ?cdc_start_position:(cdc_start_position_ : string_ option)
    ?cdc_start_time:(cdc_start_time_ : iso8601_date_time option)
    ?cdc_stop_time:(cdc_stop_time_ : iso8601_date_time option)
    ?slot_name:(slot_name_ : string_ option) () =
  ({
     cdc_start_position = cdc_start_position_;
     cdc_start_time = cdc_start_time_;
     cdc_stop_time = cdc_stop_time_;
     slot_name = slot_name_;
   }
    : source_data_setting)

let make_data_migration_settings ?number_of_jobs:(number_of_jobs_ : integer_optional option)
    ?cloudwatch_logs_enabled:(cloudwatch_logs_enabled_ : boolean_optional option)
    ?selection_rules:(selection_rules_ : secret_string option) () =
  ({
     number_of_jobs = number_of_jobs_;
     cloudwatch_logs_enabled = cloudwatch_logs_enabled_;
     selection_rules = selection_rules_;
   }
    : data_migration_settings)

let make_data_migration ?data_migration_name:(data_migration_name_ : string_ option)
    ?data_migration_arn:(data_migration_arn_ : string_ option)
    ?data_migration_create_time:(data_migration_create_time_ : iso8601_date_time option)
    ?data_migration_start_time:(data_migration_start_time_ : iso8601_date_time option)
    ?data_migration_end_time:(data_migration_end_time_ : iso8601_date_time option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?migration_project_arn:(migration_project_arn_ : string_ option)
    ?data_migration_type:(data_migration_type_ : migration_type_value option)
    ?data_migration_settings:(data_migration_settings_ : data_migration_settings option)
    ?source_data_settings:(source_data_settings_ : source_data_settings option)
    ?target_data_settings:(target_data_settings_ : target_data_settings option)
    ?data_migration_statistics:(data_migration_statistics_ : data_migration_statistics option)
    ?data_migration_status:(data_migration_status_ : string_ option)
    ?public_ip_addresses:(public_ip_addresses_ : public_ip_address_list option)
    ?data_migration_cidr_blocks:(data_migration_cidr_blocks_ : data_migration_cidr_block option)
    ?last_failure_message:(last_failure_message_ : string_ option)
    ?stop_reason:(stop_reason_ : string_ option) () =
  ({
     data_migration_name = data_migration_name_;
     data_migration_arn = data_migration_arn_;
     data_migration_create_time = data_migration_create_time_;
     data_migration_start_time = data_migration_start_time_;
     data_migration_end_time = data_migration_end_time_;
     service_access_role_arn = service_access_role_arn_;
     migration_project_arn = migration_project_arn_;
     data_migration_type = data_migration_type_;
     data_migration_settings = data_migration_settings_;
     source_data_settings = source_data_settings_;
     target_data_settings = target_data_settings_;
     data_migration_statistics = data_migration_statistics_;
     data_migration_status = data_migration_status_;
     public_ip_addresses = public_ip_addresses_;
     data_migration_cidr_blocks = data_migration_cidr_blocks_;
     last_failure_message = last_failure_message_;
     stop_reason = stop_reason_;
   }
    : data_migration)

let make_stop_data_migration_response ?data_migration:(data_migration_ : data_migration option) () =
  ({ data_migration = data_migration_ } : stop_data_migration_response)

let make_stop_data_migration_message
    ~data_migration_identifier:(data_migration_identifier_ : string_) () =
  ({ data_migration_identifier = data_migration_identifier_ } : stop_data_migration_message)

let make_replication_task_assessment_run
    ?replication_task_assessment_run_arn:(replication_task_assessment_run_arn_ : string_ option)
    ?replication_task_arn:(replication_task_arn_ : string_ option)
    ?status:(status_ : string_ option)
    ?replication_task_assessment_run_creation_date:
      (replication_task_assessment_run_creation_date_ : t_stamp option)
    ?assessment_progress:(assessment_progress_ : replication_task_assessment_run_progress option)
    ?last_failure_message:(last_failure_message_ : string_ option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?result_location_bucket:(result_location_bucket_ : string_ option)
    ?result_location_folder:(result_location_folder_ : string_ option)
    ?result_encryption_mode:(result_encryption_mode_ : string_ option)
    ?result_kms_key_arn:(result_kms_key_arn_ : string_ option)
    ?assessment_run_name:(assessment_run_name_ : string_ option)
    ?is_latest_task_assessment_run:(is_latest_task_assessment_run_ : boolean_ option)
    ?result_statistic:(result_statistic_ : replication_task_assessment_run_result_statistic option)
    () =
  ({
     replication_task_assessment_run_arn = replication_task_assessment_run_arn_;
     replication_task_arn = replication_task_arn_;
     status = status_;
     replication_task_assessment_run_creation_date = replication_task_assessment_run_creation_date_;
     assessment_progress = assessment_progress_;
     last_failure_message = last_failure_message_;
     service_access_role_arn = service_access_role_arn_;
     result_location_bucket = result_location_bucket_;
     result_location_folder = result_location_folder_;
     result_encryption_mode = result_encryption_mode_;
     result_kms_key_arn = result_kms_key_arn_;
     assessment_run_name = assessment_run_name_;
     is_latest_task_assessment_run = is_latest_task_assessment_run_;
     result_statistic = result_statistic_;
   }
    : replication_task_assessment_run)

let make_start_replication_task_assessment_run_response
    ?replication_task_assessment_run:
      (replication_task_assessment_run_ : replication_task_assessment_run option) () =
  ({ replication_task_assessment_run = replication_task_assessment_run_ }
    : start_replication_task_assessment_run_response)

let make_start_replication_task_assessment_run_message
    ?result_location_folder:(result_location_folder_ : string_ option)
    ?result_encryption_mode:(result_encryption_mode_ : string_ option)
    ?result_kms_key_arn:(result_kms_key_arn_ : string_ option)
    ?include_only:(include_only_ : include_test_list option)
    ?exclude:(exclude_ : exclude_test_list option) ?tags:(tags_ : tag_list option)
    ~replication_task_arn:(replication_task_arn_ : string_)
    ~service_access_role_arn:(service_access_role_arn_ : string_)
    ~result_location_bucket:(result_location_bucket_ : string_)
    ~assessment_run_name:(assessment_run_name_ : string_) () =
  ({
     replication_task_arn = replication_task_arn_;
     service_access_role_arn = service_access_role_arn_;
     result_location_bucket = result_location_bucket_;
     result_location_folder = result_location_folder_;
     result_encryption_mode = result_encryption_mode_;
     result_kms_key_arn = result_kms_key_arn_;
     assessment_run_name = assessment_run_name_;
     include_only = include_only_;
     exclude = exclude_;
     tags = tags_;
   }
    : start_replication_task_assessment_run_message)

let make_start_replication_task_assessment_response
    ?replication_task:(replication_task_ : replication_task option) () =
  ({ replication_task = replication_task_ } : start_replication_task_assessment_response)

let make_start_replication_task_assessment_message
    ~replication_task_arn:(replication_task_arn_ : string_) () =
  ({ replication_task_arn = replication_task_arn_ } : start_replication_task_assessment_message)

let make_start_replication_task_response
    ?replication_task:(replication_task_ : replication_task option) () =
  ({ replication_task = replication_task_ } : start_replication_task_response)

let make_start_replication_task_message ?cdc_start_time:(cdc_start_time_ : t_stamp option)
    ?cdc_start_position:(cdc_start_position_ : string_ option)
    ?cdc_stop_position:(cdc_stop_position_ : string_ option)
    ~replication_task_arn:(replication_task_arn_ : string_)
    ~start_replication_task_type:(start_replication_task_type_ : start_replication_task_type_value)
    () =
  ({
     replication_task_arn = replication_task_arn_;
     start_replication_task_type = start_replication_task_type_;
     cdc_start_time = cdc_start_time_;
     cdc_start_position = cdc_start_position_;
     cdc_stop_position = cdc_stop_position_;
   }
    : start_replication_task_message)

let make_start_replication_response ?replication:(replication_ : replication option) () =
  ({ replication = replication_ } : start_replication_response)

let make_start_replication_message
    ?premigration_assessment_settings:(premigration_assessment_settings_ : string_ option)
    ?cdc_start_time:(cdc_start_time_ : t_stamp option)
    ?cdc_start_position:(cdc_start_position_ : string_ option)
    ?cdc_stop_position:(cdc_stop_position_ : string_ option)
    ~replication_config_arn:(replication_config_arn_ : string_)
    ~start_replication_type:(start_replication_type_ : string_) () =
  ({
     replication_config_arn = replication_config_arn_;
     start_replication_type = start_replication_type_;
     premigration_assessment_settings = premigration_assessment_settings_;
     cdc_start_time = cdc_start_time_;
     cdc_start_position = cdc_start_position_;
     cdc_stop_position = cdc_stop_position_;
   }
    : start_replication_message)

let make_recommendation_settings ~instance_sizing_type:(instance_sizing_type_ : string_)
    ~workload_type:(workload_type_ : string_) () =
  ({ instance_sizing_type = instance_sizing_type_; workload_type = workload_type_ }
    : recommendation_settings)

let make_start_recommendations_request ~database_id:(database_id_ : string_)
    ~settings:(settings_ : recommendation_settings) () =
  ({ database_id = database_id_; settings = settings_ } : start_recommendations_request)

let make_start_metadata_model_import_response
    ?request_identifier:(request_identifier_ : string_ option) () =
  ({ request_identifier = request_identifier_ } : start_metadata_model_import_response)

let make_start_metadata_model_import_message ?refresh:(refresh_ : boolean_ option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier)
    ~selection_rules:(selection_rules_ : string_) ~origin:(origin_ : origin_type_value) () =
  ({
     migration_project_identifier = migration_project_identifier_;
     selection_rules = selection_rules_;
     origin = origin_;
     refresh = refresh_;
   }
    : start_metadata_model_import_message)

let make_start_metadata_model_export_to_target_response
    ?request_identifier:(request_identifier_ : string_ option) () =
  ({ request_identifier = request_identifier_ } : start_metadata_model_export_to_target_response)

let make_start_metadata_model_export_to_target_message
    ?overwrite_extension_pack:(overwrite_extension_pack_ : boolean_optional option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier)
    ~selection_rules:(selection_rules_ : string_) () =
  ({
     migration_project_identifier = migration_project_identifier_;
     selection_rules = selection_rules_;
     overwrite_extension_pack = overwrite_extension_pack_;
   }
    : start_metadata_model_export_to_target_message)

let make_start_metadata_model_export_as_script_response
    ?request_identifier:(request_identifier_ : string_ option) () =
  ({ request_identifier = request_identifier_ } : start_metadata_model_export_as_script_response)

let make_start_metadata_model_export_as_script_message ?file_name:(file_name_ : string_ option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier)
    ~selection_rules:(selection_rules_ : string_) ~origin:(origin_ : origin_type_value) () =
  ({
     migration_project_identifier = migration_project_identifier_;
     selection_rules = selection_rules_;
     origin = origin_;
     file_name = file_name_;
   }
    : start_metadata_model_export_as_script_message)

let make_start_metadata_model_creation_response
    ?request_identifier:(request_identifier_ : string_ option) () =
  ({ request_identifier = request_identifier_ } : start_metadata_model_creation_response)

let make_statement_properties ~definition:(definition_ : string_) () =
  ({ definition = definition_ } : statement_properties)

let make_start_metadata_model_creation_message
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier)
    ~selection_rules:(selection_rules_ : string_)
    ~metadata_model_name:(metadata_model_name_ : string_)
    ~properties:(properties_ : metadata_model_properties) () =
  ({
     migration_project_identifier = migration_project_identifier_;
     selection_rules = selection_rules_;
     metadata_model_name = metadata_model_name_;
     properties = properties_;
   }
    : start_metadata_model_creation_message)

let make_start_metadata_model_conversion_response
    ?request_identifier:(request_identifier_ : string_ option) () =
  ({ request_identifier = request_identifier_ } : start_metadata_model_conversion_response)

let make_start_metadata_model_conversion_message
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier)
    ~selection_rules:(selection_rules_ : string_) () =
  ({
     migration_project_identifier = migration_project_identifier_;
     selection_rules = selection_rules_;
   }
    : start_metadata_model_conversion_message)

let make_start_metadata_model_assessment_response
    ?request_identifier:(request_identifier_ : string_ option) () =
  ({ request_identifier = request_identifier_ } : start_metadata_model_assessment_response)

let make_start_metadata_model_assessment_message
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier)
    ~selection_rules:(selection_rules_ : string_) () =
  ({
     migration_project_identifier = migration_project_identifier_;
     selection_rules = selection_rules_;
   }
    : start_metadata_model_assessment_message)

let make_start_extension_pack_association_response
    ?request_identifier:(request_identifier_ : string_ option) () =
  ({ request_identifier = request_identifier_ } : start_extension_pack_association_response)

let make_start_extension_pack_association_message
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({ migration_project_identifier = migration_project_identifier_ }
    : start_extension_pack_association_message)

let make_start_data_migration_response ?data_migration:(data_migration_ : data_migration option) ()
    =
  ({ data_migration = data_migration_ } : start_data_migration_response)

let make_start_data_migration_message
    ~data_migration_identifier:(data_migration_identifier_ : string_)
    ~start_type:(start_type_ : start_replication_migration_type_value) () =
  ({ data_migration_identifier = data_migration_identifier_; start_type = start_type_ }
    : start_data_migration_message)

let make_run_fleet_advisor_lsa_analysis_response
    ?lsa_analysis_id:(lsa_analysis_id_ : string_ option) ?status:(status_ : string_ option) () =
  ({ lsa_analysis_id = lsa_analysis_id_; status = status_ }
    : run_fleet_advisor_lsa_analysis_response)

let make_remove_tags_from_resource_response () = (() : unit)

let make_remove_tags_from_resource_message ~resource_arn:(resource_arn_ : string_)
    ~tag_keys:(tag_keys_ : key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : remove_tags_from_resource_message)

let make_reload_tables_response ?replication_task_arn:(replication_task_arn_ : string_ option) () =
  ({ replication_task_arn = replication_task_arn_ } : reload_tables_response)

let make_table_to_reload ~schema_name:(schema_name_ : string_) ~table_name:(table_name_ : string_)
    () =
  ({ schema_name = schema_name_; table_name = table_name_ } : table_to_reload)

let make_reload_tables_message ?reload_option:(reload_option_ : reload_option_value option)
    ~replication_task_arn:(replication_task_arn_ : string_)
    ~tables_to_reload:(tables_to_reload_ : table_list_to_reload) () =
  ({
     replication_task_arn = replication_task_arn_;
     tables_to_reload = tables_to_reload_;
     reload_option = reload_option_;
   }
    : reload_tables_message)

let make_reload_replication_tables_response
    ?replication_config_arn:(replication_config_arn_ : string_ option) () =
  ({ replication_config_arn = replication_config_arn_ } : reload_replication_tables_response)

let make_reload_replication_tables_message
    ?reload_option:(reload_option_ : reload_option_value option)
    ~replication_config_arn:(replication_config_arn_ : string_)
    ~tables_to_reload:(tables_to_reload_ : table_list_to_reload) () =
  ({
     replication_config_arn = replication_config_arn_;
     tables_to_reload = tables_to_reload_;
     reload_option = reload_option_;
   }
    : reload_replication_tables_message)

let make_refresh_schemas_status ?endpoint_arn:(endpoint_arn_ : string_ option)
    ?replication_instance_arn:(replication_instance_arn_ : string_ option)
    ?status:(status_ : refresh_schemas_status_type_value option)
    ?last_refresh_date:(last_refresh_date_ : t_stamp option)
    ?last_failure_message:(last_failure_message_ : string_ option) () =
  ({
     endpoint_arn = endpoint_arn_;
     replication_instance_arn = replication_instance_arn_;
     status = status_;
     last_refresh_date = last_refresh_date_;
     last_failure_message = last_failure_message_;
   }
    : refresh_schemas_status)

let make_refresh_schemas_response
    ?refresh_schemas_status:(refresh_schemas_status_ : refresh_schemas_status option) () =
  ({ refresh_schemas_status = refresh_schemas_status_ } : refresh_schemas_response)

let make_refresh_schemas_message ~endpoint_arn:(endpoint_arn_ : string_)
    ~replication_instance_arn:(replication_instance_arn_ : string_) () =
  ({ endpoint_arn = endpoint_arn_; replication_instance_arn = replication_instance_arn_ }
    : refresh_schemas_message)

let make_kerberos_authentication_settings
    ?key_cache_secret_id:(key_cache_secret_id_ : string_ option)
    ?key_cache_secret_iam_arn:(key_cache_secret_iam_arn_ : string_ option)
    ?krb5_file_contents:(krb5_file_contents_ : string_ option) () =
  ({
     key_cache_secret_id = key_cache_secret_id_;
     key_cache_secret_iam_arn = key_cache_secret_iam_arn_;
     krb5_file_contents = krb5_file_contents_;
   }
    : kerberos_authentication_settings)

let make_replication_pending_modified_values
    ?replication_instance_class:(replication_instance_class_ : replication_instance_class option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?network_type:(network_type_ : string_ option) () =
  ({
     replication_instance_class = replication_instance_class_;
     allocated_storage = allocated_storage_;
     multi_a_z = multi_a_z_;
     engine_version = engine_version_;
     network_type = network_type_;
   }
    : replication_pending_modified_values)

let make_availability_zone ?name:(name_ : string_ option) () =
  ({ name = name_ } : availability_zone)

let make_subnet ?subnet_identifier:(subnet_identifier_ : string_ option)
    ?subnet_availability_zone:(subnet_availability_zone_ : availability_zone option)
    ?subnet_status:(subnet_status_ : string_ option) () =
  ({
     subnet_identifier = subnet_identifier_;
     subnet_availability_zone = subnet_availability_zone_;
     subnet_status = subnet_status_;
   }
    : subnet)

let make_replication_subnet_group
    ?replication_subnet_group_identifier:(replication_subnet_group_identifier_ : string_ option)
    ?replication_subnet_group_description:(replication_subnet_group_description_ : string_ option)
    ?vpc_id:(vpc_id_ : string_ option) ?subnet_group_status:(subnet_group_status_ : string_ option)
    ?subnets:(subnets_ : subnet_list option)
    ?supported_network_types:(supported_network_types_ : string_list option)
    ?is_read_only:(is_read_only_ : boolean_optional option) () =
  ({
     replication_subnet_group_identifier = replication_subnet_group_identifier_;
     replication_subnet_group_description = replication_subnet_group_description_;
     vpc_id = vpc_id_;
     subnet_group_status = subnet_group_status_;
     subnets = subnets_;
     supported_network_types = supported_network_types_;
     is_read_only = is_read_only_;
   }
    : replication_subnet_group)

let make_vpc_security_group_membership
    ?vpc_security_group_id:(vpc_security_group_id_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ vpc_security_group_id = vpc_security_group_id_; status = status_ }
    : vpc_security_group_membership)

let make_replication_instance
    ?replication_instance_identifier:(replication_instance_identifier_ : string_ option)
    ?replication_instance_class:(replication_instance_class_ : replication_instance_class option)
    ?replication_instance_status:(replication_instance_status_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer option)
    ?instance_create_time:(instance_create_time_ : t_stamp option)
    ?vpc_security_groups:(vpc_security_groups_ : vpc_security_group_membership_list option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?replication_subnet_group:(replication_subnet_group_ : replication_subnet_group option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?pending_modified_values:(pending_modified_values_ : replication_pending_modified_values option)
    ?multi_a_z:(multi_a_z_ : boolean_ option) ?engine_version:(engine_version_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?replication_instance_arn:(replication_instance_arn_ : string_ option)
    ?replication_instance_public_ip_address:
      (replication_instance_public_ip_address_ : string_ option)
    ?replication_instance_private_ip_address:
      (replication_instance_private_ip_address_ : string_ option)
    ?replication_instance_public_ip_addresses:
      (replication_instance_public_ip_addresses_ :
         replication_instance_public_ip_address_list option)
    ?replication_instance_private_ip_addresses:
      (replication_instance_private_ip_addresses_ :
         replication_instance_private_ip_address_list option)
    ?replication_instance_ipv6_addresses:
      (replication_instance_ipv6_addresses_ : replication_instance_ipv6_address_list option)
    ?publicly_accessible:(publicly_accessible_ : boolean_ option)
    ?secondary_availability_zone:(secondary_availability_zone_ : string_ option)
    ?free_until:(free_until_ : t_stamp option)
    ?dns_name_servers:(dns_name_servers_ : string_ option)
    ?network_type:(network_type_ : string_ option)
    ?kerberos_authentication_settings:
      (kerberos_authentication_settings_ : kerberos_authentication_settings option) () =
  ({
     replication_instance_identifier = replication_instance_identifier_;
     replication_instance_class = replication_instance_class_;
     replication_instance_status = replication_instance_status_;
     allocated_storage = allocated_storage_;
     instance_create_time = instance_create_time_;
     vpc_security_groups = vpc_security_groups_;
     availability_zone = availability_zone_;
     replication_subnet_group = replication_subnet_group_;
     preferred_maintenance_window = preferred_maintenance_window_;
     pending_modified_values = pending_modified_values_;
     multi_a_z = multi_a_z_;
     engine_version = engine_version_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     kms_key_id = kms_key_id_;
     replication_instance_arn = replication_instance_arn_;
     replication_instance_public_ip_address = replication_instance_public_ip_address_;
     replication_instance_private_ip_address = replication_instance_private_ip_address_;
     replication_instance_public_ip_addresses = replication_instance_public_ip_addresses_;
     replication_instance_private_ip_addresses = replication_instance_private_ip_addresses_;
     replication_instance_ipv6_addresses = replication_instance_ipv6_addresses_;
     publicly_accessible = publicly_accessible_;
     secondary_availability_zone = secondary_availability_zone_;
     free_until = free_until_;
     dns_name_servers = dns_name_servers_;
     network_type = network_type_;
     kerberos_authentication_settings = kerberos_authentication_settings_;
   }
    : replication_instance)

let make_reboot_replication_instance_response
    ?replication_instance:(replication_instance_ : replication_instance option) () =
  ({ replication_instance = replication_instance_ } : reboot_replication_instance_response)

let make_reboot_replication_instance_message
    ?force_failover:(force_failover_ : boolean_optional option)
    ?force_planned_failover:(force_planned_failover_ : boolean_optional option)
    ~replication_instance_arn:(replication_instance_arn_ : string_) () =
  ({
     replication_instance_arn = replication_instance_arn_;
     force_failover = force_failover_;
     force_planned_failover = force_planned_failover_;
   }
    : reboot_replication_instance_message)

let make_move_replication_task_response
    ?replication_task:(replication_task_ : replication_task option) () =
  ({ replication_task = replication_task_ } : move_replication_task_response)

let make_move_replication_task_message ~replication_task_arn:(replication_task_arn_ : string_)
    ~target_replication_instance_arn:(target_replication_instance_arn_ : string_) () =
  ({
     replication_task_arn = replication_task_arn_;
     target_replication_instance_arn = target_replication_instance_arn_;
   }
    : move_replication_task_message)

let make_modify_replication_task_response
    ?replication_task:(replication_task_ : replication_task option) () =
  ({ replication_task = replication_task_ } : modify_replication_task_response)

let make_modify_replication_task_message
    ?replication_task_identifier:(replication_task_identifier_ : string_ option)
    ?migration_type:(migration_type_ : migration_type_value option)
    ?table_mappings:(table_mappings_ : string_ option)
    ?replication_task_settings:(replication_task_settings_ : string_ option)
    ?cdc_start_time:(cdc_start_time_ : t_stamp option)
    ?cdc_start_position:(cdc_start_position_ : string_ option)
    ?cdc_stop_position:(cdc_stop_position_ : string_ option)
    ?task_data:(task_data_ : string_ option) ~replication_task_arn:(replication_task_arn_ : string_)
    () =
  ({
     replication_task_arn = replication_task_arn_;
     replication_task_identifier = replication_task_identifier_;
     migration_type = migration_type_;
     table_mappings = table_mappings_;
     replication_task_settings = replication_task_settings_;
     cdc_start_time = cdc_start_time_;
     cdc_start_position = cdc_start_position_;
     cdc_stop_position = cdc_stop_position_;
     task_data = task_data_;
   }
    : modify_replication_task_message)

let make_modify_replication_subnet_group_response
    ?replication_subnet_group:(replication_subnet_group_ : replication_subnet_group option) () =
  ({ replication_subnet_group = replication_subnet_group_ }
    : modify_replication_subnet_group_response)

let make_modify_replication_subnet_group_message
    ?replication_subnet_group_description:(replication_subnet_group_description_ : string_ option)
    ~replication_subnet_group_identifier:(replication_subnet_group_identifier_ : string_)
    ~subnet_ids:(subnet_ids_ : subnet_identifier_list) () =
  ({
     replication_subnet_group_identifier = replication_subnet_group_identifier_;
     replication_subnet_group_description = replication_subnet_group_description_;
     subnet_ids = subnet_ids_;
   }
    : modify_replication_subnet_group_message)

let make_modify_replication_instance_response
    ?replication_instance:(replication_instance_ : replication_instance option) () =
  ({ replication_instance = replication_instance_ } : modify_replication_instance_response)

let make_modify_replication_instance_message
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?apply_immediately:(apply_immediately_ : boolean_ option)
    ?replication_instance_class:(replication_instance_class_ : replication_instance_class option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?allow_major_version_upgrade:(allow_major_version_upgrade_ : boolean_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?replication_instance_identifier:(replication_instance_identifier_ : string_ option)
    ?network_type:(network_type_ : string_ option)
    ?kerberos_authentication_settings:
      (kerberos_authentication_settings_ : kerberos_authentication_settings option)
    ~replication_instance_arn:(replication_instance_arn_ : string_) () =
  ({
     replication_instance_arn = replication_instance_arn_;
     allocated_storage = allocated_storage_;
     apply_immediately = apply_immediately_;
     replication_instance_class = replication_instance_class_;
     vpc_security_group_ids = vpc_security_group_ids_;
     preferred_maintenance_window = preferred_maintenance_window_;
     multi_a_z = multi_a_z_;
     engine_version = engine_version_;
     allow_major_version_upgrade = allow_major_version_upgrade_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     replication_instance_identifier = replication_instance_identifier_;
     network_type = network_type_;
     kerberos_authentication_settings = kerberos_authentication_settings_;
   }
    : modify_replication_instance_message)

let make_compute_config ?availability_zone:(availability_zone_ : string_ option)
    ?dns_name_servers:(dns_name_servers_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?max_capacity_units:(max_capacity_units_ : integer_optional option)
    ?min_capacity_units:(min_capacity_units_ : integer_optional option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?replication_subnet_group_id:(replication_subnet_group_id_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : string_list option) () =
  ({
     availability_zone = availability_zone_;
     dns_name_servers = dns_name_servers_;
     kms_key_id = kms_key_id_;
     max_capacity_units = max_capacity_units_;
     min_capacity_units = min_capacity_units_;
     multi_a_z = multi_a_z_;
     preferred_maintenance_window = preferred_maintenance_window_;
     replication_subnet_group_id = replication_subnet_group_id_;
     vpc_security_group_ids = vpc_security_group_ids_;
   }
    : compute_config)

let make_replication_config
    ?replication_config_identifier:(replication_config_identifier_ : string_ option)
    ?replication_config_arn:(replication_config_arn_ : string_ option)
    ?source_endpoint_arn:(source_endpoint_arn_ : string_ option)
    ?target_endpoint_arn:(target_endpoint_arn_ : string_ option)
    ?replication_type:(replication_type_ : migration_type_value option)
    ?compute_config:(compute_config_ : compute_config option)
    ?replication_settings:(replication_settings_ : string_ option)
    ?supplemental_settings:(supplemental_settings_ : string_ option)
    ?table_mappings:(table_mappings_ : string_ option)
    ?replication_config_create_time:(replication_config_create_time_ : t_stamp option)
    ?replication_config_update_time:(replication_config_update_time_ : t_stamp option)
    ?is_read_only:(is_read_only_ : boolean_optional option) () =
  ({
     replication_config_identifier = replication_config_identifier_;
     replication_config_arn = replication_config_arn_;
     source_endpoint_arn = source_endpoint_arn_;
     target_endpoint_arn = target_endpoint_arn_;
     replication_type = replication_type_;
     compute_config = compute_config_;
     replication_settings = replication_settings_;
     supplemental_settings = supplemental_settings_;
     table_mappings = table_mappings_;
     replication_config_create_time = replication_config_create_time_;
     replication_config_update_time = replication_config_update_time_;
     is_read_only = is_read_only_;
   }
    : replication_config)

let make_modify_replication_config_response
    ?replication_config:(replication_config_ : replication_config option) () =
  ({ replication_config = replication_config_ } : modify_replication_config_response)

let make_modify_replication_config_message
    ?replication_config_identifier:(replication_config_identifier_ : string_ option)
    ?replication_type:(replication_type_ : migration_type_value option)
    ?table_mappings:(table_mappings_ : string_ option)
    ?replication_settings:(replication_settings_ : string_ option)
    ?supplemental_settings:(supplemental_settings_ : string_ option)
    ?compute_config:(compute_config_ : compute_config option)
    ?source_endpoint_arn:(source_endpoint_arn_ : string_ option)
    ?target_endpoint_arn:(target_endpoint_arn_ : string_ option)
    ~replication_config_arn:(replication_config_arn_ : string_) () =
  ({
     replication_config_arn = replication_config_arn_;
     replication_config_identifier = replication_config_identifier_;
     replication_type = replication_type_;
     table_mappings = table_mappings_;
     replication_settings = replication_settings_;
     supplemental_settings = supplemental_settings_;
     compute_config = compute_config_;
     source_endpoint_arn = source_endpoint_arn_;
     target_endpoint_arn = target_endpoint_arn_;
   }
    : modify_replication_config_message)

let make_sc_application_attributes ?s3_bucket_path:(s3_bucket_path_ : string_ option)
    ?s3_bucket_role_arn:(s3_bucket_role_arn_ : string_ option) () =
  ({ s3_bucket_path = s3_bucket_path_; s3_bucket_role_arn = s3_bucket_role_arn_ }
    : sc_application_attributes)

let make_data_provider_descriptor
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?data_provider_name:(data_provider_name_ : string_ option)
    ?data_provider_arn:(data_provider_arn_ : string_ option) () =
  ({
     secrets_manager_secret_id = secrets_manager_secret_id_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     data_provider_name = data_provider_name_;
     data_provider_arn = data_provider_arn_;
   }
    : data_provider_descriptor)

let make_migration_project ?migration_project_name:(migration_project_name_ : string_ option)
    ?migration_project_arn:(migration_project_arn_ : string_ option)
    ?migration_project_creation_time:(migration_project_creation_time_ : iso8601_date_time option)
    ?source_data_provider_descriptors:
      (source_data_provider_descriptors_ : data_provider_descriptor_list option)
    ?target_data_provider_descriptors:
      (target_data_provider_descriptors_ : data_provider_descriptor_list option)
    ?instance_profile_arn:(instance_profile_arn_ : string_ option)
    ?instance_profile_name:(instance_profile_name_ : string_ option)
    ?transformation_rules:(transformation_rules_ : string_ option)
    ?description:(description_ : string_ option)
    ?schema_conversion_application_attributes:
      (schema_conversion_application_attributes_ : sc_application_attributes option) () =
  ({
     migration_project_name = migration_project_name_;
     migration_project_arn = migration_project_arn_;
     migration_project_creation_time = migration_project_creation_time_;
     source_data_provider_descriptors = source_data_provider_descriptors_;
     target_data_provider_descriptors = target_data_provider_descriptors_;
     instance_profile_arn = instance_profile_arn_;
     instance_profile_name = instance_profile_name_;
     transformation_rules = transformation_rules_;
     description = description_;
     schema_conversion_application_attributes = schema_conversion_application_attributes_;
   }
    : migration_project)

let make_modify_migration_project_response
    ?migration_project:(migration_project_ : migration_project option) () =
  ({ migration_project = migration_project_ } : modify_migration_project_response)

let make_data_provider_descriptor_definition
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ~data_provider_identifier:(data_provider_identifier_ : string_) () =
  ({
     data_provider_identifier = data_provider_identifier_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
   }
    : data_provider_descriptor_definition)

let make_modify_migration_project_message
    ?migration_project_name:(migration_project_name_ : string_ option)
    ?source_data_provider_descriptors:
      (source_data_provider_descriptors_ : data_provider_descriptor_definition_list option)
    ?target_data_provider_descriptors:
      (target_data_provider_descriptors_ : data_provider_descriptor_definition_list option)
    ?instance_profile_identifier:(instance_profile_identifier_ : string_ option)
    ?transformation_rules:(transformation_rules_ : string_ option)
    ?description:(description_ : string_ option)
    ?schema_conversion_application_attributes:
      (schema_conversion_application_attributes_ : sc_application_attributes option)
    ~migration_project_identifier:(migration_project_identifier_ : string_) () =
  ({
     migration_project_identifier = migration_project_identifier_;
     migration_project_name = migration_project_name_;
     source_data_provider_descriptors = source_data_provider_descriptors_;
     target_data_provider_descriptors = target_data_provider_descriptors_;
     instance_profile_identifier = instance_profile_identifier_;
     transformation_rules = transformation_rules_;
     description = description_;
     schema_conversion_application_attributes = schema_conversion_application_attributes_;
   }
    : modify_migration_project_message)

let make_instance_profile ?instance_profile_arn:(instance_profile_arn_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?kms_key_arn:(kms_key_arn_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?network_type:(network_type_ : string_ option)
    ?instance_profile_name:(instance_profile_name_ : string_ option)
    ?description:(description_ : string_ option)
    ?instance_profile_creation_time:(instance_profile_creation_time_ : iso8601_date_time option)
    ?subnet_group_identifier:(subnet_group_identifier_ : string_ option)
    ?vpc_security_groups:(vpc_security_groups_ : string_list option) () =
  ({
     instance_profile_arn = instance_profile_arn_;
     availability_zone = availability_zone_;
     kms_key_arn = kms_key_arn_;
     publicly_accessible = publicly_accessible_;
     network_type = network_type_;
     instance_profile_name = instance_profile_name_;
     description = description_;
     instance_profile_creation_time = instance_profile_creation_time_;
     subnet_group_identifier = subnet_group_identifier_;
     vpc_security_groups = vpc_security_groups_;
   }
    : instance_profile)

let make_modify_instance_profile_response
    ?instance_profile:(instance_profile_ : instance_profile option) () =
  ({ instance_profile = instance_profile_ } : modify_instance_profile_response)

let make_modify_instance_profile_message ?availability_zone:(availability_zone_ : string_ option)
    ?kms_key_arn:(kms_key_arn_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?network_type:(network_type_ : string_ option)
    ?instance_profile_name:(instance_profile_name_ : string_ option)
    ?description:(description_ : string_ option)
    ?subnet_group_identifier:(subnet_group_identifier_ : string_ option)
    ?vpc_security_groups:(vpc_security_groups_ : string_list option)
    ~instance_profile_identifier:(instance_profile_identifier_ : string_) () =
  ({
     instance_profile_identifier = instance_profile_identifier_;
     availability_zone = availability_zone_;
     kms_key_arn = kms_key_arn_;
     publicly_accessible = publicly_accessible_;
     network_type = network_type_;
     instance_profile_name = instance_profile_name_;
     description = description_;
     subnet_group_identifier = subnet_group_identifier_;
     vpc_security_groups = vpc_security_groups_;
   }
    : modify_instance_profile_message)

let make_event_subscription ?customer_aws_id:(customer_aws_id_ : string_ option)
    ?cust_subscription_id:(cust_subscription_id_ : string_ option)
    ?sns_topic_arn:(sns_topic_arn_ : string_ option) ?status:(status_ : string_ option)
    ?subscription_creation_time:(subscription_creation_time_ : string_ option)
    ?source_type:(source_type_ : string_ option)
    ?source_ids_list:(source_ids_list_ : source_ids_list option)
    ?event_categories_list:(event_categories_list_ : event_categories_list option)
    ?enabled:(enabled_ : boolean_ option) () =
  ({
     customer_aws_id = customer_aws_id_;
     cust_subscription_id = cust_subscription_id_;
     sns_topic_arn = sns_topic_arn_;
     status = status_;
     subscription_creation_time = subscription_creation_time_;
     source_type = source_type_;
     source_ids_list = source_ids_list_;
     event_categories_list = event_categories_list_;
     enabled = enabled_;
   }
    : event_subscription)

let make_modify_event_subscription_response
    ?event_subscription:(event_subscription_ : event_subscription option) () =
  ({ event_subscription = event_subscription_ } : modify_event_subscription_response)

let make_modify_event_subscription_message ?sns_topic_arn:(sns_topic_arn_ : string_ option)
    ?source_type:(source_type_ : string_ option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?enabled:(enabled_ : boolean_optional option) ~subscription_name:(subscription_name_ : string_)
    () =
  ({
     subscription_name = subscription_name_;
     sns_topic_arn = sns_topic_arn_;
     source_type = source_type_;
     event_categories = event_categories_;
     enabled = enabled_;
   }
    : modify_event_subscription_message)

let make_lakehouse_settings ~arn:(arn_ : string_) () = ({ arn = arn_ } : lakehouse_settings)

let make_timestream_settings
    ?cdc_inserts_and_updates:(cdc_inserts_and_updates_ : boolean_optional option)
    ?enable_magnetic_store_writes:(enable_magnetic_store_writes_ : boolean_optional option)
    ~database_name:(database_name_ : string_) ~memory_duration:(memory_duration_ : integer_optional)
    ~magnetic_duration:(magnetic_duration_ : integer_optional) () =
  ({
     database_name = database_name_;
     memory_duration = memory_duration_;
     magnetic_duration = magnetic_duration_;
     cdc_inserts_and_updates = cdc_inserts_and_updates_;
     enable_magnetic_store_writes = enable_magnetic_store_writes_;
   }
    : timestream_settings)

let make_gcp_my_sql_settings ?after_connect_script:(after_connect_script_ : string_ option)
    ?clean_source_metadata_on_mismatch:
      (clean_source_metadata_on_mismatch_ : boolean_optional option)
    ?database_name:(database_name_ : string_ option)
    ?events_poll_interval:(events_poll_interval_ : integer_optional option)
    ?target_db_type:(target_db_type_ : target_db_type option)
    ?max_file_size:(max_file_size_ : integer_optional option)
    ?parallel_load_threads:(parallel_load_threads_ : integer_optional option)
    ?password:(password_ : secret_string option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option)
    ?server_timezone:(server_timezone_ : string_ option) ?username:(username_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option) () =
  ({
     after_connect_script = after_connect_script_;
     clean_source_metadata_on_mismatch = clean_source_metadata_on_mismatch_;
     database_name = database_name_;
     events_poll_interval = events_poll_interval_;
     target_db_type = target_db_type_;
     max_file_size = max_file_size_;
     parallel_load_threads = parallel_load_threads_;
     password = password_;
     port = port_;
     server_name = server_name_;
     server_timezone = server_timezone_;
     username = username_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
   }
    : gcp_my_sql_settings)

let make_redis_settings
    ?ssl_security_protocol:(ssl_security_protocol_ : ssl_security_protocol_value option)
    ?auth_type:(auth_type_ : redis_auth_type_value option)
    ?auth_user_name:(auth_user_name_ : string_ option)
    ?auth_password:(auth_password_ : secret_string option)
    ?ssl_ca_certificate_arn:(ssl_ca_certificate_arn_ : string_ option)
    ~server_name:(server_name_ : string_) ~port:(port_ : integer) () =
  ({
     server_name = server_name_;
     port = port_;
     ssl_security_protocol = ssl_security_protocol_;
     auth_type = auth_type_;
     auth_user_name = auth_user_name_;
     auth_password = auth_password_;
     ssl_ca_certificate_arn = ssl_ca_certificate_arn_;
   }
    : redis_settings)

let make_doc_db_settings ?username:(username_ : string_ option)
    ?password:(password_ : secret_string option) ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?database_name:(database_name_ : string_ option)
    ?nesting_level:(nesting_level_ : nesting_level_value option)
    ?extract_doc_id:(extract_doc_id_ : boolean_optional option)
    ?docs_to_investigate:(docs_to_investigate_ : integer_optional option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?use_update_look_up:(use_update_look_up_ : boolean_optional option)
    ?replicate_shard_collections:(replicate_shard_collections_ : boolean_optional option) () =
  ({
     username = username_;
     password = password_;
     server_name = server_name_;
     port = port_;
     database_name = database_name_;
     nesting_level = nesting_level_;
     extract_doc_id = extract_doc_id_;
     docs_to_investigate = docs_to_investigate_;
     kms_key_id = kms_key_id_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     use_update_look_up = use_update_look_up_;
     replicate_shard_collections = replicate_shard_collections_;
   }
    : doc_db_settings)

let make_ibm_db2_settings ?database_name:(database_name_ : string_ option)
    ?password:(password_ : secret_string option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option)
    ?set_data_capture_changes:(set_data_capture_changes_ : boolean_optional option)
    ?current_lsn:(current_lsn_ : string_ option)
    ?max_k_bytes_per_read:(max_k_bytes_per_read_ : integer_optional option)
    ?username:(username_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?load_timeout:(load_timeout_ : integer_optional option)
    ?write_buffer_size:(write_buffer_size_ : integer_optional option)
    ?max_file_size:(max_file_size_ : integer_optional option)
    ?keep_csv_files:(keep_csv_files_ : boolean_optional option) () =
  ({
     database_name = database_name_;
     password = password_;
     port = port_;
     server_name = server_name_;
     set_data_capture_changes = set_data_capture_changes_;
     current_lsn = current_lsn_;
     max_k_bytes_per_read = max_k_bytes_per_read_;
     username = username_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     load_timeout = load_timeout_;
     write_buffer_size = write_buffer_size_;
     max_file_size = max_file_size_;
     keep_csv_files = keep_csv_files_;
   }
    : ibm_db2_settings)

let make_microsoft_sql_server_settings ?port:(port_ : integer_optional option)
    ?bcp_packet_size:(bcp_packet_size_ : integer_optional option)
    ?database_name:(database_name_ : string_ option)
    ?control_tables_file_group:(control_tables_file_group_ : string_ option)
    ?password:(password_ : secret_string option)
    ?query_single_always_on_node:(query_single_always_on_node_ : boolean_optional option)
    ?read_backup_only:(read_backup_only_ : boolean_optional option)
    ?safeguard_policy:(safeguard_policy_ : safeguard_policy option)
    ?server_name:(server_name_ : string_ option) ?username:(username_ : string_ option)
    ?use_bcp_full_load:(use_bcp_full_load_ : boolean_optional option)
    ?use_third_party_backup_device:(use_third_party_backup_device_ : boolean_optional option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?trim_space_in_char:(trim_space_in_char_ : boolean_optional option)
    ?tlog_access_mode:(tlog_access_mode_ : tlog_access_mode option)
    ?force_lob_lookup:(force_lob_lookup_ : boolean_optional option)
    ?authentication_method:(authentication_method_ : sql_server_authentication_method option) () =
  ({
     port = port_;
     bcp_packet_size = bcp_packet_size_;
     database_name = database_name_;
     control_tables_file_group = control_tables_file_group_;
     password = password_;
     query_single_always_on_node = query_single_always_on_node_;
     read_backup_only = read_backup_only_;
     safeguard_policy = safeguard_policy_;
     server_name = server_name_;
     username = username_;
     use_bcp_full_load = use_bcp_full_load_;
     use_third_party_backup_device = use_third_party_backup_device_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     trim_space_in_char = trim_space_in_char_;
     tlog_access_mode = tlog_access_mode_;
     force_lob_lookup = force_lob_lookup_;
     authentication_method = authentication_method_;
   }
    : microsoft_sql_server_settings)

let make_sybase_settings ?database_name:(database_name_ : string_ option)
    ?password:(password_ : secret_string option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) ?username:(username_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option) () =
  ({
     database_name = database_name_;
     password = password_;
     port = port_;
     server_name = server_name_;
     username = username_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
   }
    : sybase_settings)

let make_oracle_settings
    ?add_supplemental_logging:(add_supplemental_logging_ : boolean_optional option)
    ?archived_log_dest_id:(archived_log_dest_id_ : integer_optional option)
    ?additional_archived_log_dest_id:(additional_archived_log_dest_id_ : integer_optional option)
    ?extra_archived_log_dest_ids:(extra_archived_log_dest_ids_ : integer_list option)
    ?allow_select_nested_tables:(allow_select_nested_tables_ : boolean_optional option)
    ?parallel_asm_read_threads:(parallel_asm_read_threads_ : integer_optional option)
    ?read_ahead_blocks:(read_ahead_blocks_ : integer_optional option)
    ?access_alternate_directly:(access_alternate_directly_ : boolean_optional option)
    ?use_alternate_folder_for_online:(use_alternate_folder_for_online_ : boolean_optional option)
    ?oracle_path_prefix:(oracle_path_prefix_ : string_ option)
    ?use_path_prefix:(use_path_prefix_ : string_ option)
    ?replace_path_prefix:(replace_path_prefix_ : boolean_optional option)
    ?enable_homogenous_tablespace:(enable_homogenous_tablespace_ : boolean_optional option)
    ?direct_path_no_log:(direct_path_no_log_ : boolean_optional option)
    ?archived_logs_only:(archived_logs_only_ : boolean_optional option)
    ?asm_password:(asm_password_ : secret_string option) ?asm_server:(asm_server_ : string_ option)
    ?asm_user:(asm_user_ : string_ option)
    ?char_length_semantics:(char_length_semantics_ : char_length_semantics option)
    ?database_name:(database_name_ : string_ option)
    ?direct_path_parallel_load:(direct_path_parallel_load_ : boolean_optional option)
    ?fail_tasks_on_lob_truncation:(fail_tasks_on_lob_truncation_ : boolean_optional option)
    ?number_datatype_scale:(number_datatype_scale_ : integer_optional option)
    ?password:(password_ : secret_string option) ?port:(port_ : integer_optional option)
    ?read_table_space_name:(read_table_space_name_ : boolean_optional option)
    ?retry_interval:(retry_interval_ : integer_optional option)
    ?security_db_encryption:(security_db_encryption_ : secret_string option)
    ?security_db_encryption_name:(security_db_encryption_name_ : string_ option)
    ?server_name:(server_name_ : string_ option)
    ?spatial_data_option_to_geo_json_function_name:
      (spatial_data_option_to_geo_json_function_name_ : string_ option)
    ?standby_delay_time:(standby_delay_time_ : integer_optional option)
    ?username:(username_ : string_ option) ?use_b_file:(use_b_file_ : boolean_optional option)
    ?use_direct_path_full_load:(use_direct_path_full_load_ : boolean_optional option)
    ?use_logminer_reader:(use_logminer_reader_ : boolean_optional option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?secrets_manager_oracle_asm_access_role_arn:
      (secrets_manager_oracle_asm_access_role_arn_ : string_ option)
    ?secrets_manager_oracle_asm_secret_id:(secrets_manager_oracle_asm_secret_id_ : string_ option)
    ?trim_space_in_char:(trim_space_in_char_ : boolean_optional option)
    ?convert_timestamp_with_zone_to_ut_c:
      (convert_timestamp_with_zone_to_ut_c_ : boolean_optional option)
    ?open_transaction_window:(open_transaction_window_ : integer_optional option)
    ?authentication_method:(authentication_method_ : oracle_authentication_method option) () =
  ({
     add_supplemental_logging = add_supplemental_logging_;
     archived_log_dest_id = archived_log_dest_id_;
     additional_archived_log_dest_id = additional_archived_log_dest_id_;
     extra_archived_log_dest_ids = extra_archived_log_dest_ids_;
     allow_select_nested_tables = allow_select_nested_tables_;
     parallel_asm_read_threads = parallel_asm_read_threads_;
     read_ahead_blocks = read_ahead_blocks_;
     access_alternate_directly = access_alternate_directly_;
     use_alternate_folder_for_online = use_alternate_folder_for_online_;
     oracle_path_prefix = oracle_path_prefix_;
     use_path_prefix = use_path_prefix_;
     replace_path_prefix = replace_path_prefix_;
     enable_homogenous_tablespace = enable_homogenous_tablespace_;
     direct_path_no_log = direct_path_no_log_;
     archived_logs_only = archived_logs_only_;
     asm_password = asm_password_;
     asm_server = asm_server_;
     asm_user = asm_user_;
     char_length_semantics = char_length_semantics_;
     database_name = database_name_;
     direct_path_parallel_load = direct_path_parallel_load_;
     fail_tasks_on_lob_truncation = fail_tasks_on_lob_truncation_;
     number_datatype_scale = number_datatype_scale_;
     password = password_;
     port = port_;
     read_table_space_name = read_table_space_name_;
     retry_interval = retry_interval_;
     security_db_encryption = security_db_encryption_;
     security_db_encryption_name = security_db_encryption_name_;
     server_name = server_name_;
     spatial_data_option_to_geo_json_function_name = spatial_data_option_to_geo_json_function_name_;
     standby_delay_time = standby_delay_time_;
     username = username_;
     use_b_file = use_b_file_;
     use_direct_path_full_load = use_direct_path_full_load_;
     use_logminer_reader = use_logminer_reader_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     secrets_manager_oracle_asm_access_role_arn = secrets_manager_oracle_asm_access_role_arn_;
     secrets_manager_oracle_asm_secret_id = secrets_manager_oracle_asm_secret_id_;
     trim_space_in_char = trim_space_in_char_;
     convert_timestamp_with_zone_to_ut_c = convert_timestamp_with_zone_to_ut_c_;
     open_transaction_window = open_transaction_window_;
     authentication_method = authentication_method_;
   }
    : oracle_settings)

let make_my_sql_settings ?after_connect_script:(after_connect_script_ : string_ option)
    ?clean_source_metadata_on_mismatch:
      (clean_source_metadata_on_mismatch_ : boolean_optional option)
    ?database_name:(database_name_ : string_ option)
    ?events_poll_interval:(events_poll_interval_ : integer_optional option)
    ?target_db_type:(target_db_type_ : target_db_type option)
    ?max_file_size:(max_file_size_ : integer_optional option)
    ?parallel_load_threads:(parallel_load_threads_ : integer_optional option)
    ?password:(password_ : secret_string option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option)
    ?server_timezone:(server_timezone_ : string_ option) ?username:(username_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?execute_timeout:(execute_timeout_ : integer_optional option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?authentication_method:(authentication_method_ : my_sql_authentication_method option) () =
  ({
     after_connect_script = after_connect_script_;
     clean_source_metadata_on_mismatch = clean_source_metadata_on_mismatch_;
     database_name = database_name_;
     events_poll_interval = events_poll_interval_;
     target_db_type = target_db_type_;
     max_file_size = max_file_size_;
     parallel_load_threads = parallel_load_threads_;
     password = password_;
     port = port_;
     server_name = server_name_;
     server_timezone = server_timezone_;
     username = username_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     execute_timeout = execute_timeout_;
     service_access_role_arn = service_access_role_arn_;
     authentication_method = authentication_method_;
   }
    : my_sql_settings)

let make_postgre_sql_settings ?after_connect_script:(after_connect_script_ : string_ option)
    ?capture_ddls:(capture_ddls_ : boolean_optional option)
    ?max_file_size:(max_file_size_ : integer_optional option)
    ?database_name:(database_name_ : string_ option)
    ?ddl_artifacts_schema:(ddl_artifacts_schema_ : string_ option)
    ?execute_timeout:(execute_timeout_ : integer_optional option)
    ?fail_tasks_on_lob_truncation:(fail_tasks_on_lob_truncation_ : boolean_optional option)
    ?heartbeat_enable:(heartbeat_enable_ : boolean_optional option)
    ?heartbeat_schema:(heartbeat_schema_ : string_ option)
    ?heartbeat_frequency:(heartbeat_frequency_ : integer_optional option)
    ?password:(password_ : secret_string option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) ?username:(username_ : string_ option)
    ?slot_name:(slot_name_ : string_ option) ?plugin_name:(plugin_name_ : plugin_name_value option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?trim_space_in_char:(trim_space_in_char_ : boolean_optional option)
    ?map_boolean_as_boolean:(map_boolean_as_boolean_ : boolean_optional option)
    ?map_jsonb_as_clob:(map_jsonb_as_clob_ : boolean_optional option)
    ?map_long_varchar_as:(map_long_varchar_as_ : long_varchar_mapping_type option)
    ?database_mode:(database_mode_ : database_mode option)
    ?babelfish_database_name:(babelfish_database_name_ : string_ option)
    ?disable_unicode_source_filter:(disable_unicode_source_filter_ : boolean_optional option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?authentication_method:(authentication_method_ : postgre_sql_authentication_method option) () =
  ({
     after_connect_script = after_connect_script_;
     capture_ddls = capture_ddls_;
     max_file_size = max_file_size_;
     database_name = database_name_;
     ddl_artifacts_schema = ddl_artifacts_schema_;
     execute_timeout = execute_timeout_;
     fail_tasks_on_lob_truncation = fail_tasks_on_lob_truncation_;
     heartbeat_enable = heartbeat_enable_;
     heartbeat_schema = heartbeat_schema_;
     heartbeat_frequency = heartbeat_frequency_;
     password = password_;
     port = port_;
     server_name = server_name_;
     username = username_;
     slot_name = slot_name_;
     plugin_name = plugin_name_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     trim_space_in_char = trim_space_in_char_;
     map_boolean_as_boolean = map_boolean_as_boolean_;
     map_jsonb_as_clob = map_jsonb_as_clob_;
     map_long_varchar_as = map_long_varchar_as_;
     database_mode = database_mode_;
     babelfish_database_name = babelfish_database_name_;
     disable_unicode_source_filter = disable_unicode_source_filter_;
     service_access_role_arn = service_access_role_arn_;
     authentication_method = authentication_method_;
   }
    : postgre_sql_settings)

let make_redshift_settings ?accept_any_date:(accept_any_date_ : boolean_optional option)
    ?after_connect_script:(after_connect_script_ : string_ option)
    ?bucket_folder:(bucket_folder_ : string_ option) ?bucket_name:(bucket_name_ : string_ option)
    ?case_sensitive_names:(case_sensitive_names_ : boolean_optional option)
    ?comp_update:(comp_update_ : boolean_optional option)
    ?connection_timeout:(connection_timeout_ : integer_optional option)
    ?database_name:(database_name_ : string_ option) ?date_format:(date_format_ : string_ option)
    ?empty_as_null:(empty_as_null_ : boolean_optional option)
    ?encryption_mode:(encryption_mode_ : encryption_mode_value option)
    ?explicit_ids:(explicit_ids_ : boolean_optional option)
    ?file_transfer_upload_streams:(file_transfer_upload_streams_ : integer_optional option)
    ?load_timeout:(load_timeout_ : integer_optional option)
    ?max_file_size:(max_file_size_ : integer_optional option)
    ?password:(password_ : secret_string option) ?port:(port_ : integer_optional option)
    ?remove_quotes:(remove_quotes_ : boolean_optional option)
    ?replace_invalid_chars:(replace_invalid_chars_ : string_ option)
    ?replace_chars:(replace_chars_ : string_ option) ?server_name:(server_name_ : string_ option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?server_side_encryption_kms_key_id:(server_side_encryption_kms_key_id_ : string_ option)
    ?time_format:(time_format_ : string_ option)
    ?trim_blanks:(trim_blanks_ : boolean_optional option)
    ?truncate_columns:(truncate_columns_ : boolean_optional option)
    ?username:(username_ : string_ option)
    ?write_buffer_size:(write_buffer_size_ : integer_optional option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?map_boolean_as_boolean:(map_boolean_as_boolean_ : boolean_optional option) () =
  ({
     accept_any_date = accept_any_date_;
     after_connect_script = after_connect_script_;
     bucket_folder = bucket_folder_;
     bucket_name = bucket_name_;
     case_sensitive_names = case_sensitive_names_;
     comp_update = comp_update_;
     connection_timeout = connection_timeout_;
     database_name = database_name_;
     date_format = date_format_;
     empty_as_null = empty_as_null_;
     encryption_mode = encryption_mode_;
     explicit_ids = explicit_ids_;
     file_transfer_upload_streams = file_transfer_upload_streams_;
     load_timeout = load_timeout_;
     max_file_size = max_file_size_;
     password = password_;
     port = port_;
     remove_quotes = remove_quotes_;
     replace_invalid_chars = replace_invalid_chars_;
     replace_chars = replace_chars_;
     server_name = server_name_;
     service_access_role_arn = service_access_role_arn_;
     server_side_encryption_kms_key_id = server_side_encryption_kms_key_id_;
     time_format = time_format_;
     trim_blanks = trim_blanks_;
     truncate_columns = truncate_columns_;
     username = username_;
     write_buffer_size = write_buffer_size_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     map_boolean_as_boolean = map_boolean_as_boolean_;
   }
    : redshift_settings)

let make_neptune_settings ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?error_retry_duration:(error_retry_duration_ : integer_optional option)
    ?max_file_size:(max_file_size_ : integer_optional option)
    ?max_retry_count:(max_retry_count_ : integer_optional option)
    ?iam_auth_enabled:(iam_auth_enabled_ : boolean_optional option)
    ~s3_bucket_name:(s3_bucket_name_ : string_) ~s3_bucket_folder:(s3_bucket_folder_ : string_) () =
  ({
     service_access_role_arn = service_access_role_arn_;
     s3_bucket_name = s3_bucket_name_;
     s3_bucket_folder = s3_bucket_folder_;
     error_retry_duration = error_retry_duration_;
     max_file_size = max_file_size_;
     max_retry_count = max_retry_count_;
     iam_auth_enabled = iam_auth_enabled_;
   }
    : neptune_settings)

let make_elasticsearch_settings
    ?full_load_error_percentage:(full_load_error_percentage_ : integer_optional option)
    ?error_retry_duration:(error_retry_duration_ : integer_optional option)
    ?use_new_mapping_type:(use_new_mapping_type_ : boolean_optional option)
    ~service_access_role_arn:(service_access_role_arn_ : string_)
    ~endpoint_uri:(endpoint_uri_ : string_) () =
  ({
     service_access_role_arn = service_access_role_arn_;
     endpoint_uri = endpoint_uri_;
     full_load_error_percentage = full_load_error_percentage_;
     error_retry_duration = error_retry_duration_;
     use_new_mapping_type = use_new_mapping_type_;
   }
    : elasticsearch_settings)

let make_kafka_settings ?broker:(broker_ : string_ option) ?topic:(topic_ : string_ option)
    ?message_format:(message_format_ : message_format_value option)
    ?include_transaction_details:(include_transaction_details_ : boolean_optional option)
    ?include_partition_value:(include_partition_value_ : boolean_optional option)
    ?partition_include_schema_table:(partition_include_schema_table_ : boolean_optional option)
    ?include_table_alter_operations:(include_table_alter_operations_ : boolean_optional option)
    ?include_control_details:(include_control_details_ : boolean_optional option)
    ?message_max_bytes:(message_max_bytes_ : integer_optional option)
    ?include_null_and_empty:(include_null_and_empty_ : boolean_optional option)
    ?security_protocol:(security_protocol_ : kafka_security_protocol option)
    ?ssl_client_certificate_arn:(ssl_client_certificate_arn_ : string_ option)
    ?ssl_client_key_arn:(ssl_client_key_arn_ : string_ option)
    ?ssl_client_key_password:(ssl_client_key_password_ : secret_string option)
    ?ssl_ca_certificate_arn:(ssl_ca_certificate_arn_ : string_ option)
    ?sasl_username:(sasl_username_ : string_ option)
    ?sasl_password:(sasl_password_ : secret_string option)
    ?no_hex_prefix:(no_hex_prefix_ : boolean_optional option)
    ?sasl_mechanism:(sasl_mechanism_ : kafka_sasl_mechanism option)
    ?ssl_endpoint_identification_algorithm:
      (ssl_endpoint_identification_algorithm_ : kafka_ssl_endpoint_identification_algorithm option)
    ?use_large_integer_value:(use_large_integer_value_ : boolean_optional option) () =
  ({
     broker = broker_;
     topic = topic_;
     message_format = message_format_;
     include_transaction_details = include_transaction_details_;
     include_partition_value = include_partition_value_;
     partition_include_schema_table = partition_include_schema_table_;
     include_table_alter_operations = include_table_alter_operations_;
     include_control_details = include_control_details_;
     message_max_bytes = message_max_bytes_;
     include_null_and_empty = include_null_and_empty_;
     security_protocol = security_protocol_;
     ssl_client_certificate_arn = ssl_client_certificate_arn_;
     ssl_client_key_arn = ssl_client_key_arn_;
     ssl_client_key_password = ssl_client_key_password_;
     ssl_ca_certificate_arn = ssl_ca_certificate_arn_;
     sasl_username = sasl_username_;
     sasl_password = sasl_password_;
     no_hex_prefix = no_hex_prefix_;
     sasl_mechanism = sasl_mechanism_;
     ssl_endpoint_identification_algorithm = ssl_endpoint_identification_algorithm_;
     use_large_integer_value = use_large_integer_value_;
   }
    : kafka_settings)

let make_kinesis_settings ?stream_arn:(stream_arn_ : string_ option)
    ?message_format:(message_format_ : message_format_value option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?include_transaction_details:(include_transaction_details_ : boolean_optional option)
    ?include_partition_value:(include_partition_value_ : boolean_optional option)
    ?partition_include_schema_table:(partition_include_schema_table_ : boolean_optional option)
    ?include_table_alter_operations:(include_table_alter_operations_ : boolean_optional option)
    ?include_control_details:(include_control_details_ : boolean_optional option)
    ?include_null_and_empty:(include_null_and_empty_ : boolean_optional option)
    ?no_hex_prefix:(no_hex_prefix_ : boolean_optional option)
    ?use_large_integer_value:(use_large_integer_value_ : boolean_optional option) () =
  ({
     stream_arn = stream_arn_;
     message_format = message_format_;
     service_access_role_arn = service_access_role_arn_;
     include_transaction_details = include_transaction_details_;
     include_partition_value = include_partition_value_;
     partition_include_schema_table = partition_include_schema_table_;
     include_table_alter_operations = include_table_alter_operations_;
     include_control_details = include_control_details_;
     include_null_and_empty = include_null_and_empty_;
     no_hex_prefix = no_hex_prefix_;
     use_large_integer_value = use_large_integer_value_;
   }
    : kinesis_settings)

let make_mongo_db_settings ?username:(username_ : string_ option)
    ?password:(password_ : secret_string option) ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?database_name:(database_name_ : string_ option)
    ?auth_type:(auth_type_ : auth_type_value option)
    ?auth_mechanism:(auth_mechanism_ : auth_mechanism_value option)
    ?nesting_level:(nesting_level_ : nesting_level_value option)
    ?extract_doc_id:(extract_doc_id_ : string_ option)
    ?docs_to_investigate:(docs_to_investigate_ : string_ option)
    ?auth_source:(auth_source_ : string_ option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?use_update_look_up:(use_update_look_up_ : boolean_optional option)
    ?replicate_shard_collections:(replicate_shard_collections_ : boolean_optional option) () =
  ({
     username = username_;
     password = password_;
     server_name = server_name_;
     port = port_;
     database_name = database_name_;
     auth_type = auth_type_;
     auth_mechanism = auth_mechanism_;
     nesting_level = nesting_level_;
     extract_doc_id = extract_doc_id_;
     docs_to_investigate = docs_to_investigate_;
     auth_source = auth_source_;
     kms_key_id = kms_key_id_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     use_update_look_up = use_update_look_up_;
     replicate_shard_collections = replicate_shard_collections_;
   }
    : mongo_db_settings)

let make_dms_transfer_settings ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?bucket_name:(bucket_name_ : string_ option) () =
  ({ service_access_role_arn = service_access_role_arn_; bucket_name = bucket_name_ }
    : dms_transfer_settings)

let make_s3_settings ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?external_table_definition:(external_table_definition_ : string_ option)
    ?csv_row_delimiter:(csv_row_delimiter_ : string_ option)
    ?csv_delimiter:(csv_delimiter_ : string_ option)
    ?bucket_folder:(bucket_folder_ : string_ option) ?bucket_name:(bucket_name_ : string_ option)
    ?compression_type:(compression_type_ : compression_type_value option)
    ?encryption_mode:(encryption_mode_ : encryption_mode_value option)
    ?server_side_encryption_kms_key_id:(server_side_encryption_kms_key_id_ : string_ option)
    ?data_format:(data_format_ : data_format_value option)
    ?encoding_type:(encoding_type_ : encoding_type_value option)
    ?dict_page_size_limit:(dict_page_size_limit_ : integer_optional option)
    ?row_group_length:(row_group_length_ : integer_optional option)
    ?data_page_size:(data_page_size_ : integer_optional option)
    ?parquet_version:(parquet_version_ : parquet_version_value option)
    ?enable_statistics:(enable_statistics_ : boolean_optional option)
    ?include_op_for_full_load:(include_op_for_full_load_ : boolean_optional option)
    ?cdc_inserts_only:(cdc_inserts_only_ : boolean_optional option)
    ?timestamp_column_name:(timestamp_column_name_ : string_ option)
    ?parquet_timestamp_in_millisecond:(parquet_timestamp_in_millisecond_ : boolean_optional option)
    ?cdc_inserts_and_updates:(cdc_inserts_and_updates_ : boolean_optional option)
    ?date_partition_enabled:(date_partition_enabled_ : boolean_optional option)
    ?date_partition_sequence:(date_partition_sequence_ : date_partition_sequence_value option)
    ?date_partition_delimiter:(date_partition_delimiter_ : date_partition_delimiter_value option)
    ?use_csv_no_sup_value:(use_csv_no_sup_value_ : boolean_optional option)
    ?csv_no_sup_value:(csv_no_sup_value_ : string_ option)
    ?preserve_transactions:(preserve_transactions_ : boolean_optional option)
    ?cdc_path:(cdc_path_ : string_ option)
    ?use_task_start_time_for_full_load_timestamp:
      (use_task_start_time_for_full_load_timestamp_ : boolean_optional option)
    ?canned_acl_for_objects:(canned_acl_for_objects_ : canned_acl_for_objects_value option)
    ?add_column_name:(add_column_name_ : boolean_optional option)
    ?cdc_max_batch_interval:(cdc_max_batch_interval_ : integer_optional option)
    ?cdc_min_file_size:(cdc_min_file_size_ : integer_optional option)
    ?csv_null_value:(csv_null_value_ : string_ option)
    ?ignore_header_rows:(ignore_header_rows_ : integer_optional option)
    ?max_file_size:(max_file_size_ : integer_optional option)
    ?rfc4180:(rfc4180_ : boolean_optional option)
    ?date_partition_timezone:(date_partition_timezone_ : string_ option)
    ?add_trailing_padding_character:(add_trailing_padding_character_ : boolean_optional option)
    ?expected_bucket_owner:(expected_bucket_owner_ : string_ option)
    ?glue_catalog_generation:(glue_catalog_generation_ : boolean_optional option) () =
  ({
     service_access_role_arn = service_access_role_arn_;
     external_table_definition = external_table_definition_;
     csv_row_delimiter = csv_row_delimiter_;
     csv_delimiter = csv_delimiter_;
     bucket_folder = bucket_folder_;
     bucket_name = bucket_name_;
     compression_type = compression_type_;
     encryption_mode = encryption_mode_;
     server_side_encryption_kms_key_id = server_side_encryption_kms_key_id_;
     data_format = data_format_;
     encoding_type = encoding_type_;
     dict_page_size_limit = dict_page_size_limit_;
     row_group_length = row_group_length_;
     data_page_size = data_page_size_;
     parquet_version = parquet_version_;
     enable_statistics = enable_statistics_;
     include_op_for_full_load = include_op_for_full_load_;
     cdc_inserts_only = cdc_inserts_only_;
     timestamp_column_name = timestamp_column_name_;
     parquet_timestamp_in_millisecond = parquet_timestamp_in_millisecond_;
     cdc_inserts_and_updates = cdc_inserts_and_updates_;
     date_partition_enabled = date_partition_enabled_;
     date_partition_sequence = date_partition_sequence_;
     date_partition_delimiter = date_partition_delimiter_;
     use_csv_no_sup_value = use_csv_no_sup_value_;
     csv_no_sup_value = csv_no_sup_value_;
     preserve_transactions = preserve_transactions_;
     cdc_path = cdc_path_;
     use_task_start_time_for_full_load_timestamp = use_task_start_time_for_full_load_timestamp_;
     canned_acl_for_objects = canned_acl_for_objects_;
     add_column_name = add_column_name_;
     cdc_max_batch_interval = cdc_max_batch_interval_;
     cdc_min_file_size = cdc_min_file_size_;
     csv_null_value = csv_null_value_;
     ignore_header_rows = ignore_header_rows_;
     max_file_size = max_file_size_;
     rfc4180 = rfc4180_;
     date_partition_timezone = date_partition_timezone_;
     add_trailing_padding_character = add_trailing_padding_character_;
     expected_bucket_owner = expected_bucket_owner_;
     glue_catalog_generation = glue_catalog_generation_;
   }
    : s3_settings)

let make_dynamo_db_settings ~service_access_role_arn:(service_access_role_arn_ : string_) () =
  ({ service_access_role_arn = service_access_role_arn_ } : dynamo_db_settings)

let make_endpoint ?endpoint_identifier:(endpoint_identifier_ : string_ option)
    ?endpoint_type:(endpoint_type_ : replication_endpoint_type_value option)
    ?engine_name:(engine_name_ : string_ option)
    ?engine_display_name:(engine_display_name_ : string_ option)
    ?username:(username_ : string_ option) ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?database_name:(database_name_ : string_ option)
    ?extra_connection_attributes:(extra_connection_attributes_ : string_ option)
    ?status:(status_ : string_ option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?endpoint_arn:(endpoint_arn_ : string_ option)
    ?certificate_arn:(certificate_arn_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?external_table_definition:(external_table_definition_ : string_ option)
    ?external_id:(external_id_ : string_ option)
    ?is_read_only:(is_read_only_ : boolean_optional option)
    ?dynamo_db_settings:(dynamo_db_settings_ : dynamo_db_settings option)
    ?s3_settings:(s3_settings_ : s3_settings option)
    ?dms_transfer_settings:(dms_transfer_settings_ : dms_transfer_settings option)
    ?mongo_db_settings:(mongo_db_settings_ : mongo_db_settings option)
    ?kinesis_settings:(kinesis_settings_ : kinesis_settings option)
    ?kafka_settings:(kafka_settings_ : kafka_settings option)
    ?elasticsearch_settings:(elasticsearch_settings_ : elasticsearch_settings option)
    ?neptune_settings:(neptune_settings_ : neptune_settings option)
    ?redshift_settings:(redshift_settings_ : redshift_settings option)
    ?postgre_sql_settings:(postgre_sql_settings_ : postgre_sql_settings option)
    ?my_sql_settings:(my_sql_settings_ : my_sql_settings option)
    ?oracle_settings:(oracle_settings_ : oracle_settings option)
    ?sybase_settings:(sybase_settings_ : sybase_settings option)
    ?microsoft_sql_server_settings:
      (microsoft_sql_server_settings_ : microsoft_sql_server_settings option)
    ?ibm_db2_settings:(ibm_db2_settings_ : ibm_db2_settings option)
    ?doc_db_settings:(doc_db_settings_ : doc_db_settings option)
    ?redis_settings:(redis_settings_ : redis_settings option)
    ?gcp_my_sql_settings:(gcp_my_sql_settings_ : gcp_my_sql_settings option)
    ?timestream_settings:(timestream_settings_ : timestream_settings option)
    ?lakehouse_settings:(lakehouse_settings_ : lakehouse_settings option) () =
  ({
     endpoint_identifier = endpoint_identifier_;
     endpoint_type = endpoint_type_;
     engine_name = engine_name_;
     engine_display_name = engine_display_name_;
     username = username_;
     server_name = server_name_;
     port = port_;
     database_name = database_name_;
     extra_connection_attributes = extra_connection_attributes_;
     status = status_;
     kms_key_id = kms_key_id_;
     endpoint_arn = endpoint_arn_;
     certificate_arn = certificate_arn_;
     ssl_mode = ssl_mode_;
     service_access_role_arn = service_access_role_arn_;
     external_table_definition = external_table_definition_;
     external_id = external_id_;
     is_read_only = is_read_only_;
     dynamo_db_settings = dynamo_db_settings_;
     s3_settings = s3_settings_;
     dms_transfer_settings = dms_transfer_settings_;
     mongo_db_settings = mongo_db_settings_;
     kinesis_settings = kinesis_settings_;
     kafka_settings = kafka_settings_;
     elasticsearch_settings = elasticsearch_settings_;
     neptune_settings = neptune_settings_;
     redshift_settings = redshift_settings_;
     postgre_sql_settings = postgre_sql_settings_;
     my_sql_settings = my_sql_settings_;
     oracle_settings = oracle_settings_;
     sybase_settings = sybase_settings_;
     microsoft_sql_server_settings = microsoft_sql_server_settings_;
     ibm_db2_settings = ibm_db2_settings_;
     doc_db_settings = doc_db_settings_;
     redis_settings = redis_settings_;
     gcp_my_sql_settings = gcp_my_sql_settings_;
     timestream_settings = timestream_settings_;
     lakehouse_settings = lakehouse_settings_;
   }
    : endpoint)

let make_modify_endpoint_response ?endpoint:(endpoint_ : endpoint option) () =
  ({ endpoint = endpoint_ } : modify_endpoint_response)

let make_modify_endpoint_message ?endpoint_identifier:(endpoint_identifier_ : string_ option)
    ?endpoint_type:(endpoint_type_ : replication_endpoint_type_value option)
    ?engine_name:(engine_name_ : string_ option) ?username:(username_ : string_ option)
    ?password:(password_ : secret_string option) ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?database_name:(database_name_ : string_ option)
    ?extra_connection_attributes:(extra_connection_attributes_ : string_ option)
    ?certificate_arn:(certificate_arn_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?external_table_definition:(external_table_definition_ : string_ option)
    ?dynamo_db_settings:(dynamo_db_settings_ : dynamo_db_settings option)
    ?s3_settings:(s3_settings_ : s3_settings option)
    ?dms_transfer_settings:(dms_transfer_settings_ : dms_transfer_settings option)
    ?mongo_db_settings:(mongo_db_settings_ : mongo_db_settings option)
    ?kinesis_settings:(kinesis_settings_ : kinesis_settings option)
    ?kafka_settings:(kafka_settings_ : kafka_settings option)
    ?elasticsearch_settings:(elasticsearch_settings_ : elasticsearch_settings option)
    ?neptune_settings:(neptune_settings_ : neptune_settings option)
    ?redshift_settings:(redshift_settings_ : redshift_settings option)
    ?postgre_sql_settings:(postgre_sql_settings_ : postgre_sql_settings option)
    ?my_sql_settings:(my_sql_settings_ : my_sql_settings option)
    ?oracle_settings:(oracle_settings_ : oracle_settings option)
    ?sybase_settings:(sybase_settings_ : sybase_settings option)
    ?microsoft_sql_server_settings:
      (microsoft_sql_server_settings_ : microsoft_sql_server_settings option)
    ?ibm_db2_settings:(ibm_db2_settings_ : ibm_db2_settings option)
    ?doc_db_settings:(doc_db_settings_ : doc_db_settings option)
    ?redis_settings:(redis_settings_ : redis_settings option)
    ?exact_settings:(exact_settings_ : boolean_optional option)
    ?gcp_my_sql_settings:(gcp_my_sql_settings_ : gcp_my_sql_settings option)
    ?timestream_settings:(timestream_settings_ : timestream_settings option)
    ~endpoint_arn:(endpoint_arn_ : string_) () =
  ({
     endpoint_arn = endpoint_arn_;
     endpoint_identifier = endpoint_identifier_;
     endpoint_type = endpoint_type_;
     engine_name = engine_name_;
     username = username_;
     password = password_;
     server_name = server_name_;
     port = port_;
     database_name = database_name_;
     extra_connection_attributes = extra_connection_attributes_;
     certificate_arn = certificate_arn_;
     ssl_mode = ssl_mode_;
     service_access_role_arn = service_access_role_arn_;
     external_table_definition = external_table_definition_;
     dynamo_db_settings = dynamo_db_settings_;
     s3_settings = s3_settings_;
     dms_transfer_settings = dms_transfer_settings_;
     mongo_db_settings = mongo_db_settings_;
     kinesis_settings = kinesis_settings_;
     kafka_settings = kafka_settings_;
     elasticsearch_settings = elasticsearch_settings_;
     neptune_settings = neptune_settings_;
     redshift_settings = redshift_settings_;
     postgre_sql_settings = postgre_sql_settings_;
     my_sql_settings = my_sql_settings_;
     oracle_settings = oracle_settings_;
     sybase_settings = sybase_settings_;
     microsoft_sql_server_settings = microsoft_sql_server_settings_;
     ibm_db2_settings = ibm_db2_settings_;
     doc_db_settings = doc_db_settings_;
     redis_settings = redis_settings_;
     exact_settings = exact_settings_;
     gcp_my_sql_settings = gcp_my_sql_settings_;
     timestream_settings = timestream_settings_;
   }
    : modify_endpoint_message)

let make_mongo_db_data_provider_settings ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?database_name:(database_name_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?certificate_arn:(certificate_arn_ : string_ option)
    ?auth_type:(auth_type_ : auth_type_value option) ?auth_source:(auth_source_ : string_ option)
    ?auth_mechanism:(auth_mechanism_ : auth_mechanism_value option) () =
  ({
     server_name = server_name_;
     port = port_;
     database_name = database_name_;
     ssl_mode = ssl_mode_;
     certificate_arn = certificate_arn_;
     auth_type = auth_type_;
     auth_source = auth_source_;
     auth_mechanism = auth_mechanism_;
   }
    : mongo_db_data_provider_settings)

let make_ibm_db2z_os_data_provider_settings ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?database_name:(database_name_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?certificate_arn:(certificate_arn_ : string_ option) ?s3_path:(s3_path_ : string_ option)
    ?s3_access_role_arn:(s3_access_role_arn_ : string_ option) () =
  ({
     server_name = server_name_;
     port = port_;
     database_name = database_name_;
     ssl_mode = ssl_mode_;
     certificate_arn = certificate_arn_;
     s3_path = s3_path_;
     s3_access_role_arn = s3_access_role_arn_;
   }
    : ibm_db2z_os_data_provider_settings)

let make_ibm_db2_luw_data_provider_settings ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?database_name:(database_name_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?certificate_arn:(certificate_arn_ : string_ option)
    ?encryption_algorithm:(encryption_algorithm_ : integer_optional option)
    ?security_mechanism:(security_mechanism_ : integer_optional option)
    ?s3_path:(s3_path_ : string_ option) ?s3_access_role_arn:(s3_access_role_arn_ : string_ option)
    () =
  ({
     server_name = server_name_;
     port = port_;
     database_name = database_name_;
     ssl_mode = ssl_mode_;
     certificate_arn = certificate_arn_;
     encryption_algorithm = encryption_algorithm_;
     security_mechanism = security_mechanism_;
     s3_path = s3_path_;
     s3_access_role_arn = s3_access_role_arn_;
   }
    : ibm_db2_luw_data_provider_settings)

let make_maria_db_data_provider_settings ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?certificate_arn:(certificate_arn_ : string_ option) ?s3_path:(s3_path_ : string_ option)
    ?s3_access_role_arn:(s3_access_role_arn_ : string_ option) () =
  ({
     server_name = server_name_;
     port = port_;
     ssl_mode = ssl_mode_;
     certificate_arn = certificate_arn_;
     s3_path = s3_path_;
     s3_access_role_arn = s3_access_role_arn_;
   }
    : maria_db_data_provider_settings)

let make_doc_db_data_provider_settings ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?database_name:(database_name_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?certificate_arn:(certificate_arn_ : string_ option) () =
  ({
     server_name = server_name_;
     port = port_;
     database_name = database_name_;
     ssl_mode = ssl_mode_;
     certificate_arn = certificate_arn_;
   }
    : doc_db_data_provider_settings)

let make_microsoft_sql_server_data_provider_settings ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?database_name:(database_name_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?certificate_arn:(certificate_arn_ : string_ option) ?s3_path:(s3_path_ : string_ option)
    ?s3_access_role_arn:(s3_access_role_arn_ : string_ option) () =
  ({
     server_name = server_name_;
     port = port_;
     database_name = database_name_;
     ssl_mode = ssl_mode_;
     certificate_arn = certificate_arn_;
     s3_path = s3_path_;
     s3_access_role_arn = s3_access_role_arn_;
   }
    : microsoft_sql_server_data_provider_settings)

let make_sybase_ase_data_provider_settings ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?database_name:(database_name_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?encrypt_password:(encrypt_password_ : boolean_optional option)
    ?certificate_arn:(certificate_arn_ : string_ option) () =
  ({
     server_name = server_name_;
     port = port_;
     database_name = database_name_;
     ssl_mode = ssl_mode_;
     encrypt_password = encrypt_password_;
     certificate_arn = certificate_arn_;
   }
    : sybase_ase_data_provider_settings)

let make_oracle_data_provider_settings ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?database_name:(database_name_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?certificate_arn:(certificate_arn_ : string_ option) ?asm_server:(asm_server_ : string_ option)
    ?secrets_manager_oracle_asm_secret_id:(secrets_manager_oracle_asm_secret_id_ : string_ option)
    ?secrets_manager_oracle_asm_access_role_arn:
      (secrets_manager_oracle_asm_access_role_arn_ : string_ option)
    ?secrets_manager_security_db_encryption_secret_id:
      (secrets_manager_security_db_encryption_secret_id_ : string_ option)
    ?secrets_manager_security_db_encryption_access_role_arn:
      (secrets_manager_security_db_encryption_access_role_arn_ : string_ option)
    ?s3_path:(s3_path_ : string_ option) ?s3_access_role_arn:(s3_access_role_arn_ : string_ option)
    () =
  ({
     server_name = server_name_;
     port = port_;
     database_name = database_name_;
     ssl_mode = ssl_mode_;
     certificate_arn = certificate_arn_;
     asm_server = asm_server_;
     secrets_manager_oracle_asm_secret_id = secrets_manager_oracle_asm_secret_id_;
     secrets_manager_oracle_asm_access_role_arn = secrets_manager_oracle_asm_access_role_arn_;
     secrets_manager_security_db_encryption_secret_id =
       secrets_manager_security_db_encryption_secret_id_;
     secrets_manager_security_db_encryption_access_role_arn =
       secrets_manager_security_db_encryption_access_role_arn_;
     s3_path = s3_path_;
     s3_access_role_arn = s3_access_role_arn_;
   }
    : oracle_data_provider_settings)

let make_my_sql_data_provider_settings ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?certificate_arn:(certificate_arn_ : string_ option) ?s3_path:(s3_path_ : string_ option)
    ?s3_access_role_arn:(s3_access_role_arn_ : string_ option) () =
  ({
     server_name = server_name_;
     port = port_;
     ssl_mode = ssl_mode_;
     certificate_arn = certificate_arn_;
     s3_path = s3_path_;
     s3_access_role_arn = s3_access_role_arn_;
   }
    : my_sql_data_provider_settings)

let make_postgre_sql_data_provider_settings ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?database_name:(database_name_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?certificate_arn:(certificate_arn_ : string_ option) ?s3_path:(s3_path_ : string_ option)
    ?s3_access_role_arn:(s3_access_role_arn_ : string_ option) () =
  ({
     server_name = server_name_;
     port = port_;
     database_name = database_name_;
     ssl_mode = ssl_mode_;
     certificate_arn = certificate_arn_;
     s3_path = s3_path_;
     s3_access_role_arn = s3_access_role_arn_;
   }
    : postgre_sql_data_provider_settings)

let make_redshift_data_provider_settings ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?database_name:(database_name_ : string_ option)
    ?s3_path:(s3_path_ : string_ option) ?s3_access_role_arn:(s3_access_role_arn_ : string_ option)
    () =
  ({
     server_name = server_name_;
     port = port_;
     database_name = database_name_;
     s3_path = s3_path_;
     s3_access_role_arn = s3_access_role_arn_;
   }
    : redshift_data_provider_settings)

let make_data_provider ?data_provider_name:(data_provider_name_ : string_ option)
    ?data_provider_arn:(data_provider_arn_ : string_ option)
    ?data_provider_creation_time:(data_provider_creation_time_ : iso8601_date_time option)
    ?description:(description_ : string_ option) ?engine:(engine_ : string_ option)
    ?\#virtual:(virtual_ : boolean_optional option)
    ?settings:(settings_ : data_provider_settings option) () =
  ({
     data_provider_name = data_provider_name_;
     data_provider_arn = data_provider_arn_;
     data_provider_creation_time = data_provider_creation_time_;
     description = description_;
     engine = engine_;
     \#virtual = virtual_;
     settings = settings_;
   }
    : data_provider)

let make_modify_data_provider_response ?data_provider:(data_provider_ : data_provider option) () =
  ({ data_provider = data_provider_ } : modify_data_provider_response)

let make_modify_data_provider_message ?data_provider_name:(data_provider_name_ : string_ option)
    ?description:(description_ : string_ option) ?engine:(engine_ : string_ option)
    ?\#virtual:(virtual_ : boolean_optional option)
    ?exact_settings:(exact_settings_ : boolean_optional option)
    ?settings:(settings_ : data_provider_settings option)
    ~data_provider_identifier:(data_provider_identifier_ : string_) () =
  ({
     data_provider_identifier = data_provider_identifier_;
     data_provider_name = data_provider_name_;
     description = description_;
     engine = engine_;
     \#virtual = virtual_;
     exact_settings = exact_settings_;
     settings = settings_;
   }
    : modify_data_provider_message)

let make_modify_data_migration_response ?data_migration:(data_migration_ : data_migration option) ()
    =
  ({ data_migration = data_migration_ } : modify_data_migration_response)

let make_modify_data_migration_message ?data_migration_name:(data_migration_name_ : string_ option)
    ?enable_cloudwatch_logs:(enable_cloudwatch_logs_ : boolean_optional option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?data_migration_type:(data_migration_type_ : migration_type_value option)
    ?source_data_settings:(source_data_settings_ : source_data_settings option)
    ?target_data_settings:(target_data_settings_ : target_data_settings option)
    ?number_of_jobs:(number_of_jobs_ : integer_optional option)
    ?selection_rules:(selection_rules_ : secret_string option)
    ~data_migration_identifier:(data_migration_identifier_ : string_) () =
  ({
     data_migration_identifier = data_migration_identifier_;
     data_migration_name = data_migration_name_;
     enable_cloudwatch_logs = enable_cloudwatch_logs_;
     service_access_role_arn = service_access_role_arn_;
     data_migration_type = data_migration_type_;
     source_data_settings = source_data_settings_;
     target_data_settings = target_data_settings_;
     number_of_jobs = number_of_jobs_;
     selection_rules = selection_rules_;
   }
    : modify_data_migration_message)

let make_modify_conversion_configuration_response
    ?migration_project_identifier:(migration_project_identifier_ : string_ option) () =
  ({ migration_project_identifier = migration_project_identifier_ }
    : modify_conversion_configuration_response)

let make_modify_conversion_configuration_message
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier)
    ~conversion_configuration:(conversion_configuration_ : string_) () =
  ({
     migration_project_identifier = migration_project_identifier_;
     conversion_configuration = conversion_configuration_;
   }
    : modify_conversion_configuration_message)

let make_list_tags_for_resource_response ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_message ?resource_arn:(resource_arn_ : string_ option)
    ?resource_arn_list:(resource_arn_list_ : arn_list option) () =
  ({ resource_arn = resource_arn_; resource_arn_list = resource_arn_list_ }
    : list_tags_for_resource_message)

let make_certificate ?certificate_identifier:(certificate_identifier_ : string_ option)
    ?certificate_creation_date:(certificate_creation_date_ : t_stamp option)
    ?certificate_pem:(certificate_pem_ : string_ option)
    ?certificate_wallet:(certificate_wallet_ : certificate_wallet option)
    ?certificate_arn:(certificate_arn_ : string_ option)
    ?certificate_owner:(certificate_owner_ : string_ option)
    ?valid_from_date:(valid_from_date_ : t_stamp option)
    ?valid_to_date:(valid_to_date_ : t_stamp option)
    ?signing_algorithm:(signing_algorithm_ : string_ option)
    ?key_length:(key_length_ : integer_optional option) ?kms_key_id:(kms_key_id_ : string_ option)
    () =
  ({
     certificate_identifier = certificate_identifier_;
     certificate_creation_date = certificate_creation_date_;
     certificate_pem = certificate_pem_;
     certificate_wallet = certificate_wallet_;
     certificate_arn = certificate_arn_;
     certificate_owner = certificate_owner_;
     valid_from_date = valid_from_date_;
     valid_to_date = valid_to_date_;
     signing_algorithm = signing_algorithm_;
     key_length = key_length_;
     kms_key_id = kms_key_id_;
   }
    : certificate)

let make_import_certificate_response ?certificate:(certificate_ : certificate option) () =
  ({ certificate = certificate_ } : import_certificate_response)

let make_import_certificate_message ?certificate_pem:(certificate_pem_ : secret_string option)
    ?certificate_wallet:(certificate_wallet_ : certificate_wallet option)
    ?tags:(tags_ : tag_list option) ?kms_key_id:(kms_key_id_ : string_ option)
    ~certificate_identifier:(certificate_identifier_ : string_) () =
  ({
     certificate_identifier = certificate_identifier_;
     certificate_pem = certificate_pem_;
     certificate_wallet = certificate_wallet_;
     tags = tags_;
     kms_key_id = kms_key_id_;
   }
    : import_certificate_message)

let make_get_target_selection_rules_response
    ?target_selection_rules:(target_selection_rules_ : string_ option) () =
  ({ target_selection_rules = target_selection_rules_ } : get_target_selection_rules_response)

let make_get_target_selection_rules_message
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier)
    ~selection_rules:(selection_rules_ : string_) () =
  ({
     migration_project_identifier = migration_project_identifier_;
     selection_rules = selection_rules_;
   }
    : get_target_selection_rules_message)

let make_export_metadata_model_assessment_result_entry
    ?s3_object_key:(s3_object_key_ : string_ option) ?object_ur_l:(object_ur_l_ : string_ option) ()
    =
  ({ s3_object_key = s3_object_key_; object_ur_l = object_ur_l_ }
    : export_metadata_model_assessment_result_entry)

let make_export_metadata_model_assessment_response
    ?pdf_report:(pdf_report_ : export_metadata_model_assessment_result_entry option)
    ?csv_report:(csv_report_ : export_metadata_model_assessment_result_entry option) () =
  ({ pdf_report = pdf_report_; csv_report = csv_report_ }
    : export_metadata_model_assessment_response)

let make_export_metadata_model_assessment_message ?file_name:(file_name_ : string_ option)
    ?assessment_report_types:(assessment_report_types_ : assessment_report_types_list option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier)
    ~selection_rules:(selection_rules_ : string_) () =
  ({
     migration_project_identifier = migration_project_identifier_;
     selection_rules = selection_rules_;
     file_name = file_name_;
     assessment_report_types = assessment_report_types_;
   }
    : export_metadata_model_assessment_message)

let make_table_statistics ?schema_name:(schema_name_ : string_ option)
    ?table_name:(table_name_ : string_ option) ?inserts:(inserts_ : long option)
    ?deletes:(deletes_ : long option) ?updates:(updates_ : long option) ?ddls:(ddls_ : long option)
    ?applied_inserts:(applied_inserts_ : long_optional option)
    ?applied_deletes:(applied_deletes_ : long_optional option)
    ?applied_updates:(applied_updates_ : long_optional option)
    ?applied_ddls:(applied_ddls_ : long_optional option)
    ?full_load_rows:(full_load_rows_ : long option)
    ?full_load_condtnl_chk_failed_rows:(full_load_condtnl_chk_failed_rows_ : long option)
    ?full_load_error_rows:(full_load_error_rows_ : long option)
    ?full_load_start_time:(full_load_start_time_ : t_stamp option)
    ?full_load_end_time:(full_load_end_time_ : t_stamp option)
    ?full_load_reloaded:(full_load_reloaded_ : boolean_optional option)
    ?last_update_time:(last_update_time_ : t_stamp option)
    ?table_state:(table_state_ : string_ option)
    ?validation_pending_records:(validation_pending_records_ : long option)
    ?validation_failed_records:(validation_failed_records_ : long option)
    ?validation_suspended_records:(validation_suspended_records_ : long option)
    ?validation_state:(validation_state_ : string_ option)
    ?validation_state_details:(validation_state_details_ : string_ option)
    ?resync_state:(resync_state_ : string_ option)
    ?resync_rows_attempted:(resync_rows_attempted_ : long_optional option)
    ?resync_rows_succeeded:(resync_rows_succeeded_ : long_optional option)
    ?resync_rows_failed:(resync_rows_failed_ : long_optional option)
    ?resync_progress:(resync_progress_ : double_optional option) () =
  ({
     schema_name = schema_name_;
     table_name = table_name_;
     inserts = inserts_;
     deletes = deletes_;
     updates = updates_;
     ddls = ddls_;
     applied_inserts = applied_inserts_;
     applied_deletes = applied_deletes_;
     applied_updates = applied_updates_;
     applied_ddls = applied_ddls_;
     full_load_rows = full_load_rows_;
     full_load_condtnl_chk_failed_rows = full_load_condtnl_chk_failed_rows_;
     full_load_error_rows = full_load_error_rows_;
     full_load_start_time = full_load_start_time_;
     full_load_end_time = full_load_end_time_;
     full_load_reloaded = full_load_reloaded_;
     last_update_time = last_update_time_;
     table_state = table_state_;
     validation_pending_records = validation_pending_records_;
     validation_failed_records = validation_failed_records_;
     validation_suspended_records = validation_suspended_records_;
     validation_state = validation_state_;
     validation_state_details = validation_state_details_;
     resync_state = resync_state_;
     resync_rows_attempted = resync_rows_attempted_;
     resync_rows_succeeded = resync_rows_succeeded_;
     resync_rows_failed = resync_rows_failed_;
     resync_progress = resync_progress_;
   }
    : table_statistics)

let make_describe_table_statistics_response
    ?replication_task_arn:(replication_task_arn_ : string_ option)
    ?table_statistics:(table_statistics_ : table_statistics_list option)
    ?marker:(marker_ : string_ option) () =
  ({
     replication_task_arn = replication_task_arn_;
     table_statistics = table_statistics_;
     marker = marker_;
   }
    : describe_table_statistics_response)

let make_filter ~name:(name_ : string_) ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : filter)

let make_describe_table_statistics_message ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) ?filters:(filters_ : filter_list option)
    ~replication_task_arn:(replication_task_arn_ : string_) () =
  ({
     replication_task_arn = replication_task_arn_;
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
   }
    : describe_table_statistics_message)

let make_describe_schemas_response ?marker:(marker_ : string_ option)
    ?schemas:(schemas_ : schema_list option) () =
  ({ marker = marker_; schemas = schemas_ } : describe_schemas_response)

let make_describe_schemas_message ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) ~endpoint_arn:(endpoint_arn_ : string_) () =
  ({ endpoint_arn = endpoint_arn_; max_records = max_records_; marker = marker_ }
    : describe_schemas_message)

let make_describe_replication_tasks_response ?marker:(marker_ : string_ option)
    ?replication_tasks:(replication_tasks_ : replication_task_list option) () =
  ({ marker = marker_; replication_tasks = replication_tasks_ }
    : describe_replication_tasks_response)

let make_describe_replication_tasks_message ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?without_settings:(without_settings_ : boolean_optional option) () =
  ({
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
     without_settings = without_settings_;
   }
    : describe_replication_tasks_message)

let make_replication_task_individual_assessment
    ?replication_task_individual_assessment_arn:
      (replication_task_individual_assessment_arn_ : string_ option)
    ?replication_task_assessment_run_arn:(replication_task_assessment_run_arn_ : string_ option)
    ?individual_assessment_name:(individual_assessment_name_ : string_ option)
    ?status:(status_ : string_ option)
    ?replication_task_individual_assessment_start_date:
      (replication_task_individual_assessment_start_date_ : t_stamp option) () =
  ({
     replication_task_individual_assessment_arn = replication_task_individual_assessment_arn_;
     replication_task_assessment_run_arn = replication_task_assessment_run_arn_;
     individual_assessment_name = individual_assessment_name_;
     status = status_;
     replication_task_individual_assessment_start_date =
       replication_task_individual_assessment_start_date_;
   }
    : replication_task_individual_assessment)

let make_describe_replication_task_individual_assessments_response
    ?marker:(marker_ : string_ option)
    ?replication_task_individual_assessments:
      (replication_task_individual_assessments_ : replication_task_individual_assessment_list option)
    () =
  ({
     marker = marker_;
     replication_task_individual_assessments = replication_task_individual_assessments_;
   }
    : describe_replication_task_individual_assessments_response)

let make_describe_replication_task_individual_assessments_message
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({ filters = filters_; max_records = max_records_; marker = marker_ }
    : describe_replication_task_individual_assessments_message)

let make_describe_replication_task_assessment_runs_response ?marker:(marker_ : string_ option)
    ?replication_task_assessment_runs:
      (replication_task_assessment_runs_ : replication_task_assessment_run_list option) () =
  ({ marker = marker_; replication_task_assessment_runs = replication_task_assessment_runs_ }
    : describe_replication_task_assessment_runs_response)

let make_describe_replication_task_assessment_runs_message ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ filters = filters_; max_records = max_records_; marker = marker_ }
    : describe_replication_task_assessment_runs_message)

let make_describe_replication_task_assessment_results_response ?marker:(marker_ : string_ option)
    ?bucket_name:(bucket_name_ : string_ option)
    ?replication_task_assessment_results:
      (replication_task_assessment_results_ : replication_task_assessment_result_list option) () =
  ({
     marker = marker_;
     bucket_name = bucket_name_;
     replication_task_assessment_results = replication_task_assessment_results_;
   }
    : describe_replication_task_assessment_results_response)

let make_describe_replication_task_assessment_results_message
    ?replication_task_arn:(replication_task_arn_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ replication_task_arn = replication_task_arn_; max_records = max_records_; marker = marker_ }
    : describe_replication_task_assessment_results_message)

let make_describe_replication_table_statistics_response
    ?replication_config_arn:(replication_config_arn_ : string_ option)
    ?marker:(marker_ : string_ option)
    ?replication_table_statistics:
      (replication_table_statistics_ : replication_table_statistics_list option) () =
  ({
     replication_config_arn = replication_config_arn_;
     marker = marker_;
     replication_table_statistics = replication_table_statistics_;
   }
    : describe_replication_table_statistics_response)

let make_describe_replication_table_statistics_message
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?filters:(filters_ : filter_list option)
    ~replication_config_arn:(replication_config_arn_ : string_) () =
  ({
     replication_config_arn = replication_config_arn_;
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
   }
    : describe_replication_table_statistics_message)

let make_describe_replication_subnet_groups_response ?marker:(marker_ : string_ option)
    ?replication_subnet_groups:(replication_subnet_groups_ : replication_subnet_groups option) () =
  ({ marker = marker_; replication_subnet_groups = replication_subnet_groups_ }
    : describe_replication_subnet_groups_response)

let make_describe_replication_subnet_groups_message ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ filters = filters_; max_records = max_records_; marker = marker_ }
    : describe_replication_subnet_groups_message)

let make_describe_replications_response ?marker:(marker_ : string_ option)
    ?replications:(replications_ : replication_list option) () =
  ({ marker = marker_; replications = replications_ } : describe_replications_response)

let make_describe_replications_message ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ filters = filters_; max_records = max_records_; marker = marker_ }
    : describe_replications_message)

let make_replication_instance_task_log
    ?replication_task_name:(replication_task_name_ : string_ option)
    ?replication_task_arn:(replication_task_arn_ : string_ option)
    ?replication_instance_task_log_size:(replication_instance_task_log_size_ : long option) () =
  ({
     replication_task_name = replication_task_name_;
     replication_task_arn = replication_task_arn_;
     replication_instance_task_log_size = replication_instance_task_log_size_;
   }
    : replication_instance_task_log)

let make_describe_replication_instance_task_logs_response
    ?replication_instance_arn:(replication_instance_arn_ : string_ option)
    ?replication_instance_task_logs:
      (replication_instance_task_logs_ : replication_instance_task_logs_list option)
    ?marker:(marker_ : string_ option) () =
  ({
     replication_instance_arn = replication_instance_arn_;
     replication_instance_task_logs = replication_instance_task_logs_;
     marker = marker_;
   }
    : describe_replication_instance_task_logs_response)

let make_describe_replication_instance_task_logs_message
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ~replication_instance_arn:(replication_instance_arn_ : string_) () =
  ({
     replication_instance_arn = replication_instance_arn_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_replication_instance_task_logs_message)

let make_describe_replication_instances_response ?marker:(marker_ : string_ option)
    ?replication_instances:(replication_instances_ : replication_instance_list option) () =
  ({ marker = marker_; replication_instances = replication_instances_ }
    : describe_replication_instances_response)

let make_describe_replication_instances_message ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ filters = filters_; max_records = max_records_; marker = marker_ }
    : describe_replication_instances_message)

let make_describe_replication_configs_response ?marker:(marker_ : string_ option)
    ?replication_configs:(replication_configs_ : replication_config_list option) () =
  ({ marker = marker_; replication_configs = replication_configs_ }
    : describe_replication_configs_response)

let make_describe_replication_configs_message ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ filters = filters_; max_records = max_records_; marker = marker_ }
    : describe_replication_configs_message)

let make_describe_refresh_schemas_status_response
    ?refresh_schemas_status:(refresh_schemas_status_ : refresh_schemas_status option) () =
  ({ refresh_schemas_status = refresh_schemas_status_ } : describe_refresh_schemas_status_response)

let make_describe_refresh_schemas_status_message ~endpoint_arn:(endpoint_arn_ : string_) () =
  ({ endpoint_arn = endpoint_arn_ } : describe_refresh_schemas_status_message)

let make_rds_configuration ?engine_edition:(engine_edition_ : string_ option)
    ?instance_type:(instance_type_ : string_ option)
    ?instance_vcpu:(instance_vcpu_ : double_optional option)
    ?instance_memory:(instance_memory_ : double_optional option)
    ?storage_type:(storage_type_ : string_ option)
    ?storage_size:(storage_size_ : integer_optional option)
    ?storage_iops:(storage_iops_ : integer_optional option)
    ?deployment_option:(deployment_option_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) () =
  ({
     engine_edition = engine_edition_;
     instance_type = instance_type_;
     instance_vcpu = instance_vcpu_;
     instance_memory = instance_memory_;
     storage_type = storage_type_;
     storage_size = storage_size_;
     storage_iops = storage_iops_;
     deployment_option = deployment_option_;
     engine_version = engine_version_;
   }
    : rds_configuration)

let make_rds_requirements ?engine_edition:(engine_edition_ : string_ option)
    ?instance_vcpu:(instance_vcpu_ : double_optional option)
    ?instance_memory:(instance_memory_ : double_optional option)
    ?storage_size:(storage_size_ : integer_optional option)
    ?storage_iops:(storage_iops_ : integer_optional option)
    ?deployment_option:(deployment_option_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) () =
  ({
     engine_edition = engine_edition_;
     instance_vcpu = instance_vcpu_;
     instance_memory = instance_memory_;
     storage_size = storage_size_;
     storage_iops = storage_iops_;
     deployment_option = deployment_option_;
     engine_version = engine_version_;
   }
    : rds_requirements)

let make_rds_recommendation
    ?requirements_to_target:(requirements_to_target_ : rds_requirements option)
    ?target_configuration:(target_configuration_ : rds_configuration option) () =
  ({
     requirements_to_target = requirements_to_target_;
     target_configuration = target_configuration_;
   }
    : rds_recommendation)

let make_recommendation_data ?rds_engine:(rds_engine_ : rds_recommendation option) () =
  ({ rds_engine = rds_engine_ } : recommendation_data)

let make_recommendation ?database_id:(database_id_ : string_ option)
    ?engine_name:(engine_name_ : string_ option) ?created_date:(created_date_ : string_ option)
    ?status:(status_ : string_ option) ?preferred:(preferred_ : boolean_optional option)
    ?settings:(settings_ : recommendation_settings option)
    ?data:(data_ : recommendation_data option) () =
  ({
     database_id = database_id_;
     engine_name = engine_name_;
     created_date = created_date_;
     status = status_;
     preferred = preferred_;
     settings = settings_;
     data = data_;
   }
    : recommendation)

let make_describe_recommendations_response ?next_token:(next_token_ : string_ option)
    ?recommendations:(recommendations_ : recommendation_list option) () =
  ({ next_token = next_token_; recommendations = recommendations_ }
    : describe_recommendations_response)

let make_describe_recommendations_request ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({ filters = filters_; max_records = max_records_; next_token = next_token_ }
    : describe_recommendations_request)

let make_limitation ?database_id:(database_id_ : string_ option)
    ?engine_name:(engine_name_ : string_ option) ?name:(name_ : string_ option)
    ?description:(description_ : string_ option) ?impact:(impact_ : string_ option)
    ?type_:(type__ : string_ option) () =
  ({
     database_id = database_id_;
     engine_name = engine_name_;
     name = name_;
     description = description_;
     impact = impact_;
     type_ = type__;
   }
    : limitation)

let make_describe_recommendation_limitations_response ?next_token:(next_token_ : string_ option)
    ?limitations:(limitations_ : limitation_list option) () =
  ({ next_token = next_token_; limitations = limitations_ }
    : describe_recommendation_limitations_response)

let make_describe_recommendation_limitations_request ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({ filters = filters_; max_records = max_records_; next_token = next_token_ }
    : describe_recommendation_limitations_request)

let make_pending_maintenance_action ?action:(action_ : string_ option)
    ?auto_applied_after_date:(auto_applied_after_date_ : t_stamp option)
    ?forced_apply_date:(forced_apply_date_ : t_stamp option)
    ?opt_in_status:(opt_in_status_ : string_ option)
    ?current_apply_date:(current_apply_date_ : t_stamp option)
    ?description:(description_ : string_ option) () =
  ({
     action = action_;
     auto_applied_after_date = auto_applied_after_date_;
     forced_apply_date = forced_apply_date_;
     opt_in_status = opt_in_status_;
     current_apply_date = current_apply_date_;
     description = description_;
   }
    : pending_maintenance_action)

let make_resource_pending_maintenance_actions
    ?resource_identifier:(resource_identifier_ : string_ option)
    ?pending_maintenance_action_details:
      (pending_maintenance_action_details_ : pending_maintenance_action_details option) () =
  ({
     resource_identifier = resource_identifier_;
     pending_maintenance_action_details = pending_maintenance_action_details_;
   }
    : resource_pending_maintenance_actions)

let make_describe_pending_maintenance_actions_response
    ?pending_maintenance_actions:(pending_maintenance_actions_ : pending_maintenance_actions option)
    ?marker:(marker_ : string_ option) () =
  ({ pending_maintenance_actions = pending_maintenance_actions_; marker = marker_ }
    : describe_pending_maintenance_actions_response)

let make_describe_pending_maintenance_actions_message
    ?replication_instance_arn:(replication_instance_arn_ : string_ option)
    ?filters:(filters_ : filter_list option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) () =
  ({
     replication_instance_arn = replication_instance_arn_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_pending_maintenance_actions_message)

let make_orderable_replication_instance ?engine_version:(engine_version_ : string_ option)
    ?replication_instance_class:(replication_instance_class_ : replication_instance_class option)
    ?storage_type:(storage_type_ : string_ option)
    ?min_allocated_storage:(min_allocated_storage_ : integer option)
    ?max_allocated_storage:(max_allocated_storage_ : integer option)
    ?default_allocated_storage:(default_allocated_storage_ : integer option)
    ?included_allocated_storage:(included_allocated_storage_ : integer option)
    ?availability_zones:(availability_zones_ : availability_zones_list option)
    ?release_status:(release_status_ : release_status_values option) () =
  ({
     engine_version = engine_version_;
     replication_instance_class = replication_instance_class_;
     storage_type = storage_type_;
     min_allocated_storage = min_allocated_storage_;
     max_allocated_storage = max_allocated_storage_;
     default_allocated_storage = default_allocated_storage_;
     included_allocated_storage = included_allocated_storage_;
     availability_zones = availability_zones_;
     release_status = release_status_;
   }
    : orderable_replication_instance)

let make_describe_orderable_replication_instances_response
    ?orderable_replication_instances:
      (orderable_replication_instances_ : orderable_replication_instance_list option)
    ?marker:(marker_ : string_ option) () =
  ({ orderable_replication_instances = orderable_replication_instances_; marker = marker_ }
    : describe_orderable_replication_instances_response)

let make_describe_orderable_replication_instances_message
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ max_records = max_records_; marker = marker_ }
    : describe_orderable_replication_instances_message)

let make_describe_migration_projects_response ?marker:(marker_ : string_ option)
    ?migration_projects:(migration_projects_ : migration_project_list option) () =
  ({ marker = marker_; migration_projects = migration_projects_ }
    : describe_migration_projects_response)

let make_describe_migration_projects_message ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ filters = filters_; max_records = max_records_; marker = marker_ }
    : describe_migration_projects_message)

let make_processed_object ?name:(name_ : string_ option) ?type_:(type__ : string_ option)
    ?endpoint_type:(endpoint_type_ : string_ option) () =
  ({ name = name_; type_ = type__; endpoint_type = endpoint_type_ } : processed_object)

let make_progress ?progress_percent:(progress_percent_ : double_optional option)
    ?total_objects:(total_objects_ : long option) ?progress_step:(progress_step_ : string_ option)
    ?processed_object:(processed_object_ : processed_object option) () =
  ({
     progress_percent = progress_percent_;
     total_objects = total_objects_;
     progress_step = progress_step_;
     processed_object = processed_object_;
   }
    : progress)

let make_export_sql_details ?s3_object_key:(s3_object_key_ : string_ option)
    ?object_ur_l:(object_ur_l_ : string_ option) () =
  ({ s3_object_key = s3_object_key_; object_ur_l = object_ur_l_ } : export_sql_details)

let make_default_error_details ?message:(message_ : string_ option) () =
  ({ message = message_ } : default_error_details)

let make_schema_conversion_request ?status:(status_ : string_ option)
    ?request_identifier:(request_identifier_ : string_ option)
    ?migration_project_arn:(migration_project_arn_ : string_ option)
    ?error:(error_ : error_details option)
    ?export_sql_details:(export_sql_details_ : export_sql_details option)
    ?progress:(progress_ : progress option) () =
  ({
     status = status_;
     request_identifier = request_identifier_;
     migration_project_arn = migration_project_arn_;
     error = error_;
     export_sql_details = export_sql_details_;
     progress = progress_;
   }
    : schema_conversion_request)

let make_describe_metadata_model_imports_response ?marker:(marker_ : string_ option)
    ?requests:(requests_ : schema_conversion_request_list option) () =
  ({ marker = marker_; requests = requests_ } : describe_metadata_model_imports_response)

let make_describe_metadata_model_imports_message ?filters:(filters_ : filter_list option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     migration_project_identifier = migration_project_identifier_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_metadata_model_imports_message)

let make_describe_metadata_model_exports_to_target_response ?marker:(marker_ : string_ option)
    ?requests:(requests_ : schema_conversion_request_list option) () =
  ({ marker = marker_; requests = requests_ } : describe_metadata_model_exports_to_target_response)

let make_describe_metadata_model_exports_to_target_message ?filters:(filters_ : filter_list option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     migration_project_identifier = migration_project_identifier_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_metadata_model_exports_to_target_message)

let make_describe_metadata_model_exports_as_script_response ?marker:(marker_ : string_ option)
    ?requests:(requests_ : schema_conversion_request_list option) () =
  ({ marker = marker_; requests = requests_ } : describe_metadata_model_exports_as_script_response)

let make_describe_metadata_model_exports_as_script_message ?filters:(filters_ : filter_list option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     migration_project_identifier = migration_project_identifier_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_metadata_model_exports_as_script_message)

let make_describe_metadata_model_creations_response ?marker:(marker_ : string_ option)
    ?requests:(requests_ : schema_conversion_request_list option) () =
  ({ marker = marker_; requests = requests_ } : describe_metadata_model_creations_response)

let make_describe_metadata_model_creations_message ?filters:(filters_ : filter_list option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
     migration_project_identifier = migration_project_identifier_;
   }
    : describe_metadata_model_creations_message)

let make_describe_metadata_model_conversions_response ?marker:(marker_ : string_ option)
    ?requests:(requests_ : schema_conversion_request_list option) () =
  ({ marker = marker_; requests = requests_ } : describe_metadata_model_conversions_response)

let make_describe_metadata_model_conversions_message ?filters:(filters_ : filter_list option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     migration_project_identifier = migration_project_identifier_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_metadata_model_conversions_message)

let make_metadata_model_reference ?metadata_model_name:(metadata_model_name_ : string_ option)
    ?selection_rules:(selection_rules_ : string_ option) () =
  ({ metadata_model_name = metadata_model_name_; selection_rules = selection_rules_ }
    : metadata_model_reference)

let make_describe_metadata_model_children_response ?marker:(marker_ : string_ option)
    ?metadata_model_children:(metadata_model_children_ : metadata_model_reference_list option) () =
  ({ marker = marker_; metadata_model_children = metadata_model_children_ }
    : describe_metadata_model_children_response)

let make_describe_metadata_model_children_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ~selection_rules:(selection_rules_ : string_)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier)
    ~origin:(origin_ : origin_type_value) () =
  ({
     selection_rules = selection_rules_;
     migration_project_identifier = migration_project_identifier_;
     origin = origin_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_metadata_model_children_message)

let make_describe_metadata_model_assessments_response ?marker:(marker_ : string_ option)
    ?requests:(requests_ : schema_conversion_request_list option) () =
  ({ marker = marker_; requests = requests_ } : describe_metadata_model_assessments_response)

let make_describe_metadata_model_assessments_message ?filters:(filters_ : filter_list option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     migration_project_identifier = migration_project_identifier_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_metadata_model_assessments_message)

let make_describe_metadata_model_response
    ?metadata_model_name:(metadata_model_name_ : string_ option)
    ?metadata_model_type:(metadata_model_type_ : string_ option)
    ?target_metadata_models:(target_metadata_models_ : metadata_model_reference_list option)
    ?definition:(definition_ : string_ option) () =
  ({
     metadata_model_name = metadata_model_name_;
     metadata_model_type = metadata_model_type_;
     target_metadata_models = target_metadata_models_;
     definition = definition_;
   }
    : describe_metadata_model_response)

let make_describe_metadata_model_message ~selection_rules:(selection_rules_ : string_)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier)
    ~origin:(origin_ : origin_type_value) () =
  ({
     selection_rules = selection_rules_;
     migration_project_identifier = migration_project_identifier_;
     origin = origin_;
   }
    : describe_metadata_model_message)

let make_describe_instance_profiles_response ?marker:(marker_ : string_ option)
    ?instance_profiles:(instance_profiles_ : instance_profile_list option) () =
  ({ marker = marker_; instance_profiles = instance_profiles_ }
    : describe_instance_profiles_response)

let make_describe_instance_profiles_message ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ filters = filters_; max_records = max_records_; marker = marker_ }
    : describe_instance_profiles_message)

let make_schema_short_info_response ?schema_id:(schema_id_ : string_ option)
    ?schema_name:(schema_name_ : string_ option) ?database_id:(database_id_ : string_ option)
    ?database_name:(database_name_ : string_ option)
    ?database_ip_address:(database_ip_address_ : string_ option) () =
  ({
     schema_id = schema_id_;
     schema_name = schema_name_;
     database_id = database_id_;
     database_name = database_name_;
     database_ip_address = database_ip_address_;
   }
    : schema_short_info_response)

let make_database_short_info_response ?database_id:(database_id_ : string_ option)
    ?database_name:(database_name_ : string_ option)
    ?database_ip_address:(database_ip_address_ : string_ option)
    ?database_engine:(database_engine_ : string_ option) () =
  ({
     database_id = database_id_;
     database_name = database_name_;
     database_ip_address = database_ip_address_;
     database_engine = database_engine_;
   }
    : database_short_info_response)

let make_server_short_info_response ?server_id:(server_id_ : string_ option)
    ?ip_address:(ip_address_ : string_ option) ?server_name:(server_name_ : string_ option) () =
  ({ server_id = server_id_; ip_address = ip_address_; server_name = server_name_ }
    : server_short_info_response)

let make_schema_response ?code_line_count:(code_line_count_ : long_optional option)
    ?code_size:(code_size_ : long_optional option) ?complexity:(complexity_ : string_ option)
    ?server:(server_ : server_short_info_response option)
    ?database_instance:(database_instance_ : database_short_info_response option)
    ?schema_id:(schema_id_ : string_ option) ?schema_name:(schema_name_ : string_ option)
    ?original_schema:(original_schema_ : schema_short_info_response option)
    ?similarity:(similarity_ : double_optional option) () =
  ({
     code_line_count = code_line_count_;
     code_size = code_size_;
     complexity = complexity_;
     server = server_;
     database_instance = database_instance_;
     schema_id = schema_id_;
     schema_name = schema_name_;
     original_schema = original_schema_;
     similarity = similarity_;
   }
    : schema_response)

let make_describe_fleet_advisor_schemas_response
    ?fleet_advisor_schemas:(fleet_advisor_schemas_ : fleet_advisor_schema_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ fleet_advisor_schemas = fleet_advisor_schemas_; next_token = next_token_ }
    : describe_fleet_advisor_schemas_response)

let make_describe_fleet_advisor_schemas_request ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({ filters = filters_; max_records = max_records_; next_token = next_token_ }
    : describe_fleet_advisor_schemas_request)

let make_fleet_advisor_schema_object_response ?schema_id:(schema_id_ : string_ option)
    ?object_type:(object_type_ : string_ option)
    ?number_of_objects:(number_of_objects_ : long_optional option)
    ?code_line_count:(code_line_count_ : long_optional option)
    ?code_size:(code_size_ : long_optional option) () =
  ({
     schema_id = schema_id_;
     object_type = object_type_;
     number_of_objects = number_of_objects_;
     code_line_count = code_line_count_;
     code_size = code_size_;
   }
    : fleet_advisor_schema_object_response)

let make_describe_fleet_advisor_schema_object_summary_response
    ?fleet_advisor_schema_objects:
      (fleet_advisor_schema_objects_ : fleet_advisor_schema_object_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ fleet_advisor_schema_objects = fleet_advisor_schema_objects_; next_token = next_token_ }
    : describe_fleet_advisor_schema_object_summary_response)

let make_describe_fleet_advisor_schema_object_summary_request
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?next_token:(next_token_ : string_ option) () =
  ({ filters = filters_; max_records = max_records_; next_token = next_token_ }
    : describe_fleet_advisor_schema_object_summary_request)

let make_fleet_advisor_lsa_analysis_response ?lsa_analysis_id:(lsa_analysis_id_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ lsa_analysis_id = lsa_analysis_id_; status = status_ } : fleet_advisor_lsa_analysis_response)

let make_describe_fleet_advisor_lsa_analysis_response
    ?analysis:(analysis_ : fleet_advisor_lsa_analysis_response_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ analysis = analysis_; next_token = next_token_ }
    : describe_fleet_advisor_lsa_analysis_response)

let make_describe_fleet_advisor_lsa_analysis_request
    ?max_records:(max_records_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({ max_records = max_records_; next_token = next_token_ }
    : describe_fleet_advisor_lsa_analysis_request)

let make_collector_short_info_response
    ?collector_referenced_id:(collector_referenced_id_ : string_ option)
    ?collector_name:(collector_name_ : string_ option) () =
  ({ collector_referenced_id = collector_referenced_id_; collector_name = collector_name_ }
    : collector_short_info_response)

let make_database_instance_software_details_response ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?engine_edition:(engine_edition_ : string_ option)
    ?service_pack:(service_pack_ : string_ option) ?support_level:(support_level_ : string_ option)
    ?os_architecture:(os_architecture_ : integer_optional option)
    ?tooltip:(tooltip_ : string_ option) () =
  ({
     engine = engine_;
     engine_version = engine_version_;
     engine_edition = engine_edition_;
     service_pack = service_pack_;
     support_level = support_level_;
     os_architecture = os_architecture_;
     tooltip = tooltip_;
   }
    : database_instance_software_details_response)

let make_database_response ?database_id:(database_id_ : string_ option)
    ?database_name:(database_name_ : string_ option) ?ip_address:(ip_address_ : string_ option)
    ?number_of_schemas:(number_of_schemas_ : long_optional option)
    ?server:(server_ : server_short_info_response option)
    ?software_details:(software_details_ : database_instance_software_details_response option)
    ?collectors:(collectors_ : collectors_list option) () =
  ({
     database_id = database_id_;
     database_name = database_name_;
     ip_address = ip_address_;
     number_of_schemas = number_of_schemas_;
     server = server_;
     software_details = software_details_;
     collectors = collectors_;
   }
    : database_response)

let make_describe_fleet_advisor_databases_response ?databases:(databases_ : database_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ databases = databases_; next_token = next_token_ } : describe_fleet_advisor_databases_response)

let make_describe_fleet_advisor_databases_request ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({ filters = filters_; max_records = max_records_; next_token = next_token_ }
    : describe_fleet_advisor_databases_request)

let make_inventory_data ?number_of_databases:(number_of_databases_ : integer_optional option)
    ?number_of_schemas:(number_of_schemas_ : integer_optional option) () =
  ({ number_of_databases = number_of_databases_; number_of_schemas = number_of_schemas_ }
    : inventory_data)

let make_collector_health_check ?collector_status:(collector_status_ : collector_status option)
    ?local_collector_s3_access:(local_collector_s3_access_ : boolean_optional option)
    ?web_collector_s3_access:(web_collector_s3_access_ : boolean_optional option)
    ?web_collector_granted_role_based_access:
      (web_collector_granted_role_based_access_ : boolean_optional option) () =
  ({
     collector_status = collector_status_;
     local_collector_s3_access = local_collector_s3_access_;
     web_collector_s3_access = web_collector_s3_access_;
     web_collector_granted_role_based_access = web_collector_granted_role_based_access_;
   }
    : collector_health_check)

let make_collector_response ?collector_referenced_id:(collector_referenced_id_ : string_ option)
    ?collector_name:(collector_name_ : string_ option)
    ?collector_version:(collector_version_ : string_ option)
    ?version_status:(version_status_ : version_status option)
    ?description:(description_ : string_ option) ?s3_bucket_name:(s3_bucket_name_ : string_ option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?collector_health_check:(collector_health_check_ : collector_health_check option)
    ?last_data_received:(last_data_received_ : string_ option)
    ?registered_date:(registered_date_ : string_ option)
    ?created_date:(created_date_ : string_ option) ?modified_date:(modified_date_ : string_ option)
    ?inventory_data:(inventory_data_ : inventory_data option) () =
  ({
     collector_referenced_id = collector_referenced_id_;
     collector_name = collector_name_;
     collector_version = collector_version_;
     version_status = version_status_;
     description = description_;
     s3_bucket_name = s3_bucket_name_;
     service_access_role_arn = service_access_role_arn_;
     collector_health_check = collector_health_check_;
     last_data_received = last_data_received_;
     registered_date = registered_date_;
     created_date = created_date_;
     modified_date = modified_date_;
     inventory_data = inventory_data_;
   }
    : collector_response)

let make_describe_fleet_advisor_collectors_response
    ?collectors:(collectors_ : collector_responses option)
    ?next_token:(next_token_ : string_ option) () =
  ({ collectors = collectors_; next_token = next_token_ }
    : describe_fleet_advisor_collectors_response)

let make_describe_fleet_advisor_collectors_request ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({ filters = filters_; max_records = max_records_; next_token = next_token_ }
    : describe_fleet_advisor_collectors_request)

let make_describe_extension_pack_associations_response ?marker:(marker_ : string_ option)
    ?requests:(requests_ : schema_conversion_request_list option) () =
  ({ marker = marker_; requests = requests_ } : describe_extension_pack_associations_response)

let make_describe_extension_pack_associations_message ?filters:(filters_ : filter_list option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     migration_project_identifier = migration_project_identifier_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_extension_pack_associations_message)

let make_describe_event_subscriptions_response ?marker:(marker_ : string_ option)
    ?event_subscriptions_list:(event_subscriptions_list_ : event_subscriptions_list option) () =
  ({ marker = marker_; event_subscriptions_list = event_subscriptions_list_ }
    : describe_event_subscriptions_response)

let make_describe_event_subscriptions_message
    ?subscription_name:(subscription_name_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({
     subscription_name = subscription_name_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_event_subscriptions_message)

let make_event ?source_identifier:(source_identifier_ : string_ option)
    ?source_type:(source_type_ : source_type option) ?message:(message_ : string_ option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?date:(date_ : t_stamp option) () =
  ({
     source_identifier = source_identifier_;
     source_type = source_type_;
     message = message_;
     event_categories = event_categories_;
     date = date_;
   }
    : event)

let make_describe_events_response ?marker:(marker_ : string_ option)
    ?events:(events_ : event_list option) () =
  ({ marker = marker_; events = events_ } : describe_events_response)

let make_describe_events_message ?source_identifier:(source_identifier_ : string_ option)
    ?source_type:(source_type_ : source_type option) ?start_time:(start_time_ : t_stamp option)
    ?end_time:(end_time_ : t_stamp option) ?duration:(duration_ : integer_optional option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({
     source_identifier = source_identifier_;
     source_type = source_type_;
     start_time = start_time_;
     end_time = end_time_;
     duration = duration_;
     event_categories = event_categories_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_events_message)

let make_event_category_group ?source_type:(source_type_ : string_ option)
    ?event_categories:(event_categories_ : event_categories_list option) () =
  ({ source_type = source_type_; event_categories = event_categories_ } : event_category_group)

let make_describe_event_categories_response
    ?event_category_group_list:(event_category_group_list_ : event_category_group_list option) () =
  ({ event_category_group_list = event_category_group_list_ } : describe_event_categories_response)

let make_describe_event_categories_message ?source_type:(source_type_ : string_ option)
    ?filters:(filters_ : filter_list option) () =
  ({ source_type = source_type_; filters = filters_ } : describe_event_categories_message)

let make_engine_version ?version:(version_ : string_ option)
    ?lifecycle:(lifecycle_ : string_ option)
    ?release_status:(release_status_ : release_status_values option)
    ?launch_date:(launch_date_ : t_stamp option)
    ?auto_upgrade_date:(auto_upgrade_date_ : t_stamp option)
    ?deprecation_date:(deprecation_date_ : t_stamp option)
    ?force_upgrade_date:(force_upgrade_date_ : t_stamp option)
    ?available_upgrades:(available_upgrades_ : available_upgrades_list option) () =
  ({
     version = version_;
     lifecycle = lifecycle_;
     release_status = release_status_;
     launch_date = launch_date_;
     auto_upgrade_date = auto_upgrade_date_;
     deprecation_date = deprecation_date_;
     force_upgrade_date = force_upgrade_date_;
     available_upgrades = available_upgrades_;
   }
    : engine_version)

let make_describe_engine_versions_response
    ?engine_versions:(engine_versions_ : engine_version_list option)
    ?marker:(marker_ : string_ option) () =
  ({ engine_versions = engine_versions_; marker = marker_ } : describe_engine_versions_response)

let make_describe_engine_versions_message ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({ max_records = max_records_; marker = marker_ } : describe_engine_versions_message)

let make_supported_endpoint_type ?engine_name:(engine_name_ : string_ option)
    ?supports_cd_c:(supports_cd_c_ : boolean_ option)
    ?endpoint_type:(endpoint_type_ : replication_endpoint_type_value option)
    ?replication_instance_engine_minimum_version:
      (replication_instance_engine_minimum_version_ : string_ option)
    ?engine_display_name:(engine_display_name_ : string_ option) () =
  ({
     engine_name = engine_name_;
     supports_cd_c = supports_cd_c_;
     endpoint_type = endpoint_type_;
     replication_instance_engine_minimum_version = replication_instance_engine_minimum_version_;
     engine_display_name = engine_display_name_;
   }
    : supported_endpoint_type)

let make_describe_endpoint_types_response ?marker:(marker_ : string_ option)
    ?supported_endpoint_types:(supported_endpoint_types_ : supported_endpoint_type_list option) () =
  ({ marker = marker_; supported_endpoint_types = supported_endpoint_types_ }
    : describe_endpoint_types_response)

let make_describe_endpoint_types_message ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ filters = filters_; max_records = max_records_; marker = marker_ }
    : describe_endpoint_types_message)

let make_endpoint_setting ?name:(name_ : string_ option)
    ?type_:(type__ : endpoint_setting_type_value option)
    ?enum_values:(enum_values_ : endpoint_setting_enum_values option)
    ?sensitive:(sensitive_ : boolean_optional option) ?units:(units_ : string_ option)
    ?applicability:(applicability_ : string_ option)
    ?int_value_min:(int_value_min_ : integer_optional option)
    ?int_value_max:(int_value_max_ : integer_optional option)
    ?default_value:(default_value_ : string_ option) () =
  ({
     name = name_;
     type_ = type__;
     enum_values = enum_values_;
     sensitive = sensitive_;
     units = units_;
     applicability = applicability_;
     int_value_min = int_value_min_;
     int_value_max = int_value_max_;
     default_value = default_value_;
   }
    : endpoint_setting)

let make_describe_endpoint_settings_response ?marker:(marker_ : string_ option)
    ?endpoint_settings:(endpoint_settings_ : endpoint_settings_list option) () =
  ({ marker = marker_; endpoint_settings = endpoint_settings_ }
    : describe_endpoint_settings_response)

let make_describe_endpoint_settings_message ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) ~engine_name:(engine_name_ : string_) () =
  ({ engine_name = engine_name_; max_records = max_records_; marker = marker_ }
    : describe_endpoint_settings_message)

let make_describe_endpoints_response ?marker:(marker_ : string_ option)
    ?endpoints:(endpoints_ : endpoint_list option) () =
  ({ marker = marker_; endpoints = endpoints_ } : describe_endpoints_response)

let make_describe_endpoints_message ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ filters = filters_; max_records = max_records_; marker = marker_ }
    : describe_endpoints_message)

let make_describe_data_providers_response ?marker:(marker_ : string_ option)
    ?data_providers:(data_providers_ : data_provider_list option) () =
  ({ marker = marker_; data_providers = data_providers_ } : describe_data_providers_response)

let make_describe_data_providers_message ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ filters = filters_; max_records = max_records_; marker = marker_ }
    : describe_data_providers_message)

let make_describe_data_migrations_response
    ?data_migrations:(data_migrations_ : data_migrations option) ?marker:(marker_ : marker option)
    () =
  ({ data_migrations = data_migrations_; marker = marker_ } : describe_data_migrations_response)

let make_describe_data_migrations_message ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : marker option)
    ?without_settings:(without_settings_ : boolean_optional option)
    ?without_statistics:(without_statistics_ : boolean_optional option) () =
  ({
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
     without_settings = without_settings_;
     without_statistics = without_statistics_;
   }
    : describe_data_migrations_message)

let make_describe_conversion_configuration_response
    ?migration_project_identifier:(migration_project_identifier_ : string_ option)
    ?conversion_configuration:(conversion_configuration_ : string_ option) () =
  ({
     migration_project_identifier = migration_project_identifier_;
     conversion_configuration = conversion_configuration_;
   }
    : describe_conversion_configuration_response)

let make_describe_conversion_configuration_message
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({ migration_project_identifier = migration_project_identifier_ }
    : describe_conversion_configuration_message)

let make_describe_connections_response ?marker:(marker_ : string_ option)
    ?connections:(connections_ : connection_list option) () =
  ({ marker = marker_; connections = connections_ } : describe_connections_response)

let make_describe_connections_message ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ filters = filters_; max_records = max_records_; marker = marker_ }
    : describe_connections_message)

let make_describe_certificates_response ?marker:(marker_ : string_ option)
    ?certificates:(certificates_ : certificate_list option) () =
  ({ marker = marker_; certificates = certificates_ } : describe_certificates_response)

let make_describe_certificates_message ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ filters = filters_; max_records = max_records_; marker = marker_ }
    : describe_certificates_message)

let make_describe_applicable_individual_assessments_response
    ?individual_assessment_names:
      (individual_assessment_names_ : individual_assessment_name_list option)
    ?marker:(marker_ : string_ option) () =
  ({ individual_assessment_names = individual_assessment_names_; marker = marker_ }
    : describe_applicable_individual_assessments_response)

let make_describe_applicable_individual_assessments_message
    ?replication_task_arn:(replication_task_arn_ : string_ option)
    ?replication_instance_arn:(replication_instance_arn_ : string_ option)
    ?replication_config_arn:(replication_config_arn_ : string_ option)
    ?source_engine_name:(source_engine_name_ : string_ option)
    ?target_engine_name:(target_engine_name_ : string_ option)
    ?migration_type:(migration_type_ : migration_type_value option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     replication_task_arn = replication_task_arn_;
     replication_instance_arn = replication_instance_arn_;
     replication_config_arn = replication_config_arn_;
     source_engine_name = source_engine_name_;
     target_engine_name = target_engine_name_;
     migration_type = migration_type_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_applicable_individual_assessments_message)

let make_describe_account_attributes_response
    ?account_quotas:(account_quotas_ : account_quota_list option)
    ?unique_account_identifier:(unique_account_identifier_ : string_ option) () =
  ({ account_quotas = account_quotas_; unique_account_identifier = unique_account_identifier_ }
    : describe_account_attributes_response)

let make_describe_account_attributes_message () = (() : unit)

let make_delete_replication_task_assessment_run_response
    ?replication_task_assessment_run:
      (replication_task_assessment_run_ : replication_task_assessment_run option) () =
  ({ replication_task_assessment_run = replication_task_assessment_run_ }
    : delete_replication_task_assessment_run_response)

let make_delete_replication_task_assessment_run_message
    ~replication_task_assessment_run_arn:(replication_task_assessment_run_arn_ : string_) () =
  ({ replication_task_assessment_run_arn = replication_task_assessment_run_arn_ }
    : delete_replication_task_assessment_run_message)

let make_delete_replication_task_response
    ?replication_task:(replication_task_ : replication_task option) () =
  ({ replication_task = replication_task_ } : delete_replication_task_response)

let make_delete_replication_task_message ~replication_task_arn:(replication_task_arn_ : string_) ()
    =
  ({ replication_task_arn = replication_task_arn_ } : delete_replication_task_message)

let make_delete_replication_subnet_group_response () = (() : unit)

let make_delete_replication_subnet_group_message
    ~replication_subnet_group_identifier:(replication_subnet_group_identifier_ : string_) () =
  ({ replication_subnet_group_identifier = replication_subnet_group_identifier_ }
    : delete_replication_subnet_group_message)

let make_delete_replication_instance_response
    ?replication_instance:(replication_instance_ : replication_instance option) () =
  ({ replication_instance = replication_instance_ } : delete_replication_instance_response)

let make_delete_replication_instance_message
    ~replication_instance_arn:(replication_instance_arn_ : string_) () =
  ({ replication_instance_arn = replication_instance_arn_ } : delete_replication_instance_message)

let make_delete_replication_config_response
    ?replication_config:(replication_config_ : replication_config option) () =
  ({ replication_config = replication_config_ } : delete_replication_config_response)

let make_delete_replication_config_message
    ~replication_config_arn:(replication_config_arn_ : string_) () =
  ({ replication_config_arn = replication_config_arn_ } : delete_replication_config_message)

let make_delete_migration_project_response
    ?migration_project:(migration_project_ : migration_project option) () =
  ({ migration_project = migration_project_ } : delete_migration_project_response)

let make_delete_migration_project_message
    ~migration_project_identifier:(migration_project_identifier_ : string_) () =
  ({ migration_project_identifier = migration_project_identifier_ }
    : delete_migration_project_message)

let make_delete_instance_profile_response
    ?instance_profile:(instance_profile_ : instance_profile option) () =
  ({ instance_profile = instance_profile_ } : delete_instance_profile_response)

let make_delete_instance_profile_message
    ~instance_profile_identifier:(instance_profile_identifier_ : string_) () =
  ({ instance_profile_identifier = instance_profile_identifier_ } : delete_instance_profile_message)

let make_delete_fleet_advisor_databases_response ?database_ids:(database_ids_ : string_list option)
    () =
  ({ database_ids = database_ids_ } : delete_fleet_advisor_databases_response)

let make_delete_fleet_advisor_databases_request ~database_ids:(database_ids_ : string_list) () =
  ({ database_ids = database_ids_ } : delete_fleet_advisor_databases_request)

let make_delete_collector_request ~collector_referenced_id:(collector_referenced_id_ : string_) () =
  ({ collector_referenced_id = collector_referenced_id_ } : delete_collector_request)

let make_delete_event_subscription_response
    ?event_subscription:(event_subscription_ : event_subscription option) () =
  ({ event_subscription = event_subscription_ } : delete_event_subscription_response)

let make_delete_event_subscription_message ~subscription_name:(subscription_name_ : string_) () =
  ({ subscription_name = subscription_name_ } : delete_event_subscription_message)

let make_delete_endpoint_response ?endpoint:(endpoint_ : endpoint option) () =
  ({ endpoint = endpoint_ } : delete_endpoint_response)

let make_delete_endpoint_message ~endpoint_arn:(endpoint_arn_ : string_) () =
  ({ endpoint_arn = endpoint_arn_ } : delete_endpoint_message)

let make_delete_data_provider_response ?data_provider:(data_provider_ : data_provider option) () =
  ({ data_provider = data_provider_ } : delete_data_provider_response)

let make_delete_data_provider_message
    ~data_provider_identifier:(data_provider_identifier_ : string_) () =
  ({ data_provider_identifier = data_provider_identifier_ } : delete_data_provider_message)

let make_delete_data_migration_response ?data_migration:(data_migration_ : data_migration option) ()
    =
  ({ data_migration = data_migration_ } : delete_data_migration_response)

let make_delete_data_migration_message
    ~data_migration_identifier:(data_migration_identifier_ : string_) () =
  ({ data_migration_identifier = data_migration_identifier_ } : delete_data_migration_message)

let make_delete_connection_response ?connection:(connection_ : connection option) () =
  ({ connection = connection_ } : delete_connection_response)

let make_delete_connection_message ~endpoint_arn:(endpoint_arn_ : string_)
    ~replication_instance_arn:(replication_instance_arn_ : string_) () =
  ({ endpoint_arn = endpoint_arn_; replication_instance_arn = replication_instance_arn_ }
    : delete_connection_message)

let make_delete_certificate_response ?certificate:(certificate_ : certificate option) () =
  ({ certificate = certificate_ } : delete_certificate_response)

let make_delete_certificate_message ~certificate_arn:(certificate_arn_ : string_) () =
  ({ certificate_arn = certificate_arn_ } : delete_certificate_message)

let make_create_replication_task_response
    ?replication_task:(replication_task_ : replication_task option) () =
  ({ replication_task = replication_task_ } : create_replication_task_response)

let make_create_replication_task_message
    ?replication_task_settings:(replication_task_settings_ : string_ option)
    ?cdc_start_time:(cdc_start_time_ : t_stamp option)
    ?cdc_start_position:(cdc_start_position_ : string_ option)
    ?cdc_stop_position:(cdc_stop_position_ : string_ option) ?tags:(tags_ : tag_list option)
    ?task_data:(task_data_ : string_ option)
    ?resource_identifier:(resource_identifier_ : string_ option)
    ~replication_task_identifier:(replication_task_identifier_ : string_)
    ~source_endpoint_arn:(source_endpoint_arn_ : string_)
    ~target_endpoint_arn:(target_endpoint_arn_ : string_)
    ~replication_instance_arn:(replication_instance_arn_ : string_)
    ~migration_type:(migration_type_ : migration_type_value)
    ~table_mappings:(table_mappings_ : string_) () =
  ({
     replication_task_identifier = replication_task_identifier_;
     source_endpoint_arn = source_endpoint_arn_;
     target_endpoint_arn = target_endpoint_arn_;
     replication_instance_arn = replication_instance_arn_;
     migration_type = migration_type_;
     table_mappings = table_mappings_;
     replication_task_settings = replication_task_settings_;
     cdc_start_time = cdc_start_time_;
     cdc_start_position = cdc_start_position_;
     cdc_stop_position = cdc_stop_position_;
     tags = tags_;
     task_data = task_data_;
     resource_identifier = resource_identifier_;
   }
    : create_replication_task_message)

let make_create_replication_subnet_group_response
    ?replication_subnet_group:(replication_subnet_group_ : replication_subnet_group option) () =
  ({ replication_subnet_group = replication_subnet_group_ }
    : create_replication_subnet_group_response)

let make_create_replication_subnet_group_message ?tags:(tags_ : tag_list option)
    ~replication_subnet_group_identifier:(replication_subnet_group_identifier_ : string_)
    ~replication_subnet_group_description:(replication_subnet_group_description_ : string_)
    ~subnet_ids:(subnet_ids_ : subnet_identifier_list) () =
  ({
     replication_subnet_group_identifier = replication_subnet_group_identifier_;
     replication_subnet_group_description = replication_subnet_group_description_;
     subnet_ids = subnet_ids_;
     tags = tags_;
   }
    : create_replication_subnet_group_message)

let make_create_replication_instance_response
    ?replication_instance:(replication_instance_ : replication_instance option) () =
  ({ replication_instance = replication_instance_ } : create_replication_instance_response)

let make_create_replication_instance_message
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?replication_subnet_group_identifier:(replication_subnet_group_identifier_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?tags:(tags_ : tag_list option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?dns_name_servers:(dns_name_servers_ : string_ option)
    ?resource_identifier:(resource_identifier_ : string_ option)
    ?network_type:(network_type_ : string_ option)
    ?kerberos_authentication_settings:
      (kerberos_authentication_settings_ : kerberos_authentication_settings option)
    ~replication_instance_identifier:(replication_instance_identifier_ : string_)
    ~replication_instance_class:(replication_instance_class_ : replication_instance_class) () =
  ({
     replication_instance_identifier = replication_instance_identifier_;
     allocated_storage = allocated_storage_;
     replication_instance_class = replication_instance_class_;
     vpc_security_group_ids = vpc_security_group_ids_;
     availability_zone = availability_zone_;
     replication_subnet_group_identifier = replication_subnet_group_identifier_;
     preferred_maintenance_window = preferred_maintenance_window_;
     multi_a_z = multi_a_z_;
     engine_version = engine_version_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     tags = tags_;
     kms_key_id = kms_key_id_;
     publicly_accessible = publicly_accessible_;
     dns_name_servers = dns_name_servers_;
     resource_identifier = resource_identifier_;
     network_type = network_type_;
     kerberos_authentication_settings = kerberos_authentication_settings_;
   }
    : create_replication_instance_message)

let make_create_replication_config_response
    ?replication_config:(replication_config_ : replication_config option) () =
  ({ replication_config = replication_config_ } : create_replication_config_response)

let make_create_replication_config_message
    ?replication_settings:(replication_settings_ : string_ option)
    ?supplemental_settings:(supplemental_settings_ : string_ option)
    ?resource_identifier:(resource_identifier_ : string_ option) ?tags:(tags_ : tag_list option)
    ~replication_config_identifier:(replication_config_identifier_ : string_)
    ~source_endpoint_arn:(source_endpoint_arn_ : string_)
    ~target_endpoint_arn:(target_endpoint_arn_ : string_)
    ~compute_config:(compute_config_ : compute_config)
    ~replication_type:(replication_type_ : migration_type_value)
    ~table_mappings:(table_mappings_ : string_) () =
  ({
     replication_config_identifier = replication_config_identifier_;
     source_endpoint_arn = source_endpoint_arn_;
     target_endpoint_arn = target_endpoint_arn_;
     compute_config = compute_config_;
     replication_type = replication_type_;
     table_mappings = table_mappings_;
     replication_settings = replication_settings_;
     supplemental_settings = supplemental_settings_;
     resource_identifier = resource_identifier_;
     tags = tags_;
   }
    : create_replication_config_message)

let make_create_migration_project_response
    ?migration_project:(migration_project_ : migration_project option) () =
  ({ migration_project = migration_project_ } : create_migration_project_response)

let make_create_migration_project_message
    ?migration_project_name:(migration_project_name_ : string_ option)
    ?transformation_rules:(transformation_rules_ : string_ option)
    ?description:(description_ : string_ option) ?tags:(tags_ : tag_list option)
    ?schema_conversion_application_attributes:
      (schema_conversion_application_attributes_ : sc_application_attributes option)
    ~source_data_provider_descriptors:
      (source_data_provider_descriptors_ : data_provider_descriptor_definition_list)
    ~target_data_provider_descriptors:
      (target_data_provider_descriptors_ : data_provider_descriptor_definition_list)
    ~instance_profile_identifier:(instance_profile_identifier_ : string_) () =
  ({
     migration_project_name = migration_project_name_;
     source_data_provider_descriptors = source_data_provider_descriptors_;
     target_data_provider_descriptors = target_data_provider_descriptors_;
     instance_profile_identifier = instance_profile_identifier_;
     transformation_rules = transformation_rules_;
     description = description_;
     tags = tags_;
     schema_conversion_application_attributes = schema_conversion_application_attributes_;
   }
    : create_migration_project_message)

let make_create_instance_profile_response
    ?instance_profile:(instance_profile_ : instance_profile option) () =
  ({ instance_profile = instance_profile_ } : create_instance_profile_response)

let make_create_instance_profile_message ?availability_zone:(availability_zone_ : string_ option)
    ?kms_key_arn:(kms_key_arn_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?tags:(tags_ : tag_list option) ?network_type:(network_type_ : string_ option)
    ?instance_profile_name:(instance_profile_name_ : string_ option)
    ?description:(description_ : string_ option)
    ?subnet_group_identifier:(subnet_group_identifier_ : string_ option)
    ?vpc_security_groups:(vpc_security_groups_ : string_list option) () =
  ({
     availability_zone = availability_zone_;
     kms_key_arn = kms_key_arn_;
     publicly_accessible = publicly_accessible_;
     tags = tags_;
     network_type = network_type_;
     instance_profile_name = instance_profile_name_;
     description = description_;
     subnet_group_identifier = subnet_group_identifier_;
     vpc_security_groups = vpc_security_groups_;
   }
    : create_instance_profile_message)

let make_create_fleet_advisor_collector_response
    ?collector_referenced_id:(collector_referenced_id_ : string_ option)
    ?collector_name:(collector_name_ : string_ option) ?description:(description_ : string_ option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?s3_bucket_name:(s3_bucket_name_ : string_ option) () =
  ({
     collector_referenced_id = collector_referenced_id_;
     collector_name = collector_name_;
     description = description_;
     service_access_role_arn = service_access_role_arn_;
     s3_bucket_name = s3_bucket_name_;
   }
    : create_fleet_advisor_collector_response)

let make_create_fleet_advisor_collector_request ?description:(description_ : string_ option)
    ~collector_name:(collector_name_ : string_)
    ~service_access_role_arn:(service_access_role_arn_ : string_)
    ~s3_bucket_name:(s3_bucket_name_ : string_) () =
  ({
     collector_name = collector_name_;
     description = description_;
     service_access_role_arn = service_access_role_arn_;
     s3_bucket_name = s3_bucket_name_;
   }
    : create_fleet_advisor_collector_request)

let make_create_event_subscription_response
    ?event_subscription:(event_subscription_ : event_subscription option) () =
  ({ event_subscription = event_subscription_ } : create_event_subscription_response)

let make_create_event_subscription_message ?source_type:(source_type_ : string_ option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?source_ids:(source_ids_ : source_ids_list option) ?enabled:(enabled_ : boolean_optional option)
    ?tags:(tags_ : tag_list option) ~subscription_name:(subscription_name_ : string_)
    ~sns_topic_arn:(sns_topic_arn_ : string_) () =
  ({
     subscription_name = subscription_name_;
     sns_topic_arn = sns_topic_arn_;
     source_type = source_type_;
     event_categories = event_categories_;
     source_ids = source_ids_;
     enabled = enabled_;
     tags = tags_;
   }
    : create_event_subscription_message)

let make_create_endpoint_response ?endpoint:(endpoint_ : endpoint option) () =
  ({ endpoint = endpoint_ } : create_endpoint_response)

let make_create_endpoint_message ?username:(username_ : string_ option)
    ?password:(password_ : secret_string option) ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?database_name:(database_name_ : string_ option)
    ?extra_connection_attributes:(extra_connection_attributes_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?tags:(tags_ : tag_list option)
    ?certificate_arn:(certificate_arn_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?external_table_definition:(external_table_definition_ : string_ option)
    ?dynamo_db_settings:(dynamo_db_settings_ : dynamo_db_settings option)
    ?s3_settings:(s3_settings_ : s3_settings option)
    ?dms_transfer_settings:(dms_transfer_settings_ : dms_transfer_settings option)
    ?mongo_db_settings:(mongo_db_settings_ : mongo_db_settings option)
    ?kinesis_settings:(kinesis_settings_ : kinesis_settings option)
    ?kafka_settings:(kafka_settings_ : kafka_settings option)
    ?elasticsearch_settings:(elasticsearch_settings_ : elasticsearch_settings option)
    ?neptune_settings:(neptune_settings_ : neptune_settings option)
    ?redshift_settings:(redshift_settings_ : redshift_settings option)
    ?postgre_sql_settings:(postgre_sql_settings_ : postgre_sql_settings option)
    ?my_sql_settings:(my_sql_settings_ : my_sql_settings option)
    ?oracle_settings:(oracle_settings_ : oracle_settings option)
    ?sybase_settings:(sybase_settings_ : sybase_settings option)
    ?microsoft_sql_server_settings:
      (microsoft_sql_server_settings_ : microsoft_sql_server_settings option)
    ?ibm_db2_settings:(ibm_db2_settings_ : ibm_db2_settings option)
    ?resource_identifier:(resource_identifier_ : string_ option)
    ?doc_db_settings:(doc_db_settings_ : doc_db_settings option)
    ?redis_settings:(redis_settings_ : redis_settings option)
    ?gcp_my_sql_settings:(gcp_my_sql_settings_ : gcp_my_sql_settings option)
    ?timestream_settings:(timestream_settings_ : timestream_settings option)
    ~endpoint_identifier:(endpoint_identifier_ : string_)
    ~endpoint_type:(endpoint_type_ : replication_endpoint_type_value)
    ~engine_name:(engine_name_ : string_) () =
  ({
     endpoint_identifier = endpoint_identifier_;
     endpoint_type = endpoint_type_;
     engine_name = engine_name_;
     username = username_;
     password = password_;
     server_name = server_name_;
     port = port_;
     database_name = database_name_;
     extra_connection_attributes = extra_connection_attributes_;
     kms_key_id = kms_key_id_;
     tags = tags_;
     certificate_arn = certificate_arn_;
     ssl_mode = ssl_mode_;
     service_access_role_arn = service_access_role_arn_;
     external_table_definition = external_table_definition_;
     dynamo_db_settings = dynamo_db_settings_;
     s3_settings = s3_settings_;
     dms_transfer_settings = dms_transfer_settings_;
     mongo_db_settings = mongo_db_settings_;
     kinesis_settings = kinesis_settings_;
     kafka_settings = kafka_settings_;
     elasticsearch_settings = elasticsearch_settings_;
     neptune_settings = neptune_settings_;
     redshift_settings = redshift_settings_;
     postgre_sql_settings = postgre_sql_settings_;
     my_sql_settings = my_sql_settings_;
     oracle_settings = oracle_settings_;
     sybase_settings = sybase_settings_;
     microsoft_sql_server_settings = microsoft_sql_server_settings_;
     ibm_db2_settings = ibm_db2_settings_;
     resource_identifier = resource_identifier_;
     doc_db_settings = doc_db_settings_;
     redis_settings = redis_settings_;
     gcp_my_sql_settings = gcp_my_sql_settings_;
     timestream_settings = timestream_settings_;
   }
    : create_endpoint_message)

let make_create_data_provider_response ?data_provider:(data_provider_ : data_provider option) () =
  ({ data_provider = data_provider_ } : create_data_provider_response)

let make_create_data_provider_message ?data_provider_name:(data_provider_name_ : string_ option)
    ?description:(description_ : string_ option) ?\#virtual:(virtual_ : boolean_optional option)
    ?tags:(tags_ : tag_list option) ~engine:(engine_ : string_)
    ~settings:(settings_ : data_provider_settings) () =
  ({
     data_provider_name = data_provider_name_;
     description = description_;
     engine = engine_;
     \#virtual = virtual_;
     settings = settings_;
     tags = tags_;
   }
    : create_data_provider_message)

let make_create_data_migration_response ?data_migration:(data_migration_ : data_migration option) ()
    =
  ({ data_migration = data_migration_ } : create_data_migration_response)

let make_create_data_migration_message ?data_migration_name:(data_migration_name_ : string_ option)
    ?enable_cloudwatch_logs:(enable_cloudwatch_logs_ : boolean_optional option)
    ?source_data_settings:(source_data_settings_ : source_data_settings option)
    ?target_data_settings:(target_data_settings_ : target_data_settings option)
    ?number_of_jobs:(number_of_jobs_ : integer_optional option) ?tags:(tags_ : tag_list option)
    ?selection_rules:(selection_rules_ : secret_string option)
    ~migration_project_identifier:(migration_project_identifier_ : string_)
    ~data_migration_type:(data_migration_type_ : migration_type_value)
    ~service_access_role_arn:(service_access_role_arn_ : string_) () =
  ({
     data_migration_name = data_migration_name_;
     migration_project_identifier = migration_project_identifier_;
     data_migration_type = data_migration_type_;
     service_access_role_arn = service_access_role_arn_;
     enable_cloudwatch_logs = enable_cloudwatch_logs_;
     source_data_settings = source_data_settings_;
     target_data_settings = target_data_settings_;
     number_of_jobs = number_of_jobs_;
     tags = tags_;
     selection_rules = selection_rules_;
   }
    : create_data_migration_message)

let make_cancel_replication_task_assessment_run_response
    ?replication_task_assessment_run:
      (replication_task_assessment_run_ : replication_task_assessment_run option) () =
  ({ replication_task_assessment_run = replication_task_assessment_run_ }
    : cancel_replication_task_assessment_run_response)

let make_cancel_replication_task_assessment_run_message
    ~replication_task_assessment_run_arn:(replication_task_assessment_run_arn_ : string_) () =
  ({ replication_task_assessment_run_arn = replication_task_assessment_run_arn_ }
    : cancel_replication_task_assessment_run_message)

let make_cancel_metadata_model_creation_response
    ?request:(request_ : schema_conversion_request option) () =
  ({ request = request_ } : cancel_metadata_model_creation_response)

let make_cancel_metadata_model_creation_message
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier)
    ~request_identifier:(request_identifier_ : string_) () =
  ({
     migration_project_identifier = migration_project_identifier_;
     request_identifier = request_identifier_;
   }
    : cancel_metadata_model_creation_message)

let make_cancel_metadata_model_conversion_response
    ?request:(request_ : schema_conversion_request option) () =
  ({ request = request_ } : cancel_metadata_model_conversion_response)

let make_cancel_metadata_model_conversion_message
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier)
    ~request_identifier:(request_identifier_ : string_) () =
  ({
     migration_project_identifier = migration_project_identifier_;
     request_identifier = request_identifier_;
   }
    : cancel_metadata_model_conversion_message)

let make_batch_start_recommendations_error_entry ?database_id:(database_id_ : string_ option)
    ?message:(message_ : string_ option) ?code:(code_ : string_ option) () =
  ({ database_id = database_id_; message = message_; code = code_ }
    : batch_start_recommendations_error_entry)

let make_batch_start_recommendations_response
    ?error_entries:(error_entries_ : batch_start_recommendations_error_entry_list option) () =
  ({ error_entries = error_entries_ } : batch_start_recommendations_response)

let make_start_recommendations_request_entry ~database_id:(database_id_ : string_)
    ~settings:(settings_ : recommendation_settings) () =
  ({ database_id = database_id_; settings = settings_ } : start_recommendations_request_entry)

let make_batch_start_recommendations_request
    ?data:(data_ : start_recommendations_request_entry_list option) () =
  ({ data = data_ } : batch_start_recommendations_request)

let make_apply_pending_maintenance_action_response
    ?resource_pending_maintenance_actions:
      (resource_pending_maintenance_actions_ : resource_pending_maintenance_actions option) () =
  ({ resource_pending_maintenance_actions = resource_pending_maintenance_actions_ }
    : apply_pending_maintenance_action_response)

let make_apply_pending_maintenance_action_message
    ~replication_instance_arn:(replication_instance_arn_ : string_)
    ~apply_action:(apply_action_ : string_) ~opt_in_type:(opt_in_type_ : string_) () =
  ({
     replication_instance_arn = replication_instance_arn_;
     apply_action = apply_action_;
     opt_in_type = opt_in_type_;
   }
    : apply_pending_maintenance_action_message)
