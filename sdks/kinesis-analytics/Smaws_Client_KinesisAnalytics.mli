(** Kinesis Analytics client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_add_application_cloud_watch_logging_option_response : unit -> unit

val make_cloud_watch_logging_option :
  log_stream_ar_n:log_stream_ar_n -> role_ar_n:role_ar_n -> unit -> cloud_watch_logging_option

val make_add_application_cloud_watch_logging_option_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  cloud_watch_logging_option:cloud_watch_logging_option ->
  unit ->
  add_application_cloud_watch_logging_option_request

val make_add_application_input_response : unit -> unit

val make_record_column :
  ?mapping:record_column_mapping ->
  name:record_column_name ->
  sql_type:record_column_sql_type ->
  unit ->
  record_column

val make_csv_mapping_parameters :
  record_row_delimiter:record_row_delimiter ->
  record_column_delimiter:record_column_delimiter ->
  unit ->
  csv_mapping_parameters

val make_json_mapping_parameters :
  record_row_path:record_row_path -> unit -> json_mapping_parameters

val make_mapping_parameters :
  ?json_mapping_parameters:json_mapping_parameters ->
  ?csv_mapping_parameters:csv_mapping_parameters ->
  unit ->
  mapping_parameters

val make_record_format :
  ?mapping_parameters:mapping_parameters ->
  record_format_type:record_format_type ->
  unit ->
  record_format

val make_source_schema :
  ?record_encoding:record_encoding ->
  record_format:record_format ->
  record_columns:record_columns ->
  unit ->
  source_schema

val make_input_parallelism : ?count:input_parallelism_count -> unit -> input_parallelism

val make_kinesis_firehose_input :
  resource_ar_n:resource_ar_n -> role_ar_n:role_ar_n -> unit -> kinesis_firehose_input

val make_kinesis_streams_input :
  resource_ar_n:resource_ar_n -> role_ar_n:role_ar_n -> unit -> kinesis_streams_input

val make_input_lambda_processor :
  resource_ar_n:resource_ar_n -> role_ar_n:role_ar_n -> unit -> input_lambda_processor

val make_input_processing_configuration :
  input_lambda_processor:input_lambda_processor -> unit -> input_processing_configuration

val make_input :
  ?input_processing_configuration:input_processing_configuration ->
  ?kinesis_streams_input:kinesis_streams_input ->
  ?kinesis_firehose_input:kinesis_firehose_input ->
  ?input_parallelism:input_parallelism ->
  name_prefix:in_app_stream_name ->
  input_schema:source_schema ->
  unit ->
  input

val make_add_application_input_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  input:input ->
  unit ->
  add_application_input_request

val make_add_application_input_processing_configuration_response : unit -> unit

val make_add_application_input_processing_configuration_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  input_id:id ->
  input_processing_configuration:input_processing_configuration ->
  unit ->
  add_application_input_processing_configuration_request

val make_add_application_output_response : unit -> unit
val make_destination_schema : record_format_type:record_format_type -> unit -> destination_schema
val make_lambda_output : resource_ar_n:resource_ar_n -> role_ar_n:role_ar_n -> unit -> lambda_output

val make_kinesis_firehose_output :
  resource_ar_n:resource_ar_n -> role_ar_n:role_ar_n -> unit -> kinesis_firehose_output

val make_kinesis_streams_output :
  resource_ar_n:resource_ar_n -> role_ar_n:role_ar_n -> unit -> kinesis_streams_output

val make_output :
  ?kinesis_streams_output:kinesis_streams_output ->
  ?kinesis_firehose_output:kinesis_firehose_output ->
  ?lambda_output:lambda_output ->
  name:in_app_stream_name ->
  destination_schema:destination_schema ->
  unit ->
  output

val make_add_application_output_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  output:output ->
  unit ->
  add_application_output_request

val make_add_application_reference_data_source_response : unit -> unit

val make_s3_reference_data_source :
  bucket_ar_n:bucket_ar_n ->
  file_key:file_key ->
  reference_role_ar_n:role_ar_n ->
  unit ->
  s3_reference_data_source

val make_reference_data_source :
  ?s3_reference_data_source:s3_reference_data_source ->
  table_name:in_app_table_name ->
  reference_schema:source_schema ->
  unit ->
  reference_data_source

val make_add_application_reference_data_source_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  reference_data_source:reference_data_source ->
  unit ->
  add_application_reference_data_source_request

val make_cloud_watch_logging_option_description :
  ?cloud_watch_logging_option_id:id ->
  log_stream_ar_n:log_stream_ar_n ->
  role_ar_n:role_ar_n ->
  unit ->
  cloud_watch_logging_option_description

val make_s3_reference_data_source_description :
  bucket_ar_n:bucket_ar_n ->
  file_key:file_key ->
  reference_role_ar_n:role_ar_n ->
  unit ->
  s3_reference_data_source_description

val make_reference_data_source_description :
  ?reference_schema:source_schema ->
  reference_id:id ->
  table_name:in_app_table_name ->
  s3_reference_data_source_description:s3_reference_data_source_description ->
  unit ->
  reference_data_source_description

val make_lambda_output_description :
  ?resource_ar_n:resource_ar_n -> ?role_ar_n:role_ar_n -> unit -> lambda_output_description

val make_kinesis_firehose_output_description :
  ?resource_ar_n:resource_ar_n ->
  ?role_ar_n:role_ar_n ->
  unit ->
  kinesis_firehose_output_description

val make_kinesis_streams_output_description :
  ?resource_ar_n:resource_ar_n -> ?role_ar_n:role_ar_n -> unit -> kinesis_streams_output_description

val make_output_description :
  ?output_id:id ->
  ?name:in_app_stream_name ->
  ?kinesis_streams_output_description:kinesis_streams_output_description ->
  ?kinesis_firehose_output_description:kinesis_firehose_output_description ->
  ?lambda_output_description:lambda_output_description ->
  ?destination_schema:destination_schema ->
  unit ->
  output_description

val make_input_starting_position_configuration :
  ?input_starting_position:input_starting_position -> unit -> input_starting_position_configuration

val make_kinesis_firehose_input_description :
  ?resource_ar_n:resource_ar_n -> ?role_ar_n:role_ar_n -> unit -> kinesis_firehose_input_description

val make_kinesis_streams_input_description :
  ?resource_ar_n:resource_ar_n -> ?role_ar_n:role_ar_n -> unit -> kinesis_streams_input_description

val make_input_lambda_processor_description :
  ?resource_ar_n:resource_ar_n -> ?role_ar_n:role_ar_n -> unit -> input_lambda_processor_description

val make_input_processing_configuration_description :
  ?input_lambda_processor_description:input_lambda_processor_description ->
  unit ->
  input_processing_configuration_description

val make_input_description :
  ?input_id:id ->
  ?name_prefix:in_app_stream_name ->
  ?in_app_stream_names:in_app_stream_names ->
  ?input_processing_configuration_description:input_processing_configuration_description ->
  ?kinesis_streams_input_description:kinesis_streams_input_description ->
  ?kinesis_firehose_input_description:kinesis_firehose_input_description ->
  ?input_schema:source_schema ->
  ?input_parallelism:input_parallelism ->
  ?input_starting_position_configuration:input_starting_position_configuration ->
  unit ->
  input_description

val make_application_detail :
  ?application_description:application_description ->
  ?create_timestamp:timestamp ->
  ?last_update_timestamp:timestamp ->
  ?input_descriptions:input_descriptions ->
  ?output_descriptions:output_descriptions ->
  ?reference_data_source_descriptions:reference_data_source_descriptions ->
  ?cloud_watch_logging_option_descriptions:cloud_watch_logging_option_descriptions ->
  ?application_code:application_code ->
  application_name:application_name ->
  application_ar_n:resource_ar_n ->
  application_status:application_status ->
  application_version_id:application_version_id ->
  unit ->
  application_detail

val make_application_summary :
  application_name:application_name ->
  application_ar_n:resource_ar_n ->
  application_status:application_status ->
  unit ->
  application_summary

val make_cloud_watch_logging_option_update :
  ?log_stream_arn_update:log_stream_ar_n ->
  ?role_arn_update:role_ar_n ->
  cloud_watch_logging_option_id:id ->
  unit ->
  cloud_watch_logging_option_update

val make_s3_reference_data_source_update :
  ?bucket_arn_update:bucket_ar_n ->
  ?file_key_update:file_key ->
  ?reference_role_arn_update:role_ar_n ->
  unit ->
  s3_reference_data_source_update

val make_reference_data_source_update :
  ?table_name_update:in_app_table_name ->
  ?s3_reference_data_source_update:s3_reference_data_source_update ->
  ?reference_schema_update:source_schema ->
  reference_id:id ->
  unit ->
  reference_data_source_update

val make_lambda_output_update :
  ?resource_arn_update:resource_ar_n -> ?role_arn_update:role_ar_n -> unit -> lambda_output_update

val make_kinesis_firehose_output_update :
  ?resource_arn_update:resource_ar_n ->
  ?role_arn_update:role_ar_n ->
  unit ->
  kinesis_firehose_output_update

val make_kinesis_streams_output_update :
  ?resource_arn_update:resource_ar_n ->
  ?role_arn_update:role_ar_n ->
  unit ->
  kinesis_streams_output_update

val make_output_update :
  ?name_update:in_app_stream_name ->
  ?kinesis_streams_output_update:kinesis_streams_output_update ->
  ?kinesis_firehose_output_update:kinesis_firehose_output_update ->
  ?lambda_output_update:lambda_output_update ->
  ?destination_schema_update:destination_schema ->
  output_id:id ->
  unit ->
  output_update

val make_input_parallelism_update :
  ?count_update:input_parallelism_count -> unit -> input_parallelism_update

val make_input_schema_update :
  ?record_format_update:record_format ->
  ?record_encoding_update:record_encoding ->
  ?record_column_updates:record_columns ->
  unit ->
  input_schema_update

val make_kinesis_firehose_input_update :
  ?resource_arn_update:resource_ar_n ->
  ?role_arn_update:role_ar_n ->
  unit ->
  kinesis_firehose_input_update

val make_kinesis_streams_input_update :
  ?resource_arn_update:resource_ar_n ->
  ?role_arn_update:role_ar_n ->
  unit ->
  kinesis_streams_input_update

val make_input_lambda_processor_update :
  ?resource_arn_update:resource_ar_n ->
  ?role_arn_update:role_ar_n ->
  unit ->
  input_lambda_processor_update

val make_input_processing_configuration_update :
  input_lambda_processor_update:input_lambda_processor_update ->
  unit ->
  input_processing_configuration_update

val make_input_update :
  ?name_prefix_update:in_app_stream_name ->
  ?input_processing_configuration_update:input_processing_configuration_update ->
  ?kinesis_streams_input_update:kinesis_streams_input_update ->
  ?kinesis_firehose_input_update:kinesis_firehose_input_update ->
  ?input_schema_update:input_schema_update ->
  ?input_parallelism_update:input_parallelism_update ->
  input_id:id ->
  unit ->
  input_update

val make_application_update :
  ?input_updates:input_updates ->
  ?application_code_update:application_code ->
  ?output_updates:output_updates ->
  ?reference_data_source_updates:reference_data_source_updates ->
  ?cloud_watch_logging_option_updates:cloud_watch_logging_option_updates ->
  unit ->
  application_update

val make_create_application_response :
  application_summary:application_summary -> unit -> create_application_response

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_create_application_request :
  ?application_description:application_description ->
  ?inputs:inputs ->
  ?outputs:outputs ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?application_code:application_code ->
  ?tags:tags ->
  application_name:application_name ->
  unit ->
  create_application_request

val make_delete_application_response : unit -> unit

val make_delete_application_request :
  application_name:application_name ->
  create_timestamp:timestamp ->
  unit ->
  delete_application_request

val make_delete_application_cloud_watch_logging_option_response : unit -> unit

val make_delete_application_cloud_watch_logging_option_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  cloud_watch_logging_option_id:id ->
  unit ->
  delete_application_cloud_watch_logging_option_request

val make_delete_application_input_processing_configuration_response : unit -> unit

val make_delete_application_input_processing_configuration_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  input_id:id ->
  unit ->
  delete_application_input_processing_configuration_request

val make_delete_application_output_response : unit -> unit

val make_delete_application_output_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  output_id:id ->
  unit ->
  delete_application_output_request

val make_delete_application_reference_data_source_response : unit -> unit

val make_delete_application_reference_data_source_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  reference_id:id ->
  unit ->
  delete_application_reference_data_source_request

val make_describe_application_response :
  application_detail:application_detail -> unit -> describe_application_response

val make_describe_application_request :
  application_name:application_name -> unit -> describe_application_request

val make_discover_input_schema_response :
  ?input_schema:source_schema ->
  ?parsed_input_records:parsed_input_records ->
  ?processed_input_records:processed_input_records ->
  ?raw_input_records:raw_input_records ->
  unit ->
  discover_input_schema_response

val make_s3_configuration :
  role_ar_n:role_ar_n -> bucket_ar_n:bucket_ar_n -> file_key:file_key -> unit -> s3_configuration

val make_discover_input_schema_request :
  ?resource_ar_n:resource_ar_n ->
  ?role_ar_n:role_ar_n ->
  ?input_starting_position_configuration:input_starting_position_configuration ->
  ?s3_configuration:s3_configuration ->
  ?input_processing_configuration:input_processing_configuration ->
  unit ->
  discover_input_schema_request

val make_input_configuration :
  id:id ->
  input_starting_position_configuration:input_starting_position_configuration ->
  unit ->
  input_configuration

val make_update_application_response : unit -> unit

val make_update_application_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  application_update:application_update ->
  unit ->
  update_application_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:kinesis_analytics_ar_n -> tag_keys:tag_keys -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:kinesis_analytics_ar_n -> tags:tags -> unit -> tag_resource_request

val make_stop_application_response : unit -> unit

val make_stop_application_request :
  application_name:application_name -> unit -> stop_application_request

val make_start_application_response : unit -> unit

val make_start_application_request :
  application_name:application_name ->
  input_configurations:input_configurations ->
  unit ->
  start_application_request

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:kinesis_analytics_ar_n -> unit -> list_tags_for_resource_request

val make_list_applications_response :
  application_summaries:application_summaries ->
  has_more_applications:boolean_object ->
  unit ->
  list_applications_response

val make_list_applications_request :
  ?limit:list_applications_input_limit ->
  ?exclusive_start_application_name:application_name ->
  unit ->
  list_applications_request
(** {1:operations Operations} *)

module ListApplications : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_applications_request ->
    (list_applications_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_applications_request ->
    ( list_applications_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \   Returns a list of Amazon Kinesis Analytics applications in your account. For each \
   application, the response includes the application name, Amazon Resource Name (ARN), and \
   status. If the response returns the [HasMoreApplications] value as true, you can send another \
   request by adding the [ExclusiveStartApplicationName] in the request body, and set the value of \
   this to the last application name from the previous response. \n\
  \   \n\
  \    If you want detailed information about a specific application, use \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication}.\n\
  \    \n\
  \     This operation requires permissions to perform the [kinesisanalytics:ListApplications] \
   action.\n\
  \     "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the list of key-value tags assigned to the application. For more information, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html}Using Tagging}.\n"]

module StartApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_application_request ->
    ( start_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_application_request ->
    ( start_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \   Starts the specified Amazon Kinesis Analytics application. After creating an application, \
   you must exclusively call this operation to start your application.\n\
  \   \n\
  \    After the application starts, it begins consuming the input data, processes it, and writes \
   the output to the configured destination.\n\
  \    \n\
  \      The application status must be [READY] for you to start an application. You can get the \
   application status in the console or using the \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} \
   operation.\n\
  \     \n\
  \      After you start the application, you can stop the application from processing the input \
   by calling the \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_StopApplication.html}StopApplication} \
   operation.\n\
  \      \n\
  \       This operation requires permissions to perform the [kinesisanalytics:StartApplication] \
   action.\n\
  \       "]

module StopApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_application_request ->
    ( stop_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_application_request ->
    ( stop_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \   Stops the application from processing input data. You can stop an application only if it is \
   in the running state. You can use the \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} \
   operation to find the application state. After the application is stopped, Amazon Kinesis \
   Analytics stops reading data from the input, the application stops processing data, and there \
   is no output written to the destination. \n\
  \   \n\
  \    This operation requires permissions to perform the [kinesisanalytics:StopApplication] action.\n\
  \    "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more key-value tags to a Kinesis Analytics application. Note that the maximum \
   number of application tags includes system tags. The maximum number of user-defined application \
   tags is 50. For more information, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html}Using Tagging}.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes one or more tags from a Kinesis Analytics application. For more information, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html}Using Tagging}.\n"]

module UpdateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeValidationException of code_validation_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_application_request ->
    ( update_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeValidationException of code_validation_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_application_request ->
    ( update_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeValidationException of code_validation_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \   Updates an existing Amazon Kinesis Analytics application. Using this API, you can update \
   application code, input configuration, and output configuration. \n\
  \   \n\
  \    Note that Amazon Kinesis Analytics updates the [CurrentApplicationVersionId] each time you \
   update your application. \n\
  \    \n\
  \     This operation requires permission for the [kinesisanalytics:UpdateApplication] action.\n\
  \     "]

module DiscoverInputSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceProvisionedThroughputExceededException of
      resource_provisioned_throughput_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `UnableToDetectSchemaException of unable_to_detect_schema_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    discover_input_schema_request ->
    ( discover_input_schema_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceProvisionedThroughputExceededException of
        resource_provisioned_throughput_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `UnableToDetectSchemaException of unable_to_detect_schema_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    discover_input_schema_request ->
    ( discover_input_schema_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceProvisionedThroughputExceededException of
        resource_provisioned_throughput_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `UnableToDetectSchemaException of unable_to_detect_schema_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \   Infers a schema by evaluating sample records on the specified streaming source (Amazon \
   Kinesis stream or Amazon Kinesis Firehose delivery stream) or S3 object. In the response, the \
   operation returns the inferred schema and also the sample records that the operation used to \
   infer the schema.\n\
  \   \n\
  \     You can use the inferred schema when configuring a streaming source for your application. \
   For conceptual information, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring \
   Application Input}. Note that when you create an application using the Amazon Kinesis Analytics \
   console, the console uses this operation to infer a schema and show it in the console user \
   interface. \n\
  \    \n\
  \      This operation requires permissions to perform the [kinesisanalytics:DiscoverInputSchema] \
   action. \n\
  \     "]

module DescribeApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_request ->
    ( describe_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_application_request ->
    ( describe_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \   Returns information about a specific Amazon Kinesis Analytics application.\n\
  \   \n\
  \    If you want to retrieve a list of all applications in your account, use the \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_ListApplications.html}ListApplications} \
   operation.\n\
  \    \n\
  \     This operation requires permissions to perform the [kinesisanalytics:DescribeApplication] \
   action. You can use [DescribeApplication] to get the current application versionId, which you \
   need to call other operations such as [Update]. \n\
  \     "]

module DeleteApplicationReferenceDataSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_reference_data_source_request ->
    ( delete_application_reference_data_source_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_reference_data_source_request ->
    ( delete_application_reference_data_source_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \   Deletes a reference data source configuration from the specified application configuration.\n\
  \   \n\
  \    If the application is running, Amazon Kinesis Analytics immediately removes the \
   in-application table that you created using the \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationReferenceDataSource.html}AddApplicationReferenceDataSource} \
   operation. \n\
  \    \n\
  \     This operation requires permissions to perform the \
   [kinesisanalytics.DeleteApplicationReferenceDataSource] action.\n\
  \     "]

module DeleteApplicationOutput : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_output_request ->
    ( delete_application_output_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_output_request ->
    ( delete_application_output_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \   Deletes output destination configuration from your application configuration. Amazon Kinesis \
   Analytics will no longer write data from the corresponding in-application stream to the \
   external output destination.\n\
  \   \n\
  \    This operation requires permissions to perform the \
   [kinesisanalytics:DeleteApplicationOutput] action.\n\
  \    "]

module DeleteApplicationInputProcessingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_input_processing_configuration_request ->
    ( delete_application_input_processing_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_input_processing_configuration_request ->
    ( delete_application_input_processing_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \   Deletes an \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html}InputProcessingConfiguration} \
   from an input.\n\
  \   "]

module DeleteApplicationCloudWatchLoggingOption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_cloud_watch_logging_option_request ->
    ( delete_application_cloud_watch_logging_option_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_cloud_watch_logging_option_request ->
    ( delete_application_cloud_watch_logging_option_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \   Deletes a CloudWatch log stream from an application. For more information about using \
   CloudWatch log streams with Amazon Kinesis Analytics applications, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html}Working with \
   Amazon CloudWatch Logs}.\n\
  \   "]

module DeleteApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_request ->
    ( delete_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_request ->
    ( delete_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \   Deletes the specified application. Amazon Kinesis Analytics halts application execution and \
   deletes the application, including any application artifacts (such as in-application streams, \
   reference table, and application code).\n\
  \   \n\
  \    This operation requires permissions to perform the [kinesisanalytics:DeleteApplication] \
   action.\n\
  \    "]

module CreateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeValidationException of code_validation_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeValidationException of code_validation_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeValidationException of code_validation_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \    Creates an Amazon Kinesis Analytics application. You can configure each application with \
   one streaming source as input, application code to process the input, and up to three \
   destinations where you want Amazon Kinesis Analytics to write the output data from your \
   application. For an overview, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works.html}How it Works}. \n\
  \   \n\
  \    In the input configuration, you map the streaming source to an in-application stream, which \
   you can think of as a constantly updating table. In the mapping, you must provide a schema for \
   the in-application stream and map each data column in the in-application stream to a data \
   element in the streaming source.\n\
  \    \n\
  \     Your application code is one or more SQL statements that read input data, transform it, \
   and generate output. Your application code can create one or more SQL artifacts like SQL \
   streams or pumps.\n\
  \     \n\
  \      In the output configuration, you can configure the application to write data from \
   in-application streams created in your applications to up to three destinations.\n\
  \      \n\
  \        To read data from your source stream or write data to destination streams, Amazon \
   Kinesis Analytics needs your permissions. You grant these permissions by creating IAM roles. \
   This operation requires permissions to perform the [kinesisanalytics:CreateApplication] action. \n\
  \       \n\
  \         For introductory exercises to create an Amazon Kinesis Analytics application, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/getting-started.html}Getting \
   Started}. \n\
  \        "]

module AddApplicationReferenceDataSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_reference_data_source_request ->
    ( add_application_reference_data_source_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_application_reference_data_source_request ->
    ( add_application_reference_data_source_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \   Adds a reference data source to an existing application.\n\
  \   \n\
  \    Amazon Kinesis Analytics reads reference data (that is, an Amazon S3 object) and creates an \
   in-application table within your application. In the request, you provide the source (S3 bucket \
   name and object key name), name of the in-application table to create, and the necessary \
   mapping information that describes how data in Amazon S3 object maps to columns in the \
   resulting in-application table.\n\
  \    \n\
  \      For conceptual information, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring \
   Application Input}. For the limits on data sources you can add to your application, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html}Limits}. \n\
  \     \n\
  \       This operation requires permissions to perform the \
   [kinesisanalytics:AddApplicationOutput] action. \n\
  \      "]

module AddApplicationOutput : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_output_request ->
    ( add_application_output_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_application_output_request ->
    ( add_application_output_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \   Adds an external destination to your Amazon Kinesis Analytics application.\n\
  \   \n\
  \    If you want Amazon Kinesis Analytics to deliver data from an in-application stream within \
   your application to an external destination (such as an Amazon Kinesis stream, an Amazon \
   Kinesis Firehose delivery stream, or an AWS Lambda function), you add the relevant \
   configuration to your application using this operation. You can configure one or more outputs \
   for your application. Each output configuration maps an in-application stream and an external \
   destination.\n\
  \    \n\
  \      You can use one of the output configurations to deliver data from your in-application \
   error stream to an external destination so that you can analyze the errors. For more \
   information, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html}Understanding \
   Application Output (Destination)}. \n\
  \     \n\
  \       Any configuration update, including adding a streaming source using this operation, \
   results in a new version of the application. You can use the \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} \
   operation to find the current application version.\n\
  \      \n\
  \       For the limits on the number of application inputs and outputs you can configure, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html}Limits}.\n\
  \       \n\
  \        This operation requires permissions to perform the \
   [kinesisanalytics:AddApplicationOutput] action.\n\
  \        "]

module AddApplicationInputProcessingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_input_processing_configuration_request ->
    ( add_application_input_processing_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_application_input_processing_configuration_request ->
    ( add_application_input_processing_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \   Adds an \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html}InputProcessingConfiguration} \
   to an application. An input processor preprocesses records on the input stream before the \
   application's SQL code executes. Currently, the only input processor available is \
   {{:https://docs.aws.amazon.com/lambda/}AWS Lambda}.\n\
  \   "]

module AddApplicationInput : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeValidationException of code_validation_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_input_request ->
    ( add_application_input_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeValidationException of code_validation_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_application_input_request ->
    ( add_application_input_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeValidationException of code_validation_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \    Adds a streaming source to your Amazon Kinesis application. For conceptual information, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html}Configuring \
   Application Input}. \n\
  \   \n\
  \    You can add a streaming source either when you create an application or you can use this \
   operation to add a streaming source after you create an application. For more information, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_CreateApplication.html}CreateApplication}.\n\
  \    \n\
  \     Any configuration update, including adding a streaming source using this operation, \
   results in a new version of the application. You can use the \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html}DescribeApplication} \
   operation to find the current application version. \n\
  \     \n\
  \      This operation requires permissions to perform the [kinesisanalytics:AddApplicationInput] \
   action.\n\
  \      "]

(** {1:Serialization and Deserialization} *)
module AddApplicationCloudWatchLoggingOption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_cloud_watch_logging_option_request ->
    ( add_application_cloud_watch_logging_option_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_application_cloud_watch_logging_option_request ->
    ( add_application_cloud_watch_logging_option_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This documentation is for version 1 of the Amazon Kinesis Data Analytics API, which only \
   supports SQL applications. Version 2 of the API supports SQL and Java applications. For more \
   information about version 2, see {{:/kinesisanalytics/latest/apiv2/Welcome.html}Amazon Kinesis \
   Data Analytics API V2 Documentation}.\n\
  \ \n\
  \   Adds a CloudWatch log stream to monitor application configuration errors. For more \
   information about using CloudWatch log streams with Amazon Kinesis Analytics applications, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html}Working with \
   Amazon CloudWatch Logs}.\n\
  \   "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
