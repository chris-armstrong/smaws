open Types
open Service_metadata

module TransferDomain = struct
  let error_to_string = function
    | `DomainLimitExceeded _ -> "com.amazonaws.route53domains#DomainLimitExceeded"
    | `DuplicateRequest _ -> "com.amazonaws.route53domains#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `TLDRulesViolation _ -> "com.amazonaws.route53domains#TLDRulesViolation"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DomainLimitExceeded" ->
          `DomainLimitExceeded (Json_deserializers.domain_limit_exceeded_of_yojson tree path)
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "TLDRulesViolation" ->
          `TLDRulesViolation (Json_deserializers.tld_rules_violation_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : transfer_domain_request) =
    let input = Json_serializers.transfer_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.TransferDomain"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.transfer_domain_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : transfer_domain_request) =
    let input = Json_serializers.transfer_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.TransferDomain" ~service ~context ~input
      ~output_deserializer:Json_deserializers.transfer_domain_response_of_yojson ~error_deserializer
end

module TransferDomainToAnotherAwsAccount = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.route53domains#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : transfer_domain_to_another_aws_account_request) =
    let input = Json_serializers.transfer_domain_to_another_aws_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.TransferDomainToAnotherAwsAccount" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.transfer_domain_to_another_aws_account_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : transfer_domain_to_another_aws_account_request) =
    let input = Json_serializers.transfer_domain_to_another_aws_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.TransferDomainToAnotherAwsAccount" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.transfer_domain_to_another_aws_account_response_of_yojson
      ~error_deserializer
end

module UpdateDomainContact = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.route53domains#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `TLDRulesViolation _ -> "com.amazonaws.route53domains#TLDRulesViolation"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "TLDRulesViolation" ->
          `TLDRulesViolation (Json_deserializers.tld_rules_violation_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_domain_contact_request) =
    let input = Json_serializers.update_domain_contact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.UpdateDomainContact"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_domain_contact_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_domain_contact_request) =
    let input = Json_serializers.update_domain_contact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.UpdateDomainContact" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_domain_contact_response_of_yojson
      ~error_deserializer
end

module UpdateDomainContactPrivacy = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.route53domains#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `TLDRulesViolation _ -> "com.amazonaws.route53domains#TLDRulesViolation"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "TLDRulesViolation" ->
          `TLDRulesViolation (Json_deserializers.tld_rules_violation_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_domain_contact_privacy_request) =
    let input = Json_serializers.update_domain_contact_privacy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.UpdateDomainContactPrivacy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_domain_contact_privacy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_domain_contact_privacy_request) =
    let input = Json_serializers.update_domain_contact_privacy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.UpdateDomainContactPrivacy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_domain_contact_privacy_response_of_yojson
      ~error_deserializer
end

module UpdateDomainNameservers = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.route53domains#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `TLDRulesViolation _ -> "com.amazonaws.route53domains#TLDRulesViolation"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "TLDRulesViolation" ->
          `TLDRulesViolation (Json_deserializers.tld_rules_violation_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_domain_nameservers_request) =
    let input = Json_serializers.update_domain_nameservers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.UpdateDomainNameservers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_domain_nameservers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_domain_nameservers_request) =
    let input = Json_serializers.update_domain_nameservers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.UpdateDomainNameservers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_domain_nameservers_response_of_yojson
      ~error_deserializer
end

module UpdateTagsForDomain = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_tags_for_domain_request) =
    let input = Json_serializers.update_tags_for_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.UpdateTagsForDomain"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_tags_for_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_tags_for_domain_request) =
    let input = Json_serializers.update_tags_for_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.UpdateTagsForDomain" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_tags_for_domain_response_of_yojson
      ~error_deserializer
end

module ViewBilling = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : view_billing_request) =
    let input = Json_serializers.view_billing_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.ViewBilling" ~service
      ~context ~input ~output_deserializer:Json_deserializers.view_billing_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : view_billing_request) =
    let input = Json_serializers.view_billing_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.ViewBilling" ~service ~context ~input
      ~output_deserializer:Json_deserializers.view_billing_response_of_yojson ~error_deserializer
end

module RetrieveDomainAuthCode = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `TLDInMaintenance _ -> "com.amazonaws.route53domains#TLDInMaintenance"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "TLDInMaintenance" ->
          `TLDInMaintenance (Json_deserializers.tld_in_maintenance_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : retrieve_domain_auth_code_request) =
    let input = Json_serializers.retrieve_domain_auth_code_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.RetrieveDomainAuthCode" ~service ~context ~input
      ~output_deserializer:Json_deserializers.retrieve_domain_auth_code_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : retrieve_domain_auth_code_request) =
    let input = Json_serializers.retrieve_domain_auth_code_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.RetrieveDomainAuthCode" ~service ~context ~input
      ~output_deserializer:Json_deserializers.retrieve_domain_auth_code_response_of_yojson
      ~error_deserializer
end

module ResendOperationAuthorization = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `TLDInMaintenance _ -> "com.amazonaws.route53domains#TLDInMaintenance"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "TLDInMaintenance" ->
          `TLDInMaintenance (Json_deserializers.tld_in_maintenance_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : resend_operation_authorization_request) =
    let input = Json_serializers.resend_operation_authorization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.ResendOperationAuthorization" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : resend_operation_authorization_request) =
    let input = Json_serializers.resend_operation_authorization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.ResendOperationAuthorization" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module ResendContactReachabilityEmail = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `TLDInMaintenance _ -> "com.amazonaws.route53domains#TLDInMaintenance"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "TLDInMaintenance" ->
          `TLDInMaintenance (Json_deserializers.tld_in_maintenance_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : resend_contact_reachability_email_request) =
    let input = Json_serializers.resend_contact_reachability_email_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.ResendContactReachabilityEmail" ~service ~context ~input
      ~output_deserializer:Json_deserializers.resend_contact_reachability_email_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : resend_contact_reachability_email_request) =
    let input = Json_serializers.resend_contact_reachability_email_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.ResendContactReachabilityEmail" ~service ~context ~input
      ~output_deserializer:Json_deserializers.resend_contact_reachability_email_response_of_yojson
      ~error_deserializer
end

module RenewDomain = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.route53domains#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `TLDRulesViolation _ -> "com.amazonaws.route53domains#TLDRulesViolation"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "TLDRulesViolation" ->
          `TLDRulesViolation (Json_deserializers.tld_rules_violation_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : renew_domain_request) =
    let input = Json_serializers.renew_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.RenewDomain" ~service
      ~context ~input ~output_deserializer:Json_deserializers.renew_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : renew_domain_request) =
    let input = Json_serializers.renew_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.RenewDomain" ~service ~context ~input
      ~output_deserializer:Json_deserializers.renew_domain_response_of_yojson ~error_deserializer
end

module RejectDomainTransferFromAnotherAwsAccount = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reject_domain_transfer_from_another_aws_account_request) =
    let input =
      Json_serializers.reject_domain_transfer_from_another_aws_account_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.RejectDomainTransferFromAnotherAwsAccount" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.reject_domain_transfer_from_another_aws_account_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : reject_domain_transfer_from_another_aws_account_request) =
    let input =
      Json_serializers.reject_domain_transfer_from_another_aws_account_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.RejectDomainTransferFromAnotherAwsAccount" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.reject_domain_transfer_from_another_aws_account_response_of_yojson
      ~error_deserializer
end

module RegisterDomain = struct
  let error_to_string = function
    | `DomainLimitExceeded _ -> "com.amazonaws.route53domains#DomainLimitExceeded"
    | `DuplicateRequest _ -> "com.amazonaws.route53domains#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `TLDRulesViolation _ -> "com.amazonaws.route53domains#TLDRulesViolation"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DomainLimitExceeded" ->
          `DomainLimitExceeded (Json_deserializers.domain_limit_exceeded_of_yojson tree path)
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "TLDRulesViolation" ->
          `TLDRulesViolation (Json_deserializers.tld_rules_violation_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_domain_request) =
    let input = Json_serializers.register_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.RegisterDomain"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_domain_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : register_domain_request) =
    let input = Json_serializers.register_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.RegisterDomain" ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_domain_response_of_yojson ~error_deserializer
end

module PushDomain = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `TLDInMaintenance _ -> "com.amazonaws.route53domains#TLDInMaintenance"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "TLDInMaintenance" ->
          `TLDInMaintenance (Json_deserializers.tld_in_maintenance_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : push_domain_request) =
    let input = Json_serializers.push_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.PushDomain" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : push_domain_request) =
    let input = Json_serializers.push_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.PushDomain" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module ListTagsForDomain = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_domain_request) =
    let input = Json_serializers.list_tags_for_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.ListTagsForDomain"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_domain_request) =
    let input = Json_serializers.list_tags_for_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.ListTagsForDomain" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_domain_response_of_yojson
      ~error_deserializer
end

module ListPrices = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_prices_request) =
    let input = Json_serializers.list_prices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.ListPrices" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_prices_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_prices_request) =
    let input = Json_serializers.list_prices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.ListPrices" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_prices_response_of_yojson ~error_deserializer
end

module ListOperations = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_operations_request) =
    let input = Json_serializers.list_operations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.ListOperations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_operations_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_operations_request) =
    let input = Json_serializers.list_operations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.ListOperations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_operations_response_of_yojson ~error_deserializer
end

module ListDomains = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_domains_request) =
    let input = Json_serializers.list_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.ListDomains" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_domains_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_domains_request) =
    let input = Json_serializers.list_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.ListDomains" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_domains_response_of_yojson ~error_deserializer
end

module GetOperationDetail = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_operation_detail_request) =
    let input = Json_serializers.get_operation_detail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.GetOperationDetail"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_operation_detail_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_operation_detail_request) =
    let input = Json_serializers.get_operation_detail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.GetOperationDetail" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_operation_detail_response_of_yojson
      ~error_deserializer
end

module GetDomainSuggestions = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `TLDInMaintenance _ -> "com.amazonaws.route53domains#TLDInMaintenance"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "TLDInMaintenance" ->
          `TLDInMaintenance (Json_deserializers.tld_in_maintenance_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_domain_suggestions_request) =
    let input = Json_serializers.get_domain_suggestions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.GetDomainSuggestions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_domain_suggestions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_domain_suggestions_request) =
    let input = Json_serializers.get_domain_suggestions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.GetDomainSuggestions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_domain_suggestions_response_of_yojson
      ~error_deserializer
end

module GetDomainDetail = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_domain_detail_request) =
    let input = Json_serializers.get_domain_detail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.GetDomainDetail"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_domain_detail_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_domain_detail_request) =
    let input = Json_serializers.get_domain_detail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.GetDomainDetail" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_domain_detail_response_of_yojson
      ~error_deserializer
end

module GetContactReachabilityStatus = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_contact_reachability_status_request) =
    let input = Json_serializers.get_contact_reachability_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.GetContactReachabilityStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_contact_reachability_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_contact_reachability_status_request) =
    let input = Json_serializers.get_contact_reachability_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.GetContactReachabilityStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_contact_reachability_status_response_of_yojson
      ~error_deserializer
end

module EnableDomainTransferLock = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.route53domains#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `TLDRulesViolation _ -> "com.amazonaws.route53domains#TLDRulesViolation"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "TLDRulesViolation" ->
          `TLDRulesViolation (Json_deserializers.tld_rules_violation_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_domain_transfer_lock_request) =
    let input = Json_serializers.enable_domain_transfer_lock_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.EnableDomainTransferLock" ~service ~context ~input
      ~output_deserializer:Json_deserializers.enable_domain_transfer_lock_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : enable_domain_transfer_lock_request) =
    let input = Json_serializers.enable_domain_transfer_lock_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.EnableDomainTransferLock" ~service ~context ~input
      ~output_deserializer:Json_deserializers.enable_domain_transfer_lock_response_of_yojson
      ~error_deserializer
end

module EnableDomainAutoRenew = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `TLDRulesViolation _ -> "com.amazonaws.route53domains#TLDRulesViolation"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "TLDRulesViolation" ->
          `TLDRulesViolation (Json_deserializers.tld_rules_violation_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_domain_auto_renew_request) =
    let input = Json_serializers.enable_domain_auto_renew_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.EnableDomainAutoRenew"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.enable_domain_auto_renew_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : enable_domain_auto_renew_request) =
    let input = Json_serializers.enable_domain_auto_renew_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.EnableDomainAutoRenew" ~service ~context ~input
      ~output_deserializer:Json_deserializers.enable_domain_auto_renew_response_of_yojson
      ~error_deserializer
end

module DisassociateDelegationSignerFromDomain = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.route53domains#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `TLDRulesViolation _ -> "com.amazonaws.route53domains#TLDRulesViolation"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "TLDRulesViolation" ->
          `TLDRulesViolation (Json_deserializers.tld_rules_violation_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_delegation_signer_from_domain_request) =
    let input =
      Json_serializers.disassociate_delegation_signer_from_domain_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.DisassociateDelegationSignerFromDomain" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_delegation_signer_from_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_delegation_signer_from_domain_request) =
    let input =
      Json_serializers.disassociate_delegation_signer_from_domain_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.DisassociateDelegationSignerFromDomain" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_delegation_signer_from_domain_response_of_yojson
      ~error_deserializer
end

module DisableDomainTransferLock = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.route53domains#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `TLDRulesViolation _ -> "com.amazonaws.route53domains#TLDRulesViolation"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "TLDRulesViolation" ->
          `TLDRulesViolation (Json_deserializers.tld_rules_violation_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_domain_transfer_lock_request) =
    let input = Json_serializers.disable_domain_transfer_lock_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.DisableDomainTransferLock" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disable_domain_transfer_lock_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disable_domain_transfer_lock_request) =
    let input = Json_serializers.disable_domain_transfer_lock_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.DisableDomainTransferLock" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disable_domain_transfer_lock_response_of_yojson
      ~error_deserializer
end

module DisableDomainAutoRenew = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_domain_auto_renew_request) =
    let input = Json_serializers.disable_domain_auto_renew_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.DisableDomainAutoRenew" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disable_domain_auto_renew_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disable_domain_auto_renew_request) =
    let input = Json_serializers.disable_domain_auto_renew_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.DisableDomainAutoRenew" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disable_domain_auto_renew_response_of_yojson
      ~error_deserializer
end

module DeleteTagsForDomain = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_tags_for_domain_request) =
    let input = Json_serializers.delete_tags_for_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.DeleteTagsForDomain"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_tags_for_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_tags_for_domain_request) =
    let input = Json_serializers.delete_tags_for_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.DeleteTagsForDomain" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_tags_for_domain_response_of_yojson
      ~error_deserializer
end

module DeleteDomain = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.route53domains#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `TLDRulesViolation _ -> "com.amazonaws.route53domains#TLDRulesViolation"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "TLDRulesViolation" ->
          `TLDRulesViolation (Json_deserializers.tld_rules_violation_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_domain_request) =
    let input = Json_serializers.delete_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Domains_v20140515.DeleteDomain" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_domain_request) =
    let input = Json_serializers.delete_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.DeleteDomain" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_domain_response_of_yojson ~error_deserializer
end

module CheckDomainTransferability = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `TLDInMaintenance _ -> "com.amazonaws.route53domains#TLDInMaintenance"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "TLDInMaintenance" ->
          `TLDInMaintenance (Json_deserializers.tld_in_maintenance_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : check_domain_transferability_request) =
    let input = Json_serializers.check_domain_transferability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.CheckDomainTransferability" ~service ~context ~input
      ~output_deserializer:Json_deserializers.check_domain_transferability_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : check_domain_transferability_request) =
    let input = Json_serializers.check_domain_transferability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.CheckDomainTransferability" ~service ~context ~input
      ~output_deserializer:Json_deserializers.check_domain_transferability_response_of_yojson
      ~error_deserializer
end

module CheckDomainAvailability = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `TLDInMaintenance _ -> "com.amazonaws.route53domains#TLDInMaintenance"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "TLDInMaintenance" ->
          `TLDInMaintenance (Json_deserializers.tld_in_maintenance_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : check_domain_availability_request) =
    let input = Json_serializers.check_domain_availability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.CheckDomainAvailability" ~service ~context ~input
      ~output_deserializer:Json_deserializers.check_domain_availability_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : check_domain_availability_request) =
    let input = Json_serializers.check_domain_availability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.CheckDomainAvailability" ~service ~context ~input
      ~output_deserializer:Json_deserializers.check_domain_availability_response_of_yojson
      ~error_deserializer
end

module CancelDomainTransferToAnotherAwsAccount = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_domain_transfer_to_another_aws_account_request) =
    let input =
      Json_serializers.cancel_domain_transfer_to_another_aws_account_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.CancelDomainTransferToAnotherAwsAccount" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.cancel_domain_transfer_to_another_aws_account_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : cancel_domain_transfer_to_another_aws_account_request) =
    let input =
      Json_serializers.cancel_domain_transfer_to_another_aws_account_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.CancelDomainTransferToAnotherAwsAccount" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.cancel_domain_transfer_to_another_aws_account_response_of_yojson
      ~error_deserializer
end

module AssociateDelegationSignerToDomain = struct
  let error_to_string = function
    | `DnssecLimitExceeded _ -> "com.amazonaws.route53domains#DnssecLimitExceeded"
    | `DuplicateRequest _ -> "com.amazonaws.route53domains#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `TLDRulesViolation _ -> "com.amazonaws.route53domains#TLDRulesViolation"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DnssecLimitExceeded" ->
          `DnssecLimitExceeded (Json_deserializers.dnssec_limit_exceeded_of_yojson tree path)
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "TLDRulesViolation" ->
          `TLDRulesViolation (Json_deserializers.tld_rules_violation_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_delegation_signer_to_domain_request) =
    let input = Json_serializers.associate_delegation_signer_to_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.AssociateDelegationSignerToDomain" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.associate_delegation_signer_to_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_delegation_signer_to_domain_request) =
    let input = Json_serializers.associate_delegation_signer_to_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.AssociateDelegationSignerToDomain" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.associate_delegation_signer_to_domain_response_of_yojson
      ~error_deserializer
end

module AcceptDomainTransferFromAnotherAwsAccount = struct
  let error_to_string = function
    | `DomainLimitExceeded _ -> "com.amazonaws.route53domains#DomainLimitExceeded"
    | `InvalidInput _ -> "com.amazonaws.route53domains#InvalidInput"
    | `OperationLimitExceeded _ -> "com.amazonaws.route53domains#OperationLimitExceeded"
    | `UnsupportedTLD _ -> "com.amazonaws.route53domains#UnsupportedTLD"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DomainLimitExceeded" ->
          `DomainLimitExceeded (Json_deserializers.domain_limit_exceeded_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationLimitExceeded" ->
          `OperationLimitExceeded (Json_deserializers.operation_limit_exceeded_of_yojson tree path)
      | _, "UnsupportedTLD" ->
          `UnsupportedTLD (Json_deserializers.unsupported_tl_d_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : accept_domain_transfer_from_another_aws_account_request) =
    let input =
      Json_serializers.accept_domain_transfer_from_another_aws_account_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Domains_v20140515.AcceptDomainTransferFromAnotherAwsAccount" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.accept_domain_transfer_from_another_aws_account_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : accept_domain_transfer_from_another_aws_account_request) =
    let input =
      Json_serializers.accept_domain_transfer_from_another_aws_account_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Domains_v20140515.AcceptDomainTransferFromAnotherAwsAccount" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.accept_domain_transfer_from_another_aws_account_response_of_yojson
      ~error_deserializer
end
