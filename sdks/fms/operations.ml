open Types
module AssociateAdminAccount =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : associate_admin_account_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.associate_admin_account_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101AssociateAdminAccount" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module AssociateThirdPartyFirewall =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : associate_third_party_firewall_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.associate_third_party_firewall_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101AssociateThirdPartyFirewall" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:associate_third_party_firewall_response_of_yojson
            ~error_deserializer
  end
module BatchAssociateResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : batch_associate_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.batch_associate_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101BatchAssociateResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:batch_associate_resource_response_of_yojson
            ~error_deserializer
  end
module BatchDisassociateResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : batch_disassociate_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.batch_disassociate_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101BatchDisassociateResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:batch_disassociate_resource_response_of_yojson
            ~error_deserializer
  end
module DeleteAppsList =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_apps_list_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_apps_list_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101DeleteAppsList" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteNotificationChannel =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_notification_channel_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101DeleteNotificationChannel" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeletePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101DeletePolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteProtocolsList =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_protocols_list_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_protocols_list_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101DeleteProtocolsList" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteResourceSet =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_resource_set_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_resource_set_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101DeleteResourceSet" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DisassociateAdminAccount =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disassociate_admin_account_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101DisassociateAdminAccount" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DisassociateThirdPartyFirewall =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disassociate_third_party_firewall_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disassociate_third_party_firewall_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101DisassociateThirdPartyFirewall"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:disassociate_third_party_firewall_response_of_yojson
            ~error_deserializer
  end
module GetAdminAccount =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_admin_account_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101GetAdminAccount" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_admin_account_response_of_yojson
            ~error_deserializer
  end
module GetAdminScope =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_admin_scope_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_admin_scope_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101GetAdminScope" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_admin_scope_response_of_yojson
            ~error_deserializer
  end
module GetAppsList =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_apps_list_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_apps_list_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101GetAppsList" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_apps_list_response_of_yojson
            ~error_deserializer
  end
module GetComplianceDetail =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_compliance_detail_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_compliance_detail_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101GetComplianceDetail" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_compliance_detail_response_of_yojson
            ~error_deserializer
  end
module GetNotificationChannel =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_notification_channel_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101GetNotificationChannel" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_notification_channel_response_of_yojson
            ~error_deserializer
  end
module GetPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "InvalidTypeException") ->
              `InvalidTypeException
                (invalid_type_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101GetPolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_policy_response_of_yojson
            ~error_deserializer
  end
module GetProtectionStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_protection_status_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_protection_status_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101GetProtectionStatus" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_protection_status_response_of_yojson
            ~error_deserializer
  end
module GetProtocolsList =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_protocols_list_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_protocols_list_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101GetProtocolsList" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_protocols_list_response_of_yojson
            ~error_deserializer
  end
module GetResourceSet =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_resource_set_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_resource_set_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101GetResourceSet" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_resource_set_response_of_yojson
            ~error_deserializer
  end
module GetThirdPartyFirewallAssociationStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_third_party_firewall_association_status_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_third_party_firewall_association_status_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101GetThirdPartyFirewallAssociationStatus"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_third_party_firewall_association_status_response_of_yojson
            ~error_deserializer
  end
module GetViolationDetails =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_violation_details_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_violation_details_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101GetViolationDetails" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_violation_details_response_of_yojson
            ~error_deserializer
  end
module ListAdminAccountsForOrganization =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_admin_accounts_for_organization_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_admin_accounts_for_organization_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101ListAdminAccountsForOrganization"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_admin_accounts_for_organization_response_of_yojson
            ~error_deserializer
  end
module ListAdminsManagingAccount =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_admins_managing_account_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_admins_managing_account_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101ListAdminsManagingAccount" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_admins_managing_account_response_of_yojson
            ~error_deserializer
  end
module ListAppsLists =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_apps_lists_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_apps_lists_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101ListAppsLists" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_apps_lists_response_of_yojson
            ~error_deserializer
  end
module ListComplianceStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_compliance_status_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_compliance_status_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101ListComplianceStatus" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_compliance_status_response_of_yojson
            ~error_deserializer
  end
module ListDiscoveredResources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_discovered_resources_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_discovered_resources_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101ListDiscoveredResources" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_discovered_resources_response_of_yojson
            ~error_deserializer
  end
module ListMemberAccounts =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_member_accounts_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_member_accounts_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101ListMemberAccounts" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_member_accounts_response_of_yojson
            ~error_deserializer
  end
module ListPolicies =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_policies_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_policies_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101ListPolicies" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_policies_response_of_yojson
            ~error_deserializer
  end
module ListProtocolsLists =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_protocols_lists_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_protocols_lists_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101ListProtocolsLists" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_protocols_lists_response_of_yojson
            ~error_deserializer
  end
module ListResourceSetResources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_resource_set_resources_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_resource_set_resources_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101ListResourceSetResources" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_resource_set_resources_response_of_yojson
            ~error_deserializer
  end
module ListResourceSets =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_resource_sets_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_resource_sets_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101ListResourceSets" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_resource_sets_response_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_tags_for_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_tags_for_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101ListTagsForResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_for_resource_response_of_yojson
            ~error_deserializer
  end
module ListThirdPartyFirewallFirewallPolicies =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_third_party_firewall_firewall_policies_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_third_party_firewall_firewall_policies_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101ListThirdPartyFirewallFirewallPolicies"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_third_party_firewall_firewall_policies_response_of_yojson
            ~error_deserializer
  end
module PutAdminAccount =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_admin_account_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_admin_account_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101PutAdminAccount" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module PutAppsList =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_apps_list_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_apps_list_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101PutAppsList" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_apps_list_response_of_yojson
            ~error_deserializer
  end
module PutNotificationChannel =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_notification_channel_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_notification_channel_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101PutNotificationChannel" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module PutPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "InvalidTypeException") ->
              `InvalidTypeException
                (invalid_type_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101PutPolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_policy_response_of_yojson
            ~error_deserializer
  end
module PutProtocolsList =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_protocols_list_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_protocols_list_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101PutProtocolsList" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_protocols_list_response_of_yojson
            ~error_deserializer
  end
module PutResourceSet =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_resource_set_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_resource_set_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101PutResourceSet" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_resource_set_response_of_yojson
            ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : tag_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.tag_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101TagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:tag_resource_response_of_yojson
            ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : untag_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.untag_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSFMS_20180101UntagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:untag_resource_response_of_yojson
            ~error_deserializer
  end