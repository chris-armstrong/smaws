open Types
open Service_metadata

module AssociateConfigurationItemsToApplication = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_configuration_items_to_application_request) =
    let input =
      Json_serializers.associate_configuration_items_to_application_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.AssociateConfigurationItemsToApplication" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.associate_configuration_items_to_application_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_configuration_items_to_application_request)
      =
    let input =
      Json_serializers.associate_configuration_items_to_application_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.AssociateConfigurationItemsToApplication" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.associate_configuration_items_to_application_response_of_yojson
      ~error_deserializer
end

module BatchDeleteAgents = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_delete_agents_request) =
    let input = Json_serializers.batch_delete_agents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.BatchDeleteAgents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_agents_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_delete_agents_request) =
    let input = Json_serializers.batch_delete_agents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.BatchDeleteAgents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_agents_response_of_yojson
      ~error_deserializer
end

module BatchDeleteImportData = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_delete_import_data_request) =
    let input = Json_serializers.batch_delete_import_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.BatchDeleteImportData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_import_data_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_delete_import_data_request) =
    let input = Json_serializers.batch_delete_import_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.BatchDeleteImportData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_import_data_response_of_yojson
      ~error_deserializer
end

module CreateApplication = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_application_request) =
    let input = Json_serializers.create_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.CreateApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_application_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_application_request) =
    let input = Json_serializers.create_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.CreateApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_application_response_of_yojson
      ~error_deserializer
end

module CreateTags = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.applicationdiscoveryservice#ResourceNotFoundException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_tags_request) =
    let input = Json_serializers.create_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPoseidonService_V2015_11_01.CreateTags"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_tags_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_tags_request) =
    let input = Json_serializers.create_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.CreateTags" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_tags_response_of_yojson ~error_deserializer
end

module DeleteApplications = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_applications_request) =
    let input = Json_serializers.delete_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.DeleteApplications" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_applications_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_applications_request) =
    let input = Json_serializers.delete_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.DeleteApplications" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_applications_response_of_yojson
      ~error_deserializer
end

module DeleteTags = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.applicationdiscoveryservice#ResourceNotFoundException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_tags_request) =
    let input = Json_serializers.delete_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPoseidonService_V2015_11_01.DeleteTags"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_tags_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_tags_request) =
    let input = Json_serializers.delete_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.DeleteTags" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_tags_response_of_yojson ~error_deserializer
end

module DescribeAgents = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_agents_request) =
    let input = Json_serializers.describe_agents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPoseidonService_V2015_11_01.DescribeAgents"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_agents_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_agents_request) =
    let input = Json_serializers.describe_agents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.DescribeAgents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_agents_response_of_yojson ~error_deserializer
end

module DescribeBatchDeleteConfigurationTask = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_batch_delete_configuration_task_request) =
    let input =
      Json_serializers.describe_batch_delete_configuration_task_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.DescribeBatchDeleteConfigurationTask" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_batch_delete_configuration_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_batch_delete_configuration_task_request) =
    let input =
      Json_serializers.describe_batch_delete_configuration_task_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.DescribeBatchDeleteConfigurationTask" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_batch_delete_configuration_task_response_of_yojson
      ~error_deserializer
end

module DescribeConfigurations = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_configurations_request) =
    let input = Json_serializers.describe_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.DescribeConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_configurations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_configurations_request) =
    let input = Json_serializers.describe_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.DescribeConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_configurations_response_of_yojson
      ~error_deserializer
end

module DescribeContinuousExports = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `OperationNotPermittedException _ ->
        "com.amazonaws.applicationdiscoveryservice#OperationNotPermittedException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.applicationdiscoveryservice#ResourceNotFoundException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_continuous_exports_request) =
    let input = Json_serializers.describe_continuous_exports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.DescribeContinuousExports" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_continuous_exports_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_continuous_exports_request) =
    let input = Json_serializers.describe_continuous_exports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.DescribeContinuousExports" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_continuous_exports_response_of_yojson
      ~error_deserializer
end

module DescribeExportConfigurations = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.applicationdiscoveryservice#ResourceNotFoundException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_export_configurations_request) =
    let input = Json_serializers.describe_export_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.DescribeExportConfigurations" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_export_configurations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_export_configurations_request) =
    let input = Json_serializers.describe_export_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.DescribeExportConfigurations" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_export_configurations_response_of_yojson
      ~error_deserializer
end

module DescribeExportTasks = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_export_tasks_request) =
    let input = Json_serializers.describe_export_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.DescribeExportTasks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_export_tasks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_export_tasks_request) =
    let input = Json_serializers.describe_export_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.DescribeExportTasks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_export_tasks_response_of_yojson
      ~error_deserializer
end

module DescribeImportTasks = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_import_tasks_request) =
    let input = Json_serializers.describe_import_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.DescribeImportTasks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_import_tasks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_import_tasks_request) =
    let input = Json_serializers.describe_import_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.DescribeImportTasks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_import_tasks_response_of_yojson
      ~error_deserializer
end

module DescribeTags = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.applicationdiscoveryservice#ResourceNotFoundException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_tags_request) =
    let input = Json_serializers.describe_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPoseidonService_V2015_11_01.DescribeTags"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_tags_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_tags_request) =
    let input = Json_serializers.describe_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.DescribeTags" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_tags_response_of_yojson ~error_deserializer
end

module DisassociateConfigurationItemsFromApplication = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_configuration_items_from_application_request) =
    let input =
      Json_serializers.disassociate_configuration_items_from_application_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.DisassociateConfigurationItemsFromApplication"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_configuration_items_from_application_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : disassociate_configuration_items_from_application_request) =
    let input =
      Json_serializers.disassociate_configuration_items_from_application_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.DisassociateConfigurationItemsFromApplication"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_configuration_items_from_application_response_of_yojson
      ~error_deserializer
end

module ExportConfigurations = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `OperationNotPermittedException _ ->
        "com.amazonaws.applicationdiscoveryservice#OperationNotPermittedException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.ExportConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.export_configurations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.ExportConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.export_configurations_response_of_yojson
      ~error_deserializer
end

module GetDiscoverySummary = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_discovery_summary_request) =
    let input = Json_serializers.get_discovery_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.GetDiscoverySummary" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_discovery_summary_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_discovery_summary_request) =
    let input = Json_serializers.get_discovery_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.GetDiscoverySummary" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_discovery_summary_response_of_yojson
      ~error_deserializer
end

module ListConfigurations = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.applicationdiscoveryservice#ResourceNotFoundException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_configurations_request) =
    let input = Json_serializers.list_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.ListConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_configurations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_configurations_request) =
    let input = Json_serializers.list_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.ListConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_configurations_response_of_yojson
      ~error_deserializer
end

module ListServerNeighbors = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_server_neighbors_request) =
    let input = Json_serializers.list_server_neighbors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.ListServerNeighbors" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_server_neighbors_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_server_neighbors_request) =
    let input = Json_serializers.list_server_neighbors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.ListServerNeighbors" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_server_neighbors_response_of_yojson
      ~error_deserializer
end

module StartBatchDeleteConfigurationTask = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `LimitExceededException _ ->
        "com.amazonaws.applicationdiscoveryservice#LimitExceededException"
    | `OperationNotPermittedException _ ->
        "com.amazonaws.applicationdiscoveryservice#OperationNotPermittedException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_batch_delete_configuration_task_request) =
    let input = Json_serializers.start_batch_delete_configuration_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.StartBatchDeleteConfigurationTask" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.start_batch_delete_configuration_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_batch_delete_configuration_task_request) =
    let input = Json_serializers.start_batch_delete_configuration_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.StartBatchDeleteConfigurationTask" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.start_batch_delete_configuration_task_response_of_yojson
      ~error_deserializer
end

module StartContinuousExport = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `ConflictErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ConflictErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `OperationNotPermittedException _ ->
        "com.amazonaws.applicationdiscoveryservice#OperationNotPermittedException"
    | `ResourceInUseException _ ->
        "com.amazonaws.applicationdiscoveryservice#ResourceInUseException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "ConflictErrorException" ->
          `ConflictErrorException (Json_deserializers.conflict_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_continuous_export_request) =
    let input = Json_serializers.start_continuous_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.StartContinuousExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_continuous_export_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_continuous_export_request) =
    let input = Json_serializers.start_continuous_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.StartContinuousExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_continuous_export_response_of_yojson
      ~error_deserializer
end

module StartDataCollectionByAgentIds = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_data_collection_by_agent_ids_request) =
    let input = Json_serializers.start_data_collection_by_agent_ids_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.StartDataCollectionByAgentIds" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.start_data_collection_by_agent_ids_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_data_collection_by_agent_ids_request) =
    let input = Json_serializers.start_data_collection_by_agent_ids_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.StartDataCollectionByAgentIds" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.start_data_collection_by_agent_ids_response_of_yojson
      ~error_deserializer
end

module StartExportTask = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `OperationNotPermittedException _ ->
        "com.amazonaws.applicationdiscoveryservice#OperationNotPermittedException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_export_task_request) =
    let input = Json_serializers.start_export_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPoseidonService_V2015_11_01.StartExportTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_export_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_export_task_request) =
    let input = Json_serializers.start_export_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.StartExportTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_export_task_response_of_yojson
      ~error_deserializer
end

module StartImportTask = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ResourceInUseException _ ->
        "com.amazonaws.applicationdiscoveryservice#ResourceInUseException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_import_task_request) =
    let input = Json_serializers.start_import_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPoseidonService_V2015_11_01.StartImportTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_import_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_import_task_request) =
    let input = Json_serializers.start_import_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.StartImportTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_import_task_response_of_yojson
      ~error_deserializer
end

module StopContinuousExport = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `OperationNotPermittedException _ ->
        "com.amazonaws.applicationdiscoveryservice#OperationNotPermittedException"
    | `ResourceInUseException _ ->
        "com.amazonaws.applicationdiscoveryservice#ResourceInUseException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.applicationdiscoveryservice#ResourceNotFoundException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OperationNotPermittedException" ->
          `OperationNotPermittedException
            (Json_deserializers.operation_not_permitted_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_continuous_export_request) =
    let input = Json_serializers.stop_continuous_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.StopContinuousExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_continuous_export_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_continuous_export_request) =
    let input = Json_serializers.stop_continuous_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.StopContinuousExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_continuous_export_response_of_yojson
      ~error_deserializer
end

module StopDataCollectionByAgentIds = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_data_collection_by_agent_ids_request) =
    let input = Json_serializers.stop_data_collection_by_agent_ids_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.StopDataCollectionByAgentIds" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.stop_data_collection_by_agent_ids_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_data_collection_by_agent_ids_request) =
    let input = Json_serializers.stop_data_collection_by_agent_ids_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.StopDataCollectionByAgentIds" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.stop_data_collection_by_agent_ids_response_of_yojson
      ~error_deserializer
end

module UpdateApplication = struct
  let error_to_string = function
    | `AuthorizationErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#AuthorizationErrorException"
    | `HomeRegionNotSetException _ ->
        "com.amazonaws.applicationdiscoveryservice#HomeRegionNotSetException"
    | `InvalidParameterException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.applicationdiscoveryservice#InvalidParameterValueException"
    | `ServerInternalErrorException _ ->
        "com.amazonaws.applicationdiscoveryservice#ServerInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthorizationErrorException" ->
          `AuthorizationErrorException
            (Json_deserializers.authorization_error_exception_of_yojson tree path)
      | _, "HomeRegionNotSetException" ->
          `HomeRegionNotSetException
            (Json_deserializers.home_region_not_set_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ServerInternalErrorException" ->
          `ServerInternalErrorException
            (Json_deserializers.server_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_application_request) =
    let input = Json_serializers.update_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSPoseidonService_V2015_11_01.UpdateApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_application_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_application_request) =
    let input = Json_serializers.update_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPoseidonService_V2015_11_01.UpdateApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_application_response_of_yojson
      ~error_deserializer
end
