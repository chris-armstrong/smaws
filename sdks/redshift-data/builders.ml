open Types

let make_batch_execute_statement_output ?id:(id_ : uui_d option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ?db_user:(db_user_ : string_ option) ?db_groups:(db_groups_ : db_group_list option)
    ?database:(database_ : string_ option) ?secret_arn:(secret_arn_ : secret_arn option)
    ?workgroup_name:(workgroup_name_ : workgroup_name_string option)
    ?session_id:(session_id_ : uui_d option) () =
  ({
     id = id_;
     created_at = created_at_;
     cluster_identifier = cluster_identifier_;
     db_user = db_user_;
     db_groups = db_groups_;
     database = database_;
     secret_arn = secret_arn_;
     workgroup_name = workgroup_name_;
     session_id = session_id_;
   }
    : batch_execute_statement_output)

let make_sql_parameter ~name:(name_ : parameter_name) ~value:(value_ : parameter_value) () =
  ({ name = name_; value = value_ } : sql_parameter)

let make_batch_execute_statement_input
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ?secret_arn:(secret_arn_ : secret_arn option) ?db_user:(db_user_ : string_ option)
    ?database:(database_ : string_ option)
    ?with_event:(with_event_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?statement_name:(statement_name_ : statement_name_string option)
    ?parameters:(parameters_ : sql_parameters_list option)
    ?workgroup_name:(workgroup_name_ : workgroup_name_string option)
    ?client_token:(client_token_ : client_token option)
    ?result_format:(result_format_ : result_format_string option)
    ?session_keep_alive_seconds:(session_keep_alive_seconds_ : session_alive_seconds option)
    ?session_id:(session_id_ : uui_d option) ~sqls:(sqls_ : sql_list) () =
  ({
     sqls = sqls_;
     cluster_identifier = cluster_identifier_;
     secret_arn = secret_arn_;
     db_user = db_user_;
     database = database_;
     with_event = with_event_;
     statement_name = statement_name_;
     parameters = parameters_;
     workgroup_name = workgroup_name_;
     client_token = client_token_;
     result_format = result_format_;
     session_keep_alive_seconds = session_keep_alive_seconds_;
     session_id = session_id_;
   }
    : batch_execute_statement_input)

let make_cancel_statement_response ?status:(status_ : Smaws_Lib.Smithy_api.Types.boolean_ option) ()
    =
  ({ status = status_ } : cancel_statement_response)

let make_cancel_statement_request ~id:(id_ : uui_d) () = ({ id = id_ } : cancel_statement_request)

let make_column_metadata ?is_case_sensitive:(is_case_sensitive_ : bool_ option)
    ?is_currency:(is_currency_ : bool_ option) ?is_signed:(is_signed_ : bool_ option)
    ?label:(label_ : string_ option) ?name:(name_ : string_ option)
    ?nullable:(nullable_ : integer option) ?precision:(precision_ : integer option)
    ?scale:(scale_ : integer option) ?schema_name:(schema_name_ : string_ option)
    ?table_name:(table_name_ : string_ option) ?type_name:(type_name_ : string_ option)
    ?length:(length_ : integer option) ?column_default:(column_default_ : string_ option) () =
  ({
     is_case_sensitive = is_case_sensitive_;
     is_currency = is_currency_;
     is_signed = is_signed_;
     label = label_;
     name = name_;
     nullable = nullable_;
     precision = precision_;
     scale = scale_;
     schema_name = schema_name_;
     table_name = table_name_;
     type_name = type_name_;
     length = length_;
     column_default = column_default_;
   }
    : column_metadata)

let make_sub_statement_data ?duration:(duration_ : long option) ?error:(error_ : string_ option)
    ?status:(status_ : statement_status_string option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?query_string:(query_string_ : statement_string option)
    ?result_rows:(result_rows_ : long option) ?result_size:(result_size_ : long option)
    ?redshift_query_id:(redshift_query_id_ : long option)
    ?has_result_set:(has_result_set_ : Smaws_Lib.Smithy_api.Types.boolean_ option) ~id:(id_ : uui_d)
    () =
  ({
     id = id_;
     duration = duration_;
     error = error_;
     status = status_;
     created_at = created_at_;
     updated_at = updated_at_;
     query_string = query_string_;
     result_rows = result_rows_;
     result_size = result_size_;
     redshift_query_id = redshift_query_id_;
     has_result_set = has_result_set_;
   }
    : sub_statement_data)

let make_describe_statement_response ?secret_arn:(secret_arn_ : secret_arn option)
    ?db_user:(db_user_ : string_ option) ?database:(database_ : string_ option)
    ?cluster_identifier:(cluster_identifier_ : string_ option) ?duration:(duration_ : long option)
    ?error:(error_ : string_ option) ?status:(status_ : status_string option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?redshift_pid:(redshift_pid_ : long option)
    ?has_result_set:(has_result_set_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?query_string:(query_string_ : statement_string option)
    ?result_rows:(result_rows_ : long option) ?result_size:(result_size_ : long option)
    ?redshift_query_id:(redshift_query_id_ : long option)
    ?query_parameters:(query_parameters_ : sql_parameters_list option)
    ?sub_statements:(sub_statements_ : sub_statement_list option)
    ?workgroup_name:(workgroup_name_ : workgroup_name_string option)
    ?result_format:(result_format_ : result_format_string option)
    ?session_id:(session_id_ : string_ option) ~id:(id_ : uui_d) () =
  ({
     id = id_;
     secret_arn = secret_arn_;
     db_user = db_user_;
     database = database_;
     cluster_identifier = cluster_identifier_;
     duration = duration_;
     error = error_;
     status = status_;
     created_at = created_at_;
     updated_at = updated_at_;
     redshift_pid = redshift_pid_;
     has_result_set = has_result_set_;
     query_string = query_string_;
     result_rows = result_rows_;
     result_size = result_size_;
     redshift_query_id = redshift_query_id_;
     query_parameters = query_parameters_;
     sub_statements = sub_statements_;
     workgroup_name = workgroup_name_;
     result_format = result_format_;
     session_id = session_id_;
   }
    : describe_statement_response)

let make_describe_statement_request ~id:(id_ : uui_d) () =
  ({ id = id_ } : describe_statement_request)

let make_describe_table_response ?table_name:(table_name_ : string_ option)
    ?column_list:(column_list_ : column_list option) ?next_token:(next_token_ : string_ option) () =
  ({ table_name = table_name_; column_list = column_list_; next_token = next_token_ }
    : describe_table_response)

let make_describe_table_request
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ?secret_arn:(secret_arn_ : secret_arn option) ?db_user:(db_user_ : string_ option)
    ?connected_database:(connected_database_ : string_ option) ?schema:(schema_ : string_ option)
    ?table:(table_ : string_ option) ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : page_size option)
    ?workgroup_name:(workgroup_name_ : workgroup_name_string option) ~database:(database_ : string_)
    () =
  ({
     cluster_identifier = cluster_identifier_;
     secret_arn = secret_arn_;
     db_user = db_user_;
     database = database_;
     connected_database = connected_database_;
     schema = schema_;
     table = table_;
     next_token = next_token_;
     max_results = max_results_;
     workgroup_name = workgroup_name_;
   }
    : describe_table_request)

let make_execute_statement_output ?id:(id_ : uui_d option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ?db_user:(db_user_ : string_ option) ?db_groups:(db_groups_ : db_group_list option)
    ?database:(database_ : string_ option) ?secret_arn:(secret_arn_ : secret_arn option)
    ?workgroup_name:(workgroup_name_ : workgroup_name_string option)
    ?session_id:(session_id_ : uui_d option) () =
  ({
     id = id_;
     created_at = created_at_;
     cluster_identifier = cluster_identifier_;
     db_user = db_user_;
     db_groups = db_groups_;
     database = database_;
     secret_arn = secret_arn_;
     workgroup_name = workgroup_name_;
     session_id = session_id_;
   }
    : execute_statement_output)

let make_execute_statement_input
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ?secret_arn:(secret_arn_ : secret_arn option) ?db_user:(db_user_ : string_ option)
    ?database:(database_ : string_ option)
    ?with_event:(with_event_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?statement_name:(statement_name_ : statement_name_string option)
    ?parameters:(parameters_ : sql_parameters_list option)
    ?workgroup_name:(workgroup_name_ : workgroup_name_string option)
    ?client_token:(client_token_ : client_token option)
    ?result_format:(result_format_ : result_format_string option)
    ?session_keep_alive_seconds:(session_keep_alive_seconds_ : session_alive_seconds option)
    ?session_id:(session_id_ : uui_d option) ~sql:(sql_ : statement_string) () =
  ({
     sql = sql_;
     cluster_identifier = cluster_identifier_;
     secret_arn = secret_arn_;
     db_user = db_user_;
     database = database_;
     with_event = with_event_;
     statement_name = statement_name_;
     parameters = parameters_;
     workgroup_name = workgroup_name_;
     client_token = client_token_;
     result_format = result_format_;
     session_keep_alive_seconds = session_keep_alive_seconds_;
     session_id = session_id_;
   }
    : execute_statement_input)

let make_get_statement_result_response
    ?column_metadata:(column_metadata_ : column_metadata_list option)
    ?total_num_rows:(total_num_rows_ : long option) ?next_token:(next_token_ : string_ option)
    ~records:(records_ : sql_records) () =
  ({
     records = records_;
     column_metadata = column_metadata_;
     total_num_rows = total_num_rows_;
     next_token = next_token_;
   }
    : get_statement_result_response)

let make_get_statement_result_request ?next_token:(next_token_ : string_ option) ~id:(id_ : uui_d)
    () =
  ({ id = id_; next_token = next_token_ } : get_statement_result_request)

let make_get_statement_result_v2_response
    ?column_metadata:(column_metadata_ : column_metadata_list option)
    ?total_num_rows:(total_num_rows_ : long option)
    ?result_format:(result_format_ : result_format_string option)
    ?next_token:(next_token_ : string_ option) ~records:(records_ : formatted_sql_records) () =
  ({
     records = records_;
     column_metadata = column_metadata_;
     total_num_rows = total_num_rows_;
     result_format = result_format_;
     next_token = next_token_;
   }
    : get_statement_result_v2_response)

let make_get_statement_result_v2_request ?next_token:(next_token_ : string_ option)
    ~id:(id_ : uui_d) () =
  ({ id = id_; next_token = next_token_ } : get_statement_result_v2_request)

let make_list_databases_response ?databases:(databases_ : database_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ databases = databases_; next_token = next_token_ } : list_databases_response)

let make_list_databases_request
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ?secret_arn:(secret_arn_ : secret_arn option) ?db_user:(db_user_ : string_ option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : page_size option)
    ?workgroup_name:(workgroup_name_ : workgroup_name_string option) ~database:(database_ : string_)
    () =
  ({
     cluster_identifier = cluster_identifier_;
     database = database_;
     secret_arn = secret_arn_;
     db_user = db_user_;
     next_token = next_token_;
     max_results = max_results_;
     workgroup_name = workgroup_name_;
   }
    : list_databases_request)

let make_list_schemas_response ?schemas:(schemas_ : schema_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ schemas = schemas_; next_token = next_token_ } : list_schemas_response)

let make_list_schemas_request
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ?secret_arn:(secret_arn_ : secret_arn option) ?db_user:(db_user_ : string_ option)
    ?connected_database:(connected_database_ : string_ option)
    ?schema_pattern:(schema_pattern_ : string_ option) ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : page_size option)
    ?workgroup_name:(workgroup_name_ : workgroup_name_string option) ~database:(database_ : string_)
    () =
  ({
     cluster_identifier = cluster_identifier_;
     secret_arn = secret_arn_;
     db_user = db_user_;
     database = database_;
     connected_database = connected_database_;
     schema_pattern = schema_pattern_;
     next_token = next_token_;
     max_results = max_results_;
     workgroup_name = workgroup_name_;
   }
    : list_schemas_request)

let make_statement_data ?query_string:(query_string_ : statement_string option)
    ?query_strings:(query_strings_ : statement_string_list option)
    ?secret_arn:(secret_arn_ : secret_arn option) ?status:(status_ : status_string option)
    ?statement_name:(statement_name_ : statement_name_string option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?query_parameters:(query_parameters_ : sql_parameters_list option)
    ?is_batch_statement:(is_batch_statement_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?result_format:(result_format_ : result_format_string option)
    ?session_id:(session_id_ : uui_d option) ~id:(id_ : uui_d) () =
  ({
     id = id_;
     query_string = query_string_;
     query_strings = query_strings_;
     secret_arn = secret_arn_;
     status = status_;
     statement_name = statement_name_;
     created_at = created_at_;
     updated_at = updated_at_;
     query_parameters = query_parameters_;
     is_batch_statement = is_batch_statement_;
     result_format = result_format_;
     session_id = session_id_;
   }
    : statement_data)

let make_list_statements_response ?next_token:(next_token_ : string_ option)
    ~statements:(statements_ : statement_list) () =
  ({ statements = statements_; next_token = next_token_ } : list_statements_response)

let make_list_statements_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : list_statements_limit option)
    ?statement_name:(statement_name_ : statement_name_string option)
    ?status:(status_ : status_string option)
    ?role_level:(role_level_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?database:(database_ : string_ option)
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ?workgroup_name:(workgroup_name_ : workgroup_name_string option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     statement_name = statement_name_;
     status = status_;
     role_level = role_level_;
     database = database_;
     cluster_identifier = cluster_identifier_;
     workgroup_name = workgroup_name_;
   }
    : list_statements_request)

let make_table_member ?name:(name_ : string_ option) ?type_:(type__ : string_ option)
    ?schema:(schema_ : string_ option) () =
  ({ name = name_; type_ = type__; schema = schema_ } : table_member)

let make_list_tables_response ?tables:(tables_ : table_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ tables = tables_; next_token = next_token_ } : list_tables_response)

let make_list_tables_request
    ?cluster_identifier:(cluster_identifier_ : cluster_identifier_string option)
    ?secret_arn:(secret_arn_ : secret_arn option) ?db_user:(db_user_ : string_ option)
    ?connected_database:(connected_database_ : string_ option)
    ?schema_pattern:(schema_pattern_ : string_ option)
    ?table_pattern:(table_pattern_ : string_ option) ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : page_size option)
    ?workgroup_name:(workgroup_name_ : workgroup_name_string option) ~database:(database_ : string_)
    () =
  ({
     cluster_identifier = cluster_identifier_;
     secret_arn = secret_arn_;
     db_user = db_user_;
     database = database_;
     connected_database = connected_database_;
     schema_pattern = schema_pattern_;
     table_pattern = table_pattern_;
     next_token = next_token_;
     max_results = max_results_;
     workgroup_name = workgroup_name_;
   }
    : list_tables_request)
