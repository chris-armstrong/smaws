open Types
open Service_metadata
open Query_deserializers
open Query_serializers

module AddPermission = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : add_permission_input) =
    let fields = add_permission_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AddPermission"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : add_permission_input) =
    let fields = add_permission_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AddPermission"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module CheckIfPhoneNumberIsOptedOut = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `ThrottledException _ -> "com.amazonaws.sns#ThrottledException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "Throttled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:throttled_exception_of_xml
        with
        | Ok s -> `ThrottledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : check_if_phone_number_is_opted_out_input) =
    let fields = check_if_phone_number_is_opted_out_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CheckIfPhoneNumberIsOptedOut"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:check_if_phone_number_is_opted_out_response_of_xml ~error_deserializer

  let request_with_metadata context (request : check_if_phone_number_is_opted_out_input) =
    let fields = check_if_phone_number_is_opted_out_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CheckIfPhoneNumberIsOptedOut"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:check_if_phone_number_is_opted_out_response_of_xml ~error_deserializer
end

module ConfirmSubscription = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `FilterPolicyLimitExceededException _ ->
        "com.amazonaws.sns#FilterPolicyLimitExceededException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | `ReplayLimitExceededException _ -> "com.amazonaws.sns#ReplayLimitExceededException"
    | `SubscriptionLimitExceededException _ ->
        "com.amazonaws.sns#SubscriptionLimitExceededException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "FilterPolicyLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:filter_policy_limit_exceeded_exception_of_xml
        with
        | Ok s -> `FilterPolicyLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplayLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replay_limit_exceeded_exception_of_xml
        with
        | Ok s -> `ReplayLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubscriptionLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subscription_limit_exceeded_exception_of_xml
        with
        | Ok s -> `SubscriptionLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : confirm_subscription_input) =
    let fields = confirm_subscription_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ConfirmSubscription"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:confirm_subscription_response_of_xml ~error_deserializer

  let request_with_metadata context (request : confirm_subscription_input) =
    let fields = confirm_subscription_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ConfirmSubscription"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:confirm_subscription_response_of_xml ~error_deserializer
end

module CreatePlatformApplication = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_platform_application_input) =
    let fields = create_platform_application_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreatePlatformApplication"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:create_platform_application_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_platform_application_input) =
    let fields = create_platform_application_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreatePlatformApplication"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:create_platform_application_response_of_xml ~error_deserializer
end

module CreatePlatformEndpoint = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_platform_endpoint_input) =
    let fields = create_platform_endpoint_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreatePlatformEndpoint"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:create_endpoint_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_platform_endpoint_input) =
    let fields = create_platform_endpoint_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreatePlatformEndpoint"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:create_endpoint_response_of_xml ~error_deserializer
end

module CreateSMSSandboxPhoneNumber = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `OptedOutException _ -> "com.amazonaws.sns#OptedOutException"
    | `ThrottledException _ -> "com.amazonaws.sns#ThrottledException"
    | `UserErrorException _ -> "com.amazonaws.sns#UserErrorException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OptedOut" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:opted_out_exception_of_xml
        with
        | Ok s -> `OptedOutException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "Throttled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:throttled_exception_of_xml
        with
        | Ok s -> `ThrottledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_error_exception_of_xml
        with
        | Ok s -> `UserErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_sms_sandbox_phone_number_input) =
    let fields = create_sms_sandbox_phone_number_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateSMSSandboxPhoneNumber"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:create_sms_sandbox_phone_number_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_sms_sandbox_phone_number_input) =
    let fields = create_sms_sandbox_phone_number_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateSMSSandboxPhoneNumber"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:create_sms_sandbox_phone_number_result_of_xml ~error_deserializer
end

module CreateTopic = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `ConcurrentAccessException _ -> "com.amazonaws.sns#ConcurrentAccessException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `InvalidSecurityException _ -> "com.amazonaws.sns#InvalidSecurityException"
    | `StaleTagException _ -> "com.amazonaws.sns#StaleTagException"
    | `TagLimitExceededException _ -> "com.amazonaws.sns#TagLimitExceededException"
    | `TagPolicyException _ -> "com.amazonaws.sns#TagPolicyException"
    | `TopicLimitExceededException _ -> "com.amazonaws.sns#TopicLimitExceededException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConcurrentAccess" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_access_exception_of_xml
        with
        | Ok s -> `ConcurrentAccessException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSecurity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_security_exception_of_xml
        with
        | Ok s -> `InvalidSecurityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StaleTag" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stale_tag_exception_of_xml
        with
        | Ok s -> `StaleTagException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_exception_of_xml
        with
        | Ok s -> `TagLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagPolicy" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_policy_exception_of_xml
        with
        | Ok s -> `TagPolicyException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TopicLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:topic_limit_exceeded_exception_of_xml
        with
        | Ok s -> `TopicLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_topic_input) =
    let fields = create_topic_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateTopic"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:create_topic_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_topic_input) =
    let fields = create_topic_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateTopic"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:create_topic_response_of_xml ~error_deserializer
end

module DeleteEndpoint = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_endpoint_input) =
    let fields = delete_endpoint_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteEndpoint"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_endpoint_input) =
    let fields = delete_endpoint_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteEndpoint"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeletePlatformApplication = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_platform_application_input) =
    let fields = delete_platform_application_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeletePlatformApplication"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_platform_application_input) =
    let fields = delete_platform_application_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeletePlatformApplication"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteSMSSandboxPhoneNumber = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.sns#ResourceNotFoundException"
    | `ThrottledException _ -> "com.amazonaws.sns#ThrottledException"
    | `UserErrorException _ -> "com.amazonaws.sns#UserErrorException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "Throttled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:throttled_exception_of_xml
        with
        | Ok s -> `ThrottledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UserError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:user_error_exception_of_xml
        with
        | Ok s -> `UserErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_sms_sandbox_phone_number_input) =
    let fields = delete_sms_sandbox_phone_number_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteSMSSandboxPhoneNumber"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:delete_sms_sandbox_phone_number_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_sms_sandbox_phone_number_input) =
    let fields = delete_sms_sandbox_phone_number_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteSMSSandboxPhoneNumber"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:delete_sms_sandbox_phone_number_result_of_xml ~error_deserializer
end

module DeleteTopic = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `ConcurrentAccessException _ -> "com.amazonaws.sns#ConcurrentAccessException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `InvalidStateException _ -> "com.amazonaws.sns#InvalidStateException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | `StaleTagException _ -> "com.amazonaws.sns#StaleTagException"
    | `TagPolicyException _ -> "com.amazonaws.sns#TagPolicyException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConcurrentAccess" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_access_exception_of_xml
        with
        | Ok s -> `ConcurrentAccessException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_state_exception_of_xml
        with
        | Ok s -> `InvalidStateException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StaleTag" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stale_tag_exception_of_xml
        with
        | Ok s -> `StaleTagException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagPolicy" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_policy_exception_of_xml
        with
        | Ok s -> `TagPolicyException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_topic_input) =
    let fields = delete_topic_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteTopic"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_topic_input) =
    let fields = delete_topic_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteTopic"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module GetDataProtectionPolicy = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `InvalidSecurityException _ -> "com.amazonaws.sns#InvalidSecurityException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSecurity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_security_exception_of_xml
        with
        | Ok s -> `InvalidSecurityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_data_protection_policy_input) =
    let fields = get_data_protection_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetDataProtectionPolicy"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:get_data_protection_policy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_data_protection_policy_input) =
    let fields = get_data_protection_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetDataProtectionPolicy"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:get_data_protection_policy_response_of_xml ~error_deserializer
end

module GetEndpointAttributes = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_endpoint_attributes_input) =
    let fields = get_endpoint_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetEndpointAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:get_endpoint_attributes_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_endpoint_attributes_input) =
    let fields = get_endpoint_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetEndpointAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:get_endpoint_attributes_response_of_xml ~error_deserializer
end

module GetPlatformApplicationAttributes = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_platform_application_attributes_input) =
    let fields = get_platform_application_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetPlatformApplicationAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:get_platform_application_attributes_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_platform_application_attributes_input) =
    let fields = get_platform_application_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetPlatformApplicationAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:get_platform_application_attributes_response_of_xml ~error_deserializer
end

module GetSMSAttributes = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `ThrottledException _ -> "com.amazonaws.sns#ThrottledException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "Throttled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:throttled_exception_of_xml
        with
        | Ok s -> `ThrottledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_sms_attributes_input) =
    let fields = get_sms_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetSMSAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:get_sms_attributes_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_sms_attributes_input) =
    let fields = get_sms_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetSMSAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:get_sms_attributes_response_of_xml ~error_deserializer
end

module GetSMSSandboxAccountStatus = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `ThrottledException _ -> "com.amazonaws.sns#ThrottledException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "Throttled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:throttled_exception_of_xml
        with
        | Ok s -> `ThrottledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_sms_sandbox_account_status_input) =
    let fields = get_sms_sandbox_account_status_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetSMSSandboxAccountStatus"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:get_sms_sandbox_account_status_result_of_xml ~error_deserializer

  let request_with_metadata context (request : get_sms_sandbox_account_status_input) =
    let fields = get_sms_sandbox_account_status_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetSMSSandboxAccountStatus"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:get_sms_sandbox_account_status_result_of_xml ~error_deserializer
end

module GetSubscriptionAttributes = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_subscription_attributes_input) =
    let fields = get_subscription_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetSubscriptionAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:get_subscription_attributes_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_subscription_attributes_input) =
    let fields = get_subscription_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetSubscriptionAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:get_subscription_attributes_response_of_xml ~error_deserializer
end

module GetTopicAttributes = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `InvalidSecurityException _ -> "com.amazonaws.sns#InvalidSecurityException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSecurity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_security_exception_of_xml
        with
        | Ok s -> `InvalidSecurityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_topic_attributes_input) =
    let fields = get_topic_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetTopicAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:get_topic_attributes_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_topic_attributes_input) =
    let fields = get_topic_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetTopicAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:get_topic_attributes_response_of_xml ~error_deserializer
end

module ListEndpointsByPlatformApplication = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_endpoints_by_platform_application_input) =
    let fields = list_endpoints_by_platform_application_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListEndpointsByPlatformApplication"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_endpoints_by_platform_application_response_of_xml
      ~error_deserializer

  let request_with_metadata context (request : list_endpoints_by_platform_application_input) =
    let fields = list_endpoints_by_platform_application_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListEndpointsByPlatformApplication"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_endpoints_by_platform_application_response_of_xml
      ~error_deserializer
end

module ListOriginationNumbers = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `ThrottledException _ -> "com.amazonaws.sns#ThrottledException"
    | `ValidationException _ -> "com.amazonaws.sns#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "Throttled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:throttled_exception_of_xml
        with
        | Ok s -> `ThrottledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_origination_numbers_request) =
    let fields = list_origination_numbers_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListOriginationNumbers"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_origination_numbers_result_of_xml ~error_deserializer

  let request_with_metadata context (request : list_origination_numbers_request) =
    let fields = list_origination_numbers_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListOriginationNumbers"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_origination_numbers_result_of_xml ~error_deserializer
end

module ListPhoneNumbersOptedOut = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `ThrottledException _ -> "com.amazonaws.sns#ThrottledException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "Throttled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:throttled_exception_of_xml
        with
        | Ok s -> `ThrottledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_phone_numbers_opted_out_input) =
    let fields = list_phone_numbers_opted_out_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListPhoneNumbersOptedOut"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_phone_numbers_opted_out_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_phone_numbers_opted_out_input) =
    let fields = list_phone_numbers_opted_out_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListPhoneNumbersOptedOut"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_phone_numbers_opted_out_response_of_xml ~error_deserializer
end

module ListPlatformApplications = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_platform_applications_input) =
    let fields = list_platform_applications_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListPlatformApplications"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_platform_applications_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_platform_applications_input) =
    let fields = list_platform_applications_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListPlatformApplications"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_platform_applications_response_of_xml ~error_deserializer
end

module ListSMSSandboxPhoneNumbers = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.sns#ResourceNotFoundException"
    | `ThrottledException _ -> "com.amazonaws.sns#ThrottledException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "Throttled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:throttled_exception_of_xml
        with
        | Ok s -> `ThrottledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_sms_sandbox_phone_numbers_input) =
    let fields = list_sms_sandbox_phone_numbers_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListSMSSandboxPhoneNumbers"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_sms_sandbox_phone_numbers_result_of_xml ~error_deserializer

  let request_with_metadata context (request : list_sms_sandbox_phone_numbers_input) =
    let fields = list_sms_sandbox_phone_numbers_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListSMSSandboxPhoneNumbers"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_sms_sandbox_phone_numbers_result_of_xml ~error_deserializer
end

module ListSubscriptions = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_subscriptions_input) =
    let fields = list_subscriptions_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListSubscriptions"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_subscriptions_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_subscriptions_input) =
    let fields = list_subscriptions_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListSubscriptions"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_subscriptions_response_of_xml ~error_deserializer
end

module ListSubscriptionsByTopic = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_subscriptions_by_topic_input) =
    let fields = list_subscriptions_by_topic_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListSubscriptionsByTopic"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_subscriptions_by_topic_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_subscriptions_by_topic_input) =
    let fields = list_subscriptions_by_topic_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListSubscriptionsByTopic"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_subscriptions_by_topic_response_of_xml ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `ConcurrentAccessException _ -> "com.amazonaws.sns#ConcurrentAccessException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.sns#ResourceNotFoundException"
    | `TagPolicyException _ -> "com.amazonaws.sns#TagPolicyException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConcurrentAccess" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_access_exception_of_xml
        with
        | Ok s -> `ConcurrentAccessException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagPolicy" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_policy_exception_of_xml
        with
        | Ok s -> `TagPolicyException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_tags_for_resource_request) =
    let fields = list_tags_for_resource_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListTagsForResource"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_tags_for_resource_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let fields = list_tags_for_resource_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListTagsForResource"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_tags_for_resource_response_of_xml ~error_deserializer
end

module ListTopics = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_topics_input) =
    let fields = list_topics_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListTopics"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_topics_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_topics_input) =
    let fields = list_topics_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListTopics"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:list_topics_response_of_xml ~error_deserializer
end

module OptInPhoneNumber = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `ThrottledException _ -> "com.amazonaws.sns#ThrottledException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "Throttled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:throttled_exception_of_xml
        with
        | Ok s -> `ThrottledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : opt_in_phone_number_input) =
    let fields = opt_in_phone_number_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"OptInPhoneNumber"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:opt_in_phone_number_response_of_xml ~error_deserializer

  let request_with_metadata context (request : opt_in_phone_number_input) =
    let fields = opt_in_phone_number_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"OptInPhoneNumber"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:opt_in_phone_number_response_of_xml ~error_deserializer
end

module Publish = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `EndpointDisabledException _ -> "com.amazonaws.sns#EndpointDisabledException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `InvalidParameterValueException _ -> "com.amazonaws.sns#InvalidParameterValueException"
    | `InvalidSecurityException _ -> "com.amazonaws.sns#InvalidSecurityException"
    | `KMSAccessDeniedException _ -> "com.amazonaws.sns#KMSAccessDeniedException"
    | `KMSDisabledException _ -> "com.amazonaws.sns#KMSDisabledException"
    | `KMSInvalidStateException _ -> "com.amazonaws.sns#KMSInvalidStateException"
    | `KMSNotFoundException _ -> "com.amazonaws.sns#KMSNotFoundException"
    | `KMSOptInRequired _ -> "com.amazonaws.sns#KMSOptInRequired"
    | `KMSThrottlingException _ -> "com.amazonaws.sns#KMSThrottlingException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | `PlatformApplicationDisabledException _ ->
        "com.amazonaws.sns#PlatformApplicationDisabledException"
    | `ValidationException _ -> "com.amazonaws.sns#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EndpointDisabled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:endpoint_disabled_exception_of_xml
        with
        | Ok s -> `EndpointDisabledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ParameterValueInvalid" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSecurity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_security_exception_of_xml
        with
        | Ok s -> `InvalidSecurityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSAccessDenied" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_access_denied_exception_of_xml
        with
        | Ok s -> `KMSAccessDeniedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSDisabled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_disabled_exception_of_xml
        with
        | Ok s -> `KMSDisabledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSInvalidState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_invalid_state_exception_of_xml
        with
        | Ok s -> `KMSInvalidStateException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_not_found_exception_of_xml
        with
        | Ok s -> `KMSNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSOptInRequired" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_opt_in_required_of_xml
        with
        | Ok s -> `KMSOptInRequired s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSThrottling" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_throttling_exception_of_xml
        with
        | Ok s -> `KMSThrottlingException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PlatformApplicationDisabled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:platform_application_disabled_exception_of_xml
        with
        | Ok s -> `PlatformApplicationDisabledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : publish_input) =
    let fields = publish_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"Publish"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:publish_response_of_xml ~error_deserializer

  let request_with_metadata context (request : publish_input) =
    let fields = publish_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"Publish"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:publish_response_of_xml ~error_deserializer
end

module PublishBatch = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `BatchEntryIdsNotDistinctException _ -> "com.amazonaws.sns#BatchEntryIdsNotDistinctException"
    | `BatchRequestTooLongException _ -> "com.amazonaws.sns#BatchRequestTooLongException"
    | `EmptyBatchRequestException _ -> "com.amazonaws.sns#EmptyBatchRequestException"
    | `EndpointDisabledException _ -> "com.amazonaws.sns#EndpointDisabledException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidBatchEntryIdException _ -> "com.amazonaws.sns#InvalidBatchEntryIdException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `InvalidParameterValueException _ -> "com.amazonaws.sns#InvalidParameterValueException"
    | `InvalidSecurityException _ -> "com.amazonaws.sns#InvalidSecurityException"
    | `KMSAccessDeniedException _ -> "com.amazonaws.sns#KMSAccessDeniedException"
    | `KMSDisabledException _ -> "com.amazonaws.sns#KMSDisabledException"
    | `KMSInvalidStateException _ -> "com.amazonaws.sns#KMSInvalidStateException"
    | `KMSNotFoundException _ -> "com.amazonaws.sns#KMSNotFoundException"
    | `KMSOptInRequired _ -> "com.amazonaws.sns#KMSOptInRequired"
    | `KMSThrottlingException _ -> "com.amazonaws.sns#KMSThrottlingException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | `PlatformApplicationDisabledException _ ->
        "com.amazonaws.sns#PlatformApplicationDisabledException"
    | `TooManyEntriesInBatchRequestException _ ->
        "com.amazonaws.sns#TooManyEntriesInBatchRequestException"
    | `ValidationException _ -> "com.amazonaws.sns#ValidationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "BatchEntryIdsNotDistinct" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:batch_entry_ids_not_distinct_exception_of_xml
        with
        | Ok s -> `BatchEntryIdsNotDistinctException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "BatchRequestTooLong" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:batch_request_too_long_exception_of_xml
        with
        | Ok s -> `BatchRequestTooLongException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EmptyBatchRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:empty_batch_request_exception_of_xml
        with
        | Ok s -> `EmptyBatchRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EndpointDisabled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:endpoint_disabled_exception_of_xml
        with
        | Ok s -> `EndpointDisabledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidBatchEntryId" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_batch_entry_id_exception_of_xml
        with
        | Ok s -> `InvalidBatchEntryIdException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ParameterValueInvalid" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSecurity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_security_exception_of_xml
        with
        | Ok s -> `InvalidSecurityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSAccessDenied" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_access_denied_exception_of_xml
        with
        | Ok s -> `KMSAccessDeniedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSDisabled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_disabled_exception_of_xml
        with
        | Ok s -> `KMSDisabledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSInvalidState" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_invalid_state_exception_of_xml
        with
        | Ok s -> `KMSInvalidStateException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_not_found_exception_of_xml
        with
        | Ok s -> `KMSNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSOptInRequired" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_opt_in_required_of_xml
        with
        | Ok s -> `KMSOptInRequired s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KMSThrottling" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_throttling_exception_of_xml
        with
        | Ok s -> `KMSThrottlingException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PlatformApplicationDisabled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:platform_application_disabled_exception_of_xml
        with
        | Ok s -> `PlatformApplicationDisabledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyEntriesInBatchRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_entries_in_batch_request_exception_of_xml
        with
        | Ok s -> `TooManyEntriesInBatchRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ValidationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:validation_exception_of_xml
        with
        | Ok s -> `ValidationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : publish_batch_input) =
    let fields = publish_batch_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PublishBatch"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:publish_batch_response_of_xml ~error_deserializer

  let request_with_metadata context (request : publish_batch_input) =
    let fields = publish_batch_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PublishBatch"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:publish_batch_response_of_xml ~error_deserializer
end

module PutDataProtectionPolicy = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `InvalidSecurityException _ -> "com.amazonaws.sns#InvalidSecurityException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSecurity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_security_exception_of_xml
        with
        | Ok s -> `InvalidSecurityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_data_protection_policy_input) =
    let fields = put_data_protection_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutDataProtectionPolicy"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : put_data_protection_policy_input) =
    let fields = put_data_protection_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutDataProtectionPolicy"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module RemovePermission = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : remove_permission_input) =
    let fields = remove_permission_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RemovePermission"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : remove_permission_input) =
    let fields = remove_permission_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RemovePermission"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module SetEndpointAttributes = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_endpoint_attributes_input) =
    let fields = set_endpoint_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetEndpointAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : set_endpoint_attributes_input) =
    let fields = set_endpoint_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetEndpointAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module SetPlatformApplicationAttributes = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_platform_application_attributes_input) =
    let fields = set_platform_application_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetPlatformApplicationAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : set_platform_application_attributes_input) =
    let fields = set_platform_application_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetPlatformApplicationAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module SetSMSAttributes = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `ThrottledException _ -> "com.amazonaws.sns#ThrottledException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "Throttled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:throttled_exception_of_xml
        with
        | Ok s -> `ThrottledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_sms_attributes_input) =
    let fields = set_sms_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetSMSAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:set_sms_attributes_response_of_xml ~error_deserializer

  let request_with_metadata context (request : set_sms_attributes_input) =
    let fields = set_sms_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetSMSAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:set_sms_attributes_response_of_xml ~error_deserializer
end

module SetSubscriptionAttributes = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `FilterPolicyLimitExceededException _ ->
        "com.amazonaws.sns#FilterPolicyLimitExceededException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | `ReplayLimitExceededException _ -> "com.amazonaws.sns#ReplayLimitExceededException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "FilterPolicyLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:filter_policy_limit_exceeded_exception_of_xml
        with
        | Ok s -> `FilterPolicyLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplayLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replay_limit_exceeded_exception_of_xml
        with
        | Ok s -> `ReplayLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_subscription_attributes_input) =
    let fields = set_subscription_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetSubscriptionAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : set_subscription_attributes_input) =
    let fields = set_subscription_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetSubscriptionAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module SetTopicAttributes = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `InvalidSecurityException _ -> "com.amazonaws.sns#InvalidSecurityException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSecurity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_security_exception_of_xml
        with
        | Ok s -> `InvalidSecurityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_topic_attributes_input) =
    let fields = set_topic_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetTopicAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : set_topic_attributes_input) =
    let fields = set_topic_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetTopicAttributes"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module Subscribe = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `FilterPolicyLimitExceededException _ ->
        "com.amazonaws.sns#FilterPolicyLimitExceededException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `InvalidSecurityException _ -> "com.amazonaws.sns#InvalidSecurityException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | `ReplayLimitExceededException _ -> "com.amazonaws.sns#ReplayLimitExceededException"
    | `SubscriptionLimitExceededException _ ->
        "com.amazonaws.sns#SubscriptionLimitExceededException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "FilterPolicyLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:filter_policy_limit_exceeded_exception_of_xml
        with
        | Ok s -> `FilterPolicyLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSecurity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_security_exception_of_xml
        with
        | Ok s -> `InvalidSecurityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReplayLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:replay_limit_exceeded_exception_of_xml
        with
        | Ok s -> `ReplayLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubscriptionLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subscription_limit_exceeded_exception_of_xml
        with
        | Ok s -> `SubscriptionLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : subscribe_input) =
    let fields = subscribe_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"Subscribe"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:subscribe_response_of_xml ~error_deserializer

  let request_with_metadata context (request : subscribe_input) =
    let fields = subscribe_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"Subscribe"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:subscribe_response_of_xml ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `ConcurrentAccessException _ -> "com.amazonaws.sns#ConcurrentAccessException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.sns#ResourceNotFoundException"
    | `StaleTagException _ -> "com.amazonaws.sns#StaleTagException"
    | `TagLimitExceededException _ -> "com.amazonaws.sns#TagLimitExceededException"
    | `TagPolicyException _ -> "com.amazonaws.sns#TagPolicyException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConcurrentAccess" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_access_exception_of_xml
        with
        | Ok s -> `ConcurrentAccessException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StaleTag" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stale_tag_exception_of_xml
        with
        | Ok s -> `StaleTagException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_exception_of_xml
        with
        | Ok s -> `TagLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagPolicy" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_policy_exception_of_xml
        with
        | Ok s -> `TagPolicyException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : tag_resource_request) =
    let fields = tag_resource_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"TagResource"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:tag_resource_response_of_xml ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let fields = tag_resource_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"TagResource"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:tag_resource_response_of_xml ~error_deserializer
end

module Unsubscribe = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `InvalidSecurityException _ -> "com.amazonaws.sns#InvalidSecurityException"
    | `NotFoundException _ -> "com.amazonaws.sns#NotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSecurity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_security_exception_of_xml
        with
        | Ok s -> `InvalidSecurityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:not_found_exception_of_xml
        with
        | Ok s -> `NotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : unsubscribe_input) =
    let fields = unsubscribe_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"Unsubscribe"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : unsubscribe_input) =
    let fields = unsubscribe_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"Unsubscribe"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `ConcurrentAccessException _ -> "com.amazonaws.sns#ConcurrentAccessException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.sns#ResourceNotFoundException"
    | `StaleTagException _ -> "com.amazonaws.sns#StaleTagException"
    | `TagLimitExceededException _ -> "com.amazonaws.sns#TagLimitExceededException"
    | `TagPolicyException _ -> "com.amazonaws.sns#TagPolicyException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConcurrentAccess" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_access_exception_of_xml
        with
        | Ok s -> `ConcurrentAccessException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StaleTag" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stale_tag_exception_of_xml
        with
        | Ok s -> `StaleTagException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_limit_exceeded_exception_of_xml
        with
        | Ok s -> `TagLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TagPolicy" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tag_policy_exception_of_xml
        with
        | Ok s -> `TagPolicyException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : untag_resource_request) =
    let fields = untag_resource_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UntagResource"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:untag_resource_response_of_xml ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let fields = untag_resource_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UntagResource"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:untag_resource_response_of_xml ~error_deserializer
end

module VerifySMSSandboxPhoneNumber = struct
  let error_to_string = function
    | `AuthorizationErrorException _ -> "com.amazonaws.sns#AuthorizationErrorException"
    | `InternalErrorException _ -> "com.amazonaws.sns#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.sns#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.sns#ResourceNotFoundException"
    | `ThrottledException _ -> "com.amazonaws.sns#ThrottledException"
    | `VerificationException _ -> "com.amazonaws.sns#VerificationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AuthorizationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:authorization_error_exception_of_xml
        with
        | Ok s -> `AuthorizationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_error_exception_of_xml
        with
        | Ok s -> `InternalErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_exception_of_xml
        with
        | Ok s -> `InvalidParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "Throttled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:throttled_exception_of_xml
        with
        | Ok s -> `ThrottledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "VerificationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:verification_exception_of_xml
        with
        | Ok s -> `VerificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : verify_sms_sandbox_phone_number_input) =
    let fields = verify_sms_sandbox_phone_number_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"VerifySMSSandboxPhoneNumber"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:verify_sms_sandbox_phone_number_result_of_xml ~error_deserializer

  let request_with_metadata context (request : verify_sms_sandbox_phone_number_input) =
    let fields = verify_sms_sandbox_phone_number_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"VerifySMSSandboxPhoneNumber"
      ~xmlNamespace:"http://sns.amazonaws.com/doc/2010-03-31/" ~service ~context ~fields
      ~output_deserializer:verify_sms_sandbox_phone_number_result_of_xml ~error_deserializer
end
