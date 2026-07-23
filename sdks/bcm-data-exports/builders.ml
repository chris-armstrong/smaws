open Types

let make_validation_exception_field ~name:(name_ : generic_string)
    ~message:(message_ : generic_string) () =
  ({ name = name_; message = message_ } : validation_exception_field)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : arn)
    ~resource_tag_keys:(resource_tag_keys_ : resource_tag_key_list) () =
  ({ resource_arn = resource_arn_; resource_tag_keys = resource_tag_keys_ }
    : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_resource_tag ~key:(key_ : resource_tag_key) ~value:(value_ : resource_tag_value) () =
  ({ key = key_; value = value_ } : resource_tag)

let make_tag_resource_request ~resource_arn:(resource_arn_ : arn)
    ~resource_tags:(resource_tags_ : resource_tag_list) () =
  ({ resource_arn = resource_arn_; resource_tags = resource_tags_ } : tag_resource_request)

let make_list_tags_for_resource_response ?resource_tags:(resource_tags_ : resource_tag_list option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ resource_tags = resource_tags_; next_token = next_token_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option) ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_; max_results = max_results_; next_token = next_token_ }
    : list_tags_for_resource_request)

let make_table_property_description ?name:(name_ : generic_string option)
    ?valid_values:(valid_values_ : generic_string_list option)
    ?default_value:(default_value_ : generic_string option)
    ?description:(description_ : generic_string option) () =
  ({
     name = name_;
     valid_values = valid_values_;
     default_value = default_value_;
     description = description_;
   }
    : table_property_description)

let make_table ?table_name:(table_name_ : table_name option)
    ?description:(description_ : generic_string option)
    ?table_properties:(table_properties_ : table_property_description_list option) () =
  ({ table_name = table_name_; description = description_; table_properties = table_properties_ }
    : table)

let make_list_tables_response ?tables:(tables_ : table_list option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ tables = tables_; next_token = next_token_ } : list_tables_response)

let make_list_tables_request ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_tables_request)

let make_execution_status ?status_code:(status_code_ : execution_status_code option)
    ?status_reason:(status_reason_ : execution_status_reason option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?completed_at:(completed_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_updated_at:(last_updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     status_code = status_code_;
     status_reason = status_reason_;
     created_at = created_at_;
     completed_at = completed_at_;
     last_updated_at = last_updated_at_;
   }
    : execution_status)

let make_execution_reference ~execution_id:(execution_id_ : generic_string)
    ~execution_status:(execution_status_ : execution_status) () =
  ({ execution_id = execution_id_; execution_status = execution_status_ } : execution_reference)

let make_list_executions_response ?executions:(executions_ : execution_reference_list option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ executions = executions_; next_token = next_token_ } : list_executions_response)

let make_list_executions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option) ~export_arn:(export_arn_ : arn) () =
  ({ export_arn = export_arn_; max_results = max_results_; next_token = next_token_ }
    : list_executions_request)

let make_column ?name:(name_ : generic_string option) ?type_:(type__ : generic_string option)
    ?description:(description_ : generic_string option) () =
  ({ name = name_; type_ = type__; description = description_ } : column)

let make_get_table_response ?table_name:(table_name_ : table_name option)
    ?description:(description_ : generic_string option)
    ?table_properties:(table_properties_ : table_properties option)
    ?schema:(schema_ : column_list option) () =
  ({
     table_name = table_name_;
     description = description_;
     table_properties = table_properties_;
     schema = schema_;
   }
    : get_table_response)

let make_get_table_request ?table_properties:(table_properties_ : table_properties option)
    ~table_name:(table_name_ : table_name) () =
  ({ table_name = table_name_; table_properties = table_properties_ } : get_table_request)

let make_refresh_cadence ~frequency:(frequency_ : frequency_option) () =
  ({ frequency = frequency_ } : refresh_cadence)

let make_s3_output_configurations ~output_type:(output_type_ : s3_output_type)
    ~format:(format_ : format_option) ~compression:(compression_ : compression_option)
    ~overwrite:(overwrite_ : overwrite_option) () =
  ({
     output_type = output_type_;
     format = format_;
     compression = compression_;
     overwrite = overwrite_;
   }
    : s3_output_configurations)

let make_s3_destination ?s3_bucket_owner:(s3_bucket_owner_ : account_id option)
    ~s3_bucket:(s3_bucket_ : generic_string) ~s3_prefix:(s3_prefix_ : generic_string)
    ~s3_region:(s3_region_ : generic_string)
    ~s3_output_configurations:(s3_output_configurations_ : s3_output_configurations) () =
  ({
     s3_bucket = s3_bucket_;
     s3_bucket_owner = s3_bucket_owner_;
     s3_prefix = s3_prefix_;
     s3_region = s3_region_;
     s3_output_configurations = s3_output_configurations_;
   }
    : s3_destination)

let make_destination_configurations ~s3_destination:(s3_destination_ : s3_destination) () =
  ({ s3_destination = s3_destination_ } : destination_configurations)

let make_data_query ?table_configurations:(table_configurations_ : table_configurations option)
    ~query_statement:(query_statement_ : query_statement) () =
  ({ query_statement = query_statement_; table_configurations = table_configurations_ }
    : data_query)

let make_export_ ?export_arn:(export_arn_ : arn option)
    ?description:(description_ : generic_string option) ~name:(name_ : export_name)
    ~data_query:(data_query_ : data_query)
    ~destination_configurations:(destination_configurations_ : destination_configurations)
    ~refresh_cadence:(refresh_cadence_ : refresh_cadence) () =
  ({
     export_arn = export_arn_;
     name = name_;
     description = description_;
     data_query = data_query_;
     destination_configurations = destination_configurations_;
     refresh_cadence = refresh_cadence_;
   }
    : export_)

let make_get_execution_response ?execution_id:(execution_id_ : generic_string option)
    ?export_:(export__ : export_ option)
    ?execution_status:(execution_status_ : execution_status option) () =
  ({ execution_id = execution_id_; export_ = export__; execution_status = execution_status_ }
    : get_execution_response)

let make_get_execution_request ~export_arn:(export_arn_ : arn)
    ~execution_id:(execution_id_ : generic_string) () =
  ({ export_arn = export_arn_; execution_id = execution_id_ } : get_execution_request)

let make_create_export_response ?export_arn:(export_arn_ : arn option) () =
  ({ export_arn = export_arn_ } : create_export_response)

let make_create_export_request ?resource_tags:(resource_tags_ : resource_tag_list option)
    ~export_:(export__ : export_) () =
  ({ export_ = export__; resource_tags = resource_tags_ } : create_export_request)

let make_delete_export_response ?export_arn:(export_arn_ : arn option) () =
  ({ export_arn = export_arn_ } : delete_export_response)

let make_delete_export_request ~export_arn:(export_arn_ : arn) () =
  ({ export_arn = export_arn_ } : delete_export_request)

let make_export_status ?status_code:(status_code_ : export_status_code option)
    ?status_reason:(status_reason_ : execution_status_reason option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_updated_at:(last_updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_refreshed_at:(last_refreshed_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     status_code = status_code_;
     status_reason = status_reason_;
     created_at = created_at_;
     last_updated_at = last_updated_at_;
     last_refreshed_at = last_refreshed_at_;
   }
    : export_status)

let make_export_reference ~export_arn:(export_arn_ : arn) ~export_name:(export_name_ : export_name)
    ~export_status:(export_status_ : export_status) () =
  ({ export_arn = export_arn_; export_name = export_name_; export_status = export_status_ }
    : export_reference)

let make_get_export_response ?export_:(export__ : export_ option)
    ?export_status:(export_status_ : export_status option) () =
  ({ export_ = export__; export_status = export_status_ } : get_export_response)

let make_get_export_request ~export_arn:(export_arn_ : arn) () =
  ({ export_arn = export_arn_ } : get_export_request)

let make_list_exports_response ?exports:(exports_ : export_reference_list option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ exports = exports_; next_token = next_token_ } : list_exports_response)

let make_list_exports_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_exports_request)

let make_update_export_response ?export_arn:(export_arn_ : arn option) () =
  ({ export_arn = export_arn_ } : update_export_response)

let make_update_export_request ~export_arn:(export_arn_ : arn) ~export_:(export__ : export_) () =
  ({ export_arn = export_arn_; export_ = export__ } : update_export_request)
