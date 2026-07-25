open Types
open Service_metadata

module CreateHapg = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_hapg_request) =
    let input = Json_serializers.create_hapg_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.CreateHapg" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_hapg_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_hapg_request) =
    let input = Json_serializers.create_hapg_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.CreateHapg" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_hapg_response_of_yojson ~error_deserializer
end

module CreateHsm = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_hsm_request) =
    let input = Json_serializers.create_hsm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.CreateHsm" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_hsm_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_hsm_request) =
    let input = Json_serializers.create_hsm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.CreateHsm" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_hsm_response_of_yojson ~error_deserializer
end

module CreateLunaClient = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_luna_client_request) =
    let input = Json_serializers.create_luna_client_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.CreateLunaClient"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_luna_client_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_luna_client_request) =
    let input = Json_serializers.create_luna_client_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.CreateLunaClient" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_luna_client_response_of_yojson
      ~error_deserializer
end

module DeleteHapg = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_hapg_request) =
    let input = Json_serializers.delete_hapg_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.DeleteHapg" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_hapg_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_hapg_request) =
    let input = Json_serializers.delete_hapg_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.DeleteHapg" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_hapg_response_of_yojson ~error_deserializer
end

module DeleteHsm = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_hsm_request) =
    let input = Json_serializers.delete_hsm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.DeleteHsm" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_hsm_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_hsm_request) =
    let input = Json_serializers.delete_hsm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.DeleteHsm" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_hsm_response_of_yojson ~error_deserializer
end

module DeleteLunaClient = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_luna_client_request) =
    let input = Json_serializers.delete_luna_client_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.DeleteLunaClient"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_luna_client_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_luna_client_request) =
    let input = Json_serializers.delete_luna_client_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.DeleteLunaClient" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_luna_client_response_of_yojson
      ~error_deserializer
end

module DescribeHapg = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_hapg_request) =
    let input = Json_serializers.describe_hapg_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.DescribeHapg" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_hapg_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_hapg_request) =
    let input = Json_serializers.describe_hapg_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.DescribeHapg" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_hapg_response_of_yojson ~error_deserializer
end

module DescribeHsm = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_hsm_request) =
    let input = Json_serializers.describe_hsm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.DescribeHsm" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_hsm_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_hsm_request) =
    let input = Json_serializers.describe_hsm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.DescribeHsm" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_hsm_response_of_yojson ~error_deserializer
end

module DescribeLunaClient = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_luna_client_request) =
    let input = Json_serializers.describe_luna_client_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.DescribeLunaClient"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_luna_client_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_luna_client_request) =
    let input = Json_serializers.describe_luna_client_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.DescribeLunaClient" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_luna_client_response_of_yojson
      ~error_deserializer
end

module GetConfig = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_config_request) =
    let input = Json_serializers.get_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.GetConfig" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_config_request) =
    let input = Json_serializers.get_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.GetConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_config_response_of_yojson ~error_deserializer
end

module ListAvailableZones = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_available_zones_request) =
    let input = Json_serializers.list_available_zones_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.ListAvailableZones"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_available_zones_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_available_zones_request) =
    let input = Json_serializers.list_available_zones_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.ListAvailableZones" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_available_zones_response_of_yojson
      ~error_deserializer
end

module ListHapgs = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_hapgs_request) =
    let input = Json_serializers.list_hapgs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.ListHapgs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_hapgs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_hapgs_request) =
    let input = Json_serializers.list_hapgs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.ListHapgs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_hapgs_response_of_yojson ~error_deserializer
end

module ListHsms = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_hsms_request) =
    let input = Json_serializers.list_hsms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.ListHsms" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_hsms_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_hsms_request) =
    let input = Json_serializers.list_hsms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CloudHsmFrontendService.ListHsms"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_hsms_response_of_yojson
      ~error_deserializer
end

module ListLunaClients = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_luna_clients_request) =
    let input = Json_serializers.list_luna_clients_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.ListLunaClients"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_luna_clients_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_luna_clients_request) =
    let input = Json_serializers.list_luna_clients_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.ListLunaClients" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_luna_clients_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ModifyHapg = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_hapg_request) =
    let input = Json_serializers.modify_hapg_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.ModifyHapg" ~service
      ~context ~input ~output_deserializer:Json_deserializers.modify_hapg_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_hapg_request) =
    let input = Json_serializers.modify_hapg_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.ModifyHapg" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_hapg_response_of_yojson ~error_deserializer
end

module ModifyHsm = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_hsm_request) =
    let input = Json_serializers.modify_hsm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.ModifyHsm" ~service
      ~context ~input ~output_deserializer:Json_deserializers.modify_hsm_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_hsm_request) =
    let input = Json_serializers.modify_hsm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.ModifyHsm" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_hsm_response_of_yojson ~error_deserializer
end

module ModifyLunaClient = struct
  let error_to_string = function
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_luna_client_request) =
    let input = Json_serializers.modify_luna_client_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.ModifyLunaClient"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_luna_client_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_luna_client_request) =
    let input = Json_serializers.modify_luna_client_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.ModifyLunaClient" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_luna_client_response_of_yojson
      ~error_deserializer
end

module RemoveTagsFromResource = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_tags_from_resource_request) =
    let input = Json_serializers.remove_tags_from_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.RemoveTagsFromResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_tags_from_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_tags_from_resource_request) =
    let input = Json_serializers.remove_tags_from_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.RemoveTagsFromResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_tags_from_resource_response_of_yojson
      ~error_deserializer
end

module AddTagsToResource = struct
  let error_to_string = function
    | `CloudHsmInternalException _ -> "com.amazonaws.cloudhsm#CloudHsmInternalException"
    | `CloudHsmServiceException _ -> "com.amazonaws.cloudhsm#CloudHsmServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudhsm#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CloudHsmInternalException" ->
          `CloudHsmInternalException
            (Json_deserializers.cloud_hsm_internal_exception_of_yojson tree path)
      | _, "CloudHsmServiceException" ->
          `CloudHsmServiceException
            (Json_deserializers.cloud_hsm_service_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_tags_to_resource_request) =
    let input = Json_serializers.add_tags_to_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudHsmFrontendService.AddTagsToResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_tags_to_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_tags_to_resource_request) =
    let input = Json_serializers.add_tags_to_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudHsmFrontendService.AddTagsToResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_tags_to_resource_response_of_yojson
      ~error_deserializer
end
