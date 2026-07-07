open Smaws_Lib.Json.SerializeHelpers
open Types

let bool__to_yojson = bool_to_yojson
let workgroup_name_string_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let uui_d_to_yojson = string_to_yojson

let table_member_to_yojson (x : table_member) =
  assoc_to_yojson
    [
      ("schema", option_to_yojson string__to_yojson x.schema);
      ("type", option_to_yojson string__to_yojson x.type_);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let table_list_to_yojson tree = list_to_yojson table_member_to_yojson tree
let long_to_yojson = long_to_yojson

let statement_status_string_to_yojson (x : statement_status_string) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | PICKED -> `String "PICKED"
  | STARTED -> `String "STARTED"
  | FINISHED -> `String "FINISHED"
  | ABORTED -> `String "ABORTED"
  | FAILED -> `String "FAILED"

let statement_string_to_yojson = string_to_yojson

let sub_statement_data_to_yojson (x : sub_statement_data) =
  assoc_to_yojson
    [
      ( "HasResultSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.has_result_set
      );
      ("RedshiftQueryId", option_to_yojson long_to_yojson x.redshift_query_id);
      ("ResultSize", option_to_yojson long_to_yojson x.result_size);
      ("ResultRows", option_to_yojson long_to_yojson x.result_rows);
      ("QueryString", option_to_yojson statement_string_to_yojson x.query_string);
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("Status", option_to_yojson statement_status_string_to_yojson x.status);
      ("Error", option_to_yojson string__to_yojson x.error);
      ("Duration", option_to_yojson long_to_yojson x.duration);
      ("Id", Some (uui_d_to_yojson x.id));
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

let statement_string_list_to_yojson tree = list_to_yojson statement_string_to_yojson tree
let statement_name_string_to_yojson = string_to_yojson
let secret_arn_to_yojson = string_to_yojson
let parameter_name_to_yojson = string_to_yojson
let parameter_value_to_yojson = string_to_yojson

let sql_parameter_to_yojson (x : sql_parameter) =
  assoc_to_yojson
    [
      ("value", Some (parameter_value_to_yojson x.value));
      ("name", Some (parameter_name_to_yojson x.name));
    ]

let sql_parameters_list_to_yojson tree = list_to_yojson sql_parameter_to_yojson tree

let result_format_string_to_yojson (x : result_format_string) =
  match x with JSON -> `String "JSON" | CSV -> `String "CSV"

let statement_data_to_yojson (x : statement_data) =
  assoc_to_yojson
    [
      ("SessionId", option_to_yojson uui_d_to_yojson x.session_id);
      ("ResultFormat", option_to_yojson result_format_string_to_yojson x.result_format);
      ( "IsBatchStatement",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_batch_statement );
      ("QueryParameters", option_to_yojson sql_parameters_list_to_yojson x.query_parameters);
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("StatementName", option_to_yojson statement_name_string_to_yojson x.statement_name);
      ("Status", option_to_yojson status_string_to_yojson x.status);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("QueryStrings", option_to_yojson statement_string_list_to_yojson x.query_strings);
      ("QueryString", option_to_yojson statement_string_to_yojson x.query_string);
      ("Id", Some (uui_d_to_yojson x.id));
    ]

let statement_list_to_yojson tree = list_to_yojson statement_data_to_yojson tree
let boxed_boolean_to_yojson = bool_to_yojson
let boxed_long_to_yojson = long_to_yojson
let boxed_double_to_yojson = double_to_yojson
let blob_to_yojson = blob_to_yojson

let field_to_yojson (x : field) =
  match x with
  | BlobValue arg -> assoc_to_yojson [ ("blobValue", Some (blob_to_yojson arg)) ]
  | StringValue arg -> assoc_to_yojson [ ("stringValue", Some (string__to_yojson arg)) ]
  | DoubleValue arg -> assoc_to_yojson [ ("doubleValue", Some (boxed_double_to_yojson arg)) ]
  | LongValue arg -> assoc_to_yojson [ ("longValue", Some (boxed_long_to_yojson arg)) ]
  | BooleanValue arg -> assoc_to_yojson [ ("booleanValue", Some (boxed_boolean_to_yojson arg)) ]
  | IsNull arg -> assoc_to_yojson [ ("isNull", Some (boxed_boolean_to_yojson arg)) ]

let field_list_to_yojson tree = list_to_yojson field_to_yojson tree
let sql_records_to_yojson tree = list_to_yojson field_list_to_yojson tree
let sql_list_to_yojson tree = list_to_yojson statement_string_to_yojson tree
let session_alive_seconds_to_yojson = int_to_yojson
let schema_list_to_yojson tree = list_to_yojson string__to_yojson tree

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("ResourceId", Some (string__to_yojson x.resource_id));
      ("Message", Some (string__to_yojson x.message));
    ]

let query_timeout_exception_to_yojson (x : query_timeout_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", Some (string__to_yojson x.message)) ]

let database_connection_exception_to_yojson (x : database_connection_exception) =
  assoc_to_yojson [ ("Message", Some (string__to_yojson x.message)) ]

let list_tables_response_to_yojson (x : list_tables_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Tables", option_to_yojson table_list_to_yojson x.tables);
    ]

let cluster_identifier_string_to_yojson = string_to_yojson
let page_size_to_yojson = int_to_yojson

let list_tables_request_to_yojson (x : list_tables_request) =
  assoc_to_yojson
    [
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("TablePattern", option_to_yojson string__to_yojson x.table_pattern);
      ("SchemaPattern", option_to_yojson string__to_yojson x.schema_pattern);
      ("ConnectedDatabase", option_to_yojson string__to_yojson x.connected_database);
      ("Database", Some (string__to_yojson x.database));
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
    ]

let list_statements_response_to_yojson (x : list_statements_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Statements", Some (statement_list_to_yojson x.statements));
    ]

let list_statements_limit_to_yojson = int_to_yojson

let list_statements_request_to_yojson (x : list_statements_request) =
  assoc_to_yojson
    [
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
      ("Database", option_to_yojson string__to_yojson x.database);
      ( "RoleLevel",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.role_level );
      ("Status", option_to_yojson status_string_to_yojson x.status);
      ("StatementName", option_to_yojson statement_name_string_to_yojson x.statement_name);
      ("MaxResults", option_to_yojson list_statements_limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_schemas_response_to_yojson (x : list_schemas_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Schemas", option_to_yojson schema_list_to_yojson x.schemas);
    ]

let list_schemas_request_to_yojson (x : list_schemas_request) =
  assoc_to_yojson
    [
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("SchemaPattern", option_to_yojson string__to_yojson x.schema_pattern);
      ("ConnectedDatabase", option_to_yojson string__to_yojson x.connected_database);
      ("Database", Some (string__to_yojson x.database));
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
    ]

let database_list_to_yojson tree = list_to_yojson string__to_yojson tree

let list_databases_response_to_yojson (x : list_databases_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Databases", option_to_yojson database_list_to_yojson x.databases);
    ]

let list_databases_request_to_yojson (x : list_databases_request) =
  assoc_to_yojson
    [
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("Database", Some (string__to_yojson x.database));
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
    ]

let query_records_to_yojson (x : query_records) =
  match x with CSVRecords arg -> assoc_to_yojson [ ("CSVRecords", Some (string__to_yojson arg)) ]

let formatted_sql_records_to_yojson tree = list_to_yojson query_records_to_yojson tree
let integer_to_yojson = int_to_yojson

let column_metadata_to_yojson (x : column_metadata) =
  assoc_to_yojson
    [
      ("columnDefault", option_to_yojson string__to_yojson x.column_default);
      ("length", option_to_yojson integer_to_yojson x.length);
      ("typeName", option_to_yojson string__to_yojson x.type_name);
      ("tableName", option_to_yojson string__to_yojson x.table_name);
      ("schemaName", option_to_yojson string__to_yojson x.schema_name);
      ("scale", option_to_yojson integer_to_yojson x.scale);
      ("precision", option_to_yojson integer_to_yojson x.precision);
      ("nullable", option_to_yojson integer_to_yojson x.nullable);
      ("name", option_to_yojson string__to_yojson x.name);
      ("label", option_to_yojson string__to_yojson x.label);
      ("isSigned", option_to_yojson bool__to_yojson x.is_signed);
      ("isCurrency", option_to_yojson bool__to_yojson x.is_currency);
      ("isCaseSensitive", option_to_yojson bool__to_yojson x.is_case_sensitive);
    ]

let column_metadata_list_to_yojson tree = list_to_yojson column_metadata_to_yojson tree

let get_statement_result_v2_response_to_yojson (x : get_statement_result_v2_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("ResultFormat", option_to_yojson result_format_string_to_yojson x.result_format);
      ("TotalNumRows", option_to_yojson long_to_yojson x.total_num_rows);
      ("ColumnMetadata", option_to_yojson column_metadata_list_to_yojson x.column_metadata);
      ("Records", Some (formatted_sql_records_to_yojson x.records));
    ]

let get_statement_result_v2_request_to_yojson (x : get_statement_result_v2_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Id", Some (uui_d_to_yojson x.id));
    ]

let get_statement_result_response_to_yojson (x : get_statement_result_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("TotalNumRows", option_to_yojson long_to_yojson x.total_num_rows);
      ("ColumnMetadata", option_to_yojson column_metadata_list_to_yojson x.column_metadata);
      ("Records", Some (sql_records_to_yojson x.records));
    ]

let get_statement_result_request_to_yojson (x : get_statement_result_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Id", Some (uui_d_to_yojson x.id));
    ]

let execute_statement_exception_to_yojson (x : execute_statement_exception) =
  assoc_to_yojson
    [
      ("StatementId", Some (string__to_yojson x.statement_id));
      ("Message", Some (string__to_yojson x.message));
    ]

let active_statements_exceeded_exception_to_yojson (x : active_statements_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let active_sessions_exceeded_exception_to_yojson (x : active_sessions_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let db_group_list_to_yojson tree = list_to_yojson string__to_yojson tree

let execute_statement_output_to_yojson (x : execute_statement_output) =
  assoc_to_yojson
    [
      ("SessionId", option_to_yojson uui_d_to_yojson x.session_id);
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("Database", option_to_yojson string__to_yojson x.database);
      ("DbGroups", option_to_yojson db_group_list_to_yojson x.db_groups);
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("Id", option_to_yojson uui_d_to_yojson x.id);
    ]

let client_token_to_yojson = string_to_yojson

let execute_statement_input_to_yojson (x : execute_statement_input) =
  assoc_to_yojson
    [
      ("SessionId", option_to_yojson uui_d_to_yojson x.session_id);
      ( "SessionKeepAliveSeconds",
        option_to_yojson session_alive_seconds_to_yojson x.session_keep_alive_seconds );
      ("ResultFormat", option_to_yojson result_format_string_to_yojson x.result_format);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
      ("Parameters", option_to_yojson sql_parameters_list_to_yojson x.parameters);
      ("StatementName", option_to_yojson statement_name_string_to_yojson x.statement_name);
      ( "WithEvent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.with_event );
      ("Database", option_to_yojson string__to_yojson x.database);
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
      ("Sql", Some (statement_string_to_yojson x.sql));
    ]

let column_list_to_yojson tree = list_to_yojson column_metadata_to_yojson tree

let describe_table_response_to_yojson (x : describe_table_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("ColumnList", option_to_yojson column_list_to_yojson x.column_list);
      ("TableName", option_to_yojson string__to_yojson x.table_name);
    ]

let describe_table_request_to_yojson (x : describe_table_request) =
  assoc_to_yojson
    [
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Table", option_to_yojson string__to_yojson x.table);
      ("Schema", option_to_yojson string__to_yojson x.schema);
      ("ConnectedDatabase", option_to_yojson string__to_yojson x.connected_database);
      ("Database", Some (string__to_yojson x.database));
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
    ]

let describe_statement_response_to_yojson (x : describe_statement_response) =
  assoc_to_yojson
    [
      ("SessionId", option_to_yojson string__to_yojson x.session_id);
      ("ResultFormat", option_to_yojson result_format_string_to_yojson x.result_format);
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
      ("SubStatements", option_to_yojson sub_statement_list_to_yojson x.sub_statements);
      ("QueryParameters", option_to_yojson sql_parameters_list_to_yojson x.query_parameters);
      ("RedshiftQueryId", option_to_yojson long_to_yojson x.redshift_query_id);
      ("ResultSize", option_to_yojson long_to_yojson x.result_size);
      ("ResultRows", option_to_yojson long_to_yojson x.result_rows);
      ("QueryString", option_to_yojson statement_string_to_yojson x.query_string);
      ( "HasResultSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.has_result_set
      );
      ("RedshiftPid", option_to_yojson long_to_yojson x.redshift_pid);
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("Status", option_to_yojson status_string_to_yojson x.status);
      ("Error", option_to_yojson string__to_yojson x.error);
      ("Duration", option_to_yojson long_to_yojson x.duration);
      ("ClusterIdentifier", option_to_yojson string__to_yojson x.cluster_identifier);
      ("Database", option_to_yojson string__to_yojson x.database);
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("Id", Some (uui_d_to_yojson x.id));
    ]

let describe_statement_request_to_yojson (x : describe_statement_request) =
  assoc_to_yojson [ ("Id", Some (uui_d_to_yojson x.id)) ]

let cancel_statement_response_to_yojson (x : cancel_statement_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.status);
    ]

let cancel_statement_request_to_yojson (x : cancel_statement_request) =
  assoc_to_yojson [ ("Id", Some (uui_d_to_yojson x.id)) ]

let batch_execute_statement_exception_to_yojson (x : batch_execute_statement_exception) =
  assoc_to_yojson
    [
      ("StatementId", Some (string__to_yojson x.statement_id));
      ("Message", Some (string__to_yojson x.message));
    ]

let batch_execute_statement_output_to_yojson (x : batch_execute_statement_output) =
  assoc_to_yojson
    [
      ("SessionId", option_to_yojson uui_d_to_yojson x.session_id);
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("Database", option_to_yojson string__to_yojson x.database);
      ("DbGroups", option_to_yojson db_group_list_to_yojson x.db_groups);
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("Id", option_to_yojson uui_d_to_yojson x.id);
    ]

let batch_execute_statement_input_to_yojson (x : batch_execute_statement_input) =
  assoc_to_yojson
    [
      ("SessionId", option_to_yojson uui_d_to_yojson x.session_id);
      ( "SessionKeepAliveSeconds",
        option_to_yojson session_alive_seconds_to_yojson x.session_keep_alive_seconds );
      ("ResultFormat", option_to_yojson result_format_string_to_yojson x.result_format);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("WorkgroupName", option_to_yojson workgroup_name_string_to_yojson x.workgroup_name);
      ("Parameters", option_to_yojson sql_parameters_list_to_yojson x.parameters);
      ("StatementName", option_to_yojson statement_name_string_to_yojson x.statement_name);
      ( "WithEvent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.with_event );
      ("Database", option_to_yojson string__to_yojson x.database);
      ("DbUser", option_to_yojson string__to_yojson x.db_user);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ( "ClusterIdentifier",
        option_to_yojson cluster_identifier_string_to_yojson x.cluster_identifier );
      ("Sqls", Some (sql_list_to_yojson x.sqls));
    ]
