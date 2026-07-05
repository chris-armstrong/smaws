open Types
open Service_metadata

module AssociateAdminAccount = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `LimitExceededException _ -> "com.amazonaws.fms#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_admin_account_request) =
    let input = Json_serializers.associate_admin_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.AssociateAdminAccount" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module AssociateThirdPartyFirewall = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_third_party_firewall_request) =
    let input = Json_serializers.associate_third_party_firewall_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.AssociateThirdPartyFirewall"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_third_party_firewall_response_of_yojson
      ~error_deserializer
end

module BatchAssociateResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `LimitExceededException _ -> "com.amazonaws.fms#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_associate_resource_request) =
    let input = Json_serializers.batch_associate_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.BatchAssociateResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_associate_resource_response_of_yojson
      ~error_deserializer
end

module BatchDisassociateResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_disassociate_resource_request) =
    let input = Json_serializers.batch_disassociate_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.BatchDisassociateResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_disassociate_resource_response_of_yojson
      ~error_deserializer
end

module DeleteAppsList = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_apps_list_request) =
    let input = Json_serializers.delete_apps_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.DeleteAppsList" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteNotificationChannel = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_notification_channel_request) =
    let input = Json_serializers.delete_notification_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.DeleteNotificationChannel"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeletePolicy = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `LimitExceededException _ -> "com.amazonaws.fms#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_policy_request) =
    let input = Json_serializers.delete_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.DeletePolicy" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteProtocolsList = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_protocols_list_request) =
    let input = Json_serializers.delete_protocols_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.DeleteProtocolsList" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteResourceSet = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resource_set_request) =
    let input = Json_serializers.delete_resource_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.DeleteResourceSet" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DisassociateAdminAccount = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_admin_account_request) =
    let input = Json_serializers.disassociate_admin_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.DisassociateAdminAccount"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DisassociateThirdPartyFirewall = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_third_party_firewall_request) =
    let input = Json_serializers.disassociate_third_party_firewall_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.DisassociateThirdPartyFirewall"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_third_party_firewall_response_of_yojson
      ~error_deserializer
end

module GetAdminAccount = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_admin_account_request) =
    let input = Json_serializers.get_admin_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.GetAdminAccount" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_admin_account_response_of_yojson
      ~error_deserializer
end

module GetAdminScope = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `LimitExceededException _ -> "com.amazonaws.fms#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_admin_scope_request) =
    let input = Json_serializers.get_admin_scope_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.GetAdminScope" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_admin_scope_response_of_yojson
      ~error_deserializer
end

module GetAppsList = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_apps_list_request) =
    let input = Json_serializers.get_apps_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.GetAppsList" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_apps_list_response_of_yojson
      ~error_deserializer
end

module GetComplianceDetail = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_compliance_detail_request) =
    let input = Json_serializers.get_compliance_detail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.GetComplianceDetail" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_compliance_detail_response_of_yojson
      ~error_deserializer
end

module GetNotificationChannel = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_notification_channel_request) =
    let input = Json_serializers.get_notification_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.GetNotificationChannel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_notification_channel_response_of_yojson
      ~error_deserializer
end

module GetPolicy = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `InvalidTypeException _ -> "com.amazonaws.fms#InvalidTypeException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidTypeException" ->
          `InvalidTypeException (Json_deserializers.invalid_type_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_policy_request) =
    let input = Json_serializers.get_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.GetPolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_policy_response_of_yojson
      ~error_deserializer
end

module GetProtectionStatus = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_protection_status_request) =
    let input = Json_serializers.get_protection_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.GetProtectionStatus" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_protection_status_response_of_yojson
      ~error_deserializer
end

module GetProtocolsList = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_protocols_list_request) =
    let input = Json_serializers.get_protocols_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.GetProtocolsList" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_protocols_list_response_of_yojson
      ~error_deserializer
end

module GetResourceSet = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_set_request) =
    let input = Json_serializers.get_resource_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.GetResourceSet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_resource_set_response_of_yojson
      ~error_deserializer
end

module GetThirdPartyFirewallAssociationStatus = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_third_party_firewall_association_status_request) =
    let input =
      Json_serializers.get_third_party_firewall_association_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSFMS_20180101.GetThirdPartyFirewallAssociationStatus" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_third_party_firewall_association_status_response_of_yojson
      ~error_deserializer
end

module GetViolationDetails = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_violation_details_request) =
    let input = Json_serializers.get_violation_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.GetViolationDetails" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_violation_details_response_of_yojson
      ~error_deserializer
end

module ListAdminAccountsForOrganization = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `LimitExceededException _ -> "com.amazonaws.fms#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_admin_accounts_for_organization_request) =
    let input = Json_serializers.list_admin_accounts_for_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSFMS_20180101.ListAdminAccountsForOrganization" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_admin_accounts_for_organization_response_of_yojson
      ~error_deserializer
end

module ListAdminsManagingAccount = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_admins_managing_account_request) =
    let input = Json_serializers.list_admins_managing_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.ListAdminsManagingAccount"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_admins_managing_account_response_of_yojson
      ~error_deserializer
end

module ListAppsLists = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `LimitExceededException _ -> "com.amazonaws.fms#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_apps_lists_request) =
    let input = Json_serializers.list_apps_lists_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.ListAppsLists" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_apps_lists_response_of_yojson
      ~error_deserializer
end

module ListComplianceStatus = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_compliance_status_request) =
    let input = Json_serializers.list_compliance_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.ListComplianceStatus" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_compliance_status_response_of_yojson
      ~error_deserializer
end

module ListDiscoveredResources = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_discovered_resources_request) =
    let input = Json_serializers.list_discovered_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.ListDiscoveredResources"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_discovered_resources_response_of_yojson
      ~error_deserializer
end

module ListMemberAccounts = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_member_accounts_request) =
    let input = Json_serializers.list_member_accounts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.ListMemberAccounts" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_member_accounts_response_of_yojson
      ~error_deserializer
end

module ListPolicies = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `LimitExceededException _ -> "com.amazonaws.fms#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_policies_request) =
    let input = Json_serializers.list_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.ListPolicies" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_policies_response_of_yojson
      ~error_deserializer
end

module ListProtocolsLists = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_protocols_lists_request) =
    let input = Json_serializers.list_protocols_lists_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.ListProtocolsLists" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_protocols_lists_response_of_yojson
      ~error_deserializer
end

module ListResourceSetResources = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resource_set_resources_request) =
    let input = Json_serializers.list_resource_set_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.ListResourceSetResources"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_set_resources_response_of_yojson
      ~error_deserializer
end

module ListResourceSets = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resource_sets_request) =
    let input = Json_serializers.list_resource_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.ListResourceSets" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_resource_sets_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListThirdPartyFirewallFirewallPolicies = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_third_party_firewall_firewall_policies_request) =
    let input =
      Json_serializers.list_third_party_firewall_firewall_policies_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSFMS_20180101.ListThirdPartyFirewallFirewallPolicies" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_third_party_firewall_firewall_policies_response_of_yojson
      ~error_deserializer
end

module PutAdminAccount = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `LimitExceededException _ -> "com.amazonaws.fms#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_admin_account_request) =
    let input = Json_serializers.put_admin_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.PutAdminAccount" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutAppsList = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `LimitExceededException _ -> "com.amazonaws.fms#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_apps_list_request) =
    let input = Json_serializers.put_apps_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.PutAppsList" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_apps_list_response_of_yojson
      ~error_deserializer
end

module PutNotificationChannel = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_notification_channel_request) =
    let input = Json_serializers.put_notification_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.PutNotificationChannel"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutPolicy = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `InvalidTypeException _ -> "com.amazonaws.fms#InvalidTypeException"
    | `LimitExceededException _ -> "com.amazonaws.fms#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidTypeException" ->
          `InvalidTypeException (Json_deserializers.invalid_type_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_policy_request) =
    let input = Json_serializers.put_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.PutPolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_policy_response_of_yojson
      ~error_deserializer
end

module PutProtocolsList = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `LimitExceededException _ -> "com.amazonaws.fms#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_protocols_list_request) =
    let input = Json_serializers.put_protocols_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.PutProtocolsList" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_protocols_list_response_of_yojson
      ~error_deserializer
end

module PutResourceSet = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `LimitExceededException _ -> "com.amazonaws.fms#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_resource_set_request) =
    let input = Json_serializers.put_resource_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.PutResourceSet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_resource_set_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `LimitExceededException _ -> "com.amazonaws.fms#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.fms#InternalErrorException"
    | `InvalidInputException _ -> "com.amazonaws.fms#InvalidInputException"
    | `InvalidOperationException _ -> "com.amazonaws.fms#InvalidOperationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.fms#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFMS_20180101.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer
end
