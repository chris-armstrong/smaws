open Types
open Service_metadata

module AddWorkload = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceInUseException _ -> "com.amazonaws.applicationinsights#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_workload_request) =
    let input = Json_serializers.add_workload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.AddWorkload" ~service
      ~context ~input ~output_deserializer:Json_deserializers.add_workload_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_workload_request) =
    let input = Json_serializers.add_workload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.AddWorkload" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_workload_response_of_yojson ~error_deserializer
end

module CreateApplication = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.applicationinsights#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceInUseException _ -> "com.amazonaws.applicationinsights#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `TagsAlreadyExistException _ -> "com.amazonaws.applicationinsights#TagsAlreadyExistException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TagsAlreadyExistException" ->
          `TagsAlreadyExistException
            (Json_deserializers.tags_already_exist_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_application_request) =
    let input = Json_serializers.create_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.CreateApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_application_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_application_request) =
    let input = Json_serializers.create_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.CreateApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_application_response_of_yojson
      ~error_deserializer
end

module CreateComponent = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceInUseException _ -> "com.amazonaws.applicationinsights#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_component_request) =
    let input = Json_serializers.create_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.CreateComponent"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_component_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_component_request) =
    let input = Json_serializers.create_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.CreateComponent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_component_response_of_yojson
      ~error_deserializer
end

module CreateLogPattern = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceInUseException _ -> "com.amazonaws.applicationinsights#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_log_pattern_request) =
    let input = Json_serializers.create_log_pattern_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.CreateLogPattern"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_log_pattern_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_log_pattern_request) =
    let input = Json_serializers.create_log_pattern_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.CreateLogPattern" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_log_pattern_response_of_yojson
      ~error_deserializer
end

module DeleteApplication = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.applicationinsights#BadRequestException"
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
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

  let request context (request : delete_application_request) =
    let input = Json_serializers.delete_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.DeleteApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_application_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_application_request) =
    let input = Json_serializers.delete_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.DeleteApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_application_response_of_yojson
      ~error_deserializer
end

module DeleteComponent = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : delete_component_request) =
    let input = Json_serializers.delete_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.DeleteComponent"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_component_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_component_request) =
    let input = Json_serializers.delete_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.DeleteComponent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_component_response_of_yojson
      ~error_deserializer
end

module DeleteLogPattern = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.applicationinsights#BadRequestException"
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
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

  let request context (request : delete_log_pattern_request) =
    let input = Json_serializers.delete_log_pattern_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.DeleteLogPattern"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_log_pattern_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_log_pattern_request) =
    let input = Json_serializers.delete_log_pattern_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.DeleteLogPattern" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_log_pattern_response_of_yojson
      ~error_deserializer
end

module DescribeApplication = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : describe_application_request) =
    let input = Json_serializers.describe_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.DescribeApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_application_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_application_request) =
    let input = Json_serializers.describe_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.DescribeApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_application_response_of_yojson
      ~error_deserializer
end

module DescribeComponent = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : describe_component_request) =
    let input = Json_serializers.describe_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.DescribeComponent"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_component_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_component_request) =
    let input = Json_serializers.describe_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.DescribeComponent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_component_response_of_yojson
      ~error_deserializer
end

module DescribeComponentConfiguration = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : describe_component_configuration_request) =
    let input = Json_serializers.describe_component_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"EC2WindowsBarleyService.DescribeComponentConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_component_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_component_configuration_request) =
    let input = Json_serializers.describe_component_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.DescribeComponentConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_component_configuration_response_of_yojson
      ~error_deserializer
end

module DescribeComponentConfigurationRecommendation = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : describe_component_configuration_recommendation_request) =
    let input =
      Json_serializers.describe_component_configuration_recommendation_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"EC2WindowsBarleyService.DescribeComponentConfigurationRecommendation" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_component_configuration_recommendation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : describe_component_configuration_recommendation_request) =
    let input =
      Json_serializers.describe_component_configuration_recommendation_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.DescribeComponentConfigurationRecommendation" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_component_configuration_recommendation_response_of_yojson
      ~error_deserializer
end

module DescribeLogPattern = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : describe_log_pattern_request) =
    let input = Json_serializers.describe_log_pattern_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.DescribeLogPattern"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_log_pattern_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_log_pattern_request) =
    let input = Json_serializers.describe_log_pattern_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.DescribeLogPattern" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_log_pattern_response_of_yojson
      ~error_deserializer
end

module DescribeObservation = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : describe_observation_request) =
    let input = Json_serializers.describe_observation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.DescribeObservation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_observation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_observation_request) =
    let input = Json_serializers.describe_observation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.DescribeObservation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_observation_response_of_yojson
      ~error_deserializer
end

module DescribeProblem = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : describe_problem_request) =
    let input = Json_serializers.describe_problem_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.DescribeProblem"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_problem_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_problem_request) =
    let input = Json_serializers.describe_problem_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.DescribeProblem" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_problem_response_of_yojson
      ~error_deserializer
end

module DescribeProblemObservations = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : describe_problem_observations_request) =
    let input = Json_serializers.describe_problem_observations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"EC2WindowsBarleyService.DescribeProblemObservations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_problem_observations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_problem_observations_request) =
    let input = Json_serializers.describe_problem_observations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.DescribeProblemObservations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_problem_observations_response_of_yojson
      ~error_deserializer
end

module DescribeWorkload = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : describe_workload_request) =
    let input = Json_serializers.describe_workload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.DescribeWorkload"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workload_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_workload_request) =
    let input = Json_serializers.describe_workload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.DescribeWorkload" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workload_response_of_yojson
      ~error_deserializer
end

module ListApplications = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_applications_request) =
    let input = Json_serializers.list_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.ListApplications"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_applications_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_applications_request) =
    let input = Json_serializers.list_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.ListApplications" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_applications_response_of_yojson
      ~error_deserializer
end

module ListComponents = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : list_components_request) =
    let input = Json_serializers.list_components_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.ListComponents"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_components_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_components_request) =
    let input = Json_serializers.list_components_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.ListComponents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_components_response_of_yojson ~error_deserializer
end

module ListConfigurationHistory = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : list_configuration_history_request) =
    let input = Json_serializers.list_configuration_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"EC2WindowsBarleyService.ListConfigurationHistory" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_configuration_history_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_configuration_history_request) =
    let input = Json_serializers.list_configuration_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.ListConfigurationHistory" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_configuration_history_response_of_yojson
      ~error_deserializer
end

module ListLogPatternSets = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : list_log_pattern_sets_request) =
    let input = Json_serializers.list_log_pattern_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.ListLogPatternSets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_log_pattern_sets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_log_pattern_sets_request) =
    let input = Json_serializers.list_log_pattern_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.ListLogPatternSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_log_pattern_sets_response_of_yojson
      ~error_deserializer
end

module ListLogPatterns = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : list_log_patterns_request) =
    let input = Json_serializers.list_log_patterns_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.ListLogPatterns"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_log_patterns_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_log_patterns_request) =
    let input = Json_serializers.list_log_patterns_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.ListLogPatterns" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_log_patterns_response_of_yojson
      ~error_deserializer
end

module ListProblems = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : list_problems_request) =
    let input = Json_serializers.list_problems_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.ListProblems" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_problems_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_problems_request) =
    let input = Json_serializers.list_problems_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.ListProblems" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_problems_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListWorkloads = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : list_workloads_request) =
    let input = Json_serializers.list_workloads_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.ListWorkloads" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_workloads_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_workloads_request) =
    let input = Json_serializers.list_workloads_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.ListWorkloads" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_workloads_response_of_yojson ~error_deserializer
end

module RemoveWorkload = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : remove_workload_request) =
    let input = Json_serializers.remove_workload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.RemoveWorkload"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_workload_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : remove_workload_request) =
    let input = Json_serializers.remove_workload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.RemoveWorkload" ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_workload_response_of_yojson ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.applicationinsights#TooManyTagsException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateApplication = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : update_application_request) =
    let input = Json_serializers.update_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.UpdateApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_application_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_application_request) =
    let input = Json_serializers.update_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.UpdateApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_application_response_of_yojson
      ~error_deserializer
end

module UpdateComponent = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceInUseException _ -> "com.amazonaws.applicationinsights#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_component_request) =
    let input = Json_serializers.update_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.UpdateComponent"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_component_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_component_request) =
    let input = Json_serializers.update_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.UpdateComponent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_component_response_of_yojson
      ~error_deserializer
end

module UpdateComponentConfiguration = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceInUseException _ -> "com.amazonaws.applicationinsights#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_component_configuration_request) =
    let input = Json_serializers.update_component_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"EC2WindowsBarleyService.UpdateComponentConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_component_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_component_configuration_request) =
    let input = Json_serializers.update_component_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.UpdateComponentConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_component_configuration_response_of_yojson
      ~error_deserializer
end

module UpdateLogPattern = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceInUseException _ -> "com.amazonaws.applicationinsights#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_log_pattern_request) =
    let input = Json_serializers.update_log_pattern_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.UpdateLogPattern"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_log_pattern_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_log_pattern_request) =
    let input = Json_serializers.update_log_pattern_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.UpdateLogPattern" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_log_pattern_response_of_yojson
      ~error_deserializer
end

module UpdateProblem = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : update_problem_request) =
    let input = Json_serializers.update_problem_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.UpdateProblem" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_problem_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_problem_request) =
    let input = Json_serializers.update_problem_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.UpdateProblem" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_problem_response_of_yojson ~error_deserializer
end

module UpdateWorkload = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.applicationinsights#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.applicationinsights#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationinsights#ValidationException"
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

  let request context (request : update_workload_request) =
    let input = Json_serializers.update_workload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"EC2WindowsBarleyService.UpdateWorkload"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_workload_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_workload_request) =
    let input = Json_serializers.update_workload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"EC2WindowsBarleyService.UpdateWorkload" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_workload_response_of_yojson ~error_deserializer
end
