open Types
open Service_metadata

module BatchGetNamedQuery = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_named_query_input) =
    let input = Json_serializers.batch_get_named_query_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.BatchGetNamedQuery" ~service
      ~context ~input ~output_deserializer:Json_deserializers.batch_get_named_query_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_named_query_input) =
    let input = Json_serializers.batch_get_named_query_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.BatchGetNamedQuery"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_named_query_output_of_yojson
      ~error_deserializer
end

module BatchGetPreparedStatement = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_prepared_statement_input) =
    let input = Json_serializers.batch_get_prepared_statement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.BatchGetPreparedStatement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_prepared_statement_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_prepared_statement_input) =
    let input = Json_serializers.batch_get_prepared_statement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.BatchGetPreparedStatement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_prepared_statement_output_of_yojson
      ~error_deserializer
end

module BatchGetQueryExecution = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_query_execution_input) =
    let input = Json_serializers.batch_get_query_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.BatchGetQueryExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_query_execution_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_query_execution_input) =
    let input = Json_serializers.batch_get_query_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.BatchGetQueryExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_query_execution_output_of_yojson
      ~error_deserializer
end

module CancelCapacityReservation = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_capacity_reservation_input) =
    let input = Json_serializers.cancel_capacity_reservation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.CancelCapacityReservation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_capacity_reservation_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_capacity_reservation_input) =
    let input = Json_serializers.cancel_capacity_reservation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.CancelCapacityReservation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_capacity_reservation_output_of_yojson
      ~error_deserializer
end

module CreateCapacityReservation = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_capacity_reservation_input) =
    let input = Json_serializers.create_capacity_reservation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.CreateCapacityReservation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_capacity_reservation_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_capacity_reservation_input) =
    let input = Json_serializers.create_capacity_reservation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.CreateCapacityReservation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_capacity_reservation_output_of_yojson
      ~error_deserializer
end

module CreateDataCatalog = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_data_catalog_input) =
    let input = Json_serializers.create_data_catalog_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.CreateDataCatalog" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_data_catalog_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_data_catalog_input) =
    let input = Json_serializers.create_data_catalog_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.CreateDataCatalog"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_catalog_output_of_yojson
      ~error_deserializer
end

module CreateNamedQuery = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_named_query_input) =
    let input = Json_serializers.create_named_query_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.CreateNamedQuery" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_named_query_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_named_query_input) =
    let input = Json_serializers.create_named_query_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.CreateNamedQuery"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_named_query_output_of_yojson
      ~error_deserializer
end

module CreateNotebook = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.athena#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_notebook_input) =
    let input = Json_serializers.create_notebook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.CreateNotebook" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_notebook_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_notebook_input) =
    let input = Json_serializers.create_notebook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.CreateNotebook"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_notebook_output_of_yojson ~error_deserializer
end

module CreatePreparedStatement = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_prepared_statement_input) =
    let input = Json_serializers.create_prepared_statement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.CreatePreparedStatement" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_prepared_statement_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_prepared_statement_input) =
    let input = Json_serializers.create_prepared_statement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.CreatePreparedStatement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_prepared_statement_output_of_yojson
      ~error_deserializer
end

module CreatePresignedNotebookUrl = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_presigned_notebook_url_request) =
    let input = Json_serializers.create_presigned_notebook_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.CreatePresignedNotebookUrl"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_presigned_notebook_url_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_presigned_notebook_url_request) =
    let input = Json_serializers.create_presigned_notebook_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.CreatePresignedNotebookUrl" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_presigned_notebook_url_response_of_yojson
      ~error_deserializer
end

module CreateWorkGroup = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_work_group_input) =
    let input = Json_serializers.create_work_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.CreateWorkGroup" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_work_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_work_group_input) =
    let input = Json_serializers.create_work_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.CreateWorkGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_work_group_output_of_yojson ~error_deserializer
end

module DeleteCapacityReservation = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_capacity_reservation_input) =
    let input = Json_serializers.delete_capacity_reservation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.DeleteCapacityReservation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_capacity_reservation_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_capacity_reservation_input) =
    let input = Json_serializers.delete_capacity_reservation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.DeleteCapacityReservation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_capacity_reservation_output_of_yojson
      ~error_deserializer
end

module DeleteDataCatalog = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_data_catalog_input) =
    let input = Json_serializers.delete_data_catalog_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.DeleteDataCatalog" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_data_catalog_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_data_catalog_input) =
    let input = Json_serializers.delete_data_catalog_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.DeleteDataCatalog"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_data_catalog_output_of_yojson
      ~error_deserializer
end

module DeleteNamedQuery = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_named_query_input) =
    let input = Json_serializers.delete_named_query_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.DeleteNamedQuery" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_named_query_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_named_query_input) =
    let input = Json_serializers.delete_named_query_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.DeleteNamedQuery"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_named_query_output_of_yojson
      ~error_deserializer
end

module DeleteNotebook = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.athena#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_notebook_input) =
    let input = Json_serializers.delete_notebook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.DeleteNotebook" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_notebook_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_notebook_input) =
    let input = Json_serializers.delete_notebook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.DeleteNotebook"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_notebook_output_of_yojson ~error_deserializer
end

module DeletePreparedStatement = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_prepared_statement_input) =
    let input = Json_serializers.delete_prepared_statement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.DeletePreparedStatement" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_prepared_statement_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_prepared_statement_input) =
    let input = Json_serializers.delete_prepared_statement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.DeletePreparedStatement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_prepared_statement_output_of_yojson
      ~error_deserializer
end

module DeleteWorkGroup = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_work_group_input) =
    let input = Json_serializers.delete_work_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.DeleteWorkGroup" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_work_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_work_group_input) =
    let input = Json_serializers.delete_work_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.DeleteWorkGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_work_group_output_of_yojson ~error_deserializer
end

module ExportNotebook = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.athena#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : export_notebook_input) =
    let input = Json_serializers.export_notebook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ExportNotebook" ~service ~context
      ~input ~output_deserializer:Json_deserializers.export_notebook_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : export_notebook_input) =
    let input = Json_serializers.export_notebook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.ExportNotebook"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.export_notebook_output_of_yojson ~error_deserializer
end

module GetCalculationExecution = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_calculation_execution_request) =
    let input = Json_serializers.get_calculation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetCalculationExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_calculation_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_calculation_execution_request) =
    let input = Json_serializers.get_calculation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.GetCalculationExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_calculation_execution_response_of_yojson
      ~error_deserializer
end

module GetCalculationExecutionCode = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_calculation_execution_code_request) =
    let input = Json_serializers.get_calculation_execution_code_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetCalculationExecutionCode"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_calculation_execution_code_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_calculation_execution_code_request) =
    let input = Json_serializers.get_calculation_execution_code_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.GetCalculationExecutionCode" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_calculation_execution_code_response_of_yojson
      ~error_deserializer
end

module GetCalculationExecutionStatus = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_calculation_execution_status_request) =
    let input = Json_serializers.get_calculation_execution_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetCalculationExecutionStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_calculation_execution_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_calculation_execution_status_request) =
    let input = Json_serializers.get_calculation_execution_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.GetCalculationExecutionStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_calculation_execution_status_response_of_yojson
      ~error_deserializer
end

module GetCapacityAssignmentConfiguration = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_capacity_assignment_configuration_input) =
    let input = Json_serializers.get_capacity_assignment_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonAthena.GetCapacityAssignmentConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_capacity_assignment_configuration_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_capacity_assignment_configuration_input) =
    let input = Json_serializers.get_capacity_assignment_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.GetCapacityAssignmentConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_capacity_assignment_configuration_output_of_yojson
      ~error_deserializer
end

module GetCapacityReservation = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_capacity_reservation_input) =
    let input = Json_serializers.get_capacity_reservation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetCapacityReservation" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_capacity_reservation_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_capacity_reservation_input) =
    let input = Json_serializers.get_capacity_reservation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.GetCapacityReservation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_capacity_reservation_output_of_yojson
      ~error_deserializer
end

module GetDatabase = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `MetadataException _ -> "com.amazonaws.athena#MetadataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "MetadataException" ->
          `MetadataException (Json_deserializers.metadata_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_database_input) =
    let input = Json_serializers.get_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetDatabase" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_database_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_database_input) =
    let input = Json_serializers.get_database_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.GetDatabase"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_database_output_of_yojson
      ~error_deserializer
end

module GetDataCatalog = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_data_catalog_input) =
    let input = Json_serializers.get_data_catalog_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetDataCatalog" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_data_catalog_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_data_catalog_input) =
    let input = Json_serializers.get_data_catalog_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.GetDataCatalog"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_data_catalog_output_of_yojson ~error_deserializer
end

module GetNamedQuery = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_named_query_input) =
    let input = Json_serializers.get_named_query_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetNamedQuery" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_named_query_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_named_query_input) =
    let input = Json_serializers.get_named_query_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.GetNamedQuery"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_named_query_output_of_yojson ~error_deserializer
end

module GetNotebookMetadata = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.athena#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_notebook_metadata_input) =
    let input = Json_serializers.get_notebook_metadata_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetNotebookMetadata" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_notebook_metadata_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_notebook_metadata_input) =
    let input = Json_serializers.get_notebook_metadata_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.GetNotebookMetadata"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_notebook_metadata_output_of_yojson
      ~error_deserializer
end

module GetPreparedStatement = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_prepared_statement_input) =
    let input = Json_serializers.get_prepared_statement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetPreparedStatement" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_prepared_statement_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_prepared_statement_input) =
    let input = Json_serializers.get_prepared_statement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.GetPreparedStatement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_prepared_statement_output_of_yojson
      ~error_deserializer
end

module GetQueryExecution = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_query_execution_input) =
    let input = Json_serializers.get_query_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetQueryExecution" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_query_execution_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_query_execution_input) =
    let input = Json_serializers.get_query_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.GetQueryExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_query_execution_output_of_yojson
      ~error_deserializer
end

module GetQueryResults = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.athena#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_query_results_input) =
    let input = Json_serializers.get_query_results_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetQueryResults" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_query_results_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_query_results_input) =
    let input = Json_serializers.get_query_results_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.GetQueryResults"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_query_results_output_of_yojson ~error_deserializer
end

module GetQueryRuntimeStatistics = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_query_runtime_statistics_input) =
    let input = Json_serializers.get_query_runtime_statistics_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetQueryRuntimeStatistics"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_query_runtime_statistics_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_query_runtime_statistics_input) =
    let input = Json_serializers.get_query_runtime_statistics_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.GetQueryRuntimeStatistics" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_query_runtime_statistics_output_of_yojson
      ~error_deserializer
end

module GetResourceDashboard = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_dashboard_request) =
    let input = Json_serializers.get_resource_dashboard_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetResourceDashboard" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_dashboard_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resource_dashboard_request) =
    let input = Json_serializers.get_resource_dashboard_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.GetResourceDashboard" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_dashboard_response_of_yojson
      ~error_deserializer
end

module GetSession = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_session_request) =
    let input = Json_serializers.get_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetSession" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_session_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_session_request) =
    let input = Json_serializers.get_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.GetSession" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_session_response_of_yojson
      ~error_deserializer
end

module GetSessionEndpoint = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_session_endpoint_request) =
    let input = Json_serializers.get_session_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetSessionEndpoint" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_session_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_session_endpoint_request) =
    let input = Json_serializers.get_session_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.GetSessionEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_session_endpoint_response_of_yojson
      ~error_deserializer
end

module GetSessionStatus = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_session_status_request) =
    let input = Json_serializers.get_session_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetSessionStatus" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_session_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_session_status_request) =
    let input = Json_serializers.get_session_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.GetSessionStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_session_status_response_of_yojson
      ~error_deserializer
end

module GetTableMetadata = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `MetadataException _ -> "com.amazonaws.athena#MetadataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "MetadataException" ->
          `MetadataException (Json_deserializers.metadata_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_table_metadata_input) =
    let input = Json_serializers.get_table_metadata_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetTableMetadata" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_table_metadata_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_table_metadata_input) =
    let input = Json_serializers.get_table_metadata_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.GetTableMetadata"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_table_metadata_output_of_yojson
      ~error_deserializer
end

module GetWorkGroup = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_work_group_input) =
    let input = Json_serializers.get_work_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.GetWorkGroup" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_work_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_work_group_input) =
    let input = Json_serializers.get_work_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.GetWorkGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_work_group_output_of_yojson ~error_deserializer
end

module ImportNotebook = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.athena#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_notebook_input) =
    let input = Json_serializers.import_notebook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ImportNotebook" ~service ~context
      ~input ~output_deserializer:Json_deserializers.import_notebook_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_notebook_input) =
    let input = Json_serializers.import_notebook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.ImportNotebook"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_notebook_output_of_yojson ~error_deserializer
end

module ListApplicationDPUSizes = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.athena#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_application_dpu_sizes_input) =
    let input = Json_serializers.list_application_dpu_sizes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ListApplicationDPUSizes" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_application_dpu_sizes_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_application_dpu_sizes_input) =
    let input = Json_serializers.list_application_dpu_sizes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.ListApplicationDPUSizes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_application_dpu_sizes_output_of_yojson
      ~error_deserializer
end

module ListCalculationExecutions = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_calculation_executions_request) =
    let input = Json_serializers.list_calculation_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ListCalculationExecutions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_calculation_executions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_calculation_executions_request) =
    let input = Json_serializers.list_calculation_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.ListCalculationExecutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_calculation_executions_response_of_yojson
      ~error_deserializer
end

module ListCapacityReservations = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_capacity_reservations_input) =
    let input = Json_serializers.list_capacity_reservations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ListCapacityReservations" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_capacity_reservations_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_capacity_reservations_input) =
    let input = Json_serializers.list_capacity_reservations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.ListCapacityReservations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_capacity_reservations_output_of_yojson
      ~error_deserializer
end

module ListDatabases = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `MetadataException _ -> "com.amazonaws.athena#MetadataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "MetadataException" ->
          `MetadataException (Json_deserializers.metadata_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_databases_input) =
    let input = Json_serializers.list_databases_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ListDatabases" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_databases_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_databases_input) =
    let input = Json_serializers.list_databases_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.ListDatabases"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_databases_output_of_yojson ~error_deserializer
end

module ListDataCatalogs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_data_catalogs_input) =
    let input = Json_serializers.list_data_catalogs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ListDataCatalogs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_data_catalogs_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_data_catalogs_input) =
    let input = Json_serializers.list_data_catalogs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.ListDataCatalogs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_data_catalogs_output_of_yojson
      ~error_deserializer
end

module ListEngineVersions = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_engine_versions_input) =
    let input = Json_serializers.list_engine_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ListEngineVersions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_engine_versions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_engine_versions_input) =
    let input = Json_serializers.list_engine_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.ListEngineVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_engine_versions_output_of_yojson
      ~error_deserializer
end

module ListExecutors = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_executors_request) =
    let input = Json_serializers.list_executors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ListExecutors" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_executors_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_executors_request) =
    let input = Json_serializers.list_executors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.ListExecutors"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_executors_response_of_yojson ~error_deserializer
end

module ListNamedQueries = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_named_queries_input) =
    let input = Json_serializers.list_named_queries_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ListNamedQueries" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_named_queries_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_named_queries_input) =
    let input = Json_serializers.list_named_queries_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.ListNamedQueries"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_named_queries_output_of_yojson
      ~error_deserializer
end

module ListNotebookMetadata = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.athena#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_notebook_metadata_input) =
    let input = Json_serializers.list_notebook_metadata_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ListNotebookMetadata" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_notebook_metadata_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_notebook_metadata_input) =
    let input = Json_serializers.list_notebook_metadata_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.ListNotebookMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_notebook_metadata_output_of_yojson
      ~error_deserializer
end

module ListNotebookSessions = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_notebook_sessions_request) =
    let input = Json_serializers.list_notebook_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ListNotebookSessions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_notebook_sessions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_notebook_sessions_request) =
    let input = Json_serializers.list_notebook_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.ListNotebookSessions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_notebook_sessions_response_of_yojson
      ~error_deserializer
end

module ListPreparedStatements = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_prepared_statements_input) =
    let input = Json_serializers.list_prepared_statements_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ListPreparedStatements" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_prepared_statements_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_prepared_statements_input) =
    let input = Json_serializers.list_prepared_statements_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.ListPreparedStatements" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_prepared_statements_output_of_yojson
      ~error_deserializer
end

module ListQueryExecutions = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_query_executions_input) =
    let input = Json_serializers.list_query_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ListQueryExecutions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_query_executions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_query_executions_input) =
    let input = Json_serializers.list_query_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.ListQueryExecutions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_query_executions_output_of_yojson
      ~error_deserializer
end

module ListSessions = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_sessions_request) =
    let input = Json_serializers.list_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ListSessions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_sessions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_sessions_request) =
    let input = Json_serializers.list_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.ListSessions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_sessions_response_of_yojson ~error_deserializer
end

module ListTableMetadata = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `MetadataException _ -> "com.amazonaws.athena#MetadataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "MetadataException" ->
          `MetadataException (Json_deserializers.metadata_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_table_metadata_input) =
    let input = Json_serializers.list_table_metadata_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ListTableMetadata" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_table_metadata_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_table_metadata_input) =
    let input = Json_serializers.list_table_metadata_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.ListTableMetadata"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_table_metadata_output_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
end

module ListWorkGroups = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_work_groups_input) =
    let input = Json_serializers.list_work_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.ListWorkGroups" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_work_groups_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_work_groups_input) =
    let input = Json_serializers.list_work_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.ListWorkGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_work_groups_output_of_yojson ~error_deserializer
end

module PutCapacityAssignmentConfiguration = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_capacity_assignment_configuration_input) =
    let input = Json_serializers.put_capacity_assignment_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonAthena.PutCapacityAssignmentConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_capacity_assignment_configuration_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_capacity_assignment_configuration_input) =
    let input = Json_serializers.put_capacity_assignment_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.PutCapacityAssignmentConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_capacity_assignment_configuration_output_of_yojson
      ~error_deserializer
end

module StartCalculationExecution = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_calculation_execution_request) =
    let input = Json_serializers.start_calculation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.StartCalculationExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_calculation_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_calculation_execution_request) =
    let input = Json_serializers.start_calculation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.StartCalculationExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_calculation_execution_response_of_yojson
      ~error_deserializer
end

module StartQueryExecution = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.athena#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_query_execution_input) =
    let input = Json_serializers.start_query_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.StartQueryExecution" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_query_execution_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_query_execution_input) =
    let input = Json_serializers.start_query_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.StartQueryExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_query_execution_output_of_yojson
      ~error_deserializer
end

module StartSession = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | `SessionAlreadyExistsException _ -> "com.amazonaws.athena#SessionAlreadyExistsException"
    | `TooManyRequestsException _ -> "com.amazonaws.athena#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "SessionAlreadyExistsException" ->
          `SessionAlreadyExistsException
            (Json_deserializers.session_already_exists_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_session_request) =
    let input = Json_serializers.start_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.StartSession" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_session_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_session_request) =
    let input = Json_serializers.start_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.StartSession"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_session_response_of_yojson ~error_deserializer
end

module StopCalculationExecution = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_calculation_execution_request) =
    let input = Json_serializers.stop_calculation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.StopCalculationExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.stop_calculation_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_calculation_execution_request) =
    let input = Json_serializers.stop_calculation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.StopCalculationExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_calculation_execution_response_of_yojson
      ~error_deserializer
end

module StopQueryExecution = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_query_execution_input) =
    let input = Json_serializers.stop_query_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.StopQueryExecution" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_query_execution_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_query_execution_input) =
    let input = Json_serializers.stop_query_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.StopQueryExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_query_execution_output_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.TagResource"
      ~service ~context ~input ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson
      ~error_deserializer
end

module TerminateSession = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : terminate_session_request) =
    let input = Json_serializers.terminate_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.TerminateSession" ~service
      ~context ~input ~output_deserializer:Json_deserializers.terminate_session_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : terminate_session_request) =
    let input = Json_serializers.terminate_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.TerminateSession"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.terminate_session_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.UntagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson ~error_deserializer
end

module UpdateCapacityReservation = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_capacity_reservation_input) =
    let input = Json_serializers.update_capacity_reservation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.UpdateCapacityReservation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_capacity_reservation_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_capacity_reservation_input) =
    let input = Json_serializers.update_capacity_reservation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.UpdateCapacityReservation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_capacity_reservation_output_of_yojson
      ~error_deserializer
end

module UpdateDataCatalog = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_data_catalog_input) =
    let input = Json_serializers.update_data_catalog_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.UpdateDataCatalog" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_data_catalog_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_data_catalog_input) =
    let input = Json_serializers.update_data_catalog_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.UpdateDataCatalog"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_data_catalog_output_of_yojson
      ~error_deserializer
end

module UpdateNamedQuery = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_named_query_input) =
    let input = Json_serializers.update_named_query_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.UpdateNamedQuery" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_named_query_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_named_query_input) =
    let input = Json_serializers.update_named_query_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.UpdateNamedQuery"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_named_query_output_of_yojson
      ~error_deserializer
end

module UpdateNotebook = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.athena#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_notebook_input) =
    let input = Json_serializers.update_notebook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.UpdateNotebook" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_notebook_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_notebook_input) =
    let input = Json_serializers.update_notebook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.UpdateNotebook"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_notebook_output_of_yojson ~error_deserializer
end

module UpdateNotebookMetadata = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.athena#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_notebook_metadata_input) =
    let input = Json_serializers.update_notebook_metadata_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.UpdateNotebookMetadata" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_notebook_metadata_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_notebook_metadata_input) =
    let input = Json_serializers.update_notebook_metadata_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.UpdateNotebookMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_notebook_metadata_output_of_yojson
      ~error_deserializer
end

module UpdatePreparedStatement = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.athena#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_prepared_statement_input) =
    let input = Json_serializers.update_prepared_statement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.UpdatePreparedStatement" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_prepared_statement_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_prepared_statement_input) =
    let input = Json_serializers.update_prepared_statement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonAthena.UpdatePreparedStatement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_prepared_statement_output_of_yojson
      ~error_deserializer
end

module UpdateWorkGroup = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.athena#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.athena#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_work_group_input) =
    let input = Json_serializers.update_work_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonAthena.UpdateWorkGroup" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_work_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_work_group_input) =
    let input = Json_serializers.update_work_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonAthena.UpdateWorkGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_work_group_output_of_yojson ~error_deserializer
end
