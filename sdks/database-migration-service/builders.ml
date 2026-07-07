open Types

let make_vpc_security_group_membership ?status:(status_ : string_ option)
    ?vpc_security_group_id:(vpc_security_group_id_ : string_ option) () =
  ({ status = status_; vpc_security_group_id = vpc_security_group_id_ }
    : vpc_security_group_membership)

let make_update_subscriptions_to_event_bridge_response ?result_:(result__ : string_ option) () =
  ({ result_ = result__ } : update_subscriptions_to_event_bridge_response)

let make_update_subscriptions_to_event_bridge_message
    ?force_move:(force_move_ : boolean_optional option) () =
  ({ force_move = force_move_ } : update_subscriptions_to_event_bridge_message)

let make_timestream_settings
    ?enable_magnetic_store_writes:(enable_magnetic_store_writes_ : boolean_optional option)
    ?cdc_inserts_and_updates:(cdc_inserts_and_updates_ : boolean_optional option)
    ~magnetic_duration:(magnetic_duration_ : integer_optional)
    ~memory_duration:(memory_duration_ : integer_optional) ~database_name:(database_name_ : string_)
    () =
  ({
     enable_magnetic_store_writes = enable_magnetic_store_writes_;
     cdc_inserts_and_updates = cdc_inserts_and_updates_;
     magnetic_duration = magnetic_duration_;
     memory_duration = memory_duration_;
     database_name = database_name_;
   }
    : timestream_settings)

let make_connection
    ?replication_instance_identifier:(replication_instance_identifier_ : string_ option)
    ?endpoint_identifier:(endpoint_identifier_ : string_ option)
    ?last_failure_message:(last_failure_message_ : string_ option)
    ?status:(status_ : string_ option) ?endpoint_arn:(endpoint_arn_ : string_ option)
    ?replication_instance_arn:(replication_instance_arn_ : string_ option) () =
  ({
     replication_instance_identifier = replication_instance_identifier_;
     endpoint_identifier = endpoint_identifier_;
     last_failure_message = last_failure_message_;
     status = status_;
     endpoint_arn = endpoint_arn_;
     replication_instance_arn = replication_instance_arn_;
   }
    : connection)

let make_test_connection_response ?connection:(connection_ : connection option) () =
  ({ connection = connection_ } : test_connection_response)

let make_test_connection_message ~endpoint_arn:(endpoint_arn_ : string_)
    ~replication_instance_arn:(replication_instance_arn_ : string_) () =
  ({ endpoint_arn = endpoint_arn_; replication_instance_arn = replication_instance_arn_ }
    : test_connection_message)

let make_target_data_setting
    ?table_preparation_mode:(table_preparation_mode_ : table_preparation_mode option) () =
  ({ table_preparation_mode = table_preparation_mode_ } : target_data_setting)

let make_tag ?resource_arn:(resource_arn_ : string_ option) ?value:(value_ : string_ option)
    ?key:(key_ : string_ option) () =
  ({ resource_arn = resource_arn_; value = value_; key = key_ } : tag)

let make_table_to_reload ~table_name:(table_name_ : string_) ~schema_name:(schema_name_ : string_)
    () =
  ({ table_name = table_name_; schema_name = schema_name_ } : table_to_reload)

let make_table_statistics ?resync_progress:(resync_progress_ : double_optional option)
    ?resync_rows_failed:(resync_rows_failed_ : long_optional option)
    ?resync_rows_succeeded:(resync_rows_succeeded_ : long_optional option)
    ?resync_rows_attempted:(resync_rows_attempted_ : long_optional option)
    ?resync_state:(resync_state_ : string_ option)
    ?validation_state_details:(validation_state_details_ : string_ option)
    ?validation_state:(validation_state_ : string_ option)
    ?validation_suspended_records:(validation_suspended_records_ : long option)
    ?validation_failed_records:(validation_failed_records_ : long option)
    ?validation_pending_records:(validation_pending_records_ : long option)
    ?table_state:(table_state_ : string_ option)
    ?last_update_time:(last_update_time_ : t_stamp option)
    ?full_load_reloaded:(full_load_reloaded_ : boolean_optional option)
    ?full_load_end_time:(full_load_end_time_ : t_stamp option)
    ?full_load_start_time:(full_load_start_time_ : t_stamp option)
    ?full_load_error_rows:(full_load_error_rows_ : long option)
    ?full_load_condtnl_chk_failed_rows:(full_load_condtnl_chk_failed_rows_ : long option)
    ?full_load_rows:(full_load_rows_ : long option)
    ?applied_ddls:(applied_ddls_ : long_optional option)
    ?applied_updates:(applied_updates_ : long_optional option)
    ?applied_deletes:(applied_deletes_ : long_optional option)
    ?applied_inserts:(applied_inserts_ : long_optional option) ?ddls:(ddls_ : long option)
    ?updates:(updates_ : long option) ?deletes:(deletes_ : long option)
    ?inserts:(inserts_ : long option) ?table_name:(table_name_ : string_ option)
    ?schema_name:(schema_name_ : string_ option) () =
  ({
     resync_progress = resync_progress_;
     resync_rows_failed = resync_rows_failed_;
     resync_rows_succeeded = resync_rows_succeeded_;
     resync_rows_attempted = resync_rows_attempted_;
     resync_state = resync_state_;
     validation_state_details = validation_state_details_;
     validation_state = validation_state_;
     validation_suspended_records = validation_suspended_records_;
     validation_failed_records = validation_failed_records_;
     validation_pending_records = validation_pending_records_;
     table_state = table_state_;
     last_update_time = last_update_time_;
     full_load_reloaded = full_load_reloaded_;
     full_load_end_time = full_load_end_time_;
     full_load_start_time = full_load_start_time_;
     full_load_error_rows = full_load_error_rows_;
     full_load_condtnl_chk_failed_rows = full_load_condtnl_chk_failed_rows_;
     full_load_rows = full_load_rows_;
     applied_ddls = applied_ddls_;
     applied_updates = applied_updates_;
     applied_deletes = applied_deletes_;
     applied_inserts = applied_inserts_;
     ddls = ddls_;
     updates = updates_;
     deletes = deletes_;
     inserts = inserts_;
     table_name = table_name_;
     schema_name = schema_name_;
   }
    : table_statistics)

let make_sybase_settings ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?username:(username_ : string_ option) ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?password:(password_ : secret_string option)
    ?database_name:(database_name_ : string_ option) () =
  ({
     secrets_manager_secret_id = secrets_manager_secret_id_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     username = username_;
     server_name = server_name_;
     port = port_;
     password = password_;
     database_name = database_name_;
   }
    : sybase_settings)

let make_sybase_ase_data_provider_settings ?certificate_arn:(certificate_arn_ : string_ option)
    ?encrypt_password:(encrypt_password_ : boolean_optional option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?database_name:(database_name_ : string_ option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) () =
  ({
     certificate_arn = certificate_arn_;
     encrypt_password = encrypt_password_;
     ssl_mode = ssl_mode_;
     database_name = database_name_;
     port = port_;
     server_name = server_name_;
   }
    : sybase_ase_data_provider_settings)

let make_supported_endpoint_type ?engine_display_name:(engine_display_name_ : string_ option)
    ?replication_instance_engine_minimum_version:
      (replication_instance_engine_minimum_version_ : string_ option)
    ?endpoint_type:(endpoint_type_ : replication_endpoint_type_value option)
    ?supports_cd_c:(supports_cd_c_ : boolean_ option) ?engine_name:(engine_name_ : string_ option)
    () =
  ({
     engine_display_name = engine_display_name_;
     replication_instance_engine_minimum_version = replication_instance_engine_minimum_version_;
     endpoint_type = endpoint_type_;
     supports_cd_c = supports_cd_c_;
     engine_name = engine_name_;
   }
    : supported_endpoint_type)

let make_availability_zone ?name:(name_ : string_ option) () =
  ({ name = name_ } : availability_zone)

let make_subnet ?subnet_status:(subnet_status_ : string_ option)
    ?subnet_availability_zone:(subnet_availability_zone_ : availability_zone option)
    ?subnet_identifier:(subnet_identifier_ : string_ option) () =
  ({
     subnet_status = subnet_status_;
     subnet_availability_zone = subnet_availability_zone_;
     subnet_identifier = subnet_identifier_;
   }
    : subnet)

let make_replication_task_stats ?full_load_finish_date:(full_load_finish_date_ : t_stamp option)
    ?full_load_start_date:(full_load_start_date_ : t_stamp option)
    ?stop_date:(stop_date_ : t_stamp option) ?start_date:(start_date_ : t_stamp option)
    ?fresh_start_date:(fresh_start_date_ : t_stamp option)
    ?tables_errored:(tables_errored_ : integer option)
    ?tables_queued:(tables_queued_ : integer option)
    ?tables_loading:(tables_loading_ : integer option)
    ?tables_loaded:(tables_loaded_ : integer option)
    ?elapsed_time_millis:(elapsed_time_millis_ : long option)
    ?full_load_progress_percent:(full_load_progress_percent_ : integer option) () =
  ({
     full_load_finish_date = full_load_finish_date_;
     full_load_start_date = full_load_start_date_;
     stop_date = stop_date_;
     start_date = start_date_;
     fresh_start_date = fresh_start_date_;
     tables_errored = tables_errored_;
     tables_queued = tables_queued_;
     tables_loading = tables_loading_;
     tables_loaded = tables_loaded_;
     elapsed_time_millis = elapsed_time_millis_;
     full_load_progress_percent = full_load_progress_percent_;
   }
    : replication_task_stats)

let make_replication_task
    ?target_replication_instance_arn:(target_replication_instance_arn_ : string_ option)
    ?task_data:(task_data_ : string_ option)
    ?replication_task_stats:(replication_task_stats_ : replication_task_stats option)
    ?replication_task_arn:(replication_task_arn_ : string_ option)
    ?recovery_checkpoint:(recovery_checkpoint_ : string_ option)
    ?cdc_stop_position:(cdc_stop_position_ : string_ option)
    ?cdc_start_position:(cdc_start_position_ : string_ option)
    ?replication_task_start_date:(replication_task_start_date_ : t_stamp option)
    ?replication_task_creation_date:(replication_task_creation_date_ : t_stamp option)
    ?stop_reason:(stop_reason_ : string_ option)
    ?last_failure_message:(last_failure_message_ : string_ option)
    ?status:(status_ : string_ option)
    ?replication_task_settings:(replication_task_settings_ : string_ option)
    ?table_mappings:(table_mappings_ : string_ option)
    ?migration_type:(migration_type_ : migration_type_value option)
    ?replication_instance_arn:(replication_instance_arn_ : string_ option)
    ?target_endpoint_arn:(target_endpoint_arn_ : string_ option)
    ?source_endpoint_arn:(source_endpoint_arn_ : string_ option)
    ?replication_task_identifier:(replication_task_identifier_ : string_ option) () =
  ({
     target_replication_instance_arn = target_replication_instance_arn_;
     task_data = task_data_;
     replication_task_stats = replication_task_stats_;
     replication_task_arn = replication_task_arn_;
     recovery_checkpoint = recovery_checkpoint_;
     cdc_stop_position = cdc_stop_position_;
     cdc_start_position = cdc_start_position_;
     replication_task_start_date = replication_task_start_date_;
     replication_task_creation_date = replication_task_creation_date_;
     stop_reason = stop_reason_;
     last_failure_message = last_failure_message_;
     status = status_;
     replication_task_settings = replication_task_settings_;
     table_mappings = table_mappings_;
     migration_type = migration_type_;
     replication_instance_arn = replication_instance_arn_;
     target_endpoint_arn = target_endpoint_arn_;
     source_endpoint_arn = source_endpoint_arn_;
     replication_task_identifier = replication_task_identifier_;
   }
    : replication_task)

let make_stop_replication_task_response
    ?replication_task:(replication_task_ : replication_task option) () =
  ({ replication_task = replication_task_ } : stop_replication_task_response)

let make_stop_replication_task_message ~replication_task_arn:(replication_task_arn_ : string_) () =
  ({ replication_task_arn = replication_task_arn_ } : stop_replication_task_message)

let make_provision_data
    ?reason_for_new_provisioning_data:(reason_for_new_provisioning_data_ : string_ option)
    ?date_new_provisioning_data_available:(date_new_provisioning_data_available_ : t_stamp option)
    ?is_new_provisioning_available:(is_new_provisioning_available_ : boolean_ option)
    ?date_provisioned:(date_provisioned_ : t_stamp option)
    ?provisioned_capacity_units:(provisioned_capacity_units_ : integer option)
    ?provision_state:(provision_state_ : string_ option) () =
  ({
     reason_for_new_provisioning_data = reason_for_new_provisioning_data_;
     date_new_provisioning_data_available = date_new_provisioning_data_available_;
     is_new_provisioning_available = is_new_provisioning_available_;
     date_provisioned = date_provisioned_;
     provisioned_capacity_units = provisioned_capacity_units_;
     provision_state = provision_state_;
   }
    : provision_data)

let make_replication_task_assessment_run_progress
    ?individual_assessment_completed_count:(individual_assessment_completed_count_ : integer option)
    ?individual_assessment_count:(individual_assessment_count_ : integer option) () =
  ({
     individual_assessment_completed_count = individual_assessment_completed_count_;
     individual_assessment_count = individual_assessment_count_;
   }
    : replication_task_assessment_run_progress)

let make_replication_task_assessment_run_result_statistic ?skipped:(skipped_ : integer option)
    ?cancelled:(cancelled_ : integer option) ?warning:(warning_ : integer option)
    ?error:(error_ : integer option) ?failed:(failed_ : integer option)
    ?passed:(passed_ : integer option) () =
  ({
     skipped = skipped_;
     cancelled = cancelled_;
     warning = warning_;
     error = error_;
     failed = failed_;
     passed = passed_;
   }
    : replication_task_assessment_run_result_statistic)

let make_premigration_assessment_status
    ?result_statistic:(result_statistic_ : replication_task_assessment_run_result_statistic option)
    ?result_kms_key_arn:(result_kms_key_arn_ : string_ option)
    ?result_encryption_mode:(result_encryption_mode_ : string_ option)
    ?result_location_folder:(result_location_folder_ : string_ option)
    ?result_location_bucket:(result_location_bucket_ : string_ option)
    ?last_failure_message:(last_failure_message_ : string_ option)
    ?assessment_progress:(assessment_progress_ : replication_task_assessment_run_progress option)
    ?premigration_assessment_run_creation_date:
      (premigration_assessment_run_creation_date_ : t_stamp option)
    ?status:(status_ : string_ option)
    ?fail_on_assessment_failure:(fail_on_assessment_failure_ : boolean_ option)
    ?premigration_assessment_run_arn:(premigration_assessment_run_arn_ : string_ option) () =
  ({
     result_statistic = result_statistic_;
     result_kms_key_arn = result_kms_key_arn_;
     result_encryption_mode = result_encryption_mode_;
     result_location_folder = result_location_folder_;
     result_location_bucket = result_location_bucket_;
     last_failure_message = last_failure_message_;
     assessment_progress = assessment_progress_;
     premigration_assessment_run_creation_date = premigration_assessment_run_creation_date_;
     status = status_;
     fail_on_assessment_failure = fail_on_assessment_failure_;
     premigration_assessment_run_arn = premigration_assessment_run_arn_;
   }
    : premigration_assessment_status)

let make_replication_stats ?full_load_finish_date:(full_load_finish_date_ : t_stamp option)
    ?full_load_start_date:(full_load_start_date_ : t_stamp option)
    ?stop_date:(stop_date_ : t_stamp option) ?start_date:(start_date_ : t_stamp option)
    ?fresh_start_date:(fresh_start_date_ : t_stamp option)
    ?tables_errored:(tables_errored_ : integer option)
    ?tables_queued:(tables_queued_ : integer option)
    ?tables_loading:(tables_loading_ : integer option)
    ?tables_loaded:(tables_loaded_ : integer option)
    ?elapsed_time_millis:(elapsed_time_millis_ : long option)
    ?full_load_progress_percent:(full_load_progress_percent_ : integer option) () =
  ({
     full_load_finish_date = full_load_finish_date_;
     full_load_start_date = full_load_start_date_;
     stop_date = stop_date_;
     start_date = start_date_;
     fresh_start_date = fresh_start_date_;
     tables_errored = tables_errored_;
     tables_queued = tables_queued_;
     tables_loading = tables_loading_;
     tables_loaded = tables_loaded_;
     elapsed_time_millis = elapsed_time_millis_;
     full_load_progress_percent = full_load_progress_percent_;
   }
    : replication_stats)

let make_replication ?is_read_only:(is_read_only_ : boolean_optional option)
    ?replication_deprovision_time:(replication_deprovision_time_ : t_stamp option)
    ?replication_last_stop_time:(replication_last_stop_time_ : t_stamp option)
    ?replication_update_time:(replication_update_time_ : t_stamp option)
    ?replication_create_time:(replication_create_time_ : t_stamp option)
    ?recovery_checkpoint:(recovery_checkpoint_ : string_ option)
    ?cdc_stop_position:(cdc_stop_position_ : string_ option)
    ?cdc_start_position:(cdc_start_position_ : string_ option)
    ?cdc_start_time:(cdc_start_time_ : t_stamp option)
    ?start_replication_type:(start_replication_type_ : string_ option)
    ?replication_stats:(replication_stats_ : replication_stats option)
    ?failure_messages:(failure_messages_ : string_list option)
    ?stop_reason:(stop_reason_ : string_ option)
    ?premigration_assessment_statuses:
      (premigration_assessment_statuses_ : premigration_assessment_status_list option)
    ?provision_data:(provision_data_ : provision_data option) ?status:(status_ : string_ option)
    ?replication_type:(replication_type_ : migration_type_value option)
    ?target_endpoint_arn:(target_endpoint_arn_ : string_ option)
    ?source_endpoint_arn:(source_endpoint_arn_ : string_ option)
    ?replication_config_arn:(replication_config_arn_ : string_ option)
    ?replication_config_identifier:(replication_config_identifier_ : string_ option) () =
  ({
     is_read_only = is_read_only_;
     replication_deprovision_time = replication_deprovision_time_;
     replication_last_stop_time = replication_last_stop_time_;
     replication_update_time = replication_update_time_;
     replication_create_time = replication_create_time_;
     recovery_checkpoint = recovery_checkpoint_;
     cdc_stop_position = cdc_stop_position_;
     cdc_start_position = cdc_start_position_;
     cdc_start_time = cdc_start_time_;
     start_replication_type = start_replication_type_;
     replication_stats = replication_stats_;
     failure_messages = failure_messages_;
     stop_reason = stop_reason_;
     premigration_assessment_statuses = premigration_assessment_statuses_;
     provision_data = provision_data_;
     status = status_;
     replication_type = replication_type_;
     target_endpoint_arn = target_endpoint_arn_;
     source_endpoint_arn = source_endpoint_arn_;
     replication_config_arn = replication_config_arn_;
     replication_config_identifier = replication_config_identifier_;
   }
    : replication)

let make_stop_replication_response ?replication:(replication_ : replication option) () =
  ({ replication = replication_ } : stop_replication_response)

let make_stop_replication_message ~replication_config_arn:(replication_config_arn_ : string_) () =
  ({ replication_config_arn = replication_config_arn_ } : stop_replication_message)

let make_data_migration_settings ?selection_rules:(selection_rules_ : secret_string option)
    ?cloudwatch_logs_enabled:(cloudwatch_logs_enabled_ : boolean_optional option)
    ?number_of_jobs:(number_of_jobs_ : integer_optional option) () =
  ({
     selection_rules = selection_rules_;
     cloudwatch_logs_enabled = cloudwatch_logs_enabled_;
     number_of_jobs = number_of_jobs_;
   }
    : data_migration_settings)

let make_source_data_setting ?slot_name:(slot_name_ : string_ option)
    ?cdc_stop_time:(cdc_stop_time_ : iso8601_date_time option)
    ?cdc_start_time:(cdc_start_time_ : iso8601_date_time option)
    ?cdc_start_position:(cdc_start_position_ : string_ option) () =
  ({
     slot_name = slot_name_;
     cdc_stop_time = cdc_stop_time_;
     cdc_start_time = cdc_start_time_;
     cdc_start_position = cdc_start_position_;
   }
    : source_data_setting)

let make_data_migration_statistics ?stop_time:(stop_time_ : iso8601_date_time option)
    ?start_time:(start_time_ : iso8601_date_time option)
    ?tables_errored:(tables_errored_ : integer option)
    ?tables_queued:(tables_queued_ : integer option) ?cdc_latency:(cdc_latency_ : integer option)
    ?full_load_percentage:(full_load_percentage_ : integer option)
    ?tables_loading:(tables_loading_ : integer option)
    ?elapsed_time_millis:(elapsed_time_millis_ : long option)
    ?tables_loaded:(tables_loaded_ : integer option) () =
  ({
     stop_time = stop_time_;
     start_time = start_time_;
     tables_errored = tables_errored_;
     tables_queued = tables_queued_;
     cdc_latency = cdc_latency_;
     full_load_percentage = full_load_percentage_;
     tables_loading = tables_loading_;
     elapsed_time_millis = elapsed_time_millis_;
     tables_loaded = tables_loaded_;
   }
    : data_migration_statistics)

let make_data_migration ?stop_reason:(stop_reason_ : string_ option)
    ?last_failure_message:(last_failure_message_ : string_ option)
    ?data_migration_cidr_blocks:(data_migration_cidr_blocks_ : data_migration_cidr_block option)
    ?public_ip_addresses:(public_ip_addresses_ : public_ip_address_list option)
    ?data_migration_status:(data_migration_status_ : string_ option)
    ?data_migration_statistics:(data_migration_statistics_ : data_migration_statistics option)
    ?target_data_settings:(target_data_settings_ : target_data_settings option)
    ?source_data_settings:(source_data_settings_ : source_data_settings option)
    ?data_migration_settings:(data_migration_settings_ : data_migration_settings option)
    ?data_migration_type:(data_migration_type_ : migration_type_value option)
    ?migration_project_arn:(migration_project_arn_ : string_ option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?data_migration_end_time:(data_migration_end_time_ : iso8601_date_time option)
    ?data_migration_start_time:(data_migration_start_time_ : iso8601_date_time option)
    ?data_migration_create_time:(data_migration_create_time_ : iso8601_date_time option)
    ?data_migration_arn:(data_migration_arn_ : string_ option)
    ?data_migration_name:(data_migration_name_ : string_ option) () =
  ({
     stop_reason = stop_reason_;
     last_failure_message = last_failure_message_;
     data_migration_cidr_blocks = data_migration_cidr_blocks_;
     public_ip_addresses = public_ip_addresses_;
     data_migration_status = data_migration_status_;
     data_migration_statistics = data_migration_statistics_;
     target_data_settings = target_data_settings_;
     source_data_settings = source_data_settings_;
     data_migration_settings = data_migration_settings_;
     data_migration_type = data_migration_type_;
     migration_project_arn = migration_project_arn_;
     service_access_role_arn = service_access_role_arn_;
     data_migration_end_time = data_migration_end_time_;
     data_migration_start_time = data_migration_start_time_;
     data_migration_create_time = data_migration_create_time_;
     data_migration_arn = data_migration_arn_;
     data_migration_name = data_migration_name_;
   }
    : data_migration)

let make_stop_data_migration_response ?data_migration:(data_migration_ : data_migration option) () =
  ({ data_migration = data_migration_ } : stop_data_migration_response)

let make_stop_data_migration_message
    ~data_migration_identifier:(data_migration_identifier_ : string_) () =
  ({ data_migration_identifier = data_migration_identifier_ } : stop_data_migration_message)

let make_statement_properties ~definition:(definition_ : string_) () =
  ({ definition = definition_ } : statement_properties)

let make_start_replication_task_response
    ?replication_task:(replication_task_ : replication_task option) () =
  ({ replication_task = replication_task_ } : start_replication_task_response)

let make_start_replication_task_message ?cdc_stop_position:(cdc_stop_position_ : string_ option)
    ?cdc_start_position:(cdc_start_position_ : string_ option)
    ?cdc_start_time:(cdc_start_time_ : t_stamp option)
    ~start_replication_task_type:(start_replication_task_type_ : start_replication_task_type_value)
    ~replication_task_arn:(replication_task_arn_ : string_) () =
  ({
     cdc_stop_position = cdc_stop_position_;
     cdc_start_position = cdc_start_position_;
     cdc_start_time = cdc_start_time_;
     start_replication_task_type = start_replication_task_type_;
     replication_task_arn = replication_task_arn_;
   }
    : start_replication_task_message)

let make_replication_task_assessment_run
    ?result_statistic:(result_statistic_ : replication_task_assessment_run_result_statistic option)
    ?is_latest_task_assessment_run:(is_latest_task_assessment_run_ : boolean_ option)
    ?assessment_run_name:(assessment_run_name_ : string_ option)
    ?result_kms_key_arn:(result_kms_key_arn_ : string_ option)
    ?result_encryption_mode:(result_encryption_mode_ : string_ option)
    ?result_location_folder:(result_location_folder_ : string_ option)
    ?result_location_bucket:(result_location_bucket_ : string_ option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?last_failure_message:(last_failure_message_ : string_ option)
    ?assessment_progress:(assessment_progress_ : replication_task_assessment_run_progress option)
    ?replication_task_assessment_run_creation_date:
      (replication_task_assessment_run_creation_date_ : t_stamp option)
    ?status:(status_ : string_ option)
    ?replication_task_arn:(replication_task_arn_ : string_ option)
    ?replication_task_assessment_run_arn:(replication_task_assessment_run_arn_ : string_ option) ()
    =
  ({
     result_statistic = result_statistic_;
     is_latest_task_assessment_run = is_latest_task_assessment_run_;
     assessment_run_name = assessment_run_name_;
     result_kms_key_arn = result_kms_key_arn_;
     result_encryption_mode = result_encryption_mode_;
     result_location_folder = result_location_folder_;
     result_location_bucket = result_location_bucket_;
     service_access_role_arn = service_access_role_arn_;
     last_failure_message = last_failure_message_;
     assessment_progress = assessment_progress_;
     replication_task_assessment_run_creation_date = replication_task_assessment_run_creation_date_;
     status = status_;
     replication_task_arn = replication_task_arn_;
     replication_task_assessment_run_arn = replication_task_assessment_run_arn_;
   }
    : replication_task_assessment_run)

let make_start_replication_task_assessment_run_response
    ?replication_task_assessment_run:
      (replication_task_assessment_run_ : replication_task_assessment_run option) () =
  ({ replication_task_assessment_run = replication_task_assessment_run_ }
    : start_replication_task_assessment_run_response)

let make_start_replication_task_assessment_run_message ?tags:(tags_ : tag_list option)
    ?exclude:(exclude_ : exclude_test_list option)
    ?include_only:(include_only_ : include_test_list option)
    ?result_kms_key_arn:(result_kms_key_arn_ : string_ option)
    ?result_encryption_mode:(result_encryption_mode_ : string_ option)
    ?result_location_folder:(result_location_folder_ : string_ option)
    ~assessment_run_name:(assessment_run_name_ : string_)
    ~result_location_bucket:(result_location_bucket_ : string_)
    ~service_access_role_arn:(service_access_role_arn_ : string_)
    ~replication_task_arn:(replication_task_arn_ : string_) () =
  ({
     tags = tags_;
     exclude = exclude_;
     include_only = include_only_;
     assessment_run_name = assessment_run_name_;
     result_kms_key_arn = result_kms_key_arn_;
     result_encryption_mode = result_encryption_mode_;
     result_location_folder = result_location_folder_;
     result_location_bucket = result_location_bucket_;
     service_access_role_arn = service_access_role_arn_;
     replication_task_arn = replication_task_arn_;
   }
    : start_replication_task_assessment_run_message)

let make_start_replication_task_assessment_response
    ?replication_task:(replication_task_ : replication_task option) () =
  ({ replication_task = replication_task_ } : start_replication_task_assessment_response)

let make_start_replication_task_assessment_message
    ~replication_task_arn:(replication_task_arn_ : string_) () =
  ({ replication_task_arn = replication_task_arn_ } : start_replication_task_assessment_message)

let make_start_replication_response ?replication:(replication_ : replication option) () =
  ({ replication = replication_ } : start_replication_response)

let make_start_replication_message ?cdc_stop_position:(cdc_stop_position_ : string_ option)
    ?cdc_start_position:(cdc_start_position_ : string_ option)
    ?cdc_start_time:(cdc_start_time_ : t_stamp option)
    ?premigration_assessment_settings:(premigration_assessment_settings_ : string_ option)
    ~start_replication_type:(start_replication_type_ : string_)
    ~replication_config_arn:(replication_config_arn_ : string_) () =
  ({
     cdc_stop_position = cdc_stop_position_;
     cdc_start_position = cdc_start_position_;
     cdc_start_time = cdc_start_time_;
     premigration_assessment_settings = premigration_assessment_settings_;
     start_replication_type = start_replication_type_;
     replication_config_arn = replication_config_arn_;
   }
    : start_replication_message)

let make_recommendation_settings ~workload_type:(workload_type_ : string_)
    ~instance_sizing_type:(instance_sizing_type_ : string_) () =
  ({ workload_type = workload_type_; instance_sizing_type = instance_sizing_type_ }
    : recommendation_settings)

let make_start_recommendations_request_entry ~settings:(settings_ : recommendation_settings)
    ~database_id:(database_id_ : string_) () =
  ({ settings = settings_; database_id = database_id_ } : start_recommendations_request_entry)

let make_start_recommendations_request ~settings:(settings_ : recommendation_settings)
    ~database_id:(database_id_ : string_) () =
  ({ settings = settings_; database_id = database_id_ } : start_recommendations_request)

let make_start_metadata_model_import_response
    ?request_identifier:(request_identifier_ : string_ option) () =
  ({ request_identifier = request_identifier_ } : start_metadata_model_import_response)

let make_start_metadata_model_import_message ?refresh:(refresh_ : boolean_ option)
    ~origin:(origin_ : origin_type_value) ~selection_rules:(selection_rules_ : string_)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     refresh = refresh_;
     origin = origin_;
     selection_rules = selection_rules_;
     migration_project_identifier = migration_project_identifier_;
   }
    : start_metadata_model_import_message)

let make_start_metadata_model_export_to_target_response
    ?request_identifier:(request_identifier_ : string_ option) () =
  ({ request_identifier = request_identifier_ } : start_metadata_model_export_to_target_response)

let make_start_metadata_model_export_to_target_message
    ?overwrite_extension_pack:(overwrite_extension_pack_ : boolean_optional option)
    ~selection_rules:(selection_rules_ : string_)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     overwrite_extension_pack = overwrite_extension_pack_;
     selection_rules = selection_rules_;
     migration_project_identifier = migration_project_identifier_;
   }
    : start_metadata_model_export_to_target_message)

let make_start_metadata_model_export_as_script_response
    ?request_identifier:(request_identifier_ : string_ option) () =
  ({ request_identifier = request_identifier_ } : start_metadata_model_export_as_script_response)

let make_start_metadata_model_export_as_script_message ?file_name:(file_name_ : string_ option)
    ~origin:(origin_ : origin_type_value) ~selection_rules:(selection_rules_ : string_)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     file_name = file_name_;
     origin = origin_;
     selection_rules = selection_rules_;
     migration_project_identifier = migration_project_identifier_;
   }
    : start_metadata_model_export_as_script_message)

let make_start_metadata_model_creation_response
    ?request_identifier:(request_identifier_ : string_ option) () =
  ({ request_identifier = request_identifier_ } : start_metadata_model_creation_response)

let make_start_metadata_model_creation_message ~properties:(properties_ : metadata_model_properties)
    ~metadata_model_name:(metadata_model_name_ : string_)
    ~selection_rules:(selection_rules_ : string_)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     properties = properties_;
     metadata_model_name = metadata_model_name_;
     selection_rules = selection_rules_;
     migration_project_identifier = migration_project_identifier_;
   }
    : start_metadata_model_creation_message)

let make_start_metadata_model_conversion_response
    ?request_identifier:(request_identifier_ : string_ option) () =
  ({ request_identifier = request_identifier_ } : start_metadata_model_conversion_response)

let make_start_metadata_model_conversion_message ~selection_rules:(selection_rules_ : string_)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     selection_rules = selection_rules_;
     migration_project_identifier = migration_project_identifier_;
   }
    : start_metadata_model_conversion_message)

let make_start_metadata_model_assessment_response
    ?request_identifier:(request_identifier_ : string_ option) () =
  ({ request_identifier = request_identifier_ } : start_metadata_model_assessment_response)

let make_start_metadata_model_assessment_message ~selection_rules:(selection_rules_ : string_)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     selection_rules = selection_rules_;
     migration_project_identifier = migration_project_identifier_;
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
    ~start_type:(start_type_ : start_replication_migration_type_value)
    ~data_migration_identifier:(data_migration_identifier_ : string_) () =
  ({ start_type = start_type_; data_migration_identifier = data_migration_identifier_ }
    : start_data_migration_message)

let make_server_short_info_response ?server_name:(server_name_ : string_ option)
    ?ip_address:(ip_address_ : string_ option) ?server_id:(server_id_ : string_ option) () =
  ({ server_name = server_name_; ip_address = ip_address_; server_id = server_id_ }
    : server_short_info_response)

let make_schema_short_info_response ?database_ip_address:(database_ip_address_ : string_ option)
    ?database_name:(database_name_ : string_ option) ?database_id:(database_id_ : string_ option)
    ?schema_name:(schema_name_ : string_ option) ?schema_id:(schema_id_ : string_ option) () =
  ({
     database_ip_address = database_ip_address_;
     database_name = database_name_;
     database_id = database_id_;
     schema_name = schema_name_;
     schema_id = schema_id_;
   }
    : schema_short_info_response)

let make_database_short_info_response ?database_engine:(database_engine_ : string_ option)
    ?database_ip_address:(database_ip_address_ : string_ option)
    ?database_name:(database_name_ : string_ option) ?database_id:(database_id_ : string_ option) ()
    =
  ({
     database_engine = database_engine_;
     database_ip_address = database_ip_address_;
     database_name = database_name_;
     database_id = database_id_;
   }
    : database_short_info_response)

let make_schema_response ?similarity:(similarity_ : double_optional option)
    ?original_schema:(original_schema_ : schema_short_info_response option)
    ?schema_name:(schema_name_ : string_ option) ?schema_id:(schema_id_ : string_ option)
    ?database_instance:(database_instance_ : database_short_info_response option)
    ?server:(server_ : server_short_info_response option) ?complexity:(complexity_ : string_ option)
    ?code_size:(code_size_ : long_optional option)
    ?code_line_count:(code_line_count_ : long_optional option) () =
  ({
     similarity = similarity_;
     original_schema = original_schema_;
     schema_name = schema_name_;
     schema_id = schema_id_;
     database_instance = database_instance_;
     server = server_;
     complexity = complexity_;
     code_size = code_size_;
     code_line_count = code_line_count_;
   }
    : schema_response)

let make_default_error_details ?message:(message_ : string_ option) () =
  ({ message = message_ } : default_error_details)

let make_export_sql_details ?object_ur_l:(object_ur_l_ : string_ option)
    ?s3_object_key:(s3_object_key_ : string_ option) () =
  ({ object_ur_l = object_ur_l_; s3_object_key = s3_object_key_ } : export_sql_details)

let make_processed_object ?endpoint_type:(endpoint_type_ : string_ option)
    ?type_:(type__ : string_ option) ?name:(name_ : string_ option) () =
  ({ endpoint_type = endpoint_type_; type_ = type__; name = name_ } : processed_object)

let make_progress ?processed_object:(processed_object_ : processed_object option)
    ?progress_step:(progress_step_ : string_ option) ?total_objects:(total_objects_ : long option)
    ?progress_percent:(progress_percent_ : double_optional option) () =
  ({
     processed_object = processed_object_;
     progress_step = progress_step_;
     total_objects = total_objects_;
     progress_percent = progress_percent_;
   }
    : progress)

let make_schema_conversion_request ?progress:(progress_ : progress option)
    ?export_sql_details:(export_sql_details_ : export_sql_details option)
    ?error:(error_ : error_details option)
    ?migration_project_arn:(migration_project_arn_ : string_ option)
    ?request_identifier:(request_identifier_ : string_ option) ?status:(status_ : string_ option) ()
    =
  ({
     progress = progress_;
     export_sql_details = export_sql_details_;
     error = error_;
     migration_project_arn = migration_project_arn_;
     request_identifier = request_identifier_;
     status = status_;
   }
    : schema_conversion_request)

let make_sc_application_attributes ?s3_bucket_role_arn:(s3_bucket_role_arn_ : string_ option)
    ?s3_bucket_path:(s3_bucket_path_ : string_ option) () =
  ({ s3_bucket_role_arn = s3_bucket_role_arn_; s3_bucket_path = s3_bucket_path_ }
    : sc_application_attributes)

let make_s3_settings ?glue_catalog_generation:(glue_catalog_generation_ : boolean_optional option)
    ?expected_bucket_owner:(expected_bucket_owner_ : string_ option)
    ?add_trailing_padding_character:(add_trailing_padding_character_ : boolean_optional option)
    ?date_partition_timezone:(date_partition_timezone_ : string_ option)
    ?rfc4180:(rfc4180_ : boolean_optional option)
    ?max_file_size:(max_file_size_ : integer_optional option)
    ?ignore_header_rows:(ignore_header_rows_ : integer_optional option)
    ?csv_null_value:(csv_null_value_ : string_ option)
    ?cdc_min_file_size:(cdc_min_file_size_ : integer_optional option)
    ?cdc_max_batch_interval:(cdc_max_batch_interval_ : integer_optional option)
    ?add_column_name:(add_column_name_ : boolean_optional option)
    ?canned_acl_for_objects:(canned_acl_for_objects_ : canned_acl_for_objects_value option)
    ?use_task_start_time_for_full_load_timestamp:
      (use_task_start_time_for_full_load_timestamp_ : boolean_optional option)
    ?cdc_path:(cdc_path_ : string_ option)
    ?preserve_transactions:(preserve_transactions_ : boolean_optional option)
    ?csv_no_sup_value:(csv_no_sup_value_ : string_ option)
    ?use_csv_no_sup_value:(use_csv_no_sup_value_ : boolean_optional option)
    ?date_partition_delimiter:(date_partition_delimiter_ : date_partition_delimiter_value option)
    ?date_partition_sequence:(date_partition_sequence_ : date_partition_sequence_value option)
    ?date_partition_enabled:(date_partition_enabled_ : boolean_optional option)
    ?cdc_inserts_and_updates:(cdc_inserts_and_updates_ : boolean_optional option)
    ?parquet_timestamp_in_millisecond:(parquet_timestamp_in_millisecond_ : boolean_optional option)
    ?timestamp_column_name:(timestamp_column_name_ : string_ option)
    ?cdc_inserts_only:(cdc_inserts_only_ : boolean_optional option)
    ?include_op_for_full_load:(include_op_for_full_load_ : boolean_optional option)
    ?enable_statistics:(enable_statistics_ : boolean_optional option)
    ?parquet_version:(parquet_version_ : parquet_version_value option)
    ?data_page_size:(data_page_size_ : integer_optional option)
    ?row_group_length:(row_group_length_ : integer_optional option)
    ?dict_page_size_limit:(dict_page_size_limit_ : integer_optional option)
    ?encoding_type:(encoding_type_ : encoding_type_value option)
    ?data_format:(data_format_ : data_format_value option)
    ?server_side_encryption_kms_key_id:(server_side_encryption_kms_key_id_ : string_ option)
    ?encryption_mode:(encryption_mode_ : encryption_mode_value option)
    ?compression_type:(compression_type_ : compression_type_value option)
    ?bucket_name:(bucket_name_ : string_ option) ?bucket_folder:(bucket_folder_ : string_ option)
    ?csv_delimiter:(csv_delimiter_ : string_ option)
    ?csv_row_delimiter:(csv_row_delimiter_ : string_ option)
    ?external_table_definition:(external_table_definition_ : string_ option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option) () =
  ({
     glue_catalog_generation = glue_catalog_generation_;
     expected_bucket_owner = expected_bucket_owner_;
     add_trailing_padding_character = add_trailing_padding_character_;
     date_partition_timezone = date_partition_timezone_;
     rfc4180 = rfc4180_;
     max_file_size = max_file_size_;
     ignore_header_rows = ignore_header_rows_;
     csv_null_value = csv_null_value_;
     cdc_min_file_size = cdc_min_file_size_;
     cdc_max_batch_interval = cdc_max_batch_interval_;
     add_column_name = add_column_name_;
     canned_acl_for_objects = canned_acl_for_objects_;
     use_task_start_time_for_full_load_timestamp = use_task_start_time_for_full_load_timestamp_;
     cdc_path = cdc_path_;
     preserve_transactions = preserve_transactions_;
     csv_no_sup_value = csv_no_sup_value_;
     use_csv_no_sup_value = use_csv_no_sup_value_;
     date_partition_delimiter = date_partition_delimiter_;
     date_partition_sequence = date_partition_sequence_;
     date_partition_enabled = date_partition_enabled_;
     cdc_inserts_and_updates = cdc_inserts_and_updates_;
     parquet_timestamp_in_millisecond = parquet_timestamp_in_millisecond_;
     timestamp_column_name = timestamp_column_name_;
     cdc_inserts_only = cdc_inserts_only_;
     include_op_for_full_load = include_op_for_full_load_;
     enable_statistics = enable_statistics_;
     parquet_version = parquet_version_;
     data_page_size = data_page_size_;
     row_group_length = row_group_length_;
     dict_page_size_limit = dict_page_size_limit_;
     encoding_type = encoding_type_;
     data_format = data_format_;
     server_side_encryption_kms_key_id = server_side_encryption_kms_key_id_;
     encryption_mode = encryption_mode_;
     compression_type = compression_type_;
     bucket_name = bucket_name_;
     bucket_folder = bucket_folder_;
     csv_delimiter = csv_delimiter_;
     csv_row_delimiter = csv_row_delimiter_;
     external_table_definition = external_table_definition_;
     service_access_role_arn = service_access_role_arn_;
   }
    : s3_settings)

let make_run_fleet_advisor_lsa_analysis_response ?status:(status_ : string_ option)
    ?lsa_analysis_id:(lsa_analysis_id_ : string_ option) () =
  ({ status = status_; lsa_analysis_id = lsa_analysis_id_ }
    : run_fleet_advisor_lsa_analysis_response)

let make_pending_maintenance_action ?description:(description_ : string_ option)
    ?current_apply_date:(current_apply_date_ : t_stamp option)
    ?opt_in_status:(opt_in_status_ : string_ option)
    ?forced_apply_date:(forced_apply_date_ : t_stamp option)
    ?auto_applied_after_date:(auto_applied_after_date_ : t_stamp option)
    ?action:(action_ : string_ option) () =
  ({
     description = description_;
     current_apply_date = current_apply_date_;
     opt_in_status = opt_in_status_;
     forced_apply_date = forced_apply_date_;
     auto_applied_after_date = auto_applied_after_date_;
     action = action_;
   }
    : pending_maintenance_action)

let make_resource_pending_maintenance_actions
    ?pending_maintenance_action_details:
      (pending_maintenance_action_details_ : pending_maintenance_action_details option)
    ?resource_identifier:(resource_identifier_ : string_ option) () =
  ({
     pending_maintenance_action_details = pending_maintenance_action_details_;
     resource_identifier = resource_identifier_;
   }
    : resource_pending_maintenance_actions)

let make_replication_task_individual_assessment
    ?replication_task_individual_assessment_start_date:
      (replication_task_individual_assessment_start_date_ : t_stamp option)
    ?status:(status_ : string_ option)
    ?individual_assessment_name:(individual_assessment_name_ : string_ option)
    ?replication_task_assessment_run_arn:(replication_task_assessment_run_arn_ : string_ option)
    ?replication_task_individual_assessment_arn:
      (replication_task_individual_assessment_arn_ : string_ option) () =
  ({
     replication_task_individual_assessment_start_date =
       replication_task_individual_assessment_start_date_;
     status = status_;
     individual_assessment_name = individual_assessment_name_;
     replication_task_assessment_run_arn = replication_task_assessment_run_arn_;
     replication_task_individual_assessment_arn = replication_task_individual_assessment_arn_;
   }
    : replication_task_individual_assessment)

let make_replication_subnet_group ?is_read_only:(is_read_only_ : boolean_optional option)
    ?supported_network_types:(supported_network_types_ : string_list option)
    ?subnets:(subnets_ : subnet_list option)
    ?subnet_group_status:(subnet_group_status_ : string_ option) ?vpc_id:(vpc_id_ : string_ option)
    ?replication_subnet_group_description:(replication_subnet_group_description_ : string_ option)
    ?replication_subnet_group_identifier:(replication_subnet_group_identifier_ : string_ option) ()
    =
  ({
     is_read_only = is_read_only_;
     supported_network_types = supported_network_types_;
     subnets = subnets_;
     subnet_group_status = subnet_group_status_;
     vpc_id = vpc_id_;
     replication_subnet_group_description = replication_subnet_group_description_;
     replication_subnet_group_identifier = replication_subnet_group_identifier_;
   }
    : replication_subnet_group)

let make_replication_pending_modified_values ?network_type:(network_type_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?replication_instance_class:(replication_instance_class_ : replication_instance_class option) ()
    =
  ({
     network_type = network_type_;
     engine_version = engine_version_;
     multi_a_z = multi_a_z_;
     allocated_storage = allocated_storage_;
     replication_instance_class = replication_instance_class_;
   }
    : replication_pending_modified_values)

let make_replication_instance_task_log
    ?replication_instance_task_log_size:(replication_instance_task_log_size_ : long option)
    ?replication_task_arn:(replication_task_arn_ : string_ option)
    ?replication_task_name:(replication_task_name_ : string_ option) () =
  ({
     replication_instance_task_log_size = replication_instance_task_log_size_;
     replication_task_arn = replication_task_arn_;
     replication_task_name = replication_task_name_;
   }
    : replication_instance_task_log)

let make_kerberos_authentication_settings ?krb5_file_contents:(krb5_file_contents_ : string_ option)
    ?key_cache_secret_iam_arn:(key_cache_secret_iam_arn_ : string_ option)
    ?key_cache_secret_id:(key_cache_secret_id_ : string_ option) () =
  ({
     krb5_file_contents = krb5_file_contents_;
     key_cache_secret_iam_arn = key_cache_secret_iam_arn_;
     key_cache_secret_id = key_cache_secret_id_;
   }
    : kerberos_authentication_settings)

let make_replication_instance
    ?kerberos_authentication_settings:
      (kerberos_authentication_settings_ : kerberos_authentication_settings option)
    ?network_type:(network_type_ : string_ option)
    ?dns_name_servers:(dns_name_servers_ : string_ option)
    ?free_until:(free_until_ : t_stamp option)
    ?secondary_availability_zone:(secondary_availability_zone_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_ option)
    ?replication_instance_ipv6_addresses:
      (replication_instance_ipv6_addresses_ : replication_instance_ipv6_address_list option)
    ?replication_instance_private_ip_addresses:
      (replication_instance_private_ip_addresses_ :
         replication_instance_private_ip_address_list option)
    ?replication_instance_public_ip_addresses:
      (replication_instance_public_ip_addresses_ :
         replication_instance_public_ip_address_list option)
    ?replication_instance_private_ip_address:
      (replication_instance_private_ip_address_ : string_ option)
    ?replication_instance_public_ip_address:
      (replication_instance_public_ip_address_ : string_ option)
    ?replication_instance_arn:(replication_instance_arn_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_ option)
    ?engine_version:(engine_version_ : string_ option) ?multi_a_z:(multi_a_z_ : boolean_ option)
    ?pending_modified_values:(pending_modified_values_ : replication_pending_modified_values option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?replication_subnet_group:(replication_subnet_group_ : replication_subnet_group option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?vpc_security_groups:(vpc_security_groups_ : vpc_security_group_membership_list option)
    ?instance_create_time:(instance_create_time_ : t_stamp option)
    ?allocated_storage:(allocated_storage_ : integer option)
    ?replication_instance_status:(replication_instance_status_ : string_ option)
    ?replication_instance_class:(replication_instance_class_ : replication_instance_class option)
    ?replication_instance_identifier:(replication_instance_identifier_ : string_ option) () =
  ({
     kerberos_authentication_settings = kerberos_authentication_settings_;
     network_type = network_type_;
     dns_name_servers = dns_name_servers_;
     free_until = free_until_;
     secondary_availability_zone = secondary_availability_zone_;
     publicly_accessible = publicly_accessible_;
     replication_instance_ipv6_addresses = replication_instance_ipv6_addresses_;
     replication_instance_private_ip_addresses = replication_instance_private_ip_addresses_;
     replication_instance_public_ip_addresses = replication_instance_public_ip_addresses_;
     replication_instance_private_ip_address = replication_instance_private_ip_address_;
     replication_instance_public_ip_address = replication_instance_public_ip_address_;
     replication_instance_arn = replication_instance_arn_;
     kms_key_id = kms_key_id_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     engine_version = engine_version_;
     multi_a_z = multi_a_z_;
     pending_modified_values = pending_modified_values_;
     preferred_maintenance_window = preferred_maintenance_window_;
     replication_subnet_group = replication_subnet_group_;
     availability_zone = availability_zone_;
     vpc_security_groups = vpc_security_groups_;
     instance_create_time = instance_create_time_;
     allocated_storage = allocated_storage_;
     replication_instance_status = replication_instance_status_;
     replication_instance_class = replication_instance_class_;
     replication_instance_identifier = replication_instance_identifier_;
   }
    : replication_instance)

let make_compute_config ?vpc_security_group_ids:(vpc_security_group_ids_ : string_list option)
    ?replication_subnet_group_id:(replication_subnet_group_id_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?min_capacity_units:(min_capacity_units_ : integer_optional option)
    ?max_capacity_units:(max_capacity_units_ : integer_optional option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?dns_name_servers:(dns_name_servers_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option) () =
  ({
     vpc_security_group_ids = vpc_security_group_ids_;
     replication_subnet_group_id = replication_subnet_group_id_;
     preferred_maintenance_window = preferred_maintenance_window_;
     multi_a_z = multi_a_z_;
     min_capacity_units = min_capacity_units_;
     max_capacity_units = max_capacity_units_;
     kms_key_id = kms_key_id_;
     dns_name_servers = dns_name_servers_;
     availability_zone = availability_zone_;
   }
    : compute_config)

let make_replication_config ?is_read_only:(is_read_only_ : boolean_optional option)
    ?replication_config_update_time:(replication_config_update_time_ : t_stamp option)
    ?replication_config_create_time:(replication_config_create_time_ : t_stamp option)
    ?table_mappings:(table_mappings_ : string_ option)
    ?supplemental_settings:(supplemental_settings_ : string_ option)
    ?replication_settings:(replication_settings_ : string_ option)
    ?compute_config:(compute_config_ : compute_config option)
    ?replication_type:(replication_type_ : migration_type_value option)
    ?target_endpoint_arn:(target_endpoint_arn_ : string_ option)
    ?source_endpoint_arn:(source_endpoint_arn_ : string_ option)
    ?replication_config_arn:(replication_config_arn_ : string_ option)
    ?replication_config_identifier:(replication_config_identifier_ : string_ option) () =
  ({
     is_read_only = is_read_only_;
     replication_config_update_time = replication_config_update_time_;
     replication_config_create_time = replication_config_create_time_;
     table_mappings = table_mappings_;
     supplemental_settings = supplemental_settings_;
     replication_settings = replication_settings_;
     compute_config = compute_config_;
     replication_type = replication_type_;
     target_endpoint_arn = target_endpoint_arn_;
     source_endpoint_arn = source_endpoint_arn_;
     replication_config_arn = replication_config_arn_;
     replication_config_identifier = replication_config_identifier_;
   }
    : replication_config)

let make_remove_tags_from_resource_response () = (() : unit)

let make_remove_tags_from_resource_message ~tag_keys:(tag_keys_ : key_list)
    ~resource_arn:(resource_arn_ : string_) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : remove_tags_from_resource_message)

let make_reload_tables_response ?replication_task_arn:(replication_task_arn_ : string_ option) () =
  ({ replication_task_arn = replication_task_arn_ } : reload_tables_response)

let make_reload_tables_message ?reload_option:(reload_option_ : reload_option_value option)
    ~tables_to_reload:(tables_to_reload_ : table_list_to_reload)
    ~replication_task_arn:(replication_task_arn_ : string_) () =
  ({
     reload_option = reload_option_;
     tables_to_reload = tables_to_reload_;
     replication_task_arn = replication_task_arn_;
   }
    : reload_tables_message)

let make_reload_replication_tables_response
    ?replication_config_arn:(replication_config_arn_ : string_ option) () =
  ({ replication_config_arn = replication_config_arn_ } : reload_replication_tables_response)

let make_reload_replication_tables_message
    ?reload_option:(reload_option_ : reload_option_value option)
    ~tables_to_reload:(tables_to_reload_ : table_list_to_reload)
    ~replication_config_arn:(replication_config_arn_ : string_) () =
  ({
     reload_option = reload_option_;
     tables_to_reload = tables_to_reload_;
     replication_config_arn = replication_config_arn_;
   }
    : reload_replication_tables_message)

let make_refresh_schemas_status ?last_failure_message:(last_failure_message_ : string_ option)
    ?last_refresh_date:(last_refresh_date_ : t_stamp option)
    ?status:(status_ : refresh_schemas_status_type_value option)
    ?replication_instance_arn:(replication_instance_arn_ : string_ option)
    ?endpoint_arn:(endpoint_arn_ : string_ option) () =
  ({
     last_failure_message = last_failure_message_;
     last_refresh_date = last_refresh_date_;
     status = status_;
     replication_instance_arn = replication_instance_arn_;
     endpoint_arn = endpoint_arn_;
   }
    : refresh_schemas_status)

let make_refresh_schemas_response
    ?refresh_schemas_status:(refresh_schemas_status_ : refresh_schemas_status option) () =
  ({ refresh_schemas_status = refresh_schemas_status_ } : refresh_schemas_response)

let make_refresh_schemas_message ~replication_instance_arn:(replication_instance_arn_ : string_)
    ~endpoint_arn:(endpoint_arn_ : string_) () =
  ({ replication_instance_arn = replication_instance_arn_; endpoint_arn = endpoint_arn_ }
    : refresh_schemas_message)

let make_redshift_settings
    ?map_boolean_as_boolean:(map_boolean_as_boolean_ : boolean_optional option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?write_buffer_size:(write_buffer_size_ : integer_optional option)
    ?username:(username_ : string_ option)
    ?truncate_columns:(truncate_columns_ : boolean_optional option)
    ?trim_blanks:(trim_blanks_ : boolean_optional option)
    ?time_format:(time_format_ : string_ option)
    ?server_side_encryption_kms_key_id:(server_side_encryption_kms_key_id_ : string_ option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?server_name:(server_name_ : string_ option) ?replace_chars:(replace_chars_ : string_ option)
    ?replace_invalid_chars:(replace_invalid_chars_ : string_ option)
    ?remove_quotes:(remove_quotes_ : boolean_optional option)
    ?port:(port_ : integer_optional option) ?password:(password_ : secret_string option)
    ?max_file_size:(max_file_size_ : integer_optional option)
    ?load_timeout:(load_timeout_ : integer_optional option)
    ?file_transfer_upload_streams:(file_transfer_upload_streams_ : integer_optional option)
    ?explicit_ids:(explicit_ids_ : boolean_optional option)
    ?encryption_mode:(encryption_mode_ : encryption_mode_value option)
    ?empty_as_null:(empty_as_null_ : boolean_optional option)
    ?date_format:(date_format_ : string_ option) ?database_name:(database_name_ : string_ option)
    ?connection_timeout:(connection_timeout_ : integer_optional option)
    ?comp_update:(comp_update_ : boolean_optional option)
    ?case_sensitive_names:(case_sensitive_names_ : boolean_optional option)
    ?bucket_name:(bucket_name_ : string_ option) ?bucket_folder:(bucket_folder_ : string_ option)
    ?after_connect_script:(after_connect_script_ : string_ option)
    ?accept_any_date:(accept_any_date_ : boolean_optional option) () =
  ({
     map_boolean_as_boolean = map_boolean_as_boolean_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     write_buffer_size = write_buffer_size_;
     username = username_;
     truncate_columns = truncate_columns_;
     trim_blanks = trim_blanks_;
     time_format = time_format_;
     server_side_encryption_kms_key_id = server_side_encryption_kms_key_id_;
     service_access_role_arn = service_access_role_arn_;
     server_name = server_name_;
     replace_chars = replace_chars_;
     replace_invalid_chars = replace_invalid_chars_;
     remove_quotes = remove_quotes_;
     port = port_;
     password = password_;
     max_file_size = max_file_size_;
     load_timeout = load_timeout_;
     file_transfer_upload_streams = file_transfer_upload_streams_;
     explicit_ids = explicit_ids_;
     encryption_mode = encryption_mode_;
     empty_as_null = empty_as_null_;
     date_format = date_format_;
     database_name = database_name_;
     connection_timeout = connection_timeout_;
     comp_update = comp_update_;
     case_sensitive_names = case_sensitive_names_;
     bucket_name = bucket_name_;
     bucket_folder = bucket_folder_;
     after_connect_script = after_connect_script_;
     accept_any_date = accept_any_date_;
   }
    : redshift_settings)

let make_redshift_data_provider_settings ?s3_access_role_arn:(s3_access_role_arn_ : string_ option)
    ?s3_path:(s3_path_ : string_ option) ?database_name:(database_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?server_name:(server_name_ : string_ option) () =
  ({
     s3_access_role_arn = s3_access_role_arn_;
     s3_path = s3_path_;
     database_name = database_name_;
     port = port_;
     server_name = server_name_;
   }
    : redshift_data_provider_settings)

let make_redis_settings ?ssl_ca_certificate_arn:(ssl_ca_certificate_arn_ : string_ option)
    ?auth_password:(auth_password_ : secret_string option)
    ?auth_user_name:(auth_user_name_ : string_ option)
    ?auth_type:(auth_type_ : redis_auth_type_value option)
    ?ssl_security_protocol:(ssl_security_protocol_ : ssl_security_protocol_value option)
    ~port:(port_ : integer) ~server_name:(server_name_ : string_) () =
  ({
     ssl_ca_certificate_arn = ssl_ca_certificate_arn_;
     auth_password = auth_password_;
     auth_user_name = auth_user_name_;
     auth_type = auth_type_;
     ssl_security_protocol = ssl_security_protocol_;
     port = port_;
     server_name = server_name_;
   }
    : redis_settings)

let make_rds_requirements ?engine_version:(engine_version_ : string_ option)
    ?deployment_option:(deployment_option_ : string_ option)
    ?storage_iops:(storage_iops_ : integer_optional option)
    ?storage_size:(storage_size_ : integer_optional option)
    ?instance_memory:(instance_memory_ : double_optional option)
    ?instance_vcpu:(instance_vcpu_ : double_optional option)
    ?engine_edition:(engine_edition_ : string_ option) () =
  ({
     engine_version = engine_version_;
     deployment_option = deployment_option_;
     storage_iops = storage_iops_;
     storage_size = storage_size_;
     instance_memory = instance_memory_;
     instance_vcpu = instance_vcpu_;
     engine_edition = engine_edition_;
   }
    : rds_requirements)

let make_rds_configuration ?engine_version:(engine_version_ : string_ option)
    ?deployment_option:(deployment_option_ : string_ option)
    ?storage_iops:(storage_iops_ : integer_optional option)
    ?storage_size:(storage_size_ : integer_optional option)
    ?storage_type:(storage_type_ : string_ option)
    ?instance_memory:(instance_memory_ : double_optional option)
    ?instance_vcpu:(instance_vcpu_ : double_optional option)
    ?instance_type:(instance_type_ : string_ option)
    ?engine_edition:(engine_edition_ : string_ option) () =
  ({
     engine_version = engine_version_;
     deployment_option = deployment_option_;
     storage_iops = storage_iops_;
     storage_size = storage_size_;
     storage_type = storage_type_;
     instance_memory = instance_memory_;
     instance_vcpu = instance_vcpu_;
     instance_type = instance_type_;
     engine_edition = engine_edition_;
   }
    : rds_configuration)

let make_rds_recommendation ?target_configuration:(target_configuration_ : rds_configuration option)
    ?requirements_to_target:(requirements_to_target_ : rds_requirements option) () =
  ({
     target_configuration = target_configuration_;
     requirements_to_target = requirements_to_target_;
   }
    : rds_recommendation)

let make_recommendation_data ?rds_engine:(rds_engine_ : rds_recommendation option) () =
  ({ rds_engine = rds_engine_ } : recommendation_data)

let make_recommendation ?data:(data_ : recommendation_data option)
    ?settings:(settings_ : recommendation_settings option)
    ?preferred:(preferred_ : boolean_optional option) ?status:(status_ : string_ option)
    ?created_date:(created_date_ : string_ option) ?engine_name:(engine_name_ : string_ option)
    ?database_id:(database_id_ : string_ option) () =
  ({
     data = data_;
     settings = settings_;
     preferred = preferred_;
     status = status_;
     created_date = created_date_;
     engine_name = engine_name_;
     database_id = database_id_;
   }
    : recommendation)

let make_reboot_replication_instance_response
    ?replication_instance:(replication_instance_ : replication_instance option) () =
  ({ replication_instance = replication_instance_ } : reboot_replication_instance_response)

let make_reboot_replication_instance_message
    ?force_planned_failover:(force_planned_failover_ : boolean_optional option)
    ?force_failover:(force_failover_ : boolean_optional option)
    ~replication_instance_arn:(replication_instance_arn_ : string_) () =
  ({
     force_planned_failover = force_planned_failover_;
     force_failover = force_failover_;
     replication_instance_arn = replication_instance_arn_;
   }
    : reboot_replication_instance_message)

let make_postgre_sql_data_provider_settings
    ?s3_access_role_arn:(s3_access_role_arn_ : string_ option) ?s3_path:(s3_path_ : string_ option)
    ?certificate_arn:(certificate_arn_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?database_name:(database_name_ : string_ option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) () =
  ({
     s3_access_role_arn = s3_access_role_arn_;
     s3_path = s3_path_;
     certificate_arn = certificate_arn_;
     ssl_mode = ssl_mode_;
     database_name = database_name_;
     port = port_;
     server_name = server_name_;
   }
    : postgre_sql_data_provider_settings)

let make_postgre_sql_settings
    ?authentication_method:(authentication_method_ : postgre_sql_authentication_method option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?disable_unicode_source_filter:(disable_unicode_source_filter_ : boolean_optional option)
    ?babelfish_database_name:(babelfish_database_name_ : string_ option)
    ?database_mode:(database_mode_ : database_mode option)
    ?map_long_varchar_as:(map_long_varchar_as_ : long_varchar_mapping_type option)
    ?map_jsonb_as_clob:(map_jsonb_as_clob_ : boolean_optional option)
    ?map_boolean_as_boolean:(map_boolean_as_boolean_ : boolean_optional option)
    ?trim_space_in_char:(trim_space_in_char_ : boolean_optional option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?plugin_name:(plugin_name_ : plugin_name_value option) ?slot_name:(slot_name_ : string_ option)
    ?username:(username_ : string_ option) ?server_name:(server_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?password:(password_ : secret_string option)
    ?heartbeat_frequency:(heartbeat_frequency_ : integer_optional option)
    ?heartbeat_schema:(heartbeat_schema_ : string_ option)
    ?heartbeat_enable:(heartbeat_enable_ : boolean_optional option)
    ?fail_tasks_on_lob_truncation:(fail_tasks_on_lob_truncation_ : boolean_optional option)
    ?execute_timeout:(execute_timeout_ : integer_optional option)
    ?ddl_artifacts_schema:(ddl_artifacts_schema_ : string_ option)
    ?database_name:(database_name_ : string_ option)
    ?max_file_size:(max_file_size_ : integer_optional option)
    ?capture_ddls:(capture_ddls_ : boolean_optional option)
    ?after_connect_script:(after_connect_script_ : string_ option) () =
  ({
     authentication_method = authentication_method_;
     service_access_role_arn = service_access_role_arn_;
     disable_unicode_source_filter = disable_unicode_source_filter_;
     babelfish_database_name = babelfish_database_name_;
     database_mode = database_mode_;
     map_long_varchar_as = map_long_varchar_as_;
     map_jsonb_as_clob = map_jsonb_as_clob_;
     map_boolean_as_boolean = map_boolean_as_boolean_;
     trim_space_in_char = trim_space_in_char_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     plugin_name = plugin_name_;
     slot_name = slot_name_;
     username = username_;
     server_name = server_name_;
     port = port_;
     password = password_;
     heartbeat_frequency = heartbeat_frequency_;
     heartbeat_schema = heartbeat_schema_;
     heartbeat_enable = heartbeat_enable_;
     fail_tasks_on_lob_truncation = fail_tasks_on_lob_truncation_;
     execute_timeout = execute_timeout_;
     ddl_artifacts_schema = ddl_artifacts_schema_;
     database_name = database_name_;
     max_file_size = max_file_size_;
     capture_ddls = capture_ddls_;
     after_connect_script = after_connect_script_;
   }
    : postgre_sql_settings)

let make_orderable_replication_instance
    ?release_status:(release_status_ : release_status_values option)
    ?availability_zones:(availability_zones_ : availability_zones_list option)
    ?included_allocated_storage:(included_allocated_storage_ : integer option)
    ?default_allocated_storage:(default_allocated_storage_ : integer option)
    ?max_allocated_storage:(max_allocated_storage_ : integer option)
    ?min_allocated_storage:(min_allocated_storage_ : integer option)
    ?storage_type:(storage_type_ : string_ option)
    ?replication_instance_class:(replication_instance_class_ : replication_instance_class option)
    ?engine_version:(engine_version_ : string_ option) () =
  ({
     release_status = release_status_;
     availability_zones = availability_zones_;
     included_allocated_storage = included_allocated_storage_;
     default_allocated_storage = default_allocated_storage_;
     max_allocated_storage = max_allocated_storage_;
     min_allocated_storage = min_allocated_storage_;
     storage_type = storage_type_;
     replication_instance_class = replication_instance_class_;
     engine_version = engine_version_;
   }
    : orderable_replication_instance)

let make_oracle_settings
    ?authentication_method:(authentication_method_ : oracle_authentication_method option)
    ?open_transaction_window:(open_transaction_window_ : integer_optional option)
    ?convert_timestamp_with_zone_to_ut_c:
      (convert_timestamp_with_zone_to_ut_c_ : boolean_optional option)
    ?trim_space_in_char:(trim_space_in_char_ : boolean_optional option)
    ?secrets_manager_oracle_asm_secret_id:(secrets_manager_oracle_asm_secret_id_ : string_ option)
    ?secrets_manager_oracle_asm_access_role_arn:
      (secrets_manager_oracle_asm_access_role_arn_ : string_ option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?use_logminer_reader:(use_logminer_reader_ : boolean_optional option)
    ?use_direct_path_full_load:(use_direct_path_full_load_ : boolean_optional option)
    ?use_b_file:(use_b_file_ : boolean_optional option) ?username:(username_ : string_ option)
    ?standby_delay_time:(standby_delay_time_ : integer_optional option)
    ?spatial_data_option_to_geo_json_function_name:
      (spatial_data_option_to_geo_json_function_name_ : string_ option)
    ?server_name:(server_name_ : string_ option)
    ?security_db_encryption_name:(security_db_encryption_name_ : string_ option)
    ?security_db_encryption:(security_db_encryption_ : secret_string option)
    ?retry_interval:(retry_interval_ : integer_optional option)
    ?read_table_space_name:(read_table_space_name_ : boolean_optional option)
    ?port:(port_ : integer_optional option) ?password:(password_ : secret_string option)
    ?number_datatype_scale:(number_datatype_scale_ : integer_optional option)
    ?fail_tasks_on_lob_truncation:(fail_tasks_on_lob_truncation_ : boolean_optional option)
    ?direct_path_parallel_load:(direct_path_parallel_load_ : boolean_optional option)
    ?database_name:(database_name_ : string_ option)
    ?char_length_semantics:(char_length_semantics_ : char_length_semantics option)
    ?asm_user:(asm_user_ : string_ option) ?asm_server:(asm_server_ : string_ option)
    ?asm_password:(asm_password_ : secret_string option)
    ?archived_logs_only:(archived_logs_only_ : boolean_optional option)
    ?direct_path_no_log:(direct_path_no_log_ : boolean_optional option)
    ?enable_homogenous_tablespace:(enable_homogenous_tablespace_ : boolean_optional option)
    ?replace_path_prefix:(replace_path_prefix_ : boolean_optional option)
    ?use_path_prefix:(use_path_prefix_ : string_ option)
    ?oracle_path_prefix:(oracle_path_prefix_ : string_ option)
    ?use_alternate_folder_for_online:(use_alternate_folder_for_online_ : boolean_optional option)
    ?access_alternate_directly:(access_alternate_directly_ : boolean_optional option)
    ?read_ahead_blocks:(read_ahead_blocks_ : integer_optional option)
    ?parallel_asm_read_threads:(parallel_asm_read_threads_ : integer_optional option)
    ?allow_select_nested_tables:(allow_select_nested_tables_ : boolean_optional option)
    ?extra_archived_log_dest_ids:(extra_archived_log_dest_ids_ : integer_list option)
    ?additional_archived_log_dest_id:(additional_archived_log_dest_id_ : integer_optional option)
    ?archived_log_dest_id:(archived_log_dest_id_ : integer_optional option)
    ?add_supplemental_logging:(add_supplemental_logging_ : boolean_optional option) () =
  ({
     authentication_method = authentication_method_;
     open_transaction_window = open_transaction_window_;
     convert_timestamp_with_zone_to_ut_c = convert_timestamp_with_zone_to_ut_c_;
     trim_space_in_char = trim_space_in_char_;
     secrets_manager_oracle_asm_secret_id = secrets_manager_oracle_asm_secret_id_;
     secrets_manager_oracle_asm_access_role_arn = secrets_manager_oracle_asm_access_role_arn_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     use_logminer_reader = use_logminer_reader_;
     use_direct_path_full_load = use_direct_path_full_load_;
     use_b_file = use_b_file_;
     username = username_;
     standby_delay_time = standby_delay_time_;
     spatial_data_option_to_geo_json_function_name = spatial_data_option_to_geo_json_function_name_;
     server_name = server_name_;
     security_db_encryption_name = security_db_encryption_name_;
     security_db_encryption = security_db_encryption_;
     retry_interval = retry_interval_;
     read_table_space_name = read_table_space_name_;
     port = port_;
     password = password_;
     number_datatype_scale = number_datatype_scale_;
     fail_tasks_on_lob_truncation = fail_tasks_on_lob_truncation_;
     direct_path_parallel_load = direct_path_parallel_load_;
     database_name = database_name_;
     char_length_semantics = char_length_semantics_;
     asm_user = asm_user_;
     asm_server = asm_server_;
     asm_password = asm_password_;
     archived_logs_only = archived_logs_only_;
     direct_path_no_log = direct_path_no_log_;
     enable_homogenous_tablespace = enable_homogenous_tablespace_;
     replace_path_prefix = replace_path_prefix_;
     use_path_prefix = use_path_prefix_;
     oracle_path_prefix = oracle_path_prefix_;
     use_alternate_folder_for_online = use_alternate_folder_for_online_;
     access_alternate_directly = access_alternate_directly_;
     read_ahead_blocks = read_ahead_blocks_;
     parallel_asm_read_threads = parallel_asm_read_threads_;
     allow_select_nested_tables = allow_select_nested_tables_;
     extra_archived_log_dest_ids = extra_archived_log_dest_ids_;
     additional_archived_log_dest_id = additional_archived_log_dest_id_;
     archived_log_dest_id = archived_log_dest_id_;
     add_supplemental_logging = add_supplemental_logging_;
   }
    : oracle_settings)

let make_oracle_data_provider_settings ?s3_access_role_arn:(s3_access_role_arn_ : string_ option)
    ?s3_path:(s3_path_ : string_ option)
    ?secrets_manager_security_db_encryption_access_role_arn:
      (secrets_manager_security_db_encryption_access_role_arn_ : string_ option)
    ?secrets_manager_security_db_encryption_secret_id:
      (secrets_manager_security_db_encryption_secret_id_ : string_ option)
    ?secrets_manager_oracle_asm_access_role_arn:
      (secrets_manager_oracle_asm_access_role_arn_ : string_ option)
    ?secrets_manager_oracle_asm_secret_id:(secrets_manager_oracle_asm_secret_id_ : string_ option)
    ?asm_server:(asm_server_ : string_ option) ?certificate_arn:(certificate_arn_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?database_name:(database_name_ : string_ option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) () =
  ({
     s3_access_role_arn = s3_access_role_arn_;
     s3_path = s3_path_;
     secrets_manager_security_db_encryption_access_role_arn =
       secrets_manager_security_db_encryption_access_role_arn_;
     secrets_manager_security_db_encryption_secret_id =
       secrets_manager_security_db_encryption_secret_id_;
     secrets_manager_oracle_asm_access_role_arn = secrets_manager_oracle_asm_access_role_arn_;
     secrets_manager_oracle_asm_secret_id = secrets_manager_oracle_asm_secret_id_;
     asm_server = asm_server_;
     certificate_arn = certificate_arn_;
     ssl_mode = ssl_mode_;
     database_name = database_name_;
     port = port_;
     server_name = server_name_;
   }
    : oracle_data_provider_settings)

let make_neptune_settings ?iam_auth_enabled:(iam_auth_enabled_ : boolean_optional option)
    ?max_retry_count:(max_retry_count_ : integer_optional option)
    ?max_file_size:(max_file_size_ : integer_optional option)
    ?error_retry_duration:(error_retry_duration_ : integer_optional option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ~s3_bucket_folder:(s3_bucket_folder_ : string_) ~s3_bucket_name:(s3_bucket_name_ : string_) () =
  ({
     iam_auth_enabled = iam_auth_enabled_;
     max_retry_count = max_retry_count_;
     max_file_size = max_file_size_;
     error_retry_duration = error_retry_duration_;
     s3_bucket_folder = s3_bucket_folder_;
     s3_bucket_name = s3_bucket_name_;
     service_access_role_arn = service_access_role_arn_;
   }
    : neptune_settings)

let make_my_sql_data_provider_settings ?s3_access_role_arn:(s3_access_role_arn_ : string_ option)
    ?s3_path:(s3_path_ : string_ option) ?certificate_arn:(certificate_arn_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) () =
  ({
     s3_access_role_arn = s3_access_role_arn_;
     s3_path = s3_path_;
     certificate_arn = certificate_arn_;
     ssl_mode = ssl_mode_;
     port = port_;
     server_name = server_name_;
   }
    : my_sql_data_provider_settings)

let make_my_sql_settings
    ?authentication_method:(authentication_method_ : my_sql_authentication_method option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?execute_timeout:(execute_timeout_ : integer_optional option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?username:(username_ : string_ option) ?server_timezone:(server_timezone_ : string_ option)
    ?server_name:(server_name_ : string_ option) ?port:(port_ : integer_optional option)
    ?password:(password_ : secret_string option)
    ?parallel_load_threads:(parallel_load_threads_ : integer_optional option)
    ?max_file_size:(max_file_size_ : integer_optional option)
    ?target_db_type:(target_db_type_ : target_db_type option)
    ?events_poll_interval:(events_poll_interval_ : integer_optional option)
    ?database_name:(database_name_ : string_ option)
    ?clean_source_metadata_on_mismatch:
      (clean_source_metadata_on_mismatch_ : boolean_optional option)
    ?after_connect_script:(after_connect_script_ : string_ option) () =
  ({
     authentication_method = authentication_method_;
     service_access_role_arn = service_access_role_arn_;
     execute_timeout = execute_timeout_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     username = username_;
     server_timezone = server_timezone_;
     server_name = server_name_;
     port = port_;
     password = password_;
     parallel_load_threads = parallel_load_threads_;
     max_file_size = max_file_size_;
     target_db_type = target_db_type_;
     events_poll_interval = events_poll_interval_;
     database_name = database_name_;
     clean_source_metadata_on_mismatch = clean_source_metadata_on_mismatch_;
     after_connect_script = after_connect_script_;
   }
    : my_sql_settings)

let make_move_replication_task_response
    ?replication_task:(replication_task_ : replication_task option) () =
  ({ replication_task = replication_task_ } : move_replication_task_response)

let make_move_replication_task_message
    ~target_replication_instance_arn:(target_replication_instance_arn_ : string_)
    ~replication_task_arn:(replication_task_arn_ : string_) () =
  ({
     target_replication_instance_arn = target_replication_instance_arn_;
     replication_task_arn = replication_task_arn_;
   }
    : move_replication_task_message)

let make_mongo_db_settings
    ?replicate_shard_collections:(replicate_shard_collections_ : boolean_optional option)
    ?use_update_look_up:(use_update_look_up_ : boolean_optional option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?auth_source:(auth_source_ : string_ option)
    ?docs_to_investigate:(docs_to_investigate_ : string_ option)
    ?extract_doc_id:(extract_doc_id_ : string_ option)
    ?nesting_level:(nesting_level_ : nesting_level_value option)
    ?auth_mechanism:(auth_mechanism_ : auth_mechanism_value option)
    ?auth_type:(auth_type_ : auth_type_value option)
    ?database_name:(database_name_ : string_ option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) ?password:(password_ : secret_string option)
    ?username:(username_ : string_ option) () =
  ({
     replicate_shard_collections = replicate_shard_collections_;
     use_update_look_up = use_update_look_up_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     kms_key_id = kms_key_id_;
     auth_source = auth_source_;
     docs_to_investigate = docs_to_investigate_;
     extract_doc_id = extract_doc_id_;
     nesting_level = nesting_level_;
     auth_mechanism = auth_mechanism_;
     auth_type = auth_type_;
     database_name = database_name_;
     port = port_;
     server_name = server_name_;
     password = password_;
     username = username_;
   }
    : mongo_db_settings)

let make_mongo_db_data_provider_settings
    ?auth_mechanism:(auth_mechanism_ : auth_mechanism_value option)
    ?auth_source:(auth_source_ : string_ option) ?auth_type:(auth_type_ : auth_type_value option)
    ?certificate_arn:(certificate_arn_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?database_name:(database_name_ : string_ option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) () =
  ({
     auth_mechanism = auth_mechanism_;
     auth_source = auth_source_;
     auth_type = auth_type_;
     certificate_arn = certificate_arn_;
     ssl_mode = ssl_mode_;
     database_name = database_name_;
     port = port_;
     server_name = server_name_;
   }
    : mongo_db_data_provider_settings)

let make_modify_replication_task_response
    ?replication_task:(replication_task_ : replication_task option) () =
  ({ replication_task = replication_task_ } : modify_replication_task_response)

let make_modify_replication_task_message ?task_data:(task_data_ : string_ option)
    ?cdc_stop_position:(cdc_stop_position_ : string_ option)
    ?cdc_start_position:(cdc_start_position_ : string_ option)
    ?cdc_start_time:(cdc_start_time_ : t_stamp option)
    ?replication_task_settings:(replication_task_settings_ : string_ option)
    ?table_mappings:(table_mappings_ : string_ option)
    ?migration_type:(migration_type_ : migration_type_value option)
    ?replication_task_identifier:(replication_task_identifier_ : string_ option)
    ~replication_task_arn:(replication_task_arn_ : string_) () =
  ({
     task_data = task_data_;
     cdc_stop_position = cdc_stop_position_;
     cdc_start_position = cdc_start_position_;
     cdc_start_time = cdc_start_time_;
     replication_task_settings = replication_task_settings_;
     table_mappings = table_mappings_;
     migration_type = migration_type_;
     replication_task_identifier = replication_task_identifier_;
     replication_task_arn = replication_task_arn_;
   }
    : modify_replication_task_message)

let make_modify_replication_subnet_group_response
    ?replication_subnet_group:(replication_subnet_group_ : replication_subnet_group option) () =
  ({ replication_subnet_group = replication_subnet_group_ }
    : modify_replication_subnet_group_response)

let make_modify_replication_subnet_group_message
    ?replication_subnet_group_description:(replication_subnet_group_description_ : string_ option)
    ~subnet_ids:(subnet_ids_ : subnet_identifier_list)
    ~replication_subnet_group_identifier:(replication_subnet_group_identifier_ : string_) () =
  ({
     subnet_ids = subnet_ids_;
     replication_subnet_group_description = replication_subnet_group_description_;
     replication_subnet_group_identifier = replication_subnet_group_identifier_;
   }
    : modify_replication_subnet_group_message)

let make_modify_replication_instance_response
    ?replication_instance:(replication_instance_ : replication_instance option) () =
  ({ replication_instance = replication_instance_ } : modify_replication_instance_response)

let make_modify_replication_instance_message
    ?kerberos_authentication_settings:
      (kerberos_authentication_settings_ : kerberos_authentication_settings option)
    ?network_type:(network_type_ : string_ option)
    ?replication_instance_identifier:(replication_instance_identifier_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?allow_major_version_upgrade:(allow_major_version_upgrade_ : boolean_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?replication_instance_class:(replication_instance_class_ : replication_instance_class option)
    ?apply_immediately:(apply_immediately_ : boolean_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ~replication_instance_arn:(replication_instance_arn_ : string_) () =
  ({
     kerberos_authentication_settings = kerberos_authentication_settings_;
     network_type = network_type_;
     replication_instance_identifier = replication_instance_identifier_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     allow_major_version_upgrade = allow_major_version_upgrade_;
     engine_version = engine_version_;
     multi_a_z = multi_a_z_;
     preferred_maintenance_window = preferred_maintenance_window_;
     vpc_security_group_ids = vpc_security_group_ids_;
     replication_instance_class = replication_instance_class_;
     apply_immediately = apply_immediately_;
     allocated_storage = allocated_storage_;
     replication_instance_arn = replication_instance_arn_;
   }
    : modify_replication_instance_message)

let make_modify_replication_config_response
    ?replication_config:(replication_config_ : replication_config option) () =
  ({ replication_config = replication_config_ } : modify_replication_config_response)

let make_modify_replication_config_message
    ?target_endpoint_arn:(target_endpoint_arn_ : string_ option)
    ?source_endpoint_arn:(source_endpoint_arn_ : string_ option)
    ?compute_config:(compute_config_ : compute_config option)
    ?supplemental_settings:(supplemental_settings_ : string_ option)
    ?replication_settings:(replication_settings_ : string_ option)
    ?table_mappings:(table_mappings_ : string_ option)
    ?replication_type:(replication_type_ : migration_type_value option)
    ?replication_config_identifier:(replication_config_identifier_ : string_ option)
    ~replication_config_arn:(replication_config_arn_ : string_) () =
  ({
     target_endpoint_arn = target_endpoint_arn_;
     source_endpoint_arn = source_endpoint_arn_;
     compute_config = compute_config_;
     supplemental_settings = supplemental_settings_;
     replication_settings = replication_settings_;
     table_mappings = table_mappings_;
     replication_type = replication_type_;
     replication_config_identifier = replication_config_identifier_;
     replication_config_arn = replication_config_arn_;
   }
    : modify_replication_config_message)

let make_data_provider_descriptor ?data_provider_arn:(data_provider_arn_ : string_ option)
    ?data_provider_name:(data_provider_name_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option) () =
  ({
     data_provider_arn = data_provider_arn_;
     data_provider_name = data_provider_name_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
   }
    : data_provider_descriptor)

let make_migration_project
    ?schema_conversion_application_attributes:
      (schema_conversion_application_attributes_ : sc_application_attributes option)
    ?description:(description_ : string_ option)
    ?transformation_rules:(transformation_rules_ : string_ option)
    ?instance_profile_name:(instance_profile_name_ : string_ option)
    ?instance_profile_arn:(instance_profile_arn_ : string_ option)
    ?target_data_provider_descriptors:
      (target_data_provider_descriptors_ : data_provider_descriptor_list option)
    ?source_data_provider_descriptors:
      (source_data_provider_descriptors_ : data_provider_descriptor_list option)
    ?migration_project_creation_time:(migration_project_creation_time_ : iso8601_date_time option)
    ?migration_project_arn:(migration_project_arn_ : string_ option)
    ?migration_project_name:(migration_project_name_ : string_ option) () =
  ({
     schema_conversion_application_attributes = schema_conversion_application_attributes_;
     description = description_;
     transformation_rules = transformation_rules_;
     instance_profile_name = instance_profile_name_;
     instance_profile_arn = instance_profile_arn_;
     target_data_provider_descriptors = target_data_provider_descriptors_;
     source_data_provider_descriptors = source_data_provider_descriptors_;
     migration_project_creation_time = migration_project_creation_time_;
     migration_project_arn = migration_project_arn_;
     migration_project_name = migration_project_name_;
   }
    : migration_project)

let make_modify_migration_project_response
    ?migration_project:(migration_project_ : migration_project option) () =
  ({ migration_project = migration_project_ } : modify_migration_project_response)

let make_data_provider_descriptor_definition
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ~data_provider_identifier:(data_provider_identifier_ : string_) () =
  ({
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     data_provider_identifier = data_provider_identifier_;
   }
    : data_provider_descriptor_definition)

let make_modify_migration_project_message
    ?schema_conversion_application_attributes:
      (schema_conversion_application_attributes_ : sc_application_attributes option)
    ?description:(description_ : string_ option)
    ?transformation_rules:(transformation_rules_ : string_ option)
    ?instance_profile_identifier:(instance_profile_identifier_ : string_ option)
    ?target_data_provider_descriptors:
      (target_data_provider_descriptors_ : data_provider_descriptor_definition_list option)
    ?source_data_provider_descriptors:
      (source_data_provider_descriptors_ : data_provider_descriptor_definition_list option)
    ?migration_project_name:(migration_project_name_ : string_ option)
    ~migration_project_identifier:(migration_project_identifier_ : string_) () =
  ({
     schema_conversion_application_attributes = schema_conversion_application_attributes_;
     description = description_;
     transformation_rules = transformation_rules_;
     instance_profile_identifier = instance_profile_identifier_;
     target_data_provider_descriptors = target_data_provider_descriptors_;
     source_data_provider_descriptors = source_data_provider_descriptors_;
     migration_project_name = migration_project_name_;
     migration_project_identifier = migration_project_identifier_;
   }
    : modify_migration_project_message)

let make_instance_profile ?vpc_security_groups:(vpc_security_groups_ : string_list option)
    ?subnet_group_identifier:(subnet_group_identifier_ : string_ option)
    ?instance_profile_creation_time:(instance_profile_creation_time_ : iso8601_date_time option)
    ?description:(description_ : string_ option)
    ?instance_profile_name:(instance_profile_name_ : string_ option)
    ?network_type:(network_type_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?kms_key_arn:(kms_key_arn_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?instance_profile_arn:(instance_profile_arn_ : string_ option) () =
  ({
     vpc_security_groups = vpc_security_groups_;
     subnet_group_identifier = subnet_group_identifier_;
     instance_profile_creation_time = instance_profile_creation_time_;
     description = description_;
     instance_profile_name = instance_profile_name_;
     network_type = network_type_;
     publicly_accessible = publicly_accessible_;
     kms_key_arn = kms_key_arn_;
     availability_zone = availability_zone_;
     instance_profile_arn = instance_profile_arn_;
   }
    : instance_profile)

let make_modify_instance_profile_response
    ?instance_profile:(instance_profile_ : instance_profile option) () =
  ({ instance_profile = instance_profile_ } : modify_instance_profile_response)

let make_modify_instance_profile_message
    ?vpc_security_groups:(vpc_security_groups_ : string_list option)
    ?subnet_group_identifier:(subnet_group_identifier_ : string_ option)
    ?description:(description_ : string_ option)
    ?instance_profile_name:(instance_profile_name_ : string_ option)
    ?network_type:(network_type_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?kms_key_arn:(kms_key_arn_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option)
    ~instance_profile_identifier:(instance_profile_identifier_ : string_) () =
  ({
     vpc_security_groups = vpc_security_groups_;
     subnet_group_identifier = subnet_group_identifier_;
     description = description_;
     instance_profile_name = instance_profile_name_;
     network_type = network_type_;
     publicly_accessible = publicly_accessible_;
     kms_key_arn = kms_key_arn_;
     availability_zone = availability_zone_;
     instance_profile_identifier = instance_profile_identifier_;
   }
    : modify_instance_profile_message)

let make_event_subscription ?enabled:(enabled_ : boolean_ option)
    ?event_categories_list:(event_categories_list_ : event_categories_list option)
    ?source_ids_list:(source_ids_list_ : source_ids_list option)
    ?source_type:(source_type_ : string_ option)
    ?subscription_creation_time:(subscription_creation_time_ : string_ option)
    ?status:(status_ : string_ option) ?sns_topic_arn:(sns_topic_arn_ : string_ option)
    ?cust_subscription_id:(cust_subscription_id_ : string_ option)
    ?customer_aws_id:(customer_aws_id_ : string_ option) () =
  ({
     enabled = enabled_;
     event_categories_list = event_categories_list_;
     source_ids_list = source_ids_list_;
     source_type = source_type_;
     subscription_creation_time = subscription_creation_time_;
     status = status_;
     sns_topic_arn = sns_topic_arn_;
     cust_subscription_id = cust_subscription_id_;
     customer_aws_id = customer_aws_id_;
   }
    : event_subscription)

let make_modify_event_subscription_response
    ?event_subscription:(event_subscription_ : event_subscription option) () =
  ({ event_subscription = event_subscription_ } : modify_event_subscription_response)

let make_modify_event_subscription_message ?enabled:(enabled_ : boolean_optional option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?source_type:(source_type_ : string_ option) ?sns_topic_arn:(sns_topic_arn_ : string_ option)
    ~subscription_name:(subscription_name_ : string_) () =
  ({
     enabled = enabled_;
     event_categories = event_categories_;
     source_type = source_type_;
     sns_topic_arn = sns_topic_arn_;
     subscription_name = subscription_name_;
   }
    : modify_event_subscription_message)

let make_dynamo_db_settings ~service_access_role_arn:(service_access_role_arn_ : string_) () =
  ({ service_access_role_arn = service_access_role_arn_ } : dynamo_db_settings)

let make_dms_transfer_settings ?bucket_name:(bucket_name_ : string_ option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option) () =
  ({ bucket_name = bucket_name_; service_access_role_arn = service_access_role_arn_ }
    : dms_transfer_settings)

let make_kinesis_settings
    ?use_large_integer_value:(use_large_integer_value_ : boolean_optional option)
    ?no_hex_prefix:(no_hex_prefix_ : boolean_optional option)
    ?include_null_and_empty:(include_null_and_empty_ : boolean_optional option)
    ?include_control_details:(include_control_details_ : boolean_optional option)
    ?include_table_alter_operations:(include_table_alter_operations_ : boolean_optional option)
    ?partition_include_schema_table:(partition_include_schema_table_ : boolean_optional option)
    ?include_partition_value:(include_partition_value_ : boolean_optional option)
    ?include_transaction_details:(include_transaction_details_ : boolean_optional option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?message_format:(message_format_ : message_format_value option)
    ?stream_arn:(stream_arn_ : string_ option) () =
  ({
     use_large_integer_value = use_large_integer_value_;
     no_hex_prefix = no_hex_prefix_;
     include_null_and_empty = include_null_and_empty_;
     include_control_details = include_control_details_;
     include_table_alter_operations = include_table_alter_operations_;
     partition_include_schema_table = partition_include_schema_table_;
     include_partition_value = include_partition_value_;
     include_transaction_details = include_transaction_details_;
     service_access_role_arn = service_access_role_arn_;
     message_format = message_format_;
     stream_arn = stream_arn_;
   }
    : kinesis_settings)

let make_kafka_settings
    ?use_large_integer_value:(use_large_integer_value_ : boolean_optional option)
    ?ssl_endpoint_identification_algorithm:
      (ssl_endpoint_identification_algorithm_ : kafka_ssl_endpoint_identification_algorithm option)
    ?sasl_mechanism:(sasl_mechanism_ : kafka_sasl_mechanism option)
    ?no_hex_prefix:(no_hex_prefix_ : boolean_optional option)
    ?sasl_password:(sasl_password_ : secret_string option)
    ?sasl_username:(sasl_username_ : string_ option)
    ?ssl_ca_certificate_arn:(ssl_ca_certificate_arn_ : string_ option)
    ?ssl_client_key_password:(ssl_client_key_password_ : secret_string option)
    ?ssl_client_key_arn:(ssl_client_key_arn_ : string_ option)
    ?ssl_client_certificate_arn:(ssl_client_certificate_arn_ : string_ option)
    ?security_protocol:(security_protocol_ : kafka_security_protocol option)
    ?include_null_and_empty:(include_null_and_empty_ : boolean_optional option)
    ?message_max_bytes:(message_max_bytes_ : integer_optional option)
    ?include_control_details:(include_control_details_ : boolean_optional option)
    ?include_table_alter_operations:(include_table_alter_operations_ : boolean_optional option)
    ?partition_include_schema_table:(partition_include_schema_table_ : boolean_optional option)
    ?include_partition_value:(include_partition_value_ : boolean_optional option)
    ?include_transaction_details:(include_transaction_details_ : boolean_optional option)
    ?message_format:(message_format_ : message_format_value option) ?topic:(topic_ : string_ option)
    ?broker:(broker_ : string_ option) () =
  ({
     use_large_integer_value = use_large_integer_value_;
     ssl_endpoint_identification_algorithm = ssl_endpoint_identification_algorithm_;
     sasl_mechanism = sasl_mechanism_;
     no_hex_prefix = no_hex_prefix_;
     sasl_password = sasl_password_;
     sasl_username = sasl_username_;
     ssl_ca_certificate_arn = ssl_ca_certificate_arn_;
     ssl_client_key_password = ssl_client_key_password_;
     ssl_client_key_arn = ssl_client_key_arn_;
     ssl_client_certificate_arn = ssl_client_certificate_arn_;
     security_protocol = security_protocol_;
     include_null_and_empty = include_null_and_empty_;
     message_max_bytes = message_max_bytes_;
     include_control_details = include_control_details_;
     include_table_alter_operations = include_table_alter_operations_;
     partition_include_schema_table = partition_include_schema_table_;
     include_partition_value = include_partition_value_;
     include_transaction_details = include_transaction_details_;
     message_format = message_format_;
     topic = topic_;
     broker = broker_;
   }
    : kafka_settings)

let make_elasticsearch_settings
    ?use_new_mapping_type:(use_new_mapping_type_ : boolean_optional option)
    ?error_retry_duration:(error_retry_duration_ : integer_optional option)
    ?full_load_error_percentage:(full_load_error_percentage_ : integer_optional option)
    ~endpoint_uri:(endpoint_uri_ : string_)
    ~service_access_role_arn:(service_access_role_arn_ : string_) () =
  ({
     use_new_mapping_type = use_new_mapping_type_;
     error_retry_duration = error_retry_duration_;
     full_load_error_percentage = full_load_error_percentage_;
     endpoint_uri = endpoint_uri_;
     service_access_role_arn = service_access_role_arn_;
   }
    : elasticsearch_settings)

let make_microsoft_sql_server_settings
    ?authentication_method:(authentication_method_ : sql_server_authentication_method option)
    ?force_lob_lookup:(force_lob_lookup_ : boolean_optional option)
    ?tlog_access_mode:(tlog_access_mode_ : tlog_access_mode option)
    ?trim_space_in_char:(trim_space_in_char_ : boolean_optional option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?use_third_party_backup_device:(use_third_party_backup_device_ : boolean_optional option)
    ?use_bcp_full_load:(use_bcp_full_load_ : boolean_optional option)
    ?username:(username_ : string_ option) ?server_name:(server_name_ : string_ option)
    ?safeguard_policy:(safeguard_policy_ : safeguard_policy option)
    ?read_backup_only:(read_backup_only_ : boolean_optional option)
    ?query_single_always_on_node:(query_single_always_on_node_ : boolean_optional option)
    ?password:(password_ : secret_string option)
    ?control_tables_file_group:(control_tables_file_group_ : string_ option)
    ?database_name:(database_name_ : string_ option)
    ?bcp_packet_size:(bcp_packet_size_ : integer_optional option)
    ?port:(port_ : integer_optional option) () =
  ({
     authentication_method = authentication_method_;
     force_lob_lookup = force_lob_lookup_;
     tlog_access_mode = tlog_access_mode_;
     trim_space_in_char = trim_space_in_char_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     use_third_party_backup_device = use_third_party_backup_device_;
     use_bcp_full_load = use_bcp_full_load_;
     username = username_;
     server_name = server_name_;
     safeguard_policy = safeguard_policy_;
     read_backup_only = read_backup_only_;
     query_single_always_on_node = query_single_always_on_node_;
     password = password_;
     control_tables_file_group = control_tables_file_group_;
     database_name = database_name_;
     bcp_packet_size = bcp_packet_size_;
     port = port_;
   }
    : microsoft_sql_server_settings)

let make_ibm_db2_settings ?keep_csv_files:(keep_csv_files_ : boolean_optional option)
    ?max_file_size:(max_file_size_ : integer_optional option)
    ?write_buffer_size:(write_buffer_size_ : integer_optional option)
    ?load_timeout:(load_timeout_ : integer_optional option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?username:(username_ : string_ option)
    ?max_k_bytes_per_read:(max_k_bytes_per_read_ : integer_optional option)
    ?current_lsn:(current_lsn_ : string_ option)
    ?set_data_capture_changes:(set_data_capture_changes_ : boolean_optional option)
    ?server_name:(server_name_ : string_ option) ?port:(port_ : integer_optional option)
    ?password:(password_ : secret_string option) ?database_name:(database_name_ : string_ option) ()
    =
  ({
     keep_csv_files = keep_csv_files_;
     max_file_size = max_file_size_;
     write_buffer_size = write_buffer_size_;
     load_timeout = load_timeout_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     username = username_;
     max_k_bytes_per_read = max_k_bytes_per_read_;
     current_lsn = current_lsn_;
     set_data_capture_changes = set_data_capture_changes_;
     server_name = server_name_;
     port = port_;
     password = password_;
     database_name = database_name_;
   }
    : ibm_db2_settings)

let make_doc_db_settings
    ?replicate_shard_collections:(replicate_shard_collections_ : boolean_optional option)
    ?use_update_look_up:(use_update_look_up_ : boolean_optional option)
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?docs_to_investigate:(docs_to_investigate_ : integer_optional option)
    ?extract_doc_id:(extract_doc_id_ : boolean_optional option)
    ?nesting_level:(nesting_level_ : nesting_level_value option)
    ?database_name:(database_name_ : string_ option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) ?password:(password_ : secret_string option)
    ?username:(username_ : string_ option) () =
  ({
     replicate_shard_collections = replicate_shard_collections_;
     use_update_look_up = use_update_look_up_;
     secrets_manager_secret_id = secrets_manager_secret_id_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     kms_key_id = kms_key_id_;
     docs_to_investigate = docs_to_investigate_;
     extract_doc_id = extract_doc_id_;
     nesting_level = nesting_level_;
     database_name = database_name_;
     port = port_;
     server_name = server_name_;
     password = password_;
     username = username_;
   }
    : doc_db_settings)

let make_gcp_my_sql_settings
    ?secrets_manager_secret_id:(secrets_manager_secret_id_ : string_ option)
    ?secrets_manager_access_role_arn:(secrets_manager_access_role_arn_ : string_ option)
    ?username:(username_ : string_ option) ?server_timezone:(server_timezone_ : string_ option)
    ?server_name:(server_name_ : string_ option) ?port:(port_ : integer_optional option)
    ?password:(password_ : secret_string option)
    ?parallel_load_threads:(parallel_load_threads_ : integer_optional option)
    ?max_file_size:(max_file_size_ : integer_optional option)
    ?target_db_type:(target_db_type_ : target_db_type option)
    ?events_poll_interval:(events_poll_interval_ : integer_optional option)
    ?database_name:(database_name_ : string_ option)
    ?clean_source_metadata_on_mismatch:
      (clean_source_metadata_on_mismatch_ : boolean_optional option)
    ?after_connect_script:(after_connect_script_ : string_ option) () =
  ({
     secrets_manager_secret_id = secrets_manager_secret_id_;
     secrets_manager_access_role_arn = secrets_manager_access_role_arn_;
     username = username_;
     server_timezone = server_timezone_;
     server_name = server_name_;
     port = port_;
     password = password_;
     parallel_load_threads = parallel_load_threads_;
     max_file_size = max_file_size_;
     target_db_type = target_db_type_;
     events_poll_interval = events_poll_interval_;
     database_name = database_name_;
     clean_source_metadata_on_mismatch = clean_source_metadata_on_mismatch_;
     after_connect_script = after_connect_script_;
   }
    : gcp_my_sql_settings)

let make_lakehouse_settings ~arn:(arn_ : string_) () = ({ arn = arn_ } : lakehouse_settings)

let make_endpoint ?lakehouse_settings:(lakehouse_settings_ : lakehouse_settings option)
    ?timestream_settings:(timestream_settings_ : timestream_settings option)
    ?gcp_my_sql_settings:(gcp_my_sql_settings_ : gcp_my_sql_settings option)
    ?redis_settings:(redis_settings_ : redis_settings option)
    ?doc_db_settings:(doc_db_settings_ : doc_db_settings option)
    ?ibm_db2_settings:(ibm_db2_settings_ : ibm_db2_settings option)
    ?microsoft_sql_server_settings:
      (microsoft_sql_server_settings_ : microsoft_sql_server_settings option)
    ?sybase_settings:(sybase_settings_ : sybase_settings option)
    ?oracle_settings:(oracle_settings_ : oracle_settings option)
    ?my_sql_settings:(my_sql_settings_ : my_sql_settings option)
    ?postgre_sql_settings:(postgre_sql_settings_ : postgre_sql_settings option)
    ?redshift_settings:(redshift_settings_ : redshift_settings option)
    ?neptune_settings:(neptune_settings_ : neptune_settings option)
    ?elasticsearch_settings:(elasticsearch_settings_ : elasticsearch_settings option)
    ?kafka_settings:(kafka_settings_ : kafka_settings option)
    ?kinesis_settings:(kinesis_settings_ : kinesis_settings option)
    ?mongo_db_settings:(mongo_db_settings_ : mongo_db_settings option)
    ?dms_transfer_settings:(dms_transfer_settings_ : dms_transfer_settings option)
    ?s3_settings:(s3_settings_ : s3_settings option)
    ?dynamo_db_settings:(dynamo_db_settings_ : dynamo_db_settings option)
    ?is_read_only:(is_read_only_ : boolean_optional option)
    ?external_id:(external_id_ : string_ option)
    ?external_table_definition:(external_table_definition_ : string_ option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?certificate_arn:(certificate_arn_ : string_ option)
    ?endpoint_arn:(endpoint_arn_ : string_ option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?status:(status_ : string_ option)
    ?extra_connection_attributes:(extra_connection_attributes_ : string_ option)
    ?database_name:(database_name_ : string_ option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) ?username:(username_ : string_ option)
    ?engine_display_name:(engine_display_name_ : string_ option)
    ?engine_name:(engine_name_ : string_ option)
    ?endpoint_type:(endpoint_type_ : replication_endpoint_type_value option)
    ?endpoint_identifier:(endpoint_identifier_ : string_ option) () =
  ({
     lakehouse_settings = lakehouse_settings_;
     timestream_settings = timestream_settings_;
     gcp_my_sql_settings = gcp_my_sql_settings_;
     redis_settings = redis_settings_;
     doc_db_settings = doc_db_settings_;
     ibm_db2_settings = ibm_db2_settings_;
     microsoft_sql_server_settings = microsoft_sql_server_settings_;
     sybase_settings = sybase_settings_;
     oracle_settings = oracle_settings_;
     my_sql_settings = my_sql_settings_;
     postgre_sql_settings = postgre_sql_settings_;
     redshift_settings = redshift_settings_;
     neptune_settings = neptune_settings_;
     elasticsearch_settings = elasticsearch_settings_;
     kafka_settings = kafka_settings_;
     kinesis_settings = kinesis_settings_;
     mongo_db_settings = mongo_db_settings_;
     dms_transfer_settings = dms_transfer_settings_;
     s3_settings = s3_settings_;
     dynamo_db_settings = dynamo_db_settings_;
     is_read_only = is_read_only_;
     external_id = external_id_;
     external_table_definition = external_table_definition_;
     service_access_role_arn = service_access_role_arn_;
     ssl_mode = ssl_mode_;
     certificate_arn = certificate_arn_;
     endpoint_arn = endpoint_arn_;
     kms_key_id = kms_key_id_;
     status = status_;
     extra_connection_attributes = extra_connection_attributes_;
     database_name = database_name_;
     port = port_;
     server_name = server_name_;
     username = username_;
     engine_display_name = engine_display_name_;
     engine_name = engine_name_;
     endpoint_type = endpoint_type_;
     endpoint_identifier = endpoint_identifier_;
   }
    : endpoint)

let make_modify_endpoint_response ?endpoint:(endpoint_ : endpoint option) () =
  ({ endpoint = endpoint_ } : modify_endpoint_response)

let make_modify_endpoint_message
    ?timestream_settings:(timestream_settings_ : timestream_settings option)
    ?gcp_my_sql_settings:(gcp_my_sql_settings_ : gcp_my_sql_settings option)
    ?exact_settings:(exact_settings_ : boolean_optional option)
    ?redis_settings:(redis_settings_ : redis_settings option)
    ?doc_db_settings:(doc_db_settings_ : doc_db_settings option)
    ?ibm_db2_settings:(ibm_db2_settings_ : ibm_db2_settings option)
    ?microsoft_sql_server_settings:
      (microsoft_sql_server_settings_ : microsoft_sql_server_settings option)
    ?sybase_settings:(sybase_settings_ : sybase_settings option)
    ?oracle_settings:(oracle_settings_ : oracle_settings option)
    ?my_sql_settings:(my_sql_settings_ : my_sql_settings option)
    ?postgre_sql_settings:(postgre_sql_settings_ : postgre_sql_settings option)
    ?redshift_settings:(redshift_settings_ : redshift_settings option)
    ?neptune_settings:(neptune_settings_ : neptune_settings option)
    ?elasticsearch_settings:(elasticsearch_settings_ : elasticsearch_settings option)
    ?kafka_settings:(kafka_settings_ : kafka_settings option)
    ?kinesis_settings:(kinesis_settings_ : kinesis_settings option)
    ?mongo_db_settings:(mongo_db_settings_ : mongo_db_settings option)
    ?dms_transfer_settings:(dms_transfer_settings_ : dms_transfer_settings option)
    ?s3_settings:(s3_settings_ : s3_settings option)
    ?dynamo_db_settings:(dynamo_db_settings_ : dynamo_db_settings option)
    ?external_table_definition:(external_table_definition_ : string_ option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?certificate_arn:(certificate_arn_ : string_ option)
    ?extra_connection_attributes:(extra_connection_attributes_ : string_ option)
    ?database_name:(database_name_ : string_ option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) ?password:(password_ : secret_string option)
    ?username:(username_ : string_ option) ?engine_name:(engine_name_ : string_ option)
    ?endpoint_type:(endpoint_type_ : replication_endpoint_type_value option)
    ?endpoint_identifier:(endpoint_identifier_ : string_ option)
    ~endpoint_arn:(endpoint_arn_ : string_) () =
  ({
     timestream_settings = timestream_settings_;
     gcp_my_sql_settings = gcp_my_sql_settings_;
     exact_settings = exact_settings_;
     redis_settings = redis_settings_;
     doc_db_settings = doc_db_settings_;
     ibm_db2_settings = ibm_db2_settings_;
     microsoft_sql_server_settings = microsoft_sql_server_settings_;
     sybase_settings = sybase_settings_;
     oracle_settings = oracle_settings_;
     my_sql_settings = my_sql_settings_;
     postgre_sql_settings = postgre_sql_settings_;
     redshift_settings = redshift_settings_;
     neptune_settings = neptune_settings_;
     elasticsearch_settings = elasticsearch_settings_;
     kafka_settings = kafka_settings_;
     kinesis_settings = kinesis_settings_;
     mongo_db_settings = mongo_db_settings_;
     dms_transfer_settings = dms_transfer_settings_;
     s3_settings = s3_settings_;
     dynamo_db_settings = dynamo_db_settings_;
     external_table_definition = external_table_definition_;
     service_access_role_arn = service_access_role_arn_;
     ssl_mode = ssl_mode_;
     certificate_arn = certificate_arn_;
     extra_connection_attributes = extra_connection_attributes_;
     database_name = database_name_;
     port = port_;
     server_name = server_name_;
     password = password_;
     username = username_;
     engine_name = engine_name_;
     endpoint_type = endpoint_type_;
     endpoint_identifier = endpoint_identifier_;
     endpoint_arn = endpoint_arn_;
   }
    : modify_endpoint_message)

let make_microsoft_sql_server_data_provider_settings
    ?s3_access_role_arn:(s3_access_role_arn_ : string_ option) ?s3_path:(s3_path_ : string_ option)
    ?certificate_arn:(certificate_arn_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?database_name:(database_name_ : string_ option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) () =
  ({
     s3_access_role_arn = s3_access_role_arn_;
     s3_path = s3_path_;
     certificate_arn = certificate_arn_;
     ssl_mode = ssl_mode_;
     database_name = database_name_;
     port = port_;
     server_name = server_name_;
   }
    : microsoft_sql_server_data_provider_settings)

let make_doc_db_data_provider_settings ?certificate_arn:(certificate_arn_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?database_name:(database_name_ : string_ option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) () =
  ({
     certificate_arn = certificate_arn_;
     ssl_mode = ssl_mode_;
     database_name = database_name_;
     port = port_;
     server_name = server_name_;
   }
    : doc_db_data_provider_settings)

let make_maria_db_data_provider_settings ?s3_access_role_arn:(s3_access_role_arn_ : string_ option)
    ?s3_path:(s3_path_ : string_ option) ?certificate_arn:(certificate_arn_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) () =
  ({
     s3_access_role_arn = s3_access_role_arn_;
     s3_path = s3_path_;
     certificate_arn = certificate_arn_;
     ssl_mode = ssl_mode_;
     port = port_;
     server_name = server_name_;
   }
    : maria_db_data_provider_settings)

let make_ibm_db2_luw_data_provider_settings
    ?s3_access_role_arn:(s3_access_role_arn_ : string_ option) ?s3_path:(s3_path_ : string_ option)
    ?security_mechanism:(security_mechanism_ : integer_optional option)
    ?encryption_algorithm:(encryption_algorithm_ : integer_optional option)
    ?certificate_arn:(certificate_arn_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?database_name:(database_name_ : string_ option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) () =
  ({
     s3_access_role_arn = s3_access_role_arn_;
     s3_path = s3_path_;
     security_mechanism = security_mechanism_;
     encryption_algorithm = encryption_algorithm_;
     certificate_arn = certificate_arn_;
     ssl_mode = ssl_mode_;
     database_name = database_name_;
     port = port_;
     server_name = server_name_;
   }
    : ibm_db2_luw_data_provider_settings)

let make_ibm_db2z_os_data_provider_settings
    ?s3_access_role_arn:(s3_access_role_arn_ : string_ option) ?s3_path:(s3_path_ : string_ option)
    ?certificate_arn:(certificate_arn_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?database_name:(database_name_ : string_ option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) () =
  ({
     s3_access_role_arn = s3_access_role_arn_;
     s3_path = s3_path_;
     certificate_arn = certificate_arn_;
     ssl_mode = ssl_mode_;
     database_name = database_name_;
     port = port_;
     server_name = server_name_;
   }
    : ibm_db2z_os_data_provider_settings)

let make_data_provider ?settings:(settings_ : data_provider_settings option)
    ?\#virtual:(virtual_ : boolean_optional option) ?engine:(engine_ : string_ option)
    ?description:(description_ : string_ option)
    ?data_provider_creation_time:(data_provider_creation_time_ : iso8601_date_time option)
    ?data_provider_arn:(data_provider_arn_ : string_ option)
    ?data_provider_name:(data_provider_name_ : string_ option) () =
  ({
     settings = settings_;
     \#virtual = virtual_;
     engine = engine_;
     description = description_;
     data_provider_creation_time = data_provider_creation_time_;
     data_provider_arn = data_provider_arn_;
     data_provider_name = data_provider_name_;
   }
    : data_provider)

let make_modify_data_provider_response ?data_provider:(data_provider_ : data_provider option) () =
  ({ data_provider = data_provider_ } : modify_data_provider_response)

let make_modify_data_provider_message ?settings:(settings_ : data_provider_settings option)
    ?exact_settings:(exact_settings_ : boolean_optional option)
    ?\#virtual:(virtual_ : boolean_optional option) ?engine:(engine_ : string_ option)
    ?description:(description_ : string_ option)
    ?data_provider_name:(data_provider_name_ : string_ option)
    ~data_provider_identifier:(data_provider_identifier_ : string_) () =
  ({
     settings = settings_;
     exact_settings = exact_settings_;
     \#virtual = virtual_;
     engine = engine_;
     description = description_;
     data_provider_name = data_provider_name_;
     data_provider_identifier = data_provider_identifier_;
   }
    : modify_data_provider_message)

let make_modify_data_migration_response ?data_migration:(data_migration_ : data_migration option) ()
    =
  ({ data_migration = data_migration_ } : modify_data_migration_response)

let make_modify_data_migration_message ?selection_rules:(selection_rules_ : secret_string option)
    ?number_of_jobs:(number_of_jobs_ : integer_optional option)
    ?target_data_settings:(target_data_settings_ : target_data_settings option)
    ?source_data_settings:(source_data_settings_ : source_data_settings option)
    ?data_migration_type:(data_migration_type_ : migration_type_value option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?enable_cloudwatch_logs:(enable_cloudwatch_logs_ : boolean_optional option)
    ?data_migration_name:(data_migration_name_ : string_ option)
    ~data_migration_identifier:(data_migration_identifier_ : string_) () =
  ({
     selection_rules = selection_rules_;
     number_of_jobs = number_of_jobs_;
     target_data_settings = target_data_settings_;
     source_data_settings = source_data_settings_;
     data_migration_type = data_migration_type_;
     service_access_role_arn = service_access_role_arn_;
     enable_cloudwatch_logs = enable_cloudwatch_logs_;
     data_migration_name = data_migration_name_;
     data_migration_identifier = data_migration_identifier_;
   }
    : modify_data_migration_message)

let make_modify_conversion_configuration_response
    ?migration_project_identifier:(migration_project_identifier_ : string_ option) () =
  ({ migration_project_identifier = migration_project_identifier_ }
    : modify_conversion_configuration_response)

let make_modify_conversion_configuration_message
    ~conversion_configuration:(conversion_configuration_ : string_)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     conversion_configuration = conversion_configuration_;
     migration_project_identifier = migration_project_identifier_;
   }
    : modify_conversion_configuration_message)

let make_metadata_model_reference ?selection_rules:(selection_rules_ : string_ option)
    ?metadata_model_name:(metadata_model_name_ : string_ option) () =
  ({ selection_rules = selection_rules_; metadata_model_name = metadata_model_name_ }
    : metadata_model_reference)

let make_list_tags_for_resource_response ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_message ?resource_arn_list:(resource_arn_list_ : arn_list option)
    ?resource_arn:(resource_arn_ : string_ option) () =
  ({ resource_arn_list = resource_arn_list_; resource_arn = resource_arn_ }
    : list_tags_for_resource_message)

let make_limitation ?type_:(type__ : string_ option) ?impact:(impact_ : string_ option)
    ?description:(description_ : string_ option) ?name:(name_ : string_ option)
    ?engine_name:(engine_name_ : string_ option) ?database_id:(database_id_ : string_ option) () =
  ({
     type_ = type__;
     impact = impact_;
     description = description_;
     name = name_;
     engine_name = engine_name_;
     database_id = database_id_;
   }
    : limitation)

let make_inventory_data ?number_of_schemas:(number_of_schemas_ : integer_optional option)
    ?number_of_databases:(number_of_databases_ : integer_optional option) () =
  ({ number_of_schemas = number_of_schemas_; number_of_databases = number_of_databases_ }
    : inventory_data)

let make_certificate ?kms_key_id:(kms_key_id_ : string_ option)
    ?key_length:(key_length_ : integer_optional option)
    ?signing_algorithm:(signing_algorithm_ : string_ option)
    ?valid_to_date:(valid_to_date_ : t_stamp option)
    ?valid_from_date:(valid_from_date_ : t_stamp option)
    ?certificate_owner:(certificate_owner_ : string_ option)
    ?certificate_arn:(certificate_arn_ : string_ option)
    ?certificate_wallet:(certificate_wallet_ : certificate_wallet option)
    ?certificate_pem:(certificate_pem_ : string_ option)
    ?certificate_creation_date:(certificate_creation_date_ : t_stamp option)
    ?certificate_identifier:(certificate_identifier_ : string_ option) () =
  ({
     kms_key_id = kms_key_id_;
     key_length = key_length_;
     signing_algorithm = signing_algorithm_;
     valid_to_date = valid_to_date_;
     valid_from_date = valid_from_date_;
     certificate_owner = certificate_owner_;
     certificate_arn = certificate_arn_;
     certificate_wallet = certificate_wallet_;
     certificate_pem = certificate_pem_;
     certificate_creation_date = certificate_creation_date_;
     certificate_identifier = certificate_identifier_;
   }
    : certificate)

let make_import_certificate_response ?certificate:(certificate_ : certificate option) () =
  ({ certificate = certificate_ } : import_certificate_response)

let make_import_certificate_message ?kms_key_id:(kms_key_id_ : string_ option)
    ?tags:(tags_ : tag_list option)
    ?certificate_wallet:(certificate_wallet_ : certificate_wallet option)
    ?certificate_pem:(certificate_pem_ : secret_string option)
    ~certificate_identifier:(certificate_identifier_ : string_) () =
  ({
     kms_key_id = kms_key_id_;
     tags = tags_;
     certificate_wallet = certificate_wallet_;
     certificate_pem = certificate_pem_;
     certificate_identifier = certificate_identifier_;
   }
    : import_certificate_message)

let make_get_target_selection_rules_response
    ?target_selection_rules:(target_selection_rules_ : string_ option) () =
  ({ target_selection_rules = target_selection_rules_ } : get_target_selection_rules_response)

let make_get_target_selection_rules_message ~selection_rules:(selection_rules_ : string_)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     selection_rules = selection_rules_;
     migration_project_identifier = migration_project_identifier_;
   }
    : get_target_selection_rules_message)

let make_fleet_advisor_schema_object_response ?code_size:(code_size_ : long_optional option)
    ?code_line_count:(code_line_count_ : long_optional option)
    ?number_of_objects:(number_of_objects_ : long_optional option)
    ?object_type:(object_type_ : string_ option) ?schema_id:(schema_id_ : string_ option) () =
  ({
     code_size = code_size_;
     code_line_count = code_line_count_;
     number_of_objects = number_of_objects_;
     object_type = object_type_;
     schema_id = schema_id_;
   }
    : fleet_advisor_schema_object_response)

let make_fleet_advisor_lsa_analysis_response ?status:(status_ : string_ option)
    ?lsa_analysis_id:(lsa_analysis_id_ : string_ option) () =
  ({ status = status_; lsa_analysis_id = lsa_analysis_id_ } : fleet_advisor_lsa_analysis_response)

let make_filter ~values:(values_ : filter_value_list) ~name:(name_ : string_) () =
  ({ values = values_; name = name_ } : filter)

let make_export_metadata_model_assessment_result_entry ?object_ur_l:(object_ur_l_ : string_ option)
    ?s3_object_key:(s3_object_key_ : string_ option) () =
  ({ object_ur_l = object_ur_l_; s3_object_key = s3_object_key_ }
    : export_metadata_model_assessment_result_entry)

let make_export_metadata_model_assessment_response
    ?csv_report:(csv_report_ : export_metadata_model_assessment_result_entry option)
    ?pdf_report:(pdf_report_ : export_metadata_model_assessment_result_entry option) () =
  ({ csv_report = csv_report_; pdf_report = pdf_report_ }
    : export_metadata_model_assessment_response)

let make_export_metadata_model_assessment_message
    ?assessment_report_types:(assessment_report_types_ : assessment_report_types_list option)
    ?file_name:(file_name_ : string_ option) ~selection_rules:(selection_rules_ : string_)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     assessment_report_types = assessment_report_types_;
     file_name = file_name_;
     selection_rules = selection_rules_;
     migration_project_identifier = migration_project_identifier_;
   }
    : export_metadata_model_assessment_message)

let make_event ?date:(date_ : t_stamp option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?message:(message_ : string_ option) ?source_type:(source_type_ : source_type option)
    ?source_identifier:(source_identifier_ : string_ option) () =
  ({
     date = date_;
     event_categories = event_categories_;
     message = message_;
     source_type = source_type_;
     source_identifier = source_identifier_;
   }
    : event)

let make_event_category_group ?event_categories:(event_categories_ : event_categories_list option)
    ?source_type:(source_type_ : string_ option) () =
  ({ event_categories = event_categories_; source_type = source_type_ } : event_category_group)

let make_engine_version ?available_upgrades:(available_upgrades_ : available_upgrades_list option)
    ?force_upgrade_date:(force_upgrade_date_ : t_stamp option)
    ?deprecation_date:(deprecation_date_ : t_stamp option)
    ?auto_upgrade_date:(auto_upgrade_date_ : t_stamp option)
    ?launch_date:(launch_date_ : t_stamp option)
    ?release_status:(release_status_ : release_status_values option)
    ?lifecycle:(lifecycle_ : string_ option) ?version:(version_ : string_ option) () =
  ({
     available_upgrades = available_upgrades_;
     force_upgrade_date = force_upgrade_date_;
     deprecation_date = deprecation_date_;
     auto_upgrade_date = auto_upgrade_date_;
     launch_date = launch_date_;
     release_status = release_status_;
     lifecycle = lifecycle_;
     version = version_;
   }
    : engine_version)

let make_endpoint_setting ?default_value:(default_value_ : string_ option)
    ?int_value_max:(int_value_max_ : integer_optional option)
    ?int_value_min:(int_value_min_ : integer_optional option)
    ?applicability:(applicability_ : string_ option) ?units:(units_ : string_ option)
    ?sensitive:(sensitive_ : boolean_optional option)
    ?enum_values:(enum_values_ : endpoint_setting_enum_values option)
    ?type_:(type__ : endpoint_setting_type_value option) ?name:(name_ : string_ option) () =
  ({
     default_value = default_value_;
     int_value_max = int_value_max_;
     int_value_min = int_value_min_;
     applicability = applicability_;
     units = units_;
     sensitive = sensitive_;
     enum_values = enum_values_;
     type_ = type__;
     name = name_;
   }
    : endpoint_setting)

let make_describe_table_statistics_response ?marker:(marker_ : string_ option)
    ?table_statistics:(table_statistics_ : table_statistics_list option)
    ?replication_task_arn:(replication_task_arn_ : string_ option) () =
  ({
     marker = marker_;
     table_statistics = table_statistics_;
     replication_task_arn = replication_task_arn_;
   }
    : describe_table_statistics_response)

let make_describe_table_statistics_message ?filters:(filters_ : filter_list option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ~replication_task_arn:(replication_task_arn_ : string_) () =
  ({
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
     replication_task_arn = replication_task_arn_;
   }
    : describe_table_statistics_message)

let make_describe_schemas_response ?schemas:(schemas_ : schema_list option)
    ?marker:(marker_ : string_ option) () =
  ({ schemas = schemas_; marker = marker_ } : describe_schemas_response)

let make_describe_schemas_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ~endpoint_arn:(endpoint_arn_ : string_) ()
    =
  ({ marker = marker_; max_records = max_records_; endpoint_arn = endpoint_arn_ }
    : describe_schemas_message)

let make_describe_replications_response ?replications:(replications_ : replication_list option)
    ?marker:(marker_ : string_ option) () =
  ({ replications = replications_; marker = marker_ } : describe_replications_response)

let make_describe_replications_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ marker = marker_; max_records = max_records_; filters = filters_ }
    : describe_replications_message)

let make_describe_replication_tasks_response
    ?replication_tasks:(replication_tasks_ : replication_task_list option)
    ?marker:(marker_ : string_ option) () =
  ({ replication_tasks = replication_tasks_; marker = marker_ }
    : describe_replication_tasks_response)

let make_describe_replication_tasks_message
    ?without_settings:(without_settings_ : boolean_optional option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ?filters:(filters_ : filter_list option) () =
  ({
     without_settings = without_settings_;
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
   }
    : describe_replication_tasks_message)

let make_describe_replication_task_individual_assessments_response
    ?replication_task_individual_assessments:
      (replication_task_individual_assessments_ : replication_task_individual_assessment_list option)
    ?marker:(marker_ : string_ option) () =
  ({
     replication_task_individual_assessments = replication_task_individual_assessments_;
     marker = marker_;
   }
    : describe_replication_task_individual_assessments_response)

let make_describe_replication_task_individual_assessments_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ marker = marker_; max_records = max_records_; filters = filters_ }
    : describe_replication_task_individual_assessments_message)

let make_describe_replication_task_assessment_runs_response
    ?replication_task_assessment_runs:
      (replication_task_assessment_runs_ : replication_task_assessment_run_list option)
    ?marker:(marker_ : string_ option) () =
  ({ replication_task_assessment_runs = replication_task_assessment_runs_; marker = marker_ }
    : describe_replication_task_assessment_runs_response)

let make_describe_replication_task_assessment_runs_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ marker = marker_; max_records = max_records_; filters = filters_ }
    : describe_replication_task_assessment_runs_message)

let make_describe_replication_task_assessment_results_response
    ?replication_task_assessment_results:
      (replication_task_assessment_results_ : replication_task_assessment_result_list option)
    ?bucket_name:(bucket_name_ : string_ option) ?marker:(marker_ : string_ option) () =
  ({
     replication_task_assessment_results = replication_task_assessment_results_;
     bucket_name = bucket_name_;
     marker = marker_;
   }
    : describe_replication_task_assessment_results_response)

let make_describe_replication_task_assessment_results_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ?replication_task_arn:(replication_task_arn_ : string_ option) () =
  ({ marker = marker_; max_records = max_records_; replication_task_arn = replication_task_arn_ }
    : describe_replication_task_assessment_results_message)

let make_describe_replication_table_statistics_response
    ?replication_table_statistics:
      (replication_table_statistics_ : replication_table_statistics_list option)
    ?marker:(marker_ : string_ option)
    ?replication_config_arn:(replication_config_arn_ : string_ option) () =
  ({
     replication_table_statistics = replication_table_statistics_;
     marker = marker_;
     replication_config_arn = replication_config_arn_;
   }
    : describe_replication_table_statistics_response)

let make_describe_replication_table_statistics_message ?filters:(filters_ : filter_list option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ~replication_config_arn:(replication_config_arn_ : string_) () =
  ({
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
     replication_config_arn = replication_config_arn_;
   }
    : describe_replication_table_statistics_message)

let make_describe_replication_subnet_groups_response
    ?replication_subnet_groups:(replication_subnet_groups_ : replication_subnet_groups option)
    ?marker:(marker_ : string_ option) () =
  ({ replication_subnet_groups = replication_subnet_groups_; marker = marker_ }
    : describe_replication_subnet_groups_response)

let make_describe_replication_subnet_groups_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ marker = marker_; max_records = max_records_; filters = filters_ }
    : describe_replication_subnet_groups_message)

let make_describe_replication_instances_response
    ?replication_instances:(replication_instances_ : replication_instance_list option)
    ?marker:(marker_ : string_ option) () =
  ({ replication_instances = replication_instances_; marker = marker_ }
    : describe_replication_instances_response)

let make_describe_replication_instances_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ marker = marker_; max_records = max_records_; filters = filters_ }
    : describe_replication_instances_message)

let make_describe_replication_instance_task_logs_response ?marker:(marker_ : string_ option)
    ?replication_instance_task_logs:
      (replication_instance_task_logs_ : replication_instance_task_logs_list option)
    ?replication_instance_arn:(replication_instance_arn_ : string_ option) () =
  ({
     marker = marker_;
     replication_instance_task_logs = replication_instance_task_logs_;
     replication_instance_arn = replication_instance_arn_;
   }
    : describe_replication_instance_task_logs_response)

let make_describe_replication_instance_task_logs_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ~replication_instance_arn:(replication_instance_arn_ : string_) () =
  ({
     marker = marker_;
     max_records = max_records_;
     replication_instance_arn = replication_instance_arn_;
   }
    : describe_replication_instance_task_logs_message)

let make_describe_replication_configs_response
    ?replication_configs:(replication_configs_ : replication_config_list option)
    ?marker:(marker_ : string_ option) () =
  ({ replication_configs = replication_configs_; marker = marker_ }
    : describe_replication_configs_response)

let make_describe_replication_configs_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ marker = marker_; max_records = max_records_; filters = filters_ }
    : describe_replication_configs_message)

let make_describe_refresh_schemas_status_response
    ?refresh_schemas_status:(refresh_schemas_status_ : refresh_schemas_status option) () =
  ({ refresh_schemas_status = refresh_schemas_status_ } : describe_refresh_schemas_status_response)

let make_describe_refresh_schemas_status_message ~endpoint_arn:(endpoint_arn_ : string_) () =
  ({ endpoint_arn = endpoint_arn_ } : describe_refresh_schemas_status_message)

let make_describe_recommendations_response
    ?recommendations:(recommendations_ : recommendation_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ recommendations = recommendations_; next_token = next_token_ }
    : describe_recommendations_response)

let make_describe_recommendations_request ?next_token:(next_token_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ next_token = next_token_; max_records = max_records_; filters = filters_ }
    : describe_recommendations_request)

let make_describe_recommendation_limitations_response
    ?limitations:(limitations_ : limitation_list option) ?next_token:(next_token_ : string_ option)
    () =
  ({ limitations = limitations_; next_token = next_token_ }
    : describe_recommendation_limitations_response)

let make_describe_recommendation_limitations_request ?next_token:(next_token_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ next_token = next_token_; max_records = max_records_; filters = filters_ }
    : describe_recommendation_limitations_request)

let make_describe_pending_maintenance_actions_response ?marker:(marker_ : string_ option)
    ?pending_maintenance_actions:(pending_maintenance_actions_ : pending_maintenance_actions option)
    () =
  ({ marker = marker_; pending_maintenance_actions = pending_maintenance_actions_ }
    : describe_pending_maintenance_actions_response)

let make_describe_pending_maintenance_actions_message
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?filters:(filters_ : filter_list option)
    ?replication_instance_arn:(replication_instance_arn_ : string_ option) () =
  ({
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     replication_instance_arn = replication_instance_arn_;
   }
    : describe_pending_maintenance_actions_message)

let make_describe_orderable_replication_instances_response ?marker:(marker_ : string_ option)
    ?orderable_replication_instances:
      (orderable_replication_instances_ : orderable_replication_instance_list option) () =
  ({ marker = marker_; orderable_replication_instances = orderable_replication_instances_ }
    : describe_orderable_replication_instances_response)

let make_describe_orderable_replication_instances_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) () =
  ({ marker = marker_; max_records = max_records_ }
    : describe_orderable_replication_instances_message)

let make_describe_migration_projects_response
    ?migration_projects:(migration_projects_ : migration_project_list option)
    ?marker:(marker_ : string_ option) () =
  ({ migration_projects = migration_projects_; marker = marker_ }
    : describe_migration_projects_response)

let make_describe_migration_projects_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ marker = marker_; max_records = max_records_; filters = filters_ }
    : describe_migration_projects_message)

let make_describe_metadata_model_response ?definition:(definition_ : string_ option)
    ?target_metadata_models:(target_metadata_models_ : metadata_model_reference_list option)
    ?metadata_model_type:(metadata_model_type_ : string_ option)
    ?metadata_model_name:(metadata_model_name_ : string_ option) () =
  ({
     definition = definition_;
     target_metadata_models = target_metadata_models_;
     metadata_model_type = metadata_model_type_;
     metadata_model_name = metadata_model_name_;
   }
    : describe_metadata_model_response)

let make_describe_metadata_model_message ~origin:(origin_ : origin_type_value)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier)
    ~selection_rules:(selection_rules_ : string_) () =
  ({
     origin = origin_;
     migration_project_identifier = migration_project_identifier_;
     selection_rules = selection_rules_;
   }
    : describe_metadata_model_message)

let make_describe_metadata_model_imports_response
    ?requests:(requests_ : schema_conversion_request_list option) ?marker:(marker_ : string_ option)
    () =
  ({ requests = requests_; marker = marker_ } : describe_metadata_model_imports_response)

let make_describe_metadata_model_imports_message
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?filters:(filters_ : filter_list option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     migration_project_identifier = migration_project_identifier_;
   }
    : describe_metadata_model_imports_message)

let make_describe_metadata_model_exports_to_target_response
    ?requests:(requests_ : schema_conversion_request_list option) ?marker:(marker_ : string_ option)
    () =
  ({ requests = requests_; marker = marker_ } : describe_metadata_model_exports_to_target_response)

let make_describe_metadata_model_exports_to_target_message
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?filters:(filters_ : filter_list option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     migration_project_identifier = migration_project_identifier_;
   }
    : describe_metadata_model_exports_to_target_message)

let make_describe_metadata_model_exports_as_script_response
    ?requests:(requests_ : schema_conversion_request_list option) ?marker:(marker_ : string_ option)
    () =
  ({ requests = requests_; marker = marker_ } : describe_metadata_model_exports_as_script_response)

let make_describe_metadata_model_exports_as_script_message
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?filters:(filters_ : filter_list option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     migration_project_identifier = migration_project_identifier_;
   }
    : describe_metadata_model_exports_as_script_message)

let make_describe_metadata_model_creations_response
    ?requests:(requests_ : schema_conversion_request_list option) ?marker:(marker_ : string_ option)
    () =
  ({ requests = requests_; marker = marker_ } : describe_metadata_model_creations_response)

let make_describe_metadata_model_creations_message
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?filters:(filters_ : filter_list option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     migration_project_identifier = migration_project_identifier_;
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
   }
    : describe_metadata_model_creations_message)

let make_describe_metadata_model_conversions_response
    ?requests:(requests_ : schema_conversion_request_list option) ?marker:(marker_ : string_ option)
    () =
  ({ requests = requests_; marker = marker_ } : describe_metadata_model_conversions_response)

let make_describe_metadata_model_conversions_message
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?filters:(filters_ : filter_list option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     migration_project_identifier = migration_project_identifier_;
   }
    : describe_metadata_model_conversions_message)

let make_describe_metadata_model_children_response
    ?metadata_model_children:(metadata_model_children_ : metadata_model_reference_list option)
    ?marker:(marker_ : string_ option) () =
  ({ metadata_model_children = metadata_model_children_; marker = marker_ }
    : describe_metadata_model_children_response)

let make_describe_metadata_model_children_message
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ~origin:(origin_ : origin_type_value)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier)
    ~selection_rules:(selection_rules_ : string_) () =
  ({
     max_records = max_records_;
     marker = marker_;
     origin = origin_;
     migration_project_identifier = migration_project_identifier_;
     selection_rules = selection_rules_;
   }
    : describe_metadata_model_children_message)

let make_describe_metadata_model_assessments_response
    ?requests:(requests_ : schema_conversion_request_list option) ?marker:(marker_ : string_ option)
    () =
  ({ requests = requests_; marker = marker_ } : describe_metadata_model_assessments_response)

let make_describe_metadata_model_assessments_message
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?filters:(filters_ : filter_list option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     migration_project_identifier = migration_project_identifier_;
   }
    : describe_metadata_model_assessments_message)

let make_describe_instance_profiles_response
    ?instance_profiles:(instance_profiles_ : instance_profile_list option)
    ?marker:(marker_ : string_ option) () =
  ({ instance_profiles = instance_profiles_; marker = marker_ }
    : describe_instance_profiles_response)

let make_describe_instance_profiles_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ marker = marker_; max_records = max_records_; filters = filters_ }
    : describe_instance_profiles_message)

let make_describe_fleet_advisor_schemas_response ?next_token:(next_token_ : string_ option)
    ?fleet_advisor_schemas:(fleet_advisor_schemas_ : fleet_advisor_schema_list option) () =
  ({ next_token = next_token_; fleet_advisor_schemas = fleet_advisor_schemas_ }
    : describe_fleet_advisor_schemas_response)

let make_describe_fleet_advisor_schemas_request ?next_token:(next_token_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ next_token = next_token_; max_records = max_records_; filters = filters_ }
    : describe_fleet_advisor_schemas_request)

let make_describe_fleet_advisor_schema_object_summary_response
    ?next_token:(next_token_ : string_ option)
    ?fleet_advisor_schema_objects:
      (fleet_advisor_schema_objects_ : fleet_advisor_schema_object_list option) () =
  ({ next_token = next_token_; fleet_advisor_schema_objects = fleet_advisor_schema_objects_ }
    : describe_fleet_advisor_schema_object_summary_response)

let make_describe_fleet_advisor_schema_object_summary_request
    ?next_token:(next_token_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ?filters:(filters_ : filter_list option) () =
  ({ next_token = next_token_; max_records = max_records_; filters = filters_ }
    : describe_fleet_advisor_schema_object_summary_request)

let make_describe_fleet_advisor_lsa_analysis_response ?next_token:(next_token_ : string_ option)
    ?analysis:(analysis_ : fleet_advisor_lsa_analysis_response_list option) () =
  ({ next_token = next_token_; analysis = analysis_ }
    : describe_fleet_advisor_lsa_analysis_response)

let make_describe_fleet_advisor_lsa_analysis_request ?next_token:(next_token_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) () =
  ({ next_token = next_token_; max_records = max_records_ }
    : describe_fleet_advisor_lsa_analysis_request)

let make_database_instance_software_details_response ?tooltip:(tooltip_ : string_ option)
    ?os_architecture:(os_architecture_ : integer_optional option)
    ?support_level:(support_level_ : string_ option) ?service_pack:(service_pack_ : string_ option)
    ?engine_edition:(engine_edition_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option) () =
  ({
     tooltip = tooltip_;
     os_architecture = os_architecture_;
     support_level = support_level_;
     service_pack = service_pack_;
     engine_edition = engine_edition_;
     engine_version = engine_version_;
     engine = engine_;
   }
    : database_instance_software_details_response)

let make_collector_short_info_response ?collector_name:(collector_name_ : string_ option)
    ?collector_referenced_id:(collector_referenced_id_ : string_ option) () =
  ({ collector_name = collector_name_; collector_referenced_id = collector_referenced_id_ }
    : collector_short_info_response)

let make_database_response ?collectors:(collectors_ : collectors_list option)
    ?software_details:(software_details_ : database_instance_software_details_response option)
    ?server:(server_ : server_short_info_response option)
    ?number_of_schemas:(number_of_schemas_ : long_optional option)
    ?ip_address:(ip_address_ : string_ option) ?database_name:(database_name_ : string_ option)
    ?database_id:(database_id_ : string_ option) () =
  ({
     collectors = collectors_;
     software_details = software_details_;
     server = server_;
     number_of_schemas = number_of_schemas_;
     ip_address = ip_address_;
     database_name = database_name_;
     database_id = database_id_;
   }
    : database_response)

let make_describe_fleet_advisor_databases_response ?next_token:(next_token_ : string_ option)
    ?databases:(databases_ : database_list option) () =
  ({ next_token = next_token_; databases = databases_ } : describe_fleet_advisor_databases_response)

let make_describe_fleet_advisor_databases_request ?next_token:(next_token_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ next_token = next_token_; max_records = max_records_; filters = filters_ }
    : describe_fleet_advisor_databases_request)

let make_collector_health_check
    ?web_collector_granted_role_based_access:
      (web_collector_granted_role_based_access_ : boolean_optional option)
    ?web_collector_s3_access:(web_collector_s3_access_ : boolean_optional option)
    ?local_collector_s3_access:(local_collector_s3_access_ : boolean_optional option)
    ?collector_status:(collector_status_ : collector_status option) () =
  ({
     web_collector_granted_role_based_access = web_collector_granted_role_based_access_;
     web_collector_s3_access = web_collector_s3_access_;
     local_collector_s3_access = local_collector_s3_access_;
     collector_status = collector_status_;
   }
    : collector_health_check)

let make_collector_response ?inventory_data:(inventory_data_ : inventory_data option)
    ?modified_date:(modified_date_ : string_ option) ?created_date:(created_date_ : string_ option)
    ?registered_date:(registered_date_ : string_ option)
    ?last_data_received:(last_data_received_ : string_ option)
    ?collector_health_check:(collector_health_check_ : collector_health_check option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?s3_bucket_name:(s3_bucket_name_ : string_ option) ?description:(description_ : string_ option)
    ?version_status:(version_status_ : version_status option)
    ?collector_version:(collector_version_ : string_ option)
    ?collector_name:(collector_name_ : string_ option)
    ?collector_referenced_id:(collector_referenced_id_ : string_ option) () =
  ({
     inventory_data = inventory_data_;
     modified_date = modified_date_;
     created_date = created_date_;
     registered_date = registered_date_;
     last_data_received = last_data_received_;
     collector_health_check = collector_health_check_;
     service_access_role_arn = service_access_role_arn_;
     s3_bucket_name = s3_bucket_name_;
     description = description_;
     version_status = version_status_;
     collector_version = collector_version_;
     collector_name = collector_name_;
     collector_referenced_id = collector_referenced_id_;
   }
    : collector_response)

let make_describe_fleet_advisor_collectors_response ?next_token:(next_token_ : string_ option)
    ?collectors:(collectors_ : collector_responses option) () =
  ({ next_token = next_token_; collectors = collectors_ }
    : describe_fleet_advisor_collectors_response)

let make_describe_fleet_advisor_collectors_request ?next_token:(next_token_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ next_token = next_token_; max_records = max_records_; filters = filters_ }
    : describe_fleet_advisor_collectors_request)

let make_describe_extension_pack_associations_response
    ?requests:(requests_ : schema_conversion_request_list option) ?marker:(marker_ : string_ option)
    () =
  ({ requests = requests_; marker = marker_ } : describe_extension_pack_associations_response)

let make_describe_extension_pack_associations_message
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?filters:(filters_ : filter_list option)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     migration_project_identifier = migration_project_identifier_;
   }
    : describe_extension_pack_associations_message)

let make_describe_events_response ?events:(events_ : event_list option)
    ?marker:(marker_ : string_ option) () =
  ({ events = events_; marker = marker_ } : describe_events_response)

let make_describe_events_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?duration:(duration_ : integer_optional option) ?end_time:(end_time_ : t_stamp option)
    ?start_time:(start_time_ : t_stamp option) ?source_type:(source_type_ : source_type option)
    ?source_identifier:(source_identifier_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     event_categories = event_categories_;
     duration = duration_;
     end_time = end_time_;
     start_time = start_time_;
     source_type = source_type_;
     source_identifier = source_identifier_;
   }
    : describe_events_message)

let make_describe_event_subscriptions_response
    ?event_subscriptions_list:(event_subscriptions_list_ : event_subscriptions_list option)
    ?marker:(marker_ : string_ option) () =
  ({ event_subscriptions_list = event_subscriptions_list_; marker = marker_ }
    : describe_event_subscriptions_response)

let make_describe_event_subscriptions_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?subscription_name:(subscription_name_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     subscription_name = subscription_name_;
   }
    : describe_event_subscriptions_message)

let make_describe_event_categories_response
    ?event_category_group_list:(event_category_group_list_ : event_category_group_list option) () =
  ({ event_category_group_list = event_category_group_list_ } : describe_event_categories_response)

let make_describe_event_categories_message ?filters:(filters_ : filter_list option)
    ?source_type:(source_type_ : string_ option) () =
  ({ filters = filters_; source_type = source_type_ } : describe_event_categories_message)

let make_describe_engine_versions_response ?marker:(marker_ : string_ option)
    ?engine_versions:(engine_versions_ : engine_version_list option) () =
  ({ marker = marker_; engine_versions = engine_versions_ } : describe_engine_versions_response)

let make_describe_engine_versions_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) () =
  ({ marker = marker_; max_records = max_records_ } : describe_engine_versions_message)

let make_describe_endpoints_response ?endpoints:(endpoints_ : endpoint_list option)
    ?marker:(marker_ : string_ option) () =
  ({ endpoints = endpoints_; marker = marker_ } : describe_endpoints_response)

let make_describe_endpoints_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ marker = marker_; max_records = max_records_; filters = filters_ }
    : describe_endpoints_message)

let make_describe_endpoint_types_response
    ?supported_endpoint_types:(supported_endpoint_types_ : supported_endpoint_type_list option)
    ?marker:(marker_ : string_ option) () =
  ({ supported_endpoint_types = supported_endpoint_types_; marker = marker_ }
    : describe_endpoint_types_response)

let make_describe_endpoint_types_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ marker = marker_; max_records = max_records_; filters = filters_ }
    : describe_endpoint_types_message)

let make_describe_endpoint_settings_response
    ?endpoint_settings:(endpoint_settings_ : endpoint_settings_list option)
    ?marker:(marker_ : string_ option) () =
  ({ endpoint_settings = endpoint_settings_; marker = marker_ }
    : describe_endpoint_settings_response)

let make_describe_endpoint_settings_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ~engine_name:(engine_name_ : string_) () =
  ({ marker = marker_; max_records = max_records_; engine_name = engine_name_ }
    : describe_endpoint_settings_message)

let make_describe_data_providers_response
    ?data_providers:(data_providers_ : data_provider_list option) ?marker:(marker_ : string_ option)
    () =
  ({ data_providers = data_providers_; marker = marker_ } : describe_data_providers_response)

let make_describe_data_providers_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ marker = marker_; max_records = max_records_; filters = filters_ }
    : describe_data_providers_message)

let make_describe_data_migrations_response ?marker:(marker_ : marker option)
    ?data_migrations:(data_migrations_ : data_migrations option) () =
  ({ marker = marker_; data_migrations = data_migrations_ } : describe_data_migrations_response)

let make_describe_data_migrations_message
    ?without_statistics:(without_statistics_ : boolean_optional option)
    ?without_settings:(without_settings_ : boolean_optional option)
    ?marker:(marker_ : marker option) ?max_records:(max_records_ : integer_optional option)
    ?filters:(filters_ : filter_list option) () =
  ({
     without_statistics = without_statistics_;
     without_settings = without_settings_;
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
   }
    : describe_data_migrations_message)

let make_describe_conversion_configuration_response
    ?conversion_configuration:(conversion_configuration_ : string_ option)
    ?migration_project_identifier:(migration_project_identifier_ : string_ option) () =
  ({
     conversion_configuration = conversion_configuration_;
     migration_project_identifier = migration_project_identifier_;
   }
    : describe_conversion_configuration_response)

let make_describe_conversion_configuration_message
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({ migration_project_identifier = migration_project_identifier_ }
    : describe_conversion_configuration_message)

let make_describe_connections_response ?connections:(connections_ : connection_list option)
    ?marker:(marker_ : string_ option) () =
  ({ connections = connections_; marker = marker_ } : describe_connections_response)

let make_describe_connections_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ marker = marker_; max_records = max_records_; filters = filters_ }
    : describe_connections_message)

let make_describe_certificates_response ?certificates:(certificates_ : certificate_list option)
    ?marker:(marker_ : string_ option) () =
  ({ certificates = certificates_; marker = marker_ } : describe_certificates_response)

let make_describe_certificates_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    () =
  ({ marker = marker_; max_records = max_records_; filters = filters_ }
    : describe_certificates_message)

let make_describe_applicable_individual_assessments_response ?marker:(marker_ : string_ option)
    ?individual_assessment_names:
      (individual_assessment_names_ : individual_assessment_name_list option) () =
  ({ marker = marker_; individual_assessment_names = individual_assessment_names_ }
    : describe_applicable_individual_assessments_response)

let make_describe_applicable_individual_assessments_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ?migration_type:(migration_type_ : migration_type_value option)
    ?target_engine_name:(target_engine_name_ : string_ option)
    ?source_engine_name:(source_engine_name_ : string_ option)
    ?replication_config_arn:(replication_config_arn_ : string_ option)
    ?replication_instance_arn:(replication_instance_arn_ : string_ option)
    ?replication_task_arn:(replication_task_arn_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     migration_type = migration_type_;
     target_engine_name = target_engine_name_;
     source_engine_name = source_engine_name_;
     replication_config_arn = replication_config_arn_;
     replication_instance_arn = replication_instance_arn_;
     replication_task_arn = replication_task_arn_;
   }
    : describe_applicable_individual_assessments_message)

let make_account_quota ?max:(max_ : long option) ?used:(used_ : long option)
    ?account_quota_name:(account_quota_name_ : string_ option) () =
  ({ max = max_; used = used_; account_quota_name = account_quota_name_ } : account_quota)

let make_describe_account_attributes_response
    ?unique_account_identifier:(unique_account_identifier_ : string_ option)
    ?account_quotas:(account_quotas_ : account_quota_list option) () =
  ({ unique_account_identifier = unique_account_identifier_; account_quotas = account_quotas_ }
    : describe_account_attributes_response)

let make_describe_account_attributes_message () = (() : unit)

let make_delete_replication_task_response
    ?replication_task:(replication_task_ : replication_task option) () =
  ({ replication_task = replication_task_ } : delete_replication_task_response)

let make_delete_replication_task_message ~replication_task_arn:(replication_task_arn_ : string_) ()
    =
  ({ replication_task_arn = replication_task_arn_ } : delete_replication_task_message)

let make_delete_replication_task_assessment_run_response
    ?replication_task_assessment_run:
      (replication_task_assessment_run_ : replication_task_assessment_run option) () =
  ({ replication_task_assessment_run = replication_task_assessment_run_ }
    : delete_replication_task_assessment_run_response)

let make_delete_replication_task_assessment_run_message
    ~replication_task_assessment_run_arn:(replication_task_assessment_run_arn_ : string_) () =
  ({ replication_task_assessment_run_arn = replication_task_assessment_run_arn_ }
    : delete_replication_task_assessment_run_message)

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

let make_delete_connection_message ~replication_instance_arn:(replication_instance_arn_ : string_)
    ~endpoint_arn:(endpoint_arn_ : string_) () =
  ({ replication_instance_arn = replication_instance_arn_; endpoint_arn = endpoint_arn_ }
    : delete_connection_message)

let make_delete_certificate_response ?certificate:(certificate_ : certificate option) () =
  ({ certificate = certificate_ } : delete_certificate_response)

let make_delete_certificate_message ~certificate_arn:(certificate_arn_ : string_) () =
  ({ certificate_arn = certificate_arn_ } : delete_certificate_message)

let make_create_replication_task_response
    ?replication_task:(replication_task_ : replication_task option) () =
  ({ replication_task = replication_task_ } : create_replication_task_response)

let make_create_replication_task_message
    ?resource_identifier:(resource_identifier_ : string_ option)
    ?task_data:(task_data_ : string_ option) ?tags:(tags_ : tag_list option)
    ?cdc_stop_position:(cdc_stop_position_ : string_ option)
    ?cdc_start_position:(cdc_start_position_ : string_ option)
    ?cdc_start_time:(cdc_start_time_ : t_stamp option)
    ?replication_task_settings:(replication_task_settings_ : string_ option)
    ~table_mappings:(table_mappings_ : string_)
    ~migration_type:(migration_type_ : migration_type_value)
    ~replication_instance_arn:(replication_instance_arn_ : string_)
    ~target_endpoint_arn:(target_endpoint_arn_ : string_)
    ~source_endpoint_arn:(source_endpoint_arn_ : string_)
    ~replication_task_identifier:(replication_task_identifier_ : string_) () =
  ({
     resource_identifier = resource_identifier_;
     task_data = task_data_;
     tags = tags_;
     cdc_stop_position = cdc_stop_position_;
     cdc_start_position = cdc_start_position_;
     cdc_start_time = cdc_start_time_;
     replication_task_settings = replication_task_settings_;
     table_mappings = table_mappings_;
     migration_type = migration_type_;
     replication_instance_arn = replication_instance_arn_;
     target_endpoint_arn = target_endpoint_arn_;
     source_endpoint_arn = source_endpoint_arn_;
     replication_task_identifier = replication_task_identifier_;
   }
    : create_replication_task_message)

let make_create_replication_subnet_group_response
    ?replication_subnet_group:(replication_subnet_group_ : replication_subnet_group option) () =
  ({ replication_subnet_group = replication_subnet_group_ }
    : create_replication_subnet_group_response)

let make_create_replication_subnet_group_message ?tags:(tags_ : tag_list option)
    ~subnet_ids:(subnet_ids_ : subnet_identifier_list)
    ~replication_subnet_group_description:(replication_subnet_group_description_ : string_)
    ~replication_subnet_group_identifier:(replication_subnet_group_identifier_ : string_) () =
  ({
     tags = tags_;
     subnet_ids = subnet_ids_;
     replication_subnet_group_description = replication_subnet_group_description_;
     replication_subnet_group_identifier = replication_subnet_group_identifier_;
   }
    : create_replication_subnet_group_message)

let make_create_replication_instance_response
    ?replication_instance:(replication_instance_ : replication_instance option) () =
  ({ replication_instance = replication_instance_ } : create_replication_instance_response)

let make_create_replication_instance_message
    ?kerberos_authentication_settings:
      (kerberos_authentication_settings_ : kerberos_authentication_settings option)
    ?network_type:(network_type_ : string_ option)
    ?resource_identifier:(resource_identifier_ : string_ option)
    ?dns_name_servers:(dns_name_servers_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?tags:(tags_ : tag_list option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?replication_subnet_group_identifier:(replication_subnet_group_identifier_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ~replication_instance_class:(replication_instance_class_ : replication_instance_class)
    ~replication_instance_identifier:(replication_instance_identifier_ : string_) () =
  ({
     kerberos_authentication_settings = kerberos_authentication_settings_;
     network_type = network_type_;
     resource_identifier = resource_identifier_;
     dns_name_servers = dns_name_servers_;
     publicly_accessible = publicly_accessible_;
     kms_key_id = kms_key_id_;
     tags = tags_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     engine_version = engine_version_;
     multi_a_z = multi_a_z_;
     preferred_maintenance_window = preferred_maintenance_window_;
     replication_subnet_group_identifier = replication_subnet_group_identifier_;
     availability_zone = availability_zone_;
     vpc_security_group_ids = vpc_security_group_ids_;
     replication_instance_class = replication_instance_class_;
     allocated_storage = allocated_storage_;
     replication_instance_identifier = replication_instance_identifier_;
   }
    : create_replication_instance_message)

let make_create_replication_config_response
    ?replication_config:(replication_config_ : replication_config option) () =
  ({ replication_config = replication_config_ } : create_replication_config_response)

let make_create_replication_config_message ?tags:(tags_ : tag_list option)
    ?resource_identifier:(resource_identifier_ : string_ option)
    ?supplemental_settings:(supplemental_settings_ : string_ option)
    ?replication_settings:(replication_settings_ : string_ option)
    ~table_mappings:(table_mappings_ : string_)
    ~replication_type:(replication_type_ : migration_type_value)
    ~compute_config:(compute_config_ : compute_config)
    ~target_endpoint_arn:(target_endpoint_arn_ : string_)
    ~source_endpoint_arn:(source_endpoint_arn_ : string_)
    ~replication_config_identifier:(replication_config_identifier_ : string_) () =
  ({
     tags = tags_;
     resource_identifier = resource_identifier_;
     supplemental_settings = supplemental_settings_;
     replication_settings = replication_settings_;
     table_mappings = table_mappings_;
     replication_type = replication_type_;
     compute_config = compute_config_;
     target_endpoint_arn = target_endpoint_arn_;
     source_endpoint_arn = source_endpoint_arn_;
     replication_config_identifier = replication_config_identifier_;
   }
    : create_replication_config_message)

let make_create_migration_project_response
    ?migration_project:(migration_project_ : migration_project option) () =
  ({ migration_project = migration_project_ } : create_migration_project_response)

let make_create_migration_project_message
    ?schema_conversion_application_attributes:
      (schema_conversion_application_attributes_ : sc_application_attributes option)
    ?tags:(tags_ : tag_list option) ?description:(description_ : string_ option)
    ?transformation_rules:(transformation_rules_ : string_ option)
    ?migration_project_name:(migration_project_name_ : string_ option)
    ~instance_profile_identifier:(instance_profile_identifier_ : string_)
    ~target_data_provider_descriptors:
      (target_data_provider_descriptors_ : data_provider_descriptor_definition_list)
    ~source_data_provider_descriptors:
      (source_data_provider_descriptors_ : data_provider_descriptor_definition_list) () =
  ({
     schema_conversion_application_attributes = schema_conversion_application_attributes_;
     tags = tags_;
     description = description_;
     transformation_rules = transformation_rules_;
     instance_profile_identifier = instance_profile_identifier_;
     target_data_provider_descriptors = target_data_provider_descriptors_;
     source_data_provider_descriptors = source_data_provider_descriptors_;
     migration_project_name = migration_project_name_;
   }
    : create_migration_project_message)

let make_create_instance_profile_response
    ?instance_profile:(instance_profile_ : instance_profile option) () =
  ({ instance_profile = instance_profile_ } : create_instance_profile_response)

let make_create_instance_profile_message
    ?vpc_security_groups:(vpc_security_groups_ : string_list option)
    ?subnet_group_identifier:(subnet_group_identifier_ : string_ option)
    ?description:(description_ : string_ option)
    ?instance_profile_name:(instance_profile_name_ : string_ option)
    ?network_type:(network_type_ : string_ option) ?tags:(tags_ : tag_list option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?kms_key_arn:(kms_key_arn_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option) () =
  ({
     vpc_security_groups = vpc_security_groups_;
     subnet_group_identifier = subnet_group_identifier_;
     description = description_;
     instance_profile_name = instance_profile_name_;
     network_type = network_type_;
     tags = tags_;
     publicly_accessible = publicly_accessible_;
     kms_key_arn = kms_key_arn_;
     availability_zone = availability_zone_;
   }
    : create_instance_profile_message)

let make_create_fleet_advisor_collector_response ?s3_bucket_name:(s3_bucket_name_ : string_ option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?description:(description_ : string_ option) ?collector_name:(collector_name_ : string_ option)
    ?collector_referenced_id:(collector_referenced_id_ : string_ option) () =
  ({
     s3_bucket_name = s3_bucket_name_;
     service_access_role_arn = service_access_role_arn_;
     description = description_;
     collector_name = collector_name_;
     collector_referenced_id = collector_referenced_id_;
   }
    : create_fleet_advisor_collector_response)

let make_create_fleet_advisor_collector_request ?description:(description_ : string_ option)
    ~s3_bucket_name:(s3_bucket_name_ : string_)
    ~service_access_role_arn:(service_access_role_arn_ : string_)
    ~collector_name:(collector_name_ : string_) () =
  ({
     s3_bucket_name = s3_bucket_name_;
     service_access_role_arn = service_access_role_arn_;
     description = description_;
     collector_name = collector_name_;
   }
    : create_fleet_advisor_collector_request)

let make_create_event_subscription_response
    ?event_subscription:(event_subscription_ : event_subscription option) () =
  ({ event_subscription = event_subscription_ } : create_event_subscription_response)

let make_create_event_subscription_message ?tags:(tags_ : tag_list option)
    ?enabled:(enabled_ : boolean_optional option) ?source_ids:(source_ids_ : source_ids_list option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?source_type:(source_type_ : string_ option) ~sns_topic_arn:(sns_topic_arn_ : string_)
    ~subscription_name:(subscription_name_ : string_) () =
  ({
     tags = tags_;
     enabled = enabled_;
     source_ids = source_ids_;
     event_categories = event_categories_;
     source_type = source_type_;
     sns_topic_arn = sns_topic_arn_;
     subscription_name = subscription_name_;
   }
    : create_event_subscription_message)

let make_create_endpoint_response ?endpoint:(endpoint_ : endpoint option) () =
  ({ endpoint = endpoint_ } : create_endpoint_response)

let make_create_endpoint_message
    ?timestream_settings:(timestream_settings_ : timestream_settings option)
    ?gcp_my_sql_settings:(gcp_my_sql_settings_ : gcp_my_sql_settings option)
    ?redis_settings:(redis_settings_ : redis_settings option)
    ?doc_db_settings:(doc_db_settings_ : doc_db_settings option)
    ?resource_identifier:(resource_identifier_ : string_ option)
    ?ibm_db2_settings:(ibm_db2_settings_ : ibm_db2_settings option)
    ?microsoft_sql_server_settings:
      (microsoft_sql_server_settings_ : microsoft_sql_server_settings option)
    ?sybase_settings:(sybase_settings_ : sybase_settings option)
    ?oracle_settings:(oracle_settings_ : oracle_settings option)
    ?my_sql_settings:(my_sql_settings_ : my_sql_settings option)
    ?postgre_sql_settings:(postgre_sql_settings_ : postgre_sql_settings option)
    ?redshift_settings:(redshift_settings_ : redshift_settings option)
    ?neptune_settings:(neptune_settings_ : neptune_settings option)
    ?elasticsearch_settings:(elasticsearch_settings_ : elasticsearch_settings option)
    ?kafka_settings:(kafka_settings_ : kafka_settings option)
    ?kinesis_settings:(kinesis_settings_ : kinesis_settings option)
    ?mongo_db_settings:(mongo_db_settings_ : mongo_db_settings option)
    ?dms_transfer_settings:(dms_transfer_settings_ : dms_transfer_settings option)
    ?s3_settings:(s3_settings_ : s3_settings option)
    ?dynamo_db_settings:(dynamo_db_settings_ : dynamo_db_settings option)
    ?external_table_definition:(external_table_definition_ : string_ option)
    ?service_access_role_arn:(service_access_role_arn_ : string_ option)
    ?ssl_mode:(ssl_mode_ : dms_ssl_mode_value option)
    ?certificate_arn:(certificate_arn_ : string_ option) ?tags:(tags_ : tag_list option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?extra_connection_attributes:(extra_connection_attributes_ : string_ option)
    ?database_name:(database_name_ : string_ option) ?port:(port_ : integer_optional option)
    ?server_name:(server_name_ : string_ option) ?password:(password_ : secret_string option)
    ?username:(username_ : string_ option) ~engine_name:(engine_name_ : string_)
    ~endpoint_type:(endpoint_type_ : replication_endpoint_type_value)
    ~endpoint_identifier:(endpoint_identifier_ : string_) () =
  ({
     timestream_settings = timestream_settings_;
     gcp_my_sql_settings = gcp_my_sql_settings_;
     redis_settings = redis_settings_;
     doc_db_settings = doc_db_settings_;
     resource_identifier = resource_identifier_;
     ibm_db2_settings = ibm_db2_settings_;
     microsoft_sql_server_settings = microsoft_sql_server_settings_;
     sybase_settings = sybase_settings_;
     oracle_settings = oracle_settings_;
     my_sql_settings = my_sql_settings_;
     postgre_sql_settings = postgre_sql_settings_;
     redshift_settings = redshift_settings_;
     neptune_settings = neptune_settings_;
     elasticsearch_settings = elasticsearch_settings_;
     kafka_settings = kafka_settings_;
     kinesis_settings = kinesis_settings_;
     mongo_db_settings = mongo_db_settings_;
     dms_transfer_settings = dms_transfer_settings_;
     s3_settings = s3_settings_;
     dynamo_db_settings = dynamo_db_settings_;
     external_table_definition = external_table_definition_;
     service_access_role_arn = service_access_role_arn_;
     ssl_mode = ssl_mode_;
     certificate_arn = certificate_arn_;
     tags = tags_;
     kms_key_id = kms_key_id_;
     extra_connection_attributes = extra_connection_attributes_;
     database_name = database_name_;
     port = port_;
     server_name = server_name_;
     password = password_;
     username = username_;
     engine_name = engine_name_;
     endpoint_type = endpoint_type_;
     endpoint_identifier = endpoint_identifier_;
   }
    : create_endpoint_message)

let make_create_data_provider_response ?data_provider:(data_provider_ : data_provider option) () =
  ({ data_provider = data_provider_ } : create_data_provider_response)

let make_create_data_provider_message ?tags:(tags_ : tag_list option)
    ?\#virtual:(virtual_ : boolean_optional option) ?description:(description_ : string_ option)
    ?data_provider_name:(data_provider_name_ : string_ option)
    ~settings:(settings_ : data_provider_settings) ~engine:(engine_ : string_) () =
  ({
     tags = tags_;
     settings = settings_;
     \#virtual = virtual_;
     engine = engine_;
     description = description_;
     data_provider_name = data_provider_name_;
   }
    : create_data_provider_message)

let make_create_data_migration_response ?data_migration:(data_migration_ : data_migration option) ()
    =
  ({ data_migration = data_migration_ } : create_data_migration_response)

let make_create_data_migration_message ?selection_rules:(selection_rules_ : secret_string option)
    ?tags:(tags_ : tag_list option) ?number_of_jobs:(number_of_jobs_ : integer_optional option)
    ?target_data_settings:(target_data_settings_ : target_data_settings option)
    ?source_data_settings:(source_data_settings_ : source_data_settings option)
    ?enable_cloudwatch_logs:(enable_cloudwatch_logs_ : boolean_optional option)
    ?data_migration_name:(data_migration_name_ : string_ option)
    ~service_access_role_arn:(service_access_role_arn_ : string_)
    ~data_migration_type:(data_migration_type_ : migration_type_value)
    ~migration_project_identifier:(migration_project_identifier_ : string_) () =
  ({
     selection_rules = selection_rules_;
     tags = tags_;
     number_of_jobs = number_of_jobs_;
     target_data_settings = target_data_settings_;
     source_data_settings = source_data_settings_;
     enable_cloudwatch_logs = enable_cloudwatch_logs_;
     service_access_role_arn = service_access_role_arn_;
     data_migration_type = data_migration_type_;
     migration_project_identifier = migration_project_identifier_;
     data_migration_name = data_migration_name_;
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

let make_cancel_metadata_model_creation_message ~request_identifier:(request_identifier_ : string_)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     request_identifier = request_identifier_;
     migration_project_identifier = migration_project_identifier_;
   }
    : cancel_metadata_model_creation_message)

let make_cancel_metadata_model_conversion_response
    ?request:(request_ : schema_conversion_request option) () =
  ({ request = request_ } : cancel_metadata_model_conversion_response)

let make_cancel_metadata_model_conversion_message
    ~request_identifier:(request_identifier_ : string_)
    ~migration_project_identifier:(migration_project_identifier_ : migration_project_identifier) ()
    =
  ({
     request_identifier = request_identifier_;
     migration_project_identifier = migration_project_identifier_;
   }
    : cancel_metadata_model_conversion_message)

let make_batch_start_recommendations_error_entry ?code:(code_ : string_ option)
    ?message:(message_ : string_ option) ?database_id:(database_id_ : string_ option) () =
  ({ code = code_; message = message_; database_id = database_id_ }
    : batch_start_recommendations_error_entry)

let make_batch_start_recommendations_response
    ?error_entries:(error_entries_ : batch_start_recommendations_error_entry_list option) () =
  ({ error_entries = error_entries_ } : batch_start_recommendations_response)

let make_batch_start_recommendations_request
    ?data:(data_ : start_recommendations_request_entry_list option) () =
  ({ data = data_ } : batch_start_recommendations_request)

let make_apply_pending_maintenance_action_response
    ?resource_pending_maintenance_actions:
      (resource_pending_maintenance_actions_ : resource_pending_maintenance_actions option) () =
  ({ resource_pending_maintenance_actions = resource_pending_maintenance_actions_ }
    : apply_pending_maintenance_action_response)

let make_apply_pending_maintenance_action_message ~opt_in_type:(opt_in_type_ : string_)
    ~apply_action:(apply_action_ : string_)
    ~replication_instance_arn:(replication_instance_arn_ : string_) () =
  ({
     opt_in_type = opt_in_type_;
     apply_action = apply_action_;
     replication_instance_arn = replication_instance_arn_;
   }
    : apply_pending_maintenance_action_message)

let make_add_tags_to_resource_response () = (() : unit)

let make_add_tags_to_resource_message ~tags:(tags_ : tag_list)
    ~resource_arn:(resource_arn_ : string_) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : add_tags_to_resource_message)
