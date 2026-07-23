open Types
open Service_metadata
open Query_deserializers
open Query_serializers

module TestRenderTemplate = struct
  let error_to_string = function
    | `InvalidRenderingParameterException _ ->
        "com.amazonaws.ses#InvalidRenderingParameterException"
    | `MissingRenderingAttributeException _ ->
        "com.amazonaws.ses#MissingRenderingAttributeException"
    | `TemplateDoesNotExistException _ -> "com.amazonaws.ses#TemplateDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidRenderingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_rendering_parameter_exception_of_xml
        with
        | Ok s -> `InvalidRenderingParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingRenderingAttribute" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_rendering_attribute_exception_of_xml
        with
        | Ok s -> `MissingRenderingAttributeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TemplateDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:template_does_not_exist_exception_of_xml
        with
        | Ok s -> `TemplateDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : test_render_template_request) =
    let fields = test_render_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"TestRenderTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:test_render_template_response_of_xml ~error_deserializer

  let request_with_metadata context (request : test_render_template_request) =
    let fields = test_render_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"TestRenderTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:test_render_template_response_of_xml ~error_deserializer
end

module UpdateAccountSendingEnabled = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_account_sending_enabled_request) =
    let fields = update_account_sending_enabled_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateAccountSendingEnabled"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : update_account_sending_enabled_request) =
    let fields = update_account_sending_enabled_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateAccountSendingEnabled"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UpdateConfigurationSetEventDestination = struct
  let error_to_string = function
    | `ConfigurationSetDoesNotExistException _ ->
        "com.amazonaws.ses#ConfigurationSetDoesNotExistException"
    | `EventDestinationDoesNotExistException _ ->
        "com.amazonaws.ses#EventDestinationDoesNotExistException"
    | `InvalidCloudWatchDestinationException _ ->
        "com.amazonaws.ses#InvalidCloudWatchDestinationException"
    | `InvalidFirehoseDestinationException _ ->
        "com.amazonaws.ses#InvalidFirehoseDestinationException"
    | `InvalidSNSDestinationException _ -> "com.amazonaws.ses#InvalidSNSDestinationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConfigurationSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `ConfigurationSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EventDestinationDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:event_destination_does_not_exist_exception_of_xml
        with
        | Ok s -> `EventDestinationDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCloudWatchDestination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cloud_watch_destination_exception_of_xml
        with
        | Ok s -> `InvalidCloudWatchDestinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidFirehoseDestination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_firehose_destination_exception_of_xml
        with
        | Ok s -> `InvalidFirehoseDestinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSNSDestination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_sns_destination_exception_of_xml
        with
        | Ok s -> `InvalidSNSDestinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_configuration_set_event_destination_request) =
    let fields = update_configuration_set_event_destination_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateConfigurationSetEventDestination"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:update_configuration_set_event_destination_response_of_xml
      ~error_deserializer

  let request_with_metadata context (request : update_configuration_set_event_destination_request) =
    let fields = update_configuration_set_event_destination_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"UpdateConfigurationSetEventDestination"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:update_configuration_set_event_destination_response_of_xml
      ~error_deserializer
end

module UpdateConfigurationSetReputationMetricsEnabled = struct
  let error_to_string = function
    | `ConfigurationSetDoesNotExistException _ ->
        "com.amazonaws.ses#ConfigurationSetDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConfigurationSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `ConfigurationSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_configuration_set_reputation_metrics_enabled_request) =
    let fields = update_configuration_set_reputation_metrics_enabled_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateConfigurationSetReputationMetricsEnabled"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context
      (request : update_configuration_set_reputation_metrics_enabled_request) =
    let fields = update_configuration_set_reputation_metrics_enabled_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"UpdateConfigurationSetReputationMetricsEnabled"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UpdateConfigurationSetSendingEnabled = struct
  let error_to_string = function
    | `ConfigurationSetDoesNotExistException _ ->
        "com.amazonaws.ses#ConfigurationSetDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConfigurationSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `ConfigurationSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_configuration_set_sending_enabled_request) =
    let fields = update_configuration_set_sending_enabled_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateConfigurationSetSendingEnabled"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : update_configuration_set_sending_enabled_request) =
    let fields = update_configuration_set_sending_enabled_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"UpdateConfigurationSetSendingEnabled"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UpdateConfigurationSetTrackingOptions = struct
  let error_to_string = function
    | `ConfigurationSetDoesNotExistException _ ->
        "com.amazonaws.ses#ConfigurationSetDoesNotExistException"
    | `InvalidTrackingOptionsException _ -> "com.amazonaws.ses#InvalidTrackingOptionsException"
    | `TrackingOptionsDoesNotExistException _ ->
        "com.amazonaws.ses#TrackingOptionsDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConfigurationSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `ConfigurationSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTrackingOptions" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tracking_options_exception_of_xml
        with
        | Ok s -> `InvalidTrackingOptionsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrackingOptionsDoesNotExistException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tracking_options_does_not_exist_exception_of_xml
        with
        | Ok s -> `TrackingOptionsDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_configuration_set_tracking_options_request) =
    let fields = update_configuration_set_tracking_options_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateConfigurationSetTrackingOptions"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:update_configuration_set_tracking_options_response_of_xml
      ~error_deserializer

  let request_with_metadata context (request : update_configuration_set_tracking_options_request) =
    let fields = update_configuration_set_tracking_options_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"UpdateConfigurationSetTrackingOptions"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:update_configuration_set_tracking_options_response_of_xml
      ~error_deserializer
end

module UpdateCustomVerificationEmailTemplate = struct
  let error_to_string = function
    | `CustomVerificationEmailInvalidContentException _ ->
        "com.amazonaws.ses#CustomVerificationEmailInvalidContentException"
    | `CustomVerificationEmailTemplateDoesNotExistException _ ->
        "com.amazonaws.ses#CustomVerificationEmailTemplateDoesNotExistException"
    | `FromEmailAddressNotVerifiedException _ ->
        "com.amazonaws.ses#FromEmailAddressNotVerifiedException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CustomVerificationEmailInvalidContent" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_verification_email_invalid_content_exception_of_xml
        with
        | Ok s -> `CustomVerificationEmailInvalidContentException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CustomVerificationEmailTemplateDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_verification_email_template_does_not_exist_exception_of_xml
        with
        | Ok s -> `CustomVerificationEmailTemplateDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "FromEmailAddressNotVerified" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:from_email_address_not_verified_exception_of_xml
        with
        | Ok s -> `FromEmailAddressNotVerifiedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_custom_verification_email_template_request) =
    let fields = update_custom_verification_email_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateCustomVerificationEmailTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : update_custom_verification_email_template_request) =
    let fields = update_custom_verification_email_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"UpdateCustomVerificationEmailTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UpdateReceiptRule = struct
  let error_to_string = function
    | `InvalidLambdaFunctionException _ -> "com.amazonaws.ses#InvalidLambdaFunctionException"
    | `InvalidS3ConfigurationException _ -> "com.amazonaws.ses#InvalidS3ConfigurationException"
    | `InvalidSnsTopicException _ -> "com.amazonaws.ses#InvalidSnsTopicException"
    | `LimitExceededException _ -> "com.amazonaws.ses#LimitExceededException"
    | `RuleDoesNotExistException _ -> "com.amazonaws.ses#RuleDoesNotExistException"
    | `RuleSetDoesNotExistException _ -> "com.amazonaws.ses#RuleSetDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidLambdaFunction" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_lambda_function_exception_of_xml
        with
        | Ok s -> `InvalidLambdaFunctionException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidS3Configuration" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_s3_configuration_exception_of_xml
        with
        | Ok s -> `InvalidS3ConfigurationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSnsTopic" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_sns_topic_exception_of_xml
        with
        | Ok s -> `InvalidSnsTopicException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RuleDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_does_not_exist_exception_of_xml
        with
        | Ok s -> `RuleDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RuleSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `RuleSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_receipt_rule_request) =
    let fields = update_receipt_rule_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateReceiptRule"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:update_receipt_rule_response_of_xml ~error_deserializer

  let request_with_metadata context (request : update_receipt_rule_request) =
    let fields = update_receipt_rule_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateReceiptRule"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:update_receipt_rule_response_of_xml ~error_deserializer
end

module UpdateTemplate = struct
  let error_to_string = function
    | `InvalidTemplateException _ -> "com.amazonaws.ses#InvalidTemplateException"
    | `TemplateDoesNotExistException _ -> "com.amazonaws.ses#TemplateDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidTemplate" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_template_exception_of_xml
        with
        | Ok s -> `InvalidTemplateException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TemplateDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:template_does_not_exist_exception_of_xml
        with
        | Ok s -> `TemplateDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_template_request) =
    let fields = update_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:update_template_response_of_xml ~error_deserializer

  let request_with_metadata context (request : update_template_request) =
    let fields = update_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:update_template_response_of_xml ~error_deserializer
end

module VerifyDomainDkim = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : verify_domain_dkim_request) =
    let fields = verify_domain_dkim_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"VerifyDomainDkim"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:verify_domain_dkim_response_of_xml ~error_deserializer

  let request_with_metadata context (request : verify_domain_dkim_request) =
    let fields = verify_domain_dkim_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"VerifyDomainDkim"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:verify_domain_dkim_response_of_xml ~error_deserializer
end

module VerifyDomainIdentity = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : verify_domain_identity_request) =
    let fields = verify_domain_identity_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"VerifyDomainIdentity"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:verify_domain_identity_response_of_xml ~error_deserializer

  let request_with_metadata context (request : verify_domain_identity_request) =
    let fields = verify_domain_identity_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"VerifyDomainIdentity"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:verify_domain_identity_response_of_xml ~error_deserializer
end

module VerifyEmailAddress = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : verify_email_address_request) =
    let fields = verify_email_address_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"VerifyEmailAddress"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : verify_email_address_request) =
    let fields = verify_email_address_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"VerifyEmailAddress"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module VerifyEmailIdentity = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : verify_email_identity_request) =
    let fields = verify_email_identity_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"VerifyEmailIdentity"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:verify_email_identity_response_of_xml ~error_deserializer

  let request_with_metadata context (request : verify_email_identity_request) =
    let fields = verify_email_identity_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"VerifyEmailIdentity"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:verify_email_identity_response_of_xml ~error_deserializer
end

module SetReceiptRulePosition = struct
  let error_to_string = function
    | `RuleDoesNotExistException _ -> "com.amazonaws.ses#RuleDoesNotExistException"
    | `RuleSetDoesNotExistException _ -> "com.amazonaws.ses#RuleSetDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "RuleDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_does_not_exist_exception_of_xml
        with
        | Ok s -> `RuleDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RuleSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `RuleSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_receipt_rule_position_request) =
    let fields = set_receipt_rule_position_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetReceiptRulePosition"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:set_receipt_rule_position_response_of_xml ~error_deserializer

  let request_with_metadata context (request : set_receipt_rule_position_request) =
    let fields = set_receipt_rule_position_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetReceiptRulePosition"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:set_receipt_rule_position_response_of_xml ~error_deserializer
end

module SetIdentityNotificationTopic = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_identity_notification_topic_request) =
    let fields = set_identity_notification_topic_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetIdentityNotificationTopic"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:set_identity_notification_topic_response_of_xml ~error_deserializer

  let request_with_metadata context (request : set_identity_notification_topic_request) =
    let fields = set_identity_notification_topic_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetIdentityNotificationTopic"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:set_identity_notification_topic_response_of_xml ~error_deserializer
end

module SetIdentityMailFromDomain = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_identity_mail_from_domain_request) =
    let fields = set_identity_mail_from_domain_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetIdentityMailFromDomain"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:set_identity_mail_from_domain_response_of_xml ~error_deserializer

  let request_with_metadata context (request : set_identity_mail_from_domain_request) =
    let fields = set_identity_mail_from_domain_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetIdentityMailFromDomain"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:set_identity_mail_from_domain_response_of_xml ~error_deserializer
end

module SetIdentityHeadersInNotificationsEnabled = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_identity_headers_in_notifications_enabled_request) =
    let fields = set_identity_headers_in_notifications_enabled_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetIdentityHeadersInNotificationsEnabled"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:set_identity_headers_in_notifications_enabled_response_of_xml
      ~error_deserializer

  let request_with_metadata context
      (request : set_identity_headers_in_notifications_enabled_request) =
    let fields = set_identity_headers_in_notifications_enabled_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"SetIdentityHeadersInNotificationsEnabled"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:set_identity_headers_in_notifications_enabled_response_of_xml
      ~error_deserializer
end

module SetIdentityFeedbackForwardingEnabled = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_identity_feedback_forwarding_enabled_request) =
    let fields = set_identity_feedback_forwarding_enabled_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetIdentityFeedbackForwardingEnabled"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:set_identity_feedback_forwarding_enabled_response_of_xml
      ~error_deserializer

  let request_with_metadata context (request : set_identity_feedback_forwarding_enabled_request) =
    let fields = set_identity_feedback_forwarding_enabled_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"SetIdentityFeedbackForwardingEnabled"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:set_identity_feedback_forwarding_enabled_response_of_xml
      ~error_deserializer
end

module SetIdentityDkimEnabled = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_identity_dkim_enabled_request) =
    let fields = set_identity_dkim_enabled_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetIdentityDkimEnabled"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:set_identity_dkim_enabled_response_of_xml ~error_deserializer

  let request_with_metadata context (request : set_identity_dkim_enabled_request) =
    let fields = set_identity_dkim_enabled_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetIdentityDkimEnabled"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:set_identity_dkim_enabled_response_of_xml ~error_deserializer
end

module SetActiveReceiptRuleSet = struct
  let error_to_string = function
    | `RuleSetDoesNotExistException _ -> "com.amazonaws.ses#RuleSetDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "RuleSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `RuleSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_active_receipt_rule_set_request) =
    let fields = set_active_receipt_rule_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetActiveReceiptRuleSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:set_active_receipt_rule_set_response_of_xml ~error_deserializer

  let request_with_metadata context (request : set_active_receipt_rule_set_request) =
    let fields = set_active_receipt_rule_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetActiveReceiptRuleSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:set_active_receipt_rule_set_response_of_xml ~error_deserializer
end

module SendTemplatedEmail = struct
  let error_to_string = function
    | `AccountSendingPausedException _ -> "com.amazonaws.ses#AccountSendingPausedException"
    | `ConfigurationSetDoesNotExistException _ ->
        "com.amazonaws.ses#ConfigurationSetDoesNotExistException"
    | `ConfigurationSetSendingPausedException _ ->
        "com.amazonaws.ses#ConfigurationSetSendingPausedException"
    | `MailFromDomainNotVerifiedException _ ->
        "com.amazonaws.ses#MailFromDomainNotVerifiedException"
    | `MessageRejected _ -> "com.amazonaws.ses#MessageRejected"
    | `TemplateDoesNotExistException _ -> "com.amazonaws.ses#TemplateDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AccountSendingPausedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:account_sending_paused_exception_of_xml
        with
        | Ok s -> `AccountSendingPausedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConfigurationSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `ConfigurationSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConfigurationSetSendingPausedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_sending_paused_exception_of_xml
        with
        | Ok s -> `ConfigurationSetSendingPausedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MailFromDomainNotVerifiedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:mail_from_domain_not_verified_exception_of_xml
        with
        | Ok s -> `MailFromDomainNotVerifiedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MessageRejected" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:message_rejected_of_xml
        with
        | Ok s -> `MessageRejected s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TemplateDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:template_does_not_exist_exception_of_xml
        with
        | Ok s -> `TemplateDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : send_templated_email_request) =
    let fields = send_templated_email_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SendTemplatedEmail"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:send_templated_email_response_of_xml ~error_deserializer

  let request_with_metadata context (request : send_templated_email_request) =
    let fields = send_templated_email_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SendTemplatedEmail"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:send_templated_email_response_of_xml ~error_deserializer
end

module SendRawEmail = struct
  let error_to_string = function
    | `AccountSendingPausedException _ -> "com.amazonaws.ses#AccountSendingPausedException"
    | `ConfigurationSetDoesNotExistException _ ->
        "com.amazonaws.ses#ConfigurationSetDoesNotExistException"
    | `ConfigurationSetSendingPausedException _ ->
        "com.amazonaws.ses#ConfigurationSetSendingPausedException"
    | `MailFromDomainNotVerifiedException _ ->
        "com.amazonaws.ses#MailFromDomainNotVerifiedException"
    | `MessageRejected _ -> "com.amazonaws.ses#MessageRejected"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AccountSendingPausedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:account_sending_paused_exception_of_xml
        with
        | Ok s -> `AccountSendingPausedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConfigurationSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `ConfigurationSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConfigurationSetSendingPausedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_sending_paused_exception_of_xml
        with
        | Ok s -> `ConfigurationSetSendingPausedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MailFromDomainNotVerifiedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:mail_from_domain_not_verified_exception_of_xml
        with
        | Ok s -> `MailFromDomainNotVerifiedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MessageRejected" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:message_rejected_of_xml
        with
        | Ok s -> `MessageRejected s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : send_raw_email_request) =
    let fields = send_raw_email_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SendRawEmail"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:send_raw_email_response_of_xml ~error_deserializer

  let request_with_metadata context (request : send_raw_email_request) =
    let fields = send_raw_email_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SendRawEmail"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:send_raw_email_response_of_xml ~error_deserializer
end

module SendEmail = struct
  let error_to_string = function
    | `AccountSendingPausedException _ -> "com.amazonaws.ses#AccountSendingPausedException"
    | `ConfigurationSetDoesNotExistException _ ->
        "com.amazonaws.ses#ConfigurationSetDoesNotExistException"
    | `ConfigurationSetSendingPausedException _ ->
        "com.amazonaws.ses#ConfigurationSetSendingPausedException"
    | `MailFromDomainNotVerifiedException _ ->
        "com.amazonaws.ses#MailFromDomainNotVerifiedException"
    | `MessageRejected _ -> "com.amazonaws.ses#MessageRejected"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AccountSendingPausedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:account_sending_paused_exception_of_xml
        with
        | Ok s -> `AccountSendingPausedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConfigurationSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `ConfigurationSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConfigurationSetSendingPausedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_sending_paused_exception_of_xml
        with
        | Ok s -> `ConfigurationSetSendingPausedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MailFromDomainNotVerifiedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:mail_from_domain_not_verified_exception_of_xml
        with
        | Ok s -> `MailFromDomainNotVerifiedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MessageRejected" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:message_rejected_of_xml
        with
        | Ok s -> `MessageRejected s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : send_email_request) =
    let fields = send_email_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SendEmail"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:send_email_response_of_xml ~error_deserializer

  let request_with_metadata context (request : send_email_request) =
    let fields = send_email_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SendEmail"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:send_email_response_of_xml ~error_deserializer
end

module SendCustomVerificationEmail = struct
  let error_to_string = function
    | `ConfigurationSetDoesNotExistException _ ->
        "com.amazonaws.ses#ConfigurationSetDoesNotExistException"
    | `CustomVerificationEmailTemplateDoesNotExistException _ ->
        "com.amazonaws.ses#CustomVerificationEmailTemplateDoesNotExistException"
    | `FromEmailAddressNotVerifiedException _ ->
        "com.amazonaws.ses#FromEmailAddressNotVerifiedException"
    | `MessageRejected _ -> "com.amazonaws.ses#MessageRejected"
    | `ProductionAccessNotGrantedException _ ->
        "com.amazonaws.ses#ProductionAccessNotGrantedException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConfigurationSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `ConfigurationSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CustomVerificationEmailTemplateDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_verification_email_template_does_not_exist_exception_of_xml
        with
        | Ok s -> `CustomVerificationEmailTemplateDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "FromEmailAddressNotVerified" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:from_email_address_not_verified_exception_of_xml
        with
        | Ok s -> `FromEmailAddressNotVerifiedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MessageRejected" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:message_rejected_of_xml
        with
        | Ok s -> `MessageRejected s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ProductionAccessNotGranted" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:production_access_not_granted_exception_of_xml
        with
        | Ok s -> `ProductionAccessNotGrantedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : send_custom_verification_email_request) =
    let fields = send_custom_verification_email_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SendCustomVerificationEmail"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:send_custom_verification_email_response_of_xml ~error_deserializer

  let request_with_metadata context (request : send_custom_verification_email_request) =
    let fields = send_custom_verification_email_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SendCustomVerificationEmail"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:send_custom_verification_email_response_of_xml ~error_deserializer
end

module SendBulkTemplatedEmail = struct
  let error_to_string = function
    | `AccountSendingPausedException _ -> "com.amazonaws.ses#AccountSendingPausedException"
    | `ConfigurationSetDoesNotExistException _ ->
        "com.amazonaws.ses#ConfigurationSetDoesNotExistException"
    | `ConfigurationSetSendingPausedException _ ->
        "com.amazonaws.ses#ConfigurationSetSendingPausedException"
    | `MailFromDomainNotVerifiedException _ ->
        "com.amazonaws.ses#MailFromDomainNotVerifiedException"
    | `MessageRejected _ -> "com.amazonaws.ses#MessageRejected"
    | `TemplateDoesNotExistException _ -> "com.amazonaws.ses#TemplateDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AccountSendingPausedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:account_sending_paused_exception_of_xml
        with
        | Ok s -> `AccountSendingPausedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConfigurationSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `ConfigurationSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConfigurationSetSendingPausedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_sending_paused_exception_of_xml
        with
        | Ok s -> `ConfigurationSetSendingPausedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MailFromDomainNotVerifiedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:mail_from_domain_not_verified_exception_of_xml
        with
        | Ok s -> `MailFromDomainNotVerifiedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MessageRejected" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:message_rejected_of_xml
        with
        | Ok s -> `MessageRejected s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TemplateDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:template_does_not_exist_exception_of_xml
        with
        | Ok s -> `TemplateDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : send_bulk_templated_email_request) =
    let fields = send_bulk_templated_email_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SendBulkTemplatedEmail"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:send_bulk_templated_email_response_of_xml ~error_deserializer

  let request_with_metadata context (request : send_bulk_templated_email_request) =
    let fields = send_bulk_templated_email_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SendBulkTemplatedEmail"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:send_bulk_templated_email_response_of_xml ~error_deserializer
end

module SendBounce = struct
  let error_to_string = function
    | `MessageRejected _ -> "com.amazonaws.ses#MessageRejected"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "MessageRejected" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:message_rejected_of_xml
        with
        | Ok s -> `MessageRejected s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : send_bounce_request) =
    let fields = send_bounce_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SendBounce"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:send_bounce_response_of_xml ~error_deserializer

  let request_with_metadata context (request : send_bounce_request) =
    let fields = send_bounce_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SendBounce"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:send_bounce_response_of_xml ~error_deserializer
end

module ReorderReceiptRuleSet = struct
  let error_to_string = function
    | `RuleDoesNotExistException _ -> "com.amazonaws.ses#RuleDoesNotExistException"
    | `RuleSetDoesNotExistException _ -> "com.amazonaws.ses#RuleSetDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "RuleDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_does_not_exist_exception_of_xml
        with
        | Ok s -> `RuleDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RuleSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `RuleSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : reorder_receipt_rule_set_request) =
    let fields = reorder_receipt_rule_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ReorderReceiptRuleSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:reorder_receipt_rule_set_response_of_xml ~error_deserializer

  let request_with_metadata context (request : reorder_receipt_rule_set_request) =
    let fields = reorder_receipt_rule_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ReorderReceiptRuleSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:reorder_receipt_rule_set_response_of_xml ~error_deserializer
end

module PutIdentityPolicy = struct
  let error_to_string = function
    | `InvalidPolicyException _ -> "com.amazonaws.ses#InvalidPolicyException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidPolicy" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_policy_exception_of_xml
        with
        | Ok s -> `InvalidPolicyException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_identity_policy_request) =
    let fields = put_identity_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutIdentityPolicy"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:put_identity_policy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : put_identity_policy_request) =
    let fields = put_identity_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutIdentityPolicy"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:put_identity_policy_response_of_xml ~error_deserializer
end

module PutConfigurationSetDeliveryOptions = struct
  let error_to_string = function
    | `ConfigurationSetDoesNotExistException _ ->
        "com.amazonaws.ses#ConfigurationSetDoesNotExistException"
    | `InvalidDeliveryOptionsException _ -> "com.amazonaws.ses#InvalidDeliveryOptionsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConfigurationSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `ConfigurationSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidDeliveryOptions" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_delivery_options_exception_of_xml
        with
        | Ok s -> `InvalidDeliveryOptionsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_configuration_set_delivery_options_request) =
    let fields = put_configuration_set_delivery_options_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutConfigurationSetDeliveryOptions"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:put_configuration_set_delivery_options_response_of_xml
      ~error_deserializer

  let request_with_metadata context (request : put_configuration_set_delivery_options_request) =
    let fields = put_configuration_set_delivery_options_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutConfigurationSetDeliveryOptions"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:put_configuration_set_delivery_options_response_of_xml
      ~error_deserializer
end

module ListVerifiedEmailAddresses = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListVerifiedEmailAddresses"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:list_verified_email_addresses_response_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListVerifiedEmailAddresses"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:list_verified_email_addresses_response_of_xml ~error_deserializer
end

module ListTemplates = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_templates_request) =
    let fields = list_templates_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListTemplates"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:list_templates_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_templates_request) =
    let fields = list_templates_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListTemplates"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:list_templates_response_of_xml ~error_deserializer
end

module ListReceiptRuleSets = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_receipt_rule_sets_request) =
    let fields = list_receipt_rule_sets_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListReceiptRuleSets"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:list_receipt_rule_sets_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_receipt_rule_sets_request) =
    let fields = list_receipt_rule_sets_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListReceiptRuleSets"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:list_receipt_rule_sets_response_of_xml ~error_deserializer
end

module ListReceiptFilters = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_receipt_filters_request) =
    let fields = list_receipt_filters_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListReceiptFilters"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:list_receipt_filters_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_receipt_filters_request) =
    let fields = list_receipt_filters_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListReceiptFilters"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:list_receipt_filters_response_of_xml ~error_deserializer
end

module ListIdentityPolicies = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_identity_policies_request) =
    let fields = list_identity_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListIdentityPolicies"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:list_identity_policies_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_identity_policies_request) =
    let fields = list_identity_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListIdentityPolicies"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:list_identity_policies_response_of_xml ~error_deserializer
end

module ListIdentities = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_identities_request) =
    let fields = list_identities_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListIdentities"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:list_identities_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_identities_request) =
    let fields = list_identities_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListIdentities"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:list_identities_response_of_xml ~error_deserializer
end

module ListCustomVerificationEmailTemplates = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_custom_verification_email_templates_request) =
    let fields = list_custom_verification_email_templates_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListCustomVerificationEmailTemplates"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:list_custom_verification_email_templates_response_of_xml
      ~error_deserializer

  let request_with_metadata context (request : list_custom_verification_email_templates_request) =
    let fields = list_custom_verification_email_templates_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"ListCustomVerificationEmailTemplates"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:list_custom_verification_email_templates_response_of_xml
      ~error_deserializer
end

module ListConfigurationSets = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_configuration_sets_request) =
    let fields = list_configuration_sets_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListConfigurationSets"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:list_configuration_sets_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_configuration_sets_request) =
    let fields = list_configuration_sets_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListConfigurationSets"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:list_configuration_sets_response_of_xml ~error_deserializer
end

module GetTemplate = struct
  let error_to_string = function
    | `TemplateDoesNotExistException _ -> "com.amazonaws.ses#TemplateDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "TemplateDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:template_does_not_exist_exception_of_xml
        with
        | Ok s -> `TemplateDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_template_request) =
    let fields = get_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_template_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_template_request) =
    let fields = get_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_template_response_of_xml ~error_deserializer
end

module GetSendStatistics = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetSendStatistics"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_send_statistics_response_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetSendStatistics"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_send_statistics_response_of_xml ~error_deserializer
end

module GetSendQuota = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetSendQuota"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_send_quota_response_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetSendQuota"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_send_quota_response_of_xml ~error_deserializer
end

module GetIdentityVerificationAttributes = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_identity_verification_attributes_request) =
    let fields = get_identity_verification_attributes_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetIdentityVerificationAttributes"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_identity_verification_attributes_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_identity_verification_attributes_request) =
    let fields = get_identity_verification_attributes_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetIdentityVerificationAttributes"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_identity_verification_attributes_response_of_xml ~error_deserializer
end

module GetIdentityPolicies = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_identity_policies_request) =
    let fields = get_identity_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetIdentityPolicies"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_identity_policies_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_identity_policies_request) =
    let fields = get_identity_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetIdentityPolicies"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_identity_policies_response_of_xml ~error_deserializer
end

module GetIdentityNotificationAttributes = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_identity_notification_attributes_request) =
    let fields = get_identity_notification_attributes_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetIdentityNotificationAttributes"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_identity_notification_attributes_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_identity_notification_attributes_request) =
    let fields = get_identity_notification_attributes_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetIdentityNotificationAttributes"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_identity_notification_attributes_response_of_xml ~error_deserializer
end

module GetIdentityMailFromDomainAttributes = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_identity_mail_from_domain_attributes_request) =
    let fields = get_identity_mail_from_domain_attributes_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetIdentityMailFromDomainAttributes"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_identity_mail_from_domain_attributes_response_of_xml
      ~error_deserializer

  let request_with_metadata context (request : get_identity_mail_from_domain_attributes_request) =
    let fields = get_identity_mail_from_domain_attributes_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetIdentityMailFromDomainAttributes"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_identity_mail_from_domain_attributes_response_of_xml
      ~error_deserializer
end

module GetIdentityDkimAttributes = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_identity_dkim_attributes_request) =
    let fields = get_identity_dkim_attributes_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetIdentityDkimAttributes"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_identity_dkim_attributes_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_identity_dkim_attributes_request) =
    let fields = get_identity_dkim_attributes_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetIdentityDkimAttributes"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_identity_dkim_attributes_response_of_xml ~error_deserializer
end

module GetCustomVerificationEmailTemplate = struct
  let error_to_string = function
    | `CustomVerificationEmailTemplateDoesNotExistException _ ->
        "com.amazonaws.ses#CustomVerificationEmailTemplateDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CustomVerificationEmailTemplateDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_verification_email_template_does_not_exist_exception_of_xml
        with
        | Ok s -> `CustomVerificationEmailTemplateDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_custom_verification_email_template_request) =
    let fields = get_custom_verification_email_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetCustomVerificationEmailTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_custom_verification_email_template_response_of_xml
      ~error_deserializer

  let request_with_metadata context (request : get_custom_verification_email_template_request) =
    let fields = get_custom_verification_email_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetCustomVerificationEmailTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_custom_verification_email_template_response_of_xml
      ~error_deserializer
end

module GetAccountSendingEnabled = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetAccountSendingEnabled"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_account_sending_enabled_response_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetAccountSendingEnabled"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:get_account_sending_enabled_response_of_xml ~error_deserializer
end

module DescribeReceiptRuleSet = struct
  let error_to_string = function
    | `RuleSetDoesNotExistException _ -> "com.amazonaws.ses#RuleSetDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "RuleSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `RuleSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_receipt_rule_set_request) =
    let fields = describe_receipt_rule_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeReceiptRuleSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_receipt_rule_set_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_receipt_rule_set_request) =
    let fields = describe_receipt_rule_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeReceiptRuleSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_receipt_rule_set_response_of_xml ~error_deserializer
end

module DescribeReceiptRule = struct
  let error_to_string = function
    | `RuleDoesNotExistException _ -> "com.amazonaws.ses#RuleDoesNotExistException"
    | `RuleSetDoesNotExistException _ -> "com.amazonaws.ses#RuleSetDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "RuleDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_does_not_exist_exception_of_xml
        with
        | Ok s -> `RuleDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RuleSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `RuleSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_receipt_rule_request) =
    let fields = describe_receipt_rule_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeReceiptRule"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_receipt_rule_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_receipt_rule_request) =
    let fields = describe_receipt_rule_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeReceiptRule"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_receipt_rule_response_of_xml ~error_deserializer
end

module DescribeConfigurationSet = struct
  let error_to_string = function
    | `ConfigurationSetDoesNotExistException _ ->
        "com.amazonaws.ses#ConfigurationSetDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConfigurationSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `ConfigurationSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_configuration_set_request) =
    let fields = describe_configuration_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeConfigurationSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_configuration_set_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_configuration_set_request) =
    let fields = describe_configuration_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeConfigurationSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_configuration_set_response_of_xml ~error_deserializer
end

module DescribeActiveReceiptRuleSet = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_active_receipt_rule_set_request) =
    let fields = describe_active_receipt_rule_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeActiveReceiptRuleSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_active_receipt_rule_set_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_active_receipt_rule_set_request) =
    let fields = describe_active_receipt_rule_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeActiveReceiptRuleSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:describe_active_receipt_rule_set_response_of_xml ~error_deserializer
end

module DeleteVerifiedEmailAddress = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_verified_email_address_request) =
    let fields = delete_verified_email_address_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteVerifiedEmailAddress"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_verified_email_address_request) =
    let fields = delete_verified_email_address_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteVerifiedEmailAddress"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteTemplate = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_template_request) =
    let fields = delete_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_template_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_template_request) =
    let fields = delete_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_template_response_of_xml ~error_deserializer
end

module DeleteReceiptRuleSet = struct
  let error_to_string = function
    | `CannotDeleteException _ -> "com.amazonaws.ses#CannotDeleteException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CannotDelete" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cannot_delete_exception_of_xml
        with
        | Ok s -> `CannotDeleteException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_receipt_rule_set_request) =
    let fields = delete_receipt_rule_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteReceiptRuleSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_receipt_rule_set_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_receipt_rule_set_request) =
    let fields = delete_receipt_rule_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteReceiptRuleSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_receipt_rule_set_response_of_xml ~error_deserializer
end

module DeleteReceiptRule = struct
  let error_to_string = function
    | `RuleSetDoesNotExistException _ -> "com.amazonaws.ses#RuleSetDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "RuleSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `RuleSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_receipt_rule_request) =
    let fields = delete_receipt_rule_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteReceiptRule"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_receipt_rule_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_receipt_rule_request) =
    let fields = delete_receipt_rule_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteReceiptRule"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_receipt_rule_response_of_xml ~error_deserializer
end

module DeleteReceiptFilter = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_receipt_filter_request) =
    let fields = delete_receipt_filter_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteReceiptFilter"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_receipt_filter_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_receipt_filter_request) =
    let fields = delete_receipt_filter_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteReceiptFilter"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_receipt_filter_response_of_xml ~error_deserializer
end

module DeleteIdentityPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_identity_policy_request) =
    let fields = delete_identity_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteIdentityPolicy"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_identity_policy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_identity_policy_request) =
    let fields = delete_identity_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteIdentityPolicy"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_identity_policy_response_of_xml ~error_deserializer
end

module DeleteIdentity = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_identity_request) =
    let fields = delete_identity_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteIdentity"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_identity_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_identity_request) =
    let fields = delete_identity_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteIdentity"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_identity_response_of_xml ~error_deserializer
end

module DeleteCustomVerificationEmailTemplate = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_custom_verification_email_template_request) =
    let fields = delete_custom_verification_email_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteCustomVerificationEmailTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_custom_verification_email_template_request) =
    let fields = delete_custom_verification_email_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"DeleteCustomVerificationEmailTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteConfigurationSetTrackingOptions = struct
  let error_to_string = function
    | `ConfigurationSetDoesNotExistException _ ->
        "com.amazonaws.ses#ConfigurationSetDoesNotExistException"
    | `TrackingOptionsDoesNotExistException _ ->
        "com.amazonaws.ses#TrackingOptionsDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConfigurationSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `ConfigurationSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrackingOptionsDoesNotExistException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tracking_options_does_not_exist_exception_of_xml
        with
        | Ok s -> `TrackingOptionsDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_configuration_set_tracking_options_request) =
    let fields = delete_configuration_set_tracking_options_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteConfigurationSetTrackingOptions"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_configuration_set_tracking_options_response_of_xml
      ~error_deserializer

  let request_with_metadata context (request : delete_configuration_set_tracking_options_request) =
    let fields = delete_configuration_set_tracking_options_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"DeleteConfigurationSetTrackingOptions"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_configuration_set_tracking_options_response_of_xml
      ~error_deserializer
end

module DeleteConfigurationSetEventDestination = struct
  let error_to_string = function
    | `ConfigurationSetDoesNotExistException _ ->
        "com.amazonaws.ses#ConfigurationSetDoesNotExistException"
    | `EventDestinationDoesNotExistException _ ->
        "com.amazonaws.ses#EventDestinationDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConfigurationSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `ConfigurationSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EventDestinationDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:event_destination_does_not_exist_exception_of_xml
        with
        | Ok s -> `EventDestinationDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_configuration_set_event_destination_request) =
    let fields = delete_configuration_set_event_destination_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteConfigurationSetEventDestination"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_configuration_set_event_destination_response_of_xml
      ~error_deserializer

  let request_with_metadata context (request : delete_configuration_set_event_destination_request) =
    let fields = delete_configuration_set_event_destination_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"DeleteConfigurationSetEventDestination"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_configuration_set_event_destination_response_of_xml
      ~error_deserializer
end

module DeleteConfigurationSet = struct
  let error_to_string = function
    | `ConfigurationSetDoesNotExistException _ ->
        "com.amazonaws.ses#ConfigurationSetDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConfigurationSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `ConfigurationSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_configuration_set_request) =
    let fields = delete_configuration_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteConfigurationSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_configuration_set_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_configuration_set_request) =
    let fields = delete_configuration_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteConfigurationSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:delete_configuration_set_response_of_xml ~error_deserializer
end

module CreateTemplate = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.ses#AlreadyExistsException"
    | `InvalidTemplateException _ -> "com.amazonaws.ses#InvalidTemplateException"
    | `LimitExceededException _ -> "com.amazonaws.ses#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:already_exists_exception_of_xml
        with
        | Ok s -> `AlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTemplate" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_template_exception_of_xml
        with
        | Ok s -> `InvalidTemplateException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_template_request) =
    let fields = create_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:create_template_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_template_request) =
    let fields = create_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:create_template_response_of_xml ~error_deserializer
end

module CreateReceiptRuleSet = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.ses#AlreadyExistsException"
    | `LimitExceededException _ -> "com.amazonaws.ses#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:already_exists_exception_of_xml
        with
        | Ok s -> `AlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_receipt_rule_set_request) =
    let fields = create_receipt_rule_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateReceiptRuleSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:create_receipt_rule_set_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_receipt_rule_set_request) =
    let fields = create_receipt_rule_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateReceiptRuleSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:create_receipt_rule_set_response_of_xml ~error_deserializer
end

module CreateReceiptRule = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.ses#AlreadyExistsException"
    | `InvalidLambdaFunctionException _ -> "com.amazonaws.ses#InvalidLambdaFunctionException"
    | `InvalidS3ConfigurationException _ -> "com.amazonaws.ses#InvalidS3ConfigurationException"
    | `InvalidSnsTopicException _ -> "com.amazonaws.ses#InvalidSnsTopicException"
    | `LimitExceededException _ -> "com.amazonaws.ses#LimitExceededException"
    | `RuleDoesNotExistException _ -> "com.amazonaws.ses#RuleDoesNotExistException"
    | `RuleSetDoesNotExistException _ -> "com.amazonaws.ses#RuleSetDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:already_exists_exception_of_xml
        with
        | Ok s -> `AlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidLambdaFunction" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_lambda_function_exception_of_xml
        with
        | Ok s -> `InvalidLambdaFunctionException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidS3Configuration" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_s3_configuration_exception_of_xml
        with
        | Ok s -> `InvalidS3ConfigurationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSnsTopic" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_sns_topic_exception_of_xml
        with
        | Ok s -> `InvalidSnsTopicException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RuleDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_does_not_exist_exception_of_xml
        with
        | Ok s -> `RuleDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RuleSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `RuleSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_receipt_rule_request) =
    let fields = create_receipt_rule_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateReceiptRule"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:create_receipt_rule_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_receipt_rule_request) =
    let fields = create_receipt_rule_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateReceiptRule"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:create_receipt_rule_response_of_xml ~error_deserializer
end

module CreateReceiptFilter = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.ses#AlreadyExistsException"
    | `LimitExceededException _ -> "com.amazonaws.ses#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:already_exists_exception_of_xml
        with
        | Ok s -> `AlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_receipt_filter_request) =
    let fields = create_receipt_filter_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateReceiptFilter"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:create_receipt_filter_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_receipt_filter_request) =
    let fields = create_receipt_filter_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateReceiptFilter"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:create_receipt_filter_response_of_xml ~error_deserializer
end

module CreateCustomVerificationEmailTemplate = struct
  let error_to_string = function
    | `CustomVerificationEmailInvalidContentException _ ->
        "com.amazonaws.ses#CustomVerificationEmailInvalidContentException"
    | `CustomVerificationEmailTemplateAlreadyExistsException _ ->
        "com.amazonaws.ses#CustomVerificationEmailTemplateAlreadyExistsException"
    | `FromEmailAddressNotVerifiedException _ ->
        "com.amazonaws.ses#FromEmailAddressNotVerifiedException"
    | `LimitExceededException _ -> "com.amazonaws.ses#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CustomVerificationEmailInvalidContent" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_verification_email_invalid_content_exception_of_xml
        with
        | Ok s -> `CustomVerificationEmailInvalidContentException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CustomVerificationEmailTemplateAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:custom_verification_email_template_already_exists_exception_of_xml
        with
        | Ok s -> `CustomVerificationEmailTemplateAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "FromEmailAddressNotVerified" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:from_email_address_not_verified_exception_of_xml
        with
        | Ok s -> `FromEmailAddressNotVerifiedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_custom_verification_email_template_request) =
    let fields = create_custom_verification_email_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateCustomVerificationEmailTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : create_custom_verification_email_template_request) =
    let fields = create_custom_verification_email_template_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"CreateCustomVerificationEmailTemplate"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module CreateConfigurationSetTrackingOptions = struct
  let error_to_string = function
    | `ConfigurationSetDoesNotExistException _ ->
        "com.amazonaws.ses#ConfigurationSetDoesNotExistException"
    | `InvalidTrackingOptionsException _ -> "com.amazonaws.ses#InvalidTrackingOptionsException"
    | `TrackingOptionsAlreadyExistsException _ ->
        "com.amazonaws.ses#TrackingOptionsAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConfigurationSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `ConfigurationSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTrackingOptions" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_tracking_options_exception_of_xml
        with
        | Ok s -> `InvalidTrackingOptionsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrackingOptionsAlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:tracking_options_already_exists_exception_of_xml
        with
        | Ok s -> `TrackingOptionsAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_configuration_set_tracking_options_request) =
    let fields = create_configuration_set_tracking_options_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateConfigurationSetTrackingOptions"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:create_configuration_set_tracking_options_response_of_xml
      ~error_deserializer

  let request_with_metadata context (request : create_configuration_set_tracking_options_request) =
    let fields = create_configuration_set_tracking_options_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"CreateConfigurationSetTrackingOptions"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:create_configuration_set_tracking_options_response_of_xml
      ~error_deserializer
end

module CreateConfigurationSetEventDestination = struct
  let error_to_string = function
    | `ConfigurationSetDoesNotExistException _ ->
        "com.amazonaws.ses#ConfigurationSetDoesNotExistException"
    | `EventDestinationAlreadyExistsException _ ->
        "com.amazonaws.ses#EventDestinationAlreadyExistsException"
    | `InvalidCloudWatchDestinationException _ ->
        "com.amazonaws.ses#InvalidCloudWatchDestinationException"
    | `InvalidFirehoseDestinationException _ ->
        "com.amazonaws.ses#InvalidFirehoseDestinationException"
    | `InvalidSNSDestinationException _ -> "com.amazonaws.ses#InvalidSNSDestinationException"
    | `LimitExceededException _ -> "com.amazonaws.ses#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConfigurationSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `ConfigurationSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EventDestinationAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:event_destination_already_exists_exception_of_xml
        with
        | Ok s -> `EventDestinationAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCloudWatchDestination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_cloud_watch_destination_exception_of_xml
        with
        | Ok s -> `InvalidCloudWatchDestinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidFirehoseDestination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_firehose_destination_exception_of_xml
        with
        | Ok s -> `InvalidFirehoseDestinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSNSDestination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_sns_destination_exception_of_xml
        with
        | Ok s -> `InvalidSNSDestinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_configuration_set_event_destination_request) =
    let fields = create_configuration_set_event_destination_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateConfigurationSetEventDestination"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:create_configuration_set_event_destination_response_of_xml
      ~error_deserializer

  let request_with_metadata context (request : create_configuration_set_event_destination_request) =
    let fields = create_configuration_set_event_destination_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"CreateConfigurationSetEventDestination"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:create_configuration_set_event_destination_response_of_xml
      ~error_deserializer
end

module CreateConfigurationSet = struct
  let error_to_string = function
    | `ConfigurationSetAlreadyExistsException _ ->
        "com.amazonaws.ses#ConfigurationSetAlreadyExistsException"
    | `InvalidConfigurationSetException _ -> "com.amazonaws.ses#InvalidConfigurationSetException"
    | `LimitExceededException _ -> "com.amazonaws.ses#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConfigurationSetAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:configuration_set_already_exists_exception_of_xml
        with
        | Ok s -> `ConfigurationSetAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidConfigurationSet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_set_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationSetException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_configuration_set_request) =
    let fields = create_configuration_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateConfigurationSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:create_configuration_set_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_configuration_set_request) =
    let fields = create_configuration_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateConfigurationSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:create_configuration_set_response_of_xml ~error_deserializer
end

module CloneReceiptRuleSet = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.ses#AlreadyExistsException"
    | `LimitExceededException _ -> "com.amazonaws.ses#LimitExceededException"
    | `RuleSetDoesNotExistException _ -> "com.amazonaws.ses#RuleSetDoesNotExistException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:already_exists_exception_of_xml
        with
        | Ok s -> `AlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RuleSetDoesNotExist" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_set_does_not_exist_exception_of_xml
        with
        | Ok s -> `RuleSetDoesNotExistException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : clone_receipt_rule_set_request) =
    let fields = clone_receipt_rule_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CloneReceiptRuleSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:clone_receipt_rule_set_response_of_xml ~error_deserializer

  let request_with_metadata context (request : clone_receipt_rule_set_request) =
    let fields = clone_receipt_rule_set_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CloneReceiptRuleSet"
      ~xmlNamespace:"http://ses.amazonaws.com/doc/2010-12-01/" ~service ~context ~fields
      ~output_deserializer:clone_receipt_rule_set_response_of_xml ~error_deserializer
end
