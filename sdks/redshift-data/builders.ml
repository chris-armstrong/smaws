open Types

let make_table_member ?schema:(schema_ : string_ option) ?type_:(type__ : string_ option)
    ?name:(name_ : string_ option) () =
  ({ schema = schema_; type_ = type__; name = name_ } : table_member)

let make_sub_statement_data
    ?has_result_set:(has_result_set_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?redshift_query_id:(redshift_query_id_ : long option) ?result_size:(result_size_ : long option)
    ?result_rows:(result_rows_ : long option)
    ?query_string:(query_string_ : statement_string option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : statement_status_string option) ?error:(error_ : string_ option)
    ?duration:(duration_ : long option) ~id:(id_ : uui_d) () =
  ({
     has_result_set = has_result_set_;
     redshift_query_id = redshift_query_id_;
     result_size = result_size_;
     result_rows = result_rows_;
     query_string = query_string_;
     updated_at = updated_at_;
     created_at = created_at_;
     status = status_;
     error = error_;
     duration = duration_;
     id = id_;
   }
    : sub_statement_data)

let make_sql_parameter ~value:(value_ : parameter_value) ~name:(name_ : parameter_name) () =
  ({ value = value_; name = name_ } : sql_parameter)

let make_statement_data ?session_id:(session_id_ : uui_d option)
    ?result_format:(result_format_ : result_format_string option)
    ?is_batch_statement:(is_batch_statement_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?query_parameters:(query_parameters_ : sql_parameters_list option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?statement_name:(statement_name_ : statement_name_string option)
    ?status:(status_ : status_string option) ?secret_arn:(secret_arn_ : secret_arn option)
    ?query_strings:(query_strings_ : statement_string_list option)
    ?query_string:(query_string_ : statement_string option) ~id:(id_ : uui_d) () =
  ({
     session_id = session_id_;
     result_format = result_format_;
     is_batch_statement = is_batch_statement_;
     query_parameters = query_parameters_;
     updated_at = updated_at_;
     created_at = created_at_;
     statement_name = statement_name_;
     status = status_;
     secret_arn = secret_arn_;
     query_strings = query_strings_;
     query_string = query_string_;
     id = id_;
   }
    : statement_data)

let make_list_tables_response ?next_token:(next_token_ : string_ option)
    ?tables:(tables_ : table_list option) () =
  ({ next_token = next_token_; tables = tables_ } : list_tables_response)

let make_list_tables_request ?workgroup_name:(workgroup_name_ : workgroup_name_string option)
    ?max_results:(max_results_ : page_size option) ?next_token:(next_token_ : string_ option)
    ?table_pattern:(table_pattern_ : string_ option)
    ?schema_pattern:(schema_pattern_ : string_ option)
    ?connected_database:(connected_database_ : string_ option) ?db_user:(db_user_ : string_ option)
    ?secret_arn:(secret_arn_ : secret_arn option)
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ~database:(database_ : string_) () =
  ({
     workgroup_name = workgroup_name_;
     max_results = max_results_;
     next_token = next_token_;
     table_pattern = table_pattern_;
     schema_pattern = schema_pattern_;
     connected_database = connected_database_;
     database = database_;
     db_user = db_user_;
     secret_arn = secret_arn_;
     cluster_identifier = cluster_identifier_;
   }
    : list_tables_request)

let make_list_statements_response ?next_token:(next_token_ : string_ option)
    ~statements:(statements_ : statement_list) () =
  ({ next_token = next_token_; statements = statements_ } : list_statements_response)

let make_list_statements_request ?workgroup_name:(workgroup_name_ : workgroup_name_string option)
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ?database:(database_ : string_ option)
    ?role_level:(role_level_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?status:(status_ : status_string option)
    ?statement_name:(statement_name_ : statement_name_string option)
    ?max_results:(max_results_ : list_statements_limit option)
    ?next_token:(next_token_ : string_ option) () =
  ({
     workgroup_name = workgroup_name_;
     cluster_identifier = cluster_identifier_;
     database = database_;
     role_level = role_level_;
     status = status_;
     statement_name = statement_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_statements_request)

let make_list_schemas_response ?next_token:(next_token_ : string_ option)
    ?schemas:(schemas_ : schema_list option) () =
  ({ next_token = next_token_; schemas = schemas_ } : list_schemas_response)

let make_list_schemas_request ?workgroup_name:(workgroup_name_ : workgroup_name_string option)
    ?max_results:(max_results_ : page_size option) ?next_token:(next_token_ : string_ option)
    ?schema_pattern:(schema_pattern_ : string_ option)
    ?connected_database:(connected_database_ : string_ option) ?db_user:(db_user_ : string_ option)
    ?secret_arn:(secret_arn_ : secret_arn option)
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ~database:(database_ : string_) () =
  ({
     workgroup_name = workgroup_name_;
     max_results = max_results_;
     next_token = next_token_;
     schema_pattern = schema_pattern_;
     connected_database = connected_database_;
     database = database_;
     db_user = db_user_;
     secret_arn = secret_arn_;
     cluster_identifier = cluster_identifier_;
   }
    : list_schemas_request)

let make_list_databases_response ?next_token:(next_token_ : string_ option)
    ?databases:(databases_ : database_list option) () =
  ({ next_token = next_token_; databases = databases_ } : list_databases_response)

let make_list_databases_request ?workgroup_name:(workgroup_name_ : workgroup_name_string option)
    ?max_results:(max_results_ : page_size option) ?next_token:(next_token_ : string_ option)
    ?db_user:(db_user_ : string_ option) ?secret_arn:(secret_arn_ : secret_arn option)
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ~database:(database_ : string_) () =
  ({
     workgroup_name = workgroup_name_;
     max_results = max_results_;
     next_token = next_token_;
     db_user = db_user_;
     secret_arn = secret_arn_;
     database = database_;
     cluster_identifier = cluster_identifier_;
   }
    : list_databases_request)

let make_column_metadata ?column_default:(column_default_ : string_ option)
    ?length:(length_ : integer option) ?type_name:(type_name_ : string_ option)
    ?table_name:(table_name_ : string_ option) ?schema_name:(schema_name_ : string_ option)
    ?scale:(scale_ : integer option) ?precision:(precision_ : integer option)
    ?nullable:(nullable_ : integer option) ?name:(name_ : string_ option)
    ?label:(label_ : string_ option) ?is_signed:(is_signed_ : bool_ option)
    ?is_currency:(is_currency_ : bool_ option)
    ?is_case_sensitive:(is_case_sensitive_ : bool_ option) () =
  ({
     column_default = column_default_;
     length = length_;
     type_name = type_name_;
     table_name = table_name_;
     schema_name = schema_name_;
     scale = scale_;
     precision = precision_;
     nullable = nullable_;
     name = name_;
     label = label_;
     is_signed = is_signed_;
     is_currency = is_currency_;
     is_case_sensitive = is_case_sensitive_;
   }
    : column_metadata)

let make_get_statement_result_v2_response ?next_token:(next_token_ : string_ option)
    ?result_format:(result_format_ : result_format_string option)
    ?total_num_rows:(total_num_rows_ : long option)
    ?column_metadata:(column_metadata_ : column_metadata_list option)
    ~records:(records_ : formatted_sql_records) () =
  ({
     next_token = next_token_;
     result_format = result_format_;
     total_num_rows = total_num_rows_;
     column_metadata = column_metadata_;
     records = records_;
   }
    : get_statement_result_v2_response)

let make_get_statement_result_v2_request ?next_token:(next_token_ : string_ option)
    ~id:(id_ : uui_d) () =
  ({ next_token = next_token_; id = id_ } : get_statement_result_v2_request)

let make_get_statement_result_response ?next_token:(next_token_ : string_ option)
    ?total_num_rows:(total_num_rows_ : long option)
    ?column_metadata:(column_metadata_ : column_metadata_list option)
    ~records:(records_ : sql_records) () =
  ({
     next_token = next_token_;
     total_num_rows = total_num_rows_;
     column_metadata = column_metadata_;
     records = records_;
   }
    : get_statement_result_response)

let make_get_statement_result_request ?next_token:(next_token_ : string_ option) ~id:(id_ : uui_d)
    () =
  ({ next_token = next_token_; id = id_ } : get_statement_result_request)

let make_execute_statement_output ?session_id:(session_id_ : uui_d option)
    ?workgroup_name:(workgroup_name_ : workgroup_name_string option)
    ?secret_arn:(secret_arn_ : secret_arn option) ?database:(database_ : string_ option)
    ?db_groups:(db_groups_ : db_group_list option) ?db_user:(db_user_ : string_ option)
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) ?id:(id_ : uui_d option)
    () =
  ({
     session_id = session_id_;
     workgroup_name = workgroup_name_;
     secret_arn = secret_arn_;
     database = database_;
     db_groups = db_groups_;
     db_user = db_user_;
     cluster_identifier = cluster_identifier_;
     created_at = created_at_;
     id = id_;
   }
    : execute_statement_output)

let make_execute_statement_input ?session_id:(session_id_ : uui_d option)
    ?session_keep_alive_seconds:(session_keep_alive_seconds_ : session_alive_seconds option)
    ?result_format:(result_format_ : result_format_string option)
    ?client_token:(client_token_ : client_token option)
    ?workgroup_name:(workgroup_name_ : workgroup_name_string option)
    ?parameters:(parameters_ : sql_parameters_list option)
    ?statement_name:(statement_name_ : statement_name_string option)
    ?with_event:(with_event_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?database:(database_ : string_ option) ?db_user:(db_user_ : string_ option)
    ?secret_arn:(secret_arn_ : secret_arn option)
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ~sql:(sql_ : statement_string) () =
  ({
     session_id = session_id_;
     session_keep_alive_seconds = session_keep_alive_seconds_;
     result_format = result_format_;
     client_token = client_token_;
     workgroup_name = workgroup_name_;
     parameters = parameters_;
     statement_name = statement_name_;
     with_event = with_event_;
     database = database_;
     db_user = db_user_;
     secret_arn = secret_arn_;
     cluster_identifier = cluster_identifier_;
     sql = sql_;
   }
    : execute_statement_input)

let make_describe_table_response ?next_token:(next_token_ : string_ option)
    ?column_list:(column_list_ : column_list option) ?table_name:(table_name_ : string_ option) () =
  ({ next_token = next_token_; column_list = column_list_; table_name = table_name_ }
    : describe_table_response)

let make_describe_table_request ?workgroup_name:(workgroup_name_ : workgroup_name_string option)
    ?max_results:(max_results_ : page_size option) ?next_token:(next_token_ : string_ option)
    ?table:(table_ : string_ option) ?schema:(schema_ : string_ option)
    ?connected_database:(connected_database_ : string_ option) ?db_user:(db_user_ : string_ option)
    ?secret_arn:(secret_arn_ : secret_arn option)
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ~database:(database_ : string_) () =
  ({
     workgroup_name = workgroup_name_;
     max_results = max_results_;
     next_token = next_token_;
     table = table_;
     schema = schema_;
     connected_database = connected_database_;
     database = database_;
     db_user = db_user_;
     secret_arn = secret_arn_;
     cluster_identifier = cluster_identifier_;
   }
    : describe_table_request)

let make_describe_statement_response ?session_id:(session_id_ : string_ option)
    ?result_format:(result_format_ : result_format_string option)
    ?workgroup_name:(workgroup_name_ : workgroup_name_string option)
    ?sub_statements:(sub_statements_ : sub_statement_list option)
    ?query_parameters:(query_parameters_ : sql_parameters_list option)
    ?redshift_query_id:(redshift_query_id_ : long option) ?result_size:(result_size_ : long option)
    ?result_rows:(result_rows_ : long option)
    ?query_string:(query_string_ : statement_string option)
    ?has_result_set:(has_result_set_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?redshift_pid:(redshift_pid_ : long option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : status_string option) ?error:(error_ : string_ option)
    ?duration:(duration_ : long option) ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?database:(database_ : string_ option) ?db_user:(db_user_ : string_ option)
    ?secret_arn:(secret_arn_ : secret_arn option) ~id:(id_ : uui_d) () =
  ({
     session_id = session_id_;
     result_format = result_format_;
     workgroup_name = workgroup_name_;
     sub_statements = sub_statements_;
     query_parameters = query_parameters_;
     redshift_query_id = redshift_query_id_;
     result_size = result_size_;
     result_rows = result_rows_;
     query_string = query_string_;
     has_result_set = has_result_set_;
     redshift_pid = redshift_pid_;
     updated_at = updated_at_;
     created_at = created_at_;
     status = status_;
     error = error_;
     duration = duration_;
     cluster_identifier = cluster_identifier_;
     database = database_;
     db_user = db_user_;
     secret_arn = secret_arn_;
     id = id_;
   }
    : describe_statement_response)

let make_describe_statement_request ~id:(id_ : uui_d) () =
  ({ id = id_ } : describe_statement_request)

let make_cancel_statement_response ?status:(status_ : Smaws_Lib.Smithy_api.Types.boolean_ option) ()
    =
  ({ status = status_ } : cancel_statement_response)

let make_cancel_statement_request ~id:(id_ : uui_d) () = ({ id = id_ } : cancel_statement_request)

let make_batch_execute_statement_output ?session_id:(session_id_ : uui_d option)
    ?workgroup_name:(workgroup_name_ : workgroup_name_string option)
    ?secret_arn:(secret_arn_ : secret_arn option) ?database:(database_ : string_ option)
    ?db_groups:(db_groups_ : db_group_list option) ?db_user:(db_user_ : string_ option)
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) ?id:(id_ : uui_d option)
    () =
  ({
     session_id = session_id_;
     workgroup_name = workgroup_name_;
     secret_arn = secret_arn_;
     database = database_;
     db_groups = db_groups_;
     db_user = db_user_;
     cluster_identifier = cluster_identifier_;
     created_at = created_at_;
     id = id_;
   }
    : batch_execute_statement_output)

let make_batch_execute_statement_input ?session_id:(session_id_ : uui_d option)
    ?session_keep_alive_seconds:(session_keep_alive_seconds_ : session_alive_seconds option)
    ?result_format:(result_format_ : result_format_string option)
    ?client_token:(client_token_ : client_token option)
    ?workgroup_name:(workgroup_name_ : workgroup_name_string option)
    ?parameters:(parameters_ : sql_parameters_list option)
    ?statement_name:(statement_name_ : statement_name_string option)
    ?with_event:(with_event_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?database:(database_ : string_ option) ?db_user:(db_user_ : string_ option)
    ?secret_arn:(secret_arn_ : secret_arn option)
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ~sqls:(sqls_ : sql_list) () =
  ({
     session_id = session_id_;
     session_keep_alive_seconds = session_keep_alive_seconds_;
     result_format = result_format_;
     client_token = client_token_;
     workgroup_name = workgroup_name_;
     parameters = parameters_;
     statement_name = statement_name_;
     with_event = with_event_;
     database = database_;
     db_user = db_user_;
     secret_arn = secret_arn_;
     cluster_identifier = cluster_identifier_;
     sqls = sqls_;
   }
    : batch_execute_statement_input)
