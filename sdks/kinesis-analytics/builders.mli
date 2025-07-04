open Smaws_Lib
open Types
val make_update_application_response : unit -> unit
val make_input_lambda_processor_update :
  ?role_arn_update:string ->
    ?resource_arn_update:string -> unit -> input_lambda_processor_update
val make_input_processing_configuration_update :
  input_lambda_processor_update:input_lambda_processor_update ->
    unit -> input_processing_configuration_update
val make_kinesis_streams_input_update :
  ?role_arn_update:string ->
    ?resource_arn_update:string -> unit -> kinesis_streams_input_update
val make_kinesis_firehose_input_update :
  ?role_arn_update:string ->
    ?resource_arn_update:string -> unit -> kinesis_firehose_input_update
val make_json_mapping_parameters :
  record_row_path:string -> unit -> json_mapping_parameters
val make_csv_mapping_parameters :
  record_column_delimiter:string ->
    record_row_delimiter:string -> unit -> csv_mapping_parameters
val make_mapping_parameters :
  ?csv_mapping_parameters:csv_mapping_parameters ->
    ?json_mapping_parameters:json_mapping_parameters ->
      unit -> mapping_parameters
val make_record_format :
  ?mapping_parameters:mapping_parameters ->
    record_format_type:record_format_type -> unit -> record_format
val make_record_column :
  ?mapping:string -> sql_type:string -> name:string -> unit -> record_column
val make_input_schema_update :
  ?record_column_updates:record_column list ->
    ?record_encoding_update:string ->
      ?record_format_update:record_format -> unit -> input_schema_update
val make_input_parallelism_update :
  ?count_update:int -> unit -> input_parallelism_update
val make_input_update :
  ?input_parallelism_update:input_parallelism_update ->
    ?input_schema_update:input_schema_update ->
      ?kinesis_firehose_input_update:kinesis_firehose_input_update ->
        ?kinesis_streams_input_update:kinesis_streams_input_update ->
          ?input_processing_configuration_update:input_processing_configuration_update
            ->
            ?name_prefix_update:string ->
              input_id:string -> unit -> input_update
val make_kinesis_streams_output_update :
  ?role_arn_update:string ->
    ?resource_arn_update:string -> unit -> kinesis_streams_output_update
val make_kinesis_firehose_output_update :
  ?role_arn_update:string ->
    ?resource_arn_update:string -> unit -> kinesis_firehose_output_update
val make_lambda_output_update :
  ?role_arn_update:string ->
    ?resource_arn_update:string -> unit -> lambda_output_update
val make_destination_schema :
  record_format_type:record_format_type -> unit -> destination_schema
val make_output_update :
  ?destination_schema_update:destination_schema ->
    ?lambda_output_update:lambda_output_update ->
      ?kinesis_firehose_output_update:kinesis_firehose_output_update ->
        ?kinesis_streams_output_update:kinesis_streams_output_update ->
          ?name_update:string -> output_id:string -> unit -> output_update
val make_s3_reference_data_source_update :
  ?reference_role_arn_update:string ->
    ?file_key_update:string ->
      ?bucket_arn_update:string -> unit -> s3_reference_data_source_update
val make_source_schema :
  ?record_encoding:string ->
    record_columns:record_column list ->
      record_format:record_format -> unit -> source_schema
val make_reference_data_source_update :
  ?reference_schema_update:source_schema ->
    ?s3_reference_data_source_update:s3_reference_data_source_update ->
      ?table_name_update:string ->
        reference_id:string -> unit -> reference_data_source_update
val make_cloud_watch_logging_option_update :
  ?role_arn_update:string ->
    ?log_stream_arn_update:string ->
      cloud_watch_logging_option_id:string ->
        unit -> cloud_watch_logging_option_update
val make_application_update :
  ?cloud_watch_logging_option_updates:cloud_watch_logging_option_update list
    ->
    ?reference_data_source_updates:reference_data_source_update list ->
      ?output_updates:output_update list ->
        ?application_code_update:string ->
          ?input_updates:input_update list -> unit -> application_update
val make_update_application_request :
  application_update:application_update ->
    current_application_version_id:int ->
      application_name:string -> unit -> update_application_request
val make_untag_resource_response : unit -> unit
val make_untag_resource_request :
  tag_keys:string list ->
    resource_ar_n:string -> unit -> untag_resource_request
val make_tag : ?value:string -> key:string -> unit -> tag
val make_tag_resource_response : unit -> unit
val make_tag_resource_request :
  tags:tag list -> resource_ar_n:string -> unit -> tag_resource_request
val make_stop_application_response : unit -> unit
val make_stop_application_request :
  application_name:string -> unit -> stop_application_request
val make_start_application_response : unit -> unit
val make_input_starting_position_configuration :
  ?input_starting_position:input_starting_position ->
    unit -> input_starting_position_configuration
val make_input_configuration :
  input_starting_position_configuration:input_starting_position_configuration
    -> id:string -> unit -> input_configuration
val make_start_application_request :
  input_configurations:input_configuration list ->
    application_name:string -> unit -> start_application_request
val make_s3_reference_data_source_description :
  reference_role_ar_n:string ->
    file_key:string ->
      bucket_ar_n:string -> unit -> s3_reference_data_source_description
val make_s3_reference_data_source :
  reference_role_ar_n:string ->
    file_key:string -> bucket_ar_n:string -> unit -> s3_reference_data_source
val make_s3_configuration :
  file_key:string ->
    bucket_ar_n:string -> role_ar_n:string -> unit -> s3_configuration
val make_reference_data_source_description :
  ?reference_schema:source_schema ->
    s3_reference_data_source_description:s3_reference_data_source_description
      ->
      table_name:string ->
        reference_id:string -> unit -> reference_data_source_description
val make_reference_data_source :
  ?s3_reference_data_source:s3_reference_data_source ->
    reference_schema:source_schema ->
      table_name:string -> unit -> reference_data_source
val make_kinesis_streams_output :
  role_ar_n:string -> resource_ar_n:string -> unit -> kinesis_streams_output
val make_kinesis_firehose_output :
  role_ar_n:string -> resource_ar_n:string -> unit -> kinesis_firehose_output
val make_lambda_output :
  role_ar_n:string -> resource_ar_n:string -> unit -> lambda_output
val make_output :
  ?lambda_output:lambda_output ->
    ?kinesis_firehose_output:kinesis_firehose_output ->
      ?kinesis_streams_output:kinesis_streams_output ->
        destination_schema:destination_schema ->
          name:string -> unit -> output
val make_kinesis_streams_output_description :
  ?role_ar_n:string ->
    ?resource_ar_n:string -> unit -> kinesis_streams_output_description
val make_kinesis_firehose_output_description :
  ?role_ar_n:string ->
    ?resource_ar_n:string -> unit -> kinesis_firehose_output_description
val make_lambda_output_description :
  ?role_ar_n:string ->
    ?resource_ar_n:string -> unit -> lambda_output_description
val make_output_description :
  ?destination_schema:destination_schema ->
    ?lambda_output_description:lambda_output_description ->
      ?kinesis_firehose_output_description:kinesis_firehose_output_description
        ->
        ?kinesis_streams_output_description:kinesis_streams_output_description
          -> ?name:string -> ?output_id:string -> unit -> output_description
val make_list_tags_for_resource_response :
  ?tags:tag list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_ar_n:string -> unit -> list_tags_for_resource_request
val make_application_summary :
  application_status:application_status ->
    application_ar_n:string ->
      application_name:string -> unit -> application_summary
val make_list_applications_response :
  has_more_applications:bool ->
    application_summaries:application_summary list ->
      unit -> list_applications_response
val make_list_applications_request :
  ?exclusive_start_application_name:string ->
    ?limit:int -> unit -> list_applications_request
val make_kinesis_streams_input_description :
  ?role_ar_n:string ->
    ?resource_ar_n:string -> unit -> kinesis_streams_input_description
val make_kinesis_streams_input :
  role_ar_n:string -> resource_ar_n:string -> unit -> kinesis_streams_input
val make_kinesis_firehose_input_description :
  ?role_ar_n:string ->
    ?resource_ar_n:string -> unit -> kinesis_firehose_input_description
val make_kinesis_firehose_input :
  role_ar_n:string -> resource_ar_n:string -> unit -> kinesis_firehose_input
val make_discover_input_schema_response :
  ?raw_input_records:string list ->
    ?processed_input_records:string list ->
      ?parsed_input_records:string list list ->
        ?input_schema:source_schema -> unit -> discover_input_schema_response
val make_input_lambda_processor :
  role_ar_n:string -> resource_ar_n:string -> unit -> input_lambda_processor
val make_input_processing_configuration :
  input_lambda_processor:input_lambda_processor ->
    unit -> input_processing_configuration
val make_discover_input_schema_request :
  ?input_processing_configuration:input_processing_configuration ->
    ?s3_configuration:s3_configuration ->
      ?input_starting_position_configuration:input_starting_position_configuration
        ->
        ?role_ar_n:string ->
          ?resource_ar_n:string -> unit -> discover_input_schema_request
val make_input_lambda_processor_description :
  ?role_ar_n:string ->
    ?resource_ar_n:string -> unit -> input_lambda_processor_description
val make_input_processing_configuration_description :
  ?input_lambda_processor_description:input_lambda_processor_description ->
    unit -> input_processing_configuration_description
val make_input_parallelism : ?count:int -> unit -> input_parallelism
val make_input_description :
  ?input_starting_position_configuration:input_starting_position_configuration
    ->
    ?input_parallelism:input_parallelism ->
      ?input_schema:source_schema ->
        ?kinesis_firehose_input_description:kinesis_firehose_input_description
          ->
          ?kinesis_streams_input_description:kinesis_streams_input_description
            ->
            ?input_processing_configuration_description:input_processing_configuration_description
              ->
              ?in_app_stream_names:string list ->
                ?name_prefix:string ->
                  ?input_id:string -> unit -> input_description
val make_cloud_watch_logging_option_description :
  ?cloud_watch_logging_option_id:string ->
    role_ar_n:string ->
      log_stream_ar_n:string ->
        unit -> cloud_watch_logging_option_description
val make_application_detail :
  ?application_code:string ->
    ?cloud_watch_logging_option_descriptions:cloud_watch_logging_option_description
      list ->
      ?reference_data_source_descriptions:reference_data_source_description
        list ->
        ?output_descriptions:output_description list ->
          ?input_descriptions:input_description list ->
            ?last_update_timestamp:CoreTypes.Timestamp.t ->
              ?create_timestamp:CoreTypes.Timestamp.t ->
                ?application_description:string ->
                  application_version_id:int ->
                    application_status:application_status ->
                      application_ar_n:string ->
                        application_name:string -> unit -> application_detail
val make_describe_application_response :
  application_detail:application_detail ->
    unit -> describe_application_response
val make_describe_application_request :
  application_name:string -> unit -> describe_application_request
val make_delete_application_reference_data_source_response : unit -> unit
val make_delete_application_reference_data_source_request :
  reference_id:string ->
    current_application_version_id:int ->
      application_name:string ->
        unit -> delete_application_reference_data_source_request
val make_delete_application_output_response : unit -> unit
val make_delete_application_output_request :
  output_id:string ->
    current_application_version_id:int ->
      application_name:string -> unit -> delete_application_output_request
val make_delete_application_input_processing_configuration_response :
  unit -> unit
val make_delete_application_input_processing_configuration_request :
  input_id:string ->
    current_application_version_id:int ->
      application_name:string ->
        unit -> delete_application_input_processing_configuration_request
val make_delete_application_cloud_watch_logging_option_response :
  unit -> unit
val make_delete_application_cloud_watch_logging_option_request :
  cloud_watch_logging_option_id:string ->
    current_application_version_id:int ->
      application_name:string ->
        unit -> delete_application_cloud_watch_logging_option_request
val make_delete_application_response : unit -> unit
val make_delete_application_request :
  create_timestamp:CoreTypes.Timestamp.t ->
    application_name:string -> unit -> delete_application_request
val make_create_application_response :
  application_summary:application_summary ->
    unit -> create_application_response
val make_input :
  ?input_parallelism:input_parallelism ->
    ?kinesis_firehose_input:kinesis_firehose_input ->
      ?kinesis_streams_input:kinesis_streams_input ->
        ?input_processing_configuration:input_processing_configuration ->
          input_schema:source_schema -> name_prefix:string -> unit -> input
val make_cloud_watch_logging_option :
  role_ar_n:string ->
    log_stream_ar_n:string -> unit -> cloud_watch_logging_option
val make_create_application_request :
  ?tags:tag list ->
    ?application_code:string ->
      ?cloud_watch_logging_options:cloud_watch_logging_option list ->
        ?outputs:output list ->
          ?inputs:input list ->
            ?application_description:string ->
              application_name:string -> unit -> create_application_request
val make_add_application_reference_data_source_response : unit -> unit
val make_add_application_reference_data_source_request :
  reference_data_source:reference_data_source ->
    current_application_version_id:int ->
      application_name:string ->
        unit -> add_application_reference_data_source_request
val make_add_application_output_response : unit -> unit
val make_add_application_output_request :
  output:output ->
    current_application_version_id:int ->
      application_name:string -> unit -> add_application_output_request
val make_add_application_input_processing_configuration_response :
  unit -> unit
val make_add_application_input_processing_configuration_request :
  input_processing_configuration:input_processing_configuration ->
    input_id:string ->
      current_application_version_id:int ->
        application_name:string ->
          unit -> add_application_input_processing_configuration_request
val make_add_application_input_response : unit -> unit
val make_add_application_input_request :
  input:input ->
    current_application_version_id:int ->
      application_name:string -> unit -> add_application_input_request
val make_add_application_cloud_watch_logging_option_response : unit -> unit
val make_add_application_cloud_watch_logging_option_request :
  cloud_watch_logging_option:cloud_watch_logging_option ->
    current_application_version_id:int ->
      application_name:string ->
        unit -> add_application_cloud_watch_logging_option_request