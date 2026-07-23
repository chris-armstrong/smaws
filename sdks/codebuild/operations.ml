open Types
open Service_metadata

module CreateFleet = struct
  let error_to_string = function
    | `AccountLimitExceededException _ -> "com.amazonaws.codebuild#AccountLimitExceededException"
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.codebuild#ResourceAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccountLimitExceededException" ->
          `AccountLimitExceededException
            (Json_deserializers.account_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_fleet_input) =
    let input = Json_serializers.create_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.CreateFleet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_fleet_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_fleet_input) =
    let input = Json_serializers.create_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.CreateFleet"
      ~service ~context ~input ~output_deserializer:Json_deserializers.create_fleet_output_of_yojson
      ~error_deserializer
end

module CreateProject = struct
  let error_to_string = function
    | `AccountLimitExceededException _ -> "com.amazonaws.codebuild#AccountLimitExceededException"
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.codebuild#ResourceAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccountLimitExceededException" ->
          `AccountLimitExceededException
            (Json_deserializers.account_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_project_input) =
    let input = Json_serializers.create_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.CreateProject" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_project_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_project_input) =
    let input = Json_serializers.create_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.CreateProject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_project_output_of_yojson ~error_deserializer
end

module CreateReportGroup = struct
  let error_to_string = function
    | `AccountLimitExceededException _ -> "com.amazonaws.codebuild#AccountLimitExceededException"
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.codebuild#ResourceAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccountLimitExceededException" ->
          `AccountLimitExceededException
            (Json_deserializers.account_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_report_group_input) =
    let input = Json_serializers.create_report_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.CreateReportGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_report_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_report_group_input) =
    let input = Json_serializers.create_report_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.CreateReportGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_report_group_output_of_yojson
      ~error_deserializer
end

module CreateWebhook = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `OAuthProviderException _ -> "com.amazonaws.codebuild#OAuthProviderException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.codebuild#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OAuthProviderException" ->
          `OAuthProviderException (Json_deserializers.o_auth_provider_exception_of_yojson tree path)
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

  let request context (request : create_webhook_input) =
    let input = Json_serializers.create_webhook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.CreateWebhook" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_webhook_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_webhook_input) =
    let input = Json_serializers.create_webhook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.CreateWebhook"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_webhook_output_of_yojson ~error_deserializer
end

module DeleteBuildBatch = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_build_batch_input) =
    let input = Json_serializers.delete_build_batch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.DeleteBuildBatch" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_build_batch_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_build_batch_input) =
    let input = Json_serializers.delete_build_batch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.DeleteBuildBatch" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_build_batch_output_of_yojson
      ~error_deserializer
end

module DeleteFleet = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_fleet_input) =
    let input = Json_serializers.delete_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.DeleteFleet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_fleet_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_fleet_input) =
    let input = Json_serializers.delete_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.DeleteFleet"
      ~service ~context ~input ~output_deserializer:Json_deserializers.delete_fleet_output_of_yojson
      ~error_deserializer
end

module DeleteProject = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_project_input) =
    let input = Json_serializers.delete_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.DeleteProject" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_project_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_project_input) =
    let input = Json_serializers.delete_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.DeleteProject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_project_output_of_yojson ~error_deserializer
end

module DeleteReport = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_report_input) =
    let input = Json_serializers.delete_report_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.DeleteReport" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_report_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_report_input) =
    let input = Json_serializers.delete_report_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.DeleteReport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_report_output_of_yojson ~error_deserializer
end

module DeleteReportGroup = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_report_group_input) =
    let input = Json_serializers.delete_report_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.DeleteReportGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_report_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_report_group_input) =
    let input = Json_serializers.delete_report_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.DeleteReportGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_report_group_output_of_yojson
      ~error_deserializer
end

module DeleteResourcePolicy = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resource_policy_input) =
    let input = Json_serializers.delete_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.DeleteResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resource_policy_input) =
    let input = Json_serializers.delete_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.DeleteResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_output_of_yojson
      ~error_deserializer
end

module DeleteSourceCredentials = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_source_credentials_input) =
    let input = Json_serializers.delete_source_credentials_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.DeleteSourceCredentials"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_source_credentials_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_source_credentials_input) =
    let input = Json_serializers.delete_source_credentials_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.DeleteSourceCredentials" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_source_credentials_output_of_yojson
      ~error_deserializer
end

module DeleteWebhook = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `OAuthProviderException _ -> "com.amazonaws.codebuild#OAuthProviderException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OAuthProviderException" ->
          `OAuthProviderException (Json_deserializers.o_auth_provider_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_webhook_input) =
    let input = Json_serializers.delete_webhook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.DeleteWebhook" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_webhook_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_webhook_input) =
    let input = Json_serializers.delete_webhook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.DeleteWebhook"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_webhook_output_of_yojson ~error_deserializer
end

module DescribeCodeCoverages = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_code_coverages_input) =
    let input = Json_serializers.describe_code_coverages_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.DescribeCodeCoverages"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_code_coverages_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_code_coverages_input) =
    let input = Json_serializers.describe_code_coverages_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.DescribeCodeCoverages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_code_coverages_output_of_yojson
      ~error_deserializer
end

module DescribeTestCases = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_test_cases_input) =
    let input = Json_serializers.describe_test_cases_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.DescribeTestCases" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_test_cases_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_test_cases_input) =
    let input = Json_serializers.describe_test_cases_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.DescribeTestCases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_test_cases_output_of_yojson
      ~error_deserializer
end

module GetReportGroupTrend = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_report_group_trend_input) =
    let input = Json_serializers.get_report_group_trend_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.GetReportGroupTrend"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_report_group_trend_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_report_group_trend_input) =
    let input = Json_serializers.get_report_group_trend_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.GetReportGroupTrend" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_report_group_trend_output_of_yojson
      ~error_deserializer
end

module GetResourcePolicy = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_policy_input) =
    let input = Json_serializers.get_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.GetResourcePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_resource_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resource_policy_input) =
    let input = Json_serializers.get_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.GetResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_policy_output_of_yojson
      ~error_deserializer
end

module ImportSourceCredentials = struct
  let error_to_string = function
    | `AccountLimitExceededException _ -> "com.amazonaws.codebuild#AccountLimitExceededException"
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.codebuild#ResourceAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccountLimitExceededException" ->
          `AccountLimitExceededException
            (Json_deserializers.account_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_source_credentials_input) =
    let input = Json_serializers.import_source_credentials_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.ImportSourceCredentials"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_source_credentials_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_source_credentials_input) =
    let input = Json_serializers.import_source_credentials_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.ImportSourceCredentials" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_source_credentials_output_of_yojson
      ~error_deserializer
end

module InvalidateProjectCache = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : invalidate_project_cache_input) =
    let input = Json_serializers.invalidate_project_cache_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.InvalidateProjectCache"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.invalidate_project_cache_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : invalidate_project_cache_input) =
    let input = Json_serializers.invalidate_project_cache_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.InvalidateProjectCache" ~service ~context ~input
      ~output_deserializer:Json_deserializers.invalidate_project_cache_output_of_yojson
      ~error_deserializer
end

module ListBuildBatches = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_build_batches_input) =
    let input = Json_serializers.list_build_batches_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.ListBuildBatches" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_build_batches_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_build_batches_input) =
    let input = Json_serializers.list_build_batches_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.ListBuildBatches" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_build_batches_output_of_yojson
      ~error_deserializer
end

module ListBuildBatchesForProject = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_build_batches_for_project_input) =
    let input = Json_serializers.list_build_batches_for_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.ListBuildBatchesForProject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_build_batches_for_project_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_build_batches_for_project_input) =
    let input = Json_serializers.list_build_batches_for_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.ListBuildBatchesForProject" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_build_batches_for_project_output_of_yojson
      ~error_deserializer
end

module ListBuilds = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_builds_input) =
    let input = Json_serializers.list_builds_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.ListBuilds" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_builds_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_builds_input) =
    let input = Json_serializers.list_builds_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.ListBuilds"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_builds_output_of_yojson
      ~error_deserializer
end

module ListBuildsForProject = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_builds_for_project_input) =
    let input = Json_serializers.list_builds_for_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.ListBuildsForProject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_builds_for_project_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_builds_for_project_input) =
    let input = Json_serializers.list_builds_for_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.ListBuildsForProject" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_builds_for_project_output_of_yojson
      ~error_deserializer
end

module ListCommandExecutionsForSandbox = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_command_executions_for_sandbox_input) =
    let input = Json_serializers.list_command_executions_for_sandbox_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeBuild_20161006.ListCommandExecutionsForSandbox" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_command_executions_for_sandbox_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_command_executions_for_sandbox_input) =
    let input = Json_serializers.list_command_executions_for_sandbox_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.ListCommandExecutionsForSandbox" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_command_executions_for_sandbox_output_of_yojson
      ~error_deserializer
end

module ListCuratedEnvironmentImages = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_curated_environment_images_input) =
    let input = Json_serializers.list_curated_environment_images_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeBuild_20161006.ListCuratedEnvironmentImages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_curated_environment_images_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_curated_environment_images_input) =
    let input = Json_serializers.list_curated_environment_images_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.ListCuratedEnvironmentImages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_curated_environment_images_output_of_yojson
      ~error_deserializer
end

module ListFleets = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_fleets_input) =
    let input = Json_serializers.list_fleets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.ListFleets" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_fleets_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_fleets_input) =
    let input = Json_serializers.list_fleets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.ListFleets"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_fleets_output_of_yojson
      ~error_deserializer
end

module ListProjects = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_projects_input) =
    let input = Json_serializers.list_projects_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.ListProjects" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_projects_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_projects_input) =
    let input = Json_serializers.list_projects_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.ListProjects"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_projects_output_of_yojson ~error_deserializer
end

module ListReportGroups = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_report_groups_input) =
    let input = Json_serializers.list_report_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.ListReportGroups" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_report_groups_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_report_groups_input) =
    let input = Json_serializers.list_report_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.ListReportGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_report_groups_output_of_yojson
      ~error_deserializer
end

module ListReports = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_reports_input) =
    let input = Json_serializers.list_reports_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.ListReports" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_reports_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_reports_input) =
    let input = Json_serializers.list_reports_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.ListReports"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_reports_output_of_yojson
      ~error_deserializer
end

module ListReportsForReportGroup = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_reports_for_report_group_input) =
    let input = Json_serializers.list_reports_for_report_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.ListReportsForReportGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_reports_for_report_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_reports_for_report_group_input) =
    let input = Json_serializers.list_reports_for_report_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.ListReportsForReportGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_reports_for_report_group_output_of_yojson
      ~error_deserializer
end

module ListSandboxes = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_sandboxes_input) =
    let input = Json_serializers.list_sandboxes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.ListSandboxes" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_sandboxes_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_sandboxes_input) =
    let input = Json_serializers.list_sandboxes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.ListSandboxes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_sandboxes_output_of_yojson ~error_deserializer
end

module ListSandboxesForProject = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_sandboxes_for_project_input) =
    let input = Json_serializers.list_sandboxes_for_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.ListSandboxesForProject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_sandboxes_for_project_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_sandboxes_for_project_input) =
    let input = Json_serializers.list_sandboxes_for_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.ListSandboxesForProject" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_sandboxes_for_project_output_of_yojson
      ~error_deserializer
end

module ListSharedProjects = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_shared_projects_input) =
    let input = Json_serializers.list_shared_projects_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.ListSharedProjects" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_shared_projects_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_shared_projects_input) =
    let input = Json_serializers.list_shared_projects_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.ListSharedProjects" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_shared_projects_output_of_yojson
      ~error_deserializer
end

module ListSharedReportGroups = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_shared_report_groups_input) =
    let input = Json_serializers.list_shared_report_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.ListSharedReportGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_shared_report_groups_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_shared_report_groups_input) =
    let input = Json_serializers.list_shared_report_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.ListSharedReportGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_shared_report_groups_output_of_yojson
      ~error_deserializer
end

module ListSourceCredentials = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_source_credentials_input) =
    let input = Json_serializers.list_source_credentials_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.ListSourceCredentials"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_source_credentials_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_source_credentials_input) =
    let input = Json_serializers.list_source_credentials_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.ListSourceCredentials" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_source_credentials_output_of_yojson
      ~error_deserializer
end

module PutResourcePolicy = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_resource_policy_input) =
    let input = Json_serializers.put_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.PutResourcePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_resource_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_resource_policy_input) =
    let input = Json_serializers.put_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.PutResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_output_of_yojson
      ~error_deserializer
end

module RetryBuild = struct
  let error_to_string = function
    | `AccountLimitExceededException _ -> "com.amazonaws.codebuild#AccountLimitExceededException"
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccountLimitExceededException" ->
          `AccountLimitExceededException
            (Json_deserializers.account_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : retry_build_input) =
    let input = Json_serializers.retry_build_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.RetryBuild" ~service
      ~context ~input ~output_deserializer:Json_deserializers.retry_build_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : retry_build_input) =
    let input = Json_serializers.retry_build_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.RetryBuild"
      ~service ~context ~input ~output_deserializer:Json_deserializers.retry_build_output_of_yojson
      ~error_deserializer
end

module RetryBuildBatch = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : retry_build_batch_input) =
    let input = Json_serializers.retry_build_batch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.RetryBuildBatch" ~service
      ~context ~input ~output_deserializer:Json_deserializers.retry_build_batch_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : retry_build_batch_input) =
    let input = Json_serializers.retry_build_batch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.RetryBuildBatch" ~service ~context ~input
      ~output_deserializer:Json_deserializers.retry_build_batch_output_of_yojson ~error_deserializer
end

module StartBuild = struct
  let error_to_string = function
    | `AccountLimitExceededException _ -> "com.amazonaws.codebuild#AccountLimitExceededException"
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccountLimitExceededException" ->
          `AccountLimitExceededException
            (Json_deserializers.account_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_build_input) =
    let input = Json_serializers.start_build_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.StartBuild" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_build_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_build_input) =
    let input = Json_serializers.start_build_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.StartBuild"
      ~service ~context ~input ~output_deserializer:Json_deserializers.start_build_output_of_yojson
      ~error_deserializer
end

module StartBuildBatch = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_build_batch_input) =
    let input = Json_serializers.start_build_batch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.StartBuildBatch" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_build_batch_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_build_batch_input) =
    let input = Json_serializers.start_build_batch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.StartBuildBatch" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_build_batch_output_of_yojson ~error_deserializer
end

module StartCommandExecution = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_command_execution_input) =
    let input = Json_serializers.start_command_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.StartCommandExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_command_execution_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_command_execution_input) =
    let input = Json_serializers.start_command_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.StartCommandExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_command_execution_output_of_yojson
      ~error_deserializer
end

module StartSandbox = struct
  let error_to_string = function
    | `AccountSuspendedException _ -> "com.amazonaws.codebuild#AccountSuspendedException"
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccountSuspendedException" ->
          `AccountSuspendedException
            (Json_deserializers.account_suspended_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_sandbox_input) =
    let input = Json_serializers.start_sandbox_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.StartSandbox" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_sandbox_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_sandbox_input) =
    let input = Json_serializers.start_sandbox_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.StartSandbox"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_sandbox_output_of_yojson ~error_deserializer
end

module StartSandboxConnection = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_sandbox_connection_input) =
    let input = Json_serializers.start_sandbox_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.StartSandboxConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_sandbox_connection_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_sandbox_connection_input) =
    let input = Json_serializers.start_sandbox_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.StartSandboxConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_sandbox_connection_output_of_yojson
      ~error_deserializer
end

module StopBuild = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_build_input) =
    let input = Json_serializers.stop_build_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.StopBuild" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_build_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : stop_build_input) =
    let input = Json_serializers.stop_build_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.StopBuild"
      ~service ~context ~input ~output_deserializer:Json_deserializers.stop_build_output_of_yojson
      ~error_deserializer
end

module StopBuildBatch = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_build_batch_input) =
    let input = Json_serializers.stop_build_batch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.StopBuildBatch" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_build_batch_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_build_batch_input) =
    let input = Json_serializers.stop_build_batch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.StopBuildBatch" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_build_batch_output_of_yojson ~error_deserializer
end

module StopSandbox = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_sandbox_input) =
    let input = Json_serializers.stop_sandbox_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.StopSandbox" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_sandbox_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_sandbox_input) =
    let input = Json_serializers.stop_sandbox_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.StopSandbox"
      ~service ~context ~input ~output_deserializer:Json_deserializers.stop_sandbox_output_of_yojson
      ~error_deserializer
end

module UpdateFleet = struct
  let error_to_string = function
    | `AccountLimitExceededException _ -> "com.amazonaws.codebuild#AccountLimitExceededException"
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccountLimitExceededException" ->
          `AccountLimitExceededException
            (Json_deserializers.account_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_fleet_input) =
    let input = Json_serializers.update_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.UpdateFleet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_fleet_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_fleet_input) =
    let input = Json_serializers.update_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.UpdateFleet"
      ~service ~context ~input ~output_deserializer:Json_deserializers.update_fleet_output_of_yojson
      ~error_deserializer
end

module UpdateProject = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_project_input) =
    let input = Json_serializers.update_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.UpdateProject" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_project_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_project_input) =
    let input = Json_serializers.update_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.UpdateProject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_project_output_of_yojson ~error_deserializer
end

module UpdateProjectVisibility = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_project_visibility_input) =
    let input = Json_serializers.update_project_visibility_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.UpdateProjectVisibility"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_project_visibility_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_project_visibility_input) =
    let input = Json_serializers.update_project_visibility_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.UpdateProjectVisibility" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_project_visibility_output_of_yojson
      ~error_deserializer
end

module UpdateReportGroup = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_report_group_input) =
    let input = Json_serializers.update_report_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.UpdateReportGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_report_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_report_group_input) =
    let input = Json_serializers.update_report_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.UpdateReportGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_report_group_output_of_yojson
      ~error_deserializer
end

module UpdateWebhook = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | `OAuthProviderException _ -> "com.amazonaws.codebuild#OAuthProviderException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codebuild#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OAuthProviderException" ->
          `OAuthProviderException (Json_deserializers.o_auth_provider_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_webhook_input) =
    let input = Json_serializers.update_webhook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.UpdateWebhook" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_webhook_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_webhook_input) =
    let input = Json_serializers.update_webhook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeBuild_20161006.UpdateWebhook"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_webhook_output_of_yojson ~error_deserializer
end

module BatchGetSandboxes = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_sandboxes_input) =
    let input = Json_serializers.batch_get_sandboxes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.BatchGetSandboxes" ~service
      ~context ~input ~output_deserializer:Json_deserializers.batch_get_sandboxes_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_sandboxes_input) =
    let input = Json_serializers.batch_get_sandboxes_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.BatchGetSandboxes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_sandboxes_output_of_yojson
      ~error_deserializer
end

module BatchGetReports = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_reports_input) =
    let input = Json_serializers.batch_get_reports_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.BatchGetReports" ~service
      ~context ~input ~output_deserializer:Json_deserializers.batch_get_reports_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_reports_input) =
    let input = Json_serializers.batch_get_reports_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.BatchGetReports" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_reports_output_of_yojson ~error_deserializer
end

module BatchGetReportGroups = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_report_groups_input) =
    let input = Json_serializers.batch_get_report_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.BatchGetReportGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_report_groups_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_report_groups_input) =
    let input = Json_serializers.batch_get_report_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.BatchGetReportGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_report_groups_output_of_yojson
      ~error_deserializer
end

module BatchGetProjects = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_projects_input) =
    let input = Json_serializers.batch_get_projects_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.BatchGetProjects" ~service
      ~context ~input ~output_deserializer:Json_deserializers.batch_get_projects_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_projects_input) =
    let input = Json_serializers.batch_get_projects_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.BatchGetProjects" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_projects_output_of_yojson
      ~error_deserializer
end

module BatchGetFleets = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_fleets_input) =
    let input = Json_serializers.batch_get_fleets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.BatchGetFleets" ~service
      ~context ~input ~output_deserializer:Json_deserializers.batch_get_fleets_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_fleets_input) =
    let input = Json_serializers.batch_get_fleets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.BatchGetFleets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_fleets_output_of_yojson ~error_deserializer
end

module BatchGetCommandExecutions = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_command_executions_input) =
    let input = Json_serializers.batch_get_command_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.BatchGetCommandExecutions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_command_executions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_command_executions_input) =
    let input = Json_serializers.batch_get_command_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.BatchGetCommandExecutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_command_executions_output_of_yojson
      ~error_deserializer
end

module BatchGetBuilds = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_builds_input) =
    let input = Json_serializers.batch_get_builds_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.BatchGetBuilds" ~service
      ~context ~input ~output_deserializer:Json_deserializers.batch_get_builds_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_builds_input) =
    let input = Json_serializers.batch_get_builds_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.BatchGetBuilds" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_builds_output_of_yojson ~error_deserializer
end

module BatchGetBuildBatches = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_build_batches_input) =
    let input = Json_serializers.batch_get_build_batches_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.BatchGetBuildBatches"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_build_batches_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_build_batches_input) =
    let input = Json_serializers.batch_get_build_batches_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.BatchGetBuildBatches" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_build_batches_output_of_yojson
      ~error_deserializer
end

module BatchDeleteBuilds = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.codebuild#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_delete_builds_input) =
    let input = Json_serializers.batch_delete_builds_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeBuild_20161006.BatchDeleteBuilds" ~service
      ~context ~input ~output_deserializer:Json_deserializers.batch_delete_builds_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_delete_builds_input) =
    let input = Json_serializers.batch_delete_builds_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeBuild_20161006.BatchDeleteBuilds" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_builds_output_of_yojson
      ~error_deserializer
end
