open Types
open Service_metadata

module GetWorkspaceInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspacesinstances#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.workspacesinstances#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspacesinstances#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.workspacesinstances#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.workspacesinstances#ValidationException"
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

  let request context (request : get_workspace_instance_request) =
    let input = Json_serializers.get_workspace_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EUCMIFrontendAPIService.GetWorkspaceInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_workspace_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_workspace_instance_request) =
    let input = Json_serializers.get_workspace_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EUCMIFrontendAPIService.GetWorkspaceInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_workspace_instance_response_of_yojson
      ~error_deserializer
end

module ListInstanceTypes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspacesinstances#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.workspacesinstances#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.workspacesinstances#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.workspacesinstances#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_instance_types_request) =
    let input = Json_serializers.list_instance_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EUCMIFrontendAPIService.ListInstanceTypes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_instance_types_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_instance_types_request) =
    let input = Json_serializers.list_instance_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EUCMIFrontendAPIService.ListInstanceTypes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_instance_types_response_of_yojson
      ~error_deserializer
end

module ListRegions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspacesinstances#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.workspacesinstances#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.workspacesinstances#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.workspacesinstances#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_regions_request) =
    let input = Json_serializers.list_regions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EUCMIFrontendAPIService.ListRegions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_regions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_regions_request) =
    let input = Json_serializers.list_regions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EUCMIFrontendAPIService.ListRegions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_regions_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspacesinstances#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.workspacesinstances#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspacesinstances#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.workspacesinstances#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.workspacesinstances#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EUCMIFrontendAPIService.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EUCMIFrontendAPIService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListWorkspaceInstances = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspacesinstances#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.workspacesinstances#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.workspacesinstances#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.workspacesinstances#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_workspace_instances_request) =
    let input = Json_serializers.list_workspace_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EUCMIFrontendAPIService.ListWorkspaceInstances"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_workspace_instances_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_workspace_instances_request) =
    let input = Json_serializers.list_workspace_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EUCMIFrontendAPIService.ListWorkspaceInstances" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_workspace_instances_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspacesinstances#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.workspacesinstances#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspacesinstances#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.workspacesinstances#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.workspacesinstances#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EUCMIFrontendAPIService.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EUCMIFrontendAPIService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspacesinstances#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.workspacesinstances#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspacesinstances#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.workspacesinstances#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.workspacesinstances#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EUCMIFrontendAPIService.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EUCMIFrontendAPIService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module DisassociateVolume = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspacesinstances#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.workspacesinstances#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.workspacesinstances#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspacesinstances#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.workspacesinstances#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.workspacesinstances#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : disassociate_volume_request) =
    let input = Json_serializers.disassociate_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EUCMIFrontendAPIService.DisassociateVolume"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_volume_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_volume_request) =
    let input = Json_serializers.disassociate_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EUCMIFrontendAPIService.DisassociateVolume" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_volume_response_of_yojson
      ~error_deserializer
end

module DeleteWorkspaceInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspacesinstances#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.workspacesinstances#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.workspacesinstances#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspacesinstances#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.workspacesinstances#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.workspacesinstances#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : delete_workspace_instance_request) =
    let input = Json_serializers.delete_workspace_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"EUCMIFrontendAPIService.DeleteWorkspaceInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_workspace_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_workspace_instance_request) =
    let input = Json_serializers.delete_workspace_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EUCMIFrontendAPIService.DeleteWorkspaceInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_workspace_instance_response_of_yojson
      ~error_deserializer
end

module DeleteVolume = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspacesinstances#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.workspacesinstances#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.workspacesinstances#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspacesinstances#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.workspacesinstances#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.workspacesinstances#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : delete_volume_request) =
    let input = Json_serializers.delete_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EUCMIFrontendAPIService.DeleteVolume" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_volume_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_volume_request) =
    let input = Json_serializers.delete_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EUCMIFrontendAPIService.DeleteVolume" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_volume_response_of_yojson ~error_deserializer
end

module CreateWorkspaceInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspacesinstances#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.workspacesinstances#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.workspacesinstances#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.workspacesinstances#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.workspacesinstances#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.workspacesinstances#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : create_workspace_instance_request) =
    let input = Json_serializers.create_workspace_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"EUCMIFrontendAPIService.CreateWorkspaceInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_workspace_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_workspace_instance_request) =
    let input = Json_serializers.create_workspace_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EUCMIFrontendAPIService.CreateWorkspaceInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_workspace_instance_response_of_yojson
      ~error_deserializer
end

module CreateVolume = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspacesinstances#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.workspacesinstances#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.workspacesinstances#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.workspacesinstances#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.workspacesinstances#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.workspacesinstances#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : create_volume_request) =
    let input = Json_serializers.create_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EUCMIFrontendAPIService.CreateVolume" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_volume_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_volume_request) =
    let input = Json_serializers.create_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EUCMIFrontendAPIService.CreateVolume" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_volume_response_of_yojson ~error_deserializer
end

module AssociateVolume = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspacesinstances#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.workspacesinstances#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.workspacesinstances#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspacesinstances#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.workspacesinstances#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.workspacesinstances#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : associate_volume_request) =
    let input = Json_serializers.associate_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EUCMIFrontendAPIService.AssociateVolume"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_volume_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_volume_request) =
    let input = Json_serializers.associate_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EUCMIFrontendAPIService.AssociateVolume" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_volume_response_of_yojson
      ~error_deserializer
end
