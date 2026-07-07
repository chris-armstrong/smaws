open Types
open Service_metadata

module CreateEnvironmentEC2 = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.cloud9#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.cloud9#ConflictException"
    | `ForbiddenException _ -> "com.amazonaws.cloud9#ForbiddenException"
    | `InternalServerErrorException _ -> "com.amazonaws.cloud9#InternalServerErrorException"
    | `LimitExceededException _ -> "com.amazonaws.cloud9#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.cloud9#NotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cloud9#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerErrorException" ->
          `InternalServerErrorException
            (Json_deserializers.internal_server_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_environment_ec2_request) =
    let input = Json_serializers.create_environment_ec2_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCloud9WorkspaceManagementService.CreateEnvironmentEC2" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_environment_ec2_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_environment_ec2_request) =
    let input = Json_serializers.create_environment_ec2_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCloud9WorkspaceManagementService.CreateEnvironmentEC2" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_environment_ec2_result_of_yojson
      ~error_deserializer
end

module CreateEnvironmentMembership = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.cloud9#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.cloud9#ConflictException"
    | `ForbiddenException _ -> "com.amazonaws.cloud9#ForbiddenException"
    | `InternalServerErrorException _ -> "com.amazonaws.cloud9#InternalServerErrorException"
    | `LimitExceededException _ -> "com.amazonaws.cloud9#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.cloud9#NotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cloud9#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerErrorException" ->
          `InternalServerErrorException
            (Json_deserializers.internal_server_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_environment_membership_request) =
    let input = Json_serializers.create_environment_membership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCloud9WorkspaceManagementService.CreateEnvironmentMembership" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_environment_membership_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_environment_membership_request) =
    let input = Json_serializers.create_environment_membership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCloud9WorkspaceManagementService.CreateEnvironmentMembership" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_environment_membership_result_of_yojson
      ~error_deserializer
end

module DeleteEnvironment = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.cloud9#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.cloud9#ConflictException"
    | `ForbiddenException _ -> "com.amazonaws.cloud9#ForbiddenException"
    | `InternalServerErrorException _ -> "com.amazonaws.cloud9#InternalServerErrorException"
    | `LimitExceededException _ -> "com.amazonaws.cloud9#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.cloud9#NotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cloud9#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerErrorException" ->
          `InternalServerErrorException
            (Json_deserializers.internal_server_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_environment_request) =
    let input = Json_serializers.delete_environment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCloud9WorkspaceManagementService.DeleteEnvironment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_environment_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_environment_request) =
    let input = Json_serializers.delete_environment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCloud9WorkspaceManagementService.DeleteEnvironment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_environment_result_of_yojson
      ~error_deserializer
end

module DeleteEnvironmentMembership = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.cloud9#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.cloud9#ConflictException"
    | `ForbiddenException _ -> "com.amazonaws.cloud9#ForbiddenException"
    | `InternalServerErrorException _ -> "com.amazonaws.cloud9#InternalServerErrorException"
    | `LimitExceededException _ -> "com.amazonaws.cloud9#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.cloud9#NotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cloud9#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerErrorException" ->
          `InternalServerErrorException
            (Json_deserializers.internal_server_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_environment_membership_request) =
    let input = Json_serializers.delete_environment_membership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCloud9WorkspaceManagementService.DeleteEnvironmentMembership" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_environment_membership_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_environment_membership_request) =
    let input = Json_serializers.delete_environment_membership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCloud9WorkspaceManagementService.DeleteEnvironmentMembership" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_environment_membership_result_of_yojson
      ~error_deserializer
end

module DescribeEnvironmentMemberships = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.cloud9#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.cloud9#ConflictException"
    | `ForbiddenException _ -> "com.amazonaws.cloud9#ForbiddenException"
    | `InternalServerErrorException _ -> "com.amazonaws.cloud9#InternalServerErrorException"
    | `LimitExceededException _ -> "com.amazonaws.cloud9#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.cloud9#NotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cloud9#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerErrorException" ->
          `InternalServerErrorException
            (Json_deserializers.internal_server_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_environment_memberships_request) =
    let input = Json_serializers.describe_environment_memberships_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCloud9WorkspaceManagementService.DescribeEnvironmentMemberships" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_environment_memberships_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_environment_memberships_request) =
    let input = Json_serializers.describe_environment_memberships_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCloud9WorkspaceManagementService.DescribeEnvironmentMemberships" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_environment_memberships_result_of_yojson
      ~error_deserializer
end

module DescribeEnvironmentStatus = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.cloud9#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.cloud9#ConflictException"
    | `ForbiddenException _ -> "com.amazonaws.cloud9#ForbiddenException"
    | `InternalServerErrorException _ -> "com.amazonaws.cloud9#InternalServerErrorException"
    | `LimitExceededException _ -> "com.amazonaws.cloud9#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.cloud9#NotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cloud9#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerErrorException" ->
          `InternalServerErrorException
            (Json_deserializers.internal_server_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_environment_status_request) =
    let input = Json_serializers.describe_environment_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCloud9WorkspaceManagementService.DescribeEnvironmentStatus" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_environment_status_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_environment_status_request) =
    let input = Json_serializers.describe_environment_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCloud9WorkspaceManagementService.DescribeEnvironmentStatus" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_environment_status_result_of_yojson
      ~error_deserializer
end

module DescribeEnvironments = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.cloud9#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.cloud9#ConflictException"
    | `ForbiddenException _ -> "com.amazonaws.cloud9#ForbiddenException"
    | `InternalServerErrorException _ -> "com.amazonaws.cloud9#InternalServerErrorException"
    | `LimitExceededException _ -> "com.amazonaws.cloud9#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.cloud9#NotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cloud9#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerErrorException" ->
          `InternalServerErrorException
            (Json_deserializers.internal_server_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_environments_request) =
    let input = Json_serializers.describe_environments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCloud9WorkspaceManagementService.DescribeEnvironments" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_environments_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_environments_request) =
    let input = Json_serializers.describe_environments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCloud9WorkspaceManagementService.DescribeEnvironments" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_environments_result_of_yojson
      ~error_deserializer
end

module ListEnvironments = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.cloud9#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.cloud9#ConflictException"
    | `ForbiddenException _ -> "com.amazonaws.cloud9#ForbiddenException"
    | `InternalServerErrorException _ -> "com.amazonaws.cloud9#InternalServerErrorException"
    | `LimitExceededException _ -> "com.amazonaws.cloud9#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.cloud9#NotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cloud9#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerErrorException" ->
          `InternalServerErrorException
            (Json_deserializers.internal_server_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_environments_request) =
    let input = Json_serializers.list_environments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCloud9WorkspaceManagementService.ListEnvironments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_environments_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_environments_request) =
    let input = Json_serializers.list_environments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCloud9WorkspaceManagementService.ListEnvironments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_environments_result_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.cloud9#BadRequestException"
    | `InternalServerErrorException _ -> "com.amazonaws.cloud9#InternalServerErrorException"
    | `NotFoundException _ -> "com.amazonaws.cloud9#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalServerErrorException" ->
          `InternalServerErrorException
            (Json_deserializers.internal_server_error_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCloud9WorkspaceManagementService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCloud9WorkspaceManagementService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.cloud9#BadRequestException"
    | `ConcurrentAccessException _ -> "com.amazonaws.cloud9#ConcurrentAccessException"
    | `InternalServerErrorException _ -> "com.amazonaws.cloud9#InternalServerErrorException"
    | `NotFoundException _ -> "com.amazonaws.cloud9#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConcurrentAccessException" ->
          `ConcurrentAccessException
            (Json_deserializers.concurrent_access_exception_of_yojson tree path)
      | _, "InternalServerErrorException" ->
          `InternalServerErrorException
            (Json_deserializers.internal_server_error_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCloud9WorkspaceManagementService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCloud9WorkspaceManagementService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.cloud9#BadRequestException"
    | `ConcurrentAccessException _ -> "com.amazonaws.cloud9#ConcurrentAccessException"
    | `InternalServerErrorException _ -> "com.amazonaws.cloud9#InternalServerErrorException"
    | `NotFoundException _ -> "com.amazonaws.cloud9#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConcurrentAccessException" ->
          `ConcurrentAccessException
            (Json_deserializers.concurrent_access_exception_of_yojson tree path)
      | _, "InternalServerErrorException" ->
          `InternalServerErrorException
            (Json_deserializers.internal_server_error_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCloud9WorkspaceManagementService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCloud9WorkspaceManagementService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateEnvironment = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.cloud9#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.cloud9#ConflictException"
    | `ForbiddenException _ -> "com.amazonaws.cloud9#ForbiddenException"
    | `InternalServerErrorException _ -> "com.amazonaws.cloud9#InternalServerErrorException"
    | `LimitExceededException _ -> "com.amazonaws.cloud9#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.cloud9#NotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cloud9#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerErrorException" ->
          `InternalServerErrorException
            (Json_deserializers.internal_server_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_environment_request) =
    let input = Json_serializers.update_environment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCloud9WorkspaceManagementService.UpdateEnvironment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_environment_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_environment_request) =
    let input = Json_serializers.update_environment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCloud9WorkspaceManagementService.UpdateEnvironment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_environment_result_of_yojson
      ~error_deserializer
end

module UpdateEnvironmentMembership = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.cloud9#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.cloud9#ConflictException"
    | `ForbiddenException _ -> "com.amazonaws.cloud9#ForbiddenException"
    | `InternalServerErrorException _ -> "com.amazonaws.cloud9#InternalServerErrorException"
    | `LimitExceededException _ -> "com.amazonaws.cloud9#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.cloud9#NotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cloud9#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerErrorException" ->
          `InternalServerErrorException
            (Json_deserializers.internal_server_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_environment_membership_request) =
    let input = Json_serializers.update_environment_membership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCloud9WorkspaceManagementService.UpdateEnvironmentMembership" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_environment_membership_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_environment_membership_request) =
    let input = Json_serializers.update_environment_membership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCloud9WorkspaceManagementService.UpdateEnvironmentMembership" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_environment_membership_result_of_yojson
      ~error_deserializer
end
