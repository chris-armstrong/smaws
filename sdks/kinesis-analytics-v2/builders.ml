open Types

let make_cloud_watch_logging_option_description
    ?cloud_watch_logging_option_id:(cloud_watch_logging_option_id_ : id option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) ~log_stream_ar_n:(log_stream_ar_n_ : log_stream_ar_n)
    () =
  ({
     cloud_watch_logging_option_id = cloud_watch_logging_option_id_;
     log_stream_ar_n = log_stream_ar_n_;
     role_ar_n = role_ar_n_;
   }
    : cloud_watch_logging_option_description)

let make_add_application_cloud_watch_logging_option_response
    ?application_ar_n:(application_ar_n_ : resource_ar_n option)
    ?application_version_id:(application_version_id_ : application_version_id option)
    ?cloud_watch_logging_option_descriptions:
      (cloud_watch_logging_option_descriptions_ : cloud_watch_logging_option_descriptions option)
    ?operation_id:(operation_id_ : operation_id option) () =
  ({
     application_ar_n = application_ar_n_;
     application_version_id = application_version_id_;
     cloud_watch_logging_option_descriptions = cloud_watch_logging_option_descriptions_;
     operation_id = operation_id_;
   }
    : add_application_cloud_watch_logging_option_response)

let make_cloud_watch_logging_option ~log_stream_ar_n:(log_stream_ar_n_ : log_stream_ar_n) () =
  ({ log_stream_ar_n = log_stream_ar_n_ } : cloud_watch_logging_option)

let make_add_application_cloud_watch_logging_option_request
    ?current_application_version_id:
      (current_application_version_id_ : application_version_id option)
    ?conditional_token:(conditional_token_ : conditional_token option)
    ~application_name:(application_name_ : application_name)
    ~cloud_watch_logging_option:(cloud_watch_logging_option_ : cloud_watch_logging_option) () =
  ({
     application_name = application_name_;
     current_application_version_id = current_application_version_id_;
     cloud_watch_logging_option = cloud_watch_logging_option_;
     conditional_token = conditional_token_;
   }
    : add_application_cloud_watch_logging_option_request)

let make_input_starting_position_configuration
    ?input_starting_position:(input_starting_position_ : input_starting_position option) () =
  ({ input_starting_position = input_starting_position_ } : input_starting_position_configuration)

let make_input_parallelism ?count:(count_ : input_parallelism_count option) () =
  ({ count = count_ } : input_parallelism)

let make_record_column ?mapping:(mapping_ : record_column_mapping option)
    ~name:(name_ : record_column_name) ~sql_type:(sql_type_ : record_column_sql_type) () =
  ({ name = name_; mapping = mapping_; sql_type = sql_type_ } : record_column)

let make_csv_mapping_parameters ~record_row_delimiter:(record_row_delimiter_ : record_row_delimiter)
    ~record_column_delimiter:(record_column_delimiter_ : record_column_delimiter) () =
  ({
     record_row_delimiter = record_row_delimiter_;
     record_column_delimiter = record_column_delimiter_;
   }
    : csv_mapping_parameters)

let make_json_mapping_parameters ~record_row_path:(record_row_path_ : record_row_path) () =
  ({ record_row_path = record_row_path_ } : json_mapping_parameters)

let make_mapping_parameters
    ?json_mapping_parameters:(json_mapping_parameters_ : json_mapping_parameters option)
    ?csv_mapping_parameters:(csv_mapping_parameters_ : csv_mapping_parameters option) () =
  ({
     json_mapping_parameters = json_mapping_parameters_;
     csv_mapping_parameters = csv_mapping_parameters_;
   }
    : mapping_parameters)

let make_record_format ?mapping_parameters:(mapping_parameters_ : mapping_parameters option)
    ~record_format_type:(record_format_type_ : record_format_type) () =
  ({ record_format_type = record_format_type_; mapping_parameters = mapping_parameters_ }
    : record_format)

let make_source_schema ?record_encoding:(record_encoding_ : record_encoding option)
    ~record_format:(record_format_ : record_format)
    ~record_columns:(record_columns_ : record_columns) () =
  ({
     record_format = record_format_;
     record_encoding = record_encoding_;
     record_columns = record_columns_;
   }
    : source_schema)

let make_kinesis_firehose_input_description ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_; role_ar_n = role_ar_n_ } : kinesis_firehose_input_description)

let make_kinesis_streams_input_description ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_; role_ar_n = role_ar_n_ } : kinesis_streams_input_description)

let make_input_lambda_processor_description ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_; role_ar_n = role_ar_n_ } : input_lambda_processor_description)

let make_input_processing_configuration_description
    ?input_lambda_processor_description:
      (input_lambda_processor_description_ : input_lambda_processor_description option) () =
  ({ input_lambda_processor_description = input_lambda_processor_description_ }
    : input_processing_configuration_description)

let make_input_description ?input_id:(input_id_ : id option)
    ?name_prefix:(name_prefix_ : in_app_stream_name option)
    ?in_app_stream_names:(in_app_stream_names_ : in_app_stream_names option)
    ?input_processing_configuration_description:
      (input_processing_configuration_description_ :
         input_processing_configuration_description option)
    ?kinesis_streams_input_description:
      (kinesis_streams_input_description_ : kinesis_streams_input_description option)
    ?kinesis_firehose_input_description:
      (kinesis_firehose_input_description_ : kinesis_firehose_input_description option)
    ?input_schema:(input_schema_ : source_schema option)
    ?input_parallelism:(input_parallelism_ : input_parallelism option)
    ?input_starting_position_configuration:
      (input_starting_position_configuration_ : input_starting_position_configuration option) () =
  ({
     input_id = input_id_;
     name_prefix = name_prefix_;
     in_app_stream_names = in_app_stream_names_;
     input_processing_configuration_description = input_processing_configuration_description_;
     kinesis_streams_input_description = kinesis_streams_input_description_;
     kinesis_firehose_input_description = kinesis_firehose_input_description_;
     input_schema = input_schema_;
     input_parallelism = input_parallelism_;
     input_starting_position_configuration = input_starting_position_configuration_;
   }
    : input_description)

let make_add_application_input_response ?application_ar_n:(application_ar_n_ : resource_ar_n option)
    ?application_version_id:(application_version_id_ : application_version_id option)
    ?input_descriptions:(input_descriptions_ : input_descriptions option) () =
  ({
     application_ar_n = application_ar_n_;
     application_version_id = application_version_id_;
     input_descriptions = input_descriptions_;
   }
    : add_application_input_response)

let make_kinesis_firehose_input ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_ } : kinesis_firehose_input)

let make_kinesis_streams_input ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_ } : kinesis_streams_input)

let make_input_lambda_processor ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_ } : input_lambda_processor)

let make_input_processing_configuration
    ~input_lambda_processor:(input_lambda_processor_ : input_lambda_processor) () =
  ({ input_lambda_processor = input_lambda_processor_ } : input_processing_configuration)

let make_input
    ?input_processing_configuration:
      (input_processing_configuration_ : input_processing_configuration option)
    ?kinesis_streams_input:(kinesis_streams_input_ : kinesis_streams_input option)
    ?kinesis_firehose_input:(kinesis_firehose_input_ : kinesis_firehose_input option)
    ?input_parallelism:(input_parallelism_ : input_parallelism option)
    ~name_prefix:(name_prefix_ : in_app_stream_name) ~input_schema:(input_schema_ : source_schema)
    () =
  ({
     name_prefix = name_prefix_;
     input_processing_configuration = input_processing_configuration_;
     kinesis_streams_input = kinesis_streams_input_;
     kinesis_firehose_input = kinesis_firehose_input_;
     input_parallelism = input_parallelism_;
     input_schema = input_schema_;
   }
    : input)

let make_add_application_input_request ~application_name:(application_name_ : application_name)
    ~current_application_version_id:(current_application_version_id_ : application_version_id)
    ~input:(input_ : input) () =
  ({
     application_name = application_name_;
     current_application_version_id = current_application_version_id_;
     input = input_;
   }
    : add_application_input_request)

let make_add_application_input_processing_configuration_response
    ?application_ar_n:(application_ar_n_ : resource_ar_n option)
    ?application_version_id:(application_version_id_ : application_version_id option)
    ?input_id:(input_id_ : id option)
    ?input_processing_configuration_description:
      (input_processing_configuration_description_ :
         input_processing_configuration_description option) () =
  ({
     application_ar_n = application_ar_n_;
     application_version_id = application_version_id_;
     input_id = input_id_;
     input_processing_configuration_description = input_processing_configuration_description_;
   }
    : add_application_input_processing_configuration_response)

let make_add_application_input_processing_configuration_request
    ~application_name:(application_name_ : application_name)
    ~current_application_version_id:(current_application_version_id_ : application_version_id)
    ~input_id:(input_id_ : id)
    ~input_processing_configuration:
      (input_processing_configuration_ : input_processing_configuration) () =
  ({
     application_name = application_name_;
     current_application_version_id = current_application_version_id_;
     input_id = input_id_;
     input_processing_configuration = input_processing_configuration_;
   }
    : add_application_input_processing_configuration_request)

let make_destination_schema ~record_format_type:(record_format_type_ : record_format_type) () =
  ({ record_format_type = record_format_type_ } : destination_schema)

let make_lambda_output_description ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_; role_ar_n = role_ar_n_ } : lambda_output_description)

let make_kinesis_firehose_output_description ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_; role_ar_n = role_ar_n_ } : kinesis_firehose_output_description)

let make_kinesis_streams_output_description ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_; role_ar_n = role_ar_n_ } : kinesis_streams_output_description)

let make_output_description ?output_id:(output_id_ : id option)
    ?name:(name_ : in_app_stream_name option)
    ?kinesis_streams_output_description:
      (kinesis_streams_output_description_ : kinesis_streams_output_description option)
    ?kinesis_firehose_output_description:
      (kinesis_firehose_output_description_ : kinesis_firehose_output_description option)
    ?lambda_output_description:(lambda_output_description_ : lambda_output_description option)
    ?destination_schema:(destination_schema_ : destination_schema option) () =
  ({
     output_id = output_id_;
     name = name_;
     kinesis_streams_output_description = kinesis_streams_output_description_;
     kinesis_firehose_output_description = kinesis_firehose_output_description_;
     lambda_output_description = lambda_output_description_;
     destination_schema = destination_schema_;
   }
    : output_description)

let make_add_application_output_response
    ?application_ar_n:(application_ar_n_ : resource_ar_n option)
    ?application_version_id:(application_version_id_ : application_version_id option)
    ?output_descriptions:(output_descriptions_ : output_descriptions option) () =
  ({
     application_ar_n = application_ar_n_;
     application_version_id = application_version_id_;
     output_descriptions = output_descriptions_;
   }
    : add_application_output_response)

let make_lambda_output ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_ } : lambda_output)

let make_kinesis_firehose_output ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_ } : kinesis_firehose_output)

let make_kinesis_streams_output ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_ } : kinesis_streams_output)

let make_output ?kinesis_streams_output:(kinesis_streams_output_ : kinesis_streams_output option)
    ?kinesis_firehose_output:(kinesis_firehose_output_ : kinesis_firehose_output option)
    ?lambda_output:(lambda_output_ : lambda_output option) ~name:(name_ : in_app_stream_name)
    ~destination_schema:(destination_schema_ : destination_schema) () =
  ({
     name = name_;
     kinesis_streams_output = kinesis_streams_output_;
     kinesis_firehose_output = kinesis_firehose_output_;
     lambda_output = lambda_output_;
     destination_schema = destination_schema_;
   }
    : output)

let make_add_application_output_request ~application_name:(application_name_ : application_name)
    ~current_application_version_id:(current_application_version_id_ : application_version_id)
    ~output:(output_ : output) () =
  ({
     application_name = application_name_;
     current_application_version_id = current_application_version_id_;
     output = output_;
   }
    : add_application_output_request)

let make_s3_reference_data_source_description
    ?reference_role_ar_n:(reference_role_ar_n_ : role_ar_n option)
    ~bucket_ar_n:(bucket_ar_n_ : bucket_ar_n) ~file_key:(file_key_ : file_key) () =
  ({ bucket_ar_n = bucket_ar_n_; file_key = file_key_; reference_role_ar_n = reference_role_ar_n_ }
    : s3_reference_data_source_description)

let make_reference_data_source_description
    ?reference_schema:(reference_schema_ : source_schema option) ~reference_id:(reference_id_ : id)
    ~table_name:(table_name_ : in_app_table_name)
    ~s3_reference_data_source_description:
      (s3_reference_data_source_description_ : s3_reference_data_source_description) () =
  ({
     reference_id = reference_id_;
     table_name = table_name_;
     s3_reference_data_source_description = s3_reference_data_source_description_;
     reference_schema = reference_schema_;
   }
    : reference_data_source_description)

let make_add_application_reference_data_source_response
    ?application_ar_n:(application_ar_n_ : resource_ar_n option)
    ?application_version_id:(application_version_id_ : application_version_id option)
    ?reference_data_source_descriptions:
      (reference_data_source_descriptions_ : reference_data_source_descriptions option) () =
  ({
     application_ar_n = application_ar_n_;
     application_version_id = application_version_id_;
     reference_data_source_descriptions = reference_data_source_descriptions_;
   }
    : add_application_reference_data_source_response)

let make_s3_reference_data_source ?bucket_ar_n:(bucket_ar_n_ : bucket_ar_n option)
    ?file_key:(file_key_ : file_key option) () =
  ({ bucket_ar_n = bucket_ar_n_; file_key = file_key_ } : s3_reference_data_source)

let make_reference_data_source
    ?s3_reference_data_source:(s3_reference_data_source_ : s3_reference_data_source option)
    ~table_name:(table_name_ : in_app_table_name)
    ~reference_schema:(reference_schema_ : source_schema) () =
  ({
     table_name = table_name_;
     s3_reference_data_source = s3_reference_data_source_;
     reference_schema = reference_schema_;
   }
    : reference_data_source)

let make_add_application_reference_data_source_request
    ~application_name:(application_name_ : application_name)
    ~current_application_version_id:(current_application_version_id_ : application_version_id)
    ~reference_data_source:(reference_data_source_ : reference_data_source) () =
  ({
     application_name = application_name_;
     current_application_version_id = current_application_version_id_;
     reference_data_source = reference_data_source_;
   }
    : add_application_reference_data_source_request)

let make_vpc_configuration_description ~vpc_configuration_id:(vpc_configuration_id_ : id)
    ~vpc_id:(vpc_id_ : vpc_id) ~subnet_ids:(subnet_ids_ : subnet_ids)
    ~security_group_ids:(security_group_ids_ : security_group_ids) () =
  ({
     vpc_configuration_id = vpc_configuration_id_;
     vpc_id = vpc_id_;
     subnet_ids = subnet_ids_;
     security_group_ids = security_group_ids_;
   }
    : vpc_configuration_description)

let make_add_application_vpc_configuration_response
    ?application_ar_n:(application_ar_n_ : resource_ar_n option)
    ?application_version_id:(application_version_id_ : application_version_id option)
    ?vpc_configuration_description:
      (vpc_configuration_description_ : vpc_configuration_description option)
    ?operation_id:(operation_id_ : operation_id option) () =
  ({
     application_ar_n = application_ar_n_;
     application_version_id = application_version_id_;
     vpc_configuration_description = vpc_configuration_description_;
     operation_id = operation_id_;
   }
    : add_application_vpc_configuration_response)

let make_vpc_configuration ~subnet_ids:(subnet_ids_ : subnet_ids)
    ~security_group_ids:(security_group_ids_ : security_group_ids) () =
  ({ subnet_ids = subnet_ids_; security_group_ids = security_group_ids_ } : vpc_configuration)

let make_add_application_vpc_configuration_request
    ?current_application_version_id:
      (current_application_version_id_ : application_version_id option)
    ?conditional_token:(conditional_token_ : conditional_token option)
    ~application_name:(application_name_ : application_name)
    ~vpc_configuration:(vpc_configuration_ : vpc_configuration) () =
  ({
     application_name = application_name_;
     current_application_version_id = current_application_version_id_;
     vpc_configuration = vpc_configuration_;
     conditional_token = conditional_token_;
   }
    : add_application_vpc_configuration_request)

let make_s3_content_location ?object_version:(object_version_ : object_version option)
    ~bucket_ar_n:(bucket_ar_n_ : bucket_ar_n) ~file_key:(file_key_ : file_key) () =
  ({ bucket_ar_n = bucket_ar_n_; file_key = file_key_; object_version = object_version_ }
    : s3_content_location)

let make_code_content ?text_content:(text_content_ : text_content option)
    ?zip_file_content:(zip_file_content_ : zip_file_content option)
    ?s3_content_location:(s3_content_location_ : s3_content_location option) () =
  ({
     text_content = text_content_;
     zip_file_content = zip_file_content_;
     s3_content_location = s3_content_location_;
   }
    : code_content)

let make_application_code_configuration ?code_content:(code_content_ : code_content option)
    ~code_content_type:(code_content_type_ : code_content_type) () =
  ({ code_content = code_content_; code_content_type = code_content_type_ }
    : application_code_configuration)

let make_s3_application_code_location_description
    ?object_version:(object_version_ : object_version option)
    ~bucket_ar_n:(bucket_ar_n_ : bucket_ar_n) ~file_key:(file_key_ : file_key) () =
  ({ bucket_ar_n = bucket_ar_n_; file_key = file_key_; object_version = object_version_ }
    : s3_application_code_location_description)

let make_code_content_description ?text_content:(text_content_ : text_content option)
    ?code_m_d5:(code_m_d5_ : code_m_d5 option) ?code_size:(code_size_ : code_size option)
    ?s3_application_code_location_description:
      (s3_application_code_location_description_ : s3_application_code_location_description option)
    () =
  ({
     text_content = text_content_;
     code_m_d5 = code_m_d5_;
     code_size = code_size_;
     s3_application_code_location_description = s3_application_code_location_description_;
   }
    : code_content_description)

let make_application_code_configuration_description
    ?code_content_description:(code_content_description_ : code_content_description option)
    ~code_content_type:(code_content_type_ : code_content_type) () =
  ({ code_content_type = code_content_type_; code_content_description = code_content_description_ }
    : application_code_configuration_description)

let make_s3_content_location_update ?bucket_arn_update:(bucket_arn_update_ : bucket_ar_n option)
    ?file_key_update:(file_key_update_ : file_key option)
    ?object_version_update:(object_version_update_ : object_version option) () =
  ({
     bucket_arn_update = bucket_arn_update_;
     file_key_update = file_key_update_;
     object_version_update = object_version_update_;
   }
    : s3_content_location_update)

let make_code_content_update ?text_content_update:(text_content_update_ : text_content option)
    ?zip_file_content_update:(zip_file_content_update_ : zip_file_content option)
    ?s3_content_location_update:(s3_content_location_update_ : s3_content_location_update option) ()
    =
  ({
     text_content_update = text_content_update_;
     zip_file_content_update = zip_file_content_update_;
     s3_content_location_update = s3_content_location_update_;
   }
    : code_content_update)

let make_application_code_configuration_update
    ?code_content_type_update:(code_content_type_update_ : code_content_type option)
    ?code_content_update:(code_content_update_ : code_content_update option) () =
  ({
     code_content_type_update = code_content_type_update_;
     code_content_update = code_content_update_;
   }
    : application_code_configuration_update)

let make_application_encryption_configuration ?key_id:(key_id_ : key_id option)
    ~key_type:(key_type_ : key_type) () =
  ({ key_id = key_id_; key_type = key_type_ } : application_encryption_configuration)

let make_maven_reference ~group_id:(group_id_ : maven_group_id)
    ~artifact_id:(artifact_id_ : maven_artifact_id) ~version:(version_ : maven_version) () =
  ({ group_id = group_id_; artifact_id = artifact_id_; version = version_ } : maven_reference)

let make_custom_artifact_configuration
    ?s3_content_location:(s3_content_location_ : s3_content_location option)
    ?maven_reference:(maven_reference_ : maven_reference option)
    ~artifact_type:(artifact_type_ : artifact_type) () =
  ({
     artifact_type = artifact_type_;
     s3_content_location = s3_content_location_;
     maven_reference = maven_reference_;
   }
    : custom_artifact_configuration)

let make_s3_content_base_location ?base_path:(base_path_ : base_path option)
    ~bucket_ar_n:(bucket_ar_n_ : bucket_ar_n) () =
  ({ bucket_ar_n = bucket_ar_n_; base_path = base_path_ } : s3_content_base_location)

let make_deploy_as_application_configuration
    ~s3_content_location:(s3_content_location_ : s3_content_base_location) () =
  ({ s3_content_location = s3_content_location_ } : deploy_as_application_configuration)

let make_glue_data_catalog_configuration ~database_ar_n:(database_ar_n_ : database_ar_n) () =
  ({ database_ar_n = database_ar_n_ } : glue_data_catalog_configuration)

let make_catalog_configuration
    ~glue_data_catalog_configuration:
      (glue_data_catalog_configuration_ : glue_data_catalog_configuration) () =
  ({ glue_data_catalog_configuration = glue_data_catalog_configuration_ } : catalog_configuration)

let make_zeppelin_monitoring_configuration ~log_level:(log_level_ : log_level) () =
  ({ log_level = log_level_ } : zeppelin_monitoring_configuration)

let make_zeppelin_application_configuration
    ?monitoring_configuration:(monitoring_configuration_ : zeppelin_monitoring_configuration option)
    ?catalog_configuration:(catalog_configuration_ : catalog_configuration option)
    ?deploy_as_application_configuration:
      (deploy_as_application_configuration_ : deploy_as_application_configuration option)
    ?custom_artifacts_configuration:
      (custom_artifacts_configuration_ : custom_artifacts_configuration_list option) () =
  ({
     monitoring_configuration = monitoring_configuration_;
     catalog_configuration = catalog_configuration_;
     deploy_as_application_configuration = deploy_as_application_configuration_;
     custom_artifacts_configuration = custom_artifacts_configuration_;
   }
    : zeppelin_application_configuration)

let make_application_system_rollback_configuration
    ~rollback_enabled:(rollback_enabled_ : boolean_object) () =
  ({ rollback_enabled = rollback_enabled_ } : application_system_rollback_configuration)

let make_application_snapshot_configuration ~snapshots_enabled:(snapshots_enabled_ : boolean_object)
    () =
  ({ snapshots_enabled = snapshots_enabled_ } : application_snapshot_configuration)

let make_property_group ~property_group_id:(property_group_id_ : id)
    ~property_map:(property_map_ : property_map) () =
  ({ property_group_id = property_group_id_; property_map = property_map_ } : property_group)

let make_environment_properties ~property_groups:(property_groups_ : property_groups) () =
  ({ property_groups = property_groups_ } : environment_properties)

let make_parallelism_configuration ?parallelism:(parallelism_ : parallelism option)
    ?parallelism_per_kp_u:(parallelism_per_kp_u_ : parallelism_per_kp_u option)
    ?auto_scaling_enabled:(auto_scaling_enabled_ : boolean_object option)
    ~configuration_type:(configuration_type_ : configuration_type) () =
  ({
     configuration_type = configuration_type_;
     parallelism = parallelism_;
     parallelism_per_kp_u = parallelism_per_kp_u_;
     auto_scaling_enabled = auto_scaling_enabled_;
   }
    : parallelism_configuration)

let make_monitoring_configuration ?metrics_level:(metrics_level_ : metrics_level option)
    ?log_level:(log_level_ : log_level option)
    ~configuration_type:(configuration_type_ : configuration_type) () =
  ({
     configuration_type = configuration_type_;
     metrics_level = metrics_level_;
     log_level = log_level_;
   }
    : monitoring_configuration)

let make_checkpoint_configuration
    ?checkpointing_enabled:(checkpointing_enabled_ : boolean_object option)
    ?checkpoint_interval:(checkpoint_interval_ : checkpoint_interval option)
    ?min_pause_between_checkpoints:
      (min_pause_between_checkpoints_ : min_pause_between_checkpoints option)
    ~configuration_type:(configuration_type_ : configuration_type) () =
  ({
     configuration_type = configuration_type_;
     checkpointing_enabled = checkpointing_enabled_;
     checkpoint_interval = checkpoint_interval_;
     min_pause_between_checkpoints = min_pause_between_checkpoints_;
   }
    : checkpoint_configuration)

let make_flink_application_configuration
    ?checkpoint_configuration:(checkpoint_configuration_ : checkpoint_configuration option)
    ?monitoring_configuration:(monitoring_configuration_ : monitoring_configuration option)
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option) () =
  ({
     checkpoint_configuration = checkpoint_configuration_;
     monitoring_configuration = monitoring_configuration_;
     parallelism_configuration = parallelism_configuration_;
   }
    : flink_application_configuration)

let make_sql_application_configuration ?inputs:(inputs_ : inputs option)
    ?outputs:(outputs_ : outputs option)
    ?reference_data_sources:(reference_data_sources_ : reference_data_sources option) () =
  ({ inputs = inputs_; outputs = outputs_; reference_data_sources = reference_data_sources_ }
    : sql_application_configuration)

let make_application_configuration
    ?sql_application_configuration:
      (sql_application_configuration_ : sql_application_configuration option)
    ?flink_application_configuration:
      (flink_application_configuration_ : flink_application_configuration option)
    ?environment_properties:(environment_properties_ : environment_properties option)
    ?application_code_configuration:
      (application_code_configuration_ : application_code_configuration option)
    ?application_snapshot_configuration:
      (application_snapshot_configuration_ : application_snapshot_configuration option)
    ?application_system_rollback_configuration:
      (application_system_rollback_configuration_ : application_system_rollback_configuration option)
    ?vpc_configurations:(vpc_configurations_ : vpc_configurations option)
    ?zeppelin_application_configuration:
      (zeppelin_application_configuration_ : zeppelin_application_configuration option)
    ?application_encryption_configuration:
      (application_encryption_configuration_ : application_encryption_configuration option) () =
  ({
     sql_application_configuration = sql_application_configuration_;
     flink_application_configuration = flink_application_configuration_;
     environment_properties = environment_properties_;
     application_code_configuration = application_code_configuration_;
     application_snapshot_configuration = application_snapshot_configuration_;
     application_system_rollback_configuration = application_system_rollback_configuration_;
     vpc_configurations = vpc_configurations_;
     zeppelin_application_configuration = zeppelin_application_configuration_;
     application_encryption_configuration = application_encryption_configuration_;
   }
    : application_configuration)

let make_application_encryption_configuration_description ?key_id:(key_id_ : key_id option)
    ~key_type:(key_type_ : key_type) () =
  ({ key_id = key_id_; key_type = key_type_ } : application_encryption_configuration_description)

let make_custom_artifact_configuration_description
    ?artifact_type:(artifact_type_ : artifact_type option)
    ?s3_content_location_description:(s3_content_location_description_ : s3_content_location option)
    ?maven_reference_description:(maven_reference_description_ : maven_reference option) () =
  ({
     artifact_type = artifact_type_;
     s3_content_location_description = s3_content_location_description_;
     maven_reference_description = maven_reference_description_;
   }
    : custom_artifact_configuration_description)

let make_s3_content_base_location_description ?base_path:(base_path_ : base_path option)
    ~bucket_ar_n:(bucket_ar_n_ : bucket_ar_n) () =
  ({ bucket_ar_n = bucket_ar_n_; base_path = base_path_ } : s3_content_base_location_description)

let make_deploy_as_application_configuration_description
    ~s3_content_location_description:
      (s3_content_location_description_ : s3_content_base_location_description) () =
  ({ s3_content_location_description = s3_content_location_description_ }
    : deploy_as_application_configuration_description)

let make_glue_data_catalog_configuration_description ~database_ar_n:(database_ar_n_ : database_ar_n)
    () =
  ({ database_ar_n = database_ar_n_ } : glue_data_catalog_configuration_description)

let make_catalog_configuration_description
    ~glue_data_catalog_configuration_description:
      (glue_data_catalog_configuration_description_ : glue_data_catalog_configuration_description)
    () =
  ({ glue_data_catalog_configuration_description = glue_data_catalog_configuration_description_ }
    : catalog_configuration_description)

let make_zeppelin_monitoring_configuration_description ?log_level:(log_level_ : log_level option) ()
    =
  ({ log_level = log_level_ } : zeppelin_monitoring_configuration_description)

let make_zeppelin_application_configuration_description
    ?catalog_configuration_description:
      (catalog_configuration_description_ : catalog_configuration_description option)
    ?deploy_as_application_configuration_description:
      (deploy_as_application_configuration_description_ :
         deploy_as_application_configuration_description option)
    ?custom_artifacts_configuration_description:
      (custom_artifacts_configuration_description_ :
         custom_artifacts_configuration_description_list option)
    ~monitoring_configuration_description:
      (monitoring_configuration_description_ : zeppelin_monitoring_configuration_description) () =
  ({
     monitoring_configuration_description = monitoring_configuration_description_;
     catalog_configuration_description = catalog_configuration_description_;
     deploy_as_application_configuration_description =
       deploy_as_application_configuration_description_;
     custom_artifacts_configuration_description = custom_artifacts_configuration_description_;
   }
    : zeppelin_application_configuration_description)

let make_application_system_rollback_configuration_description
    ~rollback_enabled:(rollback_enabled_ : boolean_object) () =
  ({ rollback_enabled = rollback_enabled_ } : application_system_rollback_configuration_description)

let make_application_snapshot_configuration_description
    ~snapshots_enabled:(snapshots_enabled_ : boolean_object) () =
  ({ snapshots_enabled = snapshots_enabled_ } : application_snapshot_configuration_description)

let make_environment_property_descriptions
    ?property_group_descriptions:(property_group_descriptions_ : property_groups option) () =
  ({ property_group_descriptions = property_group_descriptions_ }
    : environment_property_descriptions)

let make_parallelism_configuration_description
    ?configuration_type:(configuration_type_ : configuration_type option)
    ?parallelism:(parallelism_ : parallelism option)
    ?parallelism_per_kp_u:(parallelism_per_kp_u_ : parallelism_per_kp_u option)
    ?current_parallelism:(current_parallelism_ : parallelism option)
    ?auto_scaling_enabled:(auto_scaling_enabled_ : boolean_object option) () =
  ({
     configuration_type = configuration_type_;
     parallelism = parallelism_;
     parallelism_per_kp_u = parallelism_per_kp_u_;
     current_parallelism = current_parallelism_;
     auto_scaling_enabled = auto_scaling_enabled_;
   }
    : parallelism_configuration_description)

let make_monitoring_configuration_description
    ?configuration_type:(configuration_type_ : configuration_type option)
    ?metrics_level:(metrics_level_ : metrics_level option)
    ?log_level:(log_level_ : log_level option) () =
  ({
     configuration_type = configuration_type_;
     metrics_level = metrics_level_;
     log_level = log_level_;
   }
    : monitoring_configuration_description)

let make_checkpoint_configuration_description
    ?configuration_type:(configuration_type_ : configuration_type option)
    ?checkpointing_enabled:(checkpointing_enabled_ : boolean_object option)
    ?checkpoint_interval:(checkpoint_interval_ : checkpoint_interval option)
    ?min_pause_between_checkpoints:
      (min_pause_between_checkpoints_ : min_pause_between_checkpoints option) () =
  ({
     configuration_type = configuration_type_;
     checkpointing_enabled = checkpointing_enabled_;
     checkpoint_interval = checkpoint_interval_;
     min_pause_between_checkpoints = min_pause_between_checkpoints_;
   }
    : checkpoint_configuration_description)

let make_flink_application_configuration_description
    ?checkpoint_configuration_description:
      (checkpoint_configuration_description_ : checkpoint_configuration_description option)
    ?monitoring_configuration_description:
      (monitoring_configuration_description_ : monitoring_configuration_description option)
    ?parallelism_configuration_description:
      (parallelism_configuration_description_ : parallelism_configuration_description option)
    ?job_plan_description:(job_plan_description_ : job_plan_description option) () =
  ({
     checkpoint_configuration_description = checkpoint_configuration_description_;
     monitoring_configuration_description = monitoring_configuration_description_;
     parallelism_configuration_description = parallelism_configuration_description_;
     job_plan_description = job_plan_description_;
   }
    : flink_application_configuration_description)

let make_flink_run_configuration
    ?allow_non_restored_state:(allow_non_restored_state_ : boolean_object option) () =
  ({ allow_non_restored_state = allow_non_restored_state_ } : flink_run_configuration)

let make_application_restore_configuration ?snapshot_name:(snapshot_name_ : snapshot_name option)
    ~application_restore_type:(application_restore_type_ : application_restore_type) () =
  ({ application_restore_type = application_restore_type_; snapshot_name = snapshot_name_ }
    : application_restore_configuration)

let make_run_configuration_description
    ?application_restore_configuration_description:
      (application_restore_configuration_description_ : application_restore_configuration option)
    ?flink_run_configuration_description:
      (flink_run_configuration_description_ : flink_run_configuration option) () =
  ({
     application_restore_configuration_description = application_restore_configuration_description_;
     flink_run_configuration_description = flink_run_configuration_description_;
   }
    : run_configuration_description)

let make_sql_application_configuration_description
    ?input_descriptions:(input_descriptions_ : input_descriptions option)
    ?output_descriptions:(output_descriptions_ : output_descriptions option)
    ?reference_data_source_descriptions:
      (reference_data_source_descriptions_ : reference_data_source_descriptions option) () =
  ({
     input_descriptions = input_descriptions_;
     output_descriptions = output_descriptions_;
     reference_data_source_descriptions = reference_data_source_descriptions_;
   }
    : sql_application_configuration_description)

let make_application_configuration_description
    ?sql_application_configuration_description:
      (sql_application_configuration_description_ : sql_application_configuration_description option)
    ?application_code_configuration_description:
      (application_code_configuration_description_ :
         application_code_configuration_description option)
    ?run_configuration_description:
      (run_configuration_description_ : run_configuration_description option)
    ?flink_application_configuration_description:
      (flink_application_configuration_description_ :
         flink_application_configuration_description option)
    ?environment_property_descriptions:
      (environment_property_descriptions_ : environment_property_descriptions option)
    ?application_snapshot_configuration_description:
      (application_snapshot_configuration_description_ :
         application_snapshot_configuration_description option)
    ?application_system_rollback_configuration_description:
      (application_system_rollback_configuration_description_ :
         application_system_rollback_configuration_description option)
    ?vpc_configuration_descriptions:
      (vpc_configuration_descriptions_ : vpc_configuration_descriptions option)
    ?zeppelin_application_configuration_description:
      (zeppelin_application_configuration_description_ :
         zeppelin_application_configuration_description option)
    ?application_encryption_configuration_description:
      (application_encryption_configuration_description_ :
         application_encryption_configuration_description option) () =
  ({
     sql_application_configuration_description = sql_application_configuration_description_;
     application_code_configuration_description = application_code_configuration_description_;
     run_configuration_description = run_configuration_description_;
     flink_application_configuration_description = flink_application_configuration_description_;
     environment_property_descriptions = environment_property_descriptions_;
     application_snapshot_configuration_description =
       application_snapshot_configuration_description_;
     application_system_rollback_configuration_description =
       application_system_rollback_configuration_description_;
     vpc_configuration_descriptions = vpc_configuration_descriptions_;
     zeppelin_application_configuration_description =
       zeppelin_application_configuration_description_;
     application_encryption_configuration_description =
       application_encryption_configuration_description_;
   }
    : application_configuration_description)

let make_application_encryption_configuration_update ?key_id_update:(key_id_update_ : key_id option)
    ~key_type_update:(key_type_update_ : key_type) () =
  ({ key_id_update = key_id_update_; key_type_update = key_type_update_ }
    : application_encryption_configuration_update)

let make_s3_content_base_location_update
    ?bucket_arn_update:(bucket_arn_update_ : bucket_ar_n option)
    ?base_path_update:(base_path_update_ : base_path option) () =
  ({ bucket_arn_update = bucket_arn_update_; base_path_update = base_path_update_ }
    : s3_content_base_location_update)

let make_deploy_as_application_configuration_update
    ?s3_content_location_update:
      (s3_content_location_update_ : s3_content_base_location_update option) () =
  ({ s3_content_location_update = s3_content_location_update_ }
    : deploy_as_application_configuration_update)

let make_glue_data_catalog_configuration_update
    ~database_arn_update:(database_arn_update_ : database_ar_n) () =
  ({ database_arn_update = database_arn_update_ } : glue_data_catalog_configuration_update)

let make_catalog_configuration_update
    ~glue_data_catalog_configuration_update:
      (glue_data_catalog_configuration_update_ : glue_data_catalog_configuration_update) () =
  ({ glue_data_catalog_configuration_update = glue_data_catalog_configuration_update_ }
    : catalog_configuration_update)

let make_zeppelin_monitoring_configuration_update ~log_level_update:(log_level_update_ : log_level)
    () =
  ({ log_level_update = log_level_update_ } : zeppelin_monitoring_configuration_update)

let make_zeppelin_application_configuration_update
    ?monitoring_configuration_update:
      (monitoring_configuration_update_ : zeppelin_monitoring_configuration_update option)
    ?catalog_configuration_update:
      (catalog_configuration_update_ : catalog_configuration_update option)
    ?deploy_as_application_configuration_update:
      (deploy_as_application_configuration_update_ :
         deploy_as_application_configuration_update option)
    ?custom_artifacts_configuration_update:
      (custom_artifacts_configuration_update_ : custom_artifacts_configuration_list option) () =
  ({
     monitoring_configuration_update = monitoring_configuration_update_;
     catalog_configuration_update = catalog_configuration_update_;
     deploy_as_application_configuration_update = deploy_as_application_configuration_update_;
     custom_artifacts_configuration_update = custom_artifacts_configuration_update_;
   }
    : zeppelin_application_configuration_update)

let make_vpc_configuration_update ?subnet_id_updates:(subnet_id_updates_ : subnet_ids option)
    ?security_group_id_updates:(security_group_id_updates_ : security_group_ids option)
    ~vpc_configuration_id:(vpc_configuration_id_ : id) () =
  ({
     vpc_configuration_id = vpc_configuration_id_;
     subnet_id_updates = subnet_id_updates_;
     security_group_id_updates = security_group_id_updates_;
   }
    : vpc_configuration_update)

let make_application_system_rollback_configuration_update
    ~rollback_enabled_update:(rollback_enabled_update_ : boolean_object) () =
  ({ rollback_enabled_update = rollback_enabled_update_ }
    : application_system_rollback_configuration_update)

let make_application_snapshot_configuration_update
    ~snapshots_enabled_update:(snapshots_enabled_update_ : boolean_object) () =
  ({ snapshots_enabled_update = snapshots_enabled_update_ }
    : application_snapshot_configuration_update)

let make_environment_property_updates ~property_groups:(property_groups_ : property_groups) () =
  ({ property_groups = property_groups_ } : environment_property_updates)

let make_parallelism_configuration_update
    ?configuration_type_update:(configuration_type_update_ : configuration_type option)
    ?parallelism_update:(parallelism_update_ : parallelism option)
    ?parallelism_per_kpu_update:(parallelism_per_kpu_update_ : parallelism_per_kp_u option)
    ?auto_scaling_enabled_update:(auto_scaling_enabled_update_ : boolean_object option) () =
  ({
     configuration_type_update = configuration_type_update_;
     parallelism_update = parallelism_update_;
     parallelism_per_kpu_update = parallelism_per_kpu_update_;
     auto_scaling_enabled_update = auto_scaling_enabled_update_;
   }
    : parallelism_configuration_update)

let make_monitoring_configuration_update
    ?configuration_type_update:(configuration_type_update_ : configuration_type option)
    ?metrics_level_update:(metrics_level_update_ : metrics_level option)
    ?log_level_update:(log_level_update_ : log_level option) () =
  ({
     configuration_type_update = configuration_type_update_;
     metrics_level_update = metrics_level_update_;
     log_level_update = log_level_update_;
   }
    : monitoring_configuration_update)

let make_checkpoint_configuration_update
    ?configuration_type_update:(configuration_type_update_ : configuration_type option)
    ?checkpointing_enabled_update:(checkpointing_enabled_update_ : boolean_object option)
    ?checkpoint_interval_update:(checkpoint_interval_update_ : checkpoint_interval option)
    ?min_pause_between_checkpoints_update:
      (min_pause_between_checkpoints_update_ : min_pause_between_checkpoints option) () =
  ({
     configuration_type_update = configuration_type_update_;
     checkpointing_enabled_update = checkpointing_enabled_update_;
     checkpoint_interval_update = checkpoint_interval_update_;
     min_pause_between_checkpoints_update = min_pause_between_checkpoints_update_;
   }
    : checkpoint_configuration_update)

let make_flink_application_configuration_update
    ?checkpoint_configuration_update:
      (checkpoint_configuration_update_ : checkpoint_configuration_update option)
    ?monitoring_configuration_update:
      (monitoring_configuration_update_ : monitoring_configuration_update option)
    ?parallelism_configuration_update:
      (parallelism_configuration_update_ : parallelism_configuration_update option) () =
  ({
     checkpoint_configuration_update = checkpoint_configuration_update_;
     monitoring_configuration_update = monitoring_configuration_update_;
     parallelism_configuration_update = parallelism_configuration_update_;
   }
    : flink_application_configuration_update)

let make_s3_reference_data_source_update
    ?bucket_arn_update:(bucket_arn_update_ : bucket_ar_n option)
    ?file_key_update:(file_key_update_ : file_key option) () =
  ({ bucket_arn_update = bucket_arn_update_; file_key_update = file_key_update_ }
    : s3_reference_data_source_update)

let make_reference_data_source_update
    ?table_name_update:(table_name_update_ : in_app_table_name option)
    ?s3_reference_data_source_update:
      (s3_reference_data_source_update_ : s3_reference_data_source_update option)
    ?reference_schema_update:(reference_schema_update_ : source_schema option)
    ~reference_id:(reference_id_ : id) () =
  ({
     reference_id = reference_id_;
     table_name_update = table_name_update_;
     s3_reference_data_source_update = s3_reference_data_source_update_;
     reference_schema_update = reference_schema_update_;
   }
    : reference_data_source_update)

let make_lambda_output_update ~resource_arn_update:(resource_arn_update_ : resource_ar_n) () =
  ({ resource_arn_update = resource_arn_update_ } : lambda_output_update)

let make_kinesis_firehose_output_update ~resource_arn_update:(resource_arn_update_ : resource_ar_n)
    () =
  ({ resource_arn_update = resource_arn_update_ } : kinesis_firehose_output_update)

let make_kinesis_streams_output_update ~resource_arn_update:(resource_arn_update_ : resource_ar_n)
    () =
  ({ resource_arn_update = resource_arn_update_ } : kinesis_streams_output_update)

let make_output_update ?name_update:(name_update_ : in_app_stream_name option)
    ?kinesis_streams_output_update:
      (kinesis_streams_output_update_ : kinesis_streams_output_update option)
    ?kinesis_firehose_output_update:
      (kinesis_firehose_output_update_ : kinesis_firehose_output_update option)
    ?lambda_output_update:(lambda_output_update_ : lambda_output_update option)
    ?destination_schema_update:(destination_schema_update_ : destination_schema option)
    ~output_id:(output_id_ : id) () =
  ({
     output_id = output_id_;
     name_update = name_update_;
     kinesis_streams_output_update = kinesis_streams_output_update_;
     kinesis_firehose_output_update = kinesis_firehose_output_update_;
     lambda_output_update = lambda_output_update_;
     destination_schema_update = destination_schema_update_;
   }
    : output_update)

let make_input_parallelism_update ~count_update:(count_update_ : input_parallelism_count) () =
  ({ count_update = count_update_ } : input_parallelism_update)

let make_input_schema_update ?record_format_update:(record_format_update_ : record_format option)
    ?record_encoding_update:(record_encoding_update_ : record_encoding option)
    ?record_column_updates:(record_column_updates_ : record_columns option) () =
  ({
     record_format_update = record_format_update_;
     record_encoding_update = record_encoding_update_;
     record_column_updates = record_column_updates_;
   }
    : input_schema_update)

let make_kinesis_firehose_input_update ~resource_arn_update:(resource_arn_update_ : resource_ar_n)
    () =
  ({ resource_arn_update = resource_arn_update_ } : kinesis_firehose_input_update)

let make_kinesis_streams_input_update ~resource_arn_update:(resource_arn_update_ : resource_ar_n) ()
    =
  ({ resource_arn_update = resource_arn_update_ } : kinesis_streams_input_update)

let make_input_lambda_processor_update ~resource_arn_update:(resource_arn_update_ : resource_ar_n)
    () =
  ({ resource_arn_update = resource_arn_update_ } : input_lambda_processor_update)

let make_input_processing_configuration_update
    ~input_lambda_processor_update:(input_lambda_processor_update_ : input_lambda_processor_update)
    () =
  ({ input_lambda_processor_update = input_lambda_processor_update_ }
    : input_processing_configuration_update)

let make_input_update ?name_prefix_update:(name_prefix_update_ : in_app_stream_name option)
    ?input_processing_configuration_update:
      (input_processing_configuration_update_ : input_processing_configuration_update option)
    ?kinesis_streams_input_update:
      (kinesis_streams_input_update_ : kinesis_streams_input_update option)
    ?kinesis_firehose_input_update:
      (kinesis_firehose_input_update_ : kinesis_firehose_input_update option)
    ?input_schema_update:(input_schema_update_ : input_schema_update option)
    ?input_parallelism_update:(input_parallelism_update_ : input_parallelism_update option)
    ~input_id:(input_id_ : id) () =
  ({
     input_id = input_id_;
     name_prefix_update = name_prefix_update_;
     input_processing_configuration_update = input_processing_configuration_update_;
     kinesis_streams_input_update = kinesis_streams_input_update_;
     kinesis_firehose_input_update = kinesis_firehose_input_update_;
     input_schema_update = input_schema_update_;
     input_parallelism_update = input_parallelism_update_;
   }
    : input_update)

let make_sql_application_configuration_update ?input_updates:(input_updates_ : input_updates option)
    ?output_updates:(output_updates_ : output_updates option)
    ?reference_data_source_updates:
      (reference_data_source_updates_ : reference_data_source_updates option) () =
  ({
     input_updates = input_updates_;
     output_updates = output_updates_;
     reference_data_source_updates = reference_data_source_updates_;
   }
    : sql_application_configuration_update)

let make_application_configuration_update
    ?sql_application_configuration_update:
      (sql_application_configuration_update_ : sql_application_configuration_update option)
    ?application_code_configuration_update:
      (application_code_configuration_update_ : application_code_configuration_update option)
    ?flink_application_configuration_update:
      (flink_application_configuration_update_ : flink_application_configuration_update option)
    ?environment_property_updates:
      (environment_property_updates_ : environment_property_updates option)
    ?application_snapshot_configuration_update:
      (application_snapshot_configuration_update_ : application_snapshot_configuration_update option)
    ?application_system_rollback_configuration_update:
      (application_system_rollback_configuration_update_ :
         application_system_rollback_configuration_update option)
    ?vpc_configuration_updates:(vpc_configuration_updates_ : vpc_configuration_updates option)
    ?zeppelin_application_configuration_update:
      (zeppelin_application_configuration_update_ : zeppelin_application_configuration_update option)
    ?application_encryption_configuration_update:
      (application_encryption_configuration_update_ :
         application_encryption_configuration_update option) () =
  ({
     sql_application_configuration_update = sql_application_configuration_update_;
     application_code_configuration_update = application_code_configuration_update_;
     flink_application_configuration_update = flink_application_configuration_update_;
     environment_property_updates = environment_property_updates_;
     application_snapshot_configuration_update = application_snapshot_configuration_update_;
     application_system_rollback_configuration_update =
       application_system_rollback_configuration_update_;
     vpc_configuration_updates = vpc_configuration_updates_;
     zeppelin_application_configuration_update = zeppelin_application_configuration_update_;
     application_encryption_configuration_update = application_encryption_configuration_update_;
   }
    : application_configuration_update)

let make_application_maintenance_configuration_description
    ~application_maintenance_window_start_time:
      (application_maintenance_window_start_time_ : application_maintenance_window_start_time)
    ~application_maintenance_window_end_time:
      (application_maintenance_window_end_time_ : application_maintenance_window_end_time) () =
  ({
     application_maintenance_window_start_time = application_maintenance_window_start_time_;
     application_maintenance_window_end_time = application_maintenance_window_end_time_;
   }
    : application_maintenance_configuration_description)

let make_application_detail
    ?application_description:(application_description_ : application_description option)
    ?service_execution_role:(service_execution_role_ : role_ar_n option)
    ?create_timestamp:(create_timestamp_ : timestamp option)
    ?last_update_timestamp:(last_update_timestamp_ : timestamp option)
    ?application_configuration_description:
      (application_configuration_description_ : application_configuration_description option)
    ?cloud_watch_logging_option_descriptions:
      (cloud_watch_logging_option_descriptions_ : cloud_watch_logging_option_descriptions option)
    ?application_maintenance_configuration_description:
      (application_maintenance_configuration_description_ :
         application_maintenance_configuration_description option)
    ?application_version_updated_from:
      (application_version_updated_from_ : application_version_id option)
    ?application_version_rolled_back_from:
      (application_version_rolled_back_from_ : application_version_id option)
    ?application_version_create_timestamp:(application_version_create_timestamp_ : timestamp option)
    ?conditional_token:(conditional_token_ : conditional_token option)
    ?application_version_rolled_back_to:
      (application_version_rolled_back_to_ : application_version_id option)
    ?application_mode:(application_mode_ : application_mode option)
    ~application_ar_n:(application_ar_n_ : resource_ar_n)
    ~application_name:(application_name_ : application_name)
    ~runtime_environment:(runtime_environment_ : runtime_environment)
    ~application_status:(application_status_ : application_status)
    ~application_version_id:(application_version_id_ : application_version_id) () =
  ({
     application_ar_n = application_ar_n_;
     application_description = application_description_;
     application_name = application_name_;
     runtime_environment = runtime_environment_;
     service_execution_role = service_execution_role_;
     application_status = application_status_;
     application_version_id = application_version_id_;
     create_timestamp = create_timestamp_;
     last_update_timestamp = last_update_timestamp_;
     application_configuration_description = application_configuration_description_;
     cloud_watch_logging_option_descriptions = cloud_watch_logging_option_descriptions_;
     application_maintenance_configuration_description =
       application_maintenance_configuration_description_;
     application_version_updated_from = application_version_updated_from_;
     application_version_rolled_back_from = application_version_rolled_back_from_;
     application_version_create_timestamp = application_version_create_timestamp_;
     conditional_token = conditional_token_;
     application_version_rolled_back_to = application_version_rolled_back_to_;
     application_mode = application_mode_;
   }
    : application_detail)

let make_application_maintenance_configuration_update
    ~application_maintenance_window_start_time_update:
      (application_maintenance_window_start_time_update_ :
        application_maintenance_window_start_time) () =
  ({
     application_maintenance_window_start_time_update =
       application_maintenance_window_start_time_update_;
   }
    : application_maintenance_configuration_update)

let make_application_operation_info ?operation:(operation_ : operation option)
    ?operation_id:(operation_id_ : operation_id option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option)
    ?operation_status:(operation_status_ : operation_status option) () =
  ({
     operation = operation_;
     operation_id = operation_id_;
     start_time = start_time_;
     end_time = end_time_;
     operation_status = operation_status_;
   }
    : application_operation_info)

let make_error_info ?error_string:(error_string_ : error_string option) () =
  ({ error_string = error_string_ } : error_info)

let make_operation_failure_details
    ?rollback_operation_id:(rollback_operation_id_ : operation_id option)
    ?error_info:(error_info_ : error_info option) () =
  ({ rollback_operation_id = rollback_operation_id_; error_info = error_info_ }
    : operation_failure_details)

let make_application_version_change_details
    ~application_version_updated_from:(application_version_updated_from_ : application_version_id)
    ~application_version_updated_to:(application_version_updated_to_ : application_version_id) () =
  ({
     application_version_updated_from = application_version_updated_from_;
     application_version_updated_to = application_version_updated_to_;
   }
    : application_version_change_details)

let make_application_operation_info_details
    ?application_version_change_details:
      (application_version_change_details_ : application_version_change_details option)
    ?operation_failure_details:(operation_failure_details_ : operation_failure_details option)
    ~operation:(operation_ : operation) ~start_time:(start_time_ : timestamp)
    ~end_time:(end_time_ : timestamp) ~operation_status:(operation_status_ : operation_status) () =
  ({
     operation = operation_;
     start_time = start_time_;
     end_time = end_time_;
     operation_status = operation_status_;
     application_version_change_details = application_version_change_details_;
     operation_failure_details = operation_failure_details_;
   }
    : application_operation_info_details)

let make_application_summary ?application_mode:(application_mode_ : application_mode option)
    ~application_name:(application_name_ : application_name)
    ~application_ar_n:(application_ar_n_ : resource_ar_n)
    ~application_status:(application_status_ : application_status)
    ~application_version_id:(application_version_id_ : application_version_id)
    ~runtime_environment:(runtime_environment_ : runtime_environment) () =
  ({
     application_name = application_name_;
     application_ar_n = application_ar_n_;
     application_status = application_status_;
     application_version_id = application_version_id_;
     runtime_environment = runtime_environment_;
     application_mode = application_mode_;
   }
    : application_summary)

let make_application_version_summary
    ~application_version_id:(application_version_id_ : application_version_id)
    ~application_status:(application_status_ : application_status) () =
  ({ application_version_id = application_version_id_; application_status = application_status_ }
    : application_version_summary)

let make_cloud_watch_logging_option_update
    ?log_stream_arn_update:(log_stream_arn_update_ : log_stream_ar_n option)
    ~cloud_watch_logging_option_id:(cloud_watch_logging_option_id_ : id) () =
  ({
     cloud_watch_logging_option_id = cloud_watch_logging_option_id_;
     log_stream_arn_update = log_stream_arn_update_;
   }
    : cloud_watch_logging_option_update)

let make_create_application_response ~application_detail:(application_detail_ : application_detail)
    () =
  ({ application_detail = application_detail_ } : create_application_response)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ key = key_; value = value_ } : tag)

let make_create_application_request
    ?application_description:(application_description_ : application_description option)
    ?application_configuration:(application_configuration_ : application_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?tags:(tags_ : tags option) ?application_mode:(application_mode_ : application_mode option)
    ~application_name:(application_name_ : application_name)
    ~runtime_environment:(runtime_environment_ : runtime_environment)
    ~service_execution_role:(service_execution_role_ : role_ar_n) () =
  ({
     application_name = application_name_;
     application_description = application_description_;
     runtime_environment = runtime_environment_;
     service_execution_role = service_execution_role_;
     application_configuration = application_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     tags = tags_;
     application_mode = application_mode_;
   }
    : create_application_request)

let make_create_application_presigned_url_response
    ?authorized_url:(authorized_url_ : authorized_url option) () =
  ({ authorized_url = authorized_url_ } : create_application_presigned_url_response)

let make_create_application_presigned_url_request
    ?session_expiration_duration_in_seconds:
      (session_expiration_duration_in_seconds_ : session_expiration_duration_in_seconds option)
    ~application_name:(application_name_ : application_name) ~url_type:(url_type_ : url_type) () =
  ({
     application_name = application_name_;
     url_type = url_type_;
     session_expiration_duration_in_seconds = session_expiration_duration_in_seconds_;
   }
    : create_application_presigned_url_request)

let make_create_application_snapshot_response () = (() : unit)

let make_create_application_snapshot_request
    ~application_name:(application_name_ : application_name)
    ~snapshot_name:(snapshot_name_ : snapshot_name) () =
  ({ application_name = application_name_; snapshot_name = snapshot_name_ }
    : create_application_snapshot_request)

let make_delete_application_response () = (() : unit)

let make_delete_application_request ~application_name:(application_name_ : application_name)
    ~create_timestamp:(create_timestamp_ : timestamp) () =
  ({ application_name = application_name_; create_timestamp = create_timestamp_ }
    : delete_application_request)

let make_delete_application_cloud_watch_logging_option_response
    ?application_ar_n:(application_ar_n_ : resource_ar_n option)
    ?application_version_id:(application_version_id_ : application_version_id option)
    ?cloud_watch_logging_option_descriptions:
      (cloud_watch_logging_option_descriptions_ : cloud_watch_logging_option_descriptions option)
    ?operation_id:(operation_id_ : operation_id option) () =
  ({
     application_ar_n = application_ar_n_;
     application_version_id = application_version_id_;
     cloud_watch_logging_option_descriptions = cloud_watch_logging_option_descriptions_;
     operation_id = operation_id_;
   }
    : delete_application_cloud_watch_logging_option_response)

let make_delete_application_cloud_watch_logging_option_request
    ?current_application_version_id:
      (current_application_version_id_ : application_version_id option)
    ?conditional_token:(conditional_token_ : conditional_token option)
    ~application_name:(application_name_ : application_name)
    ~cloud_watch_logging_option_id:(cloud_watch_logging_option_id_ : id) () =
  ({
     application_name = application_name_;
     current_application_version_id = current_application_version_id_;
     cloud_watch_logging_option_id = cloud_watch_logging_option_id_;
     conditional_token = conditional_token_;
   }
    : delete_application_cloud_watch_logging_option_request)

let make_delete_application_input_processing_configuration_response
    ?application_ar_n:(application_ar_n_ : resource_ar_n option)
    ?application_version_id:(application_version_id_ : application_version_id option) () =
  ({ application_ar_n = application_ar_n_; application_version_id = application_version_id_ }
    : delete_application_input_processing_configuration_response)

let make_delete_application_input_processing_configuration_request
    ~application_name:(application_name_ : application_name)
    ~current_application_version_id:(current_application_version_id_ : application_version_id)
    ~input_id:(input_id_ : id) () =
  ({
     application_name = application_name_;
     current_application_version_id = current_application_version_id_;
     input_id = input_id_;
   }
    : delete_application_input_processing_configuration_request)

let make_delete_application_output_response
    ?application_ar_n:(application_ar_n_ : resource_ar_n option)
    ?application_version_id:(application_version_id_ : application_version_id option) () =
  ({ application_ar_n = application_ar_n_; application_version_id = application_version_id_ }
    : delete_application_output_response)

let make_delete_application_output_request ~application_name:(application_name_ : application_name)
    ~current_application_version_id:(current_application_version_id_ : application_version_id)
    ~output_id:(output_id_ : id) () =
  ({
     application_name = application_name_;
     current_application_version_id = current_application_version_id_;
     output_id = output_id_;
   }
    : delete_application_output_request)

let make_delete_application_reference_data_source_response
    ?application_ar_n:(application_ar_n_ : resource_ar_n option)
    ?application_version_id:(application_version_id_ : application_version_id option) () =
  ({ application_ar_n = application_ar_n_; application_version_id = application_version_id_ }
    : delete_application_reference_data_source_response)

let make_delete_application_reference_data_source_request
    ~application_name:(application_name_ : application_name)
    ~current_application_version_id:(current_application_version_id_ : application_version_id)
    ~reference_id:(reference_id_ : id) () =
  ({
     application_name = application_name_;
     current_application_version_id = current_application_version_id_;
     reference_id = reference_id_;
   }
    : delete_application_reference_data_source_request)

let make_delete_application_snapshot_response () = (() : unit)

let make_delete_application_snapshot_request
    ~application_name:(application_name_ : application_name)
    ~snapshot_name:(snapshot_name_ : snapshot_name)
    ~snapshot_creation_timestamp:(snapshot_creation_timestamp_ : timestamp) () =
  ({
     application_name = application_name_;
     snapshot_name = snapshot_name_;
     snapshot_creation_timestamp = snapshot_creation_timestamp_;
   }
    : delete_application_snapshot_request)

let make_delete_application_vpc_configuration_response
    ?application_ar_n:(application_ar_n_ : resource_ar_n option)
    ?application_version_id:(application_version_id_ : application_version_id option)
    ?operation_id:(operation_id_ : operation_id option) () =
  ({
     application_ar_n = application_ar_n_;
     application_version_id = application_version_id_;
     operation_id = operation_id_;
   }
    : delete_application_vpc_configuration_response)

let make_delete_application_vpc_configuration_request
    ?current_application_version_id:
      (current_application_version_id_ : application_version_id option)
    ?conditional_token:(conditional_token_ : conditional_token option)
    ~application_name:(application_name_ : application_name)
    ~vpc_configuration_id:(vpc_configuration_id_ : id) () =
  ({
     application_name = application_name_;
     current_application_version_id = current_application_version_id_;
     vpc_configuration_id = vpc_configuration_id_;
     conditional_token = conditional_token_;
   }
    : delete_application_vpc_configuration_request)

let make_describe_application_response
    ~application_detail:(application_detail_ : application_detail) () =
  ({ application_detail = application_detail_ } : describe_application_response)

let make_describe_application_request
    ?include_additional_details:(include_additional_details_ : boolean_object option)
    ~application_name:(application_name_ : application_name) () =
  ({
     application_name = application_name_;
     include_additional_details = include_additional_details_;
   }
    : describe_application_request)

let make_describe_application_operation_response
    ?application_operation_info_details:
      (application_operation_info_details_ : application_operation_info_details option) () =
  ({ application_operation_info_details = application_operation_info_details_ }
    : describe_application_operation_response)

let make_describe_application_operation_request
    ~application_name:(application_name_ : application_name)
    ~operation_id:(operation_id_ : operation_id) () =
  ({ application_name = application_name_; operation_id = operation_id_ }
    : describe_application_operation_request)

let make_snapshot_details
    ?snapshot_creation_timestamp:(snapshot_creation_timestamp_ : timestamp option)
    ?runtime_environment:(runtime_environment_ : runtime_environment option)
    ?application_encryption_configuration_description:
      (application_encryption_configuration_description_ :
         application_encryption_configuration_description option)
    ~snapshot_name:(snapshot_name_ : snapshot_name)
    ~snapshot_status:(snapshot_status_ : snapshot_status)
    ~application_version_id:(application_version_id_ : application_version_id) () =
  ({
     snapshot_name = snapshot_name_;
     snapshot_status = snapshot_status_;
     application_version_id = application_version_id_;
     snapshot_creation_timestamp = snapshot_creation_timestamp_;
     runtime_environment = runtime_environment_;
     application_encryption_configuration_description =
       application_encryption_configuration_description_;
   }
    : snapshot_details)

let make_describe_application_snapshot_response
    ~snapshot_details:(snapshot_details_ : snapshot_details) () =
  ({ snapshot_details = snapshot_details_ } : describe_application_snapshot_response)

let make_describe_application_snapshot_request
    ~application_name:(application_name_ : application_name)
    ~snapshot_name:(snapshot_name_ : snapshot_name) () =
  ({ application_name = application_name_; snapshot_name = snapshot_name_ }
    : describe_application_snapshot_request)

let make_describe_application_version_response
    ?application_version_detail:(application_version_detail_ : application_detail option) () =
  ({ application_version_detail = application_version_detail_ }
    : describe_application_version_response)

let make_describe_application_version_request
    ~application_name:(application_name_ : application_name)
    ~application_version_id:(application_version_id_ : application_version_id) () =
  ({ application_name = application_name_; application_version_id = application_version_id_ }
    : describe_application_version_request)

let make_discover_input_schema_response ?input_schema:(input_schema_ : source_schema option)
    ?parsed_input_records:(parsed_input_records_ : parsed_input_records option)
    ?processed_input_records:(processed_input_records_ : processed_input_records option)
    ?raw_input_records:(raw_input_records_ : raw_input_records option) () =
  ({
     input_schema = input_schema_;
     parsed_input_records = parsed_input_records_;
     processed_input_records = processed_input_records_;
     raw_input_records = raw_input_records_;
   }
    : discover_input_schema_response)

let make_s3_configuration ~bucket_ar_n:(bucket_ar_n_ : bucket_ar_n) ~file_key:(file_key_ : file_key)
    () =
  ({ bucket_ar_n = bucket_ar_n_; file_key = file_key_ } : s3_configuration)

let make_discover_input_schema_request ?resource_ar_n:(resource_ar_n_ : resource_ar_n option)
    ?input_starting_position_configuration:
      (input_starting_position_configuration_ : input_starting_position_configuration option)
    ?s3_configuration:(s3_configuration_ : s3_configuration option)
    ?input_processing_configuration:
      (input_processing_configuration_ : input_processing_configuration option)
    ~service_execution_role:(service_execution_role_ : role_ar_n) () =
  ({
     resource_ar_n = resource_ar_n_;
     service_execution_role = service_execution_role_;
     input_starting_position_configuration = input_starting_position_configuration_;
     s3_configuration = s3_configuration_;
     input_processing_configuration = input_processing_configuration_;
   }
    : discover_input_schema_request)

let make_update_application_maintenance_configuration_response
    ?application_ar_n:(application_ar_n_ : resource_ar_n option)
    ?application_maintenance_configuration_description:
      (application_maintenance_configuration_description_ :
         application_maintenance_configuration_description option) () =
  ({
     application_ar_n = application_ar_n_;
     application_maintenance_configuration_description =
       application_maintenance_configuration_description_;
   }
    : update_application_maintenance_configuration_response)

let make_update_application_maintenance_configuration_request
    ~application_name:(application_name_ : application_name)
    ~application_maintenance_configuration_update:
      (application_maintenance_configuration_update_ : application_maintenance_configuration_update)
    () =
  ({
     application_name = application_name_;
     application_maintenance_configuration_update = application_maintenance_configuration_update_;
   }
    : update_application_maintenance_configuration_request)

let make_update_application_response ?operation_id:(operation_id_ : operation_id option)
    ~application_detail:(application_detail_ : application_detail) () =
  ({ application_detail = application_detail_; operation_id = operation_id_ }
    : update_application_response)

let make_run_configuration_update
    ?flink_run_configuration:(flink_run_configuration_ : flink_run_configuration option)
    ?application_restore_configuration:
      (application_restore_configuration_ : application_restore_configuration option) () =
  ({
     flink_run_configuration = flink_run_configuration_;
     application_restore_configuration = application_restore_configuration_;
   }
    : run_configuration_update)

let make_update_application_request
    ?current_application_version_id:
      (current_application_version_id_ : application_version_id option)
    ?application_configuration_update:
      (application_configuration_update_ : application_configuration_update option)
    ?service_execution_role_update:(service_execution_role_update_ : role_ar_n option)
    ?run_configuration_update:(run_configuration_update_ : run_configuration_update option)
    ?cloud_watch_logging_option_updates:
      (cloud_watch_logging_option_updates_ : cloud_watch_logging_option_updates option)
    ?conditional_token:(conditional_token_ : conditional_token option)
    ?runtime_environment_update:(runtime_environment_update_ : runtime_environment option)
    ~application_name:(application_name_ : application_name) () =
  ({
     application_name = application_name_;
     current_application_version_id = current_application_version_id_;
     application_configuration_update = application_configuration_update_;
     service_execution_role_update = service_execution_role_update_;
     run_configuration_update = run_configuration_update_;
     cloud_watch_logging_option_updates = cloud_watch_logging_option_updates_;
     conditional_token = conditional_token_;
     runtime_environment_update = runtime_environment_update_;
   }
    : update_application_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : kinesis_analytics_ar_n)
    ~tag_keys:(tag_keys_ : tag_keys) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : kinesis_analytics_ar_n)
    ~tags:(tags_ : tags) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_stop_application_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : stop_application_response)

let make_stop_application_request ?force:(force_ : boolean_object option)
    ~application_name:(application_name_ : application_name) () =
  ({ application_name = application_name_; force = force_ } : stop_application_request)

let make_start_application_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : start_application_response)

let make_sql_run_configuration ~input_id:(input_id_ : id)
    ~input_starting_position_configuration:
      (input_starting_position_configuration_ : input_starting_position_configuration) () =
  ({
     input_id = input_id_;
     input_starting_position_configuration = input_starting_position_configuration_;
   }
    : sql_run_configuration)

let make_run_configuration
    ?flink_run_configuration:(flink_run_configuration_ : flink_run_configuration option)
    ?sql_run_configurations:(sql_run_configurations_ : sql_run_configurations option)
    ?application_restore_configuration:
      (application_restore_configuration_ : application_restore_configuration option) () =
  ({
     flink_run_configuration = flink_run_configuration_;
     sql_run_configurations = sql_run_configurations_;
     application_restore_configuration = application_restore_configuration_;
   }
    : run_configuration)

let make_start_application_request
    ?run_configuration:(run_configuration_ : run_configuration option)
    ~application_name:(application_name_ : application_name) () =
  ({ application_name = application_name_; run_configuration = run_configuration_ }
    : start_application_request)

let make_rollback_application_response ?operation_id:(operation_id_ : operation_id option)
    ~application_detail:(application_detail_ : application_detail) () =
  ({ application_detail = application_detail_; operation_id = operation_id_ }
    : rollback_application_response)

let make_rollback_application_request ~application_name:(application_name_ : application_name)
    ~current_application_version_id:(current_application_version_id_ : application_version_id) () =
  ({
     application_name = application_name_;
     current_application_version_id = current_application_version_id_;
   }
    : rollback_application_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : kinesis_analytics_ar_n) ()
    =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_list_application_versions_response
    ?application_version_summaries:
      (application_version_summaries_ : application_version_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ application_version_summaries = application_version_summaries_; next_token = next_token_ }
    : list_application_versions_response)

let make_list_application_versions_request
    ?limit:(limit_ : list_application_versions_input_limit option)
    ?next_token:(next_token_ : next_token option)
    ~application_name:(application_name_ : application_name) () =
  ({ application_name = application_name_; limit = limit_; next_token = next_token_ }
    : list_application_versions_request)

let make_list_application_snapshots_response
    ?snapshot_summaries:(snapshot_summaries_ : snapshot_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ snapshot_summaries = snapshot_summaries_; next_token = next_token_ }
    : list_application_snapshots_response)

let make_list_application_snapshots_request ?limit:(limit_ : list_snapshots_input_limit option)
    ?next_token:(next_token_ : next_token option)
    ~application_name:(application_name_ : application_name) () =
  ({ application_name = application_name_; limit = limit_; next_token = next_token_ }
    : list_application_snapshots_request)

let make_list_applications_response ?next_token:(next_token_ : application_name option)
    ~application_summaries:(application_summaries_ : application_summaries) () =
  ({ application_summaries = application_summaries_; next_token = next_token_ }
    : list_applications_response)

let make_list_applications_request ?limit:(limit_ : list_applications_input_limit option)
    ?next_token:(next_token_ : application_name option) () =
  ({ limit = limit_; next_token = next_token_ } : list_applications_request)

let make_list_application_operations_response
    ?application_operation_info_list:
      (application_operation_info_list_ : application_operation_info_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ application_operation_info_list = application_operation_info_list_; next_token = next_token_ }
    : list_application_operations_response)

let make_list_application_operations_request
    ?limit:(limit_ : list_application_operations_input_limit option)
    ?next_token:(next_token_ : next_token option) ?operation:(operation_ : operation option)
    ?operation_status:(operation_status_ : operation_status option)
    ~application_name:(application_name_ : application_name) () =
  ({
     application_name = application_name_;
     limit = limit_;
     next_token = next_token_;
     operation = operation_;
     operation_status = operation_status_;
   }
    : list_application_operations_request)
