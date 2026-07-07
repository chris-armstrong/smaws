open Types
open Service_metadata

module BatchExecuteStatement = struct
  let error_to_string = function
    | `ActiveSessionsExceededException _ ->
        "com.amazonaws.redshiftdata#ActiveSessionsExceededException"
    | `ActiveStatementsExceededException _ ->
        "com.amazonaws.redshiftdata#ActiveStatementsExceededException"
    | `BatchExecuteStatementException _ ->
        "com.amazonaws.redshiftdata#BatchExecuteStatementException"
    | `InternalServerException _ -> "com.amazonaws.redshiftdata#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftdata#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftdata#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ActiveSessionsExceededException" ->
          `ActiveSessionsExceededException
            (Json_deserializers.active_sessions_exceeded_exception_of_yojson tree path)
      | _, "ActiveStatementsExceededException" ->
          `ActiveStatementsExceededException
            (Json_deserializers.active_statements_exceeded_exception_of_yojson tree path)
      | _, "BatchExecuteStatementException" ->
          `BatchExecuteStatementException
            (Json_deserializers.batch_execute_statement_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_execute_statement_input) =
    let input = Json_serializers.batch_execute_statement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftData.BatchExecuteStatement" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_execute_statement_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_execute_statement_input) =
    let input = Json_serializers.batch_execute_statement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftData.BatchExecuteStatement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_execute_statement_output_of_yojson
      ~error_deserializer
end

module CancelStatement = struct
  let error_to_string = function
    | `DatabaseConnectionException _ -> "com.amazonaws.redshiftdata#DatabaseConnectionException"
    | `InternalServerException _ -> "com.amazonaws.redshiftdata#InternalServerException"
    | `QueryTimeoutException _ -> "com.amazonaws.redshiftdata#QueryTimeoutException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftdata#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftdata#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DatabaseConnectionException" ->
          `DatabaseConnectionException
            (Json_deserializers.database_connection_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "QueryTimeoutException" ->
          `QueryTimeoutException (Json_deserializers.query_timeout_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_statement_request) =
    let input = Json_serializers.cancel_statement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftData.CancelStatement" ~service ~context
      ~input ~output_deserializer:Json_deserializers.cancel_statement_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_statement_request) =
    let input = Json_serializers.cancel_statement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftData.CancelStatement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_statement_response_of_yojson
      ~error_deserializer
end

module DescribeStatement = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftdata#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftdata#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftdata#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_statement_request) =
    let input = Json_serializers.describe_statement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftData.DescribeStatement" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_statement_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_statement_request) =
    let input = Json_serializers.describe_statement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftData.DescribeStatement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_statement_response_of_yojson
      ~error_deserializer
end

module DescribeTable = struct
  let error_to_string = function
    | `DatabaseConnectionException _ -> "com.amazonaws.redshiftdata#DatabaseConnectionException"
    | `InternalServerException _ -> "com.amazonaws.redshiftdata#InternalServerException"
    | `QueryTimeoutException _ -> "com.amazonaws.redshiftdata#QueryTimeoutException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftdata#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftdata#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DatabaseConnectionException" ->
          `DatabaseConnectionException
            (Json_deserializers.database_connection_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "QueryTimeoutException" ->
          `QueryTimeoutException (Json_deserializers.query_timeout_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_table_request) =
    let input = Json_serializers.describe_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftData.DescribeTable" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_table_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_table_request) =
    let input = Json_serializers.describe_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftData.DescribeTable"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_table_response_of_yojson ~error_deserializer
end

module ExecuteStatement = struct
  let error_to_string = function
    | `ActiveSessionsExceededException _ ->
        "com.amazonaws.redshiftdata#ActiveSessionsExceededException"
    | `ActiveStatementsExceededException _ ->
        "com.amazonaws.redshiftdata#ActiveStatementsExceededException"
    | `ExecuteStatementException _ -> "com.amazonaws.redshiftdata#ExecuteStatementException"
    | `InternalServerException _ -> "com.amazonaws.redshiftdata#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftdata#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftdata#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ActiveSessionsExceededException" ->
          `ActiveSessionsExceededException
            (Json_deserializers.active_sessions_exceeded_exception_of_yojson tree path)
      | _, "ActiveStatementsExceededException" ->
          `ActiveStatementsExceededException
            (Json_deserializers.active_statements_exceeded_exception_of_yojson tree path)
      | _, "ExecuteStatementException" ->
          `ExecuteStatementException
            (Json_deserializers.execute_statement_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : execute_statement_input) =
    let input = Json_serializers.execute_statement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftData.ExecuteStatement" ~service
      ~context ~input ~output_deserializer:Json_deserializers.execute_statement_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : execute_statement_input) =
    let input = Json_serializers.execute_statement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftData.ExecuteStatement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.execute_statement_output_of_yojson ~error_deserializer
end

module GetStatementResult = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftdata#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftdata#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftdata#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_statement_result_request) =
    let input = Json_serializers.get_statement_result_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftData.GetStatementResult" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_statement_result_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_statement_result_request) =
    let input = Json_serializers.get_statement_result_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftData.GetStatementResult"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_statement_result_response_of_yojson
      ~error_deserializer
end

module GetStatementResultV2 = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftdata#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftdata#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftdata#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_statement_result_v2_request) =
    let input = Json_serializers.get_statement_result_v2_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftData.GetStatementResultV2" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_statement_result_v2_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_statement_result_v2_request) =
    let input = Json_serializers.get_statement_result_v2_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RedshiftData.GetStatementResultV2" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_statement_result_v2_response_of_yojson
      ~error_deserializer
end

module ListDatabases = struct
  let error_to_string = function
    | `DatabaseConnectionException _ -> "com.amazonaws.redshiftdata#DatabaseConnectionException"
    | `InternalServerException _ -> "com.amazonaws.redshiftdata#InternalServerException"
    | `QueryTimeoutException _ -> "com.amazonaws.redshiftdata#QueryTimeoutException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftdata#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftdata#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DatabaseConnectionException" ->
          `DatabaseConnectionException
            (Json_deserializers.database_connection_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "QueryTimeoutException" ->
          `QueryTimeoutException (Json_deserializers.query_timeout_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_databases_request) =
    let input = Json_serializers.list_databases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftData.ListDatabases" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_databases_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_databases_request) =
    let input = Json_serializers.list_databases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftData.ListDatabases"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_databases_response_of_yojson ~error_deserializer
end

module ListSchemas = struct
  let error_to_string = function
    | `DatabaseConnectionException _ -> "com.amazonaws.redshiftdata#DatabaseConnectionException"
    | `InternalServerException _ -> "com.amazonaws.redshiftdata#InternalServerException"
    | `QueryTimeoutException _ -> "com.amazonaws.redshiftdata#QueryTimeoutException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftdata#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftdata#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DatabaseConnectionException" ->
          `DatabaseConnectionException
            (Json_deserializers.database_connection_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "QueryTimeoutException" ->
          `QueryTimeoutException (Json_deserializers.query_timeout_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_schemas_request) =
    let input = Json_serializers.list_schemas_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftData.ListSchemas" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_schemas_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_schemas_request) =
    let input = Json_serializers.list_schemas_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftData.ListSchemas"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_schemas_response_of_yojson ~error_deserializer
end

module ListStatements = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.redshiftdata#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftdata#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftdata#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_statements_request) =
    let input = Json_serializers.list_statements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftData.ListStatements" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_statements_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_statements_request) =
    let input = Json_serializers.list_statements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftData.ListStatements"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_statements_response_of_yojson ~error_deserializer
end

module ListTables = struct
  let error_to_string = function
    | `DatabaseConnectionException _ -> "com.amazonaws.redshiftdata#DatabaseConnectionException"
    | `InternalServerException _ -> "com.amazonaws.redshiftdata#InternalServerException"
    | `QueryTimeoutException _ -> "com.amazonaws.redshiftdata#QueryTimeoutException"
    | `ResourceNotFoundException _ -> "com.amazonaws.redshiftdata#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.redshiftdata#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DatabaseConnectionException" ->
          `DatabaseConnectionException
            (Json_deserializers.database_connection_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "QueryTimeoutException" ->
          `QueryTimeoutException (Json_deserializers.query_timeout_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tables_request) =
    let input = Json_serializers.list_tables_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RedshiftData.ListTables" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_tables_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tables_request) =
    let input = Json_serializers.list_tables_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RedshiftData.ListTables" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_tables_response_of_yojson
      ~error_deserializer
end
