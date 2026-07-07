open Smaws_Lib.Json.DeserializeHelpers
open Types

let bool__of_yojson = bool_of_yojson
let workgroup_name_string_of_yojson = string_of_yojson
let string__of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : validation_exception)

let uui_d_of_yojson = string_of_yojson

let table_member_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema = option_of_yojson (value_for_key string__of_yojson "schema") _list path;
     type_ = option_of_yojson (value_for_key string__of_yojson "type") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
   }
    : table_member)

let table_list_of_yojson tree path = list_of_yojson table_member_of_yojson tree path
let long_of_yojson = long_of_yojson

let statement_status_string_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUBMITTED" -> SUBMITTED
    | `String "PICKED" -> PICKED
    | `String "STARTED" -> STARTED
    | `String "FINISHED" -> FINISHED
    | `String "ABORTED" -> ABORTED
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StatementStatusString" value)
    | _ -> raise (deserialize_wrong_type_error path "StatementStatusString")
     : statement_status_string)
    : statement_status_string)

let statement_string_of_yojson = string_of_yojson

let sub_statement_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     has_result_set =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "HasResultSet")
         _list path;
     redshift_query_id =
       option_of_yojson (value_for_key long_of_yojson "RedshiftQueryId") _list path;
     result_size = option_of_yojson (value_for_key long_of_yojson "ResultSize") _list path;
     result_rows = option_of_yojson (value_for_key long_of_yojson "ResultRows") _list path;
     query_string =
       option_of_yojson (value_for_key statement_string_of_yojson "QueryString") _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "UpdatedAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedAt")
         _list path;
     status = option_of_yojson (value_for_key statement_status_string_of_yojson "Status") _list path;
     error = option_of_yojson (value_for_key string__of_yojson "Error") _list path;
     duration = option_of_yojson (value_for_key long_of_yojson "Duration") _list path;
     id = value_for_key uui_d_of_yojson "Id" _list path;
   }
    : sub_statement_data)

let sub_statement_list_of_yojson tree path = list_of_yojson sub_statement_data_of_yojson tree path

let status_string_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUBMITTED" -> SUBMITTED
    | `String "PICKED" -> PICKED
    | `String "STARTED" -> STARTED
    | `String "FINISHED" -> FINISHED
    | `String "ABORTED" -> ABORTED
    | `String "FAILED" -> FAILED
    | `String "ALL" -> ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "StatusString" value)
    | _ -> raise (deserialize_wrong_type_error path "StatusString")
     : status_string)
    : status_string)

let statement_string_list_of_yojson tree path = list_of_yojson statement_string_of_yojson tree path
let statement_name_string_of_yojson = string_of_yojson
let secret_arn_of_yojson = string_of_yojson
let parameter_name_of_yojson = string_of_yojson
let parameter_value_of_yojson = string_of_yojson

let sql_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key parameter_value_of_yojson "value" _list path;
     name = value_for_key parameter_name_of_yojson "name" _list path;
   }
    : sql_parameter)

let sql_parameters_list_of_yojson tree path = list_of_yojson sql_parameter_of_yojson tree path

let result_format_string_of_yojson (tree : t) path =
  ((match tree with
    | `String "JSON" -> JSON
    | `String "CSV" -> CSV
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResultFormatString" value)
    | _ -> raise (deserialize_wrong_type_error path "ResultFormatString")
     : result_format_string)
    : result_format_string)

let statement_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id = option_of_yojson (value_for_key uui_d_of_yojson "SessionId") _list path;
     result_format =
       option_of_yojson (value_for_key result_format_string_of_yojson "ResultFormat") _list path;
     is_batch_statement =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "IsBatchStatement")
         _list path;
     query_parameters =
       option_of_yojson (value_for_key sql_parameters_list_of_yojson "QueryParameters") _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "UpdatedAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedAt")
         _list path;
     statement_name =
       option_of_yojson (value_for_key statement_name_string_of_yojson "StatementName") _list path;
     status = option_of_yojson (value_for_key status_string_of_yojson "Status") _list path;
     secret_arn = option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn") _list path;
     query_strings =
       option_of_yojson (value_for_key statement_string_list_of_yojson "QueryStrings") _list path;
     query_string =
       option_of_yojson (value_for_key statement_string_of_yojson "QueryString") _list path;
     id = value_for_key uui_d_of_yojson "Id" _list path;
   }
    : statement_data)

let statement_list_of_yojson tree path = list_of_yojson statement_data_of_yojson tree path
let boxed_boolean_of_yojson = bool_of_yojson
let boxed_long_of_yojson = long_of_yojson
let boxed_double_of_yojson = double_of_yojson
let blob_of_yojson = blob_of_yojson

let field_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "blobValue" -> BlobValue (blob_of_yojson value_ path)
   | "stringValue" -> StringValue (string__of_yojson value_ path)
   | "doubleValue" -> DoubleValue (boxed_double_of_yojson value_ path)
   | "longValue" -> LongValue (boxed_long_of_yojson value_ path)
   | "booleanValue" -> BooleanValue (boxed_boolean_of_yojson value_ path)
   | "isNull" -> IsNull (boxed_boolean_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "Field" unknown)
    : field)

let field_list_of_yojson tree path = list_of_yojson field_of_yojson tree path
let sql_records_of_yojson tree path = list_of_yojson field_list_of_yojson tree path
let sql_list_of_yojson tree path = list_of_yojson statement_string_of_yojson tree path
let session_alive_seconds_of_yojson = int_of_yojson
let schema_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key string__of_yojson "ResourceId" _list path;
     message = value_for_key string__of_yojson "Message" _list path;
   }
    : resource_not_found_exception)

let query_timeout_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : query_timeout_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key string__of_yojson "Message" _list path } : internal_server_exception)

let database_connection_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key string__of_yojson "Message" _list path }
    : database_connection_exception)

let list_tables_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     tables = option_of_yojson (value_for_key table_list_of_yojson "Tables") _list path;
   }
    : list_tables_response)

let cluster_identifier_string_of_yojson = string_of_yojson
let page_size_of_yojson = int_of_yojson

let list_tables_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_string_of_yojson "WorkgroupName") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     table_pattern = option_of_yojson (value_for_key string__of_yojson "TablePattern") _list path;
     schema_pattern = option_of_yojson (value_for_key string__of_yojson "SchemaPattern") _list path;
     connected_database =
       option_of_yojson (value_for_key string__of_yojson "ConnectedDatabase") _list path;
     database = value_for_key string__of_yojson "Database" _list path;
     db_user = option_of_yojson (value_for_key string__of_yojson "DbUser") _list path;
     secret_arn = option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn") _list path;
     cluster_identifier =
       option_of_yojson
         (value_for_key cluster_identifier_string_of_yojson "ClusterIdentifier")
         _list path;
   }
    : list_tables_request)

let list_statements_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     statements = value_for_key statement_list_of_yojson "Statements" _list path;
   }
    : list_statements_response)

let list_statements_limit_of_yojson = int_of_yojson

let list_statements_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_string_of_yojson "WorkgroupName") _list path;
     cluster_identifier =
       option_of_yojson
         (value_for_key cluster_identifier_string_of_yojson "ClusterIdentifier")
         _list path;
     database = option_of_yojson (value_for_key string__of_yojson "Database") _list path;
     role_level =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "RoleLevel")
         _list path;
     status = option_of_yojson (value_for_key status_string_of_yojson "Status") _list path;
     statement_name =
       option_of_yojson (value_for_key statement_name_string_of_yojson "StatementName") _list path;
     max_results =
       option_of_yojson (value_for_key list_statements_limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_statements_request)

let list_schemas_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     schemas = option_of_yojson (value_for_key schema_list_of_yojson "Schemas") _list path;
   }
    : list_schemas_response)

let list_schemas_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_string_of_yojson "WorkgroupName") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     schema_pattern = option_of_yojson (value_for_key string__of_yojson "SchemaPattern") _list path;
     connected_database =
       option_of_yojson (value_for_key string__of_yojson "ConnectedDatabase") _list path;
     database = value_for_key string__of_yojson "Database" _list path;
     db_user = option_of_yojson (value_for_key string__of_yojson "DbUser") _list path;
     secret_arn = option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn") _list path;
     cluster_identifier =
       option_of_yojson
         (value_for_key cluster_identifier_string_of_yojson "ClusterIdentifier")
         _list path;
   }
    : list_schemas_request)

let database_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let list_databases_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     databases = option_of_yojson (value_for_key database_list_of_yojson "Databases") _list path;
   }
    : list_databases_response)

let list_databases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_string_of_yojson "WorkgroupName") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     db_user = option_of_yojson (value_for_key string__of_yojson "DbUser") _list path;
     secret_arn = option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn") _list path;
     database = value_for_key string__of_yojson "Database" _list path;
     cluster_identifier =
       option_of_yojson
         (value_for_key cluster_identifier_string_of_yojson "ClusterIdentifier")
         _list path;
   }
    : list_databases_request)

let query_records_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "CSVRecords" -> CSVRecords (string__of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "QueryRecords" unknown)
    : query_records)

let formatted_sql_records_of_yojson tree path = list_of_yojson query_records_of_yojson tree path
let integer_of_yojson = int_of_yojson

let column_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     column_default = option_of_yojson (value_for_key string__of_yojson "columnDefault") _list path;
     length = option_of_yojson (value_for_key integer_of_yojson "length") _list path;
     type_name = option_of_yojson (value_for_key string__of_yojson "typeName") _list path;
     table_name = option_of_yojson (value_for_key string__of_yojson "tableName") _list path;
     schema_name = option_of_yojson (value_for_key string__of_yojson "schemaName") _list path;
     scale = option_of_yojson (value_for_key integer_of_yojson "scale") _list path;
     precision = option_of_yojson (value_for_key integer_of_yojson "precision") _list path;
     nullable = option_of_yojson (value_for_key integer_of_yojson "nullable") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     label = option_of_yojson (value_for_key string__of_yojson "label") _list path;
     is_signed = option_of_yojson (value_for_key bool__of_yojson "isSigned") _list path;
     is_currency = option_of_yojson (value_for_key bool__of_yojson "isCurrency") _list path;
     is_case_sensitive =
       option_of_yojson (value_for_key bool__of_yojson "isCaseSensitive") _list path;
   }
    : column_metadata)

let column_metadata_list_of_yojson tree path = list_of_yojson column_metadata_of_yojson tree path

let get_statement_result_v2_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     result_format =
       option_of_yojson (value_for_key result_format_string_of_yojson "ResultFormat") _list path;
     total_num_rows = option_of_yojson (value_for_key long_of_yojson "TotalNumRows") _list path;
     column_metadata =
       option_of_yojson (value_for_key column_metadata_list_of_yojson "ColumnMetadata") _list path;
     records = value_for_key formatted_sql_records_of_yojson "Records" _list path;
   }
    : get_statement_result_v2_response)

let get_statement_result_v2_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     id = value_for_key uui_d_of_yojson "Id" _list path;
   }
    : get_statement_result_v2_request)

let get_statement_result_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     total_num_rows = option_of_yojson (value_for_key long_of_yojson "TotalNumRows") _list path;
     column_metadata =
       option_of_yojson (value_for_key column_metadata_list_of_yojson "ColumnMetadata") _list path;
     records = value_for_key sql_records_of_yojson "Records" _list path;
   }
    : get_statement_result_response)

let get_statement_result_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     id = value_for_key uui_d_of_yojson "Id" _list path;
   }
    : get_statement_result_request)

let execute_statement_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     statement_id = value_for_key string__of_yojson "StatementId" _list path;
     message = value_for_key string__of_yojson "Message" _list path;
   }
    : execute_statement_exception)

let active_statements_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : active_statements_exceeded_exception)

let active_sessions_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : active_sessions_exceeded_exception)

let db_group_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let execute_statement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id = option_of_yojson (value_for_key uui_d_of_yojson "SessionId") _list path;
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_string_of_yojson "WorkgroupName") _list path;
     secret_arn = option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn") _list path;
     database = option_of_yojson (value_for_key string__of_yojson "Database") _list path;
     db_groups = option_of_yojson (value_for_key db_group_list_of_yojson "DbGroups") _list path;
     db_user = option_of_yojson (value_for_key string__of_yojson "DbUser") _list path;
     cluster_identifier =
       option_of_yojson
         (value_for_key cluster_identifier_string_of_yojson "ClusterIdentifier")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedAt")
         _list path;
     id = option_of_yojson (value_for_key uui_d_of_yojson "Id") _list path;
   }
    : execute_statement_output)

let client_token_of_yojson = string_of_yojson

let execute_statement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id = option_of_yojson (value_for_key uui_d_of_yojson "SessionId") _list path;
     session_keep_alive_seconds =
       option_of_yojson
         (value_for_key session_alive_seconds_of_yojson "SessionKeepAliveSeconds")
         _list path;
     result_format =
       option_of_yojson (value_for_key result_format_string_of_yojson "ResultFormat") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_string_of_yojson "WorkgroupName") _list path;
     parameters =
       option_of_yojson (value_for_key sql_parameters_list_of_yojson "Parameters") _list path;
     statement_name =
       option_of_yojson (value_for_key statement_name_string_of_yojson "StatementName") _list path;
     with_event =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "WithEvent")
         _list path;
     database = option_of_yojson (value_for_key string__of_yojson "Database") _list path;
     db_user = option_of_yojson (value_for_key string__of_yojson "DbUser") _list path;
     secret_arn = option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn") _list path;
     cluster_identifier =
       option_of_yojson
         (value_for_key cluster_identifier_string_of_yojson "ClusterIdentifier")
         _list path;
     sql = value_for_key statement_string_of_yojson "Sql" _list path;
   }
    : execute_statement_input)

let column_list_of_yojson tree path = list_of_yojson column_metadata_of_yojson tree path

let describe_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     column_list = option_of_yojson (value_for_key column_list_of_yojson "ColumnList") _list path;
     table_name = option_of_yojson (value_for_key string__of_yojson "TableName") _list path;
   }
    : describe_table_response)

let describe_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_string_of_yojson "WorkgroupName") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     table = option_of_yojson (value_for_key string__of_yojson "Table") _list path;
     schema = option_of_yojson (value_for_key string__of_yojson "Schema") _list path;
     connected_database =
       option_of_yojson (value_for_key string__of_yojson "ConnectedDatabase") _list path;
     database = value_for_key string__of_yojson "Database" _list path;
     db_user = option_of_yojson (value_for_key string__of_yojson "DbUser") _list path;
     secret_arn = option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn") _list path;
     cluster_identifier =
       option_of_yojson
         (value_for_key cluster_identifier_string_of_yojson "ClusterIdentifier")
         _list path;
   }
    : describe_table_request)

let describe_statement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id = option_of_yojson (value_for_key string__of_yojson "SessionId") _list path;
     result_format =
       option_of_yojson (value_for_key result_format_string_of_yojson "ResultFormat") _list path;
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_string_of_yojson "WorkgroupName") _list path;
     sub_statements =
       option_of_yojson (value_for_key sub_statement_list_of_yojson "SubStatements") _list path;
     query_parameters =
       option_of_yojson (value_for_key sql_parameters_list_of_yojson "QueryParameters") _list path;
     redshift_query_id =
       option_of_yojson (value_for_key long_of_yojson "RedshiftQueryId") _list path;
     result_size = option_of_yojson (value_for_key long_of_yojson "ResultSize") _list path;
     result_rows = option_of_yojson (value_for_key long_of_yojson "ResultRows") _list path;
     query_string =
       option_of_yojson (value_for_key statement_string_of_yojson "QueryString") _list path;
     has_result_set =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "HasResultSet")
         _list path;
     redshift_pid = option_of_yojson (value_for_key long_of_yojson "RedshiftPid") _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "UpdatedAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedAt")
         _list path;
     status = option_of_yojson (value_for_key status_string_of_yojson "Status") _list path;
     error = option_of_yojson (value_for_key string__of_yojson "Error") _list path;
     duration = option_of_yojson (value_for_key long_of_yojson "Duration") _list path;
     cluster_identifier =
       option_of_yojson (value_for_key string__of_yojson "ClusterIdentifier") _list path;
     database = option_of_yojson (value_for_key string__of_yojson "Database") _list path;
     db_user = option_of_yojson (value_for_key string__of_yojson "DbUser") _list path;
     secret_arn = option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn") _list path;
     id = value_for_key uui_d_of_yojson "Id" _list path;
   }
    : describe_statement_response)

let describe_statement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key uui_d_of_yojson "Id" _list path } : describe_statement_request)

let cancel_statement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Status")
         _list path;
   }
    : cancel_statement_response)

let cancel_statement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key uui_d_of_yojson "Id" _list path } : cancel_statement_request)

let batch_execute_statement_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     statement_id = value_for_key string__of_yojson "StatementId" _list path;
     message = value_for_key string__of_yojson "Message" _list path;
   }
    : batch_execute_statement_exception)

let batch_execute_statement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id = option_of_yojson (value_for_key uui_d_of_yojson "SessionId") _list path;
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_string_of_yojson "WorkgroupName") _list path;
     secret_arn = option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn") _list path;
     database = option_of_yojson (value_for_key string__of_yojson "Database") _list path;
     db_groups = option_of_yojson (value_for_key db_group_list_of_yojson "DbGroups") _list path;
     db_user = option_of_yojson (value_for_key string__of_yojson "DbUser") _list path;
     cluster_identifier =
       option_of_yojson
         (value_for_key cluster_identifier_string_of_yojson "ClusterIdentifier")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedAt")
         _list path;
     id = option_of_yojson (value_for_key uui_d_of_yojson "Id") _list path;
   }
    : batch_execute_statement_output)

let batch_execute_statement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id = option_of_yojson (value_for_key uui_d_of_yojson "SessionId") _list path;
     session_keep_alive_seconds =
       option_of_yojson
         (value_for_key session_alive_seconds_of_yojson "SessionKeepAliveSeconds")
         _list path;
     result_format =
       option_of_yojson (value_for_key result_format_string_of_yojson "ResultFormat") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_string_of_yojson "WorkgroupName") _list path;
     parameters =
       option_of_yojson (value_for_key sql_parameters_list_of_yojson "Parameters") _list path;
     statement_name =
       option_of_yojson (value_for_key statement_name_string_of_yojson "StatementName") _list path;
     with_event =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "WithEvent")
         _list path;
     database = option_of_yojson (value_for_key string__of_yojson "Database") _list path;
     db_user = option_of_yojson (value_for_key string__of_yojson "DbUser") _list path;
     secret_arn = option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn") _list path;
     cluster_identifier =
       option_of_yojson
         (value_for_key cluster_identifier_string_of_yojson "ClusterIdentifier")
         _list path;
     sqls = value_for_key sql_list_of_yojson "Sqls" _list path;
   }
    : batch_execute_statement_input)
