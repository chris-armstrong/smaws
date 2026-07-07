open Types
open Service_metadata

module AddAttachmentsToSet = struct
  let error_to_string = function
    | `AttachmentLimitExceeded _ -> "com.amazonaws.support#AttachmentLimitExceeded"
    | `AttachmentSetExpired _ -> "com.amazonaws.support#AttachmentSetExpired"
    | `AttachmentSetIdNotFound _ -> "com.amazonaws.support#AttachmentSetIdNotFound"
    | `AttachmentSetSizeLimitExceeded _ -> "com.amazonaws.support#AttachmentSetSizeLimitExceeded"
    | `InternalServerError _ -> "com.amazonaws.support#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AttachmentLimitExceeded" ->
          `AttachmentLimitExceeded
            (Json_deserializers.attachment_limit_exceeded_of_yojson tree path)
      | _, "AttachmentSetExpired" ->
          `AttachmentSetExpired (Json_deserializers.attachment_set_expired_of_yojson tree path)
      | _, "AttachmentSetIdNotFound" ->
          `AttachmentSetIdNotFound
            (Json_deserializers.attachment_set_id_not_found_of_yojson tree path)
      | _, "AttachmentSetSizeLimitExceeded" ->
          `AttachmentSetSizeLimitExceeded
            (Json_deserializers.attachment_set_size_limit_exceeded_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_attachments_to_set_request) =
    let input = Json_serializers.add_attachments_to_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSupport_20130415.AddAttachmentsToSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_attachments_to_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_attachments_to_set_request) =
    let input = Json_serializers.add_attachments_to_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSupport_20130415.AddAttachmentsToSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_attachments_to_set_response_of_yojson
      ~error_deserializer
end

module AddCommunicationToCase = struct
  let error_to_string = function
    | `AttachmentSetExpired _ -> "com.amazonaws.support#AttachmentSetExpired"
    | `AttachmentSetIdNotFound _ -> "com.amazonaws.support#AttachmentSetIdNotFound"
    | `CaseIdNotFound _ -> "com.amazonaws.support#CaseIdNotFound"
    | `InternalServerError _ -> "com.amazonaws.support#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AttachmentSetExpired" ->
          `AttachmentSetExpired (Json_deserializers.attachment_set_expired_of_yojson tree path)
      | _, "AttachmentSetIdNotFound" ->
          `AttachmentSetIdNotFound
            (Json_deserializers.attachment_set_id_not_found_of_yojson tree path)
      | _, "CaseIdNotFound" ->
          `CaseIdNotFound (Json_deserializers.case_id_not_found_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_communication_to_case_request) =
    let input = Json_serializers.add_communication_to_case_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSupport_20130415.AddCommunicationToCase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_communication_to_case_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_communication_to_case_request) =
    let input = Json_serializers.add_communication_to_case_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSupport_20130415.AddCommunicationToCase" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_communication_to_case_response_of_yojson
      ~error_deserializer
end

module CreateCase = struct
  let error_to_string = function
    | `AttachmentSetExpired _ -> "com.amazonaws.support#AttachmentSetExpired"
    | `AttachmentSetIdNotFound _ -> "com.amazonaws.support#AttachmentSetIdNotFound"
    | `CaseCreationLimitExceeded _ -> "com.amazonaws.support#CaseCreationLimitExceeded"
    | `InternalServerError _ -> "com.amazonaws.support#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AttachmentSetExpired" ->
          `AttachmentSetExpired (Json_deserializers.attachment_set_expired_of_yojson tree path)
      | _, "AttachmentSetIdNotFound" ->
          `AttachmentSetIdNotFound
            (Json_deserializers.attachment_set_id_not_found_of_yojson tree path)
      | _, "CaseCreationLimitExceeded" ->
          `CaseCreationLimitExceeded
            (Json_deserializers.case_creation_limit_exceeded_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_case_request) =
    let input = Json_serializers.create_case_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSupport_20130415.CreateCase" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_case_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_case_request) =
    let input = Json_serializers.create_case_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSSupport_20130415.CreateCase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_case_response_of_yojson ~error_deserializer
end

module DescribeAttachment = struct
  let error_to_string = function
    | `AttachmentIdNotFound _ -> "com.amazonaws.support#AttachmentIdNotFound"
    | `DescribeAttachmentLimitExceeded _ -> "com.amazonaws.support#DescribeAttachmentLimitExceeded"
    | `InternalServerError _ -> "com.amazonaws.support#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AttachmentIdNotFound" ->
          `AttachmentIdNotFound (Json_deserializers.attachment_id_not_found_of_yojson tree path)
      | _, "DescribeAttachmentLimitExceeded" ->
          `DescribeAttachmentLimitExceeded
            (Json_deserializers.describe_attachment_limit_exceeded_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_attachment_request) =
    let input = Json_serializers.describe_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSupport_20130415.DescribeAttachment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_attachment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_attachment_request) =
    let input = Json_serializers.describe_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSupport_20130415.DescribeAttachment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_attachment_response_of_yojson
      ~error_deserializer
end

module DescribeCases = struct
  let error_to_string = function
    | `CaseIdNotFound _ -> "com.amazonaws.support#CaseIdNotFound"
    | `InternalServerError _ -> "com.amazonaws.support#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CaseIdNotFound" ->
          `CaseIdNotFound (Json_deserializers.case_id_not_found_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_cases_request) =
    let input = Json_serializers.describe_cases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSupport_20130415.DescribeCases" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_cases_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_cases_request) =
    let input = Json_serializers.describe_cases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSupport_20130415.DescribeCases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_cases_response_of_yojson ~error_deserializer
end

module DescribeCommunications = struct
  let error_to_string = function
    | `CaseIdNotFound _ -> "com.amazonaws.support#CaseIdNotFound"
    | `InternalServerError _ -> "com.amazonaws.support#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CaseIdNotFound" ->
          `CaseIdNotFound (Json_deserializers.case_id_not_found_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_communications_request) =
    let input = Json_serializers.describe_communications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSupport_20130415.DescribeCommunications"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_communications_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_communications_request) =
    let input = Json_serializers.describe_communications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSupport_20130415.DescribeCommunications" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_communications_response_of_yojson
      ~error_deserializer
end

module DescribeCreateCaseOptions = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.support#InternalServerError"
    | `ThrottlingException _ -> "com.amazonaws.support#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_create_case_options_request) =
    let input = Json_serializers.describe_create_case_options_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSupport_20130415.DescribeCreateCaseOptions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_create_case_options_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_create_case_options_request) =
    let input = Json_serializers.describe_create_case_options_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSupport_20130415.DescribeCreateCaseOptions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_create_case_options_response_of_yojson
      ~error_deserializer
end

module DescribeServices = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.support#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_services_request) =
    let input = Json_serializers.describe_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSupport_20130415.DescribeServices" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_services_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_services_request) =
    let input = Json_serializers.describe_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSupport_20130415.DescribeServices" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_services_response_of_yojson
      ~error_deserializer
end

module DescribeSeverityLevels = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.support#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_severity_levels_request) =
    let input = Json_serializers.describe_severity_levels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSupport_20130415.DescribeSeverityLevels"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_severity_levels_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_severity_levels_request) =
    let input = Json_serializers.describe_severity_levels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSupport_20130415.DescribeSeverityLevels" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_severity_levels_response_of_yojson
      ~error_deserializer
end

module DescribeSupportedLanguages = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.support#InternalServerError"
    | `ThrottlingException _ -> "com.amazonaws.support#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_supported_languages_request) =
    let input = Json_serializers.describe_supported_languages_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSupport_20130415.DescribeSupportedLanguages"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_supported_languages_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_supported_languages_request) =
    let input = Json_serializers.describe_supported_languages_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSupport_20130415.DescribeSupportedLanguages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_supported_languages_response_of_yojson
      ~error_deserializer
end

module DescribeTrustedAdvisorCheckRefreshStatuses = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.support#InternalServerError"
    | `ThrottlingException _ -> "com.amazonaws.support#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_trusted_advisor_check_refresh_statuses_request) =
    let input =
      Json_serializers.describe_trusted_advisor_check_refresh_statuses_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSupport_20130415.DescribeTrustedAdvisorCheckRefreshStatuses" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_trusted_advisor_check_refresh_statuses_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : describe_trusted_advisor_check_refresh_statuses_request) =
    let input =
      Json_serializers.describe_trusted_advisor_check_refresh_statuses_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSupport_20130415.DescribeTrustedAdvisorCheckRefreshStatuses" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_trusted_advisor_check_refresh_statuses_response_of_yojson
      ~error_deserializer
end

module DescribeTrustedAdvisorCheckResult = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.support#InternalServerError"
    | `ThrottlingException _ -> "com.amazonaws.support#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_trusted_advisor_check_result_request) =
    let input = Json_serializers.describe_trusted_advisor_check_result_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSupport_20130415.DescribeTrustedAdvisorCheckResult" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_trusted_advisor_check_result_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_trusted_advisor_check_result_request) =
    let input = Json_serializers.describe_trusted_advisor_check_result_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSupport_20130415.DescribeTrustedAdvisorCheckResult" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_trusted_advisor_check_result_response_of_yojson
      ~error_deserializer
end

module DescribeTrustedAdvisorCheckSummaries = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.support#InternalServerError"
    | `ThrottlingException _ -> "com.amazonaws.support#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_trusted_advisor_check_summaries_request) =
    let input =
      Json_serializers.describe_trusted_advisor_check_summaries_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSupport_20130415.DescribeTrustedAdvisorCheckSummaries" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_trusted_advisor_check_summaries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_trusted_advisor_check_summaries_request) =
    let input =
      Json_serializers.describe_trusted_advisor_check_summaries_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSupport_20130415.DescribeTrustedAdvisorCheckSummaries" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_trusted_advisor_check_summaries_response_of_yojson
      ~error_deserializer
end

module DescribeTrustedAdvisorChecks = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.support#InternalServerError"
    | `ThrottlingException _ -> "com.amazonaws.support#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_trusted_advisor_checks_request) =
    let input = Json_serializers.describe_trusted_advisor_checks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSSupport_20130415.DescribeTrustedAdvisorChecks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_trusted_advisor_checks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_trusted_advisor_checks_request) =
    let input = Json_serializers.describe_trusted_advisor_checks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSupport_20130415.DescribeTrustedAdvisorChecks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_trusted_advisor_checks_response_of_yojson
      ~error_deserializer
end

module RefreshTrustedAdvisorCheck = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.support#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : refresh_trusted_advisor_check_request) =
    let input = Json_serializers.refresh_trusted_advisor_check_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSupport_20130415.RefreshTrustedAdvisorCheck"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.refresh_trusted_advisor_check_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : refresh_trusted_advisor_check_request) =
    let input = Json_serializers.refresh_trusted_advisor_check_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSSupport_20130415.RefreshTrustedAdvisorCheck" ~service ~context ~input
      ~output_deserializer:Json_deserializers.refresh_trusted_advisor_check_response_of_yojson
      ~error_deserializer
end

module ResolveCase = struct
  let error_to_string = function
    | `CaseIdNotFound _ -> "com.amazonaws.support#CaseIdNotFound"
    | `InternalServerError _ -> "com.amazonaws.support#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CaseIdNotFound" ->
          `CaseIdNotFound (Json_deserializers.case_id_not_found_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : resolve_case_request) =
    let input = Json_serializers.resolve_case_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSSupport_20130415.ResolveCase" ~service
      ~context ~input ~output_deserializer:Json_deserializers.resolve_case_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : resolve_case_request) =
    let input = Json_serializers.resolve_case_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSSupport_20130415.ResolveCase"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.resolve_case_response_of_yojson ~error_deserializer
end
