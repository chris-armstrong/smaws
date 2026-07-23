open Types
open Service_metadata

module UpdateUser = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.identitystore#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.identitystore#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_user_request) =
    let input = Json_serializers.update_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.UpdateUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_user_request) =
    let input = Json_serializers.update_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSIdentityStore.UpdateUser"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_user_response_of_yojson ~error_deserializer
end

module UpdateGroup = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.identitystore#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.identitystore#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_group_request) =
    let input = Json_serializers.update_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.UpdateGroup" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_group_request) =
    let input = Json_serializers.update_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSIdentityStore.UpdateGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_group_response_of_yojson ~error_deserializer
end

module ListUsers = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_users_request) =
    let input = Json_serializers.list_users_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.ListUsers" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_users_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_users_request) =
    let input = Json_serializers.list_users_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSIdentityStore.ListUsers"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_users_response_of_yojson
      ~error_deserializer
end

module ListGroups = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_groups_request) =
    let input = Json_serializers.list_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.ListGroups" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_groups_request) =
    let input = Json_serializers.list_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSIdentityStore.ListGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_groups_response_of_yojson ~error_deserializer
end

module ListGroupMemberships = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_group_memberships_request) =
    let input = Json_serializers.list_group_memberships_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.ListGroupMemberships" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_group_memberships_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_group_memberships_request) =
    let input = Json_serializers.list_group_memberships_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSIdentityStore.ListGroupMemberships" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_group_memberships_response_of_yojson
      ~error_deserializer
end

module DescribeUser = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_user_request) =
    let input = Json_serializers.describe_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.DescribeUser" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_user_request) =
    let input = Json_serializers.describe_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSIdentityStore.DescribeUser"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_user_response_of_yojson ~error_deserializer
end

module DescribeGroupMembership = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_group_membership_request) =
    let input = Json_serializers.describe_group_membership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.DescribeGroupMembership"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_group_membership_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_group_membership_request) =
    let input = Json_serializers.describe_group_membership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSIdentityStore.DescribeGroupMembership" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_group_membership_response_of_yojson
      ~error_deserializer
end

module DescribeGroup = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_group_request) =
    let input = Json_serializers.describe_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.DescribeGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_group_request) =
    let input = Json_serializers.describe_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSIdentityStore.DescribeGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_group_response_of_yojson ~error_deserializer
end

module DeleteUser = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.identitystore#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_user_request) =
    let input = Json_serializers.delete_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.DeleteUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_user_request) =
    let input = Json_serializers.delete_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSIdentityStore.DeleteUser"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_user_response_of_yojson ~error_deserializer
end

module DeleteGroupMembership = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.identitystore#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_group_membership_request) =
    let input = Json_serializers.delete_group_membership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.DeleteGroupMembership"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_group_membership_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_group_membership_request) =
    let input = Json_serializers.delete_group_membership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSIdentityStore.DeleteGroupMembership" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_group_membership_response_of_yojson
      ~error_deserializer
end

module DeleteGroup = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.identitystore#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_group_request) =
    let input = Json_serializers.delete_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.DeleteGroup" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_group_request) =
    let input = Json_serializers.delete_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSIdentityStore.DeleteGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_group_response_of_yojson ~error_deserializer
end

module CreateUser = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.identitystore#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.identitystore#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_user_request) =
    let input = Json_serializers.create_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.CreateUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_user_request) =
    let input = Json_serializers.create_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSIdentityStore.CreateUser"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_response_of_yojson ~error_deserializer
end

module CreateGroupMembership = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.identitystore#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.identitystore#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_group_membership_request) =
    let input = Json_serializers.create_group_membership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.CreateGroupMembership"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_group_membership_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_group_membership_request) =
    let input = Json_serializers.create_group_membership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSIdentityStore.CreateGroupMembership" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_group_membership_response_of_yojson
      ~error_deserializer
end

module CreateGroup = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.identitystore#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.identitystore#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_group_request) =
    let input = Json_serializers.create_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.CreateGroup" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_group_request) =
    let input = Json_serializers.create_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSIdentityStore.CreateGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_group_response_of_yojson ~error_deserializer
end

module GetGroupId = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_group_id_request) =
    let input = Json_serializers.get_group_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.GetGroupId" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_group_id_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_group_id_request) =
    let input = Json_serializers.get_group_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSIdentityStore.GetGroupId"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_group_id_response_of_yojson ~error_deserializer
end

module GetGroupMembershipId = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_group_membership_id_request) =
    let input = Json_serializers.get_group_membership_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.GetGroupMembershipId" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_group_membership_id_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_group_membership_id_request) =
    let input = Json_serializers.get_group_membership_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSIdentityStore.GetGroupMembershipId" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_group_membership_id_response_of_yojson
      ~error_deserializer
end

module GetUserId = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_user_id_request) =
    let input = Json_serializers.get_user_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.GetUserId" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_user_id_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_user_id_request) =
    let input = Json_serializers.get_user_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSIdentityStore.GetUserId"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_user_id_response_of_yojson ~error_deserializer
end

module IsMemberInGroups = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : is_member_in_groups_request) =
    let input = Json_serializers.is_member_in_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.IsMemberInGroups" ~service
      ~context ~input ~output_deserializer:Json_deserializers.is_member_in_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : is_member_in_groups_request) =
    let input = Json_serializers.is_member_in_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSIdentityStore.IsMemberInGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.is_member_in_groups_response_of_yojson
      ~error_deserializer
end

module ListGroupMembershipsForMember = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.identitystore#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.identitystore#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_group_memberships_for_member_request) =
    let input = Json_serializers.list_group_memberships_for_member_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSIdentityStore.ListGroupMembershipsForMember"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_group_memberships_for_member_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_group_memberships_for_member_request) =
    let input = Json_serializers.list_group_memberships_for_member_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSIdentityStore.ListGroupMembershipsForMember" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_group_memberships_for_member_response_of_yojson
      ~error_deserializer
end
