open Smaws_Lib
open Types
let make_zeppelin_monitoring_configuration_update
  ~log_level_update:(log_level_update_ : log_level) () =
  ({ log_level_update = log_level_update_ } : zeppelin_monitoring_configuration_update)
let make_zeppelin_monitoring_configuration_description
  ?log_level:(log_level_ : log_level option) () =
  ({ log_level = log_level_ } : zeppelin_monitoring_configuration_description)
let make_zeppelin_monitoring_configuration
  ~log_level:(log_level_ : log_level) () =
  ({ log_level = log_level_ } : zeppelin_monitoring_configuration)
let make_glue_data_catalog_configuration_update
  ~database_arn_update:(database_arn_update_ : string) () =
  ({ database_arn_update = database_arn_update_ } : glue_data_catalog_configuration_update)
let make_catalog_configuration_update
  ~glue_data_catalog_configuration_update:(glue_data_catalog_configuration_update_
                                            :
                                            glue_data_catalog_configuration_update)
  () =
  ({
     glue_data_catalog_configuration_update =
       glue_data_catalog_configuration_update_
   } : catalog_configuration_update)
let make_s3_content_base_location_update
  ?base_path_update:(base_path_update_ : string option)
  ?bucket_arn_update:(bucket_arn_update_ : string option) () =
  ({
     base_path_update = base_path_update_;
     bucket_arn_update = bucket_arn_update_
   } : s3_content_base_location_update)
let make_deploy_as_application_configuration_update
  ?s3_content_location_update:(s3_content_location_update_ :
                                s3_content_base_location_update option)
  () =
  ({ s3_content_location_update = s3_content_location_update_ } : deploy_as_application_configuration_update)
let make_s3_content_location
  ?object_version:(object_version_ : string option)
  ~file_key:(file_key_ : string) ~bucket_ar_n:(bucket_ar_n_ : string) () =
  ({
     object_version = object_version_;
     file_key = file_key_;
     bucket_ar_n = bucket_ar_n_
   } : s3_content_location)
let make_maven_reference ~version:(version_ : string)
  ~artifact_id:(artifact_id_ : string) ~group_id:(group_id_ : string) () =
  ({ version = version_; artifact_id = artifact_id_; group_id = group_id_ } : 
  maven_reference)
let make_custom_artifact_configuration
  ?maven_reference:(maven_reference_ : maven_reference option)
  ?s3_content_location:(s3_content_location_ : s3_content_location option)
  ~artifact_type:(artifact_type_ : artifact_type) () =
  ({
     maven_reference = maven_reference_;
     s3_content_location = s3_content_location_;
     artifact_type = artifact_type_
   } : custom_artifact_configuration)
let make_zeppelin_application_configuration_update
  ?custom_artifacts_configuration_update:(custom_artifacts_configuration_update_
                                           :
                                           custom_artifact_configuration list
                                             option)
  ?deploy_as_application_configuration_update:(deploy_as_application_configuration_update_
                                                :
                                                deploy_as_application_configuration_update
                                                  option)
  ?catalog_configuration_update:(catalog_configuration_update_ :
                                  catalog_configuration_update option)
  ?monitoring_configuration_update:(monitoring_configuration_update_ :
                                     zeppelin_monitoring_configuration_update
                                       option)
  () =
  ({
     custom_artifacts_configuration_update =
       custom_artifacts_configuration_update_;
     deploy_as_application_configuration_update =
       deploy_as_application_configuration_update_;
     catalog_configuration_update = catalog_configuration_update_;
     monitoring_configuration_update = monitoring_configuration_update_
   } : zeppelin_application_configuration_update)
let make_glue_data_catalog_configuration_description
  ~database_ar_n:(database_ar_n_ : string) () =
  ({ database_ar_n = database_ar_n_ } : glue_data_catalog_configuration_description)
let make_catalog_configuration_description
  ~glue_data_catalog_configuration_description:(glue_data_catalog_configuration_description_
                                                 :
                                                 glue_data_catalog_configuration_description)
  () =
  ({
     glue_data_catalog_configuration_description =
       glue_data_catalog_configuration_description_
   } : catalog_configuration_description)
let make_s3_content_base_location_description
  ?base_path:(base_path_ : string option)
  ~bucket_ar_n:(bucket_ar_n_ : string) () =
  ({ base_path = base_path_; bucket_ar_n = bucket_ar_n_ } : s3_content_base_location_description)
let make_deploy_as_application_configuration_description
  ~s3_content_location_description:(s3_content_location_description_ :
                                     s3_content_base_location_description)
  () =
  ({ s3_content_location_description = s3_content_location_description_ } : 
  deploy_as_application_configuration_description)
let make_custom_artifact_configuration_description
  ?maven_reference_description:(maven_reference_description_ :
                                 maven_reference option)
  ?s3_content_location_description:(s3_content_location_description_ :
                                     s3_content_location option)
  ?artifact_type:(artifact_type_ : artifact_type option) () =
  ({
     maven_reference_description = maven_reference_description_;
     s3_content_location_description = s3_content_location_description_;
     artifact_type = artifact_type_
   } : custom_artifact_configuration_description)
let make_zeppelin_application_configuration_description
  ?custom_artifacts_configuration_description:(custom_artifacts_configuration_description_
                                                :
                                                custom_artifact_configuration_description
                                                  list option)
  ?deploy_as_application_configuration_description:(deploy_as_application_configuration_description_
                                                     :
                                                     deploy_as_application_configuration_description
                                                       option)
  ?catalog_configuration_description:(catalog_configuration_description_ :
                                       catalog_configuration_description
                                         option)
  ~monitoring_configuration_description:(monitoring_configuration_description_
                                          :
                                          zeppelin_monitoring_configuration_description)
  () =
  ({
     custom_artifacts_configuration_description =
       custom_artifacts_configuration_description_;
     deploy_as_application_configuration_description =
       deploy_as_application_configuration_description_;
     catalog_configuration_description = catalog_configuration_description_;
     monitoring_configuration_description =
       monitoring_configuration_description_
   } : zeppelin_application_configuration_description)
let make_glue_data_catalog_configuration
  ~database_ar_n:(database_ar_n_ : string) () =
  ({ database_ar_n = database_ar_n_ } : glue_data_catalog_configuration)
let make_catalog_configuration
  ~glue_data_catalog_configuration:(glue_data_catalog_configuration_ :
                                     glue_data_catalog_configuration)
  () =
  ({ glue_data_catalog_configuration = glue_data_catalog_configuration_ } : 
  catalog_configuration)
let make_s3_content_base_location ?base_path:(base_path_ : string option)
  ~bucket_ar_n:(bucket_ar_n_ : string) () =
  ({ base_path = base_path_; bucket_ar_n = bucket_ar_n_ } : s3_content_base_location)
let make_deploy_as_application_configuration
  ~s3_content_location:(s3_content_location_ : s3_content_base_location) () =
  ({ s3_content_location = s3_content_location_ } : deploy_as_application_configuration)
let make_zeppelin_application_configuration
  ?custom_artifacts_configuration:(custom_artifacts_configuration_ :
                                    custom_artifact_configuration list option)
  ?deploy_as_application_configuration:(deploy_as_application_configuration_
                                         :
                                         deploy_as_application_configuration
                                           option)
  ?catalog_configuration:(catalog_configuration_ :
                           catalog_configuration option)
  ?monitoring_configuration:(monitoring_configuration_ :
                              zeppelin_monitoring_configuration option)
  () =
  ({
     custom_artifacts_configuration = custom_artifacts_configuration_;
     deploy_as_application_configuration =
       deploy_as_application_configuration_;
     catalog_configuration = catalog_configuration_;
     monitoring_configuration = monitoring_configuration_
   } : zeppelin_application_configuration)
let make_vpc_configuration
  ~security_group_ids:(security_group_ids_ : string list)
  ~subnet_ids:(subnet_ids_ : string list) () =
  ({ security_group_ids = security_group_ids_; subnet_ids = subnet_ids_ } : 
  vpc_configuration)
let make_vpc_configuration_update
  ?security_group_id_updates:(security_group_id_updates_ :
                               string list option)
  ?subnet_id_updates:(subnet_id_updates_ : string list option)
  ~vpc_configuration_id:(vpc_configuration_id_ : string) () =
  ({
     security_group_id_updates = security_group_id_updates_;
     subnet_id_updates = subnet_id_updates_;
     vpc_configuration_id = vpc_configuration_id_
   } : vpc_configuration_update)
let make_vpc_configuration_description
  ~security_group_ids:(security_group_ids_ : string list)
  ~subnet_ids:(subnet_ids_ : string list) ~vpc_id:(vpc_id_ : string)
  ~vpc_configuration_id:(vpc_configuration_id_ : string) () =
  ({
     security_group_ids = security_group_ids_;
     subnet_ids = subnet_ids_;
     vpc_id = vpc_id_;
     vpc_configuration_id = vpc_configuration_id_
   } : vpc_configuration_description)
let make_input_lambda_processor_description
  ?role_ar_n:(role_ar_n_ : string option)
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : input_lambda_processor_description)
let make_input_processing_configuration_description
  ?input_lambda_processor_description:(input_lambda_processor_description_ :
                                        input_lambda_processor_description
                                          option)
  () =
  ({ input_lambda_processor_description = input_lambda_processor_description_
   } : input_processing_configuration_description)
let make_kinesis_streams_input_description
  ?role_ar_n:(role_ar_n_ : string option)
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : kinesis_streams_input_description)
let make_kinesis_firehose_input_description
  ?role_ar_n:(role_ar_n_ : string option)
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : kinesis_firehose_input_description)
let make_json_mapping_parameters ~record_row_path:(record_row_path_ : string)
  () = ({ record_row_path = record_row_path_ } : json_mapping_parameters)
let make_csv_mapping_parameters
  ~record_column_delimiter:(record_column_delimiter_ : string)
  ~record_row_delimiter:(record_row_delimiter_ : string) () =
  ({
     record_column_delimiter = record_column_delimiter_;
     record_row_delimiter = record_row_delimiter_
   } : csv_mapping_parameters)
let make_mapping_parameters
  ?csv_mapping_parameters:(csv_mapping_parameters_ :
                            csv_mapping_parameters option)
  ?json_mapping_parameters:(json_mapping_parameters_ :
                             json_mapping_parameters option)
  () =
  ({
     csv_mapping_parameters = csv_mapping_parameters_;
     json_mapping_parameters = json_mapping_parameters_
   } : mapping_parameters)
let make_record_format
  ?mapping_parameters:(mapping_parameters_ : mapping_parameters option)
  ~record_format_type:(record_format_type_ : record_format_type) () =
  ({
     mapping_parameters = mapping_parameters_;
     record_format_type = record_format_type_
   } : record_format)
let make_record_column ?mapping:(mapping_ : string option)
  ~sql_type:(sql_type_ : string) ~name:(name_ : string) () =
  ({ sql_type = sql_type_; mapping = mapping_; name = name_ } : record_column)
let make_source_schema ?record_encoding:(record_encoding_ : string option)
  ~record_columns:(record_columns_ : record_column list)
  ~record_format:(record_format_ : record_format) () =
  ({
     record_columns = record_columns_;
     record_encoding = record_encoding_;
     record_format = record_format_
   } : source_schema)
let make_input_parallelism ?count:(count_ : int option) () =
  ({ count = count_ } : input_parallelism)
let make_input_starting_position_configuration
  ?input_starting_position:(input_starting_position_ :
                             input_starting_position option)
  () =
  ({ input_starting_position = input_starting_position_ } : input_starting_position_configuration)
let make_input_description
  ?input_starting_position_configuration:(input_starting_position_configuration_
                                           :
                                           input_starting_position_configuration
                                             option)
  ?input_parallelism:(input_parallelism_ : input_parallelism option)
  ?input_schema:(input_schema_ : source_schema option)
  ?kinesis_firehose_input_description:(kinesis_firehose_input_description_ :
                                        kinesis_firehose_input_description
                                          option)
  ?kinesis_streams_input_description:(kinesis_streams_input_description_ :
                                       kinesis_streams_input_description
                                         option)
  ?input_processing_configuration_description:(input_processing_configuration_description_
                                                :
                                                input_processing_configuration_description
                                                  option)
  ?in_app_stream_names:(in_app_stream_names_ : string list option)
  ?name_prefix:(name_prefix_ : string option)
  ?input_id:(input_id_ : string option) () =
  ({
     input_starting_position_configuration =
       input_starting_position_configuration_;
     input_parallelism = input_parallelism_;
     input_schema = input_schema_;
     kinesis_firehose_input_description = kinesis_firehose_input_description_;
     kinesis_streams_input_description = kinesis_streams_input_description_;
     input_processing_configuration_description =
       input_processing_configuration_description_;
     in_app_stream_names = in_app_stream_names_;
     name_prefix = name_prefix_;
     input_id = input_id_
   } : input_description)
let make_kinesis_streams_output_description
  ?role_ar_n:(role_ar_n_ : string option)
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : kinesis_streams_output_description)
let make_kinesis_firehose_output_description
  ?role_ar_n:(role_ar_n_ : string option)
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : kinesis_firehose_output_description)
let make_lambda_output_description ?role_ar_n:(role_ar_n_ : string option)
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : lambda_output_description)
let make_destination_schema
  ~record_format_type:(record_format_type_ : record_format_type) () =
  ({ record_format_type = record_format_type_ } : destination_schema)
let make_output_description
  ?destination_schema:(destination_schema_ : destination_schema option)
  ?lambda_output_description:(lambda_output_description_ :
                               lambda_output_description option)
  ?kinesis_firehose_output_description:(kinesis_firehose_output_description_
                                         :
                                         kinesis_firehose_output_description
                                           option)
  ?kinesis_streams_output_description:(kinesis_streams_output_description_ :
                                        kinesis_streams_output_description
                                          option)
  ?name:(name_ : string option) ?output_id:(output_id_ : string option) () =
  ({
     destination_schema = destination_schema_;
     lambda_output_description = lambda_output_description_;
     kinesis_firehose_output_description =
       kinesis_firehose_output_description_;
     kinesis_streams_output_description = kinesis_streams_output_description_;
     name = name_;
     output_id = output_id_
   } : output_description)
let make_s3_reference_data_source_description
  ?reference_role_ar_n:(reference_role_ar_n_ : string option)
  ~file_key:(file_key_ : string) ~bucket_ar_n:(bucket_ar_n_ : string) () =
  ({
     reference_role_ar_n = reference_role_ar_n_;
     file_key = file_key_;
     bucket_ar_n = bucket_ar_n_
   } : s3_reference_data_source_description)
let make_reference_data_source_description
  ?reference_schema:(reference_schema_ : source_schema option)
  ~s3_reference_data_source_description:(s3_reference_data_source_description_
                                          :
                                          s3_reference_data_source_description)
  ~table_name:(table_name_ : string) ~reference_id:(reference_id_ : string)
  () =
  ({
     reference_schema = reference_schema_;
     s3_reference_data_source_description =
       s3_reference_data_source_description_;
     table_name = table_name_;
     reference_id = reference_id_
   } : reference_data_source_description)
let make_sql_application_configuration_description
  ?reference_data_source_descriptions:(reference_data_source_descriptions_ :
                                        reference_data_source_description
                                          list option)
  ?output_descriptions:(output_descriptions_ :
                         output_description list option)
  ?input_descriptions:(input_descriptions_ : input_description list option)
  () =
  ({
     reference_data_source_descriptions = reference_data_source_descriptions_;
     output_descriptions = output_descriptions_;
     input_descriptions = input_descriptions_
   } : sql_application_configuration_description)
let make_s3_application_code_location_description
  ?object_version:(object_version_ : string option)
  ~file_key:(file_key_ : string) ~bucket_ar_n:(bucket_ar_n_ : string) () =
  ({
     object_version = object_version_;
     file_key = file_key_;
     bucket_ar_n = bucket_ar_n_
   } : s3_application_code_location_description)
let make_code_content_description
  ?s3_application_code_location_description:(s3_application_code_location_description_
                                              :
                                              s3_application_code_location_description
                                                option)
  ?code_size:(code_size_ : int option)
  ?code_m_d5:(code_m_d5_ : string option)
  ?text_content:(text_content_ : string option) () =
  ({
     s3_application_code_location_description =
       s3_application_code_location_description_;
     code_size = code_size_;
     code_m_d5 = code_m_d5_;
     text_content = text_content_
   } : code_content_description)
let make_application_code_configuration_description
  ?code_content_description:(code_content_description_ :
                              code_content_description option)
  ~code_content_type:(code_content_type_ : code_content_type) () =
  ({
     code_content_description = code_content_description_;
     code_content_type = code_content_type_
   } : application_code_configuration_description)
let make_application_restore_configuration
  ?snapshot_name:(snapshot_name_ : string option)
  ~application_restore_type:(application_restore_type_ :
                              application_restore_type)
  () =
  ({
     snapshot_name = snapshot_name_;
     application_restore_type = application_restore_type_
   } : application_restore_configuration)
let make_flink_run_configuration
  ?allow_non_restored_state:(allow_non_restored_state_ : bool option) () =
  ({ allow_non_restored_state = allow_non_restored_state_ } : flink_run_configuration)
let make_run_configuration_description
  ?flink_run_configuration_description:(flink_run_configuration_description_
                                         : flink_run_configuration option)
  ?application_restore_configuration_description:(application_restore_configuration_description_
                                                   :
                                                   application_restore_configuration
                                                     option)
  () =
  ({
     flink_run_configuration_description =
       flink_run_configuration_description_;
     application_restore_configuration_description =
       application_restore_configuration_description_
   } : run_configuration_description)
let make_checkpoint_configuration_description
  ?min_pause_between_checkpoints:(min_pause_between_checkpoints_ :
                                   int option)
  ?checkpoint_interval:(checkpoint_interval_ : int option)
  ?checkpointing_enabled:(checkpointing_enabled_ : bool option)
  ?configuration_type:(configuration_type_ : configuration_type option) () =
  ({
     min_pause_between_checkpoints = min_pause_between_checkpoints_;
     checkpoint_interval = checkpoint_interval_;
     checkpointing_enabled = checkpointing_enabled_;
     configuration_type = configuration_type_
   } : checkpoint_configuration_description)
let make_monitoring_configuration_description
  ?log_level:(log_level_ : log_level option)
  ?metrics_level:(metrics_level_ : metrics_level option)
  ?configuration_type:(configuration_type_ : configuration_type option) () =
  ({
     log_level = log_level_;
     metrics_level = metrics_level_;
     configuration_type = configuration_type_
   } : monitoring_configuration_description)
let make_parallelism_configuration_description
  ?auto_scaling_enabled:(auto_scaling_enabled_ : bool option)
  ?current_parallelism:(current_parallelism_ : int option)
  ?parallelism_per_kp_u:(parallelism_per_kp_u_ : int option)
  ?parallelism:(parallelism_ : int option)
  ?configuration_type:(configuration_type_ : configuration_type option) () =
  ({
     auto_scaling_enabled = auto_scaling_enabled_;
     current_parallelism = current_parallelism_;
     parallelism_per_kp_u = parallelism_per_kp_u_;
     parallelism = parallelism_;
     configuration_type = configuration_type_
   } : parallelism_configuration_description)
let make_flink_application_configuration_description
  ?job_plan_description:(job_plan_description_ : string option)
  ?parallelism_configuration_description:(parallelism_configuration_description_
                                           :
                                           parallelism_configuration_description
                                             option)
  ?monitoring_configuration_description:(monitoring_configuration_description_
                                          :
                                          monitoring_configuration_description
                                            option)
  ?checkpoint_configuration_description:(checkpoint_configuration_description_
                                          :
                                          checkpoint_configuration_description
                                            option)
  () =
  ({
     job_plan_description = job_plan_description_;
     parallelism_configuration_description =
       parallelism_configuration_description_;
     monitoring_configuration_description =
       monitoring_configuration_description_;
     checkpoint_configuration_description =
       checkpoint_configuration_description_
   } : flink_application_configuration_description)
let make_property_group ~property_map:(property_map_ : property_map)
  ~property_group_id:(property_group_id_ : string) () =
  ({ property_map = property_map_; property_group_id = property_group_id_ } : 
  property_group)
let make_environment_property_descriptions
  ?property_group_descriptions:(property_group_descriptions_ :
                                 property_group list option)
  () =
  ({ property_group_descriptions = property_group_descriptions_ } : environment_property_descriptions)
let make_application_snapshot_configuration_description
  ~snapshots_enabled:(snapshots_enabled_ : bool) () =
  ({ snapshots_enabled = snapshots_enabled_ } : application_snapshot_configuration_description)
let make_application_system_rollback_configuration_description
  ~rollback_enabled:(rollback_enabled_ : bool) () =
  ({ rollback_enabled = rollback_enabled_ } : application_system_rollback_configuration_description)
let make_application_configuration_description
  ?zeppelin_application_configuration_description:(zeppelin_application_configuration_description_
                                                    :
                                                    zeppelin_application_configuration_description
                                                      option)
  ?vpc_configuration_descriptions:(vpc_configuration_descriptions_ :
                                    vpc_configuration_description list option)
  ?application_system_rollback_configuration_description:(application_system_rollback_configuration_description_
                                                           :
                                                           application_system_rollback_configuration_description
                                                             option)
  ?application_snapshot_configuration_description:(application_snapshot_configuration_description_
                                                    :
                                                    application_snapshot_configuration_description
                                                      option)
  ?environment_property_descriptions:(environment_property_descriptions_ :
                                       environment_property_descriptions
                                         option)
  ?flink_application_configuration_description:(flink_application_configuration_description_
                                                 :
                                                 flink_application_configuration_description
                                                   option)
  ?run_configuration_description:(run_configuration_description_ :
                                   run_configuration_description option)
  ?application_code_configuration_description:(application_code_configuration_description_
                                                :
                                                application_code_configuration_description
                                                  option)
  ?sql_application_configuration_description:(sql_application_configuration_description_
                                               :
                                               sql_application_configuration_description
                                                 option)
  () =
  ({
     zeppelin_application_configuration_description =
       zeppelin_application_configuration_description_;
     vpc_configuration_descriptions = vpc_configuration_descriptions_;
     application_system_rollback_configuration_description =
       application_system_rollback_configuration_description_;
     application_snapshot_configuration_description =
       application_snapshot_configuration_description_;
     environment_property_descriptions = environment_property_descriptions_;
     flink_application_configuration_description =
       flink_application_configuration_description_;
     run_configuration_description = run_configuration_description_;
     application_code_configuration_description =
       application_code_configuration_description_;
     sql_application_configuration_description =
       sql_application_configuration_description_
   } : application_configuration_description)
let make_cloud_watch_logging_option_description
  ?role_ar_n:(role_ar_n_ : string option)
  ?cloud_watch_logging_option_id:(cloud_watch_logging_option_id_ :
                                   string option)
  ~log_stream_ar_n:(log_stream_ar_n_ : string) () =
  ({
     role_ar_n = role_ar_n_;
     log_stream_ar_n = log_stream_ar_n_;
     cloud_watch_logging_option_id = cloud_watch_logging_option_id_
   } : cloud_watch_logging_option_description)
let make_application_maintenance_configuration_description
  ~application_maintenance_window_end_time:(application_maintenance_window_end_time_
                                             : string)
  ~application_maintenance_window_start_time:(application_maintenance_window_start_time_
                                               : string)
  () =
  ({
     application_maintenance_window_end_time =
       application_maintenance_window_end_time_;
     application_maintenance_window_start_time =
       application_maintenance_window_start_time_
   } : application_maintenance_configuration_description)
let make_application_detail
  ?application_mode:(application_mode_ : application_mode option)
  ?application_version_rolled_back_to:(application_version_rolled_back_to_ :
                                        int option)
  ?conditional_token:(conditional_token_ : string option)
  ?application_version_create_timestamp:(application_version_create_timestamp_
                                          : CoreTypes.Timestamp.t option)
  ?application_version_rolled_back_from:(application_version_rolled_back_from_
                                          : int option)
  ?application_version_updated_from:(application_version_updated_from_ :
                                      int option)
  ?application_maintenance_configuration_description:(application_maintenance_configuration_description_
                                                       :
                                                       application_maintenance_configuration_description
                                                         option)
  ?cloud_watch_logging_option_descriptions:(cloud_watch_logging_option_descriptions_
                                             :
                                             cloud_watch_logging_option_description
                                               list option)
  ?application_configuration_description:(application_configuration_description_
                                           :
                                           application_configuration_description
                                             option)
  ?last_update_timestamp:(last_update_timestamp_ :
                           CoreTypes.Timestamp.t option)
  ?create_timestamp:(create_timestamp_ : CoreTypes.Timestamp.t option)
  ?service_execution_role:(service_execution_role_ : string option)
  ?application_description:(application_description_ : string option)
  ~application_version_id:(application_version_id_ : int)
  ~application_status:(application_status_ : application_status)
  ~runtime_environment:(runtime_environment_ : runtime_environment)
  ~application_name:(application_name_ : string)
  ~application_ar_n:(application_ar_n_ : string) () =
  ({
     application_mode = application_mode_;
     application_version_rolled_back_to = application_version_rolled_back_to_;
     conditional_token = conditional_token_;
     application_version_create_timestamp =
       application_version_create_timestamp_;
     application_version_rolled_back_from =
       application_version_rolled_back_from_;
     application_version_updated_from = application_version_updated_from_;
     application_maintenance_configuration_description =
       application_maintenance_configuration_description_;
     cloud_watch_logging_option_descriptions =
       cloud_watch_logging_option_descriptions_;
     application_configuration_description =
       application_configuration_description_;
     last_update_timestamp = last_update_timestamp_;
     create_timestamp = create_timestamp_;
     application_version_id = application_version_id_;
     application_status = application_status_;
     service_execution_role = service_execution_role_;
     runtime_environment = runtime_environment_;
     application_name = application_name_;
     application_description = application_description_;
     application_ar_n = application_ar_n_
   } : application_detail)
let make_update_application_response
  ?operation_id:(operation_id_ : string option)
  ~application_detail:(application_detail_ : application_detail) () =
  ({ operation_id = operation_id_; application_detail = application_detail_ } : 
  update_application_response)
let make_input_lambda_processor_update
  ~resource_arn_update:(resource_arn_update_ : string) () =
  ({ resource_arn_update = resource_arn_update_ } : input_lambda_processor_update)
let make_input_processing_configuration_update
  ~input_lambda_processor_update:(input_lambda_processor_update_ :
                                   input_lambda_processor_update)
  () =
  ({ input_lambda_processor_update = input_lambda_processor_update_ } : 
  input_processing_configuration_update)
let make_kinesis_streams_input_update
  ~resource_arn_update:(resource_arn_update_ : string) () =
  ({ resource_arn_update = resource_arn_update_ } : kinesis_streams_input_update)
let make_kinesis_firehose_input_update
  ~resource_arn_update:(resource_arn_update_ : string) () =
  ({ resource_arn_update = resource_arn_update_ } : kinesis_firehose_input_update)
let make_input_schema_update
  ?record_column_updates:(record_column_updates_ : record_column list option)
  ?record_encoding_update:(record_encoding_update_ : string option)
  ?record_format_update:(record_format_update_ : record_format option) () =
  ({
     record_column_updates = record_column_updates_;
     record_encoding_update = record_encoding_update_;
     record_format_update = record_format_update_
   } : input_schema_update)
let make_input_parallelism_update ~count_update:(count_update_ : int) () =
  ({ count_update = count_update_ } : input_parallelism_update)
let make_input_update
  ?input_parallelism_update:(input_parallelism_update_ :
                              input_parallelism_update option)
  ?input_schema_update:(input_schema_update_ : input_schema_update option)
  ?kinesis_firehose_input_update:(kinesis_firehose_input_update_ :
                                   kinesis_firehose_input_update option)
  ?kinesis_streams_input_update:(kinesis_streams_input_update_ :
                                  kinesis_streams_input_update option)
  ?input_processing_configuration_update:(input_processing_configuration_update_
                                           :
                                           input_processing_configuration_update
                                             option)
  ?name_prefix_update:(name_prefix_update_ : string option)
  ~input_id:(input_id_ : string) () =
  ({
     input_parallelism_update = input_parallelism_update_;
     input_schema_update = input_schema_update_;
     kinesis_firehose_input_update = kinesis_firehose_input_update_;
     kinesis_streams_input_update = kinesis_streams_input_update_;
     input_processing_configuration_update =
       input_processing_configuration_update_;
     name_prefix_update = name_prefix_update_;
     input_id = input_id_
   } : input_update)
let make_kinesis_streams_output_update
  ~resource_arn_update:(resource_arn_update_ : string) () =
  ({ resource_arn_update = resource_arn_update_ } : kinesis_streams_output_update)
let make_kinesis_firehose_output_update
  ~resource_arn_update:(resource_arn_update_ : string) () =
  ({ resource_arn_update = resource_arn_update_ } : kinesis_firehose_output_update)
let make_lambda_output_update
  ~resource_arn_update:(resource_arn_update_ : string) () =
  ({ resource_arn_update = resource_arn_update_ } : lambda_output_update)
let make_output_update
  ?destination_schema_update:(destination_schema_update_ :
                               destination_schema option)
  ?lambda_output_update:(lambda_output_update_ : lambda_output_update option)
  ?kinesis_firehose_output_update:(kinesis_firehose_output_update_ :
                                    kinesis_firehose_output_update option)
  ?kinesis_streams_output_update:(kinesis_streams_output_update_ :
                                   kinesis_streams_output_update option)
  ?name_update:(name_update_ : string option)
  ~output_id:(output_id_ : string) () =
  ({
     destination_schema_update = destination_schema_update_;
     lambda_output_update = lambda_output_update_;
     kinesis_firehose_output_update = kinesis_firehose_output_update_;
     kinesis_streams_output_update = kinesis_streams_output_update_;
     name_update = name_update_;
     output_id = output_id_
   } : output_update)
let make_s3_reference_data_source_update
  ?file_key_update:(file_key_update_ : string option)
  ?bucket_arn_update:(bucket_arn_update_ : string option) () =
  ({
     file_key_update = file_key_update_;
     bucket_arn_update = bucket_arn_update_
   } : s3_reference_data_source_update)
let make_reference_data_source_update
  ?reference_schema_update:(reference_schema_update_ : source_schema option)
  ?s3_reference_data_source_update:(s3_reference_data_source_update_ :
                                     s3_reference_data_source_update option)
  ?table_name_update:(table_name_update_ : string option)
  ~reference_id:(reference_id_ : string) () =
  ({
     reference_schema_update = reference_schema_update_;
     s3_reference_data_source_update = s3_reference_data_source_update_;
     table_name_update = table_name_update_;
     reference_id = reference_id_
   } : reference_data_source_update)
let make_sql_application_configuration_update
  ?reference_data_source_updates:(reference_data_source_updates_ :
                                   reference_data_source_update list option)
  ?output_updates:(output_updates_ : output_update list option)
  ?input_updates:(input_updates_ : input_update list option) () =
  ({
     reference_data_source_updates = reference_data_source_updates_;
     output_updates = output_updates_;
     input_updates = input_updates_
   } : sql_application_configuration_update)
let make_s3_content_location_update
  ?object_version_update:(object_version_update_ : string option)
  ?file_key_update:(file_key_update_ : string option)
  ?bucket_arn_update:(bucket_arn_update_ : string option) () =
  ({
     object_version_update = object_version_update_;
     file_key_update = file_key_update_;
     bucket_arn_update = bucket_arn_update_
   } : s3_content_location_update)
let make_code_content_update
  ?s3_content_location_update:(s3_content_location_update_ :
                                s3_content_location_update option)
  ?zip_file_content_update:(zip_file_content_update_ : bytes option)
  ?text_content_update:(text_content_update_ : string option) () =
  ({
     s3_content_location_update = s3_content_location_update_;
     zip_file_content_update = zip_file_content_update_;
     text_content_update = text_content_update_
   } : code_content_update)
let make_application_code_configuration_update
  ?code_content_update:(code_content_update_ : code_content_update option)
  ?code_content_type_update:(code_content_type_update_ :
                              code_content_type option)
  () =
  ({
     code_content_update = code_content_update_;
     code_content_type_update = code_content_type_update_
   } : application_code_configuration_update)
let make_checkpoint_configuration_update
  ?min_pause_between_checkpoints_update:(min_pause_between_checkpoints_update_
                                          : int option)
  ?checkpoint_interval_update:(checkpoint_interval_update_ : int option)
  ?checkpointing_enabled_update:(checkpointing_enabled_update_ : bool option)
  ?configuration_type_update:(configuration_type_update_ :
                               configuration_type option)
  () =
  ({
     min_pause_between_checkpoints_update =
       min_pause_between_checkpoints_update_;
     checkpoint_interval_update = checkpoint_interval_update_;
     checkpointing_enabled_update = checkpointing_enabled_update_;
     configuration_type_update = configuration_type_update_
   } : checkpoint_configuration_update)
let make_monitoring_configuration_update
  ?log_level_update:(log_level_update_ : log_level option)
  ?metrics_level_update:(metrics_level_update_ : metrics_level option)
  ?configuration_type_update:(configuration_type_update_ :
                               configuration_type option)
  () =
  ({
     log_level_update = log_level_update_;
     metrics_level_update = metrics_level_update_;
     configuration_type_update = configuration_type_update_
   } : monitoring_configuration_update)
let make_parallelism_configuration_update
  ?auto_scaling_enabled_update:(auto_scaling_enabled_update_ : bool option)
  ?parallelism_per_kpu_update:(parallelism_per_kpu_update_ : int option)
  ?parallelism_update:(parallelism_update_ : int option)
  ?configuration_type_update:(configuration_type_update_ :
                               configuration_type option)
  () =
  ({
     auto_scaling_enabled_update = auto_scaling_enabled_update_;
     parallelism_per_kpu_update = parallelism_per_kpu_update_;
     parallelism_update = parallelism_update_;
     configuration_type_update = configuration_type_update_
   } : parallelism_configuration_update)
let make_flink_application_configuration_update
  ?parallelism_configuration_update:(parallelism_configuration_update_ :
                                      parallelism_configuration_update option)
  ?monitoring_configuration_update:(monitoring_configuration_update_ :
                                     monitoring_configuration_update option)
  ?checkpoint_configuration_update:(checkpoint_configuration_update_ :
                                     checkpoint_configuration_update option)
  () =
  ({
     parallelism_configuration_update = parallelism_configuration_update_;
     monitoring_configuration_update = monitoring_configuration_update_;
     checkpoint_configuration_update = checkpoint_configuration_update_
   } : flink_application_configuration_update)
let make_environment_property_updates
  ~property_groups:(property_groups_ : property_group list) () =
  ({ property_groups = property_groups_ } : environment_property_updates)
let make_application_snapshot_configuration_update
  ~snapshots_enabled_update:(snapshots_enabled_update_ : bool) () =
  ({ snapshots_enabled_update = snapshots_enabled_update_ } : application_snapshot_configuration_update)
let make_application_system_rollback_configuration_update
  ~rollback_enabled_update:(rollback_enabled_update_ : bool) () =
  ({ rollback_enabled_update = rollback_enabled_update_ } : application_system_rollback_configuration_update)
let make_application_configuration_update
  ?zeppelin_application_configuration_update:(zeppelin_application_configuration_update_
                                               :
                                               zeppelin_application_configuration_update
                                                 option)
  ?vpc_configuration_updates:(vpc_configuration_updates_ :
                               vpc_configuration_update list option)
  ?application_system_rollback_configuration_update:(application_system_rollback_configuration_update_
                                                      :
                                                      application_system_rollback_configuration_update
                                                        option)
  ?application_snapshot_configuration_update:(application_snapshot_configuration_update_
                                               :
                                               application_snapshot_configuration_update
                                                 option)
  ?environment_property_updates:(environment_property_updates_ :
                                  environment_property_updates option)
  ?flink_application_configuration_update:(flink_application_configuration_update_
                                            :
                                            flink_application_configuration_update
                                              option)
  ?application_code_configuration_update:(application_code_configuration_update_
                                           :
                                           application_code_configuration_update
                                             option)
  ?sql_application_configuration_update:(sql_application_configuration_update_
                                          :
                                          sql_application_configuration_update
                                            option)
  () =
  ({
     zeppelin_application_configuration_update =
       zeppelin_application_configuration_update_;
     vpc_configuration_updates = vpc_configuration_updates_;
     application_system_rollback_configuration_update =
       application_system_rollback_configuration_update_;
     application_snapshot_configuration_update =
       application_snapshot_configuration_update_;
     environment_property_updates = environment_property_updates_;
     flink_application_configuration_update =
       flink_application_configuration_update_;
     application_code_configuration_update =
       application_code_configuration_update_;
     sql_application_configuration_update =
       sql_application_configuration_update_
   } : application_configuration_update)
let make_run_configuration_update
  ?application_restore_configuration:(application_restore_configuration_ :
                                       application_restore_configuration
                                         option)
  ?flink_run_configuration:(flink_run_configuration_ :
                             flink_run_configuration option)
  () =
  ({
     application_restore_configuration = application_restore_configuration_;
     flink_run_configuration = flink_run_configuration_
   } : run_configuration_update)
let make_cloud_watch_logging_option_update
  ?log_stream_arn_update:(log_stream_arn_update_ : string option)
  ~cloud_watch_logging_option_id:(cloud_watch_logging_option_id_ : string) ()
  =
  ({
     log_stream_arn_update = log_stream_arn_update_;
     cloud_watch_logging_option_id = cloud_watch_logging_option_id_
   } : cloud_watch_logging_option_update)
let make_update_application_request
  ?runtime_environment_update:(runtime_environment_update_ :
                                runtime_environment option)
  ?conditional_token:(conditional_token_ : string option)
  ?cloud_watch_logging_option_updates:(cloud_watch_logging_option_updates_ :
                                        cloud_watch_logging_option_update
                                          list option)
  ?run_configuration_update:(run_configuration_update_ :
                              run_configuration_update option)
  ?service_execution_role_update:(service_execution_role_update_ :
                                   string option)
  ?application_configuration_update:(application_configuration_update_ :
                                      application_configuration_update option)
  ?current_application_version_id:(current_application_version_id_ :
                                    int option)
  ~application_name:(application_name_ : string) () =
  ({
     runtime_environment_update = runtime_environment_update_;
     conditional_token = conditional_token_;
     cloud_watch_logging_option_updates = cloud_watch_logging_option_updates_;
     run_configuration_update = run_configuration_update_;
     service_execution_role_update = service_execution_role_update_;
     application_configuration_update = application_configuration_update_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : update_application_request)
let make_update_application_maintenance_configuration_response
  ?application_maintenance_configuration_description:(application_maintenance_configuration_description_
                                                       :
                                                       application_maintenance_configuration_description
                                                         option)
  ?application_ar_n:(application_ar_n_ : string option) () =
  ({
     application_maintenance_configuration_description =
       application_maintenance_configuration_description_;
     application_ar_n = application_ar_n_
   } : update_application_maintenance_configuration_response)
let make_application_maintenance_configuration_update
  ~application_maintenance_window_start_time_update:(application_maintenance_window_start_time_update_
                                                      : string)
  () =
  ({
     application_maintenance_window_start_time_update =
       application_maintenance_window_start_time_update_
   } : application_maintenance_configuration_update)
let make_update_application_maintenance_configuration_request
  ~application_maintenance_configuration_update:(application_maintenance_configuration_update_
                                                  :
                                                  application_maintenance_configuration_update)
  ~application_name:(application_name_ : string) () =
  ({
     application_maintenance_configuration_update =
       application_maintenance_configuration_update_;
     application_name = application_name_
   } : update_application_maintenance_configuration_request)
let make_untag_resource_response () = (() : unit)
let make_untag_resource_request ~tag_keys:(tag_keys_ : string list)
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)
let make_tag ?value:(value_ : string option) ~key:(key_ : string) () =
  ({ value = value_; key = key_ } : tag)
let make_tag_resource_response () = (() : unit)
let make_tag_resource_request ~tags:(tags_ : tag list)
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)
let make_stop_application_response
  ?operation_id:(operation_id_ : string option) () =
  ({ operation_id = operation_id_ } : stop_application_response)
let make_stop_application_request ?force:(force_ : bool option)
  ~application_name:(application_name_ : string) () =
  ({ force = force_; application_name = application_name_ } : stop_application_request)
let make_start_application_response
  ?operation_id:(operation_id_ : string option) () =
  ({ operation_id = operation_id_ } : start_application_response)
let make_sql_run_configuration
  ~input_starting_position_configuration:(input_starting_position_configuration_
                                           :
                                           input_starting_position_configuration)
  ~input_id:(input_id_ : string) () =
  ({
     input_starting_position_configuration =
       input_starting_position_configuration_;
     input_id = input_id_
   } : sql_run_configuration)
let make_run_configuration
  ?application_restore_configuration:(application_restore_configuration_ :
                                       application_restore_configuration
                                         option)
  ?sql_run_configurations:(sql_run_configurations_ :
                            sql_run_configuration list option)
  ?flink_run_configuration:(flink_run_configuration_ :
                             flink_run_configuration option)
  () =
  ({
     application_restore_configuration = application_restore_configuration_;
     sql_run_configurations = sql_run_configurations_;
     flink_run_configuration = flink_run_configuration_
   } : run_configuration)
let make_start_application_request
  ?run_configuration:(run_configuration_ : run_configuration option)
  ~application_name:(application_name_ : string) () =
  ({
     run_configuration = run_configuration_;
     application_name = application_name_
   } : start_application_request)
let make_input_lambda_processor ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ resource_ar_n = resource_ar_n_ } : input_lambda_processor)
let make_input_processing_configuration
  ~input_lambda_processor:(input_lambda_processor_ : input_lambda_processor)
  () =
  ({ input_lambda_processor = input_lambda_processor_ } : input_processing_configuration)
let make_kinesis_streams_input ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ resource_ar_n = resource_ar_n_ } : kinesis_streams_input)
let make_kinesis_firehose_input ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ resource_ar_n = resource_ar_n_ } : kinesis_firehose_input)
let make_input
  ?input_parallelism:(input_parallelism_ : input_parallelism option)
  ?kinesis_firehose_input:(kinesis_firehose_input_ :
                            kinesis_firehose_input option)
  ?kinesis_streams_input:(kinesis_streams_input_ :
                           kinesis_streams_input option)
  ?input_processing_configuration:(input_processing_configuration_ :
                                    input_processing_configuration option)
  ~input_schema:(input_schema_ : source_schema)
  ~name_prefix:(name_prefix_ : string) () =
  ({
     input_schema = input_schema_;
     input_parallelism = input_parallelism_;
     kinesis_firehose_input = kinesis_firehose_input_;
     kinesis_streams_input = kinesis_streams_input_;
     input_processing_configuration = input_processing_configuration_;
     name_prefix = name_prefix_
   } : input)
let make_kinesis_streams_output ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ resource_ar_n = resource_ar_n_ } : kinesis_streams_output)
let make_kinesis_firehose_output ~resource_ar_n:(resource_ar_n_ : string) ()
  = ({ resource_ar_n = resource_ar_n_ } : kinesis_firehose_output)
let make_lambda_output ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ resource_ar_n = resource_ar_n_ } : lambda_output)
let make_output ?lambda_output:(lambda_output_ : lambda_output option)
  ?kinesis_firehose_output:(kinesis_firehose_output_ :
                             kinesis_firehose_output option)
  ?kinesis_streams_output:(kinesis_streams_output_ :
                            kinesis_streams_output option)
  ~destination_schema:(destination_schema_ : destination_schema)
  ~name:(name_ : string) () =
  ({
     destination_schema = destination_schema_;
     lambda_output = lambda_output_;
     kinesis_firehose_output = kinesis_firehose_output_;
     kinesis_streams_output = kinesis_streams_output_;
     name = name_
   } : output)
let make_s3_reference_data_source ?file_key:(file_key_ : string option)
  ?bucket_ar_n:(bucket_ar_n_ : string option) () =
  ({ file_key = file_key_; bucket_ar_n = bucket_ar_n_ } : s3_reference_data_source)
let make_reference_data_source
  ?s3_reference_data_source:(s3_reference_data_source_ :
                              s3_reference_data_source option)
  ~reference_schema:(reference_schema_ : source_schema)
  ~table_name:(table_name_ : string) () =
  ({
     reference_schema = reference_schema_;
     s3_reference_data_source = s3_reference_data_source_;
     table_name = table_name_
   } : reference_data_source)
let make_sql_application_configuration
  ?reference_data_sources:(reference_data_sources_ :
                            reference_data_source list option)
  ?outputs:(outputs_ : output list option)
  ?inputs:(inputs_ : input list option) () =
  ({
     reference_data_sources = reference_data_sources_;
     outputs = outputs_;
     inputs = inputs_
   } : sql_application_configuration)
let make_snapshot_details
  ?runtime_environment:(runtime_environment_ : runtime_environment option)
  ?snapshot_creation_timestamp:(snapshot_creation_timestamp_ :
                                 CoreTypes.Timestamp.t option)
  ~application_version_id:(application_version_id_ : int)
  ~snapshot_status:(snapshot_status_ : snapshot_status)
  ~snapshot_name:(snapshot_name_ : string) () =
  ({
     runtime_environment = runtime_environment_;
     snapshot_creation_timestamp = snapshot_creation_timestamp_;
     application_version_id = application_version_id_;
     snapshot_status = snapshot_status_;
     snapshot_name = snapshot_name_
   } : snapshot_details)
let make_s3_configuration ~file_key:(file_key_ : string)
  ~bucket_ar_n:(bucket_ar_n_ : string) () =
  ({ file_key = file_key_; bucket_ar_n = bucket_ar_n_ } : s3_configuration)
let make_rollback_application_response
  ?operation_id:(operation_id_ : string option)
  ~application_detail:(application_detail_ : application_detail) () =
  ({ operation_id = operation_id_; application_detail = application_detail_ } : 
  rollback_application_response)
let make_rollback_application_request
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : rollback_application_request)
let make_parallelism_configuration
  ?auto_scaling_enabled:(auto_scaling_enabled_ : bool option)
  ?parallelism_per_kp_u:(parallelism_per_kp_u_ : int option)
  ?parallelism:(parallelism_ : int option)
  ~configuration_type:(configuration_type_ : configuration_type) () =
  ({
     auto_scaling_enabled = auto_scaling_enabled_;
     parallelism_per_kp_u = parallelism_per_kp_u_;
     parallelism = parallelism_;
     configuration_type = configuration_type_
   } : parallelism_configuration)
let make_error_info ?error_string:(error_string_ : string option) () =
  ({ error_string = error_string_ } : error_info)
let make_operation_failure_details
  ?error_info:(error_info_ : error_info option)
  ?rollback_operation_id:(rollback_operation_id_ : string option) () =
  ({ error_info = error_info_; rollback_operation_id = rollback_operation_id_
   } : operation_failure_details)
let make_monitoring_configuration ?log_level:(log_level_ : log_level option)
  ?metrics_level:(metrics_level_ : metrics_level option)
  ~configuration_type:(configuration_type_ : configuration_type) () =
  ({
     log_level = log_level_;
     metrics_level = metrics_level_;
     configuration_type = configuration_type_
   } : monitoring_configuration)
let make_list_tags_for_resource_response ?tags:(tags_ : tag list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)
let make_list_tags_for_resource_request
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)
let make_application_summary
  ?application_mode:(application_mode_ : application_mode option)
  ~runtime_environment:(runtime_environment_ : runtime_environment)
  ~application_version_id:(application_version_id_ : int)
  ~application_status:(application_status_ : application_status)
  ~application_ar_n:(application_ar_n_ : string)
  ~application_name:(application_name_ : string) () =
  ({
     application_mode = application_mode_;
     runtime_environment = runtime_environment_;
     application_version_id = application_version_id_;
     application_status = application_status_;
     application_ar_n = application_ar_n_;
     application_name = application_name_
   } : application_summary)
let make_list_applications_response ?next_token:(next_token_ : string option)
  ~application_summaries:(application_summaries_ : application_summary list)
  () =
  ({ next_token = next_token_; application_summaries = application_summaries_
   } : list_applications_response)
let make_list_applications_request ?next_token:(next_token_ : string option)
  ?limit:(limit_ : int option) () =
  ({ next_token = next_token_; limit = limit_ } : list_applications_request)
let make_application_version_summary
  ~application_status:(application_status_ : application_status)
  ~application_version_id:(application_version_id_ : int) () =
  ({
     application_status = application_status_;
     application_version_id = application_version_id_
   } : application_version_summary)
let make_list_application_versions_response
  ?next_token:(next_token_ : string option)
  ?application_version_summaries:(application_version_summaries_ :
                                   application_version_summary list option)
  () =
  ({
     next_token = next_token_;
     application_version_summaries = application_version_summaries_
   } : list_application_versions_response)
let make_list_application_versions_request
  ?next_token:(next_token_ : string option) ?limit:(limit_ : int option)
  ~application_name:(application_name_ : string) () =
  ({
     next_token = next_token_;
     limit = limit_;
     application_name = application_name_
   } : list_application_versions_request)
let make_list_application_snapshots_response
  ?next_token:(next_token_ : string option)
  ?snapshot_summaries:(snapshot_summaries_ : snapshot_details list option) ()
  =
  ({ next_token = next_token_; snapshot_summaries = snapshot_summaries_ } : 
  list_application_snapshots_response)
let make_list_application_snapshots_request
  ?next_token:(next_token_ : string option) ?limit:(limit_ : int option)
  ~application_name:(application_name_ : string) () =
  ({
     next_token = next_token_;
     limit = limit_;
     application_name = application_name_
   } : list_application_snapshots_request)
let make_application_operation_info
  ?operation_status:(operation_status_ : operation_status option)
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option)
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option)
  ?operation_id:(operation_id_ : string option)
  ?operation:(operation_ : string option) () =
  ({
     operation_status = operation_status_;
     end_time = end_time_;
     start_time = start_time_;
     operation_id = operation_id_;
     operation = operation_
   } : application_operation_info)
let make_list_application_operations_response
  ?next_token:(next_token_ : string option)
  ?application_operation_info_list:(application_operation_info_list_ :
                                     application_operation_info list option)
  () =
  ({
     next_token = next_token_;
     application_operation_info_list = application_operation_info_list_
   } : list_application_operations_response)
let make_list_application_operations_request
  ?operation_status:(operation_status_ : operation_status option)
  ?operation:(operation_ : string option)
  ?next_token:(next_token_ : string option) ?limit:(limit_ : int option)
  ~application_name:(application_name_ : string) () =
  ({
     operation_status = operation_status_;
     operation = operation_;
     next_token = next_token_;
     limit = limit_;
     application_name = application_name_
   } : list_application_operations_request)
let make_discover_input_schema_response
  ?raw_input_records:(raw_input_records_ : string list option)
  ?processed_input_records:(processed_input_records_ : string list option)
  ?parsed_input_records:(parsed_input_records_ : string list list option)
  ?input_schema:(input_schema_ : source_schema option) () =
  ({
     raw_input_records = raw_input_records_;
     processed_input_records = processed_input_records_;
     parsed_input_records = parsed_input_records_;
     input_schema = input_schema_
   } : discover_input_schema_response)
let make_discover_input_schema_request
  ?input_processing_configuration:(input_processing_configuration_ :
                                    input_processing_configuration option)
  ?s3_configuration:(s3_configuration_ : s3_configuration option)
  ?input_starting_position_configuration:(input_starting_position_configuration_
                                           :
                                           input_starting_position_configuration
                                             option)
  ?resource_ar_n:(resource_ar_n_ : string option)
  ~service_execution_role:(service_execution_role_ : string) () =
  ({
     input_processing_configuration = input_processing_configuration_;
     s3_configuration = s3_configuration_;
     input_starting_position_configuration =
       input_starting_position_configuration_;
     service_execution_role = service_execution_role_;
     resource_ar_n = resource_ar_n_
   } : discover_input_schema_request)
let make_describe_application_version_response
  ?application_version_detail:(application_version_detail_ :
                                application_detail option)
  () =
  ({ application_version_detail = application_version_detail_ } : describe_application_version_response)
let make_describe_application_version_request
  ~application_version_id:(application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     application_version_id = application_version_id_;
     application_name = application_name_
   } : describe_application_version_request)
let make_describe_application_snapshot_response
  ~snapshot_details:(snapshot_details_ : snapshot_details) () =
  ({ snapshot_details = snapshot_details_ } : describe_application_snapshot_response)
let make_describe_application_snapshot_request
  ~snapshot_name:(snapshot_name_ : string)
  ~application_name:(application_name_ : string) () =
  ({ snapshot_name = snapshot_name_; application_name = application_name_ } : 
  describe_application_snapshot_request)
let make_application_version_change_details
  ~application_version_updated_to:(application_version_updated_to_ : int)
  ~application_version_updated_from:(application_version_updated_from_ : int)
  () =
  ({
     application_version_updated_to = application_version_updated_to_;
     application_version_updated_from = application_version_updated_from_
   } : application_version_change_details)
let make_application_operation_info_details
  ?operation_failure_details:(operation_failure_details_ :
                               operation_failure_details option)
  ?application_version_change_details:(application_version_change_details_ :
                                        application_version_change_details
                                          option)
  ~operation_status:(operation_status_ : operation_status)
  ~end_time:(end_time_ : CoreTypes.Timestamp.t)
  ~start_time:(start_time_ : CoreTypes.Timestamp.t)
  ~operation:(operation_ : string) () =
  ({
     operation_failure_details = operation_failure_details_;
     application_version_change_details = application_version_change_details_;
     operation_status = operation_status_;
     end_time = end_time_;
     start_time = start_time_;
     operation = operation_
   } : application_operation_info_details)
let make_describe_application_operation_response
  ?application_operation_info_details:(application_operation_info_details_ :
                                        application_operation_info_details
                                          option)
  () =
  ({ application_operation_info_details = application_operation_info_details_
   } : describe_application_operation_response)
let make_describe_application_operation_request
  ~operation_id:(operation_id_ : string)
  ~application_name:(application_name_ : string) () =
  ({ operation_id = operation_id_; application_name = application_name_ } : 
  describe_application_operation_request)
let make_describe_application_response
  ~application_detail:(application_detail_ : application_detail) () =
  ({ application_detail = application_detail_ } : describe_application_response)
let make_describe_application_request
  ?include_additional_details:(include_additional_details_ : bool option)
  ~application_name:(application_name_ : string) () =
  ({
     include_additional_details = include_additional_details_;
     application_name = application_name_
   } : describe_application_request)
let make_delete_application_vpc_configuration_response
  ?operation_id:(operation_id_ : string option)
  ?application_version_id:(application_version_id_ : int option)
  ?application_ar_n:(application_ar_n_ : string option) () =
  ({
     operation_id = operation_id_;
     application_version_id = application_version_id_;
     application_ar_n = application_ar_n_
   } : delete_application_vpc_configuration_response)
let make_delete_application_vpc_configuration_request
  ?conditional_token:(conditional_token_ : string option)
  ?current_application_version_id:(current_application_version_id_ :
                                    int option)
  ~vpc_configuration_id:(vpc_configuration_id_ : string)
  ~application_name:(application_name_ : string) () =
  ({
     conditional_token = conditional_token_;
     vpc_configuration_id = vpc_configuration_id_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : delete_application_vpc_configuration_request)
let make_delete_application_snapshot_response () = (() : unit)
let make_delete_application_snapshot_request
  ~snapshot_creation_timestamp:(snapshot_creation_timestamp_ :
                                 CoreTypes.Timestamp.t)
  ~snapshot_name:(snapshot_name_ : string)
  ~application_name:(application_name_ : string) () =
  ({
     snapshot_creation_timestamp = snapshot_creation_timestamp_;
     snapshot_name = snapshot_name_;
     application_name = application_name_
   } : delete_application_snapshot_request)
let make_delete_application_reference_data_source_response
  ?application_version_id:(application_version_id_ : int option)
  ?application_ar_n:(application_ar_n_ : string option) () =
  ({
     application_version_id = application_version_id_;
     application_ar_n = application_ar_n_
   } : delete_application_reference_data_source_response)
let make_delete_application_reference_data_source_request
  ~reference_id:(reference_id_ : string)
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     reference_id = reference_id_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : delete_application_reference_data_source_request)
let make_delete_application_output_response
  ?application_version_id:(application_version_id_ : int option)
  ?application_ar_n:(application_ar_n_ : string option) () =
  ({
     application_version_id = application_version_id_;
     application_ar_n = application_ar_n_
   } : delete_application_output_response)
let make_delete_application_output_request ~output_id:(output_id_ : string)
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     output_id = output_id_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : delete_application_output_request)
let make_delete_application_input_processing_configuration_response
  ?application_version_id:(application_version_id_ : int option)
  ?application_ar_n:(application_ar_n_ : string option) () =
  ({
     application_version_id = application_version_id_;
     application_ar_n = application_ar_n_
   } : delete_application_input_processing_configuration_response)
let make_delete_application_input_processing_configuration_request
  ~input_id:(input_id_ : string)
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     input_id = input_id_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : delete_application_input_processing_configuration_request)
let make_delete_application_cloud_watch_logging_option_response
  ?operation_id:(operation_id_ : string option)
  ?cloud_watch_logging_option_descriptions:(cloud_watch_logging_option_descriptions_
                                             :
                                             cloud_watch_logging_option_description
                                               list option)
  ?application_version_id:(application_version_id_ : int option)
  ?application_ar_n:(application_ar_n_ : string option) () =
  ({
     operation_id = operation_id_;
     cloud_watch_logging_option_descriptions =
       cloud_watch_logging_option_descriptions_;
     application_version_id = application_version_id_;
     application_ar_n = application_ar_n_
   } : delete_application_cloud_watch_logging_option_response)
let make_delete_application_cloud_watch_logging_option_request
  ?conditional_token:(conditional_token_ : string option)
  ?current_application_version_id:(current_application_version_id_ :
                                    int option)
  ~cloud_watch_logging_option_id:(cloud_watch_logging_option_id_ : string)
  ~application_name:(application_name_ : string) () =
  ({
     conditional_token = conditional_token_;
     cloud_watch_logging_option_id = cloud_watch_logging_option_id_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : delete_application_cloud_watch_logging_option_request)
let make_delete_application_response () = (() : unit)
let make_delete_application_request
  ~create_timestamp:(create_timestamp_ : CoreTypes.Timestamp.t)
  ~application_name:(application_name_ : string) () =
  ({
     create_timestamp = create_timestamp_;
     application_name = application_name_
   } : delete_application_request)
let make_create_application_snapshot_response () = (() : unit)
let make_create_application_snapshot_request
  ~snapshot_name:(snapshot_name_ : string)
  ~application_name:(application_name_ : string) () =
  ({ snapshot_name = snapshot_name_; application_name = application_name_ } : 
  create_application_snapshot_request)
let make_create_application_presigned_url_response
  ?authorized_url:(authorized_url_ : string option) () =
  ({ authorized_url = authorized_url_ } : create_application_presigned_url_response)
let make_create_application_presigned_url_request
  ?session_expiration_duration_in_seconds:(session_expiration_duration_in_seconds_
                                            : int option)
  ~url_type:(url_type_ : url_type)
  ~application_name:(application_name_ : string) () =
  ({
     session_expiration_duration_in_seconds =
       session_expiration_duration_in_seconds_;
     url_type = url_type_;
     application_name = application_name_
   } : create_application_presigned_url_request)
let make_create_application_response
  ~application_detail:(application_detail_ : application_detail) () =
  ({ application_detail = application_detail_ } : create_application_response)
let make_checkpoint_configuration
  ?min_pause_between_checkpoints:(min_pause_between_checkpoints_ :
                                   int option)
  ?checkpoint_interval:(checkpoint_interval_ : int option)
  ?checkpointing_enabled:(checkpointing_enabled_ : bool option)
  ~configuration_type:(configuration_type_ : configuration_type) () =
  ({
     min_pause_between_checkpoints = min_pause_between_checkpoints_;
     checkpoint_interval = checkpoint_interval_;
     checkpointing_enabled = checkpointing_enabled_;
     configuration_type = configuration_type_
   } : checkpoint_configuration)
let make_flink_application_configuration
  ?parallelism_configuration:(parallelism_configuration_ :
                               parallelism_configuration option)
  ?monitoring_configuration:(monitoring_configuration_ :
                              monitoring_configuration option)
  ?checkpoint_configuration:(checkpoint_configuration_ :
                              checkpoint_configuration option)
  () =
  ({
     parallelism_configuration = parallelism_configuration_;
     monitoring_configuration = monitoring_configuration_;
     checkpoint_configuration = checkpoint_configuration_
   } : flink_application_configuration)
let make_environment_properties
  ~property_groups:(property_groups_ : property_group list) () =
  ({ property_groups = property_groups_ } : environment_properties)
let make_code_content
  ?s3_content_location:(s3_content_location_ : s3_content_location option)
  ?zip_file_content:(zip_file_content_ : bytes option)
  ?text_content:(text_content_ : string option) () =
  ({
     s3_content_location = s3_content_location_;
     zip_file_content = zip_file_content_;
     text_content = text_content_
   } : code_content)
let make_application_code_configuration
  ?code_content:(code_content_ : code_content option)
  ~code_content_type:(code_content_type_ : code_content_type) () =
  ({ code_content_type = code_content_type_; code_content = code_content_ } : 
  application_code_configuration)
let make_application_snapshot_configuration
  ~snapshots_enabled:(snapshots_enabled_ : bool) () =
  ({ snapshots_enabled = snapshots_enabled_ } : application_snapshot_configuration)
let make_application_system_rollback_configuration
  ~rollback_enabled:(rollback_enabled_ : bool) () =
  ({ rollback_enabled = rollback_enabled_ } : application_system_rollback_configuration)
let make_application_configuration
  ?zeppelin_application_configuration:(zeppelin_application_configuration_ :
                                        zeppelin_application_configuration
                                          option)
  ?vpc_configurations:(vpc_configurations_ : vpc_configuration list option)
  ?application_system_rollback_configuration:(application_system_rollback_configuration_
                                               :
                                               application_system_rollback_configuration
                                                 option)
  ?application_snapshot_configuration:(application_snapshot_configuration_ :
                                        application_snapshot_configuration
                                          option)
  ?application_code_configuration:(application_code_configuration_ :
                                    application_code_configuration option)
  ?environment_properties:(environment_properties_ :
                            environment_properties option)
  ?flink_application_configuration:(flink_application_configuration_ :
                                     flink_application_configuration option)
  ?sql_application_configuration:(sql_application_configuration_ :
                                   sql_application_configuration option)
  () =
  ({
     zeppelin_application_configuration = zeppelin_application_configuration_;
     vpc_configurations = vpc_configurations_;
     application_system_rollback_configuration =
       application_system_rollback_configuration_;
     application_snapshot_configuration = application_snapshot_configuration_;
     application_code_configuration = application_code_configuration_;
     environment_properties = environment_properties_;
     flink_application_configuration = flink_application_configuration_;
     sql_application_configuration = sql_application_configuration_
   } : application_configuration)
let make_cloud_watch_logging_option
  ~log_stream_ar_n:(log_stream_ar_n_ : string) () =
  ({ log_stream_ar_n = log_stream_ar_n_ } : cloud_watch_logging_option)
let make_create_application_request
  ?application_mode:(application_mode_ : application_mode option)
  ?tags:(tags_ : tag list option)
  ?cloud_watch_logging_options:(cloud_watch_logging_options_ :
                                 cloud_watch_logging_option list option)
  ?application_configuration:(application_configuration_ :
                               application_configuration option)
  ?application_description:(application_description_ : string option)
  ~service_execution_role:(service_execution_role_ : string)
  ~runtime_environment:(runtime_environment_ : runtime_environment)
  ~application_name:(application_name_ : string) () =
  ({
     application_mode = application_mode_;
     tags = tags_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     application_configuration = application_configuration_;
     service_execution_role = service_execution_role_;
     runtime_environment = runtime_environment_;
     application_description = application_description_;
     application_name = application_name_
   } : create_application_request)
let make_add_application_vpc_configuration_response
  ?operation_id:(operation_id_ : string option)
  ?vpc_configuration_description:(vpc_configuration_description_ :
                                   vpc_configuration_description option)
  ?application_version_id:(application_version_id_ : int option)
  ?application_ar_n:(application_ar_n_ : string option) () =
  ({
     operation_id = operation_id_;
     vpc_configuration_description = vpc_configuration_description_;
     application_version_id = application_version_id_;
     application_ar_n = application_ar_n_
   } : add_application_vpc_configuration_response)
let make_add_application_vpc_configuration_request
  ?conditional_token:(conditional_token_ : string option)
  ?current_application_version_id:(current_application_version_id_ :
                                    int option)
  ~vpc_configuration:(vpc_configuration_ : vpc_configuration)
  ~application_name:(application_name_ : string) () =
  ({
     conditional_token = conditional_token_;
     vpc_configuration = vpc_configuration_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : add_application_vpc_configuration_request)
let make_add_application_reference_data_source_response
  ?reference_data_source_descriptions:(reference_data_source_descriptions_ :
                                        reference_data_source_description
                                          list option)
  ?application_version_id:(application_version_id_ : int option)
  ?application_ar_n:(application_ar_n_ : string option) () =
  ({
     reference_data_source_descriptions = reference_data_source_descriptions_;
     application_version_id = application_version_id_;
     application_ar_n = application_ar_n_
   } : add_application_reference_data_source_response)
let make_add_application_reference_data_source_request
  ~reference_data_source:(reference_data_source_ : reference_data_source)
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     reference_data_source = reference_data_source_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : add_application_reference_data_source_request)
let make_add_application_output_response
  ?output_descriptions:(output_descriptions_ :
                         output_description list option)
  ?application_version_id:(application_version_id_ : int option)
  ?application_ar_n:(application_ar_n_ : string option) () =
  ({
     output_descriptions = output_descriptions_;
     application_version_id = application_version_id_;
     application_ar_n = application_ar_n_
   } : add_application_output_response)
let make_add_application_output_request ~output:(output_ : output)
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     output = output_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : add_application_output_request)
let make_add_application_input_processing_configuration_response
  ?input_processing_configuration_description:(input_processing_configuration_description_
                                                :
                                                input_processing_configuration_description
                                                  option)
  ?input_id:(input_id_ : string option)
  ?application_version_id:(application_version_id_ : int option)
  ?application_ar_n:(application_ar_n_ : string option) () =
  ({
     input_processing_configuration_description =
       input_processing_configuration_description_;
     input_id = input_id_;
     application_version_id = application_version_id_;
     application_ar_n = application_ar_n_
   } : add_application_input_processing_configuration_response)
let make_add_application_input_processing_configuration_request
  ~input_processing_configuration:(input_processing_configuration_ :
                                    input_processing_configuration)
  ~input_id:(input_id_ : string)
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     input_processing_configuration = input_processing_configuration_;
     input_id = input_id_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : add_application_input_processing_configuration_request)
let make_add_application_input_response
  ?input_descriptions:(input_descriptions_ : input_description list option)
  ?application_version_id:(application_version_id_ : int option)
  ?application_ar_n:(application_ar_n_ : string option) () =
  ({
     input_descriptions = input_descriptions_;
     application_version_id = application_version_id_;
     application_ar_n = application_ar_n_
   } : add_application_input_response)
let make_add_application_input_request ~input:(input_ : input)
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     input = input_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : add_application_input_request)
let make_add_application_cloud_watch_logging_option_response
  ?operation_id:(operation_id_ : string option)
  ?cloud_watch_logging_option_descriptions:(cloud_watch_logging_option_descriptions_
                                             :
                                             cloud_watch_logging_option_description
                                               list option)
  ?application_version_id:(application_version_id_ : int option)
  ?application_ar_n:(application_ar_n_ : string option) () =
  ({
     operation_id = operation_id_;
     cloud_watch_logging_option_descriptions =
       cloud_watch_logging_option_descriptions_;
     application_version_id = application_version_id_;
     application_ar_n = application_ar_n_
   } : add_application_cloud_watch_logging_option_response)
let make_add_application_cloud_watch_logging_option_request
  ?conditional_token:(conditional_token_ : string option)
  ?current_application_version_id:(current_application_version_id_ :
                                    int option)
  ~cloud_watch_logging_option:(cloud_watch_logging_option_ :
                                cloud_watch_logging_option)
  ~application_name:(application_name_ : string) () =
  ({
     conditional_token = conditional_token_;
     cloud_watch_logging_option = cloud_watch_logging_option_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : add_application_cloud_watch_logging_option_request)