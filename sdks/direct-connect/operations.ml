open Types
open Service_metadata

module AcceptDirectConnectGatewayAssociationProposal = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : accept_direct_connect_gateway_association_proposal_request) =
    let input =
      Json_serializers.accept_direct_connect_gateway_association_proposal_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OvertureService.AcceptDirectConnectGatewayAssociationProposal" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.accept_direct_connect_gateway_association_proposal_result_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : accept_direct_connect_gateway_association_proposal_request) =
    let input =
      Json_serializers.accept_direct_connect_gateway_association_proposal_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.AcceptDirectConnectGatewayAssociationProposal" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.accept_direct_connect_gateway_association_proposal_result_of_yojson
      ~error_deserializer
end

module AllocateConnectionOnInterconnect = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : allocate_connection_on_interconnect_request) =
    let input = Json_serializers.allocate_connection_on_interconnect_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OvertureService.AllocateConnectionOnInterconnect" ~service ~context ~input
      ~output_deserializer:Json_deserializers.connection_of_yojson ~error_deserializer

  let request_with_metadata context (request : allocate_connection_on_interconnect_request) =
    let input = Json_serializers.allocate_connection_on_interconnect_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.AllocateConnectionOnInterconnect" ~service ~context ~input
      ~output_deserializer:Json_deserializers.connection_of_yojson ~error_deserializer
end

module AllocateHostedConnection = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | `DuplicateTagKeysException _ -> "com.amazonaws.directconnect#DuplicateTagKeysException"
    | `TooManyTagsException _ -> "com.amazonaws.directconnect#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _, "DuplicateTagKeysException" ->
          `DuplicateTagKeysException
            (Json_deserializers.duplicate_tag_keys_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : allocate_hosted_connection_request) =
    let input = Json_serializers.allocate_hosted_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.AllocateHostedConnection"
      ~service ~context ~input ~output_deserializer:Json_deserializers.connection_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : allocate_hosted_connection_request) =
    let input = Json_serializers.allocate_hosted_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.AllocateHostedConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.connection_of_yojson ~error_deserializer
end

module AllocatePrivateVirtualInterface = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | `DuplicateTagKeysException _ -> "com.amazonaws.directconnect#DuplicateTagKeysException"
    | `LimitExceededException _ -> "com.amazonaws.directconnect#LimitExceededException"
    | `TooManyTagsException _ -> "com.amazonaws.directconnect#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _, "DuplicateTagKeysException" ->
          `DuplicateTagKeysException
            (Json_deserializers.duplicate_tag_keys_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : allocate_private_virtual_interface_request) =
    let input = Json_serializers.allocate_private_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OvertureService.AllocatePrivateVirtualInterface" ~service ~context ~input
      ~output_deserializer:Json_deserializers.virtual_interface_of_yojson ~error_deserializer

  let request_with_metadata context (request : allocate_private_virtual_interface_request) =
    let input = Json_serializers.allocate_private_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.AllocatePrivateVirtualInterface" ~service ~context ~input
      ~output_deserializer:Json_deserializers.virtual_interface_of_yojson ~error_deserializer
end

module AllocatePublicVirtualInterface = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | `DuplicateTagKeysException _ -> "com.amazonaws.directconnect#DuplicateTagKeysException"
    | `LimitExceededException _ -> "com.amazonaws.directconnect#LimitExceededException"
    | `TooManyTagsException _ -> "com.amazonaws.directconnect#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _, "DuplicateTagKeysException" ->
          `DuplicateTagKeysException
            (Json_deserializers.duplicate_tag_keys_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : allocate_public_virtual_interface_request) =
    let input = Json_serializers.allocate_public_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.AllocatePublicVirtualInterface"
      ~service ~context ~input ~output_deserializer:Json_deserializers.virtual_interface_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : allocate_public_virtual_interface_request) =
    let input = Json_serializers.allocate_public_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.AllocatePublicVirtualInterface" ~service ~context ~input
      ~output_deserializer:Json_deserializers.virtual_interface_of_yojson ~error_deserializer
end

module AllocateTransitVirtualInterface = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | `DuplicateTagKeysException _ -> "com.amazonaws.directconnect#DuplicateTagKeysException"
    | `LimitExceededException _ -> "com.amazonaws.directconnect#LimitExceededException"
    | `TooManyTagsException _ -> "com.amazonaws.directconnect#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _, "DuplicateTagKeysException" ->
          `DuplicateTagKeysException
            (Json_deserializers.duplicate_tag_keys_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : allocate_transit_virtual_interface_request) =
    let input = Json_serializers.allocate_transit_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OvertureService.AllocateTransitVirtualInterface" ~service ~context ~input
      ~output_deserializer:Json_deserializers.allocate_transit_virtual_interface_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : allocate_transit_virtual_interface_request) =
    let input = Json_serializers.allocate_transit_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.AllocateTransitVirtualInterface" ~service ~context ~input
      ~output_deserializer:Json_deserializers.allocate_transit_virtual_interface_result_of_yojson
      ~error_deserializer
end

module AssociateConnectionWithLag = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | `LimitExceededException _ -> "com.amazonaws.directconnect#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_connection_with_lag_request) =
    let input = Json_serializers.associate_connection_with_lag_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.AssociateConnectionWithLag"
      ~service ~context ~input ~output_deserializer:Json_deserializers.connection_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_connection_with_lag_request) =
    let input = Json_serializers.associate_connection_with_lag_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.AssociateConnectionWithLag" ~service ~context ~input
      ~output_deserializer:Json_deserializers.connection_of_yojson ~error_deserializer
end

module AssociateHostedConnection = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_hosted_connection_request) =
    let input = Json_serializers.associate_hosted_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.AssociateHostedConnection"
      ~service ~context ~input ~output_deserializer:Json_deserializers.connection_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_hosted_connection_request) =
    let input = Json_serializers.associate_hosted_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.AssociateHostedConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.connection_of_yojson ~error_deserializer
end

module AssociateMacSecKey = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_mac_sec_key_request) =
    let input = Json_serializers.associate_mac_sec_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.AssociateMacSecKey" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.associate_mac_sec_key_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_mac_sec_key_request) =
    let input = Json_serializers.associate_mac_sec_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.AssociateMacSecKey" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_mac_sec_key_response_of_yojson
      ~error_deserializer
end

module AssociateVirtualInterface = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_virtual_interface_request) =
    let input = Json_serializers.associate_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.AssociateVirtualInterface"
      ~service ~context ~input ~output_deserializer:Json_deserializers.virtual_interface_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_virtual_interface_request) =
    let input = Json_serializers.associate_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.AssociateVirtualInterface" ~service ~context ~input
      ~output_deserializer:Json_deserializers.virtual_interface_of_yojson ~error_deserializer
end

module ConfirmConnection = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : confirm_connection_request) =
    let input = Json_serializers.confirm_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.ConfirmConnection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.confirm_connection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : confirm_connection_request) =
    let input = Json_serializers.confirm_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.ConfirmConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.confirm_connection_response_of_yojson
      ~error_deserializer
end

module ConfirmCustomerAgreement = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : confirm_customer_agreement_request) =
    let input = Json_serializers.confirm_customer_agreement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.ConfirmCustomerAgreement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.confirm_customer_agreement_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : confirm_customer_agreement_request) =
    let input = Json_serializers.confirm_customer_agreement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.ConfirmCustomerAgreement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.confirm_customer_agreement_response_of_yojson
      ~error_deserializer
end

module ConfirmPrivateVirtualInterface = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : confirm_private_virtual_interface_request) =
    let input = Json_serializers.confirm_private_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.ConfirmPrivateVirtualInterface"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.confirm_private_virtual_interface_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : confirm_private_virtual_interface_request) =
    let input = Json_serializers.confirm_private_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.ConfirmPrivateVirtualInterface" ~service ~context ~input
      ~output_deserializer:Json_deserializers.confirm_private_virtual_interface_response_of_yojson
      ~error_deserializer
end

module ConfirmPublicVirtualInterface = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : confirm_public_virtual_interface_request) =
    let input = Json_serializers.confirm_public_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.ConfirmPublicVirtualInterface"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.confirm_public_virtual_interface_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : confirm_public_virtual_interface_request) =
    let input = Json_serializers.confirm_public_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.ConfirmPublicVirtualInterface" ~service ~context ~input
      ~output_deserializer:Json_deserializers.confirm_public_virtual_interface_response_of_yojson
      ~error_deserializer
end

module ConfirmTransitVirtualInterface = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : confirm_transit_virtual_interface_request) =
    let input = Json_serializers.confirm_transit_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.ConfirmTransitVirtualInterface"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.confirm_transit_virtual_interface_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : confirm_transit_virtual_interface_request) =
    let input = Json_serializers.confirm_transit_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.ConfirmTransitVirtualInterface" ~service ~context ~input
      ~output_deserializer:Json_deserializers.confirm_transit_virtual_interface_response_of_yojson
      ~error_deserializer
end

module CreateBGPPeer = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_bgp_peer_request) =
    let input = Json_serializers.create_bgp_peer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.CreateBGPPeer" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_bgp_peer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_bgp_peer_request) =
    let input = Json_serializers.create_bgp_peer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"OvertureService.CreateBGPPeer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_bgp_peer_response_of_yojson ~error_deserializer
end

module CreateConnection = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | `DuplicateTagKeysException _ -> "com.amazonaws.directconnect#DuplicateTagKeysException"
    | `TooManyTagsException _ -> "com.amazonaws.directconnect#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _, "DuplicateTagKeysException" ->
          `DuplicateTagKeysException
            (Json_deserializers.duplicate_tag_keys_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_connection_request) =
    let input = Json_serializers.create_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.CreateConnection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.connection_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_connection_request) =
    let input = Json_serializers.create_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"OvertureService.CreateConnection"
      ~service ~context ~input ~output_deserializer:Json_deserializers.connection_of_yojson
      ~error_deserializer
end

module CreateDirectConnectGateway = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_direct_connect_gateway_request) =
    let input = Json_serializers.create_direct_connect_gateway_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.CreateDirectConnectGateway"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_direct_connect_gateway_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_direct_connect_gateway_request) =
    let input = Json_serializers.create_direct_connect_gateway_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.CreateDirectConnectGateway" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_direct_connect_gateway_result_of_yojson
      ~error_deserializer
end

module CreateDirectConnectGatewayAssociation = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_direct_connect_gateway_association_request) =
    let input =
      Json_serializers.create_direct_connect_gateway_association_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OvertureService.CreateDirectConnectGatewayAssociation" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_direct_connect_gateway_association_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_direct_connect_gateway_association_request) =
    let input =
      Json_serializers.create_direct_connect_gateway_association_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.CreateDirectConnectGatewayAssociation" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_direct_connect_gateway_association_result_of_yojson
      ~error_deserializer
end

module CreateDirectConnectGatewayAssociationProposal = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_direct_connect_gateway_association_proposal_request) =
    let input =
      Json_serializers.create_direct_connect_gateway_association_proposal_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OvertureService.CreateDirectConnectGatewayAssociationProposal" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.create_direct_connect_gateway_association_proposal_result_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : create_direct_connect_gateway_association_proposal_request) =
    let input =
      Json_serializers.create_direct_connect_gateway_association_proposal_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.CreateDirectConnectGatewayAssociationProposal" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.create_direct_connect_gateway_association_proposal_result_of_yojson
      ~error_deserializer
end

module CreateInterconnect = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | `DuplicateTagKeysException _ -> "com.amazonaws.directconnect#DuplicateTagKeysException"
    | `TooManyTagsException _ -> "com.amazonaws.directconnect#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _, "DuplicateTagKeysException" ->
          `DuplicateTagKeysException
            (Json_deserializers.duplicate_tag_keys_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_interconnect_request) =
    let input = Json_serializers.create_interconnect_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.CreateInterconnect" ~service
      ~context ~input ~output_deserializer:Json_deserializers.interconnect_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_interconnect_request) =
    let input = Json_serializers.create_interconnect_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.CreateInterconnect" ~service ~context ~input
      ~output_deserializer:Json_deserializers.interconnect_of_yojson ~error_deserializer
end

module CreateLag = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | `DuplicateTagKeysException _ -> "com.amazonaws.directconnect#DuplicateTagKeysException"
    | `TooManyTagsException _ -> "com.amazonaws.directconnect#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _, "DuplicateTagKeysException" ->
          `DuplicateTagKeysException
            (Json_deserializers.duplicate_tag_keys_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_lag_request) =
    let input = Json_serializers.create_lag_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.CreateLag" ~service ~context
      ~input ~output_deserializer:Json_deserializers.lag_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_lag_request) =
    let input = Json_serializers.create_lag_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"OvertureService.CreateLag"
      ~service ~context ~input ~output_deserializer:Json_deserializers.lag_of_yojson
      ~error_deserializer
end

module CreatePrivateVirtualInterface = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | `DuplicateTagKeysException _ -> "com.amazonaws.directconnect#DuplicateTagKeysException"
    | `LimitExceededException _ -> "com.amazonaws.directconnect#LimitExceededException"
    | `TooManyTagsException _ -> "com.amazonaws.directconnect#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _, "DuplicateTagKeysException" ->
          `DuplicateTagKeysException
            (Json_deserializers.duplicate_tag_keys_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_private_virtual_interface_request) =
    let input = Json_serializers.create_private_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.CreatePrivateVirtualInterface"
      ~service ~context ~input ~output_deserializer:Json_deserializers.virtual_interface_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_private_virtual_interface_request) =
    let input = Json_serializers.create_private_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.CreatePrivateVirtualInterface" ~service ~context ~input
      ~output_deserializer:Json_deserializers.virtual_interface_of_yojson ~error_deserializer
end

module CreatePublicVirtualInterface = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | `DuplicateTagKeysException _ -> "com.amazonaws.directconnect#DuplicateTagKeysException"
    | `LimitExceededException _ -> "com.amazonaws.directconnect#LimitExceededException"
    | `TooManyTagsException _ -> "com.amazonaws.directconnect#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _, "DuplicateTagKeysException" ->
          `DuplicateTagKeysException
            (Json_deserializers.duplicate_tag_keys_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_public_virtual_interface_request) =
    let input = Json_serializers.create_public_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.CreatePublicVirtualInterface"
      ~service ~context ~input ~output_deserializer:Json_deserializers.virtual_interface_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_public_virtual_interface_request) =
    let input = Json_serializers.create_public_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.CreatePublicVirtualInterface" ~service ~context ~input
      ~output_deserializer:Json_deserializers.virtual_interface_of_yojson ~error_deserializer
end

module CreateTransitVirtualInterface = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | `DuplicateTagKeysException _ -> "com.amazonaws.directconnect#DuplicateTagKeysException"
    | `LimitExceededException _ -> "com.amazonaws.directconnect#LimitExceededException"
    | `TooManyTagsException _ -> "com.amazonaws.directconnect#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _, "DuplicateTagKeysException" ->
          `DuplicateTagKeysException
            (Json_deserializers.duplicate_tag_keys_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_transit_virtual_interface_request) =
    let input = Json_serializers.create_transit_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.CreateTransitVirtualInterface"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_transit_virtual_interface_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_transit_virtual_interface_request) =
    let input = Json_serializers.create_transit_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.CreateTransitVirtualInterface" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_transit_virtual_interface_result_of_yojson
      ~error_deserializer
end

module DeleteBGPPeer = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_bgp_peer_request) =
    let input = Json_serializers.delete_bgp_peer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DeleteBGPPeer" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_bgp_peer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_bgp_peer_request) =
    let input = Json_serializers.delete_bgp_peer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"OvertureService.DeleteBGPPeer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_bgp_peer_response_of_yojson ~error_deserializer
end

module DeleteConnection = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_connection_request) =
    let input = Json_serializers.delete_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DeleteConnection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.connection_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_connection_request) =
    let input = Json_serializers.delete_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"OvertureService.DeleteConnection"
      ~service ~context ~input ~output_deserializer:Json_deserializers.connection_of_yojson
      ~error_deserializer
end

module DeleteDirectConnectGateway = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_direct_connect_gateway_request) =
    let input = Json_serializers.delete_direct_connect_gateway_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DeleteDirectConnectGateway"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_direct_connect_gateway_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_direct_connect_gateway_request) =
    let input = Json_serializers.delete_direct_connect_gateway_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DeleteDirectConnectGateway" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_direct_connect_gateway_result_of_yojson
      ~error_deserializer
end

module DeleteDirectConnectGatewayAssociation = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_direct_connect_gateway_association_request) =
    let input =
      Json_serializers.delete_direct_connect_gateway_association_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OvertureService.DeleteDirectConnectGatewayAssociation" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_direct_connect_gateway_association_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_direct_connect_gateway_association_request) =
    let input =
      Json_serializers.delete_direct_connect_gateway_association_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DeleteDirectConnectGatewayAssociation" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_direct_connect_gateway_association_result_of_yojson
      ~error_deserializer
end

module DeleteDirectConnectGatewayAssociationProposal = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_direct_connect_gateway_association_proposal_request) =
    let input =
      Json_serializers.delete_direct_connect_gateway_association_proposal_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OvertureService.DeleteDirectConnectGatewayAssociationProposal" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.delete_direct_connect_gateway_association_proposal_result_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : delete_direct_connect_gateway_association_proposal_request) =
    let input =
      Json_serializers.delete_direct_connect_gateway_association_proposal_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DeleteDirectConnectGatewayAssociationProposal" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.delete_direct_connect_gateway_association_proposal_result_of_yojson
      ~error_deserializer
end

module DeleteInterconnect = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_interconnect_request) =
    let input = Json_serializers.delete_interconnect_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DeleteInterconnect" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_interconnect_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_interconnect_request) =
    let input = Json_serializers.delete_interconnect_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DeleteInterconnect" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_interconnect_response_of_yojson
      ~error_deserializer
end

module DeleteLag = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_lag_request) =
    let input = Json_serializers.delete_lag_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DeleteLag" ~service ~context
      ~input ~output_deserializer:Json_deserializers.lag_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_lag_request) =
    let input = Json_serializers.delete_lag_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"OvertureService.DeleteLag"
      ~service ~context ~input ~output_deserializer:Json_deserializers.lag_of_yojson
      ~error_deserializer
end

module DeleteVirtualInterface = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_virtual_interface_request) =
    let input = Json_serializers.delete_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DeleteVirtualInterface"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_virtual_interface_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_virtual_interface_request) =
    let input = Json_serializers.delete_virtual_interface_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DeleteVirtualInterface" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_virtual_interface_response_of_yojson
      ~error_deserializer
end

module DescribeConnectionLoa = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_connection_loa_request) =
    let input = Json_serializers.describe_connection_loa_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DescribeConnectionLoa" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_connection_loa_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_connection_loa_request) =
    let input = Json_serializers.describe_connection_loa_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DescribeConnectionLoa" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_connection_loa_response_of_yojson
      ~error_deserializer
end

module DescribeConnections = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_connections_request) =
    let input = Json_serializers.describe_connections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DescribeConnections" ~service
      ~context ~input ~output_deserializer:Json_deserializers.connections_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_connections_request) =
    let input = Json_serializers.describe_connections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DescribeConnections" ~service ~context ~input
      ~output_deserializer:Json_deserializers.connections_of_yojson ~error_deserializer
end

module DescribeConnectionsOnInterconnect = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_connections_on_interconnect_request) =
    let input = Json_serializers.describe_connections_on_interconnect_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OvertureService.DescribeConnectionsOnInterconnect" ~service ~context ~input
      ~output_deserializer:Json_deserializers.connections_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_connections_on_interconnect_request) =
    let input = Json_serializers.describe_connections_on_interconnect_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DescribeConnectionsOnInterconnect" ~service ~context ~input
      ~output_deserializer:Json_deserializers.connections_of_yojson ~error_deserializer
end

module DescribeCustomerMetadata = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DescribeCustomerMetadata"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_customer_metadata_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DescribeCustomerMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_customer_metadata_response_of_yojson
      ~error_deserializer
end

module DescribeDirectConnectGatewayAssociationProposals = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_direct_connect_gateway_association_proposals_request) =
    let input =
      Json_serializers.describe_direct_connect_gateway_association_proposals_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OvertureService.DescribeDirectConnectGatewayAssociationProposals" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_direct_connect_gateway_association_proposals_result_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : describe_direct_connect_gateway_association_proposals_request) =
    let input =
      Json_serializers.describe_direct_connect_gateway_association_proposals_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DescribeDirectConnectGatewayAssociationProposals" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_direct_connect_gateway_association_proposals_result_of_yojson
      ~error_deserializer
end

module DescribeDirectConnectGatewayAssociations = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_direct_connect_gateway_associations_request) =
    let input =
      Json_serializers.describe_direct_connect_gateway_associations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OvertureService.DescribeDirectConnectGatewayAssociations" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_direct_connect_gateway_associations_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_direct_connect_gateway_associations_request)
      =
    let input =
      Json_serializers.describe_direct_connect_gateway_associations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DescribeDirectConnectGatewayAssociations" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_direct_connect_gateway_associations_result_of_yojson
      ~error_deserializer
end

module DescribeDirectConnectGatewayAttachments = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_direct_connect_gateway_attachments_request) =
    let input =
      Json_serializers.describe_direct_connect_gateway_attachments_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OvertureService.DescribeDirectConnectGatewayAttachments" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_direct_connect_gateway_attachments_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_direct_connect_gateway_attachments_request)
      =
    let input =
      Json_serializers.describe_direct_connect_gateway_attachments_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DescribeDirectConnectGatewayAttachments" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_direct_connect_gateway_attachments_result_of_yojson
      ~error_deserializer
end

module DescribeDirectConnectGateways = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_direct_connect_gateways_request) =
    let input = Json_serializers.describe_direct_connect_gateways_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DescribeDirectConnectGateways"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_direct_connect_gateways_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_direct_connect_gateways_request) =
    let input = Json_serializers.describe_direct_connect_gateways_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DescribeDirectConnectGateways" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_direct_connect_gateways_result_of_yojson
      ~error_deserializer
end

module DescribeHostedConnections = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_hosted_connections_request) =
    let input = Json_serializers.describe_hosted_connections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DescribeHostedConnections"
      ~service ~context ~input ~output_deserializer:Json_deserializers.connections_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_hosted_connections_request) =
    let input = Json_serializers.describe_hosted_connections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DescribeHostedConnections" ~service ~context ~input
      ~output_deserializer:Json_deserializers.connections_of_yojson ~error_deserializer
end

module DescribeInterconnectLoa = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_interconnect_loa_request) =
    let input = Json_serializers.describe_interconnect_loa_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DescribeInterconnectLoa"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_interconnect_loa_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_interconnect_loa_request) =
    let input = Json_serializers.describe_interconnect_loa_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DescribeInterconnectLoa" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_interconnect_loa_response_of_yojson
      ~error_deserializer
end

module DescribeInterconnects = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_interconnects_request) =
    let input = Json_serializers.describe_interconnects_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DescribeInterconnects" ~service
      ~context ~input ~output_deserializer:Json_deserializers.interconnects_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_interconnects_request) =
    let input = Json_serializers.describe_interconnects_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DescribeInterconnects" ~service ~context ~input
      ~output_deserializer:Json_deserializers.interconnects_of_yojson ~error_deserializer
end

module DescribeLags = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_lags_request) =
    let input = Json_serializers.describe_lags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DescribeLags" ~service ~context
      ~input ~output_deserializer:Json_deserializers.lags_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_lags_request) =
    let input = Json_serializers.describe_lags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"OvertureService.DescribeLags"
      ~service ~context ~input ~output_deserializer:Json_deserializers.lags_of_yojson
      ~error_deserializer
end

module DescribeLoa = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_loa_request) =
    let input = Json_serializers.describe_loa_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DescribeLoa" ~service ~context
      ~input ~output_deserializer:Json_deserializers.loa_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_loa_request) =
    let input = Json_serializers.describe_loa_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"OvertureService.DescribeLoa"
      ~service ~context ~input ~output_deserializer:Json_deserializers.loa_of_yojson
      ~error_deserializer
end

module DescribeLocations = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DescribeLocations" ~service
      ~context ~input ~output_deserializer:Json_deserializers.locations_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DescribeLocations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.locations_of_yojson ~error_deserializer
end

module DescribeRouterConfiguration = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_router_configuration_request) =
    let input = Json_serializers.describe_router_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DescribeRouterConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_router_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_router_configuration_request) =
    let input = Json_serializers.describe_router_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DescribeRouterConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_router_configuration_response_of_yojson
      ~error_deserializer
end

module DescribeTags = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_tags_request) =
    let input = Json_serializers.describe_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DescribeTags" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_tags_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_tags_request) =
    let input = Json_serializers.describe_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"OvertureService.DescribeTags"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_tags_response_of_yojson ~error_deserializer
end

module DescribeVirtualGateways = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DescribeVirtualGateways"
      ~service ~context ~input ~output_deserializer:Json_deserializers.virtual_gateways_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DescribeVirtualGateways" ~service ~context ~input
      ~output_deserializer:Json_deserializers.virtual_gateways_of_yojson ~error_deserializer
end

module DescribeVirtualInterfaces = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_virtual_interfaces_request) =
    let input = Json_serializers.describe_virtual_interfaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DescribeVirtualInterfaces"
      ~service ~context ~input ~output_deserializer:Json_deserializers.virtual_interfaces_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_virtual_interfaces_request) =
    let input = Json_serializers.describe_virtual_interfaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DescribeVirtualInterfaces" ~service ~context ~input
      ~output_deserializer:Json_deserializers.virtual_interfaces_of_yojson ~error_deserializer
end

module DisassociateConnectionFromLag = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_connection_from_lag_request) =
    let input = Json_serializers.disassociate_connection_from_lag_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DisassociateConnectionFromLag"
      ~service ~context ~input ~output_deserializer:Json_deserializers.connection_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_connection_from_lag_request) =
    let input = Json_serializers.disassociate_connection_from_lag_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DisassociateConnectionFromLag" ~service ~context ~input
      ~output_deserializer:Json_deserializers.connection_of_yojson ~error_deserializer
end

module DisassociateMacSecKey = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_mac_sec_key_request) =
    let input = Json_serializers.disassociate_mac_sec_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.DisassociateMacSecKey" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_mac_sec_key_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_mac_sec_key_request) =
    let input = Json_serializers.disassociate_mac_sec_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.DisassociateMacSecKey" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_mac_sec_key_response_of_yojson
      ~error_deserializer
end

module ListVirtualInterfaceTestHistory = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_virtual_interface_test_history_request) =
    let input = Json_serializers.list_virtual_interface_test_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OvertureService.ListVirtualInterfaceTestHistory" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_virtual_interface_test_history_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_virtual_interface_test_history_request) =
    let input = Json_serializers.list_virtual_interface_test_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.ListVirtualInterfaceTestHistory" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_virtual_interface_test_history_response_of_yojson
      ~error_deserializer
end

module StartBgpFailoverTest = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_bgp_failover_test_request) =
    let input = Json_serializers.start_bgp_failover_test_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.StartBgpFailoverTest" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_bgp_failover_test_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_bgp_failover_test_request) =
    let input = Json_serializers.start_bgp_failover_test_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.StartBgpFailoverTest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_bgp_failover_test_response_of_yojson
      ~error_deserializer
end

module StopBgpFailoverTest = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_bgp_failover_test_request) =
    let input = Json_serializers.stop_bgp_failover_test_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.StopBgpFailoverTest" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.stop_bgp_failover_test_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_bgp_failover_test_request) =
    let input = Json_serializers.stop_bgp_failover_test_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.StopBgpFailoverTest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_bgp_failover_test_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | `DuplicateTagKeysException _ -> "com.amazonaws.directconnect#DuplicateTagKeysException"
    | `TooManyTagsException _ -> "com.amazonaws.directconnect#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _, "DuplicateTagKeysException" ->
          `DuplicateTagKeysException
            (Json_deserializers.duplicate_tag_keys_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"OvertureService.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"OvertureService.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateConnection = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_connection_request) =
    let input = Json_serializers.update_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.UpdateConnection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.connection_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_connection_request) =
    let input = Json_serializers.update_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"OvertureService.UpdateConnection"
      ~service ~context ~input ~output_deserializer:Json_deserializers.connection_of_yojson
      ~error_deserializer
end

module UpdateDirectConnectGateway = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_direct_connect_gateway_request) =
    let input = Json_serializers.update_direct_connect_gateway_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.UpdateDirectConnectGateway"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_direct_connect_gateway_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_direct_connect_gateway_request) =
    let input = Json_serializers.update_direct_connect_gateway_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.UpdateDirectConnectGateway" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_direct_connect_gateway_response_of_yojson
      ~error_deserializer
end

module UpdateDirectConnectGatewayAssociation = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_direct_connect_gateway_association_request) =
    let input =
      Json_serializers.update_direct_connect_gateway_association_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OvertureService.UpdateDirectConnectGatewayAssociation" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_direct_connect_gateway_association_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_direct_connect_gateway_association_request) =
    let input =
      Json_serializers.update_direct_connect_gateway_association_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.UpdateDirectConnectGatewayAssociation" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_direct_connect_gateway_association_result_of_yojson
      ~error_deserializer
end

module UpdateLag = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_lag_request) =
    let input = Json_serializers.update_lag_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OvertureService.UpdateLag" ~service ~context
      ~input ~output_deserializer:Json_deserializers.lag_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_lag_request) =
    let input = Json_serializers.update_lag_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"OvertureService.UpdateLag"
      ~service ~context ~input ~output_deserializer:Json_deserializers.lag_of_yojson
      ~error_deserializer
end

module UpdateVirtualInterfaceAttributes = struct
  let error_to_string = function
    | `DirectConnectClientException _ -> "com.amazonaws.directconnect#DirectConnectClientException"
    | `DirectConnectServerException _ -> "com.amazonaws.directconnect#DirectConnectServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectConnectClientException" ->
          `DirectConnectClientException
            (Json_deserializers.direct_connect_client_exception_of_yojson tree path)
      | _, "DirectConnectServerException" ->
          `DirectConnectServerException
            (Json_deserializers.direct_connect_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_virtual_interface_attributes_request) =
    let input = Json_serializers.update_virtual_interface_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OvertureService.UpdateVirtualInterfaceAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.virtual_interface_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_virtual_interface_attributes_request) =
    let input = Json_serializers.update_virtual_interface_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"OvertureService.UpdateVirtualInterfaceAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.virtual_interface_of_yojson ~error_deserializer
end
