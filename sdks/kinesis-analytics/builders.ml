open Smaws_Lib
open Types
let make_update_application_response () = (() : unit)
let make_input_lambda_processor_update
  ?role_arn_update:(role_arn_update_ : string option)
  ?resource_arn_update:(resource_arn_update_ : string option) () =
  ({
     role_arn_update = role_arn_update_;
     resource_arn_update = resource_arn_update_
   } : input_lambda_processor_update)
let make_input_processing_configuration_update
  ~input_lambda_processor_update:(input_lambda_processor_update_ :
                                   input_lambda_processor_update)
  () =
  ({ input_lambda_processor_update = input_lambda_processor_update_ } : 
  input_processing_configuration_update)
let make_kinesis_streams_input_update
  ?role_arn_update:(role_arn_update_ : string option)
  ?resource_arn_update:(resource_arn_update_ : string option) () =
  ({
     role_arn_update = role_arn_update_;
     resource_arn_update = resource_arn_update_
   } : kinesis_streams_input_update)
let make_kinesis_firehose_input_update
  ?role_arn_update:(role_arn_update_ : string option)
  ?resource_arn_update:(resource_arn_update_ : string option) () =
  ({
     role_arn_update = role_arn_update_;
     resource_arn_update = resource_arn_update_
   } : kinesis_firehose_input_update)
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
let make_input_schema_update
  ?record_column_updates:(record_column_updates_ : record_column list option)
  ?record_encoding_update:(record_encoding_update_ : string option)
  ?record_format_update:(record_format_update_ : record_format option) () =
  ({
     record_column_updates = record_column_updates_;
     record_encoding_update = record_encoding_update_;
     record_format_update = record_format_update_
   } : input_schema_update)
let make_input_parallelism_update ?count_update:(count_update_ : int option)
  () = ({ count_update = count_update_ } : input_parallelism_update)
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
  ?role_arn_update:(role_arn_update_ : string option)
  ?resource_arn_update:(resource_arn_update_ : string option) () =
  ({
     role_arn_update = role_arn_update_;
     resource_arn_update = resource_arn_update_
   } : kinesis_streams_output_update)
let make_kinesis_firehose_output_update
  ?role_arn_update:(role_arn_update_ : string option)
  ?resource_arn_update:(resource_arn_update_ : string option) () =
  ({
     role_arn_update = role_arn_update_;
     resource_arn_update = resource_arn_update_
   } : kinesis_firehose_output_update)
let make_lambda_output_update
  ?role_arn_update:(role_arn_update_ : string option)
  ?resource_arn_update:(resource_arn_update_ : string option) () =
  ({
     role_arn_update = role_arn_update_;
     resource_arn_update = resource_arn_update_
   } : lambda_output_update)
let make_destination_schema
  ~record_format_type:(record_format_type_ : record_format_type) () =
  ({ record_format_type = record_format_type_ } : destination_schema)
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
  ?reference_role_arn_update:(reference_role_arn_update_ : string option)
  ?file_key_update:(file_key_update_ : string option)
  ?bucket_arn_update:(bucket_arn_update_ : string option) () =
  ({
     reference_role_arn_update = reference_role_arn_update_;
     file_key_update = file_key_update_;
     bucket_arn_update = bucket_arn_update_
   } : s3_reference_data_source_update)
let make_source_schema ?record_encoding:(record_encoding_ : string option)
  ~record_columns:(record_columns_ : record_column list)
  ~record_format:(record_format_ : record_format) () =
  ({
     record_columns = record_columns_;
     record_encoding = record_encoding_;
     record_format = record_format_
   } : source_schema)
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
let make_cloud_watch_logging_option_update
  ?role_arn_update:(role_arn_update_ : string option)
  ?log_stream_arn_update:(log_stream_arn_update_ : string option)
  ~cloud_watch_logging_option_id:(cloud_watch_logging_option_id_ : string) ()
  =
  ({
     role_arn_update = role_arn_update_;
     log_stream_arn_update = log_stream_arn_update_;
     cloud_watch_logging_option_id = cloud_watch_logging_option_id_
   } : cloud_watch_logging_option_update)
let make_application_update
  ?cloud_watch_logging_option_updates:(cloud_watch_logging_option_updates_ :
                                        cloud_watch_logging_option_update
                                          list option)
  ?reference_data_source_updates:(reference_data_source_updates_ :
                                   reference_data_source_update list option)
  ?output_updates:(output_updates_ : output_update list option)
  ?application_code_update:(application_code_update_ : string option)
  ?input_updates:(input_updates_ : input_update list option) () =
  ({
     cloud_watch_logging_option_updates = cloud_watch_logging_option_updates_;
     reference_data_source_updates = reference_data_source_updates_;
     output_updates = output_updates_;
     application_code_update = application_code_update_;
     input_updates = input_updates_
   } : application_update)
let make_update_application_request
  ~application_update:(application_update_ : application_update)
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     application_update = application_update_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : update_application_request)
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
let make_stop_application_response () = (() : unit)
let make_stop_application_request
  ~application_name:(application_name_ : string) () =
  ({ application_name = application_name_ } : stop_application_request)
let make_start_application_response () = (() : unit)
let make_input_starting_position_configuration
  ?input_starting_position:(input_starting_position_ :
                             input_starting_position option)
  () =
  ({ input_starting_position = input_starting_position_ } : input_starting_position_configuration)
let make_input_configuration
  ~input_starting_position_configuration:(input_starting_position_configuration_
                                           :
                                           input_starting_position_configuration)
  ~id:(id_ : string) () =
  ({
     input_starting_position_configuration =
       input_starting_position_configuration_;
     id = id_
   } : input_configuration)
let make_start_application_request
  ~input_configurations:(input_configurations_ : input_configuration list)
  ~application_name:(application_name_ : string) () =
  ({
     input_configurations = input_configurations_;
     application_name = application_name_
   } : start_application_request)
let make_s3_reference_data_source_description
  ~reference_role_ar_n:(reference_role_ar_n_ : string)
  ~file_key:(file_key_ : string) ~bucket_ar_n:(bucket_ar_n_ : string) () =
  ({
     reference_role_ar_n = reference_role_ar_n_;
     file_key = file_key_;
     bucket_ar_n = bucket_ar_n_
   } : s3_reference_data_source_description)
let make_s3_reference_data_source
  ~reference_role_ar_n:(reference_role_ar_n_ : string)
  ~file_key:(file_key_ : string) ~bucket_ar_n:(bucket_ar_n_ : string) () =
  ({
     reference_role_ar_n = reference_role_ar_n_;
     file_key = file_key_;
     bucket_ar_n = bucket_ar_n_
   } : s3_reference_data_source)
let make_s3_configuration ~file_key:(file_key_ : string)
  ~bucket_ar_n:(bucket_ar_n_ : string) ~role_ar_n:(role_ar_n_ : string) () =
  ({ file_key = file_key_; bucket_ar_n = bucket_ar_n_; role_ar_n = role_ar_n_
   } : s3_configuration)
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
let make_kinesis_streams_output ~role_ar_n:(role_ar_n_ : string)
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : kinesis_streams_output)
let make_kinesis_firehose_output ~role_ar_n:(role_ar_n_ : string)
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : kinesis_firehose_output)
let make_lambda_output ~role_ar_n:(role_ar_n_ : string)
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : lambda_output)
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
let make_kinesis_streams_output_description
  ?role_ar_n:(role_ar_n_ : string option)
  ?resource_ar_n:(resource_ar_n_ : string option) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : kinesis_streams_output_description)
let make_kinesis_firehose_output_description
  ?role_ar_n:(role_ar_n_ : string option)
  ?resource_ar_n:(resource_ar_n_ : string option) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : kinesis_firehose_output_description)
let make_lambda_output_description ?role_ar_n:(role_ar_n_ : string option)
  ?resource_ar_n:(resource_ar_n_ : string option) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : lambda_output_description)
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
let make_list_tags_for_resource_response ?tags:(tags_ : tag list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)
let make_list_tags_for_resource_request
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)
let make_application_summary
  ~application_status:(application_status_ : application_status)
  ~application_ar_n:(application_ar_n_ : string)
  ~application_name:(application_name_ : string) () =
  ({
     application_status = application_status_;
     application_ar_n = application_ar_n_;
     application_name = application_name_
   } : application_summary)
let make_list_applications_response
  ~has_more_applications:(has_more_applications_ : bool)
  ~application_summaries:(application_summaries_ : application_summary list)
  () =
  ({
     has_more_applications = has_more_applications_;
     application_summaries = application_summaries_
   } : list_applications_response)
let make_list_applications_request
  ?exclusive_start_application_name:(exclusive_start_application_name_ :
                                      string option)
  ?limit:(limit_ : int option) () =
  ({
     exclusive_start_application_name = exclusive_start_application_name_;
     limit = limit_
   } : list_applications_request)
let make_kinesis_streams_input_description
  ?role_ar_n:(role_ar_n_ : string option)
  ?resource_ar_n:(resource_ar_n_ : string option) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : kinesis_streams_input_description)
let make_kinesis_streams_input ~role_ar_n:(role_ar_n_ : string)
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : kinesis_streams_input)
let make_kinesis_firehose_input_description
  ?role_ar_n:(role_ar_n_ : string option)
  ?resource_ar_n:(resource_ar_n_ : string option) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : kinesis_firehose_input_description)
let make_kinesis_firehose_input ~role_ar_n:(role_ar_n_ : string)
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : kinesis_firehose_input)
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
let make_input_lambda_processor ~role_ar_n:(role_ar_n_ : string)
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : input_lambda_processor)
let make_input_processing_configuration
  ~input_lambda_processor:(input_lambda_processor_ : input_lambda_processor)
  () =
  ({ input_lambda_processor = input_lambda_processor_ } : input_processing_configuration)
let make_discover_input_schema_request
  ?input_processing_configuration:(input_processing_configuration_ :
                                    input_processing_configuration option)
  ?s3_configuration:(s3_configuration_ : s3_configuration option)
  ?input_starting_position_configuration:(input_starting_position_configuration_
                                           :
                                           input_starting_position_configuration
                                             option)
  ?role_ar_n:(role_ar_n_ : string option)
  ?resource_ar_n:(resource_ar_n_ : string option) () =
  ({
     input_processing_configuration = input_processing_configuration_;
     s3_configuration = s3_configuration_;
     input_starting_position_configuration =
       input_starting_position_configuration_;
     role_ar_n = role_ar_n_;
     resource_ar_n = resource_ar_n_
   } : discover_input_schema_request)
let make_input_lambda_processor_description
  ?role_ar_n:(role_ar_n_ : string option)
  ?resource_ar_n:(resource_ar_n_ : string option) () =
  ({ role_ar_n = role_ar_n_; resource_ar_n = resource_ar_n_ } : input_lambda_processor_description)
let make_input_processing_configuration_description
  ?input_lambda_processor_description:(input_lambda_processor_description_ :
                                        input_lambda_processor_description
                                          option)
  () =
  ({ input_lambda_processor_description = input_lambda_processor_description_
   } : input_processing_configuration_description)
let make_input_parallelism ?count:(count_ : int option) () =
  ({ count = count_ } : input_parallelism)
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
let make_cloud_watch_logging_option_description
  ?cloud_watch_logging_option_id:(cloud_watch_logging_option_id_ :
                                   string option)
  ~role_ar_n:(role_ar_n_ : string)
  ~log_stream_ar_n:(log_stream_ar_n_ : string) () =
  ({
     role_ar_n = role_ar_n_;
     log_stream_ar_n = log_stream_ar_n_;
     cloud_watch_logging_option_id = cloud_watch_logging_option_id_
   } : cloud_watch_logging_option_description)
let make_application_detail
  ?application_code:(application_code_ : string option)
  ?cloud_watch_logging_option_descriptions:(cloud_watch_logging_option_descriptions_
                                             :
                                             cloud_watch_logging_option_description
                                               list option)
  ?reference_data_source_descriptions:(reference_data_source_descriptions_ :
                                        reference_data_source_description
                                          list option)
  ?output_descriptions:(output_descriptions_ :
                         output_description list option)
  ?input_descriptions:(input_descriptions_ : input_description list option)
  ?last_update_timestamp:(last_update_timestamp_ :
                           CoreTypes.Timestamp.t option)
  ?create_timestamp:(create_timestamp_ : CoreTypes.Timestamp.t option)
  ?application_description:(application_description_ : string option)
  ~application_version_id:(application_version_id_ : int)
  ~application_status:(application_status_ : application_status)
  ~application_ar_n:(application_ar_n_ : string)
  ~application_name:(application_name_ : string) () =
  ({
     application_version_id = application_version_id_;
     application_code = application_code_;
     cloud_watch_logging_option_descriptions =
       cloud_watch_logging_option_descriptions_;
     reference_data_source_descriptions = reference_data_source_descriptions_;
     output_descriptions = output_descriptions_;
     input_descriptions = input_descriptions_;
     last_update_timestamp = last_update_timestamp_;
     create_timestamp = create_timestamp_;
     application_status = application_status_;
     application_ar_n = application_ar_n_;
     application_description = application_description_;
     application_name = application_name_
   } : application_detail)
let make_describe_application_response
  ~application_detail:(application_detail_ : application_detail) () =
  ({ application_detail = application_detail_ } : describe_application_response)
let make_describe_application_request
  ~application_name:(application_name_ : string) () =
  ({ application_name = application_name_ } : describe_application_request)
let make_delete_application_reference_data_source_response () = (() : unit)
let make_delete_application_reference_data_source_request
  ~reference_id:(reference_id_ : string)
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     reference_id = reference_id_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : delete_application_reference_data_source_request)
let make_delete_application_output_response () = (() : unit)
let make_delete_application_output_request ~output_id:(output_id_ : string)
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     output_id = output_id_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : delete_application_output_request)
let make_delete_application_input_processing_configuration_response () =
  (() : unit)
let make_delete_application_input_processing_configuration_request
  ~input_id:(input_id_ : string)
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     input_id = input_id_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : delete_application_input_processing_configuration_request)
let make_delete_application_cloud_watch_logging_option_response () =
  (() : unit)
let make_delete_application_cloud_watch_logging_option_request
  ~cloud_watch_logging_option_id:(cloud_watch_logging_option_id_ : string)
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
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
let make_create_application_response
  ~application_summary:(application_summary_ : application_summary) () =
  ({ application_summary = application_summary_ } : create_application_response)
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
let make_cloud_watch_logging_option ~role_ar_n:(role_ar_n_ : string)
  ~log_stream_ar_n:(log_stream_ar_n_ : string) () =
  ({ role_ar_n = role_ar_n_; log_stream_ar_n = log_stream_ar_n_ } : cloud_watch_logging_option)
let make_create_application_request ?tags:(tags_ : tag list option)
  ?application_code:(application_code_ : string option)
  ?cloud_watch_logging_options:(cloud_watch_logging_options_ :
                                 cloud_watch_logging_option list option)
  ?outputs:(outputs_ : output list option)
  ?inputs:(inputs_ : input list option)
  ?application_description:(application_description_ : string option)
  ~application_name:(application_name_ : string) () =
  ({
     tags = tags_;
     application_code = application_code_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     outputs = outputs_;
     inputs = inputs_;
     application_description = application_description_;
     application_name = application_name_
   } : create_application_request)
let make_add_application_reference_data_source_response () = (() : unit)
let make_add_application_reference_data_source_request
  ~reference_data_source:(reference_data_source_ : reference_data_source)
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     reference_data_source = reference_data_source_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : add_application_reference_data_source_request)
let make_add_application_output_response () = (() : unit)
let make_add_application_output_request ~output:(output_ : output)
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     output = output_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : add_application_output_request)
let make_add_application_input_processing_configuration_response () =
  (() : unit)
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
let make_add_application_input_response () = (() : unit)
let make_add_application_input_request ~input:(input_ : input)
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     input = input_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : add_application_input_request)
let make_add_application_cloud_watch_logging_option_response () = (() : unit)
let make_add_application_cloud_watch_logging_option_request
  ~cloud_watch_logging_option:(cloud_watch_logging_option_ :
                                cloud_watch_logging_option)
  ~current_application_version_id:(current_application_version_id_ : int)
  ~application_name:(application_name_ : string) () =
  ({
     cloud_watch_logging_option = cloud_watch_logging_option_;
     current_application_version_id = current_application_version_id_;
     application_name = application_name_
   } : add_application_cloud_watch_logging_option_request)