open Types
open Service_metadata

module CreateExport = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmdataexports#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.bcmdataexports#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.bcmdataexports#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdataexports#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdataexports#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_export_request) =
    let input = Json_serializers.create_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBillingAndCostManagementDataExports.CreateExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_export_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_export_request) =
    let input = Json_serializers.create_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBillingAndCostManagementDataExports.CreateExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_export_response_of_yojson ~error_deserializer
end

module DeleteExport = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.bcmdataexports#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdataexports#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdataexports#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdataexports#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_export_request) =
    let input = Json_serializers.delete_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBillingAndCostManagementDataExports.DeleteExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_export_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_export_request) =
    let input = Json_serializers.delete_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBillingAndCostManagementDataExports.DeleteExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_export_response_of_yojson ~error_deserializer
end

module GetExecution = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.bcmdataexports#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdataexports#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdataexports#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdataexports#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_execution_request) =
    let input = Json_serializers.get_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBillingAndCostManagementDataExports.GetExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_execution_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_execution_request) =
    let input = Json_serializers.get_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBillingAndCostManagementDataExports.GetExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_execution_response_of_yojson ~error_deserializer
end

module GetExport = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.bcmdataexports#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdataexports#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdataexports#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdataexports#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_export_request) =
    let input = Json_serializers.get_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBillingAndCostManagementDataExports.GetExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_export_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_export_request) =
    let input = Json_serializers.get_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBillingAndCostManagementDataExports.GetExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_export_response_of_yojson ~error_deserializer
end

module GetTable = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.bcmdataexports#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdataexports#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdataexports#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_table_request) =
    let input = Json_serializers.get_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBillingAndCostManagementDataExports.GetTable" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_table_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_table_request) =
    let input = Json_serializers.get_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBillingAndCostManagementDataExports.GetTable" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_table_response_of_yojson ~error_deserializer
end

module ListExecutions = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.bcmdataexports#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdataexports#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdataexports#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdataexports#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_executions_request) =
    let input = Json_serializers.list_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBillingAndCostManagementDataExports.ListExecutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_executions_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_executions_request) =
    let input = Json_serializers.list_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBillingAndCostManagementDataExports.ListExecutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_executions_response_of_yojson ~error_deserializer
end

module ListExports = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.bcmdataexports#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdataexports#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdataexports#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_exports_request) =
    let input = Json_serializers.list_exports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBillingAndCostManagementDataExports.ListExports" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_exports_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_exports_request) =
    let input = Json_serializers.list_exports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBillingAndCostManagementDataExports.ListExports" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_exports_response_of_yojson ~error_deserializer
end

module ListTables = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.bcmdataexports#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdataexports#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdataexports#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tables_request) =
    let input = Json_serializers.list_tables_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBillingAndCostManagementDataExports.ListTables" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tables_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_tables_request) =
    let input = Json_serializers.list_tables_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBillingAndCostManagementDataExports.ListTables" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tables_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmdataexports#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.bcmdataexports#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdataexports#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdataexports#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdataexports#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBillingAndCostManagementDataExports.ListTagsForResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBillingAndCostManagementDataExports.ListTagsForResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmdataexports#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.bcmdataexports#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdataexports#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdataexports#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdataexports#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBillingAndCostManagementDataExports.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBillingAndCostManagementDataExports.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmdataexports#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.bcmdataexports#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdataexports#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdataexports#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdataexports#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBillingAndCostManagementDataExports.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBillingAndCostManagementDataExports.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateExport = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.bcmdataexports#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmdataexports#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bcmdataexports#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmdataexports#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_export_request) =
    let input = Json_serializers.update_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBillingAndCostManagementDataExports.UpdateExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_export_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_export_request) =
    let input = Json_serializers.update_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBillingAndCostManagementDataExports.UpdateExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_export_response_of_yojson ~error_deserializer
end
