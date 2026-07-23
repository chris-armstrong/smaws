open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let active_sessions_exceeded_exception_to_yojson (x : active_sessions_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let active_statements_exceeded_exception_to_yojson (x : active_statements_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", Some (string__to_yojson x.message));
      ("ResourceId", Some (string__to_yojson x.resource_id));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", Some (string__to_yojson x.message)) ]

let batch_execute_statement_exception_to_yojson (x : batch_execute_statement_exception) =
  assoc_to_yojson
    [
      ("Message", Some (string__to_yojson x.message));
      ("StatementId", Some (string__to_yojson x.statement_id));
    ]

let uui_d_to_yojson = string_to_yojson
let workgroup_name_string_to_yojson = string_to_yojson
let secret_arn_to_yojson = string_to_yojson
let db_group_list_to_yojson tree = list_to_yojson string__to_yojson tree
let cluster_identifier_string_to_yojson = string_to_yojson

let batch_execute_statement_output_to_yojson (x : batch_execute_statement_output) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson uui_d_to_yojson x.id);
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ("DbGroups", option_to_yojson db_group_list_to_yojson x.db_groups);
      ("Database", option_to_yojson string__to_yojson x.database);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
      ("SessionId", option_to_yojson uui_d_to_yojson x.session_id);
    ]

let session_alive_seconds_to_yojson = int_to_yojson

let result_format_string_to_yojson (x : result_format_string) =
  match x with JSON -> `String "JSON" | CSV -> `String "CSV"

let client_token_to_yojson = string_to_yojson
let parameter_value_to_yojson = string_to_yojson
let parameter_name_to_yojson = string_to_yojson

let sql_parameter_to_yojson (x : sql_parameter) =
  assoc_to_yojson
    [
      ("name", Some (parameter_name_to_yojson x.name));
      ("value", Some (parameter_value_to_yojson x.value));
    ]

let sql_parameters_list_to_yojson tree = list_to_yojson sql_parameter_to_yojson tree
let statement_name_string_to_yojson = string_to_yojson
let statement_string_to_yojson = string_to_yojson
let sql_list_to_yojson tree = list_to_yojson statement_string_to_yojson tree

let batch_execute_statement_input_to_yojson (x : batch_execute_statement_input) =
  assoc_to_yojson
    [
      ("Sqls", Some (sql_list_to_yojson x.sqls));
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ("Database", option_to_yojson string__to_yojson x.database);
      ( "WithEvent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.with_event );
      ("StatementName", option_to_yojson statement_name_string_to_yojson x.statement_name);
      ("Parameters", option_to_yojson sql_parameters_list_to_yojson x.parameters);
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("ResultFormat", option_to_yojson result_format_string_to_yojson x.result_format);
      ( "SessionKeepAliveSeconds",
        option_to_yojson session_alive_seconds_to_yojson x.session_keep_alive_seconds );
      ("SessionId", option_to_yojson uui_d_to_yojson x.session_id);
    ]

let blob_to_yojson = blob_to_yojson
let boxed_boolean_to_yojson = bool_to_yojson
let boxed_double_to_yojson = double_to_yojson
let boxed_long_to_yojson = long_to_yojson

let query_timeout_exception_to_yojson (x : query_timeout_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let database_connection_exception_to_yojson (x : database_connection_exception) =
  assoc_to_yojson [ ("Message", Some (string__to_yojson x.message)) ]

let cancel_statement_response_to_yojson (x : cancel_statement_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.status);
    ]

let cancel_statement_request_to_yojson (x : cancel_statement_request) =
  assoc_to_yojson [ ("Id", Some (uui_d_to_yojson x.id)) ]

let integer_to_yojson = int_to_yojson
let bool__to_yojson = bool_to_yojson

let column_metadata_to_yojson (x : column_metadata) =
  assoc_to_yojson
    [
      ("isCaseSensitive", option_to_yojson bool__to_yojson x.is_case_sensitive);
      ("isCurrency", option_to_yojson bool__to_yojson x.is_currency);
      ("isSigned", option_to_yojson bool__to_yojson x.is_signed);
      ("label", option_to_yojson string__to_yojson x.label);
      ("name", option_to_yojson string__to_yojson x.name);
      ("nullable", option_to_yojson integer_to_yojson x.nullable);
      ("precision", option_to_yojson integer_to_yojson x.precision);
      ("scale", option_to_yojson integer_to_yojson x.scale);
      ("schemaName", option_to_yojson string__to_yojson x.schema_name);
      ("tableName", option_to_yojson string__to_yojson x.table_name);
      ("typeName", option_to_yojson string__to_yojson x.type_name);
      ("length", option_to_yojson integer_to_yojson x.length);
      ("columnDefault", option_to_yojson string__to_yojson x.column_default);
    ]

let column_list_to_yojson tree = list_to_yojson column_metadata_to_yojson tree
let column_metadata_list_to_yojson tree = list_to_yojson column_metadata_to_yojson tree
let database_list_to_yojson tree = list_to_yojson string__to_yojson tree
let long_to_yojson = long_to_yojson

let statement_status_string_to_yojson (x : statement_status_string) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | PICKED -> `String "PICKED"
  | STARTED -> `String "STARTED"
  | FINISHED -> `String "FINISHED"
  | ABORTED -> `String "ABORTED"
  | FAILED -> `String "FAILED"

let sub_statement_data_to_yojson (x : sub_statement_data) =
  assoc_to_yojson
    [
      ("Id", Some (uui_d_to_yojson x.id));
      ("Duration", option_to_yojson long_to_yojson x.duration);
      ("Error", option_to_yojson string__to_yojson x.error);
      ("Status", option_to_yojson statement_status_string_to_yojson x.status);
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ("QueryString", option_to_yojson statement_string_to_yojson x.query_string);
      ("ResultRows", option_to_yojson long_to_yojson x.result_rows);
      ("ResultSize", option_to_yojson long_to_yojson x.result_size);
      ("RedshiftQueryId", option_to_yojson long_to_yojson x.redshift_query_id);
      ( "HasResultSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.has_result_set
      );
    ]

let sub_statement_list_to_yojson tree = list_to_yojson sub_statement_data_to_yojson tree

let status_string_to_yojson (x : status_string) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | PICKED -> `String "PICKED"
  | STARTED -> `String "STARTED"
  | FINISHED -> `String "FINISHED"
  | ABORTED -> `String "ABORTED"
  | FAILED -> `String "FAILED"
  | ALL -> `String "ALL"

let describe_statement_response_to_yojson (x : describe_statement_response) =
  assoc_to_yojson
    [
      ("Id", Some (uui_d_to_yojson x.id));
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ("Database", option_to_yojson string__to_yojson x.database);
      ("ClusterIdentifier", option_to_yojson string__to_yojson x.cluster_identifier);
      ("Duration", option_to_yojson long_to_yojson x.duration);
      ("Error", option_to_yojson string__to_yojson x.error);
      ("Status", option_to_yojson status_string_to_yojson x.status);
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ("RedshiftPid", option_to_yojson long_to_yojson x.redshift_pid);
      ( "HasResultSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.has_result_set
      );
      ("QueryString", option_to_yojson statement_string_to_yojson x.query_string);
      ("ResultRows", option_to_yojson long_to_yojson x.result_rows);
      ("ResultSize", option_to_yojson long_to_yojson x.result_size);
      ("RedshiftQueryId", option_to_yojson long_to_yojson x.redshift_query_id);
      ("QueryParameters", option_to_yojson sql_parameters_list_to_yojson x.query_parameters);
      ("SubStatements", option_to_yojson sub_statement_list_to_yojson x.sub_statements);
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
      ("ResultFormat", option_to_yojson result_format_string_to_yojson x.result_format);
      ("SessionId", option_to_yojson string__to_yojson x.session_id);
    ]

let describe_statement_request_to_yojson (x : describe_statement_request) =
  assoc_to_yojson [ ("Id", Some (uui_d_to_yojson x.id)) ]

let describe_table_response_to_yojson (x : describe_table_response) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson string__to_yojson x.table_name);
      ("ColumnList", option_to_yojson column_list_to_yojson x.column_list);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let page_size_to_yojson = int_to_yojson

let describe_table_request_to_yojson (x : describe_table_request) =
  assoc_to_yojson
    [
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ("Database", Some (string__to_yojson x.database));
      ("ConnectedDatabase", option_to_yojson string__to_yojson x.connected_database);
      ("Schema", option_to_yojson string__to_yojson x.schema);
      ("Table", option_to_yojson string__to_yojson x.table);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
    ]

let execute_statement_exception_to_yojson (x : execute_statement_exception) =
  assoc_to_yojson
    [
      ("Message", Some (string__to_yojson x.message));
      ("StatementId", Some (string__to_yojson x.statement_id));
    ]

let execute_statement_output_to_yojson (x : execute_statement_output) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson uui_d_to_yojson x.id);
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ("DbGroups", option_to_yojson db_group_list_to_yojson x.db_groups);
      ("Database", option_to_yojson string__to_yojson x.database);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
      ("SessionId", option_to_yojson uui_d_to_yojson x.session_id);
    ]

let execute_statement_input_to_yojson (x : execute_statement_input) =
  assoc_to_yojson
    [
      ("Sql", Some (statement_string_to_yojson x.sql));
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ("Database", option_to_yojson string__to_yojson x.database);
      ( "WithEvent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.with_event );
      ("StatementName", option_to_yojson statement_name_string_to_yojson x.statement_name);
      ("Parameters", option_to_yojson sql_parameters_list_to_yojson x.parameters);
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("ResultFormat", option_to_yojson result_format_string_to_yojson x.result_format);
      ( "SessionKeepAliveSeconds",
        option_to_yojson session_alive_seconds_to_yojson x.session_keep_alive_seconds );
      ("SessionId", option_to_yojson uui_d_to_yojson x.session_id);
    ]

let field_to_yojson (x : field) =
  match x with
  | IsNull arg -> assoc_to_yojson [ ("isNull", Some (boxed_boolean_to_yojson arg)) ]
  | BooleanValue arg -> assoc_to_yojson [ ("booleanValue", Some (boxed_boolean_to_yojson arg)) ]
  | LongValue arg -> assoc_to_yojson [ ("longValue", Some (boxed_long_to_yojson arg)) ]
  | DoubleValue arg -> assoc_to_yojson [ ("doubleValue", Some (boxed_double_to_yojson arg)) ]
  | StringValue arg -> assoc_to_yojson [ ("stringValue", Some (string__to_yojson arg)) ]
  | BlobValue arg -> assoc_to_yojson [ ("blobValue", Some (blob_to_yojson arg)) ]

let field_list_to_yojson tree = list_to_yojson field_to_yojson tree

let query_records_to_yojson (x : query_records) =
  match x with CSVRecords arg -> assoc_to_yojson [ ("CSVRecords", Some (string__to_yojson arg)) ]

let formatted_sql_records_to_yojson tree = list_to_yojson query_records_to_yojson tree
let sql_records_to_yojson tree = list_to_yojson field_list_to_yojson tree

let get_statement_result_response_to_yojson (x : get_statement_result_response) =
  assoc_to_yojson
    [
      ("Records", Some (sql_records_to_yojson x.records));
      ("ColumnMetadata", option_to_yojson column_metadata_list_to_yojson x.column_metadata);
      ("TotalNumRows", option_to_yojson long_to_yojson x.total_num_rows);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let get_statement_result_request_to_yojson (x : get_statement_result_request) =
  assoc_to_yojson
    [
      ("Id", Some (uui_d_to_yojson x.id));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let get_statement_result_v2_response_to_yojson (x : get_statement_result_v2_response) =
  assoc_to_yojson
    [
      ("Records", Some (formatted_sql_records_to_yojson x.records));
      ("ColumnMetadata", option_to_yojson column_metadata_list_to_yojson x.column_metadata);
      ("TotalNumRows", option_to_yojson long_to_yojson x.total_num_rows);
      ("ResultFormat", option_to_yojson result_format_string_to_yojson x.result_format);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let get_statement_result_v2_request_to_yojson (x : get_statement_result_v2_request) =
  assoc_to_yojson
    [
      ("Id", Some (uui_d_to_yojson x.id));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_databases_response_to_yojson (x : list_databases_response) =
  assoc_to_yojson
    [
      ("Databases", option_to_yojson database_list_to_yojson x.databases);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_databases_request_to_yojson (x : list_databases_request) =
  assoc_to_yojson
    [
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
      ("Database", Some (string__to_yojson x.database));
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
    ]

let schema_list_to_yojson tree = list_to_yojson string__to_yojson tree

let list_schemas_response_to_yojson (x : list_schemas_response) =
  assoc_to_yojson
    [
      ("Schemas", option_to_yojson schema_list_to_yojson x.schemas);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_schemas_request_to_yojson (x : list_schemas_request) =
  assoc_to_yojson
    [
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ("Database", Some (string__to_yojson x.database));
      ("ConnectedDatabase", option_to_yojson string__to_yojson x.connected_database);
      ("SchemaPattern", option_to_yojson string__to_yojson x.schema_pattern);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
    ]

let statement_string_list_to_yojson tree = list_to_yojson statement_string_to_yojson tree

let statement_data_to_yojson (x : statement_data) =
  assoc_to_yojson
    [
      ("Id", Some (uui_d_to_yojson x.id));
      ("QueryString", option_to_yojson statement_string_to_yojson x.query_string);
      ("QueryStrings", option_to_yojson statement_string_list_to_yojson x.query_strings);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("Status", option_to_yojson status_string_to_yojson x.status);
      ("StatementName", option_to_yojson statement_name_string_to_yojson x.statement_name);
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ("QueryParameters", option_to_yojson sql_parameters_list_to_yojson x.query_parameters);
      ( "IsBatchStatement",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_batch_statement );
      ("ResultFormat", option_to_yojson result_format_string_to_yojson x.result_format);
      ("SessionId", option_to_yojson uui_d_to_yojson x.session_id);
    ]

let statement_list_to_yojson tree = list_to_yojson statement_data_to_yojson tree

let list_statements_response_to_yojson (x : list_statements_response) =
  assoc_to_yojson
    [
      ("Statements", Some (statement_list_to_yojson x.statements));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_statements_limit_to_yojson = int_to_yojson

let list_statements_request_to_yojson (x : list_statements_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_statements_limit_to_yojson x.max_results);
      ("StatementName", option_to_yojson statement_name_string_to_yojson x.statement_name);
      ("Status", option_to_yojson status_string_to_yojson x.status);
      ( "RoleLevel",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.role_level );
      ("Database", option_to_yojson string__to_yojson x.database);
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
    ]

let table_member_to_yojson (x : table_member) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("type", option_to_yojson string__to_yojson x.type_);
      ("schema", option_to_yojson string__to_yojson x.schema);
    ]

let table_list_to_yojson tree = list_to_yojson table_member_to_yojson tree

let list_tables_response_to_yojson (x : list_tables_response) =
  assoc_to_yojson
    [
      ("Tables", option_to_yojson table_list_to_yojson x.tables);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_tables_request_to_yojson (x : list_tables_request) =
  assoc_to_yojson
    [
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ("Database", Some (string__to_yojson x.database));
      ("ConnectedDatabase", option_to_yojson string__to_yojson x.connected_database);
      ("SchemaPattern", option_to_yojson string__to_yojson x.schema_pattern);
      ("TablePattern", option_to_yojson string__to_yojson x.table_pattern);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
    ]
