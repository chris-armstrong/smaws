open Types
open Service_metadata

module StartAppBlockBuilder = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `RequestLimitExceededException _ -> "com.amazonaws.appstream#RequestLimitExceededException"
    | `ResourceNotAvailableException _ -> "com.amazonaws.appstream#ResourceNotAvailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "RequestLimitExceededException" ->
          `RequestLimitExceededException
            (Json_deserializers.request_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotAvailableException" ->
          `ResourceNotAvailableException
            (Json_deserializers.resource_not_available_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_app_block_builder_request) =
    let input = Json_serializers.start_app_block_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.StartAppBlockBuilder"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_app_block_builder_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_app_block_builder_request) =
    let input = Json_serializers.start_app_block_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.StartAppBlockBuilder" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_app_block_builder_result_of_yojson
      ~error_deserializer
end

module StartFleet = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `InvalidRoleException _ -> "com.amazonaws.appstream#InvalidRoleException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `RequestLimitExceededException _ -> "com.amazonaws.appstream#RequestLimitExceededException"
    | `ResourceNotAvailableException _ -> "com.amazonaws.appstream#ResourceNotAvailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "RequestLimitExceededException" ->
          `RequestLimitExceededException
            (Json_deserializers.request_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotAvailableException" ->
          `ResourceNotAvailableException
            (Json_deserializers.resource_not_available_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_fleet_request) =
    let input = Json_serializers.start_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.StartFleet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_fleet_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_fleet_request) =
    let input = Json_serializers.start_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.StartFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_fleet_result_of_yojson ~error_deserializer
end

module StartImageBuilder = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `IncompatibleImageException _ -> "com.amazonaws.appstream#IncompatibleImageException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `ResourceNotAvailableException _ -> "com.amazonaws.appstream#ResourceNotAvailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "IncompatibleImageException" ->
          `IncompatibleImageException
            (Json_deserializers.incompatible_image_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "ResourceNotAvailableException" ->
          `ResourceNotAvailableException
            (Json_deserializers.resource_not_available_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_image_builder_request) =
    let input = Json_serializers.start_image_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.StartImageBuilder"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_image_builder_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_image_builder_request) =
    let input = Json_serializers.start_image_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.StartImageBuilder" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_image_builder_result_of_yojson
      ~error_deserializer
end

module StartSoftwareDeploymentToImageBuilder = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_software_deployment_to_image_builder_request) =
    let input =
      Json_serializers.start_software_deployment_to_image_builder_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.StartSoftwareDeploymentToImageBuilder" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.start_software_deployment_to_image_builder_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_software_deployment_to_image_builder_request) =
    let input =
      Json_serializers.start_software_deployment_to_image_builder_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.StartSoftwareDeploymentToImageBuilder" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.start_software_deployment_to_image_builder_result_of_yojson
      ~error_deserializer
end

module StopAppBlockBuilder = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_app_block_builder_request) =
    let input = Json_serializers.stop_app_block_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.StopAppBlockBuilder"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_app_block_builder_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_app_block_builder_request) =
    let input = Json_serializers.stop_app_block_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.StopAppBlockBuilder" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_app_block_builder_result_of_yojson
      ~error_deserializer
end

module StopFleet = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_fleet_request) =
    let input = Json_serializers.stop_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.StopFleet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_fleet_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_fleet_request) =
    let input = Json_serializers.stop_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.StopFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_fleet_result_of_yojson ~error_deserializer
end

module StopImageBuilder = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_image_builder_request) =
    let input = Json_serializers.stop_image_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.StopImageBuilder"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_image_builder_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_image_builder_request) =
    let input = Json_serializers.stop_image_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.StopImageBuilder" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_image_builder_result_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateAppBlockBuilder = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `InvalidRoleException _ -> "com.amazonaws.appstream#InvalidRoleException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `RequestLimitExceededException _ -> "com.amazonaws.appstream#RequestLimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.appstream#ResourceInUseException"
    | `ResourceNotAvailableException _ -> "com.amazonaws.appstream#ResourceNotAvailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "RequestLimitExceededException" ->
          `RequestLimitExceededException
            (Json_deserializers.request_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotAvailableException" ->
          `ResourceNotAvailableException
            (Json_deserializers.resource_not_available_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_app_block_builder_request) =
    let input = Json_serializers.update_app_block_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.UpdateAppBlockBuilder"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_app_block_builder_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_app_block_builder_request) =
    let input = Json_serializers.update_app_block_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.UpdateAppBlockBuilder" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_app_block_builder_result_of_yojson
      ~error_deserializer
end

module UpdateApplication = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_application_request) =
    let input = Json_serializers.update_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.UpdateApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_application_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_application_request) =
    let input = Json_serializers.update_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.UpdateApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_application_result_of_yojson
      ~error_deserializer
end

module UpdateDirectoryConfig = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `IncompatibleImageException _ -> "com.amazonaws.appstream#IncompatibleImageException"
    | `InvalidRoleException _ -> "com.amazonaws.appstream#InvalidRoleException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceInUseException _ -> "com.amazonaws.appstream#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "IncompatibleImageException" ->
          `IncompatibleImageException
            (Json_deserializers.incompatible_image_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_directory_config_request) =
    let input = Json_serializers.update_directory_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.UpdateDirectoryConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_directory_config_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_directory_config_request) =
    let input = Json_serializers.update_directory_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.UpdateDirectoryConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_directory_config_result_of_yojson
      ~error_deserializer
end

module UpdateEntitlement = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `EntitlementNotFoundException _ -> "com.amazonaws.appstream#EntitlementNotFoundException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntitlementNotFoundException" ->
          `EntitlementNotFoundException
            (Json_deserializers.entitlement_not_found_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_entitlement_request) =
    let input = Json_serializers.update_entitlement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.UpdateEntitlement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_entitlement_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_entitlement_request) =
    let input = Json_serializers.update_entitlement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.UpdateEntitlement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_entitlement_result_of_yojson
      ~error_deserializer
end

module UpdateFleet = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `IncompatibleImageException _ -> "com.amazonaws.appstream#IncompatibleImageException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `InvalidRoleException _ -> "com.amazonaws.appstream#InvalidRoleException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `RequestLimitExceededException _ -> "com.amazonaws.appstream#RequestLimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.appstream#ResourceInUseException"
    | `ResourceNotAvailableException _ -> "com.amazonaws.appstream#ResourceNotAvailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "IncompatibleImageException" ->
          `IncompatibleImageException
            (Json_deserializers.incompatible_image_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "RequestLimitExceededException" ->
          `RequestLimitExceededException
            (Json_deserializers.request_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotAvailableException" ->
          `ResourceNotAvailableException
            (Json_deserializers.resource_not_available_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_fleet_request) =
    let input = Json_serializers.update_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.UpdateFleet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_fleet_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_fleet_request) =
    let input = Json_serializers.update_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.UpdateFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_fleet_result_of_yojson ~error_deserializer
end

module UpdateImagePermissions = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `ResourceNotAvailableException _ -> "com.amazonaws.appstream#ResourceNotAvailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotAvailableException" ->
          `ResourceNotAvailableException
            (Json_deserializers.resource_not_available_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_image_permissions_request) =
    let input = Json_serializers.update_image_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.UpdateImagePermissions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_image_permissions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_image_permissions_request) =
    let input = Json_serializers.update_image_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.UpdateImagePermissions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_image_permissions_result_of_yojson
      ~error_deserializer
end

module UpdateStack = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `IncompatibleImageException _ -> "com.amazonaws.appstream#IncompatibleImageException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `InvalidRoleException _ -> "com.amazonaws.appstream#InvalidRoleException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceInUseException _ -> "com.amazonaws.appstream#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "IncompatibleImageException" ->
          `IncompatibleImageException
            (Json_deserializers.incompatible_image_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_stack_request) =
    let input = Json_serializers.update_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.UpdateStack" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_stack_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_stack_request) =
    let input = Json_serializers.update_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.UpdateStack" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_stack_result_of_yojson ~error_deserializer
end

module UpdateThemeForStack = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_theme_for_stack_request) =
    let input = Json_serializers.update_theme_for_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.UpdateThemeForStack"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_theme_for_stack_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_theme_for_stack_request) =
    let input = Json_serializers.update_theme_for_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.UpdateThemeForStack" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_theme_for_stack_result_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListExportImageTasks = struct
  let error_to_string = function
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_export_image_tasks_request) =
    let input = Json_serializers.list_export_image_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.ListExportImageTasks"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_export_image_tasks_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_export_image_tasks_request) =
    let input = Json_serializers.list_export_image_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.ListExportImageTasks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_export_image_tasks_result_of_yojson
      ~error_deserializer
end

module ListEntitledApplications = struct
  let error_to_string = function
    | `EntitlementNotFoundException _ -> "com.amazonaws.appstream#EntitlementNotFoundException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntitlementNotFoundException" ->
          `EntitlementNotFoundException
            (Json_deserializers.entitlement_not_found_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_entitled_applications_request) =
    let input = Json_serializers.list_entitled_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.ListEntitledApplications" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_entitled_applications_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_entitled_applications_request) =
    let input = Json_serializers.list_entitled_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.ListEntitledApplications" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_entitled_applications_result_of_yojson
      ~error_deserializer
end

module ListAssociatedStacks = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_associated_stacks_request) =
    let input = Json_serializers.list_associated_stacks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.ListAssociatedStacks"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_associated_stacks_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_associated_stacks_request) =
    let input = Json_serializers.list_associated_stacks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.ListAssociatedStacks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_associated_stacks_result_of_yojson
      ~error_deserializer
end

module ListAssociatedFleets = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_associated_fleets_request) =
    let input = Json_serializers.list_associated_fleets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.ListAssociatedFleets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_associated_fleets_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_associated_fleets_request) =
    let input = Json_serializers.list_associated_fleets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.ListAssociatedFleets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_associated_fleets_result_of_yojson
      ~error_deserializer
end

module GetExportImageTask = struct
  let error_to_string = function
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_export_image_task_request) =
    let input = Json_serializers.get_export_image_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.GetExportImageTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_export_image_task_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_export_image_task_request) =
    let input = Json_serializers.get_export_image_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.GetExportImageTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_export_image_task_result_of_yojson
      ~error_deserializer
end

module ExpireSession = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : expire_session_request) =
    let input = Json_serializers.expire_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.ExpireSession" ~service
      ~context ~input ~output_deserializer:Json_deserializers.expire_session_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : expire_session_request) =
    let input = Json_serializers.expire_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.ExpireSession" ~service ~context ~input
      ~output_deserializer:Json_deserializers.expire_session_result_of_yojson ~error_deserializer
end

module EnableUser = struct
  let error_to_string = function
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_user_request) =
    let input = Json_serializers.enable_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.EnableUser" ~service
      ~context ~input ~output_deserializer:Json_deserializers.enable_user_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : enable_user_request) =
    let input = Json_serializers.enable_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.EnableUser" ~service ~context ~input
      ~output_deserializer:Json_deserializers.enable_user_result_of_yojson ~error_deserializer
end

module DrainSessionInstance = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : drain_session_instance_request) =
    let input = Json_serializers.drain_session_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DrainSessionInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.drain_session_instance_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : drain_session_instance_request) =
    let input = Json_serializers.drain_session_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DrainSessionInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.drain_session_instance_result_of_yojson
      ~error_deserializer
end

module DisassociateSoftwareFromImageBuilder = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_software_from_image_builder_request) =
    let input =
      Json_serializers.disassociate_software_from_image_builder_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.DisassociateSoftwareFromImageBuilder" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.disassociate_software_from_image_builder_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_software_from_image_builder_request) =
    let input =
      Json_serializers.disassociate_software_from_image_builder_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DisassociateSoftwareFromImageBuilder" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.disassociate_software_from_image_builder_result_of_yojson
      ~error_deserializer
end

module DisassociateFleet = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceInUseException _ -> "com.amazonaws.appstream#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_fleet_request) =
    let input = Json_serializers.disassociate_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DisassociateFleet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_fleet_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_fleet_request) =
    let input = Json_serializers.disassociate_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DisassociateFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_fleet_result_of_yojson
      ~error_deserializer
end

module DisassociateApplicationFromEntitlement = struct
  let error_to_string = function
    | `EntitlementNotFoundException _ -> "com.amazonaws.appstream#EntitlementNotFoundException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntitlementNotFoundException" ->
          `EntitlementNotFoundException
            (Json_deserializers.entitlement_not_found_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_application_from_entitlement_request) =
    let input =
      Json_serializers.disassociate_application_from_entitlement_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.DisassociateApplicationFromEntitlement" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.disassociate_application_from_entitlement_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_application_from_entitlement_request) =
    let input =
      Json_serializers.disassociate_application_from_entitlement_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DisassociateApplicationFromEntitlement" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.disassociate_application_from_entitlement_result_of_yojson
      ~error_deserializer
end

module DisassociateApplicationFleet = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_application_fleet_request) =
    let input = Json_serializers.disassociate_application_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.DisassociateApplicationFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_application_fleet_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_application_fleet_request) =
    let input = Json_serializers.disassociate_application_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DisassociateApplicationFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_application_fleet_result_of_yojson
      ~error_deserializer
end

module DisassociateAppBlockBuilderAppBlock = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_app_block_builder_app_block_request) =
    let input =
      Json_serializers.disassociate_app_block_builder_app_block_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.DisassociateAppBlockBuilderAppBlock" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.disassociate_app_block_builder_app_block_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_app_block_builder_app_block_request) =
    let input =
      Json_serializers.disassociate_app_block_builder_app_block_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DisassociateAppBlockBuilderAppBlock" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.disassociate_app_block_builder_app_block_result_of_yojson
      ~error_deserializer
end

module DisableUser = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_user_request) =
    let input = Json_serializers.disable_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DisableUser" ~service
      ~context ~input ~output_deserializer:Json_deserializers.disable_user_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disable_user_request) =
    let input = Json_serializers.disable_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DisableUser" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disable_user_result_of_yojson ~error_deserializer
end

module DescribeUsers = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_users_request) =
    let input = Json_serializers.describe_users_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DescribeUsers" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_users_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_users_request) =
    let input = Json_serializers.describe_users_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeUsers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_users_result_of_yojson ~error_deserializer
end

module DescribeUserStackAssociations = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_user_stack_associations_request) =
    let input = Json_serializers.describe_user_stack_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.DescribeUserStackAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_user_stack_associations_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_user_stack_associations_request) =
    let input = Json_serializers.describe_user_stack_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeUserStackAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_user_stack_associations_result_of_yojson
      ~error_deserializer
end

module DescribeUsageReportSubscriptions = struct
  let error_to_string = function
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_usage_report_subscriptions_request) =
    let input = Json_serializers.describe_usage_report_subscriptions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.DescribeUsageReportSubscriptions" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_usage_report_subscriptions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_usage_report_subscriptions_request) =
    let input = Json_serializers.describe_usage_report_subscriptions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeUsageReportSubscriptions" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_usage_report_subscriptions_result_of_yojson
      ~error_deserializer
end

module DescribeThemeForStack = struct
  let error_to_string = function
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_theme_for_stack_request) =
    let input = Json_serializers.describe_theme_for_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DescribeThemeForStack"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_theme_for_stack_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_theme_for_stack_request) =
    let input = Json_serializers.describe_theme_for_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeThemeForStack" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_theme_for_stack_result_of_yojson
      ~error_deserializer
end

module DescribeStacks = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_stacks_request) =
    let input = Json_serializers.describe_stacks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DescribeStacks"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_stacks_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_stacks_request) =
    let input = Json_serializers.describe_stacks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeStacks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_stacks_result_of_yojson ~error_deserializer
end

module DescribeSoftwareAssociations = struct
  let error_to_string = function
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_software_associations_request) =
    let input = Json_serializers.describe_software_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.DescribeSoftwareAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_software_associations_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_software_associations_request) =
    let input = Json_serializers.describe_software_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeSoftwareAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_software_associations_result_of_yojson
      ~error_deserializer
end

module DescribeSessions = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_sessions_request) =
    let input = Json_serializers.describe_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DescribeSessions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_sessions_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_sessions_request) =
    let input = Json_serializers.describe_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeSessions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_sessions_result_of_yojson ~error_deserializer
end

module DescribeImages = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_images_request) =
    let input = Json_serializers.describe_images_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DescribeImages"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_images_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_images_request) =
    let input = Json_serializers.describe_images_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeImages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_images_result_of_yojson ~error_deserializer
end

module DescribeImagePermissions = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_image_permissions_request) =
    let input = Json_serializers.describe_image_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.DescribeImagePermissions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_image_permissions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_image_permissions_request) =
    let input = Json_serializers.describe_image_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeImagePermissions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_image_permissions_result_of_yojson
      ~error_deserializer
end

module DescribeImageBuilders = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_image_builders_request) =
    let input = Json_serializers.describe_image_builders_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DescribeImageBuilders"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_image_builders_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_image_builders_request) =
    let input = Json_serializers.describe_image_builders_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeImageBuilders" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_image_builders_result_of_yojson
      ~error_deserializer
end

module DescribeFleets = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_fleets_request) =
    let input = Json_serializers.describe_fleets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DescribeFleets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleets_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_fleets_request) =
    let input = Json_serializers.describe_fleets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeFleets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fleets_result_of_yojson ~error_deserializer
end

module DescribeEntitlements = struct
  let error_to_string = function
    | `EntitlementNotFoundException _ -> "com.amazonaws.appstream#EntitlementNotFoundException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntitlementNotFoundException" ->
          `EntitlementNotFoundException
            (Json_deserializers.entitlement_not_found_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_entitlements_request) =
    let input = Json_serializers.describe_entitlements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DescribeEntitlements"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_entitlements_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_entitlements_request) =
    let input = Json_serializers.describe_entitlements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeEntitlements" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_entitlements_result_of_yojson
      ~error_deserializer
end

module DescribeDirectoryConfigs = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_directory_configs_request) =
    let input = Json_serializers.describe_directory_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.DescribeDirectoryConfigs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_directory_configs_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_directory_configs_request) =
    let input = Json_serializers.describe_directory_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeDirectoryConfigs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_directory_configs_result_of_yojson
      ~error_deserializer
end

module DescribeApplications = struct
  let error_to_string = function
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_applications_request) =
    let input = Json_serializers.describe_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DescribeApplications"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_applications_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_applications_request) =
    let input = Json_serializers.describe_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeApplications" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_applications_result_of_yojson
      ~error_deserializer
end

module DescribeApplicationFleetAssociations = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_application_fleet_associations_request) =
    let input =
      Json_serializers.describe_application_fleet_associations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.DescribeApplicationFleetAssociations" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_application_fleet_associations_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_application_fleet_associations_request) =
    let input =
      Json_serializers.describe_application_fleet_associations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeApplicationFleetAssociations" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_application_fleet_associations_result_of_yojson
      ~error_deserializer
end

module DescribeAppLicenseUsage = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_app_license_usage_request) =
    let input = Json_serializers.describe_app_license_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.DescribeAppLicenseUsage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_app_license_usage_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_app_license_usage_request) =
    let input = Json_serializers.describe_app_license_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeAppLicenseUsage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_app_license_usage_result_of_yojson
      ~error_deserializer
end

module DescribeAppBlocks = struct
  let error_to_string = function
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_app_blocks_request) =
    let input = Json_serializers.describe_app_blocks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DescribeAppBlocks"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_app_blocks_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_app_blocks_request) =
    let input = Json_serializers.describe_app_blocks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeAppBlocks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_app_blocks_result_of_yojson
      ~error_deserializer
end

module DescribeAppBlockBuilders = struct
  let error_to_string = function
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_app_block_builders_request) =
    let input = Json_serializers.describe_app_block_builders_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.DescribeAppBlockBuilders" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_app_block_builders_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_app_block_builders_request) =
    let input = Json_serializers.describe_app_block_builders_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeAppBlockBuilders" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_app_block_builders_result_of_yojson
      ~error_deserializer
end

module DescribeAppBlockBuilderAppBlockAssociations = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_app_block_builder_app_block_associations_request) =
    let input =
      Json_serializers.describe_app_block_builder_app_block_associations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.DescribeAppBlockBuilderAppBlockAssociations" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_app_block_builder_app_block_associations_result_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : describe_app_block_builder_app_block_associations_request) =
    let input =
      Json_serializers.describe_app_block_builder_app_block_associations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DescribeAppBlockBuilderAppBlockAssociations" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_app_block_builder_app_block_associations_result_of_yojson
      ~error_deserializer
end

module DeleteUser = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_user_request) =
    let input = Json_serializers.delete_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DeleteUser" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_user_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_user_request) =
    let input = Json_serializers.delete_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DeleteUser" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_user_result_of_yojson ~error_deserializer
end

module DeleteUsageReportSubscription = struct
  let error_to_string = function
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_usage_report_subscription_request) =
    let input = Json_serializers.delete_usage_report_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.DeleteUsageReportSubscription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_usage_report_subscription_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_usage_report_subscription_request) =
    let input = Json_serializers.delete_usage_report_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DeleteUsageReportSubscription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_usage_report_subscription_result_of_yojson
      ~error_deserializer
end

module DeleteThemeForStack = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_theme_for_stack_request) =
    let input = Json_serializers.delete_theme_for_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DeleteThemeForStack"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_theme_for_stack_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_theme_for_stack_request) =
    let input = Json_serializers.delete_theme_for_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DeleteThemeForStack" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_theme_for_stack_result_of_yojson
      ~error_deserializer
end

module DeleteStack = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceInUseException _ -> "com.amazonaws.appstream#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_stack_request) =
    let input = Json_serializers.delete_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DeleteStack" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_stack_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_stack_request) =
    let input = Json_serializers.delete_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DeleteStack" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_stack_result_of_yojson ~error_deserializer
end

module DeleteImagePermissions = struct
  let error_to_string = function
    | `ResourceNotAvailableException _ -> "com.amazonaws.appstream#ResourceNotAvailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotAvailableException" ->
          `ResourceNotAvailableException
            (Json_deserializers.resource_not_available_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_image_permissions_request) =
    let input = Json_serializers.delete_image_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DeleteImagePermissions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_image_permissions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_image_permissions_request) =
    let input = Json_serializers.delete_image_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DeleteImagePermissions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_image_permissions_result_of_yojson
      ~error_deserializer
end

module DeleteImageBuilder = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_image_builder_request) =
    let input = Json_serializers.delete_image_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DeleteImageBuilder"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_image_builder_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_image_builder_request) =
    let input = Json_serializers.delete_image_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DeleteImageBuilder" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_image_builder_result_of_yojson
      ~error_deserializer
end

module DeleteImage = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceInUseException _ -> "com.amazonaws.appstream#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_image_request) =
    let input = Json_serializers.delete_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DeleteImage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_image_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_image_request) =
    let input = Json_serializers.delete_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DeleteImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_image_result_of_yojson ~error_deserializer
end

module DeleteFleet = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `ResourceInUseException _ -> "com.amazonaws.appstream#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_fleet_request) =
    let input = Json_serializers.delete_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DeleteFleet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_fleet_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_fleet_request) =
    let input = Json_serializers.delete_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DeleteFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_fleet_result_of_yojson ~error_deserializer
end

module DeleteEntitlement = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `EntitlementNotFoundException _ -> "com.amazonaws.appstream#EntitlementNotFoundException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntitlementNotFoundException" ->
          `EntitlementNotFoundException
            (Json_deserializers.entitlement_not_found_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_entitlement_request) =
    let input = Json_serializers.delete_entitlement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DeleteEntitlement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_entitlement_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_entitlement_request) =
    let input = Json_serializers.delete_entitlement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DeleteEntitlement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_entitlement_result_of_yojson
      ~error_deserializer
end

module DeleteDirectoryConfig = struct
  let error_to_string = function
    | `ResourceInUseException _ -> "com.amazonaws.appstream#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_directory_config_request) =
    let input = Json_serializers.delete_directory_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DeleteDirectoryConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_directory_config_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_directory_config_request) =
    let input = Json_serializers.delete_directory_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DeleteDirectoryConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_directory_config_result_of_yojson
      ~error_deserializer
end

module DeleteApplication = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceInUseException _ -> "com.amazonaws.appstream#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_application_request) =
    let input = Json_serializers.delete_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DeleteApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_application_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_application_request) =
    let input = Json_serializers.delete_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DeleteApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_application_result_of_yojson
      ~error_deserializer
end

module DeleteAppBlockBuilder = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceInUseException _ -> "com.amazonaws.appstream#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_app_block_builder_request) =
    let input = Json_serializers.delete_app_block_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DeleteAppBlockBuilder"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_app_block_builder_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_app_block_builder_request) =
    let input = Json_serializers.delete_app_block_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DeleteAppBlockBuilder" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_app_block_builder_result_of_yojson
      ~error_deserializer
end

module DeleteAppBlock = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `ResourceInUseException _ -> "com.amazonaws.appstream#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_app_block_request) =
    let input = Json_serializers.delete_app_block_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.DeleteAppBlock"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_app_block_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_app_block_request) =
    let input = Json_serializers.delete_app_block_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.DeleteAppBlock" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_app_block_result_of_yojson ~error_deserializer
end

module CreateUser = struct
  let error_to_string = function
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.appstream#ResourceAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_user_request) =
    let input = Json_serializers.create_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.CreateUser" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_user_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_user_request) =
    let input = Json_serializers.create_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateUser" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_result_of_yojson ~error_deserializer
end

module CreateUsageReportSubscription = struct
  let error_to_string = function
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `InvalidRoleException _ -> "com.amazonaws.appstream#InvalidRoleException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_usage_report_subscription_request) =
    let input = Json_serializers.create_usage_report_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.CreateUsageReportSubscription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_usage_report_subscription_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_usage_report_subscription_request) =
    let input = Json_serializers.create_usage_report_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateUsageReportSubscription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_usage_report_subscription_result_of_yojson
      ~error_deserializer
end

module CreateUpdatedImage = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `IncompatibleImageException _ -> "com.amazonaws.appstream#IncompatibleImageException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.appstream#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "IncompatibleImageException" ->
          `IncompatibleImageException
            (Json_deserializers.incompatible_image_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_updated_image_request) =
    let input = Json_serializers.create_updated_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.CreateUpdatedImage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_updated_image_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_updated_image_request) =
    let input = Json_serializers.create_updated_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateUpdatedImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_updated_image_result_of_yojson
      ~error_deserializer
end

module CreateThemeForStack = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.appstream#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_theme_for_stack_request) =
    let input = Json_serializers.create_theme_for_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.CreateThemeForStack"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_theme_for_stack_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_theme_for_stack_request) =
    let input = Json_serializers.create_theme_for_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateThemeForStack" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_theme_for_stack_result_of_yojson
      ~error_deserializer
end

module CreateStreamingURL = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotAvailableException _ -> "com.amazonaws.appstream#ResourceNotAvailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotAvailableException" ->
          `ResourceNotAvailableException
            (Json_deserializers.resource_not_available_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_streaming_url_request) =
    let input = Json_serializers.create_streaming_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.CreateStreamingURL"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_streaming_url_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_streaming_url_request) =
    let input = Json_serializers.create_streaming_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateStreamingURL" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_streaming_url_result_of_yojson
      ~error_deserializer
end

module CreateStack = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `InvalidRoleException _ -> "com.amazonaws.appstream#InvalidRoleException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.appstream#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_stack_request) =
    let input = Json_serializers.create_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.CreateStack" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_stack_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_stack_request) =
    let input = Json_serializers.create_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateStack" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_stack_result_of_yojson ~error_deserializer
end

module CreateImportedImage = struct
  let error_to_string = function
    | `DryRunOperationException _ -> "com.amazonaws.appstream#DryRunOperationException"
    | `IncompatibleImageException _ -> "com.amazonaws.appstream#IncompatibleImageException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `InvalidRoleException _ -> "com.amazonaws.appstream#InvalidRoleException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.appstream#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DryRunOperationException" ->
          `DryRunOperationException
            (Json_deserializers.dry_run_operation_exception_of_yojson tree path)
      | _, "IncompatibleImageException" ->
          `IncompatibleImageException
            (Json_deserializers.incompatible_image_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_imported_image_request) =
    let input = Json_serializers.create_imported_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.CreateImportedImage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_imported_image_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_imported_image_request) =
    let input = Json_serializers.create_imported_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateImportedImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_imported_image_result_of_yojson
      ~error_deserializer
end

module CreateImageBuilderStreamingURL = struct
  let error_to_string = function
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_image_builder_streaming_url_request) =
    let input = Json_serializers.create_image_builder_streaming_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.CreateImageBuilderStreamingURL" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_image_builder_streaming_url_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_image_builder_streaming_url_request) =
    let input = Json_serializers.create_image_builder_streaming_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateImageBuilderStreamingURL" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_image_builder_streaming_url_result_of_yojson
      ~error_deserializer
end

module CreateImageBuilder = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `IncompatibleImageException _ -> "com.amazonaws.appstream#IncompatibleImageException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `InvalidRoleException _ -> "com.amazonaws.appstream#InvalidRoleException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `RequestLimitExceededException _ -> "com.amazonaws.appstream#RequestLimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.appstream#ResourceAlreadyExistsException"
    | `ResourceNotAvailableException _ -> "com.amazonaws.appstream#ResourceNotAvailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "IncompatibleImageException" ->
          `IncompatibleImageException
            (Json_deserializers.incompatible_image_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "RequestLimitExceededException" ->
          `RequestLimitExceededException
            (Json_deserializers.request_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotAvailableException" ->
          `ResourceNotAvailableException
            (Json_deserializers.resource_not_available_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_image_builder_request) =
    let input = Json_serializers.create_image_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.CreateImageBuilder"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_image_builder_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_image_builder_request) =
    let input = Json_serializers.create_image_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateImageBuilder" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_image_builder_result_of_yojson
      ~error_deserializer
end

module CreateFleet = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `IncompatibleImageException _ -> "com.amazonaws.appstream#IncompatibleImageException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `InvalidRoleException _ -> "com.amazonaws.appstream#InvalidRoleException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `RequestLimitExceededException _ -> "com.amazonaws.appstream#RequestLimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.appstream#ResourceAlreadyExistsException"
    | `ResourceNotAvailableException _ -> "com.amazonaws.appstream#ResourceNotAvailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "IncompatibleImageException" ->
          `IncompatibleImageException
            (Json_deserializers.incompatible_image_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "RequestLimitExceededException" ->
          `RequestLimitExceededException
            (Json_deserializers.request_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotAvailableException" ->
          `ResourceNotAvailableException
            (Json_deserializers.resource_not_available_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_fleet_request) =
    let input = Json_serializers.create_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.CreateFleet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_fleet_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_fleet_request) =
    let input = Json_serializers.create_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_fleet_result_of_yojson ~error_deserializer
end

module CreateExportImageTask = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `InvalidRoleException _ -> "com.amazonaws.appstream#InvalidRoleException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotAvailableException _ -> "com.amazonaws.appstream#ResourceNotAvailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotAvailableException" ->
          `ResourceNotAvailableException
            (Json_deserializers.resource_not_available_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_export_image_task_request) =
    let input = Json_serializers.create_export_image_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.CreateExportImageTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_export_image_task_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_export_image_task_request) =
    let input = Json_serializers.create_export_image_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateExportImageTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_export_image_task_result_of_yojson
      ~error_deserializer
end

module CreateEntitlement = struct
  let error_to_string = function
    | `EntitlementAlreadyExistsException _ ->
        "com.amazonaws.appstream#EntitlementAlreadyExistsException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntitlementAlreadyExistsException" ->
          `EntitlementAlreadyExistsException
            (Json_deserializers.entitlement_already_exists_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_entitlement_request) =
    let input = Json_serializers.create_entitlement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.CreateEntitlement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_entitlement_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_entitlement_request) =
    let input = Json_serializers.create_entitlement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateEntitlement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_entitlement_result_of_yojson
      ~error_deserializer
end

module CreateDirectoryConfig = struct
  let error_to_string = function
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `InvalidRoleException _ -> "com.amazonaws.appstream#InvalidRoleException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.appstream#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_directory_config_request) =
    let input = Json_serializers.create_directory_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.CreateDirectoryConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_directory_config_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_directory_config_request) =
    let input = Json_serializers.create_directory_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateDirectoryConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_directory_config_result_of_yojson
      ~error_deserializer
end

module CreateApplication = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.appstream#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_application_request) =
    let input = Json_serializers.create_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.CreateApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_application_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_application_request) =
    let input = Json_serializers.create_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_application_result_of_yojson
      ~error_deserializer
end

module CreateAppBlockBuilderStreamingURL = struct
  let error_to_string = function
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_app_block_builder_streaming_url_request) =
    let input = Json_serializers.create_app_block_builder_streaming_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.CreateAppBlockBuilderStreamingURL" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.create_app_block_builder_streaming_url_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_app_block_builder_streaming_url_request) =
    let input = Json_serializers.create_app_block_builder_streaming_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateAppBlockBuilderStreamingURL" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.create_app_block_builder_streaming_url_result_of_yojson
      ~error_deserializer
end

module CreateAppBlockBuilder = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `InvalidRoleException _ -> "com.amazonaws.appstream#InvalidRoleException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `RequestLimitExceededException _ -> "com.amazonaws.appstream#RequestLimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.appstream#ResourceAlreadyExistsException"
    | `ResourceNotAvailableException _ -> "com.amazonaws.appstream#ResourceNotAvailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "RequestLimitExceededException" ->
          `RequestLimitExceededException
            (Json_deserializers.request_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotAvailableException" ->
          `ResourceNotAvailableException
            (Json_deserializers.resource_not_available_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_app_block_builder_request) =
    let input = Json_serializers.create_app_block_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.CreateAppBlockBuilder"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_app_block_builder_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_app_block_builder_request) =
    let input = Json_serializers.create_app_block_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateAppBlockBuilder" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_app_block_builder_result_of_yojson
      ~error_deserializer
end

module CreateAppBlock = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.appstream#ResourceAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_app_block_request) =
    let input = Json_serializers.create_app_block_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.CreateAppBlock"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_app_block_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_app_block_request) =
    let input = Json_serializers.create_app_block_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CreateAppBlock" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_app_block_result_of_yojson ~error_deserializer
end

module CopyImage = struct
  let error_to_string = function
    | `IncompatibleImageException _ -> "com.amazonaws.appstream#IncompatibleImageException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.appstream#ResourceAlreadyExistsException"
    | `ResourceNotAvailableException _ -> "com.amazonaws.appstream#ResourceNotAvailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "IncompatibleImageException" ->
          `IncompatibleImageException
            (Json_deserializers.incompatible_image_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotAvailableException" ->
          `ResourceNotAvailableException
            (Json_deserializers.resource_not_available_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : copy_image_request) =
    let input = Json_serializers.copy_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.CopyImage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.copy_image_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : copy_image_request) =
    let input = Json_serializers.copy_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.CopyImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.copy_image_response_of_yojson ~error_deserializer
end

module BatchDisassociateUserStack = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_disassociate_user_stack_request) =
    let input = Json_serializers.batch_disassociate_user_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.BatchDisassociateUserStack" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_disassociate_user_stack_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_disassociate_user_stack_request) =
    let input = Json_serializers.batch_disassociate_user_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.BatchDisassociateUserStack" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_disassociate_user_stack_result_of_yojson
      ~error_deserializer
end

module BatchAssociateUserStack = struct
  let error_to_string = function
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_associate_user_stack_request) =
    let input = Json_serializers.batch_associate_user_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.BatchAssociateUserStack" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_associate_user_stack_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_associate_user_stack_request) =
    let input = Json_serializers.batch_associate_user_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.BatchAssociateUserStack" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_associate_user_stack_result_of_yojson
      ~error_deserializer
end

module AssociateSoftwareToImageBuilder = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `IncompatibleImageException _ -> "com.amazonaws.appstream#IncompatibleImageException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "IncompatibleImageException" ->
          `IncompatibleImageException
            (Json_deserializers.incompatible_image_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_software_to_image_builder_request) =
    let input = Json_serializers.associate_software_to_image_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.AssociateSoftwareToImageBuilder" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_software_to_image_builder_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_software_to_image_builder_request) =
    let input = Json_serializers.associate_software_to_image_builder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.AssociateSoftwareToImageBuilder" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_software_to_image_builder_result_of_yojson
      ~error_deserializer
end

module AssociateFleet = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `IncompatibleImageException _ -> "com.amazonaws.appstream#IncompatibleImageException"
    | `InvalidAccountStatusException _ -> "com.amazonaws.appstream#InvalidAccountStatusException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "IncompatibleImageException" ->
          `IncompatibleImageException
            (Json_deserializers.incompatible_image_exception_of_yojson tree path)
      | _, "InvalidAccountStatusException" ->
          `InvalidAccountStatusException
            (Json_deserializers.invalid_account_status_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_fleet_request) =
    let input = Json_serializers.associate_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PhotonAdminProxyService.AssociateFleet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_fleet_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : associate_fleet_request) =
    let input = Json_serializers.associate_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.AssociateFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_fleet_result_of_yojson ~error_deserializer
end

module AssociateApplicationToEntitlement = struct
  let error_to_string = function
    | `EntitlementNotFoundException _ -> "com.amazonaws.appstream#EntitlementNotFoundException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntitlementNotFoundException" ->
          `EntitlementNotFoundException
            (Json_deserializers.entitlement_not_found_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_application_to_entitlement_request) =
    let input = Json_serializers.associate_application_to_entitlement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.AssociateApplicationToEntitlement" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.associate_application_to_entitlement_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_application_to_entitlement_request) =
    let input = Json_serializers.associate_application_to_entitlement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.AssociateApplicationToEntitlement" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.associate_application_to_entitlement_result_of_yojson
      ~error_deserializer
end

module AssociateApplicationFleet = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_application_fleet_request) =
    let input = Json_serializers.associate_application_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.AssociateApplicationFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_application_fleet_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_application_fleet_request) =
    let input = Json_serializers.associate_application_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.AssociateApplicationFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_application_fleet_result_of_yojson
      ~error_deserializer
end

module AssociateAppBlockBuilderAppBlock = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.appstream#ConcurrentModificationException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.appstream#InvalidParameterCombinationException"
    | `LimitExceededException _ -> "com.amazonaws.appstream#LimitExceededException"
    | `OperationNotPermittedException _ -> "com.amazonaws.appstream#OperationNotPermittedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.appstream#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_app_block_builder_app_block_request) =
    let input = Json_serializers.associate_app_block_builder_app_block_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PhotonAdminProxyService.AssociateAppBlockBuilderAppBlock" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.associate_app_block_builder_app_block_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_app_block_builder_app_block_request) =
    let input = Json_serializers.associate_app_block_builder_app_block_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PhotonAdminProxyService.AssociateAppBlockBuilderAppBlock" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.associate_app_block_builder_app_block_result_of_yojson
      ~error_deserializer
end
