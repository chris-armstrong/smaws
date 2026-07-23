(** Redshift Data client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_batch_execute_statement_output :
  ?id:uui_d ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?cluster_identifier:cluster_identifier_string ->
  ?db_user:string_ ->
  ?db_groups:db_group_list ->
  ?database:string_ ->
  ?secret_arn:secret_arn ->
  ?workgroup_name:workgroup_name_string ->
  ?session_id:uui_d ->
  unit ->
  batch_execute_statement_output

val make_sql_parameter : name:parameter_name -> value:parameter_value -> unit -> sql_parameter

val make_batch_execute_statement_input :
  ?cluster_identifier:cluster_identifier_string ->
  ?secret_arn:secret_arn ->
  ?db_user:string_ ->
  ?database:string_ ->
  ?with_event:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?statement_name:statement_name_string ->
  ?parameters:sql_parameters_list ->
  ?workgroup_name:workgroup_name_string ->
  ?client_token:client_token ->
  ?result_format:result_format_string ->
  ?session_keep_alive_seconds:session_alive_seconds ->
  ?session_id:uui_d ->
  sqls:sql_list ->
  unit ->
  batch_execute_statement_input

val make_cancel_statement_response :
  ?status:Smaws_Lib.Smithy_api.Types.boolean_ -> unit -> cancel_statement_response

val make_cancel_statement_request : id:uui_d -> unit -> cancel_statement_request

val make_column_metadata :
  ?is_case_sensitive:bool_ ->
  ?is_currency:bool_ ->
  ?is_signed:bool_ ->
  ?label:string_ ->
  ?name:string_ ->
  ?nullable:integer ->
  ?precision:integer ->
  ?scale:integer ->
  ?schema_name:string_ ->
  ?table_name:string_ ->
  ?type_name:string_ ->
  ?length:integer ->
  ?column_default:string_ ->
  unit ->
  column_metadata

val make_sub_statement_data :
  ?duration:long ->
  ?error:string_ ->
  ?status:statement_status_string ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?query_string:statement_string ->
  ?result_rows:long ->
  ?result_size:long ->
  ?redshift_query_id:long ->
  ?has_result_set:Smaws_Lib.Smithy_api.Types.boolean_ ->
  id:uui_d ->
  unit ->
  sub_statement_data

val make_describe_statement_response :
  ?secret_arn:secret_arn ->
  ?db_user:string_ ->
  ?database:string_ ->
  ?cluster_identifier:string_ ->
  ?duration:long ->
  ?error:string_ ->
  ?status:status_string ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?redshift_pid:long ->
  ?has_result_set:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?query_string:statement_string ->
  ?result_rows:long ->
  ?result_size:long ->
  ?redshift_query_id:long ->
  ?query_parameters:sql_parameters_list ->
  ?sub_statements:sub_statement_list ->
  ?workgroup_name:workgroup_name_string ->
  ?result_format:result_format_string ->
  ?session_id:string_ ->
  id:uui_d ->
  unit ->
  describe_statement_response

val make_describe_statement_request : id:uui_d -> unit -> describe_statement_request

val make_describe_table_response :
  ?table_name:string_ ->
  ?column_list:column_list ->
  ?next_token:string_ ->
  unit ->
  describe_table_response

val make_describe_table_request :
  ?cluster_identifier:cluster_identifier_string ->
  ?secret_arn:secret_arn ->
  ?db_user:string_ ->
  ?connected_database:string_ ->
  ?schema:string_ ->
  ?table:string_ ->
  ?next_token:string_ ->
  ?max_results:page_size ->
  ?workgroup_name:workgroup_name_string ->
  database:string_ ->
  unit ->
  describe_table_request

val make_execute_statement_output :
  ?id:uui_d ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?cluster_identifier:cluster_identifier_string ->
  ?db_user:string_ ->
  ?db_groups:db_group_list ->
  ?database:string_ ->
  ?secret_arn:secret_arn ->
  ?workgroup_name:workgroup_name_string ->
  ?session_id:uui_d ->
  unit ->
  execute_statement_output

val make_execute_statement_input :
  ?cluster_identifier:cluster_identifier_string ->
  ?secret_arn:secret_arn ->
  ?db_user:string_ ->
  ?database:string_ ->
  ?with_event:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?statement_name:statement_name_string ->
  ?parameters:sql_parameters_list ->
  ?workgroup_name:workgroup_name_string ->
  ?client_token:client_token ->
  ?result_format:result_format_string ->
  ?session_keep_alive_seconds:session_alive_seconds ->
  ?session_id:uui_d ->
  sql:statement_string ->
  unit ->
  execute_statement_input

val make_get_statement_result_response :
  ?column_metadata:column_metadata_list ->
  ?total_num_rows:long ->
  ?next_token:string_ ->
  records:sql_records ->
  unit ->
  get_statement_result_response

val make_get_statement_result_request :
  ?next_token:string_ -> id:uui_d -> unit -> get_statement_result_request

val make_get_statement_result_v2_response :
  ?column_metadata:column_metadata_list ->
  ?total_num_rows:long ->
  ?result_format:result_format_string ->
  ?next_token:string_ ->
  records:formatted_sql_records ->
  unit ->
  get_statement_result_v2_response

val make_get_statement_result_v2_request :
  ?next_token:string_ -> id:uui_d -> unit -> get_statement_result_v2_request

val make_list_databases_response :
  ?databases:database_list -> ?next_token:string_ -> unit -> list_databases_response

val make_list_databases_request :
  ?cluster_identifier:cluster_identifier_string ->
  ?secret_arn:secret_arn ->
  ?db_user:string_ ->
  ?next_token:string_ ->
  ?max_results:page_size ->
  ?workgroup_name:workgroup_name_string ->
  database:string_ ->
  unit ->
  list_databases_request

val make_list_schemas_response :
  ?schemas:schema_list -> ?next_token:string_ -> unit -> list_schemas_response

val make_list_schemas_request :
  ?cluster_identifier:cluster_identifier_string ->
  ?secret_arn:secret_arn ->
  ?db_user:string_ ->
  ?connected_database:string_ ->
  ?schema_pattern:string_ ->
  ?next_token:string_ ->
  ?max_results:page_size ->
  ?workgroup_name:workgroup_name_string ->
  database:string_ ->
  unit ->
  list_schemas_request

val make_statement_data :
  ?query_string:statement_string ->
  ?query_strings:statement_string_list ->
  ?secret_arn:secret_arn ->
  ?status:status_string ->
  ?statement_name:statement_name_string ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?query_parameters:sql_parameters_list ->
  ?is_batch_statement:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?result_format:result_format_string ->
  ?session_id:uui_d ->
  id:uui_d ->
  unit ->
  statement_data

val make_list_statements_response :
  ?next_token:string_ -> statements:statement_list -> unit -> list_statements_response

val make_list_statements_request :
  ?next_token:string_ ->
  ?max_results:list_statements_limit ->
  ?statement_name:statement_name_string ->
  ?status:status_string ->
  ?role_level:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?database:string_ ->
  ?cluster_identifier:cluster_identifier_string ->
  ?workgroup_name:workgroup_name_string ->
  unit ->
  list_statements_request

val make_table_member : ?name:string_ -> ?type_:string_ -> ?schema:string_ -> unit -> table_member

val make_list_tables_response :
  ?tables:table_list -> ?next_token:string_ -> unit -> list_tables_response

val make_list_tables_request :
  ?cluster_identifier:cluster_identifier_string ->
  ?secret_arn:secret_arn ->
  ?db_user:string_ ->
  ?connected_database:string_ ->
  ?schema_pattern:string_ ->
  ?table_pattern:string_ ->
  ?next_token:string_ ->
  ?max_results:page_size ->
  ?workgroup_name:workgroup_name_string ->
  database:string_ ->
  unit ->
  list_tables_request
(** {1:operations Operations} *)

module ListTables : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DatabaseConnectionException of database_connection_exception
    | `InternalServerException of internal_server_exception
    | `QueryTimeoutException of query_timeout_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tables_request ->
    ( list_tables_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DatabaseConnectionException of database_connection_exception
      | `InternalServerException of internal_server_exception
      | `QueryTimeoutException of query_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tables_request ->
    ( list_tables_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DatabaseConnectionException of database_connection_exception
      | `InternalServerException of internal_server_exception
      | `QueryTimeoutException of query_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List the tables in a database. If neither [SchemaPattern] nor [TablePattern] are specified, \
   then all tables in the database are returned. A token is returned to page through the table \
   list. Depending on the authorization method, use one of the following combinations of request \
   parameters: \n\n\
  \ {ul\n\
  \       {-  Secrets Manager - when connecting to a cluster, provide the [secret-arn] of a secret \
   stored in Secrets Manager which has [username] and [password]. The specified secret contains \
   credentials to connect to the [database] you specify. When you are connecting to a cluster, you \
   also supply the database name, If you provide a cluster identifier ([dbClusterIdentifier]), it \
   must match the cluster identifier stored in the secret. When you are connecting to a serverless \
   workgroup, you also supply the database name.\n\
  \           \n\
  \            }\n\
  \       {-  Temporary credentials - when connecting to your data warehouse, choose one of the \
   following options:\n\
  \           \n\
  \            {ul\n\
  \                  {-  When connecting to a serverless workgroup, specify the workgroup name and \
   database name. The database user name is derived from the IAM identity. For example, \
   [arn:iam::123456789012:user:foo] has the database user name [IAM:foo]. Also, permission to call \
   the [redshift-serverless:GetCredentials] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  {-  When connecting to a cluster as an IAM identity, specify the cluster \
   identifier and the database name. The database user name is derived from the IAM identity. For \
   example, [arn:iam::123456789012:user:foo] has the database user name [IAM:foo]. Also, \
   permission to call the [redshift:GetClusterCredentialsWithIAM] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  {-  When connecting to a cluster as a database user, specify the cluster \
   identifier, the database name, and the database user name. Also, permission to call the \
   [redshift:GetClusterCredentials] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  \n\
  \        }\n\
  \         }\n\
  \       }\n\
  \   For more information about the Amazon Redshift Data API and CLI usage examples, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html}Using the Amazon Redshift \
   Data API} in the {i Amazon Redshift Management Guide}. \n\
  \   "]

module ListStatements : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_statements_request ->
    ( list_statements_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_statements_request ->
    ( list_statements_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List of SQL statements. By default, only finished statements are shown. A token is returned to \
   page through the statement list. \n\n\
  \ When you use identity-enhanced role sessions to list statements, you must provide either the \
   [cluster-identifier] or [workgroup-name] parameter. This ensures that the IdC user can only \
   access the Amazon Redshift IdC applications they are assigned. For more information, see \
   {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/trustedidentitypropagation-overview.html} \
   Trusted identity propagation overview}.\n\
  \ \n\
  \  For more information about the Amazon Redshift Data API and CLI usage examples, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html}Using the Amazon Redshift \
   Data API} in the {i Amazon Redshift Management Guide}. \n\
  \  "]

module ListSchemas : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DatabaseConnectionException of database_connection_exception
    | `InternalServerException of internal_server_exception
    | `QueryTimeoutException of query_timeout_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_schemas_request ->
    ( list_schemas_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DatabaseConnectionException of database_connection_exception
      | `InternalServerException of internal_server_exception
      | `QueryTimeoutException of query_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_schemas_request ->
    ( list_schemas_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DatabaseConnectionException of database_connection_exception
      | `InternalServerException of internal_server_exception
      | `QueryTimeoutException of query_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the schemas in a database. A token is returned to page through the schema list. Depending \
   on the authorization method, use one of the following combinations of request parameters: \n\n\
  \ {ul\n\
  \       {-  Secrets Manager - when connecting to a cluster, provide the [secret-arn] of a secret \
   stored in Secrets Manager which has [username] and [password]. The specified secret contains \
   credentials to connect to the [database] you specify. When you are connecting to a cluster, you \
   also supply the database name, If you provide a cluster identifier ([dbClusterIdentifier]), it \
   must match the cluster identifier stored in the secret. When you are connecting to a serverless \
   workgroup, you also supply the database name.\n\
  \           \n\
  \            }\n\
  \       {-  Temporary credentials - when connecting to your data warehouse, choose one of the \
   following options:\n\
  \           \n\
  \            {ul\n\
  \                  {-  When connecting to a serverless workgroup, specify the workgroup name and \
   database name. The database user name is derived from the IAM identity. For example, \
   [arn:iam::123456789012:user:foo] has the database user name [IAM:foo]. Also, permission to call \
   the [redshift-serverless:GetCredentials] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  {-  When connecting to a cluster as an IAM identity, specify the cluster \
   identifier and the database name. The database user name is derived from the IAM identity. For \
   example, [arn:iam::123456789012:user:foo] has the database user name [IAM:foo]. Also, \
   permission to call the [redshift:GetClusterCredentialsWithIAM] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  {-  When connecting to a cluster as a database user, specify the cluster \
   identifier, the database name, and the database user name. Also, permission to call the \
   [redshift:GetClusterCredentials] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  \n\
  \        }\n\
  \         }\n\
  \       }\n\
  \   For more information about the Amazon Redshift Data API and CLI usage examples, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html}Using the Amazon Redshift \
   Data API} in the {i Amazon Redshift Management Guide}. \n\
  \   "]

module ListDatabases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DatabaseConnectionException of database_connection_exception
    | `InternalServerException of internal_server_exception
    | `QueryTimeoutException of query_timeout_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_databases_request ->
    ( list_databases_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DatabaseConnectionException of database_connection_exception
      | `InternalServerException of internal_server_exception
      | `QueryTimeoutException of query_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_databases_request ->
    ( list_databases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DatabaseConnectionException of database_connection_exception
      | `InternalServerException of internal_server_exception
      | `QueryTimeoutException of query_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List the databases in a cluster. A token is returned to page through the database list. \
   Depending on the authorization method, use one of the following combinations of request \
   parameters: \n\n\
  \ {ul\n\
  \       {-  Secrets Manager - when connecting to a cluster, provide the [secret-arn] of a secret \
   stored in Secrets Manager which has [username] and [password]. The specified secret contains \
   credentials to connect to the [database] you specify. When you are connecting to a cluster, you \
   also supply the database name, If you provide a cluster identifier ([dbClusterIdentifier]), it \
   must match the cluster identifier stored in the secret. When you are connecting to a serverless \
   workgroup, you also supply the database name.\n\
  \           \n\
  \            }\n\
  \       {-  Temporary credentials - when connecting to your data warehouse, choose one of the \
   following options:\n\
  \           \n\
  \            {ul\n\
  \                  {-  When connecting to a serverless workgroup, specify the workgroup name and \
   database name. The database user name is derived from the IAM identity. For example, \
   [arn:iam::123456789012:user:foo] has the database user name [IAM:foo]. Also, permission to call \
   the [redshift-serverless:GetCredentials] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  {-  When connecting to a cluster as an IAM identity, specify the cluster \
   identifier and the database name. The database user name is derived from the IAM identity. For \
   example, [arn:iam::123456789012:user:foo] has the database user name [IAM:foo]. Also, \
   permission to call the [redshift:GetClusterCredentialsWithIAM] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  {-  When connecting to a cluster as a database user, specify the cluster \
   identifier, the database name, and the database user name. Also, permission to call the \
   [redshift:GetClusterCredentials] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  \n\
  \        }\n\
  \         }\n\
  \       }\n\
  \   For more information about the Amazon Redshift Data API and CLI usage examples, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html}Using the Amazon Redshift \
   Data API} in the {i Amazon Redshift Management Guide}. \n\
  \   "]

module GetStatementResultV2 : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_statement_result_v2_request ->
    ( get_statement_result_v2_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_statement_result_v2_request ->
    ( get_statement_result_v2_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Fetches the temporarily cached result of an SQL statement in CSV format. The [ExecuteStatement] \
   or [BatchExecuteStatement] operation that ran the SQL statement must have specified \
   [ResultFormat] as [CSV]. A token is returned to page through the statement results.\n\n\
  \ For more information about the Amazon Redshift Data API and CLI usage examples, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html}Using the Amazon Redshift \
   Data API} in the {i Amazon Redshift Management Guide}. \n\
  \ "]

module GetStatementResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_statement_result_request ->
    ( get_statement_result_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_statement_result_request ->
    ( get_statement_result_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Fetches the temporarily cached result of an SQL statement in JSON format. The \
   [ExecuteStatement] or [BatchExecuteStatement] operation that ran the SQL statement must have \
   specified [ResultFormat] as [JSON] , or let the format default to JSON. A token is returned to \
   page through the statement results.\n\n\
  \ For more information about the Amazon Redshift Data API and CLI usage examples, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html}Using the Amazon Redshift \
   Data API} in the {i Amazon Redshift Management Guide}. \n\
  \ "]

module ExecuteStatement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActiveSessionsExceededException of active_sessions_exceeded_exception
    | `ActiveStatementsExceededException of active_statements_exceeded_exception
    | `ExecuteStatementException of execute_statement_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    execute_statement_input ->
    ( execute_statement_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActiveSessionsExceededException of active_sessions_exceeded_exception
      | `ActiveStatementsExceededException of active_statements_exceeded_exception
      | `ExecuteStatementException of execute_statement_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    execute_statement_input ->
    ( execute_statement_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActiveSessionsExceededException of active_sessions_exceeded_exception
      | `ActiveStatementsExceededException of active_statements_exceeded_exception
      | `ExecuteStatementException of execute_statement_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Runs an SQL statement, which can be data manipulation language (DML) or data definition \
   language (DDL). This statement must be a single SQL statement. Depending on the authorization \
   method, use one of the following combinations of request parameters: \n\n\
  \ {ul\n\
  \       {-  Secrets Manager - when connecting to a cluster, provide the [secret-arn] of a secret \
   stored in Secrets Manager which has [username] and [password]. The specified secret contains \
   credentials to connect to the [database] you specify. When you are connecting to a cluster, you \
   also supply the database name, If you provide a cluster identifier ([dbClusterIdentifier]), it \
   must match the cluster identifier stored in the secret. When you are connecting to a serverless \
   workgroup, you also supply the database name.\n\
  \           \n\
  \            }\n\
  \       {-  Temporary credentials - when connecting to your data warehouse, choose one of the \
   following options:\n\
  \           \n\
  \            {ul\n\
  \                  {-  When connecting to a serverless workgroup, specify the workgroup name and \
   database name. The database user name is derived from the IAM identity. For example, \
   [arn:iam::123456789012:user:foo] has the database user name [IAM:foo]. Also, permission to call \
   the [redshift-serverless:GetCredentials] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  {-  When connecting to a cluster as an IAM identity, specify the cluster \
   identifier and the database name. The database user name is derived from the IAM identity. For \
   example, [arn:iam::123456789012:user:foo] has the database user name [IAM:foo]. Also, \
   permission to call the [redshift:GetClusterCredentialsWithIAM] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  {-  When connecting to a cluster as a database user, specify the cluster \
   identifier, the database name, and the database user name. Also, permission to call the \
   [redshift:GetClusterCredentials] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  \n\
  \        }\n\
  \         }\n\
  \       }\n\
  \   For more information about the Amazon Redshift Data API and CLI usage examples, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html}Using the Amazon Redshift \
   Data API} in the {i Amazon Redshift Management Guide}. \n\
  \   "]

module DescribeTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DatabaseConnectionException of database_connection_exception
    | `InternalServerException of internal_server_exception
    | `QueryTimeoutException of query_timeout_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_table_request ->
    ( describe_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DatabaseConnectionException of database_connection_exception
      | `InternalServerException of internal_server_exception
      | `QueryTimeoutException of query_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_table_request ->
    ( describe_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DatabaseConnectionException of database_connection_exception
      | `InternalServerException of internal_server_exception
      | `QueryTimeoutException of query_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the detailed information about a table from metadata in the cluster. The information \
   includes its columns. A token is returned to page through the column list. Depending on the \
   authorization method, use one of the following combinations of request parameters: \n\n\
  \ {ul\n\
  \       {-  Secrets Manager - when connecting to a cluster, provide the [secret-arn] of a secret \
   stored in Secrets Manager which has [username] and [password]. The specified secret contains \
   credentials to connect to the [database] you specify. When you are connecting to a cluster, you \
   also supply the database name, If you provide a cluster identifier ([dbClusterIdentifier]), it \
   must match the cluster identifier stored in the secret. When you are connecting to a serverless \
   workgroup, you also supply the database name.\n\
  \           \n\
  \            }\n\
  \       {-  Temporary credentials - when connecting to your data warehouse, choose one of the \
   following options:\n\
  \           \n\
  \            {ul\n\
  \                  {-  When connecting to a serverless workgroup, specify the workgroup name and \
   database name. The database user name is derived from the IAM identity. For example, \
   [arn:iam::123456789012:user:foo] has the database user name [IAM:foo]. Also, permission to call \
   the [redshift-serverless:GetCredentials] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  {-  When connecting to a cluster as an IAM identity, specify the cluster \
   identifier and the database name. The database user name is derived from the IAM identity. For \
   example, [arn:iam::123456789012:user:foo] has the database user name [IAM:foo]. Also, \
   permission to call the [redshift:GetClusterCredentialsWithIAM] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  {-  When connecting to a cluster as a database user, specify the cluster \
   identifier, the database name, and the database user name. Also, permission to call the \
   [redshift:GetClusterCredentials] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  \n\
  \        }\n\
  \         }\n\
  \       }\n\
  \   For more information about the Amazon Redshift Data API and CLI usage examples, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html}Using the Amazon Redshift \
   Data API} in the {i Amazon Redshift Management Guide}. \n\
  \   "]

module DescribeStatement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_statement_request ->
    ( describe_statement_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_statement_request ->
    ( describe_statement_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the details about a specific instance when a query was run by the Amazon Redshift \
   Data API. The information includes when the query started, when it finished, the query status, \
   the number of rows returned, and the SQL statement. \n\n\
  \ For more information about the Amazon Redshift Data API and CLI usage examples, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html}Using the Amazon Redshift \
   Data API} in the {i Amazon Redshift Management Guide}. \n\
  \ "]

module CancelStatement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DatabaseConnectionException of database_connection_exception
    | `InternalServerException of internal_server_exception
    | `QueryTimeoutException of query_timeout_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_statement_request ->
    ( cancel_statement_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DatabaseConnectionException of database_connection_exception
      | `InternalServerException of internal_server_exception
      | `QueryTimeoutException of query_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_statement_request ->
    ( cancel_statement_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DatabaseConnectionException of database_connection_exception
      | `InternalServerException of internal_server_exception
      | `QueryTimeoutException of query_timeout_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels a running query. To be canceled, a query must be running. \n\n\
  \ For more information about the Amazon Redshift Data API and CLI usage examples, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html}Using the Amazon Redshift \
   Data API} in the {i Amazon Redshift Management Guide}. \n\
  \ "]

(** {1:Serialization and Deserialization} *)
module BatchExecuteStatement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActiveSessionsExceededException of active_sessions_exceeded_exception
    | `ActiveStatementsExceededException of active_statements_exceeded_exception
    | `BatchExecuteStatementException of batch_execute_statement_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_execute_statement_input ->
    ( batch_execute_statement_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActiveSessionsExceededException of active_sessions_exceeded_exception
      | `ActiveStatementsExceededException of active_statements_exceeded_exception
      | `BatchExecuteStatementException of batch_execute_statement_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_execute_statement_input ->
    ( batch_execute_statement_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActiveSessionsExceededException of active_sessions_exceeded_exception
      | `ActiveStatementsExceededException of active_statements_exceeded_exception
      | `BatchExecuteStatementException of batch_execute_statement_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Runs one or more SQL statements, which can be data manipulation language (DML) or data \
   definition language (DDL). Depending on the authorization method, use one of the following \
   combinations of request parameters: \n\n\
  \ {ul\n\
  \       {-  Secrets Manager - when connecting to a cluster, provide the [secret-arn] of a secret \
   stored in Secrets Manager which has [username] and [password]. The specified secret contains \
   credentials to connect to the [database] you specify. When you are connecting to a cluster, you \
   also supply the database name, If you provide a cluster identifier ([dbClusterIdentifier]), it \
   must match the cluster identifier stored in the secret. When you are connecting to a serverless \
   workgroup, you also supply the database name.\n\
  \           \n\
  \            }\n\
  \       {-  Temporary credentials - when connecting to your data warehouse, choose one of the \
   following options:\n\
  \           \n\
  \            {ul\n\
  \                  {-  When connecting to a serverless workgroup, specify the workgroup name and \
   database name. The database user name is derived from the IAM identity. For example, \
   [arn:iam::123456789012:user:foo] has the database user name [IAM:foo]. Also, permission to call \
   the [redshift-serverless:GetCredentials] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  {-  When connecting to a cluster as an IAM identity, specify the cluster \
   identifier and the database name. The database user name is derived from the IAM identity. For \
   example, [arn:iam::123456789012:user:foo] has the database user name [IAM:foo]. Also, \
   permission to call the [redshift:GetClusterCredentialsWithIAM] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  {-  When connecting to a cluster as a database user, specify the cluster \
   identifier, the database name, and the database user name. Also, permission to call the \
   [redshift:GetClusterCredentials] operation is required.\n\
  \                      \n\
  \                       }\n\
  \                  \n\
  \        }\n\
  \         }\n\
  \       }\n\
  \   For more information about the Amazon Redshift Data API and CLI usage examples, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/data-api.html}Using the Amazon Redshift \
   Data API} in the {i Amazon Redshift Management Guide}. \n\
  \   "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
