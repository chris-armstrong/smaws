open Types

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
