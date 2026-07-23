open Types
open Service_metadata

module UpdatePolicyTemplate = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.verifiedpermissions#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_policy_template_input) =
    let input = Json_serializers.update_policy_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.UpdatePolicyTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_policy_template_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_policy_template_input) =
    let input = Json_serializers.update_policy_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.UpdatePolicyTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_policy_template_output_of_yojson
      ~error_deserializer
end

module UpdatePolicyStore = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.verifiedpermissions#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_policy_store_input) =
    let input = Json_serializers.update_policy_store_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.UpdatePolicyStore" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_policy_store_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_policy_store_input) =
    let input = Json_serializers.update_policy_store_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.UpdatePolicyStore" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_policy_store_output_of_yojson
      ~error_deserializer
end

module UpdatePolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.verifiedpermissions#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.verifiedpermissions#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_policy_input) =
    let input = Json_serializers.update_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.UpdatePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_policy_input) =
    let input = Json_serializers.update_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VerifiedPermissions.UpdatePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_policy_output_of_yojson ~error_deserializer
end

module UpdateIdentitySource = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.verifiedpermissions#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_identity_source_input) =
    let input = Json_serializers.update_identity_source_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.UpdateIdentitySource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_identity_source_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_identity_source_input) =
    let input = Json_serializers.update_identity_source_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.UpdateIdentitySource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_identity_source_output_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.verifiedpermissions#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.verifiedpermissions#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.verifiedpermissions#ThrottlingException"
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
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.verifiedpermissions#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.verifiedpermissions#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.verifiedpermissions#ThrottlingException"
    | `TooManyTagsException _ -> "com.amazonaws.verifiedpermissions#TooManyTagsException"
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
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VerifiedPermissions.TagResource"
      ~service ~context ~input ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson
      ~error_deserializer
end

module PutSchema = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.verifiedpermissions#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.verifiedpermissions#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_schema_input) =
    let input = Json_serializers.put_schema_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.PutSchema" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_schema_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_schema_input) =
    let input = Json_serializers.put_schema_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VerifiedPermissions.PutSchema"
      ~service ~context ~input ~output_deserializer:Json_deserializers.put_schema_output_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.verifiedpermissions#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.verifiedpermissions#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.verifiedpermissions#ThrottlingException"
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
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
end

module ListPolicyTemplates = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
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

  let request context (request : list_policy_templates_input) =
    let input = Json_serializers.list_policy_templates_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.ListPolicyTemplates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_policy_templates_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_policy_templates_input) =
    let input = Json_serializers.list_policy_templates_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.ListPolicyTemplates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_policy_templates_output_of_yojson
      ~error_deserializer
end

module ListPolicyStores = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_policy_stores_input) =
    let input = Json_serializers.list_policy_stores_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.ListPolicyStores" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_policy_stores_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_policy_stores_input) =
    let input = Json_serializers.list_policy_stores_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.ListPolicyStores" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_policy_stores_output_of_yojson
      ~error_deserializer
end

module ListPolicyStoreAliases = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_policy_store_aliases_input) =
    let input = Json_serializers.list_policy_store_aliases_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.ListPolicyStoreAliases"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_policy_store_aliases_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_policy_store_aliases_input) =
    let input = Json_serializers.list_policy_store_aliases_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.ListPolicyStoreAliases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_policy_store_aliases_output_of_yojson
      ~error_deserializer
end

module ListPolicies = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
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

  let request context (request : list_policies_input) =
    let input = Json_serializers.list_policies_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.ListPolicies" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_policies_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_policies_input) =
    let input = Json_serializers.list_policies_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VerifiedPermissions.ListPolicies"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_policies_output_of_yojson ~error_deserializer
end

module ListIdentitySources = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
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

  let request context (request : list_identity_sources_input) =
    let input = Json_serializers.list_identity_sources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.ListIdentitySources"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_identity_sources_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_identity_sources_input) =
    let input = Json_serializers.list_identity_sources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.ListIdentitySources" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_identity_sources_output_of_yojson
      ~error_deserializer
end

module IsAuthorizedWithToken = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
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

  let request context (request : is_authorized_with_token_input) =
    let input = Json_serializers.is_authorized_with_token_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.IsAuthorizedWithToken"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.is_authorized_with_token_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : is_authorized_with_token_input) =
    let input = Json_serializers.is_authorized_with_token_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.IsAuthorizedWithToken" ~service ~context ~input
      ~output_deserializer:Json_deserializers.is_authorized_with_token_output_of_yojson
      ~error_deserializer
end

module IsAuthorized = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
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

  let request context (request : is_authorized_input) =
    let input = Json_serializers.is_authorized_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.IsAuthorized" ~service
      ~context ~input ~output_deserializer:Json_deserializers.is_authorized_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : is_authorized_input) =
    let input = Json_serializers.is_authorized_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VerifiedPermissions.IsAuthorized"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.is_authorized_output_of_yojson ~error_deserializer
end

module GetSchema = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
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

  let request context (request : get_schema_input) =
    let input = Json_serializers.get_schema_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.GetSchema" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_schema_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_schema_input) =
    let input = Json_serializers.get_schema_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VerifiedPermissions.GetSchema"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_schema_output_of_yojson
      ~error_deserializer
end

module GetPolicyTemplate = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
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

  let request context (request : get_policy_template_input) =
    let input = Json_serializers.get_policy_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.GetPolicyTemplate" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_policy_template_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_policy_template_input) =
    let input = Json_serializers.get_policy_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.GetPolicyTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_policy_template_output_of_yojson
      ~error_deserializer
end

module GetPolicyStoreAlias = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
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

  let request context (request : get_policy_store_alias_input) =
    let input = Json_serializers.get_policy_store_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.GetPolicyStoreAlias"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_policy_store_alias_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_policy_store_alias_input) =
    let input = Json_serializers.get_policy_store_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.GetPolicyStoreAlias" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_policy_store_alias_output_of_yojson
      ~error_deserializer
end

module GetPolicyStore = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
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

  let request context (request : get_policy_store_input) =
    let input = Json_serializers.get_policy_store_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.GetPolicyStore" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_policy_store_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_policy_store_input) =
    let input = Json_serializers.get_policy_store_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.GetPolicyStore" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_policy_store_output_of_yojson ~error_deserializer
end

module GetPolicy = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
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

  let request context (request : get_policy_input) =
    let input = Json_serializers.get_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.GetPolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_policy_input) =
    let input = Json_serializers.get_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VerifiedPermissions.GetPolicy"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_policy_output_of_yojson
      ~error_deserializer
end

module GetIdentitySource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
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

  let request context (request : get_identity_source_input) =
    let input = Json_serializers.get_identity_source_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.GetIdentitySource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_identity_source_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_identity_source_input) =
    let input = Json_serializers.get_identity_source_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.GetIdentitySource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_identity_source_output_of_yojson
      ~error_deserializer
end

module DeletePolicyTemplate = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.verifiedpermissions#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_policy_template_input) =
    let input = Json_serializers.delete_policy_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.DeletePolicyTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_policy_template_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_policy_template_input) =
    let input = Json_serializers.delete_policy_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.DeletePolicyTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_policy_template_output_of_yojson
      ~error_deserializer
end

module DeletePolicyStoreAlias = struct
  let error_to_string = function
    | `InvalidStateException _ -> "com.amazonaws.verifiedpermissions#InvalidStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_policy_store_alias_input) =
    let input = Json_serializers.delete_policy_store_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.DeletePolicyStoreAlias"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_policy_store_alias_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_policy_store_alias_input) =
    let input = Json_serializers.delete_policy_store_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.DeletePolicyStoreAlias" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_policy_store_alias_output_of_yojson
      ~error_deserializer
end

module DeletePolicyStore = struct
  let error_to_string = function
    | `InvalidStateException _ -> "com.amazonaws.verifiedpermissions#InvalidStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_policy_store_input) =
    let input = Json_serializers.delete_policy_store_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.DeletePolicyStore" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_policy_store_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_policy_store_input) =
    let input = Json_serializers.delete_policy_store_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.DeletePolicyStore" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_policy_store_output_of_yojson
      ~error_deserializer
end

module DeletePolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.verifiedpermissions#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_policy_input) =
    let input = Json_serializers.delete_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.DeletePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_policy_input) =
    let input = Json_serializers.delete_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VerifiedPermissions.DeletePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_policy_output_of_yojson ~error_deserializer
end

module DeleteIdentitySource = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.verifiedpermissions#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_identity_source_input) =
    let input = Json_serializers.delete_identity_source_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.DeleteIdentitySource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_identity_source_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_identity_source_input) =
    let input = Json_serializers.delete_identity_source_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.DeleteIdentitySource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_identity_source_output_of_yojson
      ~error_deserializer
end

module CreatePolicyTemplate = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.verifiedpermissions#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.verifiedpermissions#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_policy_template_input) =
    let input = Json_serializers.create_policy_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.CreatePolicyTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_policy_template_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_policy_template_input) =
    let input = Json_serializers.create_policy_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.CreatePolicyTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_policy_template_output_of_yojson
      ~error_deserializer
end

module CreatePolicyStoreAlias = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.verifiedpermissions#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.verifiedpermissions#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_policy_store_alias_input) =
    let input = Json_serializers.create_policy_store_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.CreatePolicyStoreAlias"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_policy_store_alias_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_policy_store_alias_input) =
    let input = Json_serializers.create_policy_store_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.CreatePolicyStoreAlias" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_policy_store_alias_output_of_yojson
      ~error_deserializer
end

module CreatePolicyStore = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.verifiedpermissions#ConflictException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.verifiedpermissions#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_policy_store_input) =
    let input = Json_serializers.create_policy_store_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.CreatePolicyStore" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_policy_store_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_policy_store_input) =
    let input = Json_serializers.create_policy_store_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.CreatePolicyStore" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_policy_store_output_of_yojson
      ~error_deserializer
end

module CreatePolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.verifiedpermissions#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.verifiedpermissions#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_policy_input) =
    let input = Json_serializers.create_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.CreatePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_policy_input) =
    let input = Json_serializers.create_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VerifiedPermissions.CreatePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_policy_output_of_yojson ~error_deserializer
end

module CreateIdentitySource = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.verifiedpermissions#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.verifiedpermissions#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_identity_source_input) =
    let input = Json_serializers.create_identity_source_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.CreateIdentitySource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_identity_source_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_identity_source_input) =
    let input = Json_serializers.create_identity_source_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.CreateIdentitySource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_identity_source_output_of_yojson
      ~error_deserializer
end

module BatchIsAuthorizedWithToken = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
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

  let request context (request : batch_is_authorized_with_token_input) =
    let input = Json_serializers.batch_is_authorized_with_token_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.BatchIsAuthorizedWithToken"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_is_authorized_with_token_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_is_authorized_with_token_input) =
    let input = Json_serializers.batch_is_authorized_with_token_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.BatchIsAuthorizedWithToken" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_is_authorized_with_token_output_of_yojson
      ~error_deserializer
end

module BatchIsAuthorized = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.verifiedpermissions#ResourceNotFoundException"
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

  let request context (request : batch_is_authorized_input) =
    let input = Json_serializers.batch_is_authorized_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.BatchIsAuthorized" ~service
      ~context ~input ~output_deserializer:Json_deserializers.batch_is_authorized_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_is_authorized_input) =
    let input = Json_serializers.batch_is_authorized_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.BatchIsAuthorized" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_is_authorized_output_of_yojson
      ~error_deserializer
end

module BatchGetPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_policy_input) =
    let input = Json_serializers.batch_get_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VerifiedPermissions.BatchGetPolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.batch_get_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_policy_input) =
    let input = Json_serializers.batch_get_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VerifiedPermissions.BatchGetPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_policy_output_of_yojson ~error_deserializer
end
