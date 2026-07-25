open Types
open Service_metadata

module PutResourcePolicy = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidResourcePolicyException _ ->
        "com.amazonaws.networkfirewall#InvalidResourcePolicyException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidResourcePolicyException" ->
          `InvalidResourcePolicyException
            (Json_deserializers.invalid_resource_policy_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.PutResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.PutResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer
end

module RejectNetworkFirewallTransitGatewayAttachment = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reject_network_firewall_transit_gateway_attachment_request) =
    let input =
      Json_serializers.reject_network_firewall_transit_gateway_attachment_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.RejectNetworkFirewallTransitGatewayAttachment" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.reject_network_firewall_transit_gateway_attachment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : reject_network_firewall_transit_gateway_attachment_request) =
    let input =
      Json_serializers.reject_network_firewall_transit_gateway_attachment_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.RejectNetworkFirewallTransitGatewayAttachment" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.reject_network_firewall_transit_gateway_attachment_response_of_yojson
      ~error_deserializer
end

module StartAnalysisReport = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_analysis_report_request) =
    let input = Json_serializers.start_analysis_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.StartAnalysisReport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_analysis_report_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_analysis_report_request) =
    let input = Json_serializers.start_analysis_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.StartAnalysisReport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_analysis_report_response_of_yojson
      ~error_deserializer
end

module StartFlowCapture = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_flow_capture_request) =
    let input = Json_serializers.start_flow_capture_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.StartFlowCapture"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_flow_capture_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_flow_capture_request) =
    let input = Json_serializers.start_flow_capture_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.StartFlowCapture" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_flow_capture_response_of_yojson
      ~error_deserializer
end

module StartFlowFlush = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_flow_flush_request) =
    let input = Json_serializers.start_flow_flush_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.StartFlowFlush"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_flow_flush_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_flow_flush_request) =
    let input = Json_serializers.start_flow_flush_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.StartFlowFlush" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_flow_flush_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateAvailabilityZoneChangeProtection = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ResourceOwnerCheckException _ -> "com.amazonaws.networkfirewall#ResourceOwnerCheckException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceOwnerCheckException" ->
          `ResourceOwnerCheckException
            (Json_deserializers.resource_owner_check_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_availability_zone_change_protection_request) =
    let input =
      Json_serializers.update_availability_zone_change_protection_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.UpdateAvailabilityZoneChangeProtection" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.update_availability_zone_change_protection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_availability_zone_change_protection_request) =
    let input =
      Json_serializers.update_availability_zone_change_protection_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateAvailabilityZoneChangeProtection" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.update_availability_zone_change_protection_response_of_yojson
      ~error_deserializer
end

module UpdateContainerAssociation = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_container_association_request) =
    let input = Json_serializers.update_container_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.UpdateContainerAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_container_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_container_association_request) =
    let input = Json_serializers.update_container_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateContainerAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_container_association_response_of_yojson
      ~error_deserializer
end

module UpdateFirewallAnalysisSettings = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_firewall_analysis_settings_request) =
    let input = Json_serializers.update_firewall_analysis_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.UpdateFirewallAnalysisSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_firewall_analysis_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_firewall_analysis_settings_request) =
    let input = Json_serializers.update_firewall_analysis_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateFirewallAnalysisSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_firewall_analysis_settings_response_of_yojson
      ~error_deserializer
end

module UpdateFirewallDeleteProtection = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ResourceOwnerCheckException _ -> "com.amazonaws.networkfirewall#ResourceOwnerCheckException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceOwnerCheckException" ->
          `ResourceOwnerCheckException
            (Json_deserializers.resource_owner_check_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_firewall_delete_protection_request) =
    let input = Json_serializers.update_firewall_delete_protection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.UpdateFirewallDeleteProtection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_firewall_delete_protection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_firewall_delete_protection_request) =
    let input = Json_serializers.update_firewall_delete_protection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateFirewallDeleteProtection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_firewall_delete_protection_response_of_yojson
      ~error_deserializer
end

module UpdateFirewallDescription = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_firewall_description_request) =
    let input = Json_serializers.update_firewall_description_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.UpdateFirewallDescription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_firewall_description_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_firewall_description_request) =
    let input = Json_serializers.update_firewall_description_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateFirewallDescription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_firewall_description_response_of_yojson
      ~error_deserializer
end

module UpdateFirewallEncryptionConfiguration = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ResourceOwnerCheckException _ -> "com.amazonaws.networkfirewall#ResourceOwnerCheckException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceOwnerCheckException" ->
          `ResourceOwnerCheckException
            (Json_deserializers.resource_owner_check_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_firewall_encryption_configuration_request) =
    let input =
      Json_serializers.update_firewall_encryption_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.UpdateFirewallEncryptionConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.update_firewall_encryption_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_firewall_encryption_configuration_request) =
    let input =
      Json_serializers.update_firewall_encryption_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateFirewallEncryptionConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.update_firewall_encryption_configuration_response_of_yojson
      ~error_deserializer
end

module UpdateFirewallPolicy = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_firewall_policy_request) =
    let input = Json_serializers.update_firewall_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.UpdateFirewallPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_firewall_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_firewall_policy_request) =
    let input = Json_serializers.update_firewall_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateFirewallPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_firewall_policy_response_of_yojson
      ~error_deserializer
end

module UpdateFirewallPolicyChangeProtection = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ResourceOwnerCheckException _ -> "com.amazonaws.networkfirewall#ResourceOwnerCheckException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceOwnerCheckException" ->
          `ResourceOwnerCheckException
            (Json_deserializers.resource_owner_check_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_firewall_policy_change_protection_request) =
    let input =
      Json_serializers.update_firewall_policy_change_protection_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.UpdateFirewallPolicyChangeProtection" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.update_firewall_policy_change_protection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_firewall_policy_change_protection_request) =
    let input =
      Json_serializers.update_firewall_policy_change_protection_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateFirewallPolicyChangeProtection" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.update_firewall_policy_change_protection_response_of_yojson
      ~error_deserializer
end

module UpdateLoggingConfiguration = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `LogDestinationPermissionException _ ->
        "com.amazonaws.networkfirewall#LogDestinationPermissionException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "LogDestinationPermissionException" ->
          `LogDestinationPermissionException
            (Json_deserializers.log_destination_permission_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_logging_configuration_request) =
    let input = Json_serializers.update_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.UpdateLoggingConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_logging_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_logging_configuration_request) =
    let input = Json_serializers.update_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateLoggingConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_logging_configuration_response_of_yojson
      ~error_deserializer
end

module UpdateProxy = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.networkfirewall#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_proxy_request) =
    let input = Json_serializers.update_proxy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.UpdateProxy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_proxy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_proxy_request) =
    let input = Json_serializers.update_proxy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateProxy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_proxy_response_of_yojson ~error_deserializer
end

module UpdateProxyConfiguration = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_proxy_configuration_request) =
    let input = Json_serializers.update_proxy_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.UpdateProxyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_proxy_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_proxy_configuration_request) =
    let input = Json_serializers.update_proxy_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateProxyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_proxy_configuration_response_of_yojson
      ~error_deserializer
end

module UpdateProxyRule = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_proxy_rule_request) =
    let input = Json_serializers.update_proxy_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.UpdateProxyRule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_proxy_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_proxy_rule_request) =
    let input = Json_serializers.update_proxy_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateProxyRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_proxy_rule_response_of_yojson
      ~error_deserializer
end

module UpdateProxyRuleGroupPriorities = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_proxy_rule_group_priorities_request) =
    let input = Json_serializers.update_proxy_rule_group_priorities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.UpdateProxyRuleGroupPriorities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_proxy_rule_group_priorities_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_proxy_rule_group_priorities_request) =
    let input = Json_serializers.update_proxy_rule_group_priorities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateProxyRuleGroupPriorities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_proxy_rule_group_priorities_response_of_yojson
      ~error_deserializer
end

module UpdateProxyRulePriorities = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_proxy_rule_priorities_request) =
    let input = Json_serializers.update_proxy_rule_priorities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.UpdateProxyRulePriorities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_proxy_rule_priorities_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_proxy_rule_priorities_request) =
    let input = Json_serializers.update_proxy_rule_priorities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateProxyRulePriorities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_proxy_rule_priorities_response_of_yojson
      ~error_deserializer
end

module UpdateRuleGroup = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_rule_group_request) =
    let input = Json_serializers.update_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.UpdateRuleGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_rule_group_request) =
    let input = Json_serializers.update_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_rule_group_response_of_yojson
      ~error_deserializer
end

module UpdateSubnetChangeProtection = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ResourceOwnerCheckException _ -> "com.amazonaws.networkfirewall#ResourceOwnerCheckException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceOwnerCheckException" ->
          `ResourceOwnerCheckException
            (Json_deserializers.resource_owner_check_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_subnet_change_protection_request) =
    let input = Json_serializers.update_subnet_change_protection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.UpdateSubnetChangeProtection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_subnet_change_protection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_subnet_change_protection_request) =
    let input = Json_serializers.update_subnet_change_protection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateSubnetChangeProtection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_subnet_change_protection_response_of_yojson
      ~error_deserializer
end

module UpdateTLSInspectionConfiguration = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_tls_inspection_configuration_request) =
    let input = Json_serializers.update_tls_inspection_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.UpdateTLSInspectionConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_tls_inspection_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_tls_inspection_configuration_request) =
    let input = Json_serializers.update_tls_inspection_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.UpdateTLSInspectionConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_tls_inspection_configuration_response_of_yojson
      ~error_deserializer
end

module ListVpcEndpointAssociations = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_vpc_endpoint_associations_request) =
    let input = Json_serializers.list_vpc_endpoint_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.ListVpcEndpointAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_vpc_endpoint_associations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_vpc_endpoint_associations_request) =
    let input = Json_serializers.list_vpc_endpoint_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.ListVpcEndpointAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_vpc_endpoint_associations_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListTLSInspectionConfigurations = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tls_inspection_configurations_request) =
    let input = Json_serializers.list_tls_inspection_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.ListTLSInspectionConfigurations" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_tls_inspection_configurations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tls_inspection_configurations_request) =
    let input = Json_serializers.list_tls_inspection_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.ListTLSInspectionConfigurations" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_tls_inspection_configurations_response_of_yojson
      ~error_deserializer
end

module ListRuleGroups = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_rule_groups_request) =
    let input = Json_serializers.list_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.ListRuleGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rule_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_rule_groups_request) =
    let input = Json_serializers.list_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.ListRuleGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rule_groups_response_of_yojson
      ~error_deserializer
end

module ListProxyRuleGroups = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_proxy_rule_groups_request) =
    let input = Json_serializers.list_proxy_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.ListProxyRuleGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_proxy_rule_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_proxy_rule_groups_request) =
    let input = Json_serializers.list_proxy_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.ListProxyRuleGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_proxy_rule_groups_response_of_yojson
      ~error_deserializer
end

module ListProxyConfigurations = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_proxy_configurations_request) =
    let input = Json_serializers.list_proxy_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.ListProxyConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_proxy_configurations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_proxy_configurations_request) =
    let input = Json_serializers.list_proxy_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.ListProxyConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_proxy_configurations_response_of_yojson
      ~error_deserializer
end

module ListProxies = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_proxies_request) =
    let input = Json_serializers.list_proxies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.ListProxies" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_proxies_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_proxies_request) =
    let input = Json_serializers.list_proxies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.ListProxies" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_proxies_response_of_yojson ~error_deserializer
end

module ListFlowOperations = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_flow_operations_request) =
    let input = Json_serializers.list_flow_operations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.ListFlowOperations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_flow_operations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_flow_operations_request) =
    let input = Json_serializers.list_flow_operations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.ListFlowOperations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_flow_operations_response_of_yojson
      ~error_deserializer
end

module ListFlowOperationResults = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_flow_operation_results_request) =
    let input = Json_serializers.list_flow_operation_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.ListFlowOperationResults" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_flow_operation_results_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_flow_operation_results_request) =
    let input = Json_serializers.list_flow_operation_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.ListFlowOperationResults" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_flow_operation_results_response_of_yojson
      ~error_deserializer
end

module ListFirewalls = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_firewalls_request) =
    let input = Json_serializers.list_firewalls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.ListFirewalls"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_firewalls_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_firewalls_request) =
    let input = Json_serializers.list_firewalls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.ListFirewalls" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_firewalls_response_of_yojson ~error_deserializer
end

module ListFirewallPolicies = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_firewall_policies_request) =
    let input = Json_serializers.list_firewall_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.ListFirewallPolicies"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_firewall_policies_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_firewall_policies_request) =
    let input = Json_serializers.list_firewall_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.ListFirewallPolicies" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_firewall_policies_response_of_yojson
      ~error_deserializer
end

module ListContainerAssociations = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_container_associations_request) =
    let input = Json_serializers.list_container_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.ListContainerAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_container_associations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_container_associations_request) =
    let input = Json_serializers.list_container_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.ListContainerAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_container_associations_response_of_yojson
      ~error_deserializer
end

module ListAnalysisReports = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_analysis_reports_request) =
    let input = Json_serializers.list_analysis_reports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.ListAnalysisReports"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_analysis_reports_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_analysis_reports_request) =
    let input = Json_serializers.list_analysis_reports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.ListAnalysisReports" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_analysis_reports_response_of_yojson
      ~error_deserializer
end

module GetAnalysisReportResults = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_analysis_report_results_request) =
    let input = Json_serializers.get_analysis_report_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.GetAnalysisReportResults" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_analysis_report_results_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_analysis_report_results_request) =
    let input = Json_serializers.get_analysis_report_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.GetAnalysisReportResults" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_analysis_report_results_response_of_yojson
      ~error_deserializer
end

module DisassociateSubnets = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidOperationException _ -> "com.amazonaws.networkfirewall#InvalidOperationException"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_subnets_request) =
    let input = Json_serializers.disassociate_subnets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.DisassociateSubnets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_subnets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_subnets_request) =
    let input = Json_serializers.disassociate_subnets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DisassociateSubnets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_subnets_response_of_yojson
      ~error_deserializer
end

module DisassociateAvailabilityZones = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidOperationException _ -> "com.amazonaws.networkfirewall#InvalidOperationException"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_availability_zones_request) =
    let input = Json_serializers.disassociate_availability_zones_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DisassociateAvailabilityZones" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_availability_zones_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_availability_zones_request) =
    let input = Json_serializers.disassociate_availability_zones_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DisassociateAvailabilityZones" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_availability_zones_response_of_yojson
      ~error_deserializer
end

module DetachRuleGroupsFromProxyConfiguration = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detach_rule_groups_from_proxy_configuration_request) =
    let input =
      Json_serializers.detach_rule_groups_from_proxy_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DetachRuleGroupsFromProxyConfiguration" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.detach_rule_groups_from_proxy_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detach_rule_groups_from_proxy_configuration_request)
      =
    let input =
      Json_serializers.detach_rule_groups_from_proxy_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DetachRuleGroupsFromProxyConfiguration" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.detach_rule_groups_from_proxy_configuration_response_of_yojson
      ~error_deserializer
end

module DescribeVpcEndpointAssociation = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_vpc_endpoint_association_request) =
    let input = Json_serializers.describe_vpc_endpoint_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DescribeVpcEndpointAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_vpc_endpoint_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_vpc_endpoint_association_request) =
    let input = Json_serializers.describe_vpc_endpoint_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DescribeVpcEndpointAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_vpc_endpoint_association_response_of_yojson
      ~error_deserializer
end

module DescribeTLSInspectionConfiguration = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_tls_inspection_configuration_request) =
    let input = Json_serializers.describe_tls_inspection_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DescribeTLSInspectionConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_tls_inspection_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_tls_inspection_configuration_request) =
    let input = Json_serializers.describe_tls_inspection_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DescribeTLSInspectionConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_tls_inspection_configuration_response_of_yojson
      ~error_deserializer
end

module DescribeRuleGroupSummary = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_rule_group_summary_request) =
    let input = Json_serializers.describe_rule_group_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DescribeRuleGroupSummary" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_rule_group_summary_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_rule_group_summary_request) =
    let input = Json_serializers.describe_rule_group_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DescribeRuleGroupSummary" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_rule_group_summary_response_of_yojson
      ~error_deserializer
end

module DescribeRuleGroupMetadata = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_rule_group_metadata_request) =
    let input = Json_serializers.describe_rule_group_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DescribeRuleGroupMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_rule_group_metadata_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_rule_group_metadata_request) =
    let input = Json_serializers.describe_rule_group_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DescribeRuleGroupMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_rule_group_metadata_response_of_yojson
      ~error_deserializer
end

module DescribeRuleGroup = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_rule_group_request) =
    let input = Json_serializers.describe_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.DescribeRuleGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_rule_group_request) =
    let input = Json_serializers.describe_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DescribeRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_rule_group_response_of_yojson
      ~error_deserializer
end

module DescribeResourcePolicy = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_resource_policy_request) =
    let input = Json_serializers.describe_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DescribeResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_resource_policy_request) =
    let input = Json_serializers.describe_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DescribeResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_resource_policy_response_of_yojson
      ~error_deserializer
end

module DescribeProxyRuleGroup = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_proxy_rule_group_request) =
    let input = Json_serializers.describe_proxy_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DescribeProxyRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_proxy_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_proxy_rule_group_request) =
    let input = Json_serializers.describe_proxy_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DescribeProxyRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_proxy_rule_group_response_of_yojson
      ~error_deserializer
end

module DescribeProxyRule = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_proxy_rule_request) =
    let input = Json_serializers.describe_proxy_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.DescribeProxyRule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_proxy_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_proxy_rule_request) =
    let input = Json_serializers.describe_proxy_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DescribeProxyRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_proxy_rule_response_of_yojson
      ~error_deserializer
end

module DescribeProxyConfiguration = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_proxy_configuration_request) =
    let input = Json_serializers.describe_proxy_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DescribeProxyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_proxy_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_proxy_configuration_request) =
    let input = Json_serializers.describe_proxy_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DescribeProxyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_proxy_configuration_response_of_yojson
      ~error_deserializer
end

module DescribeProxy = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_proxy_request) =
    let input = Json_serializers.describe_proxy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.DescribeProxy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_proxy_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_proxy_request) =
    let input = Json_serializers.describe_proxy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DescribeProxy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_proxy_response_of_yojson ~error_deserializer
end

module DescribeLoggingConfiguration = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_logging_configuration_request) =
    let input = Json_serializers.describe_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DescribeLoggingConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_logging_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_logging_configuration_request) =
    let input = Json_serializers.describe_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DescribeLoggingConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_logging_configuration_response_of_yojson
      ~error_deserializer
end

module DescribeFlowOperation = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_flow_operation_request) =
    let input = Json_serializers.describe_flow_operation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.DescribeFlowOperation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_flow_operation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_flow_operation_request) =
    let input = Json_serializers.describe_flow_operation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DescribeFlowOperation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_flow_operation_response_of_yojson
      ~error_deserializer
end

module DescribeFirewallPolicy = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_firewall_policy_request) =
    let input = Json_serializers.describe_firewall_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DescribeFirewallPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_firewall_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_firewall_policy_request) =
    let input = Json_serializers.describe_firewall_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DescribeFirewallPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_firewall_policy_response_of_yojson
      ~error_deserializer
end

module DescribeFirewallMetadata = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_firewall_metadata_request) =
    let input = Json_serializers.describe_firewall_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DescribeFirewallMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_firewall_metadata_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_firewall_metadata_request) =
    let input = Json_serializers.describe_firewall_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DescribeFirewallMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_firewall_metadata_response_of_yojson
      ~error_deserializer
end

module DescribeFirewall = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_firewall_request) =
    let input = Json_serializers.describe_firewall_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.DescribeFirewall"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_firewall_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_firewall_request) =
    let input = Json_serializers.describe_firewall_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DescribeFirewall" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_firewall_response_of_yojson
      ~error_deserializer
end

module DescribeContainerAssociation = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_container_association_request) =
    let input = Json_serializers.describe_container_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DescribeContainerAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_container_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_container_association_request) =
    let input = Json_serializers.describe_container_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DescribeContainerAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_container_association_response_of_yojson
      ~error_deserializer
end

module DeleteVpcEndpointAssociation = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidOperationException _ -> "com.amazonaws.networkfirewall#InvalidOperationException"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_vpc_endpoint_association_request) =
    let input = Json_serializers.delete_vpc_endpoint_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DeleteVpcEndpointAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_vpc_endpoint_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_vpc_endpoint_association_request) =
    let input = Json_serializers.delete_vpc_endpoint_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DeleteVpcEndpointAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_vpc_endpoint_association_response_of_yojson
      ~error_deserializer
end

module DeleteTLSInspectionConfiguration = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidOperationException _ -> "com.amazonaws.networkfirewall#InvalidOperationException"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_tls_inspection_configuration_request) =
    let input = Json_serializers.delete_tls_inspection_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DeleteTLSInspectionConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_tls_inspection_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_tls_inspection_configuration_request) =
    let input = Json_serializers.delete_tls_inspection_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DeleteTLSInspectionConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_tls_inspection_configuration_response_of_yojson
      ~error_deserializer
end

module DeleteRuleGroup = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidOperationException _ -> "com.amazonaws.networkfirewall#InvalidOperationException"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.networkfirewall#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_rule_group_request) =
    let input = Json_serializers.delete_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.DeleteRuleGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_rule_group_request) =
    let input = Json_serializers.delete_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DeleteRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_rule_group_response_of_yojson
      ~error_deserializer
end

module DeleteResourcePolicy = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidResourcePolicyException _ ->
        "com.amazonaws.networkfirewall#InvalidResourcePolicyException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidResourcePolicyException" ->
          `InvalidResourcePolicyException
            (Json_deserializers.invalid_resource_policy_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.DeleteResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DeleteResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer
end

module DeleteProxyRules = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_proxy_rules_request) =
    let input = Json_serializers.delete_proxy_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.DeleteProxyRules"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_proxy_rules_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_proxy_rules_request) =
    let input = Json_serializers.delete_proxy_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DeleteProxyRules" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_proxy_rules_response_of_yojson
      ~error_deserializer
end

module DeleteProxyRuleGroup = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_proxy_rule_group_request) =
    let input = Json_serializers.delete_proxy_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.DeleteProxyRuleGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_proxy_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_proxy_rule_group_request) =
    let input = Json_serializers.delete_proxy_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DeleteProxyRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_proxy_rule_group_response_of_yojson
      ~error_deserializer
end

module DeleteProxyConfiguration = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_proxy_configuration_request) =
    let input = Json_serializers.delete_proxy_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DeleteProxyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_proxy_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_proxy_configuration_request) =
    let input = Json_serializers.delete_proxy_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DeleteProxyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_proxy_configuration_response_of_yojson
      ~error_deserializer
end

module DeleteProxy = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.networkfirewall#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_proxy_request) =
    let input = Json_serializers.delete_proxy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.DeleteProxy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_proxy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_proxy_request) =
    let input = Json_serializers.delete_proxy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DeleteProxy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_proxy_response_of_yojson ~error_deserializer
end

module DeleteNetworkFirewallTransitGatewayAttachment = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_network_firewall_transit_gateway_attachment_request) =
    let input =
      Json_serializers.delete_network_firewall_transit_gateway_attachment_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DeleteNetworkFirewallTransitGatewayAttachment" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_network_firewall_transit_gateway_attachment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : delete_network_firewall_transit_gateway_attachment_request) =
    let input =
      Json_serializers.delete_network_firewall_transit_gateway_attachment_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DeleteNetworkFirewallTransitGatewayAttachment" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_network_firewall_transit_gateway_attachment_response_of_yojson
      ~error_deserializer
end

module DeleteFirewallPolicy = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidOperationException _ -> "com.amazonaws.networkfirewall#InvalidOperationException"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.networkfirewall#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_firewall_policy_request) =
    let input = Json_serializers.delete_firewall_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.DeleteFirewallPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_firewall_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_firewall_policy_request) =
    let input = Json_serializers.delete_firewall_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DeleteFirewallPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_firewall_policy_response_of_yojson
      ~error_deserializer
end

module DeleteFirewall = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidOperationException _ -> "com.amazonaws.networkfirewall#InvalidOperationException"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.networkfirewall#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_firewall_request) =
    let input = Json_serializers.delete_firewall_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.DeleteFirewall"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_firewall_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_firewall_request) =
    let input = Json_serializers.delete_firewall_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DeleteFirewall" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_firewall_response_of_yojson ~error_deserializer
end

module DeleteContainerAssociation = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidOperationException _ -> "com.amazonaws.networkfirewall#InvalidOperationException"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_container_association_request) =
    let input = Json_serializers.delete_container_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.DeleteContainerAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_container_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_container_association_request) =
    let input = Json_serializers.delete_container_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.DeleteContainerAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_container_association_response_of_yojson
      ~error_deserializer
end

module CreateVpcEndpointAssociation = struct
  let error_to_string = function
    | `InsufficientCapacityException _ ->
        "com.amazonaws.networkfirewall#InsufficientCapacityException"
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidOperationException _ -> "com.amazonaws.networkfirewall#InvalidOperationException"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.networkfirewall#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientCapacityException" ->
          `InsufficientCapacityException
            (Json_deserializers.insufficient_capacity_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_vpc_endpoint_association_request) =
    let input = Json_serializers.create_vpc_endpoint_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.CreateVpcEndpointAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_vpc_endpoint_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_vpc_endpoint_association_request) =
    let input = Json_serializers.create_vpc_endpoint_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.CreateVpcEndpointAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_vpc_endpoint_association_response_of_yojson
      ~error_deserializer
end

module CreateTLSInspectionConfiguration = struct
  let error_to_string = function
    | `InsufficientCapacityException _ ->
        "com.amazonaws.networkfirewall#InsufficientCapacityException"
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.networkfirewall#LimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientCapacityException" ->
          `InsufficientCapacityException
            (Json_deserializers.insufficient_capacity_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_tls_inspection_configuration_request) =
    let input = Json_serializers.create_tls_inspection_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.CreateTLSInspectionConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_tls_inspection_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_tls_inspection_configuration_request) =
    let input = Json_serializers.create_tls_inspection_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.CreateTLSInspectionConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_tls_inspection_configuration_response_of_yojson
      ~error_deserializer
end

module CreateRuleGroup = struct
  let error_to_string = function
    | `InsufficientCapacityException _ ->
        "com.amazonaws.networkfirewall#InsufficientCapacityException"
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.networkfirewall#LimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientCapacityException" ->
          `InsufficientCapacityException
            (Json_deserializers.insufficient_capacity_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_rule_group_request) =
    let input = Json_serializers.create_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.CreateRuleGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_rule_group_request) =
    let input = Json_serializers.create_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.CreateRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_rule_group_response_of_yojson
      ~error_deserializer
end

module CreateProxyRules = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_proxy_rules_request) =
    let input = Json_serializers.create_proxy_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.CreateProxyRules"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_proxy_rules_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_proxy_rules_request) =
    let input = Json_serializers.create_proxy_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.CreateProxyRules" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_proxy_rules_response_of_yojson
      ~error_deserializer
end

module CreateProxyRuleGroup = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.networkfirewall#LimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_proxy_rule_group_request) =
    let input = Json_serializers.create_proxy_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.CreateProxyRuleGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_proxy_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_proxy_rule_group_request) =
    let input = Json_serializers.create_proxy_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.CreateProxyRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_proxy_rule_group_response_of_yojson
      ~error_deserializer
end

module CreateProxyConfiguration = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.networkfirewall#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_proxy_configuration_request) =
    let input = Json_serializers.create_proxy_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.CreateProxyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_proxy_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_proxy_configuration_request) =
    let input = Json_serializers.create_proxy_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.CreateProxyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_proxy_configuration_response_of_yojson
      ~error_deserializer
end

module CreateProxy = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.networkfirewall#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.networkfirewall#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_proxy_request) =
    let input = Json_serializers.create_proxy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.CreateProxy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_proxy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_proxy_request) =
    let input = Json_serializers.create_proxy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.CreateProxy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_proxy_response_of_yojson ~error_deserializer
end

module CreateFirewallPolicy = struct
  let error_to_string = function
    | `InsufficientCapacityException _ ->
        "com.amazonaws.networkfirewall#InsufficientCapacityException"
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.networkfirewall#LimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientCapacityException" ->
          `InsufficientCapacityException
            (Json_deserializers.insufficient_capacity_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_firewall_policy_request) =
    let input = Json_serializers.create_firewall_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.CreateFirewallPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_firewall_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_firewall_policy_request) =
    let input = Json_serializers.create_firewall_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.CreateFirewallPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_firewall_policy_response_of_yojson
      ~error_deserializer
end

module CreateFirewall = struct
  let error_to_string = function
    | `InsufficientCapacityException _ ->
        "com.amazonaws.networkfirewall#InsufficientCapacityException"
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidOperationException _ -> "com.amazonaws.networkfirewall#InvalidOperationException"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.networkfirewall#LimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientCapacityException" ->
          `InsufficientCapacityException
            (Json_deserializers.insufficient_capacity_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_firewall_request) =
    let input = Json_serializers.create_firewall_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.CreateFirewall"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_firewall_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_firewall_request) =
    let input = Json_serializers.create_firewall_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.CreateFirewall" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_firewall_response_of_yojson ~error_deserializer
end

module CreateContainerAssociation = struct
  let error_to_string = function
    | `InsufficientCapacityException _ ->
        "com.amazonaws.networkfirewall#InsufficientCapacityException"
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.networkfirewall#LimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientCapacityException" ->
          `InsufficientCapacityException
            (Json_deserializers.insufficient_capacity_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_container_association_request) =
    let input = Json_serializers.create_container_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.CreateContainerAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_container_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_container_association_request) =
    let input = Json_serializers.create_container_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.CreateContainerAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_container_association_response_of_yojson
      ~error_deserializer
end

module AttachRuleGroupsToProxyConfiguration = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : attach_rule_groups_to_proxy_configuration_request) =
    let input =
      Json_serializers.attach_rule_groups_to_proxy_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.AttachRuleGroupsToProxyConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.attach_rule_groups_to_proxy_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : attach_rule_groups_to_proxy_configuration_request) =
    let input =
      Json_serializers.attach_rule_groups_to_proxy_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.AttachRuleGroupsToProxyConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.attach_rule_groups_to_proxy_configuration_response_of_yojson
      ~error_deserializer
end

module AssociateSubnets = struct
  let error_to_string = function
    | `InsufficientCapacityException _ ->
        "com.amazonaws.networkfirewall#InsufficientCapacityException"
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidOperationException _ -> "com.amazonaws.networkfirewall#InvalidOperationException"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientCapacityException" ->
          `InsufficientCapacityException
            (Json_deserializers.insufficient_capacity_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_subnets_request) =
    let input = Json_serializers.associate_subnets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"NetworkFirewall_20201112.AssociateSubnets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_subnets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_subnets_request) =
    let input = Json_serializers.associate_subnets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.AssociateSubnets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_subnets_response_of_yojson
      ~error_deserializer
end

module AssociateFirewallPolicy = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidOperationException _ -> "com.amazonaws.networkfirewall#InvalidOperationException"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_firewall_policy_request) =
    let input = Json_serializers.associate_firewall_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.AssociateFirewallPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_firewall_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_firewall_policy_request) =
    let input = Json_serializers.associate_firewall_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.AssociateFirewallPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_firewall_policy_response_of_yojson
      ~error_deserializer
end

module AssociateAvailabilityZones = struct
  let error_to_string = function
    | `InsufficientCapacityException _ ->
        "com.amazonaws.networkfirewall#InsufficientCapacityException"
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidOperationException _ -> "com.amazonaws.networkfirewall#InvalidOperationException"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `InvalidTokenException _ -> "com.amazonaws.networkfirewall#InvalidTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientCapacityException" ->
          `InsufficientCapacityException
            (Json_deserializers.insufficient_capacity_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_availability_zones_request) =
    let input = Json_serializers.associate_availability_zones_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.AssociateAvailabilityZones" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_availability_zones_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_availability_zones_request) =
    let input = Json_serializers.associate_availability_zones_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.AssociateAvailabilityZones" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_availability_zones_response_of_yojson
      ~error_deserializer
end

module AcceptNetworkFirewallTransitGatewayAttachment = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.networkfirewall#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.networkfirewall#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.networkfirewall#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.networkfirewall#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : accept_network_firewall_transit_gateway_attachment_request) =
    let input =
      Json_serializers.accept_network_firewall_transit_gateway_attachment_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"NetworkFirewall_20201112.AcceptNetworkFirewallTransitGatewayAttachment" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.accept_network_firewall_transit_gateway_attachment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : accept_network_firewall_transit_gateway_attachment_request) =
    let input =
      Json_serializers.accept_network_firewall_transit_gateway_attachment_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"NetworkFirewall_20201112.AcceptNetworkFirewallTransitGatewayAttachment" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.accept_network_firewall_transit_gateway_attachment_response_of_yojson
      ~error_deserializer
end
